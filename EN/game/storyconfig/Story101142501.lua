return {
	Play114251001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114251001
		arg_1_1.duration_ = 11.832999999999

		local var_1_0 = {
			ja = 7.099999999999,
			ko = 10.232999999999,
			zh = 10.332999999999,
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
				arg_1_0:Play114251002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST25"

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
				local var_4_5 = arg_1_1.bgs_.ST25

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
					if iter_4_0 ~= "ST25" then
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

			local var_4_22 = "10018"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["10018"].transform
			local var_4_25 = 1.8

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos10018 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10018", 2)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_1" or not string.find(var_4_27.name, "split") then
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

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10018, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_4_31 = arg_1_1.actors_["10018"]
			local var_4_32 = 1.8

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps10018 == nil then
				arg_1_1.var_.actorSpriteComps10018 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.034

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps10018 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps10018 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps10018 = nil
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
			local var_4_48 = 1.2

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_51 = 1.999999999999
			local var_4_52 = 0.85

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

				local var_4_55 = arg_1_1:GetWordFromCfg(114251001)
				local var_4_56 = arg_1_1:FormatText(var_4_55.content)

				arg_1_1.text_.text = var_4_56

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_57 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251001", "story_v_out_114251.awb") ~= 0 then
					local var_4_60 = manager.audio:GetVoiceLength("story_v_out_114251", "114251001", "story_v_out_114251.awb") / 1000

					if var_4_60 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_51
					end

					if var_4_55.prefab_name ~= "" and arg_1_1.actors_[var_4_55.prefab_name] ~= nil then
						local var_4_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_55.prefab_name].transform, "story_v_out_114251", "114251001", "story_v_out_114251.awb")

						arg_1_1:RecordAudio("114251001", var_4_61)
						arg_1_1:RecordAudio("114251001", var_4_61)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_114251", "114251001", "story_v_out_114251.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_114251", "114251001", "story_v_out_114251.awb")
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
	Play114251002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114251002
		arg_7_1.duration_ = 7.5

		local var_7_0 = {
			ja = 7.5,
			ko = 5.333,
			zh = 6.366,
			en = 6.166
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
				arg_7_0:Play114251003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.775

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[257].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(114251002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251002", "story_v_out_114251.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251002", "story_v_out_114251.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_114251", "114251002", "story_v_out_114251.awb")

						arg_7_1:RecordAudio("114251002", var_10_9)
						arg_7_1:RecordAudio("114251002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114251", "114251002", "story_v_out_114251.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114251", "114251002", "story_v_out_114251.awb")
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
	Play114251003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114251003
		arg_11_1.duration_ = 8.866

		local var_11_0 = {
			ja = 7.466,
			ko = 8.833,
			zh = 8.866,
			en = 6.666
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
				arg_11_0:Play114251004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10015"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["10015"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos10015 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10015", 4)

				local var_14_4 = var_14_2.childCount

				for iter_14_0 = 0, var_14_4 - 1 do
					local var_14_5 = var_14_2:GetChild(iter_14_0)

					if var_14_5.name == "split_1" or not string.find(var_14_5.name, "split") then
						var_14_5.gameObject:SetActive(true)
					else
						var_14_5.gameObject:SetActive(false)
					end
				end
			end

			local var_14_6 = 0.001

			if var_14_3 <= arg_11_1.time_ and arg_11_1.time_ < var_14_3 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_3) / var_14_6
				local var_14_8 = Vector3.New(390, -350, -180)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10015, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(390, -350, -180)
			end

			local var_14_9 = arg_11_1.actors_["10018"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.actorSpriteComps10018 == nil then
				arg_11_1.var_.actorSpriteComps10018 = var_14_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_11 = 0.034

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.actorSpriteComps10018 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_14_2 then
							local var_14_13 = Mathf.Lerp(iter_14_2.color.r, 0.5, var_14_12)

							iter_14_2.color = Color.New(var_14_13, var_14_13, var_14_13)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.actorSpriteComps10018 then
				local var_14_14 = 0.5

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_14, var_14_14, var_14_14)
					end
				end

				arg_11_1.var_.actorSpriteComps10018 = nil
			end

			local var_14_15 = arg_11_1.actors_["10015"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps10015 == nil then
				arg_11_1.var_.actorSpriteComps10015 = var_14_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_17 = 0.034

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.actorSpriteComps10015 then
					for iter_14_5, iter_14_6 in pairs(arg_11_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_14_6 then
							local var_14_19 = Mathf.Lerp(iter_14_6.color.r, 1, var_14_18)

							iter_14_6.color = Color.New(var_14_19, var_14_19, var_14_19)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.actorSpriteComps10015 then
				local var_14_20 = 1

				for iter_14_7, iter_14_8 in pairs(arg_11_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_14_8 then
						iter_14_8.color = Color.New(var_14_20, var_14_20, var_14_20)
					end
				end

				arg_11_1.var_.actorSpriteComps10015 = nil
			end

			local var_14_21 = arg_11_1.actors_["10015"]
			local var_14_22 = 0

			if var_14_22 < arg_11_1.time_ and arg_11_1.time_ <= var_14_22 + arg_14_0 then
				local var_14_23 = var_14_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_23 then
					arg_11_1.var_.alphaOldValue10015 = var_14_23.alpha
					arg_11_1.var_.characterEffect10015 = var_14_23
				end

				arg_11_1.var_.alphaOldValue10015 = 0
			end

			local var_14_24 = 0.5

			if var_14_22 <= arg_11_1.time_ and arg_11_1.time_ < var_14_22 + var_14_24 then
				local var_14_25 = (arg_11_1.time_ - var_14_22) / var_14_24
				local var_14_26 = Mathf.Lerp(arg_11_1.var_.alphaOldValue10015, 1, var_14_25)

				if arg_11_1.var_.characterEffect10015 then
					arg_11_1.var_.characterEffect10015.alpha = var_14_26
				end
			end

			if arg_11_1.time_ >= var_14_22 + var_14_24 and arg_11_1.time_ < var_14_22 + var_14_24 + arg_14_0 and arg_11_1.var_.characterEffect10015 then
				arg_11_1.var_.characterEffect10015.alpha = 1
			end

			local var_14_27 = 0
			local var_14_28 = 0.9

			if var_14_27 < arg_11_1.time_ and arg_11_1.time_ <= var_14_27 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_29 = arg_11_1:FormatText(StoryNameCfg[208].name)

				arg_11_1.leftNameTxt_.text = var_14_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_30 = arg_11_1:GetWordFromCfg(114251003)
				local var_14_31 = arg_11_1:FormatText(var_14_30.content)

				arg_11_1.text_.text = var_14_31

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_32 = 35
				local var_14_33 = utf8.len(var_14_31)
				local var_14_34 = var_14_32 <= 0 and var_14_28 or var_14_28 * (var_14_33 / var_14_32)

				if var_14_34 > 0 and var_14_28 < var_14_34 then
					arg_11_1.talkMaxDuration = var_14_34

					if var_14_34 + var_14_27 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_34 + var_14_27
					end
				end

				arg_11_1.text_.text = var_14_31
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251003", "story_v_out_114251.awb") ~= 0 then
					local var_14_35 = manager.audio:GetVoiceLength("story_v_out_114251", "114251003", "story_v_out_114251.awb") / 1000

					if var_14_35 + var_14_27 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_35 + var_14_27
					end

					if var_14_30.prefab_name ~= "" and arg_11_1.actors_[var_14_30.prefab_name] ~= nil then
						local var_14_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_30.prefab_name].transform, "story_v_out_114251", "114251003", "story_v_out_114251.awb")

						arg_11_1:RecordAudio("114251003", var_14_36)
						arg_11_1:RecordAudio("114251003", var_14_36)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_114251", "114251003", "story_v_out_114251.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_114251", "114251003", "story_v_out_114251.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_37 = math.max(var_14_28, arg_11_1.talkMaxDuration)

			if var_14_27 <= arg_11_1.time_ and arg_11_1.time_ < var_14_27 + var_14_37 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_27) / var_14_37

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_27 + var_14_37 and arg_11_1.time_ < var_14_27 + var_14_37 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114251004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114251004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play114251005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10015"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps10015 == nil then
				arg_15_1.var_.actorSpriteComps10015 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.034

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps10015 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 0.5, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps10015 then
				local var_18_5 = 0.5

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps10015 = nil
			end

			local var_18_6 = 0
			local var_18_7 = 0.9

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

				local var_18_8 = arg_15_1:GetWordFromCfg(114251004)
				local var_18_9 = arg_15_1:FormatText(var_18_8.content)

				arg_15_1.text_.text = var_18_9

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_10 = 36
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
	Play114251005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114251005
		arg_19_1.duration_ = 7

		local var_19_0 = {
			ja = 7,
			ko = 2.666,
			zh = 2.466,
			en = 2.8
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
				arg_19_0:Play114251006(arg_19_1)
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
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 1, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10018 then
				local var_22_5 = 1

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
							local var_22_10 = Mathf.Lerp(iter_22_5.color.r, 0.5, var_22_9)

							iter_22_5.color = Color.New(var_22_10, var_22_10, var_22_10)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps10015 then
				local var_22_11 = 0.5

				for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_22_7 then
						iter_22_7.color = Color.New(var_22_11, var_22_11, var_22_11)
					end
				end

				arg_19_1.var_.actorSpriteComps10015 = nil
			end

			local var_22_12 = 0
			local var_22_13 = 0.275

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[257].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(114251005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251005", "story_v_out_114251.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251005", "story_v_out_114251.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_out_114251", "114251005", "story_v_out_114251.awb")

						arg_19_1:RecordAudio("114251005", var_22_21)
						arg_19_1:RecordAudio("114251005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_114251", "114251005", "story_v_out_114251.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_114251", "114251005", "story_v_out_114251.awb")
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
	Play114251006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114251006
		arg_23_1.duration_ = 1.666

		local var_23_0 = {
			ja = 1.166,
			ko = 1.666,
			zh = 1.366,
			en = 1.433
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
				arg_23_0:Play114251007(arg_23_1)
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
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 0.5, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps10018 then
				local var_26_5 = 0.5

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
							local var_26_10 = Mathf.Lerp(iter_26_5.color.r, 1, var_26_9)

							iter_26_5.color = Color.New(var_26_10, var_26_10, var_26_10)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps10015 then
				local var_26_11 = 1

				for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_26_7 then
						iter_26_7.color = Color.New(var_26_11, var_26_11, var_26_11)
					end
				end

				arg_23_1.var_.actorSpriteComps10015 = nil
			end

			local var_26_12 = arg_23_1.actors_["10015"].transform
			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1.var_.moveOldPos10015 = var_26_12.localPosition
				var_26_12.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10015", 4)

				local var_26_14 = var_26_12.childCount

				for iter_26_8 = 0, var_26_14 - 1 do
					local var_26_15 = var_26_12:GetChild(iter_26_8)

					if var_26_15.name == "split_5" or not string.find(var_26_15.name, "split") then
						var_26_15.gameObject:SetActive(true)
					else
						var_26_15.gameObject:SetActive(false)
					end
				end
			end

			local var_26_16 = 0.001

			if var_26_13 <= arg_23_1.time_ and arg_23_1.time_ < var_26_13 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_13) / var_26_16
				local var_26_18 = Vector3.New(390, -350, -180)

				var_26_12.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10015, var_26_18, var_26_17)
			end

			if arg_23_1.time_ >= var_26_13 + var_26_16 and arg_23_1.time_ < var_26_13 + var_26_16 + arg_26_0 then
				var_26_12.localPosition = Vector3.New(390, -350, -180)
			end

			local var_26_19 = 0
			local var_26_20 = 0.075

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[208].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(114251006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 3
				local var_26_25 = utf8.len(var_26_23)
				local var_26_26 = var_26_24 <= 0 and var_26_20 or var_26_20 * (var_26_25 / var_26_24)

				if var_26_26 > 0 and var_26_20 < var_26_26 then
					arg_23_1.talkMaxDuration = var_26_26

					if var_26_26 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_26 + var_26_19
					end
				end

				arg_23_1.text_.text = var_26_23
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251006", "story_v_out_114251.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251006", "story_v_out_114251.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_114251", "114251006", "story_v_out_114251.awb")

						arg_23_1:RecordAudio("114251006", var_26_28)
						arg_23_1:RecordAudio("114251006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_114251", "114251006", "story_v_out_114251.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_114251", "114251006", "story_v_out_114251.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_29 = math.max(var_26_20, arg_23_1.talkMaxDuration)

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_29 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_19) / var_26_29

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_19 + var_26_29 and arg_23_1.time_ < var_26_19 + var_26_29 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play114251007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114251007
		arg_27_1.duration_ = 7.466

		local var_27_0 = {
			ja = 7.366,
			ko = 7.266,
			zh = 6.633,
			en = 7.466
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
				arg_27_0:Play114251008(arg_27_1)
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
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 1, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps10018 then
				local var_30_5 = 1

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
							local var_30_10 = Mathf.Lerp(iter_30_5.color.r, 0.5, var_30_9)

							iter_30_5.color = Color.New(var_30_10, var_30_10, var_30_10)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10015 then
				local var_30_11 = 0.5

				for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_30_7 then
						iter_30_7.color = Color.New(var_30_11, var_30_11, var_30_11)
					end
				end

				arg_27_1.var_.actorSpriteComps10015 = nil
			end

			local var_30_12 = 0
			local var_30_13 = 0.8

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_14 = arg_27_1:FormatText(StoryNameCfg[257].name)

				arg_27_1.leftNameTxt_.text = var_30_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(114251007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251007", "story_v_out_114251.awb") ~= 0 then
					local var_30_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251007", "story_v_out_114251.awb") / 1000

					if var_30_20 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_12
					end

					if var_30_15.prefab_name ~= "" and arg_27_1.actors_[var_30_15.prefab_name] ~= nil then
						local var_30_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_15.prefab_name].transform, "story_v_out_114251", "114251007", "story_v_out_114251.awb")

						arg_27_1:RecordAudio("114251007", var_30_21)
						arg_27_1:RecordAudio("114251007", var_30_21)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114251", "114251007", "story_v_out_114251.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114251", "114251007", "story_v_out_114251.awb")
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
	Play114251008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114251008
		arg_31_1.duration_ = 9.333

		local var_31_0 = {
			ja = 9.266,
			ko = 9.333,
			zh = 8.366,
			en = 8
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
				arg_31_0:Play114251009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10015"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				local var_34_2 = var_34_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_34_2 then
					arg_31_1.var_.alphaOldValue10015 = var_34_2.alpha
					arg_31_1.var_.characterEffect10015 = var_34_2
				end

				arg_31_1.var_.alphaOldValue10015 = 1
			end

			local var_34_3 = 0.5

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_3 then
				local var_34_4 = (arg_31_1.time_ - var_34_1) / var_34_3
				local var_34_5 = Mathf.Lerp(arg_31_1.var_.alphaOldValue10015, 0, var_34_4)

				if arg_31_1.var_.characterEffect10015 then
					arg_31_1.var_.characterEffect10015.alpha = var_34_5
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_3 and arg_31_1.time_ < var_34_1 + var_34_3 + arg_34_0 and arg_31_1.var_.characterEffect10015 then
				arg_31_1.var_.characterEffect10015.alpha = 0
			end

			local var_34_6 = arg_31_1.actors_["10018"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 then
				local var_34_8 = var_34_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_34_8 then
					arg_31_1.var_.alphaOldValue10018 = var_34_8.alpha
					arg_31_1.var_.characterEffect10018 = var_34_8
				end

				arg_31_1.var_.alphaOldValue10018 = 1
			end

			local var_34_9 = 0.5

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_7) / var_34_9
				local var_34_11 = Mathf.Lerp(arg_31_1.var_.alphaOldValue10018, 0, var_34_10)

				if arg_31_1.var_.characterEffect10018 then
					arg_31_1.var_.characterEffect10018.alpha = var_34_11
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_9 and arg_31_1.time_ < var_34_7 + var_34_9 + arg_34_0 and arg_31_1.var_.characterEffect10018 then
				arg_31_1.var_.characterEffect10018.alpha = 0
			end

			local var_34_12 = 0
			local var_34_13 = 0.95

			if var_34_12 < arg_31_1.time_ and arg_31_1.time_ <= var_34_12 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_14 = arg_31_1:FormatText(StoryNameCfg[225].name)

				arg_31_1.leftNameTxt_.text = var_34_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10005")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_15 = arg_31_1:GetWordFromCfg(114251008)
				local var_34_16 = arg_31_1:FormatText(var_34_15.content)

				arg_31_1.text_.text = var_34_16

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_17 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251008", "story_v_out_114251.awb") ~= 0 then
					local var_34_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251008", "story_v_out_114251.awb") / 1000

					if var_34_20 + var_34_12 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_20 + var_34_12
					end

					if var_34_15.prefab_name ~= "" and arg_31_1.actors_[var_34_15.prefab_name] ~= nil then
						local var_34_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_15.prefab_name].transform, "story_v_out_114251", "114251008", "story_v_out_114251.awb")

						arg_31_1:RecordAudio("114251008", var_34_21)
						arg_31_1:RecordAudio("114251008", var_34_21)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_114251", "114251008", "story_v_out_114251.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_114251", "114251008", "story_v_out_114251.awb")
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
	Play114251009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114251009
		arg_35_1.duration_ = 8.666

		local var_35_0 = {
			ja = 8.366,
			ko = 8.666,
			zh = 8.333,
			en = 8.666
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
				arg_35_0:Play114251010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.975

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[225].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10005")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(114251009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251009", "story_v_out_114251.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251009", "story_v_out_114251.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_114251", "114251009", "story_v_out_114251.awb")

						arg_35_1:RecordAudio("114251009", var_38_9)
						arg_35_1:RecordAudio("114251009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114251", "114251009", "story_v_out_114251.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114251", "114251009", "story_v_out_114251.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play114251010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114251010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play114251011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1.1

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_2 = arg_39_1:GetWordFromCfg(114251010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 44
				local var_42_5 = utf8.len(var_42_3)
				local var_42_6 = var_42_4 <= 0 and var_42_1 or var_42_1 * (var_42_5 / var_42_4)

				if var_42_6 > 0 and var_42_1 < var_42_6 then
					arg_39_1.talkMaxDuration = var_42_6

					if var_42_6 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_6 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_3
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_7 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_7 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_7

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_7 and arg_39_1.time_ < var_42_0 + var_42_7 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play114251011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114251011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play114251012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.1

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_2 = arg_43_1:GetWordFromCfg(114251011)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 44
				local var_46_5 = utf8.len(var_46_3)
				local var_46_6 = var_46_4 <= 0 and var_46_1 or var_46_1 * (var_46_5 / var_46_4)

				if var_46_6 > 0 and var_46_1 < var_46_6 then
					arg_43_1.talkMaxDuration = var_46_6

					if var_46_6 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_6 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_3
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_7 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_7 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_7

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_7 and arg_43_1.time_ < var_46_0 + var_46_7 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play114251012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114251012
		arg_47_1.duration_ = 8.7

		local var_47_0 = {
			ja = 8.7,
			ko = 7.133,
			zh = 5.933,
			en = 8.066
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
				arg_47_0:Play114251013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.725

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[225].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10005")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(114251012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251012", "story_v_out_114251.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251012", "story_v_out_114251.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_114251", "114251012", "story_v_out_114251.awb")

						arg_47_1:RecordAudio("114251012", var_50_9)
						arg_47_1:RecordAudio("114251012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_114251", "114251012", "story_v_out_114251.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_114251", "114251012", "story_v_out_114251.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_10 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_10 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_10

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_10 and arg_47_1.time_ < var_50_0 + var_50_10 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play114251013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114251013
		arg_51_1.duration_ = 4.566

		local var_51_0 = {
			ja = 4.166,
			ko = 4.5,
			zh = 4.3,
			en = 4.566
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
				arg_51_0:Play114251014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.45

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[225].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10005")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(114251013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 18
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251013", "story_v_out_114251.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251013", "story_v_out_114251.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_114251", "114251013", "story_v_out_114251.awb")

						arg_51_1:RecordAudio("114251013", var_54_9)
						arg_51_1:RecordAudio("114251013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_114251", "114251013", "story_v_out_114251.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_114251", "114251013", "story_v_out_114251.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play114251014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114251014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play114251015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = manager.ui.mainCamera.transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.shakeOldPos = var_58_0.localPosition
			end

			local var_58_2 = 0.6

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / 0.066
				local var_58_4, var_58_5 = math.modf(var_58_3)

				var_58_0.localPosition = Vector3.New(var_58_5 * 0.13, var_58_5 * 0.13, var_58_5 * 0.13) + arg_55_1.var_.shakeOldPos
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = arg_55_1.var_.shakeOldPos
			end

			local var_58_6 = 0

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.allBtn_.enabled = false
			end

			local var_58_7 = 0.6

			if arg_55_1.time_ >= var_58_6 + var_58_7 and arg_55_1.time_ < var_58_6 + var_58_7 + arg_58_0 then
				arg_55_1.allBtn_.enabled = true
			end

			local var_58_8 = 0
			local var_58_9 = 1.3

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_10 = arg_55_1:GetWordFromCfg(114251014)
				local var_58_11 = arg_55_1:FormatText(var_58_10.content)

				arg_55_1.text_.text = var_58_11

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_12 = 51
				local var_58_13 = utf8.len(var_58_11)
				local var_58_14 = var_58_12 <= 0 and var_58_9 or var_58_9 * (var_58_13 / var_58_12)

				if var_58_14 > 0 and var_58_9 < var_58_14 then
					arg_55_1.talkMaxDuration = var_58_14

					if var_58_14 + var_58_8 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_8
					end
				end

				arg_55_1.text_.text = var_58_11
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_15 = math.max(var_58_9, arg_55_1.talkMaxDuration)

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_15 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_8) / var_58_15

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_8 + var_58_15 and arg_55_1.time_ < var_58_8 + var_58_15 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play114251015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114251015
		arg_59_1.duration_ = 7.166

		local var_59_0 = {
			ja = 7.166,
			ko = 3.533,
			zh = 3.733,
			en = 3.266
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
				arg_59_0:Play114251016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10018"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos10018 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10018", 2)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_1" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(-390, -350, -180)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10018, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_62_7 = arg_59_1.actors_["10015"].transform
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 then
				arg_59_1.var_.moveOldPos10015 = var_62_7.localPosition
				var_62_7.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10015", 4)

				local var_62_9 = var_62_7.childCount

				for iter_62_1 = 0, var_62_9 - 1 do
					local var_62_10 = var_62_7:GetChild(iter_62_1)

					if var_62_10.name == "split_1" or not string.find(var_62_10.name, "split") then
						var_62_10.gameObject:SetActive(true)
					else
						var_62_10.gameObject:SetActive(false)
					end
				end
			end

			local var_62_11 = 0.001

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_8) / var_62_11
				local var_62_13 = Vector3.New(390, -350, -180)

				var_62_7.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10015, var_62_13, var_62_12)
			end

			if arg_59_1.time_ >= var_62_8 + var_62_11 and arg_59_1.time_ < var_62_8 + var_62_11 + arg_62_0 then
				var_62_7.localPosition = Vector3.New(390, -350, -180)
			end

			local var_62_14 = arg_59_1.actors_["10018"]
			local var_62_15 = 0

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 and arg_59_1.var_.actorSpriteComps10018 == nil then
				arg_59_1.var_.actorSpriteComps10018 = var_62_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_16 = 0.034

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_16 then
				local var_62_17 = (arg_59_1.time_ - var_62_15) / var_62_16

				if arg_59_1.var_.actorSpriteComps10018 then
					for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_62_3 then
							local var_62_18 = Mathf.Lerp(iter_62_3.color.r, 1, var_62_17)

							iter_62_3.color = Color.New(var_62_18, var_62_18, var_62_18)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_15 + var_62_16 and arg_59_1.time_ < var_62_15 + var_62_16 + arg_62_0 and arg_59_1.var_.actorSpriteComps10018 then
				local var_62_19 = 1

				for iter_62_4, iter_62_5 in pairs(arg_59_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_62_5 then
						iter_62_5.color = Color.New(var_62_19, var_62_19, var_62_19)
					end
				end

				arg_59_1.var_.actorSpriteComps10018 = nil
			end

			local var_62_20 = arg_59_1.actors_["10015"]
			local var_62_21 = 0

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 and arg_59_1.var_.actorSpriteComps10015 == nil then
				arg_59_1.var_.actorSpriteComps10015 = var_62_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_22 = 0.034

			if var_62_21 <= arg_59_1.time_ and arg_59_1.time_ < var_62_21 + var_62_22 then
				local var_62_23 = (arg_59_1.time_ - var_62_21) / var_62_22

				if arg_59_1.var_.actorSpriteComps10015 then
					for iter_62_6, iter_62_7 in pairs(arg_59_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_62_7 then
							local var_62_24 = Mathf.Lerp(iter_62_7.color.r, 0.5, var_62_23)

							iter_62_7.color = Color.New(var_62_24, var_62_24, var_62_24)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_21 + var_62_22 and arg_59_1.time_ < var_62_21 + var_62_22 + arg_62_0 and arg_59_1.var_.actorSpriteComps10015 then
				local var_62_25 = 0.5

				for iter_62_8, iter_62_9 in pairs(arg_59_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_62_9 then
						iter_62_9.color = Color.New(var_62_25, var_62_25, var_62_25)
					end
				end

				arg_59_1.var_.actorSpriteComps10015 = nil
			end

			local var_62_26 = arg_59_1.actors_["10018"]
			local var_62_27 = 0

			if var_62_27 < arg_59_1.time_ and arg_59_1.time_ <= var_62_27 + arg_62_0 then
				local var_62_28 = var_62_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_62_28 then
					arg_59_1.var_.alphaOldValue10018 = var_62_28.alpha
					arg_59_1.var_.characterEffect10018 = var_62_28
				end

				arg_59_1.var_.alphaOldValue10018 = 0
			end

			local var_62_29 = 0.5

			if var_62_27 <= arg_59_1.time_ and arg_59_1.time_ < var_62_27 + var_62_29 then
				local var_62_30 = (arg_59_1.time_ - var_62_27) / var_62_29
				local var_62_31 = Mathf.Lerp(arg_59_1.var_.alphaOldValue10018, 1, var_62_30)

				if arg_59_1.var_.characterEffect10018 then
					arg_59_1.var_.characterEffect10018.alpha = var_62_31
				end
			end

			if arg_59_1.time_ >= var_62_27 + var_62_29 and arg_59_1.time_ < var_62_27 + var_62_29 + arg_62_0 and arg_59_1.var_.characterEffect10018 then
				arg_59_1.var_.characterEffect10018.alpha = 1
			end

			local var_62_32 = arg_59_1.actors_["10015"]
			local var_62_33 = 0

			if var_62_33 < arg_59_1.time_ and arg_59_1.time_ <= var_62_33 + arg_62_0 then
				local var_62_34 = var_62_32:GetComponentInChildren(typeof(CanvasGroup))

				if var_62_34 then
					arg_59_1.var_.alphaOldValue10015 = var_62_34.alpha
					arg_59_1.var_.characterEffect10015 = var_62_34
				end

				arg_59_1.var_.alphaOldValue10015 = 0
			end

			local var_62_35 = 0.5

			if var_62_33 <= arg_59_1.time_ and arg_59_1.time_ < var_62_33 + var_62_35 then
				local var_62_36 = (arg_59_1.time_ - var_62_33) / var_62_35
				local var_62_37 = Mathf.Lerp(arg_59_1.var_.alphaOldValue10015, 1, var_62_36)

				if arg_59_1.var_.characterEffect10015 then
					arg_59_1.var_.characterEffect10015.alpha = var_62_37
				end
			end

			if arg_59_1.time_ >= var_62_33 + var_62_35 and arg_59_1.time_ < var_62_33 + var_62_35 + arg_62_0 and arg_59_1.var_.characterEffect10015 then
				arg_59_1.var_.characterEffect10015.alpha = 1
			end

			local var_62_38 = 0
			local var_62_39 = 0.4

			if var_62_38 < arg_59_1.time_ and arg_59_1.time_ <= var_62_38 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_40 = arg_59_1:FormatText(StoryNameCfg[257].name)

				arg_59_1.leftNameTxt_.text = var_62_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_41 = arg_59_1:GetWordFromCfg(114251015)
				local var_62_42 = arg_59_1:FormatText(var_62_41.content)

				arg_59_1.text_.text = var_62_42

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_43 = 16
				local var_62_44 = utf8.len(var_62_42)
				local var_62_45 = var_62_43 <= 0 and var_62_39 or var_62_39 * (var_62_44 / var_62_43)

				if var_62_45 > 0 and var_62_39 < var_62_45 then
					arg_59_1.talkMaxDuration = var_62_45

					if var_62_45 + var_62_38 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_45 + var_62_38
					end
				end

				arg_59_1.text_.text = var_62_42
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251015", "story_v_out_114251.awb") ~= 0 then
					local var_62_46 = manager.audio:GetVoiceLength("story_v_out_114251", "114251015", "story_v_out_114251.awb") / 1000

					if var_62_46 + var_62_38 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_46 + var_62_38
					end

					if var_62_41.prefab_name ~= "" and arg_59_1.actors_[var_62_41.prefab_name] ~= nil then
						local var_62_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_41.prefab_name].transform, "story_v_out_114251", "114251015", "story_v_out_114251.awb")

						arg_59_1:RecordAudio("114251015", var_62_47)
						arg_59_1:RecordAudio("114251015", var_62_47)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_114251", "114251015", "story_v_out_114251.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_114251", "114251015", "story_v_out_114251.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_48 = math.max(var_62_39, arg_59_1.talkMaxDuration)

			if var_62_38 <= arg_59_1.time_ and arg_59_1.time_ < var_62_38 + var_62_48 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_38) / var_62_48

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_38 + var_62_48 and arg_59_1.time_ < var_62_38 + var_62_48 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play114251016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 114251016
		arg_63_1.duration_ = 8.866

		local var_63_0 = {
			ja = 4.2,
			ko = 8.866,
			zh = 7.9,
			en = 5.233
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
				arg_63_0:Play114251017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10015"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos10015 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("10015", 4)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "split_1" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(390, -350, -180)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10015, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_66_7 = arg_63_1.actors_["10018"]
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps10018 == nil then
				arg_63_1.var_.actorSpriteComps10018 = var_66_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_9 = 0.034

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_8) / var_66_9

				if arg_63_1.var_.actorSpriteComps10018 then
					for iter_66_1, iter_66_2 in pairs(arg_63_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_66_2 then
							local var_66_11 = Mathf.Lerp(iter_66_2.color.r, 0.5, var_66_10)

							iter_66_2.color = Color.New(var_66_11, var_66_11, var_66_11)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_8 + var_66_9 and arg_63_1.time_ < var_66_8 + var_66_9 + arg_66_0 and arg_63_1.var_.actorSpriteComps10018 then
				local var_66_12 = 0.5

				for iter_66_3, iter_66_4 in pairs(arg_63_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_66_4 then
						iter_66_4.color = Color.New(var_66_12, var_66_12, var_66_12)
					end
				end

				arg_63_1.var_.actorSpriteComps10018 = nil
			end

			local var_66_13 = arg_63_1.actors_["10015"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.actorSpriteComps10015 == nil then
				arg_63_1.var_.actorSpriteComps10015 = var_66_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_15 = 0.034

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.actorSpriteComps10015 then
					for iter_66_5, iter_66_6 in pairs(arg_63_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_66_6 then
							local var_66_17 = Mathf.Lerp(iter_66_6.color.r, 1, var_66_16)

							iter_66_6.color = Color.New(var_66_17, var_66_17, var_66_17)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps10015 then
				local var_66_18 = 1

				for iter_66_7, iter_66_8 in pairs(arg_63_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_66_8 then
						iter_66_8.color = Color.New(var_66_18, var_66_18, var_66_18)
					end
				end

				arg_63_1.var_.actorSpriteComps10015 = nil
			end

			local var_66_19 = 0
			local var_66_20 = 0.725

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_21 = arg_63_1:FormatText(StoryNameCfg[208].name)

				arg_63_1.leftNameTxt_.text = var_66_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_22 = arg_63_1:GetWordFromCfg(114251016)
				local var_66_23 = arg_63_1:FormatText(var_66_22.content)

				arg_63_1.text_.text = var_66_23

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_24 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251016", "story_v_out_114251.awb") ~= 0 then
					local var_66_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251016", "story_v_out_114251.awb") / 1000

					if var_66_27 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_19
					end

					if var_66_22.prefab_name ~= "" and arg_63_1.actors_[var_66_22.prefab_name] ~= nil then
						local var_66_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_22.prefab_name].transform, "story_v_out_114251", "114251016", "story_v_out_114251.awb")

						arg_63_1:RecordAudio("114251016", var_66_28)
						arg_63_1:RecordAudio("114251016", var_66_28)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_114251", "114251016", "story_v_out_114251.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_114251", "114251016", "story_v_out_114251.awb")
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
	Play114251017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 114251017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play114251018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10015"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				local var_70_2 = var_70_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_70_2 then
					arg_67_1.var_.alphaOldValue10015 = var_70_2.alpha
					arg_67_1.var_.characterEffect10015 = var_70_2
				end

				arg_67_1.var_.alphaOldValue10015 = 1
			end

			local var_70_3 = 0.5

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_3 then
				local var_70_4 = (arg_67_1.time_ - var_70_1) / var_70_3
				local var_70_5 = Mathf.Lerp(arg_67_1.var_.alphaOldValue10015, 0, var_70_4)

				if arg_67_1.var_.characterEffect10015 then
					arg_67_1.var_.characterEffect10015.alpha = var_70_5
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_3 and arg_67_1.time_ < var_70_1 + var_70_3 + arg_70_0 and arg_67_1.var_.characterEffect10015 then
				arg_67_1.var_.characterEffect10015.alpha = 0
			end

			local var_70_6 = arg_67_1.actors_["10018"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 then
				local var_70_8 = var_70_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_70_8 then
					arg_67_1.var_.alphaOldValue10018 = var_70_8.alpha
					arg_67_1.var_.characterEffect10018 = var_70_8
				end

				arg_67_1.var_.alphaOldValue10018 = 1
			end

			local var_70_9 = 0.5

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_7) / var_70_9
				local var_70_11 = Mathf.Lerp(arg_67_1.var_.alphaOldValue10018, 0, var_70_10)

				if arg_67_1.var_.characterEffect10018 then
					arg_67_1.var_.characterEffect10018.alpha = var_70_11
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_9 and arg_67_1.time_ < var_70_7 + var_70_9 + arg_70_0 and arg_67_1.var_.characterEffect10018 then
				arg_67_1.var_.characterEffect10018.alpha = 0
			end

			local var_70_12 = 0
			local var_70_13 = 1.625

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_14 = arg_67_1:GetWordFromCfg(114251017)
				local var_70_15 = arg_67_1:FormatText(var_70_14.content)

				arg_67_1.text_.text = var_70_15

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_16 = 64
				local var_70_17 = utf8.len(var_70_15)
				local var_70_18 = var_70_16 <= 0 and var_70_13 or var_70_13 * (var_70_17 / var_70_16)

				if var_70_18 > 0 and var_70_13 < var_70_18 then
					arg_67_1.talkMaxDuration = var_70_18

					if var_70_18 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_12
					end
				end

				arg_67_1.text_.text = var_70_15
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_19 = math.max(var_70_13, arg_67_1.talkMaxDuration)

			if var_70_12 <= arg_67_1.time_ and arg_67_1.time_ < var_70_12 + var_70_19 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_12) / var_70_19

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_12 + var_70_19 and arg_67_1.time_ < var_70_12 + var_70_19 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play114251018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 114251018
		arg_71_1.duration_ = 3.8

		local var_71_0 = {
			ja = 3.8,
			ko = 2.1,
			zh = 3.1,
			en = 2.133
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
				arg_71_0:Play114251019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10015"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos10015 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("10015", 4)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_1" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(390, -350, -180)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10015, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_74_7 = arg_71_1.actors_["10015"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps10015 == nil then
				arg_71_1.var_.actorSpriteComps10015 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps10015 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps10015 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps10015 = nil
			end

			local var_74_13 = arg_71_1.actors_["10015"]
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				local var_74_15 = var_74_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_74_15 then
					arg_71_1.var_.alphaOldValue10015 = var_74_15.alpha
					arg_71_1.var_.characterEffect10015 = var_74_15
				end

				arg_71_1.var_.alphaOldValue10015 = 0
			end

			local var_74_16 = 0.5

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_16 then
				local var_74_17 = (arg_71_1.time_ - var_74_14) / var_74_16
				local var_74_18 = Mathf.Lerp(arg_71_1.var_.alphaOldValue10015, 1, var_74_17)

				if arg_71_1.var_.characterEffect10015 then
					arg_71_1.var_.characterEffect10015.alpha = var_74_18
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_16 and arg_71_1.time_ < var_74_14 + var_74_16 + arg_74_0 and arg_71_1.var_.characterEffect10015 then
				arg_71_1.var_.characterEffect10015.alpha = 1
			end

			local var_74_19 = 0
			local var_74_20 = 0.325

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_21 = arg_71_1:FormatText(StoryNameCfg[208].name)

				arg_71_1.leftNameTxt_.text = var_74_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_22 = arg_71_1:GetWordFromCfg(114251018)
				local var_74_23 = arg_71_1:FormatText(var_74_22.content)

				arg_71_1.text_.text = var_74_23

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_24 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251018", "story_v_out_114251.awb") ~= 0 then
					local var_74_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251018", "story_v_out_114251.awb") / 1000

					if var_74_27 + var_74_19 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_27 + var_74_19
					end

					if var_74_22.prefab_name ~= "" and arg_71_1.actors_[var_74_22.prefab_name] ~= nil then
						local var_74_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_22.prefab_name].transform, "story_v_out_114251", "114251018", "story_v_out_114251.awb")

						arg_71_1:RecordAudio("114251018", var_74_28)
						arg_71_1:RecordAudio("114251018", var_74_28)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_114251", "114251018", "story_v_out_114251.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_114251", "114251018", "story_v_out_114251.awb")
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
	Play114251019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 114251019
		arg_75_1.duration_ = 4.1

		local var_75_0 = {
			ja = 4.1,
			ko = 3.633,
			zh = 3.433,
			en = 3.2
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
				arg_75_0:Play114251020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10018"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10018 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10018", 2)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_2" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(-390, -350, -180)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10018, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_78_7 = arg_75_1.actors_["10018"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps10018 == nil then
				arg_75_1.var_.actorSpriteComps10018 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps10018 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps10018 then
				local var_78_12 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps10018 = nil
			end

			local var_78_13 = arg_75_1.actors_["10015"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.actorSpriteComps10015 == nil then
				arg_75_1.var_.actorSpriteComps10015 = var_78_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_15 = 0.034

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.actorSpriteComps10015 then
					for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_78_6 then
							local var_78_17 = Mathf.Lerp(iter_78_6.color.r, 0.5, var_78_16)

							iter_78_6.color = Color.New(var_78_17, var_78_17, var_78_17)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps10015 then
				local var_78_18 = 0.5

				for iter_78_7, iter_78_8 in pairs(arg_75_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_78_8 then
						iter_78_8.color = Color.New(var_78_18, var_78_18, var_78_18)
					end
				end

				arg_75_1.var_.actorSpriteComps10015 = nil
			end

			local var_78_19 = arg_75_1.actors_["10018"]
			local var_78_20 = 0

			if var_78_20 < arg_75_1.time_ and arg_75_1.time_ <= var_78_20 + arg_78_0 then
				local var_78_21 = var_78_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_78_21 then
					arg_75_1.var_.alphaOldValue10018 = var_78_21.alpha
					arg_75_1.var_.characterEffect10018 = var_78_21
				end

				arg_75_1.var_.alphaOldValue10018 = 0
			end

			local var_78_22 = 0.5

			if var_78_20 <= arg_75_1.time_ and arg_75_1.time_ < var_78_20 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_20) / var_78_22
				local var_78_24 = Mathf.Lerp(arg_75_1.var_.alphaOldValue10018, 1, var_78_23)

				if arg_75_1.var_.characterEffect10018 then
					arg_75_1.var_.characterEffect10018.alpha = var_78_24
				end
			end

			if arg_75_1.time_ >= var_78_20 + var_78_22 and arg_75_1.time_ < var_78_20 + var_78_22 + arg_78_0 and arg_75_1.var_.characterEffect10018 then
				arg_75_1.var_.characterEffect10018.alpha = 1
			end

			local var_78_25 = 0
			local var_78_26 = 0.35

			if var_78_25 < arg_75_1.time_ and arg_75_1.time_ <= var_78_25 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_27 = arg_75_1:FormatText(StoryNameCfg[257].name)

				arg_75_1.leftNameTxt_.text = var_78_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_28 = arg_75_1:GetWordFromCfg(114251019)
				local var_78_29 = arg_75_1:FormatText(var_78_28.content)

				arg_75_1.text_.text = var_78_29

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_30 = 14
				local var_78_31 = utf8.len(var_78_29)
				local var_78_32 = var_78_30 <= 0 and var_78_26 or var_78_26 * (var_78_31 / var_78_30)

				if var_78_32 > 0 and var_78_26 < var_78_32 then
					arg_75_1.talkMaxDuration = var_78_32

					if var_78_32 + var_78_25 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_32 + var_78_25
					end
				end

				arg_75_1.text_.text = var_78_29
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251019", "story_v_out_114251.awb") ~= 0 then
					local var_78_33 = manager.audio:GetVoiceLength("story_v_out_114251", "114251019", "story_v_out_114251.awb") / 1000

					if var_78_33 + var_78_25 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_33 + var_78_25
					end

					if var_78_28.prefab_name ~= "" and arg_75_1.actors_[var_78_28.prefab_name] ~= nil then
						local var_78_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_28.prefab_name].transform, "story_v_out_114251", "114251019", "story_v_out_114251.awb")

						arg_75_1:RecordAudio("114251019", var_78_34)
						arg_75_1:RecordAudio("114251019", var_78_34)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_114251", "114251019", "story_v_out_114251.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_114251", "114251019", "story_v_out_114251.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_35 = math.max(var_78_26, arg_75_1.talkMaxDuration)

			if var_78_25 <= arg_75_1.time_ and arg_75_1.time_ < var_78_25 + var_78_35 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_25) / var_78_35

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_25 + var_78_35 and arg_75_1.time_ < var_78_25 + var_78_35 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play114251020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 114251020
		arg_79_1.duration_ = 9.133

		local var_79_0 = {
			ja = 9.133,
			ko = 6.533,
			zh = 7.366,
			en = 7.333
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
				arg_79_0:Play114251021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10015"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.actorSpriteComps10015 == nil then
				arg_79_1.var_.actorSpriteComps10015 = var_82_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_2 = 0.034

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.actorSpriteComps10015 then
					for iter_82_0, iter_82_1 in pairs(arg_79_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_82_1 then
							local var_82_4 = Mathf.Lerp(iter_82_1.color.r, 1, var_82_3)

							iter_82_1.color = Color.New(var_82_4, var_82_4, var_82_4)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.actorSpriteComps10015 then
				local var_82_5 = 1

				for iter_82_2, iter_82_3 in pairs(arg_79_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_82_3 then
						iter_82_3.color = Color.New(var_82_5, var_82_5, var_82_5)
					end
				end

				arg_79_1.var_.actorSpriteComps10015 = nil
			end

			local var_82_6 = arg_79_1.actors_["10018"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.actorSpriteComps10018 == nil then
				arg_79_1.var_.actorSpriteComps10018 = var_82_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_8 = 0.034

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.actorSpriteComps10018 then
					for iter_82_4, iter_82_5 in pairs(arg_79_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_82_5 then
							local var_82_10 = Mathf.Lerp(iter_82_5.color.r, 0.5, var_82_9)

							iter_82_5.color = Color.New(var_82_10, var_82_10, var_82_10)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps10018 then
				local var_82_11 = 0.5

				for iter_82_6, iter_82_7 in pairs(arg_79_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_82_7 then
						iter_82_7.color = Color.New(var_82_11, var_82_11, var_82_11)
					end
				end

				arg_79_1.var_.actorSpriteComps10018 = nil
			end

			local var_82_12 = 0
			local var_82_13 = 0.725

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_14 = arg_79_1:FormatText(StoryNameCfg[208].name)

				arg_79_1.leftNameTxt_.text = var_82_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_15 = arg_79_1:GetWordFromCfg(114251020)
				local var_82_16 = arg_79_1:FormatText(var_82_15.content)

				arg_79_1.text_.text = var_82_16

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_17 = 29
				local var_82_18 = utf8.len(var_82_16)
				local var_82_19 = var_82_17 <= 0 and var_82_13 or var_82_13 * (var_82_18 / var_82_17)

				if var_82_19 > 0 and var_82_13 < var_82_19 then
					arg_79_1.talkMaxDuration = var_82_19

					if var_82_19 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_19 + var_82_12
					end
				end

				arg_79_1.text_.text = var_82_16
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251020", "story_v_out_114251.awb") ~= 0 then
					local var_82_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251020", "story_v_out_114251.awb") / 1000

					if var_82_20 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_12
					end

					if var_82_15.prefab_name ~= "" and arg_79_1.actors_[var_82_15.prefab_name] ~= nil then
						local var_82_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_15.prefab_name].transform, "story_v_out_114251", "114251020", "story_v_out_114251.awb")

						arg_79_1:RecordAudio("114251020", var_82_21)
						arg_79_1:RecordAudio("114251020", var_82_21)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_114251", "114251020", "story_v_out_114251.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_114251", "114251020", "story_v_out_114251.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_13, arg_79_1.talkMaxDuration)

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_12) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_12 + var_82_22 and arg_79_1.time_ < var_82_12 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play114251021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114251021
		arg_83_1.duration_ = 8.45

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play114251022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10018"].transform
			local var_86_1 = 1.966

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos10018 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10018", 7)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "split_2" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(0, -2000, -180)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10018, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_86_7 = arg_83_1.actors_["10015"].transform
			local var_86_8 = 1.966

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 then
				arg_83_1.var_.moveOldPos10015 = var_86_7.localPosition
				var_86_7.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10015", 7)

				local var_86_9 = var_86_7.childCount

				for iter_86_1 = 0, var_86_9 - 1 do
					local var_86_10 = var_86_7:GetChild(iter_86_1)

					if var_86_10.name == "split_1" or not string.find(var_86_10.name, "split") then
						var_86_10.gameObject:SetActive(true)
					else
						var_86_10.gameObject:SetActive(false)
					end
				end
			end

			local var_86_11 = 0.001

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_8) / var_86_11
				local var_86_13 = Vector3.New(0, -2000, 450)

				var_86_7.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10015, var_86_13, var_86_12)
			end

			if arg_83_1.time_ >= var_86_8 + var_86_11 and arg_83_1.time_ < var_86_8 + var_86_11 + arg_86_0 then
				var_86_7.localPosition = Vector3.New(0, -2000, 450)
			end

			local var_86_14 = "ST24"

			if arg_83_1.bgs_[var_86_14] == nil then
				local var_86_15 = Object.Instantiate(arg_83_1.paintGo_)

				var_86_15:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_86_14)
				var_86_15.name = var_86_14
				var_86_15.transform.parent = arg_83_1.stage_.transform
				var_86_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.bgs_[var_86_14] = var_86_15
			end

			local var_86_16 = 2

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				local var_86_17 = manager.ui.mainCamera.transform.localPosition
				local var_86_18 = Vector3.New(0, 0, 10) + Vector3.New(var_86_17.x, var_86_17.y, 0)
				local var_86_19 = arg_83_1.bgs_.ST24

				var_86_19.transform.localPosition = var_86_18
				var_86_19.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_20 = var_86_19:GetComponent("SpriteRenderer")

				if var_86_20 and var_86_20.sprite then
					local var_86_21 = (var_86_19.transform.localPosition - var_86_17).z
					local var_86_22 = manager.ui.mainCameraCom_
					local var_86_23 = 2 * var_86_21 * Mathf.Tan(var_86_22.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_24 = var_86_23 * var_86_22.aspect
					local var_86_25 = var_86_20.sprite.bounds.size.x
					local var_86_26 = var_86_20.sprite.bounds.size.y
					local var_86_27 = var_86_24 / var_86_25
					local var_86_28 = var_86_23 / var_86_26
					local var_86_29 = var_86_28 < var_86_27 and var_86_27 or var_86_28

					var_86_19.transform.localScale = Vector3.New(var_86_29, var_86_29, 0)
				end

				for iter_86_2, iter_86_3 in pairs(arg_83_1.bgs_) do
					if iter_86_2 ~= "ST24" then
						iter_86_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_86_30 = 0

			if var_86_30 < arg_83_1.time_ and arg_83_1.time_ <= var_86_30 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_31 = 2

			if var_86_30 <= arg_83_1.time_ and arg_83_1.time_ < var_86_30 + var_86_31 then
				local var_86_32 = (arg_83_1.time_ - var_86_30) / var_86_31
				local var_86_33 = Color.New(0, 0, 0)

				var_86_33.a = Mathf.Lerp(0, 1, var_86_32)
				arg_83_1.mask_.color = var_86_33
			end

			if arg_83_1.time_ >= var_86_30 + var_86_31 and arg_83_1.time_ < var_86_30 + var_86_31 + arg_86_0 then
				local var_86_34 = Color.New(0, 0, 0)

				var_86_34.a = 1
				arg_83_1.mask_.color = var_86_34
			end

			local var_86_35 = 2

			if var_86_35 < arg_83_1.time_ and arg_83_1.time_ <= var_86_35 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_36 = 2

			if var_86_35 <= arg_83_1.time_ and arg_83_1.time_ < var_86_35 + var_86_36 then
				local var_86_37 = (arg_83_1.time_ - var_86_35) / var_86_36
				local var_86_38 = Color.New(0, 0, 0)

				var_86_38.a = Mathf.Lerp(1, 0, var_86_37)
				arg_83_1.mask_.color = var_86_38
			end

			if arg_83_1.time_ >= var_86_35 + var_86_36 and arg_83_1.time_ < var_86_35 + var_86_36 + arg_86_0 then
				local var_86_39 = Color.New(0, 0, 0)
				local var_86_40 = 0

				arg_83_1.mask_.enabled = false
				var_86_39.a = var_86_40
				arg_83_1.mask_.color = var_86_39
			end

			local var_86_41 = 1
			local var_86_42 = 1

			if var_86_41 < arg_83_1.time_ and arg_83_1.time_ <= var_86_41 + arg_86_0 then
				local var_86_43 = "play"
				local var_86_44 = "effect"

				arg_83_1:AudioAction(var_86_43, var_86_44, "se_story_activity_1_4_3", "se_story_activity_1_4_3_door", "")
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_45 = 3.45
			local var_86_46 = 0.55

			if var_86_45 < arg_83_1.time_ and arg_83_1.time_ <= var_86_45 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_47 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_47:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_48 = arg_83_1:GetWordFromCfg(114251021)
				local var_86_49 = arg_83_1:FormatText(var_86_48.content)

				arg_83_1.text_.text = var_86_49

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_50 = 22
				local var_86_51 = utf8.len(var_86_49)
				local var_86_52 = var_86_50 <= 0 and var_86_46 or var_86_46 * (var_86_51 / var_86_50)

				if var_86_52 > 0 and var_86_46 < var_86_52 then
					arg_83_1.talkMaxDuration = var_86_52
					var_86_45 = var_86_45 + 0.3

					if var_86_52 + var_86_45 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_52 + var_86_45
					end
				end

				arg_83_1.text_.text = var_86_49
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_53 = var_86_45 + 0.3
			local var_86_54 = math.max(var_86_46, arg_83_1.talkMaxDuration)

			if var_86_53 <= arg_83_1.time_ and arg_83_1.time_ < var_86_53 + var_86_54 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_53) / var_86_54

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_53 + var_86_54 and arg_83_1.time_ < var_86_53 + var_86_54 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play114251022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 114251022
		arg_89_1.duration_ = 3

		local var_89_0 = {
			ja = 3,
			ko = 1.9,
			zh = 1.7,
			en = 1.533
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
				arg_89_0:Play114251023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10018"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos10018 = var_92_0.localPosition
				var_92_0.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("10018", 2)

				local var_92_2 = var_92_0.childCount

				for iter_92_0 = 0, var_92_2 - 1 do
					local var_92_3 = var_92_0:GetChild(iter_92_0)

					if var_92_3.name == "split_1" or not string.find(var_92_3.name, "split") then
						var_92_3.gameObject:SetActive(true)
					else
						var_92_3.gameObject:SetActive(false)
					end
				end
			end

			local var_92_4 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_4 then
				local var_92_5 = (arg_89_1.time_ - var_92_1) / var_92_4
				local var_92_6 = Vector3.New(-390, -350, -180)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10018, var_92_6, var_92_5)
			end

			if arg_89_1.time_ >= var_92_1 + var_92_4 and arg_89_1.time_ < var_92_1 + var_92_4 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_92_7 = arg_89_1.actors_["10015"].transform
			local var_92_8 = 0

			if var_92_8 < arg_89_1.time_ and arg_89_1.time_ <= var_92_8 + arg_92_0 then
				arg_89_1.var_.moveOldPos10015 = var_92_7.localPosition
				var_92_7.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("10015", 4)

				local var_92_9 = var_92_7.childCount

				for iter_92_1 = 0, var_92_9 - 1 do
					local var_92_10 = var_92_7:GetChild(iter_92_1)

					if var_92_10.name == "split_5" or not string.find(var_92_10.name, "split") then
						var_92_10.gameObject:SetActive(true)
					else
						var_92_10.gameObject:SetActive(false)
					end
				end
			end

			local var_92_11 = 0.001

			if var_92_8 <= arg_89_1.time_ and arg_89_1.time_ < var_92_8 + var_92_11 then
				local var_92_12 = (arg_89_1.time_ - var_92_8) / var_92_11
				local var_92_13 = Vector3.New(390, -350, -180)

				var_92_7.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10015, var_92_13, var_92_12)
			end

			if arg_89_1.time_ >= var_92_8 + var_92_11 and arg_89_1.time_ < var_92_8 + var_92_11 + arg_92_0 then
				var_92_7.localPosition = Vector3.New(390, -350, -180)
			end

			local var_92_14 = arg_89_1.actors_["10018"]
			local var_92_15 = 0

			if var_92_15 < arg_89_1.time_ and arg_89_1.time_ <= var_92_15 + arg_92_0 and arg_89_1.var_.actorSpriteComps10018 == nil then
				arg_89_1.var_.actorSpriteComps10018 = var_92_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_16 = 0.034

			if var_92_15 <= arg_89_1.time_ and arg_89_1.time_ < var_92_15 + var_92_16 then
				local var_92_17 = (arg_89_1.time_ - var_92_15) / var_92_16

				if arg_89_1.var_.actorSpriteComps10018 then
					for iter_92_2, iter_92_3 in pairs(arg_89_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_92_3 then
							local var_92_18 = Mathf.Lerp(iter_92_3.color.r, 0.5, var_92_17)

							iter_92_3.color = Color.New(var_92_18, var_92_18, var_92_18)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_15 + var_92_16 and arg_89_1.time_ < var_92_15 + var_92_16 + arg_92_0 and arg_89_1.var_.actorSpriteComps10018 then
				local var_92_19 = 0.5

				for iter_92_4, iter_92_5 in pairs(arg_89_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_92_5 then
						iter_92_5.color = Color.New(var_92_19, var_92_19, var_92_19)
					end
				end

				arg_89_1.var_.actorSpriteComps10018 = nil
			end

			local var_92_20 = arg_89_1.actors_["10015"]
			local var_92_21 = 0

			if var_92_21 < arg_89_1.time_ and arg_89_1.time_ <= var_92_21 + arg_92_0 and arg_89_1.var_.actorSpriteComps10015 == nil then
				arg_89_1.var_.actorSpriteComps10015 = var_92_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_22 = 0.034

			if var_92_21 <= arg_89_1.time_ and arg_89_1.time_ < var_92_21 + var_92_22 then
				local var_92_23 = (arg_89_1.time_ - var_92_21) / var_92_22

				if arg_89_1.var_.actorSpriteComps10015 then
					for iter_92_6, iter_92_7 in pairs(arg_89_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_92_7 then
							local var_92_24 = Mathf.Lerp(iter_92_7.color.r, 1, var_92_23)

							iter_92_7.color = Color.New(var_92_24, var_92_24, var_92_24)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_21 + var_92_22 and arg_89_1.time_ < var_92_21 + var_92_22 + arg_92_0 and arg_89_1.var_.actorSpriteComps10015 then
				local var_92_25 = 1

				for iter_92_8, iter_92_9 in pairs(arg_89_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_92_9 then
						iter_92_9.color = Color.New(var_92_25, var_92_25, var_92_25)
					end
				end

				arg_89_1.var_.actorSpriteComps10015 = nil
			end

			local var_92_26 = arg_89_1.actors_["10015"]
			local var_92_27 = 0

			if var_92_27 < arg_89_1.time_ and arg_89_1.time_ <= var_92_27 + arg_92_0 then
				local var_92_28 = var_92_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_92_28 then
					arg_89_1.var_.alphaOldValue10015 = var_92_28.alpha
					arg_89_1.var_.characterEffect10015 = var_92_28
				end

				arg_89_1.var_.alphaOldValue10015 = 0
			end

			local var_92_29 = 0.5

			if var_92_27 <= arg_89_1.time_ and arg_89_1.time_ < var_92_27 + var_92_29 then
				local var_92_30 = (arg_89_1.time_ - var_92_27) / var_92_29
				local var_92_31 = Mathf.Lerp(arg_89_1.var_.alphaOldValue10015, 1, var_92_30)

				if arg_89_1.var_.characterEffect10015 then
					arg_89_1.var_.characterEffect10015.alpha = var_92_31
				end
			end

			if arg_89_1.time_ >= var_92_27 + var_92_29 and arg_89_1.time_ < var_92_27 + var_92_29 + arg_92_0 and arg_89_1.var_.characterEffect10015 then
				arg_89_1.var_.characterEffect10015.alpha = 1
			end

			local var_92_32 = arg_89_1.actors_["10018"]
			local var_92_33 = 0

			if var_92_33 < arg_89_1.time_ and arg_89_1.time_ <= var_92_33 + arg_92_0 then
				local var_92_34 = var_92_32:GetComponentInChildren(typeof(CanvasGroup))

				if var_92_34 then
					arg_89_1.var_.alphaOldValue10018 = var_92_34.alpha
					arg_89_1.var_.characterEffect10018 = var_92_34
				end

				arg_89_1.var_.alphaOldValue10018 = 0
			end

			local var_92_35 = 0.5

			if var_92_33 <= arg_89_1.time_ and arg_89_1.time_ < var_92_33 + var_92_35 then
				local var_92_36 = (arg_89_1.time_ - var_92_33) / var_92_35
				local var_92_37 = Mathf.Lerp(arg_89_1.var_.alphaOldValue10018, 1, var_92_36)

				if arg_89_1.var_.characterEffect10018 then
					arg_89_1.var_.characterEffect10018.alpha = var_92_37
				end
			end

			if arg_89_1.time_ >= var_92_33 + var_92_35 and arg_89_1.time_ < var_92_33 + var_92_35 + arg_92_0 and arg_89_1.var_.characterEffect10018 then
				arg_89_1.var_.characterEffect10018.alpha = 1
			end

			local var_92_38 = 0
			local var_92_39 = 0.125

			if var_92_38 < arg_89_1.time_ and arg_89_1.time_ <= var_92_38 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_40 = arg_89_1:FormatText(StoryNameCfg[208].name)

				arg_89_1.leftNameTxt_.text = var_92_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_41 = arg_89_1:GetWordFromCfg(114251022)
				local var_92_42 = arg_89_1:FormatText(var_92_41.content)

				arg_89_1.text_.text = var_92_42

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_43 = 5
				local var_92_44 = utf8.len(var_92_42)
				local var_92_45 = var_92_43 <= 0 and var_92_39 or var_92_39 * (var_92_44 / var_92_43)

				if var_92_45 > 0 and var_92_39 < var_92_45 then
					arg_89_1.talkMaxDuration = var_92_45

					if var_92_45 + var_92_38 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_45 + var_92_38
					end
				end

				arg_89_1.text_.text = var_92_42
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251022", "story_v_out_114251.awb") ~= 0 then
					local var_92_46 = manager.audio:GetVoiceLength("story_v_out_114251", "114251022", "story_v_out_114251.awb") / 1000

					if var_92_46 + var_92_38 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_46 + var_92_38
					end

					if var_92_41.prefab_name ~= "" and arg_89_1.actors_[var_92_41.prefab_name] ~= nil then
						local var_92_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_41.prefab_name].transform, "story_v_out_114251", "114251022", "story_v_out_114251.awb")

						arg_89_1:RecordAudio("114251022", var_92_47)
						arg_89_1:RecordAudio("114251022", var_92_47)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_114251", "114251022", "story_v_out_114251.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_114251", "114251022", "story_v_out_114251.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_48 = math.max(var_92_39, arg_89_1.talkMaxDuration)

			if var_92_38 <= arg_89_1.time_ and arg_89_1.time_ < var_92_38 + var_92_48 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_38) / var_92_48

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_38 + var_92_48 and arg_89_1.time_ < var_92_38 + var_92_48 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play114251023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 114251023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play114251024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["10015"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.actorSpriteComps10015 == nil then
				arg_93_1.var_.actorSpriteComps10015 = var_96_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_2 = 0.034

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.actorSpriteComps10015 then
					for iter_96_0, iter_96_1 in pairs(arg_93_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_96_1 then
							local var_96_4 = Mathf.Lerp(iter_96_1.color.r, 0.5, var_96_3)

							iter_96_1.color = Color.New(var_96_4, var_96_4, var_96_4)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.actorSpriteComps10015 then
				local var_96_5 = 0.5

				for iter_96_2, iter_96_3 in pairs(arg_93_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_96_3 then
						iter_96_3.color = Color.New(var_96_5, var_96_5, var_96_5)
					end
				end

				arg_93_1.var_.actorSpriteComps10015 = nil
			end

			local var_96_6 = 0
			local var_96_7 = 0.65

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_8 = arg_93_1:GetWordFromCfg(114251023)
				local var_96_9 = arg_93_1:FormatText(var_96_8.content)

				arg_93_1.text_.text = var_96_9

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_10 = 26
				local var_96_11 = utf8.len(var_96_9)
				local var_96_12 = var_96_10 <= 0 and var_96_7 or var_96_7 * (var_96_11 / var_96_10)

				if var_96_12 > 0 and var_96_7 < var_96_12 then
					arg_93_1.talkMaxDuration = var_96_12

					if var_96_12 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_6
					end
				end

				arg_93_1.text_.text = var_96_9
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_13 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_13 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_13

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_13 and arg_93_1.time_ < var_96_6 + var_96_13 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play114251024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 114251024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play114251025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 1.1

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_2 = arg_97_1:GetWordFromCfg(114251024)
				local var_100_3 = arg_97_1:FormatText(var_100_2.content)

				arg_97_1.text_.text = var_100_3

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_4 = 43
				local var_100_5 = utf8.len(var_100_3)
				local var_100_6 = var_100_4 <= 0 and var_100_1 or var_100_1 * (var_100_5 / var_100_4)

				if var_100_6 > 0 and var_100_1 < var_100_6 then
					arg_97_1.talkMaxDuration = var_100_6

					if var_100_6 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_6 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_3
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_7 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_7 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_7

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_7 and arg_97_1.time_ < var_100_0 + var_100_7 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play114251025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 114251025
		arg_101_1.duration_ = 3.5

		local var_101_0 = {
			ja = 1.833,
			ko = 2.866,
			zh = 3.166,
			en = 3.5
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
				arg_101_0:Play114251026(arg_101_1)
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
							local var_104_4 = Mathf.Lerp(iter_104_1.color.r, 1, var_104_3)

							iter_104_1.color = Color.New(var_104_4, var_104_4, var_104_4)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.actorSpriteComps10018 then
				local var_104_5 = 1

				for iter_104_2, iter_104_3 in pairs(arg_101_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_104_3 then
						iter_104_3.color = Color.New(var_104_5, var_104_5, var_104_5)
					end
				end

				arg_101_1.var_.actorSpriteComps10018 = nil
			end

			local var_104_6 = 0
			local var_104_7 = 0.275

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[257].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(114251025)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 11
				local var_104_12 = utf8.len(var_104_10)
				local var_104_13 = var_104_11 <= 0 and var_104_7 or var_104_7 * (var_104_12 / var_104_11)

				if var_104_13 > 0 and var_104_7 < var_104_13 then
					arg_101_1.talkMaxDuration = var_104_13

					if var_104_13 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_13 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_10
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251025", "story_v_out_114251.awb") ~= 0 then
					local var_104_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251025", "story_v_out_114251.awb") / 1000

					if var_104_14 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_14 + var_104_6
					end

					if var_104_9.prefab_name ~= "" and arg_101_1.actors_[var_104_9.prefab_name] ~= nil then
						local var_104_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_9.prefab_name].transform, "story_v_out_114251", "114251025", "story_v_out_114251.awb")

						arg_101_1:RecordAudio("114251025", var_104_15)
						arg_101_1:RecordAudio("114251025", var_104_15)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_114251", "114251025", "story_v_out_114251.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_114251", "114251025", "story_v_out_114251.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_16 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_16 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_16

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_16 and arg_101_1.time_ < var_104_6 + var_104_16 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play114251026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 114251026
		arg_105_1.duration_ = 9.533

		local var_105_0 = {
			ja = 9.533,
			ko = 5.233,
			zh = 5.033,
			en = 3.5
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
				arg_105_0:Play114251027(arg_105_1)
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
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 0.5, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps10018 then
				local var_108_5 = 0.5

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps10018 = nil
			end

			local var_108_6 = arg_105_1.actors_["10015"]
			local var_108_7 = 0

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 and arg_105_1.var_.actorSpriteComps10015 == nil then
				arg_105_1.var_.actorSpriteComps10015 = var_108_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_8 = 0.034

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_8 then
				local var_108_9 = (arg_105_1.time_ - var_108_7) / var_108_8

				if arg_105_1.var_.actorSpriteComps10015 then
					for iter_108_4, iter_108_5 in pairs(arg_105_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_108_5 then
							local var_108_10 = Mathf.Lerp(iter_108_5.color.r, 1, var_108_9)

							iter_108_5.color = Color.New(var_108_10, var_108_10, var_108_10)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_7 + var_108_8 and arg_105_1.time_ < var_108_7 + var_108_8 + arg_108_0 and arg_105_1.var_.actorSpriteComps10015 then
				local var_108_11 = 1

				for iter_108_6, iter_108_7 in pairs(arg_105_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_108_7 then
						iter_108_7.color = Color.New(var_108_11, var_108_11, var_108_11)
					end
				end

				arg_105_1.var_.actorSpriteComps10015 = nil
			end

			local var_108_12 = 0
			local var_108_13 = 0.45

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_14 = arg_105_1:FormatText(StoryNameCfg[208].name)

				arg_105_1.leftNameTxt_.text = var_108_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_15 = arg_105_1:GetWordFromCfg(114251026)
				local var_108_16 = arg_105_1:FormatText(var_108_15.content)

				arg_105_1.text_.text = var_108_16

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_17 = 18
				local var_108_18 = utf8.len(var_108_16)
				local var_108_19 = var_108_17 <= 0 and var_108_13 or var_108_13 * (var_108_18 / var_108_17)

				if var_108_19 > 0 and var_108_13 < var_108_19 then
					arg_105_1.talkMaxDuration = var_108_19

					if var_108_19 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_12
					end
				end

				arg_105_1.text_.text = var_108_16
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251026", "story_v_out_114251.awb") ~= 0 then
					local var_108_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251026", "story_v_out_114251.awb") / 1000

					if var_108_20 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_20 + var_108_12
					end

					if var_108_15.prefab_name ~= "" and arg_105_1.actors_[var_108_15.prefab_name] ~= nil then
						local var_108_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_15.prefab_name].transform, "story_v_out_114251", "114251026", "story_v_out_114251.awb")

						arg_105_1:RecordAudio("114251026", var_108_21)
						arg_105_1:RecordAudio("114251026", var_108_21)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_114251", "114251026", "story_v_out_114251.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_114251", "114251026", "story_v_out_114251.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_22 = math.max(var_108_13, arg_105_1.talkMaxDuration)

			if var_108_12 <= arg_105_1.time_ and arg_105_1.time_ < var_108_12 + var_108_22 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_12) / var_108_22

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_12 + var_108_22 and arg_105_1.time_ < var_108_12 + var_108_22 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play114251027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 114251027
		arg_109_1.duration_ = 11.9

		local var_109_0 = {
			ja = 11.366,
			ko = 11.3,
			zh = 11.9,
			en = 11.8
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
				arg_109_0:Play114251028(arg_109_1)
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
							local var_112_4 = Mathf.Lerp(iter_112_1.color.r, 1, var_112_3)

							iter_112_1.color = Color.New(var_112_4, var_112_4, var_112_4)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.actorSpriteComps10018 then
				local var_112_5 = 1

				for iter_112_2, iter_112_3 in pairs(arg_109_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_112_3 then
						iter_112_3.color = Color.New(var_112_5, var_112_5, var_112_5)
					end
				end

				arg_109_1.var_.actorSpriteComps10018 = nil
			end

			local var_112_6 = arg_109_1.actors_["10015"]
			local var_112_7 = 0

			if var_112_7 < arg_109_1.time_ and arg_109_1.time_ <= var_112_7 + arg_112_0 and arg_109_1.var_.actorSpriteComps10015 == nil then
				arg_109_1.var_.actorSpriteComps10015 = var_112_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_8 = 0.034

			if var_112_7 <= arg_109_1.time_ and arg_109_1.time_ < var_112_7 + var_112_8 then
				local var_112_9 = (arg_109_1.time_ - var_112_7) / var_112_8

				if arg_109_1.var_.actorSpriteComps10015 then
					for iter_112_4, iter_112_5 in pairs(arg_109_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_112_5 then
							local var_112_10 = Mathf.Lerp(iter_112_5.color.r, 0.5, var_112_9)

							iter_112_5.color = Color.New(var_112_10, var_112_10, var_112_10)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_7 + var_112_8 and arg_109_1.time_ < var_112_7 + var_112_8 + arg_112_0 and arg_109_1.var_.actorSpriteComps10015 then
				local var_112_11 = 0.5

				for iter_112_6, iter_112_7 in pairs(arg_109_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_112_7 then
						iter_112_7.color = Color.New(var_112_11, var_112_11, var_112_11)
					end
				end

				arg_109_1.var_.actorSpriteComps10015 = nil
			end

			local var_112_12 = 0
			local var_112_13 = 1.15

			if var_112_12 < arg_109_1.time_ and arg_109_1.time_ <= var_112_12 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_14 = arg_109_1:FormatText(StoryNameCfg[257].name)

				arg_109_1.leftNameTxt_.text = var_112_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_15 = arg_109_1:GetWordFromCfg(114251027)
				local var_112_16 = arg_109_1:FormatText(var_112_15.content)

				arg_109_1.text_.text = var_112_16

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_17 = 46
				local var_112_18 = utf8.len(var_112_16)
				local var_112_19 = var_112_17 <= 0 and var_112_13 or var_112_13 * (var_112_18 / var_112_17)

				if var_112_19 > 0 and var_112_13 < var_112_19 then
					arg_109_1.talkMaxDuration = var_112_19

					if var_112_19 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_19 + var_112_12
					end
				end

				arg_109_1.text_.text = var_112_16
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251027", "story_v_out_114251.awb") ~= 0 then
					local var_112_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251027", "story_v_out_114251.awb") / 1000

					if var_112_20 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_20 + var_112_12
					end

					if var_112_15.prefab_name ~= "" and arg_109_1.actors_[var_112_15.prefab_name] ~= nil then
						local var_112_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_15.prefab_name].transform, "story_v_out_114251", "114251027", "story_v_out_114251.awb")

						arg_109_1:RecordAudio("114251027", var_112_21)
						arg_109_1:RecordAudio("114251027", var_112_21)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_114251", "114251027", "story_v_out_114251.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_114251", "114251027", "story_v_out_114251.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_22 = math.max(var_112_13, arg_109_1.talkMaxDuration)

			if var_112_12 <= arg_109_1.time_ and arg_109_1.time_ < var_112_12 + var_112_22 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_12) / var_112_22

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_12 + var_112_22 and arg_109_1.time_ < var_112_12 + var_112_22 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play114251028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 114251028
		arg_113_1.duration_ = 9.6

		local var_113_0 = {
			ja = 9.6,
			ko = 9.133,
			zh = 9.066,
			en = 9.4
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
				arg_113_0:Play114251029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.975

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[257].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(114251028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251028", "story_v_out_114251.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251028", "story_v_out_114251.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_114251", "114251028", "story_v_out_114251.awb")

						arg_113_1:RecordAudio("114251028", var_116_9)
						arg_113_1:RecordAudio("114251028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_114251", "114251028", "story_v_out_114251.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_114251", "114251028", "story_v_out_114251.awb")
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
	Play114251029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 114251029
		arg_117_1.duration_ = 4.733

		local var_117_0 = {
			ja = 4.233,
			ko = 3.966,
			zh = 4.1,
			en = 4.733
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
				arg_117_0:Play114251030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10015"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.actorSpriteComps10015 == nil then
				arg_117_1.var_.actorSpriteComps10015 = var_120_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_2 = 0.034

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.actorSpriteComps10015 then
					for iter_120_0, iter_120_1 in pairs(arg_117_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_120_1 then
							local var_120_4 = Mathf.Lerp(iter_120_1.color.r, 1, var_120_3)

							iter_120_1.color = Color.New(var_120_4, var_120_4, var_120_4)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.actorSpriteComps10015 then
				local var_120_5 = 1

				for iter_120_2, iter_120_3 in pairs(arg_117_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_120_3 then
						iter_120_3.color = Color.New(var_120_5, var_120_5, var_120_5)
					end
				end

				arg_117_1.var_.actorSpriteComps10015 = nil
			end

			local var_120_6 = arg_117_1.actors_["10018"]
			local var_120_7 = 0

			if var_120_7 < arg_117_1.time_ and arg_117_1.time_ <= var_120_7 + arg_120_0 and arg_117_1.var_.actorSpriteComps10018 == nil then
				arg_117_1.var_.actorSpriteComps10018 = var_120_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_8 = 0.034

			if var_120_7 <= arg_117_1.time_ and arg_117_1.time_ < var_120_7 + var_120_8 then
				local var_120_9 = (arg_117_1.time_ - var_120_7) / var_120_8

				if arg_117_1.var_.actorSpriteComps10018 then
					for iter_120_4, iter_120_5 in pairs(arg_117_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_120_5 then
							local var_120_10 = Mathf.Lerp(iter_120_5.color.r, 0.5, var_120_9)

							iter_120_5.color = Color.New(var_120_10, var_120_10, var_120_10)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_7 + var_120_8 and arg_117_1.time_ < var_120_7 + var_120_8 + arg_120_0 and arg_117_1.var_.actorSpriteComps10018 then
				local var_120_11 = 0.5

				for iter_120_6, iter_120_7 in pairs(arg_117_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_120_7 then
						iter_120_7.color = Color.New(var_120_11, var_120_11, var_120_11)
					end
				end

				arg_117_1.var_.actorSpriteComps10018 = nil
			end

			local var_120_12 = 0
			local var_120_13 = 0.475

			if var_120_12 < arg_117_1.time_ and arg_117_1.time_ <= var_120_12 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_14 = arg_117_1:FormatText(StoryNameCfg[208].name)

				arg_117_1.leftNameTxt_.text = var_120_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_15 = arg_117_1:GetWordFromCfg(114251029)
				local var_120_16 = arg_117_1:FormatText(var_120_15.content)

				arg_117_1.text_.text = var_120_16

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_17 = 19
				local var_120_18 = utf8.len(var_120_16)
				local var_120_19 = var_120_17 <= 0 and var_120_13 or var_120_13 * (var_120_18 / var_120_17)

				if var_120_19 > 0 and var_120_13 < var_120_19 then
					arg_117_1.talkMaxDuration = var_120_19

					if var_120_19 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_19 + var_120_12
					end
				end

				arg_117_1.text_.text = var_120_16
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251029", "story_v_out_114251.awb") ~= 0 then
					local var_120_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251029", "story_v_out_114251.awb") / 1000

					if var_120_20 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_12
					end

					if var_120_15.prefab_name ~= "" and arg_117_1.actors_[var_120_15.prefab_name] ~= nil then
						local var_120_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_15.prefab_name].transform, "story_v_out_114251", "114251029", "story_v_out_114251.awb")

						arg_117_1:RecordAudio("114251029", var_120_21)
						arg_117_1:RecordAudio("114251029", var_120_21)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_114251", "114251029", "story_v_out_114251.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_114251", "114251029", "story_v_out_114251.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_22 = math.max(var_120_13, arg_117_1.talkMaxDuration)

			if var_120_12 <= arg_117_1.time_ and arg_117_1.time_ < var_120_12 + var_120_22 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_12) / var_120_22

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_12 + var_120_22 and arg_117_1.time_ < var_120_12 + var_120_22 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play114251030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 114251030
		arg_121_1.duration_ = 4.7

		local var_121_0 = {
			ja = 4.7,
			ko = 3.566,
			zh = 3.833,
			en = 3.733
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
				arg_121_0:Play114251031(arg_121_1)
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
							local var_124_4 = Mathf.Lerp(iter_124_1.color.r, 1, var_124_3)

							iter_124_1.color = Color.New(var_124_4, var_124_4, var_124_4)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.actorSpriteComps10018 then
				local var_124_5 = 1

				for iter_124_2, iter_124_3 in pairs(arg_121_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_124_3 then
						iter_124_3.color = Color.New(var_124_5, var_124_5, var_124_5)
					end
				end

				arg_121_1.var_.actorSpriteComps10018 = nil
			end

			local var_124_6 = arg_121_1.actors_["10015"]
			local var_124_7 = 0

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 and arg_121_1.var_.actorSpriteComps10015 == nil then
				arg_121_1.var_.actorSpriteComps10015 = var_124_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_8 = 0.034

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_8 then
				local var_124_9 = (arg_121_1.time_ - var_124_7) / var_124_8

				if arg_121_1.var_.actorSpriteComps10015 then
					for iter_124_4, iter_124_5 in pairs(arg_121_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_124_5 then
							local var_124_10 = Mathf.Lerp(iter_124_5.color.r, 0.5, var_124_9)

							iter_124_5.color = Color.New(var_124_10, var_124_10, var_124_10)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_7 + var_124_8 and arg_121_1.time_ < var_124_7 + var_124_8 + arg_124_0 and arg_121_1.var_.actorSpriteComps10015 then
				local var_124_11 = 0.5

				for iter_124_6, iter_124_7 in pairs(arg_121_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_124_7 then
						iter_124_7.color = Color.New(var_124_11, var_124_11, var_124_11)
					end
				end

				arg_121_1.var_.actorSpriteComps10015 = nil
			end

			local var_124_12 = 0
			local var_124_13 = 0.375

			if var_124_12 < arg_121_1.time_ and arg_121_1.time_ <= var_124_12 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_14 = arg_121_1:FormatText(StoryNameCfg[257].name)

				arg_121_1.leftNameTxt_.text = var_124_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_15 = arg_121_1:GetWordFromCfg(114251030)
				local var_124_16 = arg_121_1:FormatText(var_124_15.content)

				arg_121_1.text_.text = var_124_16

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_17 = 15
				local var_124_18 = utf8.len(var_124_16)
				local var_124_19 = var_124_17 <= 0 and var_124_13 or var_124_13 * (var_124_18 / var_124_17)

				if var_124_19 > 0 and var_124_13 < var_124_19 then
					arg_121_1.talkMaxDuration = var_124_19

					if var_124_19 + var_124_12 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_19 + var_124_12
					end
				end

				arg_121_1.text_.text = var_124_16
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251030", "story_v_out_114251.awb") ~= 0 then
					local var_124_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251030", "story_v_out_114251.awb") / 1000

					if var_124_20 + var_124_12 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_20 + var_124_12
					end

					if var_124_15.prefab_name ~= "" and arg_121_1.actors_[var_124_15.prefab_name] ~= nil then
						local var_124_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_15.prefab_name].transform, "story_v_out_114251", "114251030", "story_v_out_114251.awb")

						arg_121_1:RecordAudio("114251030", var_124_21)
						arg_121_1:RecordAudio("114251030", var_124_21)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_114251", "114251030", "story_v_out_114251.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_114251", "114251030", "story_v_out_114251.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_22 = math.max(var_124_13, arg_121_1.talkMaxDuration)

			if var_124_12 <= arg_121_1.time_ and arg_121_1.time_ < var_124_12 + var_124_22 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_12) / var_124_22

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_12 + var_124_22 and arg_121_1.time_ < var_124_12 + var_124_22 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play114251031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 114251031
		arg_125_1.duration_ = 2.866

		local var_125_0 = {
			ja = 2.866,
			ko = 1.633,
			zh = 2.333,
			en = 1.833
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
				arg_125_0:Play114251032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10015"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos10015 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10015", 4)

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
				local var_128_6 = Vector3.New(390, -350, -180)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10015, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_128_7 = arg_125_1.actors_["10018"]
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps10018 == nil then
				arg_125_1.var_.actorSpriteComps10018 = var_128_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_9 = 0.034

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_8) / var_128_9

				if arg_125_1.var_.actorSpriteComps10018 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_128_2 then
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 0.5, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps10018 then
				local var_128_12 = 0.5

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_12, var_128_12, var_128_12)
					end
				end

				arg_125_1.var_.actorSpriteComps10018 = nil
			end

			local var_128_13 = arg_125_1.actors_["10015"]
			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 and arg_125_1.var_.actorSpriteComps10015 == nil then
				arg_125_1.var_.actorSpriteComps10015 = var_128_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_15 = 0.034

			if var_128_14 <= arg_125_1.time_ and arg_125_1.time_ < var_128_14 + var_128_15 then
				local var_128_16 = (arg_125_1.time_ - var_128_14) / var_128_15

				if arg_125_1.var_.actorSpriteComps10015 then
					for iter_128_5, iter_128_6 in pairs(arg_125_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_128_6 then
							local var_128_17 = Mathf.Lerp(iter_128_6.color.r, 1, var_128_16)

							iter_128_6.color = Color.New(var_128_17, var_128_17, var_128_17)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_14 + var_128_15 and arg_125_1.time_ < var_128_14 + var_128_15 + arg_128_0 and arg_125_1.var_.actorSpriteComps10015 then
				local var_128_18 = 1

				for iter_128_7, iter_128_8 in pairs(arg_125_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_128_8 then
						iter_128_8.color = Color.New(var_128_18, var_128_18, var_128_18)
					end
				end

				arg_125_1.var_.actorSpriteComps10015 = nil
			end

			local var_128_19 = 0
			local var_128_20 = 0.225

			if var_128_19 < arg_125_1.time_ and arg_125_1.time_ <= var_128_19 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_21 = arg_125_1:FormatText(StoryNameCfg[208].name)

				arg_125_1.leftNameTxt_.text = var_128_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_22 = arg_125_1:GetWordFromCfg(114251031)
				local var_128_23 = arg_125_1:FormatText(var_128_22.content)

				arg_125_1.text_.text = var_128_23

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_24 = 9
				local var_128_25 = utf8.len(var_128_23)
				local var_128_26 = var_128_24 <= 0 and var_128_20 or var_128_20 * (var_128_25 / var_128_24)

				if var_128_26 > 0 and var_128_20 < var_128_26 then
					arg_125_1.talkMaxDuration = var_128_26

					if var_128_26 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_26 + var_128_19
					end
				end

				arg_125_1.text_.text = var_128_23
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251031", "story_v_out_114251.awb") ~= 0 then
					local var_128_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251031", "story_v_out_114251.awb") / 1000

					if var_128_27 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_27 + var_128_19
					end

					if var_128_22.prefab_name ~= "" and arg_125_1.actors_[var_128_22.prefab_name] ~= nil then
						local var_128_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_22.prefab_name].transform, "story_v_out_114251", "114251031", "story_v_out_114251.awb")

						arg_125_1:RecordAudio("114251031", var_128_28)
						arg_125_1:RecordAudio("114251031", var_128_28)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_114251", "114251031", "story_v_out_114251.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_114251", "114251031", "story_v_out_114251.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_29 = math.max(var_128_20, arg_125_1.talkMaxDuration)

			if var_128_19 <= arg_125_1.time_ and arg_125_1.time_ < var_128_19 + var_128_29 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_19) / var_128_29

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_19 + var_128_29 and arg_125_1.time_ < var_128_19 + var_128_29 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play114251032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 114251032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play114251033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10015"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.actorSpriteComps10015 == nil then
				arg_129_1.var_.actorSpriteComps10015 = var_132_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_2 = 0.034

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.actorSpriteComps10015 then
					for iter_132_0, iter_132_1 in pairs(arg_129_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_132_1 then
							local var_132_4 = Mathf.Lerp(iter_132_1.color.r, 0.5, var_132_3)

							iter_132_1.color = Color.New(var_132_4, var_132_4, var_132_4)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.actorSpriteComps10015 then
				local var_132_5 = 0.5

				for iter_132_2, iter_132_3 in pairs(arg_129_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_132_3 then
						iter_132_3.color = Color.New(var_132_5, var_132_5, var_132_5)
					end
				end

				arg_129_1.var_.actorSpriteComps10015 = nil
			end

			local var_132_6 = 0
			local var_132_7 = 0.4

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_8 = arg_129_1:GetWordFromCfg(114251032)
				local var_132_9 = arg_129_1:FormatText(var_132_8.content)

				arg_129_1.text_.text = var_132_9

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_10 = 16
				local var_132_11 = utf8.len(var_132_9)
				local var_132_12 = var_132_10 <= 0 and var_132_7 or var_132_7 * (var_132_11 / var_132_10)

				if var_132_12 > 0 and var_132_7 < var_132_12 then
					arg_129_1.talkMaxDuration = var_132_12

					if var_132_12 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_12 + var_132_6
					end
				end

				arg_129_1.text_.text = var_132_9
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_13 = math.max(var_132_7, arg_129_1.talkMaxDuration)

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_13 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_6) / var_132_13

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_6 + var_132_13 and arg_129_1.time_ < var_132_6 + var_132_13 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play114251033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 114251033
		arg_133_1.duration_ = 12.733

		local var_133_0 = {
			ja = 12.166,
			ko = 11.8,
			zh = 11.433,
			en = 12.733
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
				arg_133_0:Play114251034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10018"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos10018 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("10018", 2)

				local var_136_2 = var_136_0.childCount

				for iter_136_0 = 0, var_136_2 - 1 do
					local var_136_3 = var_136_0:GetChild(iter_136_0)

					if var_136_3.name == "split_2" or not string.find(var_136_3.name, "split") then
						var_136_3.gameObject:SetActive(true)
					else
						var_136_3.gameObject:SetActive(false)
					end
				end
			end

			local var_136_4 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_1) / var_136_4
				local var_136_6 = Vector3.New(-390, -350, -180)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10018, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_136_7 = arg_133_1.actors_["10018"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 and arg_133_1.var_.actorSpriteComps10018 == nil then
				arg_133_1.var_.actorSpriteComps10018 = var_136_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_9 = 0.034

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_8) / var_136_9

				if arg_133_1.var_.actorSpriteComps10018 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_136_2 then
							local var_136_11 = Mathf.Lerp(iter_136_2.color.r, 1, var_136_10)

							iter_136_2.color = Color.New(var_136_11, var_136_11, var_136_11)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_9 and arg_133_1.time_ < var_136_8 + var_136_9 + arg_136_0 and arg_133_1.var_.actorSpriteComps10018 then
				local var_136_12 = 1

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_12, var_136_12, var_136_12)
					end
				end

				arg_133_1.var_.actorSpriteComps10018 = nil
			end

			local var_136_13 = 0
			local var_136_14 = 1.3

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_15 = arg_133_1:FormatText(StoryNameCfg[257].name)

				arg_133_1.leftNameTxt_.text = var_136_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_16 = arg_133_1:GetWordFromCfg(114251033)
				local var_136_17 = arg_133_1:FormatText(var_136_16.content)

				arg_133_1.text_.text = var_136_17

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_18 = 52
				local var_136_19 = utf8.len(var_136_17)
				local var_136_20 = var_136_18 <= 0 and var_136_14 or var_136_14 * (var_136_19 / var_136_18)

				if var_136_20 > 0 and var_136_14 < var_136_20 then
					arg_133_1.talkMaxDuration = var_136_20

					if var_136_20 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_13
					end
				end

				arg_133_1.text_.text = var_136_17
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251033", "story_v_out_114251.awb") ~= 0 then
					local var_136_21 = manager.audio:GetVoiceLength("story_v_out_114251", "114251033", "story_v_out_114251.awb") / 1000

					if var_136_21 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_21 + var_136_13
					end

					if var_136_16.prefab_name ~= "" and arg_133_1.actors_[var_136_16.prefab_name] ~= nil then
						local var_136_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_16.prefab_name].transform, "story_v_out_114251", "114251033", "story_v_out_114251.awb")

						arg_133_1:RecordAudio("114251033", var_136_22)
						arg_133_1:RecordAudio("114251033", var_136_22)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_114251", "114251033", "story_v_out_114251.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_114251", "114251033", "story_v_out_114251.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_23 = math.max(var_136_14, arg_133_1.talkMaxDuration)

			if var_136_13 <= arg_133_1.time_ and arg_133_1.time_ < var_136_13 + var_136_23 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_13) / var_136_23

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_13 + var_136_23 and arg_133_1.time_ < var_136_13 + var_136_23 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play114251034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 114251034
		arg_137_1.duration_ = 6.9

		local var_137_0 = {
			ja = 6.066,
			ko = 6.833,
			zh = 5.7,
			en = 6.9
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
				arg_137_0:Play114251035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10015"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos10015 = var_140_0.localPosition
				var_140_0.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("10015", 4)

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
				local var_140_6 = Vector3.New(390, -350, -180)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10015, var_140_6, var_140_5)
			end

			if arg_137_1.time_ >= var_140_1 + var_140_4 and arg_137_1.time_ < var_140_1 + var_140_4 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_140_7 = arg_137_1.actors_["10018"]
			local var_140_8 = 0

			if var_140_8 < arg_137_1.time_ and arg_137_1.time_ <= var_140_8 + arg_140_0 and arg_137_1.var_.actorSpriteComps10018 == nil then
				arg_137_1.var_.actorSpriteComps10018 = var_140_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_9 = 0.034

			if var_140_8 <= arg_137_1.time_ and arg_137_1.time_ < var_140_8 + var_140_9 then
				local var_140_10 = (arg_137_1.time_ - var_140_8) / var_140_9

				if arg_137_1.var_.actorSpriteComps10018 then
					for iter_140_1, iter_140_2 in pairs(arg_137_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_140_2 then
							local var_140_11 = Mathf.Lerp(iter_140_2.color.r, 0.5, var_140_10)

							iter_140_2.color = Color.New(var_140_11, var_140_11, var_140_11)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_8 + var_140_9 and arg_137_1.time_ < var_140_8 + var_140_9 + arg_140_0 and arg_137_1.var_.actorSpriteComps10018 then
				local var_140_12 = 0.5

				for iter_140_3, iter_140_4 in pairs(arg_137_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_140_4 then
						iter_140_4.color = Color.New(var_140_12, var_140_12, var_140_12)
					end
				end

				arg_137_1.var_.actorSpriteComps10018 = nil
			end

			local var_140_13 = arg_137_1.actors_["10015"]
			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 and arg_137_1.var_.actorSpriteComps10015 == nil then
				arg_137_1.var_.actorSpriteComps10015 = var_140_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_15 = 0.034

			if var_140_14 <= arg_137_1.time_ and arg_137_1.time_ < var_140_14 + var_140_15 then
				local var_140_16 = (arg_137_1.time_ - var_140_14) / var_140_15

				if arg_137_1.var_.actorSpriteComps10015 then
					for iter_140_5, iter_140_6 in pairs(arg_137_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_140_6 then
							local var_140_17 = Mathf.Lerp(iter_140_6.color.r, 1, var_140_16)

							iter_140_6.color = Color.New(var_140_17, var_140_17, var_140_17)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_14 + var_140_15 and arg_137_1.time_ < var_140_14 + var_140_15 + arg_140_0 and arg_137_1.var_.actorSpriteComps10015 then
				local var_140_18 = 1

				for iter_140_7, iter_140_8 in pairs(arg_137_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_140_8 then
						iter_140_8.color = Color.New(var_140_18, var_140_18, var_140_18)
					end
				end

				arg_137_1.var_.actorSpriteComps10015 = nil
			end

			local var_140_19 = 0
			local var_140_20 = 0.65

			if var_140_19 < arg_137_1.time_ and arg_137_1.time_ <= var_140_19 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_21 = arg_137_1:FormatText(StoryNameCfg[208].name)

				arg_137_1.leftNameTxt_.text = var_140_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_22 = arg_137_1:GetWordFromCfg(114251034)
				local var_140_23 = arg_137_1:FormatText(var_140_22.content)

				arg_137_1.text_.text = var_140_23

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_24 = 26
				local var_140_25 = utf8.len(var_140_23)
				local var_140_26 = var_140_24 <= 0 and var_140_20 or var_140_20 * (var_140_25 / var_140_24)

				if var_140_26 > 0 and var_140_20 < var_140_26 then
					arg_137_1.talkMaxDuration = var_140_26

					if var_140_26 + var_140_19 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_26 + var_140_19
					end
				end

				arg_137_1.text_.text = var_140_23
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251034", "story_v_out_114251.awb") ~= 0 then
					local var_140_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251034", "story_v_out_114251.awb") / 1000

					if var_140_27 + var_140_19 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_27 + var_140_19
					end

					if var_140_22.prefab_name ~= "" and arg_137_1.actors_[var_140_22.prefab_name] ~= nil then
						local var_140_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_22.prefab_name].transform, "story_v_out_114251", "114251034", "story_v_out_114251.awb")

						arg_137_1:RecordAudio("114251034", var_140_28)
						arg_137_1:RecordAudio("114251034", var_140_28)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_114251", "114251034", "story_v_out_114251.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_114251", "114251034", "story_v_out_114251.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_29 = math.max(var_140_20, arg_137_1.talkMaxDuration)

			if var_140_19 <= arg_137_1.time_ and arg_137_1.time_ < var_140_19 + var_140_29 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_19) / var_140_29

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_19 + var_140_29 and arg_137_1.time_ < var_140_19 + var_140_29 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play114251035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 114251035
		arg_141_1.duration_ = 9.366

		local var_141_0 = {
			ja = 9.366,
			ko = 6.733,
			zh = 4.966,
			en = 5.333
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
				arg_141_0:Play114251036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.55

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[208].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(114251035)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 22
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251035", "story_v_out_114251.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251035", "story_v_out_114251.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_114251", "114251035", "story_v_out_114251.awb")

						arg_141_1:RecordAudio("114251035", var_144_9)
						arg_141_1:RecordAudio("114251035", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_114251", "114251035", "story_v_out_114251.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_114251", "114251035", "story_v_out_114251.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_10 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_10 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_10

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_10 and arg_141_1.time_ < var_144_0 + var_144_10 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play114251036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 114251036
		arg_145_1.duration_ = 7.166

		local var_145_0 = {
			ja = 4.566,
			ko = 6.466,
			zh = 5.7,
			en = 7.166
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
				arg_145_0:Play114251037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10018"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.actorSpriteComps10018 == nil then
				arg_145_1.var_.actorSpriteComps10018 = var_148_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_2 = 0.034

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.actorSpriteComps10018 then
					for iter_148_0, iter_148_1 in pairs(arg_145_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_148_1 then
							local var_148_4 = Mathf.Lerp(iter_148_1.color.r, 1, var_148_3)

							iter_148_1.color = Color.New(var_148_4, var_148_4, var_148_4)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.actorSpriteComps10018 then
				local var_148_5 = 1

				for iter_148_2, iter_148_3 in pairs(arg_145_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_148_3 then
						iter_148_3.color = Color.New(var_148_5, var_148_5, var_148_5)
					end
				end

				arg_145_1.var_.actorSpriteComps10018 = nil
			end

			local var_148_6 = arg_145_1.actors_["10015"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.actorSpriteComps10015 == nil then
				arg_145_1.var_.actorSpriteComps10015 = var_148_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_8 = 0.034

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.actorSpriteComps10015 then
					for iter_148_4, iter_148_5 in pairs(arg_145_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_148_5 then
							local var_148_10 = Mathf.Lerp(iter_148_5.color.r, 0.5, var_148_9)

							iter_148_5.color = Color.New(var_148_10, var_148_10, var_148_10)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.actorSpriteComps10015 then
				local var_148_11 = 0.5

				for iter_148_6, iter_148_7 in pairs(arg_145_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_148_7 then
						iter_148_7.color = Color.New(var_148_11, var_148_11, var_148_11)
					end
				end

				arg_145_1.var_.actorSpriteComps10015 = nil
			end

			local var_148_12 = 0
			local var_148_13 = 0.45

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_14 = arg_145_1:FormatText(StoryNameCfg[257].name)

				arg_145_1.leftNameTxt_.text = var_148_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(114251036)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 18
				local var_148_18 = utf8.len(var_148_16)
				local var_148_19 = var_148_17 <= 0 and var_148_13 or var_148_13 * (var_148_18 / var_148_17)

				if var_148_19 > 0 and var_148_13 < var_148_19 then
					arg_145_1.talkMaxDuration = var_148_19

					if var_148_19 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_12
					end
				end

				arg_145_1.text_.text = var_148_16
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251036", "story_v_out_114251.awb") ~= 0 then
					local var_148_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251036", "story_v_out_114251.awb") / 1000

					if var_148_20 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_12
					end

					if var_148_15.prefab_name ~= "" and arg_145_1.actors_[var_148_15.prefab_name] ~= nil then
						local var_148_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_15.prefab_name].transform, "story_v_out_114251", "114251036", "story_v_out_114251.awb")

						arg_145_1:RecordAudio("114251036", var_148_21)
						arg_145_1:RecordAudio("114251036", var_148_21)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_114251", "114251036", "story_v_out_114251.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_114251", "114251036", "story_v_out_114251.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_22 = math.max(var_148_13, arg_145_1.talkMaxDuration)

			if var_148_12 <= arg_145_1.time_ and arg_145_1.time_ < var_148_12 + var_148_22 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_12) / var_148_22

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_12 + var_148_22 and arg_145_1.time_ < var_148_12 + var_148_22 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play114251037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 114251037
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play114251038(arg_149_1)
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

			local var_152_6 = 0
			local var_152_7 = 0.8

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_8 = arg_149_1:GetWordFromCfg(114251037)
				local var_152_9 = arg_149_1:FormatText(var_152_8.content)

				arg_149_1.text_.text = var_152_9

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_10 = 32
				local var_152_11 = utf8.len(var_152_9)
				local var_152_12 = var_152_10 <= 0 and var_152_7 or var_152_7 * (var_152_11 / var_152_10)

				if var_152_12 > 0 and var_152_7 < var_152_12 then
					arg_149_1.talkMaxDuration = var_152_12

					if var_152_12 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_12 + var_152_6
					end
				end

				arg_149_1.text_.text = var_152_9
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_13 = math.max(var_152_7, arg_149_1.talkMaxDuration)

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_13 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_6) / var_152_13

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_6 + var_152_13 and arg_149_1.time_ < var_152_6 + var_152_13 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play114251038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 114251038
		arg_153_1.duration_ = 3.5

		local var_153_0 = {
			ja = 3.5,
			ko = 1.7,
			zh = 2.8,
			en = 1.7
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
				arg_153_0:Play114251039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10015"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos10015 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("10015", 4)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "split_5" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(390, -350, -180)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10015, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_156_7 = arg_153_1.actors_["10015"]
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 and arg_153_1.var_.actorSpriteComps10015 == nil then
				arg_153_1.var_.actorSpriteComps10015 = var_156_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_9 = 0.034

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_8) / var_156_9

				if arg_153_1.var_.actorSpriteComps10015 then
					for iter_156_1, iter_156_2 in pairs(arg_153_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_156_2 then
							local var_156_11 = Mathf.Lerp(iter_156_2.color.r, 1, var_156_10)

							iter_156_2.color = Color.New(var_156_11, var_156_11, var_156_11)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_8 + var_156_9 and arg_153_1.time_ < var_156_8 + var_156_9 + arg_156_0 and arg_153_1.var_.actorSpriteComps10015 then
				local var_156_12 = 1

				for iter_156_3, iter_156_4 in pairs(arg_153_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_156_4 then
						iter_156_4.color = Color.New(var_156_12, var_156_12, var_156_12)
					end
				end

				arg_153_1.var_.actorSpriteComps10015 = nil
			end

			local var_156_13 = 0
			local var_156_14 = 0.225

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_15 = arg_153_1:FormatText(StoryNameCfg[208].name)

				arg_153_1.leftNameTxt_.text = var_156_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_16 = arg_153_1:GetWordFromCfg(114251038)
				local var_156_17 = arg_153_1:FormatText(var_156_16.content)

				arg_153_1.text_.text = var_156_17

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_18 = 9
				local var_156_19 = utf8.len(var_156_17)
				local var_156_20 = var_156_18 <= 0 and var_156_14 or var_156_14 * (var_156_19 / var_156_18)

				if var_156_20 > 0 and var_156_14 < var_156_20 then
					arg_153_1.talkMaxDuration = var_156_20

					if var_156_20 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_20 + var_156_13
					end
				end

				arg_153_1.text_.text = var_156_17
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251038", "story_v_out_114251.awb") ~= 0 then
					local var_156_21 = manager.audio:GetVoiceLength("story_v_out_114251", "114251038", "story_v_out_114251.awb") / 1000

					if var_156_21 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_21 + var_156_13
					end

					if var_156_16.prefab_name ~= "" and arg_153_1.actors_[var_156_16.prefab_name] ~= nil then
						local var_156_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_16.prefab_name].transform, "story_v_out_114251", "114251038", "story_v_out_114251.awb")

						arg_153_1:RecordAudio("114251038", var_156_22)
						arg_153_1:RecordAudio("114251038", var_156_22)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_114251", "114251038", "story_v_out_114251.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_114251", "114251038", "story_v_out_114251.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_23 = math.max(var_156_14, arg_153_1.talkMaxDuration)

			if var_156_13 <= arg_153_1.time_ and arg_153_1.time_ < var_156_13 + var_156_23 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_13) / var_156_23

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_13 + var_156_23 and arg_153_1.time_ < var_156_13 + var_156_23 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play114251039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 114251039
		arg_157_1.duration_ = 9

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play114251040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = "ST24a"

			if arg_157_1.bgs_[var_160_0] == nil then
				local var_160_1 = Object.Instantiate(arg_157_1.paintGo_)

				var_160_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_160_0)
				var_160_1.name = var_160_0
				var_160_1.transform.parent = arg_157_1.stage_.transform
				var_160_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_157_1.bgs_[var_160_0] = var_160_1
			end

			local var_160_2 = 2

			if var_160_2 < arg_157_1.time_ and arg_157_1.time_ <= var_160_2 + arg_160_0 then
				local var_160_3 = manager.ui.mainCamera.transform.localPosition
				local var_160_4 = Vector3.New(0, 0, 10) + Vector3.New(var_160_3.x, var_160_3.y, 0)
				local var_160_5 = arg_157_1.bgs_.ST24a

				var_160_5.transform.localPosition = var_160_4
				var_160_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_160_6 = var_160_5:GetComponent("SpriteRenderer")

				if var_160_6 and var_160_6.sprite then
					local var_160_7 = (var_160_5.transform.localPosition - var_160_3).z
					local var_160_8 = manager.ui.mainCameraCom_
					local var_160_9 = 2 * var_160_7 * Mathf.Tan(var_160_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_160_10 = var_160_9 * var_160_8.aspect
					local var_160_11 = var_160_6.sprite.bounds.size.x
					local var_160_12 = var_160_6.sprite.bounds.size.y
					local var_160_13 = var_160_10 / var_160_11
					local var_160_14 = var_160_9 / var_160_12
					local var_160_15 = var_160_14 < var_160_13 and var_160_13 or var_160_14

					var_160_5.transform.localScale = Vector3.New(var_160_15, var_160_15, 0)
				end

				for iter_160_0, iter_160_1 in pairs(arg_157_1.bgs_) do
					if iter_160_0 ~= "ST24a" then
						iter_160_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_160_16 = 0

			if var_160_16 < arg_157_1.time_ and arg_157_1.time_ <= var_160_16 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_17 = 2

			if var_160_16 <= arg_157_1.time_ and arg_157_1.time_ < var_160_16 + var_160_17 then
				local var_160_18 = (arg_157_1.time_ - var_160_16) / var_160_17
				local var_160_19 = Color.New(0, 0, 0)

				var_160_19.a = Mathf.Lerp(0, 1, var_160_18)
				arg_157_1.mask_.color = var_160_19
			end

			if arg_157_1.time_ >= var_160_16 + var_160_17 and arg_157_1.time_ < var_160_16 + var_160_17 + arg_160_0 then
				local var_160_20 = Color.New(0, 0, 0)

				var_160_20.a = 1
				arg_157_1.mask_.color = var_160_20
			end

			local var_160_21 = 2

			if var_160_21 < arg_157_1.time_ and arg_157_1.time_ <= var_160_21 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_22 = 2

			if var_160_21 <= arg_157_1.time_ and arg_157_1.time_ < var_160_21 + var_160_22 then
				local var_160_23 = (arg_157_1.time_ - var_160_21) / var_160_22
				local var_160_24 = Color.New(0, 0, 0)

				var_160_24.a = Mathf.Lerp(1, 0, var_160_23)
				arg_157_1.mask_.color = var_160_24
			end

			if arg_157_1.time_ >= var_160_21 + var_160_22 and arg_157_1.time_ < var_160_21 + var_160_22 + arg_160_0 then
				local var_160_25 = Color.New(0, 0, 0)
				local var_160_26 = 0

				arg_157_1.mask_.enabled = false
				var_160_25.a = var_160_26
				arg_157_1.mask_.color = var_160_25
			end

			local var_160_27 = arg_157_1.actors_["10018"].transform
			local var_160_28 = 1.966

			if var_160_28 < arg_157_1.time_ and arg_157_1.time_ <= var_160_28 + arg_160_0 then
				arg_157_1.var_.moveOldPos10018 = var_160_27.localPosition
				var_160_27.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("10018", 7)

				local var_160_29 = var_160_27.childCount

				for iter_160_2 = 0, var_160_29 - 1 do
					local var_160_30 = var_160_27:GetChild(iter_160_2)

					if var_160_30.name == "split_2" or not string.find(var_160_30.name, "split") then
						var_160_30.gameObject:SetActive(true)
					else
						var_160_30.gameObject:SetActive(false)
					end
				end
			end

			local var_160_31 = 0.001

			if var_160_28 <= arg_157_1.time_ and arg_157_1.time_ < var_160_28 + var_160_31 then
				local var_160_32 = (arg_157_1.time_ - var_160_28) / var_160_31
				local var_160_33 = Vector3.New(0, -2000, -180)

				var_160_27.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10018, var_160_33, var_160_32)
			end

			if arg_157_1.time_ >= var_160_28 + var_160_31 and arg_157_1.time_ < var_160_28 + var_160_31 + arg_160_0 then
				var_160_27.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_160_34 = arg_157_1.actors_["10015"].transform
			local var_160_35 = 1.966

			if var_160_35 < arg_157_1.time_ and arg_157_1.time_ <= var_160_35 + arg_160_0 then
				arg_157_1.var_.moveOldPos10015 = var_160_34.localPosition
				var_160_34.localScale = Vector3.New(1, 1, 1)

				arg_157_1:CheckSpriteTmpPos("10015", 7)

				local var_160_36 = var_160_34.childCount

				for iter_160_3 = 0, var_160_36 - 1 do
					local var_160_37 = var_160_34:GetChild(iter_160_3)

					if var_160_37.name == "split_5" or not string.find(var_160_37.name, "split") then
						var_160_37.gameObject:SetActive(true)
					else
						var_160_37.gameObject:SetActive(false)
					end
				end
			end

			local var_160_38 = 0.001

			if var_160_35 <= arg_157_1.time_ and arg_157_1.time_ < var_160_35 + var_160_38 then
				local var_160_39 = (arg_157_1.time_ - var_160_35) / var_160_38
				local var_160_40 = Vector3.New(0, -2000, 450)

				var_160_34.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10015, var_160_40, var_160_39)
			end

			if arg_157_1.time_ >= var_160_35 + var_160_38 and arg_157_1.time_ < var_160_35 + var_160_38 + arg_160_0 then
				var_160_34.localPosition = Vector3.New(0, -2000, 450)
			end

			if arg_157_1.frameCnt_ <= 1 then
				arg_157_1.dialog_:SetActive(false)
			end

			local var_160_41 = 4
			local var_160_42 = 0.05

			if var_160_41 < arg_157_1.time_ and arg_157_1.time_ <= var_160_41 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0

				arg_157_1.dialog_:SetActive(true)

				local var_160_43 = LeanTween.value(arg_157_1.dialog_, 0, 1, 0.3)

				var_160_43:setOnUpdate(LuaHelper.FloatAction(function(arg_161_0)
					arg_157_1.dialogCg_.alpha = arg_161_0
				end))
				var_160_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_157_1.dialog_)
					var_160_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_157_1.duration_ = arg_157_1.duration_ + 0.3

				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_44 = arg_157_1:GetWordFromCfg(114251039)
				local var_160_45 = arg_157_1:FormatText(var_160_44.content)

				arg_157_1.text_.text = var_160_45

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_46 = 2
				local var_160_47 = utf8.len(var_160_45)
				local var_160_48 = var_160_46 <= 0 and var_160_42 or var_160_42 * (var_160_47 / var_160_46)

				if var_160_48 > 0 and var_160_42 < var_160_48 then
					arg_157_1.talkMaxDuration = var_160_48
					var_160_41 = var_160_41 + 0.3

					if var_160_48 + var_160_41 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_48 + var_160_41
					end
				end

				arg_157_1.text_.text = var_160_45
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_49 = var_160_41 + 0.3
			local var_160_50 = math.max(var_160_42, arg_157_1.talkMaxDuration)

			if var_160_49 <= arg_157_1.time_ and arg_157_1.time_ < var_160_49 + var_160_50 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_49) / var_160_50

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_49 + var_160_50 and arg_157_1.time_ < var_160_49 + var_160_50 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play114251040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 114251040
		arg_163_1.duration_ = 8.3

		local var_163_0 = {
			ja = 8.3,
			ko = 6.5,
			zh = 6.6,
			en = 6.266
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
				arg_163_0:Play114251041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = "10021"

			if arg_163_1.actors_[var_166_0] == nil then
				local var_166_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_166_0), arg_163_1.canvasGo_.transform)

				var_166_1.transform:SetSiblingIndex(1)

				var_166_1.name = var_166_0
				var_166_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_163_1.actors_[var_166_0] = var_166_1
			end

			local var_166_2 = arg_163_1.actors_["10021"].transform
			local var_166_3 = 0

			if var_166_3 < arg_163_1.time_ and arg_163_1.time_ <= var_166_3 + arg_166_0 then
				arg_163_1.var_.moveOldPos10021 = var_166_2.localPosition
				var_166_2.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10021", 2)

				local var_166_4 = var_166_2.childCount

				for iter_166_0 = 0, var_166_4 - 1 do
					local var_166_5 = var_166_2:GetChild(iter_166_0)

					if var_166_5.name == "split_1" or not string.find(var_166_5.name, "split") then
						var_166_5.gameObject:SetActive(true)
					else
						var_166_5.gameObject:SetActive(false)
					end
				end
			end

			local var_166_6 = 0.001

			if var_166_3 <= arg_163_1.time_ and arg_163_1.time_ < var_166_3 + var_166_6 then
				local var_166_7 = (arg_163_1.time_ - var_166_3) / var_166_6
				local var_166_8 = Vector3.New(-390, -350, -180)

				var_166_2.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10021, var_166_8, var_166_7)
			end

			if arg_163_1.time_ >= var_166_3 + var_166_6 and arg_163_1.time_ < var_166_3 + var_166_6 + arg_166_0 then
				var_166_2.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_166_9 = arg_163_1.actors_["10021"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.actorSpriteComps10021 == nil then
				arg_163_1.var_.actorSpriteComps10021 = var_166_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_11 = 0.034

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.actorSpriteComps10021 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_166_2 then
							local var_166_13 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_12)

							iter_166_2.color = Color.New(var_166_13, var_166_13, var_166_13)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.actorSpriteComps10021 then
				local var_166_14 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_14, var_166_14, var_166_14)
					end
				end

				arg_163_1.var_.actorSpriteComps10021 = nil
			end

			local var_166_15 = arg_163_1.actors_["10021"]
			local var_166_16 = 0

			if var_166_16 < arg_163_1.time_ and arg_163_1.time_ <= var_166_16 + arg_166_0 then
				local var_166_17 = var_166_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_166_17 then
					arg_163_1.var_.alphaOldValue10021 = var_166_17.alpha
					arg_163_1.var_.characterEffect10021 = var_166_17
				end

				arg_163_1.var_.alphaOldValue10021 = 0
			end

			local var_166_18 = 0.5

			if var_166_16 <= arg_163_1.time_ and arg_163_1.time_ < var_166_16 + var_166_18 then
				local var_166_19 = (arg_163_1.time_ - var_166_16) / var_166_18
				local var_166_20 = Mathf.Lerp(arg_163_1.var_.alphaOldValue10021, 1, var_166_19)

				if arg_163_1.var_.characterEffect10021 then
					arg_163_1.var_.characterEffect10021.alpha = var_166_20
				end
			end

			if arg_163_1.time_ >= var_166_16 + var_166_18 and arg_163_1.time_ < var_166_16 + var_166_18 + arg_166_0 and arg_163_1.var_.characterEffect10021 then
				arg_163_1.var_.characterEffect10021.alpha = 1
			end

			local var_166_21 = 0
			local var_166_22 = 0.775

			if var_166_21 < arg_163_1.time_ and arg_163_1.time_ <= var_166_21 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_23 = arg_163_1:FormatText(StoryNameCfg[226].name)

				arg_163_1.leftNameTxt_.text = var_166_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_24 = arg_163_1:GetWordFromCfg(114251040)
				local var_166_25 = arg_163_1:FormatText(var_166_24.content)

				arg_163_1.text_.text = var_166_25

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_26 = 30
				local var_166_27 = utf8.len(var_166_25)
				local var_166_28 = var_166_26 <= 0 and var_166_22 or var_166_22 * (var_166_27 / var_166_26)

				if var_166_28 > 0 and var_166_22 < var_166_28 then
					arg_163_1.talkMaxDuration = var_166_28

					if var_166_28 + var_166_21 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_28 + var_166_21
					end
				end

				arg_163_1.text_.text = var_166_25
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251040", "story_v_out_114251.awb") ~= 0 then
					local var_166_29 = manager.audio:GetVoiceLength("story_v_out_114251", "114251040", "story_v_out_114251.awb") / 1000

					if var_166_29 + var_166_21 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_29 + var_166_21
					end

					if var_166_24.prefab_name ~= "" and arg_163_1.actors_[var_166_24.prefab_name] ~= nil then
						local var_166_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_24.prefab_name].transform, "story_v_out_114251", "114251040", "story_v_out_114251.awb")

						arg_163_1:RecordAudio("114251040", var_166_30)
						arg_163_1:RecordAudio("114251040", var_166_30)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_114251", "114251040", "story_v_out_114251.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_114251", "114251040", "story_v_out_114251.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_31 = math.max(var_166_22, arg_163_1.talkMaxDuration)

			if var_166_21 <= arg_163_1.time_ and arg_163_1.time_ < var_166_21 + var_166_31 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_21) / var_166_31

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_21 + var_166_31 and arg_163_1.time_ < var_166_21 + var_166_31 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play114251041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 114251041
		arg_167_1.duration_ = 11

		local var_167_0 = {
			ja = 11,
			ko = 9.3,
			zh = 7.8,
			en = 10.666
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
				arg_167_0:Play114251042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10018"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos10018 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10018", 4)

				local var_170_2 = var_170_0.childCount

				for iter_170_0 = 0, var_170_2 - 1 do
					local var_170_3 = var_170_0:GetChild(iter_170_0)

					if var_170_3.name == "split_1" or not string.find(var_170_3.name, "split") then
						var_170_3.gameObject:SetActive(true)
					else
						var_170_3.gameObject:SetActive(false)
					end
				end
			end

			local var_170_4 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_1) / var_170_4
				local var_170_6 = Vector3.New(390, -350, -180)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10018, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_170_7 = arg_167_1.actors_["10021"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps10021 == nil then
				arg_167_1.var_.actorSpriteComps10021 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.034

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps10021 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 0.5, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps10021 then
				local var_170_12 = 0.5

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps10021 = nil
			end

			local var_170_13 = arg_167_1.actors_["10018"]
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 and arg_167_1.var_.actorSpriteComps10018 == nil then
				arg_167_1.var_.actorSpriteComps10018 = var_170_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_15 = 0.034

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_15 then
				local var_170_16 = (arg_167_1.time_ - var_170_14) / var_170_15

				if arg_167_1.var_.actorSpriteComps10018 then
					for iter_170_5, iter_170_6 in pairs(arg_167_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_170_6 then
							local var_170_17 = Mathf.Lerp(iter_170_6.color.r, 1, var_170_16)

							iter_170_6.color = Color.New(var_170_17, var_170_17, var_170_17)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_14 + var_170_15 and arg_167_1.time_ < var_170_14 + var_170_15 + arg_170_0 and arg_167_1.var_.actorSpriteComps10018 then
				local var_170_18 = 1

				for iter_170_7, iter_170_8 in pairs(arg_167_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_170_8 then
						iter_170_8.color = Color.New(var_170_18, var_170_18, var_170_18)
					end
				end

				arg_167_1.var_.actorSpriteComps10018 = nil
			end

			local var_170_19 = arg_167_1.actors_["10018"]
			local var_170_20 = 0

			if var_170_20 < arg_167_1.time_ and arg_167_1.time_ <= var_170_20 + arg_170_0 then
				local var_170_21 = var_170_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_170_21 then
					arg_167_1.var_.alphaOldValue10018 = var_170_21.alpha
					arg_167_1.var_.characterEffect10018 = var_170_21
				end

				arg_167_1.var_.alphaOldValue10018 = 0
			end

			local var_170_22 = 0.5

			if var_170_20 <= arg_167_1.time_ and arg_167_1.time_ < var_170_20 + var_170_22 then
				local var_170_23 = (arg_167_1.time_ - var_170_20) / var_170_22
				local var_170_24 = Mathf.Lerp(arg_167_1.var_.alphaOldValue10018, 1, var_170_23)

				if arg_167_1.var_.characterEffect10018 then
					arg_167_1.var_.characterEffect10018.alpha = var_170_24
				end
			end

			if arg_167_1.time_ >= var_170_20 + var_170_22 and arg_167_1.time_ < var_170_20 + var_170_22 + arg_170_0 and arg_167_1.var_.characterEffect10018 then
				arg_167_1.var_.characterEffect10018.alpha = 1
			end

			local var_170_25 = 0
			local var_170_26 = 1.025

			if var_170_25 < arg_167_1.time_ and arg_167_1.time_ <= var_170_25 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_27 = arg_167_1:FormatText(StoryNameCfg[258].name)

				arg_167_1.leftNameTxt_.text = var_170_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_28 = arg_167_1:GetWordFromCfg(114251041)
				local var_170_29 = arg_167_1:FormatText(var_170_28.content)

				arg_167_1.text_.text = var_170_29

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_30 = 41
				local var_170_31 = utf8.len(var_170_29)
				local var_170_32 = var_170_30 <= 0 and var_170_26 or var_170_26 * (var_170_31 / var_170_30)

				if var_170_32 > 0 and var_170_26 < var_170_32 then
					arg_167_1.talkMaxDuration = var_170_32

					if var_170_32 + var_170_25 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_32 + var_170_25
					end
				end

				arg_167_1.text_.text = var_170_29
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251041", "story_v_out_114251.awb") ~= 0 then
					local var_170_33 = manager.audio:GetVoiceLength("story_v_out_114251", "114251041", "story_v_out_114251.awb") / 1000

					if var_170_33 + var_170_25 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_33 + var_170_25
					end

					if var_170_28.prefab_name ~= "" and arg_167_1.actors_[var_170_28.prefab_name] ~= nil then
						local var_170_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_28.prefab_name].transform, "story_v_out_114251", "114251041", "story_v_out_114251.awb")

						arg_167_1:RecordAudio("114251041", var_170_34)
						arg_167_1:RecordAudio("114251041", var_170_34)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_114251", "114251041", "story_v_out_114251.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_114251", "114251041", "story_v_out_114251.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_35 = math.max(var_170_26, arg_167_1.talkMaxDuration)

			if var_170_25 <= arg_167_1.time_ and arg_167_1.time_ < var_170_25 + var_170_35 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_25) / var_170_35

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_25 + var_170_35 and arg_167_1.time_ < var_170_25 + var_170_35 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play114251042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 114251042
		arg_171_1.duration_ = 3.633

		local var_171_0 = {
			ja = 3.066,
			ko = 1.766,
			zh = 2.033,
			en = 3.633
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
				arg_171_0:Play114251043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10021"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps10021 == nil then
				arg_171_1.var_.actorSpriteComps10021 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 0.034

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps10021 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_174_1 then
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 1, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps10021 then
				local var_174_5 = 1

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps10021 = nil
			end

			local var_174_6 = arg_171_1.actors_["10018"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 and arg_171_1.var_.actorSpriteComps10018 == nil then
				arg_171_1.var_.actorSpriteComps10018 = var_174_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_8 = 0.034

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8

				if arg_171_1.var_.actorSpriteComps10018 then
					for iter_174_4, iter_174_5 in pairs(arg_171_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_174_5 then
							local var_174_10 = Mathf.Lerp(iter_174_5.color.r, 0.5, var_174_9)

							iter_174_5.color = Color.New(var_174_10, var_174_10, var_174_10)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps10018 then
				local var_174_11 = 0.5

				for iter_174_6, iter_174_7 in pairs(arg_171_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_174_7 then
						iter_174_7.color = Color.New(var_174_11, var_174_11, var_174_11)
					end
				end

				arg_171_1.var_.actorSpriteComps10018 = nil
			end

			local var_174_12 = 0
			local var_174_13 = 0.225

			if var_174_12 < arg_171_1.time_ and arg_171_1.time_ <= var_174_12 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_14 = arg_171_1:FormatText(StoryNameCfg[226].name)

				arg_171_1.leftNameTxt_.text = var_174_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_15 = arg_171_1:GetWordFromCfg(114251042)
				local var_174_16 = arg_171_1:FormatText(var_174_15.content)

				arg_171_1.text_.text = var_174_16

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_17 = 9
				local var_174_18 = utf8.len(var_174_16)
				local var_174_19 = var_174_17 <= 0 and var_174_13 or var_174_13 * (var_174_18 / var_174_17)

				if var_174_19 > 0 and var_174_13 < var_174_19 then
					arg_171_1.talkMaxDuration = var_174_19

					if var_174_19 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_19 + var_174_12
					end
				end

				arg_171_1.text_.text = var_174_16
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251042", "story_v_out_114251.awb") ~= 0 then
					local var_174_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251042", "story_v_out_114251.awb") / 1000

					if var_174_20 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_20 + var_174_12
					end

					if var_174_15.prefab_name ~= "" and arg_171_1.actors_[var_174_15.prefab_name] ~= nil then
						local var_174_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_15.prefab_name].transform, "story_v_out_114251", "114251042", "story_v_out_114251.awb")

						arg_171_1:RecordAudio("114251042", var_174_21)
						arg_171_1:RecordAudio("114251042", var_174_21)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_114251", "114251042", "story_v_out_114251.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_114251", "114251042", "story_v_out_114251.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_22 = math.max(var_174_13, arg_171_1.talkMaxDuration)

			if var_174_12 <= arg_171_1.time_ and arg_171_1.time_ < var_174_12 + var_174_22 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_12) / var_174_22

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_12 + var_174_22 and arg_171_1.time_ < var_174_12 + var_174_22 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play114251043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 114251043
		arg_175_1.duration_ = 9.2

		local var_175_0 = {
			ja = 7.866,
			ko = 8.733,
			zh = 9.2,
			en = 8.4
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
				arg_175_0:Play114251044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 1.225

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[226].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(114251043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251043", "story_v_out_114251.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251043", "story_v_out_114251.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_114251", "114251043", "story_v_out_114251.awb")

						arg_175_1:RecordAudio("114251043", var_178_9)
						arg_175_1:RecordAudio("114251043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_114251", "114251043", "story_v_out_114251.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_114251", "114251043", "story_v_out_114251.awb")
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
	Play114251044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 114251044
		arg_179_1.duration_ = 9.4

		local var_179_0 = {
			ja = 6.066,
			ko = 8.666,
			zh = 8.9,
			en = 9.4
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
				arg_179_0:Play114251045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 1.05

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[226].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(114251044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251044", "story_v_out_114251.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251044", "story_v_out_114251.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_114251", "114251044", "story_v_out_114251.awb")

						arg_179_1:RecordAudio("114251044", var_182_9)
						arg_179_1:RecordAudio("114251044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_114251", "114251044", "story_v_out_114251.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_114251", "114251044", "story_v_out_114251.awb")
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
	Play114251045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 114251045
		arg_183_1.duration_ = 5.433

		local var_183_0 = {
			ja = 5.433,
			ko = 2.366,
			zh = 4.033,
			en = 3.633
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
				arg_183_0:Play114251046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10018"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10018 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10018", 4)

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
				local var_186_6 = Vector3.New(390, -350, -180)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10018, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_186_7 = arg_183_1.actors_["10021"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps10021 == nil then
				arg_183_1.var_.actorSpriteComps10021 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps10021 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 0.5, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps10021 then
				local var_186_12 = 0.5

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps10021 = nil
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

			local var_186_19 = 0
			local var_186_20 = 0.25

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[258].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(114251045)
				local var_186_23 = arg_183_1:FormatText(var_186_22.content)

				arg_183_1.text_.text = var_186_23

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_24 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251045", "story_v_out_114251.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251045", "story_v_out_114251.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_114251", "114251045", "story_v_out_114251.awb")

						arg_183_1:RecordAudio("114251045", var_186_28)
						arg_183_1:RecordAudio("114251045", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_114251", "114251045", "story_v_out_114251.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_114251", "114251045", "story_v_out_114251.awb")
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
	Play114251046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 114251046
		arg_187_1.duration_ = 8.966

		local var_187_0 = {
			ja = 4.1,
			ko = 6.2,
			zh = 8.966,
			en = 5.933
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
				arg_187_0:Play114251047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10018"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10018 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10018", 4)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "split_1" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(390, -350, -180)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10018, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_190_7 = arg_187_1.actors_["10018"]
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps10018 == nil then
				arg_187_1.var_.actorSpriteComps10018 = var_190_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_9 = 0.034

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_8) / var_190_9

				if arg_187_1.var_.actorSpriteComps10018 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_190_2 then
							local var_190_11 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_10)

							iter_190_2.color = Color.New(var_190_11, var_190_11, var_190_11)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_8 + var_190_9 and arg_187_1.time_ < var_190_8 + var_190_9 + arg_190_0 and arg_187_1.var_.actorSpriteComps10018 then
				local var_190_12 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_12, var_190_12, var_190_12)
					end
				end

				arg_187_1.var_.actorSpriteComps10018 = nil
			end

			local var_190_13 = 0
			local var_190_14 = 0.575

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_15 = arg_187_1:FormatText(StoryNameCfg[258].name)

				arg_187_1.leftNameTxt_.text = var_190_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_16 = arg_187_1:GetWordFromCfg(114251046)
				local var_190_17 = arg_187_1:FormatText(var_190_16.content)

				arg_187_1.text_.text = var_190_17

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_18 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251046", "story_v_out_114251.awb") ~= 0 then
					local var_190_21 = manager.audio:GetVoiceLength("story_v_out_114251", "114251046", "story_v_out_114251.awb") / 1000

					if var_190_21 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_21 + var_190_13
					end

					if var_190_16.prefab_name ~= "" and arg_187_1.actors_[var_190_16.prefab_name] ~= nil then
						local var_190_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_16.prefab_name].transform, "story_v_out_114251", "114251046", "story_v_out_114251.awb")

						arg_187_1:RecordAudio("114251046", var_190_22)
						arg_187_1:RecordAudio("114251046", var_190_22)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_114251", "114251046", "story_v_out_114251.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_114251", "114251046", "story_v_out_114251.awb")
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
	Play114251047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 114251047
		arg_191_1.duration_ = 7.366

		local var_191_0 = {
			ja = 6.9,
			ko = 5.833,
			zh = 7.366,
			en = 6.2
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
				arg_191_0:Play114251048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10021"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps10021 == nil then
				arg_191_1.var_.actorSpriteComps10021 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 0.034

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps10021 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_194_1 then
							local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 1, var_194_3)

							iter_194_1.color = Color.New(var_194_4, var_194_4, var_194_4)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps10021 then
				local var_194_5 = 1

				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_194_3 then
						iter_194_3.color = Color.New(var_194_5, var_194_5, var_194_5)
					end
				end

				arg_191_1.var_.actorSpriteComps10021 = nil
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
							local var_194_10 = Mathf.Lerp(iter_194_5.color.r, 0.5, var_194_9)

							iter_194_5.color = Color.New(var_194_10, var_194_10, var_194_10)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps10018 then
				local var_194_11 = 0.5

				for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_194_7 then
						iter_194_7.color = Color.New(var_194_11, var_194_11, var_194_11)
					end
				end

				arg_191_1.var_.actorSpriteComps10018 = nil
			end

			local var_194_12 = 0
			local var_194_13 = 0.875

			if var_194_12 < arg_191_1.time_ and arg_191_1.time_ <= var_194_12 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_14 = arg_191_1:FormatText(StoryNameCfg[226].name)

				arg_191_1.leftNameTxt_.text = var_194_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_15 = arg_191_1:GetWordFromCfg(114251047)
				local var_194_16 = arg_191_1:FormatText(var_194_15.content)

				arg_191_1.text_.text = var_194_16

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_17 = 35
				local var_194_18 = utf8.len(var_194_16)
				local var_194_19 = var_194_17 <= 0 and var_194_13 or var_194_13 * (var_194_18 / var_194_17)

				if var_194_19 > 0 and var_194_13 < var_194_19 then
					arg_191_1.talkMaxDuration = var_194_19

					if var_194_19 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_19 + var_194_12
					end
				end

				arg_191_1.text_.text = var_194_16
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251047", "story_v_out_114251.awb") ~= 0 then
					local var_194_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251047", "story_v_out_114251.awb") / 1000

					if var_194_20 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_12
					end

					if var_194_15.prefab_name ~= "" and arg_191_1.actors_[var_194_15.prefab_name] ~= nil then
						local var_194_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_15.prefab_name].transform, "story_v_out_114251", "114251047", "story_v_out_114251.awb")

						arg_191_1:RecordAudio("114251047", var_194_21)
						arg_191_1:RecordAudio("114251047", var_194_21)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_114251", "114251047", "story_v_out_114251.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_114251", "114251047", "story_v_out_114251.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_22 = math.max(var_194_13, arg_191_1.talkMaxDuration)

			if var_194_12 <= arg_191_1.time_ and arg_191_1.time_ < var_194_12 + var_194_22 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_12) / var_194_22

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_12 + var_194_22 and arg_191_1.time_ < var_194_12 + var_194_22 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play114251048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 114251048
		arg_195_1.duration_ = 8.3

		local var_195_0 = {
			ja = 8.3,
			ko = 4.8,
			zh = 5.733,
			en = 6.133
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
				arg_195_0:Play114251049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.675

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[226].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(114251048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 27
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251048", "story_v_out_114251.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251048", "story_v_out_114251.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_114251", "114251048", "story_v_out_114251.awb")

						arg_195_1:RecordAudio("114251048", var_198_9)
						arg_195_1:RecordAudio("114251048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_114251", "114251048", "story_v_out_114251.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_114251", "114251048", "story_v_out_114251.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play114251049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 114251049
		arg_199_1.duration_ = 8.3

		local var_199_0 = {
			ja = 8.3,
			ko = 5.4,
			zh = 5.233,
			en = 4.8
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
				arg_199_0:Play114251050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10021"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.actorSpriteComps10021 == nil then
				arg_199_1.var_.actorSpriteComps10021 = var_202_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_2 = 0.034

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.actorSpriteComps10021 then
					for iter_202_0, iter_202_1 in pairs(arg_199_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_202_1 then
							local var_202_4 = Mathf.Lerp(iter_202_1.color.r, 0.5, var_202_3)

							iter_202_1.color = Color.New(var_202_4, var_202_4, var_202_4)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.actorSpriteComps10021 then
				local var_202_5 = 0.5

				for iter_202_2, iter_202_3 in pairs(arg_199_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_202_3 then
						iter_202_3.color = Color.New(var_202_5, var_202_5, var_202_5)
					end
				end

				arg_199_1.var_.actorSpriteComps10021 = nil
			end

			local var_202_6 = arg_199_1.actors_["10018"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 and arg_199_1.var_.actorSpriteComps10018 == nil then
				arg_199_1.var_.actorSpriteComps10018 = var_202_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_8 = 0.034

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8

				if arg_199_1.var_.actorSpriteComps10018 then
					for iter_202_4, iter_202_5 in pairs(arg_199_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_202_5 then
							local var_202_10 = Mathf.Lerp(iter_202_5.color.r, 1, var_202_9)

							iter_202_5.color = Color.New(var_202_10, var_202_10, var_202_10)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps10018 then
				local var_202_11 = 1

				for iter_202_6, iter_202_7 in pairs(arg_199_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_202_7 then
						iter_202_7.color = Color.New(var_202_11, var_202_11, var_202_11)
					end
				end

				arg_199_1.var_.actorSpriteComps10018 = nil
			end

			local var_202_12 = 0
			local var_202_13 = 0.675

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[258].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(114251049)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 27
				local var_202_18 = utf8.len(var_202_16)
				local var_202_19 = var_202_17 <= 0 and var_202_13 or var_202_13 * (var_202_18 / var_202_17)

				if var_202_19 > 0 and var_202_13 < var_202_19 then
					arg_199_1.talkMaxDuration = var_202_19

					if var_202_19 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_19 + var_202_12
					end
				end

				arg_199_1.text_.text = var_202_16
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251049", "story_v_out_114251.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251049", "story_v_out_114251.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_114251", "114251049", "story_v_out_114251.awb")

						arg_199_1:RecordAudio("114251049", var_202_21)
						arg_199_1:RecordAudio("114251049", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_114251", "114251049", "story_v_out_114251.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_114251", "114251049", "story_v_out_114251.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_22 = math.max(var_202_13, arg_199_1.talkMaxDuration)

			if var_202_12 <= arg_199_1.time_ and arg_199_1.time_ < var_202_12 + var_202_22 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_12) / var_202_22

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_12 + var_202_22 and arg_199_1.time_ < var_202_12 + var_202_22 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play114251050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 114251050
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play114251051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10018"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.actorSpriteComps10018 == nil then
				arg_203_1.var_.actorSpriteComps10018 = var_206_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_2 = 0.034

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.actorSpriteComps10018 then
					for iter_206_0, iter_206_1 in pairs(arg_203_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_206_1 then
							local var_206_4 = Mathf.Lerp(iter_206_1.color.r, 0.5, var_206_3)

							iter_206_1.color = Color.New(var_206_4, var_206_4, var_206_4)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.actorSpriteComps10018 then
				local var_206_5 = 0.5

				for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_206_3 then
						iter_206_3.color = Color.New(var_206_5, var_206_5, var_206_5)
					end
				end

				arg_203_1.var_.actorSpriteComps10018 = nil
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

				local var_206_8 = arg_203_1:GetWordFromCfg(114251050)
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
	Play114251051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 114251051
		arg_207_1.duration_ = 1.9

		local var_207_0 = {
			ja = 1.233,
			ko = 1.9,
			zh = 0.999999999999,
			en = 1.6
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
				arg_207_0:Play114251052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10021"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.actorSpriteComps10021 == nil then
				arg_207_1.var_.actorSpriteComps10021 = var_210_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_2 = 0.034

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.actorSpriteComps10021 then
					for iter_210_0, iter_210_1 in pairs(arg_207_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_210_1 then
							local var_210_4 = Mathf.Lerp(iter_210_1.color.r, 1, var_210_3)

							iter_210_1.color = Color.New(var_210_4, var_210_4, var_210_4)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.actorSpriteComps10021 then
				local var_210_5 = 1

				for iter_210_2, iter_210_3 in pairs(arg_207_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_210_3 then
						iter_210_3.color = Color.New(var_210_5, var_210_5, var_210_5)
					end
				end

				arg_207_1.var_.actorSpriteComps10021 = nil
			end

			local var_210_6 = 0
			local var_210_7 = 0.05

			if var_210_6 < arg_207_1.time_ and arg_207_1.time_ <= var_210_6 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_8 = arg_207_1:FormatText(StoryNameCfg[226].name)

				arg_207_1.leftNameTxt_.text = var_210_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_9 = arg_207_1:GetWordFromCfg(114251051)
				local var_210_10 = arg_207_1:FormatText(var_210_9.content)

				arg_207_1.text_.text = var_210_10

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_11 = 2
				local var_210_12 = utf8.len(var_210_10)
				local var_210_13 = var_210_11 <= 0 and var_210_7 or var_210_7 * (var_210_12 / var_210_11)

				if var_210_13 > 0 and var_210_7 < var_210_13 then
					arg_207_1.talkMaxDuration = var_210_13

					if var_210_13 + var_210_6 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_13 + var_210_6
					end
				end

				arg_207_1.text_.text = var_210_10
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251051", "story_v_out_114251.awb") ~= 0 then
					local var_210_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251051", "story_v_out_114251.awb") / 1000

					if var_210_14 + var_210_6 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_14 + var_210_6
					end

					if var_210_9.prefab_name ~= "" and arg_207_1.actors_[var_210_9.prefab_name] ~= nil then
						local var_210_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_9.prefab_name].transform, "story_v_out_114251", "114251051", "story_v_out_114251.awb")

						arg_207_1:RecordAudio("114251051", var_210_15)
						arg_207_1:RecordAudio("114251051", var_210_15)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_114251", "114251051", "story_v_out_114251.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_114251", "114251051", "story_v_out_114251.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_16 = math.max(var_210_7, arg_207_1.talkMaxDuration)

			if var_210_6 <= arg_207_1.time_ and arg_207_1.time_ < var_210_6 + var_210_16 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_6) / var_210_16

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_6 + var_210_16 and arg_207_1.time_ < var_210_6 + var_210_16 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play114251052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 114251052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play114251053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10021"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.actorSpriteComps10021 == nil then
				arg_211_1.var_.actorSpriteComps10021 = var_214_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_2 = 0.034

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.actorSpriteComps10021 then
					for iter_214_0, iter_214_1 in pairs(arg_211_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_214_1 then
							local var_214_4 = Mathf.Lerp(iter_214_1.color.r, 0.5, var_214_3)

							iter_214_1.color = Color.New(var_214_4, var_214_4, var_214_4)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.actorSpriteComps10021 then
				local var_214_5 = 0.5

				for iter_214_2, iter_214_3 in pairs(arg_211_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_214_3 then
						iter_214_3.color = Color.New(var_214_5, var_214_5, var_214_5)
					end
				end

				arg_211_1.var_.actorSpriteComps10021 = nil
			end

			local var_214_6 = 0
			local var_214_7 = 0.825

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_8 = arg_211_1:GetWordFromCfg(114251052)
				local var_214_9 = arg_211_1:FormatText(var_214_8.content)

				arg_211_1.text_.text = var_214_9

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_10 = 33
				local var_214_11 = utf8.len(var_214_9)
				local var_214_12 = var_214_10 <= 0 and var_214_7 or var_214_7 * (var_214_11 / var_214_10)

				if var_214_12 > 0 and var_214_7 < var_214_12 then
					arg_211_1.talkMaxDuration = var_214_12

					if var_214_12 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_12 + var_214_6
					end
				end

				arg_211_1.text_.text = var_214_9
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_13 = math.max(var_214_7, arg_211_1.talkMaxDuration)

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_13 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_6) / var_214_13

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_6 + var_214_13 and arg_211_1.time_ < var_214_6 + var_214_13 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play114251053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 114251053
		arg_215_1.duration_ = 7.333

		local var_215_0 = {
			ja = 6.1,
			ko = 7.333,
			zh = 7.266,
			en = 6.533
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
				arg_215_0:Play114251054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10021"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.actorSpriteComps10021 == nil then
				arg_215_1.var_.actorSpriteComps10021 = var_218_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_2 = 0.034

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.actorSpriteComps10021 then
					for iter_218_0, iter_218_1 in pairs(arg_215_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_218_1 then
							local var_218_4 = Mathf.Lerp(iter_218_1.color.r, 1, var_218_3)

							iter_218_1.color = Color.New(var_218_4, var_218_4, var_218_4)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.actorSpriteComps10021 then
				local var_218_5 = 1

				for iter_218_2, iter_218_3 in pairs(arg_215_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_218_3 then
						iter_218_3.color = Color.New(var_218_5, var_218_5, var_218_5)
					end
				end

				arg_215_1.var_.actorSpriteComps10021 = nil
			end

			local var_218_6 = 0
			local var_218_7 = 0.725

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_8 = arg_215_1:FormatText(StoryNameCfg[226].name)

				arg_215_1.leftNameTxt_.text = var_218_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_9 = arg_215_1:GetWordFromCfg(114251053)
				local var_218_10 = arg_215_1:FormatText(var_218_9.content)

				arg_215_1.text_.text = var_218_10

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_11 = 28
				local var_218_12 = utf8.len(var_218_10)
				local var_218_13 = var_218_11 <= 0 and var_218_7 or var_218_7 * (var_218_12 / var_218_11)

				if var_218_13 > 0 and var_218_7 < var_218_13 then
					arg_215_1.talkMaxDuration = var_218_13

					if var_218_13 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_13 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_10
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251053", "story_v_out_114251.awb") ~= 0 then
					local var_218_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251053", "story_v_out_114251.awb") / 1000

					if var_218_14 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_14 + var_218_6
					end

					if var_218_9.prefab_name ~= "" and arg_215_1.actors_[var_218_9.prefab_name] ~= nil then
						local var_218_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_9.prefab_name].transform, "story_v_out_114251", "114251053", "story_v_out_114251.awb")

						arg_215_1:RecordAudio("114251053", var_218_15)
						arg_215_1:RecordAudio("114251053", var_218_15)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_114251", "114251053", "story_v_out_114251.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_114251", "114251053", "story_v_out_114251.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_16 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_16 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_16

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_16 and arg_215_1.time_ < var_218_6 + var_218_16 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play114251054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 114251054
		arg_219_1.duration_ = 10.066

		local var_219_0 = {
			ja = 10.066,
			ko = 7.366,
			zh = 6.233,
			en = 6.2
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
				arg_219_0:Play114251055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10018"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos10018 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10018", 4)

				local var_222_2 = var_222_0.childCount

				for iter_222_0 = 0, var_222_2 - 1 do
					local var_222_3 = var_222_0:GetChild(iter_222_0)

					if var_222_3.name == "split_4" or not string.find(var_222_3.name, "split") then
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

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10018, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_222_7 = arg_219_1.actors_["10021"]
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps10021 == nil then
				arg_219_1.var_.actorSpriteComps10021 = var_222_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_9 = 0.034

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_9 then
				local var_222_10 = (arg_219_1.time_ - var_222_8) / var_222_9

				if arg_219_1.var_.actorSpriteComps10021 then
					for iter_222_1, iter_222_2 in pairs(arg_219_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_222_2 then
							local var_222_11 = Mathf.Lerp(iter_222_2.color.r, 0.5, var_222_10)

							iter_222_2.color = Color.New(var_222_11, var_222_11, var_222_11)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_8 + var_222_9 and arg_219_1.time_ < var_222_8 + var_222_9 + arg_222_0 and arg_219_1.var_.actorSpriteComps10021 then
				local var_222_12 = 0.5

				for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_222_4 then
						iter_222_4.color = Color.New(var_222_12, var_222_12, var_222_12)
					end
				end

				arg_219_1.var_.actorSpriteComps10021 = nil
			end

			local var_222_13 = arg_219_1.actors_["10018"]
			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 and arg_219_1.var_.actorSpriteComps10018 == nil then
				arg_219_1.var_.actorSpriteComps10018 = var_222_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_15 = 0.034

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_15 then
				local var_222_16 = (arg_219_1.time_ - var_222_14) / var_222_15

				if arg_219_1.var_.actorSpriteComps10018 then
					for iter_222_5, iter_222_6 in pairs(arg_219_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_222_6 then
							local var_222_17 = Mathf.Lerp(iter_222_6.color.r, 1, var_222_16)

							iter_222_6.color = Color.New(var_222_17, var_222_17, var_222_17)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 and arg_219_1.var_.actorSpriteComps10018 then
				local var_222_18 = 1

				for iter_222_7, iter_222_8 in pairs(arg_219_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_222_8 then
						iter_222_8.color = Color.New(var_222_18, var_222_18, var_222_18)
					end
				end

				arg_219_1.var_.actorSpriteComps10018 = nil
			end

			local var_222_19 = 0
			local var_222_20 = 0.75

			if var_222_19 < arg_219_1.time_ and arg_219_1.time_ <= var_222_19 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_21 = arg_219_1:FormatText(StoryNameCfg[258].name)

				arg_219_1.leftNameTxt_.text = var_222_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_22 = arg_219_1:GetWordFromCfg(114251054)
				local var_222_23 = arg_219_1:FormatText(var_222_22.content)

				arg_219_1.text_.text = var_222_23

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_24 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251054", "story_v_out_114251.awb") ~= 0 then
					local var_222_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251054", "story_v_out_114251.awb") / 1000

					if var_222_27 + var_222_19 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_27 + var_222_19
					end

					if var_222_22.prefab_name ~= "" and arg_219_1.actors_[var_222_22.prefab_name] ~= nil then
						local var_222_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_22.prefab_name].transform, "story_v_out_114251", "114251054", "story_v_out_114251.awb")

						arg_219_1:RecordAudio("114251054", var_222_28)
						arg_219_1:RecordAudio("114251054", var_222_28)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_114251", "114251054", "story_v_out_114251.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_114251", "114251054", "story_v_out_114251.awb")
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
	Play114251055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 114251055
		arg_223_1.duration_ = 6.966

		local var_223_0 = {
			ja = 6.966,
			ko = 4.833,
			zh = 2.966,
			en = 3
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
				arg_223_0:Play114251056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10021"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.actorSpriteComps10021 == nil then
				arg_223_1.var_.actorSpriteComps10021 = var_226_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_2 = 0.034

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.actorSpriteComps10021 then
					for iter_226_0, iter_226_1 in pairs(arg_223_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_226_1 then
							local var_226_4 = Mathf.Lerp(iter_226_1.color.r, 1, var_226_3)

							iter_226_1.color = Color.New(var_226_4, var_226_4, var_226_4)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.actorSpriteComps10021 then
				local var_226_5 = 1

				for iter_226_2, iter_226_3 in pairs(arg_223_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_226_3 then
						iter_226_3.color = Color.New(var_226_5, var_226_5, var_226_5)
					end
				end

				arg_223_1.var_.actorSpriteComps10021 = nil
			end

			local var_226_6 = arg_223_1.actors_["10018"]
			local var_226_7 = 0

			if var_226_7 < arg_223_1.time_ and arg_223_1.time_ <= var_226_7 + arg_226_0 and arg_223_1.var_.actorSpriteComps10018 == nil then
				arg_223_1.var_.actorSpriteComps10018 = var_226_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_8 = 0.034

			if var_226_7 <= arg_223_1.time_ and arg_223_1.time_ < var_226_7 + var_226_8 then
				local var_226_9 = (arg_223_1.time_ - var_226_7) / var_226_8

				if arg_223_1.var_.actorSpriteComps10018 then
					for iter_226_4, iter_226_5 in pairs(arg_223_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_226_5 then
							local var_226_10 = Mathf.Lerp(iter_226_5.color.r, 0.5, var_226_9)

							iter_226_5.color = Color.New(var_226_10, var_226_10, var_226_10)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_7 + var_226_8 and arg_223_1.time_ < var_226_7 + var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps10018 then
				local var_226_11 = 0.5

				for iter_226_6, iter_226_7 in pairs(arg_223_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_226_7 then
						iter_226_7.color = Color.New(var_226_11, var_226_11, var_226_11)
					end
				end

				arg_223_1.var_.actorSpriteComps10018 = nil
			end

			local var_226_12 = 0
			local var_226_13 = 0.35

			if var_226_12 < arg_223_1.time_ and arg_223_1.time_ <= var_226_12 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_14 = arg_223_1:FormatText(StoryNameCfg[226].name)

				arg_223_1.leftNameTxt_.text = var_226_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_15 = arg_223_1:GetWordFromCfg(114251055)
				local var_226_16 = arg_223_1:FormatText(var_226_15.content)

				arg_223_1.text_.text = var_226_16

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_17 = 14
				local var_226_18 = utf8.len(var_226_16)
				local var_226_19 = var_226_17 <= 0 and var_226_13 or var_226_13 * (var_226_18 / var_226_17)

				if var_226_19 > 0 and var_226_13 < var_226_19 then
					arg_223_1.talkMaxDuration = var_226_19

					if var_226_19 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_19 + var_226_12
					end
				end

				arg_223_1.text_.text = var_226_16
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251055", "story_v_out_114251.awb") ~= 0 then
					local var_226_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251055", "story_v_out_114251.awb") / 1000

					if var_226_20 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_20 + var_226_12
					end

					if var_226_15.prefab_name ~= "" and arg_223_1.actors_[var_226_15.prefab_name] ~= nil then
						local var_226_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_15.prefab_name].transform, "story_v_out_114251", "114251055", "story_v_out_114251.awb")

						arg_223_1:RecordAudio("114251055", var_226_21)
						arg_223_1:RecordAudio("114251055", var_226_21)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_114251", "114251055", "story_v_out_114251.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_114251", "114251055", "story_v_out_114251.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_22 = math.max(var_226_13, arg_223_1.talkMaxDuration)

			if var_226_12 <= arg_223_1.time_ and arg_223_1.time_ < var_226_12 + var_226_22 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_12) / var_226_22

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_12 + var_226_22 and arg_223_1.time_ < var_226_12 + var_226_22 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play114251056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 114251056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play114251057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10021"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.actorSpriteComps10021 == nil then
				arg_227_1.var_.actorSpriteComps10021 = var_230_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_2 = 0.034

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.actorSpriteComps10021 then
					for iter_230_0, iter_230_1 in pairs(arg_227_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_230_1 then
							local var_230_4 = Mathf.Lerp(iter_230_1.color.r, 0.5, var_230_3)

							iter_230_1.color = Color.New(var_230_4, var_230_4, var_230_4)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.actorSpriteComps10021 then
				local var_230_5 = 0.5

				for iter_230_2, iter_230_3 in pairs(arg_227_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_230_3 then
						iter_230_3.color = Color.New(var_230_5, var_230_5, var_230_5)
					end
				end

				arg_227_1.var_.actorSpriteComps10021 = nil
			end

			local var_230_6 = 0
			local var_230_7 = 0.7

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

				local var_230_8 = arg_227_1:GetWordFromCfg(114251056)
				local var_230_9 = arg_227_1:FormatText(var_230_8.content)

				arg_227_1.text_.text = var_230_9

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_10 = 28
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
	Play114251057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 114251057
		arg_231_1.duration_ = 11.933

		local var_231_0 = {
			ja = 11.933,
			ko = 8.866,
			zh = 9.266,
			en = 8.9
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
				arg_231_0:Play114251058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["10021"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.actorSpriteComps10021 == nil then
				arg_231_1.var_.actorSpriteComps10021 = var_234_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_2 = 0.034

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.actorSpriteComps10021 then
					for iter_234_0, iter_234_1 in pairs(arg_231_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_234_1 then
							local var_234_4 = Mathf.Lerp(iter_234_1.color.r, 1, var_234_3)

							iter_234_1.color = Color.New(var_234_4, var_234_4, var_234_4)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.actorSpriteComps10021 then
				local var_234_5 = 1

				for iter_234_2, iter_234_3 in pairs(arg_231_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_234_3 then
						iter_234_3.color = Color.New(var_234_5, var_234_5, var_234_5)
					end
				end

				arg_231_1.var_.actorSpriteComps10021 = nil
			end

			local var_234_6 = 0
			local var_234_7 = 1.125

			if var_234_6 < arg_231_1.time_ and arg_231_1.time_ <= var_234_6 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_8 = arg_231_1:FormatText(StoryNameCfg[226].name)

				arg_231_1.leftNameTxt_.text = var_234_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_9 = arg_231_1:GetWordFromCfg(114251057)
				local var_234_10 = arg_231_1:FormatText(var_234_9.content)

				arg_231_1.text_.text = var_234_10

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_11 = 45
				local var_234_12 = utf8.len(var_234_10)
				local var_234_13 = var_234_11 <= 0 and var_234_7 or var_234_7 * (var_234_12 / var_234_11)

				if var_234_13 > 0 and var_234_7 < var_234_13 then
					arg_231_1.talkMaxDuration = var_234_13

					if var_234_13 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_13 + var_234_6
					end
				end

				arg_231_1.text_.text = var_234_10
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251057", "story_v_out_114251.awb") ~= 0 then
					local var_234_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251057", "story_v_out_114251.awb") / 1000

					if var_234_14 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_14 + var_234_6
					end

					if var_234_9.prefab_name ~= "" and arg_231_1.actors_[var_234_9.prefab_name] ~= nil then
						local var_234_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_9.prefab_name].transform, "story_v_out_114251", "114251057", "story_v_out_114251.awb")

						arg_231_1:RecordAudio("114251057", var_234_15)
						arg_231_1:RecordAudio("114251057", var_234_15)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_114251", "114251057", "story_v_out_114251.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_114251", "114251057", "story_v_out_114251.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_16 = math.max(var_234_7, arg_231_1.talkMaxDuration)

			if var_234_6 <= arg_231_1.time_ and arg_231_1.time_ < var_234_6 + var_234_16 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_6) / var_234_16

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_6 + var_234_16 and arg_231_1.time_ < var_234_6 + var_234_16 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play114251058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 114251058
		arg_235_1.duration_ = 8.266

		local var_235_0 = {
			ja = 6.5,
			ko = 6.733,
			zh = 8.266,
			en = 6.933
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
				arg_235_0:Play114251059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10018"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos10018 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("10018", 4)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "split_4" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(390, -350, -180)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10018, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_238_7 = arg_235_1.actors_["10021"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps10021 == nil then
				arg_235_1.var_.actorSpriteComps10021 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.034

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps10021 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 0.5, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps10021 then
				local var_238_12 = 0.5

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps10021 = nil
			end

			local var_238_13 = arg_235_1.actors_["10018"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 and arg_235_1.var_.actorSpriteComps10018 == nil then
				arg_235_1.var_.actorSpriteComps10018 = var_238_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_15 = 0.034

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15

				if arg_235_1.var_.actorSpriteComps10018 then
					for iter_238_5, iter_238_6 in pairs(arg_235_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_238_6 then
							local var_238_17 = Mathf.Lerp(iter_238_6.color.r, 1, var_238_16)

							iter_238_6.color = Color.New(var_238_17, var_238_17, var_238_17)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps10018 then
				local var_238_18 = 1

				for iter_238_7, iter_238_8 in pairs(arg_235_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_238_8 then
						iter_238_8.color = Color.New(var_238_18, var_238_18, var_238_18)
					end
				end

				arg_235_1.var_.actorSpriteComps10018 = nil
			end

			local var_238_19 = 0
			local var_238_20 = 0.75

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_21 = arg_235_1:FormatText(StoryNameCfg[258].name)

				arg_235_1.leftNameTxt_.text = var_238_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(114251058)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251058", "story_v_out_114251.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251058", "story_v_out_114251.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_114251", "114251058", "story_v_out_114251.awb")

						arg_235_1:RecordAudio("114251058", var_238_28)
						arg_235_1:RecordAudio("114251058", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_114251", "114251058", "story_v_out_114251.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_114251", "114251058", "story_v_out_114251.awb")
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
	Play114251059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 114251059
		arg_239_1.duration_ = 9.333

		local var_239_0 = {
			ja = 9.333,
			ko = 8.1,
			zh = 7.366,
			en = 7.933
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
				arg_239_0:Play114251060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10021"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.actorSpriteComps10021 == nil then
				arg_239_1.var_.actorSpriteComps10021 = var_242_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_2 = 0.034

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.actorSpriteComps10021 then
					for iter_242_0, iter_242_1 in pairs(arg_239_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_242_1 then
							local var_242_4 = Mathf.Lerp(iter_242_1.color.r, 1, var_242_3)

							iter_242_1.color = Color.New(var_242_4, var_242_4, var_242_4)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.actorSpriteComps10021 then
				local var_242_5 = 1

				for iter_242_2, iter_242_3 in pairs(arg_239_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_242_3 then
						iter_242_3.color = Color.New(var_242_5, var_242_5, var_242_5)
					end
				end

				arg_239_1.var_.actorSpriteComps10021 = nil
			end

			local var_242_6 = arg_239_1.actors_["10018"]
			local var_242_7 = 0

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 and arg_239_1.var_.actorSpriteComps10018 == nil then
				arg_239_1.var_.actorSpriteComps10018 = var_242_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_8 = 0.034

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_8 then
				local var_242_9 = (arg_239_1.time_ - var_242_7) / var_242_8

				if arg_239_1.var_.actorSpriteComps10018 then
					for iter_242_4, iter_242_5 in pairs(arg_239_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_242_5 then
							local var_242_10 = Mathf.Lerp(iter_242_5.color.r, 0.5, var_242_9)

							iter_242_5.color = Color.New(var_242_10, var_242_10, var_242_10)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_7 + var_242_8 and arg_239_1.time_ < var_242_7 + var_242_8 + arg_242_0 and arg_239_1.var_.actorSpriteComps10018 then
				local var_242_11 = 0.5

				for iter_242_6, iter_242_7 in pairs(arg_239_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_242_7 then
						iter_242_7.color = Color.New(var_242_11, var_242_11, var_242_11)
					end
				end

				arg_239_1.var_.actorSpriteComps10018 = nil
			end

			local var_242_12 = 0
			local var_242_13 = 0.95

			if var_242_12 < arg_239_1.time_ and arg_239_1.time_ <= var_242_12 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_14 = arg_239_1:FormatText(StoryNameCfg[226].name)

				arg_239_1.leftNameTxt_.text = var_242_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_15 = arg_239_1:GetWordFromCfg(114251059)
				local var_242_16 = arg_239_1:FormatText(var_242_15.content)

				arg_239_1.text_.text = var_242_16

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_17 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251059", "story_v_out_114251.awb") ~= 0 then
					local var_242_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251059", "story_v_out_114251.awb") / 1000

					if var_242_20 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_20 + var_242_12
					end

					if var_242_15.prefab_name ~= "" and arg_239_1.actors_[var_242_15.prefab_name] ~= nil then
						local var_242_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_15.prefab_name].transform, "story_v_out_114251", "114251059", "story_v_out_114251.awb")

						arg_239_1:RecordAudio("114251059", var_242_21)
						arg_239_1:RecordAudio("114251059", var_242_21)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_114251", "114251059", "story_v_out_114251.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_114251", "114251059", "story_v_out_114251.awb")
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
	Play114251060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 114251060
		arg_243_1.duration_ = 12.566

		local var_243_0 = {
			ja = 12.566,
			ko = 6.966,
			zh = 7.4,
			en = 6.4
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
				arg_243_0:Play114251061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.975

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[226].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(114251060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251060", "story_v_out_114251.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251060", "story_v_out_114251.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_114251", "114251060", "story_v_out_114251.awb")

						arg_243_1:RecordAudio("114251060", var_246_9)
						arg_243_1:RecordAudio("114251060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_114251", "114251060", "story_v_out_114251.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_114251", "114251060", "story_v_out_114251.awb")
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
	Play114251061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 114251061
		arg_247_1.duration_ = 18.1

		local var_247_0 = {
			ja = 15.766,
			ko = 11.066,
			zh = 11.133,
			en = 18.1
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
				arg_247_0:Play114251062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 1.375

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[226].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(114251061)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 54
				local var_250_6 = utf8.len(var_250_4)
				local var_250_7 = var_250_5 <= 0 and var_250_1 or var_250_1 * (var_250_6 / var_250_5)

				if var_250_7 > 0 and var_250_1 < var_250_7 then
					arg_247_1.talkMaxDuration = var_250_7

					if var_250_7 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_7 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_4
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251061", "story_v_out_114251.awb") ~= 0 then
					local var_250_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251061", "story_v_out_114251.awb") / 1000

					if var_250_8 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_8 + var_250_0
					end

					if var_250_3.prefab_name ~= "" and arg_247_1.actors_[var_250_3.prefab_name] ~= nil then
						local var_250_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_3.prefab_name].transform, "story_v_out_114251", "114251061", "story_v_out_114251.awb")

						arg_247_1:RecordAudio("114251061", var_250_9)
						arg_247_1:RecordAudio("114251061", var_250_9)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_114251", "114251061", "story_v_out_114251.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_114251", "114251061", "story_v_out_114251.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_10 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_10 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_10

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_10 and arg_247_1.time_ < var_250_0 + var_250_10 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play114251062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 114251062
		arg_251_1.duration_ = 6.733

		local var_251_0 = {
			ja = 6.733,
			ko = 3.033,
			zh = 2.766,
			en = 3.666
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
				arg_251_0:Play114251063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10021"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.actorSpriteComps10021 == nil then
				arg_251_1.var_.actorSpriteComps10021 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 0.034

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps10021 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_254_1 then
							local var_254_4 = Mathf.Lerp(iter_254_1.color.r, 0.5, var_254_3)

							iter_254_1.color = Color.New(var_254_4, var_254_4, var_254_4)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.actorSpriteComps10021 then
				local var_254_5 = 0.5

				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_254_3 then
						iter_254_3.color = Color.New(var_254_5, var_254_5, var_254_5)
					end
				end

				arg_251_1.var_.actorSpriteComps10021 = nil
			end

			local var_254_6 = arg_251_1.actors_["10018"]
			local var_254_7 = 0

			if var_254_7 < arg_251_1.time_ and arg_251_1.time_ <= var_254_7 + arg_254_0 and arg_251_1.var_.actorSpriteComps10018 == nil then
				arg_251_1.var_.actorSpriteComps10018 = var_254_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_8 = 0.034

			if var_254_7 <= arg_251_1.time_ and arg_251_1.time_ < var_254_7 + var_254_8 then
				local var_254_9 = (arg_251_1.time_ - var_254_7) / var_254_8

				if arg_251_1.var_.actorSpriteComps10018 then
					for iter_254_4, iter_254_5 in pairs(arg_251_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_254_5 then
							local var_254_10 = Mathf.Lerp(iter_254_5.color.r, 1, var_254_9)

							iter_254_5.color = Color.New(var_254_10, var_254_10, var_254_10)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_7 + var_254_8 and arg_251_1.time_ < var_254_7 + var_254_8 + arg_254_0 and arg_251_1.var_.actorSpriteComps10018 then
				local var_254_11 = 1

				for iter_254_6, iter_254_7 in pairs(arg_251_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_254_7 then
						iter_254_7.color = Color.New(var_254_11, var_254_11, var_254_11)
					end
				end

				arg_251_1.var_.actorSpriteComps10018 = nil
			end

			local var_254_12 = arg_251_1.actors_["10018"]
			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				local var_254_14 = var_254_12:GetComponentInChildren(typeof(CanvasGroup))

				if var_254_14 then
					arg_251_1.var_.alphaOldValue10018 = var_254_14.alpha
					arg_251_1.var_.characterEffect10018 = var_254_14
				end

				arg_251_1.var_.alphaOldValue10018 = 0
			end

			local var_254_15 = 0.0166666666666667

			if var_254_13 <= arg_251_1.time_ and arg_251_1.time_ < var_254_13 + var_254_15 then
				local var_254_16 = (arg_251_1.time_ - var_254_13) / var_254_15
				local var_254_17 = Mathf.Lerp(arg_251_1.var_.alphaOldValue10018, 1, var_254_16)

				if arg_251_1.var_.characterEffect10018 then
					arg_251_1.var_.characterEffect10018.alpha = var_254_17
				end
			end

			if arg_251_1.time_ >= var_254_13 + var_254_15 and arg_251_1.time_ < var_254_13 + var_254_15 + arg_254_0 and arg_251_1.var_.characterEffect10018 then
				arg_251_1.var_.characterEffect10018.alpha = 1
			end

			local var_254_18 = 0
			local var_254_19 = 0.2

			if var_254_18 < arg_251_1.time_ and arg_251_1.time_ <= var_254_18 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_20 = arg_251_1:FormatText(StoryNameCfg[258].name)

				arg_251_1.leftNameTxt_.text = var_254_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_21 = arg_251_1:GetWordFromCfg(114251062)
				local var_254_22 = arg_251_1:FormatText(var_254_21.content)

				arg_251_1.text_.text = var_254_22

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_23 = 8
				local var_254_24 = utf8.len(var_254_22)
				local var_254_25 = var_254_23 <= 0 and var_254_19 or var_254_19 * (var_254_24 / var_254_23)

				if var_254_25 > 0 and var_254_19 < var_254_25 then
					arg_251_1.talkMaxDuration = var_254_25

					if var_254_25 + var_254_18 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_25 + var_254_18
					end
				end

				arg_251_1.text_.text = var_254_22
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251062", "story_v_out_114251.awb") ~= 0 then
					local var_254_26 = manager.audio:GetVoiceLength("story_v_out_114251", "114251062", "story_v_out_114251.awb") / 1000

					if var_254_26 + var_254_18 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_26 + var_254_18
					end

					if var_254_21.prefab_name ~= "" and arg_251_1.actors_[var_254_21.prefab_name] ~= nil then
						local var_254_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_21.prefab_name].transform, "story_v_out_114251", "114251062", "story_v_out_114251.awb")

						arg_251_1:RecordAudio("114251062", var_254_27)
						arg_251_1:RecordAudio("114251062", var_254_27)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_114251", "114251062", "story_v_out_114251.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_114251", "114251062", "story_v_out_114251.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_28 = math.max(var_254_19, arg_251_1.talkMaxDuration)

			if var_254_18 <= arg_251_1.time_ and arg_251_1.time_ < var_254_18 + var_254_28 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_18) / var_254_28

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_18 + var_254_28 and arg_251_1.time_ < var_254_18 + var_254_28 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play114251063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 114251063
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play114251064(arg_255_1)
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
							local var_258_4 = Mathf.Lerp(iter_258_1.color.r, 0.5, var_258_3)

							iter_258_1.color = Color.New(var_258_4, var_258_4, var_258_4)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.actorSpriteComps10018 then
				local var_258_5 = 0.5

				for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_258_3 then
						iter_258_3.color = Color.New(var_258_5, var_258_5, var_258_5)
					end
				end

				arg_255_1.var_.actorSpriteComps10018 = nil
			end

			local var_258_6 = 0
			local var_258_7 = 0.525

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_8 = arg_255_1:GetWordFromCfg(114251063)
				local var_258_9 = arg_255_1:FormatText(var_258_8.content)

				arg_255_1.text_.text = var_258_9

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_10 = 21
				local var_258_11 = utf8.len(var_258_9)
				local var_258_12 = var_258_10 <= 0 and var_258_7 or var_258_7 * (var_258_11 / var_258_10)

				if var_258_12 > 0 and var_258_7 < var_258_12 then
					arg_255_1.talkMaxDuration = var_258_12

					if var_258_12 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_12 + var_258_6
					end
				end

				arg_255_1.text_.text = var_258_9
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_13 = math.max(var_258_7, arg_255_1.talkMaxDuration)

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_13 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_6) / var_258_13

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_6 + var_258_13 and arg_255_1.time_ < var_258_6 + var_258_13 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play114251064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 114251064
		arg_259_1.duration_ = 3.933

		local var_259_0 = {
			ja = 2.3,
			ko = 2.966,
			zh = 2.633,
			en = 3.933
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
				arg_259_0:Play114251065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10018"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10018 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10018", 4)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_2" or not string.find(var_262_3.name, "split") then
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

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10018, var_262_6, var_262_5)
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
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 1, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps10018 then
				local var_262_12 = 1

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps10018 = nil
			end

			local var_262_13 = 0
			local var_262_14 = 0.325

			if var_262_13 < arg_259_1.time_ and arg_259_1.time_ <= var_262_13 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_15 = arg_259_1:FormatText(StoryNameCfg[258].name)

				arg_259_1.leftNameTxt_.text = var_262_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_16 = arg_259_1:GetWordFromCfg(114251064)
				local var_262_17 = arg_259_1:FormatText(var_262_16.content)

				arg_259_1.text_.text = var_262_17

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_18 = 13
				local var_262_19 = utf8.len(var_262_17)
				local var_262_20 = var_262_18 <= 0 and var_262_14 or var_262_14 * (var_262_19 / var_262_18)

				if var_262_20 > 0 and var_262_14 < var_262_20 then
					arg_259_1.talkMaxDuration = var_262_20

					if var_262_20 + var_262_13 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_20 + var_262_13
					end
				end

				arg_259_1.text_.text = var_262_17
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251064", "story_v_out_114251.awb") ~= 0 then
					local var_262_21 = manager.audio:GetVoiceLength("story_v_out_114251", "114251064", "story_v_out_114251.awb") / 1000

					if var_262_21 + var_262_13 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_21 + var_262_13
					end

					if var_262_16.prefab_name ~= "" and arg_259_1.actors_[var_262_16.prefab_name] ~= nil then
						local var_262_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_16.prefab_name].transform, "story_v_out_114251", "114251064", "story_v_out_114251.awb")

						arg_259_1:RecordAudio("114251064", var_262_22)
						arg_259_1:RecordAudio("114251064", var_262_22)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_114251", "114251064", "story_v_out_114251.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_114251", "114251064", "story_v_out_114251.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_23 = math.max(var_262_14, arg_259_1.talkMaxDuration)

			if var_262_13 <= arg_259_1.time_ and arg_259_1.time_ < var_262_13 + var_262_23 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_13) / var_262_23

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_13 + var_262_23 and arg_259_1.time_ < var_262_13 + var_262_23 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play114251065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 114251065
		arg_263_1.duration_ = 2.233

		local var_263_0 = {
			ja = 1.7,
			ko = 1.4,
			zh = 2.233,
			en = 1.433
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
				arg_263_0:Play114251066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["10021"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.actorSpriteComps10021 == nil then
				arg_263_1.var_.actorSpriteComps10021 = var_266_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_2 = 0.034

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.actorSpriteComps10021 then
					for iter_266_0, iter_266_1 in pairs(arg_263_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_266_1 then
							local var_266_4 = Mathf.Lerp(iter_266_1.color.r, 1, var_266_3)

							iter_266_1.color = Color.New(var_266_4, var_266_4, var_266_4)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.actorSpriteComps10021 then
				local var_266_5 = 1

				for iter_266_2, iter_266_3 in pairs(arg_263_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_266_3 then
						iter_266_3.color = Color.New(var_266_5, var_266_5, var_266_5)
					end
				end

				arg_263_1.var_.actorSpriteComps10021 = nil
			end

			local var_266_6 = arg_263_1.actors_["10018"]
			local var_266_7 = 0

			if var_266_7 < arg_263_1.time_ and arg_263_1.time_ <= var_266_7 + arg_266_0 and arg_263_1.var_.actorSpriteComps10018 == nil then
				arg_263_1.var_.actorSpriteComps10018 = var_266_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_8 = 0.034

			if var_266_7 <= arg_263_1.time_ and arg_263_1.time_ < var_266_7 + var_266_8 then
				local var_266_9 = (arg_263_1.time_ - var_266_7) / var_266_8

				if arg_263_1.var_.actorSpriteComps10018 then
					for iter_266_4, iter_266_5 in pairs(arg_263_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_266_5 then
							local var_266_10 = Mathf.Lerp(iter_266_5.color.r, 0.5, var_266_9)

							iter_266_5.color = Color.New(var_266_10, var_266_10, var_266_10)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_7 + var_266_8 and arg_263_1.time_ < var_266_7 + var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps10018 then
				local var_266_11 = 0.5

				for iter_266_6, iter_266_7 in pairs(arg_263_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_266_7 then
						iter_266_7.color = Color.New(var_266_11, var_266_11, var_266_11)
					end
				end

				arg_263_1.var_.actorSpriteComps10018 = nil
			end

			local var_266_12 = 0
			local var_266_13 = 0.15

			if var_266_12 < arg_263_1.time_ and arg_263_1.time_ <= var_266_12 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_14 = arg_263_1:FormatText(StoryNameCfg[226].name)

				arg_263_1.leftNameTxt_.text = var_266_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_15 = arg_263_1:GetWordFromCfg(114251065)
				local var_266_16 = arg_263_1:FormatText(var_266_15.content)

				arg_263_1.text_.text = var_266_16

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_17 = 6
				local var_266_18 = utf8.len(var_266_16)
				local var_266_19 = var_266_17 <= 0 and var_266_13 or var_266_13 * (var_266_18 / var_266_17)

				if var_266_19 > 0 and var_266_13 < var_266_19 then
					arg_263_1.talkMaxDuration = var_266_19

					if var_266_19 + var_266_12 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_19 + var_266_12
					end
				end

				arg_263_1.text_.text = var_266_16
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251065", "story_v_out_114251.awb") ~= 0 then
					local var_266_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251065", "story_v_out_114251.awb") / 1000

					if var_266_20 + var_266_12 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_20 + var_266_12
					end

					if var_266_15.prefab_name ~= "" and arg_263_1.actors_[var_266_15.prefab_name] ~= nil then
						local var_266_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_15.prefab_name].transform, "story_v_out_114251", "114251065", "story_v_out_114251.awb")

						arg_263_1:RecordAudio("114251065", var_266_21)
						arg_263_1:RecordAudio("114251065", var_266_21)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_114251", "114251065", "story_v_out_114251.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_114251", "114251065", "story_v_out_114251.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_22 = math.max(var_266_13, arg_263_1.talkMaxDuration)

			if var_266_12 <= arg_263_1.time_ and arg_263_1.time_ < var_266_12 + var_266_22 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_12) / var_266_22

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_12 + var_266_22 and arg_263_1.time_ < var_266_12 + var_266_22 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play114251066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 114251066
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play114251067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["10021"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.actorSpriteComps10021 == nil then
				arg_267_1.var_.actorSpriteComps10021 = var_270_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_2 = 0.034

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.actorSpriteComps10021 then
					for iter_270_0, iter_270_1 in pairs(arg_267_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_270_1 then
							local var_270_4 = Mathf.Lerp(iter_270_1.color.r, 0.5, var_270_3)

							iter_270_1.color = Color.New(var_270_4, var_270_4, var_270_4)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.actorSpriteComps10021 then
				local var_270_5 = 0.5

				for iter_270_2, iter_270_3 in pairs(arg_267_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_270_3 then
						iter_270_3.color = Color.New(var_270_5, var_270_5, var_270_5)
					end
				end

				arg_267_1.var_.actorSpriteComps10021 = nil
			end

			local var_270_6 = 0
			local var_270_7 = 0.875

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_8 = arg_267_1:GetWordFromCfg(114251066)
				local var_270_9 = arg_267_1:FormatText(var_270_8.content)

				arg_267_1.text_.text = var_270_9

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_10 = 35
				local var_270_11 = utf8.len(var_270_9)
				local var_270_12 = var_270_10 <= 0 and var_270_7 or var_270_7 * (var_270_11 / var_270_10)

				if var_270_12 > 0 and var_270_7 < var_270_12 then
					arg_267_1.talkMaxDuration = var_270_12

					if var_270_12 + var_270_6 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_12 + var_270_6
					end
				end

				arg_267_1.text_.text = var_270_9
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_13 = math.max(var_270_7, arg_267_1.talkMaxDuration)

			if var_270_6 <= arg_267_1.time_ and arg_267_1.time_ < var_270_6 + var_270_13 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_6) / var_270_13

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_6 + var_270_13 and arg_267_1.time_ < var_270_6 + var_270_13 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play114251067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 114251067
		arg_271_1.duration_ = 2.033

		local var_271_0 = {
			ja = 1.5,
			ko = 1.566,
			zh = 1.433,
			en = 2.033
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
				arg_271_0:Play114251068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["10018"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos10018 = var_274_0.localPosition
				var_274_0.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("10018", 4)

				local var_274_2 = var_274_0.childCount

				for iter_274_0 = 0, var_274_2 - 1 do
					local var_274_3 = var_274_0:GetChild(iter_274_0)

					if var_274_3.name == "split_1" or not string.find(var_274_3.name, "split") then
						var_274_3.gameObject:SetActive(true)
					else
						var_274_3.gameObject:SetActive(false)
					end
				end
			end

			local var_274_4 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_1) / var_274_4
				local var_274_6 = Vector3.New(390, -350, -180)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos10018, var_274_6, var_274_5)
			end

			if arg_271_1.time_ >= var_274_1 + var_274_4 and arg_271_1.time_ < var_274_1 + var_274_4 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_274_7 = arg_271_1.actors_["10018"]
			local var_274_8 = 0

			if var_274_8 < arg_271_1.time_ and arg_271_1.time_ <= var_274_8 + arg_274_0 and arg_271_1.var_.actorSpriteComps10018 == nil then
				arg_271_1.var_.actorSpriteComps10018 = var_274_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_9 = 0.034

			if var_274_8 <= arg_271_1.time_ and arg_271_1.time_ < var_274_8 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_8) / var_274_9

				if arg_271_1.var_.actorSpriteComps10018 then
					for iter_274_1, iter_274_2 in pairs(arg_271_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_274_2 then
							local var_274_11 = Mathf.Lerp(iter_274_2.color.r, 1, var_274_10)

							iter_274_2.color = Color.New(var_274_11, var_274_11, var_274_11)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_8 + var_274_9 and arg_271_1.time_ < var_274_8 + var_274_9 + arg_274_0 and arg_271_1.var_.actorSpriteComps10018 then
				local var_274_12 = 1

				for iter_274_3, iter_274_4 in pairs(arg_271_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_274_4 then
						iter_274_4.color = Color.New(var_274_12, var_274_12, var_274_12)
					end
				end

				arg_271_1.var_.actorSpriteComps10018 = nil
			end

			local var_274_13 = 0
			local var_274_14 = 0.1

			if var_274_13 < arg_271_1.time_ and arg_271_1.time_ <= var_274_13 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_15 = arg_271_1:FormatText(StoryNameCfg[258].name)

				arg_271_1.leftNameTxt_.text = var_274_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_16 = arg_271_1:GetWordFromCfg(114251067)
				local var_274_17 = arg_271_1:FormatText(var_274_16.content)

				arg_271_1.text_.text = var_274_17

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_18 = 4
				local var_274_19 = utf8.len(var_274_17)
				local var_274_20 = var_274_18 <= 0 and var_274_14 or var_274_14 * (var_274_19 / var_274_18)

				if var_274_20 > 0 and var_274_14 < var_274_20 then
					arg_271_1.talkMaxDuration = var_274_20

					if var_274_20 + var_274_13 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_20 + var_274_13
					end
				end

				arg_271_1.text_.text = var_274_17
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251067", "story_v_out_114251.awb") ~= 0 then
					local var_274_21 = manager.audio:GetVoiceLength("story_v_out_114251", "114251067", "story_v_out_114251.awb") / 1000

					if var_274_21 + var_274_13 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_21 + var_274_13
					end

					if var_274_16.prefab_name ~= "" and arg_271_1.actors_[var_274_16.prefab_name] ~= nil then
						local var_274_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_16.prefab_name].transform, "story_v_out_114251", "114251067", "story_v_out_114251.awb")

						arg_271_1:RecordAudio("114251067", var_274_22)
						arg_271_1:RecordAudio("114251067", var_274_22)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_114251", "114251067", "story_v_out_114251.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_114251", "114251067", "story_v_out_114251.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_23 = math.max(var_274_14, arg_271_1.talkMaxDuration)

			if var_274_13 <= arg_271_1.time_ and arg_271_1.time_ < var_274_13 + var_274_23 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_13) / var_274_23

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_13 + var_274_23 and arg_271_1.time_ < var_274_13 + var_274_23 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play114251068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 114251068
		arg_275_1.duration_ = 5.066

		local var_275_0 = {
			ja = 3.433,
			ko = 4.1,
			zh = 4.766,
			en = 5.066
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
				arg_275_0:Play114251069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["10018"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.actorSpriteComps10018 == nil then
				arg_275_1.var_.actorSpriteComps10018 = var_278_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_2 = 0.034

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.actorSpriteComps10018 then
					for iter_278_0, iter_278_1 in pairs(arg_275_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_278_1 then
							local var_278_4 = Mathf.Lerp(iter_278_1.color.r, 1, var_278_3)

							iter_278_1.color = Color.New(var_278_4, var_278_4, var_278_4)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.actorSpriteComps10018 then
				local var_278_5 = 1

				for iter_278_2, iter_278_3 in pairs(arg_275_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_278_3 then
						iter_278_3.color = Color.New(var_278_5, var_278_5, var_278_5)
					end
				end

				arg_275_1.var_.actorSpriteComps10018 = nil
			end

			local var_278_6 = 0
			local var_278_7 = 0.525

			if var_278_6 < arg_275_1.time_ and arg_275_1.time_ <= var_278_6 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_8 = arg_275_1:FormatText(StoryNameCfg[258].name)

				arg_275_1.leftNameTxt_.text = var_278_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_9 = arg_275_1:GetWordFromCfg(114251068)
				local var_278_10 = arg_275_1:FormatText(var_278_9.content)

				arg_275_1.text_.text = var_278_10

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_11 = 21
				local var_278_12 = utf8.len(var_278_10)
				local var_278_13 = var_278_11 <= 0 and var_278_7 or var_278_7 * (var_278_12 / var_278_11)

				if var_278_13 > 0 and var_278_7 < var_278_13 then
					arg_275_1.talkMaxDuration = var_278_13

					if var_278_13 + var_278_6 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_13 + var_278_6
					end
				end

				arg_275_1.text_.text = var_278_10
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251068", "story_v_out_114251.awb") ~= 0 then
					local var_278_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251068", "story_v_out_114251.awb") / 1000

					if var_278_14 + var_278_6 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_14 + var_278_6
					end

					if var_278_9.prefab_name ~= "" and arg_275_1.actors_[var_278_9.prefab_name] ~= nil then
						local var_278_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_9.prefab_name].transform, "story_v_out_114251", "114251068", "story_v_out_114251.awb")

						arg_275_1:RecordAudio("114251068", var_278_15)
						arg_275_1:RecordAudio("114251068", var_278_15)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_114251", "114251068", "story_v_out_114251.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_114251", "114251068", "story_v_out_114251.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_16 = math.max(var_278_7, arg_275_1.talkMaxDuration)

			if var_278_6 <= arg_275_1.time_ and arg_275_1.time_ < var_278_6 + var_278_16 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_6) / var_278_16

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_6 + var_278_16 and arg_275_1.time_ < var_278_6 + var_278_16 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play114251069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 114251069
		arg_279_1.duration_ = 4.833

		local var_279_0 = {
			ja = 3.333,
			ko = 4.133,
			zh = 4.833,
			en = 3.3
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
				arg_279_0:Play114251070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["10021"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.actorSpriteComps10021 == nil then
				arg_279_1.var_.actorSpriteComps10021 = var_282_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_2 = 0.034

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.actorSpriteComps10021 then
					for iter_282_0, iter_282_1 in pairs(arg_279_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_282_1 then
							local var_282_4 = Mathf.Lerp(iter_282_1.color.r, 1, var_282_3)

							iter_282_1.color = Color.New(var_282_4, var_282_4, var_282_4)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.actorSpriteComps10021 then
				local var_282_5 = 1

				for iter_282_2, iter_282_3 in pairs(arg_279_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_282_3 then
						iter_282_3.color = Color.New(var_282_5, var_282_5, var_282_5)
					end
				end

				arg_279_1.var_.actorSpriteComps10021 = nil
			end

			local var_282_6 = arg_279_1.actors_["10018"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.actorSpriteComps10018 == nil then
				arg_279_1.var_.actorSpriteComps10018 = var_282_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_8 = 0.034

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.actorSpriteComps10018 then
					for iter_282_4, iter_282_5 in pairs(arg_279_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_282_5 then
							local var_282_10 = Mathf.Lerp(iter_282_5.color.r, 0.5, var_282_9)

							iter_282_5.color = Color.New(var_282_10, var_282_10, var_282_10)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps10018 then
				local var_282_11 = 0.5

				for iter_282_6, iter_282_7 in pairs(arg_279_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_282_7 then
						iter_282_7.color = Color.New(var_282_11, var_282_11, var_282_11)
					end
				end

				arg_279_1.var_.actorSpriteComps10018 = nil
			end

			local var_282_12 = 0
			local var_282_13 = 0.375

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[226].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(114251069)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251069", "story_v_out_114251.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251069", "story_v_out_114251.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_114251", "114251069", "story_v_out_114251.awb")

						arg_279_1:RecordAudio("114251069", var_282_21)
						arg_279_1:RecordAudio("114251069", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_114251", "114251069", "story_v_out_114251.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_114251", "114251069", "story_v_out_114251.awb")
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
	Play114251070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 114251070
		arg_283_1.duration_ = 4.466

		local var_283_0 = {
			ja = 3.566,
			ko = 3.766,
			zh = 4.466,
			en = 4.166
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
				arg_283_0:Play114251071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10021"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.actorSpriteComps10021 == nil then
				arg_283_1.var_.actorSpriteComps10021 = var_286_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_2 = 0.034

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.actorSpriteComps10021 then
					for iter_286_0, iter_286_1 in pairs(arg_283_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_286_1 then
							local var_286_4 = Mathf.Lerp(iter_286_1.color.r, 0.5, var_286_3)

							iter_286_1.color = Color.New(var_286_4, var_286_4, var_286_4)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.actorSpriteComps10021 then
				local var_286_5 = 0.5

				for iter_286_2, iter_286_3 in pairs(arg_283_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_286_3 then
						iter_286_3.color = Color.New(var_286_5, var_286_5, var_286_5)
					end
				end

				arg_283_1.var_.actorSpriteComps10021 = nil
			end

			local var_286_6 = arg_283_1.actors_["10018"]
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 and arg_283_1.var_.actorSpriteComps10018 == nil then
				arg_283_1.var_.actorSpriteComps10018 = var_286_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_8 = 0.034

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8

				if arg_283_1.var_.actorSpriteComps10018 then
					for iter_286_4, iter_286_5 in pairs(arg_283_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_286_5 then
							local var_286_10 = Mathf.Lerp(iter_286_5.color.r, 1, var_286_9)

							iter_286_5.color = Color.New(var_286_10, var_286_10, var_286_10)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 and arg_283_1.var_.actorSpriteComps10018 then
				local var_286_11 = 1

				for iter_286_6, iter_286_7 in pairs(arg_283_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_286_7 then
						iter_286_7.color = Color.New(var_286_11, var_286_11, var_286_11)
					end
				end

				arg_283_1.var_.actorSpriteComps10018 = nil
			end

			local var_286_12 = 0
			local var_286_13 = 0.4

			if var_286_12 < arg_283_1.time_ and arg_283_1.time_ <= var_286_12 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_14 = arg_283_1:FormatText(StoryNameCfg[258].name)

				arg_283_1.leftNameTxt_.text = var_286_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_15 = arg_283_1:GetWordFromCfg(114251070)
				local var_286_16 = arg_283_1:FormatText(var_286_15.content)

				arg_283_1.text_.text = var_286_16

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_17 = 16
				local var_286_18 = utf8.len(var_286_16)
				local var_286_19 = var_286_17 <= 0 and var_286_13 or var_286_13 * (var_286_18 / var_286_17)

				if var_286_19 > 0 and var_286_13 < var_286_19 then
					arg_283_1.talkMaxDuration = var_286_19

					if var_286_19 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_12
					end
				end

				arg_283_1.text_.text = var_286_16
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251070", "story_v_out_114251.awb") ~= 0 then
					local var_286_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251070", "story_v_out_114251.awb") / 1000

					if var_286_20 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_20 + var_286_12
					end

					if var_286_15.prefab_name ~= "" and arg_283_1.actors_[var_286_15.prefab_name] ~= nil then
						local var_286_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_15.prefab_name].transform, "story_v_out_114251", "114251070", "story_v_out_114251.awb")

						arg_283_1:RecordAudio("114251070", var_286_21)
						arg_283_1:RecordAudio("114251070", var_286_21)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_114251", "114251070", "story_v_out_114251.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_114251", "114251070", "story_v_out_114251.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_22 = math.max(var_286_13, arg_283_1.talkMaxDuration)

			if var_286_12 <= arg_283_1.time_ and arg_283_1.time_ < var_286_12 + var_286_22 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_12) / var_286_22

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_12 + var_286_22 and arg_283_1.time_ < var_286_12 + var_286_22 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play114251071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 114251071
		arg_287_1.duration_ = 2.5

		local var_287_0 = {
			ja = 2.5,
			ko = 1.533,
			zh = 1.3,
			en = 0.999999999999
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
				arg_287_0:Play114251072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["10021"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.actorSpriteComps10021 == nil then
				arg_287_1.var_.actorSpriteComps10021 = var_290_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_2 = 0.034

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.actorSpriteComps10021 then
					for iter_290_0, iter_290_1 in pairs(arg_287_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_290_1 then
							local var_290_4 = Mathf.Lerp(iter_290_1.color.r, 1, var_290_3)

							iter_290_1.color = Color.New(var_290_4, var_290_4, var_290_4)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.actorSpriteComps10021 then
				local var_290_5 = 1

				for iter_290_2, iter_290_3 in pairs(arg_287_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_290_3 then
						iter_290_3.color = Color.New(var_290_5, var_290_5, var_290_5)
					end
				end

				arg_287_1.var_.actorSpriteComps10021 = nil
			end

			local var_290_6 = arg_287_1.actors_["10018"]
			local var_290_7 = 0

			if var_290_7 < arg_287_1.time_ and arg_287_1.time_ <= var_290_7 + arg_290_0 and arg_287_1.var_.actorSpriteComps10018 == nil then
				arg_287_1.var_.actorSpriteComps10018 = var_290_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_8 = 0.034

			if var_290_7 <= arg_287_1.time_ and arg_287_1.time_ < var_290_7 + var_290_8 then
				local var_290_9 = (arg_287_1.time_ - var_290_7) / var_290_8

				if arg_287_1.var_.actorSpriteComps10018 then
					for iter_290_4, iter_290_5 in pairs(arg_287_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_290_5 then
							local var_290_10 = Mathf.Lerp(iter_290_5.color.r, 0.5, var_290_9)

							iter_290_5.color = Color.New(var_290_10, var_290_10, var_290_10)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_7 + var_290_8 and arg_287_1.time_ < var_290_7 + var_290_8 + arg_290_0 and arg_287_1.var_.actorSpriteComps10018 then
				local var_290_11 = 0.5

				for iter_290_6, iter_290_7 in pairs(arg_287_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_290_7 then
						iter_290_7.color = Color.New(var_290_11, var_290_11, var_290_11)
					end
				end

				arg_287_1.var_.actorSpriteComps10018 = nil
			end

			local var_290_12 = 0
			local var_290_13 = 0.125

			if var_290_12 < arg_287_1.time_ and arg_287_1.time_ <= var_290_12 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_14 = arg_287_1:FormatText(StoryNameCfg[226].name)

				arg_287_1.leftNameTxt_.text = var_290_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_15 = arg_287_1:GetWordFromCfg(114251071)
				local var_290_16 = arg_287_1:FormatText(var_290_15.content)

				arg_287_1.text_.text = var_290_16

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_17 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251071", "story_v_out_114251.awb") ~= 0 then
					local var_290_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251071", "story_v_out_114251.awb") / 1000

					if var_290_20 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_20 + var_290_12
					end

					if var_290_15.prefab_name ~= "" and arg_287_1.actors_[var_290_15.prefab_name] ~= nil then
						local var_290_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_15.prefab_name].transform, "story_v_out_114251", "114251071", "story_v_out_114251.awb")

						arg_287_1:RecordAudio("114251071", var_290_21)
						arg_287_1:RecordAudio("114251071", var_290_21)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_114251", "114251071", "story_v_out_114251.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_114251", "114251071", "story_v_out_114251.awb")
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
	Play114251072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 114251072
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play114251073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["10021"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.actorSpriteComps10021 == nil then
				arg_291_1.var_.actorSpriteComps10021 = var_294_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_2 = 0.034

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.actorSpriteComps10021 then
					for iter_294_0, iter_294_1 in pairs(arg_291_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_294_1 then
							local var_294_4 = Mathf.Lerp(iter_294_1.color.r, 0.5, var_294_3)

							iter_294_1.color = Color.New(var_294_4, var_294_4, var_294_4)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.actorSpriteComps10021 then
				local var_294_5 = 0.5

				for iter_294_2, iter_294_3 in pairs(arg_291_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_294_3 then
						iter_294_3.color = Color.New(var_294_5, var_294_5, var_294_5)
					end
				end

				arg_291_1.var_.actorSpriteComps10021 = nil
			end

			local var_294_6 = 0
			local var_294_7 = 0.775

			if var_294_6 < arg_291_1.time_ and arg_291_1.time_ <= var_294_6 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_8 = arg_291_1:GetWordFromCfg(114251072)
				local var_294_9 = arg_291_1:FormatText(var_294_8.content)

				arg_291_1.text_.text = var_294_9

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_10 = 31
				local var_294_11 = utf8.len(var_294_9)
				local var_294_12 = var_294_10 <= 0 and var_294_7 or var_294_7 * (var_294_11 / var_294_10)

				if var_294_12 > 0 and var_294_7 < var_294_12 then
					arg_291_1.talkMaxDuration = var_294_12

					if var_294_12 + var_294_6 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_12 + var_294_6
					end
				end

				arg_291_1.text_.text = var_294_9
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_13 = math.max(var_294_7, arg_291_1.talkMaxDuration)

			if var_294_6 <= arg_291_1.time_ and arg_291_1.time_ < var_294_6 + var_294_13 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_6) / var_294_13

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_6 + var_294_13 and arg_291_1.time_ < var_294_6 + var_294_13 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play114251073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 114251073
		arg_295_1.duration_ = 16.666

		local var_295_0 = {
			ja = 11.833,
			ko = 12.2,
			zh = 16.1,
			en = 16.666
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
				arg_295_0:Play114251074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10018"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.actorSpriteComps10018 == nil then
				arg_295_1.var_.actorSpriteComps10018 = var_298_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_2 = 0.034

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.actorSpriteComps10018 then
					for iter_298_0, iter_298_1 in pairs(arg_295_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_298_1 then
							local var_298_4 = Mathf.Lerp(iter_298_1.color.r, 1, var_298_3)

							iter_298_1.color = Color.New(var_298_4, var_298_4, var_298_4)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.actorSpriteComps10018 then
				local var_298_5 = 1

				for iter_298_2, iter_298_3 in pairs(arg_295_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_298_3 then
						iter_298_3.color = Color.New(var_298_5, var_298_5, var_298_5)
					end
				end

				arg_295_1.var_.actorSpriteComps10018 = nil
			end

			local var_298_6 = 0
			local var_298_7 = 1.65

			if var_298_6 < arg_295_1.time_ and arg_295_1.time_ <= var_298_6 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_8 = arg_295_1:FormatText(StoryNameCfg[258].name)

				arg_295_1.leftNameTxt_.text = var_298_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_9 = arg_295_1:GetWordFromCfg(114251073)
				local var_298_10 = arg_295_1:FormatText(var_298_9.content)

				arg_295_1.text_.text = var_298_10

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_11 = 65
				local var_298_12 = utf8.len(var_298_10)
				local var_298_13 = var_298_11 <= 0 and var_298_7 or var_298_7 * (var_298_12 / var_298_11)

				if var_298_13 > 0 and var_298_7 < var_298_13 then
					arg_295_1.talkMaxDuration = var_298_13

					if var_298_13 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_13 + var_298_6
					end
				end

				arg_295_1.text_.text = var_298_10
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251073", "story_v_out_114251.awb") ~= 0 then
					local var_298_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251073", "story_v_out_114251.awb") / 1000

					if var_298_14 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_14 + var_298_6
					end

					if var_298_9.prefab_name ~= "" and arg_295_1.actors_[var_298_9.prefab_name] ~= nil then
						local var_298_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_9.prefab_name].transform, "story_v_out_114251", "114251073", "story_v_out_114251.awb")

						arg_295_1:RecordAudio("114251073", var_298_15)
						arg_295_1:RecordAudio("114251073", var_298_15)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_114251", "114251073", "story_v_out_114251.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_114251", "114251073", "story_v_out_114251.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_16 = math.max(var_298_7, arg_295_1.talkMaxDuration)

			if var_298_6 <= arg_295_1.time_ and arg_295_1.time_ < var_298_6 + var_298_16 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_6) / var_298_16

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_6 + var_298_16 and arg_295_1.time_ < var_298_6 + var_298_16 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play114251074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 114251074
		arg_299_1.duration_ = 5.866

		local var_299_0 = {
			ja = 5.866,
			ko = 2.533,
			zh = 2.766,
			en = 2.066
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
				arg_299_0:Play114251075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["10021"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.actorSpriteComps10021 == nil then
				arg_299_1.var_.actorSpriteComps10021 = var_302_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_2 = 0.034

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.actorSpriteComps10021 then
					for iter_302_0, iter_302_1 in pairs(arg_299_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_302_1 then
							local var_302_4 = Mathf.Lerp(iter_302_1.color.r, 1, var_302_3)

							iter_302_1.color = Color.New(var_302_4, var_302_4, var_302_4)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.actorSpriteComps10021 then
				local var_302_5 = 1

				for iter_302_2, iter_302_3 in pairs(arg_299_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_302_3 then
						iter_302_3.color = Color.New(var_302_5, var_302_5, var_302_5)
					end
				end

				arg_299_1.var_.actorSpriteComps10021 = nil
			end

			local var_302_6 = arg_299_1.actors_["10018"]
			local var_302_7 = 0

			if var_302_7 < arg_299_1.time_ and arg_299_1.time_ <= var_302_7 + arg_302_0 and arg_299_1.var_.actorSpriteComps10018 == nil then
				arg_299_1.var_.actorSpriteComps10018 = var_302_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_8 = 0.034

			if var_302_7 <= arg_299_1.time_ and arg_299_1.time_ < var_302_7 + var_302_8 then
				local var_302_9 = (arg_299_1.time_ - var_302_7) / var_302_8

				if arg_299_1.var_.actorSpriteComps10018 then
					for iter_302_4, iter_302_5 in pairs(arg_299_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_302_5 then
							local var_302_10 = Mathf.Lerp(iter_302_5.color.r, 0.5, var_302_9)

							iter_302_5.color = Color.New(var_302_10, var_302_10, var_302_10)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_7 + var_302_8 and arg_299_1.time_ < var_302_7 + var_302_8 + arg_302_0 and arg_299_1.var_.actorSpriteComps10018 then
				local var_302_11 = 0.5

				for iter_302_6, iter_302_7 in pairs(arg_299_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_302_7 then
						iter_302_7.color = Color.New(var_302_11, var_302_11, var_302_11)
					end
				end

				arg_299_1.var_.actorSpriteComps10018 = nil
			end

			local var_302_12 = 0
			local var_302_13 = 0.3

			if var_302_12 < arg_299_1.time_ and arg_299_1.time_ <= var_302_12 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_14 = arg_299_1:FormatText(StoryNameCfg[226].name)

				arg_299_1.leftNameTxt_.text = var_302_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_15 = arg_299_1:GetWordFromCfg(114251074)
				local var_302_16 = arg_299_1:FormatText(var_302_15.content)

				arg_299_1.text_.text = var_302_16

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_17 = 12
				local var_302_18 = utf8.len(var_302_16)
				local var_302_19 = var_302_17 <= 0 and var_302_13 or var_302_13 * (var_302_18 / var_302_17)

				if var_302_19 > 0 and var_302_13 < var_302_19 then
					arg_299_1.talkMaxDuration = var_302_19

					if var_302_19 + var_302_12 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_19 + var_302_12
					end
				end

				arg_299_1.text_.text = var_302_16
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251074", "story_v_out_114251.awb") ~= 0 then
					local var_302_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251074", "story_v_out_114251.awb") / 1000

					if var_302_20 + var_302_12 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_20 + var_302_12
					end

					if var_302_15.prefab_name ~= "" and arg_299_1.actors_[var_302_15.prefab_name] ~= nil then
						local var_302_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_15.prefab_name].transform, "story_v_out_114251", "114251074", "story_v_out_114251.awb")

						arg_299_1:RecordAudio("114251074", var_302_21)
						arg_299_1:RecordAudio("114251074", var_302_21)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_114251", "114251074", "story_v_out_114251.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_114251", "114251074", "story_v_out_114251.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_22 = math.max(var_302_13, arg_299_1.talkMaxDuration)

			if var_302_12 <= arg_299_1.time_ and arg_299_1.time_ < var_302_12 + var_302_22 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_12) / var_302_22

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_12 + var_302_22 and arg_299_1.time_ < var_302_12 + var_302_22 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play114251075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 114251075
		arg_303_1.duration_ = 11.566

		local var_303_0 = {
			ja = 8.8,
			ko = 10.266,
			zh = 11.566,
			en = 8.633
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
				arg_303_0:Play114251076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["10021"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.actorSpriteComps10021 == nil then
				arg_303_1.var_.actorSpriteComps10021 = var_306_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_2 = 0.034

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.actorSpriteComps10021 then
					for iter_306_0, iter_306_1 in pairs(arg_303_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_306_1 then
							local var_306_4 = Mathf.Lerp(iter_306_1.color.r, 0.5, var_306_3)

							iter_306_1.color = Color.New(var_306_4, var_306_4, var_306_4)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.actorSpriteComps10021 then
				local var_306_5 = 0.5

				for iter_306_2, iter_306_3 in pairs(arg_303_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_306_3 then
						iter_306_3.color = Color.New(var_306_5, var_306_5, var_306_5)
					end
				end

				arg_303_1.var_.actorSpriteComps10021 = nil
			end

			local var_306_6 = arg_303_1.actors_["10018"]
			local var_306_7 = 0

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 and arg_303_1.var_.actorSpriteComps10018 == nil then
				arg_303_1.var_.actorSpriteComps10018 = var_306_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_8 = 0.034

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_8 then
				local var_306_9 = (arg_303_1.time_ - var_306_7) / var_306_8

				if arg_303_1.var_.actorSpriteComps10018 then
					for iter_306_4, iter_306_5 in pairs(arg_303_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_306_5 then
							local var_306_10 = Mathf.Lerp(iter_306_5.color.r, 1, var_306_9)

							iter_306_5.color = Color.New(var_306_10, var_306_10, var_306_10)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_7 + var_306_8 and arg_303_1.time_ < var_306_7 + var_306_8 + arg_306_0 and arg_303_1.var_.actorSpriteComps10018 then
				local var_306_11 = 1

				for iter_306_6, iter_306_7 in pairs(arg_303_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_306_7 then
						iter_306_7.color = Color.New(var_306_11, var_306_11, var_306_11)
					end
				end

				arg_303_1.var_.actorSpriteComps10018 = nil
			end

			local var_306_12 = 0
			local var_306_13 = 1.05

			if var_306_12 < arg_303_1.time_ and arg_303_1.time_ <= var_306_12 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_14 = arg_303_1:FormatText(StoryNameCfg[258].name)

				arg_303_1.leftNameTxt_.text = var_306_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_15 = arg_303_1:GetWordFromCfg(114251075)
				local var_306_16 = arg_303_1:FormatText(var_306_15.content)

				arg_303_1.text_.text = var_306_16

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_17 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251075", "story_v_out_114251.awb") ~= 0 then
					local var_306_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251075", "story_v_out_114251.awb") / 1000

					if var_306_20 + var_306_12 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_20 + var_306_12
					end

					if var_306_15.prefab_name ~= "" and arg_303_1.actors_[var_306_15.prefab_name] ~= nil then
						local var_306_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_15.prefab_name].transform, "story_v_out_114251", "114251075", "story_v_out_114251.awb")

						arg_303_1:RecordAudio("114251075", var_306_21)
						arg_303_1:RecordAudio("114251075", var_306_21)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_114251", "114251075", "story_v_out_114251.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_114251", "114251075", "story_v_out_114251.awb")
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
	Play114251076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 114251076
		arg_307_1.duration_ = 4.233

		local var_307_0 = {
			ja = 4.233,
			ko = 3.033,
			zh = 3,
			en = 3.733
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
				arg_307_0:Play114251077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["10021"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.actorSpriteComps10021 == nil then
				arg_307_1.var_.actorSpriteComps10021 = var_310_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_2 = 0.034

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.actorSpriteComps10021 then
					for iter_310_0, iter_310_1 in pairs(arg_307_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_310_1 then
							local var_310_4 = Mathf.Lerp(iter_310_1.color.r, 1, var_310_3)

							iter_310_1.color = Color.New(var_310_4, var_310_4, var_310_4)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.actorSpriteComps10021 then
				local var_310_5 = 1

				for iter_310_2, iter_310_3 in pairs(arg_307_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_310_3 then
						iter_310_3.color = Color.New(var_310_5, var_310_5, var_310_5)
					end
				end

				arg_307_1.var_.actorSpriteComps10021 = nil
			end

			local var_310_6 = arg_307_1.actors_["10018"]
			local var_310_7 = 0

			if var_310_7 < arg_307_1.time_ and arg_307_1.time_ <= var_310_7 + arg_310_0 and arg_307_1.var_.actorSpriteComps10018 == nil then
				arg_307_1.var_.actorSpriteComps10018 = var_310_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_8 = 0.034

			if var_310_7 <= arg_307_1.time_ and arg_307_1.time_ < var_310_7 + var_310_8 then
				local var_310_9 = (arg_307_1.time_ - var_310_7) / var_310_8

				if arg_307_1.var_.actorSpriteComps10018 then
					for iter_310_4, iter_310_5 in pairs(arg_307_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_310_5 then
							local var_310_10 = Mathf.Lerp(iter_310_5.color.r, 0.5, var_310_9)

							iter_310_5.color = Color.New(var_310_10, var_310_10, var_310_10)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_7 + var_310_8 and arg_307_1.time_ < var_310_7 + var_310_8 + arg_310_0 and arg_307_1.var_.actorSpriteComps10018 then
				local var_310_11 = 0.5

				for iter_310_6, iter_310_7 in pairs(arg_307_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_310_7 then
						iter_310_7.color = Color.New(var_310_11, var_310_11, var_310_11)
					end
				end

				arg_307_1.var_.actorSpriteComps10018 = nil
			end

			local var_310_12 = 0
			local var_310_13 = 0.3

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[226].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(114251076)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251076", "story_v_out_114251.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251076", "story_v_out_114251.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_out_114251", "114251076", "story_v_out_114251.awb")

						arg_307_1:RecordAudio("114251076", var_310_21)
						arg_307_1:RecordAudio("114251076", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_114251", "114251076", "story_v_out_114251.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_114251", "114251076", "story_v_out_114251.awb")
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
	Play114251077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 114251077
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play114251078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["10021"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.actorSpriteComps10021 == nil then
				arg_311_1.var_.actorSpriteComps10021 = var_314_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_314_2 = 0.034

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.actorSpriteComps10021 then
					for iter_314_0, iter_314_1 in pairs(arg_311_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_314_1 then
							local var_314_4 = Mathf.Lerp(iter_314_1.color.r, 0.5, var_314_3)

							iter_314_1.color = Color.New(var_314_4, var_314_4, var_314_4)
						end
					end
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.actorSpriteComps10021 then
				local var_314_5 = 0.5

				for iter_314_2, iter_314_3 in pairs(arg_311_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_314_3 then
						iter_314_3.color = Color.New(var_314_5, var_314_5, var_314_5)
					end
				end

				arg_311_1.var_.actorSpriteComps10021 = nil
			end

			local var_314_6 = 0
			local var_314_7 = 0.8

			if var_314_6 < arg_311_1.time_ and arg_311_1.time_ <= var_314_6 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_8 = arg_311_1:GetWordFromCfg(114251077)
				local var_314_9 = arg_311_1:FormatText(var_314_8.content)

				arg_311_1.text_.text = var_314_9

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_10 = 32
				local var_314_11 = utf8.len(var_314_9)
				local var_314_12 = var_314_10 <= 0 and var_314_7 or var_314_7 * (var_314_11 / var_314_10)

				if var_314_12 > 0 and var_314_7 < var_314_12 then
					arg_311_1.talkMaxDuration = var_314_12

					if var_314_12 + var_314_6 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_12 + var_314_6
					end
				end

				arg_311_1.text_.text = var_314_9
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_13 = math.max(var_314_7, arg_311_1.talkMaxDuration)

			if var_314_6 <= arg_311_1.time_ and arg_311_1.time_ < var_314_6 + var_314_13 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_6) / var_314_13

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_6 + var_314_13 and arg_311_1.time_ < var_314_6 + var_314_13 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play114251078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 114251078
		arg_315_1.duration_ = 12.933

		local var_315_0 = {
			ja = 9.966,
			ko = 12.933,
			zh = 12.466,
			en = 10.966
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
				arg_315_0:Play114251079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10018"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.actorSpriteComps10018 == nil then
				arg_315_1.var_.actorSpriteComps10018 = var_318_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_318_2 = 0.034

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.actorSpriteComps10018 then
					for iter_318_0, iter_318_1 in pairs(arg_315_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_318_1 then
							local var_318_4 = Mathf.Lerp(iter_318_1.color.r, 1, var_318_3)

							iter_318_1.color = Color.New(var_318_4, var_318_4, var_318_4)
						end
					end
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.actorSpriteComps10018 then
				local var_318_5 = 1

				for iter_318_2, iter_318_3 in pairs(arg_315_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_318_3 then
						iter_318_3.color = Color.New(var_318_5, var_318_5, var_318_5)
					end
				end

				arg_315_1.var_.actorSpriteComps10018 = nil
			end

			local var_318_6 = 0
			local var_318_7 = 1.3

			if var_318_6 < arg_315_1.time_ and arg_315_1.time_ <= var_318_6 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_8 = arg_315_1:FormatText(StoryNameCfg[258].name)

				arg_315_1.leftNameTxt_.text = var_318_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_9 = arg_315_1:GetWordFromCfg(114251078)
				local var_318_10 = arg_315_1:FormatText(var_318_9.content)

				arg_315_1.text_.text = var_318_10

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_11 = 52
				local var_318_12 = utf8.len(var_318_10)
				local var_318_13 = var_318_11 <= 0 and var_318_7 or var_318_7 * (var_318_12 / var_318_11)

				if var_318_13 > 0 and var_318_7 < var_318_13 then
					arg_315_1.talkMaxDuration = var_318_13

					if var_318_13 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_13 + var_318_6
					end
				end

				arg_315_1.text_.text = var_318_10
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251078", "story_v_out_114251.awb") ~= 0 then
					local var_318_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251078", "story_v_out_114251.awb") / 1000

					if var_318_14 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_14 + var_318_6
					end

					if var_318_9.prefab_name ~= "" and arg_315_1.actors_[var_318_9.prefab_name] ~= nil then
						local var_318_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_9.prefab_name].transform, "story_v_out_114251", "114251078", "story_v_out_114251.awb")

						arg_315_1:RecordAudio("114251078", var_318_15)
						arg_315_1:RecordAudio("114251078", var_318_15)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_114251", "114251078", "story_v_out_114251.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_114251", "114251078", "story_v_out_114251.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_16 = math.max(var_318_7, arg_315_1.talkMaxDuration)

			if var_318_6 <= arg_315_1.time_ and arg_315_1.time_ < var_318_6 + var_318_16 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_6) / var_318_16

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_6 + var_318_16 and arg_315_1.time_ < var_318_6 + var_318_16 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play114251079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 114251079
		arg_319_1.duration_ = 5.433

		local var_319_0 = {
			ja = 5.433,
			ko = 3.4,
			zh = 3.333,
			en = 3.1
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
				arg_319_0:Play114251080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10021"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.actorSpriteComps10021 == nil then
				arg_319_1.var_.actorSpriteComps10021 = var_322_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_2 = 0.034

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.actorSpriteComps10021 then
					for iter_322_0, iter_322_1 in pairs(arg_319_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_322_1 then
							local var_322_4 = Mathf.Lerp(iter_322_1.color.r, 1, var_322_3)

							iter_322_1.color = Color.New(var_322_4, var_322_4, var_322_4)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.actorSpriteComps10021 then
				local var_322_5 = 1

				for iter_322_2, iter_322_3 in pairs(arg_319_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_322_3 then
						iter_322_3.color = Color.New(var_322_5, var_322_5, var_322_5)
					end
				end

				arg_319_1.var_.actorSpriteComps10021 = nil
			end

			local var_322_6 = arg_319_1.actors_["10018"]
			local var_322_7 = 0

			if var_322_7 < arg_319_1.time_ and arg_319_1.time_ <= var_322_7 + arg_322_0 and arg_319_1.var_.actorSpriteComps10018 == nil then
				arg_319_1.var_.actorSpriteComps10018 = var_322_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_8 = 0.034

			if var_322_7 <= arg_319_1.time_ and arg_319_1.time_ < var_322_7 + var_322_8 then
				local var_322_9 = (arg_319_1.time_ - var_322_7) / var_322_8

				if arg_319_1.var_.actorSpriteComps10018 then
					for iter_322_4, iter_322_5 in pairs(arg_319_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_322_5 then
							local var_322_10 = Mathf.Lerp(iter_322_5.color.r, 0.5, var_322_9)

							iter_322_5.color = Color.New(var_322_10, var_322_10, var_322_10)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_7 + var_322_8 and arg_319_1.time_ < var_322_7 + var_322_8 + arg_322_0 and arg_319_1.var_.actorSpriteComps10018 then
				local var_322_11 = 0.5

				for iter_322_6, iter_322_7 in pairs(arg_319_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_322_7 then
						iter_322_7.color = Color.New(var_322_11, var_322_11, var_322_11)
					end
				end

				arg_319_1.var_.actorSpriteComps10018 = nil
			end

			local var_322_12 = 0
			local var_322_13 = 0.35

			if var_322_12 < arg_319_1.time_ and arg_319_1.time_ <= var_322_12 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_14 = arg_319_1:FormatText(StoryNameCfg[226].name)

				arg_319_1.leftNameTxt_.text = var_322_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_15 = arg_319_1:GetWordFromCfg(114251079)
				local var_322_16 = arg_319_1:FormatText(var_322_15.content)

				arg_319_1.text_.text = var_322_16

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_17 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251079", "story_v_out_114251.awb") ~= 0 then
					local var_322_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251079", "story_v_out_114251.awb") / 1000

					if var_322_20 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_20 + var_322_12
					end

					if var_322_15.prefab_name ~= "" and arg_319_1.actors_[var_322_15.prefab_name] ~= nil then
						local var_322_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_15.prefab_name].transform, "story_v_out_114251", "114251079", "story_v_out_114251.awb")

						arg_319_1:RecordAudio("114251079", var_322_21)
						arg_319_1:RecordAudio("114251079", var_322_21)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_114251", "114251079", "story_v_out_114251.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_114251", "114251079", "story_v_out_114251.awb")
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
	Play114251080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 114251080
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play114251081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["10021"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.actorSpriteComps10021 == nil then
				arg_323_1.var_.actorSpriteComps10021 = var_326_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_326_2 = 0.034

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.actorSpriteComps10021 then
					for iter_326_0, iter_326_1 in pairs(arg_323_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_326_1 then
							local var_326_4 = Mathf.Lerp(iter_326_1.color.r, 0.5, var_326_3)

							iter_326_1.color = Color.New(var_326_4, var_326_4, var_326_4)
						end
					end
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.actorSpriteComps10021 then
				local var_326_5 = 0.5

				for iter_326_2, iter_326_3 in pairs(arg_323_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_326_3 then
						iter_326_3.color = Color.New(var_326_5, var_326_5, var_326_5)
					end
				end

				arg_323_1.var_.actorSpriteComps10021 = nil
			end

			local var_326_6 = 0
			local var_326_7 = 0.375

			if var_326_6 < arg_323_1.time_ and arg_323_1.time_ <= var_326_6 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_8 = arg_323_1:GetWordFromCfg(114251080)
				local var_326_9 = arg_323_1:FormatText(var_326_8.content)

				arg_323_1.text_.text = var_326_9

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_10 = 15
				local var_326_11 = utf8.len(var_326_9)
				local var_326_12 = var_326_10 <= 0 and var_326_7 or var_326_7 * (var_326_11 / var_326_10)

				if var_326_12 > 0 and var_326_7 < var_326_12 then
					arg_323_1.talkMaxDuration = var_326_12

					if var_326_12 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_12 + var_326_6
					end
				end

				arg_323_1.text_.text = var_326_9
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_13 = math.max(var_326_7, arg_323_1.talkMaxDuration)

			if var_326_6 <= arg_323_1.time_ and arg_323_1.time_ < var_326_6 + var_326_13 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_6) / var_326_13

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_6 + var_326_13 and arg_323_1.time_ < var_326_6 + var_326_13 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play114251081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 114251081
		arg_327_1.duration_ = 4.233

		local var_327_0 = {
			ja = 3.666,
			ko = 4.233,
			zh = 2.966,
			en = 4.233
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play114251082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["10021"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.actorSpriteComps10021 == nil then
				arg_327_1.var_.actorSpriteComps10021 = var_330_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_2 = 0.034

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.actorSpriteComps10021 then
					for iter_330_0, iter_330_1 in pairs(arg_327_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_330_1 then
							local var_330_4 = Mathf.Lerp(iter_330_1.color.r, 1, var_330_3)

							iter_330_1.color = Color.New(var_330_4, var_330_4, var_330_4)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.actorSpriteComps10021 then
				local var_330_5 = 1

				for iter_330_2, iter_330_3 in pairs(arg_327_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_330_3 then
						iter_330_3.color = Color.New(var_330_5, var_330_5, var_330_5)
					end
				end

				arg_327_1.var_.actorSpriteComps10021 = nil
			end

			local var_330_6 = 0
			local var_330_7 = 0.45

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_8 = arg_327_1:FormatText(StoryNameCfg[226].name)

				arg_327_1.leftNameTxt_.text = var_330_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_9 = arg_327_1:GetWordFromCfg(114251081)
				local var_330_10 = arg_327_1:FormatText(var_330_9.content)

				arg_327_1.text_.text = var_330_10

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_11 = 18
				local var_330_12 = utf8.len(var_330_10)
				local var_330_13 = var_330_11 <= 0 and var_330_7 or var_330_7 * (var_330_12 / var_330_11)

				if var_330_13 > 0 and var_330_7 < var_330_13 then
					arg_327_1.talkMaxDuration = var_330_13

					if var_330_13 + var_330_6 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_13 + var_330_6
					end
				end

				arg_327_1.text_.text = var_330_10
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251081", "story_v_out_114251.awb") ~= 0 then
					local var_330_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251081", "story_v_out_114251.awb") / 1000

					if var_330_14 + var_330_6 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_14 + var_330_6
					end

					if var_330_9.prefab_name ~= "" and arg_327_1.actors_[var_330_9.prefab_name] ~= nil then
						local var_330_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_9.prefab_name].transform, "story_v_out_114251", "114251081", "story_v_out_114251.awb")

						arg_327_1:RecordAudio("114251081", var_330_15)
						arg_327_1:RecordAudio("114251081", var_330_15)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_114251", "114251081", "story_v_out_114251.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_114251", "114251081", "story_v_out_114251.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_16 = math.max(var_330_7, arg_327_1.talkMaxDuration)

			if var_330_6 <= arg_327_1.time_ and arg_327_1.time_ < var_330_6 + var_330_16 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_6) / var_330_16

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_6 + var_330_16 and arg_327_1.time_ < var_330_6 + var_330_16 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play114251082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 114251082
		arg_331_1.duration_ = 5.2

		local var_331_0 = {
			ja = 4.766,
			ko = 3.1,
			zh = 5.2,
			en = 4.733
		}
		local var_331_1 = manager.audio:GetLocalizationFlag()

		if var_331_0[var_331_1] ~= nil then
			arg_331_1.duration_ = var_331_0[var_331_1]
		end

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play114251083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["10021"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.actorSpriteComps10021 == nil then
				arg_331_1.var_.actorSpriteComps10021 = var_334_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_2 = 0.034

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.actorSpriteComps10021 then
					for iter_334_0, iter_334_1 in pairs(arg_331_1.var_.actorSpriteComps10021:ToTable()) do
						if iter_334_1 then
							local var_334_4 = Mathf.Lerp(iter_334_1.color.r, 0.5, var_334_3)

							iter_334_1.color = Color.New(var_334_4, var_334_4, var_334_4)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.actorSpriteComps10021 then
				local var_334_5 = 0.5

				for iter_334_2, iter_334_3 in pairs(arg_331_1.var_.actorSpriteComps10021:ToTable()) do
					if iter_334_3 then
						iter_334_3.color = Color.New(var_334_5, var_334_5, var_334_5)
					end
				end

				arg_331_1.var_.actorSpriteComps10021 = nil
			end

			local var_334_6 = arg_331_1.actors_["10018"]
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 and arg_331_1.var_.actorSpriteComps10018 == nil then
				arg_331_1.var_.actorSpriteComps10018 = var_334_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_8 = 0.034

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8

				if arg_331_1.var_.actorSpriteComps10018 then
					for iter_334_4, iter_334_5 in pairs(arg_331_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_334_5 then
							local var_334_10 = Mathf.Lerp(iter_334_5.color.r, 1, var_334_9)

							iter_334_5.color = Color.New(var_334_10, var_334_10, var_334_10)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 and arg_331_1.var_.actorSpriteComps10018 then
				local var_334_11 = 1

				for iter_334_6, iter_334_7 in pairs(arg_331_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_334_7 then
						iter_334_7.color = Color.New(var_334_11, var_334_11, var_334_11)
					end
				end

				arg_331_1.var_.actorSpriteComps10018 = nil
			end

			local var_334_12 = 0
			local var_334_13 = 0.25

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_14 = arg_331_1:FormatText(StoryNameCfg[258].name)

				arg_331_1.leftNameTxt_.text = var_334_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_15 = arg_331_1:GetWordFromCfg(114251082)
				local var_334_16 = arg_331_1:FormatText(var_334_15.content)

				arg_331_1.text_.text = var_334_16

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_17 = 10
				local var_334_18 = utf8.len(var_334_16)
				local var_334_19 = var_334_17 <= 0 and var_334_13 or var_334_13 * (var_334_18 / var_334_17)

				if var_334_19 > 0 and var_334_13 < var_334_19 then
					arg_331_1.talkMaxDuration = var_334_19

					if var_334_19 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_19 + var_334_12
					end
				end

				arg_331_1.text_.text = var_334_16
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251082", "story_v_out_114251.awb") ~= 0 then
					local var_334_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251082", "story_v_out_114251.awb") / 1000

					if var_334_20 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_20 + var_334_12
					end

					if var_334_15.prefab_name ~= "" and arg_331_1.actors_[var_334_15.prefab_name] ~= nil then
						local var_334_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_15.prefab_name].transform, "story_v_out_114251", "114251082", "story_v_out_114251.awb")

						arg_331_1:RecordAudio("114251082", var_334_21)
						arg_331_1:RecordAudio("114251082", var_334_21)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_114251", "114251082", "story_v_out_114251.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_114251", "114251082", "story_v_out_114251.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_22 = math.max(var_334_13, arg_331_1.talkMaxDuration)

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_22 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_12) / var_334_22

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_12 + var_334_22 and arg_331_1.time_ < var_334_12 + var_334_22 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play114251083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 114251083
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play114251084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["10018"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				local var_338_2 = var_338_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_338_2 then
					arg_335_1.var_.alphaOldValue10018 = var_338_2.alpha
					arg_335_1.var_.characterEffect10018 = var_338_2
				end

				arg_335_1.var_.alphaOldValue10018 = 1
			end

			local var_338_3 = 0.5

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_3 then
				local var_338_4 = (arg_335_1.time_ - var_338_1) / var_338_3
				local var_338_5 = Mathf.Lerp(arg_335_1.var_.alphaOldValue10018, 0, var_338_4)

				if arg_335_1.var_.characterEffect10018 then
					arg_335_1.var_.characterEffect10018.alpha = var_338_5
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_3 and arg_335_1.time_ < var_338_1 + var_338_3 + arg_338_0 and arg_335_1.var_.characterEffect10018 then
				arg_335_1.var_.characterEffect10018.alpha = 0
			end

			local var_338_6 = arg_335_1.actors_["10021"]
			local var_338_7 = 0

			if var_338_7 < arg_335_1.time_ and arg_335_1.time_ <= var_338_7 + arg_338_0 then
				local var_338_8 = var_338_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_338_8 then
					arg_335_1.var_.alphaOldValue10021 = var_338_8.alpha
					arg_335_1.var_.characterEffect10021 = var_338_8
				end

				arg_335_1.var_.alphaOldValue10021 = 1
			end

			local var_338_9 = 0.5

			if var_338_7 <= arg_335_1.time_ and arg_335_1.time_ < var_338_7 + var_338_9 then
				local var_338_10 = (arg_335_1.time_ - var_338_7) / var_338_9
				local var_338_11 = Mathf.Lerp(arg_335_1.var_.alphaOldValue10021, 0, var_338_10)

				if arg_335_1.var_.characterEffect10021 then
					arg_335_1.var_.characterEffect10021.alpha = var_338_11
				end
			end

			if arg_335_1.time_ >= var_338_7 + var_338_9 and arg_335_1.time_ < var_338_7 + var_338_9 + arg_338_0 and arg_335_1.var_.characterEffect10021 then
				arg_335_1.var_.characterEffect10021.alpha = 0
			end

			local var_338_12 = 0
			local var_338_13 = 0.925

			if var_338_12 < arg_335_1.time_ and arg_335_1.time_ <= var_338_12 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_14 = arg_335_1:GetWordFromCfg(114251083)
				local var_338_15 = arg_335_1:FormatText(var_338_14.content)

				arg_335_1.text_.text = var_338_15

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_16 = 37
				local var_338_17 = utf8.len(var_338_15)
				local var_338_18 = var_338_16 <= 0 and var_338_13 or var_338_13 * (var_338_17 / var_338_16)

				if var_338_18 > 0 and var_338_13 < var_338_18 then
					arg_335_1.talkMaxDuration = var_338_18

					if var_338_18 + var_338_12 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_18 + var_338_12
					end
				end

				arg_335_1.text_.text = var_338_15
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_19 = math.max(var_338_13, arg_335_1.talkMaxDuration)

			if var_338_12 <= arg_335_1.time_ and arg_335_1.time_ < var_338_12 + var_338_19 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_12) / var_338_19

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_12 + var_338_19 and arg_335_1.time_ < var_338_12 + var_338_19 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play114251084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 114251084
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play114251085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 1.3

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, false)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_2 = arg_339_1:GetWordFromCfg(114251084)
				local var_342_3 = arg_339_1:FormatText(var_342_2.content)

				arg_339_1.text_.text = var_342_3

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_4 = 51
				local var_342_5 = utf8.len(var_342_3)
				local var_342_6 = var_342_4 <= 0 and var_342_1 or var_342_1 * (var_342_5 / var_342_4)

				if var_342_6 > 0 and var_342_1 < var_342_6 then
					arg_339_1.talkMaxDuration = var_342_6

					if var_342_6 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_6 + var_342_0
					end
				end

				arg_339_1.text_.text = var_342_3
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_7 = math.max(var_342_1, arg_339_1.talkMaxDuration)

			if var_342_0 <= arg_339_1.time_ and arg_339_1.time_ < var_342_0 + var_342_7 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_0) / var_342_7

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_0 + var_342_7 and arg_339_1.time_ < var_342_0 + var_342_7 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play114251085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 114251085
		arg_343_1.duration_ = 4.3

		local var_343_0 = {
			ja = 3.133,
			ko = 3.6,
			zh = 4,
			en = 4.3
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play114251086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["10018"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos10018 = var_346_0.localPosition
				var_346_0.localScale = Vector3.New(1, 1, 1)

				arg_343_1:CheckSpriteTmpPos("10018", 3)

				local var_346_2 = var_346_0.childCount

				for iter_346_0 = 0, var_346_2 - 1 do
					local var_346_3 = var_346_0:GetChild(iter_346_0)

					if var_346_3.name == "split_2" or not string.find(var_346_3.name, "split") then
						var_346_3.gameObject:SetActive(true)
					else
						var_346_3.gameObject:SetActive(false)
					end
				end
			end

			local var_346_4 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_4 then
				local var_346_5 = (arg_343_1.time_ - var_346_1) / var_346_4
				local var_346_6 = Vector3.New(0, -350, -180)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos10018, var_346_6, var_346_5)
			end

			if arg_343_1.time_ >= var_346_1 + var_346_4 and arg_343_1.time_ < var_346_1 + var_346_4 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_346_7 = arg_343_1.actors_["10018"]
			local var_346_8 = 0

			if var_346_8 < arg_343_1.time_ and arg_343_1.time_ <= var_346_8 + arg_346_0 and arg_343_1.var_.actorSpriteComps10018 == nil then
				arg_343_1.var_.actorSpriteComps10018 = var_346_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_346_9 = 0.034

			if var_346_8 <= arg_343_1.time_ and arg_343_1.time_ < var_346_8 + var_346_9 then
				local var_346_10 = (arg_343_1.time_ - var_346_8) / var_346_9

				if arg_343_1.var_.actorSpriteComps10018 then
					for iter_346_1, iter_346_2 in pairs(arg_343_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_346_2 then
							local var_346_11 = Mathf.Lerp(iter_346_2.color.r, 1, var_346_10)

							iter_346_2.color = Color.New(var_346_11, var_346_11, var_346_11)
						end
					end
				end
			end

			if arg_343_1.time_ >= var_346_8 + var_346_9 and arg_343_1.time_ < var_346_8 + var_346_9 + arg_346_0 and arg_343_1.var_.actorSpriteComps10018 then
				local var_346_12 = 1

				for iter_346_3, iter_346_4 in pairs(arg_343_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_346_4 then
						iter_346_4.color = Color.New(var_346_12, var_346_12, var_346_12)
					end
				end

				arg_343_1.var_.actorSpriteComps10018 = nil
			end

			local var_346_13 = arg_343_1.actors_["10018"]
			local var_346_14 = 0

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				local var_346_15 = var_346_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_346_15 then
					arg_343_1.var_.alphaOldValue10018 = var_346_15.alpha
					arg_343_1.var_.characterEffect10018 = var_346_15
				end

				arg_343_1.var_.alphaOldValue10018 = 0
			end

			local var_346_16 = 0.5

			if var_346_14 <= arg_343_1.time_ and arg_343_1.time_ < var_346_14 + var_346_16 then
				local var_346_17 = (arg_343_1.time_ - var_346_14) / var_346_16
				local var_346_18 = Mathf.Lerp(arg_343_1.var_.alphaOldValue10018, 1, var_346_17)

				if arg_343_1.var_.characterEffect10018 then
					arg_343_1.var_.characterEffect10018.alpha = var_346_18
				end
			end

			if arg_343_1.time_ >= var_346_14 + var_346_16 and arg_343_1.time_ < var_346_14 + var_346_16 + arg_346_0 and arg_343_1.var_.characterEffect10018 then
				arg_343_1.var_.characterEffect10018.alpha = 1
			end

			local var_346_19 = 0
			local var_346_20 = 0.3

			if var_346_19 < arg_343_1.time_ and arg_343_1.time_ <= var_346_19 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_21 = arg_343_1:FormatText(StoryNameCfg[258].name)

				arg_343_1.leftNameTxt_.text = var_346_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_22 = arg_343_1:GetWordFromCfg(114251085)
				local var_346_23 = arg_343_1:FormatText(var_346_22.content)

				arg_343_1.text_.text = var_346_23

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_24 = 12
				local var_346_25 = utf8.len(var_346_23)
				local var_346_26 = var_346_24 <= 0 and var_346_20 or var_346_20 * (var_346_25 / var_346_24)

				if var_346_26 > 0 and var_346_20 < var_346_26 then
					arg_343_1.talkMaxDuration = var_346_26

					if var_346_26 + var_346_19 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_26 + var_346_19
					end
				end

				arg_343_1.text_.text = var_346_23
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251085", "story_v_out_114251.awb") ~= 0 then
					local var_346_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251085", "story_v_out_114251.awb") / 1000

					if var_346_27 + var_346_19 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_27 + var_346_19
					end

					if var_346_22.prefab_name ~= "" and arg_343_1.actors_[var_346_22.prefab_name] ~= nil then
						local var_346_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_22.prefab_name].transform, "story_v_out_114251", "114251085", "story_v_out_114251.awb")

						arg_343_1:RecordAudio("114251085", var_346_28)
						arg_343_1:RecordAudio("114251085", var_346_28)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_114251", "114251085", "story_v_out_114251.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_114251", "114251085", "story_v_out_114251.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_29 = math.max(var_346_20, arg_343_1.talkMaxDuration)

			if var_346_19 <= arg_343_1.time_ and arg_343_1.time_ < var_346_19 + var_346_29 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_19) / var_346_29

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_19 + var_346_29 and arg_343_1.time_ < var_346_19 + var_346_29 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play114251086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 114251086
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play114251087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10018"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.actorSpriteComps10018 == nil then
				arg_347_1.var_.actorSpriteComps10018 = var_350_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_2 = 0.034

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.actorSpriteComps10018 then
					for iter_350_0, iter_350_1 in pairs(arg_347_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_350_1 then
							local var_350_4 = Mathf.Lerp(iter_350_1.color.r, 0.5, var_350_3)

							iter_350_1.color = Color.New(var_350_4, var_350_4, var_350_4)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.actorSpriteComps10018 then
				local var_350_5 = 0.5

				for iter_350_2, iter_350_3 in pairs(arg_347_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_350_3 then
						iter_350_3.color = Color.New(var_350_5, var_350_5, var_350_5)
					end
				end

				arg_347_1.var_.actorSpriteComps10018 = nil
			end

			local var_350_6 = 0
			local var_350_7 = 2.3

			if var_350_6 < arg_347_1.time_ and arg_347_1.time_ <= var_350_6 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, false)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_8 = arg_347_1:GetWordFromCfg(114251086)
				local var_350_9 = arg_347_1:FormatText(var_350_8.content)

				arg_347_1.text_.text = var_350_9

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_10 = 92
				local var_350_11 = utf8.len(var_350_9)
				local var_350_12 = var_350_10 <= 0 and var_350_7 or var_350_7 * (var_350_11 / var_350_10)

				if var_350_12 > 0 and var_350_7 < var_350_12 then
					arg_347_1.talkMaxDuration = var_350_12

					if var_350_12 + var_350_6 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_12 + var_350_6
					end
				end

				arg_347_1.text_.text = var_350_9
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_13 = math.max(var_350_7, arg_347_1.talkMaxDuration)

			if var_350_6 <= arg_347_1.time_ and arg_347_1.time_ < var_350_6 + var_350_13 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_6) / var_350_13

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_6 + var_350_13 and arg_347_1.time_ < var_350_6 + var_350_13 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play114251087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 114251087
		arg_351_1.duration_ = 3.666

		local var_351_0 = {
			ja = 2.833,
			ko = 3.666,
			zh = 3.466,
			en = 3.166
		}
		local var_351_1 = manager.audio:GetLocalizationFlag()

		if var_351_0[var_351_1] ~= nil then
			arg_351_1.duration_ = var_351_0[var_351_1]
		end

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play114251088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["10018"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos10018 = var_354_0.localPosition
				var_354_0.localScale = Vector3.New(1, 1, 1)

				arg_351_1:CheckSpriteTmpPos("10018", 3)

				local var_354_2 = var_354_0.childCount

				for iter_354_0 = 0, var_354_2 - 1 do
					local var_354_3 = var_354_0:GetChild(iter_354_0)

					if var_354_3.name == "split_1" or not string.find(var_354_3.name, "split") then
						var_354_3.gameObject:SetActive(true)
					else
						var_354_3.gameObject:SetActive(false)
					end
				end
			end

			local var_354_4 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_4 then
				local var_354_5 = (arg_351_1.time_ - var_354_1) / var_354_4
				local var_354_6 = Vector3.New(0, -350, -180)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos10018, var_354_6, var_354_5)
			end

			if arg_351_1.time_ >= var_354_1 + var_354_4 and arg_351_1.time_ < var_354_1 + var_354_4 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_354_7 = arg_351_1.actors_["10018"]
			local var_354_8 = 0

			if var_354_8 < arg_351_1.time_ and arg_351_1.time_ <= var_354_8 + arg_354_0 and arg_351_1.var_.actorSpriteComps10018 == nil then
				arg_351_1.var_.actorSpriteComps10018 = var_354_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_9 = 0.034

			if var_354_8 <= arg_351_1.time_ and arg_351_1.time_ < var_354_8 + var_354_9 then
				local var_354_10 = (arg_351_1.time_ - var_354_8) / var_354_9

				if arg_351_1.var_.actorSpriteComps10018 then
					for iter_354_1, iter_354_2 in pairs(arg_351_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_354_2 then
							local var_354_11 = Mathf.Lerp(iter_354_2.color.r, 1, var_354_10)

							iter_354_2.color = Color.New(var_354_11, var_354_11, var_354_11)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_8 + var_354_9 and arg_351_1.time_ < var_354_8 + var_354_9 + arg_354_0 and arg_351_1.var_.actorSpriteComps10018 then
				local var_354_12 = 1

				for iter_354_3, iter_354_4 in pairs(arg_351_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_354_4 then
						iter_354_4.color = Color.New(var_354_12, var_354_12, var_354_12)
					end
				end

				arg_351_1.var_.actorSpriteComps10018 = nil
			end

			local var_354_13 = arg_351_1.actors_["10018"]
			local var_354_14 = 0

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				local var_354_15 = var_354_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_354_15 then
					arg_351_1.var_.alphaOldValue10018 = var_354_15.alpha
					arg_351_1.var_.characterEffect10018 = var_354_15
				end

				arg_351_1.var_.alphaOldValue10018 = 0
			end

			local var_354_16 = 0.0166666666666667

			if var_354_14 <= arg_351_1.time_ and arg_351_1.time_ < var_354_14 + var_354_16 then
				local var_354_17 = (arg_351_1.time_ - var_354_14) / var_354_16
				local var_354_18 = Mathf.Lerp(arg_351_1.var_.alphaOldValue10018, 1, var_354_17)

				if arg_351_1.var_.characterEffect10018 then
					arg_351_1.var_.characterEffect10018.alpha = var_354_18
				end
			end

			if arg_351_1.time_ >= var_354_14 + var_354_16 and arg_351_1.time_ < var_354_14 + var_354_16 + arg_354_0 and arg_351_1.var_.characterEffect10018 then
				arg_351_1.var_.characterEffect10018.alpha = 1
			end

			local var_354_19 = 0
			local var_354_20 = 0.275

			if var_354_19 < arg_351_1.time_ and arg_351_1.time_ <= var_354_19 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_21 = arg_351_1:FormatText(StoryNameCfg[258].name)

				arg_351_1.leftNameTxt_.text = var_354_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_22 = arg_351_1:GetWordFromCfg(114251087)
				local var_354_23 = arg_351_1:FormatText(var_354_22.content)

				arg_351_1.text_.text = var_354_23

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_24 = 11
				local var_354_25 = utf8.len(var_354_23)
				local var_354_26 = var_354_24 <= 0 and var_354_20 or var_354_20 * (var_354_25 / var_354_24)

				if var_354_26 > 0 and var_354_20 < var_354_26 then
					arg_351_1.talkMaxDuration = var_354_26

					if var_354_26 + var_354_19 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_26 + var_354_19
					end
				end

				arg_351_1.text_.text = var_354_23
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251087", "story_v_out_114251.awb") ~= 0 then
					local var_354_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251087", "story_v_out_114251.awb") / 1000

					if var_354_27 + var_354_19 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_27 + var_354_19
					end

					if var_354_22.prefab_name ~= "" and arg_351_1.actors_[var_354_22.prefab_name] ~= nil then
						local var_354_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_22.prefab_name].transform, "story_v_out_114251", "114251087", "story_v_out_114251.awb")

						arg_351_1:RecordAudio("114251087", var_354_28)
						arg_351_1:RecordAudio("114251087", var_354_28)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_114251", "114251087", "story_v_out_114251.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_114251", "114251087", "story_v_out_114251.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_29 = math.max(var_354_20, arg_351_1.talkMaxDuration)

			if var_354_19 <= arg_351_1.time_ and arg_351_1.time_ < var_354_19 + var_354_29 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_19) / var_354_29

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_19 + var_354_29 and arg_351_1.time_ < var_354_19 + var_354_29 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play114251088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 114251088
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play114251089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["10018"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.actorSpriteComps10018 == nil then
				arg_355_1.var_.actorSpriteComps10018 = var_358_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_358_2 = 0.034

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.actorSpriteComps10018 then
					for iter_358_0, iter_358_1 in pairs(arg_355_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_358_1 then
							local var_358_4 = Mathf.Lerp(iter_358_1.color.r, 0.5, var_358_3)

							iter_358_1.color = Color.New(var_358_4, var_358_4, var_358_4)
						end
					end
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.actorSpriteComps10018 then
				local var_358_5 = 0.5

				for iter_358_2, iter_358_3 in pairs(arg_355_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_358_3 then
						iter_358_3.color = Color.New(var_358_5, var_358_5, var_358_5)
					end
				end

				arg_355_1.var_.actorSpriteComps10018 = nil
			end

			local var_358_6 = 0
			local var_358_7 = 0.7

			if var_358_6 < arg_355_1.time_ and arg_355_1.time_ <= var_358_6 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_8 = arg_355_1:GetWordFromCfg(114251088)
				local var_358_9 = arg_355_1:FormatText(var_358_8.content)

				arg_355_1.text_.text = var_358_9

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_10 = 28
				local var_358_11 = utf8.len(var_358_9)
				local var_358_12 = var_358_10 <= 0 and var_358_7 or var_358_7 * (var_358_11 / var_358_10)

				if var_358_12 > 0 and var_358_7 < var_358_12 then
					arg_355_1.talkMaxDuration = var_358_12

					if var_358_12 + var_358_6 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_12 + var_358_6
					end
				end

				arg_355_1.text_.text = var_358_9
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_13 = math.max(var_358_7, arg_355_1.talkMaxDuration)

			if var_358_6 <= arg_355_1.time_ and arg_355_1.time_ < var_358_6 + var_358_13 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_6) / var_358_13

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_6 + var_358_13 and arg_355_1.time_ < var_358_6 + var_358_13 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play114251089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 114251089
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play114251090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["10018"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				local var_362_2 = var_362_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_362_2 then
					arg_359_1.var_.alphaOldValue10018 = var_362_2.alpha
					arg_359_1.var_.characterEffect10018 = var_362_2
				end

				arg_359_1.var_.alphaOldValue10018 = 1
			end

			local var_362_3 = 0.5

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_3 then
				local var_362_4 = (arg_359_1.time_ - var_362_1) / var_362_3
				local var_362_5 = Mathf.Lerp(arg_359_1.var_.alphaOldValue10018, 0, var_362_4)

				if arg_359_1.var_.characterEffect10018 then
					arg_359_1.var_.characterEffect10018.alpha = var_362_5
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_3 and arg_359_1.time_ < var_362_1 + var_362_3 + arg_362_0 and arg_359_1.var_.characterEffect10018 then
				arg_359_1.var_.characterEffect10018.alpha = 0
			end

			local var_362_6 = 0
			local var_362_7 = 1.075

			if var_362_6 < arg_359_1.time_ and arg_359_1.time_ <= var_362_6 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, false)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_8 = arg_359_1:GetWordFromCfg(114251089)
				local var_362_9 = arg_359_1:FormatText(var_362_8.content)

				arg_359_1.text_.text = var_362_9

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_10 = 43
				local var_362_11 = utf8.len(var_362_9)
				local var_362_12 = var_362_10 <= 0 and var_362_7 or var_362_7 * (var_362_11 / var_362_10)

				if var_362_12 > 0 and var_362_7 < var_362_12 then
					arg_359_1.talkMaxDuration = var_362_12

					if var_362_12 + var_362_6 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_12 + var_362_6
					end
				end

				arg_359_1.text_.text = var_362_9
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_13 = math.max(var_362_7, arg_359_1.talkMaxDuration)

			if var_362_6 <= arg_359_1.time_ and arg_359_1.time_ < var_362_6 + var_362_13 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_6) / var_362_13

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_6 + var_362_13 and arg_359_1.time_ < var_362_6 + var_362_13 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play114251090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 114251090
		arg_363_1.duration_ = 15.5

		local var_363_0 = {
			ja = 15.5,
			ko = 2.8,
			zh = 3.933,
			en = 2.7
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play114251091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0
			local var_366_1 = 0.25

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_2 = arg_363_1:FormatText(StoryNameCfg[226].name)

				arg_363_1.leftNameTxt_.text = var_366_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, true)
				arg_363_1.iconController_:SetSelectedState("hero")

				arg_363_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10021")

				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_3 = arg_363_1:GetWordFromCfg(114251090)
				local var_366_4 = arg_363_1:FormatText(var_366_3.content)

				arg_363_1.text_.text = var_366_4

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_5 = 10
				local var_366_6 = utf8.len(var_366_4)
				local var_366_7 = var_366_5 <= 0 and var_366_1 or var_366_1 * (var_366_6 / var_366_5)

				if var_366_7 > 0 and var_366_1 < var_366_7 then
					arg_363_1.talkMaxDuration = var_366_7

					if var_366_7 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_7 + var_366_0
					end
				end

				arg_363_1.text_.text = var_366_4
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251090", "story_v_out_114251.awb") ~= 0 then
					local var_366_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251090", "story_v_out_114251.awb") / 1000

					if var_366_8 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_8 + var_366_0
					end

					if var_366_3.prefab_name ~= "" and arg_363_1.actors_[var_366_3.prefab_name] ~= nil then
						local var_366_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_3.prefab_name].transform, "story_v_out_114251", "114251090", "story_v_out_114251.awb")

						arg_363_1:RecordAudio("114251090", var_366_9)
						arg_363_1:RecordAudio("114251090", var_366_9)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_114251", "114251090", "story_v_out_114251.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_114251", "114251090", "story_v_out_114251.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_10 = math.max(var_366_1, arg_363_1.talkMaxDuration)

			if var_366_0 <= arg_363_1.time_ and arg_363_1.time_ < var_366_0 + var_366_10 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_0) / var_366_10

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_0 + var_366_10 and arg_363_1.time_ < var_366_0 + var_366_10 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play114251091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 114251091
		arg_367_1.duration_ = 2.333

		local var_367_0 = {
			ja = 2.333,
			ko = 1.533,
			zh = 0.999999999999,
			en = 1.233
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play114251092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["10018"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.actorSpriteComps10018 == nil then
				arg_367_1.var_.actorSpriteComps10018 = var_370_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_2 = 0.034

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.actorSpriteComps10018 then
					for iter_370_0, iter_370_1 in pairs(arg_367_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_370_1 then
							local var_370_4 = Mathf.Lerp(iter_370_1.color.r, 1, var_370_3)

							iter_370_1.color = Color.New(var_370_4, var_370_4, var_370_4)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.actorSpriteComps10018 then
				local var_370_5 = 1

				for iter_370_2, iter_370_3 in pairs(arg_367_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_370_3 then
						iter_370_3.color = Color.New(var_370_5, var_370_5, var_370_5)
					end
				end

				arg_367_1.var_.actorSpriteComps10018 = nil
			end

			local var_370_6 = 0
			local var_370_7 = 0.05

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_8 = arg_367_1:FormatText(StoryNameCfg[258].name)

				arg_367_1.leftNameTxt_.text = var_370_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, true)
				arg_367_1.iconController_:SetSelectedState("hero")

				arg_367_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10018")

				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_9 = arg_367_1:GetWordFromCfg(114251091)
				local var_370_10 = arg_367_1:FormatText(var_370_9.content)

				arg_367_1.text_.text = var_370_10

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_11 = 2
				local var_370_12 = utf8.len(var_370_10)
				local var_370_13 = var_370_11 <= 0 and var_370_7 or var_370_7 * (var_370_12 / var_370_11)

				if var_370_13 > 0 and var_370_7 < var_370_13 then
					arg_367_1.talkMaxDuration = var_370_13

					if var_370_13 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_13 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_10
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251091", "story_v_out_114251.awb") ~= 0 then
					local var_370_14 = manager.audio:GetVoiceLength("story_v_out_114251", "114251091", "story_v_out_114251.awb") / 1000

					if var_370_14 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_14 + var_370_6
					end

					if var_370_9.prefab_name ~= "" and arg_367_1.actors_[var_370_9.prefab_name] ~= nil then
						local var_370_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_9.prefab_name].transform, "story_v_out_114251", "114251091", "story_v_out_114251.awb")

						arg_367_1:RecordAudio("114251091", var_370_15)
						arg_367_1:RecordAudio("114251091", var_370_15)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_114251", "114251091", "story_v_out_114251.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_114251", "114251091", "story_v_out_114251.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_16 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_16 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_16

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_16 and arg_367_1.time_ < var_370_6 + var_370_16 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play114251092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 114251092
		arg_371_1.duration_ = 6.133

		local var_371_0 = {
			ja = 4.633,
			ko = 6.133,
			zh = 5.9,
			en = 5.6
		}
		local var_371_1 = manager.audio:GetLocalizationFlag()

		if var_371_0[var_371_1] ~= nil then
			arg_371_1.duration_ = var_371_0[var_371_1]
		end

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play114251093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 0.6

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_2 = arg_371_1:FormatText(StoryNameCfg[258].name)

				arg_371_1.leftNameTxt_.text = var_374_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, true)
				arg_371_1.iconController_:SetSelectedState("hero")

				arg_371_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10018")

				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_3 = arg_371_1:GetWordFromCfg(114251092)
				local var_374_4 = arg_371_1:FormatText(var_374_3.content)

				arg_371_1.text_.text = var_374_4

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_5 = 24
				local var_374_6 = utf8.len(var_374_4)
				local var_374_7 = var_374_5 <= 0 and var_374_1 or var_374_1 * (var_374_6 / var_374_5)

				if var_374_7 > 0 and var_374_1 < var_374_7 then
					arg_371_1.talkMaxDuration = var_374_7

					if var_374_7 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_7 + var_374_0
					end
				end

				arg_371_1.text_.text = var_374_4
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251092", "story_v_out_114251.awb") ~= 0 then
					local var_374_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251092", "story_v_out_114251.awb") / 1000

					if var_374_8 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_8 + var_374_0
					end

					if var_374_3.prefab_name ~= "" and arg_371_1.actors_[var_374_3.prefab_name] ~= nil then
						local var_374_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_3.prefab_name].transform, "story_v_out_114251", "114251092", "story_v_out_114251.awb")

						arg_371_1:RecordAudio("114251092", var_374_9)
						arg_371_1:RecordAudio("114251092", var_374_9)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_114251", "114251092", "story_v_out_114251.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_114251", "114251092", "story_v_out_114251.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_10 = math.max(var_374_1, arg_371_1.talkMaxDuration)

			if var_374_0 <= arg_371_1.time_ and arg_371_1.time_ < var_374_0 + var_374_10 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_0) / var_374_10

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_0 + var_374_10 and arg_371_1.time_ < var_374_0 + var_374_10 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play114251093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 114251093
		arg_375_1.duration_ = 18.2

		local var_375_0 = {
			ja = 16.2,
			ko = 17.633,
			zh = 16.7,
			en = 18.2
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play114251094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 1.999999999999

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				local var_378_1 = manager.ui.mainCamera.transform.localPosition
				local var_378_2 = Vector3.New(0, 0, 10) + Vector3.New(var_378_1.x, var_378_1.y, 0)
				local var_378_3 = arg_375_1.bgs_.ST24

				var_378_3.transform.localPosition = var_378_2
				var_378_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_378_4 = var_378_3:GetComponent("SpriteRenderer")

				if var_378_4 and var_378_4.sprite then
					local var_378_5 = (var_378_3.transform.localPosition - var_378_1).z
					local var_378_6 = manager.ui.mainCameraCom_
					local var_378_7 = 2 * var_378_5 * Mathf.Tan(var_378_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_378_8 = var_378_7 * var_378_6.aspect
					local var_378_9 = var_378_4.sprite.bounds.size.x
					local var_378_10 = var_378_4.sprite.bounds.size.y
					local var_378_11 = var_378_8 / var_378_9
					local var_378_12 = var_378_7 / var_378_10
					local var_378_13 = var_378_12 < var_378_11 and var_378_11 or var_378_12

					var_378_3.transform.localScale = Vector3.New(var_378_13, var_378_13, 0)
				end

				for iter_378_0, iter_378_1 in pairs(arg_375_1.bgs_) do
					if iter_378_0 ~= "ST24" then
						iter_378_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				arg_375_1.mask_.enabled = true
				arg_375_1.mask_.raycastTarget = true

				arg_375_1:SetGaussion(false)
			end

			local var_378_15 = 2

			if var_378_14 <= arg_375_1.time_ and arg_375_1.time_ < var_378_14 + var_378_15 then
				local var_378_16 = (arg_375_1.time_ - var_378_14) / var_378_15
				local var_378_17 = Color.New(0, 0, 0)

				var_378_17.a = Mathf.Lerp(0, 1, var_378_16)
				arg_375_1.mask_.color = var_378_17
			end

			if arg_375_1.time_ >= var_378_14 + var_378_15 and arg_375_1.time_ < var_378_14 + var_378_15 + arg_378_0 then
				local var_378_18 = Color.New(0, 0, 0)

				var_378_18.a = 1
				arg_375_1.mask_.color = var_378_18
			end

			local var_378_19 = 2

			if var_378_19 < arg_375_1.time_ and arg_375_1.time_ <= var_378_19 + arg_378_0 then
				arg_375_1.mask_.enabled = true
				arg_375_1.mask_.raycastTarget = true

				arg_375_1:SetGaussion(false)
			end

			local var_378_20 = 2

			if var_378_19 <= arg_375_1.time_ and arg_375_1.time_ < var_378_19 + var_378_20 then
				local var_378_21 = (arg_375_1.time_ - var_378_19) / var_378_20
				local var_378_22 = Color.New(0, 0, 0)

				var_378_22.a = Mathf.Lerp(1, 0, var_378_21)
				arg_375_1.mask_.color = var_378_22
			end

			if arg_375_1.time_ >= var_378_19 + var_378_20 and arg_375_1.time_ < var_378_19 + var_378_20 + arg_378_0 then
				local var_378_23 = Color.New(0, 0, 0)
				local var_378_24 = 0

				arg_375_1.mask_.enabled = false
				var_378_23.a = var_378_24
				arg_375_1.mask_.color = var_378_23
			end

			local var_378_25 = arg_375_1.actors_["10018"].transform
			local var_378_26 = 3.8

			if var_378_26 < arg_375_1.time_ and arg_375_1.time_ <= var_378_26 + arg_378_0 then
				arg_375_1.var_.moveOldPos10018 = var_378_25.localPosition
				var_378_25.localScale = Vector3.New(1, 1, 1)

				arg_375_1:CheckSpriteTmpPos("10018", 2)

				local var_378_27 = var_378_25.childCount

				for iter_378_2 = 0, var_378_27 - 1 do
					local var_378_28 = var_378_25:GetChild(iter_378_2)

					if var_378_28.name == "split_1" or not string.find(var_378_28.name, "split") then
						var_378_28.gameObject:SetActive(true)
					else
						var_378_28.gameObject:SetActive(false)
					end
				end
			end

			local var_378_29 = 0.001

			if var_378_26 <= arg_375_1.time_ and arg_375_1.time_ < var_378_26 + var_378_29 then
				local var_378_30 = (arg_375_1.time_ - var_378_26) / var_378_29
				local var_378_31 = Vector3.New(-390, -350, -180)

				var_378_25.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos10018, var_378_31, var_378_30)
			end

			if arg_375_1.time_ >= var_378_26 + var_378_29 and arg_375_1.time_ < var_378_26 + var_378_29 + arg_378_0 then
				var_378_25.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_378_32 = arg_375_1.actors_["10018"].transform
			local var_378_33 = 1.966

			if var_378_33 < arg_375_1.time_ and arg_375_1.time_ <= var_378_33 + arg_378_0 then
				arg_375_1.var_.moveOldPos10018 = var_378_32.localPosition
				var_378_32.localScale = Vector3.New(1, 1, 1)

				arg_375_1:CheckSpriteTmpPos("10018", 7)

				local var_378_34 = var_378_32.childCount

				for iter_378_3 = 0, var_378_34 - 1 do
					local var_378_35 = var_378_32:GetChild(iter_378_3)

					if var_378_35.name == "split_1" or not string.find(var_378_35.name, "split") then
						var_378_35.gameObject:SetActive(true)
					else
						var_378_35.gameObject:SetActive(false)
					end
				end
			end

			local var_378_36 = 0.001

			if var_378_33 <= arg_375_1.time_ and arg_375_1.time_ < var_378_33 + var_378_36 then
				local var_378_37 = (arg_375_1.time_ - var_378_33) / var_378_36
				local var_378_38 = Vector3.New(0, -2000, -180)

				var_378_32.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos10018, var_378_38, var_378_37)
			end

			if arg_375_1.time_ >= var_378_33 + var_378_36 and arg_375_1.time_ < var_378_33 + var_378_36 + arg_378_0 then
				var_378_32.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_378_39 = arg_375_1.actors_["10018"]
			local var_378_40 = 3.8

			if var_378_40 < arg_375_1.time_ and arg_375_1.time_ <= var_378_40 + arg_378_0 and arg_375_1.var_.actorSpriteComps10018 == nil then
				arg_375_1.var_.actorSpriteComps10018 = var_378_39:GetComponentsInChildren(typeof(Image), true)
			end

			local var_378_41 = 0.034

			if var_378_40 <= arg_375_1.time_ and arg_375_1.time_ < var_378_40 + var_378_41 then
				local var_378_42 = (arg_375_1.time_ - var_378_40) / var_378_41

				if arg_375_1.var_.actorSpriteComps10018 then
					for iter_378_4, iter_378_5 in pairs(arg_375_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_378_5 then
							local var_378_43 = Mathf.Lerp(iter_378_5.color.r, 1, var_378_42)

							iter_378_5.color = Color.New(var_378_43, var_378_43, var_378_43)
						end
					end
				end
			end

			if arg_375_1.time_ >= var_378_40 + var_378_41 and arg_375_1.time_ < var_378_40 + var_378_41 + arg_378_0 and arg_375_1.var_.actorSpriteComps10018 then
				local var_378_44 = 1

				for iter_378_6, iter_378_7 in pairs(arg_375_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_378_7 then
						iter_378_7.color = Color.New(var_378_44, var_378_44, var_378_44)
					end
				end

				arg_375_1.var_.actorSpriteComps10018 = nil
			end

			local var_378_45 = arg_375_1.actors_["10018"]
			local var_378_46 = 3.8

			if var_378_46 < arg_375_1.time_ and arg_375_1.time_ <= var_378_46 + arg_378_0 then
				local var_378_47 = var_378_45:GetComponentInChildren(typeof(CanvasGroup))

				if var_378_47 then
					arg_375_1.var_.alphaOldValue10018 = var_378_47.alpha
					arg_375_1.var_.characterEffect10018 = var_378_47
				end

				arg_375_1.var_.alphaOldValue10018 = 0
			end

			local var_378_48 = 0.5

			if var_378_46 <= arg_375_1.time_ and arg_375_1.time_ < var_378_46 + var_378_48 then
				local var_378_49 = (arg_375_1.time_ - var_378_46) / var_378_48
				local var_378_50 = Mathf.Lerp(arg_375_1.var_.alphaOldValue10018, 1, var_378_49)

				if arg_375_1.var_.characterEffect10018 then
					arg_375_1.var_.characterEffect10018.alpha = var_378_50
				end
			end

			if arg_375_1.time_ >= var_378_46 + var_378_48 and arg_375_1.time_ < var_378_46 + var_378_48 + arg_378_0 and arg_375_1.var_.characterEffect10018 then
				arg_375_1.var_.characterEffect10018.alpha = 1
			end

			if arg_375_1.frameCnt_ <= 1 then
				arg_375_1.dialog_:SetActive(false)
			end

			local var_378_51 = 4
			local var_378_52 = 1.225

			if var_378_51 < arg_375_1.time_ and arg_375_1.time_ <= var_378_51 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0

				arg_375_1.dialog_:SetActive(true)

				local var_378_53 = LeanTween.value(arg_375_1.dialog_, 0, 1, 0.3)

				var_378_53:setOnUpdate(LuaHelper.FloatAction(function(arg_379_0)
					arg_375_1.dialogCg_.alpha = arg_379_0
				end))
				var_378_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_375_1.dialog_)
					var_378_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_375_1.duration_ = arg_375_1.duration_ + 0.3

				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_54 = arg_375_1:FormatText(StoryNameCfg[257].name)

				arg_375_1.leftNameTxt_.text = var_378_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_55 = arg_375_1:GetWordFromCfg(114251093)
				local var_378_56 = arg_375_1:FormatText(var_378_55.content)

				arg_375_1.text_.text = var_378_56

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_57 = 49
				local var_378_58 = utf8.len(var_378_56)
				local var_378_59 = var_378_57 <= 0 and var_378_52 or var_378_52 * (var_378_58 / var_378_57)

				if var_378_59 > 0 and var_378_52 < var_378_59 then
					arg_375_1.talkMaxDuration = var_378_59
					var_378_51 = var_378_51 + 0.3

					if var_378_59 + var_378_51 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_59 + var_378_51
					end
				end

				arg_375_1.text_.text = var_378_56
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251093", "story_v_out_114251.awb") ~= 0 then
					local var_378_60 = manager.audio:GetVoiceLength("story_v_out_114251", "114251093", "story_v_out_114251.awb") / 1000

					if var_378_60 + var_378_51 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_60 + var_378_51
					end

					if var_378_55.prefab_name ~= "" and arg_375_1.actors_[var_378_55.prefab_name] ~= nil then
						local var_378_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_55.prefab_name].transform, "story_v_out_114251", "114251093", "story_v_out_114251.awb")

						arg_375_1:RecordAudio("114251093", var_378_61)
						arg_375_1:RecordAudio("114251093", var_378_61)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_114251", "114251093", "story_v_out_114251.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_114251", "114251093", "story_v_out_114251.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_62 = var_378_51 + 0.3
			local var_378_63 = math.max(var_378_52, arg_375_1.talkMaxDuration)

			if var_378_62 <= arg_375_1.time_ and arg_375_1.time_ < var_378_62 + var_378_63 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_62) / var_378_63

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_62 + var_378_63 and arg_375_1.time_ < var_378_62 + var_378_63 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play114251094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 114251094
		arg_381_1.duration_ = 7.666

		local var_381_0 = {
			ja = 7.5,
			ko = 7.366,
			zh = 7.666,
			en = 3.433
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play114251095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["10015"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos10015 = var_384_0.localPosition
				var_384_0.localScale = Vector3.New(1, 1, 1)

				arg_381_1:CheckSpriteTmpPos("10015", 4)

				local var_384_2 = var_384_0.childCount

				for iter_384_0 = 0, var_384_2 - 1 do
					local var_384_3 = var_384_0:GetChild(iter_384_0)

					if var_384_3.name == "split_1" or not string.find(var_384_3.name, "split") then
						var_384_3.gameObject:SetActive(true)
					else
						var_384_3.gameObject:SetActive(false)
					end
				end
			end

			local var_384_4 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_4 then
				local var_384_5 = (arg_381_1.time_ - var_384_1) / var_384_4
				local var_384_6 = Vector3.New(390, -350, -180)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos10015, var_384_6, var_384_5)
			end

			if arg_381_1.time_ >= var_384_1 + var_384_4 and arg_381_1.time_ < var_384_1 + var_384_4 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_384_7 = arg_381_1.actors_["10018"]
			local var_384_8 = 0

			if var_384_8 < arg_381_1.time_ and arg_381_1.time_ <= var_384_8 + arg_384_0 and arg_381_1.var_.actorSpriteComps10018 == nil then
				arg_381_1.var_.actorSpriteComps10018 = var_384_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_9 = 0.034

			if var_384_8 <= arg_381_1.time_ and arg_381_1.time_ < var_384_8 + var_384_9 then
				local var_384_10 = (arg_381_1.time_ - var_384_8) / var_384_9

				if arg_381_1.var_.actorSpriteComps10018 then
					for iter_384_1, iter_384_2 in pairs(arg_381_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_384_2 then
							local var_384_11 = Mathf.Lerp(iter_384_2.color.r, 0.5, var_384_10)

							iter_384_2.color = Color.New(var_384_11, var_384_11, var_384_11)
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_8 + var_384_9 and arg_381_1.time_ < var_384_8 + var_384_9 + arg_384_0 and arg_381_1.var_.actorSpriteComps10018 then
				local var_384_12 = 0.5

				for iter_384_3, iter_384_4 in pairs(arg_381_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_384_4 then
						iter_384_4.color = Color.New(var_384_12, var_384_12, var_384_12)
					end
				end

				arg_381_1.var_.actorSpriteComps10018 = nil
			end

			local var_384_13 = arg_381_1.actors_["10015"]
			local var_384_14 = 0

			if var_384_14 < arg_381_1.time_ and arg_381_1.time_ <= var_384_14 + arg_384_0 and arg_381_1.var_.actorSpriteComps10015 == nil then
				arg_381_1.var_.actorSpriteComps10015 = var_384_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_15 = 0.034

			if var_384_14 <= arg_381_1.time_ and arg_381_1.time_ < var_384_14 + var_384_15 then
				local var_384_16 = (arg_381_1.time_ - var_384_14) / var_384_15

				if arg_381_1.var_.actorSpriteComps10015 then
					for iter_384_5, iter_384_6 in pairs(arg_381_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_384_6 then
							local var_384_17 = Mathf.Lerp(iter_384_6.color.r, 1, var_384_16)

							iter_384_6.color = Color.New(var_384_17, var_384_17, var_384_17)
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_14 + var_384_15 and arg_381_1.time_ < var_384_14 + var_384_15 + arg_384_0 and arg_381_1.var_.actorSpriteComps10015 then
				local var_384_18 = 1

				for iter_384_7, iter_384_8 in pairs(arg_381_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_384_8 then
						iter_384_8.color = Color.New(var_384_18, var_384_18, var_384_18)
					end
				end

				arg_381_1.var_.actorSpriteComps10015 = nil
			end

			local var_384_19 = arg_381_1.actors_["10015"]
			local var_384_20 = 0

			if var_384_20 < arg_381_1.time_ and arg_381_1.time_ <= var_384_20 + arg_384_0 then
				local var_384_21 = var_384_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_384_21 then
					arg_381_1.var_.alphaOldValue10015 = var_384_21.alpha
					arg_381_1.var_.characterEffect10015 = var_384_21
				end

				arg_381_1.var_.alphaOldValue10015 = 0
			end

			local var_384_22 = 0.5

			if var_384_20 <= arg_381_1.time_ and arg_381_1.time_ < var_384_20 + var_384_22 then
				local var_384_23 = (arg_381_1.time_ - var_384_20) / var_384_22
				local var_384_24 = Mathf.Lerp(arg_381_1.var_.alphaOldValue10015, 1, var_384_23)

				if arg_381_1.var_.characterEffect10015 then
					arg_381_1.var_.characterEffect10015.alpha = var_384_24
				end
			end

			if arg_381_1.time_ >= var_384_20 + var_384_22 and arg_381_1.time_ < var_384_20 + var_384_22 + arg_384_0 and arg_381_1.var_.characterEffect10015 then
				arg_381_1.var_.characterEffect10015.alpha = 1
			end

			local var_384_25 = 0
			local var_384_26 = 0.85

			if var_384_25 < arg_381_1.time_ and arg_381_1.time_ <= var_384_25 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_27 = arg_381_1:FormatText(StoryNameCfg[208].name)

				arg_381_1.leftNameTxt_.text = var_384_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_28 = arg_381_1:GetWordFromCfg(114251094)
				local var_384_29 = arg_381_1:FormatText(var_384_28.content)

				arg_381_1.text_.text = var_384_29

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_30 = 34
				local var_384_31 = utf8.len(var_384_29)
				local var_384_32 = var_384_30 <= 0 and var_384_26 or var_384_26 * (var_384_31 / var_384_30)

				if var_384_32 > 0 and var_384_26 < var_384_32 then
					arg_381_1.talkMaxDuration = var_384_32

					if var_384_32 + var_384_25 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_32 + var_384_25
					end
				end

				arg_381_1.text_.text = var_384_29
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251094", "story_v_out_114251.awb") ~= 0 then
					local var_384_33 = manager.audio:GetVoiceLength("story_v_out_114251", "114251094", "story_v_out_114251.awb") / 1000

					if var_384_33 + var_384_25 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_33 + var_384_25
					end

					if var_384_28.prefab_name ~= "" and arg_381_1.actors_[var_384_28.prefab_name] ~= nil then
						local var_384_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_28.prefab_name].transform, "story_v_out_114251", "114251094", "story_v_out_114251.awb")

						arg_381_1:RecordAudio("114251094", var_384_34)
						arg_381_1:RecordAudio("114251094", var_384_34)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_114251", "114251094", "story_v_out_114251.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_114251", "114251094", "story_v_out_114251.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_35 = math.max(var_384_26, arg_381_1.talkMaxDuration)

			if var_384_25 <= arg_381_1.time_ and arg_381_1.time_ < var_384_25 + var_384_35 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_25) / var_384_35

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_25 + var_384_35 and arg_381_1.time_ < var_384_25 + var_384_35 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play114251095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 114251095
		arg_385_1.duration_ = 16.666

		local var_385_0 = {
			ja = 16.666,
			ko = 14.133,
			zh = 15.566,
			en = 13.466
		}
		local var_385_1 = manager.audio:GetLocalizationFlag()

		if var_385_0[var_385_1] ~= nil then
			arg_385_1.duration_ = var_385_0[var_385_1]
		end

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play114251096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["10018"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.actorSpriteComps10018 == nil then
				arg_385_1.var_.actorSpriteComps10018 = var_388_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_2 = 0.034

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.actorSpriteComps10018 then
					for iter_388_0, iter_388_1 in pairs(arg_385_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_388_1 then
							local var_388_4 = Mathf.Lerp(iter_388_1.color.r, 1, var_388_3)

							iter_388_1.color = Color.New(var_388_4, var_388_4, var_388_4)
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.actorSpriteComps10018 then
				local var_388_5 = 1

				for iter_388_2, iter_388_3 in pairs(arg_385_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_388_3 then
						iter_388_3.color = Color.New(var_388_5, var_388_5, var_388_5)
					end
				end

				arg_385_1.var_.actorSpriteComps10018 = nil
			end

			local var_388_6 = arg_385_1.actors_["10015"]
			local var_388_7 = 0

			if var_388_7 < arg_385_1.time_ and arg_385_1.time_ <= var_388_7 + arg_388_0 and arg_385_1.var_.actorSpriteComps10015 == nil then
				arg_385_1.var_.actorSpriteComps10015 = var_388_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_8 = 0.034

			if var_388_7 <= arg_385_1.time_ and arg_385_1.time_ < var_388_7 + var_388_8 then
				local var_388_9 = (arg_385_1.time_ - var_388_7) / var_388_8

				if arg_385_1.var_.actorSpriteComps10015 then
					for iter_388_4, iter_388_5 in pairs(arg_385_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_388_5 then
							local var_388_10 = Mathf.Lerp(iter_388_5.color.r, 0.5, var_388_9)

							iter_388_5.color = Color.New(var_388_10, var_388_10, var_388_10)
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_7 + var_388_8 and arg_385_1.time_ < var_388_7 + var_388_8 + arg_388_0 and arg_385_1.var_.actorSpriteComps10015 then
				local var_388_11 = 0.5

				for iter_388_6, iter_388_7 in pairs(arg_385_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_388_7 then
						iter_388_7.color = Color.New(var_388_11, var_388_11, var_388_11)
					end
				end

				arg_385_1.var_.actorSpriteComps10015 = nil
			end

			local var_388_12 = 0
			local var_388_13 = 1.775

			if var_388_12 < arg_385_1.time_ and arg_385_1.time_ <= var_388_12 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_14 = arg_385_1:FormatText(StoryNameCfg[257].name)

				arg_385_1.leftNameTxt_.text = var_388_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_15 = arg_385_1:GetWordFromCfg(114251095)
				local var_388_16 = arg_385_1:FormatText(var_388_15.content)

				arg_385_1.text_.text = var_388_16

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_17 = 71
				local var_388_18 = utf8.len(var_388_16)
				local var_388_19 = var_388_17 <= 0 and var_388_13 or var_388_13 * (var_388_18 / var_388_17)

				if var_388_19 > 0 and var_388_13 < var_388_19 then
					arg_385_1.talkMaxDuration = var_388_19

					if var_388_19 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_19 + var_388_12
					end
				end

				arg_385_1.text_.text = var_388_16
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251095", "story_v_out_114251.awb") ~= 0 then
					local var_388_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251095", "story_v_out_114251.awb") / 1000

					if var_388_20 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_20 + var_388_12
					end

					if var_388_15.prefab_name ~= "" and arg_385_1.actors_[var_388_15.prefab_name] ~= nil then
						local var_388_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_15.prefab_name].transform, "story_v_out_114251", "114251095", "story_v_out_114251.awb")

						arg_385_1:RecordAudio("114251095", var_388_21)
						arg_385_1:RecordAudio("114251095", var_388_21)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_114251", "114251095", "story_v_out_114251.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_114251", "114251095", "story_v_out_114251.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_22 = math.max(var_388_13, arg_385_1.talkMaxDuration)

			if var_388_12 <= arg_385_1.time_ and arg_385_1.time_ < var_388_12 + var_388_22 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_12) / var_388_22

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_12 + var_388_22 and arg_385_1.time_ < var_388_12 + var_388_22 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play114251096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 114251096
		arg_389_1.duration_ = 12.866

		local var_389_0 = {
			ja = 11.166,
			ko = 12.866,
			zh = 9.233,
			en = 10.133
		}
		local var_389_1 = manager.audio:GetLocalizationFlag()

		if var_389_0[var_389_1] ~= nil then
			arg_389_1.duration_ = var_389_0[var_389_1]
		end

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play114251097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 1.025

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_2 = arg_389_1:FormatText(StoryNameCfg[257].name)

				arg_389_1.leftNameTxt_.text = var_392_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_3 = arg_389_1:GetWordFromCfg(114251096)
				local var_392_4 = arg_389_1:FormatText(var_392_3.content)

				arg_389_1.text_.text = var_392_4

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251096", "story_v_out_114251.awb") ~= 0 then
					local var_392_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251096", "story_v_out_114251.awb") / 1000

					if var_392_8 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_8 + var_392_0
					end

					if var_392_3.prefab_name ~= "" and arg_389_1.actors_[var_392_3.prefab_name] ~= nil then
						local var_392_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_3.prefab_name].transform, "story_v_out_114251", "114251096", "story_v_out_114251.awb")

						arg_389_1:RecordAudio("114251096", var_392_9)
						arg_389_1:RecordAudio("114251096", var_392_9)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_114251", "114251096", "story_v_out_114251.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_114251", "114251096", "story_v_out_114251.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_10 = math.max(var_392_1, arg_389_1.talkMaxDuration)

			if var_392_0 <= arg_389_1.time_ and arg_389_1.time_ < var_392_0 + var_392_10 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_0) / var_392_10

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_0 + var_392_10 and arg_389_1.time_ < var_392_0 + var_392_10 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play114251097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 114251097
		arg_393_1.duration_ = 13.5

		local var_393_0 = {
			ja = 13.5,
			ko = 11.966,
			zh = 11.5,
			en = 10.2
		}
		local var_393_1 = manager.audio:GetLocalizationFlag()

		if var_393_0[var_393_1] ~= nil then
			arg_393_1.duration_ = var_393_0[var_393_1]
		end

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play114251098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 1.275

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_2 = arg_393_1:FormatText(StoryNameCfg[257].name)

				arg_393_1.leftNameTxt_.text = var_396_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_3 = arg_393_1:GetWordFromCfg(114251097)
				local var_396_4 = arg_393_1:FormatText(var_396_3.content)

				arg_393_1.text_.text = var_396_4

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_5 = 51
				local var_396_6 = utf8.len(var_396_4)
				local var_396_7 = var_396_5 <= 0 and var_396_1 or var_396_1 * (var_396_6 / var_396_5)

				if var_396_7 > 0 and var_396_1 < var_396_7 then
					arg_393_1.talkMaxDuration = var_396_7

					if var_396_7 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_7 + var_396_0
					end
				end

				arg_393_1.text_.text = var_396_4
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251097", "story_v_out_114251.awb") ~= 0 then
					local var_396_8 = manager.audio:GetVoiceLength("story_v_out_114251", "114251097", "story_v_out_114251.awb") / 1000

					if var_396_8 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_8 + var_396_0
					end

					if var_396_3.prefab_name ~= "" and arg_393_1.actors_[var_396_3.prefab_name] ~= nil then
						local var_396_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_3.prefab_name].transform, "story_v_out_114251", "114251097", "story_v_out_114251.awb")

						arg_393_1:RecordAudio("114251097", var_396_9)
						arg_393_1:RecordAudio("114251097", var_396_9)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_114251", "114251097", "story_v_out_114251.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_114251", "114251097", "story_v_out_114251.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_10 = math.max(var_396_1, arg_393_1.talkMaxDuration)

			if var_396_0 <= arg_393_1.time_ and arg_393_1.time_ < var_396_0 + var_396_10 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_0) / var_396_10

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_0 + var_396_10 and arg_393_1.time_ < var_396_0 + var_396_10 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play114251098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 114251098
		arg_397_1.duration_ = 5.4

		local var_397_0 = {
			ja = 5.4,
			ko = 4.433,
			zh = 4.6,
			en = 2.666
		}
		local var_397_1 = manager.audio:GetLocalizationFlag()

		if var_397_0[var_397_1] ~= nil then
			arg_397_1.duration_ = var_397_0[var_397_1]
		end

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play114251099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["10015"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.actorSpriteComps10015 == nil then
				arg_397_1.var_.actorSpriteComps10015 = var_400_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_2 = 0.034

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.actorSpriteComps10015 then
					for iter_400_0, iter_400_1 in pairs(arg_397_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_400_1 then
							local var_400_4 = Mathf.Lerp(iter_400_1.color.r, 1, var_400_3)

							iter_400_1.color = Color.New(var_400_4, var_400_4, var_400_4)
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.actorSpriteComps10015 then
				local var_400_5 = 1

				for iter_400_2, iter_400_3 in pairs(arg_397_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_400_3 then
						iter_400_3.color = Color.New(var_400_5, var_400_5, var_400_5)
					end
				end

				arg_397_1.var_.actorSpriteComps10015 = nil
			end

			local var_400_6 = arg_397_1.actors_["10018"]
			local var_400_7 = 0

			if var_400_7 < arg_397_1.time_ and arg_397_1.time_ <= var_400_7 + arg_400_0 and arg_397_1.var_.actorSpriteComps10018 == nil then
				arg_397_1.var_.actorSpriteComps10018 = var_400_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_8 = 0.034

			if var_400_7 <= arg_397_1.time_ and arg_397_1.time_ < var_400_7 + var_400_8 then
				local var_400_9 = (arg_397_1.time_ - var_400_7) / var_400_8

				if arg_397_1.var_.actorSpriteComps10018 then
					for iter_400_4, iter_400_5 in pairs(arg_397_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_400_5 then
							local var_400_10 = Mathf.Lerp(iter_400_5.color.r, 0.5, var_400_9)

							iter_400_5.color = Color.New(var_400_10, var_400_10, var_400_10)
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_7 + var_400_8 and arg_397_1.time_ < var_400_7 + var_400_8 + arg_400_0 and arg_397_1.var_.actorSpriteComps10018 then
				local var_400_11 = 0.5

				for iter_400_6, iter_400_7 in pairs(arg_397_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_400_7 then
						iter_400_7.color = Color.New(var_400_11, var_400_11, var_400_11)
					end
				end

				arg_397_1.var_.actorSpriteComps10018 = nil
			end

			local var_400_12 = 0
			local var_400_13 = 0.45

			if var_400_12 < arg_397_1.time_ and arg_397_1.time_ <= var_400_12 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_14 = arg_397_1:FormatText(StoryNameCfg[208].name)

				arg_397_1.leftNameTxt_.text = var_400_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_15 = arg_397_1:GetWordFromCfg(114251098)
				local var_400_16 = arg_397_1:FormatText(var_400_15.content)

				arg_397_1.text_.text = var_400_16

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_17 = 18
				local var_400_18 = utf8.len(var_400_16)
				local var_400_19 = var_400_17 <= 0 and var_400_13 or var_400_13 * (var_400_18 / var_400_17)

				if var_400_19 > 0 and var_400_13 < var_400_19 then
					arg_397_1.talkMaxDuration = var_400_19

					if var_400_19 + var_400_12 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_19 + var_400_12
					end
				end

				arg_397_1.text_.text = var_400_16
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251098", "story_v_out_114251.awb") ~= 0 then
					local var_400_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251098", "story_v_out_114251.awb") / 1000

					if var_400_20 + var_400_12 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_20 + var_400_12
					end

					if var_400_15.prefab_name ~= "" and arg_397_1.actors_[var_400_15.prefab_name] ~= nil then
						local var_400_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_15.prefab_name].transform, "story_v_out_114251", "114251098", "story_v_out_114251.awb")

						arg_397_1:RecordAudio("114251098", var_400_21)
						arg_397_1:RecordAudio("114251098", var_400_21)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_114251", "114251098", "story_v_out_114251.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_114251", "114251098", "story_v_out_114251.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_22 = math.max(var_400_13, arg_397_1.talkMaxDuration)

			if var_400_12 <= arg_397_1.time_ and arg_397_1.time_ < var_400_12 + var_400_22 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_12) / var_400_22

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_12 + var_400_22 and arg_397_1.time_ < var_400_12 + var_400_22 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play114251099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 114251099
		arg_401_1.duration_ = 13.5

		local var_401_0 = {
			ja = 13.5,
			ko = 13.233,
			zh = 11.433,
			en = 13.233
		}
		local var_401_1 = manager.audio:GetLocalizationFlag()

		if var_401_0[var_401_1] ~= nil then
			arg_401_1.duration_ = var_401_0[var_401_1]
		end

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play114251100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10018"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.actorSpriteComps10018 == nil then
				arg_401_1.var_.actorSpriteComps10018 = var_404_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_2 = 0.034

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.actorSpriteComps10018 then
					for iter_404_0, iter_404_1 in pairs(arg_401_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_404_1 then
							local var_404_4 = Mathf.Lerp(iter_404_1.color.r, 1, var_404_3)

							iter_404_1.color = Color.New(var_404_4, var_404_4, var_404_4)
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.actorSpriteComps10018 then
				local var_404_5 = 1

				for iter_404_2, iter_404_3 in pairs(arg_401_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_404_3 then
						iter_404_3.color = Color.New(var_404_5, var_404_5, var_404_5)
					end
				end

				arg_401_1.var_.actorSpriteComps10018 = nil
			end

			local var_404_6 = arg_401_1.actors_["10015"]
			local var_404_7 = 0

			if var_404_7 < arg_401_1.time_ and arg_401_1.time_ <= var_404_7 + arg_404_0 and arg_401_1.var_.actorSpriteComps10015 == nil then
				arg_401_1.var_.actorSpriteComps10015 = var_404_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_8 = 0.034

			if var_404_7 <= arg_401_1.time_ and arg_401_1.time_ < var_404_7 + var_404_8 then
				local var_404_9 = (arg_401_1.time_ - var_404_7) / var_404_8

				if arg_401_1.var_.actorSpriteComps10015 then
					for iter_404_4, iter_404_5 in pairs(arg_401_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_404_5 then
							local var_404_10 = Mathf.Lerp(iter_404_5.color.r, 0.5, var_404_9)

							iter_404_5.color = Color.New(var_404_10, var_404_10, var_404_10)
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_7 + var_404_8 and arg_401_1.time_ < var_404_7 + var_404_8 + arg_404_0 and arg_401_1.var_.actorSpriteComps10015 then
				local var_404_11 = 0.5

				for iter_404_6, iter_404_7 in pairs(arg_401_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_404_7 then
						iter_404_7.color = Color.New(var_404_11, var_404_11, var_404_11)
					end
				end

				arg_401_1.var_.actorSpriteComps10015 = nil
			end

			local var_404_12 = 0
			local var_404_13 = 1.075

			if var_404_12 < arg_401_1.time_ and arg_401_1.time_ <= var_404_12 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_14 = arg_401_1:FormatText(StoryNameCfg[257].name)

				arg_401_1.leftNameTxt_.text = var_404_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_15 = arg_401_1:GetWordFromCfg(114251099)
				local var_404_16 = arg_401_1:FormatText(var_404_15.content)

				arg_401_1.text_.text = var_404_16

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_17 = 43
				local var_404_18 = utf8.len(var_404_16)
				local var_404_19 = var_404_17 <= 0 and var_404_13 or var_404_13 * (var_404_18 / var_404_17)

				if var_404_19 > 0 and var_404_13 < var_404_19 then
					arg_401_1.talkMaxDuration = var_404_19

					if var_404_19 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_19 + var_404_12
					end
				end

				arg_401_1.text_.text = var_404_16
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251099", "story_v_out_114251.awb") ~= 0 then
					local var_404_20 = manager.audio:GetVoiceLength("story_v_out_114251", "114251099", "story_v_out_114251.awb") / 1000

					if var_404_20 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_20 + var_404_12
					end

					if var_404_15.prefab_name ~= "" and arg_401_1.actors_[var_404_15.prefab_name] ~= nil then
						local var_404_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_15.prefab_name].transform, "story_v_out_114251", "114251099", "story_v_out_114251.awb")

						arg_401_1:RecordAudio("114251099", var_404_21)
						arg_401_1:RecordAudio("114251099", var_404_21)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_114251", "114251099", "story_v_out_114251.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_114251", "114251099", "story_v_out_114251.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_22 = math.max(var_404_13, arg_401_1.talkMaxDuration)

			if var_404_12 <= arg_401_1.time_ and arg_401_1.time_ < var_404_12 + var_404_22 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_12) / var_404_22

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_12 + var_404_22 and arg_401_1.time_ < var_404_12 + var_404_22 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play114251100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 114251100
		arg_405_1.duration_ = 9.166

		local var_405_0 = {
			ja = 9.166,
			ko = 7.433,
			zh = 8.4,
			en = 6.133
		}
		local var_405_1 = manager.audio:GetLocalizationFlag()

		if var_405_0[var_405_1] ~= nil then
			arg_405_1.duration_ = var_405_0[var_405_1]
		end

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play114251101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["10015"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos10015 = var_408_0.localPosition
				var_408_0.localScale = Vector3.New(1, 1, 1)

				arg_405_1:CheckSpriteTmpPos("10015", 4)

				local var_408_2 = var_408_0.childCount

				for iter_408_0 = 0, var_408_2 - 1 do
					local var_408_3 = var_408_0:GetChild(iter_408_0)

					if var_408_3.name == "split_4" or not string.find(var_408_3.name, "split") then
						var_408_3.gameObject:SetActive(true)
					else
						var_408_3.gameObject:SetActive(false)
					end
				end
			end

			local var_408_4 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_4 then
				local var_408_5 = (arg_405_1.time_ - var_408_1) / var_408_4
				local var_408_6 = Vector3.New(390, -350, -180)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10015, var_408_6, var_408_5)
			end

			if arg_405_1.time_ >= var_408_1 + var_408_4 and arg_405_1.time_ < var_408_1 + var_408_4 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_408_7 = arg_405_1.actors_["10015"]
			local var_408_8 = 0

			if var_408_8 < arg_405_1.time_ and arg_405_1.time_ <= var_408_8 + arg_408_0 and arg_405_1.var_.actorSpriteComps10015 == nil then
				arg_405_1.var_.actorSpriteComps10015 = var_408_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_9 = 0.034

			if var_408_8 <= arg_405_1.time_ and arg_405_1.time_ < var_408_8 + var_408_9 then
				local var_408_10 = (arg_405_1.time_ - var_408_8) / var_408_9

				if arg_405_1.var_.actorSpriteComps10015 then
					for iter_408_1, iter_408_2 in pairs(arg_405_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_408_2 then
							local var_408_11 = Mathf.Lerp(iter_408_2.color.r, 1, var_408_10)

							iter_408_2.color = Color.New(var_408_11, var_408_11, var_408_11)
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_8 + var_408_9 and arg_405_1.time_ < var_408_8 + var_408_9 + arg_408_0 and arg_405_1.var_.actorSpriteComps10015 then
				local var_408_12 = 1

				for iter_408_3, iter_408_4 in pairs(arg_405_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_408_4 then
						iter_408_4.color = Color.New(var_408_12, var_408_12, var_408_12)
					end
				end

				arg_405_1.var_.actorSpriteComps10015 = nil
			end

			local var_408_13 = arg_405_1.actors_["10018"]
			local var_408_14 = 0

			if var_408_14 < arg_405_1.time_ and arg_405_1.time_ <= var_408_14 + arg_408_0 and arg_405_1.var_.actorSpriteComps10018 == nil then
				arg_405_1.var_.actorSpriteComps10018 = var_408_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_15 = 0.034

			if var_408_14 <= arg_405_1.time_ and arg_405_1.time_ < var_408_14 + var_408_15 then
				local var_408_16 = (arg_405_1.time_ - var_408_14) / var_408_15

				if arg_405_1.var_.actorSpriteComps10018 then
					for iter_408_5, iter_408_6 in pairs(arg_405_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_408_6 then
							local var_408_17 = Mathf.Lerp(iter_408_6.color.r, 0.5, var_408_16)

							iter_408_6.color = Color.New(var_408_17, var_408_17, var_408_17)
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_14 + var_408_15 and arg_405_1.time_ < var_408_14 + var_408_15 + arg_408_0 and arg_405_1.var_.actorSpriteComps10018 then
				local var_408_18 = 0.5

				for iter_408_7, iter_408_8 in pairs(arg_405_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_408_8 then
						iter_408_8.color = Color.New(var_408_18, var_408_18, var_408_18)
					end
				end

				arg_405_1.var_.actorSpriteComps10018 = nil
			end

			local var_408_19 = 0
			local var_408_20 = 0.875

			if var_408_19 < arg_405_1.time_ and arg_405_1.time_ <= var_408_19 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_21 = arg_405_1:FormatText(StoryNameCfg[208].name)

				arg_405_1.leftNameTxt_.text = var_408_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_22 = arg_405_1:GetWordFromCfg(114251100)
				local var_408_23 = arg_405_1:FormatText(var_408_22.content)

				arg_405_1.text_.text = var_408_23

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_24 = 35
				local var_408_25 = utf8.len(var_408_23)
				local var_408_26 = var_408_24 <= 0 and var_408_20 or var_408_20 * (var_408_25 / var_408_24)

				if var_408_26 > 0 and var_408_20 < var_408_26 then
					arg_405_1.talkMaxDuration = var_408_26

					if var_408_26 + var_408_19 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_26 + var_408_19
					end
				end

				arg_405_1.text_.text = var_408_23
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251100", "story_v_out_114251.awb") ~= 0 then
					local var_408_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251100", "story_v_out_114251.awb") / 1000

					if var_408_27 + var_408_19 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_27 + var_408_19
					end

					if var_408_22.prefab_name ~= "" and arg_405_1.actors_[var_408_22.prefab_name] ~= nil then
						local var_408_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_22.prefab_name].transform, "story_v_out_114251", "114251100", "story_v_out_114251.awb")

						arg_405_1:RecordAudio("114251100", var_408_28)
						arg_405_1:RecordAudio("114251100", var_408_28)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_114251", "114251100", "story_v_out_114251.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_114251", "114251100", "story_v_out_114251.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_29 = math.max(var_408_20, arg_405_1.talkMaxDuration)

			if var_408_19 <= arg_405_1.time_ and arg_405_1.time_ < var_408_19 + var_408_29 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_19) / var_408_29

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_19 + var_408_29 and arg_405_1.time_ < var_408_19 + var_408_29 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play114251101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 114251101
		arg_409_1.duration_ = 8.9

		local var_409_0 = {
			ja = 7.6,
			ko = 8.9,
			zh = 7.033,
			en = 7.8
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
				arg_409_0:Play114251102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10018"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos10018 = var_412_0.localPosition
				var_412_0.localScale = Vector3.New(1, 1, 1)

				arg_409_1:CheckSpriteTmpPos("10018", 2)

				local var_412_2 = var_412_0.childCount

				for iter_412_0 = 0, var_412_2 - 1 do
					local var_412_3 = var_412_0:GetChild(iter_412_0)

					if var_412_3.name == "split_2" or not string.find(var_412_3.name, "split") then
						var_412_3.gameObject:SetActive(true)
					else
						var_412_3.gameObject:SetActive(false)
					end
				end
			end

			local var_412_4 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_4 then
				local var_412_5 = (arg_409_1.time_ - var_412_1) / var_412_4
				local var_412_6 = Vector3.New(-390, -350, -180)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos10018, var_412_6, var_412_5)
			end

			if arg_409_1.time_ >= var_412_1 + var_412_4 and arg_409_1.time_ < var_412_1 + var_412_4 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_412_7 = arg_409_1.actors_["10015"]
			local var_412_8 = 0

			if var_412_8 < arg_409_1.time_ and arg_409_1.time_ <= var_412_8 + arg_412_0 and arg_409_1.var_.actorSpriteComps10015 == nil then
				arg_409_1.var_.actorSpriteComps10015 = var_412_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_9 = 0.034

			if var_412_8 <= arg_409_1.time_ and arg_409_1.time_ < var_412_8 + var_412_9 then
				local var_412_10 = (arg_409_1.time_ - var_412_8) / var_412_9

				if arg_409_1.var_.actorSpriteComps10015 then
					for iter_412_1, iter_412_2 in pairs(arg_409_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_412_2 then
							local var_412_11 = Mathf.Lerp(iter_412_2.color.r, 0.5, var_412_10)

							iter_412_2.color = Color.New(var_412_11, var_412_11, var_412_11)
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_8 + var_412_9 and arg_409_1.time_ < var_412_8 + var_412_9 + arg_412_0 and arg_409_1.var_.actorSpriteComps10015 then
				local var_412_12 = 0.5

				for iter_412_3, iter_412_4 in pairs(arg_409_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_412_4 then
						iter_412_4.color = Color.New(var_412_12, var_412_12, var_412_12)
					end
				end

				arg_409_1.var_.actorSpriteComps10015 = nil
			end

			local var_412_13 = arg_409_1.actors_["10018"]
			local var_412_14 = 0

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 and arg_409_1.var_.actorSpriteComps10018 == nil then
				arg_409_1.var_.actorSpriteComps10018 = var_412_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_15 = 0.034

			if var_412_14 <= arg_409_1.time_ and arg_409_1.time_ < var_412_14 + var_412_15 then
				local var_412_16 = (arg_409_1.time_ - var_412_14) / var_412_15

				if arg_409_1.var_.actorSpriteComps10018 then
					for iter_412_5, iter_412_6 in pairs(arg_409_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_412_6 then
							local var_412_17 = Mathf.Lerp(iter_412_6.color.r, 1, var_412_16)

							iter_412_6.color = Color.New(var_412_17, var_412_17, var_412_17)
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_14 + var_412_15 and arg_409_1.time_ < var_412_14 + var_412_15 + arg_412_0 and arg_409_1.var_.actorSpriteComps10018 then
				local var_412_18 = 1

				for iter_412_7, iter_412_8 in pairs(arg_409_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_412_8 then
						iter_412_8.color = Color.New(var_412_18, var_412_18, var_412_18)
					end
				end

				arg_409_1.var_.actorSpriteComps10018 = nil
			end

			local var_412_19 = 0
			local var_412_20 = 0.6

			if var_412_19 < arg_409_1.time_ and arg_409_1.time_ <= var_412_19 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_21 = arg_409_1:FormatText(StoryNameCfg[257].name)

				arg_409_1.leftNameTxt_.text = var_412_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_22 = arg_409_1:GetWordFromCfg(114251101)
				local var_412_23 = arg_409_1:FormatText(var_412_22.content)

				arg_409_1.text_.text = var_412_23

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_24 = 24
				local var_412_25 = utf8.len(var_412_23)
				local var_412_26 = var_412_24 <= 0 and var_412_20 or var_412_20 * (var_412_25 / var_412_24)

				if var_412_26 > 0 and var_412_20 < var_412_26 then
					arg_409_1.talkMaxDuration = var_412_26

					if var_412_26 + var_412_19 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_26 + var_412_19
					end
				end

				arg_409_1.text_.text = var_412_23
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251101", "story_v_out_114251.awb") ~= 0 then
					local var_412_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251101", "story_v_out_114251.awb") / 1000

					if var_412_27 + var_412_19 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_27 + var_412_19
					end

					if var_412_22.prefab_name ~= "" and arg_409_1.actors_[var_412_22.prefab_name] ~= nil then
						local var_412_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_22.prefab_name].transform, "story_v_out_114251", "114251101", "story_v_out_114251.awb")

						arg_409_1:RecordAudio("114251101", var_412_28)
						arg_409_1:RecordAudio("114251101", var_412_28)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_114251", "114251101", "story_v_out_114251.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_114251", "114251101", "story_v_out_114251.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_29 = math.max(var_412_20, arg_409_1.talkMaxDuration)

			if var_412_19 <= arg_409_1.time_ and arg_409_1.time_ < var_412_19 + var_412_29 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_19) / var_412_29

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_19 + var_412_29 and arg_409_1.time_ < var_412_19 + var_412_29 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play114251102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 114251102
		arg_413_1.duration_ = 2.3

		local var_413_0 = {
			ja = 2.3,
			ko = 2.133,
			zh = 1.2,
			en = 0.999999999999
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
				arg_413_0:Play114251103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["10015"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos10015 = var_416_0.localPosition
				var_416_0.localScale = Vector3.New(1, 1, 1)

				arg_413_1:CheckSpriteTmpPos("10015", 4)

				local var_416_2 = var_416_0.childCount

				for iter_416_0 = 0, var_416_2 - 1 do
					local var_416_3 = var_416_0:GetChild(iter_416_0)

					if var_416_3.name == "split_1" or not string.find(var_416_3.name, "split") then
						var_416_3.gameObject:SetActive(true)
					else
						var_416_3.gameObject:SetActive(false)
					end
				end
			end

			local var_416_4 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_4 then
				local var_416_5 = (arg_413_1.time_ - var_416_1) / var_416_4
				local var_416_6 = Vector3.New(390, -350, -180)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos10015, var_416_6, var_416_5)
			end

			if arg_413_1.time_ >= var_416_1 + var_416_4 and arg_413_1.time_ < var_416_1 + var_416_4 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_416_7 = arg_413_1.actors_["10015"]
			local var_416_8 = 0

			if var_416_8 < arg_413_1.time_ and arg_413_1.time_ <= var_416_8 + arg_416_0 and arg_413_1.var_.actorSpriteComps10015 == nil then
				arg_413_1.var_.actorSpriteComps10015 = var_416_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_416_9 = 0.034

			if var_416_8 <= arg_413_1.time_ and arg_413_1.time_ < var_416_8 + var_416_9 then
				local var_416_10 = (arg_413_1.time_ - var_416_8) / var_416_9

				if arg_413_1.var_.actorSpriteComps10015 then
					for iter_416_1, iter_416_2 in pairs(arg_413_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_416_2 then
							local var_416_11 = Mathf.Lerp(iter_416_2.color.r, 1, var_416_10)

							iter_416_2.color = Color.New(var_416_11, var_416_11, var_416_11)
						end
					end
				end
			end

			if arg_413_1.time_ >= var_416_8 + var_416_9 and arg_413_1.time_ < var_416_8 + var_416_9 + arg_416_0 and arg_413_1.var_.actorSpriteComps10015 then
				local var_416_12 = 1

				for iter_416_3, iter_416_4 in pairs(arg_413_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_416_4 then
						iter_416_4.color = Color.New(var_416_12, var_416_12, var_416_12)
					end
				end

				arg_413_1.var_.actorSpriteComps10015 = nil
			end

			local var_416_13 = arg_413_1.actors_["10018"]
			local var_416_14 = 0

			if var_416_14 < arg_413_1.time_ and arg_413_1.time_ <= var_416_14 + arg_416_0 and arg_413_1.var_.actorSpriteComps10018 == nil then
				arg_413_1.var_.actorSpriteComps10018 = var_416_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_416_15 = 0.034

			if var_416_14 <= arg_413_1.time_ and arg_413_1.time_ < var_416_14 + var_416_15 then
				local var_416_16 = (arg_413_1.time_ - var_416_14) / var_416_15

				if arg_413_1.var_.actorSpriteComps10018 then
					for iter_416_5, iter_416_6 in pairs(arg_413_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_416_6 then
							local var_416_17 = Mathf.Lerp(iter_416_6.color.r, 0.5, var_416_16)

							iter_416_6.color = Color.New(var_416_17, var_416_17, var_416_17)
						end
					end
				end
			end

			if arg_413_1.time_ >= var_416_14 + var_416_15 and arg_413_1.time_ < var_416_14 + var_416_15 + arg_416_0 and arg_413_1.var_.actorSpriteComps10018 then
				local var_416_18 = 0.5

				for iter_416_7, iter_416_8 in pairs(arg_413_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_416_8 then
						iter_416_8.color = Color.New(var_416_18, var_416_18, var_416_18)
					end
				end

				arg_413_1.var_.actorSpriteComps10018 = nil
			end

			local var_416_19 = 0
			local var_416_20 = 0.1

			if var_416_19 < arg_413_1.time_ and arg_413_1.time_ <= var_416_19 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_21 = arg_413_1:FormatText(StoryNameCfg[208].name)

				arg_413_1.leftNameTxt_.text = var_416_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_22 = arg_413_1:GetWordFromCfg(114251102)
				local var_416_23 = arg_413_1:FormatText(var_416_22.content)

				arg_413_1.text_.text = var_416_23

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_24 = 4
				local var_416_25 = utf8.len(var_416_23)
				local var_416_26 = var_416_24 <= 0 and var_416_20 or var_416_20 * (var_416_25 / var_416_24)

				if var_416_26 > 0 and var_416_20 < var_416_26 then
					arg_413_1.talkMaxDuration = var_416_26

					if var_416_26 + var_416_19 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_26 + var_416_19
					end
				end

				arg_413_1.text_.text = var_416_23
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251102", "story_v_out_114251.awb") ~= 0 then
					local var_416_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251102", "story_v_out_114251.awb") / 1000

					if var_416_27 + var_416_19 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_27 + var_416_19
					end

					if var_416_22.prefab_name ~= "" and arg_413_1.actors_[var_416_22.prefab_name] ~= nil then
						local var_416_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_22.prefab_name].transform, "story_v_out_114251", "114251102", "story_v_out_114251.awb")

						arg_413_1:RecordAudio("114251102", var_416_28)
						arg_413_1:RecordAudio("114251102", var_416_28)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_114251", "114251102", "story_v_out_114251.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_114251", "114251102", "story_v_out_114251.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_29 = math.max(var_416_20, arg_413_1.talkMaxDuration)

			if var_416_19 <= arg_413_1.time_ and arg_413_1.time_ < var_416_19 + var_416_29 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_19) / var_416_29

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_19 + var_416_29 and arg_413_1.time_ < var_416_19 + var_416_29 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play114251103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 114251103
		arg_417_1.duration_ = 5

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play114251104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["10015"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.actorSpriteComps10015 == nil then
				arg_417_1.var_.actorSpriteComps10015 = var_420_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_420_2 = 0.034

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.actorSpriteComps10015 then
					for iter_420_0, iter_420_1 in pairs(arg_417_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_420_1 then
							local var_420_4 = Mathf.Lerp(iter_420_1.color.r, 0.5, var_420_3)

							iter_420_1.color = Color.New(var_420_4, var_420_4, var_420_4)
						end
					end
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.actorSpriteComps10015 then
				local var_420_5 = 0.5

				for iter_420_2, iter_420_3 in pairs(arg_417_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_420_3 then
						iter_420_3.color = Color.New(var_420_5, var_420_5, var_420_5)
					end
				end

				arg_417_1.var_.actorSpriteComps10015 = nil
			end

			local var_420_6 = 0
			local var_420_7 = 0.525

			if var_420_6 < arg_417_1.time_ and arg_417_1.time_ <= var_420_6 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, false)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_8 = arg_417_1:GetWordFromCfg(114251103)
				local var_420_9 = arg_417_1:FormatText(var_420_8.content)

				arg_417_1.text_.text = var_420_9

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_10 = 21
				local var_420_11 = utf8.len(var_420_9)
				local var_420_12 = var_420_10 <= 0 and var_420_7 or var_420_7 * (var_420_11 / var_420_10)

				if var_420_12 > 0 and var_420_7 < var_420_12 then
					arg_417_1.talkMaxDuration = var_420_12

					if var_420_12 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_12 + var_420_6
					end
				end

				arg_417_1.text_.text = var_420_9
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)
				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_13 = math.max(var_420_7, arg_417_1.talkMaxDuration)

			if var_420_6 <= arg_417_1.time_ and arg_417_1.time_ < var_420_6 + var_420_13 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_6) / var_420_13

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_6 + var_420_13 and arg_417_1.time_ < var_420_6 + var_420_13 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play114251104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 114251104
		arg_421_1.duration_ = 14.9

		local var_421_0 = {
			ja = 7.6,
			ko = 14.9,
			zh = 14.8,
			en = 12.4
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
			arg_421_1.auto_ = false
		end

		function arg_421_1.playNext_(arg_423_0)
			arg_421_1.onStoryFinished_()
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["10018"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos10018 = var_424_0.localPosition
				var_424_0.localScale = Vector3.New(1, 1, 1)

				arg_421_1:CheckSpriteTmpPos("10018", 2)

				local var_424_2 = var_424_0.childCount

				for iter_424_0 = 0, var_424_2 - 1 do
					local var_424_3 = var_424_0:GetChild(iter_424_0)

					if var_424_3.name == "split_2" or not string.find(var_424_3.name, "split") then
						var_424_3.gameObject:SetActive(true)
					else
						var_424_3.gameObject:SetActive(false)
					end
				end
			end

			local var_424_4 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_4 then
				local var_424_5 = (arg_421_1.time_ - var_424_1) / var_424_4
				local var_424_6 = Vector3.New(-390, -350, -180)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos10018, var_424_6, var_424_5)
			end

			if arg_421_1.time_ >= var_424_1 + var_424_4 and arg_421_1.time_ < var_424_1 + var_424_4 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_424_7 = arg_421_1.actors_["10018"]
			local var_424_8 = 0

			if var_424_8 < arg_421_1.time_ and arg_421_1.time_ <= var_424_8 + arg_424_0 and arg_421_1.var_.actorSpriteComps10018 == nil then
				arg_421_1.var_.actorSpriteComps10018 = var_424_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_424_9 = 0.034

			if var_424_8 <= arg_421_1.time_ and arg_421_1.time_ < var_424_8 + var_424_9 then
				local var_424_10 = (arg_421_1.time_ - var_424_8) / var_424_9

				if arg_421_1.var_.actorSpriteComps10018 then
					for iter_424_1, iter_424_2 in pairs(arg_421_1.var_.actorSpriteComps10018:ToTable()) do
						if iter_424_2 then
							local var_424_11 = Mathf.Lerp(iter_424_2.color.r, 1, var_424_10)

							iter_424_2.color = Color.New(var_424_11, var_424_11, var_424_11)
						end
					end
				end
			end

			if arg_421_1.time_ >= var_424_8 + var_424_9 and arg_421_1.time_ < var_424_8 + var_424_9 + arg_424_0 and arg_421_1.var_.actorSpriteComps10018 then
				local var_424_12 = 1

				for iter_424_3, iter_424_4 in pairs(arg_421_1.var_.actorSpriteComps10018:ToTable()) do
					if iter_424_4 then
						iter_424_4.color = Color.New(var_424_12, var_424_12, var_424_12)
					end
				end

				arg_421_1.var_.actorSpriteComps10018 = nil
			end

			local var_424_13 = arg_421_1.actors_["10015"]
			local var_424_14 = 0

			if var_424_14 < arg_421_1.time_ and arg_421_1.time_ <= var_424_14 + arg_424_0 and arg_421_1.var_.actorSpriteComps10015 == nil then
				arg_421_1.var_.actorSpriteComps10015 = var_424_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_424_15 = 0.034

			if var_424_14 <= arg_421_1.time_ and arg_421_1.time_ < var_424_14 + var_424_15 then
				local var_424_16 = (arg_421_1.time_ - var_424_14) / var_424_15

				if arg_421_1.var_.actorSpriteComps10015 then
					for iter_424_5, iter_424_6 in pairs(arg_421_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_424_6 then
							local var_424_17 = Mathf.Lerp(iter_424_6.color.r, 0.5, var_424_16)

							iter_424_6.color = Color.New(var_424_17, var_424_17, var_424_17)
						end
					end
				end
			end

			if arg_421_1.time_ >= var_424_14 + var_424_15 and arg_421_1.time_ < var_424_14 + var_424_15 + arg_424_0 and arg_421_1.var_.actorSpriteComps10015 then
				local var_424_18 = 0.5

				for iter_424_7, iter_424_8 in pairs(arg_421_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_424_8 then
						iter_424_8.color = Color.New(var_424_18, var_424_18, var_424_18)
					end
				end

				arg_421_1.var_.actorSpriteComps10015 = nil
			end

			local var_424_19 = 0
			local var_424_20 = 1.1

			if var_424_19 < arg_421_1.time_ and arg_421_1.time_ <= var_424_19 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_21 = arg_421_1:FormatText(StoryNameCfg[257].name)

				arg_421_1.leftNameTxt_.text = var_424_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_22 = arg_421_1:GetWordFromCfg(114251104)
				local var_424_23 = arg_421_1:FormatText(var_424_22.content)

				arg_421_1.text_.text = var_424_23

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_24 = 43
				local var_424_25 = utf8.len(var_424_23)
				local var_424_26 = var_424_24 <= 0 and var_424_20 or var_424_20 * (var_424_25 / var_424_24)

				if var_424_26 > 0 and var_424_20 < var_424_26 then
					arg_421_1.talkMaxDuration = var_424_26

					if var_424_26 + var_424_19 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_26 + var_424_19
					end
				end

				arg_421_1.text_.text = var_424_23
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114251", "114251104", "story_v_out_114251.awb") ~= 0 then
					local var_424_27 = manager.audio:GetVoiceLength("story_v_out_114251", "114251104", "story_v_out_114251.awb") / 1000

					if var_424_27 + var_424_19 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_27 + var_424_19
					end

					if var_424_22.prefab_name ~= "" and arg_421_1.actors_[var_424_22.prefab_name] ~= nil then
						local var_424_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_22.prefab_name].transform, "story_v_out_114251", "114251104", "story_v_out_114251.awb")

						arg_421_1:RecordAudio("114251104", var_424_28)
						arg_421_1:RecordAudio("114251104", var_424_28)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_114251", "114251104", "story_v_out_114251.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_114251", "114251104", "story_v_out_114251.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_29 = math.max(var_424_20, arg_421_1.talkMaxDuration)

			if var_424_19 <= arg_421_1.time_ and arg_421_1.time_ < var_424_19 + var_424_29 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_19) / var_424_29

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_19 + var_424_29 and arg_421_1.time_ < var_424_19 + var_424_29 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST25",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST24",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST24a"
	},
	voices = {
		"story_v_out_114251.awb"
	}
}
