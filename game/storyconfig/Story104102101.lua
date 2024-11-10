return {
	Play410211001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410211001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410211002(arg_1_1)
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

			local var_4_22 = 0
			local var_4_23 = 0.166666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.3
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.05

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

				local var_4_33 = arg_1_1:GetWordFromCfg(410211001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 42
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
	Play410211002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410211002
		arg_7_1.duration_ = 15.233

		local var_7_0 = {
			ja = 15.233,
			CriLanguages = 9.166,
			zh = 9.166
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
				arg_7_0:Play410211003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1061"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["1061"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos1061 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1061", 2)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(-390, -490, 18)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1061, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_10_9 = "10059"

			if arg_7_1.actors_[var_10_9] == nil then
				local var_10_10 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_9), arg_7_1.canvasGo_.transform)

				var_10_10.transform:SetSiblingIndex(1)

				var_10_10.name = var_10_9
				var_10_10.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_9] = var_10_10
			end

			local var_10_11 = arg_7_1.actors_["10059"].transform
			local var_10_12 = 0

			if var_10_12 < arg_7_1.time_ and arg_7_1.time_ <= var_10_12 + arg_10_0 then
				arg_7_1.var_.moveOldPos10059 = var_10_11.localPosition
				var_10_11.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10059", 4)

				local var_10_13 = var_10_11.childCount

				for iter_10_1 = 0, var_10_13 - 1 do
					local var_10_14 = var_10_11:GetChild(iter_10_1)

					if var_10_14.name == "" or not string.find(var_10_14.name, "split") then
						var_10_14.gameObject:SetActive(true)
					else
						var_10_14.gameObject:SetActive(false)
					end
				end
			end

			local var_10_15 = 0.001

			if var_10_12 <= arg_7_1.time_ and arg_7_1.time_ < var_10_12 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_12) / var_10_15
				local var_10_17 = Vector3.New(390, -530, 35)

				var_10_11.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10059, var_10_17, var_10_16)
			end

			if arg_7_1.time_ >= var_10_12 + var_10_15 and arg_7_1.time_ < var_10_12 + var_10_15 + arg_10_0 then
				var_10_11.localPosition = Vector3.New(390, -530, 35)
			end

			local var_10_18 = arg_7_1.actors_["1061"]
			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 == nil then
				arg_7_1.var_.actorSpriteComps1061 = var_10_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_20 = 0.034

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_20 then
				local var_10_21 = (arg_7_1.time_ - var_10_19) / var_10_20

				if arg_7_1.var_.actorSpriteComps1061 then
					for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_10_3 then
							local var_10_22 = Mathf.Lerp(iter_10_3.color.r, 1, var_10_21)

							iter_10_3.color = Color.New(var_10_22, var_10_22, var_10_22)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_19 + var_10_20 and arg_7_1.time_ < var_10_19 + var_10_20 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 then
				local var_10_23 = 1

				for iter_10_4, iter_10_5 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_10_5 then
						iter_10_5.color = Color.New(var_10_23, var_10_23, var_10_23)
					end
				end

				arg_7_1.var_.actorSpriteComps1061 = nil
			end

			local var_10_24 = arg_7_1.actors_["10059"]
			local var_10_25 = 0

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 and arg_7_1.var_.actorSpriteComps10059 == nil then
				arg_7_1.var_.actorSpriteComps10059 = var_10_24:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_26 = 0.034

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_26 then
				local var_10_27 = (arg_7_1.time_ - var_10_25) / var_10_26

				if arg_7_1.var_.actorSpriteComps10059 then
					for iter_10_6, iter_10_7 in pairs(arg_7_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_10_7 then
							local var_10_28 = Mathf.Lerp(iter_10_7.color.r, 0.5, var_10_27)

							iter_10_7.color = Color.New(var_10_28, var_10_28, var_10_28)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_25 + var_10_26 and arg_7_1.time_ < var_10_25 + var_10_26 + arg_10_0 and arg_7_1.var_.actorSpriteComps10059 then
				local var_10_29 = 0.5

				for iter_10_8, iter_10_9 in pairs(arg_7_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_10_9 then
						iter_10_9.color = Color.New(var_10_29, var_10_29, var_10_29)
					end
				end

				arg_7_1.var_.actorSpriteComps10059 = nil
			end

			local var_10_30 = 0
			local var_10_31 = 0.975

			if var_10_30 < arg_7_1.time_ and arg_7_1.time_ <= var_10_30 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_32 = arg_7_1:FormatText(StoryNameCfg[612].name)

				arg_7_1.leftNameTxt_.text = var_10_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_33 = arg_7_1:GetWordFromCfg(410211002)
				local var_10_34 = arg_7_1:FormatText(var_10_33.content)

				arg_7_1.text_.text = var_10_34

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_35 = 39
				local var_10_36 = utf8.len(var_10_34)
				local var_10_37 = var_10_35 <= 0 and var_10_31 or var_10_31 * (var_10_36 / var_10_35)

				if var_10_37 > 0 and var_10_31 < var_10_37 then
					arg_7_1.talkMaxDuration = var_10_37

					if var_10_37 + var_10_30 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_37 + var_10_30
					end
				end

				arg_7_1.text_.text = var_10_34
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211002", "story_v_out_410211.awb") ~= 0 then
					local var_10_38 = manager.audio:GetVoiceLength("story_v_out_410211", "410211002", "story_v_out_410211.awb") / 1000

					if var_10_38 + var_10_30 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_38 + var_10_30
					end

					if var_10_33.prefab_name ~= "" and arg_7_1.actors_[var_10_33.prefab_name] ~= nil then
						local var_10_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_33.prefab_name].transform, "story_v_out_410211", "410211002", "story_v_out_410211.awb")

						arg_7_1:RecordAudio("410211002", var_10_39)
						arg_7_1:RecordAudio("410211002", var_10_39)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410211", "410211002", "story_v_out_410211.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410211", "410211002", "story_v_out_410211.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_40 = math.max(var_10_31, arg_7_1.talkMaxDuration)

			if var_10_30 <= arg_7_1.time_ and arg_7_1.time_ < var_10_30 + var_10_40 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_30) / var_10_40

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_30 + var_10_40 and arg_7_1.time_ < var_10_30 + var_10_40 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410211003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410211003
		arg_11_1.duration_ = 1.9

		local var_11_0 = {
			ja = 1.6,
			CriLanguages = 1.9,
			zh = 1.9
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
				arg_11_0:Play410211004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1061"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1061 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1061", 2)

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
				local var_14_6 = Vector3.New(-390, -490, 18)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1061, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_14_7 = arg_11_1.actors_["10059"].transform
			local var_14_8 = 0

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 then
				arg_11_1.var_.moveOldPos10059 = var_14_7.localPosition
				var_14_7.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10059", 4)

				local var_14_9 = var_14_7.childCount

				for iter_14_1 = 0, var_14_9 - 1 do
					local var_14_10 = var_14_7:GetChild(iter_14_1)

					if var_14_10.name == "" or not string.find(var_14_10.name, "split") then
						var_14_10.gameObject:SetActive(true)
					else
						var_14_10.gameObject:SetActive(false)
					end
				end
			end

			local var_14_11 = 0.001

			if var_14_8 <= arg_11_1.time_ and arg_11_1.time_ < var_14_8 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_8) / var_14_11
				local var_14_13 = Vector3.New(390, -530, 35)

				var_14_7.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10059, var_14_13, var_14_12)
			end

			if arg_11_1.time_ >= var_14_8 + var_14_11 and arg_11_1.time_ < var_14_8 + var_14_11 + arg_14_0 then
				var_14_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_14_14 = arg_11_1.actors_["1061"]
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 == nil then
				arg_11_1.var_.actorSpriteComps1061 = var_14_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_16 = 0.034

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16

				if arg_11_1.var_.actorSpriteComps1061 then
					for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_14_3 then
							local var_14_18 = Mathf.Lerp(iter_14_3.color.r, 0.5, var_14_17)

							iter_14_3.color = Color.New(var_14_18, var_14_18, var_14_18)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 then
				local var_14_19 = 0.5

				for iter_14_4, iter_14_5 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_14_5 then
						iter_14_5.color = Color.New(var_14_19, var_14_19, var_14_19)
					end
				end

				arg_11_1.var_.actorSpriteComps1061 = nil
			end

			local var_14_20 = arg_11_1.actors_["10059"]
			local var_14_21 = 0

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 and arg_11_1.var_.actorSpriteComps10059 == nil then
				arg_11_1.var_.actorSpriteComps10059 = var_14_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_22 = 0.034

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_22 then
				local var_14_23 = (arg_11_1.time_ - var_14_21) / var_14_22

				if arg_11_1.var_.actorSpriteComps10059 then
					for iter_14_6, iter_14_7 in pairs(arg_11_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_14_7 then
							local var_14_24 = Mathf.Lerp(iter_14_7.color.r, 1, var_14_23)

							iter_14_7.color = Color.New(var_14_24, var_14_24, var_14_24)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_21 + var_14_22 and arg_11_1.time_ < var_14_21 + var_14_22 + arg_14_0 and arg_11_1.var_.actorSpriteComps10059 then
				local var_14_25 = 1

				for iter_14_8, iter_14_9 in pairs(arg_11_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_14_9 then
						iter_14_9.color = Color.New(var_14_25, var_14_25, var_14_25)
					end
				end

				arg_11_1.var_.actorSpriteComps10059 = nil
			end

			local var_14_26 = 0
			local var_14_27 = 0.15

			if var_14_26 < arg_11_1.time_ and arg_11_1.time_ <= var_14_26 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_28 = arg_11_1:FormatText(StoryNameCfg[596].name)

				arg_11_1.leftNameTxt_.text = var_14_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_29 = arg_11_1:GetWordFromCfg(410211003)
				local var_14_30 = arg_11_1:FormatText(var_14_29.content)

				arg_11_1.text_.text = var_14_30

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_31 = 6
				local var_14_32 = utf8.len(var_14_30)
				local var_14_33 = var_14_31 <= 0 and var_14_27 or var_14_27 * (var_14_32 / var_14_31)

				if var_14_33 > 0 and var_14_27 < var_14_33 then
					arg_11_1.talkMaxDuration = var_14_33

					if var_14_33 + var_14_26 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_33 + var_14_26
					end
				end

				arg_11_1.text_.text = var_14_30
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211003", "story_v_out_410211.awb") ~= 0 then
					local var_14_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211003", "story_v_out_410211.awb") / 1000

					if var_14_34 + var_14_26 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_34 + var_14_26
					end

					if var_14_29.prefab_name ~= "" and arg_11_1.actors_[var_14_29.prefab_name] ~= nil then
						local var_14_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_29.prefab_name].transform, "story_v_out_410211", "410211003", "story_v_out_410211.awb")

						arg_11_1:RecordAudio("410211003", var_14_35)
						arg_11_1:RecordAudio("410211003", var_14_35)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410211", "410211003", "story_v_out_410211.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410211", "410211003", "story_v_out_410211.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_36 = math.max(var_14_27, arg_11_1.talkMaxDuration)

			if var_14_26 <= arg_11_1.time_ and arg_11_1.time_ < var_14_26 + var_14_36 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_26) / var_14_36

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_26 + var_14_36 and arg_11_1.time_ < var_14_26 + var_14_36 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410211004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410211004
		arg_15_1.duration_ = 17.5

		local var_15_0 = {
			ja = 17.5,
			CriLanguages = 10.666,
			zh = 10.666
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
				arg_15_0:Play410211005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1061"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1061 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1061", 2)

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
				local var_18_6 = Vector3.New(-390, -490, 18)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1061, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_18_7 = arg_15_1.actors_["10059"].transform
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 then
				arg_15_1.var_.moveOldPos10059 = var_18_7.localPosition
				var_18_7.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("10059", 4)

				local var_18_9 = var_18_7.childCount

				for iter_18_1 = 0, var_18_9 - 1 do
					local var_18_10 = var_18_7:GetChild(iter_18_1)

					if var_18_10.name == "" or not string.find(var_18_10.name, "split") then
						var_18_10.gameObject:SetActive(true)
					else
						var_18_10.gameObject:SetActive(false)
					end
				end
			end

			local var_18_11 = 0.001

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_8) / var_18_11
				local var_18_13 = Vector3.New(390, -530, 35)

				var_18_7.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10059, var_18_13, var_18_12)
			end

			if arg_15_1.time_ >= var_18_8 + var_18_11 and arg_15_1.time_ < var_18_8 + var_18_11 + arg_18_0 then
				var_18_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_18_14 = arg_15_1.actors_["1061"]
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 == nil then
				arg_15_1.var_.actorSpriteComps1061 = var_18_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_16 = 0.034

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16

				if arg_15_1.var_.actorSpriteComps1061 then
					for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_18_3 then
							local var_18_18 = Mathf.Lerp(iter_18_3.color.r, 1, var_18_17)

							iter_18_3.color = Color.New(var_18_18, var_18_18, var_18_18)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_15 + var_18_16 and arg_15_1.time_ < var_18_15 + var_18_16 + arg_18_0 and arg_15_1.var_.actorSpriteComps1061 then
				local var_18_19 = 1

				for iter_18_4, iter_18_5 in pairs(arg_15_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_18_5 then
						iter_18_5.color = Color.New(var_18_19, var_18_19, var_18_19)
					end
				end

				arg_15_1.var_.actorSpriteComps1061 = nil
			end

			local var_18_20 = arg_15_1.actors_["10059"]
			local var_18_21 = 0

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 and arg_15_1.var_.actorSpriteComps10059 == nil then
				arg_15_1.var_.actorSpriteComps10059 = var_18_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_22 = 0.034

			if var_18_21 <= arg_15_1.time_ and arg_15_1.time_ < var_18_21 + var_18_22 then
				local var_18_23 = (arg_15_1.time_ - var_18_21) / var_18_22

				if arg_15_1.var_.actorSpriteComps10059 then
					for iter_18_6, iter_18_7 in pairs(arg_15_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_18_7 then
							local var_18_24 = Mathf.Lerp(iter_18_7.color.r, 0.5, var_18_23)

							iter_18_7.color = Color.New(var_18_24, var_18_24, var_18_24)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_21 + var_18_22 and arg_15_1.time_ < var_18_21 + var_18_22 + arg_18_0 and arg_15_1.var_.actorSpriteComps10059 then
				local var_18_25 = 0.5

				for iter_18_8, iter_18_9 in pairs(arg_15_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_18_9 then
						iter_18_9.color = Color.New(var_18_25, var_18_25, var_18_25)
					end
				end

				arg_15_1.var_.actorSpriteComps10059 = nil
			end

			local var_18_26 = 0
			local var_18_27 = 1.225

			if var_18_26 < arg_15_1.time_ and arg_15_1.time_ <= var_18_26 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_28 = arg_15_1:FormatText(StoryNameCfg[612].name)

				arg_15_1.leftNameTxt_.text = var_18_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_29 = arg_15_1:GetWordFromCfg(410211004)
				local var_18_30 = arg_15_1:FormatText(var_18_29.content)

				arg_15_1.text_.text = var_18_30

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_31 = 49
				local var_18_32 = utf8.len(var_18_30)
				local var_18_33 = var_18_31 <= 0 and var_18_27 or var_18_27 * (var_18_32 / var_18_31)

				if var_18_33 > 0 and var_18_27 < var_18_33 then
					arg_15_1.talkMaxDuration = var_18_33

					if var_18_33 + var_18_26 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_33 + var_18_26
					end
				end

				arg_15_1.text_.text = var_18_30
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211004", "story_v_out_410211.awb") ~= 0 then
					local var_18_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211004", "story_v_out_410211.awb") / 1000

					if var_18_34 + var_18_26 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_34 + var_18_26
					end

					if var_18_29.prefab_name ~= "" and arg_15_1.actors_[var_18_29.prefab_name] ~= nil then
						local var_18_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_29.prefab_name].transform, "story_v_out_410211", "410211004", "story_v_out_410211.awb")

						arg_15_1:RecordAudio("410211004", var_18_35)
						arg_15_1:RecordAudio("410211004", var_18_35)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410211", "410211004", "story_v_out_410211.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410211", "410211004", "story_v_out_410211.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_36 = math.max(var_18_27, arg_15_1.talkMaxDuration)

			if var_18_26 <= arg_15_1.time_ and arg_15_1.time_ < var_18_26 + var_18_36 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_26) / var_18_36

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_26 + var_18_36 and arg_15_1.time_ < var_18_26 + var_18_36 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410211005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410211005
		arg_19_1.duration_ = 4.4

		local var_19_0 = {
			ja = 4.4,
			CriLanguages = 1.9,
			zh = 1.9
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
				arg_19_0:Play410211006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1061"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1061 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1061", 2)

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
				local var_22_6 = Vector3.New(-390, -490, 18)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1061, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_22_7 = arg_19_1.actors_["10059"].transform
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 then
				arg_19_1.var_.moveOldPos10059 = var_22_7.localPosition
				var_22_7.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10059", 4)

				local var_22_9 = var_22_7.childCount

				for iter_22_1 = 0, var_22_9 - 1 do
					local var_22_10 = var_22_7:GetChild(iter_22_1)

					if var_22_10.name == "" or not string.find(var_22_10.name, "split") then
						var_22_10.gameObject:SetActive(true)
					else
						var_22_10.gameObject:SetActive(false)
					end
				end
			end

			local var_22_11 = 0.001

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_8) / var_22_11
				local var_22_13 = Vector3.New(390, -530, 35)

				var_22_7.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10059, var_22_13, var_22_12)
			end

			if arg_19_1.time_ >= var_22_8 + var_22_11 and arg_19_1.time_ < var_22_8 + var_22_11 + arg_22_0 then
				var_22_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_22_14 = arg_19_1.actors_["1061"]
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 == nil then
				arg_19_1.var_.actorSpriteComps1061 = var_22_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_16 = 0.034

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_16 then
				local var_22_17 = (arg_19_1.time_ - var_22_15) / var_22_16

				if arg_19_1.var_.actorSpriteComps1061 then
					for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_22_3 then
							local var_22_18 = Mathf.Lerp(iter_22_3.color.r, 0.5, var_22_17)

							iter_22_3.color = Color.New(var_22_18, var_22_18, var_22_18)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_15 + var_22_16 and arg_19_1.time_ < var_22_15 + var_22_16 + arg_22_0 and arg_19_1.var_.actorSpriteComps1061 then
				local var_22_19 = 0.5

				for iter_22_4, iter_22_5 in pairs(arg_19_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_22_5 then
						iter_22_5.color = Color.New(var_22_19, var_22_19, var_22_19)
					end
				end

				arg_19_1.var_.actorSpriteComps1061 = nil
			end

			local var_22_20 = arg_19_1.actors_["10059"]
			local var_22_21 = 0

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 and arg_19_1.var_.actorSpriteComps10059 == nil then
				arg_19_1.var_.actorSpriteComps10059 = var_22_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_22 = 0.034

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_22 then
				local var_22_23 = (arg_19_1.time_ - var_22_21) / var_22_22

				if arg_19_1.var_.actorSpriteComps10059 then
					for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_22_7 then
							local var_22_24 = Mathf.Lerp(iter_22_7.color.r, 1, var_22_23)

							iter_22_7.color = Color.New(var_22_24, var_22_24, var_22_24)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_21 + var_22_22 and arg_19_1.time_ < var_22_21 + var_22_22 + arg_22_0 and arg_19_1.var_.actorSpriteComps10059 then
				local var_22_25 = 1

				for iter_22_8, iter_22_9 in pairs(arg_19_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_22_9 then
						iter_22_9.color = Color.New(var_22_25, var_22_25, var_22_25)
					end
				end

				arg_19_1.var_.actorSpriteComps10059 = nil
			end

			local var_22_26 = 0
			local var_22_27 = 0.225

			if var_22_26 < arg_19_1.time_ and arg_19_1.time_ <= var_22_26 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_28 = arg_19_1:FormatText(StoryNameCfg[596].name)

				arg_19_1.leftNameTxt_.text = var_22_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_29 = arg_19_1:GetWordFromCfg(410211005)
				local var_22_30 = arg_19_1:FormatText(var_22_29.content)

				arg_19_1.text_.text = var_22_30

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_31 = 9
				local var_22_32 = utf8.len(var_22_30)
				local var_22_33 = var_22_31 <= 0 and var_22_27 or var_22_27 * (var_22_32 / var_22_31)

				if var_22_33 > 0 and var_22_27 < var_22_33 then
					arg_19_1.talkMaxDuration = var_22_33

					if var_22_33 + var_22_26 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_33 + var_22_26
					end
				end

				arg_19_1.text_.text = var_22_30
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211005", "story_v_out_410211.awb") ~= 0 then
					local var_22_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211005", "story_v_out_410211.awb") / 1000

					if var_22_34 + var_22_26 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_34 + var_22_26
					end

					if var_22_29.prefab_name ~= "" and arg_19_1.actors_[var_22_29.prefab_name] ~= nil then
						local var_22_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_29.prefab_name].transform, "story_v_out_410211", "410211005", "story_v_out_410211.awb")

						arg_19_1:RecordAudio("410211005", var_22_35)
						arg_19_1:RecordAudio("410211005", var_22_35)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410211", "410211005", "story_v_out_410211.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410211", "410211005", "story_v_out_410211.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_36 = math.max(var_22_27, arg_19_1.talkMaxDuration)

			if var_22_26 <= arg_19_1.time_ and arg_19_1.time_ < var_22_26 + var_22_36 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_26) / var_22_36

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_26 + var_22_36 and arg_19_1.time_ < var_22_26 + var_22_36 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410211006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410211006
		arg_23_1.duration_ = 7.266

		local var_23_0 = {
			ja = 7.266,
			CriLanguages = 3.833,
			zh = 3.833
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
				arg_23_0:Play410211007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1061"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1061 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1061", 2)

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
				local var_26_6 = Vector3.New(-390, -490, 18)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1061, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_26_7 = arg_23_1.actors_["10059"].transform
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 then
				arg_23_1.var_.moveOldPos10059 = var_26_7.localPosition
				var_26_7.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10059", 4)

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
				local var_26_13 = Vector3.New(390, -530, 35)

				var_26_7.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10059, var_26_13, var_26_12)
			end

			if arg_23_1.time_ >= var_26_8 + var_26_11 and arg_23_1.time_ < var_26_8 + var_26_11 + arg_26_0 then
				var_26_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_26_14 = arg_23_1.actors_["1061"]
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 == nil then
				arg_23_1.var_.actorSpriteComps1061 = var_26_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_16 = 0.034

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16

				if arg_23_1.var_.actorSpriteComps1061 then
					for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_26_3 then
							local var_26_18 = Mathf.Lerp(iter_26_3.color.r, 1, var_26_17)

							iter_26_3.color = Color.New(var_26_18, var_26_18, var_26_18)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 and arg_23_1.var_.actorSpriteComps1061 then
				local var_26_19 = 1

				for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_26_5 then
						iter_26_5.color = Color.New(var_26_19, var_26_19, var_26_19)
					end
				end

				arg_23_1.var_.actorSpriteComps1061 = nil
			end

			local var_26_20 = arg_23_1.actors_["10059"]
			local var_26_21 = 0

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 and arg_23_1.var_.actorSpriteComps10059 == nil then
				arg_23_1.var_.actorSpriteComps10059 = var_26_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_22 = 0.034

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_22 then
				local var_26_23 = (arg_23_1.time_ - var_26_21) / var_26_22

				if arg_23_1.var_.actorSpriteComps10059 then
					for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_26_7 then
							local var_26_24 = Mathf.Lerp(iter_26_7.color.r, 0.5, var_26_23)

							iter_26_7.color = Color.New(var_26_24, var_26_24, var_26_24)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_21 + var_26_22 and arg_23_1.time_ < var_26_21 + var_26_22 + arg_26_0 and arg_23_1.var_.actorSpriteComps10059 then
				local var_26_25 = 0.5

				for iter_26_8, iter_26_9 in pairs(arg_23_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_26_9 then
						iter_26_9.color = Color.New(var_26_25, var_26_25, var_26_25)
					end
				end

				arg_23_1.var_.actorSpriteComps10059 = nil
			end

			local var_26_26 = 0
			local var_26_27 = 0.475

			if var_26_26 < arg_23_1.time_ and arg_23_1.time_ <= var_26_26 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_28 = arg_23_1:FormatText(StoryNameCfg[612].name)

				arg_23_1.leftNameTxt_.text = var_26_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_29 = arg_23_1:GetWordFromCfg(410211006)
				local var_26_30 = arg_23_1:FormatText(var_26_29.content)

				arg_23_1.text_.text = var_26_30

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_31 = 19
				local var_26_32 = utf8.len(var_26_30)
				local var_26_33 = var_26_31 <= 0 and var_26_27 or var_26_27 * (var_26_32 / var_26_31)

				if var_26_33 > 0 and var_26_27 < var_26_33 then
					arg_23_1.talkMaxDuration = var_26_33

					if var_26_33 + var_26_26 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_33 + var_26_26
					end
				end

				arg_23_1.text_.text = var_26_30
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211006", "story_v_out_410211.awb") ~= 0 then
					local var_26_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211006", "story_v_out_410211.awb") / 1000

					if var_26_34 + var_26_26 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_34 + var_26_26
					end

					if var_26_29.prefab_name ~= "" and arg_23_1.actors_[var_26_29.prefab_name] ~= nil then
						local var_26_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_29.prefab_name].transform, "story_v_out_410211", "410211006", "story_v_out_410211.awb")

						arg_23_1:RecordAudio("410211006", var_26_35)
						arg_23_1:RecordAudio("410211006", var_26_35)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410211", "410211006", "story_v_out_410211.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410211", "410211006", "story_v_out_410211.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_36 = math.max(var_26_27, arg_23_1.talkMaxDuration)

			if var_26_26 <= arg_23_1.time_ and arg_23_1.time_ < var_26_26 + var_26_36 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_26) / var_26_36

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_26 + var_26_36 and arg_23_1.time_ < var_26_26 + var_26_36 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410211007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410211007
		arg_27_1.duration_ = 0.999999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play410211008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "10060"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_30_0), arg_27_1.canvasGo_.transform)

				var_30_1.transform:SetSiblingIndex(1)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_27_1.actors_[var_30_0] = var_30_1
			end

			local var_30_2 = arg_27_1.actors_["10060"].transform
			local var_30_3 = 0

			if var_30_3 < arg_27_1.time_ and arg_27_1.time_ <= var_30_3 + arg_30_0 then
				arg_27_1.var_.moveOldPos10060 = var_30_2.localPosition
				var_30_2.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10060", 4)

				local var_30_4 = var_30_2.childCount

				for iter_30_0 = 0, var_30_4 - 1 do
					local var_30_5 = var_30_2:GetChild(iter_30_0)

					if var_30_5.name == "" or not string.find(var_30_5.name, "split") then
						var_30_5.gameObject:SetActive(true)
					else
						var_30_5.gameObject:SetActive(false)
					end
				end
			end

			local var_30_6 = 0.001

			if var_30_3 <= arg_27_1.time_ and arg_27_1.time_ < var_30_3 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_3) / var_30_6
				local var_30_8 = Vector3.New(390, -400, 0)

				var_30_2.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10060, var_30_8, var_30_7)
			end

			if arg_27_1.time_ >= var_30_3 + var_30_6 and arg_27_1.time_ < var_30_3 + var_30_6 + arg_30_0 then
				var_30_2.localPosition = Vector3.New(390, -400, 0)
			end

			local var_30_9 = arg_27_1.actors_["10059"].transform
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.var_.moveOldPos10059 = var_30_9.localPosition
				var_30_9.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10059", 7)

				local var_30_11 = var_30_9.childCount

				for iter_30_1 = 0, var_30_11 - 1 do
					local var_30_12 = var_30_9:GetChild(iter_30_1)

					if var_30_12.name == "" or not string.find(var_30_12.name, "split") then
						var_30_12.gameObject:SetActive(true)
					else
						var_30_12.gameObject:SetActive(false)
					end
				end
			end

			local var_30_13 = 0.001

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_13 then
				local var_30_14 = (arg_27_1.time_ - var_30_10) / var_30_13
				local var_30_15 = Vector3.New(0, -2000, 35)

				var_30_9.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10059, var_30_15, var_30_14)
			end

			if arg_27_1.time_ >= var_30_10 + var_30_13 and arg_27_1.time_ < var_30_10 + var_30_13 + arg_30_0 then
				var_30_9.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_30_16 = arg_27_1.actors_["10060"]
			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 and arg_27_1.var_.actorSpriteComps10060 == nil then
				arg_27_1.var_.actorSpriteComps10060 = var_30_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_18 = 0.034

			if var_30_17 <= arg_27_1.time_ and arg_27_1.time_ < var_30_17 + var_30_18 then
				local var_30_19 = (arg_27_1.time_ - var_30_17) / var_30_18

				if arg_27_1.var_.actorSpriteComps10060 then
					for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_30_3 then
							local var_30_20 = Mathf.Lerp(iter_30_3.color.r, 1, var_30_19)

							iter_30_3.color = Color.New(var_30_20, var_30_20, var_30_20)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_17 + var_30_18 and arg_27_1.time_ < var_30_17 + var_30_18 + arg_30_0 and arg_27_1.var_.actorSpriteComps10060 then
				local var_30_21 = 1

				for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_30_5 then
						iter_30_5.color = Color.New(var_30_21, var_30_21, var_30_21)
					end
				end

				arg_27_1.var_.actorSpriteComps10060 = nil
			end

			local var_30_22 = arg_27_1.actors_["10059"]
			local var_30_23 = 0

			if var_30_23 < arg_27_1.time_ and arg_27_1.time_ <= var_30_23 + arg_30_0 and arg_27_1.var_.actorSpriteComps10059 == nil then
				arg_27_1.var_.actorSpriteComps10059 = var_30_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_24 = 0.034

			if var_30_23 <= arg_27_1.time_ and arg_27_1.time_ < var_30_23 + var_30_24 then
				local var_30_25 = (arg_27_1.time_ - var_30_23) / var_30_24

				if arg_27_1.var_.actorSpriteComps10059 then
					for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_30_7 then
							local var_30_26 = Mathf.Lerp(iter_30_7.color.r, 0.5, var_30_25)

							iter_30_7.color = Color.New(var_30_26, var_30_26, var_30_26)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_23 + var_30_24 and arg_27_1.time_ < var_30_23 + var_30_24 + arg_30_0 and arg_27_1.var_.actorSpriteComps10059 then
				local var_30_27 = 0.5

				for iter_30_8, iter_30_9 in pairs(arg_27_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_30_9 then
						iter_30_9.color = Color.New(var_30_27, var_30_27, var_30_27)
					end
				end

				arg_27_1.var_.actorSpriteComps10059 = nil
			end

			local var_30_28 = arg_27_1.actors_["1061"]
			local var_30_29 = 0

			if var_30_29 < arg_27_1.time_ and arg_27_1.time_ <= var_30_29 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 == nil then
				arg_27_1.var_.actorSpriteComps1061 = var_30_28:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_30 = 0.034

			if var_30_29 <= arg_27_1.time_ and arg_27_1.time_ < var_30_29 + var_30_30 then
				local var_30_31 = (arg_27_1.time_ - var_30_29) / var_30_30

				if arg_27_1.var_.actorSpriteComps1061 then
					for iter_30_10, iter_30_11 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_30_11 then
							local var_30_32 = Mathf.Lerp(iter_30_11.color.r, 0.5, var_30_31)

							iter_30_11.color = Color.New(var_30_32, var_30_32, var_30_32)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_29 + var_30_30 and arg_27_1.time_ < var_30_29 + var_30_30 + arg_30_0 and arg_27_1.var_.actorSpriteComps1061 then
				local var_30_33 = 0.5

				for iter_30_12, iter_30_13 in pairs(arg_27_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_30_13 then
						iter_30_13.color = Color.New(var_30_33, var_30_33, var_30_33)
					end
				end

				arg_27_1.var_.actorSpriteComps1061 = nil
			end

			local var_30_34 = 0
			local var_30_35 = 0.05

			if var_30_34 < arg_27_1.time_ and arg_27_1.time_ <= var_30_34 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_36 = arg_27_1:FormatText(StoryNameCfg[597].name)

				arg_27_1.leftNameTxt_.text = var_30_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_37 = arg_27_1:GetWordFromCfg(410211007)
				local var_30_38 = arg_27_1:FormatText(var_30_37.content)

				arg_27_1.text_.text = var_30_38

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_39 = 2
				local var_30_40 = utf8.len(var_30_38)
				local var_30_41 = var_30_39 <= 0 and var_30_35 or var_30_35 * (var_30_40 / var_30_39)

				if var_30_41 > 0 and var_30_35 < var_30_41 then
					arg_27_1.talkMaxDuration = var_30_41

					if var_30_41 + var_30_34 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_41 + var_30_34
					end
				end

				arg_27_1.text_.text = var_30_38
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211007", "story_v_out_410211.awb") ~= 0 then
					local var_30_42 = manager.audio:GetVoiceLength("story_v_out_410211", "410211007", "story_v_out_410211.awb") / 1000

					if var_30_42 + var_30_34 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_42 + var_30_34
					end

					if var_30_37.prefab_name ~= "" and arg_27_1.actors_[var_30_37.prefab_name] ~= nil then
						local var_30_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_37.prefab_name].transform, "story_v_out_410211", "410211007", "story_v_out_410211.awb")

						arg_27_1:RecordAudio("410211007", var_30_43)
						arg_27_1:RecordAudio("410211007", var_30_43)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410211", "410211007", "story_v_out_410211.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410211", "410211007", "story_v_out_410211.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_44 = math.max(var_30_35, arg_27_1.talkMaxDuration)

			if var_30_34 <= arg_27_1.time_ and arg_27_1.time_ < var_30_34 + var_30_44 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_34) / var_30_44

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_34 + var_30_44 and arg_27_1.time_ < var_30_34 + var_30_44 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410211008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410211008
		arg_31_1.duration_ = 5.066

		local var_31_0 = {
			ja = 5.066,
			CriLanguages = 2.766,
			zh = 2.766
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
				arg_31_0:Play410211009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10060"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10060 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10060", 4)

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
				local var_34_6 = Vector3.New(390, -400, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10060, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_34_7 = arg_31_1.actors_["10060"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps10060 == nil then
				arg_31_1.var_.actorSpriteComps10060 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps10060 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps10060 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps10060 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.3

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[597].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(410211008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211008", "story_v_out_410211.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211008", "story_v_out_410211.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410211", "410211008", "story_v_out_410211.awb")

						arg_31_1:RecordAudio("410211008", var_34_22)
						arg_31_1:RecordAudio("410211008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410211", "410211008", "story_v_out_410211.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410211", "410211008", "story_v_out_410211.awb")
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
	Play410211009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410211009
		arg_35_1.duration_ = 14.933

		local var_35_0 = {
			ja = 14.933,
			CriLanguages = 9,
			zh = 9
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
				arg_35_0:Play410211010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1061"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1061 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1061", 2)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "split_5" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(-390, -490, 18)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1061, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(-390, -490, 18)
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
			local var_38_20 = 1

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

				local var_38_22 = arg_35_1:GetWordFromCfg(410211009)
				local var_38_23 = arg_35_1:FormatText(var_38_22.content)

				arg_35_1.text_.text = var_38_23

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_24 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211009", "story_v_out_410211.awb") ~= 0 then
					local var_38_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211009", "story_v_out_410211.awb") / 1000

					if var_38_27 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_27 + var_38_19
					end

					if var_38_22.prefab_name ~= "" and arg_35_1.actors_[var_38_22.prefab_name] ~= nil then
						local var_38_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_22.prefab_name].transform, "story_v_out_410211", "410211009", "story_v_out_410211.awb")

						arg_35_1:RecordAudio("410211009", var_38_28)
						arg_35_1:RecordAudio("410211009", var_38_28)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410211", "410211009", "story_v_out_410211.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410211", "410211009", "story_v_out_410211.awb")
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
	Play410211010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410211010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play410211011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10060"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10060 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10060", 7)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(0, -2000, 18)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10060, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_42_7 = arg_39_1.actors_["10060"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps10060 == nil then
				arg_39_1.var_.actorSpriteComps10060 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.034

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps10060 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 0.5, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps10060 then
				local var_42_12 = 0.5

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps10060 = nil
			end

			local var_42_13 = arg_39_1.actors_["1061"].transform
			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1.var_.moveOldPos1061 = var_42_13.localPosition
				var_42_13.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1061", 7)

				local var_42_15 = var_42_13.childCount

				for iter_42_5 = 0, var_42_15 - 1 do
					local var_42_16 = var_42_13:GetChild(iter_42_5)

					if var_42_16.name == "" or not string.find(var_42_16.name, "split") then
						var_42_16.gameObject:SetActive(true)
					else
						var_42_16.gameObject:SetActive(false)
					end
				end
			end

			local var_42_17 = 0.001

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_14) / var_42_17
				local var_42_19 = Vector3.New(0, -2000, 18)

				var_42_13.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1061, var_42_19, var_42_18)
			end

			if arg_39_1.time_ >= var_42_14 + var_42_17 and arg_39_1.time_ < var_42_14 + var_42_17 + arg_42_0 then
				var_42_13.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_42_20 = 0
			local var_42_21 = 1.725

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_22 = arg_39_1:GetWordFromCfg(410211010)
				local var_42_23 = arg_39_1:FormatText(var_42_22.content)

				arg_39_1.text_.text = var_42_23

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_24 = 69
				local var_42_25 = utf8.len(var_42_23)
				local var_42_26 = var_42_24 <= 0 and var_42_21 or var_42_21 * (var_42_25 / var_42_24)

				if var_42_26 > 0 and var_42_21 < var_42_26 then
					arg_39_1.talkMaxDuration = var_42_26

					if var_42_26 + var_42_20 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_26 + var_42_20
					end
				end

				arg_39_1.text_.text = var_42_23
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_27 = math.max(var_42_21, arg_39_1.talkMaxDuration)

			if var_42_20 <= arg_39_1.time_ and arg_39_1.time_ < var_42_20 + var_42_27 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_20) / var_42_27

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_20 + var_42_27 and arg_39_1.time_ < var_42_20 + var_42_27 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410211011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410211011
		arg_43_1.duration_ = 7.266

		local var_43_0 = {
			ja = 7.266,
			CriLanguages = 6.633,
			zh = 6.633
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
				arg_43_0:Play410211012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10059"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos10059 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10059", 4)

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
				local var_46_6 = Vector3.New(390, -530, 35)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10059, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_46_7 = arg_43_1.actors_["10059"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps10059 == nil then
				arg_43_1.var_.actorSpriteComps10059 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.034

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps10059 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps10059 then
				local var_46_12 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps10059 = nil
			end

			local var_46_13 = arg_43_1.actors_["1061"].transform
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1.var_.moveOldPos1061 = var_46_13.localPosition
				var_46_13.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1061", 2)

				local var_46_15 = var_46_13.childCount

				for iter_46_5 = 0, var_46_15 - 1 do
					local var_46_16 = var_46_13:GetChild(iter_46_5)

					if var_46_16.name == "" or not string.find(var_46_16.name, "split") then
						var_46_16.gameObject:SetActive(true)
					else
						var_46_16.gameObject:SetActive(false)
					end
				end
			end

			local var_46_17 = 0.001

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_17 then
				local var_46_18 = (arg_43_1.time_ - var_46_14) / var_46_17
				local var_46_19 = Vector3.New(-390, -490, 18)

				var_46_13.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1061, var_46_19, var_46_18)
			end

			if arg_43_1.time_ >= var_46_14 + var_46_17 and arg_43_1.time_ < var_46_14 + var_46_17 + arg_46_0 then
				var_46_13.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_46_20 = arg_43_1.actors_["1061"]
			local var_46_21 = 0

			if var_46_21 < arg_43_1.time_ and arg_43_1.time_ <= var_46_21 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 == nil then
				arg_43_1.var_.actorSpriteComps1061 = var_46_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_22 = 0.034

			if var_46_21 <= arg_43_1.time_ and arg_43_1.time_ < var_46_21 + var_46_22 then
				local var_46_23 = (arg_43_1.time_ - var_46_21) / var_46_22

				if arg_43_1.var_.actorSpriteComps1061 then
					for iter_46_6, iter_46_7 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_46_7 then
							local var_46_24 = Mathf.Lerp(iter_46_7.color.r, 0.5, var_46_23)

							iter_46_7.color = Color.New(var_46_24, var_46_24, var_46_24)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_21 + var_46_22 and arg_43_1.time_ < var_46_21 + var_46_22 + arg_46_0 and arg_43_1.var_.actorSpriteComps1061 then
				local var_46_25 = 0.5

				for iter_46_8, iter_46_9 in pairs(arg_43_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_46_9 then
						iter_46_9.color = Color.New(var_46_25, var_46_25, var_46_25)
					end
				end

				arg_43_1.var_.actorSpriteComps1061 = nil
			end

			local var_46_26 = 0
			local var_46_27 = 0.8

			if var_46_26 < arg_43_1.time_ and arg_43_1.time_ <= var_46_26 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_28 = arg_43_1:FormatText(StoryNameCfg[596].name)

				arg_43_1.leftNameTxt_.text = var_46_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_29 = arg_43_1:GetWordFromCfg(410211011)
				local var_46_30 = arg_43_1:FormatText(var_46_29.content)

				arg_43_1.text_.text = var_46_30

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_31 = 32
				local var_46_32 = utf8.len(var_46_30)
				local var_46_33 = var_46_31 <= 0 and var_46_27 or var_46_27 * (var_46_32 / var_46_31)

				if var_46_33 > 0 and var_46_27 < var_46_33 then
					arg_43_1.talkMaxDuration = var_46_33

					if var_46_33 + var_46_26 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_33 + var_46_26
					end
				end

				arg_43_1.text_.text = var_46_30
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211011", "story_v_out_410211.awb") ~= 0 then
					local var_46_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211011", "story_v_out_410211.awb") / 1000

					if var_46_34 + var_46_26 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_34 + var_46_26
					end

					if var_46_29.prefab_name ~= "" and arg_43_1.actors_[var_46_29.prefab_name] ~= nil then
						local var_46_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_29.prefab_name].transform, "story_v_out_410211", "410211011", "story_v_out_410211.awb")

						arg_43_1:RecordAudio("410211011", var_46_35)
						arg_43_1:RecordAudio("410211011", var_46_35)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410211", "410211011", "story_v_out_410211.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410211", "410211011", "story_v_out_410211.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_36 = math.max(var_46_27, arg_43_1.talkMaxDuration)

			if var_46_26 <= arg_43_1.time_ and arg_43_1.time_ < var_46_26 + var_46_36 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_26) / var_46_36

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_26 + var_46_36 and arg_43_1.time_ < var_46_26 + var_46_36 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410211012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410211012
		arg_47_1.duration_ = 15.8

		local var_47_0 = {
			ja = 15.8,
			CriLanguages = 7.433,
			zh = 7.433
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
				arg_47_0:Play410211013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1061"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1061 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1061", 2)

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
				local var_50_6 = Vector3.New(-390, -490, 18)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1061, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-390, -490, 18)
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

			local var_50_13 = arg_47_1.actors_["10059"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.actorSpriteComps10059 == nil then
				arg_47_1.var_.actorSpriteComps10059 = var_50_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_15 = 0.034

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.actorSpriteComps10059 then
					for iter_50_5, iter_50_6 in pairs(arg_47_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_50_6 then
							local var_50_17 = Mathf.Lerp(iter_50_6.color.r, 0.5, var_50_16)

							iter_50_6.color = Color.New(var_50_17, var_50_17, var_50_17)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.actorSpriteComps10059 then
				local var_50_18 = 0.5

				for iter_50_7, iter_50_8 in pairs(arg_47_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_50_8 then
						iter_50_8.color = Color.New(var_50_18, var_50_18, var_50_18)
					end
				end

				arg_47_1.var_.actorSpriteComps10059 = nil
			end

			local var_50_19 = 0
			local var_50_20 = 0.85

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

				local var_50_22 = arg_47_1:GetWordFromCfg(410211012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211012", "story_v_out_410211.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211012", "story_v_out_410211.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_410211", "410211012", "story_v_out_410211.awb")

						arg_47_1:RecordAudio("410211012", var_50_28)
						arg_47_1:RecordAudio("410211012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410211", "410211012", "story_v_out_410211.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410211", "410211012", "story_v_out_410211.awb")
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
	Play410211013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410211013
		arg_51_1.duration_ = 6.733

		local var_51_0 = {
			ja = 6.733,
			CriLanguages = 4.333,
			zh = 4.333
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
				arg_51_0:Play410211014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10059"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10059 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10059", 4)

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
				local var_54_6 = Vector3.New(390, -530, 35)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10059, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_54_7 = arg_51_1.actors_["10059"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps10059 == nil then
				arg_51_1.var_.actorSpriteComps10059 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.034

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps10059 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps10059 then
				local var_54_12 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps10059 = nil
			end

			local var_54_13 = arg_51_1.actors_["1061"]
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 == nil then
				arg_51_1.var_.actorSpriteComps1061 = var_54_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_15 = 0.034

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15

				if arg_51_1.var_.actorSpriteComps1061 then
					for iter_54_5, iter_54_6 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_54_6 then
							local var_54_17 = Mathf.Lerp(iter_54_6.color.r, 0.5, var_54_16)

							iter_54_6.color = Color.New(var_54_17, var_54_17, var_54_17)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 then
				local var_54_18 = 0.5

				for iter_54_7, iter_54_8 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_54_8 then
						iter_54_8.color = Color.New(var_54_18, var_54_18, var_54_18)
					end
				end

				arg_51_1.var_.actorSpriteComps1061 = nil
			end

			local var_54_19 = 0
			local var_54_20 = 0.5

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_21 = arg_51_1:FormatText(StoryNameCfg[596].name)

				arg_51_1.leftNameTxt_.text = var_54_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_22 = arg_51_1:GetWordFromCfg(410211013)
				local var_54_23 = arg_51_1:FormatText(var_54_22.content)

				arg_51_1.text_.text = var_54_23

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_24 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211013", "story_v_out_410211.awb") ~= 0 then
					local var_54_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211013", "story_v_out_410211.awb") / 1000

					if var_54_27 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_19
					end

					if var_54_22.prefab_name ~= "" and arg_51_1.actors_[var_54_22.prefab_name] ~= nil then
						local var_54_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_22.prefab_name].transform, "story_v_out_410211", "410211013", "story_v_out_410211.awb")

						arg_51_1:RecordAudio("410211013", var_54_28)
						arg_51_1:RecordAudio("410211013", var_54_28)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410211", "410211013", "story_v_out_410211.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410211", "410211013", "story_v_out_410211.awb")
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
	Play410211014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410211014
		arg_55_1.duration_ = 12.333

		local var_55_0 = {
			ja = 12.333,
			CriLanguages = 7.9,
			zh = 7.9
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
				arg_55_0:Play410211015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10059"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10059 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10059", 4)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(390, -530, 35)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10059, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_58_7 = arg_55_1.actors_["10059"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps10059 == nil then
				arg_55_1.var_.actorSpriteComps10059 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.034

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps10059 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps10059 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps10059 = nil
			end

			local var_58_13 = 0
			local var_58_14 = 0.925

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_15 = arg_55_1:FormatText(StoryNameCfg[596].name)

				arg_55_1.leftNameTxt_.text = var_58_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_16 = arg_55_1:GetWordFromCfg(410211014)
				local var_58_17 = arg_55_1:FormatText(var_58_16.content)

				arg_55_1.text_.text = var_58_17

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_18 = 37
				local var_58_19 = utf8.len(var_58_17)
				local var_58_20 = var_58_18 <= 0 and var_58_14 or var_58_14 * (var_58_19 / var_58_18)

				if var_58_20 > 0 and var_58_14 < var_58_20 then
					arg_55_1.talkMaxDuration = var_58_20

					if var_58_20 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_13
					end
				end

				arg_55_1.text_.text = var_58_17
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211014", "story_v_out_410211.awb") ~= 0 then
					local var_58_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211014", "story_v_out_410211.awb") / 1000

					if var_58_21 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_13
					end

					if var_58_16.prefab_name ~= "" and arg_55_1.actors_[var_58_16.prefab_name] ~= nil then
						local var_58_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_16.prefab_name].transform, "story_v_out_410211", "410211014", "story_v_out_410211.awb")

						arg_55_1:RecordAudio("410211014", var_58_22)
						arg_55_1:RecordAudio("410211014", var_58_22)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410211", "410211014", "story_v_out_410211.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410211", "410211014", "story_v_out_410211.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_23 = math.max(var_58_14, arg_55_1.talkMaxDuration)

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_23 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_13) / var_58_23

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_13 + var_58_23 and arg_55_1.time_ < var_58_13 + var_58_23 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410211015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410211015
		arg_59_1.duration_ = 3.9

		local var_59_0 = {
			ja = 3.9,
			CriLanguages = 3.4,
			zh = 3.4
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
				arg_59_0:Play410211016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1061"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1061 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1061", 2)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_5" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(-390, -490, 18)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1061, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_62_7 = arg_59_1.actors_["1061"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps1061 == nil then
				arg_59_1.var_.actorSpriteComps1061 = var_62_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_9 = 0.034

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.actorSpriteComps1061 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_62_2 then
							local var_62_11 = Mathf.Lerp(iter_62_2.color.r, 1, var_62_10)

							iter_62_2.color = Color.New(var_62_11, var_62_11, var_62_11)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.actorSpriteComps1061 then
				local var_62_12 = 1

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_12, var_62_12, var_62_12)
					end
				end

				arg_59_1.var_.actorSpriteComps1061 = nil
			end

			local var_62_13 = arg_59_1.actors_["10059"]
			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 and arg_59_1.var_.actorSpriteComps10059 == nil then
				arg_59_1.var_.actorSpriteComps10059 = var_62_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_15 = 0.034

			if var_62_14 <= arg_59_1.time_ and arg_59_1.time_ < var_62_14 + var_62_15 then
				local var_62_16 = (arg_59_1.time_ - var_62_14) / var_62_15

				if arg_59_1.var_.actorSpriteComps10059 then
					for iter_62_5, iter_62_6 in pairs(arg_59_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_62_6 then
							local var_62_17 = Mathf.Lerp(iter_62_6.color.r, 0.5, var_62_16)

							iter_62_6.color = Color.New(var_62_17, var_62_17, var_62_17)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_14 + var_62_15 and arg_59_1.time_ < var_62_14 + var_62_15 + arg_62_0 and arg_59_1.var_.actorSpriteComps10059 then
				local var_62_18 = 0.5

				for iter_62_7, iter_62_8 in pairs(arg_59_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_62_8 then
						iter_62_8.color = Color.New(var_62_18, var_62_18, var_62_18)
					end
				end

				arg_59_1.var_.actorSpriteComps10059 = nil
			end

			local var_62_19 = 0
			local var_62_20 = 0.25

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_21 = arg_59_1:FormatText(StoryNameCfg[612].name)

				arg_59_1.leftNameTxt_.text = var_62_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_22 = arg_59_1:GetWordFromCfg(410211015)
				local var_62_23 = arg_59_1:FormatText(var_62_22.content)

				arg_59_1.text_.text = var_62_23

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_24 = 10
				local var_62_25 = utf8.len(var_62_23)
				local var_62_26 = var_62_24 <= 0 and var_62_20 or var_62_20 * (var_62_25 / var_62_24)

				if var_62_26 > 0 and var_62_20 < var_62_26 then
					arg_59_1.talkMaxDuration = var_62_26

					if var_62_26 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_26 + var_62_19
					end
				end

				arg_59_1.text_.text = var_62_23
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211015", "story_v_out_410211.awb") ~= 0 then
					local var_62_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211015", "story_v_out_410211.awb") / 1000

					if var_62_27 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_27 + var_62_19
					end

					if var_62_22.prefab_name ~= "" and arg_59_1.actors_[var_62_22.prefab_name] ~= nil then
						local var_62_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_22.prefab_name].transform, "story_v_out_410211", "410211015", "story_v_out_410211.awb")

						arg_59_1:RecordAudio("410211015", var_62_28)
						arg_59_1:RecordAudio("410211015", var_62_28)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410211", "410211015", "story_v_out_410211.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410211", "410211015", "story_v_out_410211.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_29 = math.max(var_62_20, arg_59_1.talkMaxDuration)

			if var_62_19 <= arg_59_1.time_ and arg_59_1.time_ < var_62_19 + var_62_29 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_19) / var_62_29

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_19 + var_62_29 and arg_59_1.time_ < var_62_19 + var_62_29 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410211016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410211016
		arg_63_1.duration_ = 2.9

		local var_63_0 = {
			ja = 2.9,
			CriLanguages = 1.3,
			zh = 1.3
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
				arg_63_0:Play410211017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10059"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos10059 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("10059", 4)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(390, -530, 35)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10059, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_66_7 = arg_63_1.actors_["10059"]
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps10059 == nil then
				arg_63_1.var_.actorSpriteComps10059 = var_66_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_9 = 0.034

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_8) / var_66_9

				if arg_63_1.var_.actorSpriteComps10059 then
					for iter_66_1, iter_66_2 in pairs(arg_63_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_66_2 then
							local var_66_11 = Mathf.Lerp(iter_66_2.color.r, 1, var_66_10)

							iter_66_2.color = Color.New(var_66_11, var_66_11, var_66_11)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_8 + var_66_9 and arg_63_1.time_ < var_66_8 + var_66_9 + arg_66_0 and arg_63_1.var_.actorSpriteComps10059 then
				local var_66_12 = 1

				for iter_66_3, iter_66_4 in pairs(arg_63_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_66_4 then
						iter_66_4.color = Color.New(var_66_12, var_66_12, var_66_12)
					end
				end

				arg_63_1.var_.actorSpriteComps10059 = nil
			end

			local var_66_13 = arg_63_1.actors_["1061"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.actorSpriteComps1061 == nil then
				arg_63_1.var_.actorSpriteComps1061 = var_66_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_15 = 0.034

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.actorSpriteComps1061 then
					for iter_66_5, iter_66_6 in pairs(arg_63_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_66_6 then
							local var_66_17 = Mathf.Lerp(iter_66_6.color.r, 0.5, var_66_16)

							iter_66_6.color = Color.New(var_66_17, var_66_17, var_66_17)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps1061 then
				local var_66_18 = 0.5

				for iter_66_7, iter_66_8 in pairs(arg_63_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_66_8 then
						iter_66_8.color = Color.New(var_66_18, var_66_18, var_66_18)
					end
				end

				arg_63_1.var_.actorSpriteComps1061 = nil
			end

			local var_66_19 = 0
			local var_66_20 = 0.1

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_21 = arg_63_1:FormatText(StoryNameCfg[596].name)

				arg_63_1.leftNameTxt_.text = var_66_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_22 = arg_63_1:GetWordFromCfg(410211016)
				local var_66_23 = arg_63_1:FormatText(var_66_22.content)

				arg_63_1.text_.text = var_66_23

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_24 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211016", "story_v_out_410211.awb") ~= 0 then
					local var_66_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211016", "story_v_out_410211.awb") / 1000

					if var_66_27 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_19
					end

					if var_66_22.prefab_name ~= "" and arg_63_1.actors_[var_66_22.prefab_name] ~= nil then
						local var_66_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_22.prefab_name].transform, "story_v_out_410211", "410211016", "story_v_out_410211.awb")

						arg_63_1:RecordAudio("410211016", var_66_28)
						arg_63_1:RecordAudio("410211016", var_66_28)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410211", "410211016", "story_v_out_410211.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410211", "410211016", "story_v_out_410211.awb")
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
	Play410211017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410211017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play410211018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10059"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos10059 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("10059", 7)

				local var_70_2 = var_70_0.childCount

				for iter_70_0 = 0, var_70_2 - 1 do
					local var_70_3 = var_70_0:GetChild(iter_70_0)

					if var_70_3.name == "" or not string.find(var_70_3.name, "split") then
						var_70_3.gameObject:SetActive(true)
					else
						var_70_3.gameObject:SetActive(false)
					end
				end
			end

			local var_70_4 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_1) / var_70_4
				local var_70_6 = Vector3.New(0, -2000, 35)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10059, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_70_7 = arg_67_1.actors_["1061"].transform
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 then
				arg_67_1.var_.moveOldPos1061 = var_70_7.localPosition
				var_70_7.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1061", 7)

				local var_70_9 = var_70_7.childCount

				for iter_70_1 = 0, var_70_9 - 1 do
					local var_70_10 = var_70_7:GetChild(iter_70_1)

					if var_70_10.name == "" or not string.find(var_70_10.name, "split") then
						var_70_10.gameObject:SetActive(true)
					else
						var_70_10.gameObject:SetActive(false)
					end
				end
			end

			local var_70_11 = 0.001

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_8) / var_70_11
				local var_70_13 = Vector3.New(0, -2000, 18)

				var_70_7.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1061, var_70_13, var_70_12)
			end

			if arg_67_1.time_ >= var_70_8 + var_70_11 and arg_67_1.time_ < var_70_8 + var_70_11 + arg_70_0 then
				var_70_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_70_14 = 0
			local var_70_15 = 0.525

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_16 = arg_67_1:GetWordFromCfg(410211017)
				local var_70_17 = arg_67_1:FormatText(var_70_16.content)

				arg_67_1.text_.text = var_70_17

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_18 = 21
				local var_70_19 = utf8.len(var_70_17)
				local var_70_20 = var_70_18 <= 0 and var_70_15 or var_70_15 * (var_70_19 / var_70_18)

				if var_70_20 > 0 and var_70_15 < var_70_20 then
					arg_67_1.talkMaxDuration = var_70_20

					if var_70_20 + var_70_14 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_14
					end
				end

				arg_67_1.text_.text = var_70_17
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_21 = math.max(var_70_15, arg_67_1.talkMaxDuration)

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_21 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_14) / var_70_21

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_14 + var_70_21 and arg_67_1.time_ < var_70_14 + var_70_21 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410211018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410211018
		arg_71_1.duration_ = 4.166

		local var_71_0 = {
			ja = 4.166,
			CriLanguages = 3.333,
			zh = 3.333
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
				arg_71_0:Play410211019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10059"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos10059 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("10059", 4)

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
				local var_74_6 = Vector3.New(390, -530, 35)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10059, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_74_7 = arg_71_1.actors_["10059"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps10059 == nil then
				arg_71_1.var_.actorSpriteComps10059 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps10059 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps10059 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps10059 = nil
			end

			local var_74_13 = arg_71_1.actors_["1061"].transform
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1.var_.moveOldPos1061 = var_74_13.localPosition
				var_74_13.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1061", 2)

				local var_74_15 = var_74_13.childCount

				for iter_74_5 = 0, var_74_15 - 1 do
					local var_74_16 = var_74_13:GetChild(iter_74_5)

					if var_74_16.name == "" or not string.find(var_74_16.name, "split") then
						var_74_16.gameObject:SetActive(true)
					else
						var_74_16.gameObject:SetActive(false)
					end
				end
			end

			local var_74_17 = 0.001

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_14) / var_74_17
				local var_74_19 = Vector3.New(-390, -490, 18)

				var_74_13.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1061, var_74_19, var_74_18)
			end

			if arg_71_1.time_ >= var_74_14 + var_74_17 and arg_71_1.time_ < var_74_14 + var_74_17 + arg_74_0 then
				var_74_13.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_74_20 = arg_71_1.actors_["1061"]
			local var_74_21 = 0

			if var_74_21 < arg_71_1.time_ and arg_71_1.time_ <= var_74_21 + arg_74_0 and arg_71_1.var_.actorSpriteComps1061 == nil then
				arg_71_1.var_.actorSpriteComps1061 = var_74_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_22 = 0.034

			if var_74_21 <= arg_71_1.time_ and arg_71_1.time_ < var_74_21 + var_74_22 then
				local var_74_23 = (arg_71_1.time_ - var_74_21) / var_74_22

				if arg_71_1.var_.actorSpriteComps1061 then
					for iter_74_6, iter_74_7 in pairs(arg_71_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_74_7 then
							local var_74_24 = Mathf.Lerp(iter_74_7.color.r, 0.5, var_74_23)

							iter_74_7.color = Color.New(var_74_24, var_74_24, var_74_24)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_21 + var_74_22 and arg_71_1.time_ < var_74_21 + var_74_22 + arg_74_0 and arg_71_1.var_.actorSpriteComps1061 then
				local var_74_25 = 0.5

				for iter_74_8, iter_74_9 in pairs(arg_71_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_74_9 then
						iter_74_9.color = Color.New(var_74_25, var_74_25, var_74_25)
					end
				end

				arg_71_1.var_.actorSpriteComps1061 = nil
			end

			local var_74_26 = 0
			local var_74_27 = 0.35

			if var_74_26 < arg_71_1.time_ and arg_71_1.time_ <= var_74_26 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_28 = arg_71_1:FormatText(StoryNameCfg[596].name)

				arg_71_1.leftNameTxt_.text = var_74_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_29 = arg_71_1:GetWordFromCfg(410211018)
				local var_74_30 = arg_71_1:FormatText(var_74_29.content)

				arg_71_1.text_.text = var_74_30

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_31 = 14
				local var_74_32 = utf8.len(var_74_30)
				local var_74_33 = var_74_31 <= 0 and var_74_27 or var_74_27 * (var_74_32 / var_74_31)

				if var_74_33 > 0 and var_74_27 < var_74_33 then
					arg_71_1.talkMaxDuration = var_74_33

					if var_74_33 + var_74_26 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_33 + var_74_26
					end
				end

				arg_71_1.text_.text = var_74_30
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211018", "story_v_out_410211.awb") ~= 0 then
					local var_74_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211018", "story_v_out_410211.awb") / 1000

					if var_74_34 + var_74_26 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_34 + var_74_26
					end

					if var_74_29.prefab_name ~= "" and arg_71_1.actors_[var_74_29.prefab_name] ~= nil then
						local var_74_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_29.prefab_name].transform, "story_v_out_410211", "410211018", "story_v_out_410211.awb")

						arg_71_1:RecordAudio("410211018", var_74_35)
						arg_71_1:RecordAudio("410211018", var_74_35)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410211", "410211018", "story_v_out_410211.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410211", "410211018", "story_v_out_410211.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_36 = math.max(var_74_27, arg_71_1.talkMaxDuration)

			if var_74_26 <= arg_71_1.time_ and arg_71_1.time_ < var_74_26 + var_74_36 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_26) / var_74_36

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_26 + var_74_36 and arg_71_1.time_ < var_74_26 + var_74_36 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410211019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410211019
		arg_75_1.duration_ = 12.5

		local var_75_0 = {
			ja = 12.5,
			CriLanguages = 8,
			zh = 8
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
				arg_75_0:Play410211020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = "ST64a"

			if arg_75_1.bgs_[var_78_0] == nil then
				local var_78_1 = Object.Instantiate(arg_75_1.paintGo_)

				var_78_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_78_0)
				var_78_1.name = var_78_0
				var_78_1.transform.parent = arg_75_1.stage_.transform
				var_78_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.bgs_[var_78_0] = var_78_1
			end

			local var_78_2 = 2

			if var_78_2 < arg_75_1.time_ and arg_75_1.time_ <= var_78_2 + arg_78_0 then
				local var_78_3 = manager.ui.mainCamera.transform.localPosition
				local var_78_4 = Vector3.New(0, 0, 10) + Vector3.New(var_78_3.x, var_78_3.y, 0)
				local var_78_5 = arg_75_1.bgs_.ST64a

				var_78_5.transform.localPosition = var_78_4
				var_78_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_78_6 = var_78_5:GetComponent("SpriteRenderer")

				if var_78_6 and var_78_6.sprite then
					local var_78_7 = (var_78_5.transform.localPosition - var_78_3).z
					local var_78_8 = manager.ui.mainCameraCom_
					local var_78_9 = 2 * var_78_7 * Mathf.Tan(var_78_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_78_10 = var_78_9 * var_78_8.aspect
					local var_78_11 = var_78_6.sprite.bounds.size.x
					local var_78_12 = var_78_6.sprite.bounds.size.y
					local var_78_13 = var_78_10 / var_78_11
					local var_78_14 = var_78_9 / var_78_12
					local var_78_15 = var_78_14 < var_78_13 and var_78_13 or var_78_14

					var_78_5.transform.localScale = Vector3.New(var_78_15, var_78_15, 0)
				end

				for iter_78_0, iter_78_1 in pairs(arg_75_1.bgs_) do
					if iter_78_0 ~= "ST64a" then
						iter_78_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_17 = 2

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Color.New(0, 0, 0)

				var_78_19.a = Mathf.Lerp(0, 1, var_78_18)
				arg_75_1.mask_.color = var_78_19
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				local var_78_20 = Color.New(0, 0, 0)

				var_78_20.a = 1
				arg_75_1.mask_.color = var_78_20
			end

			local var_78_21 = 2

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_22 = 2

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_21) / var_78_22
				local var_78_24 = Color.New(0, 0, 0)

				var_78_24.a = Mathf.Lerp(1, 0, var_78_23)
				arg_75_1.mask_.color = var_78_24
			end

			if arg_75_1.time_ >= var_78_21 + var_78_22 and arg_75_1.time_ < var_78_21 + var_78_22 + arg_78_0 then
				local var_78_25 = Color.New(0, 0, 0)
				local var_78_26 = 0

				arg_75_1.mask_.enabled = false
				var_78_25.a = var_78_26
				arg_75_1.mask_.color = var_78_25
			end

			local var_78_27 = arg_75_1.actors_["1061"].transform
			local var_78_28 = 4

			if var_78_28 < arg_75_1.time_ and arg_75_1.time_ <= var_78_28 + arg_78_0 then
				arg_75_1.var_.moveOldPos1061 = var_78_27.localPosition
				var_78_27.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1061", 3)

				local var_78_29 = var_78_27.childCount

				for iter_78_2 = 0, var_78_29 - 1 do
					local var_78_30 = var_78_27:GetChild(iter_78_2)

					if var_78_30.name == "" or not string.find(var_78_30.name, "split") then
						var_78_30.gameObject:SetActive(true)
					else
						var_78_30.gameObject:SetActive(false)
					end
				end
			end

			local var_78_31 = 0.001

			if var_78_28 <= arg_75_1.time_ and arg_75_1.time_ < var_78_28 + var_78_31 then
				local var_78_32 = (arg_75_1.time_ - var_78_28) / var_78_31
				local var_78_33 = Vector3.New(0, -490, 18)

				var_78_27.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1061, var_78_33, var_78_32)
			end

			if arg_75_1.time_ >= var_78_28 + var_78_31 and arg_75_1.time_ < var_78_28 + var_78_31 + arg_78_0 then
				var_78_27.localPosition = Vector3.New(0, -490, 18)
			end

			local var_78_34 = arg_75_1.actors_["1061"]
			local var_78_35 = 4

			if var_78_35 < arg_75_1.time_ and arg_75_1.time_ <= var_78_35 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 == nil then
				arg_75_1.var_.actorSpriteComps1061 = var_78_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_36 = 0.034

			if var_78_35 <= arg_75_1.time_ and arg_75_1.time_ < var_78_35 + var_78_36 then
				local var_78_37 = (arg_75_1.time_ - var_78_35) / var_78_36

				if arg_75_1.var_.actorSpriteComps1061 then
					for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_78_4 then
							local var_78_38 = Mathf.Lerp(iter_78_4.color.r, 1, var_78_37)

							iter_78_4.color = Color.New(var_78_38, var_78_38, var_78_38)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_35 + var_78_36 and arg_75_1.time_ < var_78_35 + var_78_36 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 then
				local var_78_39 = 1

				for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_78_6 then
						iter_78_6.color = Color.New(var_78_39, var_78_39, var_78_39)
					end
				end

				arg_75_1.var_.actorSpriteComps1061 = nil
			end

			local var_78_40 = arg_75_1.actors_["10059"].transform
			local var_78_41 = 2

			if var_78_41 < arg_75_1.time_ and arg_75_1.time_ <= var_78_41 + arg_78_0 then
				arg_75_1.var_.moveOldPos10059 = var_78_40.localPosition
				var_78_40.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10059", 7)

				local var_78_42 = var_78_40.childCount

				for iter_78_7 = 0, var_78_42 - 1 do
					local var_78_43 = var_78_40:GetChild(iter_78_7)

					if var_78_43.name == "" or not string.find(var_78_43.name, "split") then
						var_78_43.gameObject:SetActive(true)
					else
						var_78_43.gameObject:SetActive(false)
					end
				end
			end

			local var_78_44 = 0.001

			if var_78_41 <= arg_75_1.time_ and arg_75_1.time_ < var_78_41 + var_78_44 then
				local var_78_45 = (arg_75_1.time_ - var_78_41) / var_78_44
				local var_78_46 = Vector3.New(0, -2000, 18)

				var_78_40.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10059, var_78_46, var_78_45)
			end

			if arg_75_1.time_ >= var_78_41 + var_78_44 and arg_75_1.time_ < var_78_41 + var_78_44 + arg_78_0 then
				var_78_40.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_78_47 = arg_75_1.actors_["1061"].transform
			local var_78_48 = 2

			if var_78_48 < arg_75_1.time_ and arg_75_1.time_ <= var_78_48 + arg_78_0 then
				arg_75_1.var_.moveOldPos1061 = var_78_47.localPosition
				var_78_47.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1061", 7)

				local var_78_49 = var_78_47.childCount

				for iter_78_8 = 0, var_78_49 - 1 do
					local var_78_50 = var_78_47:GetChild(iter_78_8)

					if var_78_50.name == "" or not string.find(var_78_50.name, "split") then
						var_78_50.gameObject:SetActive(true)
					else
						var_78_50.gameObject:SetActive(false)
					end
				end
			end

			local var_78_51 = 0.001

			if var_78_48 <= arg_75_1.time_ and arg_75_1.time_ < var_78_48 + var_78_51 then
				local var_78_52 = (arg_75_1.time_ - var_78_48) / var_78_51
				local var_78_53 = Vector3.New(0, -2000, 18)

				var_78_47.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1061, var_78_53, var_78_52)
			end

			if arg_75_1.time_ >= var_78_48 + var_78_51 and arg_75_1.time_ < var_78_48 + var_78_51 + arg_78_0 then
				var_78_47.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_78_54 = 2

			if var_78_54 < arg_75_1.time_ and arg_75_1.time_ <= var_78_54 + arg_78_0 then
				arg_75_1.screenFilterGo_:SetActive(true)

				arg_75_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_78_55 = 0.0166666666666667

			if var_78_54 <= arg_75_1.time_ and arg_75_1.time_ < var_78_54 + var_78_55 then
				local var_78_56 = (arg_75_1.time_ - var_78_54) / var_78_55

				arg_75_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_78_56)
			end

			if arg_75_1.time_ >= var_78_54 + var_78_55 and arg_75_1.time_ < var_78_54 + var_78_55 + arg_78_0 then
				arg_75_1.screenFilterEffect_.weight = 1
			end

			if arg_75_1.frameCnt_ <= 1 then
				arg_75_1.dialog_:SetActive(false)
			end

			local var_78_57 = 4
			local var_78_58 = 0.475

			if var_78_57 < arg_75_1.time_ and arg_75_1.time_ <= var_78_57 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				arg_75_1.dialog_:SetActive(true)

				local var_78_59 = LeanTween.value(arg_75_1.dialog_, 0, 1, 0.3)

				var_78_59:setOnUpdate(LuaHelper.FloatAction(function(arg_79_0)
					arg_75_1.dialogCg_.alpha = arg_79_0
				end))
				var_78_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_75_1.dialog_)
					var_78_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_75_1.duration_ = arg_75_1.duration_ + 0.3

				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_60 = arg_75_1:FormatText(StoryNameCfg[612].name)

				arg_75_1.leftNameTxt_.text = var_78_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_61 = arg_75_1:GetWordFromCfg(410211019)
				local var_78_62 = arg_75_1:FormatText(var_78_61.content)

				arg_75_1.text_.text = var_78_62

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_63 = 19
				local var_78_64 = utf8.len(var_78_62)
				local var_78_65 = var_78_63 <= 0 and var_78_58 or var_78_58 * (var_78_64 / var_78_63)

				if var_78_65 > 0 and var_78_58 < var_78_65 then
					arg_75_1.talkMaxDuration = var_78_65
					var_78_57 = var_78_57 + 0.3

					if var_78_65 + var_78_57 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_65 + var_78_57
					end
				end

				arg_75_1.text_.text = var_78_62
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211019", "story_v_out_410211.awb") ~= 0 then
					local var_78_66 = manager.audio:GetVoiceLength("story_v_out_410211", "410211019", "story_v_out_410211.awb") / 1000

					if var_78_66 + var_78_57 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_66 + var_78_57
					end

					if var_78_61.prefab_name ~= "" and arg_75_1.actors_[var_78_61.prefab_name] ~= nil then
						local var_78_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_61.prefab_name].transform, "story_v_out_410211", "410211019", "story_v_out_410211.awb")

						arg_75_1:RecordAudio("410211019", var_78_67)
						arg_75_1:RecordAudio("410211019", var_78_67)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410211", "410211019", "story_v_out_410211.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410211", "410211019", "story_v_out_410211.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_68 = var_78_57 + 0.3
			local var_78_69 = math.max(var_78_58, arg_75_1.talkMaxDuration)

			if var_78_68 <= arg_75_1.time_ and arg_75_1.time_ < var_78_68 + var_78_69 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_68) / var_78_69

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_68 + var_78_69 and arg_75_1.time_ < var_78_68 + var_78_69 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410211020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 410211020
		arg_81_1.duration_ = 8.6

		local var_81_0 = {
			ja = 6.166,
			CriLanguages = 8.6,
			zh = 8.6
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
				arg_81_0:Play410211021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[612].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(410211020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 40
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211020", "story_v_out_410211.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_410211", "410211020", "story_v_out_410211.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_410211", "410211020", "story_v_out_410211.awb")

						arg_81_1:RecordAudio("410211020", var_84_9)
						arg_81_1:RecordAudio("410211020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_410211", "410211020", "story_v_out_410211.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_410211", "410211020", "story_v_out_410211.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play410211021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 410211021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play410211022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1061"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.actorSpriteComps1061 == nil then
				arg_85_1.var_.actorSpriteComps1061 = var_88_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_2 = 0.034

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.actorSpriteComps1061 then
					for iter_88_0, iter_88_1 in pairs(arg_85_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_88_1 then
							local var_88_4 = Mathf.Lerp(iter_88_1.color.r, 0.5, var_88_3)

							iter_88_1.color = Color.New(var_88_4, var_88_4, var_88_4)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.actorSpriteComps1061 then
				local var_88_5 = 0.5

				for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_88_3 then
						iter_88_3.color = Color.New(var_88_5, var_88_5, var_88_5)
					end
				end

				arg_85_1.var_.actorSpriteComps1061 = nil
			end

			local var_88_6 = 0
			local var_88_7 = 0.8

			if var_88_6 < arg_85_1.time_ and arg_85_1.time_ <= var_88_6 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_8 = arg_85_1:GetWordFromCfg(410211021)
				local var_88_9 = arg_85_1:FormatText(var_88_8.content)

				arg_85_1.text_.text = var_88_9

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_10 = 32
				local var_88_11 = utf8.len(var_88_9)
				local var_88_12 = var_88_10 <= 0 and var_88_7 or var_88_7 * (var_88_11 / var_88_10)

				if var_88_12 > 0 and var_88_7 < var_88_12 then
					arg_85_1.talkMaxDuration = var_88_12

					if var_88_12 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_12 + var_88_6
					end
				end

				arg_85_1.text_.text = var_88_9
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_13 = math.max(var_88_7, arg_85_1.talkMaxDuration)

			if var_88_6 <= arg_85_1.time_ and arg_85_1.time_ < var_88_6 + var_88_13 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_6) / var_88_13

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_6 + var_88_13 and arg_85_1.time_ < var_88_6 + var_88_13 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play410211022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 410211022
		arg_89_1.duration_ = 9.866

		local var_89_0 = {
			ja = 8.8,
			CriLanguages = 9.866,
			zh = 9.866
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
				arg_89_0:Play410211023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1061"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1061 = var_92_0.localPosition
				var_92_0.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("1061", 3)

				local var_92_2 = var_92_0.childCount

				for iter_92_0 = 0, var_92_2 - 1 do
					local var_92_3 = var_92_0:GetChild(iter_92_0)

					if var_92_3.name == "" or not string.find(var_92_3.name, "split") then
						var_92_3.gameObject:SetActive(true)
					else
						var_92_3.gameObject:SetActive(false)
					end
				end
			end

			local var_92_4 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_4 then
				local var_92_5 = (arg_89_1.time_ - var_92_1) / var_92_4
				local var_92_6 = Vector3.New(0, -490, 18)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1061, var_92_6, var_92_5)
			end

			if arg_89_1.time_ >= var_92_1 + var_92_4 and arg_89_1.time_ < var_92_1 + var_92_4 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_92_7 = arg_89_1.actors_["1061"]
			local var_92_8 = 0

			if var_92_8 < arg_89_1.time_ and arg_89_1.time_ <= var_92_8 + arg_92_0 and arg_89_1.var_.actorSpriteComps1061 == nil then
				arg_89_1.var_.actorSpriteComps1061 = var_92_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_9 = 0.034

			if var_92_8 <= arg_89_1.time_ and arg_89_1.time_ < var_92_8 + var_92_9 then
				local var_92_10 = (arg_89_1.time_ - var_92_8) / var_92_9

				if arg_89_1.var_.actorSpriteComps1061 then
					for iter_92_1, iter_92_2 in pairs(arg_89_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_92_2 then
							local var_92_11 = Mathf.Lerp(iter_92_2.color.r, 1, var_92_10)

							iter_92_2.color = Color.New(var_92_11, var_92_11, var_92_11)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_8 + var_92_9 and arg_89_1.time_ < var_92_8 + var_92_9 + arg_92_0 and arg_89_1.var_.actorSpriteComps1061 then
				local var_92_12 = 1

				for iter_92_3, iter_92_4 in pairs(arg_89_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_92_4 then
						iter_92_4.color = Color.New(var_92_12, var_92_12, var_92_12)
					end
				end

				arg_89_1.var_.actorSpriteComps1061 = nil
			end

			local var_92_13 = 0
			local var_92_14 = 1.175

			if var_92_13 < arg_89_1.time_ and arg_89_1.time_ <= var_92_13 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_15 = arg_89_1:FormatText(StoryNameCfg[612].name)

				arg_89_1.leftNameTxt_.text = var_92_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_16 = arg_89_1:GetWordFromCfg(410211022)
				local var_92_17 = arg_89_1:FormatText(var_92_16.content)

				arg_89_1.text_.text = var_92_17

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_18 = 47
				local var_92_19 = utf8.len(var_92_17)
				local var_92_20 = var_92_18 <= 0 and var_92_14 or var_92_14 * (var_92_19 / var_92_18)

				if var_92_20 > 0 and var_92_14 < var_92_20 then
					arg_89_1.talkMaxDuration = var_92_20

					if var_92_20 + var_92_13 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_13
					end
				end

				arg_89_1.text_.text = var_92_17
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211022", "story_v_out_410211.awb") ~= 0 then
					local var_92_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211022", "story_v_out_410211.awb") / 1000

					if var_92_21 + var_92_13 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_21 + var_92_13
					end

					if var_92_16.prefab_name ~= "" and arg_89_1.actors_[var_92_16.prefab_name] ~= nil then
						local var_92_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_16.prefab_name].transform, "story_v_out_410211", "410211022", "story_v_out_410211.awb")

						arg_89_1:RecordAudio("410211022", var_92_22)
						arg_89_1:RecordAudio("410211022", var_92_22)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_410211", "410211022", "story_v_out_410211.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_410211", "410211022", "story_v_out_410211.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_23 = math.max(var_92_14, arg_89_1.talkMaxDuration)

			if var_92_13 <= arg_89_1.time_ and arg_89_1.time_ < var_92_13 + var_92_23 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_13) / var_92_23

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_13 + var_92_23 and arg_89_1.time_ < var_92_13 + var_92_23 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play410211023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 410211023
		arg_93_1.duration_ = 12.033

		local var_93_0 = {
			ja = 12.033,
			CriLanguages = 11.533,
			zh = 11.533
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
				arg_93_0:Play410211024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1061"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1061 = var_96_0.localPosition
				var_96_0.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("1061", 3)

				local var_96_2 = var_96_0.childCount

				for iter_96_0 = 0, var_96_2 - 1 do
					local var_96_3 = var_96_0:GetChild(iter_96_0)

					if var_96_3.name == "" or not string.find(var_96_3.name, "split") then
						var_96_3.gameObject:SetActive(true)
					else
						var_96_3.gameObject:SetActive(false)
					end
				end
			end

			local var_96_4 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_4 then
				local var_96_5 = (arg_93_1.time_ - var_96_1) / var_96_4
				local var_96_6 = Vector3.New(0, -490, 18)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1061, var_96_6, var_96_5)
			end

			if arg_93_1.time_ >= var_96_1 + var_96_4 and arg_93_1.time_ < var_96_1 + var_96_4 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_96_7 = arg_93_1.actors_["1061"]
			local var_96_8 = 0

			if var_96_8 < arg_93_1.time_ and arg_93_1.time_ <= var_96_8 + arg_96_0 and arg_93_1.var_.actorSpriteComps1061 == nil then
				arg_93_1.var_.actorSpriteComps1061 = var_96_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_9 = 0.034

			if var_96_8 <= arg_93_1.time_ and arg_93_1.time_ < var_96_8 + var_96_9 then
				local var_96_10 = (arg_93_1.time_ - var_96_8) / var_96_9

				if arg_93_1.var_.actorSpriteComps1061 then
					for iter_96_1, iter_96_2 in pairs(arg_93_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_96_2 then
							local var_96_11 = Mathf.Lerp(iter_96_2.color.r, 1, var_96_10)

							iter_96_2.color = Color.New(var_96_11, var_96_11, var_96_11)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_8 + var_96_9 and arg_93_1.time_ < var_96_8 + var_96_9 + arg_96_0 and arg_93_1.var_.actorSpriteComps1061 then
				local var_96_12 = 1

				for iter_96_3, iter_96_4 in pairs(arg_93_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_96_4 then
						iter_96_4.color = Color.New(var_96_12, var_96_12, var_96_12)
					end
				end

				arg_93_1.var_.actorSpriteComps1061 = nil
			end

			local var_96_13 = 0
			local var_96_14 = 1.15

			if var_96_13 < arg_93_1.time_ and arg_93_1.time_ <= var_96_13 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_15 = arg_93_1:FormatText(StoryNameCfg[612].name)

				arg_93_1.leftNameTxt_.text = var_96_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_16 = arg_93_1:GetWordFromCfg(410211023)
				local var_96_17 = arg_93_1:FormatText(var_96_16.content)

				arg_93_1.text_.text = var_96_17

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_18 = 46
				local var_96_19 = utf8.len(var_96_17)
				local var_96_20 = var_96_18 <= 0 and var_96_14 or var_96_14 * (var_96_19 / var_96_18)

				if var_96_20 > 0 and var_96_14 < var_96_20 then
					arg_93_1.talkMaxDuration = var_96_20

					if var_96_20 + var_96_13 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_20 + var_96_13
					end
				end

				arg_93_1.text_.text = var_96_17
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211023", "story_v_out_410211.awb") ~= 0 then
					local var_96_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211023", "story_v_out_410211.awb") / 1000

					if var_96_21 + var_96_13 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_21 + var_96_13
					end

					if var_96_16.prefab_name ~= "" and arg_93_1.actors_[var_96_16.prefab_name] ~= nil then
						local var_96_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_16.prefab_name].transform, "story_v_out_410211", "410211023", "story_v_out_410211.awb")

						arg_93_1:RecordAudio("410211023", var_96_22)
						arg_93_1:RecordAudio("410211023", var_96_22)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_410211", "410211023", "story_v_out_410211.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_410211", "410211023", "story_v_out_410211.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_23 = math.max(var_96_14, arg_93_1.talkMaxDuration)

			if var_96_13 <= arg_93_1.time_ and arg_93_1.time_ < var_96_13 + var_96_23 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_13) / var_96_23

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_13 + var_96_23 and arg_93_1.time_ < var_96_13 + var_96_23 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play410211024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 410211024
		arg_97_1.duration_ = 4.933

		local var_97_0 = {
			ja = 4.933,
			CriLanguages = 3.666,
			zh = 3.666
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
				arg_97_0:Play410211025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1061"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.actorSpriteComps1061 == nil then
				arg_97_1.var_.actorSpriteComps1061 = var_100_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_2 = 0.034

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.actorSpriteComps1061 then
					for iter_100_0, iter_100_1 in pairs(arg_97_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_100_1 then
							local var_100_4 = Mathf.Lerp(iter_100_1.color.r, 0.5, var_100_3)

							iter_100_1.color = Color.New(var_100_4, var_100_4, var_100_4)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.actorSpriteComps1061 then
				local var_100_5 = 0.5

				for iter_100_2, iter_100_3 in pairs(arg_97_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_100_3 then
						iter_100_3.color = Color.New(var_100_5, var_100_5, var_100_5)
					end
				end

				arg_97_1.var_.actorSpriteComps1061 = nil
			end

			local var_100_6 = 0
			local var_100_7 = 0.3

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_8 = arg_97_1:FormatText(StoryNameCfg[610].name)

				arg_97_1.leftNameTxt_.text = var_100_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10055_b")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_9 = arg_97_1:GetWordFromCfg(410211024)
				local var_100_10 = arg_97_1:FormatText(var_100_9.content)

				arg_97_1.text_.text = var_100_10

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_11 = 12
				local var_100_12 = utf8.len(var_100_10)
				local var_100_13 = var_100_11 <= 0 and var_100_7 or var_100_7 * (var_100_12 / var_100_11)

				if var_100_13 > 0 and var_100_7 < var_100_13 then
					arg_97_1.talkMaxDuration = var_100_13

					if var_100_13 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_13 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_10
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211024", "story_v_out_410211.awb") ~= 0 then
					local var_100_14 = manager.audio:GetVoiceLength("story_v_out_410211", "410211024", "story_v_out_410211.awb") / 1000

					if var_100_14 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_14 + var_100_6
					end

					if var_100_9.prefab_name ~= "" and arg_97_1.actors_[var_100_9.prefab_name] ~= nil then
						local var_100_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_9.prefab_name].transform, "story_v_out_410211", "410211024", "story_v_out_410211.awb")

						arg_97_1:RecordAudio("410211024", var_100_15)
						arg_97_1:RecordAudio("410211024", var_100_15)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_410211", "410211024", "story_v_out_410211.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_410211", "410211024", "story_v_out_410211.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_16 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_16 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_16

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_16 and arg_97_1.time_ < var_100_6 + var_100_16 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play410211025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 410211025
		arg_101_1.duration_ = 11.3

		local var_101_0 = {
			ja = 11.3,
			CriLanguages = 10.7,
			zh = 10.7
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
				arg_101_0:Play410211026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1061"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1061 = var_104_0.localPosition
				var_104_0.localScale = Vector3.New(1, 1, 1)

				arg_101_1:CheckSpriteTmpPos("1061", 3)

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
				local var_104_6 = Vector3.New(0, -490, 18)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1061, var_104_6, var_104_5)
			end

			if arg_101_1.time_ >= var_104_1 + var_104_4 and arg_101_1.time_ < var_104_1 + var_104_4 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_104_7 = arg_101_1.actors_["1061"]
			local var_104_8 = 0

			if var_104_8 < arg_101_1.time_ and arg_101_1.time_ <= var_104_8 + arg_104_0 and arg_101_1.var_.actorSpriteComps1061 == nil then
				arg_101_1.var_.actorSpriteComps1061 = var_104_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_9 = 0.034

			if var_104_8 <= arg_101_1.time_ and arg_101_1.time_ < var_104_8 + var_104_9 then
				local var_104_10 = (arg_101_1.time_ - var_104_8) / var_104_9

				if arg_101_1.var_.actorSpriteComps1061 then
					for iter_104_1, iter_104_2 in pairs(arg_101_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_104_2 then
							local var_104_11 = Mathf.Lerp(iter_104_2.color.r, 1, var_104_10)

							iter_104_2.color = Color.New(var_104_11, var_104_11, var_104_11)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_8 + var_104_9 and arg_101_1.time_ < var_104_8 + var_104_9 + arg_104_0 and arg_101_1.var_.actorSpriteComps1061 then
				local var_104_12 = 1

				for iter_104_3, iter_104_4 in pairs(arg_101_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_104_4 then
						iter_104_4.color = Color.New(var_104_12, var_104_12, var_104_12)
					end
				end

				arg_101_1.var_.actorSpriteComps1061 = nil
			end

			local var_104_13 = 0
			local var_104_14 = 1.225

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_15 = arg_101_1:FormatText(StoryNameCfg[612].name)

				arg_101_1.leftNameTxt_.text = var_104_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_16 = arg_101_1:GetWordFromCfg(410211025)
				local var_104_17 = arg_101_1:FormatText(var_104_16.content)

				arg_101_1.text_.text = var_104_17

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_18 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211025", "story_v_out_410211.awb") ~= 0 then
					local var_104_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211025", "story_v_out_410211.awb") / 1000

					if var_104_21 + var_104_13 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_21 + var_104_13
					end

					if var_104_16.prefab_name ~= "" and arg_101_1.actors_[var_104_16.prefab_name] ~= nil then
						local var_104_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_16.prefab_name].transform, "story_v_out_410211", "410211025", "story_v_out_410211.awb")

						arg_101_1:RecordAudio("410211025", var_104_22)
						arg_101_1:RecordAudio("410211025", var_104_22)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_410211", "410211025", "story_v_out_410211.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_410211", "410211025", "story_v_out_410211.awb")
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
	Play410211026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 410211026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play410211027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1061"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.actorSpriteComps1061 == nil then
				arg_105_1.var_.actorSpriteComps1061 = var_108_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_2 = 0.034

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.actorSpriteComps1061 then
					for iter_108_0, iter_108_1 in pairs(arg_105_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_108_1 then
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 0.5, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps1061 then
				local var_108_5 = 0.5

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps1061 = nil
			end

			local var_108_6 = 0
			local var_108_7 = 0.375

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

				local var_108_8 = arg_105_1:GetWordFromCfg(410211026)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 15
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
	Play410211027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 410211027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play410211028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.475

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_2 = arg_109_1:GetWordFromCfg(410211027)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 59
				local var_112_5 = utf8.len(var_112_3)
				local var_112_6 = var_112_4 <= 0 and var_112_1 or var_112_1 * (var_112_5 / var_112_4)

				if var_112_6 > 0 and var_112_1 < var_112_6 then
					arg_109_1.talkMaxDuration = var_112_6

					if var_112_6 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_6 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_3
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_7 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_7 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_7

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_7 and arg_109_1.time_ < var_112_0 + var_112_7 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play410211028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 410211028
		arg_113_1.duration_ = 16.9

		local var_113_0 = {
			ja = 16.9,
			CriLanguages = 12.233,
			zh = 12.233
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
				arg_113_0:Play410211029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1061"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos1061 = var_116_0.localPosition
				var_116_0.localScale = Vector3.New(1, 1, 1)

				arg_113_1:CheckSpriteTmpPos("1061", 3)

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
				local var_116_6 = Vector3.New(0, -490, 18)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1061, var_116_6, var_116_5)
			end

			if arg_113_1.time_ >= var_116_1 + var_116_4 and arg_113_1.time_ < var_116_1 + var_116_4 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_116_7 = arg_113_1.actors_["1061"]
			local var_116_8 = 0

			if var_116_8 < arg_113_1.time_ and arg_113_1.time_ <= var_116_8 + arg_116_0 and arg_113_1.var_.actorSpriteComps1061 == nil then
				arg_113_1.var_.actorSpriteComps1061 = var_116_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_9 = 0.034

			if var_116_8 <= arg_113_1.time_ and arg_113_1.time_ < var_116_8 + var_116_9 then
				local var_116_10 = (arg_113_1.time_ - var_116_8) / var_116_9

				if arg_113_1.var_.actorSpriteComps1061 then
					for iter_116_1, iter_116_2 in pairs(arg_113_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_116_2 then
							local var_116_11 = Mathf.Lerp(iter_116_2.color.r, 1, var_116_10)

							iter_116_2.color = Color.New(var_116_11, var_116_11, var_116_11)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_8 + var_116_9 and arg_113_1.time_ < var_116_8 + var_116_9 + arg_116_0 and arg_113_1.var_.actorSpriteComps1061 then
				local var_116_12 = 1

				for iter_116_3, iter_116_4 in pairs(arg_113_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_116_4 then
						iter_116_4.color = Color.New(var_116_12, var_116_12, var_116_12)
					end
				end

				arg_113_1.var_.actorSpriteComps1061 = nil
			end

			local var_116_13 = 0
			local var_116_14 = 1.35

			if var_116_13 < arg_113_1.time_ and arg_113_1.time_ <= var_116_13 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_15 = arg_113_1:FormatText(StoryNameCfg[612].name)

				arg_113_1.leftNameTxt_.text = var_116_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_16 = arg_113_1:GetWordFromCfg(410211028)
				local var_116_17 = arg_113_1:FormatText(var_116_16.content)

				arg_113_1.text_.text = var_116_17

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_18 = 54
				local var_116_19 = utf8.len(var_116_17)
				local var_116_20 = var_116_18 <= 0 and var_116_14 or var_116_14 * (var_116_19 / var_116_18)

				if var_116_20 > 0 and var_116_14 < var_116_20 then
					arg_113_1.talkMaxDuration = var_116_20

					if var_116_20 + var_116_13 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_13
					end
				end

				arg_113_1.text_.text = var_116_17
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211028", "story_v_out_410211.awb") ~= 0 then
					local var_116_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211028", "story_v_out_410211.awb") / 1000

					if var_116_21 + var_116_13 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_21 + var_116_13
					end

					if var_116_16.prefab_name ~= "" and arg_113_1.actors_[var_116_16.prefab_name] ~= nil then
						local var_116_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_16.prefab_name].transform, "story_v_out_410211", "410211028", "story_v_out_410211.awb")

						arg_113_1:RecordAudio("410211028", var_116_22)
						arg_113_1:RecordAudio("410211028", var_116_22)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_410211", "410211028", "story_v_out_410211.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_410211", "410211028", "story_v_out_410211.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_23 = math.max(var_116_14, arg_113_1.talkMaxDuration)

			if var_116_13 <= arg_113_1.time_ and arg_113_1.time_ < var_116_13 + var_116_23 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_13) / var_116_23

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_13 + var_116_23 and arg_113_1.time_ < var_116_13 + var_116_23 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play410211029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 410211029
		arg_117_1.duration_ = 12.066

		local var_117_0 = {
			ja = 12.066,
			CriLanguages = 11.3,
			zh = 11.3
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
				arg_117_0:Play410211030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1061"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1061 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("1061", 3)

				local var_120_2 = var_120_0.childCount

				for iter_120_0 = 0, var_120_2 - 1 do
					local var_120_3 = var_120_0:GetChild(iter_120_0)

					if var_120_3.name == "" or not string.find(var_120_3.name, "split") then
						var_120_3.gameObject:SetActive(true)
					else
						var_120_3.gameObject:SetActive(false)
					end
				end
			end

			local var_120_4 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_1) / var_120_4
				local var_120_6 = Vector3.New(0, -490, 18)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1061, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_120_7 = arg_117_1.actors_["1061"]
			local var_120_8 = 0

			if var_120_8 < arg_117_1.time_ and arg_117_1.time_ <= var_120_8 + arg_120_0 and arg_117_1.var_.actorSpriteComps1061 == nil then
				arg_117_1.var_.actorSpriteComps1061 = var_120_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_9 = 0.034

			if var_120_8 <= arg_117_1.time_ and arg_117_1.time_ < var_120_8 + var_120_9 then
				local var_120_10 = (arg_117_1.time_ - var_120_8) / var_120_9

				if arg_117_1.var_.actorSpriteComps1061 then
					for iter_120_1, iter_120_2 in pairs(arg_117_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_120_2 then
							local var_120_11 = Mathf.Lerp(iter_120_2.color.r, 1, var_120_10)

							iter_120_2.color = Color.New(var_120_11, var_120_11, var_120_11)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_8 + var_120_9 and arg_117_1.time_ < var_120_8 + var_120_9 + arg_120_0 and arg_117_1.var_.actorSpriteComps1061 then
				local var_120_12 = 1

				for iter_120_3, iter_120_4 in pairs(arg_117_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_120_4 then
						iter_120_4.color = Color.New(var_120_12, var_120_12, var_120_12)
					end
				end

				arg_117_1.var_.actorSpriteComps1061 = nil
			end

			local var_120_13 = 0
			local var_120_14 = 1.375

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_15 = arg_117_1:FormatText(StoryNameCfg[612].name)

				arg_117_1.leftNameTxt_.text = var_120_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_16 = arg_117_1:GetWordFromCfg(410211029)
				local var_120_17 = arg_117_1:FormatText(var_120_16.content)

				arg_117_1.text_.text = var_120_17

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_18 = 55
				local var_120_19 = utf8.len(var_120_17)
				local var_120_20 = var_120_18 <= 0 and var_120_14 or var_120_14 * (var_120_19 / var_120_18)

				if var_120_20 > 0 and var_120_14 < var_120_20 then
					arg_117_1.talkMaxDuration = var_120_20

					if var_120_20 + var_120_13 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_13
					end
				end

				arg_117_1.text_.text = var_120_17
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211029", "story_v_out_410211.awb") ~= 0 then
					local var_120_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211029", "story_v_out_410211.awb") / 1000

					if var_120_21 + var_120_13 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_21 + var_120_13
					end

					if var_120_16.prefab_name ~= "" and arg_117_1.actors_[var_120_16.prefab_name] ~= nil then
						local var_120_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_16.prefab_name].transform, "story_v_out_410211", "410211029", "story_v_out_410211.awb")

						arg_117_1:RecordAudio("410211029", var_120_22)
						arg_117_1:RecordAudio("410211029", var_120_22)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_410211", "410211029", "story_v_out_410211.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_410211", "410211029", "story_v_out_410211.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_23 = math.max(var_120_14, arg_117_1.talkMaxDuration)

			if var_120_13 <= arg_117_1.time_ and arg_117_1.time_ < var_120_13 + var_120_23 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_13) / var_120_23

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_13 + var_120_23 and arg_117_1.time_ < var_120_13 + var_120_23 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play410211030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410211030
		arg_121_1.duration_ = 6.066

		local var_121_0 = {
			ja = 6.066,
			CriLanguages = 3.7,
			zh = 3.7
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
				arg_121_0:Play410211031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1061"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1061 = var_124_0.localPosition
				var_124_0.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("1061", 3)

				local var_124_2 = var_124_0.childCount

				for iter_124_0 = 0, var_124_2 - 1 do
					local var_124_3 = var_124_0:GetChild(iter_124_0)

					if var_124_3.name == "split_5" or not string.find(var_124_3.name, "split") then
						var_124_3.gameObject:SetActive(true)
					else
						var_124_3.gameObject:SetActive(false)
					end
				end
			end

			local var_124_4 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_4 then
				local var_124_5 = (arg_121_1.time_ - var_124_1) / var_124_4
				local var_124_6 = Vector3.New(0, -490, 18)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1061, var_124_6, var_124_5)
			end

			if arg_121_1.time_ >= var_124_1 + var_124_4 and arg_121_1.time_ < var_124_1 + var_124_4 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_124_7 = arg_121_1.actors_["1061"]
			local var_124_8 = 0

			if var_124_8 < arg_121_1.time_ and arg_121_1.time_ <= var_124_8 + arg_124_0 and arg_121_1.var_.actorSpriteComps1061 == nil then
				arg_121_1.var_.actorSpriteComps1061 = var_124_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_9 = 0.034

			if var_124_8 <= arg_121_1.time_ and arg_121_1.time_ < var_124_8 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_8) / var_124_9

				if arg_121_1.var_.actorSpriteComps1061 then
					for iter_124_1, iter_124_2 in pairs(arg_121_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_124_2 then
							local var_124_11 = Mathf.Lerp(iter_124_2.color.r, 1, var_124_10)

							iter_124_2.color = Color.New(var_124_11, var_124_11, var_124_11)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_8 + var_124_9 and arg_121_1.time_ < var_124_8 + var_124_9 + arg_124_0 and arg_121_1.var_.actorSpriteComps1061 then
				local var_124_12 = 1

				for iter_124_3, iter_124_4 in pairs(arg_121_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_124_4 then
						iter_124_4.color = Color.New(var_124_12, var_124_12, var_124_12)
					end
				end

				arg_121_1.var_.actorSpriteComps1061 = nil
			end

			local var_124_13 = 0
			local var_124_14 = 0.525

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_15 = arg_121_1:FormatText(StoryNameCfg[612].name)

				arg_121_1.leftNameTxt_.text = var_124_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_16 = arg_121_1:GetWordFromCfg(410211030)
				local var_124_17 = arg_121_1:FormatText(var_124_16.content)

				arg_121_1.text_.text = var_124_17

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_18 = 21
				local var_124_19 = utf8.len(var_124_17)
				local var_124_20 = var_124_18 <= 0 and var_124_14 or var_124_14 * (var_124_19 / var_124_18)

				if var_124_20 > 0 and var_124_14 < var_124_20 then
					arg_121_1.talkMaxDuration = var_124_20

					if var_124_20 + var_124_13 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_20 + var_124_13
					end
				end

				arg_121_1.text_.text = var_124_17
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211030", "story_v_out_410211.awb") ~= 0 then
					local var_124_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211030", "story_v_out_410211.awb") / 1000

					if var_124_21 + var_124_13 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_21 + var_124_13
					end

					if var_124_16.prefab_name ~= "" and arg_121_1.actors_[var_124_16.prefab_name] ~= nil then
						local var_124_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_16.prefab_name].transform, "story_v_out_410211", "410211030", "story_v_out_410211.awb")

						arg_121_1:RecordAudio("410211030", var_124_22)
						arg_121_1:RecordAudio("410211030", var_124_22)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_410211", "410211030", "story_v_out_410211.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_410211", "410211030", "story_v_out_410211.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_23 = math.max(var_124_14, arg_121_1.talkMaxDuration)

			if var_124_13 <= arg_121_1.time_ and arg_121_1.time_ < var_124_13 + var_124_23 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_13) / var_124_23

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_13 + var_124_23 and arg_121_1.time_ < var_124_13 + var_124_23 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play410211031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410211031
		arg_125_1.duration_ = 8.633

		local var_125_0 = {
			ja = 8.633,
			CriLanguages = 8.366,
			zh = 8.366
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
				arg_125_0:Play410211032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = "10063"

			if arg_125_1.actors_[var_128_0] == nil then
				local var_128_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_128_0), arg_125_1.canvasGo_.transform)

				var_128_1.transform:SetSiblingIndex(1)

				var_128_1.name = var_128_0
				var_128_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_125_1.actors_[var_128_0] = var_128_1
			end

			local var_128_2 = arg_125_1.actors_["10063"].transform
			local var_128_3 = 0

			if var_128_3 < arg_125_1.time_ and arg_125_1.time_ <= var_128_3 + arg_128_0 then
				arg_125_1.var_.moveOldPos10063 = var_128_2.localPosition
				var_128_2.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10063", 3)

				local var_128_4 = var_128_2.childCount

				for iter_128_0 = 0, var_128_4 - 1 do
					local var_128_5 = var_128_2:GetChild(iter_128_0)

					if var_128_5.name == "" or not string.find(var_128_5.name, "split") then
						var_128_5.gameObject:SetActive(true)
					else
						var_128_5.gameObject:SetActive(false)
					end
				end
			end

			local var_128_6 = 0.001

			if var_128_3 <= arg_125_1.time_ and arg_125_1.time_ < var_128_3 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_3) / var_128_6
				local var_128_8 = Vector3.New(0, -535, -105)

				var_128_2.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10063, var_128_8, var_128_7)
			end

			if arg_125_1.time_ >= var_128_3 + var_128_6 and arg_125_1.time_ < var_128_3 + var_128_6 + arg_128_0 then
				var_128_2.localPosition = Vector3.New(0, -535, -105)
			end

			local var_128_9 = arg_125_1.actors_["10063"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and arg_125_1.var_.actorSpriteComps10063 == nil then
				arg_125_1.var_.actorSpriteComps10063 = var_128_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_11 = 0.034

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.actorSpriteComps10063 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_128_2 then
							local var_128_13 = Mathf.Lerp(iter_128_2.color.r, 1, var_128_12)

							iter_128_2.color = Color.New(var_128_13, var_128_13, var_128_13)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and arg_125_1.var_.actorSpriteComps10063 then
				local var_128_14 = 1

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_14, var_128_14, var_128_14)
					end
				end

				arg_125_1.var_.actorSpriteComps10063 = nil
			end

			local var_128_15 = arg_125_1.actors_["1061"].transform
			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.var_.moveOldPos1061 = var_128_15.localPosition
				var_128_15.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1061", 7)

				local var_128_17 = var_128_15.childCount

				for iter_128_5 = 0, var_128_17 - 1 do
					local var_128_18 = var_128_15:GetChild(iter_128_5)

					if var_128_18.name == "" or not string.find(var_128_18.name, "split") then
						var_128_18.gameObject:SetActive(true)
					else
						var_128_18.gameObject:SetActive(false)
					end
				end
			end

			local var_128_19 = 0.001

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_19 then
				local var_128_20 = (arg_125_1.time_ - var_128_16) / var_128_19
				local var_128_21 = Vector3.New(0, -2000, 18)

				var_128_15.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1061, var_128_21, var_128_20)
			end

			if arg_125_1.time_ >= var_128_16 + var_128_19 and arg_125_1.time_ < var_128_16 + var_128_19 + arg_128_0 then
				var_128_15.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_128_22 = 0
			local var_128_23 = 0.625

			if var_128_22 < arg_125_1.time_ and arg_125_1.time_ <= var_128_22 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_24 = arg_125_1:FormatText(StoryNameCfg[591].name)

				arg_125_1.leftNameTxt_.text = var_128_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_25 = arg_125_1:GetWordFromCfg(410211031)
				local var_128_26 = arg_125_1:FormatText(var_128_25.content)

				arg_125_1.text_.text = var_128_26

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_27 = 25
				local var_128_28 = utf8.len(var_128_26)
				local var_128_29 = var_128_27 <= 0 and var_128_23 or var_128_23 * (var_128_28 / var_128_27)

				if var_128_29 > 0 and var_128_23 < var_128_29 then
					arg_125_1.talkMaxDuration = var_128_29

					if var_128_29 + var_128_22 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_29 + var_128_22
					end
				end

				arg_125_1.text_.text = var_128_26
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211031", "story_v_out_410211.awb") ~= 0 then
					local var_128_30 = manager.audio:GetVoiceLength("story_v_out_410211", "410211031", "story_v_out_410211.awb") / 1000

					if var_128_30 + var_128_22 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_30 + var_128_22
					end

					if var_128_25.prefab_name ~= "" and arg_125_1.actors_[var_128_25.prefab_name] ~= nil then
						local var_128_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_25.prefab_name].transform, "story_v_out_410211", "410211031", "story_v_out_410211.awb")

						arg_125_1:RecordAudio("410211031", var_128_31)
						arg_125_1:RecordAudio("410211031", var_128_31)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410211", "410211031", "story_v_out_410211.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410211", "410211031", "story_v_out_410211.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_32 = math.max(var_128_23, arg_125_1.talkMaxDuration)

			if var_128_22 <= arg_125_1.time_ and arg_125_1.time_ < var_128_22 + var_128_32 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_22) / var_128_32

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_22 + var_128_32 and arg_125_1.time_ < var_128_22 + var_128_32 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410211032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410211032
		arg_129_1.duration_ = 2.266

		local var_129_0 = {
			ja = 2.266,
			CriLanguages = 1.2,
			zh = 1.2
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
				arg_129_0:Play410211033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1061"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1061 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("1061", 3)

				local var_132_2 = var_132_0.childCount

				for iter_132_0 = 0, var_132_2 - 1 do
					local var_132_3 = var_132_0:GetChild(iter_132_0)

					if var_132_3.name == "split_2" or not string.find(var_132_3.name, "split") then
						var_132_3.gameObject:SetActive(true)
					else
						var_132_3.gameObject:SetActive(false)
					end
				end
			end

			local var_132_4 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_1) / var_132_4
				local var_132_6 = Vector3.New(0, -490, 18)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1061, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_132_7 = arg_129_1.actors_["1061"]
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 and arg_129_1.var_.actorSpriteComps1061 == nil then
				arg_129_1.var_.actorSpriteComps1061 = var_132_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_9 = 0.034

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_9 then
				local var_132_10 = (arg_129_1.time_ - var_132_8) / var_132_9

				if arg_129_1.var_.actorSpriteComps1061 then
					for iter_132_1, iter_132_2 in pairs(arg_129_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_132_2 then
							local var_132_11 = Mathf.Lerp(iter_132_2.color.r, 1, var_132_10)

							iter_132_2.color = Color.New(var_132_11, var_132_11, var_132_11)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_8 + var_132_9 and arg_129_1.time_ < var_132_8 + var_132_9 + arg_132_0 and arg_129_1.var_.actorSpriteComps1061 then
				local var_132_12 = 1

				for iter_132_3, iter_132_4 in pairs(arg_129_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_132_4 then
						iter_132_4.color = Color.New(var_132_12, var_132_12, var_132_12)
					end
				end

				arg_129_1.var_.actorSpriteComps1061 = nil
			end

			local var_132_13 = arg_129_1.actors_["10063"].transform
			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1.var_.moveOldPos10063 = var_132_13.localPosition
				var_132_13.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10063", 7)

				local var_132_15 = var_132_13.childCount

				for iter_132_5 = 0, var_132_15 - 1 do
					local var_132_16 = var_132_13:GetChild(iter_132_5)

					if var_132_16.name == "" or not string.find(var_132_16.name, "split") then
						var_132_16.gameObject:SetActive(true)
					else
						var_132_16.gameObject:SetActive(false)
					end
				end
			end

			local var_132_17 = 0.001

			if var_132_14 <= arg_129_1.time_ and arg_129_1.time_ < var_132_14 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_14) / var_132_17
				local var_132_19 = Vector3.New(0, -2000, -105)

				var_132_13.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10063, var_132_19, var_132_18)
			end

			if arg_129_1.time_ >= var_132_14 + var_132_17 and arg_129_1.time_ < var_132_14 + var_132_17 + arg_132_0 then
				var_132_13.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_132_20 = 0
			local var_132_21 = 0.1

			if var_132_20 < arg_129_1.time_ and arg_129_1.time_ <= var_132_20 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_22 = arg_129_1:FormatText(StoryNameCfg[612].name)

				arg_129_1.leftNameTxt_.text = var_132_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_23 = arg_129_1:GetWordFromCfg(410211032)
				local var_132_24 = arg_129_1:FormatText(var_132_23.content)

				arg_129_1.text_.text = var_132_24

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_25 = 4
				local var_132_26 = utf8.len(var_132_24)
				local var_132_27 = var_132_25 <= 0 and var_132_21 or var_132_21 * (var_132_26 / var_132_25)

				if var_132_27 > 0 and var_132_21 < var_132_27 then
					arg_129_1.talkMaxDuration = var_132_27

					if var_132_27 + var_132_20 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_27 + var_132_20
					end
				end

				arg_129_1.text_.text = var_132_24
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211032", "story_v_out_410211.awb") ~= 0 then
					local var_132_28 = manager.audio:GetVoiceLength("story_v_out_410211", "410211032", "story_v_out_410211.awb") / 1000

					if var_132_28 + var_132_20 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_20
					end

					if var_132_23.prefab_name ~= "" and arg_129_1.actors_[var_132_23.prefab_name] ~= nil then
						local var_132_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_23.prefab_name].transform, "story_v_out_410211", "410211032", "story_v_out_410211.awb")

						arg_129_1:RecordAudio("410211032", var_132_29)
						arg_129_1:RecordAudio("410211032", var_132_29)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_410211", "410211032", "story_v_out_410211.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_410211", "410211032", "story_v_out_410211.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_30 = math.max(var_132_21, arg_129_1.talkMaxDuration)

			if var_132_20 <= arg_129_1.time_ and arg_129_1.time_ < var_132_20 + var_132_30 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_20) / var_132_30

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_20 + var_132_30 and arg_129_1.time_ < var_132_20 + var_132_30 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play410211033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410211033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play410211034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1061"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.actorSpriteComps1061 == nil then
				arg_133_1.var_.actorSpriteComps1061 = var_136_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_2 = 0.034

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.actorSpriteComps1061 then
					for iter_136_0, iter_136_1 in pairs(arg_133_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_136_1 then
							local var_136_4 = Mathf.Lerp(iter_136_1.color.r, 0.5, var_136_3)

							iter_136_1.color = Color.New(var_136_4, var_136_4, var_136_4)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.actorSpriteComps1061 then
				local var_136_5 = 0.5

				for iter_136_2, iter_136_3 in pairs(arg_133_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_136_3 then
						iter_136_3.color = Color.New(var_136_5, var_136_5, var_136_5)
					end
				end

				arg_133_1.var_.actorSpriteComps1061 = nil
			end

			local var_136_6 = 0
			local var_136_7 = 1.05

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_8 = arg_133_1:GetWordFromCfg(410211033)
				local var_136_9 = arg_133_1:FormatText(var_136_8.content)

				arg_133_1.text_.text = var_136_9

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_10 = 42
				local var_136_11 = utf8.len(var_136_9)
				local var_136_12 = var_136_10 <= 0 and var_136_7 or var_136_7 * (var_136_11 / var_136_10)

				if var_136_12 > 0 and var_136_7 < var_136_12 then
					arg_133_1.talkMaxDuration = var_136_12

					if var_136_12 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_12 + var_136_6
					end
				end

				arg_133_1.text_.text = var_136_9
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_13 = math.max(var_136_7, arg_133_1.talkMaxDuration)

			if var_136_6 <= arg_133_1.time_ and arg_133_1.time_ < var_136_6 + var_136_13 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_6) / var_136_13

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_6 + var_136_13 and arg_133_1.time_ < var_136_6 + var_136_13 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410211034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410211034
		arg_137_1.duration_ = 12.233

		local var_137_0 = {
			ja = 12.233,
			CriLanguages = 9.933,
			zh = 9.933
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
				arg_137_0:Play410211035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1061"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1061 = var_140_0.localPosition
				var_140_0.localScale = Vector3.New(1, 1, 1)

				arg_137_1:CheckSpriteTmpPos("1061", 3)

				local var_140_2 = var_140_0.childCount

				for iter_140_0 = 0, var_140_2 - 1 do
					local var_140_3 = var_140_0:GetChild(iter_140_0)

					if var_140_3.name == "" or not string.find(var_140_3.name, "split") then
						var_140_3.gameObject:SetActive(true)
					else
						var_140_3.gameObject:SetActive(false)
					end
				end
			end

			local var_140_4 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_4 then
				local var_140_5 = (arg_137_1.time_ - var_140_1) / var_140_4
				local var_140_6 = Vector3.New(0, -490, 18)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1061, var_140_6, var_140_5)
			end

			if arg_137_1.time_ >= var_140_1 + var_140_4 and arg_137_1.time_ < var_140_1 + var_140_4 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_140_7 = arg_137_1.actors_["1061"]
			local var_140_8 = 0

			if var_140_8 < arg_137_1.time_ and arg_137_1.time_ <= var_140_8 + arg_140_0 and arg_137_1.var_.actorSpriteComps1061 == nil then
				arg_137_1.var_.actorSpriteComps1061 = var_140_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_9 = 0.034

			if var_140_8 <= arg_137_1.time_ and arg_137_1.time_ < var_140_8 + var_140_9 then
				local var_140_10 = (arg_137_1.time_ - var_140_8) / var_140_9

				if arg_137_1.var_.actorSpriteComps1061 then
					for iter_140_1, iter_140_2 in pairs(arg_137_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_140_2 then
							local var_140_11 = Mathf.Lerp(iter_140_2.color.r, 1, var_140_10)

							iter_140_2.color = Color.New(var_140_11, var_140_11, var_140_11)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_8 + var_140_9 and arg_137_1.time_ < var_140_8 + var_140_9 + arg_140_0 and arg_137_1.var_.actorSpriteComps1061 then
				local var_140_12 = 1

				for iter_140_3, iter_140_4 in pairs(arg_137_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_140_4 then
						iter_140_4.color = Color.New(var_140_12, var_140_12, var_140_12)
					end
				end

				arg_137_1.var_.actorSpriteComps1061 = nil
			end

			local var_140_13 = 0
			local var_140_14 = 0.975

			if var_140_13 < arg_137_1.time_ and arg_137_1.time_ <= var_140_13 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_15 = arg_137_1:FormatText(StoryNameCfg[612].name)

				arg_137_1.leftNameTxt_.text = var_140_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_16 = arg_137_1:GetWordFromCfg(410211034)
				local var_140_17 = arg_137_1:FormatText(var_140_16.content)

				arg_137_1.text_.text = var_140_17

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_18 = 39
				local var_140_19 = utf8.len(var_140_17)
				local var_140_20 = var_140_18 <= 0 and var_140_14 or var_140_14 * (var_140_19 / var_140_18)

				if var_140_20 > 0 and var_140_14 < var_140_20 then
					arg_137_1.talkMaxDuration = var_140_20

					if var_140_20 + var_140_13 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_13
					end
				end

				arg_137_1.text_.text = var_140_17
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211034", "story_v_out_410211.awb") ~= 0 then
					local var_140_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211034", "story_v_out_410211.awb") / 1000

					if var_140_21 + var_140_13 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_21 + var_140_13
					end

					if var_140_16.prefab_name ~= "" and arg_137_1.actors_[var_140_16.prefab_name] ~= nil then
						local var_140_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_16.prefab_name].transform, "story_v_out_410211", "410211034", "story_v_out_410211.awb")

						arg_137_1:RecordAudio("410211034", var_140_22)
						arg_137_1:RecordAudio("410211034", var_140_22)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_410211", "410211034", "story_v_out_410211.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_410211", "410211034", "story_v_out_410211.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_23 = math.max(var_140_14, arg_137_1.talkMaxDuration)

			if var_140_13 <= arg_137_1.time_ and arg_137_1.time_ < var_140_13 + var_140_23 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_13) / var_140_23

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_13 + var_140_23 and arg_137_1.time_ < var_140_13 + var_140_23 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play410211035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410211035
		arg_141_1.duration_ = 19.6

		local var_141_0 = {
			ja = 19.6,
			CriLanguages = 12.6,
			zh = 12.6
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
				arg_141_0:Play410211036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1061"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1061 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("1061", 3)

				local var_144_2 = var_144_0.childCount

				for iter_144_0 = 0, var_144_2 - 1 do
					local var_144_3 = var_144_0:GetChild(iter_144_0)

					if var_144_3.name == "" or not string.find(var_144_3.name, "split") then
						var_144_3.gameObject:SetActive(true)
					else
						var_144_3.gameObject:SetActive(false)
					end
				end
			end

			local var_144_4 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_1) / var_144_4
				local var_144_6 = Vector3.New(0, -490, 18)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1061, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_144_7 = arg_141_1.actors_["1061"]
			local var_144_8 = 0

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 and arg_141_1.var_.actorSpriteComps1061 == nil then
				arg_141_1.var_.actorSpriteComps1061 = var_144_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_9 = 0.034

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_9 then
				local var_144_10 = (arg_141_1.time_ - var_144_8) / var_144_9

				if arg_141_1.var_.actorSpriteComps1061 then
					for iter_144_1, iter_144_2 in pairs(arg_141_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_144_2 then
							local var_144_11 = Mathf.Lerp(iter_144_2.color.r, 1, var_144_10)

							iter_144_2.color = Color.New(var_144_11, var_144_11, var_144_11)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_8 + var_144_9 and arg_141_1.time_ < var_144_8 + var_144_9 + arg_144_0 and arg_141_1.var_.actorSpriteComps1061 then
				local var_144_12 = 1

				for iter_144_3, iter_144_4 in pairs(arg_141_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_144_4 then
						iter_144_4.color = Color.New(var_144_12, var_144_12, var_144_12)
					end
				end

				arg_141_1.var_.actorSpriteComps1061 = nil
			end

			local var_144_13 = 0
			local var_144_14 = 1.175

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_15 = arg_141_1:FormatText(StoryNameCfg[612].name)

				arg_141_1.leftNameTxt_.text = var_144_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_16 = arg_141_1:GetWordFromCfg(410211035)
				local var_144_17 = arg_141_1:FormatText(var_144_16.content)

				arg_141_1.text_.text = var_144_17

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_18 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211035", "story_v_out_410211.awb") ~= 0 then
					local var_144_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211035", "story_v_out_410211.awb") / 1000

					if var_144_21 + var_144_13 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_21 + var_144_13
					end

					if var_144_16.prefab_name ~= "" and arg_141_1.actors_[var_144_16.prefab_name] ~= nil then
						local var_144_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_16.prefab_name].transform, "story_v_out_410211", "410211035", "story_v_out_410211.awb")

						arg_141_1:RecordAudio("410211035", var_144_22)
						arg_141_1:RecordAudio("410211035", var_144_22)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_410211", "410211035", "story_v_out_410211.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_410211", "410211035", "story_v_out_410211.awb")
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
	Play410211036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410211036
		arg_145_1.duration_ = 6.666

		local var_145_0 = {
			ja = 6.466,
			CriLanguages = 6.666,
			zh = 6.666
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
				arg_145_0:Play410211037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = "L04i"

			if arg_145_1.bgs_[var_148_0] == nil then
				local var_148_1 = Object.Instantiate(arg_145_1.paintGo_)

				var_148_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_148_0)
				var_148_1.name = var_148_0
				var_148_1.transform.parent = arg_145_1.stage_.transform
				var_148_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_145_1.bgs_[var_148_0] = var_148_1
			end

			local var_148_2 = 2

			if var_148_2 < arg_145_1.time_ and arg_145_1.time_ <= var_148_2 + arg_148_0 then
				local var_148_3 = manager.ui.mainCamera.transform.localPosition
				local var_148_4 = Vector3.New(0, 0, 10) + Vector3.New(var_148_3.x, var_148_3.y, 0)
				local var_148_5 = arg_145_1.bgs_.L04i

				var_148_5.transform.localPosition = var_148_4
				var_148_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_148_6 = var_148_5:GetComponent("SpriteRenderer")

				if var_148_6 and var_148_6.sprite then
					local var_148_7 = (var_148_5.transform.localPosition - var_148_3).z
					local var_148_8 = manager.ui.mainCameraCom_
					local var_148_9 = 2 * var_148_7 * Mathf.Tan(var_148_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_148_10 = var_148_9 * var_148_8.aspect
					local var_148_11 = var_148_6.sprite.bounds.size.x
					local var_148_12 = var_148_6.sprite.bounds.size.y
					local var_148_13 = var_148_10 / var_148_11
					local var_148_14 = var_148_9 / var_148_12
					local var_148_15 = var_148_14 < var_148_13 and var_148_13 or var_148_14

					var_148_5.transform.localScale = Vector3.New(var_148_15, var_148_15, 0)
				end

				for iter_148_0, iter_148_1 in pairs(arg_145_1.bgs_) do
					if iter_148_0 ~= "L04i" then
						iter_148_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_148_16 = 0

			if var_148_16 < arg_145_1.time_ and arg_145_1.time_ <= var_148_16 + arg_148_0 then
				arg_145_1.mask_.enabled = true
				arg_145_1.mask_.raycastTarget = true

				arg_145_1:SetGaussion(false)
			end

			local var_148_17 = 2

			if var_148_16 <= arg_145_1.time_ and arg_145_1.time_ < var_148_16 + var_148_17 then
				local var_148_18 = (arg_145_1.time_ - var_148_16) / var_148_17
				local var_148_19 = Color.New(0, 0, 0)

				var_148_19.a = Mathf.Lerp(0, 1, var_148_18)
				arg_145_1.mask_.color = var_148_19
			end

			if arg_145_1.time_ >= var_148_16 + var_148_17 and arg_145_1.time_ < var_148_16 + var_148_17 + arg_148_0 then
				local var_148_20 = Color.New(0, 0, 0)

				var_148_20.a = 1
				arg_145_1.mask_.color = var_148_20
			end

			local var_148_21 = 2

			if var_148_21 < arg_145_1.time_ and arg_145_1.time_ <= var_148_21 + arg_148_0 then
				arg_145_1.mask_.enabled = true
				arg_145_1.mask_.raycastTarget = true

				arg_145_1:SetGaussion(false)
			end

			local var_148_22 = 2

			if var_148_21 <= arg_145_1.time_ and arg_145_1.time_ < var_148_21 + var_148_22 then
				local var_148_23 = (arg_145_1.time_ - var_148_21) / var_148_22
				local var_148_24 = Color.New(0, 0, 0)

				var_148_24.a = Mathf.Lerp(1, 0, var_148_23)
				arg_145_1.mask_.color = var_148_24
			end

			if arg_145_1.time_ >= var_148_21 + var_148_22 and arg_145_1.time_ < var_148_21 + var_148_22 + arg_148_0 then
				local var_148_25 = Color.New(0, 0, 0)
				local var_148_26 = 0

				arg_145_1.mask_.enabled = false
				var_148_25.a = var_148_26
				arg_145_1.mask_.color = var_148_25
			end

			local var_148_27 = arg_145_1.actors_["1061"].transform
			local var_148_28 = 4

			if var_148_28 < arg_145_1.time_ and arg_145_1.time_ <= var_148_28 + arg_148_0 then
				arg_145_1.var_.moveOldPos1061 = var_148_27.localPosition
				var_148_27.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("1061", 2)

				local var_148_29 = var_148_27.childCount

				for iter_148_2 = 0, var_148_29 - 1 do
					local var_148_30 = var_148_27:GetChild(iter_148_2)

					if var_148_30.name == "" or not string.find(var_148_30.name, "split") then
						var_148_30.gameObject:SetActive(true)
					else
						var_148_30.gameObject:SetActive(false)
					end
				end
			end

			local var_148_31 = 0.001

			if var_148_28 <= arg_145_1.time_ and arg_145_1.time_ < var_148_28 + var_148_31 then
				local var_148_32 = (arg_145_1.time_ - var_148_28) / var_148_31
				local var_148_33 = Vector3.New(-390, -490, 18)

				var_148_27.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1061, var_148_33, var_148_32)
			end

			if arg_145_1.time_ >= var_148_28 + var_148_31 and arg_145_1.time_ < var_148_28 + var_148_31 + arg_148_0 then
				var_148_27.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_148_34 = arg_145_1.actors_["10059"].transform
			local var_148_35 = 4

			if var_148_35 < arg_145_1.time_ and arg_145_1.time_ <= var_148_35 + arg_148_0 then
				arg_145_1.var_.moveOldPos10059 = var_148_34.localPosition
				var_148_34.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("10059", 4)

				local var_148_36 = var_148_34.childCount

				for iter_148_3 = 0, var_148_36 - 1 do
					local var_148_37 = var_148_34:GetChild(iter_148_3)

					if var_148_37.name == "" or not string.find(var_148_37.name, "split") then
						var_148_37.gameObject:SetActive(true)
					else
						var_148_37.gameObject:SetActive(false)
					end
				end
			end

			local var_148_38 = 0.001

			if var_148_35 <= arg_145_1.time_ and arg_145_1.time_ < var_148_35 + var_148_38 then
				local var_148_39 = (arg_145_1.time_ - var_148_35) / var_148_38
				local var_148_40 = Vector3.New(390, -530, 35)

				var_148_34.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos10059, var_148_40, var_148_39)
			end

			if arg_145_1.time_ >= var_148_35 + var_148_38 and arg_145_1.time_ < var_148_35 + var_148_38 + arg_148_0 then
				var_148_34.localPosition = Vector3.New(390, -530, 35)
			end

			local var_148_41 = arg_145_1.actors_["10063"].transform
			local var_148_42 = 4

			if var_148_42 < arg_145_1.time_ and arg_145_1.time_ <= var_148_42 + arg_148_0 then
				arg_145_1.var_.moveOldPos10063 = var_148_41.localPosition
				var_148_41.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("10063", 7)

				local var_148_43 = var_148_41.childCount

				for iter_148_4 = 0, var_148_43 - 1 do
					local var_148_44 = var_148_41:GetChild(iter_148_4)

					if var_148_44.name == "" or not string.find(var_148_44.name, "split") then
						var_148_44.gameObject:SetActive(true)
					else
						var_148_44.gameObject:SetActive(false)
					end
				end
			end

			local var_148_45 = 0.001

			if var_148_42 <= arg_145_1.time_ and arg_145_1.time_ < var_148_42 + var_148_45 then
				local var_148_46 = (arg_145_1.time_ - var_148_42) / var_148_45
				local var_148_47 = Vector3.New(0, -2000, -105)

				var_148_41.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos10063, var_148_47, var_148_46)
			end

			if arg_145_1.time_ >= var_148_42 + var_148_45 and arg_145_1.time_ < var_148_42 + var_148_45 + arg_148_0 then
				var_148_41.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_148_48 = arg_145_1.actors_["1061"]
			local var_148_49 = 4

			if var_148_49 < arg_145_1.time_ and arg_145_1.time_ <= var_148_49 + arg_148_0 and arg_145_1.var_.actorSpriteComps1061 == nil then
				arg_145_1.var_.actorSpriteComps1061 = var_148_48:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_50 = 0.034

			if var_148_49 <= arg_145_1.time_ and arg_145_1.time_ < var_148_49 + var_148_50 then
				local var_148_51 = (arg_145_1.time_ - var_148_49) / var_148_50

				if arg_145_1.var_.actorSpriteComps1061 then
					for iter_148_5, iter_148_6 in pairs(arg_145_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_148_6 then
							local var_148_52 = Mathf.Lerp(iter_148_6.color.r, 1, var_148_51)

							iter_148_6.color = Color.New(var_148_52, var_148_52, var_148_52)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_49 + var_148_50 and arg_145_1.time_ < var_148_49 + var_148_50 + arg_148_0 and arg_145_1.var_.actorSpriteComps1061 then
				local var_148_53 = 1

				for iter_148_7, iter_148_8 in pairs(arg_145_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_148_8 then
						iter_148_8.color = Color.New(var_148_53, var_148_53, var_148_53)
					end
				end

				arg_145_1.var_.actorSpriteComps1061 = nil
			end

			local var_148_54 = arg_145_1.actors_["10059"]
			local var_148_55 = 4

			if var_148_55 < arg_145_1.time_ and arg_145_1.time_ <= var_148_55 + arg_148_0 and arg_145_1.var_.actorSpriteComps10059 == nil then
				arg_145_1.var_.actorSpriteComps10059 = var_148_54:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_56 = 0.034

			if var_148_55 <= arg_145_1.time_ and arg_145_1.time_ < var_148_55 + var_148_56 then
				local var_148_57 = (arg_145_1.time_ - var_148_55) / var_148_56

				if arg_145_1.var_.actorSpriteComps10059 then
					for iter_148_9, iter_148_10 in pairs(arg_145_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_148_10 then
							local var_148_58 = Mathf.Lerp(iter_148_10.color.r, 0.5, var_148_57)

							iter_148_10.color = Color.New(var_148_58, var_148_58, var_148_58)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_55 + var_148_56 and arg_145_1.time_ < var_148_55 + var_148_56 + arg_148_0 and arg_145_1.var_.actorSpriteComps10059 then
				local var_148_59 = 0.5

				for iter_148_11, iter_148_12 in pairs(arg_145_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_148_12 then
						iter_148_12.color = Color.New(var_148_59, var_148_59, var_148_59)
					end
				end

				arg_145_1.var_.actorSpriteComps10059 = nil
			end

			local var_148_60 = arg_145_1.actors_["10063"]
			local var_148_61 = 4

			if var_148_61 < arg_145_1.time_ and arg_145_1.time_ <= var_148_61 + arg_148_0 and arg_145_1.var_.actorSpriteComps10063 == nil then
				arg_145_1.var_.actorSpriteComps10063 = var_148_60:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_62 = 0.034

			if var_148_61 <= arg_145_1.time_ and arg_145_1.time_ < var_148_61 + var_148_62 then
				local var_148_63 = (arg_145_1.time_ - var_148_61) / var_148_62

				if arg_145_1.var_.actorSpriteComps10063 then
					for iter_148_13, iter_148_14 in pairs(arg_145_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_148_14 then
							local var_148_64 = Mathf.Lerp(iter_148_14.color.r, 0.5, var_148_63)

							iter_148_14.color = Color.New(var_148_64, var_148_64, var_148_64)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_61 + var_148_62 and arg_145_1.time_ < var_148_61 + var_148_62 + arg_148_0 and arg_145_1.var_.actorSpriteComps10063 then
				local var_148_65 = 0.5

				for iter_148_15, iter_148_16 in pairs(arg_145_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_148_16 then
						iter_148_16.color = Color.New(var_148_65, var_148_65, var_148_65)
					end
				end

				arg_145_1.var_.actorSpriteComps10063 = nil
			end

			local var_148_66 = arg_145_1.actors_["1061"].transform
			local var_148_67 = 2

			if var_148_67 < arg_145_1.time_ and arg_145_1.time_ <= var_148_67 + arg_148_0 then
				arg_145_1.var_.moveOldPos1061 = var_148_66.localPosition
				var_148_66.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("1061", 7)

				local var_148_68 = var_148_66.childCount

				for iter_148_17 = 0, var_148_68 - 1 do
					local var_148_69 = var_148_66:GetChild(iter_148_17)

					if var_148_69.name == "" or not string.find(var_148_69.name, "split") then
						var_148_69.gameObject:SetActive(true)
					else
						var_148_69.gameObject:SetActive(false)
					end
				end
			end

			local var_148_70 = 0.001

			if var_148_67 <= arg_145_1.time_ and arg_145_1.time_ < var_148_67 + var_148_70 then
				local var_148_71 = (arg_145_1.time_ - var_148_67) / var_148_70
				local var_148_72 = Vector3.New(0, -2000, 18)

				var_148_66.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1061, var_148_72, var_148_71)
			end

			if arg_145_1.time_ >= var_148_67 + var_148_70 and arg_145_1.time_ < var_148_67 + var_148_70 + arg_148_0 then
				var_148_66.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_148_73 = 4

			if var_148_73 < arg_145_1.time_ and arg_145_1.time_ <= var_148_73 + arg_148_0 then
				arg_145_1.screenFilterGo_:SetActive(false)
			end

			local var_148_74 = 0.0166666666666667

			if var_148_73 <= arg_145_1.time_ and arg_145_1.time_ < var_148_73 + var_148_74 then
				local var_148_75 = (arg_145_1.time_ - var_148_73) / var_148_74

				arg_145_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_148_75)
			end

			if arg_145_1.time_ >= var_148_73 + var_148_74 and arg_145_1.time_ < var_148_73 + var_148_74 + arg_148_0 then
				arg_145_1.screenFilterEffect_.weight = 0
			end

			if arg_145_1.frameCnt_ <= 1 then
				arg_145_1.dialog_:SetActive(false)
			end

			local var_148_76 = 4
			local var_148_77 = 0.275

			if var_148_76 < arg_145_1.time_ and arg_145_1.time_ <= var_148_76 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0

				arg_145_1.dialog_:SetActive(true)

				local var_148_78 = LeanTween.value(arg_145_1.dialog_, 0, 1, 0.3)

				var_148_78:setOnUpdate(LuaHelper.FloatAction(function(arg_149_0)
					arg_145_1.dialogCg_.alpha = arg_149_0
				end))
				var_148_78:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_145_1.dialog_)
					var_148_78:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_145_1.duration_ = arg_145_1.duration_ + 0.3

				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_79 = arg_145_1:FormatText(StoryNameCfg[612].name)

				arg_145_1.leftNameTxt_.text = var_148_79

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_80 = arg_145_1:GetWordFromCfg(410211036)
				local var_148_81 = arg_145_1:FormatText(var_148_80.content)

				arg_145_1.text_.text = var_148_81

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_82 = 11
				local var_148_83 = utf8.len(var_148_81)
				local var_148_84 = var_148_82 <= 0 and var_148_77 or var_148_77 * (var_148_83 / var_148_82)

				if var_148_84 > 0 and var_148_77 < var_148_84 then
					arg_145_1.talkMaxDuration = var_148_84
					var_148_76 = var_148_76 + 0.3

					if var_148_84 + var_148_76 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_84 + var_148_76
					end
				end

				arg_145_1.text_.text = var_148_81
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211036", "story_v_out_410211.awb") ~= 0 then
					local var_148_85 = manager.audio:GetVoiceLength("story_v_out_410211", "410211036", "story_v_out_410211.awb") / 1000

					if var_148_85 + var_148_76 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_85 + var_148_76
					end

					if var_148_80.prefab_name ~= "" and arg_145_1.actors_[var_148_80.prefab_name] ~= nil then
						local var_148_86 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_80.prefab_name].transform, "story_v_out_410211", "410211036", "story_v_out_410211.awb")

						arg_145_1:RecordAudio("410211036", var_148_86)
						arg_145_1:RecordAudio("410211036", var_148_86)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_410211", "410211036", "story_v_out_410211.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_410211", "410211036", "story_v_out_410211.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_87 = var_148_76 + 0.3
			local var_148_88 = math.max(var_148_77, arg_145_1.talkMaxDuration)

			if var_148_87 <= arg_145_1.time_ and arg_145_1.time_ < var_148_87 + var_148_88 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_87) / var_148_88

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_87 + var_148_88 and arg_145_1.time_ < var_148_87 + var_148_88 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play410211037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410211037
		arg_151_1.duration_ = 2.833

		local var_151_0 = {
			ja = 2.833,
			CriLanguages = 1.833,
			zh = 1.833
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
				arg_151_0:Play410211038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1061"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1061 = var_154_0.localPosition
				var_154_0.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("1061", 2)

				local var_154_2 = var_154_0.childCount

				for iter_154_0 = 0, var_154_2 - 1 do
					local var_154_3 = var_154_0:GetChild(iter_154_0)

					if var_154_3.name == "" or not string.find(var_154_3.name, "split") then
						var_154_3.gameObject:SetActive(true)
					else
						var_154_3.gameObject:SetActive(false)
					end
				end
			end

			local var_154_4 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_4 then
				local var_154_5 = (arg_151_1.time_ - var_154_1) / var_154_4
				local var_154_6 = Vector3.New(-390, -490, 18)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1061, var_154_6, var_154_5)
			end

			if arg_151_1.time_ >= var_154_1 + var_154_4 and arg_151_1.time_ < var_154_1 + var_154_4 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_154_7 = arg_151_1.actors_["1061"]
			local var_154_8 = 0

			if var_154_8 < arg_151_1.time_ and arg_151_1.time_ <= var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps1061 == nil then
				arg_151_1.var_.actorSpriteComps1061 = var_154_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_9 = 0.034

			if var_154_8 <= arg_151_1.time_ and arg_151_1.time_ < var_154_8 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_8) / var_154_9

				if arg_151_1.var_.actorSpriteComps1061 then
					for iter_154_1, iter_154_2 in pairs(arg_151_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_154_2 then
							local var_154_11 = Mathf.Lerp(iter_154_2.color.r, 1, var_154_10)

							iter_154_2.color = Color.New(var_154_11, var_154_11, var_154_11)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_8 + var_154_9 and arg_151_1.time_ < var_154_8 + var_154_9 + arg_154_0 and arg_151_1.var_.actorSpriteComps1061 then
				local var_154_12 = 1

				for iter_154_3, iter_154_4 in pairs(arg_151_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_154_4 then
						iter_154_4.color = Color.New(var_154_12, var_154_12, var_154_12)
					end
				end

				arg_151_1.var_.actorSpriteComps1061 = nil
			end

			local var_154_13 = 0
			local var_154_14 = 0.15

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_15 = arg_151_1:FormatText(StoryNameCfg[612].name)

				arg_151_1.leftNameTxt_.text = var_154_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_16 = arg_151_1:GetWordFromCfg(410211037)
				local var_154_17 = arg_151_1:FormatText(var_154_16.content)

				arg_151_1.text_.text = var_154_17

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_18 = 6
				local var_154_19 = utf8.len(var_154_17)
				local var_154_20 = var_154_18 <= 0 and var_154_14 or var_154_14 * (var_154_19 / var_154_18)

				if var_154_20 > 0 and var_154_14 < var_154_20 then
					arg_151_1.talkMaxDuration = var_154_20

					if var_154_20 + var_154_13 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_20 + var_154_13
					end
				end

				arg_151_1.text_.text = var_154_17
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211037", "story_v_out_410211.awb") ~= 0 then
					local var_154_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211037", "story_v_out_410211.awb") / 1000

					if var_154_21 + var_154_13 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_21 + var_154_13
					end

					if var_154_16.prefab_name ~= "" and arg_151_1.actors_[var_154_16.prefab_name] ~= nil then
						local var_154_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_16.prefab_name].transform, "story_v_out_410211", "410211037", "story_v_out_410211.awb")

						arg_151_1:RecordAudio("410211037", var_154_22)
						arg_151_1:RecordAudio("410211037", var_154_22)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410211", "410211037", "story_v_out_410211.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410211", "410211037", "story_v_out_410211.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_23 = math.max(var_154_14, arg_151_1.talkMaxDuration)

			if var_154_13 <= arg_151_1.time_ and arg_151_1.time_ < var_154_13 + var_154_23 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_13) / var_154_23

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_13 + var_154_23 and arg_151_1.time_ < var_154_13 + var_154_23 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410211038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410211038
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play410211039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1061"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 == nil then
				arg_155_1.var_.actorSpriteComps1061 = var_158_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_2 = 0.034

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.actorSpriteComps1061 then
					for iter_158_0, iter_158_1 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_158_1 then
							local var_158_4 = Mathf.Lerp(iter_158_1.color.r, 0.5, var_158_3)

							iter_158_1.color = Color.New(var_158_4, var_158_4, var_158_4)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 then
				local var_158_5 = 0.5

				for iter_158_2, iter_158_3 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_158_3 then
						iter_158_3.color = Color.New(var_158_5, var_158_5, var_158_5)
					end
				end

				arg_155_1.var_.actorSpriteComps1061 = nil
			end

			local var_158_6 = 0
			local var_158_7 = 0.95

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_8 = arg_155_1:GetWordFromCfg(410211038)
				local var_158_9 = arg_155_1:FormatText(var_158_8.content)

				arg_155_1.text_.text = var_158_9

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_10 = 38
				local var_158_11 = utf8.len(var_158_9)
				local var_158_12 = var_158_10 <= 0 and var_158_7 or var_158_7 * (var_158_11 / var_158_10)

				if var_158_12 > 0 and var_158_7 < var_158_12 then
					arg_155_1.talkMaxDuration = var_158_12

					if var_158_12 + var_158_6 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_12 + var_158_6
					end
				end

				arg_155_1.text_.text = var_158_9
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_13 = math.max(var_158_7, arg_155_1.talkMaxDuration)

			if var_158_6 <= arg_155_1.time_ and arg_155_1.time_ < var_158_6 + var_158_13 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_6) / var_158_13

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_6 + var_158_13 and arg_155_1.time_ < var_158_6 + var_158_13 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410211039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410211039
		arg_159_1.duration_ = 3.166

		local var_159_0 = {
			ja = 3.166,
			CriLanguages = 1.633,
			zh = 1.633
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
				arg_159_0:Play410211040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10059"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos10059 = var_162_0.localPosition
				var_162_0.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("10059", 4)

				local var_162_2 = var_162_0.childCount

				for iter_162_0 = 0, var_162_2 - 1 do
					local var_162_3 = var_162_0:GetChild(iter_162_0)

					if var_162_3.name == "" or not string.find(var_162_3.name, "split") then
						var_162_3.gameObject:SetActive(true)
					else
						var_162_3.gameObject:SetActive(false)
					end
				end
			end

			local var_162_4 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_4 then
				local var_162_5 = (arg_159_1.time_ - var_162_1) / var_162_4
				local var_162_6 = Vector3.New(390, -530, 35)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10059, var_162_6, var_162_5)
			end

			if arg_159_1.time_ >= var_162_1 + var_162_4 and arg_159_1.time_ < var_162_1 + var_162_4 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_162_7 = arg_159_1.actors_["10059"]
			local var_162_8 = 0

			if var_162_8 < arg_159_1.time_ and arg_159_1.time_ <= var_162_8 + arg_162_0 and arg_159_1.var_.actorSpriteComps10059 == nil then
				arg_159_1.var_.actorSpriteComps10059 = var_162_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_9 = 0.034

			if var_162_8 <= arg_159_1.time_ and arg_159_1.time_ < var_162_8 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_8) / var_162_9

				if arg_159_1.var_.actorSpriteComps10059 then
					for iter_162_1, iter_162_2 in pairs(arg_159_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_162_2 then
							local var_162_11 = Mathf.Lerp(iter_162_2.color.r, 1, var_162_10)

							iter_162_2.color = Color.New(var_162_11, var_162_11, var_162_11)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_8 + var_162_9 and arg_159_1.time_ < var_162_8 + var_162_9 + arg_162_0 and arg_159_1.var_.actorSpriteComps10059 then
				local var_162_12 = 1

				for iter_162_3, iter_162_4 in pairs(arg_159_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_162_4 then
						iter_162_4.color = Color.New(var_162_12, var_162_12, var_162_12)
					end
				end

				arg_159_1.var_.actorSpriteComps10059 = nil
			end

			local var_162_13 = 0
			local var_162_14 = 0.175

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_15 = arg_159_1:FormatText(StoryNameCfg[596].name)

				arg_159_1.leftNameTxt_.text = var_162_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_16 = arg_159_1:GetWordFromCfg(410211039)
				local var_162_17 = arg_159_1:FormatText(var_162_16.content)

				arg_159_1.text_.text = var_162_17

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_18 = 7
				local var_162_19 = utf8.len(var_162_17)
				local var_162_20 = var_162_18 <= 0 and var_162_14 or var_162_14 * (var_162_19 / var_162_18)

				if var_162_20 > 0 and var_162_14 < var_162_20 then
					arg_159_1.talkMaxDuration = var_162_20

					if var_162_20 + var_162_13 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_20 + var_162_13
					end
				end

				arg_159_1.text_.text = var_162_17
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211039", "story_v_out_410211.awb") ~= 0 then
					local var_162_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211039", "story_v_out_410211.awb") / 1000

					if var_162_21 + var_162_13 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_21 + var_162_13
					end

					if var_162_16.prefab_name ~= "" and arg_159_1.actors_[var_162_16.prefab_name] ~= nil then
						local var_162_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_16.prefab_name].transform, "story_v_out_410211", "410211039", "story_v_out_410211.awb")

						arg_159_1:RecordAudio("410211039", var_162_22)
						arg_159_1:RecordAudio("410211039", var_162_22)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410211", "410211039", "story_v_out_410211.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410211", "410211039", "story_v_out_410211.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_23 = math.max(var_162_14, arg_159_1.talkMaxDuration)

			if var_162_13 <= arg_159_1.time_ and arg_159_1.time_ < var_162_13 + var_162_23 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_13) / var_162_23

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_13 + var_162_23 and arg_159_1.time_ < var_162_13 + var_162_23 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play410211040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410211040
		arg_163_1.duration_ = 12.966

		local var_163_0 = {
			ja = 12.966,
			CriLanguages = 11.266,
			zh = 11.266
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
				arg_163_0:Play410211041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1061"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1061 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("1061", 2)

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
				local var_166_6 = Vector3.New(-390, -490, 18)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1061, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_166_7 = arg_163_1.actors_["1061"]
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 and arg_163_1.var_.actorSpriteComps1061 == nil then
				arg_163_1.var_.actorSpriteComps1061 = var_166_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_9 = 0.034

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_8) / var_166_9

				if arg_163_1.var_.actorSpriteComps1061 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_166_2 then
							local var_166_11 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_10)

							iter_166_2.color = Color.New(var_166_11, var_166_11, var_166_11)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_8 + var_166_9 and arg_163_1.time_ < var_166_8 + var_166_9 + arg_166_0 and arg_163_1.var_.actorSpriteComps1061 then
				local var_166_12 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_12, var_166_12, var_166_12)
					end
				end

				arg_163_1.var_.actorSpriteComps1061 = nil
			end

			local var_166_13 = arg_163_1.actors_["10059"]
			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 and arg_163_1.var_.actorSpriteComps10059 == nil then
				arg_163_1.var_.actorSpriteComps10059 = var_166_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_15 = 0.034

			if var_166_14 <= arg_163_1.time_ and arg_163_1.time_ < var_166_14 + var_166_15 then
				local var_166_16 = (arg_163_1.time_ - var_166_14) / var_166_15

				if arg_163_1.var_.actorSpriteComps10059 then
					for iter_166_5, iter_166_6 in pairs(arg_163_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_166_6 then
							local var_166_17 = Mathf.Lerp(iter_166_6.color.r, 0.5, var_166_16)

							iter_166_6.color = Color.New(var_166_17, var_166_17, var_166_17)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_14 + var_166_15 and arg_163_1.time_ < var_166_14 + var_166_15 + arg_166_0 and arg_163_1.var_.actorSpriteComps10059 then
				local var_166_18 = 0.5

				for iter_166_7, iter_166_8 in pairs(arg_163_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_166_8 then
						iter_166_8.color = Color.New(var_166_18, var_166_18, var_166_18)
					end
				end

				arg_163_1.var_.actorSpriteComps10059 = nil
			end

			local var_166_19 = 0
			local var_166_20 = 1.35

			if var_166_19 < arg_163_1.time_ and arg_163_1.time_ <= var_166_19 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_21 = arg_163_1:FormatText(StoryNameCfg[612].name)

				arg_163_1.leftNameTxt_.text = var_166_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_22 = arg_163_1:GetWordFromCfg(410211040)
				local var_166_23 = arg_163_1:FormatText(var_166_22.content)

				arg_163_1.text_.text = var_166_23

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_24 = 54
				local var_166_25 = utf8.len(var_166_23)
				local var_166_26 = var_166_24 <= 0 and var_166_20 or var_166_20 * (var_166_25 / var_166_24)

				if var_166_26 > 0 and var_166_20 < var_166_26 then
					arg_163_1.talkMaxDuration = var_166_26

					if var_166_26 + var_166_19 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_26 + var_166_19
					end
				end

				arg_163_1.text_.text = var_166_23
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211040", "story_v_out_410211.awb") ~= 0 then
					local var_166_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211040", "story_v_out_410211.awb") / 1000

					if var_166_27 + var_166_19 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_27 + var_166_19
					end

					if var_166_22.prefab_name ~= "" and arg_163_1.actors_[var_166_22.prefab_name] ~= nil then
						local var_166_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_22.prefab_name].transform, "story_v_out_410211", "410211040", "story_v_out_410211.awb")

						arg_163_1:RecordAudio("410211040", var_166_28)
						arg_163_1:RecordAudio("410211040", var_166_28)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_410211", "410211040", "story_v_out_410211.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_410211", "410211040", "story_v_out_410211.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_29 = math.max(var_166_20, arg_163_1.talkMaxDuration)

			if var_166_19 <= arg_163_1.time_ and arg_163_1.time_ < var_166_19 + var_166_29 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_19) / var_166_29

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_19 + var_166_29 and arg_163_1.time_ < var_166_19 + var_166_29 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play410211041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410211041
		arg_167_1.duration_ = 4.9

		local var_167_0 = {
			ja = 4.433,
			CriLanguages = 4.9,
			zh = 4.9
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
				arg_167_0:Play410211042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10059"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos10059 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10059", 4)

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
				local var_170_6 = Vector3.New(390, -530, 35)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10059, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_170_7 = arg_167_1.actors_["1061"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps1061 == nil then
				arg_167_1.var_.actorSpriteComps1061 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.034

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps1061 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 0.5, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps1061 then
				local var_170_12 = 0.5

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps1061 = nil
			end

			local var_170_13 = arg_167_1.actors_["10059"]
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 and arg_167_1.var_.actorSpriteComps10059 == nil then
				arg_167_1.var_.actorSpriteComps10059 = var_170_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_15 = 0.034

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_15 then
				local var_170_16 = (arg_167_1.time_ - var_170_14) / var_170_15

				if arg_167_1.var_.actorSpriteComps10059 then
					for iter_170_5, iter_170_6 in pairs(arg_167_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_170_6 then
							local var_170_17 = Mathf.Lerp(iter_170_6.color.r, 1, var_170_16)

							iter_170_6.color = Color.New(var_170_17, var_170_17, var_170_17)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_14 + var_170_15 and arg_167_1.time_ < var_170_14 + var_170_15 + arg_170_0 and arg_167_1.var_.actorSpriteComps10059 then
				local var_170_18 = 1

				for iter_170_7, iter_170_8 in pairs(arg_167_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_170_8 then
						iter_170_8.color = Color.New(var_170_18, var_170_18, var_170_18)
					end
				end

				arg_167_1.var_.actorSpriteComps10059 = nil
			end

			local var_170_19 = 0
			local var_170_20 = 0.425

			if var_170_19 < arg_167_1.time_ and arg_167_1.time_ <= var_170_19 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_21 = arg_167_1:FormatText(StoryNameCfg[596].name)

				arg_167_1.leftNameTxt_.text = var_170_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_22 = arg_167_1:GetWordFromCfg(410211041)
				local var_170_23 = arg_167_1:FormatText(var_170_22.content)

				arg_167_1.text_.text = var_170_23

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_24 = 17
				local var_170_25 = utf8.len(var_170_23)
				local var_170_26 = var_170_24 <= 0 and var_170_20 or var_170_20 * (var_170_25 / var_170_24)

				if var_170_26 > 0 and var_170_20 < var_170_26 then
					arg_167_1.talkMaxDuration = var_170_26

					if var_170_26 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_26 + var_170_19
					end
				end

				arg_167_1.text_.text = var_170_23
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211041", "story_v_out_410211.awb") ~= 0 then
					local var_170_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211041", "story_v_out_410211.awb") / 1000

					if var_170_27 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_27 + var_170_19
					end

					if var_170_22.prefab_name ~= "" and arg_167_1.actors_[var_170_22.prefab_name] ~= nil then
						local var_170_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_22.prefab_name].transform, "story_v_out_410211", "410211041", "story_v_out_410211.awb")

						arg_167_1:RecordAudio("410211041", var_170_28)
						arg_167_1:RecordAudio("410211041", var_170_28)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410211", "410211041", "story_v_out_410211.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410211", "410211041", "story_v_out_410211.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_29 = math.max(var_170_20, arg_167_1.talkMaxDuration)

			if var_170_19 <= arg_167_1.time_ and arg_167_1.time_ < var_170_19 + var_170_29 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_19) / var_170_29

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_19 + var_170_29 and arg_167_1.time_ < var_170_19 + var_170_29 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play410211042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410211042
		arg_171_1.duration_ = 3.833

		local var_171_0 = {
			ja = 3.833,
			CriLanguages = 2.766,
			zh = 2.766
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
				arg_171_0:Play410211043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1061"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1061 = var_174_0.localPosition
				var_174_0.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("1061", 2)

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
				local var_174_6 = Vector3.New(-390, -490, 18)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1061, var_174_6, var_174_5)
			end

			if arg_171_1.time_ >= var_174_1 + var_174_4 and arg_171_1.time_ < var_174_1 + var_174_4 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_174_7 = arg_171_1.actors_["1061"]
			local var_174_8 = 0

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps1061 == nil then
				arg_171_1.var_.actorSpriteComps1061 = var_174_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_9 = 0.034

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_8) / var_174_9

				if arg_171_1.var_.actorSpriteComps1061 then
					for iter_174_1, iter_174_2 in pairs(arg_171_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_174_2 then
							local var_174_11 = Mathf.Lerp(iter_174_2.color.r, 1, var_174_10)

							iter_174_2.color = Color.New(var_174_11, var_174_11, var_174_11)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_8 + var_174_9 and arg_171_1.time_ < var_174_8 + var_174_9 + arg_174_0 and arg_171_1.var_.actorSpriteComps1061 then
				local var_174_12 = 1

				for iter_174_3, iter_174_4 in pairs(arg_171_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_174_4 then
						iter_174_4.color = Color.New(var_174_12, var_174_12, var_174_12)
					end
				end

				arg_171_1.var_.actorSpriteComps1061 = nil
			end

			local var_174_13 = arg_171_1.actors_["10059"]
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 and arg_171_1.var_.actorSpriteComps10059 == nil then
				arg_171_1.var_.actorSpriteComps10059 = var_174_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_15 = 0.034

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15

				if arg_171_1.var_.actorSpriteComps10059 then
					for iter_174_5, iter_174_6 in pairs(arg_171_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_174_6 then
							local var_174_17 = Mathf.Lerp(iter_174_6.color.r, 0.5, var_174_16)

							iter_174_6.color = Color.New(var_174_17, var_174_17, var_174_17)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 and arg_171_1.var_.actorSpriteComps10059 then
				local var_174_18 = 0.5

				for iter_174_7, iter_174_8 in pairs(arg_171_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_174_8 then
						iter_174_8.color = Color.New(var_174_18, var_174_18, var_174_18)
					end
				end

				arg_171_1.var_.actorSpriteComps10059 = nil
			end

			local var_174_19 = 0
			local var_174_20 = 0.325

			if var_174_19 < arg_171_1.time_ and arg_171_1.time_ <= var_174_19 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_21 = arg_171_1:FormatText(StoryNameCfg[612].name)

				arg_171_1.leftNameTxt_.text = var_174_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_22 = arg_171_1:GetWordFromCfg(410211042)
				local var_174_23 = arg_171_1:FormatText(var_174_22.content)

				arg_171_1.text_.text = var_174_23

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_24 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211042", "story_v_out_410211.awb") ~= 0 then
					local var_174_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211042", "story_v_out_410211.awb") / 1000

					if var_174_27 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_27 + var_174_19
					end

					if var_174_22.prefab_name ~= "" and arg_171_1.actors_[var_174_22.prefab_name] ~= nil then
						local var_174_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_22.prefab_name].transform, "story_v_out_410211", "410211042", "story_v_out_410211.awb")

						arg_171_1:RecordAudio("410211042", var_174_28)
						arg_171_1:RecordAudio("410211042", var_174_28)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410211", "410211042", "story_v_out_410211.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410211", "410211042", "story_v_out_410211.awb")
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
	Play410211043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410211043
		arg_175_1.duration_ = 4.733

		local var_175_0 = {
			ja = 4.733,
			CriLanguages = 4.3,
			zh = 4.3
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
				arg_175_0:Play410211044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10059"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10059 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("10059", 4)

				local var_178_2 = var_178_0.childCount

				for iter_178_0 = 0, var_178_2 - 1 do
					local var_178_3 = var_178_0:GetChild(iter_178_0)

					if var_178_3.name == "" or not string.find(var_178_3.name, "split") then
						var_178_3.gameObject:SetActive(true)
					else
						var_178_3.gameObject:SetActive(false)
					end
				end
			end

			local var_178_4 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_1) / var_178_4
				local var_178_6 = Vector3.New(390, -530, 35)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10059, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_178_7 = arg_175_1.actors_["1061"]
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 and arg_175_1.var_.actorSpriteComps1061 == nil then
				arg_175_1.var_.actorSpriteComps1061 = var_178_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_9 = 0.034

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_9 then
				local var_178_10 = (arg_175_1.time_ - var_178_8) / var_178_9

				if arg_175_1.var_.actorSpriteComps1061 then
					for iter_178_1, iter_178_2 in pairs(arg_175_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_178_2 then
							local var_178_11 = Mathf.Lerp(iter_178_2.color.r, 0.5, var_178_10)

							iter_178_2.color = Color.New(var_178_11, var_178_11, var_178_11)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_8 + var_178_9 and arg_175_1.time_ < var_178_8 + var_178_9 + arg_178_0 and arg_175_1.var_.actorSpriteComps1061 then
				local var_178_12 = 0.5

				for iter_178_3, iter_178_4 in pairs(arg_175_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_178_4 then
						iter_178_4.color = Color.New(var_178_12, var_178_12, var_178_12)
					end
				end

				arg_175_1.var_.actorSpriteComps1061 = nil
			end

			local var_178_13 = arg_175_1.actors_["10059"]
			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 and arg_175_1.var_.actorSpriteComps10059 == nil then
				arg_175_1.var_.actorSpriteComps10059 = var_178_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_15 = 0.034

			if var_178_14 <= arg_175_1.time_ and arg_175_1.time_ < var_178_14 + var_178_15 then
				local var_178_16 = (arg_175_1.time_ - var_178_14) / var_178_15

				if arg_175_1.var_.actorSpriteComps10059 then
					for iter_178_5, iter_178_6 in pairs(arg_175_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_178_6 then
							local var_178_17 = Mathf.Lerp(iter_178_6.color.r, 1, var_178_16)

							iter_178_6.color = Color.New(var_178_17, var_178_17, var_178_17)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_14 + var_178_15 and arg_175_1.time_ < var_178_14 + var_178_15 + arg_178_0 and arg_175_1.var_.actorSpriteComps10059 then
				local var_178_18 = 1

				for iter_178_7, iter_178_8 in pairs(arg_175_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_178_8 then
						iter_178_8.color = Color.New(var_178_18, var_178_18, var_178_18)
					end
				end

				arg_175_1.var_.actorSpriteComps10059 = nil
			end

			local var_178_19 = 0
			local var_178_20 = 0.275

			if var_178_19 < arg_175_1.time_ and arg_175_1.time_ <= var_178_19 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_21 = arg_175_1:FormatText(StoryNameCfg[596].name)

				arg_175_1.leftNameTxt_.text = var_178_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_22 = arg_175_1:GetWordFromCfg(410211043)
				local var_178_23 = arg_175_1:FormatText(var_178_22.content)

				arg_175_1.text_.text = var_178_23

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_24 = 11
				local var_178_25 = utf8.len(var_178_23)
				local var_178_26 = var_178_24 <= 0 and var_178_20 or var_178_20 * (var_178_25 / var_178_24)

				if var_178_26 > 0 and var_178_20 < var_178_26 then
					arg_175_1.talkMaxDuration = var_178_26

					if var_178_26 + var_178_19 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_26 + var_178_19
					end
				end

				arg_175_1.text_.text = var_178_23
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211043", "story_v_out_410211.awb") ~= 0 then
					local var_178_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211043", "story_v_out_410211.awb") / 1000

					if var_178_27 + var_178_19 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_27 + var_178_19
					end

					if var_178_22.prefab_name ~= "" and arg_175_1.actors_[var_178_22.prefab_name] ~= nil then
						local var_178_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_22.prefab_name].transform, "story_v_out_410211", "410211043", "story_v_out_410211.awb")

						arg_175_1:RecordAudio("410211043", var_178_28)
						arg_175_1:RecordAudio("410211043", var_178_28)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_410211", "410211043", "story_v_out_410211.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_410211", "410211043", "story_v_out_410211.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_29 = math.max(var_178_20, arg_175_1.talkMaxDuration)

			if var_178_19 <= arg_175_1.time_ and arg_175_1.time_ < var_178_19 + var_178_29 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_19) / var_178_29

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_19 + var_178_29 and arg_175_1.time_ < var_178_19 + var_178_29 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play410211044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410211044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play410211045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10059"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10059 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10059", 7)

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
				local var_182_6 = Vector3.New(0, -2000, 18)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10059, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_182_7 = arg_179_1.actors_["1061"].transform
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 then
				arg_179_1.var_.moveOldPos1061 = var_182_7.localPosition
				var_182_7.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("1061", 7)

				local var_182_9 = var_182_7.childCount

				for iter_182_1 = 0, var_182_9 - 1 do
					local var_182_10 = var_182_7:GetChild(iter_182_1)

					if var_182_10.name == "" or not string.find(var_182_10.name, "split") then
						var_182_10.gameObject:SetActive(true)
					else
						var_182_10.gameObject:SetActive(false)
					end
				end
			end

			local var_182_11 = 0.001

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_8) / var_182_11
				local var_182_13 = Vector3.New(0, -2000, 18)

				var_182_7.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1061, var_182_13, var_182_12)
			end

			if arg_179_1.time_ >= var_182_8 + var_182_11 and arg_179_1.time_ < var_182_8 + var_182_11 + arg_182_0 then
				var_182_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_182_14 = arg_179_1.actors_["10059"]
			local var_182_15 = 0

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 and arg_179_1.var_.actorSpriteComps10059 == nil then
				arg_179_1.var_.actorSpriteComps10059 = var_182_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_16 = 0.034

			if var_182_15 <= arg_179_1.time_ and arg_179_1.time_ < var_182_15 + var_182_16 then
				local var_182_17 = (arg_179_1.time_ - var_182_15) / var_182_16

				if arg_179_1.var_.actorSpriteComps10059 then
					for iter_182_2, iter_182_3 in pairs(arg_179_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_182_3 then
							local var_182_18 = Mathf.Lerp(iter_182_3.color.r, 0.5, var_182_17)

							iter_182_3.color = Color.New(var_182_18, var_182_18, var_182_18)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_15 + var_182_16 and arg_179_1.time_ < var_182_15 + var_182_16 + arg_182_0 and arg_179_1.var_.actorSpriteComps10059 then
				local var_182_19 = 0.5

				for iter_182_4, iter_182_5 in pairs(arg_179_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_182_5 then
						iter_182_5.color = Color.New(var_182_19, var_182_19, var_182_19)
					end
				end

				arg_179_1.var_.actorSpriteComps10059 = nil
			end

			local var_182_20 = arg_179_1.actors_["1061"]
			local var_182_21 = 0

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 and arg_179_1.var_.actorSpriteComps1061 == nil then
				arg_179_1.var_.actorSpriteComps1061 = var_182_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_22 = 0.034

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_22 then
				local var_182_23 = (arg_179_1.time_ - var_182_21) / var_182_22

				if arg_179_1.var_.actorSpriteComps1061 then
					for iter_182_6, iter_182_7 in pairs(arg_179_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_182_7 then
							local var_182_24 = Mathf.Lerp(iter_182_7.color.r, 0.5, var_182_23)

							iter_182_7.color = Color.New(var_182_24, var_182_24, var_182_24)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_21 + var_182_22 and arg_179_1.time_ < var_182_21 + var_182_22 + arg_182_0 and arg_179_1.var_.actorSpriteComps1061 then
				local var_182_25 = 0.5

				for iter_182_8, iter_182_9 in pairs(arg_179_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_182_9 then
						iter_182_9.color = Color.New(var_182_25, var_182_25, var_182_25)
					end
				end

				arg_179_1.var_.actorSpriteComps1061 = nil
			end

			local var_182_26 = 0
			local var_182_27 = 1.125

			if var_182_26 < arg_179_1.time_ and arg_179_1.time_ <= var_182_26 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_28 = arg_179_1:GetWordFromCfg(410211044)
				local var_182_29 = arg_179_1:FormatText(var_182_28.content)

				arg_179_1.text_.text = var_182_29

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_30 = 45
				local var_182_31 = utf8.len(var_182_29)
				local var_182_32 = var_182_30 <= 0 and var_182_27 or var_182_27 * (var_182_31 / var_182_30)

				if var_182_32 > 0 and var_182_27 < var_182_32 then
					arg_179_1.talkMaxDuration = var_182_32

					if var_182_32 + var_182_26 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_32 + var_182_26
					end
				end

				arg_179_1.text_.text = var_182_29
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_33 = math.max(var_182_27, arg_179_1.talkMaxDuration)

			if var_182_26 <= arg_179_1.time_ and arg_179_1.time_ < var_182_26 + var_182_33 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_26) / var_182_33

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_26 + var_182_33 and arg_179_1.time_ < var_182_26 + var_182_33 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play410211045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410211045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play410211046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.9

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(410211045)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 36
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play410211046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410211046
		arg_187_1.duration_ = 1.633

		local var_187_0 = {
			ja = 1.4,
			CriLanguages = 1.633,
			zh = 1.633
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
				arg_187_0:Play410211047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10063"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10063 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10063", 2)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "split_5" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(-390, -535, -105)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10063, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-390, -535, -105)
			end

			local var_190_7 = arg_187_1.actors_["10059"].transform
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 then
				arg_187_1.var_.moveOldPos10059 = var_190_7.localPosition
				var_190_7.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10059", 4)

				local var_190_9 = var_190_7.childCount

				for iter_190_1 = 0, var_190_9 - 1 do
					local var_190_10 = var_190_7:GetChild(iter_190_1)

					if var_190_10.name == "" or not string.find(var_190_10.name, "split") then
						var_190_10.gameObject:SetActive(true)
					else
						var_190_10.gameObject:SetActive(false)
					end
				end
			end

			local var_190_11 = 0.001

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_8) / var_190_11
				local var_190_13 = Vector3.New(390, -530, 35)

				var_190_7.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10059, var_190_13, var_190_12)
			end

			if arg_187_1.time_ >= var_190_8 + var_190_11 and arg_187_1.time_ < var_190_8 + var_190_11 + arg_190_0 then
				var_190_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_190_14 = arg_187_1.actors_["10063"]
			local var_190_15 = 0

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 and arg_187_1.var_.actorSpriteComps10063 == nil then
				arg_187_1.var_.actorSpriteComps10063 = var_190_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_16 = 0.034

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_16 then
				local var_190_17 = (arg_187_1.time_ - var_190_15) / var_190_16

				if arg_187_1.var_.actorSpriteComps10063 then
					for iter_190_2, iter_190_3 in pairs(arg_187_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_190_3 then
							local var_190_18 = Mathf.Lerp(iter_190_3.color.r, 1, var_190_17)

							iter_190_3.color = Color.New(var_190_18, var_190_18, var_190_18)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_15 + var_190_16 and arg_187_1.time_ < var_190_15 + var_190_16 + arg_190_0 and arg_187_1.var_.actorSpriteComps10063 then
				local var_190_19 = 1

				for iter_190_4, iter_190_5 in pairs(arg_187_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_190_5 then
						iter_190_5.color = Color.New(var_190_19, var_190_19, var_190_19)
					end
				end

				arg_187_1.var_.actorSpriteComps10063 = nil
			end

			local var_190_20 = arg_187_1.actors_["10059"]
			local var_190_21 = 0

			if var_190_21 < arg_187_1.time_ and arg_187_1.time_ <= var_190_21 + arg_190_0 and arg_187_1.var_.actorSpriteComps10059 == nil then
				arg_187_1.var_.actorSpriteComps10059 = var_190_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_22 = 0.034

			if var_190_21 <= arg_187_1.time_ and arg_187_1.time_ < var_190_21 + var_190_22 then
				local var_190_23 = (arg_187_1.time_ - var_190_21) / var_190_22

				if arg_187_1.var_.actorSpriteComps10059 then
					for iter_190_6, iter_190_7 in pairs(arg_187_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_190_7 then
							local var_190_24 = Mathf.Lerp(iter_190_7.color.r, 0.5, var_190_23)

							iter_190_7.color = Color.New(var_190_24, var_190_24, var_190_24)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_21 + var_190_22 and arg_187_1.time_ < var_190_21 + var_190_22 + arg_190_0 and arg_187_1.var_.actorSpriteComps10059 then
				local var_190_25 = 0.5

				for iter_190_8, iter_190_9 in pairs(arg_187_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_190_9 then
						iter_190_9.color = Color.New(var_190_25, var_190_25, var_190_25)
					end
				end

				arg_187_1.var_.actorSpriteComps10059 = nil
			end

			local var_190_26 = 0
			local var_190_27 = 0.1

			if var_190_26 < arg_187_1.time_ and arg_187_1.time_ <= var_190_26 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_28 = arg_187_1:FormatText(StoryNameCfg[591].name)

				arg_187_1.leftNameTxt_.text = var_190_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_29 = arg_187_1:GetWordFromCfg(410211046)
				local var_190_30 = arg_187_1:FormatText(var_190_29.content)

				arg_187_1.text_.text = var_190_30

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_31 = 4
				local var_190_32 = utf8.len(var_190_30)
				local var_190_33 = var_190_31 <= 0 and var_190_27 or var_190_27 * (var_190_32 / var_190_31)

				if var_190_33 > 0 and var_190_27 < var_190_33 then
					arg_187_1.talkMaxDuration = var_190_33

					if var_190_33 + var_190_26 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_33 + var_190_26
					end
				end

				arg_187_1.text_.text = var_190_30
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211046", "story_v_out_410211.awb") ~= 0 then
					local var_190_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211046", "story_v_out_410211.awb") / 1000

					if var_190_34 + var_190_26 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_34 + var_190_26
					end

					if var_190_29.prefab_name ~= "" and arg_187_1.actors_[var_190_29.prefab_name] ~= nil then
						local var_190_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_29.prefab_name].transform, "story_v_out_410211", "410211046", "story_v_out_410211.awb")

						arg_187_1:RecordAudio("410211046", var_190_35)
						arg_187_1:RecordAudio("410211046", var_190_35)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410211", "410211046", "story_v_out_410211.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410211", "410211046", "story_v_out_410211.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_36 = math.max(var_190_27, arg_187_1.talkMaxDuration)

			if var_190_26 <= arg_187_1.time_ and arg_187_1.time_ < var_190_26 + var_190_36 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_26) / var_190_36

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_26 + var_190_36 and arg_187_1.time_ < var_190_26 + var_190_36 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410211047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410211047
		arg_191_1.duration_ = 4.266

		local var_191_0 = {
			ja = 4.266,
			CriLanguages = 2.533,
			zh = 2.533
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
				arg_191_0:Play410211048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10063"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps10063 == nil then
				arg_191_1.var_.actorSpriteComps10063 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 0.034

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps10063 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_194_1 then
							local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 0.5, var_194_3)

							iter_194_1.color = Color.New(var_194_4, var_194_4, var_194_4)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps10063 then
				local var_194_5 = 0.5

				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_194_3 then
						iter_194_3.color = Color.New(var_194_5, var_194_5, var_194_5)
					end
				end

				arg_191_1.var_.actorSpriteComps10063 = nil
			end

			local var_194_6 = arg_191_1.actors_["10059"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.actorSpriteComps10059 == nil then
				arg_191_1.var_.actorSpriteComps10059 = var_194_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_8 = 0.034

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.actorSpriteComps10059 then
					for iter_194_4, iter_194_5 in pairs(arg_191_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_194_5 then
							local var_194_10 = Mathf.Lerp(iter_194_5.color.r, 1, var_194_9)

							iter_194_5.color = Color.New(var_194_10, var_194_10, var_194_10)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps10059 then
				local var_194_11 = 1

				for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_194_7 then
						iter_194_7.color = Color.New(var_194_11, var_194_11, var_194_11)
					end
				end

				arg_191_1.var_.actorSpriteComps10059 = nil
			end

			local var_194_12 = 0
			local var_194_13 = 0.25

			if var_194_12 < arg_191_1.time_ and arg_191_1.time_ <= var_194_12 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_14 = arg_191_1:FormatText(StoryNameCfg[596].name)

				arg_191_1.leftNameTxt_.text = var_194_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_15 = arg_191_1:GetWordFromCfg(410211047)
				local var_194_16 = arg_191_1:FormatText(var_194_15.content)

				arg_191_1.text_.text = var_194_16

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_17 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211047", "story_v_out_410211.awb") ~= 0 then
					local var_194_20 = manager.audio:GetVoiceLength("story_v_out_410211", "410211047", "story_v_out_410211.awb") / 1000

					if var_194_20 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_12
					end

					if var_194_15.prefab_name ~= "" and arg_191_1.actors_[var_194_15.prefab_name] ~= nil then
						local var_194_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_15.prefab_name].transform, "story_v_out_410211", "410211047", "story_v_out_410211.awb")

						arg_191_1:RecordAudio("410211047", var_194_21)
						arg_191_1:RecordAudio("410211047", var_194_21)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410211", "410211047", "story_v_out_410211.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410211", "410211047", "story_v_out_410211.awb")
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
	Play410211048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410211048
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play410211049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10063"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10063 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10063", 7)

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
				local var_198_6 = Vector3.New(0, -2000, -105)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10063, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_198_7 = arg_195_1.actors_["10059"].transform
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 then
				arg_195_1.var_.moveOldPos10059 = var_198_7.localPosition
				var_198_7.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10059", 7)

				local var_198_9 = var_198_7.childCount

				for iter_198_1 = 0, var_198_9 - 1 do
					local var_198_10 = var_198_7:GetChild(iter_198_1)

					if var_198_10.name == "" or not string.find(var_198_10.name, "split") then
						var_198_10.gameObject:SetActive(true)
					else
						var_198_10.gameObject:SetActive(false)
					end
				end
			end

			local var_198_11 = 0.001

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_8) / var_198_11
				local var_198_13 = Vector3.New(0, -2000, 35)

				var_198_7.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10059, var_198_13, var_198_12)
			end

			if arg_195_1.time_ >= var_198_8 + var_198_11 and arg_195_1.time_ < var_198_8 + var_198_11 + arg_198_0 then
				var_198_7.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_198_14 = 0
			local var_198_15 = 1.15

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_16 = arg_195_1:GetWordFromCfg(410211048)
				local var_198_17 = arg_195_1:FormatText(var_198_16.content)

				arg_195_1.text_.text = var_198_17

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_18 = 46
				local var_198_19 = utf8.len(var_198_17)
				local var_198_20 = var_198_18 <= 0 and var_198_15 or var_198_15 * (var_198_19 / var_198_18)

				if var_198_20 > 0 and var_198_15 < var_198_20 then
					arg_195_1.talkMaxDuration = var_198_20

					if var_198_20 + var_198_14 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_20 + var_198_14
					end
				end

				arg_195_1.text_.text = var_198_17
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_21 = math.max(var_198_15, arg_195_1.talkMaxDuration)

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_21 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_14) / var_198_21

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_14 + var_198_21 and arg_195_1.time_ < var_198_14 + var_198_21 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play410211049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410211049
		arg_199_1.duration_ = 4.666

		local var_199_0 = {
			ja = 2.6,
			CriLanguages = 4.666,
			zh = 4.666
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
				arg_199_0:Play410211050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10059"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos10059 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10059", 4)

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
				local var_202_6 = Vector3.New(390, -530, 35)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10059, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_202_7 = arg_199_1.actors_["1061"].transform
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 then
				arg_199_1.var_.moveOldPos1061 = var_202_7.localPosition
				var_202_7.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1061", 2)

				local var_202_9 = var_202_7.childCount

				for iter_202_1 = 0, var_202_9 - 1 do
					local var_202_10 = var_202_7:GetChild(iter_202_1)

					if var_202_10.name == "" or not string.find(var_202_10.name, "split") then
						var_202_10.gameObject:SetActive(true)
					else
						var_202_10.gameObject:SetActive(false)
					end
				end
			end

			local var_202_11 = 0.001

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_8) / var_202_11
				local var_202_13 = Vector3.New(-390, -490, 18)

				var_202_7.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1061, var_202_13, var_202_12)
			end

			if arg_199_1.time_ >= var_202_8 + var_202_11 and arg_199_1.time_ < var_202_8 + var_202_11 + arg_202_0 then
				var_202_7.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_202_14 = arg_199_1.actors_["10059"]
			local var_202_15 = 0

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 and arg_199_1.var_.actorSpriteComps10059 == nil then
				arg_199_1.var_.actorSpriteComps10059 = var_202_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_16 = 0.034

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_16 then
				local var_202_17 = (arg_199_1.time_ - var_202_15) / var_202_16

				if arg_199_1.var_.actorSpriteComps10059 then
					for iter_202_2, iter_202_3 in pairs(arg_199_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_202_3 then
							local var_202_18 = Mathf.Lerp(iter_202_3.color.r, 1, var_202_17)

							iter_202_3.color = Color.New(var_202_18, var_202_18, var_202_18)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_15 + var_202_16 and arg_199_1.time_ < var_202_15 + var_202_16 + arg_202_0 and arg_199_1.var_.actorSpriteComps10059 then
				local var_202_19 = 1

				for iter_202_4, iter_202_5 in pairs(arg_199_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_202_5 then
						iter_202_5.color = Color.New(var_202_19, var_202_19, var_202_19)
					end
				end

				arg_199_1.var_.actorSpriteComps10059 = nil
			end

			local var_202_20 = arg_199_1.actors_["1061"]
			local var_202_21 = 0

			if var_202_21 < arg_199_1.time_ and arg_199_1.time_ <= var_202_21 + arg_202_0 and arg_199_1.var_.actorSpriteComps1061 == nil then
				arg_199_1.var_.actorSpriteComps1061 = var_202_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_22 = 0.034

			if var_202_21 <= arg_199_1.time_ and arg_199_1.time_ < var_202_21 + var_202_22 then
				local var_202_23 = (arg_199_1.time_ - var_202_21) / var_202_22

				if arg_199_1.var_.actorSpriteComps1061 then
					for iter_202_6, iter_202_7 in pairs(arg_199_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_202_7 then
							local var_202_24 = Mathf.Lerp(iter_202_7.color.r, 0.5, var_202_23)

							iter_202_7.color = Color.New(var_202_24, var_202_24, var_202_24)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_21 + var_202_22 and arg_199_1.time_ < var_202_21 + var_202_22 + arg_202_0 and arg_199_1.var_.actorSpriteComps1061 then
				local var_202_25 = 0.5

				for iter_202_8, iter_202_9 in pairs(arg_199_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_202_9 then
						iter_202_9.color = Color.New(var_202_25, var_202_25, var_202_25)
					end
				end

				arg_199_1.var_.actorSpriteComps1061 = nil
			end

			local var_202_26 = 0
			local var_202_27 = 0.45

			if var_202_26 < arg_199_1.time_ and arg_199_1.time_ <= var_202_26 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_28 = arg_199_1:FormatText(StoryNameCfg[596].name)

				arg_199_1.leftNameTxt_.text = var_202_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_29 = arg_199_1:GetWordFromCfg(410211049)
				local var_202_30 = arg_199_1:FormatText(var_202_29.content)

				arg_199_1.text_.text = var_202_30

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_31 = 18
				local var_202_32 = utf8.len(var_202_30)
				local var_202_33 = var_202_31 <= 0 and var_202_27 or var_202_27 * (var_202_32 / var_202_31)

				if var_202_33 > 0 and var_202_27 < var_202_33 then
					arg_199_1.talkMaxDuration = var_202_33

					if var_202_33 + var_202_26 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_33 + var_202_26
					end
				end

				arg_199_1.text_.text = var_202_30
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211049", "story_v_out_410211.awb") ~= 0 then
					local var_202_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211049", "story_v_out_410211.awb") / 1000

					if var_202_34 + var_202_26 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_34 + var_202_26
					end

					if var_202_29.prefab_name ~= "" and arg_199_1.actors_[var_202_29.prefab_name] ~= nil then
						local var_202_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_29.prefab_name].transform, "story_v_out_410211", "410211049", "story_v_out_410211.awb")

						arg_199_1:RecordAudio("410211049", var_202_35)
						arg_199_1:RecordAudio("410211049", var_202_35)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410211", "410211049", "story_v_out_410211.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410211", "410211049", "story_v_out_410211.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_36 = math.max(var_202_27, arg_199_1.talkMaxDuration)

			if var_202_26 <= arg_199_1.time_ and arg_199_1.time_ < var_202_26 + var_202_36 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_26) / var_202_36

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_26 + var_202_36 and arg_199_1.time_ < var_202_26 + var_202_36 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play410211050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410211050
		arg_203_1.duration_ = 4.533

		local var_203_0 = {
			ja = 4.533,
			CriLanguages = 2.366,
			zh = 2.366
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
				arg_203_0:Play410211051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1061"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1061 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("1061", 2)

				local var_206_2 = var_206_0.childCount

				for iter_206_0 = 0, var_206_2 - 1 do
					local var_206_3 = var_206_0:GetChild(iter_206_0)

					if var_206_3.name == "split_5" or not string.find(var_206_3.name, "split") then
						var_206_3.gameObject:SetActive(true)
					else
						var_206_3.gameObject:SetActive(false)
					end
				end
			end

			local var_206_4 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_1) / var_206_4
				local var_206_6 = Vector3.New(-390, -490, 18)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1061, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_206_7 = arg_203_1.actors_["10059"]
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 and arg_203_1.var_.actorSpriteComps10059 == nil then
				arg_203_1.var_.actorSpriteComps10059 = var_206_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_9 = 0.034

			if var_206_8 <= arg_203_1.time_ and arg_203_1.time_ < var_206_8 + var_206_9 then
				local var_206_10 = (arg_203_1.time_ - var_206_8) / var_206_9

				if arg_203_1.var_.actorSpriteComps10059 then
					for iter_206_1, iter_206_2 in pairs(arg_203_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_206_2 then
							local var_206_11 = Mathf.Lerp(iter_206_2.color.r, 0.5, var_206_10)

							iter_206_2.color = Color.New(var_206_11, var_206_11, var_206_11)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_8 + var_206_9 and arg_203_1.time_ < var_206_8 + var_206_9 + arg_206_0 and arg_203_1.var_.actorSpriteComps10059 then
				local var_206_12 = 0.5

				for iter_206_3, iter_206_4 in pairs(arg_203_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_206_4 then
						iter_206_4.color = Color.New(var_206_12, var_206_12, var_206_12)
					end
				end

				arg_203_1.var_.actorSpriteComps10059 = nil
			end

			local var_206_13 = arg_203_1.actors_["1061"]
			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 and arg_203_1.var_.actorSpriteComps1061 == nil then
				arg_203_1.var_.actorSpriteComps1061 = var_206_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_15 = 0.034

			if var_206_14 <= arg_203_1.time_ and arg_203_1.time_ < var_206_14 + var_206_15 then
				local var_206_16 = (arg_203_1.time_ - var_206_14) / var_206_15

				if arg_203_1.var_.actorSpriteComps1061 then
					for iter_206_5, iter_206_6 in pairs(arg_203_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_206_6 then
							local var_206_17 = Mathf.Lerp(iter_206_6.color.r, 1, var_206_16)

							iter_206_6.color = Color.New(var_206_17, var_206_17, var_206_17)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_14 + var_206_15 and arg_203_1.time_ < var_206_14 + var_206_15 + arg_206_0 and arg_203_1.var_.actorSpriteComps1061 then
				local var_206_18 = 1

				for iter_206_7, iter_206_8 in pairs(arg_203_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_206_8 then
						iter_206_8.color = Color.New(var_206_18, var_206_18, var_206_18)
					end
				end

				arg_203_1.var_.actorSpriteComps1061 = nil
			end

			local var_206_19 = 0
			local var_206_20 = 0.2

			if var_206_19 < arg_203_1.time_ and arg_203_1.time_ <= var_206_19 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_21 = arg_203_1:FormatText(StoryNameCfg[612].name)

				arg_203_1.leftNameTxt_.text = var_206_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_22 = arg_203_1:GetWordFromCfg(410211050)
				local var_206_23 = arg_203_1:FormatText(var_206_22.content)

				arg_203_1.text_.text = var_206_23

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_24 = 8
				local var_206_25 = utf8.len(var_206_23)
				local var_206_26 = var_206_24 <= 0 and var_206_20 or var_206_20 * (var_206_25 / var_206_24)

				if var_206_26 > 0 and var_206_20 < var_206_26 then
					arg_203_1.talkMaxDuration = var_206_26

					if var_206_26 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_26 + var_206_19
					end
				end

				arg_203_1.text_.text = var_206_23
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211050", "story_v_out_410211.awb") ~= 0 then
					local var_206_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211050", "story_v_out_410211.awb") / 1000

					if var_206_27 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_27 + var_206_19
					end

					if var_206_22.prefab_name ~= "" and arg_203_1.actors_[var_206_22.prefab_name] ~= nil then
						local var_206_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_22.prefab_name].transform, "story_v_out_410211", "410211050", "story_v_out_410211.awb")

						arg_203_1:RecordAudio("410211050", var_206_28)
						arg_203_1:RecordAudio("410211050", var_206_28)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410211", "410211050", "story_v_out_410211.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410211", "410211050", "story_v_out_410211.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_29 = math.max(var_206_20, arg_203_1.talkMaxDuration)

			if var_206_19 <= arg_203_1.time_ and arg_203_1.time_ < var_206_19 + var_206_29 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_19) / var_206_29

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_19 + var_206_29 and arg_203_1.time_ < var_206_19 + var_206_29 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410211051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410211051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play410211052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10059"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos10059 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("10059", 7)

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
				local var_210_6 = Vector3.New(0, -2000, 35)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10059, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_210_7 = arg_207_1.actors_["1061"].transform
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 then
				arg_207_1.var_.moveOldPos1061 = var_210_7.localPosition
				var_210_7.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1061", 7)

				local var_210_9 = var_210_7.childCount

				for iter_210_1 = 0, var_210_9 - 1 do
					local var_210_10 = var_210_7:GetChild(iter_210_1)

					if var_210_10.name == "" or not string.find(var_210_10.name, "split") then
						var_210_10.gameObject:SetActive(true)
					else
						var_210_10.gameObject:SetActive(false)
					end
				end
			end

			local var_210_11 = 0.001

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_8) / var_210_11
				local var_210_13 = Vector3.New(0, -2000, 18)

				var_210_7.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1061, var_210_13, var_210_12)
			end

			if arg_207_1.time_ >= var_210_8 + var_210_11 and arg_207_1.time_ < var_210_8 + var_210_11 + arg_210_0 then
				var_210_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_210_14 = 0
			local var_210_15 = 1.5

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_16 = arg_207_1:GetWordFromCfg(410211051)
				local var_210_17 = arg_207_1:FormatText(var_210_16.content)

				arg_207_1.text_.text = var_210_17

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_18 = 60
				local var_210_19 = utf8.len(var_210_17)
				local var_210_20 = var_210_18 <= 0 and var_210_15 or var_210_15 * (var_210_19 / var_210_18)

				if var_210_20 > 0 and var_210_15 < var_210_20 then
					arg_207_1.talkMaxDuration = var_210_20

					if var_210_20 + var_210_14 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_14
					end
				end

				arg_207_1.text_.text = var_210_17
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_21 = math.max(var_210_15, arg_207_1.talkMaxDuration)

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_21 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_14) / var_210_21

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_14 + var_210_21 and arg_207_1.time_ < var_210_14 + var_210_21 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410211052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410211052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play410211053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.675

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_2 = arg_211_1:GetWordFromCfg(410211052)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 67
				local var_214_5 = utf8.len(var_214_3)
				local var_214_6 = var_214_4 <= 0 and var_214_1 or var_214_1 * (var_214_5 / var_214_4)

				if var_214_6 > 0 and var_214_1 < var_214_6 then
					arg_211_1.talkMaxDuration = var_214_6

					if var_214_6 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_6 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_3
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_7 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_7 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_7

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_7 and arg_211_1.time_ < var_214_0 + var_214_7 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play410211053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410211053
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play410211054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.05

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[604].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3046")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(410211053)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 2
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
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_8 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_8 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_8

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_8 and arg_215_1.time_ < var_218_0 + var_218_8 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play410211054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410211054
		arg_219_1.duration_ = 1.166

		local var_219_0 = {
			ja = 1.133,
			CriLanguages = 1.166,
			zh = 1.166
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
				arg_219_0:Play410211055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10059"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos10059 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10059", 3)

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
				local var_222_6 = Vector3.New(0, -530, 35)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10059, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -530, 35)
			end

			local var_222_7 = arg_219_1.actors_["10059"]
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps10059 == nil then
				arg_219_1.var_.actorSpriteComps10059 = var_222_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_9 = 0.034

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_9 then
				local var_222_10 = (arg_219_1.time_ - var_222_8) / var_222_9

				if arg_219_1.var_.actorSpriteComps10059 then
					for iter_222_1, iter_222_2 in pairs(arg_219_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_222_2 then
							local var_222_11 = Mathf.Lerp(iter_222_2.color.r, 1, var_222_10)

							iter_222_2.color = Color.New(var_222_11, var_222_11, var_222_11)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_8 + var_222_9 and arg_219_1.time_ < var_222_8 + var_222_9 + arg_222_0 and arg_219_1.var_.actorSpriteComps10059 then
				local var_222_12 = 1

				for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_222_4 then
						iter_222_4.color = Color.New(var_222_12, var_222_12, var_222_12)
					end
				end

				arg_219_1.var_.actorSpriteComps10059 = nil
			end

			local var_222_13 = 0
			local var_222_14 = 0.075

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_15 = arg_219_1:FormatText(StoryNameCfg[596].name)

				arg_219_1.leftNameTxt_.text = var_222_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_16 = arg_219_1:GetWordFromCfg(410211054)
				local var_222_17 = arg_219_1:FormatText(var_222_16.content)

				arg_219_1.text_.text = var_222_17

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_18 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211054", "story_v_out_410211.awb") ~= 0 then
					local var_222_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211054", "story_v_out_410211.awb") / 1000

					if var_222_21 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_21 + var_222_13
					end

					if var_222_16.prefab_name ~= "" and arg_219_1.actors_[var_222_16.prefab_name] ~= nil then
						local var_222_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_16.prefab_name].transform, "story_v_out_410211", "410211054", "story_v_out_410211.awb")

						arg_219_1:RecordAudio("410211054", var_222_22)
						arg_219_1:RecordAudio("410211054", var_222_22)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410211", "410211054", "story_v_out_410211.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410211", "410211054", "story_v_out_410211.awb")
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
	Play410211055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410211055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play410211056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10059"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos10059 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("10059", 7)

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
				local var_226_6 = Vector3.New(0, -2000, 18)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10059, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_226_7 = arg_223_1.actors_["10059"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps10059 == nil then
				arg_223_1.var_.actorSpriteComps10059 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 0.034

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps10059 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_226_2 then
							local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 0.5, var_226_10)

							iter_226_2.color = Color.New(var_226_11, var_226_11, var_226_11)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps10059 then
				local var_226_12 = 0.5

				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_226_4 then
						iter_226_4.color = Color.New(var_226_12, var_226_12, var_226_12)
					end
				end

				arg_223_1.var_.actorSpriteComps10059 = nil
			end

			local var_226_13 = 0
			local var_226_14 = 0.625

			if var_226_13 < arg_223_1.time_ and arg_223_1.time_ <= var_226_13 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_15 = arg_223_1:GetWordFromCfg(410211055)
				local var_226_16 = arg_223_1:FormatText(var_226_15.content)

				arg_223_1.text_.text = var_226_16

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_17 = 25
				local var_226_18 = utf8.len(var_226_16)
				local var_226_19 = var_226_17 <= 0 and var_226_14 or var_226_14 * (var_226_18 / var_226_17)

				if var_226_19 > 0 and var_226_14 < var_226_19 then
					arg_223_1.talkMaxDuration = var_226_19

					if var_226_19 + var_226_13 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_19 + var_226_13
					end
				end

				arg_223_1.text_.text = var_226_16
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_20 = math.max(var_226_14, arg_223_1.talkMaxDuration)

			if var_226_13 <= arg_223_1.time_ and arg_223_1.time_ < var_226_13 + var_226_20 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_13) / var_226_20

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_13 + var_226_20 and arg_223_1.time_ < var_226_13 + var_226_20 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play410211056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410211056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play410211057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 1.275

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, false)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_2 = arg_227_1:GetWordFromCfg(410211056)
				local var_230_3 = arg_227_1:FormatText(var_230_2.content)

				arg_227_1.text_.text = var_230_3

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_4 = 51
				local var_230_5 = utf8.len(var_230_3)
				local var_230_6 = var_230_4 <= 0 and var_230_1 or var_230_1 * (var_230_5 / var_230_4)

				if var_230_6 > 0 and var_230_1 < var_230_6 then
					arg_227_1.talkMaxDuration = var_230_6

					if var_230_6 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_6 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_3
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_7 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_7 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_7

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_7 and arg_227_1.time_ < var_230_0 + var_230_7 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play410211057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410211057
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play410211058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.6

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_2 = arg_231_1:GetWordFromCfg(410211057)
				local var_234_3 = arg_231_1:FormatText(var_234_2.content)

				arg_231_1.text_.text = var_234_3

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_4 = 24
				local var_234_5 = utf8.len(var_234_3)
				local var_234_6 = var_234_4 <= 0 and var_234_1 or var_234_1 * (var_234_5 / var_234_4)

				if var_234_6 > 0 and var_234_1 < var_234_6 then
					arg_231_1.talkMaxDuration = var_234_6

					if var_234_6 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_6 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_3
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_7 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_7 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_7

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_7 and arg_231_1.time_ < var_234_0 + var_234_7 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410211058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410211058
		arg_235_1.duration_ = 6.1

		local var_235_0 = {
			ja = 6.1,
			CriLanguages = 3.466,
			zh = 3.466
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
				arg_235_0:Play410211059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10063"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos10063 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("10063", 3)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "split_3" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(0, -490, 18)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10063, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -490, 18)
			end

			local var_238_7 = arg_235_1.actors_["10063"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps10063 == nil then
				arg_235_1.var_.actorSpriteComps10063 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.034

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps10063 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 1, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps10063 then
				local var_238_12 = 1

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps10063 = nil
			end

			local var_238_13 = 0
			local var_238_14 = 0.275

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_15 = arg_235_1:FormatText(StoryNameCfg[591].name)

				arg_235_1.leftNameTxt_.text = var_238_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_16 = arg_235_1:GetWordFromCfg(410211058)
				local var_238_17 = arg_235_1:FormatText(var_238_16.content)

				arg_235_1.text_.text = var_238_17

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_18 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211058", "story_v_out_410211.awb") ~= 0 then
					local var_238_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211058", "story_v_out_410211.awb") / 1000

					if var_238_21 + var_238_13 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_21 + var_238_13
					end

					if var_238_16.prefab_name ~= "" and arg_235_1.actors_[var_238_16.prefab_name] ~= nil then
						local var_238_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_16.prefab_name].transform, "story_v_out_410211", "410211058", "story_v_out_410211.awb")

						arg_235_1:RecordAudio("410211058", var_238_22)
						arg_235_1:RecordAudio("410211058", var_238_22)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_410211", "410211058", "story_v_out_410211.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_410211", "410211058", "story_v_out_410211.awb")
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
	Play410211059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410211059
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play410211060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10063"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos10063 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("10063", 7)

				local var_242_2 = var_242_0.childCount

				for iter_242_0 = 0, var_242_2 - 1 do
					local var_242_3 = var_242_0:GetChild(iter_242_0)

					if var_242_3.name == "" or not string.find(var_242_3.name, "split") then
						var_242_3.gameObject:SetActive(true)
					else
						var_242_3.gameObject:SetActive(false)
					end
				end
			end

			local var_242_4 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_1) / var_242_4
				local var_242_6 = Vector3.New(0, -2000, 18)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos10063, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_242_7 = arg_239_1.actors_["10063"]
			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 and arg_239_1.var_.actorSpriteComps10063 == nil then
				arg_239_1.var_.actorSpriteComps10063 = var_242_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_9 = 0.034

			if var_242_8 <= arg_239_1.time_ and arg_239_1.time_ < var_242_8 + var_242_9 then
				local var_242_10 = (arg_239_1.time_ - var_242_8) / var_242_9

				if arg_239_1.var_.actorSpriteComps10063 then
					for iter_242_1, iter_242_2 in pairs(arg_239_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_242_2 then
							local var_242_11 = Mathf.Lerp(iter_242_2.color.r, 0.5, var_242_10)

							iter_242_2.color = Color.New(var_242_11, var_242_11, var_242_11)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_8 + var_242_9 and arg_239_1.time_ < var_242_8 + var_242_9 + arg_242_0 and arg_239_1.var_.actorSpriteComps10063 then
				local var_242_12 = 0.5

				for iter_242_3, iter_242_4 in pairs(arg_239_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_242_4 then
						iter_242_4.color = Color.New(var_242_12, var_242_12, var_242_12)
					end
				end

				arg_239_1.var_.actorSpriteComps10063 = nil
			end

			local var_242_13 = 0
			local var_242_14 = 1.7

			if var_242_13 < arg_239_1.time_ and arg_239_1.time_ <= var_242_13 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_15 = arg_239_1:GetWordFromCfg(410211059)
				local var_242_16 = arg_239_1:FormatText(var_242_15.content)

				arg_239_1.text_.text = var_242_16

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_17 = 68
				local var_242_18 = utf8.len(var_242_16)
				local var_242_19 = var_242_17 <= 0 and var_242_14 or var_242_14 * (var_242_18 / var_242_17)

				if var_242_19 > 0 and var_242_14 < var_242_19 then
					arg_239_1.talkMaxDuration = var_242_19

					if var_242_19 + var_242_13 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_19 + var_242_13
					end
				end

				arg_239_1.text_.text = var_242_16
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_20 = math.max(var_242_14, arg_239_1.talkMaxDuration)

			if var_242_13 <= arg_239_1.time_ and arg_239_1.time_ < var_242_13 + var_242_20 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_13) / var_242_20

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_13 + var_242_20 and arg_239_1.time_ < var_242_13 + var_242_20 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play410211060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410211060
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play410211061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 1.35

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_2 = arg_243_1:GetWordFromCfg(410211060)
				local var_246_3 = arg_243_1:FormatText(var_246_2.content)

				arg_243_1.text_.text = var_246_3

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_4 = 54
				local var_246_5 = utf8.len(var_246_3)
				local var_246_6 = var_246_4 <= 0 and var_246_1 or var_246_1 * (var_246_5 / var_246_4)

				if var_246_6 > 0 and var_246_1 < var_246_6 then
					arg_243_1.talkMaxDuration = var_246_6

					if var_246_6 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_6 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_3
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_7 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_7 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_7

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_7 and arg_243_1.time_ < var_246_0 + var_246_7 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play410211061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410211061
		arg_247_1.duration_ = 6.866

		local var_247_0 = {
			ja = 6.866,
			CriLanguages = 3.5,
			zh = 3.5
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
				arg_247_0:Play410211062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1061"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1061 = var_250_0.localPosition
				var_250_0.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1061", 2)

				local var_250_2 = var_250_0.childCount

				for iter_250_0 = 0, var_250_2 - 1 do
					local var_250_3 = var_250_0:GetChild(iter_250_0)

					if var_250_3.name == "split_5" or not string.find(var_250_3.name, "split") then
						var_250_3.gameObject:SetActive(true)
					else
						var_250_3.gameObject:SetActive(false)
					end
				end
			end

			local var_250_4 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_4 then
				local var_250_5 = (arg_247_1.time_ - var_250_1) / var_250_4
				local var_250_6 = Vector3.New(-390, -490, 18)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1061, var_250_6, var_250_5)
			end

			if arg_247_1.time_ >= var_250_1 + var_250_4 and arg_247_1.time_ < var_250_1 + var_250_4 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_250_7 = arg_247_1.actors_["10059"].transform
			local var_250_8 = 0

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 then
				arg_247_1.var_.moveOldPos10059 = var_250_7.localPosition
				var_250_7.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("10059", 4)

				local var_250_9 = var_250_7.childCount

				for iter_250_1 = 0, var_250_9 - 1 do
					local var_250_10 = var_250_7:GetChild(iter_250_1)

					if var_250_10.name == "" or not string.find(var_250_10.name, "split") then
						var_250_10.gameObject:SetActive(true)
					else
						var_250_10.gameObject:SetActive(false)
					end
				end
			end

			local var_250_11 = 0.001

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_8) / var_250_11
				local var_250_13 = Vector3.New(390, -530, 35)

				var_250_7.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos10059, var_250_13, var_250_12)
			end

			if arg_247_1.time_ >= var_250_8 + var_250_11 and arg_247_1.time_ < var_250_8 + var_250_11 + arg_250_0 then
				var_250_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_250_14 = arg_247_1.actors_["1061"]
			local var_250_15 = 0

			if var_250_15 < arg_247_1.time_ and arg_247_1.time_ <= var_250_15 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 == nil then
				arg_247_1.var_.actorSpriteComps1061 = var_250_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_16 = 0.034

			if var_250_15 <= arg_247_1.time_ and arg_247_1.time_ < var_250_15 + var_250_16 then
				local var_250_17 = (arg_247_1.time_ - var_250_15) / var_250_16

				if arg_247_1.var_.actorSpriteComps1061 then
					for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_250_3 then
							local var_250_18 = Mathf.Lerp(iter_250_3.color.r, 1, var_250_17)

							iter_250_3.color = Color.New(var_250_18, var_250_18, var_250_18)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_15 + var_250_16 and arg_247_1.time_ < var_250_15 + var_250_16 + arg_250_0 and arg_247_1.var_.actorSpriteComps1061 then
				local var_250_19 = 1

				for iter_250_4, iter_250_5 in pairs(arg_247_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_250_5 then
						iter_250_5.color = Color.New(var_250_19, var_250_19, var_250_19)
					end
				end

				arg_247_1.var_.actorSpriteComps1061 = nil
			end

			local var_250_20 = arg_247_1.actors_["10059"]
			local var_250_21 = 0

			if var_250_21 < arg_247_1.time_ and arg_247_1.time_ <= var_250_21 + arg_250_0 and arg_247_1.var_.actorSpriteComps10059 == nil then
				arg_247_1.var_.actorSpriteComps10059 = var_250_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_22 = 0.034

			if var_250_21 <= arg_247_1.time_ and arg_247_1.time_ < var_250_21 + var_250_22 then
				local var_250_23 = (arg_247_1.time_ - var_250_21) / var_250_22

				if arg_247_1.var_.actorSpriteComps10059 then
					for iter_250_6, iter_250_7 in pairs(arg_247_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_250_7 then
							local var_250_24 = Mathf.Lerp(iter_250_7.color.r, 0.5, var_250_23)

							iter_250_7.color = Color.New(var_250_24, var_250_24, var_250_24)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_21 + var_250_22 and arg_247_1.time_ < var_250_21 + var_250_22 + arg_250_0 and arg_247_1.var_.actorSpriteComps10059 then
				local var_250_25 = 0.5

				for iter_250_8, iter_250_9 in pairs(arg_247_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_250_9 then
						iter_250_9.color = Color.New(var_250_25, var_250_25, var_250_25)
					end
				end

				arg_247_1.var_.actorSpriteComps10059 = nil
			end

			local var_250_26 = 0
			local var_250_27 = 0.45

			if var_250_26 < arg_247_1.time_ and arg_247_1.time_ <= var_250_26 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_28 = arg_247_1:FormatText(StoryNameCfg[612].name)

				arg_247_1.leftNameTxt_.text = var_250_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_29 = arg_247_1:GetWordFromCfg(410211061)
				local var_250_30 = arg_247_1:FormatText(var_250_29.content)

				arg_247_1.text_.text = var_250_30

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_31 = 18
				local var_250_32 = utf8.len(var_250_30)
				local var_250_33 = var_250_31 <= 0 and var_250_27 or var_250_27 * (var_250_32 / var_250_31)

				if var_250_33 > 0 and var_250_27 < var_250_33 then
					arg_247_1.talkMaxDuration = var_250_33

					if var_250_33 + var_250_26 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_33 + var_250_26
					end
				end

				arg_247_1.text_.text = var_250_30
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211061", "story_v_out_410211.awb") ~= 0 then
					local var_250_34 = manager.audio:GetVoiceLength("story_v_out_410211", "410211061", "story_v_out_410211.awb") / 1000

					if var_250_34 + var_250_26 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_34 + var_250_26
					end

					if var_250_29.prefab_name ~= "" and arg_247_1.actors_[var_250_29.prefab_name] ~= nil then
						local var_250_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_29.prefab_name].transform, "story_v_out_410211", "410211061", "story_v_out_410211.awb")

						arg_247_1:RecordAudio("410211061", var_250_35)
						arg_247_1:RecordAudio("410211061", var_250_35)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410211", "410211061", "story_v_out_410211.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410211", "410211061", "story_v_out_410211.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_36 = math.max(var_250_27, arg_247_1.talkMaxDuration)

			if var_250_26 <= arg_247_1.time_ and arg_247_1.time_ < var_250_26 + var_250_36 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_26) / var_250_36

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_26 + var_250_36 and arg_247_1.time_ < var_250_26 + var_250_36 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play410211062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410211062
		arg_251_1.duration_ = 12.333

		local var_251_0 = {
			ja = 12.333,
			CriLanguages = 6.466,
			zh = 6.466
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
				arg_251_0:Play410211063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10059"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.actorSpriteComps10059 == nil then
				arg_251_1.var_.actorSpriteComps10059 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 0.034

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps10059 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_254_1 then
							local var_254_4 = Mathf.Lerp(iter_254_1.color.r, 1, var_254_3)

							iter_254_1.color = Color.New(var_254_4, var_254_4, var_254_4)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.actorSpriteComps10059 then
				local var_254_5 = 1

				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_254_3 then
						iter_254_3.color = Color.New(var_254_5, var_254_5, var_254_5)
					end
				end

				arg_251_1.var_.actorSpriteComps10059 = nil
			end

			local var_254_6 = arg_251_1.actors_["1061"]
			local var_254_7 = 0

			if var_254_7 < arg_251_1.time_ and arg_251_1.time_ <= var_254_7 + arg_254_0 and arg_251_1.var_.actorSpriteComps1061 == nil then
				arg_251_1.var_.actorSpriteComps1061 = var_254_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_8 = 0.034

			if var_254_7 <= arg_251_1.time_ and arg_251_1.time_ < var_254_7 + var_254_8 then
				local var_254_9 = (arg_251_1.time_ - var_254_7) / var_254_8

				if arg_251_1.var_.actorSpriteComps1061 then
					for iter_254_4, iter_254_5 in pairs(arg_251_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_254_5 then
							local var_254_10 = Mathf.Lerp(iter_254_5.color.r, 0.5, var_254_9)

							iter_254_5.color = Color.New(var_254_10, var_254_10, var_254_10)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_7 + var_254_8 and arg_251_1.time_ < var_254_7 + var_254_8 + arg_254_0 and arg_251_1.var_.actorSpriteComps1061 then
				local var_254_11 = 0.5

				for iter_254_6, iter_254_7 in pairs(arg_251_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_254_7 then
						iter_254_7.color = Color.New(var_254_11, var_254_11, var_254_11)
					end
				end

				arg_251_1.var_.actorSpriteComps1061 = nil
			end

			local var_254_12 = 0
			local var_254_13 = 0.825

			if var_254_12 < arg_251_1.time_ and arg_251_1.time_ <= var_254_12 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_14 = arg_251_1:FormatText(StoryNameCfg[596].name)

				arg_251_1.leftNameTxt_.text = var_254_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_15 = arg_251_1:GetWordFromCfg(410211062)
				local var_254_16 = arg_251_1:FormatText(var_254_15.content)

				arg_251_1.text_.text = var_254_16

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_17 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211062", "story_v_out_410211.awb") ~= 0 then
					local var_254_20 = manager.audio:GetVoiceLength("story_v_out_410211", "410211062", "story_v_out_410211.awb") / 1000

					if var_254_20 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_20 + var_254_12
					end

					if var_254_15.prefab_name ~= "" and arg_251_1.actors_[var_254_15.prefab_name] ~= nil then
						local var_254_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_15.prefab_name].transform, "story_v_out_410211", "410211062", "story_v_out_410211.awb")

						arg_251_1:RecordAudio("410211062", var_254_21)
						arg_251_1:RecordAudio("410211062", var_254_21)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_410211", "410211062", "story_v_out_410211.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_410211", "410211062", "story_v_out_410211.awb")
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
	Play410211063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410211063
		arg_255_1.duration_ = 3.366

		local var_255_0 = {
			ja = 3.366,
			CriLanguages = 1.4,
			zh = 1.4
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
				arg_255_0:Play410211064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1061"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1061 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1061", 2)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "split_5" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(-390, -490, 18)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1061, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_258_7 = arg_255_1.actors_["1061"]
			local var_258_8 = 0

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 and arg_255_1.var_.actorSpriteComps1061 == nil then
				arg_255_1.var_.actorSpriteComps1061 = var_258_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_9 = 0.034

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_9 then
				local var_258_10 = (arg_255_1.time_ - var_258_8) / var_258_9

				if arg_255_1.var_.actorSpriteComps1061 then
					for iter_258_1, iter_258_2 in pairs(arg_255_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_258_2 then
							local var_258_11 = Mathf.Lerp(iter_258_2.color.r, 1, var_258_10)

							iter_258_2.color = Color.New(var_258_11, var_258_11, var_258_11)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_8 + var_258_9 and arg_255_1.time_ < var_258_8 + var_258_9 + arg_258_0 and arg_255_1.var_.actorSpriteComps1061 then
				local var_258_12 = 1

				for iter_258_3, iter_258_4 in pairs(arg_255_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_258_4 then
						iter_258_4.color = Color.New(var_258_12, var_258_12, var_258_12)
					end
				end

				arg_255_1.var_.actorSpriteComps1061 = nil
			end

			local var_258_13 = arg_255_1.actors_["10059"]
			local var_258_14 = 0

			if var_258_14 < arg_255_1.time_ and arg_255_1.time_ <= var_258_14 + arg_258_0 and arg_255_1.var_.actorSpriteComps10059 == nil then
				arg_255_1.var_.actorSpriteComps10059 = var_258_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_15 = 0.034

			if var_258_14 <= arg_255_1.time_ and arg_255_1.time_ < var_258_14 + var_258_15 then
				local var_258_16 = (arg_255_1.time_ - var_258_14) / var_258_15

				if arg_255_1.var_.actorSpriteComps10059 then
					for iter_258_5, iter_258_6 in pairs(arg_255_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_258_6 then
							local var_258_17 = Mathf.Lerp(iter_258_6.color.r, 0.5, var_258_16)

							iter_258_6.color = Color.New(var_258_17, var_258_17, var_258_17)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_14 + var_258_15 and arg_255_1.time_ < var_258_14 + var_258_15 + arg_258_0 and arg_255_1.var_.actorSpriteComps10059 then
				local var_258_18 = 0.5

				for iter_258_7, iter_258_8 in pairs(arg_255_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_258_8 then
						iter_258_8.color = Color.New(var_258_18, var_258_18, var_258_18)
					end
				end

				arg_255_1.var_.actorSpriteComps10059 = nil
			end

			local var_258_19 = 0
			local var_258_20 = 0.175

			if var_258_19 < arg_255_1.time_ and arg_255_1.time_ <= var_258_19 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_21 = arg_255_1:FormatText(StoryNameCfg[612].name)

				arg_255_1.leftNameTxt_.text = var_258_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_22 = arg_255_1:GetWordFromCfg(410211063)
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211063", "story_v_out_410211.awb") ~= 0 then
					local var_258_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211063", "story_v_out_410211.awb") / 1000

					if var_258_27 + var_258_19 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_27 + var_258_19
					end

					if var_258_22.prefab_name ~= "" and arg_255_1.actors_[var_258_22.prefab_name] ~= nil then
						local var_258_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_22.prefab_name].transform, "story_v_out_410211", "410211063", "story_v_out_410211.awb")

						arg_255_1:RecordAudio("410211063", var_258_28)
						arg_255_1:RecordAudio("410211063", var_258_28)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_410211", "410211063", "story_v_out_410211.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_410211", "410211063", "story_v_out_410211.awb")
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
	Play410211064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410211064
		arg_259_1.duration_ = 4.633

		local var_259_0 = {
			ja = 4.266,
			CriLanguages = 4.633,
			zh = 4.633
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
				arg_259_0:Play410211065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1061"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.actorSpriteComps1061 == nil then
				arg_259_1.var_.actorSpriteComps1061 = var_262_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_2 = 0.034

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.actorSpriteComps1061 then
					for iter_262_0, iter_262_1 in pairs(arg_259_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_262_1 then
							local var_262_4 = Mathf.Lerp(iter_262_1.color.r, 0.5, var_262_3)

							iter_262_1.color = Color.New(var_262_4, var_262_4, var_262_4)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.actorSpriteComps1061 then
				local var_262_5 = 0.5

				for iter_262_2, iter_262_3 in pairs(arg_259_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_262_3 then
						iter_262_3.color = Color.New(var_262_5, var_262_5, var_262_5)
					end
				end

				arg_259_1.var_.actorSpriteComps1061 = nil
			end

			local var_262_6 = arg_259_1.actors_["10059"]
			local var_262_7 = 0

			if var_262_7 < arg_259_1.time_ and arg_259_1.time_ <= var_262_7 + arg_262_0 and arg_259_1.var_.actorSpriteComps10059 == nil then
				arg_259_1.var_.actorSpriteComps10059 = var_262_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_8 = 0.034

			if var_262_7 <= arg_259_1.time_ and arg_259_1.time_ < var_262_7 + var_262_8 then
				local var_262_9 = (arg_259_1.time_ - var_262_7) / var_262_8

				if arg_259_1.var_.actorSpriteComps10059 then
					for iter_262_4, iter_262_5 in pairs(arg_259_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_262_5 then
							local var_262_10 = Mathf.Lerp(iter_262_5.color.r, 1, var_262_9)

							iter_262_5.color = Color.New(var_262_10, var_262_10, var_262_10)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_7 + var_262_8 and arg_259_1.time_ < var_262_7 + var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps10059 then
				local var_262_11 = 1

				for iter_262_6, iter_262_7 in pairs(arg_259_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_262_7 then
						iter_262_7.color = Color.New(var_262_11, var_262_11, var_262_11)
					end
				end

				arg_259_1.var_.actorSpriteComps10059 = nil
			end

			local var_262_12 = 0
			local var_262_13 = 0.375

			if var_262_12 < arg_259_1.time_ and arg_259_1.time_ <= var_262_12 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_14 = arg_259_1:FormatText(StoryNameCfg[596].name)

				arg_259_1.leftNameTxt_.text = var_262_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_15 = arg_259_1:GetWordFromCfg(410211064)
				local var_262_16 = arg_259_1:FormatText(var_262_15.content)

				arg_259_1.text_.text = var_262_16

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_17 = 15
				local var_262_18 = utf8.len(var_262_16)
				local var_262_19 = var_262_17 <= 0 and var_262_13 or var_262_13 * (var_262_18 / var_262_17)

				if var_262_19 > 0 and var_262_13 < var_262_19 then
					arg_259_1.talkMaxDuration = var_262_19

					if var_262_19 + var_262_12 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_19 + var_262_12
					end
				end

				arg_259_1.text_.text = var_262_16
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211064", "story_v_out_410211.awb") ~= 0 then
					local var_262_20 = manager.audio:GetVoiceLength("story_v_out_410211", "410211064", "story_v_out_410211.awb") / 1000

					if var_262_20 + var_262_12 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_20 + var_262_12
					end

					if var_262_15.prefab_name ~= "" and arg_259_1.actors_[var_262_15.prefab_name] ~= nil then
						local var_262_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_15.prefab_name].transform, "story_v_out_410211", "410211064", "story_v_out_410211.awb")

						arg_259_1:RecordAudio("410211064", var_262_21)
						arg_259_1:RecordAudio("410211064", var_262_21)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410211", "410211064", "story_v_out_410211.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410211", "410211064", "story_v_out_410211.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_22 = math.max(var_262_13, arg_259_1.talkMaxDuration)

			if var_262_12 <= arg_259_1.time_ and arg_259_1.time_ < var_262_12 + var_262_22 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_12) / var_262_22

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_12 + var_262_22 and arg_259_1.time_ < var_262_12 + var_262_22 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410211065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410211065
		arg_263_1.duration_ = 9.4

		local var_263_0 = {
			ja = 8.9,
			CriLanguages = 9.4,
			zh = 9.4
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
				arg_263_0:Play410211066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1061"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.actorSpriteComps1061 == nil then
				arg_263_1.var_.actorSpriteComps1061 = var_266_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_2 = 0.034

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.actorSpriteComps1061 then
					for iter_266_0, iter_266_1 in pairs(arg_263_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_266_1 then
							local var_266_4 = Mathf.Lerp(iter_266_1.color.r, 1, var_266_3)

							iter_266_1.color = Color.New(var_266_4, var_266_4, var_266_4)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.actorSpriteComps1061 then
				local var_266_5 = 1

				for iter_266_2, iter_266_3 in pairs(arg_263_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_266_3 then
						iter_266_3.color = Color.New(var_266_5, var_266_5, var_266_5)
					end
				end

				arg_263_1.var_.actorSpriteComps1061 = nil
			end

			local var_266_6 = arg_263_1.actors_["10059"]
			local var_266_7 = 0

			if var_266_7 < arg_263_1.time_ and arg_263_1.time_ <= var_266_7 + arg_266_0 and arg_263_1.var_.actorSpriteComps10059 == nil then
				arg_263_1.var_.actorSpriteComps10059 = var_266_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_8 = 0.034

			if var_266_7 <= arg_263_1.time_ and arg_263_1.time_ < var_266_7 + var_266_8 then
				local var_266_9 = (arg_263_1.time_ - var_266_7) / var_266_8

				if arg_263_1.var_.actorSpriteComps10059 then
					for iter_266_4, iter_266_5 in pairs(arg_263_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_266_5 then
							local var_266_10 = Mathf.Lerp(iter_266_5.color.r, 0.5, var_266_9)

							iter_266_5.color = Color.New(var_266_10, var_266_10, var_266_10)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_7 + var_266_8 and arg_263_1.time_ < var_266_7 + var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps10059 then
				local var_266_11 = 0.5

				for iter_266_6, iter_266_7 in pairs(arg_263_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_266_7 then
						iter_266_7.color = Color.New(var_266_11, var_266_11, var_266_11)
					end
				end

				arg_263_1.var_.actorSpriteComps10059 = nil
			end

			local var_266_12 = 0
			local var_266_13 = 1.025

			if var_266_12 < arg_263_1.time_ and arg_263_1.time_ <= var_266_12 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_14 = arg_263_1:FormatText(StoryNameCfg[612].name)

				arg_263_1.leftNameTxt_.text = var_266_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_15 = arg_263_1:GetWordFromCfg(410211065)
				local var_266_16 = arg_263_1:FormatText(var_266_15.content)

				arg_263_1.text_.text = var_266_16

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_17 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211065", "story_v_out_410211.awb") ~= 0 then
					local var_266_20 = manager.audio:GetVoiceLength("story_v_out_410211", "410211065", "story_v_out_410211.awb") / 1000

					if var_266_20 + var_266_12 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_20 + var_266_12
					end

					if var_266_15.prefab_name ~= "" and arg_263_1.actors_[var_266_15.prefab_name] ~= nil then
						local var_266_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_15.prefab_name].transform, "story_v_out_410211", "410211065", "story_v_out_410211.awb")

						arg_263_1:RecordAudio("410211065", var_266_21)
						arg_263_1:RecordAudio("410211065", var_266_21)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_410211", "410211065", "story_v_out_410211.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_410211", "410211065", "story_v_out_410211.awb")
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
	Play410211066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410211066
		arg_267_1.duration_ = 6

		local var_267_0 = {
			ja = 6,
			CriLanguages = 1.466,
			zh = 1.466
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
				arg_267_0:Play410211067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1061"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 == nil then
				arg_267_1.var_.actorSpriteComps1061 = var_270_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_2 = 0.034

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.actorSpriteComps1061 then
					for iter_270_0, iter_270_1 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_270_1 then
							local var_270_4 = Mathf.Lerp(iter_270_1.color.r, 0.5, var_270_3)

							iter_270_1.color = Color.New(var_270_4, var_270_4, var_270_4)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 then
				local var_270_5 = 0.5

				for iter_270_2, iter_270_3 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_270_3 then
						iter_270_3.color = Color.New(var_270_5, var_270_5, var_270_5)
					end
				end

				arg_267_1.var_.actorSpriteComps1061 = nil
			end

			local var_270_6 = arg_267_1.actors_["10059"]
			local var_270_7 = 0

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 and arg_267_1.var_.actorSpriteComps10059 == nil then
				arg_267_1.var_.actorSpriteComps10059 = var_270_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_8 = 0.034

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_8 then
				local var_270_9 = (arg_267_1.time_ - var_270_7) / var_270_8

				if arg_267_1.var_.actorSpriteComps10059 then
					for iter_270_4, iter_270_5 in pairs(arg_267_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_270_5 then
							local var_270_10 = Mathf.Lerp(iter_270_5.color.r, 1, var_270_9)

							iter_270_5.color = Color.New(var_270_10, var_270_10, var_270_10)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_7 + var_270_8 and arg_267_1.time_ < var_270_7 + var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps10059 then
				local var_270_11 = 1

				for iter_270_6, iter_270_7 in pairs(arg_267_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_270_7 then
						iter_270_7.color = Color.New(var_270_11, var_270_11, var_270_11)
					end
				end

				arg_267_1.var_.actorSpriteComps10059 = nil
			end

			local var_270_12 = 0
			local var_270_13 = 0.2

			if var_270_12 < arg_267_1.time_ and arg_267_1.time_ <= var_270_12 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_14 = arg_267_1:FormatText(StoryNameCfg[596].name)

				arg_267_1.leftNameTxt_.text = var_270_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_15 = arg_267_1:GetWordFromCfg(410211066)
				local var_270_16 = arg_267_1:FormatText(var_270_15.content)

				arg_267_1.text_.text = var_270_16

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_17 = 8
				local var_270_18 = utf8.len(var_270_16)
				local var_270_19 = var_270_17 <= 0 and var_270_13 or var_270_13 * (var_270_18 / var_270_17)

				if var_270_19 > 0 and var_270_13 < var_270_19 then
					arg_267_1.talkMaxDuration = var_270_19

					if var_270_19 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_12
					end
				end

				arg_267_1.text_.text = var_270_16
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211066", "story_v_out_410211.awb") ~= 0 then
					local var_270_20 = manager.audio:GetVoiceLength("story_v_out_410211", "410211066", "story_v_out_410211.awb") / 1000

					if var_270_20 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_12
					end

					if var_270_15.prefab_name ~= "" and arg_267_1.actors_[var_270_15.prefab_name] ~= nil then
						local var_270_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_15.prefab_name].transform, "story_v_out_410211", "410211066", "story_v_out_410211.awb")

						arg_267_1:RecordAudio("410211066", var_270_21)
						arg_267_1:RecordAudio("410211066", var_270_21)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_410211", "410211066", "story_v_out_410211.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_410211", "410211066", "story_v_out_410211.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_22 = math.max(var_270_13, arg_267_1.talkMaxDuration)

			if var_270_12 <= arg_267_1.time_ and arg_267_1.time_ < var_270_12 + var_270_22 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_12) / var_270_22

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_12 + var_270_22 and arg_267_1.time_ < var_270_12 + var_270_22 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play410211067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410211067
		arg_271_1.duration_ = 3.2

		local var_271_0 = {
			ja = 3.2,
			CriLanguages = 1.4,
			zh = 1.4
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
				arg_271_0:Play410211068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1061"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 == nil then
				arg_271_1.var_.actorSpriteComps1061 = var_274_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_2 = 0.034

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.actorSpriteComps1061 then
					for iter_274_0, iter_274_1 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_274_1 then
							local var_274_4 = Mathf.Lerp(iter_274_1.color.r, 1, var_274_3)

							iter_274_1.color = Color.New(var_274_4, var_274_4, var_274_4)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 then
				local var_274_5 = 1

				for iter_274_2, iter_274_3 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_274_3 then
						iter_274_3.color = Color.New(var_274_5, var_274_5, var_274_5)
					end
				end

				arg_271_1.var_.actorSpriteComps1061 = nil
			end

			local var_274_6 = arg_271_1.actors_["10059"]
			local var_274_7 = 0

			if var_274_7 < arg_271_1.time_ and arg_271_1.time_ <= var_274_7 + arg_274_0 and arg_271_1.var_.actorSpriteComps10059 == nil then
				arg_271_1.var_.actorSpriteComps10059 = var_274_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_8 = 0.034

			if var_274_7 <= arg_271_1.time_ and arg_271_1.time_ < var_274_7 + var_274_8 then
				local var_274_9 = (arg_271_1.time_ - var_274_7) / var_274_8

				if arg_271_1.var_.actorSpriteComps10059 then
					for iter_274_4, iter_274_5 in pairs(arg_271_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_274_5 then
							local var_274_10 = Mathf.Lerp(iter_274_5.color.r, 0.5, var_274_9)

							iter_274_5.color = Color.New(var_274_10, var_274_10, var_274_10)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_7 + var_274_8 and arg_271_1.time_ < var_274_7 + var_274_8 + arg_274_0 and arg_271_1.var_.actorSpriteComps10059 then
				local var_274_11 = 0.5

				for iter_274_6, iter_274_7 in pairs(arg_271_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_274_7 then
						iter_274_7.color = Color.New(var_274_11, var_274_11, var_274_11)
					end
				end

				arg_271_1.var_.actorSpriteComps10059 = nil
			end

			local var_274_12 = 0
			local var_274_13 = 0.175

			if var_274_12 < arg_271_1.time_ and arg_271_1.time_ <= var_274_12 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_14 = arg_271_1:FormatText(StoryNameCfg[612].name)

				arg_271_1.leftNameTxt_.text = var_274_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_15 = arg_271_1:GetWordFromCfg(410211067)
				local var_274_16 = arg_271_1:FormatText(var_274_15.content)

				arg_271_1.text_.text = var_274_16

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_17 = 7
				local var_274_18 = utf8.len(var_274_16)
				local var_274_19 = var_274_17 <= 0 and var_274_13 or var_274_13 * (var_274_18 / var_274_17)

				if var_274_19 > 0 and var_274_13 < var_274_19 then
					arg_271_1.talkMaxDuration = var_274_19

					if var_274_19 + var_274_12 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_12
					end
				end

				arg_271_1.text_.text = var_274_16
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211067", "story_v_out_410211.awb") ~= 0 then
					local var_274_20 = manager.audio:GetVoiceLength("story_v_out_410211", "410211067", "story_v_out_410211.awb") / 1000

					if var_274_20 + var_274_12 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_20 + var_274_12
					end

					if var_274_15.prefab_name ~= "" and arg_271_1.actors_[var_274_15.prefab_name] ~= nil then
						local var_274_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_15.prefab_name].transform, "story_v_out_410211", "410211067", "story_v_out_410211.awb")

						arg_271_1:RecordAudio("410211067", var_274_21)
						arg_271_1:RecordAudio("410211067", var_274_21)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_410211", "410211067", "story_v_out_410211.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_410211", "410211067", "story_v_out_410211.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_22 = math.max(var_274_13, arg_271_1.talkMaxDuration)

			if var_274_12 <= arg_271_1.time_ and arg_271_1.time_ < var_274_12 + var_274_22 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_12) / var_274_22

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_12 + var_274_22 and arg_271_1.time_ < var_274_12 + var_274_22 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410211068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 410211068
		arg_275_1.duration_ = 13.1

		local var_275_0 = {
			ja = 13.1,
			CriLanguages = 9.066,
			zh = 9.066
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
				arg_275_0:Play410211069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1061"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1061 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1061", 2)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(-390, -490, 18)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1061, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_278_7 = arg_275_1.actors_["1061"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 == nil then
				arg_275_1.var_.actorSpriteComps1061 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.034

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1061 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1061 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 1.1

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[612].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(410211068)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211068", "story_v_out_410211.awb") ~= 0 then
					local var_278_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211068", "story_v_out_410211.awb") / 1000

					if var_278_21 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_21 + var_278_13
					end

					if var_278_16.prefab_name ~= "" and arg_275_1.actors_[var_278_16.prefab_name] ~= nil then
						local var_278_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_16.prefab_name].transform, "story_v_out_410211", "410211068", "story_v_out_410211.awb")

						arg_275_1:RecordAudio("410211068", var_278_22)
						arg_275_1:RecordAudio("410211068", var_278_22)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_410211", "410211068", "story_v_out_410211.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_410211", "410211068", "story_v_out_410211.awb")
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
	Play410211069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 410211069
		arg_279_1.duration_ = 8.1

		local var_279_0 = {
			ja = 8.1,
			CriLanguages = 5.066,
			zh = 5.066
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
				arg_279_0:Play410211070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1061"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1061 = var_282_0.localPosition
				var_282_0.localScale = Vector3.New(1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("1061", 2)

				local var_282_2 = var_282_0.childCount

				for iter_282_0 = 0, var_282_2 - 1 do
					local var_282_3 = var_282_0:GetChild(iter_282_0)

					if var_282_3.name == "" or not string.find(var_282_3.name, "split") then
						var_282_3.gameObject:SetActive(true)
					else
						var_282_3.gameObject:SetActive(false)
					end
				end
			end

			local var_282_4 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_4 then
				local var_282_5 = (arg_279_1.time_ - var_282_1) / var_282_4
				local var_282_6 = Vector3.New(-390, -490, 18)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1061, var_282_6, var_282_5)
			end

			if arg_279_1.time_ >= var_282_1 + var_282_4 and arg_279_1.time_ < var_282_1 + var_282_4 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_282_7 = arg_279_1.actors_["1061"]
			local var_282_8 = 0

			if var_282_8 < arg_279_1.time_ and arg_279_1.time_ <= var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps1061 == nil then
				arg_279_1.var_.actorSpriteComps1061 = var_282_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_9 = 0.034

			if var_282_8 <= arg_279_1.time_ and arg_279_1.time_ < var_282_8 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_8) / var_282_9

				if arg_279_1.var_.actorSpriteComps1061 then
					for iter_282_1, iter_282_2 in pairs(arg_279_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_282_2 then
							local var_282_11 = Mathf.Lerp(iter_282_2.color.r, 1, var_282_10)

							iter_282_2.color = Color.New(var_282_11, var_282_11, var_282_11)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_8 + var_282_9 and arg_279_1.time_ < var_282_8 + var_282_9 + arg_282_0 and arg_279_1.var_.actorSpriteComps1061 then
				local var_282_12 = 1

				for iter_282_3, iter_282_4 in pairs(arg_279_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_282_4 then
						iter_282_4.color = Color.New(var_282_12, var_282_12, var_282_12)
					end
				end

				arg_279_1.var_.actorSpriteComps1061 = nil
			end

			local var_282_13 = 0
			local var_282_14 = 0.675

			if var_282_13 < arg_279_1.time_ and arg_279_1.time_ <= var_282_13 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_15 = arg_279_1:FormatText(StoryNameCfg[612].name)

				arg_279_1.leftNameTxt_.text = var_282_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_16 = arg_279_1:GetWordFromCfg(410211069)
				local var_282_17 = arg_279_1:FormatText(var_282_16.content)

				arg_279_1.text_.text = var_282_17

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_18 = 27
				local var_282_19 = utf8.len(var_282_17)
				local var_282_20 = var_282_18 <= 0 and var_282_14 or var_282_14 * (var_282_19 / var_282_18)

				if var_282_20 > 0 and var_282_14 < var_282_20 then
					arg_279_1.talkMaxDuration = var_282_20

					if var_282_20 + var_282_13 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_13
					end
				end

				arg_279_1.text_.text = var_282_17
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211069", "story_v_out_410211.awb") ~= 0 then
					local var_282_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211069", "story_v_out_410211.awb") / 1000

					if var_282_21 + var_282_13 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_21 + var_282_13
					end

					if var_282_16.prefab_name ~= "" and arg_279_1.actors_[var_282_16.prefab_name] ~= nil then
						local var_282_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_16.prefab_name].transform, "story_v_out_410211", "410211069", "story_v_out_410211.awb")

						arg_279_1:RecordAudio("410211069", var_282_22)
						arg_279_1:RecordAudio("410211069", var_282_22)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_410211", "410211069", "story_v_out_410211.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_410211", "410211069", "story_v_out_410211.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_23 = math.max(var_282_14, arg_279_1.talkMaxDuration)

			if var_282_13 <= arg_279_1.time_ and arg_279_1.time_ < var_282_13 + var_282_23 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_13) / var_282_23

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_13 + var_282_23 and arg_279_1.time_ < var_282_13 + var_282_23 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play410211070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 410211070
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play410211071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1061"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.actorSpriteComps1061 == nil then
				arg_283_1.var_.actorSpriteComps1061 = var_286_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_2 = 0.034

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.actorSpriteComps1061 then
					for iter_286_0, iter_286_1 in pairs(arg_283_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_286_1 then
							local var_286_4 = Mathf.Lerp(iter_286_1.color.r, 0.5, var_286_3)

							iter_286_1.color = Color.New(var_286_4, var_286_4, var_286_4)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.actorSpriteComps1061 then
				local var_286_5 = 0.5

				for iter_286_2, iter_286_3 in pairs(arg_283_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_286_3 then
						iter_286_3.color = Color.New(var_286_5, var_286_5, var_286_5)
					end
				end

				arg_283_1.var_.actorSpriteComps1061 = nil
			end

			local var_286_6 = 0
			local var_286_7 = 1.325

			if var_286_6 < arg_283_1.time_ and arg_283_1.time_ <= var_286_6 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, false)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_8 = arg_283_1:GetWordFromCfg(410211070)
				local var_286_9 = arg_283_1:FormatText(var_286_8.content)

				arg_283_1.text_.text = var_286_9

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_10 = 53
				local var_286_11 = utf8.len(var_286_9)
				local var_286_12 = var_286_10 <= 0 and var_286_7 or var_286_7 * (var_286_11 / var_286_10)

				if var_286_12 > 0 and var_286_7 < var_286_12 then
					arg_283_1.talkMaxDuration = var_286_12

					if var_286_12 + var_286_6 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_12 + var_286_6
					end
				end

				arg_283_1.text_.text = var_286_9
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_13 = math.max(var_286_7, arg_283_1.talkMaxDuration)

			if var_286_6 <= arg_283_1.time_ and arg_283_1.time_ < var_286_6 + var_286_13 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_6) / var_286_13

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_6 + var_286_13 and arg_283_1.time_ < var_286_6 + var_286_13 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play410211071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 410211071
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play410211072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 1.225

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_2 = arg_287_1:GetWordFromCfg(410211071)
				local var_290_3 = arg_287_1:FormatText(var_290_2.content)

				arg_287_1.text_.text = var_290_3

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_4 = 49
				local var_290_5 = utf8.len(var_290_3)
				local var_290_6 = var_290_4 <= 0 and var_290_1 or var_290_1 * (var_290_5 / var_290_4)

				if var_290_6 > 0 and var_290_1 < var_290_6 then
					arg_287_1.talkMaxDuration = var_290_6

					if var_290_6 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_6 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_3
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_7 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_7 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_7

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_7 and arg_287_1.time_ < var_290_0 + var_290_7 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play410211072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 410211072
		arg_291_1.duration_ = 1.5

		local var_291_0 = {
			ja = 1.5,
			CriLanguages = 1.133,
			zh = 1.133
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play410211073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1061"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1061 = var_294_0.localPosition
				var_294_0.localScale = Vector3.New(1, 1, 1)

				arg_291_1:CheckSpriteTmpPos("1061", 2)

				local var_294_2 = var_294_0.childCount

				for iter_294_0 = 0, var_294_2 - 1 do
					local var_294_3 = var_294_0:GetChild(iter_294_0)

					if var_294_3.name == "split_5" or not string.find(var_294_3.name, "split") then
						var_294_3.gameObject:SetActive(true)
					else
						var_294_3.gameObject:SetActive(false)
					end
				end
			end

			local var_294_4 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_4 then
				local var_294_5 = (arg_291_1.time_ - var_294_1) / var_294_4
				local var_294_6 = Vector3.New(-390, -490, 18)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1061, var_294_6, var_294_5)
			end

			if arg_291_1.time_ >= var_294_1 + var_294_4 and arg_291_1.time_ < var_294_1 + var_294_4 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_294_7 = arg_291_1.actors_["1061"]
			local var_294_8 = 0

			if var_294_8 < arg_291_1.time_ and arg_291_1.time_ <= var_294_8 + arg_294_0 and arg_291_1.var_.actorSpriteComps1061 == nil then
				arg_291_1.var_.actorSpriteComps1061 = var_294_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_9 = 0.034

			if var_294_8 <= arg_291_1.time_ and arg_291_1.time_ < var_294_8 + var_294_9 then
				local var_294_10 = (arg_291_1.time_ - var_294_8) / var_294_9

				if arg_291_1.var_.actorSpriteComps1061 then
					for iter_294_1, iter_294_2 in pairs(arg_291_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_294_2 then
							local var_294_11 = Mathf.Lerp(iter_294_2.color.r, 1, var_294_10)

							iter_294_2.color = Color.New(var_294_11, var_294_11, var_294_11)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_8 + var_294_9 and arg_291_1.time_ < var_294_8 + var_294_9 + arg_294_0 and arg_291_1.var_.actorSpriteComps1061 then
				local var_294_12 = 1

				for iter_294_3, iter_294_4 in pairs(arg_291_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_294_4 then
						iter_294_4.color = Color.New(var_294_12, var_294_12, var_294_12)
					end
				end

				arg_291_1.var_.actorSpriteComps1061 = nil
			end

			local var_294_13 = 0
			local var_294_14 = 0.125

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_15 = arg_291_1:FormatText(StoryNameCfg[612].name)

				arg_291_1.leftNameTxt_.text = var_294_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_16 = arg_291_1:GetWordFromCfg(410211072)
				local var_294_17 = arg_291_1:FormatText(var_294_16.content)

				arg_291_1.text_.text = var_294_17

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_18 = 5
				local var_294_19 = utf8.len(var_294_17)
				local var_294_20 = var_294_18 <= 0 and var_294_14 or var_294_14 * (var_294_19 / var_294_18)

				if var_294_20 > 0 and var_294_14 < var_294_20 then
					arg_291_1.talkMaxDuration = var_294_20

					if var_294_20 + var_294_13 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_20 + var_294_13
					end
				end

				arg_291_1.text_.text = var_294_17
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211072", "story_v_out_410211.awb") ~= 0 then
					local var_294_21 = manager.audio:GetVoiceLength("story_v_out_410211", "410211072", "story_v_out_410211.awb") / 1000

					if var_294_21 + var_294_13 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_21 + var_294_13
					end

					if var_294_16.prefab_name ~= "" and arg_291_1.actors_[var_294_16.prefab_name] ~= nil then
						local var_294_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_16.prefab_name].transform, "story_v_out_410211", "410211072", "story_v_out_410211.awb")

						arg_291_1:RecordAudio("410211072", var_294_22)
						arg_291_1:RecordAudio("410211072", var_294_22)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_410211", "410211072", "story_v_out_410211.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_410211", "410211072", "story_v_out_410211.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_23 = math.max(var_294_14, arg_291_1.talkMaxDuration)

			if var_294_13 <= arg_291_1.time_ and arg_291_1.time_ < var_294_13 + var_294_23 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_13) / var_294_23

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_13 + var_294_23 and arg_291_1.time_ < var_294_13 + var_294_23 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play410211073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 410211073
		arg_295_1.duration_ = 9.166

		local var_295_0 = {
			ja = 9.166,
			CriLanguages = 6.566,
			zh = 6.566
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
				arg_295_0:Play410211074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1061"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.actorSpriteComps1061 == nil then
				arg_295_1.var_.actorSpriteComps1061 = var_298_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_2 = 0.034

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.actorSpriteComps1061 then
					for iter_298_0, iter_298_1 in pairs(arg_295_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_298_1 then
							local var_298_4 = Mathf.Lerp(iter_298_1.color.r, 0.5, var_298_3)

							iter_298_1.color = Color.New(var_298_4, var_298_4, var_298_4)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.actorSpriteComps1061 then
				local var_298_5 = 0.5

				for iter_298_2, iter_298_3 in pairs(arg_295_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_298_3 then
						iter_298_3.color = Color.New(var_298_5, var_298_5, var_298_5)
					end
				end

				arg_295_1.var_.actorSpriteComps1061 = nil
			end

			local var_298_6 = arg_295_1.actors_["10059"]
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 and arg_295_1.var_.actorSpriteComps10059 == nil then
				arg_295_1.var_.actorSpriteComps10059 = var_298_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_8 = 0.034

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_8 then
				local var_298_9 = (arg_295_1.time_ - var_298_7) / var_298_8

				if arg_295_1.var_.actorSpriteComps10059 then
					for iter_298_4, iter_298_5 in pairs(arg_295_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_298_5 then
							local var_298_10 = Mathf.Lerp(iter_298_5.color.r, 1, var_298_9)

							iter_298_5.color = Color.New(var_298_10, var_298_10, var_298_10)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_7 + var_298_8 and arg_295_1.time_ < var_298_7 + var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps10059 then
				local var_298_11 = 1

				for iter_298_6, iter_298_7 in pairs(arg_295_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_298_7 then
						iter_298_7.color = Color.New(var_298_11, var_298_11, var_298_11)
					end
				end

				arg_295_1.var_.actorSpriteComps10059 = nil
			end

			local var_298_12 = 0
			local var_298_13 = 0.675

			if var_298_12 < arg_295_1.time_ and arg_295_1.time_ <= var_298_12 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_14 = arg_295_1:FormatText(StoryNameCfg[596].name)

				arg_295_1.leftNameTxt_.text = var_298_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_15 = arg_295_1:GetWordFromCfg(410211073)
				local var_298_16 = arg_295_1:FormatText(var_298_15.content)

				arg_295_1.text_.text = var_298_16

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_17 = 27
				local var_298_18 = utf8.len(var_298_16)
				local var_298_19 = var_298_17 <= 0 and var_298_13 or var_298_13 * (var_298_18 / var_298_17)

				if var_298_19 > 0 and var_298_13 < var_298_19 then
					arg_295_1.talkMaxDuration = var_298_19

					if var_298_19 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_19 + var_298_12
					end
				end

				arg_295_1.text_.text = var_298_16
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211073", "story_v_out_410211.awb") ~= 0 then
					local var_298_20 = manager.audio:GetVoiceLength("story_v_out_410211", "410211073", "story_v_out_410211.awb") / 1000

					if var_298_20 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_12
					end

					if var_298_15.prefab_name ~= "" and arg_295_1.actors_[var_298_15.prefab_name] ~= nil then
						local var_298_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_15.prefab_name].transform, "story_v_out_410211", "410211073", "story_v_out_410211.awb")

						arg_295_1:RecordAudio("410211073", var_298_21)
						arg_295_1:RecordAudio("410211073", var_298_21)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_410211", "410211073", "story_v_out_410211.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_410211", "410211073", "story_v_out_410211.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_22 = math.max(var_298_13, arg_295_1.talkMaxDuration)

			if var_298_12 <= arg_295_1.time_ and arg_295_1.time_ < var_298_12 + var_298_22 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_12) / var_298_22

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_12 + var_298_22 and arg_295_1.time_ < var_298_12 + var_298_22 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play410211074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 410211074
		arg_299_1.duration_ = 2.833

		local var_299_0 = {
			ja = 2.833,
			CriLanguages = 2.466,
			zh = 2.466
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
				arg_299_0:Play410211075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1061"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos1061 = var_302_0.localPosition
				var_302_0.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("1061", 2)

				local var_302_2 = var_302_0.childCount

				for iter_302_0 = 0, var_302_2 - 1 do
					local var_302_3 = var_302_0:GetChild(iter_302_0)

					if var_302_3.name == "" or not string.find(var_302_3.name, "split") then
						var_302_3.gameObject:SetActive(true)
					else
						var_302_3.gameObject:SetActive(false)
					end
				end
			end

			local var_302_4 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_4 then
				local var_302_5 = (arg_299_1.time_ - var_302_1) / var_302_4
				local var_302_6 = Vector3.New(-390, -490, 18)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1061, var_302_6, var_302_5)
			end

			if arg_299_1.time_ >= var_302_1 + var_302_4 and arg_299_1.time_ < var_302_1 + var_302_4 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_302_7 = arg_299_1.actors_["1061"]
			local var_302_8 = 0

			if var_302_8 < arg_299_1.time_ and arg_299_1.time_ <= var_302_8 + arg_302_0 and arg_299_1.var_.actorSpriteComps1061 == nil then
				arg_299_1.var_.actorSpriteComps1061 = var_302_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_9 = 0.034

			if var_302_8 <= arg_299_1.time_ and arg_299_1.time_ < var_302_8 + var_302_9 then
				local var_302_10 = (arg_299_1.time_ - var_302_8) / var_302_9

				if arg_299_1.var_.actorSpriteComps1061 then
					for iter_302_1, iter_302_2 in pairs(arg_299_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_302_2 then
							local var_302_11 = Mathf.Lerp(iter_302_2.color.r, 1, var_302_10)

							iter_302_2.color = Color.New(var_302_11, var_302_11, var_302_11)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_8 + var_302_9 and arg_299_1.time_ < var_302_8 + var_302_9 + arg_302_0 and arg_299_1.var_.actorSpriteComps1061 then
				local var_302_12 = 1

				for iter_302_3, iter_302_4 in pairs(arg_299_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_302_4 then
						iter_302_4.color = Color.New(var_302_12, var_302_12, var_302_12)
					end
				end

				arg_299_1.var_.actorSpriteComps1061 = nil
			end

			local var_302_13 = arg_299_1.actors_["10059"]
			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 and arg_299_1.var_.actorSpriteComps10059 == nil then
				arg_299_1.var_.actorSpriteComps10059 = var_302_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_15 = 0.034

			if var_302_14 <= arg_299_1.time_ and arg_299_1.time_ < var_302_14 + var_302_15 then
				local var_302_16 = (arg_299_1.time_ - var_302_14) / var_302_15

				if arg_299_1.var_.actorSpriteComps10059 then
					for iter_302_5, iter_302_6 in pairs(arg_299_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_302_6 then
							local var_302_17 = Mathf.Lerp(iter_302_6.color.r, 0.5, var_302_16)

							iter_302_6.color = Color.New(var_302_17, var_302_17, var_302_17)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_14 + var_302_15 and arg_299_1.time_ < var_302_14 + var_302_15 + arg_302_0 and arg_299_1.var_.actorSpriteComps10059 then
				local var_302_18 = 0.5

				for iter_302_7, iter_302_8 in pairs(arg_299_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_302_8 then
						iter_302_8.color = Color.New(var_302_18, var_302_18, var_302_18)
					end
				end

				arg_299_1.var_.actorSpriteComps10059 = nil
			end

			local var_302_19 = 0
			local var_302_20 = 0.225

			if var_302_19 < arg_299_1.time_ and arg_299_1.time_ <= var_302_19 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_21 = arg_299_1:FormatText(StoryNameCfg[612].name)

				arg_299_1.leftNameTxt_.text = var_302_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_22 = arg_299_1:GetWordFromCfg(410211074)
				local var_302_23 = arg_299_1:FormatText(var_302_22.content)

				arg_299_1.text_.text = var_302_23

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_24 = 9
				local var_302_25 = utf8.len(var_302_23)
				local var_302_26 = var_302_24 <= 0 and var_302_20 or var_302_20 * (var_302_25 / var_302_24)

				if var_302_26 > 0 and var_302_20 < var_302_26 then
					arg_299_1.talkMaxDuration = var_302_26

					if var_302_26 + var_302_19 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_26 + var_302_19
					end
				end

				arg_299_1.text_.text = var_302_23
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410211", "410211074", "story_v_out_410211.awb") ~= 0 then
					local var_302_27 = manager.audio:GetVoiceLength("story_v_out_410211", "410211074", "story_v_out_410211.awb") / 1000

					if var_302_27 + var_302_19 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_27 + var_302_19
					end

					if var_302_22.prefab_name ~= "" and arg_299_1.actors_[var_302_22.prefab_name] ~= nil then
						local var_302_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_22.prefab_name].transform, "story_v_out_410211", "410211074", "story_v_out_410211.awb")

						arg_299_1:RecordAudio("410211074", var_302_28)
						arg_299_1:RecordAudio("410211074", var_302_28)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_410211", "410211074", "story_v_out_410211.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_410211", "410211074", "story_v_out_410211.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_29 = math.max(var_302_20, arg_299_1.talkMaxDuration)

			if var_302_19 <= arg_299_1.time_ and arg_299_1.time_ < var_302_19 + var_302_29 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_19) / var_302_29

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_19 + var_302_29 and arg_299_1.time_ < var_302_19 + var_302_29 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play410211075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 410211075
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
			arg_303_1.auto_ = false
		end

		function arg_303_1.playNext_(arg_305_0)
			arg_303_1.onStoryFinished_()
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1061"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1061 = var_306_0.localPosition
				var_306_0.localScale = Vector3.New(1, 1, 1)

				arg_303_1:CheckSpriteTmpPos("1061", 7)

				local var_306_2 = var_306_0.childCount

				for iter_306_0 = 0, var_306_2 - 1 do
					local var_306_3 = var_306_0:GetChild(iter_306_0)

					if var_306_3.name == "" or not string.find(var_306_3.name, "split") then
						var_306_3.gameObject:SetActive(true)
					else
						var_306_3.gameObject:SetActive(false)
					end
				end
			end

			local var_306_4 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_4 then
				local var_306_5 = (arg_303_1.time_ - var_306_1) / var_306_4
				local var_306_6 = Vector3.New(0, -2000, 18)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1061, var_306_6, var_306_5)
			end

			if arg_303_1.time_ >= var_306_1 + var_306_4 and arg_303_1.time_ < var_306_1 + var_306_4 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_306_7 = arg_303_1.actors_["10059"].transform
			local var_306_8 = 0

			if var_306_8 < arg_303_1.time_ and arg_303_1.time_ <= var_306_8 + arg_306_0 then
				arg_303_1.var_.moveOldPos10059 = var_306_7.localPosition
				var_306_7.localScale = Vector3.New(1, 1, 1)

				arg_303_1:CheckSpriteTmpPos("10059", 7)

				local var_306_9 = var_306_7.childCount

				for iter_306_1 = 0, var_306_9 - 1 do
					local var_306_10 = var_306_7:GetChild(iter_306_1)

					if var_306_10.name == "" or not string.find(var_306_10.name, "split") then
						var_306_10.gameObject:SetActive(true)
					else
						var_306_10.gameObject:SetActive(false)
					end
				end
			end

			local var_306_11 = 0.001

			if var_306_8 <= arg_303_1.time_ and arg_303_1.time_ < var_306_8 + var_306_11 then
				local var_306_12 = (arg_303_1.time_ - var_306_8) / var_306_11
				local var_306_13 = Vector3.New(0, -2000, 35)

				var_306_7.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos10059, var_306_13, var_306_12)
			end

			if arg_303_1.time_ >= var_306_8 + var_306_11 and arg_303_1.time_ < var_306_8 + var_306_11 + arg_306_0 then
				var_306_7.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_306_14 = 0
			local var_306_15 = 0.975

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_16 = arg_303_1:GetWordFromCfg(410211075)
				local var_306_17 = arg_303_1:FormatText(var_306_16.content)

				arg_303_1.text_.text = var_306_17

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_18 = 39
				local var_306_19 = utf8.len(var_306_17)
				local var_306_20 = var_306_18 <= 0 and var_306_15 or var_306_15 * (var_306_19 / var_306_18)

				if var_306_20 > 0 and var_306_15 < var_306_20 then
					arg_303_1.talkMaxDuration = var_306_20

					if var_306_20 + var_306_14 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_20 + var_306_14
					end
				end

				arg_303_1.text_.text = var_306_17
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_21 = math.max(var_306_15, arg_303_1.talkMaxDuration)

			if var_306_14 <= arg_303_1.time_ and arg_303_1.time_ < var_306_14 + var_306_21 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_14) / var_306_21

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_14 + var_306_21 and arg_303_1.time_ < var_306_14 + var_306_21 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST66",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST64a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04i"
	},
	voices = {
		"story_v_out_410211.awb"
	}
}
