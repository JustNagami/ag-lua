return {
	Play114242001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114242001
		arg_1_1.duration_ = 11.832999999999

		local var_1_0 = {
			ja = 8.632999999999,
			ko = 11.765999999999,
			zh = 11.132999999999,
			en = 11.832999999999
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
				arg_1_0:Play114242002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "10018"

			if arg_1_1.actors_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_0), arg_1_1.canvasGo_.transform)

				var_4_1.transform:SetSiblingIndex(1)

				var_4_1.name = var_4_0
				var_4_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_0] = var_4_1
			end

			local var_4_2 = arg_1_1.actors_["10018"].transform
			local var_4_3 = 1.8

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				arg_1_1.var_.moveOldPos10018 = var_4_2.localPosition
				var_4_2.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10018", 2)

				local var_4_4 = var_4_2.childCount

				for iter_4_0 = 0, var_4_4 - 1 do
					local var_4_5 = var_4_2:GetChild(iter_4_0)

					if var_4_5.name == "split_2" or not string.find(var_4_5.name, "split") then
						var_4_5.gameObject:SetActive(true)
					else
						var_4_5.gameObject:SetActive(false)
					end
				end
			end

			local var_4_6 = 0.001

			if var_4_3 <= arg_1_1.time_ and arg_1_1.time_ < var_4_3 + var_4_6 then
				local var_4_7 = (arg_1_1.time_ - var_4_3) / var_4_6
				local var_4_8 = Vector3.New(-390, -350, -180)

				var_4_2.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10018, var_4_8, var_4_7)
			end

			if arg_1_1.time_ >= var_4_3 + var_4_6 and arg_1_1.time_ < var_4_3 + var_4_6 + arg_4_0 then
				var_4_2.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_4_9 = arg_1_1.actors_["10018"]
			local var_4_10 = 1.8

			if var_4_10 < arg_1_1.time_ and arg_1_1.time_ <= var_4_10 + arg_4_0 and arg_1_1.var_.actorSpriteComps10018 == nil then
				arg_1_1.var_.actorSpriteComps10018 = var_4_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_11 = 0.034

			if var_4_10 <= arg_1_1.time_ and arg_1_1.time_ < var_4_10 + var_4_11 then
				local var_4_12 = (arg_1_1.time_ - var_4_10) / var_4_11

				if arg_1_1.var_.actorSpriteComps10018 then
					for iter_4_1, iter_4_2 in pairs(arg_1_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_4_2 then
							local var_4_13 = Mathf.Lerp(iter_4_2.color.r, 1, var_4_12)

							iter_4_2.color = Color.New(var_4_13, var_4_13, var_4_13)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_10 + var_4_11 and arg_1_1.time_ < var_4_10 + var_4_11 + arg_4_0 and arg_1_1.var_.actorSpriteComps10018 then
				local var_4_14 = 1

				for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_4_4 then
						iter_4_4.color = Color.New(var_4_14, var_4_14, var_4_14)
					end
				end

				arg_1_1.var_.actorSpriteComps10018 = nil
			end

			local var_4_15 = "ST25"

			if arg_1_1.bgs_[var_4_15] == nil then
				local var_4_16 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_16:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_15)
				var_4_16.name = var_4_15
				var_4_16.transform.parent = arg_1_1.stage_.transform
				var_4_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_15] = var_4_16
			end

			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = manager.ui.mainCamera.transform.localPosition
				local var_4_19 = Vector3.New(0, 0, 10) + Vector3.New(var_4_18.x, var_4_18.y, 0)
				local var_4_20 = arg_1_1.bgs_.ST25

				var_4_20.transform.localPosition = var_4_19
				var_4_20.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_21 = var_4_20:GetComponent("SpriteRenderer")

				if var_4_21 and var_4_21.sprite then
					local var_4_22 = (var_4_20.transform.localPosition - var_4_18).z
					local var_4_23 = manager.ui.mainCameraCom_
					local var_4_24 = 2 * var_4_22 * Mathf.Tan(var_4_23.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_25 = var_4_24 * var_4_23.aspect
					local var_4_26 = var_4_21.sprite.bounds.size.x
					local var_4_27 = var_4_21.sprite.bounds.size.y
					local var_4_28 = var_4_25 / var_4_26
					local var_4_29 = var_4_24 / var_4_27
					local var_4_30 = var_4_29 < var_4_28 and var_4_28 or var_4_29

					var_4_20.transform.localScale = Vector3.New(var_4_30, var_4_30, 0)
				end

				for iter_4_5, iter_4_6 in pairs(arg_1_1.bgs_) do
					if iter_4_5 ~= "ST25" then
						iter_4_6.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_31 = 0

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_32 = 2

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_32 then
				local var_4_33 = (arg_1_1.time_ - var_4_31) / var_4_32
				local var_4_34 = Color.New(0, 0, 0)

				var_4_34.a = Mathf.Lerp(1, 0, var_4_33)
				arg_1_1.mask_.color = var_4_34
			end

			if arg_1_1.time_ >= var_4_31 + var_4_32 and arg_1_1.time_ < var_4_31 + var_4_32 + arg_4_0 then
				local var_4_35 = Color.New(0, 0, 0)
				local var_4_36 = 0

				arg_1_1.mask_.enabled = false
				var_4_35.a = var_4_36
				arg_1_1.mask_.color = var_4_35
			end

			local var_4_37 = arg_1_1.actors_["10018"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				local var_4_39 = var_4_37:GetComponentInChildren(typeof(CanvasGroup))

				if var_4_39 then
					arg_1_1.var_.alphaOldValue10018 = var_4_39.alpha
					arg_1_1.var_.characterEffect10018 = var_4_39
				end

				arg_1_1.var_.alphaOldValue10018 = 0
			end

			local var_4_40 = 0.5

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_38) / var_4_40
				local var_4_42 = Mathf.Lerp(arg_1_1.var_.alphaOldValue10018, 1, var_4_41)

				if arg_1_1.var_.characterEffect10018 then
					arg_1_1.var_.characterEffect10018.alpha = var_4_42
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_40 and arg_1_1.time_ < var_4_38 + var_4_40 + arg_4_0 and arg_1_1.var_.characterEffect10018 then
				arg_1_1.var_.characterEffect10018.alpha = 1
			end

			local var_4_43 = 0
			local var_4_44 = 1

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_47 = 2
			local var_4_48 = 1.5

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_51 = 1.999999999999
			local var_4_52 = 1.1

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_53 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_53:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_54 = arg_1_1:FormatText(StoryNameCfg[257].name)

				arg_1_1.leftNameTxt_.text = var_4_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_55 = arg_1_1:GetWordFromCfg(114242001)
				local var_4_56 = arg_1_1:FormatText(var_4_55.content)

				arg_1_1.text_.text = var_4_56

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_57 = 44
				local var_4_58 = utf8.len(var_4_56)
				local var_4_59 = var_4_57 <= 0 and var_4_52 or var_4_52 * (var_4_58 / var_4_57)

				if var_4_59 > 0 and var_4_52 < var_4_59 then
					arg_1_1.talkMaxDuration = var_4_59
					var_4_51 = var_4_51 + 0.3

					if var_4_59 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_51
					end
				end

				arg_1_1.text_.text = var_4_56
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242001", "story_v_out_114242.awb") ~= 0 then
					local var_4_60 = manager.audio:GetVoiceLength("story_v_out_114242", "114242001", "story_v_out_114242.awb") / 1000

					if var_4_60 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_51
					end

					if var_4_55.prefab_name ~= "" and arg_1_1.actors_[var_4_55.prefab_name] ~= nil then
						local var_4_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_55.prefab_name].transform, "story_v_out_114242", "114242001", "story_v_out_114242.awb")

						arg_1_1:RecordAudio("114242001", var_4_61)
						arg_1_1:RecordAudio("114242001", var_4_61)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_114242", "114242001", "story_v_out_114242.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_114242", "114242001", "story_v_out_114242.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_62 = var_4_51 + 0.3
			local var_4_63 = math.max(var_4_52, arg_1_1.talkMaxDuration)

			if var_4_62 <= arg_1_1.time_ and arg_1_1.time_ < var_4_62 + var_4_63 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_62) / var_4_63

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_62 + var_4_63 and arg_1_1.time_ < var_4_62 + var_4_63 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play114242002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114242002
		arg_7_1.duration_ = 6.433

		local var_7_0 = {
			ja = 4.666,
			ko = 5.1,
			zh = 6.433,
			en = 4.333
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
				arg_7_0:Play114242003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10015"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["10015"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos10015 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10015", 4)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "split_5" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(390, -350, -180)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10015, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(390, -350, -180)
			end

			local var_10_9 = arg_7_1.actors_["10018"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 and arg_7_1.var_.actorSpriteComps10018 == nil then
				arg_7_1.var_.actorSpriteComps10018 = var_10_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_11 = 0.034

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11

				if arg_7_1.var_.actorSpriteComps10018 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_10_2 then
							local var_10_13 = Mathf.Lerp(iter_10_2.color.r, 0.5, var_10_12)

							iter_10_2.color = Color.New(var_10_13, var_10_13, var_10_13)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 and arg_7_1.var_.actorSpriteComps10018 then
				local var_10_14 = 0.5

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_14, var_10_14, var_10_14)
					end
				end

				arg_7_1.var_.actorSpriteComps10018 = nil
			end

			local var_10_15 = arg_7_1.actors_["10015"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 and arg_7_1.var_.actorSpriteComps10015 == nil then
				arg_7_1.var_.actorSpriteComps10015 = var_10_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_17 = 0.034

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17

				if arg_7_1.var_.actorSpriteComps10015 then
					for iter_10_5, iter_10_6 in pairs(arg_7_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_10_6 then
							local var_10_19 = Mathf.Lerp(iter_10_6.color.r, 1, var_10_18)

							iter_10_6.color = Color.New(var_10_19, var_10_19, var_10_19)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 and arg_7_1.var_.actorSpriteComps10015 then
				local var_10_20 = 1

				for iter_10_7, iter_10_8 in pairs(arg_7_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_10_8 then
						iter_10_8.color = Color.New(var_10_20, var_10_20, var_10_20)
					end
				end

				arg_7_1.var_.actorSpriteComps10015 = nil
			end

			local var_10_21 = arg_7_1.actors_["10015"]
			local var_10_22 = 0

			if var_10_22 < arg_7_1.time_ and arg_7_1.time_ <= var_10_22 + arg_10_0 then
				local var_10_23 = var_10_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_23 then
					arg_7_1.var_.alphaOldValue10015 = var_10_23.alpha
					arg_7_1.var_.characterEffect10015 = var_10_23
				end

				arg_7_1.var_.alphaOldValue10015 = 0
			end

			local var_10_24 = 0.5

			if var_10_22 <= arg_7_1.time_ and arg_7_1.time_ < var_10_22 + var_10_24 then
				local var_10_25 = (arg_7_1.time_ - var_10_22) / var_10_24
				local var_10_26 = Mathf.Lerp(arg_7_1.var_.alphaOldValue10015, 1, var_10_25)

				if arg_7_1.var_.characterEffect10015 then
					arg_7_1.var_.characterEffect10015.alpha = var_10_26
				end
			end

			if arg_7_1.time_ >= var_10_22 + var_10_24 and arg_7_1.time_ < var_10_22 + var_10_24 + arg_10_0 and arg_7_1.var_.characterEffect10015 then
				arg_7_1.var_.characterEffect10015.alpha = 1
			end

			local var_10_27 = 0
			local var_10_28 = 0.65

			if var_10_27 < arg_7_1.time_ and arg_7_1.time_ <= var_10_27 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_29 = arg_7_1:FormatText(StoryNameCfg[208].name)

				arg_7_1.leftNameTxt_.text = var_10_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_30 = arg_7_1:GetWordFromCfg(114242002)
				local var_10_31 = arg_7_1:FormatText(var_10_30.content)

				arg_7_1.text_.text = var_10_31

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_32 = 26
				local var_10_33 = utf8.len(var_10_31)
				local var_10_34 = var_10_32 <= 0 and var_10_28 or var_10_28 * (var_10_33 / var_10_32)

				if var_10_34 > 0 and var_10_28 < var_10_34 then
					arg_7_1.talkMaxDuration = var_10_34

					if var_10_34 + var_10_27 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_34 + var_10_27
					end
				end

				arg_7_1.text_.text = var_10_31
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242002", "story_v_out_114242.awb") ~= 0 then
					local var_10_35 = manager.audio:GetVoiceLength("story_v_out_114242", "114242002", "story_v_out_114242.awb") / 1000

					if var_10_35 + var_10_27 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_35 + var_10_27
					end

					if var_10_30.prefab_name ~= "" and arg_7_1.actors_[var_10_30.prefab_name] ~= nil then
						local var_10_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_30.prefab_name].transform, "story_v_out_114242", "114242002", "story_v_out_114242.awb")

						arg_7_1:RecordAudio("114242002", var_10_36)
						arg_7_1:RecordAudio("114242002", var_10_36)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114242", "114242002", "story_v_out_114242.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114242", "114242002", "story_v_out_114242.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_37 = math.max(var_10_28, arg_7_1.talkMaxDuration)

			if var_10_27 <= arg_7_1.time_ and arg_7_1.time_ < var_10_27 + var_10_37 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_27) / var_10_37

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_27 + var_10_37 and arg_7_1.time_ < var_10_27 + var_10_37 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play114242003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114242003
		arg_11_1.duration_ = 13.633

		local var_11_0 = {
			ja = 13.633,
			ko = 11.733,
			zh = 13.133,
			en = 9.633
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
				arg_11_0:Play114242004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10018"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.actorSpriteComps10018 == nil then
				arg_11_1.var_.actorSpriteComps10018 = var_14_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_2 = 0.034

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.actorSpriteComps10018 then
					for iter_14_0, iter_14_1 in pairs(arg_11_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_14_1 then
							local var_14_4 = Mathf.Lerp(iter_14_1.color.r, 1, var_14_3)

							iter_14_1.color = Color.New(var_14_4, var_14_4, var_14_4)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.actorSpriteComps10018 then
				local var_14_5 = 1

				for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_14_3 then
						iter_14_3.color = Color.New(var_14_5, var_14_5, var_14_5)
					end
				end

				arg_11_1.var_.actorSpriteComps10018 = nil
			end

			local var_14_6 = arg_11_1.actors_["10015"]
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 and arg_11_1.var_.actorSpriteComps10015 == nil then
				arg_11_1.var_.actorSpriteComps10015 = var_14_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_8 = 0.034

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_8 then
				local var_14_9 = (arg_11_1.time_ - var_14_7) / var_14_8

				if arg_11_1.var_.actorSpriteComps10015 then
					for iter_14_4, iter_14_5 in pairs(arg_11_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_14_5 then
							local var_14_10 = Mathf.Lerp(iter_14_5.color.r, 0.5, var_14_9)

							iter_14_5.color = Color.New(var_14_10, var_14_10, var_14_10)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_7 + var_14_8 and arg_11_1.time_ < var_14_7 + var_14_8 + arg_14_0 and arg_11_1.var_.actorSpriteComps10015 then
				local var_14_11 = 0.5

				for iter_14_6, iter_14_7 in pairs(arg_11_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_14_7 then
						iter_14_7.color = Color.New(var_14_11, var_14_11, var_14_11)
					end
				end

				arg_11_1.var_.actorSpriteComps10015 = nil
			end

			local var_14_12 = arg_11_1.actors_["10018"].transform
			local var_14_13 = 0

			if var_14_13 < arg_11_1.time_ and arg_11_1.time_ <= var_14_13 + arg_14_0 then
				arg_11_1.var_.moveOldPos10018 = var_14_12.localPosition
				var_14_12.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10018", 2)

				local var_14_14 = var_14_12.childCount

				for iter_14_8 = 0, var_14_14 - 1 do
					local var_14_15 = var_14_12:GetChild(iter_14_8)

					if var_14_15.name == "split_1" or not string.find(var_14_15.name, "split") then
						var_14_15.gameObject:SetActive(true)
					else
						var_14_15.gameObject:SetActive(false)
					end
				end
			end

			local var_14_16 = 0.001

			if var_14_13 <= arg_11_1.time_ and arg_11_1.time_ < var_14_13 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_13) / var_14_16
				local var_14_18 = Vector3.New(-390, -350, -180)

				var_14_12.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10018, var_14_18, var_14_17)
			end

			if arg_11_1.time_ >= var_14_13 + var_14_16 and arg_11_1.time_ < var_14_13 + var_14_16 + arg_14_0 then
				var_14_12.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_14_19 = 0
			local var_14_20 = 1.125

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[257].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(114242003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242003", "story_v_out_114242.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_114242", "114242003", "story_v_out_114242.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_114242", "114242003", "story_v_out_114242.awb")

						arg_11_1:RecordAudio("114242003", var_14_28)
						arg_11_1:RecordAudio("114242003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_114242", "114242003", "story_v_out_114242.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_114242", "114242003", "story_v_out_114242.awb")
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
	Play114242004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114242004
		arg_15_1.duration_ = 7.9

		local var_15_0 = {
			ja = 7.4,
			ko = 7.5,
			zh = 7.9,
			en = 6.033
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
				arg_15_0:Play114242005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.9

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[257].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(114242004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 36
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242004", "story_v_out_114242.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242004", "story_v_out_114242.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_114242", "114242004", "story_v_out_114242.awb")

						arg_15_1:RecordAudio("114242004", var_18_9)
						arg_15_1:RecordAudio("114242004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114242", "114242004", "story_v_out_114242.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114242", "114242004", "story_v_out_114242.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_10 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_10 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_10

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_10 and arg_15_1.time_ < var_18_0 + var_18_10 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play114242005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114242005
		arg_19_1.duration_ = 4.133

		local var_19_0 = {
			ja = 2.266,
			ko = 4.133,
			zh = 3.433,
			en = 2.7
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
				arg_19_0:Play114242006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10018"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps10018 == nil then
				arg_19_1.var_.actorSpriteComps10018 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps10018 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 0.5, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10018 then
				local var_22_5 = 0.5

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps10018 = nil
			end

			local var_22_6 = arg_19_1.actors_["10015"]
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 and arg_19_1.var_.actorSpriteComps10015 == nil then
				arg_19_1.var_.actorSpriteComps10015 = var_22_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_8 = 0.034

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8

				if arg_19_1.var_.actorSpriteComps10015 then
					for iter_22_4, iter_22_5 in pairs(arg_19_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_22_5 then
							local var_22_10 = Mathf.Lerp(iter_22_5.color.r, 1, var_22_9)

							iter_22_5.color = Color.New(var_22_10, var_22_10, var_22_10)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps10015 then
				local var_22_11 = 1

				for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_22_7 then
						iter_22_7.color = Color.New(var_22_11, var_22_11, var_22_11)
					end
				end

				arg_19_1.var_.actorSpriteComps10015 = nil
			end

			local var_22_12 = 0
			local var_22_13 = 0.4

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[208].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(114242005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 16
				local var_22_18 = utf8.len(var_22_16)
				local var_22_19 = var_22_17 <= 0 and var_22_13 or var_22_13 * (var_22_18 / var_22_17)

				if var_22_19 > 0 and var_22_13 < var_22_19 then
					arg_19_1.talkMaxDuration = var_22_19

					if var_22_19 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_12
					end
				end

				arg_19_1.text_.text = var_22_16
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242005", "story_v_out_114242.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_out_114242", "114242005", "story_v_out_114242.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_out_114242", "114242005", "story_v_out_114242.awb")

						arg_19_1:RecordAudio("114242005", var_22_21)
						arg_19_1:RecordAudio("114242005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_114242", "114242005", "story_v_out_114242.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_114242", "114242005", "story_v_out_114242.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_22 = math.max(var_22_13, arg_19_1.talkMaxDuration)

			if var_22_12 <= arg_19_1.time_ and arg_19_1.time_ < var_22_12 + var_22_22 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_12) / var_22_22

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_12 + var_22_22 and arg_19_1.time_ < var_22_12 + var_22_22 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114242006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114242006
		arg_23_1.duration_ = 12.1

		local var_23_0 = {
			ja = 10.966,
			ko = 11.666,
			zh = 11.033,
			en = 12.1
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
				arg_23_0:Play114242007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10018"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.actorSpriteComps10018 == nil then
				arg_23_1.var_.actorSpriteComps10018 = var_26_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_2 = 0.034

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.actorSpriteComps10018 then
					for iter_26_0, iter_26_1 in pairs(arg_23_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_26_1 then
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 1, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps10018 then
				local var_26_5 = 1

				for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_26_3 then
						iter_26_3.color = Color.New(var_26_5, var_26_5, var_26_5)
					end
				end

				arg_23_1.var_.actorSpriteComps10018 = nil
			end

			local var_26_6 = arg_23_1.actors_["10015"]
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 and arg_23_1.var_.actorSpriteComps10015 == nil then
				arg_23_1.var_.actorSpriteComps10015 = var_26_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_8 = 0.034

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_8 then
				local var_26_9 = (arg_23_1.time_ - var_26_7) / var_26_8

				if arg_23_1.var_.actorSpriteComps10015 then
					for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_26_5 then
							local var_26_10 = Mathf.Lerp(iter_26_5.color.r, 0.5, var_26_9)

							iter_26_5.color = Color.New(var_26_10, var_26_10, var_26_10)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps10015 then
				local var_26_11 = 0.5

				for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_26_7 then
						iter_26_7.color = Color.New(var_26_11, var_26_11, var_26_11)
					end
				end

				arg_23_1.var_.actorSpriteComps10015 = nil
			end

			local var_26_12 = 0
			local var_26_13 = 1.15

			if var_26_12 < arg_23_1.time_ and arg_23_1.time_ <= var_26_12 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_14 = arg_23_1:FormatText(StoryNameCfg[257].name)

				arg_23_1.leftNameTxt_.text = var_26_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_15 = arg_23_1:GetWordFromCfg(114242006)
				local var_26_16 = arg_23_1:FormatText(var_26_15.content)

				arg_23_1.text_.text = var_26_16

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_17 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242006", "story_v_out_114242.awb") ~= 0 then
					local var_26_20 = manager.audio:GetVoiceLength("story_v_out_114242", "114242006", "story_v_out_114242.awb") / 1000

					if var_26_20 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_12
					end

					if var_26_15.prefab_name ~= "" and arg_23_1.actors_[var_26_15.prefab_name] ~= nil then
						local var_26_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_15.prefab_name].transform, "story_v_out_114242", "114242006", "story_v_out_114242.awb")

						arg_23_1:RecordAudio("114242006", var_26_21)
						arg_23_1:RecordAudio("114242006", var_26_21)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_114242", "114242006", "story_v_out_114242.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_114242", "114242006", "story_v_out_114242.awb")
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
	Play114242007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114242007
		arg_27_1.duration_ = 5.2

		local var_27_0 = {
			ja = 5.2,
			ko = 4.6,
			zh = 4.166,
			en = 4.066
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
				arg_27_0:Play114242008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10018"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps10018 == nil then
				arg_27_1.var_.actorSpriteComps10018 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps10018 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps10018 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps10018 = nil
			end

			local var_30_6 = arg_27_1.actors_["10015"]
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 and arg_27_1.var_.actorSpriteComps10015 == nil then
				arg_27_1.var_.actorSpriteComps10015 = var_30_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_8 = 0.034

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8

				if arg_27_1.var_.actorSpriteComps10015 then
					for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_30_5 then
							local var_30_10 = Mathf.Lerp(iter_30_5.color.r, 1, var_30_9)

							iter_30_5.color = Color.New(var_30_10, var_30_10, var_30_10)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10015 then
				local var_30_11 = 1

				for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_30_7 then
						iter_30_7.color = Color.New(var_30_11, var_30_11, var_30_11)
					end
				end

				arg_27_1.var_.actorSpriteComps10015 = nil
			end

			local var_30_12 = 0
			local var_30_13 = 0.325

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_14 = arg_27_1:FormatText(StoryNameCfg[208].name)

				arg_27_1.leftNameTxt_.text = var_30_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(114242007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242007", "story_v_out_114242.awb") ~= 0 then
					local var_30_20 = manager.audio:GetVoiceLength("story_v_out_114242", "114242007", "story_v_out_114242.awb") / 1000

					if var_30_20 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_12
					end

					if var_30_15.prefab_name ~= "" and arg_27_1.actors_[var_30_15.prefab_name] ~= nil then
						local var_30_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_15.prefab_name].transform, "story_v_out_114242", "114242007", "story_v_out_114242.awb")

						arg_27_1:RecordAudio("114242007", var_30_21)
						arg_27_1:RecordAudio("114242007", var_30_21)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114242", "114242007", "story_v_out_114242.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114242", "114242007", "story_v_out_114242.awb")
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
	Play114242008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114242008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play114242009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10015"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.actorSpriteComps10015 == nil then
				arg_31_1.var_.actorSpriteComps10015 = var_34_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_2 = 0.034

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.actorSpriteComps10015 then
					for iter_34_0, iter_34_1 in pairs(arg_31_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_34_1 then
							local var_34_4 = Mathf.Lerp(iter_34_1.color.r, 0.5, var_34_3)

							iter_34_1.color = Color.New(var_34_4, var_34_4, var_34_4)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.actorSpriteComps10015 then
				local var_34_5 = 0.5

				for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_34_3 then
						iter_34_3.color = Color.New(var_34_5, var_34_5, var_34_5)
					end
				end

				arg_31_1.var_.actorSpriteComps10015 = nil
			end

			local var_34_6 = 0
			local var_34_7 = 0.575

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(114242008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 23
				local var_34_11 = utf8.len(var_34_9)
				local var_34_12 = var_34_10 <= 0 and var_34_7 or var_34_7 * (var_34_11 / var_34_10)

				if var_34_12 > 0 and var_34_7 < var_34_12 then
					arg_31_1.talkMaxDuration = var_34_12

					if var_34_12 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_9
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_13 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_13 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_13

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_13 and arg_31_1.time_ < var_34_6 + var_34_13 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114242009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114242009
		arg_35_1.duration_ = 4

		local var_35_0 = {
			ja = 3.233,
			ko = 4,
			zh = 3.466,
			en = 2.6
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
				arg_35_0:Play114242010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10015"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps10015 == nil then
				arg_35_1.var_.actorSpriteComps10015 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.034

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps10015 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 1, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps10015 then
				local var_38_5 = 1

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps10015 = nil
			end

			local var_38_6 = arg_35_1.actors_["10015"].transform
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.var_.moveOldPos10015 = var_38_6.localPosition
				var_38_6.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("10015", 4)

				local var_38_8 = var_38_6.childCount

				for iter_38_4 = 0, var_38_8 - 1 do
					local var_38_9 = var_38_6:GetChild(iter_38_4)

					if var_38_9.name == "split_1" or not string.find(var_38_9.name, "split") then
						var_38_9.gameObject:SetActive(true)
					else
						var_38_9.gameObject:SetActive(false)
					end
				end
			end

			local var_38_10 = 0.001

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_10 then
				local var_38_11 = (arg_35_1.time_ - var_38_7) / var_38_10
				local var_38_12 = Vector3.New(390, -350, -180)

				var_38_6.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10015, var_38_12, var_38_11)
			end

			if arg_35_1.time_ >= var_38_7 + var_38_10 and arg_35_1.time_ < var_38_7 + var_38_10 + arg_38_0 then
				var_38_6.localPosition = Vector3.New(390, -350, -180)
			end

			local var_38_13 = 0
			local var_38_14 = 0.325

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_15 = arg_35_1:FormatText(StoryNameCfg[208].name)

				arg_35_1.leftNameTxt_.text = var_38_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_16 = arg_35_1:GetWordFromCfg(114242009)
				local var_38_17 = arg_35_1:FormatText(var_38_16.content)

				arg_35_1.text_.text = var_38_17

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_18 = 13
				local var_38_19 = utf8.len(var_38_17)
				local var_38_20 = var_38_18 <= 0 and var_38_14 or var_38_14 * (var_38_19 / var_38_18)

				if var_38_20 > 0 and var_38_14 < var_38_20 then
					arg_35_1.talkMaxDuration = var_38_20

					if var_38_20 + var_38_13 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_20 + var_38_13
					end
				end

				arg_35_1.text_.text = var_38_17
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242009", "story_v_out_114242.awb") ~= 0 then
					local var_38_21 = manager.audio:GetVoiceLength("story_v_out_114242", "114242009", "story_v_out_114242.awb") / 1000

					if var_38_21 + var_38_13 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_21 + var_38_13
					end

					if var_38_16.prefab_name ~= "" and arg_35_1.actors_[var_38_16.prefab_name] ~= nil then
						local var_38_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_16.prefab_name].transform, "story_v_out_114242", "114242009", "story_v_out_114242.awb")

						arg_35_1:RecordAudio("114242009", var_38_22)
						arg_35_1:RecordAudio("114242009", var_38_22)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114242", "114242009", "story_v_out_114242.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114242", "114242009", "story_v_out_114242.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_23 = math.max(var_38_14, arg_35_1.talkMaxDuration)

			if var_38_13 <= arg_35_1.time_ and arg_35_1.time_ < var_38_13 + var_38_23 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_13) / var_38_23

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_13 + var_38_23 and arg_35_1.time_ < var_38_13 + var_38_23 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play114242010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114242010
		arg_39_1.duration_ = 2.833

		local var_39_0 = {
			ja = 2.5,
			ko = 2.833,
			zh = 2.333,
			en = 2.066
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
				arg_39_0:Play114242011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10018"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.actorSpriteComps10018 == nil then
				arg_39_1.var_.actorSpriteComps10018 = var_42_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_2 = 0.034

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.actorSpriteComps10018 then
					for iter_42_0, iter_42_1 in pairs(arg_39_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_42_1 then
							local var_42_4 = Mathf.Lerp(iter_42_1.color.r, 1, var_42_3)

							iter_42_1.color = Color.New(var_42_4, var_42_4, var_42_4)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.actorSpriteComps10018 then
				local var_42_5 = 1

				for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_42_3 then
						iter_42_3.color = Color.New(var_42_5, var_42_5, var_42_5)
					end
				end

				arg_39_1.var_.actorSpriteComps10018 = nil
			end

			local var_42_6 = arg_39_1.actors_["10015"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.actorSpriteComps10015 == nil then
				arg_39_1.var_.actorSpriteComps10015 = var_42_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_8 = 0.034

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.actorSpriteComps10015 then
					for iter_42_4, iter_42_5 in pairs(arg_39_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_42_5 then
							local var_42_10 = Mathf.Lerp(iter_42_5.color.r, 0.5, var_42_9)

							iter_42_5.color = Color.New(var_42_10, var_42_10, var_42_10)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps10015 then
				local var_42_11 = 0.5

				for iter_42_6, iter_42_7 in pairs(arg_39_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_42_7 then
						iter_42_7.color = Color.New(var_42_11, var_42_11, var_42_11)
					end
				end

				arg_39_1.var_.actorSpriteComps10015 = nil
			end

			local var_42_12 = 0
			local var_42_13 = 0.175

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[257].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(114242010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242010", "story_v_out_114242.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_114242", "114242010", "story_v_out_114242.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_114242", "114242010", "story_v_out_114242.awb")

						arg_39_1:RecordAudio("114242010", var_42_21)
						arg_39_1:RecordAudio("114242010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_114242", "114242010", "story_v_out_114242.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_114242", "114242010", "story_v_out_114242.awb")
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
	Play114242011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114242011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play114242012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10018"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps10018 == nil then
				arg_43_1.var_.actorSpriteComps10018 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.034

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps10018 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 0.5, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps10018 then
				local var_46_5 = 0.5

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps10018 = nil
			end

			local var_46_6 = 0
			local var_46_7 = 0.6

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_8 = arg_43_1:GetWordFromCfg(114242011)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 24
				local var_46_11 = utf8.len(var_46_9)
				local var_46_12 = var_46_10 <= 0 and var_46_7 or var_46_7 * (var_46_11 / var_46_10)

				if var_46_12 > 0 and var_46_7 < var_46_12 then
					arg_43_1.talkMaxDuration = var_46_12

					if var_46_12 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_9
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_13 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_13 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_13

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_13 and arg_43_1.time_ < var_46_6 + var_46_13 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play114242012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114242012
		arg_47_1.duration_ = 5.9

		local var_47_0 = {
			ja = 5.9,
			ko = 5.533,
			zh = 4.5,
			en = 4.966
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
				arg_47_0:Play114242013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10018"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.actorSpriteComps10018 == nil then
				arg_47_1.var_.actorSpriteComps10018 = var_50_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_2 = 0.034

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.actorSpriteComps10018 then
					for iter_50_0, iter_50_1 in pairs(arg_47_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_50_1 then
							local var_50_4 = Mathf.Lerp(iter_50_1.color.r, 1, var_50_3)

							iter_50_1.color = Color.New(var_50_4, var_50_4, var_50_4)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.actorSpriteComps10018 then
				local var_50_5 = 1

				for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_50_3 then
						iter_50_3.color = Color.New(var_50_5, var_50_5, var_50_5)
					end
				end

				arg_47_1.var_.actorSpriteComps10018 = nil
			end

			local var_50_6 = 0
			local var_50_7 = 0.65

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[257].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(114242012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242012", "story_v_out_114242.awb") ~= 0 then
					local var_50_14 = manager.audio:GetVoiceLength("story_v_out_114242", "114242012", "story_v_out_114242.awb") / 1000

					if var_50_14 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_14 + var_50_6
					end

					if var_50_9.prefab_name ~= "" and arg_47_1.actors_[var_50_9.prefab_name] ~= nil then
						local var_50_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_9.prefab_name].transform, "story_v_out_114242", "114242012", "story_v_out_114242.awb")

						arg_47_1:RecordAudio("114242012", var_50_15)
						arg_47_1:RecordAudio("114242012", var_50_15)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_114242", "114242012", "story_v_out_114242.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_114242", "114242012", "story_v_out_114242.awb")
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
	Play114242013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114242013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play114242014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10018"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.actorSpriteComps10018 == nil then
				arg_51_1.var_.actorSpriteComps10018 = var_54_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_2 = 0.034

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.actorSpriteComps10018 then
					for iter_54_0, iter_54_1 in pairs(arg_51_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_54_1 then
							local var_54_4 = Mathf.Lerp(iter_54_1.color.r, 0.5, var_54_3)

							iter_54_1.color = Color.New(var_54_4, var_54_4, var_54_4)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.actorSpriteComps10018 then
				local var_54_5 = 0.5

				for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_54_3 then
						iter_54_3.color = Color.New(var_54_5, var_54_5, var_54_5)
					end
				end

				arg_51_1.var_.actorSpriteComps10018 = nil
			end

			local var_54_6 = 0
			local var_54_7 = 1.325

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

				local var_54_8 = arg_51_1:GetWordFromCfg(114242013)
				local var_54_9 = arg_51_1:FormatText(var_54_8.content)

				arg_51_1.text_.text = var_54_9

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_10 = 53
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
	Play114242014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114242014
		arg_55_1.duration_ = 4.9

		local var_55_0 = {
			ja = 3.966,
			ko = 4.9,
			zh = 4,
			en = 2.866
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
				arg_55_0:Play114242015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10015"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps10015 == nil then
				arg_55_1.var_.actorSpriteComps10015 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.034

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps10015 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 1, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps10015 then
				local var_58_5 = 1

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps10015 = nil
			end

			local var_58_6 = 0
			local var_58_7 = 0.325

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[208].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(114242014)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 13
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242014", "story_v_out_114242.awb") ~= 0 then
					local var_58_14 = manager.audio:GetVoiceLength("story_v_out_114242", "114242014", "story_v_out_114242.awb") / 1000

					if var_58_14 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_6
					end

					if var_58_9.prefab_name ~= "" and arg_55_1.actors_[var_58_9.prefab_name] ~= nil then
						local var_58_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_9.prefab_name].transform, "story_v_out_114242", "114242014", "story_v_out_114242.awb")

						arg_55_1:RecordAudio("114242014", var_58_15)
						arg_55_1:RecordAudio("114242014", var_58_15)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_114242", "114242014", "story_v_out_114242.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_114242", "114242014", "story_v_out_114242.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_16 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_16 and arg_55_1.time_ < var_58_6 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play114242015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114242015
		arg_59_1.duration_ = 12.066

		local var_59_0 = {
			ja = 9.533,
			ko = 12.066,
			zh = 11.866,
			en = 11.366
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
				arg_59_0:Play114242016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "F01a"

			if arg_59_1.bgs_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(arg_59_1.paintGo_)

				var_62_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_62_0)
				var_62_1.name = var_62_0
				var_62_1.transform.parent = arg_59_1.stage_.transform
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.bgs_[var_62_0] = var_62_1
			end

			local var_62_2 = 0

			if var_62_2 < arg_59_1.time_ and arg_59_1.time_ <= var_62_2 + arg_62_0 then
				local var_62_3 = manager.ui.mainCamera.transform.localPosition
				local var_62_4 = Vector3.New(0, 0, 10) + Vector3.New(var_62_3.x, var_62_3.y, 0)
				local var_62_5 = arg_59_1.bgs_.F01a

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
					if iter_62_0 ~= "F01a" then
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
				local var_62_19 = Color.New(1, 1, 1)

				var_62_19.a = Mathf.Lerp(1, 0, var_62_18)
				arg_59_1.mask_.color = var_62_19
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 then
				local var_62_20 = Color.New(1, 1, 1)
				local var_62_21 = 0

				arg_59_1.mask_.enabled = false
				var_62_20.a = var_62_21
				arg_59_1.mask_.color = var_62_20
			end

			local var_62_22 = arg_59_1.actors_["10018"].transform
			local var_62_23 = 0

			if var_62_23 < arg_59_1.time_ and arg_59_1.time_ <= var_62_23 + arg_62_0 then
				arg_59_1.var_.moveOldPos10018 = var_62_22.localPosition
				var_62_22.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10018", 7)

				local var_62_24 = var_62_22.childCount

				for iter_62_2 = 0, var_62_24 - 1 do
					local var_62_25 = var_62_22:GetChild(iter_62_2)

					if var_62_25.name == "split_1" or not string.find(var_62_25.name, "split") then
						var_62_25.gameObject:SetActive(true)
					else
						var_62_25.gameObject:SetActive(false)
					end
				end
			end

			local var_62_26 = 0.001

			if var_62_23 <= arg_59_1.time_ and arg_59_1.time_ < var_62_23 + var_62_26 then
				local var_62_27 = (arg_59_1.time_ - var_62_23) / var_62_26
				local var_62_28 = Vector3.New(0, 0, 0)

				var_62_22.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10018, var_62_28, var_62_27)
			end

			if arg_59_1.time_ >= var_62_23 + var_62_26 and arg_59_1.time_ < var_62_23 + var_62_26 + arg_62_0 then
				var_62_22.localPosition = Vector3.New(0, 0, 0)
			end

			local var_62_29 = arg_59_1.actors_["10015"].transform
			local var_62_30 = 0

			if var_62_30 < arg_59_1.time_ and arg_59_1.time_ <= var_62_30 + arg_62_0 then
				arg_59_1.var_.moveOldPos10015 = var_62_29.localPosition
				var_62_29.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10015", 7)

				local var_62_31 = var_62_29.childCount

				for iter_62_3 = 0, var_62_31 - 1 do
					local var_62_32 = var_62_29:GetChild(iter_62_3)

					if var_62_32.name == "split_1" or not string.find(var_62_32.name, "split") then
						var_62_32.gameObject:SetActive(true)
					else
						var_62_32.gameObject:SetActive(false)
					end
				end
			end

			local var_62_33 = 0.001

			if var_62_30 <= arg_59_1.time_ and arg_59_1.time_ < var_62_30 + var_62_33 then
				local var_62_34 = (arg_59_1.time_ - var_62_30) / var_62_33
				local var_62_35 = Vector3.New(0, -2000, 450)

				var_62_29.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10015, var_62_35, var_62_34)
			end

			if arg_59_1.time_ >= var_62_30 + var_62_33 and arg_59_1.time_ < var_62_30 + var_62_33 + arg_62_0 then
				var_62_29.localPosition = Vector3.New(0, -2000, 450)
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_36 = 2
			local var_62_37 = 1.175

			if var_62_36 < arg_59_1.time_ and arg_59_1.time_ <= var_62_36 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_38 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_38:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_39 = arg_59_1:FormatText(StoryNameCfg[258].name)

				arg_59_1.leftNameTxt_.text = var_62_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10018")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_40 = arg_59_1:GetWordFromCfg(114242015)
				local var_62_41 = arg_59_1:FormatText(var_62_40.content)

				arg_59_1.text_.text = var_62_41

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_42 = 46
				local var_62_43 = utf8.len(var_62_41)
				local var_62_44 = var_62_42 <= 0 and var_62_37 or var_62_37 * (var_62_43 / var_62_42)

				if var_62_44 > 0 and var_62_37 < var_62_44 then
					arg_59_1.talkMaxDuration = var_62_44
					var_62_36 = var_62_36 + 0.3

					if var_62_44 + var_62_36 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_44 + var_62_36
					end
				end

				arg_59_1.text_.text = var_62_41
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242015", "story_v_out_114242.awb") ~= 0 then
					local var_62_45 = manager.audio:GetVoiceLength("story_v_out_114242", "114242015", "story_v_out_114242.awb") / 1000

					if var_62_45 + var_62_36 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_45 + var_62_36
					end

					if var_62_40.prefab_name ~= "" and arg_59_1.actors_[var_62_40.prefab_name] ~= nil then
						local var_62_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_40.prefab_name].transform, "story_v_out_114242", "114242015", "story_v_out_114242.awb")

						arg_59_1:RecordAudio("114242015", var_62_46)
						arg_59_1:RecordAudio("114242015", var_62_46)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_114242", "114242015", "story_v_out_114242.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_114242", "114242015", "story_v_out_114242.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_47 = var_62_36 + 0.3
			local var_62_48 = math.max(var_62_37, arg_59_1.talkMaxDuration)

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
	Play114242016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 114242016
		arg_65_1.duration_ = 1.566

		local var_65_0 = {
			ja = 1.4,
			ko = 0.999999999999,
			zh = 1.133,
			en = 1.566
		}
		local var_65_1 = manager.audio:GetLocalizationFlag()

		if var_65_0[var_65_1] ~= nil then
			arg_65_1.duration_ = var_65_0[var_65_1]
		end

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play114242017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.075

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[205].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_104201")

				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(114242016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 3
				local var_68_6 = utf8.len(var_68_4)
				local var_68_7 = var_68_5 <= 0 and var_68_1 or var_68_1 * (var_68_6 / var_68_5)

				if var_68_7 > 0 and var_68_1 < var_68_7 then
					arg_65_1.talkMaxDuration = var_68_7

					if var_68_7 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_7 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_4
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242016", "story_v_out_114242.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242016", "story_v_out_114242.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_114242", "114242016", "story_v_out_114242.awb")

						arg_65_1:RecordAudio("114242016", var_68_9)
						arg_65_1:RecordAudio("114242016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_114242", "114242016", "story_v_out_114242.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_114242", "114242016", "story_v_out_114242.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_10 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_10 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_10

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_10 and arg_65_1.time_ < var_68_0 + var_68_10 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play114242017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 114242017
		arg_69_1.duration_ = 1.833

		local var_69_0 = {
			ja = 1.833,
			ko = 1.5,
			zh = 1.6,
			en = 1.133
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
				arg_69_0:Play114242018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.1

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[258].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10018")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(114242017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242017", "story_v_out_114242.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242017", "story_v_out_114242.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_114242", "114242017", "story_v_out_114242.awb")

						arg_69_1:RecordAudio("114242017", var_72_9)
						arg_69_1:RecordAudio("114242017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_114242", "114242017", "story_v_out_114242.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_114242", "114242017", "story_v_out_114242.awb")
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
	Play114242018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 114242018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play114242019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1.025

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

				local var_76_2 = arg_73_1:GetWordFromCfg(114242018)
				local var_76_3 = arg_73_1:FormatText(var_76_2.content)

				arg_73_1.text_.text = var_76_3

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_4 = 41
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
	Play114242019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 114242019
		arg_77_1.duration_ = 6.5

		local var_77_0 = {
			ja = 6.5,
			ko = 4.633,
			zh = 5.4,
			en = 3.533
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play114242020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10018"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10018 = var_80_0.localPosition
				var_80_0.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10018", 2)

				local var_80_2 = var_80_0.childCount

				for iter_80_0 = 0, var_80_2 - 1 do
					local var_80_3 = var_80_0:GetChild(iter_80_0)

					if var_80_3.name == "split_1" or not string.find(var_80_3.name, "split") then
						var_80_3.gameObject:SetActive(true)
					else
						var_80_3.gameObject:SetActive(false)
					end
				end
			end

			local var_80_4 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_4 then
				local var_80_5 = (arg_77_1.time_ - var_80_1) / var_80_4
				local var_80_6 = Vector3.New(-390, -350, -180)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10018, var_80_6, var_80_5)
			end

			if arg_77_1.time_ >= var_80_1 + var_80_4 and arg_77_1.time_ < var_80_1 + var_80_4 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_80_7 = arg_77_1.actors_["10018"]
			local var_80_8 = 0

			if var_80_8 < arg_77_1.time_ and arg_77_1.time_ <= var_80_8 + arg_80_0 and arg_77_1.var_.actorSpriteComps10018 == nil then
				arg_77_1.var_.actorSpriteComps10018 = var_80_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_9 = 0.034

			if var_80_8 <= arg_77_1.time_ and arg_77_1.time_ < var_80_8 + var_80_9 then
				local var_80_10 = (arg_77_1.time_ - var_80_8) / var_80_9

				if arg_77_1.var_.actorSpriteComps10018 then
					for iter_80_1, iter_80_2 in pairs(arg_77_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_80_2 then
							local var_80_11 = Mathf.Lerp(iter_80_2.color.r, 1, var_80_10)

							iter_80_2.color = Color.New(var_80_11, var_80_11, var_80_11)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_8 + var_80_9 and arg_77_1.time_ < var_80_8 + var_80_9 + arg_80_0 and arg_77_1.var_.actorSpriteComps10018 then
				local var_80_12 = 1

				for iter_80_3, iter_80_4 in pairs(arg_77_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_80_4 then
						iter_80_4.color = Color.New(var_80_12, var_80_12, var_80_12)
					end
				end

				arg_77_1.var_.actorSpriteComps10018 = nil
			end

			local var_80_13 = arg_77_1.actors_["10018"]
			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				local var_80_15 = var_80_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_80_15 then
					arg_77_1.var_.alphaOldValue10018 = var_80_15.alpha
					arg_77_1.var_.characterEffect10018 = var_80_15
				end

				arg_77_1.var_.alphaOldValue10018 = 0
			end

			local var_80_16 = 0.5

			if var_80_14 <= arg_77_1.time_ and arg_77_1.time_ < var_80_14 + var_80_16 then
				local var_80_17 = (arg_77_1.time_ - var_80_14) / var_80_16
				local var_80_18 = Mathf.Lerp(arg_77_1.var_.alphaOldValue10018, 1, var_80_17)

				if arg_77_1.var_.characterEffect10018 then
					arg_77_1.var_.characterEffect10018.alpha = var_80_18
				end
			end

			if arg_77_1.time_ >= var_80_14 + var_80_16 and arg_77_1.time_ < var_80_14 + var_80_16 + arg_80_0 and arg_77_1.var_.characterEffect10018 then
				arg_77_1.var_.characterEffect10018.alpha = 1
			end

			local var_80_19 = 0
			local var_80_20 = 0.575

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_21 = arg_77_1:FormatText(StoryNameCfg[258].name)

				arg_77_1.leftNameTxt_.text = var_80_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_22 = arg_77_1:GetWordFromCfg(114242019)
				local var_80_23 = arg_77_1:FormatText(var_80_22.content)

				arg_77_1.text_.text = var_80_23

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_24 = 23
				local var_80_25 = utf8.len(var_80_23)
				local var_80_26 = var_80_24 <= 0 and var_80_20 or var_80_20 * (var_80_25 / var_80_24)

				if var_80_26 > 0 and var_80_20 < var_80_26 then
					arg_77_1.talkMaxDuration = var_80_26

					if var_80_26 + var_80_19 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_26 + var_80_19
					end
				end

				arg_77_1.text_.text = var_80_23
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242019", "story_v_out_114242.awb") ~= 0 then
					local var_80_27 = manager.audio:GetVoiceLength("story_v_out_114242", "114242019", "story_v_out_114242.awb") / 1000

					if var_80_27 + var_80_19 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_27 + var_80_19
					end

					if var_80_22.prefab_name ~= "" and arg_77_1.actors_[var_80_22.prefab_name] ~= nil then
						local var_80_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_22.prefab_name].transform, "story_v_out_114242", "114242019", "story_v_out_114242.awb")

						arg_77_1:RecordAudio("114242019", var_80_28)
						arg_77_1:RecordAudio("114242019", var_80_28)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_114242", "114242019", "story_v_out_114242.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_114242", "114242019", "story_v_out_114242.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_29 = math.max(var_80_20, arg_77_1.talkMaxDuration)

			if var_80_19 <= arg_77_1.time_ and arg_77_1.time_ < var_80_19 + var_80_29 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_19) / var_80_29

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_19 + var_80_29 and arg_77_1.time_ < var_80_19 + var_80_29 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play114242020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 114242020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play114242021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10018"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.actorSpriteComps10018 == nil then
				arg_81_1.var_.actorSpriteComps10018 = var_84_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_2 = 0.034

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.actorSpriteComps10018 then
					for iter_84_0, iter_84_1 in pairs(arg_81_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_84_1 then
							local var_84_4 = Mathf.Lerp(iter_84_1.color.r, 0.5, var_84_3)

							iter_84_1.color = Color.New(var_84_4, var_84_4, var_84_4)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.actorSpriteComps10018 then
				local var_84_5 = 0.5

				for iter_84_2, iter_84_3 in pairs(arg_81_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_84_3 then
						iter_84_3.color = Color.New(var_84_5, var_84_5, var_84_5)
					end
				end

				arg_81_1.var_.actorSpriteComps10018 = nil
			end

			local var_84_6 = 0
			local var_84_7 = 1.625

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_8 = arg_81_1:GetWordFromCfg(114242020)
				local var_84_9 = arg_81_1:FormatText(var_84_8.content)

				arg_81_1.text_.text = var_84_9

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_10 = 64
				local var_84_11 = utf8.len(var_84_9)
				local var_84_12 = var_84_10 <= 0 and var_84_7 or var_84_7 * (var_84_11 / var_84_10)

				if var_84_12 > 0 and var_84_7 < var_84_12 then
					arg_81_1.talkMaxDuration = var_84_12

					if var_84_12 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_12 + var_84_6
					end
				end

				arg_81_1.text_.text = var_84_9
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_13 = math.max(var_84_7, arg_81_1.talkMaxDuration)

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_13 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_6) / var_84_13

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_6 + var_84_13 and arg_81_1.time_ < var_84_6 + var_84_13 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play114242021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 114242021
		arg_85_1.duration_ = 16.766

		local var_85_0 = {
			ja = 7.866,
			ko = 10.266,
			zh = 16.766,
			en = 11.8
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play114242022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = "104201_1"

			if arg_85_1.actors_[var_88_0] == nil then
				local var_88_1 = Object.Instantiate(arg_85_1.imageGo_, arg_85_1.canvasGo_.transform)

				var_88_1.transform:SetSiblingIndex(1)

				var_88_1.name = var_88_0

				local var_88_2 = var_88_1:GetComponent(typeof(Image))

				var_88_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_88_0)

				var_88_2:SetNativeSize()

				var_88_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_85_1.actors_[var_88_0] = var_88_1
			end

			local var_88_3 = arg_85_1.actors_["104201_1"].transform
			local var_88_4 = 0

			if var_88_4 < arg_85_1.time_ and arg_85_1.time_ <= var_88_4 + arg_88_0 then
				arg_85_1.var_.moveOldPos104201_1 = var_88_3.localPosition
				var_88_3.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("104201_1", 4)
			end

			local var_88_5 = 0.001

			if var_88_4 <= arg_85_1.time_ and arg_85_1.time_ < var_88_4 + var_88_5 then
				local var_88_6 = (arg_85_1.time_ - var_88_4) / var_88_5
				local var_88_7 = Vector3.New(390, -350, -180)

				var_88_3.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos104201_1, var_88_7, var_88_6)
			end

			if arg_85_1.time_ >= var_88_4 + var_88_5 and arg_85_1.time_ < var_88_4 + var_88_5 + arg_88_0 then
				var_88_3.localPosition = Vector3.New(390, -350, -180)
			end

			local var_88_8 = arg_85_1.actors_["104201_1"]
			local var_88_9 = 0

			if var_88_9 < arg_85_1.time_ and arg_85_1.time_ <= var_88_9 + arg_88_0 then
				local var_88_10 = var_88_8:GetComponent("Image")

				if var_88_10 then
					arg_85_1.var_.highlightMatValue104201_1 = var_88_10
				end
			end

			local var_88_11 = 0.034

			if var_88_9 <= arg_85_1.time_ and arg_85_1.time_ < var_88_9 + var_88_11 then
				local var_88_12 = (arg_85_1.time_ - var_88_9) / var_88_11

				if arg_85_1.var_.highlightMatValue104201_1 then
					local var_88_13 = Mathf.Lerp(0.5, 1, var_88_12)
					local var_88_14 = arg_85_1.var_.highlightMatValue104201_1
					local var_88_15 = var_88_14.color

					var_88_15.r = var_88_13
					var_88_15.g = var_88_13
					var_88_15.b = var_88_13
					var_88_14.color = var_88_15
				end
			end

			if arg_85_1.time_ >= var_88_9 + var_88_11 and arg_85_1.time_ < var_88_9 + var_88_11 + arg_88_0 and arg_85_1.var_.highlightMatValue104201_1 then
				local var_88_16 = 1

				var_88_8.transform:SetSiblingIndex(1)

				local var_88_17 = arg_85_1.var_.highlightMatValue104201_1
				local var_88_18 = var_88_17.color

				var_88_18.r = var_88_16
				var_88_18.g = var_88_16
				var_88_18.b = var_88_16
				var_88_17.color = var_88_18
			end

			local var_88_19 = "104201"

			if arg_85_1.actors_[var_88_19] == nil then
				local var_88_20 = Object.Instantiate(arg_85_1.imageGo_, arg_85_1.canvasGo_.transform)

				var_88_20.transform:SetSiblingIndex(1)

				var_88_20.name = var_88_19

				local var_88_21 = var_88_20:GetComponent(typeof(Image))

				var_88_21.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_88_19)

				var_88_21:SetNativeSize()

				var_88_20.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_85_1.actors_[var_88_19] = var_88_20
			end

			local var_88_22 = arg_85_1.actors_["104201"]
			local var_88_23 = 0

			if var_88_23 < arg_85_1.time_ and arg_85_1.time_ <= var_88_23 + arg_88_0 then
				local var_88_24 = var_88_22:GetComponent("Image")

				if var_88_24 then
					arg_85_1.var_.alphaMatValue104201 = var_88_24
					arg_85_1.var_.alphaOldValue104201 = var_88_24.color.a
				end

				arg_85_1.var_.alphaOldValue104201 = 0
			end

			local var_88_25 = 0.5

			if var_88_23 <= arg_85_1.time_ and arg_85_1.time_ < var_88_23 + var_88_25 then
				local var_88_26 = (arg_85_1.time_ - var_88_23) / var_88_25
				local var_88_27 = Mathf.Lerp(arg_85_1.var_.alphaOldValue104201, 1, var_88_26)

				if arg_85_1.var_.alphaMatValue104201 then
					local var_88_28 = arg_85_1.var_.alphaMatValue104201.color

					var_88_28.a = var_88_27
					arg_85_1.var_.alphaMatValue104201.color = var_88_28
				end
			end

			if arg_85_1.time_ >= var_88_23 + var_88_25 and arg_85_1.time_ < var_88_23 + var_88_25 + arg_88_0 and arg_85_1.var_.alphaMatValue104201 then
				local var_88_29 = arg_85_1.var_.alphaMatValue104201
				local var_88_30 = var_88_29.color

				var_88_30.a = 1
				var_88_29.color = var_88_30
			end

			local var_88_31 = 0
			local var_88_32 = 1.775

			if var_88_31 < arg_85_1.time_ and arg_85_1.time_ <= var_88_31 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_33 = arg_85_1:FormatText(StoryNameCfg[205].name)

				arg_85_1.leftNameTxt_.text = var_88_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_34 = arg_85_1:GetWordFromCfg(114242021)
				local var_88_35 = arg_85_1:FormatText(var_88_34.content)

				arg_85_1.text_.text = var_88_35

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_36 = 70
				local var_88_37 = utf8.len(var_88_35)
				local var_88_38 = var_88_36 <= 0 and var_88_32 or var_88_32 * (var_88_37 / var_88_36)

				if var_88_38 > 0 and var_88_32 < var_88_38 then
					arg_85_1.talkMaxDuration = var_88_38

					if var_88_38 + var_88_31 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_38 + var_88_31
					end
				end

				arg_85_1.text_.text = var_88_35
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242021", "story_v_out_114242.awb") ~= 0 then
					local var_88_39 = manager.audio:GetVoiceLength("story_v_out_114242", "114242021", "story_v_out_114242.awb") / 1000

					if var_88_39 + var_88_31 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_39 + var_88_31
					end

					if var_88_34.prefab_name ~= "" and arg_85_1.actors_[var_88_34.prefab_name] ~= nil then
						local var_88_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_34.prefab_name].transform, "story_v_out_114242", "114242021", "story_v_out_114242.awb")

						arg_85_1:RecordAudio("114242021", var_88_40)
						arg_85_1:RecordAudio("114242021", var_88_40)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_114242", "114242021", "story_v_out_114242.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_114242", "114242021", "story_v_out_114242.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_41 = math.max(var_88_32, arg_85_1.talkMaxDuration)

			if var_88_31 <= arg_85_1.time_ and arg_85_1.time_ < var_88_31 + var_88_41 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_31) / var_88_41

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_31 + var_88_41 and arg_85_1.time_ < var_88_31 + var_88_41 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play114242022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 114242022
		arg_89_1.duration_ = 18.533

		local var_89_0 = {
			ja = 13.333,
			ko = 11.7,
			zh = 16.6,
			en = 18.533
		}
		local var_89_1 = manager.audio:GetLocalizationFlag()

		if var_89_0[var_89_1] ~= nil then
			arg_89_1.duration_ = var_89_0[var_89_1]
		end

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play114242023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10018"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.actorSpriteComps10018 == nil then
				arg_89_1.var_.actorSpriteComps10018 = var_92_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_2 = 0.034

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.actorSpriteComps10018 then
					for iter_92_0, iter_92_1 in pairs(arg_89_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_92_1 then
							local var_92_4 = Mathf.Lerp(iter_92_1.color.r, 1, var_92_3)

							iter_92_1.color = Color.New(var_92_4, var_92_4, var_92_4)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.actorSpriteComps10018 then
				local var_92_5 = 1

				for iter_92_2, iter_92_3 in pairs(arg_89_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_92_3 then
						iter_92_3.color = Color.New(var_92_5, var_92_5, var_92_5)
					end
				end

				arg_89_1.var_.actorSpriteComps10018 = nil
			end

			local var_92_6 = arg_89_1.actors_["104201_1"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 then
				local var_92_8 = var_92_6:GetComponent("Image")

				if var_92_8 then
					arg_89_1.var_.highlightMatValue104201_1 = var_92_8
				end
			end

			local var_92_9 = 0.034

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_9 then
				local var_92_10 = (arg_89_1.time_ - var_92_7) / var_92_9

				if arg_89_1.var_.highlightMatValue104201_1 then
					local var_92_11 = Mathf.Lerp(1, 0.5, var_92_10)
					local var_92_12 = arg_89_1.var_.highlightMatValue104201_1
					local var_92_13 = var_92_12.color

					var_92_13.r = var_92_11
					var_92_13.g = var_92_11
					var_92_13.b = var_92_11
					var_92_12.color = var_92_13
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_9 and arg_89_1.time_ < var_92_7 + var_92_9 + arg_92_0 and arg_89_1.var_.highlightMatValue104201_1 then
				local var_92_14 = 0.5
				local var_92_15 = arg_89_1.var_.highlightMatValue104201_1
				local var_92_16 = var_92_15.color

				var_92_16.r = var_92_14
				var_92_16.g = var_92_14
				var_92_16.b = var_92_14
				var_92_15.color = var_92_16
			end

			local var_92_17 = 0
			local var_92_18 = 2.05

			if var_92_17 < arg_89_1.time_ and arg_89_1.time_ <= var_92_17 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_19 = arg_89_1:FormatText(StoryNameCfg[258].name)

				arg_89_1.leftNameTxt_.text = var_92_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_20 = arg_89_1:GetWordFromCfg(114242022)
				local var_92_21 = arg_89_1:FormatText(var_92_20.content)

				arg_89_1.text_.text = var_92_21

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_22 = 79
				local var_92_23 = utf8.len(var_92_21)
				local var_92_24 = var_92_22 <= 0 and var_92_18 or var_92_18 * (var_92_23 / var_92_22)

				if var_92_24 > 0 and var_92_18 < var_92_24 then
					arg_89_1.talkMaxDuration = var_92_24

					if var_92_24 + var_92_17 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_24 + var_92_17
					end
				end

				arg_89_1.text_.text = var_92_21
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242022", "story_v_out_114242.awb") ~= 0 then
					local var_92_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242022", "story_v_out_114242.awb") / 1000

					if var_92_25 + var_92_17 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_25 + var_92_17
					end

					if var_92_20.prefab_name ~= "" and arg_89_1.actors_[var_92_20.prefab_name] ~= nil then
						local var_92_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_20.prefab_name].transform, "story_v_out_114242", "114242022", "story_v_out_114242.awb")

						arg_89_1:RecordAudio("114242022", var_92_26)
						arg_89_1:RecordAudio("114242022", var_92_26)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_114242", "114242022", "story_v_out_114242.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_114242", "114242022", "story_v_out_114242.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_27 = math.max(var_92_18, arg_89_1.talkMaxDuration)

			if var_92_17 <= arg_89_1.time_ and arg_89_1.time_ < var_92_17 + var_92_27 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_17) / var_92_27

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_17 + var_92_27 and arg_89_1.time_ < var_92_17 + var_92_27 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play114242023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 114242023
		arg_93_1.duration_ = 13.7

		local var_93_0 = {
			ja = 13.7,
			ko = 7.6,
			zh = 9.266,
			en = 10.633
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play114242024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["10018"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.actorSpriteComps10018 == nil then
				arg_93_1.var_.actorSpriteComps10018 = var_96_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_2 = 0.034

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.actorSpriteComps10018 then
					for iter_96_0, iter_96_1 in pairs(arg_93_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_96_1 then
							local var_96_4 = Mathf.Lerp(iter_96_1.color.r, 0.5, var_96_3)

							iter_96_1.color = Color.New(var_96_4, var_96_4, var_96_4)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.actorSpriteComps10018 then
				local var_96_5 = 0.5

				for iter_96_2, iter_96_3 in pairs(arg_93_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_96_3 then
						iter_96_3.color = Color.New(var_96_5, var_96_5, var_96_5)
					end
				end

				arg_93_1.var_.actorSpriteComps10018 = nil
			end

			local var_96_6 = arg_93_1.actors_["104201_1"]
			local var_96_7 = 0

			if var_96_7 < arg_93_1.time_ and arg_93_1.time_ <= var_96_7 + arg_96_0 then
				local var_96_8 = var_96_6:GetComponent("Image")

				if var_96_8 then
					arg_93_1.var_.highlightMatValue104201_1 = var_96_8
				end
			end

			local var_96_9 = 0.034

			if var_96_7 <= arg_93_1.time_ and arg_93_1.time_ < var_96_7 + var_96_9 then
				local var_96_10 = (arg_93_1.time_ - var_96_7) / var_96_9

				if arg_93_1.var_.highlightMatValue104201_1 then
					local var_96_11 = Mathf.Lerp(0.5, 1, var_96_10)
					local var_96_12 = arg_93_1.var_.highlightMatValue104201_1
					local var_96_13 = var_96_12.color

					var_96_13.r = var_96_11
					var_96_13.g = var_96_11
					var_96_13.b = var_96_11
					var_96_12.color = var_96_13
				end
			end

			if arg_93_1.time_ >= var_96_7 + var_96_9 and arg_93_1.time_ < var_96_7 + var_96_9 + arg_96_0 and arg_93_1.var_.highlightMatValue104201_1 then
				local var_96_14 = 1

				var_96_6.transform:SetSiblingIndex(1)

				local var_96_15 = arg_93_1.var_.highlightMatValue104201_1
				local var_96_16 = var_96_15.color

				var_96_16.r = var_96_14
				var_96_16.g = var_96_14
				var_96_16.b = var_96_14
				var_96_15.color = var_96_16
			end

			local var_96_17 = 0
			local var_96_18 = 0.825

			if var_96_17 < arg_93_1.time_ and arg_93_1.time_ <= var_96_17 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_19 = arg_93_1:FormatText(StoryNameCfg[205].name)

				arg_93_1.leftNameTxt_.text = var_96_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_20 = arg_93_1:GetWordFromCfg(114242023)
				local var_96_21 = arg_93_1:FormatText(var_96_20.content)

				arg_93_1.text_.text = var_96_21

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_22 = 33
				local var_96_23 = utf8.len(var_96_21)
				local var_96_24 = var_96_22 <= 0 and var_96_18 or var_96_18 * (var_96_23 / var_96_22)

				if var_96_24 > 0 and var_96_18 < var_96_24 then
					arg_93_1.talkMaxDuration = var_96_24

					if var_96_24 + var_96_17 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_24 + var_96_17
					end
				end

				arg_93_1.text_.text = var_96_21
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242023", "story_v_out_114242.awb") ~= 0 then
					local var_96_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242023", "story_v_out_114242.awb") / 1000

					if var_96_25 + var_96_17 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_25 + var_96_17
					end

					if var_96_20.prefab_name ~= "" and arg_93_1.actors_[var_96_20.prefab_name] ~= nil then
						local var_96_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_20.prefab_name].transform, "story_v_out_114242", "114242023", "story_v_out_114242.awb")

						arg_93_1:RecordAudio("114242023", var_96_26)
						arg_93_1:RecordAudio("114242023", var_96_26)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_114242", "114242023", "story_v_out_114242.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_114242", "114242023", "story_v_out_114242.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_27 = math.max(var_96_18, arg_93_1.talkMaxDuration)

			if var_96_17 <= arg_93_1.time_ and arg_93_1.time_ < var_96_17 + var_96_27 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_17) / var_96_27

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_17 + var_96_27 and arg_93_1.time_ < var_96_17 + var_96_27 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play114242024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 114242024
		arg_97_1.duration_ = 10.033

		local var_97_0 = {
			ja = 10.033,
			ko = 7.566,
			zh = 9.066,
			en = 8.333
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
				arg_97_0:Play114242025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10018"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.actorSpriteComps10018 == nil then
				arg_97_1.var_.actorSpriteComps10018 = var_100_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_2 = 0.034

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.actorSpriteComps10018 then
					for iter_100_0, iter_100_1 in pairs(arg_97_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_100_1 then
							local var_100_4 = Mathf.Lerp(iter_100_1.color.r, 1, var_100_3)

							iter_100_1.color = Color.New(var_100_4, var_100_4, var_100_4)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.actorSpriteComps10018 then
				local var_100_5 = 1

				for iter_100_2, iter_100_3 in pairs(arg_97_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_100_3 then
						iter_100_3.color = Color.New(var_100_5, var_100_5, var_100_5)
					end
				end

				arg_97_1.var_.actorSpriteComps10018 = nil
			end

			local var_100_6 = arg_97_1.actors_["104201_1"]
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 then
				local var_100_8 = var_100_6:GetComponent("Image")

				if var_100_8 then
					arg_97_1.var_.highlightMatValue104201_1 = var_100_8
				end
			end

			local var_100_9 = 0.034

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_9 then
				local var_100_10 = (arg_97_1.time_ - var_100_7) / var_100_9

				if arg_97_1.var_.highlightMatValue104201_1 then
					local var_100_11 = Mathf.Lerp(1, 0.5, var_100_10)
					local var_100_12 = arg_97_1.var_.highlightMatValue104201_1
					local var_100_13 = var_100_12.color

					var_100_13.r = var_100_11
					var_100_13.g = var_100_11
					var_100_13.b = var_100_11
					var_100_12.color = var_100_13
				end
			end

			if arg_97_1.time_ >= var_100_7 + var_100_9 and arg_97_1.time_ < var_100_7 + var_100_9 + arg_100_0 and arg_97_1.var_.highlightMatValue104201_1 then
				local var_100_14 = 0.5
				local var_100_15 = arg_97_1.var_.highlightMatValue104201_1
				local var_100_16 = var_100_15.color

				var_100_16.r = var_100_14
				var_100_16.g = var_100_14
				var_100_16.b = var_100_14
				var_100_15.color = var_100_16
			end

			local var_100_17 = 0
			local var_100_18 = 0.875

			if var_100_17 < arg_97_1.time_ and arg_97_1.time_ <= var_100_17 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_19 = arg_97_1:FormatText(StoryNameCfg[258].name)

				arg_97_1.leftNameTxt_.text = var_100_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_20 = arg_97_1:GetWordFromCfg(114242024)
				local var_100_21 = arg_97_1:FormatText(var_100_20.content)

				arg_97_1.text_.text = var_100_21

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_22 = 35
				local var_100_23 = utf8.len(var_100_21)
				local var_100_24 = var_100_22 <= 0 and var_100_18 or var_100_18 * (var_100_23 / var_100_22)

				if var_100_24 > 0 and var_100_18 < var_100_24 then
					arg_97_1.talkMaxDuration = var_100_24

					if var_100_24 + var_100_17 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_24 + var_100_17
					end
				end

				arg_97_1.text_.text = var_100_21
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242024", "story_v_out_114242.awb") ~= 0 then
					local var_100_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242024", "story_v_out_114242.awb") / 1000

					if var_100_25 + var_100_17 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_25 + var_100_17
					end

					if var_100_20.prefab_name ~= "" and arg_97_1.actors_[var_100_20.prefab_name] ~= nil then
						local var_100_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_20.prefab_name].transform, "story_v_out_114242", "114242024", "story_v_out_114242.awb")

						arg_97_1:RecordAudio("114242024", var_100_26)
						arg_97_1:RecordAudio("114242024", var_100_26)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_114242", "114242024", "story_v_out_114242.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_114242", "114242024", "story_v_out_114242.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_27 = math.max(var_100_18, arg_97_1.talkMaxDuration)

			if var_100_17 <= arg_97_1.time_ and arg_97_1.time_ < var_100_17 + var_100_27 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_17) / var_100_27

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_17 + var_100_27 and arg_97_1.time_ < var_100_17 + var_100_27 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play114242025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 114242025
		arg_101_1.duration_ = 10.666

		local var_101_0 = {
			ja = 10.666,
			ko = 6.8,
			zh = 9.7,
			en = 8.4
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
				arg_101_0:Play114242026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10018"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.actorSpriteComps10018 == nil then
				arg_101_1.var_.actorSpriteComps10018 = var_104_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_2 = 0.034

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.actorSpriteComps10018 then
					for iter_104_0, iter_104_1 in pairs(arg_101_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_104_1 then
							local var_104_4 = Mathf.Lerp(iter_104_1.color.r, 0.5, var_104_3)

							iter_104_1.color = Color.New(var_104_4, var_104_4, var_104_4)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.actorSpriteComps10018 then
				local var_104_5 = 0.5

				for iter_104_2, iter_104_3 in pairs(arg_101_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_104_3 then
						iter_104_3.color = Color.New(var_104_5, var_104_5, var_104_5)
					end
				end

				arg_101_1.var_.actorSpriteComps10018 = nil
			end

			local var_104_6 = arg_101_1.actors_["104201_1"]
			local var_104_7 = 0

			if var_104_7 < arg_101_1.time_ and arg_101_1.time_ <= var_104_7 + arg_104_0 then
				local var_104_8 = var_104_6:GetComponent("Image")

				if var_104_8 then
					arg_101_1.var_.highlightMatValue104201_1 = var_104_8
				end
			end

			local var_104_9 = 0.034

			if var_104_7 <= arg_101_1.time_ and arg_101_1.time_ < var_104_7 + var_104_9 then
				local var_104_10 = (arg_101_1.time_ - var_104_7) / var_104_9

				if arg_101_1.var_.highlightMatValue104201_1 then
					local var_104_11 = Mathf.Lerp(0.5, 1, var_104_10)
					local var_104_12 = arg_101_1.var_.highlightMatValue104201_1
					local var_104_13 = var_104_12.color

					var_104_13.r = var_104_11
					var_104_13.g = var_104_11
					var_104_13.b = var_104_11
					var_104_12.color = var_104_13
				end
			end

			if arg_101_1.time_ >= var_104_7 + var_104_9 and arg_101_1.time_ < var_104_7 + var_104_9 + arg_104_0 and arg_101_1.var_.highlightMatValue104201_1 then
				local var_104_14 = 1

				var_104_6.transform:SetSiblingIndex(1)

				local var_104_15 = arg_101_1.var_.highlightMatValue104201_1
				local var_104_16 = var_104_15.color

				var_104_16.r = var_104_14
				var_104_16.g = var_104_14
				var_104_16.b = var_104_14
				var_104_15.color = var_104_16
			end

			local var_104_17 = 0
			local var_104_18 = 0.875

			if var_104_17 < arg_101_1.time_ and arg_101_1.time_ <= var_104_17 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_19 = arg_101_1:FormatText(StoryNameCfg[205].name)

				arg_101_1.leftNameTxt_.text = var_104_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_20 = arg_101_1:GetWordFromCfg(114242025)
				local var_104_21 = arg_101_1:FormatText(var_104_20.content)

				arg_101_1.text_.text = var_104_21

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_22 = 35
				local var_104_23 = utf8.len(var_104_21)
				local var_104_24 = var_104_22 <= 0 and var_104_18 or var_104_18 * (var_104_23 / var_104_22)

				if var_104_24 > 0 and var_104_18 < var_104_24 then
					arg_101_1.talkMaxDuration = var_104_24

					if var_104_24 + var_104_17 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_24 + var_104_17
					end
				end

				arg_101_1.text_.text = var_104_21
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242025", "story_v_out_114242.awb") ~= 0 then
					local var_104_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242025", "story_v_out_114242.awb") / 1000

					if var_104_25 + var_104_17 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_25 + var_104_17
					end

					if var_104_20.prefab_name ~= "" and arg_101_1.actors_[var_104_20.prefab_name] ~= nil then
						local var_104_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_20.prefab_name].transform, "story_v_out_114242", "114242025", "story_v_out_114242.awb")

						arg_101_1:RecordAudio("114242025", var_104_26)
						arg_101_1:RecordAudio("114242025", var_104_26)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_114242", "114242025", "story_v_out_114242.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_114242", "114242025", "story_v_out_114242.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_27 = math.max(var_104_18, arg_101_1.talkMaxDuration)

			if var_104_17 <= arg_101_1.time_ and arg_101_1.time_ < var_104_17 + var_104_27 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_17) / var_104_27

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_17 + var_104_27 and arg_101_1.time_ < var_104_17 + var_104_27 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play114242026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 114242026
		arg_105_1.duration_ = 4.233

		local var_105_0 = {
			ja = 3.5,
			ko = 3.733,
			zh = 4.233,
			en = 4.133
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
				arg_105_0:Play114242027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10018"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.actorSpriteComps10018 == nil then
				arg_105_1.var_.actorSpriteComps10018 = var_108_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_2 = 0.034

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.actorSpriteComps10018 then
					for iter_108_0, iter_108_1 in pairs(arg_105_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_108_1 then
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 1, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps10018 then
				local var_108_5 = 1

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps10018 = nil
			end

			local var_108_6 = arg_105_1.actors_["104201_1"]
			local var_108_7 = 0

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 then
				local var_108_8 = var_108_6:GetComponent("Image")

				if var_108_8 then
					arg_105_1.var_.highlightMatValue104201_1 = var_108_8
				end
			end

			local var_108_9 = 0.034

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_9 then
				local var_108_10 = (arg_105_1.time_ - var_108_7) / var_108_9

				if arg_105_1.var_.highlightMatValue104201_1 then
					local var_108_11 = Mathf.Lerp(1, 0.5, var_108_10)
					local var_108_12 = arg_105_1.var_.highlightMatValue104201_1
					local var_108_13 = var_108_12.color

					var_108_13.r = var_108_11
					var_108_13.g = var_108_11
					var_108_13.b = var_108_11
					var_108_12.color = var_108_13
				end
			end

			if arg_105_1.time_ >= var_108_7 + var_108_9 and arg_105_1.time_ < var_108_7 + var_108_9 + arg_108_0 and arg_105_1.var_.highlightMatValue104201_1 then
				local var_108_14 = 0.5
				local var_108_15 = arg_105_1.var_.highlightMatValue104201_1
				local var_108_16 = var_108_15.color

				var_108_16.r = var_108_14
				var_108_16.g = var_108_14
				var_108_16.b = var_108_14
				var_108_15.color = var_108_16
			end

			local var_108_17 = 0
			local var_108_18 = 0.45

			if var_108_17 < arg_105_1.time_ and arg_105_1.time_ <= var_108_17 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_19 = arg_105_1:FormatText(StoryNameCfg[258].name)

				arg_105_1.leftNameTxt_.text = var_108_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_20 = arg_105_1:GetWordFromCfg(114242026)
				local var_108_21 = arg_105_1:FormatText(var_108_20.content)

				arg_105_1.text_.text = var_108_21

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_22 = 18
				local var_108_23 = utf8.len(var_108_21)
				local var_108_24 = var_108_22 <= 0 and var_108_18 or var_108_18 * (var_108_23 / var_108_22)

				if var_108_24 > 0 and var_108_18 < var_108_24 then
					arg_105_1.talkMaxDuration = var_108_24

					if var_108_24 + var_108_17 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_24 + var_108_17
					end
				end

				arg_105_1.text_.text = var_108_21
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242026", "story_v_out_114242.awb") ~= 0 then
					local var_108_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242026", "story_v_out_114242.awb") / 1000

					if var_108_25 + var_108_17 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_25 + var_108_17
					end

					if var_108_20.prefab_name ~= "" and arg_105_1.actors_[var_108_20.prefab_name] ~= nil then
						local var_108_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_20.prefab_name].transform, "story_v_out_114242", "114242026", "story_v_out_114242.awb")

						arg_105_1:RecordAudio("114242026", var_108_26)
						arg_105_1:RecordAudio("114242026", var_108_26)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_114242", "114242026", "story_v_out_114242.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_114242", "114242026", "story_v_out_114242.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_27 = math.max(var_108_18, arg_105_1.talkMaxDuration)

			if var_108_17 <= arg_105_1.time_ and arg_105_1.time_ < var_108_17 + var_108_27 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_17) / var_108_27

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_17 + var_108_27 and arg_105_1.time_ < var_108_17 + var_108_27 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play114242027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 114242027
		arg_109_1.duration_ = 15.9

		local var_109_0 = {
			ja = 15.9,
			ko = 11.9,
			zh = 11.2,
			en = 15.2
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
				arg_109_0:Play114242028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["10018"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.actorSpriteComps10018 == nil then
				arg_109_1.var_.actorSpriteComps10018 = var_112_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_2 = 0.034

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.actorSpriteComps10018 then
					for iter_112_0, iter_112_1 in pairs(arg_109_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_112_1 then
							local var_112_4 = Mathf.Lerp(iter_112_1.color.r, 0.5, var_112_3)

							iter_112_1.color = Color.New(var_112_4, var_112_4, var_112_4)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.actorSpriteComps10018 then
				local var_112_5 = 0.5

				for iter_112_2, iter_112_3 in pairs(arg_109_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_112_3 then
						iter_112_3.color = Color.New(var_112_5, var_112_5, var_112_5)
					end
				end

				arg_109_1.var_.actorSpriteComps10018 = nil
			end

			local var_112_6 = arg_109_1.actors_["104201_1"]
			local var_112_7 = 0

			if var_112_7 < arg_109_1.time_ and arg_109_1.time_ <= var_112_7 + arg_112_0 then
				local var_112_8 = var_112_6:GetComponent("Image")

				if var_112_8 then
					arg_109_1.var_.highlightMatValue104201_1 = var_112_8
				end
			end

			local var_112_9 = 0.034

			if var_112_7 <= arg_109_1.time_ and arg_109_1.time_ < var_112_7 + var_112_9 then
				local var_112_10 = (arg_109_1.time_ - var_112_7) / var_112_9

				if arg_109_1.var_.highlightMatValue104201_1 then
					local var_112_11 = Mathf.Lerp(0.5, 1, var_112_10)
					local var_112_12 = arg_109_1.var_.highlightMatValue104201_1
					local var_112_13 = var_112_12.color

					var_112_13.r = var_112_11
					var_112_13.g = var_112_11
					var_112_13.b = var_112_11
					var_112_12.color = var_112_13
				end
			end

			if arg_109_1.time_ >= var_112_7 + var_112_9 and arg_109_1.time_ < var_112_7 + var_112_9 + arg_112_0 and arg_109_1.var_.highlightMatValue104201_1 then
				local var_112_14 = 1

				var_112_6.transform:SetSiblingIndex(1)

				local var_112_15 = arg_109_1.var_.highlightMatValue104201_1
				local var_112_16 = var_112_15.color

				var_112_16.r = var_112_14
				var_112_16.g = var_112_14
				var_112_16.b = var_112_14
				var_112_15.color = var_112_16
			end

			local var_112_17 = 0
			local var_112_18 = 1.25

			if var_112_17 < arg_109_1.time_ and arg_109_1.time_ <= var_112_17 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_19 = arg_109_1:FormatText(StoryNameCfg[205].name)

				arg_109_1.leftNameTxt_.text = var_112_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_20 = arg_109_1:GetWordFromCfg(114242027)
				local var_112_21 = arg_109_1:FormatText(var_112_20.content)

				arg_109_1.text_.text = var_112_21

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_22 = 50
				local var_112_23 = utf8.len(var_112_21)
				local var_112_24 = var_112_22 <= 0 and var_112_18 or var_112_18 * (var_112_23 / var_112_22)

				if var_112_24 > 0 and var_112_18 < var_112_24 then
					arg_109_1.talkMaxDuration = var_112_24

					if var_112_24 + var_112_17 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_24 + var_112_17
					end
				end

				arg_109_1.text_.text = var_112_21
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242027", "story_v_out_114242.awb") ~= 0 then
					local var_112_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242027", "story_v_out_114242.awb") / 1000

					if var_112_25 + var_112_17 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_25 + var_112_17
					end

					if var_112_20.prefab_name ~= "" and arg_109_1.actors_[var_112_20.prefab_name] ~= nil then
						local var_112_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_20.prefab_name].transform, "story_v_out_114242", "114242027", "story_v_out_114242.awb")

						arg_109_1:RecordAudio("114242027", var_112_26)
						arg_109_1:RecordAudio("114242027", var_112_26)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_114242", "114242027", "story_v_out_114242.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_114242", "114242027", "story_v_out_114242.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_27 = math.max(var_112_18, arg_109_1.talkMaxDuration)

			if var_112_17 <= arg_109_1.time_ and arg_109_1.time_ < var_112_17 + var_112_27 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_17) / var_112_27

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_17 + var_112_27 and arg_109_1.time_ < var_112_17 + var_112_27 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play114242028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 114242028
		arg_113_1.duration_ = 5.866

		local var_113_0 = {
			ja = 3.766,
			ko = 5.866,
			zh = 5.5,
			en = 4.033
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
				arg_113_0:Play114242029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10018"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.actorSpriteComps10018 == nil then
				arg_113_1.var_.actorSpriteComps10018 = var_116_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_2 = 0.034

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.actorSpriteComps10018 then
					for iter_116_0, iter_116_1 in pairs(arg_113_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_116_1 then
							local var_116_4 = Mathf.Lerp(iter_116_1.color.r, 1, var_116_3)

							iter_116_1.color = Color.New(var_116_4, var_116_4, var_116_4)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.actorSpriteComps10018 then
				local var_116_5 = 1

				for iter_116_2, iter_116_3 in pairs(arg_113_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_116_3 then
						iter_116_3.color = Color.New(var_116_5, var_116_5, var_116_5)
					end
				end

				arg_113_1.var_.actorSpriteComps10018 = nil
			end

			local var_116_6 = arg_113_1.actors_["104201_1"]
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 then
				local var_116_8 = var_116_6:GetComponent("Image")

				if var_116_8 then
					arg_113_1.var_.highlightMatValue104201_1 = var_116_8
				end
			end

			local var_116_9 = 0.034

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_9 then
				local var_116_10 = (arg_113_1.time_ - var_116_7) / var_116_9

				if arg_113_1.var_.highlightMatValue104201_1 then
					local var_116_11 = Mathf.Lerp(1, 0.5, var_116_10)
					local var_116_12 = arg_113_1.var_.highlightMatValue104201_1
					local var_116_13 = var_116_12.color

					var_116_13.r = var_116_11
					var_116_13.g = var_116_11
					var_116_13.b = var_116_11
					var_116_12.color = var_116_13
				end
			end

			if arg_113_1.time_ >= var_116_7 + var_116_9 and arg_113_1.time_ < var_116_7 + var_116_9 + arg_116_0 and arg_113_1.var_.highlightMatValue104201_1 then
				local var_116_14 = 0.5
				local var_116_15 = arg_113_1.var_.highlightMatValue104201_1
				local var_116_16 = var_116_15.color

				var_116_16.r = var_116_14
				var_116_16.g = var_116_14
				var_116_16.b = var_116_14
				var_116_15.color = var_116_16
			end

			local var_116_17 = 0
			local var_116_18 = 0.525

			if var_116_17 < arg_113_1.time_ and arg_113_1.time_ <= var_116_17 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_19 = arg_113_1:FormatText(StoryNameCfg[258].name)

				arg_113_1.leftNameTxt_.text = var_116_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_20 = arg_113_1:GetWordFromCfg(114242028)
				local var_116_21 = arg_113_1:FormatText(var_116_20.content)

				arg_113_1.text_.text = var_116_21

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_22 = 21
				local var_116_23 = utf8.len(var_116_21)
				local var_116_24 = var_116_22 <= 0 and var_116_18 or var_116_18 * (var_116_23 / var_116_22)

				if var_116_24 > 0 and var_116_18 < var_116_24 then
					arg_113_1.talkMaxDuration = var_116_24

					if var_116_24 + var_116_17 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_24 + var_116_17
					end
				end

				arg_113_1.text_.text = var_116_21
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242028", "story_v_out_114242.awb") ~= 0 then
					local var_116_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242028", "story_v_out_114242.awb") / 1000

					if var_116_25 + var_116_17 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_25 + var_116_17
					end

					if var_116_20.prefab_name ~= "" and arg_113_1.actors_[var_116_20.prefab_name] ~= nil then
						local var_116_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_20.prefab_name].transform, "story_v_out_114242", "114242028", "story_v_out_114242.awb")

						arg_113_1:RecordAudio("114242028", var_116_26)
						arg_113_1:RecordAudio("114242028", var_116_26)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_114242", "114242028", "story_v_out_114242.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_114242", "114242028", "story_v_out_114242.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_27 = math.max(var_116_18, arg_113_1.talkMaxDuration)

			if var_116_17 <= arg_113_1.time_ and arg_113_1.time_ < var_116_17 + var_116_27 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_17) / var_116_27

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_17 + var_116_27 and arg_113_1.time_ < var_116_17 + var_116_27 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play114242029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 114242029
		arg_117_1.duration_ = 14.833

		local var_117_0 = {
			ja = 14.833,
			ko = 10.9,
			zh = 13.766,
			en = 13.9
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
				arg_117_0:Play114242030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10018"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.actorSpriteComps10018 == nil then
				arg_117_1.var_.actorSpriteComps10018 = var_120_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_2 = 0.034

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.actorSpriteComps10018 then
					for iter_120_0, iter_120_1 in pairs(arg_117_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_120_1 then
							local var_120_4 = Mathf.Lerp(iter_120_1.color.r, 1, var_120_3)

							iter_120_1.color = Color.New(var_120_4, var_120_4, var_120_4)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.actorSpriteComps10018 then
				local var_120_5 = 1

				for iter_120_2, iter_120_3 in pairs(arg_117_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_120_3 then
						iter_120_3.color = Color.New(var_120_5, var_120_5, var_120_5)
					end
				end

				arg_117_1.var_.actorSpriteComps10018 = nil
			end

			local var_120_6 = 0
			local var_120_7 = 1.325

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[258].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_9 = arg_117_1:GetWordFromCfg(114242029)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 53
				local var_120_12 = utf8.len(var_120_10)
				local var_120_13 = var_120_11 <= 0 and var_120_7 or var_120_7 * (var_120_12 / var_120_11)

				if var_120_13 > 0 and var_120_7 < var_120_13 then
					arg_117_1.talkMaxDuration = var_120_13

					if var_120_13 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_13 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_10
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242029", "story_v_out_114242.awb") ~= 0 then
					local var_120_14 = manager.audio:GetVoiceLength("story_v_out_114242", "114242029", "story_v_out_114242.awb") / 1000

					if var_120_14 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_14 + var_120_6
					end

					if var_120_9.prefab_name ~= "" and arg_117_1.actors_[var_120_9.prefab_name] ~= nil then
						local var_120_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_9.prefab_name].transform, "story_v_out_114242", "114242029", "story_v_out_114242.awb")

						arg_117_1:RecordAudio("114242029", var_120_15)
						arg_117_1:RecordAudio("114242029", var_120_15)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_114242", "114242029", "story_v_out_114242.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_114242", "114242029", "story_v_out_114242.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_16 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_16 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_16

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_16 and arg_117_1.time_ < var_120_6 + var_120_16 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play114242030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 114242030
		arg_121_1.duration_ = 3.7

		local var_121_0 = {
			ja = 3.7,
			ko = 2.866,
			zh = 3.1,
			en = 3.6
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
				arg_121_0:Play114242031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10018"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.actorSpriteComps10018 == nil then
				arg_121_1.var_.actorSpriteComps10018 = var_124_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_2 = 0.034

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.actorSpriteComps10018 then
					for iter_124_0, iter_124_1 in pairs(arg_121_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_124_1 then
							local var_124_4 = Mathf.Lerp(iter_124_1.color.r, 0.5, var_124_3)

							iter_124_1.color = Color.New(var_124_4, var_124_4, var_124_4)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.actorSpriteComps10018 then
				local var_124_5 = 0.5

				for iter_124_2, iter_124_3 in pairs(arg_121_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_124_3 then
						iter_124_3.color = Color.New(var_124_5, var_124_5, var_124_5)
					end
				end

				arg_121_1.var_.actorSpriteComps10018 = nil
			end

			local var_124_6 = arg_121_1.actors_["104201_1"]
			local var_124_7 = 0

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 then
				local var_124_8 = var_124_6:GetComponent("Image")

				if var_124_8 then
					arg_121_1.var_.highlightMatValue104201_1 = var_124_8
				end
			end

			local var_124_9 = 0.034

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_7) / var_124_9

				if arg_121_1.var_.highlightMatValue104201_1 then
					local var_124_11 = Mathf.Lerp(0.5, 1, var_124_10)
					local var_124_12 = arg_121_1.var_.highlightMatValue104201_1
					local var_124_13 = var_124_12.color

					var_124_13.r = var_124_11
					var_124_13.g = var_124_11
					var_124_13.b = var_124_11
					var_124_12.color = var_124_13
				end
			end

			if arg_121_1.time_ >= var_124_7 + var_124_9 and arg_121_1.time_ < var_124_7 + var_124_9 + arg_124_0 and arg_121_1.var_.highlightMatValue104201_1 then
				local var_124_14 = 1

				var_124_6.transform:SetSiblingIndex(1)

				local var_124_15 = arg_121_1.var_.highlightMatValue104201_1
				local var_124_16 = var_124_15.color

				var_124_16.r = var_124_14
				var_124_16.g = var_124_14
				var_124_16.b = var_124_14
				var_124_15.color = var_124_16
			end

			local var_124_17 = 0
			local var_124_18 = 0.25

			if var_124_17 < arg_121_1.time_ and arg_121_1.time_ <= var_124_17 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_19 = arg_121_1:FormatText(StoryNameCfg[205].name)

				arg_121_1.leftNameTxt_.text = var_124_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_20 = arg_121_1:GetWordFromCfg(114242030)
				local var_124_21 = arg_121_1:FormatText(var_124_20.content)

				arg_121_1.text_.text = var_124_21

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_22 = 10
				local var_124_23 = utf8.len(var_124_21)
				local var_124_24 = var_124_22 <= 0 and var_124_18 or var_124_18 * (var_124_23 / var_124_22)

				if var_124_24 > 0 and var_124_18 < var_124_24 then
					arg_121_1.talkMaxDuration = var_124_24

					if var_124_24 + var_124_17 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_24 + var_124_17
					end
				end

				arg_121_1.text_.text = var_124_21
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242030", "story_v_out_114242.awb") ~= 0 then
					local var_124_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242030", "story_v_out_114242.awb") / 1000

					if var_124_25 + var_124_17 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_25 + var_124_17
					end

					if var_124_20.prefab_name ~= "" and arg_121_1.actors_[var_124_20.prefab_name] ~= nil then
						local var_124_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_20.prefab_name].transform, "story_v_out_114242", "114242030", "story_v_out_114242.awb")

						arg_121_1:RecordAudio("114242030", var_124_26)
						arg_121_1:RecordAudio("114242030", var_124_26)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_114242", "114242030", "story_v_out_114242.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_114242", "114242030", "story_v_out_114242.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_27 = math.max(var_124_18, arg_121_1.talkMaxDuration)

			if var_124_17 <= arg_121_1.time_ and arg_121_1.time_ < var_124_17 + var_124_27 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_17) / var_124_27

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_17 + var_124_27 and arg_121_1.time_ < var_124_17 + var_124_27 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play114242031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 114242031
		arg_125_1.duration_ = 15.266

		local var_125_0 = {
			ja = 9.333,
			ko = 10.433,
			zh = 15.266,
			en = 14.133
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
				arg_125_0:Play114242032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10018"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.actorSpriteComps10018 == nil then
				arg_125_1.var_.actorSpriteComps10018 = var_128_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_2 = 0.034

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.actorSpriteComps10018 then
					for iter_128_0, iter_128_1 in pairs(arg_125_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_128_1 then
							local var_128_4 = Mathf.Lerp(iter_128_1.color.r, 1, var_128_3)

							iter_128_1.color = Color.New(var_128_4, var_128_4, var_128_4)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.actorSpriteComps10018 then
				local var_128_5 = 1

				for iter_128_2, iter_128_3 in pairs(arg_125_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_128_3 then
						iter_128_3.color = Color.New(var_128_5, var_128_5, var_128_5)
					end
				end

				arg_125_1.var_.actorSpriteComps10018 = nil
			end

			local var_128_6 = arg_125_1.actors_["104201_1"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 then
				local var_128_8 = var_128_6:GetComponent("Image")

				if var_128_8 then
					arg_125_1.var_.highlightMatValue104201_1 = var_128_8
				end
			end

			local var_128_9 = 0.034

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_7) / var_128_9

				if arg_125_1.var_.highlightMatValue104201_1 then
					local var_128_11 = Mathf.Lerp(1, 0.5, var_128_10)
					local var_128_12 = arg_125_1.var_.highlightMatValue104201_1
					local var_128_13 = var_128_12.color

					var_128_13.r = var_128_11
					var_128_13.g = var_128_11
					var_128_13.b = var_128_11
					var_128_12.color = var_128_13
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_9 and arg_125_1.time_ < var_128_7 + var_128_9 + arg_128_0 and arg_125_1.var_.highlightMatValue104201_1 then
				local var_128_14 = 0.5
				local var_128_15 = arg_125_1.var_.highlightMatValue104201_1
				local var_128_16 = var_128_15.color

				var_128_16.r = var_128_14
				var_128_16.g = var_128_14
				var_128_16.b = var_128_14
				var_128_15.color = var_128_16
			end

			local var_128_17 = 0
			local var_128_18 = 1.475

			if var_128_17 < arg_125_1.time_ and arg_125_1.time_ <= var_128_17 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_19 = arg_125_1:FormatText(StoryNameCfg[258].name)

				arg_125_1.leftNameTxt_.text = var_128_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_20 = arg_125_1:GetWordFromCfg(114242031)
				local var_128_21 = arg_125_1:FormatText(var_128_20.content)

				arg_125_1.text_.text = var_128_21

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_22 = 59
				local var_128_23 = utf8.len(var_128_21)
				local var_128_24 = var_128_22 <= 0 and var_128_18 or var_128_18 * (var_128_23 / var_128_22)

				if var_128_24 > 0 and var_128_18 < var_128_24 then
					arg_125_1.talkMaxDuration = var_128_24

					if var_128_24 + var_128_17 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_24 + var_128_17
					end
				end

				arg_125_1.text_.text = var_128_21
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242031", "story_v_out_114242.awb") ~= 0 then
					local var_128_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242031", "story_v_out_114242.awb") / 1000

					if var_128_25 + var_128_17 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_25 + var_128_17
					end

					if var_128_20.prefab_name ~= "" and arg_125_1.actors_[var_128_20.prefab_name] ~= nil then
						local var_128_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_20.prefab_name].transform, "story_v_out_114242", "114242031", "story_v_out_114242.awb")

						arg_125_1:RecordAudio("114242031", var_128_26)
						arg_125_1:RecordAudio("114242031", var_128_26)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_114242", "114242031", "story_v_out_114242.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_114242", "114242031", "story_v_out_114242.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_27 = math.max(var_128_18, arg_125_1.talkMaxDuration)

			if var_128_17 <= arg_125_1.time_ and arg_125_1.time_ < var_128_17 + var_128_27 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_17) / var_128_27

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_17 + var_128_27 and arg_125_1.time_ < var_128_17 + var_128_27 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play114242032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 114242032
		arg_129_1.duration_ = 9.233

		local var_129_0 = {
			ja = 3.766,
			ko = 4.5,
			zh = 5.6,
			en = 9.233
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
				arg_129_0:Play114242033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10018"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.actorSpriteComps10018 == nil then
				arg_129_1.var_.actorSpriteComps10018 = var_132_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_2 = 0.034

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.actorSpriteComps10018 then
					for iter_132_0, iter_132_1 in pairs(arg_129_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_132_1 then
							local var_132_4 = Mathf.Lerp(iter_132_1.color.r, 0.5, var_132_3)

							iter_132_1.color = Color.New(var_132_4, var_132_4, var_132_4)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.actorSpriteComps10018 then
				local var_132_5 = 0.5

				for iter_132_2, iter_132_3 in pairs(arg_129_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_132_3 then
						iter_132_3.color = Color.New(var_132_5, var_132_5, var_132_5)
					end
				end

				arg_129_1.var_.actorSpriteComps10018 = nil
			end

			local var_132_6 = arg_129_1.actors_["104201_1"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 then
				local var_132_8 = var_132_6:GetComponent("Image")

				if var_132_8 then
					arg_129_1.var_.highlightMatValue104201_1 = var_132_8
				end
			end

			local var_132_9 = 0.034

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_9 then
				local var_132_10 = (arg_129_1.time_ - var_132_7) / var_132_9

				if arg_129_1.var_.highlightMatValue104201_1 then
					local var_132_11 = Mathf.Lerp(0.5, 1, var_132_10)
					local var_132_12 = arg_129_1.var_.highlightMatValue104201_1
					local var_132_13 = var_132_12.color

					var_132_13.r = var_132_11
					var_132_13.g = var_132_11
					var_132_13.b = var_132_11
					var_132_12.color = var_132_13
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_9 and arg_129_1.time_ < var_132_7 + var_132_9 + arg_132_0 and arg_129_1.var_.highlightMatValue104201_1 then
				local var_132_14 = 1

				var_132_6.transform:SetSiblingIndex(1)

				local var_132_15 = arg_129_1.var_.highlightMatValue104201_1
				local var_132_16 = var_132_15.color

				var_132_16.r = var_132_14
				var_132_16.g = var_132_14
				var_132_16.b = var_132_14
				var_132_15.color = var_132_16
			end

			local var_132_17 = 0
			local var_132_18 = 0.575

			if var_132_17 < arg_129_1.time_ and arg_129_1.time_ <= var_132_17 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_19 = arg_129_1:FormatText(StoryNameCfg[205].name)

				arg_129_1.leftNameTxt_.text = var_132_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_20 = arg_129_1:GetWordFromCfg(114242032)
				local var_132_21 = arg_129_1:FormatText(var_132_20.content)

				arg_129_1.text_.text = var_132_21

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_22 = 23
				local var_132_23 = utf8.len(var_132_21)
				local var_132_24 = var_132_22 <= 0 and var_132_18 or var_132_18 * (var_132_23 / var_132_22)

				if var_132_24 > 0 and var_132_18 < var_132_24 then
					arg_129_1.talkMaxDuration = var_132_24

					if var_132_24 + var_132_17 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_24 + var_132_17
					end
				end

				arg_129_1.text_.text = var_132_21
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242032", "story_v_out_114242.awb") ~= 0 then
					local var_132_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242032", "story_v_out_114242.awb") / 1000

					if var_132_25 + var_132_17 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_25 + var_132_17
					end

					if var_132_20.prefab_name ~= "" and arg_129_1.actors_[var_132_20.prefab_name] ~= nil then
						local var_132_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_20.prefab_name].transform, "story_v_out_114242", "114242032", "story_v_out_114242.awb")

						arg_129_1:RecordAudio("114242032", var_132_26)
						arg_129_1:RecordAudio("114242032", var_132_26)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_114242", "114242032", "story_v_out_114242.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_114242", "114242032", "story_v_out_114242.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_27 = math.max(var_132_18, arg_129_1.talkMaxDuration)

			if var_132_17 <= arg_129_1.time_ and arg_129_1.time_ < var_132_17 + var_132_27 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_17) / var_132_27

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_17 + var_132_27 and arg_129_1.time_ < var_132_17 + var_132_27 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play114242033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 114242033
		arg_133_1.duration_ = 9

		local var_133_0 = {
			ja = 9,
			ko = 5.233,
			zh = 7.4,
			en = 5.733
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
				arg_133_0:Play114242034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10018"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.actorSpriteComps10018 == nil then
				arg_133_1.var_.actorSpriteComps10018 = var_136_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_2 = 0.034

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.actorSpriteComps10018 then
					for iter_136_0, iter_136_1 in pairs(arg_133_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_136_1 then
							local var_136_4 = Mathf.Lerp(iter_136_1.color.r, 1, var_136_3)

							iter_136_1.color = Color.New(var_136_4, var_136_4, var_136_4)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.actorSpriteComps10018 then
				local var_136_5 = 1

				for iter_136_2, iter_136_3 in pairs(arg_133_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_136_3 then
						iter_136_3.color = Color.New(var_136_5, var_136_5, var_136_5)
					end
				end

				arg_133_1.var_.actorSpriteComps10018 = nil
			end

			local var_136_6 = arg_133_1.actors_["104201_1"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 then
				local var_136_8 = var_136_6:GetComponent("Image")

				if var_136_8 then
					arg_133_1.var_.highlightMatValue104201_1 = var_136_8
				end
			end

			local var_136_9 = 0.034

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_7) / var_136_9

				if arg_133_1.var_.highlightMatValue104201_1 then
					local var_136_11 = Mathf.Lerp(1, 0.5, var_136_10)
					local var_136_12 = arg_133_1.var_.highlightMatValue104201_1
					local var_136_13 = var_136_12.color

					var_136_13.r = var_136_11
					var_136_13.g = var_136_11
					var_136_13.b = var_136_11
					var_136_12.color = var_136_13
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_9 and arg_133_1.time_ < var_136_7 + var_136_9 + arg_136_0 and arg_133_1.var_.highlightMatValue104201_1 then
				local var_136_14 = 0.5
				local var_136_15 = arg_133_1.var_.highlightMatValue104201_1
				local var_136_16 = var_136_15.color

				var_136_16.r = var_136_14
				var_136_16.g = var_136_14
				var_136_16.b = var_136_14
				var_136_15.color = var_136_16
			end

			local var_136_17 = 0
			local var_136_18 = 0.65

			if var_136_17 < arg_133_1.time_ and arg_133_1.time_ <= var_136_17 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_19 = arg_133_1:FormatText(StoryNameCfg[258].name)

				arg_133_1.leftNameTxt_.text = var_136_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_20 = arg_133_1:GetWordFromCfg(114242033)
				local var_136_21 = arg_133_1:FormatText(var_136_20.content)

				arg_133_1.text_.text = var_136_21

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_22 = 26
				local var_136_23 = utf8.len(var_136_21)
				local var_136_24 = var_136_22 <= 0 and var_136_18 or var_136_18 * (var_136_23 / var_136_22)

				if var_136_24 > 0 and var_136_18 < var_136_24 then
					arg_133_1.talkMaxDuration = var_136_24

					if var_136_24 + var_136_17 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_24 + var_136_17
					end
				end

				arg_133_1.text_.text = var_136_21
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242033", "story_v_out_114242.awb") ~= 0 then
					local var_136_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242033", "story_v_out_114242.awb") / 1000

					if var_136_25 + var_136_17 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_25 + var_136_17
					end

					if var_136_20.prefab_name ~= "" and arg_133_1.actors_[var_136_20.prefab_name] ~= nil then
						local var_136_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_20.prefab_name].transform, "story_v_out_114242", "114242033", "story_v_out_114242.awb")

						arg_133_1:RecordAudio("114242033", var_136_26)
						arg_133_1:RecordAudio("114242033", var_136_26)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_114242", "114242033", "story_v_out_114242.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_114242", "114242033", "story_v_out_114242.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_27 = math.max(var_136_18, arg_133_1.talkMaxDuration)

			if var_136_17 <= arg_133_1.time_ and arg_133_1.time_ < var_136_17 + var_136_27 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_17) / var_136_27

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_17 + var_136_27 and arg_133_1.time_ < var_136_17 + var_136_27 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play114242034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 114242034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play114242035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10018"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.actorSpriteComps10018 == nil then
				arg_137_1.var_.actorSpriteComps10018 = var_140_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_2 = 0.034

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.actorSpriteComps10018 then
					for iter_140_0, iter_140_1 in pairs(arg_137_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_140_1 then
							local var_140_4 = Mathf.Lerp(iter_140_1.color.r, 0.5, var_140_3)

							iter_140_1.color = Color.New(var_140_4, var_140_4, var_140_4)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.actorSpriteComps10018 then
				local var_140_5 = 0.5

				for iter_140_2, iter_140_3 in pairs(arg_137_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_140_3 then
						iter_140_3.color = Color.New(var_140_5, var_140_5, var_140_5)
					end
				end

				arg_137_1.var_.actorSpriteComps10018 = nil
			end

			local var_140_6 = 0
			local var_140_7 = 0.65

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

				local var_140_8 = arg_137_1:GetWordFromCfg(114242034)
				local var_140_9 = arg_137_1:FormatText(var_140_8.content)

				arg_137_1.text_.text = var_140_9

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_10 = 26
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
	Play114242035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 114242035
		arg_141_1.duration_ = 3.1

		local var_141_0 = {
			ja = 2.933,
			ko = 3.1,
			zh = 2.233,
			en = 2.466
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
				arg_141_0:Play114242036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10018"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.actorSpriteComps10018 == nil then
				arg_141_1.var_.actorSpriteComps10018 = var_144_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_2 = 0.034

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.actorSpriteComps10018 then
					for iter_144_0, iter_144_1 in pairs(arg_141_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_144_1 then
							local var_144_4 = Mathf.Lerp(iter_144_1.color.r, 1, var_144_3)

							iter_144_1.color = Color.New(var_144_4, var_144_4, var_144_4)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.actorSpriteComps10018 then
				local var_144_5 = 1

				for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_144_3 then
						iter_144_3.color = Color.New(var_144_5, var_144_5, var_144_5)
					end
				end

				arg_141_1.var_.actorSpriteComps10018 = nil
			end

			local var_144_6 = 0
			local var_144_7 = 0.3

			if var_144_6 < arg_141_1.time_ and arg_141_1.time_ <= var_144_6 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_8 = arg_141_1:FormatText(StoryNameCfg[258].name)

				arg_141_1.leftNameTxt_.text = var_144_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_9 = arg_141_1:GetWordFromCfg(114242035)
				local var_144_10 = arg_141_1:FormatText(var_144_9.content)

				arg_141_1.text_.text = var_144_10

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_11 = 12
				local var_144_12 = utf8.len(var_144_10)
				local var_144_13 = var_144_11 <= 0 and var_144_7 or var_144_7 * (var_144_12 / var_144_11)

				if var_144_13 > 0 and var_144_7 < var_144_13 then
					arg_141_1.talkMaxDuration = var_144_13

					if var_144_13 + var_144_6 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_13 + var_144_6
					end
				end

				arg_141_1.text_.text = var_144_10
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242035", "story_v_out_114242.awb") ~= 0 then
					local var_144_14 = manager.audio:GetVoiceLength("story_v_out_114242", "114242035", "story_v_out_114242.awb") / 1000

					if var_144_14 + var_144_6 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_14 + var_144_6
					end

					if var_144_9.prefab_name ~= "" and arg_141_1.actors_[var_144_9.prefab_name] ~= nil then
						local var_144_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_9.prefab_name].transform, "story_v_out_114242", "114242035", "story_v_out_114242.awb")

						arg_141_1:RecordAudio("114242035", var_144_15)
						arg_141_1:RecordAudio("114242035", var_144_15)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_114242", "114242035", "story_v_out_114242.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_114242", "114242035", "story_v_out_114242.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_16 = math.max(var_144_7, arg_141_1.talkMaxDuration)

			if var_144_6 <= arg_141_1.time_ and arg_141_1.time_ < var_144_6 + var_144_16 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_6) / var_144_16

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_6 + var_144_16 and arg_141_1.time_ < var_144_6 + var_144_16 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play114242036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 114242036
		arg_145_1.duration_ = 15.566

		local var_145_0 = {
			ja = 14.8,
			ko = 13.7,
			zh = 15.566,
			en = 12.533
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
				arg_145_0:Play114242037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.8

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[258].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(114242036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 72
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242036", "story_v_out_114242.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242036", "story_v_out_114242.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_114242", "114242036", "story_v_out_114242.awb")

						arg_145_1:RecordAudio("114242036", var_148_9)
						arg_145_1:RecordAudio("114242036", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_114242", "114242036", "story_v_out_114242.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_114242", "114242036", "story_v_out_114242.awb")
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
	Play114242037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 114242037
		arg_149_1.duration_ = 16.5

		local var_149_0 = {
			ja = 16.5,
			ko = 13.8,
			zh = 14.033,
			en = 15.333
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
				arg_149_0:Play114242038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10018"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.actorSpriteComps10018 == nil then
				arg_149_1.var_.actorSpriteComps10018 = var_152_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_2 = 0.034

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.actorSpriteComps10018 then
					for iter_152_0, iter_152_1 in pairs(arg_149_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_152_1 then
							local var_152_4 = Mathf.Lerp(iter_152_1.color.r, 0.5, var_152_3)

							iter_152_1.color = Color.New(var_152_4, var_152_4, var_152_4)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.actorSpriteComps10018 then
				local var_152_5 = 0.5

				for iter_152_2, iter_152_3 in pairs(arg_149_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_152_3 then
						iter_152_3.color = Color.New(var_152_5, var_152_5, var_152_5)
					end
				end

				arg_149_1.var_.actorSpriteComps10018 = nil
			end

			local var_152_6 = arg_149_1.actors_["104201_1"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 then
				local var_152_8 = var_152_6:GetComponent("Image")

				if var_152_8 then
					arg_149_1.var_.highlightMatValue104201_1 = var_152_8
				end
			end

			local var_152_9 = 0.034

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_9 then
				local var_152_10 = (arg_149_1.time_ - var_152_7) / var_152_9

				if arg_149_1.var_.highlightMatValue104201_1 then
					local var_152_11 = Mathf.Lerp(0.5, 1, var_152_10)
					local var_152_12 = arg_149_1.var_.highlightMatValue104201_1
					local var_152_13 = var_152_12.color

					var_152_13.r = var_152_11
					var_152_13.g = var_152_11
					var_152_13.b = var_152_11
					var_152_12.color = var_152_13
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_9 and arg_149_1.time_ < var_152_7 + var_152_9 + arg_152_0 and arg_149_1.var_.highlightMatValue104201_1 then
				local var_152_14 = 1

				var_152_6.transform:SetSiblingIndex(1)

				local var_152_15 = arg_149_1.var_.highlightMatValue104201_1
				local var_152_16 = var_152_15.color

				var_152_16.r = var_152_14
				var_152_16.g = var_152_14
				var_152_16.b = var_152_14
				var_152_15.color = var_152_16
			end

			local var_152_17 = 0
			local var_152_18 = 1.55

			if var_152_17 < arg_149_1.time_ and arg_149_1.time_ <= var_152_17 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_19 = arg_149_1:FormatText(StoryNameCfg[205].name)

				arg_149_1.leftNameTxt_.text = var_152_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_20 = arg_149_1:GetWordFromCfg(114242037)
				local var_152_21 = arg_149_1:FormatText(var_152_20.content)

				arg_149_1.text_.text = var_152_21

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_22 = 62
				local var_152_23 = utf8.len(var_152_21)
				local var_152_24 = var_152_22 <= 0 and var_152_18 or var_152_18 * (var_152_23 / var_152_22)

				if var_152_24 > 0 and var_152_18 < var_152_24 then
					arg_149_1.talkMaxDuration = var_152_24

					if var_152_24 + var_152_17 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_24 + var_152_17
					end
				end

				arg_149_1.text_.text = var_152_21
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242037", "story_v_out_114242.awb") ~= 0 then
					local var_152_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242037", "story_v_out_114242.awb") / 1000

					if var_152_25 + var_152_17 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_25 + var_152_17
					end

					if var_152_20.prefab_name ~= "" and arg_149_1.actors_[var_152_20.prefab_name] ~= nil then
						local var_152_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_20.prefab_name].transform, "story_v_out_114242", "114242037", "story_v_out_114242.awb")

						arg_149_1:RecordAudio("114242037", var_152_26)
						arg_149_1:RecordAudio("114242037", var_152_26)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_114242", "114242037", "story_v_out_114242.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_114242", "114242037", "story_v_out_114242.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_27 = math.max(var_152_18, arg_149_1.talkMaxDuration)

			if var_152_17 <= arg_149_1.time_ and arg_149_1.time_ < var_152_17 + var_152_27 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_17) / var_152_27

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_17 + var_152_27 and arg_149_1.time_ < var_152_17 + var_152_27 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play114242038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 114242038
		arg_153_1.duration_ = 15.1

		local var_153_0 = {
			ja = 10.233,
			ko = 11.9,
			zh = 15.1,
			en = 12.666
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
				arg_153_0:Play114242039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10018"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.actorSpriteComps10018 == nil then
				arg_153_1.var_.actorSpriteComps10018 = var_156_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_2 = 0.034

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.actorSpriteComps10018 then
					for iter_156_0, iter_156_1 in pairs(arg_153_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_156_1 then
							local var_156_4 = Mathf.Lerp(iter_156_1.color.r, 1, var_156_3)

							iter_156_1.color = Color.New(var_156_4, var_156_4, var_156_4)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.actorSpriteComps10018 then
				local var_156_5 = 1

				for iter_156_2, iter_156_3 in pairs(arg_153_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_156_3 then
						iter_156_3.color = Color.New(var_156_5, var_156_5, var_156_5)
					end
				end

				arg_153_1.var_.actorSpriteComps10018 = nil
			end

			local var_156_6 = arg_153_1.actors_["104201_1"]
			local var_156_7 = 0

			if var_156_7 < arg_153_1.time_ and arg_153_1.time_ <= var_156_7 + arg_156_0 then
				local var_156_8 = var_156_6:GetComponent("Image")

				if var_156_8 then
					arg_153_1.var_.highlightMatValue104201_1 = var_156_8
				end
			end

			local var_156_9 = 0.034

			if var_156_7 <= arg_153_1.time_ and arg_153_1.time_ < var_156_7 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_7) / var_156_9

				if arg_153_1.var_.highlightMatValue104201_1 then
					local var_156_11 = Mathf.Lerp(1, 0.5, var_156_10)
					local var_156_12 = arg_153_1.var_.highlightMatValue104201_1
					local var_156_13 = var_156_12.color

					var_156_13.r = var_156_11
					var_156_13.g = var_156_11
					var_156_13.b = var_156_11
					var_156_12.color = var_156_13
				end
			end

			if arg_153_1.time_ >= var_156_7 + var_156_9 and arg_153_1.time_ < var_156_7 + var_156_9 + arg_156_0 and arg_153_1.var_.highlightMatValue104201_1 then
				local var_156_14 = 0.5
				local var_156_15 = arg_153_1.var_.highlightMatValue104201_1
				local var_156_16 = var_156_15.color

				var_156_16.r = var_156_14
				var_156_16.g = var_156_14
				var_156_16.b = var_156_14
				var_156_15.color = var_156_16
			end

			local var_156_17 = 0
			local var_156_18 = 1.525

			if var_156_17 < arg_153_1.time_ and arg_153_1.time_ <= var_156_17 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_19 = arg_153_1:FormatText(StoryNameCfg[258].name)

				arg_153_1.leftNameTxt_.text = var_156_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_20 = arg_153_1:GetWordFromCfg(114242038)
				local var_156_21 = arg_153_1:FormatText(var_156_20.content)

				arg_153_1.text_.text = var_156_21

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_22 = 62
				local var_156_23 = utf8.len(var_156_21)
				local var_156_24 = var_156_22 <= 0 and var_156_18 or var_156_18 * (var_156_23 / var_156_22)

				if var_156_24 > 0 and var_156_18 < var_156_24 then
					arg_153_1.talkMaxDuration = var_156_24

					if var_156_24 + var_156_17 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_24 + var_156_17
					end
				end

				arg_153_1.text_.text = var_156_21
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242038", "story_v_out_114242.awb") ~= 0 then
					local var_156_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242038", "story_v_out_114242.awb") / 1000

					if var_156_25 + var_156_17 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_25 + var_156_17
					end

					if var_156_20.prefab_name ~= "" and arg_153_1.actors_[var_156_20.prefab_name] ~= nil then
						local var_156_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_20.prefab_name].transform, "story_v_out_114242", "114242038", "story_v_out_114242.awb")

						arg_153_1:RecordAudio("114242038", var_156_26)
						arg_153_1:RecordAudio("114242038", var_156_26)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_114242", "114242038", "story_v_out_114242.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_114242", "114242038", "story_v_out_114242.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_27 = math.max(var_156_18, arg_153_1.talkMaxDuration)

			if var_156_17 <= arg_153_1.time_ and arg_153_1.time_ < var_156_17 + var_156_27 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_17) / var_156_27

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_17 + var_156_27 and arg_153_1.time_ < var_156_17 + var_156_27 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play114242039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 114242039
		arg_157_1.duration_ = 2.266

		local var_157_0 = {
			ja = 1.066,
			ko = 1.3,
			zh = 2.266,
			en = 1
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
				arg_157_0:Play114242040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10018"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.actorSpriteComps10018 == nil then
				arg_157_1.var_.actorSpriteComps10018 = var_160_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_2 = 0.034

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.actorSpriteComps10018 then
					for iter_160_0, iter_160_1 in pairs(arg_157_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_160_1 then
							local var_160_4 = Mathf.Lerp(iter_160_1.color.r, 0.5, var_160_3)

							iter_160_1.color = Color.New(var_160_4, var_160_4, var_160_4)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.actorSpriteComps10018 then
				local var_160_5 = 0.5

				for iter_160_2, iter_160_3 in pairs(arg_157_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_160_3 then
						iter_160_3.color = Color.New(var_160_5, var_160_5, var_160_5)
					end
				end

				arg_157_1.var_.actorSpriteComps10018 = nil
			end

			local var_160_6 = arg_157_1.actors_["104201_1"]
			local var_160_7 = 0

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 then
				local var_160_8 = var_160_6:GetComponent("Image")

				if var_160_8 then
					arg_157_1.var_.highlightMatValue104201_1 = var_160_8
				end
			end

			local var_160_9 = 0.034

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_9 then
				local var_160_10 = (arg_157_1.time_ - var_160_7) / var_160_9

				if arg_157_1.var_.highlightMatValue104201_1 then
					local var_160_11 = Mathf.Lerp(0.5, 1, var_160_10)
					local var_160_12 = arg_157_1.var_.highlightMatValue104201_1
					local var_160_13 = var_160_12.color

					var_160_13.r = var_160_11
					var_160_13.g = var_160_11
					var_160_13.b = var_160_11
					var_160_12.color = var_160_13
				end
			end

			if arg_157_1.time_ >= var_160_7 + var_160_9 and arg_157_1.time_ < var_160_7 + var_160_9 + arg_160_0 and arg_157_1.var_.highlightMatValue104201_1 then
				local var_160_14 = 1

				var_160_6.transform:SetSiblingIndex(1)

				local var_160_15 = arg_157_1.var_.highlightMatValue104201_1
				local var_160_16 = var_160_15.color

				var_160_16.r = var_160_14
				var_160_16.g = var_160_14
				var_160_16.b = var_160_14
				var_160_15.color = var_160_16
			end

			local var_160_17 = 0
			local var_160_18 = 0.05

			if var_160_17 < arg_157_1.time_ and arg_157_1.time_ <= var_160_17 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_19 = arg_157_1:FormatText(StoryNameCfg[205].name)

				arg_157_1.leftNameTxt_.text = var_160_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_20 = arg_157_1:GetWordFromCfg(114242039)
				local var_160_21 = arg_157_1:FormatText(var_160_20.content)

				arg_157_1.text_.text = var_160_21

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_22 = 2
				local var_160_23 = utf8.len(var_160_21)
				local var_160_24 = var_160_22 <= 0 and var_160_18 or var_160_18 * (var_160_23 / var_160_22)

				if var_160_24 > 0 and var_160_18 < var_160_24 then
					arg_157_1.talkMaxDuration = var_160_24

					if var_160_24 + var_160_17 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_24 + var_160_17
					end
				end

				arg_157_1.text_.text = var_160_21
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242039", "story_v_out_114242.awb") ~= 0 then
					local var_160_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242039", "story_v_out_114242.awb") / 1000

					if var_160_25 + var_160_17 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_25 + var_160_17
					end

					if var_160_20.prefab_name ~= "" and arg_157_1.actors_[var_160_20.prefab_name] ~= nil then
						local var_160_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_20.prefab_name].transform, "story_v_out_114242", "114242039", "story_v_out_114242.awb")

						arg_157_1:RecordAudio("114242039", var_160_26)
						arg_157_1:RecordAudio("114242039", var_160_26)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_114242", "114242039", "story_v_out_114242.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_114242", "114242039", "story_v_out_114242.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_27 = math.max(var_160_18, arg_157_1.talkMaxDuration)

			if var_160_17 <= arg_157_1.time_ and arg_157_1.time_ < var_160_17 + var_160_27 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_17) / var_160_27

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_17 + var_160_27 and arg_157_1.time_ < var_160_17 + var_160_27 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play114242040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 114242040
		arg_161_1.duration_ = 13.366

		local var_161_0 = {
			ja = 6.033,
			ko = 8.533,
			zh = 8.7,
			en = 13.366
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
				arg_161_0:Play114242041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10018"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.actorSpriteComps10018 == nil then
				arg_161_1.var_.actorSpriteComps10018 = var_164_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_2 = 0.034

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.actorSpriteComps10018 then
					for iter_164_0, iter_164_1 in pairs(arg_161_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_164_1 then
							local var_164_4 = Mathf.Lerp(iter_164_1.color.r, 1, var_164_3)

							iter_164_1.color = Color.New(var_164_4, var_164_4, var_164_4)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.actorSpriteComps10018 then
				local var_164_5 = 1

				for iter_164_2, iter_164_3 in pairs(arg_161_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_164_3 then
						iter_164_3.color = Color.New(var_164_5, var_164_5, var_164_5)
					end
				end

				arg_161_1.var_.actorSpriteComps10018 = nil
			end

			local var_164_6 = arg_161_1.actors_["104201_1"]
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 then
				local var_164_8 = var_164_6:GetComponent("Image")

				if var_164_8 then
					arg_161_1.var_.highlightMatValue104201_1 = var_164_8
				end
			end

			local var_164_9 = 0.034

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_9 then
				local var_164_10 = (arg_161_1.time_ - var_164_7) / var_164_9

				if arg_161_1.var_.highlightMatValue104201_1 then
					local var_164_11 = Mathf.Lerp(1, 0.5, var_164_10)
					local var_164_12 = arg_161_1.var_.highlightMatValue104201_1
					local var_164_13 = var_164_12.color

					var_164_13.r = var_164_11
					var_164_13.g = var_164_11
					var_164_13.b = var_164_11
					var_164_12.color = var_164_13
				end
			end

			if arg_161_1.time_ >= var_164_7 + var_164_9 and arg_161_1.time_ < var_164_7 + var_164_9 + arg_164_0 and arg_161_1.var_.highlightMatValue104201_1 then
				local var_164_14 = 0.5
				local var_164_15 = arg_161_1.var_.highlightMatValue104201_1
				local var_164_16 = var_164_15.color

				var_164_16.r = var_164_14
				var_164_16.g = var_164_14
				var_164_16.b = var_164_14
				var_164_15.color = var_164_16
			end

			local var_164_17 = 0
			local var_164_18 = 1.075

			if var_164_17 < arg_161_1.time_ and arg_161_1.time_ <= var_164_17 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_19 = arg_161_1:FormatText(StoryNameCfg[258].name)

				arg_161_1.leftNameTxt_.text = var_164_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_20 = arg_161_1:GetWordFromCfg(114242040)
				local var_164_21 = arg_161_1:FormatText(var_164_20.content)

				arg_161_1.text_.text = var_164_21

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_22 = 43
				local var_164_23 = utf8.len(var_164_21)
				local var_164_24 = var_164_22 <= 0 and var_164_18 or var_164_18 * (var_164_23 / var_164_22)

				if var_164_24 > 0 and var_164_18 < var_164_24 then
					arg_161_1.talkMaxDuration = var_164_24

					if var_164_24 + var_164_17 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_24 + var_164_17
					end
				end

				arg_161_1.text_.text = var_164_21
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242040", "story_v_out_114242.awb") ~= 0 then
					local var_164_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242040", "story_v_out_114242.awb") / 1000

					if var_164_25 + var_164_17 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_25 + var_164_17
					end

					if var_164_20.prefab_name ~= "" and arg_161_1.actors_[var_164_20.prefab_name] ~= nil then
						local var_164_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_20.prefab_name].transform, "story_v_out_114242", "114242040", "story_v_out_114242.awb")

						arg_161_1:RecordAudio("114242040", var_164_26)
						arg_161_1:RecordAudio("114242040", var_164_26)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_114242", "114242040", "story_v_out_114242.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_114242", "114242040", "story_v_out_114242.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_27 = math.max(var_164_18, arg_161_1.talkMaxDuration)

			if var_164_17 <= arg_161_1.time_ and arg_161_1.time_ < var_164_17 + var_164_27 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_17) / var_164_27

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_17 + var_164_27 and arg_161_1.time_ < var_164_17 + var_164_27 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play114242041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 114242041
		arg_165_1.duration_ = 3.4

		local var_165_0 = {
			ja = 3.4,
			ko = 2.833,
			zh = 3.3,
			en = 2.866
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
				arg_165_0:Play114242042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10018"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.actorSpriteComps10018 == nil then
				arg_165_1.var_.actorSpriteComps10018 = var_168_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_2 = 0.034

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.actorSpriteComps10018 then
					for iter_168_0, iter_168_1 in pairs(arg_165_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_168_1 then
							local var_168_4 = Mathf.Lerp(iter_168_1.color.r, 0.5, var_168_3)

							iter_168_1.color = Color.New(var_168_4, var_168_4, var_168_4)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.actorSpriteComps10018 then
				local var_168_5 = 0.5

				for iter_168_2, iter_168_3 in pairs(arg_165_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_168_3 then
						iter_168_3.color = Color.New(var_168_5, var_168_5, var_168_5)
					end
				end

				arg_165_1.var_.actorSpriteComps10018 = nil
			end

			local var_168_6 = arg_165_1.actors_["104201_1"]
			local var_168_7 = 0

			if var_168_7 < arg_165_1.time_ and arg_165_1.time_ <= var_168_7 + arg_168_0 then
				local var_168_8 = var_168_6:GetComponent("Image")

				if var_168_8 then
					arg_165_1.var_.highlightMatValue104201_1 = var_168_8
				end
			end

			local var_168_9 = 0.034

			if var_168_7 <= arg_165_1.time_ and arg_165_1.time_ < var_168_7 + var_168_9 then
				local var_168_10 = (arg_165_1.time_ - var_168_7) / var_168_9

				if arg_165_1.var_.highlightMatValue104201_1 then
					local var_168_11 = Mathf.Lerp(0.5, 1, var_168_10)
					local var_168_12 = arg_165_1.var_.highlightMatValue104201_1
					local var_168_13 = var_168_12.color

					var_168_13.r = var_168_11
					var_168_13.g = var_168_11
					var_168_13.b = var_168_11
					var_168_12.color = var_168_13
				end
			end

			if arg_165_1.time_ >= var_168_7 + var_168_9 and arg_165_1.time_ < var_168_7 + var_168_9 + arg_168_0 and arg_165_1.var_.highlightMatValue104201_1 then
				local var_168_14 = 1

				var_168_6.transform:SetSiblingIndex(1)

				local var_168_15 = arg_165_1.var_.highlightMatValue104201_1
				local var_168_16 = var_168_15.color

				var_168_16.r = var_168_14
				var_168_16.g = var_168_14
				var_168_16.b = var_168_14
				var_168_15.color = var_168_16
			end

			local var_168_17 = 0
			local var_168_18 = 0.225

			if var_168_17 < arg_165_1.time_ and arg_165_1.time_ <= var_168_17 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_19 = arg_165_1:FormatText(StoryNameCfg[205].name)

				arg_165_1.leftNameTxt_.text = var_168_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_20 = arg_165_1:GetWordFromCfg(114242041)
				local var_168_21 = arg_165_1:FormatText(var_168_20.content)

				arg_165_1.text_.text = var_168_21

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_22 = 9
				local var_168_23 = utf8.len(var_168_21)
				local var_168_24 = var_168_22 <= 0 and var_168_18 or var_168_18 * (var_168_23 / var_168_22)

				if var_168_24 > 0 and var_168_18 < var_168_24 then
					arg_165_1.talkMaxDuration = var_168_24

					if var_168_24 + var_168_17 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_24 + var_168_17
					end
				end

				arg_165_1.text_.text = var_168_21
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242041", "story_v_out_114242.awb") ~= 0 then
					local var_168_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242041", "story_v_out_114242.awb") / 1000

					if var_168_25 + var_168_17 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_25 + var_168_17
					end

					if var_168_20.prefab_name ~= "" and arg_165_1.actors_[var_168_20.prefab_name] ~= nil then
						local var_168_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_20.prefab_name].transform, "story_v_out_114242", "114242041", "story_v_out_114242.awb")

						arg_165_1:RecordAudio("114242041", var_168_26)
						arg_165_1:RecordAudio("114242041", var_168_26)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_114242", "114242041", "story_v_out_114242.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_114242", "114242041", "story_v_out_114242.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_27 = math.max(var_168_18, arg_165_1.talkMaxDuration)

			if var_168_17 <= arg_165_1.time_ and arg_165_1.time_ < var_168_17 + var_168_27 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_17) / var_168_27

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_17 + var_168_27 and arg_165_1.time_ < var_168_17 + var_168_27 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play114242042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 114242042
		arg_169_1.duration_ = 7.9

		local var_169_0 = {
			ja = 7.9,
			ko = 6.966,
			zh = 6.833,
			en = 7.566
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play114242043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10018"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.actorSpriteComps10018 == nil then
				arg_169_1.var_.actorSpriteComps10018 = var_172_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_2 = 0.034

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.actorSpriteComps10018 then
					for iter_172_0, iter_172_1 in pairs(arg_169_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_172_1 then
							local var_172_4 = Mathf.Lerp(iter_172_1.color.r, 1, var_172_3)

							iter_172_1.color = Color.New(var_172_4, var_172_4, var_172_4)
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.actorSpriteComps10018 then
				local var_172_5 = 1

				for iter_172_2, iter_172_3 in pairs(arg_169_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_172_3 then
						iter_172_3.color = Color.New(var_172_5, var_172_5, var_172_5)
					end
				end

				arg_169_1.var_.actorSpriteComps10018 = nil
			end

			local var_172_6 = arg_169_1.actors_["104201_1"]
			local var_172_7 = 0

			if var_172_7 < arg_169_1.time_ and arg_169_1.time_ <= var_172_7 + arg_172_0 then
				local var_172_8 = var_172_6:GetComponent("Image")

				if var_172_8 then
					arg_169_1.var_.highlightMatValue104201_1 = var_172_8
				end
			end

			local var_172_9 = 0.034

			if var_172_7 <= arg_169_1.time_ and arg_169_1.time_ < var_172_7 + var_172_9 then
				local var_172_10 = (arg_169_1.time_ - var_172_7) / var_172_9

				if arg_169_1.var_.highlightMatValue104201_1 then
					local var_172_11 = Mathf.Lerp(1, 0.5, var_172_10)
					local var_172_12 = arg_169_1.var_.highlightMatValue104201_1
					local var_172_13 = var_172_12.color

					var_172_13.r = var_172_11
					var_172_13.g = var_172_11
					var_172_13.b = var_172_11
					var_172_12.color = var_172_13
				end
			end

			if arg_169_1.time_ >= var_172_7 + var_172_9 and arg_169_1.time_ < var_172_7 + var_172_9 + arg_172_0 and arg_169_1.var_.highlightMatValue104201_1 then
				local var_172_14 = 0.5
				local var_172_15 = arg_169_1.var_.highlightMatValue104201_1
				local var_172_16 = var_172_15.color

				var_172_16.r = var_172_14
				var_172_16.g = var_172_14
				var_172_16.b = var_172_14
				var_172_15.color = var_172_16
			end

			local var_172_17 = 0
			local var_172_18 = 0.825

			if var_172_17 < arg_169_1.time_ and arg_169_1.time_ <= var_172_17 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_19 = arg_169_1:FormatText(StoryNameCfg[258].name)

				arg_169_1.leftNameTxt_.text = var_172_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_20 = arg_169_1:GetWordFromCfg(114242042)
				local var_172_21 = arg_169_1:FormatText(var_172_20.content)

				arg_169_1.text_.text = var_172_21

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_22 = 33
				local var_172_23 = utf8.len(var_172_21)
				local var_172_24 = var_172_22 <= 0 and var_172_18 or var_172_18 * (var_172_23 / var_172_22)

				if var_172_24 > 0 and var_172_18 < var_172_24 then
					arg_169_1.talkMaxDuration = var_172_24

					if var_172_24 + var_172_17 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_24 + var_172_17
					end
				end

				arg_169_1.text_.text = var_172_21
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242042", "story_v_out_114242.awb") ~= 0 then
					local var_172_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242042", "story_v_out_114242.awb") / 1000

					if var_172_25 + var_172_17 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_25 + var_172_17
					end

					if var_172_20.prefab_name ~= "" and arg_169_1.actors_[var_172_20.prefab_name] ~= nil then
						local var_172_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_20.prefab_name].transform, "story_v_out_114242", "114242042", "story_v_out_114242.awb")

						arg_169_1:RecordAudio("114242042", var_172_26)
						arg_169_1:RecordAudio("114242042", var_172_26)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_114242", "114242042", "story_v_out_114242.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_114242", "114242042", "story_v_out_114242.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_27 = math.max(var_172_18, arg_169_1.talkMaxDuration)

			if var_172_17 <= arg_169_1.time_ and arg_169_1.time_ < var_172_17 + var_172_27 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_17) / var_172_27

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_17 + var_172_27 and arg_169_1.time_ < var_172_17 + var_172_27 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play114242043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 114242043
		arg_173_1.duration_ = 7

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play114242044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				local var_176_1 = manager.ui.mainCamera.transform.localPosition
				local var_176_2 = Vector3.New(0, 0, 10) + Vector3.New(var_176_1.x, var_176_1.y, 0)
				local var_176_3 = arg_173_1.bgs_.ST25

				var_176_3.transform.localPosition = var_176_2
				var_176_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_176_4 = var_176_3:GetComponent("SpriteRenderer")

				if var_176_4 and var_176_4.sprite then
					local var_176_5 = (var_176_3.transform.localPosition - var_176_1).z
					local var_176_6 = manager.ui.mainCameraCom_
					local var_176_7 = 2 * var_176_5 * Mathf.Tan(var_176_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_176_8 = var_176_7 * var_176_6.aspect
					local var_176_9 = var_176_4.sprite.bounds.size.x
					local var_176_10 = var_176_4.sprite.bounds.size.y
					local var_176_11 = var_176_8 / var_176_9
					local var_176_12 = var_176_7 / var_176_10
					local var_176_13 = var_176_12 < var_176_11 and var_176_11 or var_176_12

					var_176_3.transform.localScale = Vector3.New(var_176_13, var_176_13, 0)
				end

				for iter_176_0, iter_176_1 in pairs(arg_173_1.bgs_) do
					if iter_176_0 ~= "ST25" then
						iter_176_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_15 = 2

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15
				local var_176_17 = Color.New(1, 1, 1)

				var_176_17.a = Mathf.Lerp(1, 0, var_176_16)
				arg_173_1.mask_.color = var_176_17
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 then
				local var_176_18 = Color.New(1, 1, 1)
				local var_176_19 = 0

				arg_173_1.mask_.enabled = false
				var_176_18.a = var_176_19
				arg_173_1.mask_.color = var_176_18
			end

			local var_176_20 = arg_173_1.actors_["10018"].transform
			local var_176_21 = 0

			if var_176_21 < arg_173_1.time_ and arg_173_1.time_ <= var_176_21 + arg_176_0 then
				arg_173_1.var_.moveOldPos10018 = var_176_20.localPosition
				var_176_20.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("10018", 7)

				local var_176_22 = var_176_20.childCount

				for iter_176_2 = 0, var_176_22 - 1 do
					local var_176_23 = var_176_20:GetChild(iter_176_2)

					if var_176_23.name == "split_1" or not string.find(var_176_23.name, "split") then
						var_176_23.gameObject:SetActive(true)
					else
						var_176_23.gameObject:SetActive(false)
					end
				end
			end

			local var_176_24 = 0.001

			if var_176_21 <= arg_173_1.time_ and arg_173_1.time_ < var_176_21 + var_176_24 then
				local var_176_25 = (arg_173_1.time_ - var_176_21) / var_176_24
				local var_176_26 = Vector3.New(0, -2000, -180)

				var_176_20.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos10018, var_176_26, var_176_25)
			end

			if arg_173_1.time_ >= var_176_21 + var_176_24 and arg_173_1.time_ < var_176_21 + var_176_24 + arg_176_0 then
				var_176_20.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_176_27 = arg_173_1.actors_["104201_1"].transform
			local var_176_28 = 0

			if var_176_28 < arg_173_1.time_ and arg_173_1.time_ <= var_176_28 + arg_176_0 then
				arg_173_1.var_.moveOldPos104201_1 = var_176_27.localPosition
				var_176_27.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("104201_1", 7)
			end

			local var_176_29 = 0.001

			if var_176_28 <= arg_173_1.time_ and arg_173_1.time_ < var_176_28 + var_176_29 then
				local var_176_30 = (arg_173_1.time_ - var_176_28) / var_176_29
				local var_176_31 = Vector3.New(0, -2000, -180)

				var_176_27.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos104201_1, var_176_31, var_176_30)
			end

			if arg_173_1.time_ >= var_176_28 + var_176_29 and arg_173_1.time_ < var_176_28 + var_176_29 + arg_176_0 then
				var_176_27.localPosition = Vector3.New(0, -2000, -180)
			end

			if arg_173_1.frameCnt_ <= 1 then
				arg_173_1.dialog_:SetActive(false)
			end

			local var_176_32 = 2
			local var_176_33 = 0.05

			if var_176_32 < arg_173_1.time_ and arg_173_1.time_ <= var_176_32 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				arg_173_1.dialog_:SetActive(true)

				local var_176_34 = LeanTween.value(arg_173_1.dialog_, 0, 1, 0.3)

				var_176_34:setOnUpdate(LuaHelper.FloatAction(function(arg_177_0)
					arg_173_1.dialogCg_.alpha = arg_177_0
				end))
				var_176_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_173_1.dialog_)
					var_176_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_173_1.duration_ = arg_173_1.duration_ + 0.3

				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_35 = arg_173_1:GetWordFromCfg(114242043)
				local var_176_36 = arg_173_1:FormatText(var_176_35.content)

				arg_173_1.text_.text = var_176_36

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_37 = 2
				local var_176_38 = utf8.len(var_176_36)
				local var_176_39 = var_176_37 <= 0 and var_176_33 or var_176_33 * (var_176_38 / var_176_37)

				if var_176_39 > 0 and var_176_33 < var_176_39 then
					arg_173_1.talkMaxDuration = var_176_39
					var_176_32 = var_176_32 + 0.3

					if var_176_39 + var_176_32 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_39 + var_176_32
					end
				end

				arg_173_1.text_.text = var_176_36
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_40 = var_176_32 + 0.3
			local var_176_41 = math.max(var_176_33, arg_173_1.talkMaxDuration)

			if var_176_40 <= arg_173_1.time_ and arg_173_1.time_ < var_176_40 + var_176_41 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_40) / var_176_41

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_40 + var_176_41 and arg_173_1.time_ < var_176_40 + var_176_41 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play114242044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 114242044
		arg_179_1.duration_ = 3

		local var_179_0 = {
			ja = 2.9,
			ko = 2.233,
			zh = 3,
			en = 2.3
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
				arg_179_0:Play114242045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10015"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10015 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10015", 4)

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

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10015, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_182_7 = arg_179_1.actors_["10015"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps10015 == nil then
				arg_179_1.var_.actorSpriteComps10015 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 0.034

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps10015 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_182_2 then
							local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

							iter_182_2.color = Color.New(var_182_11, var_182_11, var_182_11)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps10015 then
				local var_182_12 = 1

				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_182_4 then
						iter_182_4.color = Color.New(var_182_12, var_182_12, var_182_12)
					end
				end

				arg_179_1.var_.actorSpriteComps10015 = nil
			end

			local var_182_13 = arg_179_1.actors_["10015"]
			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 then
				local var_182_15 = var_182_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_182_15 then
					arg_179_1.var_.alphaOldValue10015 = var_182_15.alpha
					arg_179_1.var_.characterEffect10015 = var_182_15
				end

				arg_179_1.var_.alphaOldValue10015 = 0
			end

			local var_182_16 = 0.5

			if var_182_14 <= arg_179_1.time_ and arg_179_1.time_ < var_182_14 + var_182_16 then
				local var_182_17 = (arg_179_1.time_ - var_182_14) / var_182_16
				local var_182_18 = Mathf.Lerp(arg_179_1.var_.alphaOldValue10015, 1, var_182_17)

				if arg_179_1.var_.characterEffect10015 then
					arg_179_1.var_.characterEffect10015.alpha = var_182_18
				end
			end

			if arg_179_1.time_ >= var_182_14 + var_182_16 and arg_179_1.time_ < var_182_14 + var_182_16 + arg_182_0 and arg_179_1.var_.characterEffect10015 then
				arg_179_1.var_.characterEffect10015.alpha = 1
			end

			local var_182_19 = 0
			local var_182_20 = 0.3

			if var_182_19 < arg_179_1.time_ and arg_179_1.time_ <= var_182_19 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_21 = arg_179_1:FormatText(StoryNameCfg[208].name)

				arg_179_1.leftNameTxt_.text = var_182_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_22 = arg_179_1:GetWordFromCfg(114242044)
				local var_182_23 = arg_179_1:FormatText(var_182_22.content)

				arg_179_1.text_.text = var_182_23

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_24 = 12
				local var_182_25 = utf8.len(var_182_23)
				local var_182_26 = var_182_24 <= 0 and var_182_20 or var_182_20 * (var_182_25 / var_182_24)

				if var_182_26 > 0 and var_182_20 < var_182_26 then
					arg_179_1.talkMaxDuration = var_182_26

					if var_182_26 + var_182_19 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_26 + var_182_19
					end
				end

				arg_179_1.text_.text = var_182_23
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242044", "story_v_out_114242.awb") ~= 0 then
					local var_182_27 = manager.audio:GetVoiceLength("story_v_out_114242", "114242044", "story_v_out_114242.awb") / 1000

					if var_182_27 + var_182_19 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_27 + var_182_19
					end

					if var_182_22.prefab_name ~= "" and arg_179_1.actors_[var_182_22.prefab_name] ~= nil then
						local var_182_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_22.prefab_name].transform, "story_v_out_114242", "114242044", "story_v_out_114242.awb")

						arg_179_1:RecordAudio("114242044", var_182_28)
						arg_179_1:RecordAudio("114242044", var_182_28)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_114242", "114242044", "story_v_out_114242.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_114242", "114242044", "story_v_out_114242.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_29 = math.max(var_182_20, arg_179_1.talkMaxDuration)

			if var_182_19 <= arg_179_1.time_ and arg_179_1.time_ < var_182_19 + var_182_29 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_19) / var_182_29

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_19 + var_182_29 and arg_179_1.time_ < var_182_19 + var_182_29 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play114242045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 114242045
		arg_183_1.duration_ = 3.5

		local var_183_0 = {
			ja = 2.3,
			ko = 3.466,
			zh = 3.5,
			en = 3.3
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
				arg_183_0:Play114242046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10018"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10018 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10018", 2)

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
				local var_186_6 = Vector3.New(-390, -350, -180)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10018, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_186_7 = arg_183_1.actors_["10015"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps10015 == nil then
				arg_183_1.var_.actorSpriteComps10015 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps10015 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 0.5, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps10015 then
				local var_186_12 = 0.5

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps10015 = nil
			end

			local var_186_13 = arg_183_1.actors_["10018"]
			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 and arg_183_1.var_.actorSpriteComps10018 == nil then
				arg_183_1.var_.actorSpriteComps10018 = var_186_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_15 = 0.034

			if var_186_14 <= arg_183_1.time_ and arg_183_1.time_ < var_186_14 + var_186_15 then
				local var_186_16 = (arg_183_1.time_ - var_186_14) / var_186_15

				if arg_183_1.var_.actorSpriteComps10018 then
					for iter_186_5, iter_186_6 in pairs(arg_183_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_186_6 then
							local var_186_17 = Mathf.Lerp(iter_186_6.color.r, 1, var_186_16)

							iter_186_6.color = Color.New(var_186_17, var_186_17, var_186_17)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_15 and arg_183_1.time_ < var_186_14 + var_186_15 + arg_186_0 and arg_183_1.var_.actorSpriteComps10018 then
				local var_186_18 = 1

				for iter_186_7, iter_186_8 in pairs(arg_183_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_186_8 then
						iter_186_8.color = Color.New(var_186_18, var_186_18, var_186_18)
					end
				end

				arg_183_1.var_.actorSpriteComps10018 = nil
			end

			local var_186_19 = arg_183_1.actors_["10018"]
			local var_186_20 = 0

			if var_186_20 < arg_183_1.time_ and arg_183_1.time_ <= var_186_20 + arg_186_0 then
				local var_186_21 = var_186_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_186_21 then
					arg_183_1.var_.alphaOldValue10018 = var_186_21.alpha
					arg_183_1.var_.characterEffect10018 = var_186_21
				end

				arg_183_1.var_.alphaOldValue10018 = 0
			end

			local var_186_22 = 0.5

			if var_186_20 <= arg_183_1.time_ and arg_183_1.time_ < var_186_20 + var_186_22 then
				local var_186_23 = (arg_183_1.time_ - var_186_20) / var_186_22
				local var_186_24 = Mathf.Lerp(arg_183_1.var_.alphaOldValue10018, 1, var_186_23)

				if arg_183_1.var_.characterEffect10018 then
					arg_183_1.var_.characterEffect10018.alpha = var_186_24
				end
			end

			if arg_183_1.time_ >= var_186_20 + var_186_22 and arg_183_1.time_ < var_186_20 + var_186_22 + arg_186_0 and arg_183_1.var_.characterEffect10018 then
				arg_183_1.var_.characterEffect10018.alpha = 1
			end

			local var_186_25 = 0
			local var_186_26 = 0.15

			if var_186_25 < arg_183_1.time_ and arg_183_1.time_ <= var_186_25 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_27 = arg_183_1:FormatText(StoryNameCfg[257].name)

				arg_183_1.leftNameTxt_.text = var_186_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_28 = arg_183_1:GetWordFromCfg(114242045)
				local var_186_29 = arg_183_1:FormatText(var_186_28.content)

				arg_183_1.text_.text = var_186_29

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_30 = 6
				local var_186_31 = utf8.len(var_186_29)
				local var_186_32 = var_186_30 <= 0 and var_186_26 or var_186_26 * (var_186_31 / var_186_30)

				if var_186_32 > 0 and var_186_26 < var_186_32 then
					arg_183_1.talkMaxDuration = var_186_32

					if var_186_32 + var_186_25 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_32 + var_186_25
					end
				end

				arg_183_1.text_.text = var_186_29
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242045", "story_v_out_114242.awb") ~= 0 then
					local var_186_33 = manager.audio:GetVoiceLength("story_v_out_114242", "114242045", "story_v_out_114242.awb") / 1000

					if var_186_33 + var_186_25 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_33 + var_186_25
					end

					if var_186_28.prefab_name ~= "" and arg_183_1.actors_[var_186_28.prefab_name] ~= nil then
						local var_186_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_28.prefab_name].transform, "story_v_out_114242", "114242045", "story_v_out_114242.awb")

						arg_183_1:RecordAudio("114242045", var_186_34)
						arg_183_1:RecordAudio("114242045", var_186_34)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_114242", "114242045", "story_v_out_114242.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_114242", "114242045", "story_v_out_114242.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_35 = math.max(var_186_26, arg_183_1.talkMaxDuration)

			if var_186_25 <= arg_183_1.time_ and arg_183_1.time_ < var_186_25 + var_186_35 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_25) / var_186_35

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_25 + var_186_35 and arg_183_1.time_ < var_186_25 + var_186_35 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play114242046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 114242046
		arg_187_1.duration_ = 1.9

		local var_187_0 = {
			ja = 0.999999999999,
			ko = 1.433,
			zh = 1.9,
			en = 1.233
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
				arg_187_0:Play114242047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10015"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.actorSpriteComps10015 == nil then
				arg_187_1.var_.actorSpriteComps10015 = var_190_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_2 = 0.034

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.actorSpriteComps10015 then
					for iter_190_0, iter_190_1 in pairs(arg_187_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_190_1 then
							local var_190_4 = Mathf.Lerp(iter_190_1.color.r, 1, var_190_3)

							iter_190_1.color = Color.New(var_190_4, var_190_4, var_190_4)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.actorSpriteComps10015 then
				local var_190_5 = 1

				for iter_190_2, iter_190_3 in pairs(arg_187_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_190_3 then
						iter_190_3.color = Color.New(var_190_5, var_190_5, var_190_5)
					end
				end

				arg_187_1.var_.actorSpriteComps10015 = nil
			end

			local var_190_6 = arg_187_1.actors_["10018"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.actorSpriteComps10018 == nil then
				arg_187_1.var_.actorSpriteComps10018 = var_190_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_8 = 0.034

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.actorSpriteComps10018 then
					for iter_190_4, iter_190_5 in pairs(arg_187_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_190_5 then
							local var_190_10 = Mathf.Lerp(iter_190_5.color.r, 0.5, var_190_9)

							iter_190_5.color = Color.New(var_190_10, var_190_10, var_190_10)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps10018 then
				local var_190_11 = 0.5

				for iter_190_6, iter_190_7 in pairs(arg_187_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_190_7 then
						iter_190_7.color = Color.New(var_190_11, var_190_11, var_190_11)
					end
				end

				arg_187_1.var_.actorSpriteComps10018 = nil
			end

			local var_190_12 = arg_187_1.actors_["10015"].transform
			local var_190_13 = 0

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1.var_.moveOldPos10015 = var_190_12.localPosition
				var_190_12.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10015", 4)

				local var_190_14 = var_190_12.childCount

				for iter_190_8 = 0, var_190_14 - 1 do
					local var_190_15 = var_190_12:GetChild(iter_190_8)

					if var_190_15.name == "split_5" or not string.find(var_190_15.name, "split") then
						var_190_15.gameObject:SetActive(true)
					else
						var_190_15.gameObject:SetActive(false)
					end
				end
			end

			local var_190_16 = 0.001

			if var_190_13 <= arg_187_1.time_ and arg_187_1.time_ < var_190_13 + var_190_16 then
				local var_190_17 = (arg_187_1.time_ - var_190_13) / var_190_16
				local var_190_18 = Vector3.New(390, -350, -180)

				var_190_12.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10015, var_190_18, var_190_17)
			end

			if arg_187_1.time_ >= var_190_13 + var_190_16 and arg_187_1.time_ < var_190_13 + var_190_16 + arg_190_0 then
				var_190_12.localPosition = Vector3.New(390, -350, -180)
			end

			local var_190_19 = 0
			local var_190_20 = 0.075

			if var_190_19 < arg_187_1.time_ and arg_187_1.time_ <= var_190_19 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_21 = arg_187_1:FormatText(StoryNameCfg[208].name)

				arg_187_1.leftNameTxt_.text = var_190_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_22 = arg_187_1:GetWordFromCfg(114242046)
				local var_190_23 = arg_187_1:FormatText(var_190_22.content)

				arg_187_1.text_.text = var_190_23

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_24 = 3
				local var_190_25 = utf8.len(var_190_23)
				local var_190_26 = var_190_24 <= 0 and var_190_20 or var_190_20 * (var_190_25 / var_190_24)

				if var_190_26 > 0 and var_190_20 < var_190_26 then
					arg_187_1.talkMaxDuration = var_190_26

					if var_190_26 + var_190_19 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_26 + var_190_19
					end
				end

				arg_187_1.text_.text = var_190_23
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242046", "story_v_out_114242.awb") ~= 0 then
					local var_190_27 = manager.audio:GetVoiceLength("story_v_out_114242", "114242046", "story_v_out_114242.awb") / 1000

					if var_190_27 + var_190_19 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_27 + var_190_19
					end

					if var_190_22.prefab_name ~= "" and arg_187_1.actors_[var_190_22.prefab_name] ~= nil then
						local var_190_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_22.prefab_name].transform, "story_v_out_114242", "114242046", "story_v_out_114242.awb")

						arg_187_1:RecordAudio("114242046", var_190_28)
						arg_187_1:RecordAudio("114242046", var_190_28)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_114242", "114242046", "story_v_out_114242.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_114242", "114242046", "story_v_out_114242.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_29 = math.max(var_190_20, arg_187_1.talkMaxDuration)

			if var_190_19 <= arg_187_1.time_ and arg_187_1.time_ < var_190_19 + var_190_29 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_19) / var_190_29

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_19 + var_190_29 and arg_187_1.time_ < var_190_19 + var_190_29 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play114242047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 114242047
		arg_191_1.duration_ = 10.6

		local var_191_0 = {
			ja = 8.3,
			ko = 8.9,
			zh = 10.6,
			en = 8.633
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
				arg_191_0:Play114242048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10015"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps10015 == nil then
				arg_191_1.var_.actorSpriteComps10015 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 0.034

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps10015 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_194_1 then
							local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 0.5, var_194_3)

							iter_194_1.color = Color.New(var_194_4, var_194_4, var_194_4)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps10015 then
				local var_194_5 = 0.5

				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_194_3 then
						iter_194_3.color = Color.New(var_194_5, var_194_5, var_194_5)
					end
				end

				arg_191_1.var_.actorSpriteComps10015 = nil
			end

			local var_194_6 = arg_191_1.actors_["10018"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.actorSpriteComps10018 == nil then
				arg_191_1.var_.actorSpriteComps10018 = var_194_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_8 = 0.034

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.actorSpriteComps10018 then
					for iter_194_4, iter_194_5 in pairs(arg_191_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_194_5 then
							local var_194_10 = Mathf.Lerp(iter_194_5.color.r, 1, var_194_9)

							iter_194_5.color = Color.New(var_194_10, var_194_10, var_194_10)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps10018 then
				local var_194_11 = 1

				for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_194_7 then
						iter_194_7.color = Color.New(var_194_11, var_194_11, var_194_11)
					end
				end

				arg_191_1.var_.actorSpriteComps10018 = nil
			end

			local var_194_12 = arg_191_1.actors_["10018"].transform
			local var_194_13 = 0

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1.var_.moveOldPos10018 = var_194_12.localPosition
				var_194_12.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10018", 2)

				local var_194_14 = var_194_12.childCount

				for iter_194_8 = 0, var_194_14 - 1 do
					local var_194_15 = var_194_12:GetChild(iter_194_8)

					if var_194_15.name == "split_1" or not string.find(var_194_15.name, "split") then
						var_194_15.gameObject:SetActive(true)
					else
						var_194_15.gameObject:SetActive(false)
					end
				end
			end

			local var_194_16 = 0.001

			if var_194_13 <= arg_191_1.time_ and arg_191_1.time_ < var_194_13 + var_194_16 then
				local var_194_17 = (arg_191_1.time_ - var_194_13) / var_194_16
				local var_194_18 = Vector3.New(-390, -350, -180)

				var_194_12.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10018, var_194_18, var_194_17)
			end

			if arg_191_1.time_ >= var_194_13 + var_194_16 and arg_191_1.time_ < var_194_13 + var_194_16 + arg_194_0 then
				var_194_12.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_194_19 = 0
			local var_194_20 = 1.025

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_21 = arg_191_1:FormatText(StoryNameCfg[257].name)

				arg_191_1.leftNameTxt_.text = var_194_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_22 = arg_191_1:GetWordFromCfg(114242047)
				local var_194_23 = arg_191_1:FormatText(var_194_22.content)

				arg_191_1.text_.text = var_194_23

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_24 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242047", "story_v_out_114242.awb") ~= 0 then
					local var_194_27 = manager.audio:GetVoiceLength("story_v_out_114242", "114242047", "story_v_out_114242.awb") / 1000

					if var_194_27 + var_194_19 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_27 + var_194_19
					end

					if var_194_22.prefab_name ~= "" and arg_191_1.actors_[var_194_22.prefab_name] ~= nil then
						local var_194_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_22.prefab_name].transform, "story_v_out_114242", "114242047", "story_v_out_114242.awb")

						arg_191_1:RecordAudio("114242047", var_194_28)
						arg_191_1:RecordAudio("114242047", var_194_28)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_114242", "114242047", "story_v_out_114242.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_114242", "114242047", "story_v_out_114242.awb")
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
	Play114242048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 114242048
		arg_195_1.duration_ = 6.966

		local var_195_0 = {
			ja = 6.8,
			ko = 5.5,
			zh = 6.533,
			en = 6.966
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
				arg_195_0:Play114242049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10018"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.actorSpriteComps10018 == nil then
				arg_195_1.var_.actorSpriteComps10018 = var_198_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_2 = 0.034

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.actorSpriteComps10018 then
					for iter_198_0, iter_198_1 in pairs(arg_195_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_198_1 then
							local var_198_4 = Mathf.Lerp(iter_198_1.color.r, 0.5, var_198_3)

							iter_198_1.color = Color.New(var_198_4, var_198_4, var_198_4)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.actorSpriteComps10018 then
				local var_198_5 = 0.5

				for iter_198_2, iter_198_3 in pairs(arg_195_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_198_3 then
						iter_198_3.color = Color.New(var_198_5, var_198_5, var_198_5)
					end
				end

				arg_195_1.var_.actorSpriteComps10018 = nil
			end

			local var_198_6 = arg_195_1.actors_["10015"]
			local var_198_7 = 0

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 and arg_195_1.var_.actorSpriteComps10015 == nil then
				arg_195_1.var_.actorSpriteComps10015 = var_198_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_8 = 0.034

			if var_198_7 <= arg_195_1.time_ and arg_195_1.time_ < var_198_7 + var_198_8 then
				local var_198_9 = (arg_195_1.time_ - var_198_7) / var_198_8

				if arg_195_1.var_.actorSpriteComps10015 then
					for iter_198_4, iter_198_5 in pairs(arg_195_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_198_5 then
							local var_198_10 = Mathf.Lerp(iter_198_5.color.r, 1, var_198_9)

							iter_198_5.color = Color.New(var_198_10, var_198_10, var_198_10)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_7 + var_198_8 and arg_195_1.time_ < var_198_7 + var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps10015 then
				local var_198_11 = 1

				for iter_198_6, iter_198_7 in pairs(arg_195_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_198_7 then
						iter_198_7.color = Color.New(var_198_11, var_198_11, var_198_11)
					end
				end

				arg_195_1.var_.actorSpriteComps10015 = nil
			end

			local var_198_12 = 0
			local var_198_13 = 0.675

			if var_198_12 < arg_195_1.time_ and arg_195_1.time_ <= var_198_12 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_14 = arg_195_1:FormatText(StoryNameCfg[208].name)

				arg_195_1.leftNameTxt_.text = var_198_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_15 = arg_195_1:GetWordFromCfg(114242048)
				local var_198_16 = arg_195_1:FormatText(var_198_15.content)

				arg_195_1.text_.text = var_198_16

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_17 = 27
				local var_198_18 = utf8.len(var_198_16)
				local var_198_19 = var_198_17 <= 0 and var_198_13 or var_198_13 * (var_198_18 / var_198_17)

				if var_198_19 > 0 and var_198_13 < var_198_19 then
					arg_195_1.talkMaxDuration = var_198_19

					if var_198_19 + var_198_12 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_19 + var_198_12
					end
				end

				arg_195_1.text_.text = var_198_16
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242048", "story_v_out_114242.awb") ~= 0 then
					local var_198_20 = manager.audio:GetVoiceLength("story_v_out_114242", "114242048", "story_v_out_114242.awb") / 1000

					if var_198_20 + var_198_12 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_20 + var_198_12
					end

					if var_198_15.prefab_name ~= "" and arg_195_1.actors_[var_198_15.prefab_name] ~= nil then
						local var_198_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_15.prefab_name].transform, "story_v_out_114242", "114242048", "story_v_out_114242.awb")

						arg_195_1:RecordAudio("114242048", var_198_21)
						arg_195_1:RecordAudio("114242048", var_198_21)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_114242", "114242048", "story_v_out_114242.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_114242", "114242048", "story_v_out_114242.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_22 = math.max(var_198_13, arg_195_1.talkMaxDuration)

			if var_198_12 <= arg_195_1.time_ and arg_195_1.time_ < var_198_12 + var_198_22 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_12) / var_198_22

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_12 + var_198_22 and arg_195_1.time_ < var_198_12 + var_198_22 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play114242049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 114242049
		arg_199_1.duration_ = 9.265999999999

		local var_199_0 = {
			ja = 6.332999999999,
			ko = 7.999999999999,
			zh = 9.265999999999,
			en = 7.532999999999
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
				arg_199_0:Play114242050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				local var_202_1 = manager.ui.mainCamera.transform.localPosition
				local var_202_2 = Vector3.New(0, 0, 10) + Vector3.New(var_202_1.x, var_202_1.y, 0)
				local var_202_3 = arg_199_1.bgs_.F01a

				var_202_3.transform.localPosition = var_202_2
				var_202_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_202_4 = var_202_3:GetComponent("SpriteRenderer")

				if var_202_4 and var_202_4.sprite then
					local var_202_5 = (var_202_3.transform.localPosition - var_202_1).z
					local var_202_6 = manager.ui.mainCameraCom_
					local var_202_7 = 2 * var_202_5 * Mathf.Tan(var_202_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_202_8 = var_202_7 * var_202_6.aspect
					local var_202_9 = var_202_4.sprite.bounds.size.x
					local var_202_10 = var_202_4.sprite.bounds.size.y
					local var_202_11 = var_202_8 / var_202_9
					local var_202_12 = var_202_7 / var_202_10
					local var_202_13 = var_202_12 < var_202_11 and var_202_11 or var_202_12

					var_202_3.transform.localScale = Vector3.New(var_202_13, var_202_13, 0)
				end

				for iter_202_0, iter_202_1 in pairs(arg_199_1.bgs_) do
					if iter_202_0 ~= "F01a" then
						iter_202_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_202_14 = arg_199_1.actors_["10015"].transform
			local var_202_15 = 0

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 then
				arg_199_1.var_.moveOldPos10015 = var_202_14.localPosition
				var_202_14.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10015", 7)

				local var_202_16 = var_202_14.childCount

				for iter_202_2 = 0, var_202_16 - 1 do
					local var_202_17 = var_202_14:GetChild(iter_202_2)

					if var_202_17.name == "split_5" or not string.find(var_202_17.name, "split") then
						var_202_17.gameObject:SetActive(true)
					else
						var_202_17.gameObject:SetActive(false)
					end
				end
			end

			local var_202_18 = 0.001

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_18 then
				local var_202_19 = (arg_199_1.time_ - var_202_15) / var_202_18
				local var_202_20 = Vector3.New(0, -2000, 450)

				var_202_14.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10015, var_202_20, var_202_19)
			end

			if arg_199_1.time_ >= var_202_15 + var_202_18 and arg_199_1.time_ < var_202_15 + var_202_18 + arg_202_0 then
				var_202_14.localPosition = Vector3.New(0, -2000, 450)
			end

			local var_202_21 = arg_199_1.actors_["10018"].transform
			local var_202_22 = 0

			if var_202_22 < arg_199_1.time_ and arg_199_1.time_ <= var_202_22 + arg_202_0 then
				arg_199_1.var_.moveOldPos10018 = var_202_21.localPosition
				var_202_21.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10018", 7)

				local var_202_23 = var_202_21.childCount

				for iter_202_3 = 0, var_202_23 - 1 do
					local var_202_24 = var_202_21:GetChild(iter_202_3)

					if var_202_24.name == "split_1" or not string.find(var_202_24.name, "split") then
						var_202_24.gameObject:SetActive(true)
					else
						var_202_24.gameObject:SetActive(false)
					end
				end
			end

			local var_202_25 = 0.001

			if var_202_22 <= arg_199_1.time_ and arg_199_1.time_ < var_202_22 + var_202_25 then
				local var_202_26 = (arg_199_1.time_ - var_202_22) / var_202_25
				local var_202_27 = Vector3.New(0, -2000, -180)

				var_202_21.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10018, var_202_27, var_202_26)
			end

			if arg_199_1.time_ >= var_202_22 + var_202_25 and arg_199_1.time_ < var_202_22 + var_202_25 + arg_202_0 then
				var_202_21.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_202_28 = 0

			if var_202_28 < arg_199_1.time_ and arg_199_1.time_ <= var_202_28 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_29 = 2

			if var_202_28 <= arg_199_1.time_ and arg_199_1.time_ < var_202_28 + var_202_29 then
				local var_202_30 = (arg_199_1.time_ - var_202_28) / var_202_29
				local var_202_31 = Color.New(1, 1, 1)

				var_202_31.a = Mathf.Lerp(1, 0, var_202_30)
				arg_199_1.mask_.color = var_202_31
			end

			if arg_199_1.time_ >= var_202_28 + var_202_29 and arg_199_1.time_ < var_202_28 + var_202_29 + arg_202_0 then
				local var_202_32 = Color.New(1, 1, 1)
				local var_202_33 = 0

				arg_199_1.mask_.enabled = false
				var_202_32.a = var_202_33
				arg_199_1.mask_.color = var_202_32
			end

			local var_202_34 = 2

			if var_202_34 < arg_199_1.time_ and arg_199_1.time_ <= var_202_34 + arg_202_0 then
				arg_199_1.var_.shakeOldPos = var_202_21.localPosition
			end

			local var_202_35 = 0.6

			if var_202_34 <= arg_199_1.time_ and arg_199_1.time_ < var_202_34 + var_202_35 then
				local var_202_36 = (arg_199_1.time_ - var_202_34) / 0
				local var_202_37, var_202_38 = math.modf(var_202_36)

				var_202_21.localPosition = Vector3.New(var_202_38 * 0, var_202_38 * 0, var_202_38 * 0) + arg_199_1.var_.shakeOldPos
			end

			if arg_199_1.time_ >= var_202_34 + var_202_35 and arg_199_1.time_ < var_202_34 + var_202_35 + arg_202_0 then
				var_202_21.localPosition = arg_199_1.var_.shakeOldPos
			end

			if arg_199_1.frameCnt_ <= 1 then
				arg_199_1.dialog_:SetActive(false)
			end

			local var_202_39 = 1.999999999999
			local var_202_40 = 0.475

			if var_202_39 < arg_199_1.time_ and arg_199_1.time_ <= var_202_39 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0

				arg_199_1.dialog_:SetActive(true)

				local var_202_41 = LeanTween.value(arg_199_1.dialog_, 0, 1, 0.3)

				var_202_41:setOnUpdate(LuaHelper.FloatAction(function(arg_203_0)
					arg_199_1.dialogCg_.alpha = arg_203_0
				end))
				var_202_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_199_1.dialog_)
					var_202_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_199_1.duration_ = arg_199_1.duration_ + 0.3

				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_42 = arg_199_1:FormatText(StoryNameCfg[257].name)

				arg_199_1.leftNameTxt_.text = var_202_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, true)
				arg_199_1.iconController_:SetSelectedState("hero")

				arg_199_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10018")

				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_43 = arg_199_1:GetWordFromCfg(114242049)
				local var_202_44 = arg_199_1:FormatText(var_202_43.content)

				arg_199_1.text_.text = var_202_44

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_45 = 19
				local var_202_46 = utf8.len(var_202_44)
				local var_202_47 = var_202_45 <= 0 and var_202_40 or var_202_40 * (var_202_46 / var_202_45)

				if var_202_47 > 0 and var_202_40 < var_202_47 then
					arg_199_1.talkMaxDuration = var_202_47
					var_202_39 = var_202_39 + 0.3

					if var_202_47 + var_202_39 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_47 + var_202_39
					end
				end

				arg_199_1.text_.text = var_202_44
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242049", "story_v_out_114242.awb") ~= 0 then
					local var_202_48 = manager.audio:GetVoiceLength("story_v_out_114242", "114242049", "story_v_out_114242.awb") / 1000

					if var_202_48 + var_202_39 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_48 + var_202_39
					end

					if var_202_43.prefab_name ~= "" and arg_199_1.actors_[var_202_43.prefab_name] ~= nil then
						local var_202_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_43.prefab_name].transform, "story_v_out_114242", "114242049", "story_v_out_114242.awb")

						arg_199_1:RecordAudio("114242049", var_202_49)
						arg_199_1:RecordAudio("114242049", var_202_49)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_114242", "114242049", "story_v_out_114242.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_114242", "114242049", "story_v_out_114242.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_50 = var_202_39 + 0.3
			local var_202_51 = math.max(var_202_40, arg_199_1.talkMaxDuration)

			if var_202_50 <= arg_199_1.time_ and arg_199_1.time_ < var_202_50 + var_202_51 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_50) / var_202_51

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_50 + var_202_51 and arg_199_1.time_ < var_202_50 + var_202_51 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play114242050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 114242050
		arg_205_1.duration_ = 5.3

		local var_205_0 = {
			ja = 3.566,
			ko = 5.066,
			zh = 5.3,
			en = 3.933
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
				arg_205_0:Play114242051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10018"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos10018 = var_208_0.localPosition
				var_208_0.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("10018", 3)

				local var_208_2 = var_208_0.childCount

				for iter_208_0 = 0, var_208_2 - 1 do
					local var_208_3 = var_208_0:GetChild(iter_208_0)

					if var_208_3.name == "split_5" or not string.find(var_208_3.name, "split") then
						var_208_3.gameObject:SetActive(true)
					else
						var_208_3.gameObject:SetActive(false)
					end
				end
			end

			local var_208_4 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_4 then
				local var_208_5 = (arg_205_1.time_ - var_208_1) / var_208_4
				local var_208_6 = Vector3.New(0, -350, -180)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10018, var_208_6, var_208_5)
			end

			if arg_205_1.time_ >= var_208_1 + var_208_4 and arg_205_1.time_ < var_208_1 + var_208_4 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_208_7 = arg_205_1.actors_["10018"]
			local var_208_8 = 0

			if var_208_8 < arg_205_1.time_ and arg_205_1.time_ <= var_208_8 + arg_208_0 and arg_205_1.var_.actorSpriteComps10018 == nil then
				arg_205_1.var_.actorSpriteComps10018 = var_208_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_9 = 0.034

			if var_208_8 <= arg_205_1.time_ and arg_205_1.time_ < var_208_8 + var_208_9 then
				local var_208_10 = (arg_205_1.time_ - var_208_8) / var_208_9

				if arg_205_1.var_.actorSpriteComps10018 then
					for iter_208_1, iter_208_2 in pairs(arg_205_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_208_2 then
							local var_208_11 = Mathf.Lerp(iter_208_2.color.r, 1, var_208_10)

							iter_208_2.color = Color.New(var_208_11, var_208_11, var_208_11)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_8 + var_208_9 and arg_205_1.time_ < var_208_8 + var_208_9 + arg_208_0 and arg_205_1.var_.actorSpriteComps10018 then
				local var_208_12 = 1

				for iter_208_3, iter_208_4 in pairs(arg_205_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_208_4 then
						iter_208_4.color = Color.New(var_208_12, var_208_12, var_208_12)
					end
				end

				arg_205_1.var_.actorSpriteComps10018 = nil
			end

			local var_208_13 = arg_205_1.actors_["10018"]
			local var_208_14 = 0

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 then
				local var_208_15 = var_208_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_208_15 then
					arg_205_1.var_.alphaOldValue10018 = var_208_15.alpha
					arg_205_1.var_.characterEffect10018 = var_208_15
				end

				arg_205_1.var_.alphaOldValue10018 = 0
			end

			local var_208_16 = 0.5

			if var_208_14 <= arg_205_1.time_ and arg_205_1.time_ < var_208_14 + var_208_16 then
				local var_208_17 = (arg_205_1.time_ - var_208_14) / var_208_16
				local var_208_18 = Mathf.Lerp(arg_205_1.var_.alphaOldValue10018, 1, var_208_17)

				if arg_205_1.var_.characterEffect10018 then
					arg_205_1.var_.characterEffect10018.alpha = var_208_18
				end
			end

			if arg_205_1.time_ >= var_208_14 + var_208_16 and arg_205_1.time_ < var_208_14 + var_208_16 + arg_208_0 and arg_205_1.var_.characterEffect10018 then
				arg_205_1.var_.characterEffect10018.alpha = 1
			end

			local var_208_19 = 0
			local var_208_20 = 0.475

			if var_208_19 < arg_205_1.time_ and arg_205_1.time_ <= var_208_19 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_21 = arg_205_1:FormatText(StoryNameCfg[257].name)

				arg_205_1.leftNameTxt_.text = var_208_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_22 = arg_205_1:GetWordFromCfg(114242050)
				local var_208_23 = arg_205_1:FormatText(var_208_22.content)

				arg_205_1.text_.text = var_208_23

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_24 = 19
				local var_208_25 = utf8.len(var_208_23)
				local var_208_26 = var_208_24 <= 0 and var_208_20 or var_208_20 * (var_208_25 / var_208_24)

				if var_208_26 > 0 and var_208_20 < var_208_26 then
					arg_205_1.talkMaxDuration = var_208_26

					if var_208_26 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_26 + var_208_19
					end
				end

				arg_205_1.text_.text = var_208_23
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242050", "story_v_out_114242.awb") ~= 0 then
					local var_208_27 = manager.audio:GetVoiceLength("story_v_out_114242", "114242050", "story_v_out_114242.awb") / 1000

					if var_208_27 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_27 + var_208_19
					end

					if var_208_22.prefab_name ~= "" and arg_205_1.actors_[var_208_22.prefab_name] ~= nil then
						local var_208_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_22.prefab_name].transform, "story_v_out_114242", "114242050", "story_v_out_114242.awb")

						arg_205_1:RecordAudio("114242050", var_208_28)
						arg_205_1:RecordAudio("114242050", var_208_28)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_114242", "114242050", "story_v_out_114242.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_114242", "114242050", "story_v_out_114242.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_29 = math.max(var_208_20, arg_205_1.talkMaxDuration)

			if var_208_19 <= arg_205_1.time_ and arg_205_1.time_ < var_208_19 + var_208_29 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_19) / var_208_29

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_19 + var_208_29 and arg_205_1.time_ < var_208_19 + var_208_29 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play114242051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 114242051
		arg_209_1.duration_ = 4.833

		local var_209_0 = {
			ja = 3.766,
			ko = 4.833,
			zh = 4.6,
			en = 4.3
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
				arg_209_0:Play114242052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10018"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.actorSpriteComps10018 == nil then
				arg_209_1.var_.actorSpriteComps10018 = var_212_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_2 = 0.034

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.actorSpriteComps10018 then
					for iter_212_0, iter_212_1 in pairs(arg_209_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_212_1 then
							local var_212_4 = Mathf.Lerp(iter_212_1.color.r, 0.5, var_212_3)

							iter_212_1.color = Color.New(var_212_4, var_212_4, var_212_4)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.actorSpriteComps10018 then
				local var_212_5 = 0.5

				for iter_212_2, iter_212_3 in pairs(arg_209_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_212_3 then
						iter_212_3.color = Color.New(var_212_5, var_212_5, var_212_5)
					end
				end

				arg_209_1.var_.actorSpriteComps10018 = nil
			end

			local var_212_6 = 0
			local var_212_7 = 0.475

			if var_212_6 < arg_209_1.time_ and arg_209_1.time_ <= var_212_6 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_8 = arg_209_1:FormatText(StoryNameCfg[214].name)

				arg_209_1.leftNameTxt_.text = var_212_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, true)
				arg_209_1.iconController_:SetSelectedState("hero")

				arg_209_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6046")

				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_9 = arg_209_1:GetWordFromCfg(114242051)
				local var_212_10 = arg_209_1:FormatText(var_212_9.content)

				arg_209_1.text_.text = var_212_10

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_11 = 19
				local var_212_12 = utf8.len(var_212_10)
				local var_212_13 = var_212_11 <= 0 and var_212_7 or var_212_7 * (var_212_12 / var_212_11)

				if var_212_13 > 0 and var_212_7 < var_212_13 then
					arg_209_1.talkMaxDuration = var_212_13

					if var_212_13 + var_212_6 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_13 + var_212_6
					end
				end

				arg_209_1.text_.text = var_212_10
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242051", "story_v_out_114242.awb") ~= 0 then
					local var_212_14 = manager.audio:GetVoiceLength("story_v_out_114242", "114242051", "story_v_out_114242.awb") / 1000

					if var_212_14 + var_212_6 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_14 + var_212_6
					end

					if var_212_9.prefab_name ~= "" and arg_209_1.actors_[var_212_9.prefab_name] ~= nil then
						local var_212_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_9.prefab_name].transform, "story_v_out_114242", "114242051", "story_v_out_114242.awb")

						arg_209_1:RecordAudio("114242051", var_212_15)
						arg_209_1:RecordAudio("114242051", var_212_15)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_114242", "114242051", "story_v_out_114242.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_114242", "114242051", "story_v_out_114242.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_16 = math.max(var_212_7, arg_209_1.talkMaxDuration)

			if var_212_6 <= arg_209_1.time_ and arg_209_1.time_ < var_212_6 + var_212_16 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_6) / var_212_16

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_6 + var_212_16 and arg_209_1.time_ < var_212_6 + var_212_16 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play114242052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 114242052
		arg_213_1.duration_ = 3.566

		local var_213_0 = {
			ja = 3.533,
			ko = 3.566,
			zh = 2.866,
			en = 3.366
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
				arg_213_0:Play114242053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.225

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[215].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, true)
				arg_213_1.iconController_:SetSelectedState("hero")

				arg_213_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6045")

				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(114242052)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242052", "story_v_out_114242.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242052", "story_v_out_114242.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_114242", "114242052", "story_v_out_114242.awb")

						arg_213_1:RecordAudio("114242052", var_216_9)
						arg_213_1:RecordAudio("114242052", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_114242", "114242052", "story_v_out_114242.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_114242", "114242052", "story_v_out_114242.awb")
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
	Play114242053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 114242053
		arg_217_1.duration_ = 3.033

		local var_217_0 = {
			ja = 3.033,
			ko = 2.033,
			zh = 2.433,
			en = 2.033
		}
		local var_217_1 = manager.audio:GetLocalizationFlag()

		if var_217_0[var_217_1] ~= nil then
			arg_217_1.duration_ = var_217_0[var_217_1]
		end

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play114242054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.175

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[233].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(114242053)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 7
				local var_220_6 = utf8.len(var_220_4)
				local var_220_7 = var_220_5 <= 0 and var_220_1 or var_220_1 * (var_220_6 / var_220_5)

				if var_220_7 > 0 and var_220_1 < var_220_7 then
					arg_217_1.talkMaxDuration = var_220_7

					if var_220_7 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_7 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_4
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242053", "story_v_out_114242.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242053", "story_v_out_114242.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_114242", "114242053", "story_v_out_114242.awb")

						arg_217_1:RecordAudio("114242053", var_220_9)
						arg_217_1:RecordAudio("114242053", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_114242", "114242053", "story_v_out_114242.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_114242", "114242053", "story_v_out_114242.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_10 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_10 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_10

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_10 and arg_217_1.time_ < var_220_0 + var_220_10 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play114242054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 114242054
		arg_221_1.duration_ = 12.733

		local var_221_0 = {
			ja = 9.266,
			ko = 10.433,
			zh = 12.733,
			en = 10.566
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play114242055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10018"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.actorSpriteComps10018 == nil then
				arg_221_1.var_.actorSpriteComps10018 = var_224_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_2 = 0.034

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.actorSpriteComps10018 then
					for iter_224_0, iter_224_1 in pairs(arg_221_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_224_1 then
							local var_224_4 = Mathf.Lerp(iter_224_1.color.r, 1, var_224_3)

							iter_224_1.color = Color.New(var_224_4, var_224_4, var_224_4)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.actorSpriteComps10018 then
				local var_224_5 = 1

				for iter_224_2, iter_224_3 in pairs(arg_221_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_224_3 then
						iter_224_3.color = Color.New(var_224_5, var_224_5, var_224_5)
					end
				end

				arg_221_1.var_.actorSpriteComps10018 = nil
			end

			local var_224_6 = arg_221_1.actors_["10018"].transform
			local var_224_7 = 0

			if var_224_7 < arg_221_1.time_ and arg_221_1.time_ <= var_224_7 + arg_224_0 then
				arg_221_1.var_.moveOldPos10018 = var_224_6.localPosition
				var_224_6.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("10018", 3)

				local var_224_8 = var_224_6.childCount

				for iter_224_4 = 0, var_224_8 - 1 do
					local var_224_9 = var_224_6:GetChild(iter_224_4)

					if var_224_9.name == "split_1" or not string.find(var_224_9.name, "split") then
						var_224_9.gameObject:SetActive(true)
					else
						var_224_9.gameObject:SetActive(false)
					end
				end
			end

			local var_224_10 = 0.001

			if var_224_7 <= arg_221_1.time_ and arg_221_1.time_ < var_224_7 + var_224_10 then
				local var_224_11 = (arg_221_1.time_ - var_224_7) / var_224_10
				local var_224_12 = Vector3.New(0, -350, -180)

				var_224_6.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10018, var_224_12, var_224_11)
			end

			if arg_221_1.time_ >= var_224_7 + var_224_10 and arg_221_1.time_ < var_224_7 + var_224_10 + arg_224_0 then
				var_224_6.localPosition = Vector3.New(0, -350, -180)
			end

			local var_224_13 = 0
			local var_224_14 = 1.15

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_15 = arg_221_1:FormatText(StoryNameCfg[257].name)

				arg_221_1.leftNameTxt_.text = var_224_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_16 = arg_221_1:GetWordFromCfg(114242054)
				local var_224_17 = arg_221_1:FormatText(var_224_16.content)

				arg_221_1.text_.text = var_224_17

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_18 = 46
				local var_224_19 = utf8.len(var_224_17)
				local var_224_20 = var_224_18 <= 0 and var_224_14 or var_224_14 * (var_224_19 / var_224_18)

				if var_224_20 > 0 and var_224_14 < var_224_20 then
					arg_221_1.talkMaxDuration = var_224_20

					if var_224_20 + var_224_13 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_20 + var_224_13
					end
				end

				arg_221_1.text_.text = var_224_17
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242054", "story_v_out_114242.awb") ~= 0 then
					local var_224_21 = manager.audio:GetVoiceLength("story_v_out_114242", "114242054", "story_v_out_114242.awb") / 1000

					if var_224_21 + var_224_13 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_21 + var_224_13
					end

					if var_224_16.prefab_name ~= "" and arg_221_1.actors_[var_224_16.prefab_name] ~= nil then
						local var_224_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_16.prefab_name].transform, "story_v_out_114242", "114242054", "story_v_out_114242.awb")

						arg_221_1:RecordAudio("114242054", var_224_22)
						arg_221_1:RecordAudio("114242054", var_224_22)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_114242", "114242054", "story_v_out_114242.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_114242", "114242054", "story_v_out_114242.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_23 = math.max(var_224_14, arg_221_1.talkMaxDuration)

			if var_224_13 <= arg_221_1.time_ and arg_221_1.time_ < var_224_13 + var_224_23 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_13) / var_224_23

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_13 + var_224_23 and arg_221_1.time_ < var_224_13 + var_224_23 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play114242055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 114242055
		arg_225_1.duration_ = 4.9

		local var_225_0 = {
			ja = 3.9,
			ko = 4.9,
			zh = 4.166,
			en = 3.8
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
				arg_225_0:Play114242056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.45

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[257].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(114242055)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 18
				local var_228_6 = utf8.len(var_228_4)
				local var_228_7 = var_228_5 <= 0 and var_228_1 or var_228_1 * (var_228_6 / var_228_5)

				if var_228_7 > 0 and var_228_1 < var_228_7 then
					arg_225_1.talkMaxDuration = var_228_7

					if var_228_7 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_7 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_4
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242055", "story_v_out_114242.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242055", "story_v_out_114242.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_114242", "114242055", "story_v_out_114242.awb")

						arg_225_1:RecordAudio("114242055", var_228_9)
						arg_225_1:RecordAudio("114242055", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_114242", "114242055", "story_v_out_114242.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_114242", "114242055", "story_v_out_114242.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_10 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_10 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_10

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_10 and arg_225_1.time_ < var_228_0 + var_228_10 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play114242056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 114242056
		arg_229_1.duration_ = 1.366

		local var_229_0 = {
			ja = 1.366,
			ko = 1.1,
			zh = 0.999999999999,
			en = 1.066
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
				arg_229_0:Play114242057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10018"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos10018 = var_232_0.localPosition
				var_232_0.localScale = Vector3.New(1, 1, 1)

				arg_229_1:CheckSpriteTmpPos("10018", 2)

				local var_232_2 = var_232_0.childCount

				for iter_232_0 = 0, var_232_2 - 1 do
					local var_232_3 = var_232_0:GetChild(iter_232_0)

					if var_232_3.name == "split_1" or not string.find(var_232_3.name, "split") then
						var_232_3.gameObject:SetActive(true)
					else
						var_232_3.gameObject:SetActive(false)
					end
				end
			end

			local var_232_4 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_4 then
				local var_232_5 = (arg_229_1.time_ - var_232_1) / var_232_4
				local var_232_6 = Vector3.New(-390, -350, -180)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10018, var_232_6, var_232_5)
			end

			if arg_229_1.time_ >= var_232_1 + var_232_4 and arg_229_1.time_ < var_232_1 + var_232_4 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_232_7 = arg_229_1.actors_["104201_1"].transform
			local var_232_8 = 0

			if var_232_8 < arg_229_1.time_ and arg_229_1.time_ <= var_232_8 + arg_232_0 then
				arg_229_1.var_.moveOldPos104201_1 = var_232_7.localPosition
				var_232_7.localScale = Vector3.New(1, 1, 1)

				arg_229_1:CheckSpriteTmpPos("104201_1", 4)
			end

			local var_232_9 = 0.001

			if var_232_8 <= arg_229_1.time_ and arg_229_1.time_ < var_232_8 + var_232_9 then
				local var_232_10 = (arg_229_1.time_ - var_232_8) / var_232_9
				local var_232_11 = Vector3.New(390, -350, -180)

				var_232_7.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos104201_1, var_232_11, var_232_10)
			end

			if arg_229_1.time_ >= var_232_8 + var_232_9 and arg_229_1.time_ < var_232_8 + var_232_9 + arg_232_0 then
				var_232_7.localPosition = Vector3.New(390, -350, -180)
			end

			local var_232_12 = arg_229_1.actors_["10018"]
			local var_232_13 = 0

			if var_232_13 < arg_229_1.time_ and arg_229_1.time_ <= var_232_13 + arg_232_0 and arg_229_1.var_.actorSpriteComps10018 == nil then
				arg_229_1.var_.actorSpriteComps10018 = var_232_12:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_14 = 0.034

			if var_232_13 <= arg_229_1.time_ and arg_229_1.time_ < var_232_13 + var_232_14 then
				local var_232_15 = (arg_229_1.time_ - var_232_13) / var_232_14

				if arg_229_1.var_.actorSpriteComps10018 then
					for iter_232_1, iter_232_2 in pairs(arg_229_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_232_2 then
							local var_232_16 = Mathf.Lerp(iter_232_2.color.r, 0.5, var_232_15)

							iter_232_2.color = Color.New(var_232_16, var_232_16, var_232_16)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_13 + var_232_14 and arg_229_1.time_ < var_232_13 + var_232_14 + arg_232_0 and arg_229_1.var_.actorSpriteComps10018 then
				local var_232_17 = 0.5

				for iter_232_3, iter_232_4 in pairs(arg_229_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_232_4 then
						iter_232_4.color = Color.New(var_232_17, var_232_17, var_232_17)
					end
				end

				arg_229_1.var_.actorSpriteComps10018 = nil
			end

			local var_232_18 = arg_229_1.actors_["104201_1"]
			local var_232_19 = 0

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				local var_232_20 = var_232_18:GetComponent("Image")

				if var_232_20 then
					arg_229_1.var_.highlightMatValue104201_1 = var_232_20
				end
			end

			local var_232_21 = 0.034

			if var_232_19 <= arg_229_1.time_ and arg_229_1.time_ < var_232_19 + var_232_21 then
				local var_232_22 = (arg_229_1.time_ - var_232_19) / var_232_21

				if arg_229_1.var_.highlightMatValue104201_1 then
					local var_232_23 = Mathf.Lerp(0.5, 1, var_232_22)
					local var_232_24 = arg_229_1.var_.highlightMatValue104201_1
					local var_232_25 = var_232_24.color

					var_232_25.r = var_232_23
					var_232_25.g = var_232_23
					var_232_25.b = var_232_23
					var_232_24.color = var_232_25
				end
			end

			if arg_229_1.time_ >= var_232_19 + var_232_21 and arg_229_1.time_ < var_232_19 + var_232_21 + arg_232_0 and arg_229_1.var_.highlightMatValue104201_1 then
				local var_232_26 = 1

				var_232_18.transform:SetSiblingIndex(1)

				local var_232_27 = arg_229_1.var_.highlightMatValue104201_1
				local var_232_28 = var_232_27.color

				var_232_28.r = var_232_26
				var_232_28.g = var_232_26
				var_232_28.b = var_232_26
				var_232_27.color = var_232_28
			end

			local var_232_29 = arg_229_1.actors_["10018"]
			local var_232_30 = 0

			if var_232_30 < arg_229_1.time_ and arg_229_1.time_ <= var_232_30 + arg_232_0 then
				local var_232_31 = var_232_29:GetComponentInChildren(typeof(CanvasGroup))

				if var_232_31 then
					arg_229_1.var_.alphaOldValue10018 = var_232_31.alpha
					arg_229_1.var_.characterEffect10018 = var_232_31
				end

				arg_229_1.var_.alphaOldValue10018 = 0
			end

			local var_232_32 = 0.5

			if var_232_30 <= arg_229_1.time_ and arg_229_1.time_ < var_232_30 + var_232_32 then
				local var_232_33 = (arg_229_1.time_ - var_232_30) / var_232_32
				local var_232_34 = Mathf.Lerp(arg_229_1.var_.alphaOldValue10018, 1, var_232_33)

				if arg_229_1.var_.characterEffect10018 then
					arg_229_1.var_.characterEffect10018.alpha = var_232_34
				end
			end

			if arg_229_1.time_ >= var_232_30 + var_232_32 and arg_229_1.time_ < var_232_30 + var_232_32 + arg_232_0 and arg_229_1.var_.characterEffect10018 then
				arg_229_1.var_.characterEffect10018.alpha = 1
			end

			local var_232_35 = arg_229_1.actors_["104201_1"]
			local var_232_36 = 0

			if var_232_36 < arg_229_1.time_ and arg_229_1.time_ <= var_232_36 + arg_232_0 then
				local var_232_37 = var_232_35:GetComponent("Image")

				if var_232_37 then
					arg_229_1.var_.alphaMatValue104201_1 = var_232_37
					arg_229_1.var_.alphaOldValue104201_1 = var_232_37.color.a
				end

				arg_229_1.var_.alphaOldValue104201_1 = 0
			end

			local var_232_38 = 0.5

			if var_232_36 <= arg_229_1.time_ and arg_229_1.time_ < var_232_36 + var_232_38 then
				local var_232_39 = (arg_229_1.time_ - var_232_36) / var_232_38
				local var_232_40 = Mathf.Lerp(arg_229_1.var_.alphaOldValue104201_1, 1, var_232_39)

				if arg_229_1.var_.alphaMatValue104201_1 then
					local var_232_41 = arg_229_1.var_.alphaMatValue104201_1.color

					var_232_41.a = var_232_40
					arg_229_1.var_.alphaMatValue104201_1.color = var_232_41
				end
			end

			if arg_229_1.time_ >= var_232_36 + var_232_38 and arg_229_1.time_ < var_232_36 + var_232_38 + arg_232_0 and arg_229_1.var_.alphaMatValue104201_1 then
				local var_232_42 = arg_229_1.var_.alphaMatValue104201_1
				local var_232_43 = var_232_42.color

				var_232_43.a = 1
				var_232_42.color = var_232_43
			end

			local var_232_44 = 0
			local var_232_45 = 0.075

			if var_232_44 < arg_229_1.time_ and arg_229_1.time_ <= var_232_44 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_46 = arg_229_1:FormatText(StoryNameCfg[205].name)

				arg_229_1.leftNameTxt_.text = var_232_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_47 = arg_229_1:GetWordFromCfg(114242056)
				local var_232_48 = arg_229_1:FormatText(var_232_47.content)

				arg_229_1.text_.text = var_232_48

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_49 = 3
				local var_232_50 = utf8.len(var_232_48)
				local var_232_51 = var_232_49 <= 0 and var_232_45 or var_232_45 * (var_232_50 / var_232_49)

				if var_232_51 > 0 and var_232_45 < var_232_51 then
					arg_229_1.talkMaxDuration = var_232_51

					if var_232_51 + var_232_44 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_51 + var_232_44
					end
				end

				arg_229_1.text_.text = var_232_48
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242056", "story_v_out_114242.awb") ~= 0 then
					local var_232_52 = manager.audio:GetVoiceLength("story_v_out_114242", "114242056", "story_v_out_114242.awb") / 1000

					if var_232_52 + var_232_44 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_52 + var_232_44
					end

					if var_232_47.prefab_name ~= "" and arg_229_1.actors_[var_232_47.prefab_name] ~= nil then
						local var_232_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_47.prefab_name].transform, "story_v_out_114242", "114242056", "story_v_out_114242.awb")

						arg_229_1:RecordAudio("114242056", var_232_53)
						arg_229_1:RecordAudio("114242056", var_232_53)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_114242", "114242056", "story_v_out_114242.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_114242", "114242056", "story_v_out_114242.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_54 = math.max(var_232_45, arg_229_1.talkMaxDuration)

			if var_232_44 <= arg_229_1.time_ and arg_229_1.time_ < var_232_44 + var_232_54 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_44) / var_232_54

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_44 + var_232_54 and arg_229_1.time_ < var_232_44 + var_232_54 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play114242057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 114242057
		arg_233_1.duration_ = 0.999999999999

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play114242058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10018"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.actorSpriteComps10018 == nil then
				arg_233_1.var_.actorSpriteComps10018 = var_236_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_2 = 0.034

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.actorSpriteComps10018 then
					for iter_236_0, iter_236_1 in pairs(arg_233_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_236_1 then
							local var_236_4 = Mathf.Lerp(iter_236_1.color.r, 1, var_236_3)

							iter_236_1.color = Color.New(var_236_4, var_236_4, var_236_4)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.actorSpriteComps10018 then
				local var_236_5 = 1

				for iter_236_2, iter_236_3 in pairs(arg_233_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_236_3 then
						iter_236_3.color = Color.New(var_236_5, var_236_5, var_236_5)
					end
				end

				arg_233_1.var_.actorSpriteComps10018 = nil
			end

			local var_236_6 = arg_233_1.actors_["104201_1"]
			local var_236_7 = 0

			if var_236_7 < arg_233_1.time_ and arg_233_1.time_ <= var_236_7 + arg_236_0 then
				local var_236_8 = var_236_6:GetComponent("Image")

				if var_236_8 then
					arg_233_1.var_.highlightMatValue104201_1 = var_236_8
				end
			end

			local var_236_9 = 0.034

			if var_236_7 <= arg_233_1.time_ and arg_233_1.time_ < var_236_7 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_7) / var_236_9

				if arg_233_1.var_.highlightMatValue104201_1 then
					local var_236_11 = Mathf.Lerp(1, 0.5, var_236_10)
					local var_236_12 = arg_233_1.var_.highlightMatValue104201_1
					local var_236_13 = var_236_12.color

					var_236_13.r = var_236_11
					var_236_13.g = var_236_11
					var_236_13.b = var_236_11
					var_236_12.color = var_236_13
				end
			end

			if arg_233_1.time_ >= var_236_7 + var_236_9 and arg_233_1.time_ < var_236_7 + var_236_9 + arg_236_0 and arg_233_1.var_.highlightMatValue104201_1 then
				local var_236_14 = 0.5
				local var_236_15 = arg_233_1.var_.highlightMatValue104201_1
				local var_236_16 = var_236_15.color

				var_236_16.r = var_236_14
				var_236_16.g = var_236_14
				var_236_16.b = var_236_14
				var_236_15.color = var_236_16
			end

			local var_236_17 = 0
			local var_236_18 = 0.05

			if var_236_17 < arg_233_1.time_ and arg_233_1.time_ <= var_236_17 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_19 = arg_233_1:FormatText(StoryNameCfg[258].name)

				arg_233_1.leftNameTxt_.text = var_236_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_20 = arg_233_1:GetWordFromCfg(114242057)
				local var_236_21 = arg_233_1:FormatText(var_236_20.content)

				arg_233_1.text_.text = var_236_21

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_22 = 2
				local var_236_23 = utf8.len(var_236_21)
				local var_236_24 = var_236_22 <= 0 and var_236_18 or var_236_18 * (var_236_23 / var_236_22)

				if var_236_24 > 0 and var_236_18 < var_236_24 then
					arg_233_1.talkMaxDuration = var_236_24

					if var_236_24 + var_236_17 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_24 + var_236_17
					end
				end

				arg_233_1.text_.text = var_236_21
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242057", "story_v_out_114242.awb") ~= 0 then
					local var_236_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242057", "story_v_out_114242.awb") / 1000

					if var_236_25 + var_236_17 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_25 + var_236_17
					end

					if var_236_20.prefab_name ~= "" and arg_233_1.actors_[var_236_20.prefab_name] ~= nil then
						local var_236_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_20.prefab_name].transform, "story_v_out_114242", "114242057", "story_v_out_114242.awb")

						arg_233_1:RecordAudio("114242057", var_236_26)
						arg_233_1:RecordAudio("114242057", var_236_26)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_114242", "114242057", "story_v_out_114242.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_114242", "114242057", "story_v_out_114242.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_27 = math.max(var_236_18, arg_233_1.talkMaxDuration)

			if var_236_17 <= arg_233_1.time_ and arg_233_1.time_ < var_236_17 + var_236_27 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_17) / var_236_27

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_17 + var_236_27 and arg_233_1.time_ < var_236_17 + var_236_27 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play114242058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 114242058
		arg_237_1.duration_ = 7.333

		local var_237_0 = {
			ja = 6.533,
			ko = 5.633,
			zh = 7.333,
			en = 6.4
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play114242059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10018"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.actorSpriteComps10018 == nil then
				arg_237_1.var_.actorSpriteComps10018 = var_240_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_2 = 0.034

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.actorSpriteComps10018 then
					for iter_240_0, iter_240_1 in pairs(arg_237_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_240_1 then
							local var_240_4 = Mathf.Lerp(iter_240_1.color.r, 0.5, var_240_3)

							iter_240_1.color = Color.New(var_240_4, var_240_4, var_240_4)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.actorSpriteComps10018 then
				local var_240_5 = 0.5

				for iter_240_2, iter_240_3 in pairs(arg_237_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_240_3 then
						iter_240_3.color = Color.New(var_240_5, var_240_5, var_240_5)
					end
				end

				arg_237_1.var_.actorSpriteComps10018 = nil
			end

			local var_240_6 = arg_237_1.actors_["104201_1"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 then
				local var_240_8 = var_240_6:GetComponent("Image")

				if var_240_8 then
					arg_237_1.var_.highlightMatValue104201_1 = var_240_8
				end
			end

			local var_240_9 = 0.034

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_9 then
				local var_240_10 = (arg_237_1.time_ - var_240_7) / var_240_9

				if arg_237_1.var_.highlightMatValue104201_1 then
					local var_240_11 = Mathf.Lerp(0.5, 1, var_240_10)
					local var_240_12 = arg_237_1.var_.highlightMatValue104201_1
					local var_240_13 = var_240_12.color

					var_240_13.r = var_240_11
					var_240_13.g = var_240_11
					var_240_13.b = var_240_11
					var_240_12.color = var_240_13
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_9 and arg_237_1.time_ < var_240_7 + var_240_9 + arg_240_0 and arg_237_1.var_.highlightMatValue104201_1 then
				local var_240_14 = 1

				var_240_6.transform:SetSiblingIndex(1)

				local var_240_15 = arg_237_1.var_.highlightMatValue104201_1
				local var_240_16 = var_240_15.color

				var_240_16.r = var_240_14
				var_240_16.g = var_240_14
				var_240_16.b = var_240_14
				var_240_15.color = var_240_16
			end

			local var_240_17 = 0
			local var_240_18 = 0.8

			if var_240_17 < arg_237_1.time_ and arg_237_1.time_ <= var_240_17 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_19 = arg_237_1:FormatText(StoryNameCfg[205].name)

				arg_237_1.leftNameTxt_.text = var_240_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_20 = arg_237_1:GetWordFromCfg(114242058)
				local var_240_21 = arg_237_1:FormatText(var_240_20.content)

				arg_237_1.text_.text = var_240_21

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_22 = 32
				local var_240_23 = utf8.len(var_240_21)
				local var_240_24 = var_240_22 <= 0 and var_240_18 or var_240_18 * (var_240_23 / var_240_22)

				if var_240_24 > 0 and var_240_18 < var_240_24 then
					arg_237_1.talkMaxDuration = var_240_24

					if var_240_24 + var_240_17 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_24 + var_240_17
					end
				end

				arg_237_1.text_.text = var_240_21
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242058", "story_v_out_114242.awb") ~= 0 then
					local var_240_25 = manager.audio:GetVoiceLength("story_v_out_114242", "114242058", "story_v_out_114242.awb") / 1000

					if var_240_25 + var_240_17 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_25 + var_240_17
					end

					if var_240_20.prefab_name ~= "" and arg_237_1.actors_[var_240_20.prefab_name] ~= nil then
						local var_240_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_20.prefab_name].transform, "story_v_out_114242", "114242058", "story_v_out_114242.awb")

						arg_237_1:RecordAudio("114242058", var_240_26)
						arg_237_1:RecordAudio("114242058", var_240_26)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_114242", "114242058", "story_v_out_114242.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_114242", "114242058", "story_v_out_114242.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_27 = math.max(var_240_18, arg_237_1.talkMaxDuration)

			if var_240_17 <= arg_237_1.time_ and arg_237_1.time_ < var_240_17 + var_240_27 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_17) / var_240_27

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_17 + var_240_27 and arg_237_1.time_ < var_240_17 + var_240_27 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play114242059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 114242059
		arg_241_1.duration_ = 10.466

		local var_241_0 = {
			ja = 10.466,
			ko = 10.033,
			zh = 10.333,
			en = 6.9
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play114242060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.9

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_2 = arg_241_1:FormatText(StoryNameCfg[205].name)

				arg_241_1.leftNameTxt_.text = var_244_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_3 = arg_241_1:GetWordFromCfg(114242059)
				local var_244_4 = arg_241_1:FormatText(var_244_3.content)

				arg_241_1.text_.text = var_244_4

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_5 = 37
				local var_244_6 = utf8.len(var_244_4)
				local var_244_7 = var_244_5 <= 0 and var_244_1 or var_244_1 * (var_244_6 / var_244_5)

				if var_244_7 > 0 and var_244_1 < var_244_7 then
					arg_241_1.talkMaxDuration = var_244_7

					if var_244_7 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_7 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_4
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242059", "story_v_out_114242.awb") ~= 0 then
					local var_244_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242059", "story_v_out_114242.awb") / 1000

					if var_244_8 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_8 + var_244_0
					end

					if var_244_3.prefab_name ~= "" and arg_241_1.actors_[var_244_3.prefab_name] ~= nil then
						local var_244_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_3.prefab_name].transform, "story_v_out_114242", "114242059", "story_v_out_114242.awb")

						arg_241_1:RecordAudio("114242059", var_244_9)
						arg_241_1:RecordAudio("114242059", var_244_9)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_114242", "114242059", "story_v_out_114242.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_114242", "114242059", "story_v_out_114242.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_10 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_10 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_10

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_10 and arg_241_1.time_ < var_244_0 + var_244_10 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play114242060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 114242060
		arg_245_1.duration_ = 9.832999999999

		local var_245_0 = {
			ja = 8.732999999999,
			ko = 7.965999999999,
			zh = 9.832999999999,
			en = 9.065999999999
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play114242061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				local var_248_1 = manager.ui.mainCamera.transform.localPosition
				local var_248_2 = Vector3.New(0, 0, 10) + Vector3.New(var_248_1.x, var_248_1.y, 0)
				local var_248_3 = arg_245_1.bgs_.ST25

				var_248_3.transform.localPosition = var_248_2
				var_248_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_248_4 = var_248_3:GetComponent("SpriteRenderer")

				if var_248_4 and var_248_4.sprite then
					local var_248_5 = (var_248_3.transform.localPosition - var_248_1).z
					local var_248_6 = manager.ui.mainCameraCom_
					local var_248_7 = 2 * var_248_5 * Mathf.Tan(var_248_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_248_8 = var_248_7 * var_248_6.aspect
					local var_248_9 = var_248_4.sprite.bounds.size.x
					local var_248_10 = var_248_4.sprite.bounds.size.y
					local var_248_11 = var_248_8 / var_248_9
					local var_248_12 = var_248_7 / var_248_10
					local var_248_13 = var_248_12 < var_248_11 and var_248_11 or var_248_12

					var_248_3.transform.localScale = Vector3.New(var_248_13, var_248_13, 0)
				end

				for iter_248_0, iter_248_1 in pairs(arg_245_1.bgs_) do
					if iter_248_0 ~= "ST25" then
						iter_248_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				arg_245_1.mask_.enabled = true
				arg_245_1.mask_.raycastTarget = false

				arg_245_1:SetGaussion(false)
			end

			local var_248_15 = 2

			if var_248_14 <= arg_245_1.time_ and arg_245_1.time_ < var_248_14 + var_248_15 then
				local var_248_16 = (arg_245_1.time_ - var_248_14) / var_248_15
				local var_248_17 = Color.New(1, 1, 1)

				var_248_17.a = Mathf.Lerp(1, 0, var_248_16)
				arg_245_1.mask_.color = var_248_17
			end

			if arg_245_1.time_ >= var_248_14 + var_248_15 and arg_245_1.time_ < var_248_14 + var_248_15 + arg_248_0 then
				local var_248_18 = Color.New(1, 1, 1)
				local var_248_19 = 0

				arg_245_1.mask_.enabled = false
				var_248_18.a = var_248_19
				arg_245_1.mask_.color = var_248_18
			end

			local var_248_20 = arg_245_1.actors_["10018"].transform
			local var_248_21 = 1.8

			if var_248_21 < arg_245_1.time_ and arg_245_1.time_ <= var_248_21 + arg_248_0 then
				arg_245_1.var_.moveOldPos10018 = var_248_20.localPosition
				var_248_20.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("10018", 2)

				local var_248_22 = var_248_20.childCount

				for iter_248_2 = 0, var_248_22 - 1 do
					local var_248_23 = var_248_20:GetChild(iter_248_2)

					if var_248_23.name == "split_1" or not string.find(var_248_23.name, "split") then
						var_248_23.gameObject:SetActive(true)
					else
						var_248_23.gameObject:SetActive(false)
					end
				end
			end

			local var_248_24 = 0.001

			if var_248_21 <= arg_245_1.time_ and arg_245_1.time_ < var_248_21 + var_248_24 then
				local var_248_25 = (arg_245_1.time_ - var_248_21) / var_248_24
				local var_248_26 = Vector3.New(-390, -350, -180)

				var_248_20.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10018, var_248_26, var_248_25)
			end

			if arg_245_1.time_ >= var_248_21 + var_248_24 and arg_245_1.time_ < var_248_21 + var_248_24 + arg_248_0 then
				var_248_20.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_248_27 = arg_245_1.actors_["10018"].transform
			local var_248_28 = 0

			if var_248_28 < arg_245_1.time_ and arg_245_1.time_ <= var_248_28 + arg_248_0 then
				arg_245_1.var_.moveOldPos10018 = var_248_27.localPosition
				var_248_27.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("10018", 7)

				local var_248_29 = var_248_27.childCount

				for iter_248_3 = 0, var_248_29 - 1 do
					local var_248_30 = var_248_27:GetChild(iter_248_3)

					if var_248_30.name == "split_1" or not string.find(var_248_30.name, "split") then
						var_248_30.gameObject:SetActive(true)
					else
						var_248_30.gameObject:SetActive(false)
					end
				end
			end

			local var_248_31 = 0.001

			if var_248_28 <= arg_245_1.time_ and arg_245_1.time_ < var_248_28 + var_248_31 then
				local var_248_32 = (arg_245_1.time_ - var_248_28) / var_248_31
				local var_248_33 = Vector3.New(0, -2000, -180)

				var_248_27.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10018, var_248_33, var_248_32)
			end

			if arg_245_1.time_ >= var_248_28 + var_248_31 and arg_245_1.time_ < var_248_28 + var_248_31 + arg_248_0 then
				var_248_27.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_248_34 = arg_245_1.actors_["104201_1"].transform
			local var_248_35 = 0

			if var_248_35 < arg_245_1.time_ and arg_245_1.time_ <= var_248_35 + arg_248_0 then
				arg_245_1.var_.moveOldPos104201_1 = var_248_34.localPosition
				var_248_34.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("104201_1", 7)
			end

			local var_248_36 = 0.001

			if var_248_35 <= arg_245_1.time_ and arg_245_1.time_ < var_248_35 + var_248_36 then
				local var_248_37 = (arg_245_1.time_ - var_248_35) / var_248_36
				local var_248_38 = Vector3.New(0, -2000, -180)

				var_248_34.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos104201_1, var_248_38, var_248_37)
			end

			if arg_245_1.time_ >= var_248_35 + var_248_36 and arg_245_1.time_ < var_248_35 + var_248_36 + arg_248_0 then
				var_248_34.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_248_39 = arg_245_1.actors_["10018"]
			local var_248_40 = 1.8

			if var_248_40 < arg_245_1.time_ and arg_245_1.time_ <= var_248_40 + arg_248_0 and arg_245_1.var_.actorSpriteComps10018 == nil then
				arg_245_1.var_.actorSpriteComps10018 = var_248_39:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_41 = 0.034

			if var_248_40 <= arg_245_1.time_ and arg_245_1.time_ < var_248_40 + var_248_41 then
				local var_248_42 = (arg_245_1.time_ - var_248_40) / var_248_41

				if arg_245_1.var_.actorSpriteComps10018 then
					for iter_248_4, iter_248_5 in pairs(arg_245_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_248_5 then
							local var_248_43 = Mathf.Lerp(iter_248_5.color.r, 1, var_248_42)

							iter_248_5.color = Color.New(var_248_43, var_248_43, var_248_43)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_40 + var_248_41 and arg_245_1.time_ < var_248_40 + var_248_41 + arg_248_0 and arg_245_1.var_.actorSpriteComps10018 then
				local var_248_44 = 1

				for iter_248_6, iter_248_7 in pairs(arg_245_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_248_7 then
						iter_248_7.color = Color.New(var_248_44, var_248_44, var_248_44)
					end
				end

				arg_245_1.var_.actorSpriteComps10018 = nil
			end

			local var_248_45 = arg_245_1.actors_["10018"]
			local var_248_46 = 1.8

			if var_248_46 < arg_245_1.time_ and arg_245_1.time_ <= var_248_46 + arg_248_0 then
				local var_248_47 = var_248_45:GetComponentInChildren(typeof(CanvasGroup))

				if var_248_47 then
					arg_245_1.var_.alphaOldValue10018 = var_248_47.alpha
					arg_245_1.var_.characterEffect10018 = var_248_47
				end

				arg_245_1.var_.alphaOldValue10018 = 0
			end

			local var_248_48 = 0.5

			if var_248_46 <= arg_245_1.time_ and arg_245_1.time_ < var_248_46 + var_248_48 then
				local var_248_49 = (arg_245_1.time_ - var_248_46) / var_248_48
				local var_248_50 = Mathf.Lerp(arg_245_1.var_.alphaOldValue10018, 1, var_248_49)

				if arg_245_1.var_.characterEffect10018 then
					arg_245_1.var_.characterEffect10018.alpha = var_248_50
				end
			end

			if arg_245_1.time_ >= var_248_46 + var_248_48 and arg_245_1.time_ < var_248_46 + var_248_48 + arg_248_0 and arg_245_1.var_.characterEffect10018 then
				arg_245_1.var_.characterEffect10018.alpha = 1
			end

			if arg_245_1.frameCnt_ <= 1 then
				arg_245_1.dialog_:SetActive(false)
			end

			local var_248_51 = 1.999999999999
			local var_248_52 = 0.85

			if var_248_51 < arg_245_1.time_ and arg_245_1.time_ <= var_248_51 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0

				arg_245_1.dialog_:SetActive(true)

				local var_248_53 = LeanTween.value(arg_245_1.dialog_, 0, 1, 0.3)

				var_248_53:setOnUpdate(LuaHelper.FloatAction(function(arg_249_0)
					arg_245_1.dialogCg_.alpha = arg_249_0
				end))
				var_248_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_245_1.dialog_)
					var_248_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_245_1.duration_ = arg_245_1.duration_ + 0.3

				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_54 = arg_245_1:FormatText(StoryNameCfg[257].name)

				arg_245_1.leftNameTxt_.text = var_248_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_55 = arg_245_1:GetWordFromCfg(114242060)
				local var_248_56 = arg_245_1:FormatText(var_248_55.content)

				arg_245_1.text_.text = var_248_56

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_57 = 34
				local var_248_58 = utf8.len(var_248_56)
				local var_248_59 = var_248_57 <= 0 and var_248_52 or var_248_52 * (var_248_58 / var_248_57)

				if var_248_59 > 0 and var_248_52 < var_248_59 then
					arg_245_1.talkMaxDuration = var_248_59
					var_248_51 = var_248_51 + 0.3

					if var_248_59 + var_248_51 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_59 + var_248_51
					end
				end

				arg_245_1.text_.text = var_248_56
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242060", "story_v_out_114242.awb") ~= 0 then
					local var_248_60 = manager.audio:GetVoiceLength("story_v_out_114242", "114242060", "story_v_out_114242.awb") / 1000

					if var_248_60 + var_248_51 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_60 + var_248_51
					end

					if var_248_55.prefab_name ~= "" and arg_245_1.actors_[var_248_55.prefab_name] ~= nil then
						local var_248_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_55.prefab_name].transform, "story_v_out_114242", "114242060", "story_v_out_114242.awb")

						arg_245_1:RecordAudio("114242060", var_248_61)
						arg_245_1:RecordAudio("114242060", var_248_61)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_114242", "114242060", "story_v_out_114242.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_114242", "114242060", "story_v_out_114242.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_62 = var_248_51 + 0.3
			local var_248_63 = math.max(var_248_52, arg_245_1.talkMaxDuration)

			if var_248_62 <= arg_245_1.time_ and arg_245_1.time_ < var_248_62 + var_248_63 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_62) / var_248_63

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_62 + var_248_63 and arg_245_1.time_ < var_248_62 + var_248_63 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play114242061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 114242061
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play114242062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10018"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.actorSpriteComps10018 == nil then
				arg_251_1.var_.actorSpriteComps10018 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 0.034

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps10018 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_254_1 then
							local var_254_4 = Mathf.Lerp(iter_254_1.color.r, 0.5, var_254_3)

							iter_254_1.color = Color.New(var_254_4, var_254_4, var_254_4)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.actorSpriteComps10018 then
				local var_254_5 = 0.5

				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_254_3 then
						iter_254_3.color = Color.New(var_254_5, var_254_5, var_254_5)
					end
				end

				arg_251_1.var_.actorSpriteComps10018 = nil
			end

			local var_254_6 = 0
			local var_254_7 = 0.7

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_8 = arg_251_1:GetWordFromCfg(114242061)
				local var_254_9 = arg_251_1:FormatText(var_254_8.content)

				arg_251_1.text_.text = var_254_9

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_10 = 28
				local var_254_11 = utf8.len(var_254_9)
				local var_254_12 = var_254_10 <= 0 and var_254_7 or var_254_7 * (var_254_11 / var_254_10)

				if var_254_12 > 0 and var_254_7 < var_254_12 then
					arg_251_1.talkMaxDuration = var_254_12

					if var_254_12 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_12 + var_254_6
					end
				end

				arg_251_1.text_.text = var_254_9
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_13 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_13 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_13

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_13 and arg_251_1.time_ < var_254_6 + var_254_13 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play114242062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 114242062
		arg_255_1.duration_ = 12.2

		local var_255_0 = {
			ja = 12.2,
			ko = 10.633,
			zh = 11.933,
			en = 8.633
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
				arg_255_0:Play114242063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10018"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.actorSpriteComps10018 == nil then
				arg_255_1.var_.actorSpriteComps10018 = var_258_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_2 = 0.034

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.actorSpriteComps10018 then
					for iter_258_0, iter_258_1 in pairs(arg_255_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_258_1 then
							local var_258_4 = Mathf.Lerp(iter_258_1.color.r, 1, var_258_3)

							iter_258_1.color = Color.New(var_258_4, var_258_4, var_258_4)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.actorSpriteComps10018 then
				local var_258_5 = 1

				for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_258_3 then
						iter_258_3.color = Color.New(var_258_5, var_258_5, var_258_5)
					end
				end

				arg_255_1.var_.actorSpriteComps10018 = nil
			end

			local var_258_6 = 0
			local var_258_7 = 1.3

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_8 = arg_255_1:FormatText(StoryNameCfg[257].name)

				arg_255_1.leftNameTxt_.text = var_258_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_9 = arg_255_1:GetWordFromCfg(114242062)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 51
				local var_258_12 = utf8.len(var_258_10)
				local var_258_13 = var_258_11 <= 0 and var_258_7 or var_258_7 * (var_258_12 / var_258_11)

				if var_258_13 > 0 and var_258_7 < var_258_13 then
					arg_255_1.talkMaxDuration = var_258_13

					if var_258_13 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_13 + var_258_6
					end
				end

				arg_255_1.text_.text = var_258_10
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242062", "story_v_out_114242.awb") ~= 0 then
					local var_258_14 = manager.audio:GetVoiceLength("story_v_out_114242", "114242062", "story_v_out_114242.awb") / 1000

					if var_258_14 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_14 + var_258_6
					end

					if var_258_9.prefab_name ~= "" and arg_255_1.actors_[var_258_9.prefab_name] ~= nil then
						local var_258_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_9.prefab_name].transform, "story_v_out_114242", "114242062", "story_v_out_114242.awb")

						arg_255_1:RecordAudio("114242062", var_258_15)
						arg_255_1:RecordAudio("114242062", var_258_15)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_114242", "114242062", "story_v_out_114242.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_114242", "114242062", "story_v_out_114242.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_16 = math.max(var_258_7, arg_255_1.talkMaxDuration)

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_16 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_6) / var_258_16

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_6 + var_258_16 and arg_255_1.time_ < var_258_6 + var_258_16 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play114242063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 114242063
		arg_259_1.duration_ = 12.2

		local var_259_0 = {
			ja = 12.2,
			ko = 10.6,
			zh = 9.866,
			en = 7.7
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
				arg_259_0:Play114242064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10015"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10015 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10015", 4)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_1" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(390, -350, -180)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10015, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_262_7 = arg_259_1.actors_["10018"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps10018 == nil then
				arg_259_1.var_.actorSpriteComps10018 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.034

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps10018 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 0.5, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps10018 then
				local var_262_12 = 0.5

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps10018 = nil
			end

			local var_262_13 = arg_259_1.actors_["10015"]
			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 and arg_259_1.var_.actorSpriteComps10015 == nil then
				arg_259_1.var_.actorSpriteComps10015 = var_262_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_15 = 0.034

			if var_262_14 <= arg_259_1.time_ and arg_259_1.time_ < var_262_14 + var_262_15 then
				local var_262_16 = (arg_259_1.time_ - var_262_14) / var_262_15

				if arg_259_1.var_.actorSpriteComps10015 then
					for iter_262_5, iter_262_6 in pairs(arg_259_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_262_6 then
							local var_262_17 = Mathf.Lerp(iter_262_6.color.r, 1, var_262_16)

							iter_262_6.color = Color.New(var_262_17, var_262_17, var_262_17)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps10015 then
				local var_262_18 = 1

				for iter_262_7, iter_262_8 in pairs(arg_259_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_262_8 then
						iter_262_8.color = Color.New(var_262_18, var_262_18, var_262_18)
					end
				end

				arg_259_1.var_.actorSpriteComps10015 = nil
			end

			local var_262_19 = arg_259_1.actors_["10015"]
			local var_262_20 = 0

			if var_262_20 < arg_259_1.time_ and arg_259_1.time_ <= var_262_20 + arg_262_0 then
				local var_262_21 = var_262_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_262_21 then
					arg_259_1.var_.alphaOldValue10015 = var_262_21.alpha
					arg_259_1.var_.characterEffect10015 = var_262_21
				end

				arg_259_1.var_.alphaOldValue10015 = 0
			end

			local var_262_22 = 0.5

			if var_262_20 <= arg_259_1.time_ and arg_259_1.time_ < var_262_20 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_20) / var_262_22
				local var_262_24 = Mathf.Lerp(arg_259_1.var_.alphaOldValue10015, 1, var_262_23)

				if arg_259_1.var_.characterEffect10015 then
					arg_259_1.var_.characterEffect10015.alpha = var_262_24
				end
			end

			if arg_259_1.time_ >= var_262_20 + var_262_22 and arg_259_1.time_ < var_262_20 + var_262_22 + arg_262_0 and arg_259_1.var_.characterEffect10015 then
				arg_259_1.var_.characterEffect10015.alpha = 1
			end

			local var_262_25 = 0
			local var_262_26 = 1.15

			if var_262_25 < arg_259_1.time_ and arg_259_1.time_ <= var_262_25 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_27 = arg_259_1:FormatText(StoryNameCfg[208].name)

				arg_259_1.leftNameTxt_.text = var_262_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_28 = arg_259_1:GetWordFromCfg(114242063)
				local var_262_29 = arg_259_1:FormatText(var_262_28.content)

				arg_259_1.text_.text = var_262_29

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_30 = 46
				local var_262_31 = utf8.len(var_262_29)
				local var_262_32 = var_262_30 <= 0 and var_262_26 or var_262_26 * (var_262_31 / var_262_30)

				if var_262_32 > 0 and var_262_26 < var_262_32 then
					arg_259_1.talkMaxDuration = var_262_32

					if var_262_32 + var_262_25 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_32 + var_262_25
					end
				end

				arg_259_1.text_.text = var_262_29
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242063", "story_v_out_114242.awb") ~= 0 then
					local var_262_33 = manager.audio:GetVoiceLength("story_v_out_114242", "114242063", "story_v_out_114242.awb") / 1000

					if var_262_33 + var_262_25 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_33 + var_262_25
					end

					if var_262_28.prefab_name ~= "" and arg_259_1.actors_[var_262_28.prefab_name] ~= nil then
						local var_262_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_28.prefab_name].transform, "story_v_out_114242", "114242063", "story_v_out_114242.awb")

						arg_259_1:RecordAudio("114242063", var_262_34)
						arg_259_1:RecordAudio("114242063", var_262_34)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_114242", "114242063", "story_v_out_114242.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_114242", "114242063", "story_v_out_114242.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_35 = math.max(var_262_26, arg_259_1.talkMaxDuration)

			if var_262_25 <= arg_259_1.time_ and arg_259_1.time_ < var_262_25 + var_262_35 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_25) / var_262_35

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_25 + var_262_35 and arg_259_1.time_ < var_262_25 + var_262_35 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play114242064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 114242064
		arg_263_1.duration_ = 8.433

		local var_263_0 = {
			ja = 3.9,
			ko = 7.833,
			zh = 7.6,
			en = 8.433
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
				arg_263_0:Play114242065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.925

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[208].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(114242064)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 37
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242064", "story_v_out_114242.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242064", "story_v_out_114242.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_out_114242", "114242064", "story_v_out_114242.awb")

						arg_263_1:RecordAudio("114242064", var_266_9)
						arg_263_1:RecordAudio("114242064", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_114242", "114242064", "story_v_out_114242.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_114242", "114242064", "story_v_out_114242.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_10 and arg_263_1.time_ < var_266_0 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play114242065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 114242065
		arg_267_1.duration_ = 8.666

		local var_267_0 = {
			ja = 8.4,
			ko = 8.666,
			zh = 7.3,
			en = 8
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
				arg_267_0:Play114242066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.9

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[208].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(114242065)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 36
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242065", "story_v_out_114242.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_114242", "114242065", "story_v_out_114242.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_114242", "114242065", "story_v_out_114242.awb")

						arg_267_1:RecordAudio("114242065", var_270_9)
						arg_267_1:RecordAudio("114242065", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_114242", "114242065", "story_v_out_114242.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_114242", "114242065", "story_v_out_114242.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_10 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_10 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_10

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_10 and arg_267_1.time_ < var_270_0 + var_270_10 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play114242066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 114242066
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play114242067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["10015"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.actorSpriteComps10015 == nil then
				arg_271_1.var_.actorSpriteComps10015 = var_274_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_2 = 0.034

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.actorSpriteComps10015 then
					for iter_274_0, iter_274_1 in pairs(arg_271_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_274_1 then
							local var_274_4 = Mathf.Lerp(iter_274_1.color.r, 0.5, var_274_3)

							iter_274_1.color = Color.New(var_274_4, var_274_4, var_274_4)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.actorSpriteComps10015 then
				local var_274_5 = 0.5

				for iter_274_2, iter_274_3 in pairs(arg_271_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_274_3 then
						iter_274_3.color = Color.New(var_274_5, var_274_5, var_274_5)
					end
				end

				arg_271_1.var_.actorSpriteComps10015 = nil
			end

			local var_274_6 = 0
			local var_274_7 = 1.65

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

				local var_274_8 = arg_271_1:GetWordFromCfg(114242066)
				local var_274_9 = arg_271_1:FormatText(var_274_8.content)

				arg_271_1.text_.text = var_274_9

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_10 = 66
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
	Play114242067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 114242067
		arg_275_1.duration_ = 6.633

		local var_275_0 = {
			ja = 6.633,
			ko = 4.466,
			zh = 4.1,
			en = 3.666
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
				arg_275_0:Play114242068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["10015"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos10015 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("10015", 4)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "split_2" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(390, -350, -180)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos10015, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_278_7 = arg_275_1.actors_["10015"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps10015 == nil then
				arg_275_1.var_.actorSpriteComps10015 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.034

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps10015 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps10015 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps10015 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 0.45

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[208].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(114242067)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242067", "story_v_out_114242.awb") ~= 0 then
					local var_278_21 = manager.audio:GetVoiceLength("story_v_out_114242", "114242067", "story_v_out_114242.awb") / 1000

					if var_278_21 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_21 + var_278_13
					end

					if var_278_16.prefab_name ~= "" and arg_275_1.actors_[var_278_16.prefab_name] ~= nil then
						local var_278_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_16.prefab_name].transform, "story_v_out_114242", "114242067", "story_v_out_114242.awb")

						arg_275_1:RecordAudio("114242067", var_278_22)
						arg_275_1:RecordAudio("114242067", var_278_22)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_114242", "114242067", "story_v_out_114242.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_114242", "114242067", "story_v_out_114242.awb")
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
	Play114242068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 114242068
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play114242069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["10015"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.actorSpriteComps10015 == nil then
				arg_279_1.var_.actorSpriteComps10015 = var_282_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_2 = 0.034

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.actorSpriteComps10015 then
					for iter_282_0, iter_282_1 in pairs(arg_279_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_282_1 then
							local var_282_4 = Mathf.Lerp(iter_282_1.color.r, 0.5, var_282_3)

							iter_282_1.color = Color.New(var_282_4, var_282_4, var_282_4)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.actorSpriteComps10015 then
				local var_282_5 = 0.5

				for iter_282_2, iter_282_3 in pairs(arg_279_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_282_3 then
						iter_282_3.color = Color.New(var_282_5, var_282_5, var_282_5)
					end
				end

				arg_279_1.var_.actorSpriteComps10015 = nil
			end

			local var_282_6 = 0
			local var_282_7 = 0.875

			if var_282_6 < arg_279_1.time_ and arg_279_1.time_ <= var_282_6 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_8 = arg_279_1:GetWordFromCfg(114242068)
				local var_282_9 = arg_279_1:FormatText(var_282_8.content)

				arg_279_1.text_.text = var_282_9

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_10 = 35
				local var_282_11 = utf8.len(var_282_9)
				local var_282_12 = var_282_10 <= 0 and var_282_7 or var_282_7 * (var_282_11 / var_282_10)

				if var_282_12 > 0 and var_282_7 < var_282_12 then
					arg_279_1.talkMaxDuration = var_282_12

					if var_282_12 + var_282_6 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_12 + var_282_6
					end
				end

				arg_279_1.text_.text = var_282_9
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_13 = math.max(var_282_7, arg_279_1.talkMaxDuration)

			if var_282_6 <= arg_279_1.time_ and arg_279_1.time_ < var_282_6 + var_282_13 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_6) / var_282_13

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_6 + var_282_13 and arg_279_1.time_ < var_282_6 + var_282_13 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play114242069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 114242069
		arg_283_1.duration_ = 1.5

		local var_283_0 = {
			ja = 1.5,
			ko = 1.4,
			en = 1.4
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
				arg_283_0:Play114242070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10015"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.actorSpriteComps10015 == nil then
				arg_283_1.var_.actorSpriteComps10015 = var_286_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_2 = 0.034

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.actorSpriteComps10015 then
					for iter_286_0, iter_286_1 in pairs(arg_283_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_286_1 then
							local var_286_4 = Mathf.Lerp(iter_286_1.color.r, 1, var_286_3)

							iter_286_1.color = Color.New(var_286_4, var_286_4, var_286_4)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.actorSpriteComps10015 then
				local var_286_5 = 1

				for iter_286_2, iter_286_3 in pairs(arg_283_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_286_3 then
						iter_286_3.color = Color.New(var_286_5, var_286_5, var_286_5)
					end
				end

				arg_283_1.var_.actorSpriteComps10015 = nil
			end

			local var_286_6 = arg_283_1.actors_["10015"].transform
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 then
				arg_283_1.var_.moveOldPos10015 = var_286_6.localPosition
				var_286_6.localScale = Vector3.New(1, 1, 1)

				arg_283_1:CheckSpriteTmpPos("10015", 4)

				local var_286_8 = var_286_6.childCount

				for iter_286_4 = 0, var_286_8 - 1 do
					local var_286_9 = var_286_6:GetChild(iter_286_4)

					if var_286_9.name == "split_1" or not string.find(var_286_9.name, "split") then
						var_286_9.gameObject:SetActive(true)
					else
						var_286_9.gameObject:SetActive(false)
					end
				end
			end

			local var_286_10 = 0.001

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_10 then
				local var_286_11 = (arg_283_1.time_ - var_286_7) / var_286_10
				local var_286_12 = Vector3.New(390, -350, -180)

				var_286_6.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos10015, var_286_12, var_286_11)
			end

			if arg_283_1.time_ >= var_286_7 + var_286_10 and arg_283_1.time_ < var_286_7 + var_286_10 + arg_286_0 then
				var_286_6.localPosition = Vector3.New(390, -350, -180)
			end

			local var_286_13 = 0
			local var_286_14 = 0.05

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_15 = arg_283_1:FormatText(StoryNameCfg[208].name)

				arg_283_1.leftNameTxt_.text = var_286_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_16 = arg_283_1:GetWordFromCfg(114242069)
				local var_286_17 = arg_283_1:FormatText(var_286_16.content)

				arg_283_1.text_.text = var_286_17

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_18 = 2
				local var_286_19 = utf8.len(var_286_17)
				local var_286_20 = var_286_18 <= 0 and var_286_14 or var_286_14 * (var_286_19 / var_286_18)

				if var_286_20 > 0 and var_286_14 < var_286_20 then
					arg_283_1.talkMaxDuration = var_286_20

					if var_286_20 + var_286_13 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_20 + var_286_13
					end
				end

				arg_283_1.text_.text = var_286_17
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242069", "story_v_out_114242.awb") ~= 0 then
					local var_286_21 = manager.audio:GetVoiceLength("story_v_out_114242", "114242069", "story_v_out_114242.awb") / 1000

					if var_286_21 + var_286_13 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_21 + var_286_13
					end

					if var_286_16.prefab_name ~= "" and arg_283_1.actors_[var_286_16.prefab_name] ~= nil then
						local var_286_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_16.prefab_name].transform, "story_v_out_114242", "114242069", "story_v_out_114242.awb")

						arg_283_1:RecordAudio("114242069", var_286_22)
						arg_283_1:RecordAudio("114242069", var_286_22)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_114242", "114242069", "story_v_out_114242.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_114242", "114242069", "story_v_out_114242.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_23 = math.max(var_286_14, arg_283_1.talkMaxDuration)

			if var_286_13 <= arg_283_1.time_ and arg_283_1.time_ < var_286_13 + var_286_23 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_13) / var_286_23

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_13 + var_286_23 and arg_283_1.time_ < var_286_13 + var_286_23 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play114242070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 114242070
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play114242071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["10015"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				local var_290_2 = var_290_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_290_2 then
					arg_287_1.var_.alphaOldValue10015 = var_290_2.alpha
					arg_287_1.var_.characterEffect10015 = var_290_2
				end

				arg_287_1.var_.alphaOldValue10015 = 1
			end

			local var_290_3 = 0.5

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_3 then
				local var_290_4 = (arg_287_1.time_ - var_290_1) / var_290_3
				local var_290_5 = Mathf.Lerp(arg_287_1.var_.alphaOldValue10015, 0, var_290_4)

				if arg_287_1.var_.characterEffect10015 then
					arg_287_1.var_.characterEffect10015.alpha = var_290_5
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_3 and arg_287_1.time_ < var_290_1 + var_290_3 + arg_290_0 and arg_287_1.var_.characterEffect10015 then
				arg_287_1.var_.characterEffect10015.alpha = 0
			end

			local var_290_6 = arg_287_1.actors_["10018"]
			local var_290_7 = 0

			if var_290_7 < arg_287_1.time_ and arg_287_1.time_ <= var_290_7 + arg_290_0 then
				local var_290_8 = var_290_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_290_8 then
					arg_287_1.var_.alphaOldValue10018 = var_290_8.alpha
					arg_287_1.var_.characterEffect10018 = var_290_8
				end

				arg_287_1.var_.alphaOldValue10018 = 1
			end

			local var_290_9 = 0.5

			if var_290_7 <= arg_287_1.time_ and arg_287_1.time_ < var_290_7 + var_290_9 then
				local var_290_10 = (arg_287_1.time_ - var_290_7) / var_290_9
				local var_290_11 = Mathf.Lerp(arg_287_1.var_.alphaOldValue10018, 0, var_290_10)

				if arg_287_1.var_.characterEffect10018 then
					arg_287_1.var_.characterEffect10018.alpha = var_290_11
				end
			end

			if arg_287_1.time_ >= var_290_7 + var_290_9 and arg_287_1.time_ < var_290_7 + var_290_9 + arg_290_0 and arg_287_1.var_.characterEffect10018 then
				arg_287_1.var_.characterEffect10018.alpha = 0
			end

			local var_290_12 = 0
			local var_290_13 = 0.675

			if var_290_12 < arg_287_1.time_ and arg_287_1.time_ <= var_290_12 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_14 = arg_287_1:GetWordFromCfg(114242070)
				local var_290_15 = arg_287_1:FormatText(var_290_14.content)

				arg_287_1.text_.text = var_290_15

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_16 = 27
				local var_290_17 = utf8.len(var_290_15)
				local var_290_18 = var_290_16 <= 0 and var_290_13 or var_290_13 * (var_290_17 / var_290_16)

				if var_290_18 > 0 and var_290_13 < var_290_18 then
					arg_287_1.talkMaxDuration = var_290_18

					if var_290_18 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_18 + var_290_12
					end
				end

				arg_287_1.text_.text = var_290_15
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_19 = math.max(var_290_13, arg_287_1.talkMaxDuration)

			if var_290_12 <= arg_287_1.time_ and arg_287_1.time_ < var_290_12 + var_290_19 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_12) / var_290_19

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_12 + var_290_19 and arg_287_1.time_ < var_290_12 + var_290_19 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play114242071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 114242071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play114242072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 1.15

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_2 = arg_291_1:GetWordFromCfg(114242071)
				local var_294_3 = arg_291_1:FormatText(var_294_2.content)

				arg_291_1.text_.text = var_294_3

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_4 = 46
				local var_294_5 = utf8.len(var_294_3)
				local var_294_6 = var_294_4 <= 0 and var_294_1 or var_294_1 * (var_294_5 / var_294_4)

				if var_294_6 > 0 and var_294_1 < var_294_6 then
					arg_291_1.talkMaxDuration = var_294_6

					if var_294_6 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_6 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_3
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_7 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_7 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_7

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_7 and arg_291_1.time_ < var_294_0 + var_294_7 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play114242072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 114242072
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play114242073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 0.475

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, false)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_2 = arg_295_1:GetWordFromCfg(114242072)
				local var_298_3 = arg_295_1:FormatText(var_298_2.content)

				arg_295_1.text_.text = var_298_3

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_4 = 19
				local var_298_5 = utf8.len(var_298_3)
				local var_298_6 = var_298_4 <= 0 and var_298_1 or var_298_1 * (var_298_5 / var_298_4)

				if var_298_6 > 0 and var_298_1 < var_298_6 then
					arg_295_1.talkMaxDuration = var_298_6

					if var_298_6 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_6 + var_298_0
					end
				end

				arg_295_1.text_.text = var_298_3
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_7 = math.max(var_298_1, arg_295_1.talkMaxDuration)

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_7 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_0) / var_298_7

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_0 + var_298_7 and arg_295_1.time_ < var_298_0 + var_298_7 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play114242073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 114242073
		arg_299_1.duration_ = 6.633

		local var_299_0 = {
			ja = 6.633,
			ko = 5.733,
			zh = 5.5,
			en = 6.566
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
				arg_299_0:Play114242074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = manager.ui.mainCamera.transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.shakeOldPos = var_302_0.localPosition
			end

			local var_302_2 = 0.6

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / 0
				local var_302_4, var_302_5 = math.modf(var_302_3)

				var_302_0.localPosition = Vector3.New(var_302_5 * 0, var_302_5 * 0, var_302_5 * 0) + arg_299_1.var_.shakeOldPos
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 then
				var_302_0.localPosition = arg_299_1.var_.shakeOldPos
			end

			local var_302_6 = 0

			if var_302_6 < arg_299_1.time_ and arg_299_1.time_ <= var_302_6 + arg_302_0 then
				arg_299_1.allBtn_.enabled = false
			end

			local var_302_7 = 0.6

			if arg_299_1.time_ >= var_302_6 + var_302_7 and arg_299_1.time_ < var_302_6 + var_302_7 + arg_302_0 then
				arg_299_1.allBtn_.enabled = true
			end

			local var_302_8 = 0
			local var_302_9 = 0.6

			if var_302_8 < arg_299_1.time_ and arg_299_1.time_ <= var_302_8 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_10 = arg_299_1:FormatText(StoryNameCfg[36].name)

				arg_299_1.leftNameTxt_.text = var_302_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_11 = arg_299_1:GetWordFromCfg(114242073)
				local var_302_12 = arg_299_1:FormatText(var_302_11.content)

				arg_299_1.text_.text = var_302_12

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_13 = 24
				local var_302_14 = utf8.len(var_302_12)
				local var_302_15 = var_302_13 <= 0 and var_302_9 or var_302_9 * (var_302_14 / var_302_13)

				if var_302_15 > 0 and var_302_9 < var_302_15 then
					arg_299_1.talkMaxDuration = var_302_15

					if var_302_15 + var_302_8 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_15 + var_302_8
					end
				end

				arg_299_1.text_.text = var_302_12
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242073", "story_v_out_114242.awb") ~= 0 then
					local var_302_16 = manager.audio:GetVoiceLength("story_v_out_114242", "114242073", "story_v_out_114242.awb") / 1000

					if var_302_16 + var_302_8 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_16 + var_302_8
					end

					if var_302_11.prefab_name ~= "" and arg_299_1.actors_[var_302_11.prefab_name] ~= nil then
						local var_302_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_11.prefab_name].transform, "story_v_out_114242", "114242073", "story_v_out_114242.awb")

						arg_299_1:RecordAudio("114242073", var_302_17)
						arg_299_1:RecordAudio("114242073", var_302_17)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_114242", "114242073", "story_v_out_114242.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_114242", "114242073", "story_v_out_114242.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_18 = math.max(var_302_9, arg_299_1.talkMaxDuration)

			if var_302_8 <= arg_299_1.time_ and arg_299_1.time_ < var_302_8 + var_302_18 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_8) / var_302_18

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_8 + var_302_18 and arg_299_1.time_ < var_302_8 + var_302_18 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play114242074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 114242074
		arg_303_1.duration_ = 1.166

		local var_303_0 = {
			ja = 1.166,
			ko = 0.999999999999,
			zh = 0.999999999999,
			en = 1.166
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
				arg_303_0:Play114242075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 1

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				local var_306_2 = "play"
				local var_306_3 = "effect"

				arg_303_1:AudioAction(var_306_2, var_306_3, "se_story_activity_1_4_3", "se_story_activity_1_4_3_sword", "")
			end

			local var_306_4 = 0
			local var_306_5 = 0.1

			if var_306_4 < arg_303_1.time_ and arg_303_1.time_ <= var_306_4 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_6 = arg_303_1:FormatText(StoryNameCfg[208].name)

				arg_303_1.leftNameTxt_.text = var_306_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, true)
				arg_303_1.iconController_:SetSelectedState("hero")

				arg_303_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10015_split4")

				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_7 = arg_303_1:GetWordFromCfg(114242074)
				local var_306_8 = arg_303_1:FormatText(var_306_7.content)

				arg_303_1.text_.text = var_306_8

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_9 = 4
				local var_306_10 = utf8.len(var_306_8)
				local var_306_11 = var_306_9 <= 0 and var_306_5 or var_306_5 * (var_306_10 / var_306_9)

				if var_306_11 > 0 and var_306_5 < var_306_11 then
					arg_303_1.talkMaxDuration = var_306_11

					if var_306_11 + var_306_4 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_11 + var_306_4
					end
				end

				arg_303_1.text_.text = var_306_8
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242074", "story_v_out_114242.awb") ~= 0 then
					local var_306_12 = manager.audio:GetVoiceLength("story_v_out_114242", "114242074", "story_v_out_114242.awb") / 1000

					if var_306_12 + var_306_4 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_12 + var_306_4
					end

					if var_306_7.prefab_name ~= "" and arg_303_1.actors_[var_306_7.prefab_name] ~= nil then
						local var_306_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_7.prefab_name].transform, "story_v_out_114242", "114242074", "story_v_out_114242.awb")

						arg_303_1:RecordAudio("114242074", var_306_13)
						arg_303_1:RecordAudio("114242074", var_306_13)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_114242", "114242074", "story_v_out_114242.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_114242", "114242074", "story_v_out_114242.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_14 = math.max(var_306_5, arg_303_1.talkMaxDuration)

			if var_306_4 <= arg_303_1.time_ and arg_303_1.time_ < var_306_4 + var_306_14 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_4) / var_306_14

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_4 + var_306_14 and arg_303_1.time_ < var_306_4 + var_306_14 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play114242075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 114242075
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play114242076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 1.5

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_2 = arg_307_1:GetWordFromCfg(114242075)
				local var_310_3 = arg_307_1:FormatText(var_310_2.content)

				arg_307_1.text_.text = var_310_3

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_4 = 60
				local var_310_5 = utf8.len(var_310_3)
				local var_310_6 = var_310_4 <= 0 and var_310_1 or var_310_1 * (var_310_5 / var_310_4)

				if var_310_6 > 0 and var_310_1 < var_310_6 then
					arg_307_1.talkMaxDuration = var_310_6

					if var_310_6 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_6 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_3
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_7 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_7 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_7

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_7 and arg_307_1.time_ < var_310_0 + var_310_7 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play114242076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 114242076
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play114242077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.75

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_2 = arg_311_1:GetWordFromCfg(114242076)
				local var_314_3 = arg_311_1:FormatText(var_314_2.content)

				arg_311_1.text_.text = var_314_3

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_4 = 30
				local var_314_5 = utf8.len(var_314_3)
				local var_314_6 = var_314_4 <= 0 and var_314_1 or var_314_1 * (var_314_5 / var_314_4)

				if var_314_6 > 0 and var_314_1 < var_314_6 then
					arg_311_1.talkMaxDuration = var_314_6

					if var_314_6 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_6 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_3
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_7 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_7 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_7

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_7 and arg_311_1.time_ < var_314_0 + var_314_7 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play114242077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 114242077
		arg_315_1.duration_ = 1.266

		local var_315_0 = {
			ja = 0.999999999999,
			ko = 1.266,
			zh = 1.1,
			en = 1.066
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
				arg_315_0:Play114242078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10015"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos10015 = var_318_0.localPosition
				var_318_0.localScale = Vector3.New(1, 1, 1)

				arg_315_1:CheckSpriteTmpPos("10015", 3)

				local var_318_2 = var_318_0.childCount

				for iter_318_0 = 0, var_318_2 - 1 do
					local var_318_3 = var_318_0:GetChild(iter_318_0)

					if var_318_3.name == "split_6" or not string.find(var_318_3.name, "split") then
						var_318_3.gameObject:SetActive(true)
					else
						var_318_3.gameObject:SetActive(false)
					end
				end
			end

			local var_318_4 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_4 then
				local var_318_5 = (arg_315_1.time_ - var_318_1) / var_318_4
				local var_318_6 = Vector3.New(0, -350, -180)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos10015, var_318_6, var_318_5)
			end

			if arg_315_1.time_ >= var_318_1 + var_318_4 and arg_315_1.time_ < var_318_1 + var_318_4 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_318_7 = arg_315_1.actors_["10015"]
			local var_318_8 = 0

			if var_318_8 < arg_315_1.time_ and arg_315_1.time_ <= var_318_8 + arg_318_0 and arg_315_1.var_.actorSpriteComps10015 == nil then
				arg_315_1.var_.actorSpriteComps10015 = var_318_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_318_9 = 0.034

			if var_318_8 <= arg_315_1.time_ and arg_315_1.time_ < var_318_8 + var_318_9 then
				local var_318_10 = (arg_315_1.time_ - var_318_8) / var_318_9

				if arg_315_1.var_.actorSpriteComps10015 then
					for iter_318_1, iter_318_2 in pairs(arg_315_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_318_2 then
							local var_318_11 = Mathf.Lerp(iter_318_2.color.r, 1, var_318_10)

							iter_318_2.color = Color.New(var_318_11, var_318_11, var_318_11)
						end
					end
				end
			end

			if arg_315_1.time_ >= var_318_8 + var_318_9 and arg_315_1.time_ < var_318_8 + var_318_9 + arg_318_0 and arg_315_1.var_.actorSpriteComps10015 then
				local var_318_12 = 1

				for iter_318_3, iter_318_4 in pairs(arg_315_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_318_4 then
						iter_318_4.color = Color.New(var_318_12, var_318_12, var_318_12)
					end
				end

				arg_315_1.var_.actorSpriteComps10015 = nil
			end

			local var_318_13 = arg_315_1.actors_["10015"]
			local var_318_14 = 0

			if var_318_14 < arg_315_1.time_ and arg_315_1.time_ <= var_318_14 + arg_318_0 then
				local var_318_15 = var_318_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_318_15 then
					arg_315_1.var_.alphaOldValue10015 = var_318_15.alpha
					arg_315_1.var_.characterEffect10015 = var_318_15
				end

				arg_315_1.var_.alphaOldValue10015 = 0
			end

			local var_318_16 = 0.5

			if var_318_14 <= arg_315_1.time_ and arg_315_1.time_ < var_318_14 + var_318_16 then
				local var_318_17 = (arg_315_1.time_ - var_318_14) / var_318_16
				local var_318_18 = Mathf.Lerp(arg_315_1.var_.alphaOldValue10015, 1, var_318_17)

				if arg_315_1.var_.characterEffect10015 then
					arg_315_1.var_.characterEffect10015.alpha = var_318_18
				end
			end

			if arg_315_1.time_ >= var_318_14 + var_318_16 and arg_315_1.time_ < var_318_14 + var_318_16 + arg_318_0 and arg_315_1.var_.characterEffect10015 then
				arg_315_1.var_.characterEffect10015.alpha = 1
			end

			local var_318_19 = 0
			local var_318_20 = 0.05

			if var_318_19 < arg_315_1.time_ and arg_315_1.time_ <= var_318_19 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_21 = arg_315_1:FormatText(StoryNameCfg[208].name)

				arg_315_1.leftNameTxt_.text = var_318_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_22 = arg_315_1:GetWordFromCfg(114242077)
				local var_318_23 = arg_315_1:FormatText(var_318_22.content)

				arg_315_1.text_.text = var_318_23

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_24 = 2
				local var_318_25 = utf8.len(var_318_23)
				local var_318_26 = var_318_24 <= 0 and var_318_20 or var_318_20 * (var_318_25 / var_318_24)

				if var_318_26 > 0 and var_318_20 < var_318_26 then
					arg_315_1.talkMaxDuration = var_318_26

					if var_318_26 + var_318_19 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_26 + var_318_19
					end
				end

				arg_315_1.text_.text = var_318_23
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114242", "114242077", "story_v_out_114242.awb") ~= 0 then
					local var_318_27 = manager.audio:GetVoiceLength("story_v_out_114242", "114242077", "story_v_out_114242.awb") / 1000

					if var_318_27 + var_318_19 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_27 + var_318_19
					end

					if var_318_22.prefab_name ~= "" and arg_315_1.actors_[var_318_22.prefab_name] ~= nil then
						local var_318_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_22.prefab_name].transform, "story_v_out_114242", "114242077", "story_v_out_114242.awb")

						arg_315_1:RecordAudio("114242077", var_318_28)
						arg_315_1:RecordAudio("114242077", var_318_28)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_114242", "114242077", "story_v_out_114242.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_114242", "114242077", "story_v_out_114242.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_29 = math.max(var_318_20, arg_315_1.talkMaxDuration)

			if var_318_19 <= arg_315_1.time_ and arg_315_1.time_ < var_318_19 + var_318_29 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_19) / var_318_29

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_19 + var_318_29 and arg_315_1.time_ < var_318_19 + var_318_29 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play114242078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 114242078
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
			arg_319_1.auto_ = false
		end

		function arg_319_1.playNext_(arg_321_0)
			arg_319_1.onStoryFinished_()
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10015"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.actorSpriteComps10015 == nil then
				arg_319_1.var_.actorSpriteComps10015 = var_322_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_2 = 0.034

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.actorSpriteComps10015 then
					for iter_322_0, iter_322_1 in pairs(arg_319_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_322_1 then
							local var_322_4 = Mathf.Lerp(iter_322_1.color.r, 0.5, var_322_3)

							iter_322_1.color = Color.New(var_322_4, var_322_4, var_322_4)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.actorSpriteComps10015 then
				local var_322_5 = 0.5

				for iter_322_2, iter_322_3 in pairs(arg_319_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_322_3 then
						iter_322_3.color = Color.New(var_322_5, var_322_5, var_322_5)
					end
				end

				arg_319_1.var_.actorSpriteComps10015 = nil
			end

			local var_322_6 = 0
			local var_322_7 = 0.675

			if var_322_6 < arg_319_1.time_ and arg_319_1.time_ <= var_322_6 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_8 = arg_319_1:GetWordFromCfg(114242078)
				local var_322_9 = arg_319_1:FormatText(var_322_8.content)

				arg_319_1.text_.text = var_322_9

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_10 = 27
				local var_322_11 = utf8.len(var_322_9)
				local var_322_12 = var_322_10 <= 0 and var_322_7 or var_322_7 * (var_322_11 / var_322_10)

				if var_322_12 > 0 and var_322_7 < var_322_12 then
					arg_319_1.talkMaxDuration = var_322_12

					if var_322_12 + var_322_6 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_12 + var_322_6
					end
				end

				arg_319_1.text_.text = var_322_9
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_13 = math.max(var_322_7, arg_319_1.talkMaxDuration)

			if var_322_6 <= arg_319_1.time_ and arg_319_1.time_ < var_322_6 + var_322_13 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_6) / var_322_13

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_6 + var_322_13 and arg_319_1.time_ < var_322_6 + var_322_13 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST25",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a"
	},
	voices = {
		"story_v_out_114242.awb"
	}
}
