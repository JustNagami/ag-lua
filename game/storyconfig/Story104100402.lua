return {
	Play410042001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410042001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play410042002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L03f"

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
				local var_4_5 = arg_1_1.bgs_.L03f

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
					if iter_4_0 ~= "L03f" then
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
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.56666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_8_story_tara_garden", "bgm_activity_2_8_story_tara_garden", "bgm_activity_2_8_story_tara_garden.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.875

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

				local var_4_33 = arg_1_1:GetWordFromCfg(410042001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 35
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
	Play410042002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410042002
		arg_7_1.duration_ = 2.566

		local var_7_0 = {
			zh = 1.933,
			ja = 2.566
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
				arg_7_0:Play410042003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1056"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["1056"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos1056 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1056", 3)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "split_1" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(0, -350, -180)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1056, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(0, -350, -180)
			end

			local var_10_9 = arg_7_1.actors_["1056"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 and arg_7_1.var_.actorSpriteComps1056 == nil then
				arg_7_1.var_.actorSpriteComps1056 = var_10_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_11 = 0.034

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11

				if arg_7_1.var_.actorSpriteComps1056 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_10_2 then
							local var_10_13 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_12)

							iter_10_2.color = Color.New(var_10_13, var_10_13, var_10_13)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 and arg_7_1.var_.actorSpriteComps1056 then
				local var_10_14 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_14, var_10_14, var_10_14)
					end
				end

				arg_7_1.var_.actorSpriteComps1056 = nil
			end

			local var_10_15 = 0
			local var_10_16 = 0.25

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_17 = arg_7_1:FormatText(StoryNameCfg[605].name)

				arg_7_1.leftNameTxt_.text = var_10_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_18 = arg_7_1:GetWordFromCfg(410042002)
				local var_10_19 = arg_7_1:FormatText(var_10_18.content)

				arg_7_1.text_.text = var_10_19

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_20 = 10
				local var_10_21 = utf8.len(var_10_19)
				local var_10_22 = var_10_20 <= 0 and var_10_16 or var_10_16 * (var_10_21 / var_10_20)

				if var_10_22 > 0 and var_10_16 < var_10_22 then
					arg_7_1.talkMaxDuration = var_10_22

					if var_10_22 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_22 + var_10_15
					end
				end

				arg_7_1.text_.text = var_10_19
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042002", "story_v_out_410042.awb") ~= 0 then
					local var_10_23 = manager.audio:GetVoiceLength("story_v_out_410042", "410042002", "story_v_out_410042.awb") / 1000

					if var_10_23 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_23 + var_10_15
					end

					if var_10_18.prefab_name ~= "" and arg_7_1.actors_[var_10_18.prefab_name] ~= nil then
						local var_10_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_18.prefab_name].transform, "story_v_out_410042", "410042002", "story_v_out_410042.awb")

						arg_7_1:RecordAudio("410042002", var_10_24)
						arg_7_1:RecordAudio("410042002", var_10_24)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410042", "410042002", "story_v_out_410042.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410042", "410042002", "story_v_out_410042.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_25 = math.max(var_10_16, arg_7_1.talkMaxDuration)

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_25 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_15) / var_10_25

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_15 + var_10_25 and arg_7_1.time_ < var_10_15 + var_10_25 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410042003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410042003
		arg_11_1.duration_ = 2.833

		local var_11_0 = {
			zh = 1.133,
			ja = 2.833
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
				arg_11_0:Play410042004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10059"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_14_0), arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_2 = arg_11_1.actors_["10059"].transform
			local var_14_3 = 0

			if var_14_3 < arg_11_1.time_ and arg_11_1.time_ <= var_14_3 + arg_14_0 then
				arg_11_1.var_.moveOldPos10059 = var_14_2.localPosition
				var_14_2.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10059", 3)

				local var_14_4 = var_14_2.childCount

				for iter_14_0 = 0, var_14_4 - 1 do
					local var_14_5 = var_14_2:GetChild(iter_14_0)

					if var_14_5.name == "" or not string.find(var_14_5.name, "split") then
						var_14_5.gameObject:SetActive(true)
					else
						var_14_5.gameObject:SetActive(false)
					end
				end
			end

			local var_14_6 = 0.001

			if var_14_3 <= arg_11_1.time_ and arg_11_1.time_ < var_14_3 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_3) / var_14_6
				local var_14_8 = Vector3.New(0, -530, 35)

				var_14_2.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10059, var_14_8, var_14_7)
			end

			if arg_11_1.time_ >= var_14_3 + var_14_6 and arg_11_1.time_ < var_14_3 + var_14_6 + arg_14_0 then
				var_14_2.localPosition = Vector3.New(0, -530, 35)
			end

			local var_14_9 = arg_11_1.actors_["10059"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.actorSpriteComps10059 == nil then
				arg_11_1.var_.actorSpriteComps10059 = var_14_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_11 = 0.034

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.actorSpriteComps10059 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_14_2 then
							local var_14_13 = Mathf.Lerp(iter_14_2.color.r, 1, var_14_12)

							iter_14_2.color = Color.New(var_14_13, var_14_13, var_14_13)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.actorSpriteComps10059 then
				local var_14_14 = 1

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_14, var_14_14, var_14_14)
					end
				end

				arg_11_1.var_.actorSpriteComps10059 = nil
			end

			local var_14_15 = 0
			local var_14_16 = 0.075

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_17 = arg_11_1:FormatText(StoryNameCfg[596].name)

				arg_11_1.leftNameTxt_.text = var_14_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_18 = arg_11_1:GetWordFromCfg(410042003)
				local var_14_19 = arg_11_1:FormatText(var_14_18.content)

				arg_11_1.text_.text = var_14_19

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_20 = 3
				local var_14_21 = utf8.len(var_14_19)
				local var_14_22 = var_14_20 <= 0 and var_14_16 or var_14_16 * (var_14_21 / var_14_20)

				if var_14_22 > 0 and var_14_16 < var_14_22 then
					arg_11_1.talkMaxDuration = var_14_22

					if var_14_22 + var_14_15 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_22 + var_14_15
					end
				end

				arg_11_1.text_.text = var_14_19
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042003", "story_v_out_410042.awb") ~= 0 then
					local var_14_23 = manager.audio:GetVoiceLength("story_v_out_410042", "410042003", "story_v_out_410042.awb") / 1000

					if var_14_23 + var_14_15 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_23 + var_14_15
					end

					if var_14_18.prefab_name ~= "" and arg_11_1.actors_[var_14_18.prefab_name] ~= nil then
						local var_14_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_18.prefab_name].transform, "story_v_out_410042", "410042003", "story_v_out_410042.awb")

						arg_11_1:RecordAudio("410042003", var_14_24)
						arg_11_1:RecordAudio("410042003", var_14_24)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410042", "410042003", "story_v_out_410042.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410042", "410042003", "story_v_out_410042.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_25 = math.max(var_14_16, arg_11_1.talkMaxDuration)

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_25 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_15) / var_14_25

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_15 + var_14_25 and arg_11_1.time_ < var_14_15 + var_14_25 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410042004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410042004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play410042005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1060"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_18_0), arg_15_1.canvasGo_.transform)

				var_18_1.transform:SetSiblingIndex(1)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_15_1.actors_[var_18_0] = var_18_1
			end

			local var_18_2 = arg_15_1.actors_["1060"].transform
			local var_18_3 = 0

			if var_18_3 < arg_15_1.time_ and arg_15_1.time_ <= var_18_3 + arg_18_0 then
				arg_15_1.var_.moveOldPos1060 = var_18_2.localPosition
				var_18_2.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1060", 2)

				local var_18_4 = var_18_2.childCount

				for iter_18_0 = 0, var_18_4 - 1 do
					local var_18_5 = var_18_2:GetChild(iter_18_0)

					if var_18_5.name == "" or not string.find(var_18_5.name, "split") then
						var_18_5.gameObject:SetActive(true)
					else
						var_18_5.gameObject:SetActive(false)
					end
				end
			end

			local var_18_6 = 0.001

			if var_18_3 <= arg_15_1.time_ and arg_15_1.time_ < var_18_3 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_3) / var_18_6
				local var_18_8 = Vector3.New(-390, -435, -40)

				var_18_2.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1060, var_18_8, var_18_7)
			end

			if arg_15_1.time_ >= var_18_3 + var_18_6 and arg_15_1.time_ < var_18_3 + var_18_6 + arg_18_0 then
				var_18_2.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_18_9 = arg_15_1.actors_["10059"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos10059 = var_18_9.localPosition
				var_18_9.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("10059", 4)

				local var_18_11 = var_18_9.childCount

				for iter_18_1 = 0, var_18_11 - 1 do
					local var_18_12 = var_18_9:GetChild(iter_18_1)

					if var_18_12.name == "" or not string.find(var_18_12.name, "split") then
						var_18_12.gameObject:SetActive(true)
					else
						var_18_12.gameObject:SetActive(false)
					end
				end
			end

			local var_18_13 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_13 then
				local var_18_14 = (arg_15_1.time_ - var_18_10) / var_18_13
				local var_18_15 = Vector3.New(390, -530, 35)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10059, var_18_15, var_18_14)
			end

			if arg_15_1.time_ >= var_18_10 + var_18_13 and arg_15_1.time_ < var_18_10 + var_18_13 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(390, -530, 35)
			end

			local var_18_16 = arg_15_1.actors_["1056"].transform
			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1.var_.moveOldPos1056 = var_18_16.localPosition
				var_18_16.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1056", 7)

				local var_18_18 = var_18_16.childCount

				for iter_18_2 = 0, var_18_18 - 1 do
					local var_18_19 = var_18_16:GetChild(iter_18_2)

					if var_18_19.name == "" or not string.find(var_18_19.name, "split") then
						var_18_19.gameObject:SetActive(true)
					else
						var_18_19.gameObject:SetActive(false)
					end
				end
			end

			local var_18_20 = 0.001

			if var_18_17 <= arg_15_1.time_ and arg_15_1.time_ < var_18_17 + var_18_20 then
				local var_18_21 = (arg_15_1.time_ - var_18_17) / var_18_20
				local var_18_22 = Vector3.New(0, -2000, -180)

				var_18_16.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1056, var_18_22, var_18_21)
			end

			if arg_15_1.time_ >= var_18_17 + var_18_20 and arg_15_1.time_ < var_18_17 + var_18_20 + arg_18_0 then
				var_18_16.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_18_23 = arg_15_1.actors_["1060"]
			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 and arg_15_1.var_.actorSpriteComps1060 == nil then
				arg_15_1.var_.actorSpriteComps1060 = var_18_23:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_25 = 0.034

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_25 then
				local var_18_26 = (arg_15_1.time_ - var_18_24) / var_18_25

				if arg_15_1.var_.actorSpriteComps1060 then
					for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_18_4 then
							local var_18_27 = Mathf.Lerp(iter_18_4.color.r, 0.5, var_18_26)

							iter_18_4.color = Color.New(var_18_27, var_18_27, var_18_27)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_24 + var_18_25 and arg_15_1.time_ < var_18_24 + var_18_25 + arg_18_0 and arg_15_1.var_.actorSpriteComps1060 then
				local var_18_28 = 0.5

				for iter_18_5, iter_18_6 in pairs(arg_15_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_18_6 then
						iter_18_6.color = Color.New(var_18_28, var_18_28, var_18_28)
					end
				end

				arg_15_1.var_.actorSpriteComps1060 = nil
			end

			local var_18_29 = arg_15_1.actors_["10059"]
			local var_18_30 = 0

			if var_18_30 < arg_15_1.time_ and arg_15_1.time_ <= var_18_30 + arg_18_0 and arg_15_1.var_.actorSpriteComps10059 == nil then
				arg_15_1.var_.actorSpriteComps10059 = var_18_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_31 = 0.034

			if var_18_30 <= arg_15_1.time_ and arg_15_1.time_ < var_18_30 + var_18_31 then
				local var_18_32 = (arg_15_1.time_ - var_18_30) / var_18_31

				if arg_15_1.var_.actorSpriteComps10059 then
					for iter_18_7, iter_18_8 in pairs(arg_15_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_18_8 then
							local var_18_33 = Mathf.Lerp(iter_18_8.color.r, 0.5, var_18_32)

							iter_18_8.color = Color.New(var_18_33, var_18_33, var_18_33)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_30 + var_18_31 and arg_15_1.time_ < var_18_30 + var_18_31 + arg_18_0 and arg_15_1.var_.actorSpriteComps10059 then
				local var_18_34 = 0.5

				for iter_18_9, iter_18_10 in pairs(arg_15_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_18_10 then
						iter_18_10.color = Color.New(var_18_34, var_18_34, var_18_34)
					end
				end

				arg_15_1.var_.actorSpriteComps10059 = nil
			end

			local var_18_35 = arg_15_1.actors_["1056"]
			local var_18_36 = 0

			if var_18_36 < arg_15_1.time_ and arg_15_1.time_ <= var_18_36 + arg_18_0 and arg_15_1.var_.actorSpriteComps1056 == nil then
				arg_15_1.var_.actorSpriteComps1056 = var_18_35:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_37 = 0.034

			if var_18_36 <= arg_15_1.time_ and arg_15_1.time_ < var_18_36 + var_18_37 then
				local var_18_38 = (arg_15_1.time_ - var_18_36) / var_18_37

				if arg_15_1.var_.actorSpriteComps1056 then
					for iter_18_11, iter_18_12 in pairs(arg_15_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_18_12 then
							local var_18_39 = Mathf.Lerp(iter_18_12.color.r, 0.5, var_18_38)

							iter_18_12.color = Color.New(var_18_39, var_18_39, var_18_39)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_36 + var_18_37 and arg_15_1.time_ < var_18_36 + var_18_37 + arg_18_0 and arg_15_1.var_.actorSpriteComps1056 then
				local var_18_40 = 0.5

				for iter_18_13, iter_18_14 in pairs(arg_15_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_18_14 then
						iter_18_14.color = Color.New(var_18_40, var_18_40, var_18_40)
					end
				end

				arg_15_1.var_.actorSpriteComps1056 = nil
			end

			local var_18_41 = 0
			local var_18_42 = 0.925

			if var_18_41 < arg_15_1.time_ and arg_15_1.time_ <= var_18_41 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_43 = arg_15_1:GetWordFromCfg(410042004)
				local var_18_44 = arg_15_1:FormatText(var_18_43.content)

				arg_15_1.text_.text = var_18_44

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_45 = 37
				local var_18_46 = utf8.len(var_18_44)
				local var_18_47 = var_18_45 <= 0 and var_18_42 or var_18_42 * (var_18_46 / var_18_45)

				if var_18_47 > 0 and var_18_42 < var_18_47 then
					arg_15_1.talkMaxDuration = var_18_47

					if var_18_47 + var_18_41 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_47 + var_18_41
					end
				end

				arg_15_1.text_.text = var_18_44
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_48 = math.max(var_18_42, arg_15_1.talkMaxDuration)

			if var_18_41 <= arg_15_1.time_ and arg_15_1.time_ < var_18_41 + var_18_48 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_41) / var_18_48

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_41 + var_18_48 and arg_15_1.time_ < var_18_41 + var_18_48 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410042005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410042005
		arg_19_1.duration_ = 9.4

		local var_19_0 = {
			zh = 6.066,
			ja = 9.4
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
				arg_19_0:Play410042006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10059"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10059 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10059", 4)

				local var_22_2 = var_22_0.childCount

				for iter_22_0 = 0, var_22_2 - 1 do
					local var_22_3 = var_22_0:GetChild(iter_22_0)

					if var_22_3.name == "split_2" or not string.find(var_22_3.name, "split") then
						var_22_3.gameObject:SetActive(true)
					else
						var_22_3.gameObject:SetActive(false)
					end
				end
			end

			local var_22_4 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_4 then
				local var_22_5 = (arg_19_1.time_ - var_22_1) / var_22_4
				local var_22_6 = Vector3.New(390, -530, 35)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10059, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_22_7 = arg_19_1.actors_["10059"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps10059 == nil then
				arg_19_1.var_.actorSpriteComps10059 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.034

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps10059 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps10059 then
				local var_22_12 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps10059 = nil
			end

			local var_22_13 = 0
			local var_22_14 = 0.525

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_15 = arg_19_1:FormatText(StoryNameCfg[596].name)

				arg_19_1.leftNameTxt_.text = var_22_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_16 = arg_19_1:GetWordFromCfg(410042005)
				local var_22_17 = arg_19_1:FormatText(var_22_16.content)

				arg_19_1.text_.text = var_22_17

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_18 = 21
				local var_22_19 = utf8.len(var_22_17)
				local var_22_20 = var_22_18 <= 0 and var_22_14 or var_22_14 * (var_22_19 / var_22_18)

				if var_22_20 > 0 and var_22_14 < var_22_20 then
					arg_19_1.talkMaxDuration = var_22_20

					if var_22_20 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_13
					end
				end

				arg_19_1.text_.text = var_22_17
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042005", "story_v_out_410042.awb") ~= 0 then
					local var_22_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042005", "story_v_out_410042.awb") / 1000

					if var_22_21 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_13
					end

					if var_22_16.prefab_name ~= "" and arg_19_1.actors_[var_22_16.prefab_name] ~= nil then
						local var_22_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_16.prefab_name].transform, "story_v_out_410042", "410042005", "story_v_out_410042.awb")

						arg_19_1:RecordAudio("410042005", var_22_22)
						arg_19_1:RecordAudio("410042005", var_22_22)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410042", "410042005", "story_v_out_410042.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410042", "410042005", "story_v_out_410042.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_23 = math.max(var_22_14, arg_19_1.talkMaxDuration)

			if var_22_13 <= arg_19_1.time_ and arg_19_1.time_ < var_22_13 + var_22_23 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_13) / var_22_23

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_13 + var_22_23 and arg_19_1.time_ < var_22_13 + var_22_23 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410042006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410042006
		arg_23_1.duration_ = 12.733

		local var_23_0 = {
			zh = 4.233,
			ja = 12.733
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
				arg_23_0:Play410042007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1060"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1060 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1060", 2)

				local var_26_2 = var_26_0.childCount

				for iter_26_0 = 0, var_26_2 - 1 do
					local var_26_3 = var_26_0:GetChild(iter_26_0)

					if var_26_3.name == "split_1" or not string.find(var_26_3.name, "split") then
						var_26_3.gameObject:SetActive(true)
					else
						var_26_3.gameObject:SetActive(false)
					end
				end
			end

			local var_26_4 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_4 then
				local var_26_5 = (arg_23_1.time_ - var_26_1) / var_26_4
				local var_26_6 = Vector3.New(-390, -435, -40)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1060, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_26_7 = arg_23_1.actors_["1060"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps1060 == nil then
				arg_23_1.var_.actorSpriteComps1060 = var_26_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_9 = 0.034

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.actorSpriteComps1060 then
					for iter_26_1, iter_26_2 in pairs(arg_23_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_26_2 then
							local var_26_11 = Mathf.Lerp(iter_26_2.color.r, 1, var_26_10)

							iter_26_2.color = Color.New(var_26_11, var_26_11, var_26_11)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.actorSpriteComps1060 then
				local var_26_12 = 1

				for iter_26_3, iter_26_4 in pairs(arg_23_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_26_4 then
						iter_26_4.color = Color.New(var_26_12, var_26_12, var_26_12)
					end
				end

				arg_23_1.var_.actorSpriteComps1060 = nil
			end

			local var_26_13 = arg_23_1.actors_["10059"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.actorSpriteComps10059 == nil then
				arg_23_1.var_.actorSpriteComps10059 = var_26_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_15 = 0.034

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.actorSpriteComps10059 then
					for iter_26_5, iter_26_6 in pairs(arg_23_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_26_6 then
							local var_26_17 = Mathf.Lerp(iter_26_6.color.r, 0.5, var_26_16)

							iter_26_6.color = Color.New(var_26_17, var_26_17, var_26_17)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.actorSpriteComps10059 then
				local var_26_18 = 0.5

				for iter_26_7, iter_26_8 in pairs(arg_23_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_26_8 then
						iter_26_8.color = Color.New(var_26_18, var_26_18, var_26_18)
					end
				end

				arg_23_1.var_.actorSpriteComps10059 = nil
			end

			local var_26_19 = 0
			local var_26_20 = 0.425

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[584].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(410042006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042006", "story_v_out_410042.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042006", "story_v_out_410042.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_410042", "410042006", "story_v_out_410042.awb")

						arg_23_1:RecordAudio("410042006", var_26_28)
						arg_23_1:RecordAudio("410042006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410042", "410042006", "story_v_out_410042.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410042", "410042006", "story_v_out_410042.awb")
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
	Play410042007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410042007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play410042008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1060"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps1060 == nil then
				arg_27_1.var_.actorSpriteComps1060 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps1060 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps1060 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps1060 = nil
			end

			local var_30_6 = arg_27_1.actors_["10059"]
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 and arg_27_1.var_.actorSpriteComps10059 == nil then
				arg_27_1.var_.actorSpriteComps10059 = var_30_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_8 = 0.034

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8

				if arg_27_1.var_.actorSpriteComps10059 then
					for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_30_5 then
							local var_30_10 = Mathf.Lerp(iter_30_5.color.r, 0.5, var_30_9)

							iter_30_5.color = Color.New(var_30_10, var_30_10, var_30_10)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10059 then
				local var_30_11 = 0.5

				for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_30_7 then
						iter_30_7.color = Color.New(var_30_11, var_30_11, var_30_11)
					end
				end

				arg_27_1.var_.actorSpriteComps10059 = nil
			end

			local var_30_12 = 0
			local var_30_13 = 0.975

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_14 = arg_27_1:GetWordFromCfg(410042007)
				local var_30_15 = arg_27_1:FormatText(var_30_14.content)

				arg_27_1.text_.text = var_30_15

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_16 = 39
				local var_30_17 = utf8.len(var_30_15)
				local var_30_18 = var_30_16 <= 0 and var_30_13 or var_30_13 * (var_30_17 / var_30_16)

				if var_30_18 > 0 and var_30_13 < var_30_18 then
					arg_27_1.talkMaxDuration = var_30_18

					if var_30_18 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_12
					end
				end

				arg_27_1.text_.text = var_30_15
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_19 = math.max(var_30_13, arg_27_1.talkMaxDuration)

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_19 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_12) / var_30_19

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_12 + var_30_19 and arg_27_1.time_ < var_30_12 + var_30_19 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410042008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410042008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play410042009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				local var_34_2 = "play"
				local var_34_3 = "effect"

				arg_31_1:AudioAction(var_34_2, var_34_3, "se_story_side_1055", "se_story_side_1055_rain", "")
			end

			local var_34_4 = 0
			local var_34_5 = 0.825

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_6 = arg_31_1:GetWordFromCfg(410042008)
				local var_34_7 = arg_31_1:FormatText(var_34_6.content)

				arg_31_1.text_.text = var_34_7

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_8 = 33
				local var_34_9 = utf8.len(var_34_7)
				local var_34_10 = var_34_8 <= 0 and var_34_5 or var_34_5 * (var_34_9 / var_34_8)

				if var_34_10 > 0 and var_34_5 < var_34_10 then
					arg_31_1.talkMaxDuration = var_34_10

					if var_34_10 + var_34_4 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_10 + var_34_4
					end
				end

				arg_31_1.text_.text = var_34_7
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_11 = math.max(var_34_5, arg_31_1.talkMaxDuration)

			if var_34_4 <= arg_31_1.time_ and arg_31_1.time_ < var_34_4 + var_34_11 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_4) / var_34_11

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_4 + var_34_11 and arg_31_1.time_ < var_34_4 + var_34_11 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410042009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410042009
		arg_35_1.duration_ = 3.233

		local var_35_0 = {
			zh = 2.3,
			ja = 3.233
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
				arg_35_0:Play410042010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1056"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1056 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1056", 2)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "split_4" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(-390, -350, -180)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1056, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_38_7 = arg_35_1.actors_["1060"].transform
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 then
				arg_35_1.var_.moveOldPos1060 = var_38_7.localPosition
				var_38_7.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1060", 7)

				local var_38_9 = var_38_7.childCount

				for iter_38_1 = 0, var_38_9 - 1 do
					local var_38_10 = var_38_7:GetChild(iter_38_1)

					if var_38_10.name == "" or not string.find(var_38_10.name, "split") then
						var_38_10.gameObject:SetActive(true)
					else
						var_38_10.gameObject:SetActive(false)
					end
				end
			end

			local var_38_11 = 0.001

			if var_38_8 <= arg_35_1.time_ and arg_35_1.time_ < var_38_8 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_8) / var_38_11
				local var_38_13 = Vector3.New(0, -2000, -40)

				var_38_7.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1060, var_38_13, var_38_12)
			end

			if arg_35_1.time_ >= var_38_8 + var_38_11 and arg_35_1.time_ < var_38_8 + var_38_11 + arg_38_0 then
				var_38_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_38_14 = arg_35_1.actors_["1056"]
			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 == nil then
				arg_35_1.var_.actorSpriteComps1056 = var_38_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_16 = 0.034

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16

				if arg_35_1.var_.actorSpriteComps1056 then
					for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_38_3 then
							local var_38_18 = Mathf.Lerp(iter_38_3.color.r, 1, var_38_17)

							iter_38_3.color = Color.New(var_38_18, var_38_18, var_38_18)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 and arg_35_1.var_.actorSpriteComps1056 then
				local var_38_19 = 1

				for iter_38_4, iter_38_5 in pairs(arg_35_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_38_5 then
						iter_38_5.color = Color.New(var_38_19, var_38_19, var_38_19)
					end
				end

				arg_35_1.var_.actorSpriteComps1056 = nil
			end

			local var_38_20 = arg_35_1.actors_["1060"]
			local var_38_21 = 0

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 == nil then
				arg_35_1.var_.actorSpriteComps1060 = var_38_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_22 = 0.034

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22

				if arg_35_1.var_.actorSpriteComps1060 then
					for iter_38_6, iter_38_7 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_38_7 then
							local var_38_24 = Mathf.Lerp(iter_38_7.color.r, 0.5, var_38_23)

							iter_38_7.color = Color.New(var_38_24, var_38_24, var_38_24)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 and arg_35_1.var_.actorSpriteComps1060 then
				local var_38_25 = 0.5

				for iter_38_8, iter_38_9 in pairs(arg_35_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_38_9 then
						iter_38_9.color = Color.New(var_38_25, var_38_25, var_38_25)
					end
				end

				arg_35_1.var_.actorSpriteComps1060 = nil
			end

			local var_38_26 = 0
			local var_38_27 = 0.225

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_28 = arg_35_1:FormatText(StoryNameCfg[605].name)

				arg_35_1.leftNameTxt_.text = var_38_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_29 = arg_35_1:GetWordFromCfg(410042009)
				local var_38_30 = arg_35_1:FormatText(var_38_29.content)

				arg_35_1.text_.text = var_38_30

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_31 = 9
				local var_38_32 = utf8.len(var_38_30)
				local var_38_33 = var_38_31 <= 0 and var_38_27 or var_38_27 * (var_38_32 / var_38_31)

				if var_38_33 > 0 and var_38_27 < var_38_33 then
					arg_35_1.talkMaxDuration = var_38_33

					if var_38_33 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_33 + var_38_26
					end
				end

				arg_35_1.text_.text = var_38_30
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042009", "story_v_out_410042.awb") ~= 0 then
					local var_38_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042009", "story_v_out_410042.awb") / 1000

					if var_38_34 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_34 + var_38_26
					end

					if var_38_29.prefab_name ~= "" and arg_35_1.actors_[var_38_29.prefab_name] ~= nil then
						local var_38_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_29.prefab_name].transform, "story_v_out_410042", "410042009", "story_v_out_410042.awb")

						arg_35_1:RecordAudio("410042009", var_38_35)
						arg_35_1:RecordAudio("410042009", var_38_35)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410042", "410042009", "story_v_out_410042.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410042", "410042009", "story_v_out_410042.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_36 = math.max(var_38_27, arg_35_1.talkMaxDuration)

			if var_38_26 <= arg_35_1.time_ and arg_35_1.time_ < var_38_26 + var_38_36 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_26) / var_38_36

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_26 + var_38_36 and arg_35_1.time_ < var_38_26 + var_38_36 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410042010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410042010
		arg_39_1.duration_ = 8.1

		local var_39_0 = {
			zh = 3.133,
			ja = 8.1
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
				arg_39_0:Play410042011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1060"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1060 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1060", 2)

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
				local var_42_6 = Vector3.New(-390, -435, -40)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1060, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_42_7 = arg_39_1.actors_["1056"].transform
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 then
				arg_39_1.var_.moveOldPos1056 = var_42_7.localPosition
				var_42_7.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1056", 7)

				local var_42_9 = var_42_7.childCount

				for iter_42_1 = 0, var_42_9 - 1 do
					local var_42_10 = var_42_7:GetChild(iter_42_1)

					if var_42_10.name == "" or not string.find(var_42_10.name, "split") then
						var_42_10.gameObject:SetActive(true)
					else
						var_42_10.gameObject:SetActive(false)
					end
				end
			end

			local var_42_11 = 0.001

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_8) / var_42_11
				local var_42_13 = Vector3.New(0, -2000, -180)

				var_42_7.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1056, var_42_13, var_42_12)
			end

			if arg_39_1.time_ >= var_42_8 + var_42_11 and arg_39_1.time_ < var_42_8 + var_42_11 + arg_42_0 then
				var_42_7.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_42_14 = arg_39_1.actors_["1060"]
			local var_42_15 = 0

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 and arg_39_1.var_.actorSpriteComps1060 == nil then
				arg_39_1.var_.actorSpriteComps1060 = var_42_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_16 = 0.034

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_15) / var_42_16

				if arg_39_1.var_.actorSpriteComps1060 then
					for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_42_3 then
							local var_42_18 = Mathf.Lerp(iter_42_3.color.r, 1, var_42_17)

							iter_42_3.color = Color.New(var_42_18, var_42_18, var_42_18)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_15 + var_42_16 and arg_39_1.time_ < var_42_15 + var_42_16 + arg_42_0 and arg_39_1.var_.actorSpriteComps1060 then
				local var_42_19 = 1

				for iter_42_4, iter_42_5 in pairs(arg_39_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_42_5 then
						iter_42_5.color = Color.New(var_42_19, var_42_19, var_42_19)
					end
				end

				arg_39_1.var_.actorSpriteComps1060 = nil
			end

			local var_42_20 = arg_39_1.actors_["1056"]
			local var_42_21 = 0

			if var_42_21 < arg_39_1.time_ and arg_39_1.time_ <= var_42_21 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 == nil then
				arg_39_1.var_.actorSpriteComps1056 = var_42_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_22 = 0.034

			if var_42_21 <= arg_39_1.time_ and arg_39_1.time_ < var_42_21 + var_42_22 then
				local var_42_23 = (arg_39_1.time_ - var_42_21) / var_42_22

				if arg_39_1.var_.actorSpriteComps1056 then
					for iter_42_6, iter_42_7 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_42_7 then
							local var_42_24 = Mathf.Lerp(iter_42_7.color.r, 0.5, var_42_23)

							iter_42_7.color = Color.New(var_42_24, var_42_24, var_42_24)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_21 + var_42_22 and arg_39_1.time_ < var_42_21 + var_42_22 + arg_42_0 and arg_39_1.var_.actorSpriteComps1056 then
				local var_42_25 = 0.5

				for iter_42_8, iter_42_9 in pairs(arg_39_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_42_9 then
						iter_42_9.color = Color.New(var_42_25, var_42_25, var_42_25)
					end
				end

				arg_39_1.var_.actorSpriteComps1056 = nil
			end

			local var_42_26 = 0
			local var_42_27 = 0.4

			if var_42_26 < arg_39_1.time_ and arg_39_1.time_ <= var_42_26 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_28 = arg_39_1:FormatText(StoryNameCfg[584].name)

				arg_39_1.leftNameTxt_.text = var_42_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_29 = arg_39_1:GetWordFromCfg(410042010)
				local var_42_30 = arg_39_1:FormatText(var_42_29.content)

				arg_39_1.text_.text = var_42_30

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_31 = 16
				local var_42_32 = utf8.len(var_42_30)
				local var_42_33 = var_42_31 <= 0 and var_42_27 or var_42_27 * (var_42_32 / var_42_31)

				if var_42_33 > 0 and var_42_27 < var_42_33 then
					arg_39_1.talkMaxDuration = var_42_33

					if var_42_33 + var_42_26 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_33 + var_42_26
					end
				end

				arg_39_1.text_.text = var_42_30
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042010", "story_v_out_410042.awb") ~= 0 then
					local var_42_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042010", "story_v_out_410042.awb") / 1000

					if var_42_34 + var_42_26 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_34 + var_42_26
					end

					if var_42_29.prefab_name ~= "" and arg_39_1.actors_[var_42_29.prefab_name] ~= nil then
						local var_42_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_29.prefab_name].transform, "story_v_out_410042", "410042010", "story_v_out_410042.awb")

						arg_39_1:RecordAudio("410042010", var_42_35)
						arg_39_1:RecordAudio("410042010", var_42_35)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410042", "410042010", "story_v_out_410042.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410042", "410042010", "story_v_out_410042.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_36 = math.max(var_42_27, arg_39_1.talkMaxDuration)

			if var_42_26 <= arg_39_1.time_ and arg_39_1.time_ < var_42_26 + var_42_36 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_26) / var_42_36

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_26 + var_42_36 and arg_39_1.time_ < var_42_26 + var_42_36 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play410042011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410042011
		arg_43_1.duration_ = 4.8

		local var_43_0 = {
			zh = 4.3,
			ja = 4.8
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
				arg_43_0:Play410042012(arg_43_1)
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

			local var_46_13 = arg_43_1.actors_["1060"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 == nil then
				arg_43_1.var_.actorSpriteComps1060 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.034

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1060 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1060 then
				local var_46_18 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1060 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.525

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[596].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(410042011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042011", "story_v_out_410042.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042011", "story_v_out_410042.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_410042", "410042011", "story_v_out_410042.awb")

						arg_43_1:RecordAudio("410042011", var_46_28)
						arg_43_1:RecordAudio("410042011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410042", "410042011", "story_v_out_410042.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410042", "410042011", "story_v_out_410042.awb")
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
	Play410042012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410042012
		arg_47_1.duration_ = 11.566

		local var_47_0 = {
			zh = 4.3,
			ja = 11.566
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
				arg_47_0:Play410042013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10059"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos10059 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("10059", 4)

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
				local var_50_6 = Vector3.New(390, -530, 35)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10059, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_50_7 = arg_47_1.actors_["10059"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps10059 == nil then
				arg_47_1.var_.actorSpriteComps10059 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps10059 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps10059 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps10059 = nil
			end

			local var_50_13 = 0
			local var_50_14 = 0.55

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_15 = arg_47_1:FormatText(StoryNameCfg[596].name)

				arg_47_1.leftNameTxt_.text = var_50_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_16 = arg_47_1:GetWordFromCfg(410042012)
				local var_50_17 = arg_47_1:FormatText(var_50_16.content)

				arg_47_1.text_.text = var_50_17

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_18 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042012", "story_v_out_410042.awb") ~= 0 then
					local var_50_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042012", "story_v_out_410042.awb") / 1000

					if var_50_21 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_21 + var_50_13
					end

					if var_50_16.prefab_name ~= "" and arg_47_1.actors_[var_50_16.prefab_name] ~= nil then
						local var_50_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_16.prefab_name].transform, "story_v_out_410042", "410042012", "story_v_out_410042.awb")

						arg_47_1:RecordAudio("410042012", var_50_22)
						arg_47_1:RecordAudio("410042012", var_50_22)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410042", "410042012", "story_v_out_410042.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410042", "410042012", "story_v_out_410042.awb")
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
	Play410042013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410042013
		arg_51_1.duration_ = 9.966

		local var_51_0 = {
			zh = 8.733,
			ja = 9.966
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
				arg_51_0:Play410042014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1056"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1056 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1056", 2)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "split_1" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(-390, -350, -180)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1056, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_54_7 = arg_51_1.actors_["1060"].transform
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 then
				arg_51_1.var_.moveOldPos1060 = var_54_7.localPosition
				var_54_7.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1060", 7)

				local var_54_9 = var_54_7.childCount

				for iter_54_1 = 0, var_54_9 - 1 do
					local var_54_10 = var_54_7:GetChild(iter_54_1)

					if var_54_10.name == "" or not string.find(var_54_10.name, "split") then
						var_54_10.gameObject:SetActive(true)
					else
						var_54_10.gameObject:SetActive(false)
					end
				end
			end

			local var_54_11 = 0.001

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_8) / var_54_11
				local var_54_13 = Vector3.New(0, -2000, -40)

				var_54_7.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1060, var_54_13, var_54_12)
			end

			if arg_51_1.time_ >= var_54_8 + var_54_11 and arg_51_1.time_ < var_54_8 + var_54_11 + arg_54_0 then
				var_54_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_54_14 = arg_51_1.actors_["1056"]
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 == nil then
				arg_51_1.var_.actorSpriteComps1056 = var_54_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_16 = 0.034

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_16 then
				local var_54_17 = (arg_51_1.time_ - var_54_15) / var_54_16

				if arg_51_1.var_.actorSpriteComps1056 then
					for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_54_3 then
							local var_54_18 = Mathf.Lerp(iter_54_3.color.r, 1, var_54_17)

							iter_54_3.color = Color.New(var_54_18, var_54_18, var_54_18)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_15 + var_54_16 and arg_51_1.time_ < var_54_15 + var_54_16 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 then
				local var_54_19 = 1

				for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_54_5 then
						iter_54_5.color = Color.New(var_54_19, var_54_19, var_54_19)
					end
				end

				arg_51_1.var_.actorSpriteComps1056 = nil
			end

			local var_54_20 = arg_51_1.actors_["1060"]
			local var_54_21 = 0

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 == nil then
				arg_51_1.var_.actorSpriteComps1060 = var_54_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_22 = 0.034

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_22 then
				local var_54_23 = (arg_51_1.time_ - var_54_21) / var_54_22

				if arg_51_1.var_.actorSpriteComps1060 then
					for iter_54_6, iter_54_7 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_54_7 then
							local var_54_24 = Mathf.Lerp(iter_54_7.color.r, 0.5, var_54_23)

							iter_54_7.color = Color.New(var_54_24, var_54_24, var_54_24)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_21 + var_54_22 and arg_51_1.time_ < var_54_21 + var_54_22 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 then
				local var_54_25 = 0.5

				for iter_54_8, iter_54_9 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_54_9 then
						iter_54_9.color = Color.New(var_54_25, var_54_25, var_54_25)
					end
				end

				arg_51_1.var_.actorSpriteComps1060 = nil
			end

			local var_54_26 = arg_51_1.actors_["10059"]
			local var_54_27 = 0

			if var_54_27 < arg_51_1.time_ and arg_51_1.time_ <= var_54_27 + arg_54_0 and arg_51_1.var_.actorSpriteComps10059 == nil then
				arg_51_1.var_.actorSpriteComps10059 = var_54_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_28 = 0.034

			if var_54_27 <= arg_51_1.time_ and arg_51_1.time_ < var_54_27 + var_54_28 then
				local var_54_29 = (arg_51_1.time_ - var_54_27) / var_54_28

				if arg_51_1.var_.actorSpriteComps10059 then
					for iter_54_10, iter_54_11 in pairs(arg_51_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_54_11 then
							local var_54_30 = Mathf.Lerp(iter_54_11.color.r, 0.5, var_54_29)

							iter_54_11.color = Color.New(var_54_30, var_54_30, var_54_30)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_27 + var_54_28 and arg_51_1.time_ < var_54_27 + var_54_28 + arg_54_0 and arg_51_1.var_.actorSpriteComps10059 then
				local var_54_31 = 0.5

				for iter_54_12, iter_54_13 in pairs(arg_51_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_54_13 then
						iter_54_13.color = Color.New(var_54_31, var_54_31, var_54_31)
					end
				end

				arg_51_1.var_.actorSpriteComps10059 = nil
			end

			local var_54_32 = 0
			local var_54_33 = 1.3

			if var_54_32 < arg_51_1.time_ and arg_51_1.time_ <= var_54_32 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_34 = arg_51_1:FormatText(StoryNameCfg[605].name)

				arg_51_1.leftNameTxt_.text = var_54_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_35 = arg_51_1:GetWordFromCfg(410042013)
				local var_54_36 = arg_51_1:FormatText(var_54_35.content)

				arg_51_1.text_.text = var_54_36

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_37 = 52
				local var_54_38 = utf8.len(var_54_36)
				local var_54_39 = var_54_37 <= 0 and var_54_33 or var_54_33 * (var_54_38 / var_54_37)

				if var_54_39 > 0 and var_54_33 < var_54_39 then
					arg_51_1.talkMaxDuration = var_54_39

					if var_54_39 + var_54_32 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_39 + var_54_32
					end
				end

				arg_51_1.text_.text = var_54_36
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042013", "story_v_out_410042.awb") ~= 0 then
					local var_54_40 = manager.audio:GetVoiceLength("story_v_out_410042", "410042013", "story_v_out_410042.awb") / 1000

					if var_54_40 + var_54_32 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_40 + var_54_32
					end

					if var_54_35.prefab_name ~= "" and arg_51_1.actors_[var_54_35.prefab_name] ~= nil then
						local var_54_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_35.prefab_name].transform, "story_v_out_410042", "410042013", "story_v_out_410042.awb")

						arg_51_1:RecordAudio("410042013", var_54_41)
						arg_51_1:RecordAudio("410042013", var_54_41)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410042", "410042013", "story_v_out_410042.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410042", "410042013", "story_v_out_410042.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_42 = math.max(var_54_33, arg_51_1.talkMaxDuration)

			if var_54_32 <= arg_51_1.time_ and arg_51_1.time_ < var_54_32 + var_54_42 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_32) / var_54_42

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_32 + var_54_42 and arg_51_1.time_ < var_54_32 + var_54_42 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410042014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410042014
		arg_55_1.duration_ = 8.933

		local var_55_0 = {
			zh = 6.2,
			ja = 8.933
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
				arg_55_0:Play410042015(arg_55_1)
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

			local var_58_13 = arg_55_1.actors_["1056"]
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 == nil then
				arg_55_1.var_.actorSpriteComps1056 = var_58_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_15 = 0.034

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_14) / var_58_15

				if arg_55_1.var_.actorSpriteComps1056 then
					for iter_58_5, iter_58_6 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_58_6 then
							local var_58_17 = Mathf.Lerp(iter_58_6.color.r, 0.5, var_58_16)

							iter_58_6.color = Color.New(var_58_17, var_58_17, var_58_17)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_14 + var_58_15 and arg_55_1.time_ < var_58_14 + var_58_15 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 then
				local var_58_18 = 0.5

				for iter_58_7, iter_58_8 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_58_8 then
						iter_58_8.color = Color.New(var_58_18, var_58_18, var_58_18)
					end
				end

				arg_55_1.var_.actorSpriteComps1056 = nil
			end

			local var_58_19 = 0
			local var_58_20 = 0.625

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_21 = arg_55_1:FormatText(StoryNameCfg[596].name)

				arg_55_1.leftNameTxt_.text = var_58_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_22 = arg_55_1:GetWordFromCfg(410042014)
				local var_58_23 = arg_55_1:FormatText(var_58_22.content)

				arg_55_1.text_.text = var_58_23

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_24 = 25
				local var_58_25 = utf8.len(var_58_23)
				local var_58_26 = var_58_24 <= 0 and var_58_20 or var_58_20 * (var_58_25 / var_58_24)

				if var_58_26 > 0 and var_58_20 < var_58_26 then
					arg_55_1.talkMaxDuration = var_58_26

					if var_58_26 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_26 + var_58_19
					end
				end

				arg_55_1.text_.text = var_58_23
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042014", "story_v_out_410042.awb") ~= 0 then
					local var_58_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042014", "story_v_out_410042.awb") / 1000

					if var_58_27 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_27 + var_58_19
					end

					if var_58_22.prefab_name ~= "" and arg_55_1.actors_[var_58_22.prefab_name] ~= nil then
						local var_58_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_22.prefab_name].transform, "story_v_out_410042", "410042014", "story_v_out_410042.awb")

						arg_55_1:RecordAudio("410042014", var_58_28)
						arg_55_1:RecordAudio("410042014", var_58_28)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410042", "410042014", "story_v_out_410042.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410042", "410042014", "story_v_out_410042.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_29 = math.max(var_58_20, arg_55_1.talkMaxDuration)

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_29 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_19) / var_58_29

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_19 + var_58_29 and arg_55_1.time_ < var_58_19 + var_58_29 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410042015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410042015
		arg_59_1.duration_ = 2.066

		local var_59_0 = {
			zh = 1.6,
			ja = 2.066
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
				arg_59_0:Play410042016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1056"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1056 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1056", 2)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_4" or not string.find(var_62_3.name, "split") then
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

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1056, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_62_7 = arg_59_1.actors_["1056"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 == nil then
				arg_59_1.var_.actorSpriteComps1056 = var_62_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_9 = 0.034

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.actorSpriteComps1056 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_62_2 then
							local var_62_11 = Mathf.Lerp(iter_62_2.color.r, 1, var_62_10)

							iter_62_2.color = Color.New(var_62_11, var_62_11, var_62_11)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 then
				local var_62_12 = 1

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_12, var_62_12, var_62_12)
					end
				end

				arg_59_1.var_.actorSpriteComps1056 = nil
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
			local var_62_20 = 0.175

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_21 = arg_59_1:FormatText(StoryNameCfg[605].name)

				arg_59_1.leftNameTxt_.text = var_62_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_22 = arg_59_1:GetWordFromCfg(410042015)
				local var_62_23 = arg_59_1:FormatText(var_62_22.content)

				arg_59_1.text_.text = var_62_23

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_24 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042015", "story_v_out_410042.awb") ~= 0 then
					local var_62_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042015", "story_v_out_410042.awb") / 1000

					if var_62_27 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_27 + var_62_19
					end

					if var_62_22.prefab_name ~= "" and arg_59_1.actors_[var_62_22.prefab_name] ~= nil then
						local var_62_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_22.prefab_name].transform, "story_v_out_410042", "410042015", "story_v_out_410042.awb")

						arg_59_1:RecordAudio("410042015", var_62_28)
						arg_59_1:RecordAudio("410042015", var_62_28)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410042", "410042015", "story_v_out_410042.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410042", "410042015", "story_v_out_410042.awb")
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
	Play410042016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410042016
		arg_63_1.duration_ = 4.2

		local var_63_0 = {
			zh = 4.2,
			ja = 2
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
				arg_63_0:Play410042017(arg_63_1)
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

			local var_66_13 = arg_63_1.actors_["1056"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.actorSpriteComps1056 == nil then
				arg_63_1.var_.actorSpriteComps1056 = var_66_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_15 = 0.034

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.actorSpriteComps1056 then
					for iter_66_5, iter_66_6 in pairs(arg_63_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_66_6 then
							local var_66_17 = Mathf.Lerp(iter_66_6.color.r, 0.5, var_66_16)

							iter_66_6.color = Color.New(var_66_17, var_66_17, var_66_17)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.actorSpriteComps1056 then
				local var_66_18 = 0.5

				for iter_66_7, iter_66_8 in pairs(arg_63_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_66_8 then
						iter_66_8.color = Color.New(var_66_18, var_66_18, var_66_18)
					end
				end

				arg_63_1.var_.actorSpriteComps1056 = nil
			end

			local var_66_19 = 0
			local var_66_20 = 0.45

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

				local var_66_22 = arg_63_1:GetWordFromCfg(410042016)
				local var_66_23 = arg_63_1:FormatText(var_66_22.content)

				arg_63_1.text_.text = var_66_23

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_24 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042016", "story_v_out_410042.awb") ~= 0 then
					local var_66_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042016", "story_v_out_410042.awb") / 1000

					if var_66_27 + var_66_19 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_27 + var_66_19
					end

					if var_66_22.prefab_name ~= "" and arg_63_1.actors_[var_66_22.prefab_name] ~= nil then
						local var_66_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_22.prefab_name].transform, "story_v_out_410042", "410042016", "story_v_out_410042.awb")

						arg_63_1:RecordAudio("410042016", var_66_28)
						arg_63_1:RecordAudio("410042016", var_66_28)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410042", "410042016", "story_v_out_410042.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410042", "410042016", "story_v_out_410042.awb")
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
	Play410042017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410042017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play410042018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10059"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.actorSpriteComps10059 == nil then
				arg_67_1.var_.actorSpriteComps10059 = var_70_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_2 = 0.034

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.actorSpriteComps10059 then
					for iter_70_0, iter_70_1 in pairs(arg_67_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_70_1 then
							local var_70_4 = Mathf.Lerp(iter_70_1.color.r, 0.5, var_70_3)

							iter_70_1.color = Color.New(var_70_4, var_70_4, var_70_4)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.actorSpriteComps10059 then
				local var_70_5 = 0.5

				for iter_70_2, iter_70_3 in pairs(arg_67_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_70_3 then
						iter_70_3.color = Color.New(var_70_5, var_70_5, var_70_5)
					end
				end

				arg_67_1.var_.actorSpriteComps10059 = nil
			end

			local var_70_6 = 0
			local var_70_7 = 1.1

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_8 = arg_67_1:GetWordFromCfg(410042017)
				local var_70_9 = arg_67_1:FormatText(var_70_8.content)

				arg_67_1.text_.text = var_70_9

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_10 = 44
				local var_70_11 = utf8.len(var_70_9)
				local var_70_12 = var_70_10 <= 0 and var_70_7 or var_70_7 * (var_70_11 / var_70_10)

				if var_70_12 > 0 and var_70_7 < var_70_12 then
					arg_67_1.talkMaxDuration = var_70_12

					if var_70_12 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_12 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_9
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_13 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_13 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_13

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_13 and arg_67_1.time_ < var_70_6 + var_70_13 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410042018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410042018
		arg_71_1.duration_ = 4.866

		local var_71_0 = {
			zh = 3.1,
			ja = 4.866
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
				arg_71_0:Play410042019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1060"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1060 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1060", 2)

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
				local var_74_6 = Vector3.New(-390, -435, -40)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1060, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_74_7 = arg_71_1.actors_["1060"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 == nil then
				arg_71_1.var_.actorSpriteComps1060 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1060 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1060 = nil
			end

			local var_74_13 = 0
			local var_74_14 = 0.4

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_15 = arg_71_1:FormatText(StoryNameCfg[584].name)

				arg_71_1.leftNameTxt_.text = var_74_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_16 = arg_71_1:GetWordFromCfg(410042018)
				local var_74_17 = arg_71_1:FormatText(var_74_16.content)

				arg_71_1.text_.text = var_74_17

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_18 = 16
				local var_74_19 = utf8.len(var_74_17)
				local var_74_20 = var_74_18 <= 0 and var_74_14 or var_74_14 * (var_74_19 / var_74_18)

				if var_74_20 > 0 and var_74_14 < var_74_20 then
					arg_71_1.talkMaxDuration = var_74_20

					if var_74_20 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_13
					end
				end

				arg_71_1.text_.text = var_74_17
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042018", "story_v_out_410042.awb") ~= 0 then
					local var_74_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042018", "story_v_out_410042.awb") / 1000

					if var_74_21 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_13
					end

					if var_74_16.prefab_name ~= "" and arg_71_1.actors_[var_74_16.prefab_name] ~= nil then
						local var_74_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_16.prefab_name].transform, "story_v_out_410042", "410042018", "story_v_out_410042.awb")

						arg_71_1:RecordAudio("410042018", var_74_22)
						arg_71_1:RecordAudio("410042018", var_74_22)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410042", "410042018", "story_v_out_410042.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410042", "410042018", "story_v_out_410042.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_23 = math.max(var_74_14, arg_71_1.talkMaxDuration)

			if var_74_13 <= arg_71_1.time_ and arg_71_1.time_ < var_74_13 + var_74_23 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_13) / var_74_23

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_13 + var_74_23 and arg_71_1.time_ < var_74_13 + var_74_23 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410042019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410042019
		arg_75_1.duration_ = 4.733

		local var_75_0 = {
			zh = 4.4,
			ja = 4.733
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
				arg_75_0:Play410042020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10059"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10059 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10059", 4)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(390, -530, 35)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10059, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_78_7 = arg_75_1.actors_["10059"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps10059 == nil then
				arg_75_1.var_.actorSpriteComps10059 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps10059 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps10059 then
				local var_78_12 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps10059 = nil
			end

			local var_78_13 = arg_75_1.actors_["1060"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 == nil then
				arg_75_1.var_.actorSpriteComps1060 = var_78_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_15 = 0.034

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.actorSpriteComps1060 then
					for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_78_6 then
							local var_78_17 = Mathf.Lerp(iter_78_6.color.r, 0.5, var_78_16)

							iter_78_6.color = Color.New(var_78_17, var_78_17, var_78_17)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 then
				local var_78_18 = 0.5

				for iter_78_7, iter_78_8 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_78_8 then
						iter_78_8.color = Color.New(var_78_18, var_78_18, var_78_18)
					end
				end

				arg_75_1.var_.actorSpriteComps1060 = nil
			end

			local var_78_19 = 0
			local var_78_20 = 0.475

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_21 = arg_75_1:FormatText(StoryNameCfg[596].name)

				arg_75_1.leftNameTxt_.text = var_78_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_22 = arg_75_1:GetWordFromCfg(410042019)
				local var_78_23 = arg_75_1:FormatText(var_78_22.content)

				arg_75_1.text_.text = var_78_23

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_24 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042019", "story_v_out_410042.awb") ~= 0 then
					local var_78_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042019", "story_v_out_410042.awb") / 1000

					if var_78_27 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_27 + var_78_19
					end

					if var_78_22.prefab_name ~= "" and arg_75_1.actors_[var_78_22.prefab_name] ~= nil then
						local var_78_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_22.prefab_name].transform, "story_v_out_410042", "410042019", "story_v_out_410042.awb")

						arg_75_1:RecordAudio("410042019", var_78_28)
						arg_75_1:RecordAudio("410042019", var_78_28)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410042", "410042019", "story_v_out_410042.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410042", "410042019", "story_v_out_410042.awb")
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
	Play410042020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410042020
		arg_79_1.duration_ = 12.466

		local var_79_0 = {
			zh = 7.033,
			ja = 12.466
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
				arg_79_0:Play410042021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1060"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1060 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1060", 2)

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
				local var_82_6 = Vector3.New(-390, -435, -40)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1060, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_82_7 = arg_79_1.actors_["1060"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps1060 == nil then
				arg_79_1.var_.actorSpriteComps1060 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.034

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps1060 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps1060 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps1060 = nil
			end

			local var_82_13 = arg_79_1.actors_["10059"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 and arg_79_1.var_.actorSpriteComps10059 == nil then
				arg_79_1.var_.actorSpriteComps10059 = var_82_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_15 = 0.034

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15

				if arg_79_1.var_.actorSpriteComps10059 then
					for iter_82_5, iter_82_6 in pairs(arg_79_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_82_6 then
							local var_82_17 = Mathf.Lerp(iter_82_6.color.r, 0.5, var_82_16)

							iter_82_6.color = Color.New(var_82_17, var_82_17, var_82_17)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 and arg_79_1.var_.actorSpriteComps10059 then
				local var_82_18 = 0.5

				for iter_82_7, iter_82_8 in pairs(arg_79_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_82_8 then
						iter_82_8.color = Color.New(var_82_18, var_82_18, var_82_18)
					end
				end

				arg_79_1.var_.actorSpriteComps10059 = nil
			end

			local var_82_19 = 0
			local var_82_20 = 0.825

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[584].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(410042020)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042020", "story_v_out_410042.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042020", "story_v_out_410042.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_410042", "410042020", "story_v_out_410042.awb")

						arg_79_1:RecordAudio("410042020", var_82_28)
						arg_79_1:RecordAudio("410042020", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410042", "410042020", "story_v_out_410042.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410042", "410042020", "story_v_out_410042.awb")
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
	Play410042021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410042021
		arg_83_1.duration_ = 12.833

		local var_83_0 = {
			zh = 6.166,
			ja = 12.833
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
				arg_83_0:Play410042022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10059"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos10059 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10059", 4)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "split_3" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(390, -530, 35)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10059, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_86_7 = arg_83_1.actors_["10059"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps10059 == nil then
				arg_83_1.var_.actorSpriteComps10059 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps10059 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps10059 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps10059 = nil
			end

			local var_86_13 = arg_83_1.actors_["1060"]
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 and arg_83_1.var_.actorSpriteComps1060 == nil then
				arg_83_1.var_.actorSpriteComps1060 = var_86_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_15 = 0.034

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_15 then
				local var_86_16 = (arg_83_1.time_ - var_86_14) / var_86_15

				if arg_83_1.var_.actorSpriteComps1060 then
					for iter_86_5, iter_86_6 in pairs(arg_83_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_86_6 then
							local var_86_17 = Mathf.Lerp(iter_86_6.color.r, 0.5, var_86_16)

							iter_86_6.color = Color.New(var_86_17, var_86_17, var_86_17)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_14 + var_86_15 and arg_83_1.time_ < var_86_14 + var_86_15 + arg_86_0 and arg_83_1.var_.actorSpriteComps1060 then
				local var_86_18 = 0.5

				for iter_86_7, iter_86_8 in pairs(arg_83_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_86_8 then
						iter_86_8.color = Color.New(var_86_18, var_86_18, var_86_18)
					end
				end

				arg_83_1.var_.actorSpriteComps1060 = nil
			end

			local var_86_19 = 0
			local var_86_20 = 0.625

			if var_86_19 < arg_83_1.time_ and arg_83_1.time_ <= var_86_19 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_21 = arg_83_1:FormatText(StoryNameCfg[596].name)

				arg_83_1.leftNameTxt_.text = var_86_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_22 = arg_83_1:GetWordFromCfg(410042021)
				local var_86_23 = arg_83_1:FormatText(var_86_22.content)

				arg_83_1.text_.text = var_86_23

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_24 = 25
				local var_86_25 = utf8.len(var_86_23)
				local var_86_26 = var_86_24 <= 0 and var_86_20 or var_86_20 * (var_86_25 / var_86_24)

				if var_86_26 > 0 and var_86_20 < var_86_26 then
					arg_83_1.talkMaxDuration = var_86_26

					if var_86_26 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_26 + var_86_19
					end
				end

				arg_83_1.text_.text = var_86_23
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042021", "story_v_out_410042.awb") ~= 0 then
					local var_86_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042021", "story_v_out_410042.awb") / 1000

					if var_86_27 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_27 + var_86_19
					end

					if var_86_22.prefab_name ~= "" and arg_83_1.actors_[var_86_22.prefab_name] ~= nil then
						local var_86_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_22.prefab_name].transform, "story_v_out_410042", "410042021", "story_v_out_410042.awb")

						arg_83_1:RecordAudio("410042021", var_86_28)
						arg_83_1:RecordAudio("410042021", var_86_28)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410042", "410042021", "story_v_out_410042.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410042", "410042021", "story_v_out_410042.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_29 = math.max(var_86_20, arg_83_1.talkMaxDuration)

			if var_86_19 <= arg_83_1.time_ and arg_83_1.time_ < var_86_19 + var_86_29 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_19) / var_86_29

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_19 + var_86_29 and arg_83_1.time_ < var_86_19 + var_86_29 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410042022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410042022
		arg_87_1.duration_ = 7.366

		local var_87_0 = {
			zh = 7.366,
			ja = 5.933
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
				arg_87_0:Play410042023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1060"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1060 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1060", 2)

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
				local var_90_6 = Vector3.New(-390, -435, -40)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1060, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_90_7 = arg_87_1.actors_["1060"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 == nil then
				arg_87_1.var_.actorSpriteComps1060 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.034

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps1060 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 1, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 then
				local var_90_12 = 1

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps1060 = nil
			end

			local var_90_13 = arg_87_1.actors_["10059"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.actorSpriteComps10059 == nil then
				arg_87_1.var_.actorSpriteComps10059 = var_90_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_15 = 0.034

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.actorSpriteComps10059 then
					for iter_90_5, iter_90_6 in pairs(arg_87_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_90_6 then
							local var_90_17 = Mathf.Lerp(iter_90_6.color.r, 0.5, var_90_16)

							iter_90_6.color = Color.New(var_90_17, var_90_17, var_90_17)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps10059 then
				local var_90_18 = 0.5

				for iter_90_7, iter_90_8 in pairs(arg_87_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_90_8 then
						iter_90_8.color = Color.New(var_90_18, var_90_18, var_90_18)
					end
				end

				arg_87_1.var_.actorSpriteComps10059 = nil
			end

			local var_90_19 = 0
			local var_90_20 = 0.825

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[584].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410042022)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042022", "story_v_out_410042.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042022", "story_v_out_410042.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_410042", "410042022", "story_v_out_410042.awb")

						arg_87_1:RecordAudio("410042022", var_90_28)
						arg_87_1:RecordAudio("410042022", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410042", "410042022", "story_v_out_410042.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410042", "410042022", "story_v_out_410042.awb")
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
	Play410042023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410042023
		arg_91_1.duration_ = 17.333

		local var_91_0 = {
			zh = 7.2,
			ja = 17.333
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
				arg_91_0:Play410042024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10059"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos10059 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("10059", 4)

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
				local var_94_6 = Vector3.New(390, -530, 35)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10059, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_94_7 = arg_91_1.actors_["10059"]
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps10059 == nil then
				arg_91_1.var_.actorSpriteComps10059 = var_94_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_9 = 0.034

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_8) / var_94_9

				if arg_91_1.var_.actorSpriteComps10059 then
					for iter_94_1, iter_94_2 in pairs(arg_91_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_94_2 then
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 1, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps10059 then
				local var_94_12 = 1

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps10059 = nil
			end

			local var_94_13 = arg_91_1.actors_["1060"]
			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 == nil then
				arg_91_1.var_.actorSpriteComps1060 = var_94_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_15 = 0.034

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_15 then
				local var_94_16 = (arg_91_1.time_ - var_94_14) / var_94_15

				if arg_91_1.var_.actorSpriteComps1060 then
					for iter_94_5, iter_94_6 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_94_6 then
							local var_94_17 = Mathf.Lerp(iter_94_6.color.r, 0.5, var_94_16)

							iter_94_6.color = Color.New(var_94_17, var_94_17, var_94_17)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_14 + var_94_15 and arg_91_1.time_ < var_94_14 + var_94_15 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 then
				local var_94_18 = 0.5

				for iter_94_7, iter_94_8 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_94_8 then
						iter_94_8.color = Color.New(var_94_18, var_94_18, var_94_18)
					end
				end

				arg_91_1.var_.actorSpriteComps1060 = nil
			end

			local var_94_19 = 0
			local var_94_20 = 0.575

			if var_94_19 < arg_91_1.time_ and arg_91_1.time_ <= var_94_19 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_21 = arg_91_1:FormatText(StoryNameCfg[596].name)

				arg_91_1.leftNameTxt_.text = var_94_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_22 = arg_91_1:GetWordFromCfg(410042023)
				local var_94_23 = arg_91_1:FormatText(var_94_22.content)

				arg_91_1.text_.text = var_94_23

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_24 = 23
				local var_94_25 = utf8.len(var_94_23)
				local var_94_26 = var_94_24 <= 0 and var_94_20 or var_94_20 * (var_94_25 / var_94_24)

				if var_94_26 > 0 and var_94_20 < var_94_26 then
					arg_91_1.talkMaxDuration = var_94_26

					if var_94_26 + var_94_19 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_26 + var_94_19
					end
				end

				arg_91_1.text_.text = var_94_23
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042023", "story_v_out_410042.awb") ~= 0 then
					local var_94_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042023", "story_v_out_410042.awb") / 1000

					if var_94_27 + var_94_19 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_27 + var_94_19
					end

					if var_94_22.prefab_name ~= "" and arg_91_1.actors_[var_94_22.prefab_name] ~= nil then
						local var_94_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_22.prefab_name].transform, "story_v_out_410042", "410042023", "story_v_out_410042.awb")

						arg_91_1:RecordAudio("410042023", var_94_28)
						arg_91_1:RecordAudio("410042023", var_94_28)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410042", "410042023", "story_v_out_410042.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410042", "410042023", "story_v_out_410042.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_29 = math.max(var_94_20, arg_91_1.talkMaxDuration)

			if var_94_19 <= arg_91_1.time_ and arg_91_1.time_ < var_94_19 + var_94_29 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_19) / var_94_29

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_19 + var_94_29 and arg_91_1.time_ < var_94_19 + var_94_29 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410042024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410042024
		arg_95_1.duration_ = 11.966

		local var_95_0 = {
			zh = 5.9,
			ja = 11.966
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
				arg_95_0:Play410042025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10059"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos10059 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10059", 4)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(390, -530, 35)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10059, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_98_7 = arg_95_1.actors_["10059"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps10059 == nil then
				arg_95_1.var_.actorSpriteComps10059 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.034

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps10059 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps10059 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps10059 = nil
			end

			local var_98_13 = 0
			local var_98_14 = 0.725

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_15 = arg_95_1:FormatText(StoryNameCfg[596].name)

				arg_95_1.leftNameTxt_.text = var_98_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_16 = arg_95_1:GetWordFromCfg(410042024)
				local var_98_17 = arg_95_1:FormatText(var_98_16.content)

				arg_95_1.text_.text = var_98_17

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_18 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042024", "story_v_out_410042.awb") ~= 0 then
					local var_98_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042024", "story_v_out_410042.awb") / 1000

					if var_98_21 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_13
					end

					if var_98_16.prefab_name ~= "" and arg_95_1.actors_[var_98_16.prefab_name] ~= nil then
						local var_98_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_16.prefab_name].transform, "story_v_out_410042", "410042024", "story_v_out_410042.awb")

						arg_95_1:RecordAudio("410042024", var_98_22)
						arg_95_1:RecordAudio("410042024", var_98_22)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410042", "410042024", "story_v_out_410042.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410042", "410042024", "story_v_out_410042.awb")
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
	Play410042025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410042025
		arg_99_1.duration_ = 17.966

		local var_99_0 = {
			zh = 8.833,
			ja = 17.966
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
				arg_99_0:Play410042026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10059"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos10059 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("10059", 4)

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
				local var_102_6 = Vector3.New(390, -530, 35)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10059, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_102_7 = arg_99_1.actors_["10059"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps10059 == nil then
				arg_99_1.var_.actorSpriteComps10059 = var_102_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_9 = 0.034

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.actorSpriteComps10059 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_102_2 then
							local var_102_11 = Mathf.Lerp(iter_102_2.color.r, 1, var_102_10)

							iter_102_2.color = Color.New(var_102_11, var_102_11, var_102_11)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.actorSpriteComps10059 then
				local var_102_12 = 1

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_12, var_102_12, var_102_12)
					end
				end

				arg_99_1.var_.actorSpriteComps10059 = nil
			end

			local var_102_13 = 0
			local var_102_14 = 0.95

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_15 = arg_99_1:FormatText(StoryNameCfg[596].name)

				arg_99_1.leftNameTxt_.text = var_102_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_16 = arg_99_1:GetWordFromCfg(410042025)
				local var_102_17 = arg_99_1:FormatText(var_102_16.content)

				arg_99_1.text_.text = var_102_17

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_18 = 38
				local var_102_19 = utf8.len(var_102_17)
				local var_102_20 = var_102_18 <= 0 and var_102_14 or var_102_14 * (var_102_19 / var_102_18)

				if var_102_20 > 0 and var_102_14 < var_102_20 then
					arg_99_1.talkMaxDuration = var_102_20

					if var_102_20 + var_102_13 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_13
					end
				end

				arg_99_1.text_.text = var_102_17
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042025", "story_v_out_410042.awb") ~= 0 then
					local var_102_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042025", "story_v_out_410042.awb") / 1000

					if var_102_21 + var_102_13 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_21 + var_102_13
					end

					if var_102_16.prefab_name ~= "" and arg_99_1.actors_[var_102_16.prefab_name] ~= nil then
						local var_102_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_16.prefab_name].transform, "story_v_out_410042", "410042025", "story_v_out_410042.awb")

						arg_99_1:RecordAudio("410042025", var_102_22)
						arg_99_1:RecordAudio("410042025", var_102_22)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410042", "410042025", "story_v_out_410042.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410042", "410042025", "story_v_out_410042.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_23 = math.max(var_102_14, arg_99_1.talkMaxDuration)

			if var_102_13 <= arg_99_1.time_ and arg_99_1.time_ < var_102_13 + var_102_23 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_13) / var_102_23

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_13 + var_102_23 and arg_99_1.time_ < var_102_13 + var_102_23 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410042026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410042026
		arg_103_1.duration_ = 9.233

		local var_103_0 = {
			zh = 8.566,
			ja = 9.233
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
				arg_103_0:Play410042027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1060"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1060 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("1060", 2)

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
				local var_106_6 = Vector3.New(-390, -435, -40)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1060, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_106_7 = arg_103_1.actors_["1060"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps1060 == nil then
				arg_103_1.var_.actorSpriteComps1060 = var_106_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_9 = 0.034

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.actorSpriteComps1060 then
					for iter_106_1, iter_106_2 in pairs(arg_103_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_106_2 then
							local var_106_11 = Mathf.Lerp(iter_106_2.color.r, 1, var_106_10)

							iter_106_2.color = Color.New(var_106_11, var_106_11, var_106_11)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.actorSpriteComps1060 then
				local var_106_12 = 1

				for iter_106_3, iter_106_4 in pairs(arg_103_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_106_4 then
						iter_106_4.color = Color.New(var_106_12, var_106_12, var_106_12)
					end
				end

				arg_103_1.var_.actorSpriteComps1060 = nil
			end

			local var_106_13 = arg_103_1.actors_["10059"]
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 and arg_103_1.var_.actorSpriteComps10059 == nil then
				arg_103_1.var_.actorSpriteComps10059 = var_106_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_15 = 0.034

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15

				if arg_103_1.var_.actorSpriteComps10059 then
					for iter_106_5, iter_106_6 in pairs(arg_103_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_106_6 then
							local var_106_17 = Mathf.Lerp(iter_106_6.color.r, 0.5, var_106_16)

							iter_106_6.color = Color.New(var_106_17, var_106_17, var_106_17)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 and arg_103_1.var_.actorSpriteComps10059 then
				local var_106_18 = 0.5

				for iter_106_7, iter_106_8 in pairs(arg_103_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_106_8 then
						iter_106_8.color = Color.New(var_106_18, var_106_18, var_106_18)
					end
				end

				arg_103_1.var_.actorSpriteComps10059 = nil
			end

			local var_106_19 = 0
			local var_106_20 = 0.95

			if var_106_19 < arg_103_1.time_ and arg_103_1.time_ <= var_106_19 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_21 = arg_103_1:FormatText(StoryNameCfg[584].name)

				arg_103_1.leftNameTxt_.text = var_106_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_22 = arg_103_1:GetWordFromCfg(410042026)
				local var_106_23 = arg_103_1:FormatText(var_106_22.content)

				arg_103_1.text_.text = var_106_23

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_24 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042026", "story_v_out_410042.awb") ~= 0 then
					local var_106_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042026", "story_v_out_410042.awb") / 1000

					if var_106_27 + var_106_19 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_27 + var_106_19
					end

					if var_106_22.prefab_name ~= "" and arg_103_1.actors_[var_106_22.prefab_name] ~= nil then
						local var_106_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_22.prefab_name].transform, "story_v_out_410042", "410042026", "story_v_out_410042.awb")

						arg_103_1:RecordAudio("410042026", var_106_28)
						arg_103_1:RecordAudio("410042026", var_106_28)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410042", "410042026", "story_v_out_410042.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410042", "410042026", "story_v_out_410042.awb")
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
	Play410042027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410042027
		arg_107_1.duration_ = 5.9

		local var_107_0 = {
			zh = 3.366,
			ja = 5.9
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
				arg_107_0:Play410042028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10059"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos10059 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("10059", 4)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(390, -530, 35)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10059, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_110_7 = arg_107_1.actors_["10059"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps10059 == nil then
				arg_107_1.var_.actorSpriteComps10059 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.034

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps10059 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 1, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps10059 then
				local var_110_12 = 1

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps10059 = nil
			end

			local var_110_13 = arg_107_1.actors_["1060"]
			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 == nil then
				arg_107_1.var_.actorSpriteComps1060 = var_110_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_15 = 0.034

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15

				if arg_107_1.var_.actorSpriteComps1060 then
					for iter_110_5, iter_110_6 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_110_6 then
							local var_110_17 = Mathf.Lerp(iter_110_6.color.r, 0.5, var_110_16)

							iter_110_6.color = Color.New(var_110_17, var_110_17, var_110_17)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 then
				local var_110_18 = 0.5

				for iter_110_7, iter_110_8 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_110_8 then
						iter_110_8.color = Color.New(var_110_18, var_110_18, var_110_18)
					end
				end

				arg_107_1.var_.actorSpriteComps1060 = nil
			end

			local var_110_19 = 0
			local var_110_20 = 0.35

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_21 = arg_107_1:FormatText(StoryNameCfg[596].name)

				arg_107_1.leftNameTxt_.text = var_110_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_22 = arg_107_1:GetWordFromCfg(410042027)
				local var_110_23 = arg_107_1:FormatText(var_110_22.content)

				arg_107_1.text_.text = var_110_23

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_24 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042027", "story_v_out_410042.awb") ~= 0 then
					local var_110_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042027", "story_v_out_410042.awb") / 1000

					if var_110_27 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_27 + var_110_19
					end

					if var_110_22.prefab_name ~= "" and arg_107_1.actors_[var_110_22.prefab_name] ~= nil then
						local var_110_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_22.prefab_name].transform, "story_v_out_410042", "410042027", "story_v_out_410042.awb")

						arg_107_1:RecordAudio("410042027", var_110_28)
						arg_107_1:RecordAudio("410042027", var_110_28)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410042", "410042027", "story_v_out_410042.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410042", "410042027", "story_v_out_410042.awb")
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
	Play410042028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410042028
		arg_111_1.duration_ = 9.966

		local var_111_0 = {
			zh = 3.233,
			ja = 9.966
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
				arg_111_0:Play410042029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1060"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1060 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1060", 2)

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
				local var_114_6 = Vector3.New(-390, -435, -40)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1060, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_114_7 = arg_111_1.actors_["1060"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 == nil then
				arg_111_1.var_.actorSpriteComps1060 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.034

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps1060 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps1060 = nil
			end

			local var_114_13 = arg_111_1.actors_["10059"]
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 and arg_111_1.var_.actorSpriteComps10059 == nil then
				arg_111_1.var_.actorSpriteComps10059 = var_114_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_15 = 0.034

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15

				if arg_111_1.var_.actorSpriteComps10059 then
					for iter_114_5, iter_114_6 in pairs(arg_111_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_114_6 then
							local var_114_17 = Mathf.Lerp(iter_114_6.color.r, 0.5, var_114_16)

							iter_114_6.color = Color.New(var_114_17, var_114_17, var_114_17)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 and arg_111_1.var_.actorSpriteComps10059 then
				local var_114_18 = 0.5

				for iter_114_7, iter_114_8 in pairs(arg_111_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_114_8 then
						iter_114_8.color = Color.New(var_114_18, var_114_18, var_114_18)
					end
				end

				arg_111_1.var_.actorSpriteComps10059 = nil
			end

			local var_114_19 = 0
			local var_114_20 = 0.425

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_21 = arg_111_1:FormatText(StoryNameCfg[584].name)

				arg_111_1.leftNameTxt_.text = var_114_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_22 = arg_111_1:GetWordFromCfg(410042028)
				local var_114_23 = arg_111_1:FormatText(var_114_22.content)

				arg_111_1.text_.text = var_114_23

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_24 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042028", "story_v_out_410042.awb") ~= 0 then
					local var_114_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042028", "story_v_out_410042.awb") / 1000

					if var_114_27 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_27 + var_114_19
					end

					if var_114_22.prefab_name ~= "" and arg_111_1.actors_[var_114_22.prefab_name] ~= nil then
						local var_114_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_22.prefab_name].transform, "story_v_out_410042", "410042028", "story_v_out_410042.awb")

						arg_111_1:RecordAudio("410042028", var_114_28)
						arg_111_1:RecordAudio("410042028", var_114_28)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410042", "410042028", "story_v_out_410042.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410042", "410042028", "story_v_out_410042.awb")
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
	Play410042029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410042029
		arg_115_1.duration_ = 15.533

		local var_115_0 = {
			zh = 5.5,
			ja = 15.533
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
				arg_115_0:Play410042030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10059"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos10059 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("10059", 4)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "split_2" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(390, -530, 35)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos10059, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_118_7 = arg_115_1.actors_["10059"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps10059 == nil then
				arg_115_1.var_.actorSpriteComps10059 = var_118_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_9 = 0.034

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.actorSpriteComps10059 then
					for iter_118_1, iter_118_2 in pairs(arg_115_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_118_2 then
							local var_118_11 = Mathf.Lerp(iter_118_2.color.r, 1, var_118_10)

							iter_118_2.color = Color.New(var_118_11, var_118_11, var_118_11)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and arg_115_1.var_.actorSpriteComps10059 then
				local var_118_12 = 1

				for iter_118_3, iter_118_4 in pairs(arg_115_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_118_4 then
						iter_118_4.color = Color.New(var_118_12, var_118_12, var_118_12)
					end
				end

				arg_115_1.var_.actorSpriteComps10059 = nil
			end

			local var_118_13 = arg_115_1.actors_["1060"]
			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 and arg_115_1.var_.actorSpriteComps1060 == nil then
				arg_115_1.var_.actorSpriteComps1060 = var_118_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_15 = 0.034

			if var_118_14 <= arg_115_1.time_ and arg_115_1.time_ < var_118_14 + var_118_15 then
				local var_118_16 = (arg_115_1.time_ - var_118_14) / var_118_15

				if arg_115_1.var_.actorSpriteComps1060 then
					for iter_118_5, iter_118_6 in pairs(arg_115_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_118_6 then
							local var_118_17 = Mathf.Lerp(iter_118_6.color.r, 0.5, var_118_16)

							iter_118_6.color = Color.New(var_118_17, var_118_17, var_118_17)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_14 + var_118_15 and arg_115_1.time_ < var_118_14 + var_118_15 + arg_118_0 and arg_115_1.var_.actorSpriteComps1060 then
				local var_118_18 = 0.5

				for iter_118_7, iter_118_8 in pairs(arg_115_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_118_8 then
						iter_118_8.color = Color.New(var_118_18, var_118_18, var_118_18)
					end
				end

				arg_115_1.var_.actorSpriteComps1060 = nil
			end

			local var_118_19 = 0
			local var_118_20 = 0.65

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_21 = arg_115_1:FormatText(StoryNameCfg[596].name)

				arg_115_1.leftNameTxt_.text = var_118_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_22 = arg_115_1:GetWordFromCfg(410042029)
				local var_118_23 = arg_115_1:FormatText(var_118_22.content)

				arg_115_1.text_.text = var_118_23

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_24 = 26
				local var_118_25 = utf8.len(var_118_23)
				local var_118_26 = var_118_24 <= 0 and var_118_20 or var_118_20 * (var_118_25 / var_118_24)

				if var_118_26 > 0 and var_118_20 < var_118_26 then
					arg_115_1.talkMaxDuration = var_118_26

					if var_118_26 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_26 + var_118_19
					end
				end

				arg_115_1.text_.text = var_118_23
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042029", "story_v_out_410042.awb") ~= 0 then
					local var_118_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042029", "story_v_out_410042.awb") / 1000

					if var_118_27 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_27 + var_118_19
					end

					if var_118_22.prefab_name ~= "" and arg_115_1.actors_[var_118_22.prefab_name] ~= nil then
						local var_118_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_22.prefab_name].transform, "story_v_out_410042", "410042029", "story_v_out_410042.awb")

						arg_115_1:RecordAudio("410042029", var_118_28)
						arg_115_1:RecordAudio("410042029", var_118_28)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410042", "410042029", "story_v_out_410042.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410042", "410042029", "story_v_out_410042.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_29 = math.max(var_118_20, arg_115_1.talkMaxDuration)

			if var_118_19 <= arg_115_1.time_ and arg_115_1.time_ < var_118_19 + var_118_29 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_19) / var_118_29

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_19 + var_118_29 and arg_115_1.time_ < var_118_19 + var_118_29 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410042030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410042030
		arg_119_1.duration_ = 9.7

		local var_119_0 = {
			zh = 1.2,
			ja = 9.7
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
				arg_119_0:Play410042031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1060"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1060 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("1060", 2)

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
				local var_122_6 = Vector3.New(-390, -435, -40)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1060, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_122_7 = arg_119_1.actors_["1060"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps1060 == nil then
				arg_119_1.var_.actorSpriteComps1060 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.034

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps1060 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps1060 then
				local var_122_12 = 1

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps1060 = nil
			end

			local var_122_13 = arg_119_1.actors_["10059"]
			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 and arg_119_1.var_.actorSpriteComps10059 == nil then
				arg_119_1.var_.actorSpriteComps10059 = var_122_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_15 = 0.034

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_15 then
				local var_122_16 = (arg_119_1.time_ - var_122_14) / var_122_15

				if arg_119_1.var_.actorSpriteComps10059 then
					for iter_122_5, iter_122_6 in pairs(arg_119_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_122_6 then
							local var_122_17 = Mathf.Lerp(iter_122_6.color.r, 0.5, var_122_16)

							iter_122_6.color = Color.New(var_122_17, var_122_17, var_122_17)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_14 + var_122_15 and arg_119_1.time_ < var_122_14 + var_122_15 + arg_122_0 and arg_119_1.var_.actorSpriteComps10059 then
				local var_122_18 = 0.5

				for iter_122_7, iter_122_8 in pairs(arg_119_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_122_8 then
						iter_122_8.color = Color.New(var_122_18, var_122_18, var_122_18)
					end
				end

				arg_119_1.var_.actorSpriteComps10059 = nil
			end

			local var_122_19 = 0
			local var_122_20 = 0.15

			if var_122_19 < arg_119_1.time_ and arg_119_1.time_ <= var_122_19 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_21 = arg_119_1:FormatText(StoryNameCfg[584].name)

				arg_119_1.leftNameTxt_.text = var_122_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_22 = arg_119_1:GetWordFromCfg(410042030)
				local var_122_23 = arg_119_1:FormatText(var_122_22.content)

				arg_119_1.text_.text = var_122_23

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_24 = 6
				local var_122_25 = utf8.len(var_122_23)
				local var_122_26 = var_122_24 <= 0 and var_122_20 or var_122_20 * (var_122_25 / var_122_24)

				if var_122_26 > 0 and var_122_20 < var_122_26 then
					arg_119_1.talkMaxDuration = var_122_26

					if var_122_26 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_26 + var_122_19
					end
				end

				arg_119_1.text_.text = var_122_23
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042030", "story_v_out_410042.awb") ~= 0 then
					local var_122_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042030", "story_v_out_410042.awb") / 1000

					if var_122_27 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_27 + var_122_19
					end

					if var_122_22.prefab_name ~= "" and arg_119_1.actors_[var_122_22.prefab_name] ~= nil then
						local var_122_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_22.prefab_name].transform, "story_v_out_410042", "410042030", "story_v_out_410042.awb")

						arg_119_1:RecordAudio("410042030", var_122_28)
						arg_119_1:RecordAudio("410042030", var_122_28)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410042", "410042030", "story_v_out_410042.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410042", "410042030", "story_v_out_410042.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_29 = math.max(var_122_20, arg_119_1.talkMaxDuration)

			if var_122_19 <= arg_119_1.time_ and arg_119_1.time_ < var_122_19 + var_122_29 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_19) / var_122_29

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_19 + var_122_29 and arg_119_1.time_ < var_122_19 + var_122_29 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410042031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410042031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play410042032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1060"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1060 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1060", 7)

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
				local var_126_6 = Vector3.New(0, -2000, -40)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1060, var_126_6, var_126_5)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_4 and arg_123_1.time_ < var_126_1 + var_126_4 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_126_7 = arg_123_1.actors_["10059"].transform
			local var_126_8 = 0

			if var_126_8 < arg_123_1.time_ and arg_123_1.time_ <= var_126_8 + arg_126_0 then
				arg_123_1.var_.moveOldPos10059 = var_126_7.localPosition
				var_126_7.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("10059", 7)

				local var_126_9 = var_126_7.childCount

				for iter_126_1 = 0, var_126_9 - 1 do
					local var_126_10 = var_126_7:GetChild(iter_126_1)

					if var_126_10.name == "" or not string.find(var_126_10.name, "split") then
						var_126_10.gameObject:SetActive(true)
					else
						var_126_10.gameObject:SetActive(false)
					end
				end
			end

			local var_126_11 = 0.001

			if var_126_8 <= arg_123_1.time_ and arg_123_1.time_ < var_126_8 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_8) / var_126_11
				local var_126_13 = Vector3.New(0, -2000, 35)

				var_126_7.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10059, var_126_13, var_126_12)
			end

			if arg_123_1.time_ >= var_126_8 + var_126_11 and arg_123_1.time_ < var_126_8 + var_126_11 + arg_126_0 then
				var_126_7.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_126_14 = arg_123_1.actors_["1056"].transform
			local var_126_15 = 0

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.var_.moveOldPos1056 = var_126_14.localPosition
				var_126_14.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1056", 3)

				local var_126_16 = var_126_14.childCount

				for iter_126_2 = 0, var_126_16 - 1 do
					local var_126_17 = var_126_14:GetChild(iter_126_2)

					if var_126_17.name == "" or not string.find(var_126_17.name, "split") then
						var_126_17.gameObject:SetActive(true)
					else
						var_126_17.gameObject:SetActive(false)
					end
				end
			end

			local var_126_18 = 0.001

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_18 then
				local var_126_19 = (arg_123_1.time_ - var_126_15) / var_126_18
				local var_126_20 = Vector3.New(0, -350, -180)

				var_126_14.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1056, var_126_20, var_126_19)
			end

			if arg_123_1.time_ >= var_126_15 + var_126_18 and arg_123_1.time_ < var_126_15 + var_126_18 + arg_126_0 then
				var_126_14.localPosition = Vector3.New(0, -350, -180)
			end

			local var_126_21 = arg_123_1.actors_["1060"]
			local var_126_22 = 0

			if var_126_22 < arg_123_1.time_ and arg_123_1.time_ <= var_126_22 + arg_126_0 and arg_123_1.var_.actorSpriteComps1060 == nil then
				arg_123_1.var_.actorSpriteComps1060 = var_126_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_23 = 0.034

			if var_126_22 <= arg_123_1.time_ and arg_123_1.time_ < var_126_22 + var_126_23 then
				local var_126_24 = (arg_123_1.time_ - var_126_22) / var_126_23

				if arg_123_1.var_.actorSpriteComps1060 then
					for iter_126_3, iter_126_4 in pairs(arg_123_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_126_4 then
							local var_126_25 = Mathf.Lerp(iter_126_4.color.r, 0.5, var_126_24)

							iter_126_4.color = Color.New(var_126_25, var_126_25, var_126_25)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_22 + var_126_23 and arg_123_1.time_ < var_126_22 + var_126_23 + arg_126_0 and arg_123_1.var_.actorSpriteComps1060 then
				local var_126_26 = 0.5

				for iter_126_5, iter_126_6 in pairs(arg_123_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_126_6 then
						iter_126_6.color = Color.New(var_126_26, var_126_26, var_126_26)
					end
				end

				arg_123_1.var_.actorSpriteComps1060 = nil
			end

			local var_126_27 = arg_123_1.actors_["10059"]
			local var_126_28 = 0

			if var_126_28 < arg_123_1.time_ and arg_123_1.time_ <= var_126_28 + arg_126_0 and arg_123_1.var_.actorSpriteComps10059 == nil then
				arg_123_1.var_.actorSpriteComps10059 = var_126_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_29 = 0.034

			if var_126_28 <= arg_123_1.time_ and arg_123_1.time_ < var_126_28 + var_126_29 then
				local var_126_30 = (arg_123_1.time_ - var_126_28) / var_126_29

				if arg_123_1.var_.actorSpriteComps10059 then
					for iter_126_7, iter_126_8 in pairs(arg_123_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_126_8 then
							local var_126_31 = Mathf.Lerp(iter_126_8.color.r, 0.5, var_126_30)

							iter_126_8.color = Color.New(var_126_31, var_126_31, var_126_31)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_28 + var_126_29 and arg_123_1.time_ < var_126_28 + var_126_29 + arg_126_0 and arg_123_1.var_.actorSpriteComps10059 then
				local var_126_32 = 0.5

				for iter_126_9, iter_126_10 in pairs(arg_123_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_126_10 then
						iter_126_10.color = Color.New(var_126_32, var_126_32, var_126_32)
					end
				end

				arg_123_1.var_.actorSpriteComps10059 = nil
			end

			local var_126_33 = arg_123_1.actors_["1056"]
			local var_126_34 = 0

			if var_126_34 < arg_123_1.time_ and arg_123_1.time_ <= var_126_34 + arg_126_0 and arg_123_1.var_.actorSpriteComps1056 == nil then
				arg_123_1.var_.actorSpriteComps1056 = var_126_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_35 = 0.034

			if var_126_34 <= arg_123_1.time_ and arg_123_1.time_ < var_126_34 + var_126_35 then
				local var_126_36 = (arg_123_1.time_ - var_126_34) / var_126_35

				if arg_123_1.var_.actorSpriteComps1056 then
					for iter_126_11, iter_126_12 in pairs(arg_123_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_126_12 then
							local var_126_37 = Mathf.Lerp(iter_126_12.color.r, 0.5, var_126_36)

							iter_126_12.color = Color.New(var_126_37, var_126_37, var_126_37)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_34 + var_126_35 and arg_123_1.time_ < var_126_34 + var_126_35 + arg_126_0 and arg_123_1.var_.actorSpriteComps1056 then
				local var_126_38 = 0.5

				for iter_126_13, iter_126_14 in pairs(arg_123_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_126_14 then
						iter_126_14.color = Color.New(var_126_38, var_126_38, var_126_38)
					end
				end

				arg_123_1.var_.actorSpriteComps1056 = nil
			end

			local var_126_39 = 0
			local var_126_40 = 1

			if var_126_39 < arg_123_1.time_ and arg_123_1.time_ <= var_126_39 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_41 = arg_123_1:GetWordFromCfg(410042031)
				local var_126_42 = arg_123_1:FormatText(var_126_41.content)

				arg_123_1.text_.text = var_126_42

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_43 = 40
				local var_126_44 = utf8.len(var_126_42)
				local var_126_45 = var_126_43 <= 0 and var_126_40 or var_126_40 * (var_126_44 / var_126_43)

				if var_126_45 > 0 and var_126_40 < var_126_45 then
					arg_123_1.talkMaxDuration = var_126_45

					if var_126_45 + var_126_39 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_45 + var_126_39
					end
				end

				arg_123_1.text_.text = var_126_42
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_46 = math.max(var_126_40, arg_123_1.talkMaxDuration)

			if var_126_39 <= arg_123_1.time_ and arg_123_1.time_ < var_126_39 + var_126_46 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_39) / var_126_46

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_39 + var_126_46 and arg_123_1.time_ < var_126_39 + var_126_46 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410042032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410042032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play410042033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1056"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1056 = var_130_0.localPosition
				var_130_0.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("1056", 7)

				local var_130_2 = var_130_0.childCount

				for iter_130_0 = 0, var_130_2 - 1 do
					local var_130_3 = var_130_0:GetChild(iter_130_0)

					if var_130_3.name == "" or not string.find(var_130_3.name, "split") then
						var_130_3.gameObject:SetActive(true)
					else
						var_130_3.gameObject:SetActive(false)
					end
				end
			end

			local var_130_4 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_4 then
				local var_130_5 = (arg_127_1.time_ - var_130_1) / var_130_4
				local var_130_6 = Vector3.New(0, -2000, -180)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1056, var_130_6, var_130_5)
			end

			if arg_127_1.time_ >= var_130_1 + var_130_4 and arg_127_1.time_ < var_130_1 + var_130_4 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_130_7 = 0
			local var_130_8 = 1

			if var_130_7 < arg_127_1.time_ and arg_127_1.time_ <= var_130_7 + arg_130_0 then
				local var_130_9 = "stop"
				local var_130_10 = "effect"

				arg_127_1:AudioAction(var_130_9, var_130_10, "se_story_side_1055", "se_story_side_1055_rain", "")
			end

			local var_130_11 = 0
			local var_130_12 = 1.125

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_13 = arg_127_1:GetWordFromCfg(410042032)
				local var_130_14 = arg_127_1:FormatText(var_130_13.content)

				arg_127_1.text_.text = var_130_14

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_15 = 45
				local var_130_16 = utf8.len(var_130_14)
				local var_130_17 = var_130_15 <= 0 and var_130_12 or var_130_12 * (var_130_16 / var_130_15)

				if var_130_17 > 0 and var_130_12 < var_130_17 then
					arg_127_1.talkMaxDuration = var_130_17

					if var_130_17 + var_130_11 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_17 + var_130_11
					end
				end

				arg_127_1.text_.text = var_130_14
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_18 = math.max(var_130_12, arg_127_1.talkMaxDuration)

			if var_130_11 <= arg_127_1.time_ and arg_127_1.time_ < var_130_11 + var_130_18 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_11) / var_130_18

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_11 + var_130_18 and arg_127_1.time_ < var_130_11 + var_130_18 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play410042033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410042033
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play410042034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "10063"

			if arg_131_1.actors_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_134_0), arg_131_1.canvasGo_.transform)

				var_134_1.transform:SetSiblingIndex(1)

				var_134_1.name = var_134_0
				var_134_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_131_1.actors_[var_134_0] = var_134_1
			end

			local var_134_2 = arg_131_1.actors_["10063"].transform
			local var_134_3 = 0

			if var_134_3 < arg_131_1.time_ and arg_131_1.time_ <= var_134_3 + arg_134_0 then
				arg_131_1.var_.moveOldPos10063 = var_134_2.localPosition
				var_134_2.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10063", 2)

				local var_134_4 = var_134_2.childCount

				for iter_134_0 = 0, var_134_4 - 1 do
					local var_134_5 = var_134_2:GetChild(iter_134_0)

					if var_134_5.name == "" or not string.find(var_134_5.name, "split") then
						var_134_5.gameObject:SetActive(true)
					else
						var_134_5.gameObject:SetActive(false)
					end
				end
			end

			local var_134_6 = 0.001

			if var_134_3 <= arg_131_1.time_ and arg_131_1.time_ < var_134_3 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_3) / var_134_6
				local var_134_8 = Vector3.New(-390, -535, -105)

				var_134_2.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10063, var_134_8, var_134_7)
			end

			if arg_131_1.time_ >= var_134_3 + var_134_6 and arg_131_1.time_ < var_134_3 + var_134_6 + arg_134_0 then
				var_134_2.localPosition = Vector3.New(-390, -535, -105)
			end

			local var_134_9 = "10060"

			if arg_131_1.actors_[var_134_9] == nil then
				local var_134_10 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_134_9), arg_131_1.canvasGo_.transform)

				var_134_10.transform:SetSiblingIndex(1)

				var_134_10.name = var_134_9
				var_134_10.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_131_1.actors_[var_134_9] = var_134_10
			end

			local var_134_11 = arg_131_1.actors_["10060"].transform
			local var_134_12 = 0

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				arg_131_1.var_.moveOldPos10060 = var_134_11.localPosition
				var_134_11.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10060", 4)

				local var_134_13 = var_134_11.childCount

				for iter_134_1 = 0, var_134_13 - 1 do
					local var_134_14 = var_134_11:GetChild(iter_134_1)

					if var_134_14.name == "" or not string.find(var_134_14.name, "split") then
						var_134_14.gameObject:SetActive(true)
					else
						var_134_14.gameObject:SetActive(false)
					end
				end
			end

			local var_134_15 = 0.001

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_15 then
				local var_134_16 = (arg_131_1.time_ - var_134_12) / var_134_15
				local var_134_17 = Vector3.New(390, -400, 0)

				var_134_11.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10060, var_134_17, var_134_16)
			end

			if arg_131_1.time_ >= var_134_12 + var_134_15 and arg_131_1.time_ < var_134_12 + var_134_15 + arg_134_0 then
				var_134_11.localPosition = Vector3.New(390, -400, 0)
			end

			local var_134_18 = arg_131_1.actors_["10063"]
			local var_134_19 = 0

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 and arg_131_1.var_.actorSpriteComps10063 == nil then
				arg_131_1.var_.actorSpriteComps10063 = var_134_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_20 = 0.034

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_20 then
				local var_134_21 = (arg_131_1.time_ - var_134_19) / var_134_20

				if arg_131_1.var_.actorSpriteComps10063 then
					for iter_134_2, iter_134_3 in pairs(arg_131_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_134_3 then
							local var_134_22 = Mathf.Lerp(iter_134_3.color.r, 0.5, var_134_21)

							iter_134_3.color = Color.New(var_134_22, var_134_22, var_134_22)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_19 + var_134_20 and arg_131_1.time_ < var_134_19 + var_134_20 + arg_134_0 and arg_131_1.var_.actorSpriteComps10063 then
				local var_134_23 = 0.5

				for iter_134_4, iter_134_5 in pairs(arg_131_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_134_5 then
						iter_134_5.color = Color.New(var_134_23, var_134_23, var_134_23)
					end
				end

				arg_131_1.var_.actorSpriteComps10063 = nil
			end

			local var_134_24 = arg_131_1.actors_["10060"]
			local var_134_25 = 0

			if var_134_25 < arg_131_1.time_ and arg_131_1.time_ <= var_134_25 + arg_134_0 and arg_131_1.var_.actorSpriteComps10060 == nil then
				arg_131_1.var_.actorSpriteComps10060 = var_134_24:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_26 = 0.034

			if var_134_25 <= arg_131_1.time_ and arg_131_1.time_ < var_134_25 + var_134_26 then
				local var_134_27 = (arg_131_1.time_ - var_134_25) / var_134_26

				if arg_131_1.var_.actorSpriteComps10060 then
					for iter_134_6, iter_134_7 in pairs(arg_131_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_134_7 then
							local var_134_28 = Mathf.Lerp(iter_134_7.color.r, 0.5, var_134_27)

							iter_134_7.color = Color.New(var_134_28, var_134_28, var_134_28)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_25 + var_134_26 and arg_131_1.time_ < var_134_25 + var_134_26 + arg_134_0 and arg_131_1.var_.actorSpriteComps10060 then
				local var_134_29 = 0.5

				for iter_134_8, iter_134_9 in pairs(arg_131_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_134_9 then
						iter_134_9.color = Color.New(var_134_29, var_134_29, var_134_29)
					end
				end

				arg_131_1.var_.actorSpriteComps10060 = nil
			end

			local var_134_30 = arg_131_1.actors_["1056"].transform
			local var_134_31 = 0

			if var_134_31 < arg_131_1.time_ and arg_131_1.time_ <= var_134_31 + arg_134_0 then
				arg_131_1.var_.moveOldPos1056 = var_134_30.localPosition
				var_134_30.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("1056", 7)

				local var_134_32 = var_134_30.childCount

				for iter_134_10 = 0, var_134_32 - 1 do
					local var_134_33 = var_134_30:GetChild(iter_134_10)

					if var_134_33.name == "" or not string.find(var_134_33.name, "split") then
						var_134_33.gameObject:SetActive(true)
					else
						var_134_33.gameObject:SetActive(false)
					end
				end
			end

			local var_134_34 = 0.001

			if var_134_31 <= arg_131_1.time_ and arg_131_1.time_ < var_134_31 + var_134_34 then
				local var_134_35 = (arg_131_1.time_ - var_134_31) / var_134_34
				local var_134_36 = Vector3.New(0, -2000, -180)

				var_134_30.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1056, var_134_36, var_134_35)
			end

			if arg_131_1.time_ >= var_134_31 + var_134_34 and arg_131_1.time_ < var_134_31 + var_134_34 + arg_134_0 then
				var_134_30.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_134_37 = 0
			local var_134_38 = 1.1

			if var_134_37 < arg_131_1.time_ and arg_131_1.time_ <= var_134_37 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_39 = arg_131_1:GetWordFromCfg(410042033)
				local var_134_40 = arg_131_1:FormatText(var_134_39.content)

				arg_131_1.text_.text = var_134_40

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_41 = 44
				local var_134_42 = utf8.len(var_134_40)
				local var_134_43 = var_134_41 <= 0 and var_134_38 or var_134_38 * (var_134_42 / var_134_41)

				if var_134_43 > 0 and var_134_38 < var_134_43 then
					arg_131_1.talkMaxDuration = var_134_43

					if var_134_43 + var_134_37 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_43 + var_134_37
					end
				end

				arg_131_1.text_.text = var_134_40
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_44 = math.max(var_134_38, arg_131_1.talkMaxDuration)

			if var_134_37 <= arg_131_1.time_ and arg_131_1.time_ < var_134_37 + var_134_44 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_37) / var_134_44

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_37 + var_134_44 and arg_131_1.time_ < var_134_37 + var_134_44 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play410042034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410042034
		arg_135_1.duration_ = 6.433

		local var_135_0 = {
			zh = 3.2,
			ja = 6.433
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
				arg_135_0:Play410042035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10060"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos10060 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("10060", 4)

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
				local var_138_6 = Vector3.New(390, -400, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10060, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(390, -400, 0)
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
							local var_138_11 = Mathf.Lerp(iter_138_2.color.r, 1, var_138_10)

							iter_138_2.color = Color.New(var_138_11, var_138_11, var_138_11)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.actorSpriteComps10060 then
				local var_138_12 = 1

				for iter_138_3, iter_138_4 in pairs(arg_135_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_138_4 then
						iter_138_4.color = Color.New(var_138_12, var_138_12, var_138_12)
					end
				end

				arg_135_1.var_.actorSpriteComps10060 = nil
			end

			local var_138_13 = 0
			local var_138_14 = 0.3

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_15 = arg_135_1:FormatText(StoryNameCfg[36].name)

				arg_135_1.leftNameTxt_.text = var_138_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_16 = arg_135_1:GetWordFromCfg(410042034)
				local var_138_17 = arg_135_1:FormatText(var_138_16.content)

				arg_135_1.text_.text = var_138_17

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_18 = 12
				local var_138_19 = utf8.len(var_138_17)
				local var_138_20 = var_138_18 <= 0 and var_138_14 or var_138_14 * (var_138_19 / var_138_18)

				if var_138_20 > 0 and var_138_14 < var_138_20 then
					arg_135_1.talkMaxDuration = var_138_20

					if var_138_20 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_13
					end
				end

				arg_135_1.text_.text = var_138_17
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042034", "story_v_out_410042.awb") ~= 0 then
					local var_138_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042034", "story_v_out_410042.awb") / 1000

					if var_138_21 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_13
					end

					if var_138_16.prefab_name ~= "" and arg_135_1.actors_[var_138_16.prefab_name] ~= nil then
						local var_138_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_16.prefab_name].transform, "story_v_out_410042", "410042034", "story_v_out_410042.awb")

						arg_135_1:RecordAudio("410042034", var_138_22)
						arg_135_1:RecordAudio("410042034", var_138_22)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_410042", "410042034", "story_v_out_410042.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_410042", "410042034", "story_v_out_410042.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_23 = math.max(var_138_14, arg_135_1.talkMaxDuration)

			if var_138_13 <= arg_135_1.time_ and arg_135_1.time_ < var_138_13 + var_138_23 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_13) / var_138_23

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_13 + var_138_23 and arg_135_1.time_ < var_138_13 + var_138_23 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play410042035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410042035
		arg_139_1.duration_ = 5.8

		local var_139_0 = {
			zh = 3.333,
			ja = 5.8
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
				arg_139_0:Play410042036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10063"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos10063 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10063", 7)

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
				local var_142_6 = Vector3.New(0, -2000, -105)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10063, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_142_7 = arg_139_1.actors_["10060"].transform
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 then
				arg_139_1.var_.moveOldPos10060 = var_142_7.localPosition
				var_142_7.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10060", 7)

				local var_142_9 = var_142_7.childCount

				for iter_142_1 = 0, var_142_9 - 1 do
					local var_142_10 = var_142_7:GetChild(iter_142_1)

					if var_142_10.name == "" or not string.find(var_142_10.name, "split") then
						var_142_10.gameObject:SetActive(true)
					else
						var_142_10.gameObject:SetActive(false)
					end
				end
			end

			local var_142_11 = 0.001

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_8) / var_142_11
				local var_142_13 = Vector3.New(0, -2000, 0)

				var_142_7.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10060, var_142_13, var_142_12)
			end

			if arg_139_1.time_ >= var_142_8 + var_142_11 and arg_139_1.time_ < var_142_8 + var_142_11 + arg_142_0 then
				var_142_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_142_14 = arg_139_1.actors_["10059"].transform
			local var_142_15 = 0

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				arg_139_1.var_.moveOldPos10059 = var_142_14.localPosition
				var_142_14.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10059", 3)

				local var_142_16 = var_142_14.childCount

				for iter_142_2 = 0, var_142_16 - 1 do
					local var_142_17 = var_142_14:GetChild(iter_142_2)

					if var_142_17.name == "" or not string.find(var_142_17.name, "split") then
						var_142_17.gameObject:SetActive(true)
					else
						var_142_17.gameObject:SetActive(false)
					end
				end
			end

			local var_142_18 = 0.001

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_18 then
				local var_142_19 = (arg_139_1.time_ - var_142_15) / var_142_18
				local var_142_20 = Vector3.New(0, -530, 35)

				var_142_14.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10059, var_142_20, var_142_19)
			end

			if arg_139_1.time_ >= var_142_15 + var_142_18 and arg_139_1.time_ < var_142_15 + var_142_18 + arg_142_0 then
				var_142_14.localPosition = Vector3.New(0, -530, 35)
			end

			local var_142_21 = arg_139_1.actors_["10063"]
			local var_142_22 = 0

			if var_142_22 < arg_139_1.time_ and arg_139_1.time_ <= var_142_22 + arg_142_0 and arg_139_1.var_.actorSpriteComps10063 == nil then
				arg_139_1.var_.actorSpriteComps10063 = var_142_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_23 = 0.034

			if var_142_22 <= arg_139_1.time_ and arg_139_1.time_ < var_142_22 + var_142_23 then
				local var_142_24 = (arg_139_1.time_ - var_142_22) / var_142_23

				if arg_139_1.var_.actorSpriteComps10063 then
					for iter_142_3, iter_142_4 in pairs(arg_139_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_142_4 then
							local var_142_25 = Mathf.Lerp(iter_142_4.color.r, 0.5, var_142_24)

							iter_142_4.color = Color.New(var_142_25, var_142_25, var_142_25)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_22 + var_142_23 and arg_139_1.time_ < var_142_22 + var_142_23 + arg_142_0 and arg_139_1.var_.actorSpriteComps10063 then
				local var_142_26 = 0.5

				for iter_142_5, iter_142_6 in pairs(arg_139_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_142_6 then
						iter_142_6.color = Color.New(var_142_26, var_142_26, var_142_26)
					end
				end

				arg_139_1.var_.actorSpriteComps10063 = nil
			end

			local var_142_27 = arg_139_1.actors_["10060"]
			local var_142_28 = 0

			if var_142_28 < arg_139_1.time_ and arg_139_1.time_ <= var_142_28 + arg_142_0 and arg_139_1.var_.actorSpriteComps10060 == nil then
				arg_139_1.var_.actorSpriteComps10060 = var_142_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_29 = 0.034

			if var_142_28 <= arg_139_1.time_ and arg_139_1.time_ < var_142_28 + var_142_29 then
				local var_142_30 = (arg_139_1.time_ - var_142_28) / var_142_29

				if arg_139_1.var_.actorSpriteComps10060 then
					for iter_142_7, iter_142_8 in pairs(arg_139_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_142_8 then
							local var_142_31 = Mathf.Lerp(iter_142_8.color.r, 0.5, var_142_30)

							iter_142_8.color = Color.New(var_142_31, var_142_31, var_142_31)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_28 + var_142_29 and arg_139_1.time_ < var_142_28 + var_142_29 + arg_142_0 and arg_139_1.var_.actorSpriteComps10060 then
				local var_142_32 = 0.5

				for iter_142_9, iter_142_10 in pairs(arg_139_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_142_10 then
						iter_142_10.color = Color.New(var_142_32, var_142_32, var_142_32)
					end
				end

				arg_139_1.var_.actorSpriteComps10060 = nil
			end

			local var_142_33 = arg_139_1.actors_["10059"]
			local var_142_34 = 0

			if var_142_34 < arg_139_1.time_ and arg_139_1.time_ <= var_142_34 + arg_142_0 and arg_139_1.var_.actorSpriteComps10059 == nil then
				arg_139_1.var_.actorSpriteComps10059 = var_142_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_35 = 0.034

			if var_142_34 <= arg_139_1.time_ and arg_139_1.time_ < var_142_34 + var_142_35 then
				local var_142_36 = (arg_139_1.time_ - var_142_34) / var_142_35

				if arg_139_1.var_.actorSpriteComps10059 then
					for iter_142_11, iter_142_12 in pairs(arg_139_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_142_12 then
							local var_142_37 = Mathf.Lerp(iter_142_12.color.r, 1, var_142_36)

							iter_142_12.color = Color.New(var_142_37, var_142_37, var_142_37)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_34 + var_142_35 and arg_139_1.time_ < var_142_34 + var_142_35 + arg_142_0 and arg_139_1.var_.actorSpriteComps10059 then
				local var_142_38 = 1

				for iter_142_13, iter_142_14 in pairs(arg_139_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_142_14 then
						iter_142_14.color = Color.New(var_142_38, var_142_38, var_142_38)
					end
				end

				arg_139_1.var_.actorSpriteComps10059 = nil
			end

			local var_142_39 = 0
			local var_142_40 = 0.325

			if var_142_39 < arg_139_1.time_ and arg_139_1.time_ <= var_142_39 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_41 = arg_139_1:FormatText(StoryNameCfg[596].name)

				arg_139_1.leftNameTxt_.text = var_142_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_42 = arg_139_1:GetWordFromCfg(410042035)
				local var_142_43 = arg_139_1:FormatText(var_142_42.content)

				arg_139_1.text_.text = var_142_43

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_44 = 13
				local var_142_45 = utf8.len(var_142_43)
				local var_142_46 = var_142_44 <= 0 and var_142_40 or var_142_40 * (var_142_45 / var_142_44)

				if var_142_46 > 0 and var_142_40 < var_142_46 then
					arg_139_1.talkMaxDuration = var_142_46

					if var_142_46 + var_142_39 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_46 + var_142_39
					end
				end

				arg_139_1.text_.text = var_142_43
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042035", "story_v_out_410042.awb") ~= 0 then
					local var_142_47 = manager.audio:GetVoiceLength("story_v_out_410042", "410042035", "story_v_out_410042.awb") / 1000

					if var_142_47 + var_142_39 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_47 + var_142_39
					end

					if var_142_42.prefab_name ~= "" and arg_139_1.actors_[var_142_42.prefab_name] ~= nil then
						local var_142_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_42.prefab_name].transform, "story_v_out_410042", "410042035", "story_v_out_410042.awb")

						arg_139_1:RecordAudio("410042035", var_142_48)
						arg_139_1:RecordAudio("410042035", var_142_48)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_410042", "410042035", "story_v_out_410042.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_410042", "410042035", "story_v_out_410042.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_49 = math.max(var_142_40, arg_139_1.talkMaxDuration)

			if var_142_39 <= arg_139_1.time_ and arg_139_1.time_ < var_142_39 + var_142_49 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_39) / var_142_49

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_39 + var_142_49 and arg_139_1.time_ < var_142_39 + var_142_49 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410042036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410042036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play410042037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1060"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1060 = var_146_0.localPosition
				var_146_0.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("1060", 2)

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
				local var_146_6 = Vector3.New(-390, -435, -40)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1060, var_146_6, var_146_5)
			end

			if arg_143_1.time_ >= var_146_1 + var_146_4 and arg_143_1.time_ < var_146_1 + var_146_4 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_146_7 = arg_143_1.actors_["10063"].transform
			local var_146_8 = 0

			if var_146_8 < arg_143_1.time_ and arg_143_1.time_ <= var_146_8 + arg_146_0 then
				arg_143_1.var_.moveOldPos10063 = var_146_7.localPosition
				var_146_7.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("10063", 4)

				local var_146_9 = var_146_7.childCount

				for iter_146_1 = 0, var_146_9 - 1 do
					local var_146_10 = var_146_7:GetChild(iter_146_1)

					if var_146_10.name == "" or not string.find(var_146_10.name, "split") then
						var_146_10.gameObject:SetActive(true)
					else
						var_146_10.gameObject:SetActive(false)
					end
				end
			end

			local var_146_11 = 0.001

			if var_146_8 <= arg_143_1.time_ and arg_143_1.time_ < var_146_8 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_8) / var_146_11
				local var_146_13 = Vector3.New(390, -535, -105)

				var_146_7.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10063, var_146_13, var_146_12)
			end

			if arg_143_1.time_ >= var_146_8 + var_146_11 and arg_143_1.time_ < var_146_8 + var_146_11 + arg_146_0 then
				var_146_7.localPosition = Vector3.New(390, -535, -105)
			end

			local var_146_14 = arg_143_1.actors_["1060"]
			local var_146_15 = 0

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 and arg_143_1.var_.actorSpriteComps1060 == nil then
				arg_143_1.var_.actorSpriteComps1060 = var_146_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_16 = 0.034

			if var_146_15 <= arg_143_1.time_ and arg_143_1.time_ < var_146_15 + var_146_16 then
				local var_146_17 = (arg_143_1.time_ - var_146_15) / var_146_16

				if arg_143_1.var_.actorSpriteComps1060 then
					for iter_146_2, iter_146_3 in pairs(arg_143_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_146_3 then
							local var_146_18 = Mathf.Lerp(iter_146_3.color.r, 0.5, var_146_17)

							iter_146_3.color = Color.New(var_146_18, var_146_18, var_146_18)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_15 + var_146_16 and arg_143_1.time_ < var_146_15 + var_146_16 + arg_146_0 and arg_143_1.var_.actorSpriteComps1060 then
				local var_146_19 = 0.5

				for iter_146_4, iter_146_5 in pairs(arg_143_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_146_5 then
						iter_146_5.color = Color.New(var_146_19, var_146_19, var_146_19)
					end
				end

				arg_143_1.var_.actorSpriteComps1060 = nil
			end

			local var_146_20 = arg_143_1.actors_["10063"]
			local var_146_21 = 0

			if var_146_21 < arg_143_1.time_ and arg_143_1.time_ <= var_146_21 + arg_146_0 and arg_143_1.var_.actorSpriteComps10063 == nil then
				arg_143_1.var_.actorSpriteComps10063 = var_146_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_22 = 0.034

			if var_146_21 <= arg_143_1.time_ and arg_143_1.time_ < var_146_21 + var_146_22 then
				local var_146_23 = (arg_143_1.time_ - var_146_21) / var_146_22

				if arg_143_1.var_.actorSpriteComps10063 then
					for iter_146_6, iter_146_7 in pairs(arg_143_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_146_7 then
							local var_146_24 = Mathf.Lerp(iter_146_7.color.r, 0.5, var_146_23)

							iter_146_7.color = Color.New(var_146_24, var_146_24, var_146_24)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_21 + var_146_22 and arg_143_1.time_ < var_146_21 + var_146_22 + arg_146_0 and arg_143_1.var_.actorSpriteComps10063 then
				local var_146_25 = 0.5

				for iter_146_8, iter_146_9 in pairs(arg_143_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_146_9 then
						iter_146_9.color = Color.New(var_146_25, var_146_25, var_146_25)
					end
				end

				arg_143_1.var_.actorSpriteComps10063 = nil
			end

			local var_146_26 = arg_143_1.actors_["10059"].transform
			local var_146_27 = 0

			if var_146_27 < arg_143_1.time_ and arg_143_1.time_ <= var_146_27 + arg_146_0 then
				arg_143_1.var_.moveOldPos10059 = var_146_26.localPosition
				var_146_26.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("10059", 7)

				local var_146_28 = var_146_26.childCount

				for iter_146_10 = 0, var_146_28 - 1 do
					local var_146_29 = var_146_26:GetChild(iter_146_10)

					if var_146_29.name == "" or not string.find(var_146_29.name, "split") then
						var_146_29.gameObject:SetActive(true)
					else
						var_146_29.gameObject:SetActive(false)
					end
				end
			end

			local var_146_30 = 0.001

			if var_146_27 <= arg_143_1.time_ and arg_143_1.time_ < var_146_27 + var_146_30 then
				local var_146_31 = (arg_143_1.time_ - var_146_27) / var_146_30
				local var_146_32 = Vector3.New(0, -2000, 35)

				var_146_26.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10059, var_146_32, var_146_31)
			end

			if arg_143_1.time_ >= var_146_27 + var_146_30 and arg_143_1.time_ < var_146_27 + var_146_30 + arg_146_0 then
				var_146_26.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_146_33 = 0
			local var_146_34 = 0.975

			if var_146_33 < arg_143_1.time_ and arg_143_1.time_ <= var_146_33 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_35 = arg_143_1:GetWordFromCfg(410042036)
				local var_146_36 = arg_143_1:FormatText(var_146_35.content)

				arg_143_1.text_.text = var_146_36

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_37 = 39
				local var_146_38 = utf8.len(var_146_36)
				local var_146_39 = var_146_37 <= 0 and var_146_34 or var_146_34 * (var_146_38 / var_146_37)

				if var_146_39 > 0 and var_146_34 < var_146_39 then
					arg_143_1.talkMaxDuration = var_146_39

					if var_146_39 + var_146_33 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_39 + var_146_33
					end
				end

				arg_143_1.text_.text = var_146_36
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_40 = math.max(var_146_34, arg_143_1.talkMaxDuration)

			if var_146_33 <= arg_143_1.time_ and arg_143_1.time_ < var_146_33 + var_146_40 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_33) / var_146_40

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_33 + var_146_40 and arg_143_1.time_ < var_146_33 + var_146_40 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410042037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410042037
		arg_147_1.duration_ = 5.533

		local var_147_0 = {
			zh = 3.933,
			ja = 5.533
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
				arg_147_0:Play410042038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1056"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1056 = var_150_0.localPosition
				var_150_0.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("1056", 2)

				local var_150_2 = var_150_0.childCount

				for iter_150_0 = 0, var_150_2 - 1 do
					local var_150_3 = var_150_0:GetChild(iter_150_0)

					if var_150_3.name == "split_4" or not string.find(var_150_3.name, "split") then
						var_150_3.gameObject:SetActive(true)
					else
						var_150_3.gameObject:SetActive(false)
					end
				end
			end

			local var_150_4 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_4 then
				local var_150_5 = (arg_147_1.time_ - var_150_1) / var_150_4
				local var_150_6 = Vector3.New(-390, -350, -180)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1056, var_150_6, var_150_5)
			end

			if arg_147_1.time_ >= var_150_1 + var_150_4 and arg_147_1.time_ < var_150_1 + var_150_4 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_150_7 = arg_147_1.actors_["1060"].transform
			local var_150_8 = 0

			if var_150_8 < arg_147_1.time_ and arg_147_1.time_ <= var_150_8 + arg_150_0 then
				arg_147_1.var_.moveOldPos1060 = var_150_7.localPosition
				var_150_7.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("1060", 7)

				local var_150_9 = var_150_7.childCount

				for iter_150_1 = 0, var_150_9 - 1 do
					local var_150_10 = var_150_7:GetChild(iter_150_1)

					if var_150_10.name == "" or not string.find(var_150_10.name, "split") then
						var_150_10.gameObject:SetActive(true)
					else
						var_150_10.gameObject:SetActive(false)
					end
				end
			end

			local var_150_11 = 0.001

			if var_150_8 <= arg_147_1.time_ and arg_147_1.time_ < var_150_8 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_8) / var_150_11
				local var_150_13 = Vector3.New(0, -2000, -40)

				var_150_7.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1060, var_150_13, var_150_12)
			end

			if arg_147_1.time_ >= var_150_8 + var_150_11 and arg_147_1.time_ < var_150_8 + var_150_11 + arg_150_0 then
				var_150_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_150_14 = arg_147_1.actors_["1056"]
			local var_150_15 = 0

			if var_150_15 < arg_147_1.time_ and arg_147_1.time_ <= var_150_15 + arg_150_0 and arg_147_1.var_.actorSpriteComps1056 == nil then
				arg_147_1.var_.actorSpriteComps1056 = var_150_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_16 = 0.034

			if var_150_15 <= arg_147_1.time_ and arg_147_1.time_ < var_150_15 + var_150_16 then
				local var_150_17 = (arg_147_1.time_ - var_150_15) / var_150_16

				if arg_147_1.var_.actorSpriteComps1056 then
					for iter_150_2, iter_150_3 in pairs(arg_147_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_150_3 then
							local var_150_18 = Mathf.Lerp(iter_150_3.color.r, 1, var_150_17)

							iter_150_3.color = Color.New(var_150_18, var_150_18, var_150_18)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_15 + var_150_16 and arg_147_1.time_ < var_150_15 + var_150_16 + arg_150_0 and arg_147_1.var_.actorSpriteComps1056 then
				local var_150_19 = 1

				for iter_150_4, iter_150_5 in pairs(arg_147_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_150_5 then
						iter_150_5.color = Color.New(var_150_19, var_150_19, var_150_19)
					end
				end

				arg_147_1.var_.actorSpriteComps1056 = nil
			end

			local var_150_20 = arg_147_1.actors_["1060"]
			local var_150_21 = 0

			if var_150_21 < arg_147_1.time_ and arg_147_1.time_ <= var_150_21 + arg_150_0 and arg_147_1.var_.actorSpriteComps1060 == nil then
				arg_147_1.var_.actorSpriteComps1060 = var_150_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_22 = 0.034

			if var_150_21 <= arg_147_1.time_ and arg_147_1.time_ < var_150_21 + var_150_22 then
				local var_150_23 = (arg_147_1.time_ - var_150_21) / var_150_22

				if arg_147_1.var_.actorSpriteComps1060 then
					for iter_150_6, iter_150_7 in pairs(arg_147_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_150_7 then
							local var_150_24 = Mathf.Lerp(iter_150_7.color.r, 0.5, var_150_23)

							iter_150_7.color = Color.New(var_150_24, var_150_24, var_150_24)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_21 + var_150_22 and arg_147_1.time_ < var_150_21 + var_150_22 + arg_150_0 and arg_147_1.var_.actorSpriteComps1060 then
				local var_150_25 = 0.5

				for iter_150_8, iter_150_9 in pairs(arg_147_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_150_9 then
						iter_150_9.color = Color.New(var_150_25, var_150_25, var_150_25)
					end
				end

				arg_147_1.var_.actorSpriteComps1060 = nil
			end

			local var_150_26 = 0
			local var_150_27 = 0.575

			if var_150_26 < arg_147_1.time_ and arg_147_1.time_ <= var_150_26 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_28 = arg_147_1:FormatText(StoryNameCfg[605].name)

				arg_147_1.leftNameTxt_.text = var_150_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_29 = arg_147_1:GetWordFromCfg(410042037)
				local var_150_30 = arg_147_1:FormatText(var_150_29.content)

				arg_147_1.text_.text = var_150_30

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_31 = 23
				local var_150_32 = utf8.len(var_150_30)
				local var_150_33 = var_150_31 <= 0 and var_150_27 or var_150_27 * (var_150_32 / var_150_31)

				if var_150_33 > 0 and var_150_27 < var_150_33 then
					arg_147_1.talkMaxDuration = var_150_33

					if var_150_33 + var_150_26 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_33 + var_150_26
					end
				end

				arg_147_1.text_.text = var_150_30
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042037", "story_v_out_410042.awb") ~= 0 then
					local var_150_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042037", "story_v_out_410042.awb") / 1000

					if var_150_34 + var_150_26 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_34 + var_150_26
					end

					if var_150_29.prefab_name ~= "" and arg_147_1.actors_[var_150_29.prefab_name] ~= nil then
						local var_150_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_29.prefab_name].transform, "story_v_out_410042", "410042037", "story_v_out_410042.awb")

						arg_147_1:RecordAudio("410042037", var_150_35)
						arg_147_1:RecordAudio("410042037", var_150_35)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_410042", "410042037", "story_v_out_410042.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_410042", "410042037", "story_v_out_410042.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_36 = math.max(var_150_27, arg_147_1.talkMaxDuration)

			if var_150_26 <= arg_147_1.time_ and arg_147_1.time_ < var_150_26 + var_150_36 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_26) / var_150_36

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_26 + var_150_36 and arg_147_1.time_ < var_150_26 + var_150_36 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410042038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410042038
		arg_151_1.duration_ = 4.266

		local var_151_0 = {
			zh = 3,
			ja = 4.266
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
				arg_151_0:Play410042039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10063"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos10063 = var_154_0.localPosition
				var_154_0.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("10063", 4)

				local var_154_2 = var_154_0.childCount

				for iter_154_0 = 0, var_154_2 - 1 do
					local var_154_3 = var_154_0:GetChild(iter_154_0)

					if var_154_3.name == "split_4" or not string.find(var_154_3.name, "split") then
						var_154_3.gameObject:SetActive(true)
					else
						var_154_3.gameObject:SetActive(false)
					end
				end
			end

			local var_154_4 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_4 then
				local var_154_5 = (arg_151_1.time_ - var_154_1) / var_154_4
				local var_154_6 = Vector3.New(390, -535, -105)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10063, var_154_6, var_154_5)
			end

			if arg_151_1.time_ >= var_154_1 + var_154_4 and arg_151_1.time_ < var_154_1 + var_154_4 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(390, -535, -105)
			end

			local var_154_7 = arg_151_1.actors_["10063"]
			local var_154_8 = 0

			if var_154_8 < arg_151_1.time_ and arg_151_1.time_ <= var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps10063 == nil then
				arg_151_1.var_.actorSpriteComps10063 = var_154_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_9 = 0.034

			if var_154_8 <= arg_151_1.time_ and arg_151_1.time_ < var_154_8 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_8) / var_154_9

				if arg_151_1.var_.actorSpriteComps10063 then
					for iter_154_1, iter_154_2 in pairs(arg_151_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_154_2 then
							local var_154_11 = Mathf.Lerp(iter_154_2.color.r, 1, var_154_10)

							iter_154_2.color = Color.New(var_154_11, var_154_11, var_154_11)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_8 + var_154_9 and arg_151_1.time_ < var_154_8 + var_154_9 + arg_154_0 and arg_151_1.var_.actorSpriteComps10063 then
				local var_154_12 = 1

				for iter_154_3, iter_154_4 in pairs(arg_151_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_154_4 then
						iter_154_4.color = Color.New(var_154_12, var_154_12, var_154_12)
					end
				end

				arg_151_1.var_.actorSpriteComps10063 = nil
			end

			local var_154_13 = arg_151_1.actors_["1056"]
			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 and arg_151_1.var_.actorSpriteComps1056 == nil then
				arg_151_1.var_.actorSpriteComps1056 = var_154_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_15 = 0.034

			if var_154_14 <= arg_151_1.time_ and arg_151_1.time_ < var_154_14 + var_154_15 then
				local var_154_16 = (arg_151_1.time_ - var_154_14) / var_154_15

				if arg_151_1.var_.actorSpriteComps1056 then
					for iter_154_5, iter_154_6 in pairs(arg_151_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_154_6 then
							local var_154_17 = Mathf.Lerp(iter_154_6.color.r, 0.5, var_154_16)

							iter_154_6.color = Color.New(var_154_17, var_154_17, var_154_17)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_14 + var_154_15 and arg_151_1.time_ < var_154_14 + var_154_15 + arg_154_0 and arg_151_1.var_.actorSpriteComps1056 then
				local var_154_18 = 0.5

				for iter_154_7, iter_154_8 in pairs(arg_151_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_154_8 then
						iter_154_8.color = Color.New(var_154_18, var_154_18, var_154_18)
					end
				end

				arg_151_1.var_.actorSpriteComps1056 = nil
			end

			local var_154_19 = 0
			local var_154_20 = 0.225

			if var_154_19 < arg_151_1.time_ and arg_151_1.time_ <= var_154_19 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_21 = arg_151_1:FormatText(StoryNameCfg[591].name)

				arg_151_1.leftNameTxt_.text = var_154_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_22 = arg_151_1:GetWordFromCfg(410042038)
				local var_154_23 = arg_151_1:FormatText(var_154_22.content)

				arg_151_1.text_.text = var_154_23

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042038", "story_v_out_410042.awb") ~= 0 then
					local var_154_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042038", "story_v_out_410042.awb") / 1000

					if var_154_27 + var_154_19 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_27 + var_154_19
					end

					if var_154_22.prefab_name ~= "" and arg_151_1.actors_[var_154_22.prefab_name] ~= nil then
						local var_154_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_22.prefab_name].transform, "story_v_out_410042", "410042038", "story_v_out_410042.awb")

						arg_151_1:RecordAudio("410042038", var_154_28)
						arg_151_1:RecordAudio("410042038", var_154_28)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410042", "410042038", "story_v_out_410042.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410042", "410042038", "story_v_out_410042.awb")
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
	Play410042039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410042039
		arg_155_1.duration_ = 12.766

		local var_155_0 = {
			zh = 8.266,
			ja = 12.766
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
				arg_155_0:Play410042040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1056"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1056 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("1056", 2)

				local var_158_2 = var_158_0.childCount

				for iter_158_0 = 0, var_158_2 - 1 do
					local var_158_3 = var_158_0:GetChild(iter_158_0)

					if var_158_3.name == "split_4" or not string.find(var_158_3.name, "split") then
						var_158_3.gameObject:SetActive(true)
					else
						var_158_3.gameObject:SetActive(false)
					end
				end
			end

			local var_158_4 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_1) / var_158_4
				local var_158_6 = Vector3.New(-390, -350, -180)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1056, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_158_7 = arg_155_1.actors_["1056"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps1056 == nil then
				arg_155_1.var_.actorSpriteComps1056 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 0.034

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps1056 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_158_2 then
							local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

							iter_158_2.color = Color.New(var_158_11, var_158_11, var_158_11)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps1056 then
				local var_158_12 = 1

				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_158_4 then
						iter_158_4.color = Color.New(var_158_12, var_158_12, var_158_12)
					end
				end

				arg_155_1.var_.actorSpriteComps1056 = nil
			end

			local var_158_13 = arg_155_1.actors_["10063"]
			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 and arg_155_1.var_.actorSpriteComps10063 == nil then
				arg_155_1.var_.actorSpriteComps10063 = var_158_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_15 = 0.034

			if var_158_14 <= arg_155_1.time_ and arg_155_1.time_ < var_158_14 + var_158_15 then
				local var_158_16 = (arg_155_1.time_ - var_158_14) / var_158_15

				if arg_155_1.var_.actorSpriteComps10063 then
					for iter_158_5, iter_158_6 in pairs(arg_155_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_158_6 then
							local var_158_17 = Mathf.Lerp(iter_158_6.color.r, 0.5, var_158_16)

							iter_158_6.color = Color.New(var_158_17, var_158_17, var_158_17)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_14 + var_158_15 and arg_155_1.time_ < var_158_14 + var_158_15 + arg_158_0 and arg_155_1.var_.actorSpriteComps10063 then
				local var_158_18 = 0.5

				for iter_158_7, iter_158_8 in pairs(arg_155_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_158_8 then
						iter_158_8.color = Color.New(var_158_18, var_158_18, var_158_18)
					end
				end

				arg_155_1.var_.actorSpriteComps10063 = nil
			end

			local var_158_19 = 0
			local var_158_20 = 1.05

			if var_158_19 < arg_155_1.time_ and arg_155_1.time_ <= var_158_19 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_21 = arg_155_1:FormatText(StoryNameCfg[605].name)

				arg_155_1.leftNameTxt_.text = var_158_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_22 = arg_155_1:GetWordFromCfg(410042039)
				local var_158_23 = arg_155_1:FormatText(var_158_22.content)

				arg_155_1.text_.text = var_158_23

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_24 = 42
				local var_158_25 = utf8.len(var_158_23)
				local var_158_26 = var_158_24 <= 0 and var_158_20 or var_158_20 * (var_158_25 / var_158_24)

				if var_158_26 > 0 and var_158_20 < var_158_26 then
					arg_155_1.talkMaxDuration = var_158_26

					if var_158_26 + var_158_19 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_26 + var_158_19
					end
				end

				arg_155_1.text_.text = var_158_23
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042039", "story_v_out_410042.awb") ~= 0 then
					local var_158_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042039", "story_v_out_410042.awb") / 1000

					if var_158_27 + var_158_19 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_27 + var_158_19
					end

					if var_158_22.prefab_name ~= "" and arg_155_1.actors_[var_158_22.prefab_name] ~= nil then
						local var_158_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_22.prefab_name].transform, "story_v_out_410042", "410042039", "story_v_out_410042.awb")

						arg_155_1:RecordAudio("410042039", var_158_28)
						arg_155_1:RecordAudio("410042039", var_158_28)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410042", "410042039", "story_v_out_410042.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410042", "410042039", "story_v_out_410042.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_29 = math.max(var_158_20, arg_155_1.talkMaxDuration)

			if var_158_19 <= arg_155_1.time_ and arg_155_1.time_ < var_158_19 + var_158_29 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_19) / var_158_29

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_19 + var_158_29 and arg_155_1.time_ < var_158_19 + var_158_29 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410042040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410042040
		arg_159_1.duration_ = 5.066

		local var_159_0 = {
			zh = 4,
			ja = 5.066
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
				arg_159_0:Play410042041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1056"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1056 = var_162_0.localPosition
				var_162_0.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("1056", 2)

				local var_162_2 = var_162_0.childCount

				for iter_162_0 = 0, var_162_2 - 1 do
					local var_162_3 = var_162_0:GetChild(iter_162_0)

					if var_162_3.name == "split_4" or not string.find(var_162_3.name, "split") then
						var_162_3.gameObject:SetActive(true)
					else
						var_162_3.gameObject:SetActive(false)
					end
				end
			end

			local var_162_4 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_4 then
				local var_162_5 = (arg_159_1.time_ - var_162_1) / var_162_4
				local var_162_6 = Vector3.New(-390, -350, -180)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1056, var_162_6, var_162_5)
			end

			if arg_159_1.time_ >= var_162_1 + var_162_4 and arg_159_1.time_ < var_162_1 + var_162_4 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_162_7 = arg_159_1.actors_["1056"]
			local var_162_8 = 0

			if var_162_8 < arg_159_1.time_ and arg_159_1.time_ <= var_162_8 + arg_162_0 and arg_159_1.var_.actorSpriteComps1056 == nil then
				arg_159_1.var_.actorSpriteComps1056 = var_162_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_9 = 0.034

			if var_162_8 <= arg_159_1.time_ and arg_159_1.time_ < var_162_8 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_8) / var_162_9

				if arg_159_1.var_.actorSpriteComps1056 then
					for iter_162_1, iter_162_2 in pairs(arg_159_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_162_2 then
							local var_162_11 = Mathf.Lerp(iter_162_2.color.r, 1, var_162_10)

							iter_162_2.color = Color.New(var_162_11, var_162_11, var_162_11)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_8 + var_162_9 and arg_159_1.time_ < var_162_8 + var_162_9 + arg_162_0 and arg_159_1.var_.actorSpriteComps1056 then
				local var_162_12 = 1

				for iter_162_3, iter_162_4 in pairs(arg_159_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_162_4 then
						iter_162_4.color = Color.New(var_162_12, var_162_12, var_162_12)
					end
				end

				arg_159_1.var_.actorSpriteComps1056 = nil
			end

			local var_162_13 = 0
			local var_162_14 = 0.55

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_15 = arg_159_1:FormatText(StoryNameCfg[605].name)

				arg_159_1.leftNameTxt_.text = var_162_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_16 = arg_159_1:GetWordFromCfg(410042040)
				local var_162_17 = arg_159_1:FormatText(var_162_16.content)

				arg_159_1.text_.text = var_162_17

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_18 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042040", "story_v_out_410042.awb") ~= 0 then
					local var_162_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042040", "story_v_out_410042.awb") / 1000

					if var_162_21 + var_162_13 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_21 + var_162_13
					end

					if var_162_16.prefab_name ~= "" and arg_159_1.actors_[var_162_16.prefab_name] ~= nil then
						local var_162_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_16.prefab_name].transform, "story_v_out_410042", "410042040", "story_v_out_410042.awb")

						arg_159_1:RecordAudio("410042040", var_162_22)
						arg_159_1:RecordAudio("410042040", var_162_22)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410042", "410042040", "story_v_out_410042.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410042", "410042040", "story_v_out_410042.awb")
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
	Play410042041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410042041
		arg_163_1.duration_ = 10.9

		local var_163_0 = {
			zh = 10.9,
			ja = 8.1
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
				arg_163_0:Play410042042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10063"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos10063 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10063", 4)

				local var_166_2 = var_166_0.childCount

				for iter_166_0 = 0, var_166_2 - 1 do
					local var_166_3 = var_166_0:GetChild(iter_166_0)

					if var_166_3.name == "split_4" or not string.find(var_166_3.name, "split") then
						var_166_3.gameObject:SetActive(true)
					else
						var_166_3.gameObject:SetActive(false)
					end
				end
			end

			local var_166_4 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_4 then
				local var_166_5 = (arg_163_1.time_ - var_166_1) / var_166_4
				local var_166_6 = Vector3.New(390, -535, -105)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10063, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(390, -535, -105)
			end

			local var_166_7 = arg_163_1.actors_["10063"]
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 and arg_163_1.var_.actorSpriteComps10063 == nil then
				arg_163_1.var_.actorSpriteComps10063 = var_166_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_9 = 0.034

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_8) / var_166_9

				if arg_163_1.var_.actorSpriteComps10063 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_166_2 then
							local var_166_11 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_10)

							iter_166_2.color = Color.New(var_166_11, var_166_11, var_166_11)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_8 + var_166_9 and arg_163_1.time_ < var_166_8 + var_166_9 + arg_166_0 and arg_163_1.var_.actorSpriteComps10063 then
				local var_166_12 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_12, var_166_12, var_166_12)
					end
				end

				arg_163_1.var_.actorSpriteComps10063 = nil
			end

			local var_166_13 = arg_163_1.actors_["1056"]
			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 and arg_163_1.var_.actorSpriteComps1056 == nil then
				arg_163_1.var_.actorSpriteComps1056 = var_166_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_15 = 0.034

			if var_166_14 <= arg_163_1.time_ and arg_163_1.time_ < var_166_14 + var_166_15 then
				local var_166_16 = (arg_163_1.time_ - var_166_14) / var_166_15

				if arg_163_1.var_.actorSpriteComps1056 then
					for iter_166_5, iter_166_6 in pairs(arg_163_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_166_6 then
							local var_166_17 = Mathf.Lerp(iter_166_6.color.r, 0.5, var_166_16)

							iter_166_6.color = Color.New(var_166_17, var_166_17, var_166_17)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_14 + var_166_15 and arg_163_1.time_ < var_166_14 + var_166_15 + arg_166_0 and arg_163_1.var_.actorSpriteComps1056 then
				local var_166_18 = 0.5

				for iter_166_7, iter_166_8 in pairs(arg_163_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_166_8 then
						iter_166_8.color = Color.New(var_166_18, var_166_18, var_166_18)
					end
				end

				arg_163_1.var_.actorSpriteComps1056 = nil
			end

			local var_166_19 = 0
			local var_166_20 = 0.85

			if var_166_19 < arg_163_1.time_ and arg_163_1.time_ <= var_166_19 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_21 = arg_163_1:FormatText(StoryNameCfg[591].name)

				arg_163_1.leftNameTxt_.text = var_166_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_22 = arg_163_1:GetWordFromCfg(410042041)
				local var_166_23 = arg_163_1:FormatText(var_166_22.content)

				arg_163_1.text_.text = var_166_23

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_24 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042041", "story_v_out_410042.awb") ~= 0 then
					local var_166_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042041", "story_v_out_410042.awb") / 1000

					if var_166_27 + var_166_19 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_27 + var_166_19
					end

					if var_166_22.prefab_name ~= "" and arg_163_1.actors_[var_166_22.prefab_name] ~= nil then
						local var_166_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_22.prefab_name].transform, "story_v_out_410042", "410042041", "story_v_out_410042.awb")

						arg_163_1:RecordAudio("410042041", var_166_28)
						arg_163_1:RecordAudio("410042041", var_166_28)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_410042", "410042041", "story_v_out_410042.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_410042", "410042041", "story_v_out_410042.awb")
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
	Play410042042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410042042
		arg_167_1.duration_ = 6.3

		local var_167_0 = {
			zh = 4.866,
			ja = 6.3
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
				arg_167_0:Play410042043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1056"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1056 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("1056", 2)

				local var_170_2 = var_170_0.childCount

				for iter_170_0 = 0, var_170_2 - 1 do
					local var_170_3 = var_170_0:GetChild(iter_170_0)

					if var_170_3.name == "split_4" or not string.find(var_170_3.name, "split") then
						var_170_3.gameObject:SetActive(true)
					else
						var_170_3.gameObject:SetActive(false)
					end
				end
			end

			local var_170_4 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_1) / var_170_4
				local var_170_6 = Vector3.New(-390, -350, -180)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1056, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_170_7 = arg_167_1.actors_["1056"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps1056 == nil then
				arg_167_1.var_.actorSpriteComps1056 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.034

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps1056 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 1, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps1056 then
				local var_170_12 = 1

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps1056 = nil
			end

			local var_170_13 = arg_167_1.actors_["10063"]
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 and arg_167_1.var_.actorSpriteComps10063 == nil then
				arg_167_1.var_.actorSpriteComps10063 = var_170_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_15 = 0.034

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_15 then
				local var_170_16 = (arg_167_1.time_ - var_170_14) / var_170_15

				if arg_167_1.var_.actorSpriteComps10063 then
					for iter_170_5, iter_170_6 in pairs(arg_167_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_170_6 then
							local var_170_17 = Mathf.Lerp(iter_170_6.color.r, 0.5, var_170_16)

							iter_170_6.color = Color.New(var_170_17, var_170_17, var_170_17)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_14 + var_170_15 and arg_167_1.time_ < var_170_14 + var_170_15 + arg_170_0 and arg_167_1.var_.actorSpriteComps10063 then
				local var_170_18 = 0.5

				for iter_170_7, iter_170_8 in pairs(arg_167_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_170_8 then
						iter_170_8.color = Color.New(var_170_18, var_170_18, var_170_18)
					end
				end

				arg_167_1.var_.actorSpriteComps10063 = nil
			end

			local var_170_19 = 0
			local var_170_20 = 0.575

			if var_170_19 < arg_167_1.time_ and arg_167_1.time_ <= var_170_19 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_21 = arg_167_1:FormatText(StoryNameCfg[605].name)

				arg_167_1.leftNameTxt_.text = var_170_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_22 = arg_167_1:GetWordFromCfg(410042042)
				local var_170_23 = arg_167_1:FormatText(var_170_22.content)

				arg_167_1.text_.text = var_170_23

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_24 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042042", "story_v_out_410042.awb") ~= 0 then
					local var_170_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042042", "story_v_out_410042.awb") / 1000

					if var_170_27 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_27 + var_170_19
					end

					if var_170_22.prefab_name ~= "" and arg_167_1.actors_[var_170_22.prefab_name] ~= nil then
						local var_170_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_22.prefab_name].transform, "story_v_out_410042", "410042042", "story_v_out_410042.awb")

						arg_167_1:RecordAudio("410042042", var_170_28)
						arg_167_1:RecordAudio("410042042", var_170_28)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410042", "410042042", "story_v_out_410042.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410042", "410042042", "story_v_out_410042.awb")
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
	Play410042043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410042043
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play410042044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1056"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1056 = var_174_0.localPosition
				var_174_0.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("1056", 7)

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
				local var_174_6 = Vector3.New(0, -2000, -180)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1056, var_174_6, var_174_5)
			end

			if arg_171_1.time_ >= var_174_1 + var_174_4 and arg_171_1.time_ < var_174_1 + var_174_4 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_174_7 = arg_171_1.actors_["10063"].transform
			local var_174_8 = 0

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 then
				arg_171_1.var_.moveOldPos10063 = var_174_7.localPosition
				var_174_7.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("10063", 7)

				local var_174_9 = var_174_7.childCount

				for iter_174_1 = 0, var_174_9 - 1 do
					local var_174_10 = var_174_7:GetChild(iter_174_1)

					if var_174_10.name == "" or not string.find(var_174_10.name, "split") then
						var_174_10.gameObject:SetActive(true)
					else
						var_174_10.gameObject:SetActive(false)
					end
				end
			end

			local var_174_11 = 0.001

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_8) / var_174_11
				local var_174_13 = Vector3.New(0, -2000, -105)

				var_174_7.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10063, var_174_13, var_174_12)
			end

			if arg_171_1.time_ >= var_174_8 + var_174_11 and arg_171_1.time_ < var_174_8 + var_174_11 + arg_174_0 then
				var_174_7.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_174_14 = arg_171_1.actors_["10060"].transform
			local var_174_15 = 0

			if var_174_15 < arg_171_1.time_ and arg_171_1.time_ <= var_174_15 + arg_174_0 then
				arg_171_1.var_.moveOldPos10060 = var_174_14.localPosition
				var_174_14.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("10060", 3)

				local var_174_16 = var_174_14.childCount

				for iter_174_2 = 0, var_174_16 - 1 do
					local var_174_17 = var_174_14:GetChild(iter_174_2)

					if var_174_17.name == "" or not string.find(var_174_17.name, "split") then
						var_174_17.gameObject:SetActive(true)
					else
						var_174_17.gameObject:SetActive(false)
					end
				end
			end

			local var_174_18 = 0.001

			if var_174_15 <= arg_171_1.time_ and arg_171_1.time_ < var_174_15 + var_174_18 then
				local var_174_19 = (arg_171_1.time_ - var_174_15) / var_174_18
				local var_174_20 = Vector3.New(0, -400, 0)

				var_174_14.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10060, var_174_20, var_174_19)
			end

			if arg_171_1.time_ >= var_174_15 + var_174_18 and arg_171_1.time_ < var_174_15 + var_174_18 + arg_174_0 then
				var_174_14.localPosition = Vector3.New(0, -400, 0)
			end

			local var_174_21 = arg_171_1.actors_["1056"]
			local var_174_22 = 0

			if var_174_22 < arg_171_1.time_ and arg_171_1.time_ <= var_174_22 + arg_174_0 and arg_171_1.var_.actorSpriteComps1056 == nil then
				arg_171_1.var_.actorSpriteComps1056 = var_174_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_23 = 0.034

			if var_174_22 <= arg_171_1.time_ and arg_171_1.time_ < var_174_22 + var_174_23 then
				local var_174_24 = (arg_171_1.time_ - var_174_22) / var_174_23

				if arg_171_1.var_.actorSpriteComps1056 then
					for iter_174_3, iter_174_4 in pairs(arg_171_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_174_4 then
							local var_174_25 = Mathf.Lerp(iter_174_4.color.r, 0.5, var_174_24)

							iter_174_4.color = Color.New(var_174_25, var_174_25, var_174_25)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_22 + var_174_23 and arg_171_1.time_ < var_174_22 + var_174_23 + arg_174_0 and arg_171_1.var_.actorSpriteComps1056 then
				local var_174_26 = 0.5

				for iter_174_5, iter_174_6 in pairs(arg_171_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_174_6 then
						iter_174_6.color = Color.New(var_174_26, var_174_26, var_174_26)
					end
				end

				arg_171_1.var_.actorSpriteComps1056 = nil
			end

			local var_174_27 = arg_171_1.actors_["10063"]
			local var_174_28 = 0

			if var_174_28 < arg_171_1.time_ and arg_171_1.time_ <= var_174_28 + arg_174_0 and arg_171_1.var_.actorSpriteComps10063 == nil then
				arg_171_1.var_.actorSpriteComps10063 = var_174_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_29 = 0.034

			if var_174_28 <= arg_171_1.time_ and arg_171_1.time_ < var_174_28 + var_174_29 then
				local var_174_30 = (arg_171_1.time_ - var_174_28) / var_174_29

				if arg_171_1.var_.actorSpriteComps10063 then
					for iter_174_7, iter_174_8 in pairs(arg_171_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_174_8 then
							local var_174_31 = Mathf.Lerp(iter_174_8.color.r, 0.5, var_174_30)

							iter_174_8.color = Color.New(var_174_31, var_174_31, var_174_31)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_28 + var_174_29 and arg_171_1.time_ < var_174_28 + var_174_29 + arg_174_0 and arg_171_1.var_.actorSpriteComps10063 then
				local var_174_32 = 0.5

				for iter_174_9, iter_174_10 in pairs(arg_171_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_174_10 then
						iter_174_10.color = Color.New(var_174_32, var_174_32, var_174_32)
					end
				end

				arg_171_1.var_.actorSpriteComps10063 = nil
			end

			local var_174_33 = arg_171_1.actors_["10060"]
			local var_174_34 = 0

			if var_174_34 < arg_171_1.time_ and arg_171_1.time_ <= var_174_34 + arg_174_0 and arg_171_1.var_.actorSpriteComps10060 == nil then
				arg_171_1.var_.actorSpriteComps10060 = var_174_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_35 = 0.034

			if var_174_34 <= arg_171_1.time_ and arg_171_1.time_ < var_174_34 + var_174_35 then
				local var_174_36 = (arg_171_1.time_ - var_174_34) / var_174_35

				if arg_171_1.var_.actorSpriteComps10060 then
					for iter_174_11, iter_174_12 in pairs(arg_171_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_174_12 then
							local var_174_37 = Mathf.Lerp(iter_174_12.color.r, 0.5, var_174_36)

							iter_174_12.color = Color.New(var_174_37, var_174_37, var_174_37)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_34 + var_174_35 and arg_171_1.time_ < var_174_34 + var_174_35 + arg_174_0 and arg_171_1.var_.actorSpriteComps10060 then
				local var_174_38 = 0.5

				for iter_174_13, iter_174_14 in pairs(arg_171_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_174_14 then
						iter_174_14.color = Color.New(var_174_38, var_174_38, var_174_38)
					end
				end

				arg_171_1.var_.actorSpriteComps10060 = nil
			end

			local var_174_39 = 0
			local var_174_40 = 1.05

			if var_174_39 < arg_171_1.time_ and arg_171_1.time_ <= var_174_39 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_41 = arg_171_1:GetWordFromCfg(410042043)
				local var_174_42 = arg_171_1:FormatText(var_174_41.content)

				arg_171_1.text_.text = var_174_42

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_43 = 42
				local var_174_44 = utf8.len(var_174_42)
				local var_174_45 = var_174_43 <= 0 and var_174_40 or var_174_40 * (var_174_44 / var_174_43)

				if var_174_45 > 0 and var_174_40 < var_174_45 then
					arg_171_1.talkMaxDuration = var_174_45

					if var_174_45 + var_174_39 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_45 + var_174_39
					end
				end

				arg_171_1.text_.text = var_174_42
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_46 = math.max(var_174_40, arg_171_1.talkMaxDuration)

			if var_174_39 <= arg_171_1.time_ and arg_171_1.time_ < var_174_39 + var_174_46 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_39) / var_174_46

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_39 + var_174_46 and arg_171_1.time_ < var_174_39 + var_174_46 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play410042044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410042044
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play410042045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 1.15

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_2 = arg_175_1:GetWordFromCfg(410042044)
				local var_178_3 = arg_175_1:FormatText(var_178_2.content)

				arg_175_1.text_.text = var_178_3

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_4 = 46
				local var_178_5 = utf8.len(var_178_3)
				local var_178_6 = var_178_4 <= 0 and var_178_1 or var_178_1 * (var_178_5 / var_178_4)

				if var_178_6 > 0 and var_178_1 < var_178_6 then
					arg_175_1.talkMaxDuration = var_178_6

					if var_178_6 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_6 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_3
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_7 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_7 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_7

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_7 and arg_175_1.time_ < var_178_0 + var_178_7 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play410042045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410042045
		arg_179_1.duration_ = 3.533

		local var_179_0 = {
			zh = 1.033,
			ja = 3.533
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
				arg_179_0:Play410042046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1056"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1056 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("1056", 2)

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

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1056, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_182_7 = arg_179_1.actors_["10060"].transform
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 then
				arg_179_1.var_.moveOldPos10060 = var_182_7.localPosition
				var_182_7.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10060", 4)

				local var_182_9 = var_182_7.childCount

				for iter_182_1 = 0, var_182_9 - 1 do
					local var_182_10 = var_182_7:GetChild(iter_182_1)

					if var_182_10.name == "split_4" or not string.find(var_182_10.name, "split") then
						var_182_10.gameObject:SetActive(true)
					else
						var_182_10.gameObject:SetActive(false)
					end
				end
			end

			local var_182_11 = 0.001

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_8) / var_182_11
				local var_182_13 = Vector3.New(390, -400, 0)

				var_182_7.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10060, var_182_13, var_182_12)
			end

			if arg_179_1.time_ >= var_182_8 + var_182_11 and arg_179_1.time_ < var_182_8 + var_182_11 + arg_182_0 then
				var_182_7.localPosition = Vector3.New(390, -400, 0)
			end

			local var_182_14 = arg_179_1.actors_["1056"]
			local var_182_15 = 0

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 and arg_179_1.var_.actorSpriteComps1056 == nil then
				arg_179_1.var_.actorSpriteComps1056 = var_182_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_16 = 0.034

			if var_182_15 <= arg_179_1.time_ and arg_179_1.time_ < var_182_15 + var_182_16 then
				local var_182_17 = (arg_179_1.time_ - var_182_15) / var_182_16

				if arg_179_1.var_.actorSpriteComps1056 then
					for iter_182_2, iter_182_3 in pairs(arg_179_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_182_3 then
							local var_182_18 = Mathf.Lerp(iter_182_3.color.r, 0.5, var_182_17)

							iter_182_3.color = Color.New(var_182_18, var_182_18, var_182_18)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_15 + var_182_16 and arg_179_1.time_ < var_182_15 + var_182_16 + arg_182_0 and arg_179_1.var_.actorSpriteComps1056 then
				local var_182_19 = 0.5

				for iter_182_4, iter_182_5 in pairs(arg_179_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_182_5 then
						iter_182_5.color = Color.New(var_182_19, var_182_19, var_182_19)
					end
				end

				arg_179_1.var_.actorSpriteComps1056 = nil
			end

			local var_182_20 = arg_179_1.actors_["10060"]
			local var_182_21 = 0

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 and arg_179_1.var_.actorSpriteComps10060 == nil then
				arg_179_1.var_.actorSpriteComps10060 = var_182_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_22 = 0.034

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_22 then
				local var_182_23 = (arg_179_1.time_ - var_182_21) / var_182_22

				if arg_179_1.var_.actorSpriteComps10060 then
					for iter_182_6, iter_182_7 in pairs(arg_179_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_182_7 then
							local var_182_24 = Mathf.Lerp(iter_182_7.color.r, 1, var_182_23)

							iter_182_7.color = Color.New(var_182_24, var_182_24, var_182_24)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_21 + var_182_22 and arg_179_1.time_ < var_182_21 + var_182_22 + arg_182_0 and arg_179_1.var_.actorSpriteComps10060 then
				local var_182_25 = 1

				for iter_182_8, iter_182_9 in pairs(arg_179_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_182_9 then
						iter_182_9.color = Color.New(var_182_25, var_182_25, var_182_25)
					end
				end

				arg_179_1.var_.actorSpriteComps10060 = nil
			end

			local var_182_26 = 0
			local var_182_27 = 0.1

			if var_182_26 < arg_179_1.time_ and arg_179_1.time_ <= var_182_26 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_28 = arg_179_1:FormatText(StoryNameCfg[597].name)

				arg_179_1.leftNameTxt_.text = var_182_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_29 = arg_179_1:GetWordFromCfg(410042045)
				local var_182_30 = arg_179_1:FormatText(var_182_29.content)

				arg_179_1.text_.text = var_182_30

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_31 = 4
				local var_182_32 = utf8.len(var_182_30)
				local var_182_33 = var_182_31 <= 0 and var_182_27 or var_182_27 * (var_182_32 / var_182_31)

				if var_182_33 > 0 and var_182_27 < var_182_33 then
					arg_179_1.talkMaxDuration = var_182_33

					if var_182_33 + var_182_26 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_33 + var_182_26
					end
				end

				arg_179_1.text_.text = var_182_30
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042045", "story_v_out_410042.awb") ~= 0 then
					local var_182_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042045", "story_v_out_410042.awb") / 1000

					if var_182_34 + var_182_26 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_34 + var_182_26
					end

					if var_182_29.prefab_name ~= "" and arg_179_1.actors_[var_182_29.prefab_name] ~= nil then
						local var_182_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_29.prefab_name].transform, "story_v_out_410042", "410042045", "story_v_out_410042.awb")

						arg_179_1:RecordAudio("410042045", var_182_35)
						arg_179_1:RecordAudio("410042045", var_182_35)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410042", "410042045", "story_v_out_410042.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410042", "410042045", "story_v_out_410042.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_36 = math.max(var_182_27, arg_179_1.talkMaxDuration)

			if var_182_26 <= arg_179_1.time_ and arg_179_1.time_ < var_182_26 + var_182_36 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_26) / var_182_36

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_26 + var_182_36 and arg_179_1.time_ < var_182_26 + var_182_36 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play410042046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410042046
		arg_183_1.duration_ = 5.366

		local var_183_0 = {
			zh = 5.366,
			ja = 5.1
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
				arg_183_0:Play410042047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1056"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos1056 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("1056", 2)

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

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1056, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_186_7 = arg_183_1.actors_["1056"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps1056 == nil then
				arg_183_1.var_.actorSpriteComps1056 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps1056 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 1, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps1056 then
				local var_186_12 = 1

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps1056 = nil
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
							local var_186_17 = Mathf.Lerp(iter_186_6.color.r, 0.5, var_186_16)

							iter_186_6.color = Color.New(var_186_17, var_186_17, var_186_17)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_15 and arg_183_1.time_ < var_186_14 + var_186_15 + arg_186_0 and arg_183_1.var_.actorSpriteComps10060 then
				local var_186_18 = 0.5

				for iter_186_7, iter_186_8 in pairs(arg_183_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_186_8 then
						iter_186_8.color = Color.New(var_186_18, var_186_18, var_186_18)
					end
				end

				arg_183_1.var_.actorSpriteComps10060 = nil
			end

			local var_186_19 = 0
			local var_186_20 = 0.7

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[605].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(410042046)
				local var_186_23 = arg_183_1:FormatText(var_186_22.content)

				arg_183_1.text_.text = var_186_23

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_24 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042046", "story_v_out_410042.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042046", "story_v_out_410042.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_410042", "410042046", "story_v_out_410042.awb")

						arg_183_1:RecordAudio("410042046", var_186_28)
						arg_183_1:RecordAudio("410042046", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410042", "410042046", "story_v_out_410042.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410042", "410042046", "story_v_out_410042.awb")
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
	Play410042047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410042047
		arg_187_1.duration_ = 6.533

		local var_187_0 = {
			zh = 4.466,
			ja = 6.533
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
				arg_187_0:Play410042048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10060"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10060 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10060", 4)

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
				local var_190_6 = Vector3.New(390, -400, 0)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10060, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_190_7 = arg_187_1.actors_["10060"]
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps10060 == nil then
				arg_187_1.var_.actorSpriteComps10060 = var_190_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_9 = 0.034

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_8) / var_190_9

				if arg_187_1.var_.actorSpriteComps10060 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_190_2 then
							local var_190_11 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_10)

							iter_190_2.color = Color.New(var_190_11, var_190_11, var_190_11)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_8 + var_190_9 and arg_187_1.time_ < var_190_8 + var_190_9 + arg_190_0 and arg_187_1.var_.actorSpriteComps10060 then
				local var_190_12 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_12, var_190_12, var_190_12)
					end
				end

				arg_187_1.var_.actorSpriteComps10060 = nil
			end

			local var_190_13 = arg_187_1.actors_["1056"]
			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 and arg_187_1.var_.actorSpriteComps1056 == nil then
				arg_187_1.var_.actorSpriteComps1056 = var_190_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_15 = 0.034

			if var_190_14 <= arg_187_1.time_ and arg_187_1.time_ < var_190_14 + var_190_15 then
				local var_190_16 = (arg_187_1.time_ - var_190_14) / var_190_15

				if arg_187_1.var_.actorSpriteComps1056 then
					for iter_190_5, iter_190_6 in pairs(arg_187_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_190_6 then
							local var_190_17 = Mathf.Lerp(iter_190_6.color.r, 0.5, var_190_16)

							iter_190_6.color = Color.New(var_190_17, var_190_17, var_190_17)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_14 + var_190_15 and arg_187_1.time_ < var_190_14 + var_190_15 + arg_190_0 and arg_187_1.var_.actorSpriteComps1056 then
				local var_190_18 = 0.5

				for iter_190_7, iter_190_8 in pairs(arg_187_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_190_8 then
						iter_190_8.color = Color.New(var_190_18, var_190_18, var_190_18)
					end
				end

				arg_187_1.var_.actorSpriteComps1056 = nil
			end

			local var_190_19 = 0
			local var_190_20 = 0.4

			if var_190_19 < arg_187_1.time_ and arg_187_1.time_ <= var_190_19 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_21 = arg_187_1:FormatText(StoryNameCfg[597].name)

				arg_187_1.leftNameTxt_.text = var_190_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_22 = arg_187_1:GetWordFromCfg(410042047)
				local var_190_23 = arg_187_1:FormatText(var_190_22.content)

				arg_187_1.text_.text = var_190_23

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_24 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042047", "story_v_out_410042.awb") ~= 0 then
					local var_190_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042047", "story_v_out_410042.awb") / 1000

					if var_190_27 + var_190_19 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_27 + var_190_19
					end

					if var_190_22.prefab_name ~= "" and arg_187_1.actors_[var_190_22.prefab_name] ~= nil then
						local var_190_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_22.prefab_name].transform, "story_v_out_410042", "410042047", "story_v_out_410042.awb")

						arg_187_1:RecordAudio("410042047", var_190_28)
						arg_187_1:RecordAudio("410042047", var_190_28)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410042", "410042047", "story_v_out_410042.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410042", "410042047", "story_v_out_410042.awb")
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
	Play410042048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410042048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play410042049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10063"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos10063 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10063", 4)

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
				local var_194_6 = Vector3.New(390, -535, -105)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10063, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(390, -535, -105)
			end

			local var_194_7 = arg_191_1.actors_["10060"].transform
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 then
				arg_191_1.var_.moveOldPos10060 = var_194_7.localPosition
				var_194_7.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10060", 7)

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
				local var_194_13 = Vector3.New(0, -2000, 0)

				var_194_7.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10060, var_194_13, var_194_12)
			end

			if arg_191_1.time_ >= var_194_8 + var_194_11 and arg_191_1.time_ < var_194_8 + var_194_11 + arg_194_0 then
				var_194_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_194_14 = arg_191_1.actors_["10063"]
			local var_194_15 = 0

			if var_194_15 < arg_191_1.time_ and arg_191_1.time_ <= var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps10063 == nil then
				arg_191_1.var_.actorSpriteComps10063 = var_194_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_16 = 0.034

			if var_194_15 <= arg_191_1.time_ and arg_191_1.time_ < var_194_15 + var_194_16 then
				local var_194_17 = (arg_191_1.time_ - var_194_15) / var_194_16

				if arg_191_1.var_.actorSpriteComps10063 then
					for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_194_3 then
							local var_194_18 = Mathf.Lerp(iter_194_3.color.r, 0.5, var_194_17)

							iter_194_3.color = Color.New(var_194_18, var_194_18, var_194_18)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_15 + var_194_16 and arg_191_1.time_ < var_194_15 + var_194_16 + arg_194_0 and arg_191_1.var_.actorSpriteComps10063 then
				local var_194_19 = 0.5

				for iter_194_4, iter_194_5 in pairs(arg_191_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_194_5 then
						iter_194_5.color = Color.New(var_194_19, var_194_19, var_194_19)
					end
				end

				arg_191_1.var_.actorSpriteComps10063 = nil
			end

			local var_194_20 = arg_191_1.actors_["10060"]
			local var_194_21 = 0

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 and arg_191_1.var_.actorSpriteComps10060 == nil then
				arg_191_1.var_.actorSpriteComps10060 = var_194_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_22 = 0.034

			if var_194_21 <= arg_191_1.time_ and arg_191_1.time_ < var_194_21 + var_194_22 then
				local var_194_23 = (arg_191_1.time_ - var_194_21) / var_194_22

				if arg_191_1.var_.actorSpriteComps10060 then
					for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_194_7 then
							local var_194_24 = Mathf.Lerp(iter_194_7.color.r, 0.5, var_194_23)

							iter_194_7.color = Color.New(var_194_24, var_194_24, var_194_24)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_21 + var_194_22 and arg_191_1.time_ < var_194_21 + var_194_22 + arg_194_0 and arg_191_1.var_.actorSpriteComps10060 then
				local var_194_25 = 0.5

				for iter_194_8, iter_194_9 in pairs(arg_191_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_194_9 then
						iter_194_9.color = Color.New(var_194_25, var_194_25, var_194_25)
					end
				end

				arg_191_1.var_.actorSpriteComps10060 = nil
			end

			local var_194_26 = 0
			local var_194_27 = 1.075

			if var_194_26 < arg_191_1.time_ and arg_191_1.time_ <= var_194_26 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_28 = arg_191_1:GetWordFromCfg(410042048)
				local var_194_29 = arg_191_1:FormatText(var_194_28.content)

				arg_191_1.text_.text = var_194_29

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_30 = 43
				local var_194_31 = utf8.len(var_194_29)
				local var_194_32 = var_194_30 <= 0 and var_194_27 or var_194_27 * (var_194_31 / var_194_30)

				if var_194_32 > 0 and var_194_27 < var_194_32 then
					arg_191_1.talkMaxDuration = var_194_32

					if var_194_32 + var_194_26 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_32 + var_194_26
					end
				end

				arg_191_1.text_.text = var_194_29
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_33 = math.max(var_194_27, arg_191_1.talkMaxDuration)

			if var_194_26 <= arg_191_1.time_ and arg_191_1.time_ < var_194_26 + var_194_33 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_26) / var_194_33

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_26 + var_194_33 and arg_191_1.time_ < var_194_26 + var_194_33 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410042049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410042049
		arg_195_1.duration_ = 8.933

		local var_195_0 = {
			zh = 8.4,
			ja = 8.933
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
				arg_195_0:Play410042050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10063"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10063 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10063", 4)

				local var_198_2 = var_198_0.childCount

				for iter_198_0 = 0, var_198_2 - 1 do
					local var_198_3 = var_198_0:GetChild(iter_198_0)

					if var_198_3.name == "split_4" or not string.find(var_198_3.name, "split") then
						var_198_3.gameObject:SetActive(true)
					else
						var_198_3.gameObject:SetActive(false)
					end
				end
			end

			local var_198_4 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_4 then
				local var_198_5 = (arg_195_1.time_ - var_198_1) / var_198_4
				local var_198_6 = Vector3.New(390, -535, -105)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10063, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(390, -535, -105)
			end

			local var_198_7 = arg_195_1.actors_["10063"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps10063 == nil then
				arg_195_1.var_.actorSpriteComps10063 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.034

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps10063 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 1, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps10063 then
				local var_198_12 = 1

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps10063 = nil
			end

			local var_198_13 = 0
			local var_198_14 = 0.8

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_15 = arg_195_1:FormatText(StoryNameCfg[591].name)

				arg_195_1.leftNameTxt_.text = var_198_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_16 = arg_195_1:GetWordFromCfg(410042049)
				local var_198_17 = arg_195_1:FormatText(var_198_16.content)

				arg_195_1.text_.text = var_198_17

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_18 = 32
				local var_198_19 = utf8.len(var_198_17)
				local var_198_20 = var_198_18 <= 0 and var_198_14 or var_198_14 * (var_198_19 / var_198_18)

				if var_198_20 > 0 and var_198_14 < var_198_20 then
					arg_195_1.talkMaxDuration = var_198_20

					if var_198_20 + var_198_13 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_20 + var_198_13
					end
				end

				arg_195_1.text_.text = var_198_17
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042049", "story_v_out_410042.awb") ~= 0 then
					local var_198_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042049", "story_v_out_410042.awb") / 1000

					if var_198_21 + var_198_13 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_21 + var_198_13
					end

					if var_198_16.prefab_name ~= "" and arg_195_1.actors_[var_198_16.prefab_name] ~= nil then
						local var_198_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_16.prefab_name].transform, "story_v_out_410042", "410042049", "story_v_out_410042.awb")

						arg_195_1:RecordAudio("410042049", var_198_22)
						arg_195_1:RecordAudio("410042049", var_198_22)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410042", "410042049", "story_v_out_410042.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410042", "410042049", "story_v_out_410042.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_23 = math.max(var_198_14, arg_195_1.talkMaxDuration)

			if var_198_13 <= arg_195_1.time_ and arg_195_1.time_ < var_198_13 + var_198_23 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_13) / var_198_23

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_13 + var_198_23 and arg_195_1.time_ < var_198_13 + var_198_23 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play410042050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410042050
		arg_199_1.duration_ = 2.566

		local var_199_0 = {
			zh = 2,
			ja = 2.566
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
				arg_199_0:Play410042051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1056"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1056 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1056", 2)

				local var_202_2 = var_202_0.childCount

				for iter_202_0 = 0, var_202_2 - 1 do
					local var_202_3 = var_202_0:GetChild(iter_202_0)

					if var_202_3.name == "split_4" or not string.find(var_202_3.name, "split") then
						var_202_3.gameObject:SetActive(true)
					else
						var_202_3.gameObject:SetActive(false)
					end
				end
			end

			local var_202_4 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_1) / var_202_4
				local var_202_6 = Vector3.New(-390, -350, -180)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1056, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_202_7 = arg_199_1.actors_["1056"]
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps1056 == nil then
				arg_199_1.var_.actorSpriteComps1056 = var_202_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_9 = 0.034

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_8) / var_202_9

				if arg_199_1.var_.actorSpriteComps1056 then
					for iter_202_1, iter_202_2 in pairs(arg_199_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_202_2 then
							local var_202_11 = Mathf.Lerp(iter_202_2.color.r, 1, var_202_10)

							iter_202_2.color = Color.New(var_202_11, var_202_11, var_202_11)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_8 + var_202_9 and arg_199_1.time_ < var_202_8 + var_202_9 + arg_202_0 and arg_199_1.var_.actorSpriteComps1056 then
				local var_202_12 = 1

				for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_202_4 then
						iter_202_4.color = Color.New(var_202_12, var_202_12, var_202_12)
					end
				end

				arg_199_1.var_.actorSpriteComps1056 = nil
			end

			local var_202_13 = arg_199_1.actors_["10063"]
			local var_202_14 = 0

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 and arg_199_1.var_.actorSpriteComps10063 == nil then
				arg_199_1.var_.actorSpriteComps10063 = var_202_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_15 = 0.034

			if var_202_14 <= arg_199_1.time_ and arg_199_1.time_ < var_202_14 + var_202_15 then
				local var_202_16 = (arg_199_1.time_ - var_202_14) / var_202_15

				if arg_199_1.var_.actorSpriteComps10063 then
					for iter_202_5, iter_202_6 in pairs(arg_199_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_202_6 then
							local var_202_17 = Mathf.Lerp(iter_202_6.color.r, 0.5, var_202_16)

							iter_202_6.color = Color.New(var_202_17, var_202_17, var_202_17)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_14 + var_202_15 and arg_199_1.time_ < var_202_14 + var_202_15 + arg_202_0 and arg_199_1.var_.actorSpriteComps10063 then
				local var_202_18 = 0.5

				for iter_202_7, iter_202_8 in pairs(arg_199_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_202_8 then
						iter_202_8.color = Color.New(var_202_18, var_202_18, var_202_18)
					end
				end

				arg_199_1.var_.actorSpriteComps10063 = nil
			end

			local var_202_19 = 0
			local var_202_20 = 0.15

			if var_202_19 < arg_199_1.time_ and arg_199_1.time_ <= var_202_19 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_21 = arg_199_1:FormatText(StoryNameCfg[605].name)

				arg_199_1.leftNameTxt_.text = var_202_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_22 = arg_199_1:GetWordFromCfg(410042050)
				local var_202_23 = arg_199_1:FormatText(var_202_22.content)

				arg_199_1.text_.text = var_202_23

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_24 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042050", "story_v_out_410042.awb") ~= 0 then
					local var_202_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042050", "story_v_out_410042.awb") / 1000

					if var_202_27 + var_202_19 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_27 + var_202_19
					end

					if var_202_22.prefab_name ~= "" and arg_199_1.actors_[var_202_22.prefab_name] ~= nil then
						local var_202_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_22.prefab_name].transform, "story_v_out_410042", "410042050", "story_v_out_410042.awb")

						arg_199_1:RecordAudio("410042050", var_202_28)
						arg_199_1:RecordAudio("410042050", var_202_28)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410042", "410042050", "story_v_out_410042.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410042", "410042050", "story_v_out_410042.awb")
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
	Play410042051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410042051
		arg_203_1.duration_ = 7.033

		local var_203_0 = {
			zh = 4.966,
			ja = 7.033
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
				arg_203_0:Play410042052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1060"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1060 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("1060", 2)

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
				local var_206_6 = Vector3.New(-390, -435, -40)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1060, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_206_7 = arg_203_1.actors_["1056"].transform
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 then
				arg_203_1.var_.moveOldPos1056 = var_206_7.localPosition
				var_206_7.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("1056", 7)

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
				local var_206_13 = Vector3.New(0, -2000, -180)

				var_206_7.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1056, var_206_13, var_206_12)
			end

			if arg_203_1.time_ >= var_206_8 + var_206_11 and arg_203_1.time_ < var_206_8 + var_206_11 + arg_206_0 then
				var_206_7.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_206_14 = arg_203_1.actors_["1060"]
			local var_206_15 = 0

			if var_206_15 < arg_203_1.time_ and arg_203_1.time_ <= var_206_15 + arg_206_0 and arg_203_1.var_.actorSpriteComps1060 == nil then
				arg_203_1.var_.actorSpriteComps1060 = var_206_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_16 = 0.034

			if var_206_15 <= arg_203_1.time_ and arg_203_1.time_ < var_206_15 + var_206_16 then
				local var_206_17 = (arg_203_1.time_ - var_206_15) / var_206_16

				if arg_203_1.var_.actorSpriteComps1060 then
					for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_206_3 then
							local var_206_18 = Mathf.Lerp(iter_206_3.color.r, 1, var_206_17)

							iter_206_3.color = Color.New(var_206_18, var_206_18, var_206_18)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_15 + var_206_16 and arg_203_1.time_ < var_206_15 + var_206_16 + arg_206_0 and arg_203_1.var_.actorSpriteComps1060 then
				local var_206_19 = 1

				for iter_206_4, iter_206_5 in pairs(arg_203_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_206_5 then
						iter_206_5.color = Color.New(var_206_19, var_206_19, var_206_19)
					end
				end

				arg_203_1.var_.actorSpriteComps1060 = nil
			end

			local var_206_20 = arg_203_1.actors_["1056"]
			local var_206_21 = 0

			if var_206_21 < arg_203_1.time_ and arg_203_1.time_ <= var_206_21 + arg_206_0 and arg_203_1.var_.actorSpriteComps1056 == nil then
				arg_203_1.var_.actorSpriteComps1056 = var_206_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_22 = 0.034

			if var_206_21 <= arg_203_1.time_ and arg_203_1.time_ < var_206_21 + var_206_22 then
				local var_206_23 = (arg_203_1.time_ - var_206_21) / var_206_22

				if arg_203_1.var_.actorSpriteComps1056 then
					for iter_206_6, iter_206_7 in pairs(arg_203_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_206_7 then
							local var_206_24 = Mathf.Lerp(iter_206_7.color.r, 0.5, var_206_23)

							iter_206_7.color = Color.New(var_206_24, var_206_24, var_206_24)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_21 + var_206_22 and arg_203_1.time_ < var_206_21 + var_206_22 + arg_206_0 and arg_203_1.var_.actorSpriteComps1056 then
				local var_206_25 = 0.5

				for iter_206_8, iter_206_9 in pairs(arg_203_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_206_9 then
						iter_206_9.color = Color.New(var_206_25, var_206_25, var_206_25)
					end
				end

				arg_203_1.var_.actorSpriteComps1056 = nil
			end

			local var_206_26 = 0
			local var_206_27 = 0.525

			if var_206_26 < arg_203_1.time_ and arg_203_1.time_ <= var_206_26 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_28 = arg_203_1:FormatText(StoryNameCfg[584].name)

				arg_203_1.leftNameTxt_.text = var_206_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_29 = arg_203_1:GetWordFromCfg(410042051)
				local var_206_30 = arg_203_1:FormatText(var_206_29.content)

				arg_203_1.text_.text = var_206_30

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_31 = 21
				local var_206_32 = utf8.len(var_206_30)
				local var_206_33 = var_206_31 <= 0 and var_206_27 or var_206_27 * (var_206_32 / var_206_31)

				if var_206_33 > 0 and var_206_27 < var_206_33 then
					arg_203_1.talkMaxDuration = var_206_33

					if var_206_33 + var_206_26 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_33 + var_206_26
					end
				end

				arg_203_1.text_.text = var_206_30
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042051", "story_v_out_410042.awb") ~= 0 then
					local var_206_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042051", "story_v_out_410042.awb") / 1000

					if var_206_34 + var_206_26 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_34 + var_206_26
					end

					if var_206_29.prefab_name ~= "" and arg_203_1.actors_[var_206_29.prefab_name] ~= nil then
						local var_206_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_29.prefab_name].transform, "story_v_out_410042", "410042051", "story_v_out_410042.awb")

						arg_203_1:RecordAudio("410042051", var_206_35)
						arg_203_1:RecordAudio("410042051", var_206_35)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410042", "410042051", "story_v_out_410042.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410042", "410042051", "story_v_out_410042.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_36 = math.max(var_206_27, arg_203_1.talkMaxDuration)

			if var_206_26 <= arg_203_1.time_ and arg_203_1.time_ < var_206_26 + var_206_36 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_26) / var_206_36

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_26 + var_206_36 and arg_203_1.time_ < var_206_26 + var_206_36 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410042052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410042052
		arg_207_1.duration_ = 8.466

		local var_207_0 = {
			zh = 4.433,
			ja = 8.466
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
				arg_207_0:Play410042053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10063"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos10063 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("10063", 4)

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
				local var_210_6 = Vector3.New(390, -535, -105)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10063, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(390, -535, -105)
			end

			local var_210_7 = arg_207_1.actors_["10063"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 and arg_207_1.var_.actorSpriteComps10063 == nil then
				arg_207_1.var_.actorSpriteComps10063 = var_210_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_9 = 0.034

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_9 then
				local var_210_10 = (arg_207_1.time_ - var_210_8) / var_210_9

				if arg_207_1.var_.actorSpriteComps10063 then
					for iter_210_1, iter_210_2 in pairs(arg_207_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_210_2 then
							local var_210_11 = Mathf.Lerp(iter_210_2.color.r, 1, var_210_10)

							iter_210_2.color = Color.New(var_210_11, var_210_11, var_210_11)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_9 and arg_207_1.time_ < var_210_8 + var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps10063 then
				local var_210_12 = 1

				for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_210_4 then
						iter_210_4.color = Color.New(var_210_12, var_210_12, var_210_12)
					end
				end

				arg_207_1.var_.actorSpriteComps10063 = nil
			end

			local var_210_13 = arg_207_1.actors_["1060"]
			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 and arg_207_1.var_.actorSpriteComps1060 == nil then
				arg_207_1.var_.actorSpriteComps1060 = var_210_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_15 = 0.034

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_15 then
				local var_210_16 = (arg_207_1.time_ - var_210_14) / var_210_15

				if arg_207_1.var_.actorSpriteComps1060 then
					for iter_210_5, iter_210_6 in pairs(arg_207_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_210_6 then
							local var_210_17 = Mathf.Lerp(iter_210_6.color.r, 0.5, var_210_16)

							iter_210_6.color = Color.New(var_210_17, var_210_17, var_210_17)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_14 + var_210_15 and arg_207_1.time_ < var_210_14 + var_210_15 + arg_210_0 and arg_207_1.var_.actorSpriteComps1060 then
				local var_210_18 = 0.5

				for iter_210_7, iter_210_8 in pairs(arg_207_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_210_8 then
						iter_210_8.color = Color.New(var_210_18, var_210_18, var_210_18)
					end
				end

				arg_207_1.var_.actorSpriteComps1060 = nil
			end

			local var_210_19 = 0
			local var_210_20 = 0.45

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_21 = arg_207_1:FormatText(StoryNameCfg[591].name)

				arg_207_1.leftNameTxt_.text = var_210_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_22 = arg_207_1:GetWordFromCfg(410042052)
				local var_210_23 = arg_207_1:FormatText(var_210_22.content)

				arg_207_1.text_.text = var_210_23

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_24 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042052", "story_v_out_410042.awb") ~= 0 then
					local var_210_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042052", "story_v_out_410042.awb") / 1000

					if var_210_27 + var_210_19 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_27 + var_210_19
					end

					if var_210_22.prefab_name ~= "" and arg_207_1.actors_[var_210_22.prefab_name] ~= nil then
						local var_210_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_22.prefab_name].transform, "story_v_out_410042", "410042052", "story_v_out_410042.awb")

						arg_207_1:RecordAudio("410042052", var_210_28)
						arg_207_1:RecordAudio("410042052", var_210_28)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_410042", "410042052", "story_v_out_410042.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_410042", "410042052", "story_v_out_410042.awb")
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
	Play410042053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410042053
		arg_211_1.duration_ = 13

		local var_211_0 = {
			zh = 8.1,
			ja = 13
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
				arg_211_0:Play410042054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10060"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos10060 = var_214_0.localPosition
				var_214_0.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("10060", 4)

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
				local var_214_6 = Vector3.New(390, -400, 0)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10060, var_214_6, var_214_5)
			end

			if arg_211_1.time_ >= var_214_1 + var_214_4 and arg_211_1.time_ < var_214_1 + var_214_4 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_214_7 = arg_211_1.actors_["10063"].transform
			local var_214_8 = 0

			if var_214_8 < arg_211_1.time_ and arg_211_1.time_ <= var_214_8 + arg_214_0 then
				arg_211_1.var_.moveOldPos10063 = var_214_7.localPosition
				var_214_7.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("10063", 7)

				local var_214_9 = var_214_7.childCount

				for iter_214_1 = 0, var_214_9 - 1 do
					local var_214_10 = var_214_7:GetChild(iter_214_1)

					if var_214_10.name == "" or not string.find(var_214_10.name, "split") then
						var_214_10.gameObject:SetActive(true)
					else
						var_214_10.gameObject:SetActive(false)
					end
				end
			end

			local var_214_11 = 0.001

			if var_214_8 <= arg_211_1.time_ and arg_211_1.time_ < var_214_8 + var_214_11 then
				local var_214_12 = (arg_211_1.time_ - var_214_8) / var_214_11
				local var_214_13 = Vector3.New(0, -2000, -105)

				var_214_7.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10063, var_214_13, var_214_12)
			end

			if arg_211_1.time_ >= var_214_8 + var_214_11 and arg_211_1.time_ < var_214_8 + var_214_11 + arg_214_0 then
				var_214_7.localPosition = Vector3.New(0, -2000, -105)
			end

			local var_214_14 = arg_211_1.actors_["10060"]
			local var_214_15 = 0

			if var_214_15 < arg_211_1.time_ and arg_211_1.time_ <= var_214_15 + arg_214_0 and arg_211_1.var_.actorSpriteComps10060 == nil then
				arg_211_1.var_.actorSpriteComps10060 = var_214_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_16 = 0.034

			if var_214_15 <= arg_211_1.time_ and arg_211_1.time_ < var_214_15 + var_214_16 then
				local var_214_17 = (arg_211_1.time_ - var_214_15) / var_214_16

				if arg_211_1.var_.actorSpriteComps10060 then
					for iter_214_2, iter_214_3 in pairs(arg_211_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_214_3 then
							local var_214_18 = Mathf.Lerp(iter_214_3.color.r, 1, var_214_17)

							iter_214_3.color = Color.New(var_214_18, var_214_18, var_214_18)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_15 + var_214_16 and arg_211_1.time_ < var_214_15 + var_214_16 + arg_214_0 and arg_211_1.var_.actorSpriteComps10060 then
				local var_214_19 = 1

				for iter_214_4, iter_214_5 in pairs(arg_211_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_214_5 then
						iter_214_5.color = Color.New(var_214_19, var_214_19, var_214_19)
					end
				end

				arg_211_1.var_.actorSpriteComps10060 = nil
			end

			local var_214_20 = arg_211_1.actors_["10063"]
			local var_214_21 = 0

			if var_214_21 < arg_211_1.time_ and arg_211_1.time_ <= var_214_21 + arg_214_0 and arg_211_1.var_.actorSpriteComps10063 == nil then
				arg_211_1.var_.actorSpriteComps10063 = var_214_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_22 = 0.034

			if var_214_21 <= arg_211_1.time_ and arg_211_1.time_ < var_214_21 + var_214_22 then
				local var_214_23 = (arg_211_1.time_ - var_214_21) / var_214_22

				if arg_211_1.var_.actorSpriteComps10063 then
					for iter_214_6, iter_214_7 in pairs(arg_211_1.var_.actorSpriteComps10063:ToTable()) do
						if iter_214_7 then
							local var_214_24 = Mathf.Lerp(iter_214_7.color.r, 0.5, var_214_23)

							iter_214_7.color = Color.New(var_214_24, var_214_24, var_214_24)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_21 + var_214_22 and arg_211_1.time_ < var_214_21 + var_214_22 + arg_214_0 and arg_211_1.var_.actorSpriteComps10063 then
				local var_214_25 = 0.5

				for iter_214_8, iter_214_9 in pairs(arg_211_1.var_.actorSpriteComps10063:ToTable()) do
					if iter_214_9 then
						iter_214_9.color = Color.New(var_214_25, var_214_25, var_214_25)
					end
				end

				arg_211_1.var_.actorSpriteComps10063 = nil
			end

			local var_214_26 = 0
			local var_214_27 = 1.1

			if var_214_26 < arg_211_1.time_ and arg_211_1.time_ <= var_214_26 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_28 = arg_211_1:FormatText(StoryNameCfg[597].name)

				arg_211_1.leftNameTxt_.text = var_214_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_29 = arg_211_1:GetWordFromCfg(410042053)
				local var_214_30 = arg_211_1:FormatText(var_214_29.content)

				arg_211_1.text_.text = var_214_30

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_31 = 44
				local var_214_32 = utf8.len(var_214_30)
				local var_214_33 = var_214_31 <= 0 and var_214_27 or var_214_27 * (var_214_32 / var_214_31)

				if var_214_33 > 0 and var_214_27 < var_214_33 then
					arg_211_1.talkMaxDuration = var_214_33

					if var_214_33 + var_214_26 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_33 + var_214_26
					end
				end

				arg_211_1.text_.text = var_214_30
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042053", "story_v_out_410042.awb") ~= 0 then
					local var_214_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042053", "story_v_out_410042.awb") / 1000

					if var_214_34 + var_214_26 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_34 + var_214_26
					end

					if var_214_29.prefab_name ~= "" and arg_211_1.actors_[var_214_29.prefab_name] ~= nil then
						local var_214_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_29.prefab_name].transform, "story_v_out_410042", "410042053", "story_v_out_410042.awb")

						arg_211_1:RecordAudio("410042053", var_214_35)
						arg_211_1:RecordAudio("410042053", var_214_35)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_410042", "410042053", "story_v_out_410042.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_410042", "410042053", "story_v_out_410042.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_36 = math.max(var_214_27, arg_211_1.talkMaxDuration)

			if var_214_26 <= arg_211_1.time_ and arg_211_1.time_ < var_214_26 + var_214_36 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_26) / var_214_36

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_26 + var_214_36 and arg_211_1.time_ < var_214_26 + var_214_36 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play410042054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410042054
		arg_215_1.duration_ = 4.5

		local var_215_0 = {
			zh = 4.5,
			ja = 4
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
				arg_215_0:Play410042055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10060"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos10060 = var_218_0.localPosition
				var_218_0.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("10060", 4)

				local var_218_2 = var_218_0.childCount

				for iter_218_0 = 0, var_218_2 - 1 do
					local var_218_3 = var_218_0:GetChild(iter_218_0)

					if var_218_3.name == "split_4" or not string.find(var_218_3.name, "split") then
						var_218_3.gameObject:SetActive(true)
					else
						var_218_3.gameObject:SetActive(false)
					end
				end
			end

			local var_218_4 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_4 then
				local var_218_5 = (arg_215_1.time_ - var_218_1) / var_218_4
				local var_218_6 = Vector3.New(390, -400, 0)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos10060, var_218_6, var_218_5)
			end

			if arg_215_1.time_ >= var_218_1 + var_218_4 and arg_215_1.time_ < var_218_1 + var_218_4 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_218_7 = arg_215_1.actors_["10060"]
			local var_218_8 = 0

			if var_218_8 < arg_215_1.time_ and arg_215_1.time_ <= var_218_8 + arg_218_0 and arg_215_1.var_.actorSpriteComps10060 == nil then
				arg_215_1.var_.actorSpriteComps10060 = var_218_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_9 = 0.034

			if var_218_8 <= arg_215_1.time_ and arg_215_1.time_ < var_218_8 + var_218_9 then
				local var_218_10 = (arg_215_1.time_ - var_218_8) / var_218_9

				if arg_215_1.var_.actorSpriteComps10060 then
					for iter_218_1, iter_218_2 in pairs(arg_215_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_218_2 then
							local var_218_11 = Mathf.Lerp(iter_218_2.color.r, 1, var_218_10)

							iter_218_2.color = Color.New(var_218_11, var_218_11, var_218_11)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_8 + var_218_9 and arg_215_1.time_ < var_218_8 + var_218_9 + arg_218_0 and arg_215_1.var_.actorSpriteComps10060 then
				local var_218_12 = 1

				for iter_218_3, iter_218_4 in pairs(arg_215_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_218_4 then
						iter_218_4.color = Color.New(var_218_12, var_218_12, var_218_12)
					end
				end

				arg_215_1.var_.actorSpriteComps10060 = nil
			end

			local var_218_13 = 0
			local var_218_14 = 0.575

			if var_218_13 < arg_215_1.time_ and arg_215_1.time_ <= var_218_13 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_15 = arg_215_1:FormatText(StoryNameCfg[597].name)

				arg_215_1.leftNameTxt_.text = var_218_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_16 = arg_215_1:GetWordFromCfg(410042054)
				local var_218_17 = arg_215_1:FormatText(var_218_16.content)

				arg_215_1.text_.text = var_218_17

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_18 = 23
				local var_218_19 = utf8.len(var_218_17)
				local var_218_20 = var_218_18 <= 0 and var_218_14 or var_218_14 * (var_218_19 / var_218_18)

				if var_218_20 > 0 and var_218_14 < var_218_20 then
					arg_215_1.talkMaxDuration = var_218_20

					if var_218_20 + var_218_13 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_20 + var_218_13
					end
				end

				arg_215_1.text_.text = var_218_17
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042054", "story_v_out_410042.awb") ~= 0 then
					local var_218_21 = manager.audio:GetVoiceLength("story_v_out_410042", "410042054", "story_v_out_410042.awb") / 1000

					if var_218_21 + var_218_13 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_21 + var_218_13
					end

					if var_218_16.prefab_name ~= "" and arg_215_1.actors_[var_218_16.prefab_name] ~= nil then
						local var_218_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_16.prefab_name].transform, "story_v_out_410042", "410042054", "story_v_out_410042.awb")

						arg_215_1:RecordAudio("410042054", var_218_22)
						arg_215_1:RecordAudio("410042054", var_218_22)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_410042", "410042054", "story_v_out_410042.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_410042", "410042054", "story_v_out_410042.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_23 = math.max(var_218_14, arg_215_1.talkMaxDuration)

			if var_218_13 <= arg_215_1.time_ and arg_215_1.time_ < var_218_13 + var_218_23 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_13) / var_218_23

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_13 + var_218_23 and arg_215_1.time_ < var_218_13 + var_218_23 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play410042055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410042055
		arg_219_1.duration_ = 8.8

		local var_219_0 = {
			zh = 3.066,
			ja = 8.8
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
				arg_219_0:Play410042056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10059"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos10059 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10059", 4)

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
				local var_222_6 = Vector3.New(390, -530, 35)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10059, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_222_7 = arg_219_1.actors_["10060"].transform
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 then
				arg_219_1.var_.moveOldPos10060 = var_222_7.localPosition
				var_222_7.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10060", 7)

				local var_222_9 = var_222_7.childCount

				for iter_222_1 = 0, var_222_9 - 1 do
					local var_222_10 = var_222_7:GetChild(iter_222_1)

					if var_222_10.name == "" or not string.find(var_222_10.name, "split") then
						var_222_10.gameObject:SetActive(true)
					else
						var_222_10.gameObject:SetActive(false)
					end
				end
			end

			local var_222_11 = 0.001

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_8) / var_222_11
				local var_222_13 = Vector3.New(0, -2000, 0)

				var_222_7.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10060, var_222_13, var_222_12)
			end

			if arg_219_1.time_ >= var_222_8 + var_222_11 and arg_219_1.time_ < var_222_8 + var_222_11 + arg_222_0 then
				var_222_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_222_14 = arg_219_1.actors_["10059"]
			local var_222_15 = 0

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 and arg_219_1.var_.actorSpriteComps10059 == nil then
				arg_219_1.var_.actorSpriteComps10059 = var_222_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_16 = 0.034

			if var_222_15 <= arg_219_1.time_ and arg_219_1.time_ < var_222_15 + var_222_16 then
				local var_222_17 = (arg_219_1.time_ - var_222_15) / var_222_16

				if arg_219_1.var_.actorSpriteComps10059 then
					for iter_222_2, iter_222_3 in pairs(arg_219_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_222_3 then
							local var_222_18 = Mathf.Lerp(iter_222_3.color.r, 1, var_222_17)

							iter_222_3.color = Color.New(var_222_18, var_222_18, var_222_18)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_15 + var_222_16 and arg_219_1.time_ < var_222_15 + var_222_16 + arg_222_0 and arg_219_1.var_.actorSpriteComps10059 then
				local var_222_19 = 1

				for iter_222_4, iter_222_5 in pairs(arg_219_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_222_5 then
						iter_222_5.color = Color.New(var_222_19, var_222_19, var_222_19)
					end
				end

				arg_219_1.var_.actorSpriteComps10059 = nil
			end

			local var_222_20 = arg_219_1.actors_["10060"]
			local var_222_21 = 0

			if var_222_21 < arg_219_1.time_ and arg_219_1.time_ <= var_222_21 + arg_222_0 and arg_219_1.var_.actorSpriteComps10060 == nil then
				arg_219_1.var_.actorSpriteComps10060 = var_222_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_22 = 0.034

			if var_222_21 <= arg_219_1.time_ and arg_219_1.time_ < var_222_21 + var_222_22 then
				local var_222_23 = (arg_219_1.time_ - var_222_21) / var_222_22

				if arg_219_1.var_.actorSpriteComps10060 then
					for iter_222_6, iter_222_7 in pairs(arg_219_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_222_7 then
							local var_222_24 = Mathf.Lerp(iter_222_7.color.r, 0.5, var_222_23)

							iter_222_7.color = Color.New(var_222_24, var_222_24, var_222_24)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_21 + var_222_22 and arg_219_1.time_ < var_222_21 + var_222_22 + arg_222_0 and arg_219_1.var_.actorSpriteComps10060 then
				local var_222_25 = 0.5

				for iter_222_8, iter_222_9 in pairs(arg_219_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_222_9 then
						iter_222_9.color = Color.New(var_222_25, var_222_25, var_222_25)
					end
				end

				arg_219_1.var_.actorSpriteComps10060 = nil
			end

			local var_222_26 = 0
			local var_222_27 = 0.3

			if var_222_26 < arg_219_1.time_ and arg_219_1.time_ <= var_222_26 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_28 = arg_219_1:FormatText(StoryNameCfg[596].name)

				arg_219_1.leftNameTxt_.text = var_222_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_29 = arg_219_1:GetWordFromCfg(410042055)
				local var_222_30 = arg_219_1:FormatText(var_222_29.content)

				arg_219_1.text_.text = var_222_30

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_31 = 12
				local var_222_32 = utf8.len(var_222_30)
				local var_222_33 = var_222_31 <= 0 and var_222_27 or var_222_27 * (var_222_32 / var_222_31)

				if var_222_33 > 0 and var_222_27 < var_222_33 then
					arg_219_1.talkMaxDuration = var_222_33

					if var_222_33 + var_222_26 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_33 + var_222_26
					end
				end

				arg_219_1.text_.text = var_222_30
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042055", "story_v_out_410042.awb") ~= 0 then
					local var_222_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042055", "story_v_out_410042.awb") / 1000

					if var_222_34 + var_222_26 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_34 + var_222_26
					end

					if var_222_29.prefab_name ~= "" and arg_219_1.actors_[var_222_29.prefab_name] ~= nil then
						local var_222_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_29.prefab_name].transform, "story_v_out_410042", "410042055", "story_v_out_410042.awb")

						arg_219_1:RecordAudio("410042055", var_222_35)
						arg_219_1:RecordAudio("410042055", var_222_35)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410042", "410042055", "story_v_out_410042.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410042", "410042055", "story_v_out_410042.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_36 = math.max(var_222_27, arg_219_1.talkMaxDuration)

			if var_222_26 <= arg_219_1.time_ and arg_219_1.time_ < var_222_26 + var_222_36 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_26) / var_222_36

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_26 + var_222_36 and arg_219_1.time_ < var_222_26 + var_222_36 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play410042056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410042056
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play410042057(arg_223_1)
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
				local var_226_6 = Vector3.New(0, -2000, 35)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10059, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, -2000, 35)
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

			local var_226_13 = arg_223_1.actors_["1060"].transform
			local var_226_14 = 0

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 then
				arg_223_1.var_.moveOldPos1060 = var_226_13.localPosition
				var_226_13.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("1060", 3)

				local var_226_15 = var_226_13.childCount

				for iter_226_5 = 0, var_226_15 - 1 do
					local var_226_16 = var_226_13:GetChild(iter_226_5)

					if var_226_16.name == "" or not string.find(var_226_16.name, "split") then
						var_226_16.gameObject:SetActive(true)
					else
						var_226_16.gameObject:SetActive(false)
					end
				end
			end

			local var_226_17 = 0.001

			if var_226_14 <= arg_223_1.time_ and arg_223_1.time_ < var_226_14 + var_226_17 then
				local var_226_18 = (arg_223_1.time_ - var_226_14) / var_226_17
				local var_226_19 = Vector3.New(0, -435, -40)

				var_226_13.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1060, var_226_19, var_226_18)
			end

			if arg_223_1.time_ >= var_226_14 + var_226_17 and arg_223_1.time_ < var_226_14 + var_226_17 + arg_226_0 then
				var_226_13.localPosition = Vector3.New(0, -435, -40)
			end

			local var_226_20 = arg_223_1.actors_["1060"]
			local var_226_21 = 0

			if var_226_21 < arg_223_1.time_ and arg_223_1.time_ <= var_226_21 + arg_226_0 and arg_223_1.var_.actorSpriteComps1060 == nil then
				arg_223_1.var_.actorSpriteComps1060 = var_226_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_22 = 0.034

			if var_226_21 <= arg_223_1.time_ and arg_223_1.time_ < var_226_21 + var_226_22 then
				local var_226_23 = (arg_223_1.time_ - var_226_21) / var_226_22

				if arg_223_1.var_.actorSpriteComps1060 then
					for iter_226_6, iter_226_7 in pairs(arg_223_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_226_7 then
							local var_226_24 = Mathf.Lerp(iter_226_7.color.r, 0.5, var_226_23)

							iter_226_7.color = Color.New(var_226_24, var_226_24, var_226_24)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_21 + var_226_22 and arg_223_1.time_ < var_226_21 + var_226_22 + arg_226_0 and arg_223_1.var_.actorSpriteComps1060 then
				local var_226_25 = 0.5

				for iter_226_8, iter_226_9 in pairs(arg_223_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_226_9 then
						iter_226_9.color = Color.New(var_226_25, var_226_25, var_226_25)
					end
				end

				arg_223_1.var_.actorSpriteComps1060 = nil
			end

			local var_226_26 = 0
			local var_226_27 = 0.85

			if var_226_26 < arg_223_1.time_ and arg_223_1.time_ <= var_226_26 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_28 = arg_223_1:GetWordFromCfg(410042056)
				local var_226_29 = arg_223_1:FormatText(var_226_28.content)

				arg_223_1.text_.text = var_226_29

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_30 = 34
				local var_226_31 = utf8.len(var_226_29)
				local var_226_32 = var_226_30 <= 0 and var_226_27 or var_226_27 * (var_226_31 / var_226_30)

				if var_226_32 > 0 and var_226_27 < var_226_32 then
					arg_223_1.talkMaxDuration = var_226_32

					if var_226_32 + var_226_26 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_32 + var_226_26
					end
				end

				arg_223_1.text_.text = var_226_29
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_33 = math.max(var_226_27, arg_223_1.talkMaxDuration)

			if var_226_26 <= arg_223_1.time_ and arg_223_1.time_ < var_226_26 + var_226_33 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_26) / var_226_33

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_26 + var_226_33 and arg_223_1.time_ < var_226_26 + var_226_33 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play410042057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410042057
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play410042058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10060"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos10060 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("10060", 3)

				local var_230_2 = var_230_0.childCount

				for iter_230_0 = 0, var_230_2 - 1 do
					local var_230_3 = var_230_0:GetChild(iter_230_0)

					if var_230_3.name == "" or not string.find(var_230_3.name, "split") then
						var_230_3.gameObject:SetActive(true)
					else
						var_230_3.gameObject:SetActive(false)
					end
				end
			end

			local var_230_4 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_1) / var_230_4
				local var_230_6 = Vector3.New(0, -400, 0)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos10060, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_230_7 = arg_227_1.actors_["10060"]
			local var_230_8 = 0

			if var_230_8 < arg_227_1.time_ and arg_227_1.time_ <= var_230_8 + arg_230_0 and arg_227_1.var_.actorSpriteComps10060 == nil then
				arg_227_1.var_.actorSpriteComps10060 = var_230_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_9 = 0.034

			if var_230_8 <= arg_227_1.time_ and arg_227_1.time_ < var_230_8 + var_230_9 then
				local var_230_10 = (arg_227_1.time_ - var_230_8) / var_230_9

				if arg_227_1.var_.actorSpriteComps10060 then
					for iter_230_1, iter_230_2 in pairs(arg_227_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_230_2 then
							local var_230_11 = Mathf.Lerp(iter_230_2.color.r, 0.5, var_230_10)

							iter_230_2.color = Color.New(var_230_11, var_230_11, var_230_11)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_8 + var_230_9 and arg_227_1.time_ < var_230_8 + var_230_9 + arg_230_0 and arg_227_1.var_.actorSpriteComps10060 then
				local var_230_12 = 0.5

				for iter_230_3, iter_230_4 in pairs(arg_227_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_230_4 then
						iter_230_4.color = Color.New(var_230_12, var_230_12, var_230_12)
					end
				end

				arg_227_1.var_.actorSpriteComps10060 = nil
			end

			local var_230_13 = 0
			local var_230_14 = 0.95

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, false)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(410042057)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 38
				local var_230_18 = utf8.len(var_230_16)
				local var_230_19 = var_230_17 <= 0 and var_230_14 or var_230_14 * (var_230_18 / var_230_17)

				if var_230_19 > 0 and var_230_14 < var_230_19 then
					arg_227_1.talkMaxDuration = var_230_19

					if var_230_19 + var_230_13 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_13
					end
				end

				arg_227_1.text_.text = var_230_16
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_20 = math.max(var_230_14, arg_227_1.talkMaxDuration)

			if var_230_13 <= arg_227_1.time_ and arg_227_1.time_ < var_230_13 + var_230_20 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_13) / var_230_20

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_13 + var_230_20 and arg_227_1.time_ < var_230_13 + var_230_20 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play410042058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410042058
		arg_231_1.duration_ = 5.4

		local var_231_0 = {
			zh = 5.4,
			ja = 4.966
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
				arg_231_0:Play410042059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["10060"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos10060 = var_234_0.localPosition
				var_234_0.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("10060", 4)

				local var_234_2 = var_234_0.childCount

				for iter_234_0 = 0, var_234_2 - 1 do
					local var_234_3 = var_234_0:GetChild(iter_234_0)

					if var_234_3.name == "split_4" or not string.find(var_234_3.name, "split") then
						var_234_3.gameObject:SetActive(true)
					else
						var_234_3.gameObject:SetActive(false)
					end
				end
			end

			local var_234_4 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_4 then
				local var_234_5 = (arg_231_1.time_ - var_234_1) / var_234_4
				local var_234_6 = Vector3.New(390, -400, 0)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos10060, var_234_6, var_234_5)
			end

			if arg_231_1.time_ >= var_234_1 + var_234_4 and arg_231_1.time_ < var_234_1 + var_234_4 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_234_7 = arg_231_1.actors_["1060"].transform
			local var_234_8 = 0

			if var_234_8 < arg_231_1.time_ and arg_231_1.time_ <= var_234_8 + arg_234_0 then
				arg_231_1.var_.moveOldPos1060 = var_234_7.localPosition
				var_234_7.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("1060", 2)

				local var_234_9 = var_234_7.childCount

				for iter_234_1 = 0, var_234_9 - 1 do
					local var_234_10 = var_234_7:GetChild(iter_234_1)

					if var_234_10.name == "" or not string.find(var_234_10.name, "split") then
						var_234_10.gameObject:SetActive(true)
					else
						var_234_10.gameObject:SetActive(false)
					end
				end
			end

			local var_234_11 = 0.001

			if var_234_8 <= arg_231_1.time_ and arg_231_1.time_ < var_234_8 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_8) / var_234_11
				local var_234_13 = Vector3.New(-390, -435, -40)

				var_234_7.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1060, var_234_13, var_234_12)
			end

			if arg_231_1.time_ >= var_234_8 + var_234_11 and arg_231_1.time_ < var_234_8 + var_234_11 + arg_234_0 then
				var_234_7.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_234_14 = arg_231_1.actors_["10060"]
			local var_234_15 = 0

			if var_234_15 < arg_231_1.time_ and arg_231_1.time_ <= var_234_15 + arg_234_0 and arg_231_1.var_.actorSpriteComps10060 == nil then
				arg_231_1.var_.actorSpriteComps10060 = var_234_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_16 = 0.034

			if var_234_15 <= arg_231_1.time_ and arg_231_1.time_ < var_234_15 + var_234_16 then
				local var_234_17 = (arg_231_1.time_ - var_234_15) / var_234_16

				if arg_231_1.var_.actorSpriteComps10060 then
					for iter_234_2, iter_234_3 in pairs(arg_231_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_234_3 then
							local var_234_18 = Mathf.Lerp(iter_234_3.color.r, 1, var_234_17)

							iter_234_3.color = Color.New(var_234_18, var_234_18, var_234_18)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_15 + var_234_16 and arg_231_1.time_ < var_234_15 + var_234_16 + arg_234_0 and arg_231_1.var_.actorSpriteComps10060 then
				local var_234_19 = 1

				for iter_234_4, iter_234_5 in pairs(arg_231_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_234_5 then
						iter_234_5.color = Color.New(var_234_19, var_234_19, var_234_19)
					end
				end

				arg_231_1.var_.actorSpriteComps10060 = nil
			end

			local var_234_20 = arg_231_1.actors_["1060"]
			local var_234_21 = 0

			if var_234_21 < arg_231_1.time_ and arg_231_1.time_ <= var_234_21 + arg_234_0 and arg_231_1.var_.actorSpriteComps1060 == nil then
				arg_231_1.var_.actorSpriteComps1060 = var_234_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_22 = 0.034

			if var_234_21 <= arg_231_1.time_ and arg_231_1.time_ < var_234_21 + var_234_22 then
				local var_234_23 = (arg_231_1.time_ - var_234_21) / var_234_22

				if arg_231_1.var_.actorSpriteComps1060 then
					for iter_234_6, iter_234_7 in pairs(arg_231_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_234_7 then
							local var_234_24 = Mathf.Lerp(iter_234_7.color.r, 0.5, var_234_23)

							iter_234_7.color = Color.New(var_234_24, var_234_24, var_234_24)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_21 + var_234_22 and arg_231_1.time_ < var_234_21 + var_234_22 + arg_234_0 and arg_231_1.var_.actorSpriteComps1060 then
				local var_234_25 = 0.5

				for iter_234_8, iter_234_9 in pairs(arg_231_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_234_9 then
						iter_234_9.color = Color.New(var_234_25, var_234_25, var_234_25)
					end
				end

				arg_231_1.var_.actorSpriteComps1060 = nil
			end

			local var_234_26 = 0
			local var_234_27 = 0.55

			if var_234_26 < arg_231_1.time_ and arg_231_1.time_ <= var_234_26 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_28 = arg_231_1:FormatText(StoryNameCfg[597].name)

				arg_231_1.leftNameTxt_.text = var_234_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_29 = arg_231_1:GetWordFromCfg(410042058)
				local var_234_30 = arg_231_1:FormatText(var_234_29.content)

				arg_231_1.text_.text = var_234_30

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_31 = 22
				local var_234_32 = utf8.len(var_234_30)
				local var_234_33 = var_234_31 <= 0 and var_234_27 or var_234_27 * (var_234_32 / var_234_31)

				if var_234_33 > 0 and var_234_27 < var_234_33 then
					arg_231_1.talkMaxDuration = var_234_33

					if var_234_33 + var_234_26 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_33 + var_234_26
					end
				end

				arg_231_1.text_.text = var_234_30
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042058", "story_v_out_410042.awb") ~= 0 then
					local var_234_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042058", "story_v_out_410042.awb") / 1000

					if var_234_34 + var_234_26 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_34 + var_234_26
					end

					if var_234_29.prefab_name ~= "" and arg_231_1.actors_[var_234_29.prefab_name] ~= nil then
						local var_234_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_29.prefab_name].transform, "story_v_out_410042", "410042058", "story_v_out_410042.awb")

						arg_231_1:RecordAudio("410042058", var_234_35)
						arg_231_1:RecordAudio("410042058", var_234_35)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_410042", "410042058", "story_v_out_410042.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_410042", "410042058", "story_v_out_410042.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_36 = math.max(var_234_27, arg_231_1.talkMaxDuration)

			if var_234_26 <= arg_231_1.time_ and arg_231_1.time_ < var_234_26 + var_234_36 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_26) / var_234_36

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_26 + var_234_36 and arg_231_1.time_ < var_234_26 + var_234_36 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410042059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410042059
		arg_235_1.duration_ = 8.2

		local var_235_0 = {
			zh = 6.3,
			ja = 8.2
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
				arg_235_0:Play410042060(arg_235_1)
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

			local var_238_13 = arg_235_1.actors_["10060"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 and arg_235_1.var_.actorSpriteComps10060 == nil then
				arg_235_1.var_.actorSpriteComps10060 = var_238_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_15 = 0.034

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15

				if arg_235_1.var_.actorSpriteComps10060 then
					for iter_238_5, iter_238_6 in pairs(arg_235_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_238_6 then
							local var_238_17 = Mathf.Lerp(iter_238_6.color.r, 0.5, var_238_16)

							iter_238_6.color = Color.New(var_238_17, var_238_17, var_238_17)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps10060 then
				local var_238_18 = 0.5

				for iter_238_7, iter_238_8 in pairs(arg_235_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_238_8 then
						iter_238_8.color = Color.New(var_238_18, var_238_18, var_238_18)
					end
				end

				arg_235_1.var_.actorSpriteComps10060 = nil
			end

			local var_238_19 = 0
			local var_238_20 = 0.85

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

				local var_238_22 = arg_235_1:GetWordFromCfg(410042059)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042059", "story_v_out_410042.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042059", "story_v_out_410042.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_410042", "410042059", "story_v_out_410042.awb")

						arg_235_1:RecordAudio("410042059", var_238_28)
						arg_235_1:RecordAudio("410042059", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_410042", "410042059", "story_v_out_410042.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_410042", "410042059", "story_v_out_410042.awb")
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
	Play410042060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410042060
		arg_239_1.duration_ = 2.566

		local var_239_0 = {
			zh = 1.233,
			ja = 2.566
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
				arg_239_0:Play410042061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10060"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos10060 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("10060", 4)

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
				local var_242_6 = Vector3.New(390, -400, 0)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos10060, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_242_7 = arg_239_1.actors_["10060"]
			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 and arg_239_1.var_.actorSpriteComps10060 == nil then
				arg_239_1.var_.actorSpriteComps10060 = var_242_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_9 = 0.034

			if var_242_8 <= arg_239_1.time_ and arg_239_1.time_ < var_242_8 + var_242_9 then
				local var_242_10 = (arg_239_1.time_ - var_242_8) / var_242_9

				if arg_239_1.var_.actorSpriteComps10060 then
					for iter_242_1, iter_242_2 in pairs(arg_239_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_242_2 then
							local var_242_11 = Mathf.Lerp(iter_242_2.color.r, 1, var_242_10)

							iter_242_2.color = Color.New(var_242_11, var_242_11, var_242_11)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_8 + var_242_9 and arg_239_1.time_ < var_242_8 + var_242_9 + arg_242_0 and arg_239_1.var_.actorSpriteComps10060 then
				local var_242_12 = 1

				for iter_242_3, iter_242_4 in pairs(arg_239_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_242_4 then
						iter_242_4.color = Color.New(var_242_12, var_242_12, var_242_12)
					end
				end

				arg_239_1.var_.actorSpriteComps10060 = nil
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
			local var_242_20 = 0.175

			if var_242_19 < arg_239_1.time_ and arg_239_1.time_ <= var_242_19 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_21 = arg_239_1:FormatText(StoryNameCfg[597].name)

				arg_239_1.leftNameTxt_.text = var_242_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_22 = arg_239_1:GetWordFromCfg(410042060)
				local var_242_23 = arg_239_1:FormatText(var_242_22.content)

				arg_239_1.text_.text = var_242_23

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_24 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042060", "story_v_out_410042.awb") ~= 0 then
					local var_242_27 = manager.audio:GetVoiceLength("story_v_out_410042", "410042060", "story_v_out_410042.awb") / 1000

					if var_242_27 + var_242_19 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_27 + var_242_19
					end

					if var_242_22.prefab_name ~= "" and arg_239_1.actors_[var_242_22.prefab_name] ~= nil then
						local var_242_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_22.prefab_name].transform, "story_v_out_410042", "410042060", "story_v_out_410042.awb")

						arg_239_1:RecordAudio("410042060", var_242_28)
						arg_239_1:RecordAudio("410042060", var_242_28)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_410042", "410042060", "story_v_out_410042.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_410042", "410042060", "story_v_out_410042.awb")
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
	Play410042061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410042061
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play410042062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["10060"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.actorSpriteComps10060 == nil then
				arg_243_1.var_.actorSpriteComps10060 = var_246_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_2 = 0.034

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.actorSpriteComps10060 then
					for iter_246_0, iter_246_1 in pairs(arg_243_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_246_1 then
							local var_246_4 = Mathf.Lerp(iter_246_1.color.r, 0.5, var_246_3)

							iter_246_1.color = Color.New(var_246_4, var_246_4, var_246_4)
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.actorSpriteComps10060 then
				local var_246_5 = 0.5

				for iter_246_2, iter_246_3 in pairs(arg_243_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_246_3 then
						iter_246_3.color = Color.New(var_246_5, var_246_5, var_246_5)
					end
				end

				arg_243_1.var_.actorSpriteComps10060 = nil
			end

			local var_246_6 = 0
			local var_246_7 = 1.25

			if var_246_6 < arg_243_1.time_ and arg_243_1.time_ <= var_246_6 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_8 = arg_243_1:GetWordFromCfg(410042061)
				local var_246_9 = arg_243_1:FormatText(var_246_8.content)

				arg_243_1.text_.text = var_246_9

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_10 = 50
				local var_246_11 = utf8.len(var_246_9)
				local var_246_12 = var_246_10 <= 0 and var_246_7 or var_246_7 * (var_246_11 / var_246_10)

				if var_246_12 > 0 and var_246_7 < var_246_12 then
					arg_243_1.talkMaxDuration = var_246_12

					if var_246_12 + var_246_6 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_12 + var_246_6
					end
				end

				arg_243_1.text_.text = var_246_9
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_13 = math.max(var_246_7, arg_243_1.talkMaxDuration)

			if var_246_6 <= arg_243_1.time_ and arg_243_1.time_ < var_246_6 + var_246_13 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_6) / var_246_13

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_6 + var_246_13 and arg_243_1.time_ < var_246_6 + var_246_13 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play410042062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410042062
		arg_247_1.duration_ = 7.266

		local var_247_0 = {
			zh = 3.566,
			ja = 7.266
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
			arg_247_1.auto_ = false
		end

		function arg_247_1.playNext_(arg_249_0)
			arg_247_1.onStoryFinished_()
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10060"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos10060 = var_250_0.localPosition
				var_250_0.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("10060", 3)

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
				local var_250_6 = Vector3.New(0, -400, 0)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos10060, var_250_6, var_250_5)
			end

			if arg_247_1.time_ >= var_250_1 + var_250_4 and arg_247_1.time_ < var_250_1 + var_250_4 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_250_7 = arg_247_1.actors_["10060"]
			local var_250_8 = 0

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 and arg_247_1.var_.actorSpriteComps10060 == nil then
				arg_247_1.var_.actorSpriteComps10060 = var_250_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_9 = 0.034

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_9 then
				local var_250_10 = (arg_247_1.time_ - var_250_8) / var_250_9

				if arg_247_1.var_.actorSpriteComps10060 then
					for iter_250_1, iter_250_2 in pairs(arg_247_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_250_2 then
							local var_250_11 = Mathf.Lerp(iter_250_2.color.r, 1, var_250_10)

							iter_250_2.color = Color.New(var_250_11, var_250_11, var_250_11)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_8 + var_250_9 and arg_247_1.time_ < var_250_8 + var_250_9 + arg_250_0 and arg_247_1.var_.actorSpriteComps10060 then
				local var_250_12 = 1

				for iter_250_3, iter_250_4 in pairs(arg_247_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_250_4 then
						iter_250_4.color = Color.New(var_250_12, var_250_12, var_250_12)
					end
				end

				arg_247_1.var_.actorSpriteComps10060 = nil
			end

			local var_250_13 = arg_247_1.actors_["1060"].transform
			local var_250_14 = 0

			if var_250_14 < arg_247_1.time_ and arg_247_1.time_ <= var_250_14 + arg_250_0 then
				arg_247_1.var_.moveOldPos1060 = var_250_13.localPosition
				var_250_13.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1060", 7)

				local var_250_15 = var_250_13.childCount

				for iter_250_5 = 0, var_250_15 - 1 do
					local var_250_16 = var_250_13:GetChild(iter_250_5)

					if var_250_16.name == "" or not string.find(var_250_16.name, "split") then
						var_250_16.gameObject:SetActive(true)
					else
						var_250_16.gameObject:SetActive(false)
					end
				end
			end

			local var_250_17 = 0.001

			if var_250_14 <= arg_247_1.time_ and arg_247_1.time_ < var_250_14 + var_250_17 then
				local var_250_18 = (arg_247_1.time_ - var_250_14) / var_250_17
				local var_250_19 = Vector3.New(0, -2000, -40)

				var_250_13.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1060, var_250_19, var_250_18)
			end

			if arg_247_1.time_ >= var_250_14 + var_250_17 and arg_247_1.time_ < var_250_14 + var_250_17 + arg_250_0 then
				var_250_13.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_250_20 = arg_247_1.actors_["1060"]
			local var_250_21 = 0

			if var_250_21 < arg_247_1.time_ and arg_247_1.time_ <= var_250_21 + arg_250_0 and arg_247_1.var_.actorSpriteComps1060 == nil then
				arg_247_1.var_.actorSpriteComps1060 = var_250_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_22 = 0.034

			if var_250_21 <= arg_247_1.time_ and arg_247_1.time_ < var_250_21 + var_250_22 then
				local var_250_23 = (arg_247_1.time_ - var_250_21) / var_250_22

				if arg_247_1.var_.actorSpriteComps1060 then
					for iter_250_6, iter_250_7 in pairs(arg_247_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_250_7 then
							local var_250_24 = Mathf.Lerp(iter_250_7.color.r, 0.5, var_250_23)

							iter_250_7.color = Color.New(var_250_24, var_250_24, var_250_24)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_21 + var_250_22 and arg_247_1.time_ < var_250_21 + var_250_22 + arg_250_0 and arg_247_1.var_.actorSpriteComps1060 then
				local var_250_25 = 0.5

				for iter_250_8, iter_250_9 in pairs(arg_247_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_250_9 then
						iter_250_9.color = Color.New(var_250_25, var_250_25, var_250_25)
					end
				end

				arg_247_1.var_.actorSpriteComps1060 = nil
			end

			local var_250_26 = 0
			local var_250_27 = 0.45

			if var_250_26 < arg_247_1.time_ and arg_247_1.time_ <= var_250_26 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_28 = arg_247_1:FormatText(StoryNameCfg[597].name)

				arg_247_1.leftNameTxt_.text = var_250_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_29 = arg_247_1:GetWordFromCfg(410042062)
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

				if manager.audio:GetVoiceLength("story_v_out_410042", "410042062", "story_v_out_410042.awb") ~= 0 then
					local var_250_34 = manager.audio:GetVoiceLength("story_v_out_410042", "410042062", "story_v_out_410042.awb") / 1000

					if var_250_34 + var_250_26 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_34 + var_250_26
					end

					if var_250_29.prefab_name ~= "" and arg_247_1.actors_[var_250_29.prefab_name] ~= nil then
						local var_250_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_29.prefab_name].transform, "story_v_out_410042", "410042062", "story_v_out_410042.awb")

						arg_247_1:RecordAudio("410042062", var_250_35)
						arg_247_1:RecordAudio("410042062", var_250_35)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410042", "410042062", "story_v_out_410042.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410042", "410042062", "story_v_out_410042.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L03f"
	},
	voices = {
		"story_v_out_410042.awb"
	}
}
