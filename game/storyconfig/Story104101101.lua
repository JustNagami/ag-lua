return {
	Play410111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410111001
		arg_1_1.duration_ = 8.4

		local var_1_0 = {
			zh = 6.6,
			ja = 8.4
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
				arg_1_0:Play410111002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L04f"

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
				local var_4_5 = arg_1_1.bgs_.L04f

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
					if iter_4_0 ~= "L04f" then
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

			local var_4_22 = "1060"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["1060"].transform
			local var_4_25 = 2

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos1060 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("1060", 3)

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
				local var_4_30 = Vector3.New(0, -435, -40)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1060, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(0, -435, -40)
			end

			local var_4_31 = arg_1_1.actors_["1060"]
			local var_4_32 = 2

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps1060 == nil then
				arg_1_1.var_.actorSpriteComps1060 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.0339999999999998

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps1060 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps1060 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps1060 = nil
			end

			local var_4_37 = 0
			local var_4_38 = 1

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				local var_4_39 = "play"
				local var_4_40 = "music"

				arg_1_1:AudioAction(var_4_39, var_4_40, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_41 = 1.56666666666667
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "bgm_activity_2_8_story_tara_garden", "bgm_activity_2_8_story_tara_garden", "bgm_activity_2_8_story_tara_garden.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_45 = 2
			local var_4_46 = 0.25

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_47 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_47:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_48 = arg_1_1:FormatText(StoryNameCfg[584].name)

				arg_1_1.leftNameTxt_.text = var_4_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_49 = arg_1_1:GetWordFromCfg(410111001)
				local var_4_50 = arg_1_1:FormatText(var_4_49.content)

				arg_1_1.text_.text = var_4_50

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_51 = 10
				local var_4_52 = utf8.len(var_4_50)
				local var_4_53 = var_4_51 <= 0 and var_4_46 or var_4_46 * (var_4_52 / var_4_51)

				if var_4_53 > 0 and var_4_46 < var_4_53 then
					arg_1_1.talkMaxDuration = var_4_53
					var_4_45 = var_4_45 + 0.3

					if var_4_53 + var_4_45 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_53 + var_4_45
					end
				end

				arg_1_1.text_.text = var_4_50
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111001", "story_v_out_410111.awb") ~= 0 then
					local var_4_54 = manager.audio:GetVoiceLength("story_v_out_410111", "410111001", "story_v_out_410111.awb") / 1000

					if var_4_54 + var_4_45 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_54 + var_4_45
					end

					if var_4_49.prefab_name ~= "" and arg_1_1.actors_[var_4_49.prefab_name] ~= nil then
						local var_4_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_49.prefab_name].transform, "story_v_out_410111", "410111001", "story_v_out_410111.awb")

						arg_1_1:RecordAudio("410111001", var_4_55)
						arg_1_1:RecordAudio("410111001", var_4_55)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410111", "410111001", "story_v_out_410111.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410111", "410111001", "story_v_out_410111.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_56 = var_4_45 + 0.3
			local var_4_57 = math.max(var_4_46, arg_1_1.talkMaxDuration)

			if var_4_56 <= arg_1_1.time_ and arg_1_1.time_ < var_4_56 + var_4_57 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_56) / var_4_57

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_56 + var_4_57 and arg_1_1.time_ < var_4_56 + var_4_57 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410111002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410111002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410111003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1060"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos1060 = var_10_0.localPosition
				var_10_0.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1060", 7)

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
				local var_10_6 = Vector3.New(0, -2000, -40)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1060, var_10_6, var_10_5)
			end

			if arg_7_1.time_ >= var_10_1 + var_10_4 and arg_7_1.time_ < var_10_1 + var_10_4 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(0, -2000, -40)
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
							local var_10_11 = Mathf.Lerp(iter_10_2.color.r, 0.5, var_10_10)

							iter_10_2.color = Color.New(var_10_11, var_10_11, var_10_11)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_8 + var_10_9 and arg_7_1.time_ < var_10_8 + var_10_9 + arg_10_0 and arg_7_1.var_.actorSpriteComps1060 then
				local var_10_12 = 0.5

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_12, var_10_12, var_10_12)
					end
				end

				arg_7_1.var_.actorSpriteComps1060 = nil
			end

			local var_10_13 = "10062"

			if arg_7_1.actors_[var_10_13] == nil then
				local var_10_14 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_13), arg_7_1.canvasGo_.transform)

				var_10_14.transform:SetSiblingIndex(1)

				var_10_14.name = var_10_13
				var_10_14.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_13] = var_10_14
			end

			local var_10_15 = arg_7_1.actors_["10062"].transform
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 then
				arg_7_1.var_.moveOldPos10062 = var_10_15.localPosition
				var_10_15.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10062", 3)

				local var_10_17 = var_10_15.childCount

				for iter_10_5 = 0, var_10_17 - 1 do
					local var_10_18 = var_10_15:GetChild(iter_10_5)

					if var_10_18.name == "" or not string.find(var_10_18.name, "split") then
						var_10_18.gameObject:SetActive(true)
					else
						var_10_18.gameObject:SetActive(false)
					end
				end
			end

			local var_10_19 = 0.001

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_19 then
				local var_10_20 = (arg_7_1.time_ - var_10_16) / var_10_19
				local var_10_21 = Vector3.New(0, -390, -290)

				var_10_15.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10062, var_10_21, var_10_20)
			end

			if arg_7_1.time_ >= var_10_16 + var_10_19 and arg_7_1.time_ < var_10_16 + var_10_19 + arg_10_0 then
				var_10_15.localPosition = Vector3.New(0, -390, -290)
			end

			local var_10_22 = arg_7_1.actors_["10062"]
			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 and arg_7_1.var_.actorSpriteComps10062 == nil then
				arg_7_1.var_.actorSpriteComps10062 = var_10_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_24 = 0.034

			if var_10_23 <= arg_7_1.time_ and arg_7_1.time_ < var_10_23 + var_10_24 then
				local var_10_25 = (arg_7_1.time_ - var_10_23) / var_10_24

				if arg_7_1.var_.actorSpriteComps10062 then
					for iter_10_6, iter_10_7 in pairs(arg_7_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_10_7 then
							local var_10_26 = Mathf.Lerp(iter_10_7.color.r, 0.5, var_10_25)

							iter_10_7.color = Color.New(var_10_26, var_10_26, var_10_26)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_23 + var_10_24 and arg_7_1.time_ < var_10_23 + var_10_24 + arg_10_0 and arg_7_1.var_.actorSpriteComps10062 then
				local var_10_27 = 0.5

				for iter_10_8, iter_10_9 in pairs(arg_7_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_10_9 then
						iter_10_9.color = Color.New(var_10_27, var_10_27, var_10_27)
					end
				end

				arg_7_1.var_.actorSpriteComps10062 = nil
			end

			local var_10_28 = 0
			local var_10_29 = 1.1

			if var_10_28 < arg_7_1.time_ and arg_7_1.time_ <= var_10_28 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_30 = arg_7_1:GetWordFromCfg(410111002)
				local var_10_31 = arg_7_1:FormatText(var_10_30.content)

				arg_7_1.text_.text = var_10_31

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_32 = 44
				local var_10_33 = utf8.len(var_10_31)
				local var_10_34 = var_10_32 <= 0 and var_10_29 or var_10_29 * (var_10_33 / var_10_32)

				if var_10_34 > 0 and var_10_29 < var_10_34 then
					arg_7_1.talkMaxDuration = var_10_34

					if var_10_34 + var_10_28 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_34 + var_10_28
					end
				end

				arg_7_1.text_.text = var_10_31
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_35 = math.max(var_10_29, arg_7_1.talkMaxDuration)

			if var_10_28 <= arg_7_1.time_ and arg_7_1.time_ < var_10_28 + var_10_35 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_28) / var_10_35

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_28 + var_10_35 and arg_7_1.time_ < var_10_28 + var_10_35 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410111003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410111003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play410111004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.575

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

				local var_14_2 = arg_11_1:GetWordFromCfg(410111003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 63
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
	Play410111004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410111004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play410111005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.225

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(410111004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 49
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play410111005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410111005
		arg_19_1.duration_ = 4.9

		local var_19_0 = {
			zh = 4.3,
			ja = 4.9
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
				arg_19_0:Play410111006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10062"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps10062 == nil then
				arg_19_1.var_.actorSpriteComps10062 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps10062 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 1, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10062 then
				local var_22_5 = 1

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps10062 = nil
			end

			local var_22_6 = 0
			local var_22_7 = 0.45

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[600].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(410111005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111005", "story_v_out_410111.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_410111", "410111005", "story_v_out_410111.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_410111", "410111005", "story_v_out_410111.awb")

						arg_19_1:RecordAudio("410111005", var_22_15)
						arg_19_1:RecordAudio("410111005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410111", "410111005", "story_v_out_410111.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410111", "410111005", "story_v_out_410111.awb")
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
	Play410111006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410111006
		arg_23_1.duration_ = 12.433

		local var_23_0 = {
			zh = 8.866,
			ja = 12.433
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
				arg_23_0:Play410111007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.925

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[600].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(410111006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 38
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111006", "story_v_out_410111.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111006", "story_v_out_410111.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_410111", "410111006", "story_v_out_410111.awb")

						arg_23_1:RecordAudio("410111006", var_26_9)
						arg_23_1:RecordAudio("410111006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410111", "410111006", "story_v_out_410111.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410111", "410111006", "story_v_out_410111.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_10 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_10 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_10

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_10 and arg_23_1.time_ < var_26_0 + var_26_10 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410111007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410111007
		arg_27_1.duration_ = 6.033

		local var_27_0 = {
			zh = 4.8,
			ja = 6.033
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
				arg_27_0:Play410111008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.4

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[600].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(410111007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 16
				local var_30_6 = utf8.len(var_30_4)
				local var_30_7 = var_30_5 <= 0 and var_30_1 or var_30_1 * (var_30_6 / var_30_5)

				if var_30_7 > 0 and var_30_1 < var_30_7 then
					arg_27_1.talkMaxDuration = var_30_7

					if var_30_7 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_7 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_4
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111007", "story_v_out_410111.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111007", "story_v_out_410111.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_410111", "410111007", "story_v_out_410111.awb")

						arg_27_1:RecordAudio("410111007", var_30_9)
						arg_27_1:RecordAudio("410111007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410111", "410111007", "story_v_out_410111.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410111", "410111007", "story_v_out_410111.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_10 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_10 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_10

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_10 and arg_27_1.time_ < var_30_0 + var_30_10 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410111008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410111008
		arg_31_1.duration_ = 11.3

		local var_31_0 = {
			zh = 5.2,
			ja = 11.3
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
				arg_31_0:Play410111009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10062"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10062 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10062", 2)

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
				local var_34_6 = Vector3.New(-370, -390, -290)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10062, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_34_7 = arg_31_1.actors_["1060"].transform
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 then
				arg_31_1.var_.moveOldPos1060 = var_34_7.localPosition
				var_34_7.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1060", 4)

				local var_34_9 = var_34_7.childCount

				for iter_34_1 = 0, var_34_9 - 1 do
					local var_34_10 = var_34_7:GetChild(iter_34_1)

					if var_34_10.name == "" or not string.find(var_34_10.name, "split") then
						var_34_10.gameObject:SetActive(true)
					else
						var_34_10.gameObject:SetActive(false)
					end
				end
			end

			local var_34_11 = 0.001

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_8) / var_34_11
				local var_34_13 = Vector3.New(390, -435, -40)

				var_34_7.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1060, var_34_13, var_34_12)
			end

			if arg_31_1.time_ >= var_34_8 + var_34_11 and arg_31_1.time_ < var_34_8 + var_34_11 + arg_34_0 then
				var_34_7.localPosition = Vector3.New(390, -435, -40)
			end

			local var_34_14 = arg_31_1.actors_["10062"]
			local var_34_15 = 0

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 and arg_31_1.var_.actorSpriteComps10062 == nil then
				arg_31_1.var_.actorSpriteComps10062 = var_34_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_16 = 0.034

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_16 then
				local var_34_17 = (arg_31_1.time_ - var_34_15) / var_34_16

				if arg_31_1.var_.actorSpriteComps10062 then
					for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_34_3 then
							local var_34_18 = Mathf.Lerp(iter_34_3.color.r, 0.5, var_34_17)

							iter_34_3.color = Color.New(var_34_18, var_34_18, var_34_18)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_15 + var_34_16 and arg_31_1.time_ < var_34_15 + var_34_16 + arg_34_0 and arg_31_1.var_.actorSpriteComps10062 then
				local var_34_19 = 0.5

				for iter_34_4, iter_34_5 in pairs(arg_31_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_34_5 then
						iter_34_5.color = Color.New(var_34_19, var_34_19, var_34_19)
					end
				end

				arg_31_1.var_.actorSpriteComps10062 = nil
			end

			local var_34_20 = arg_31_1.actors_["1060"]
			local var_34_21 = 0

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 == nil then
				arg_31_1.var_.actorSpriteComps1060 = var_34_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_22 = 0.034

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22

				if arg_31_1.var_.actorSpriteComps1060 then
					for iter_34_6, iter_34_7 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_34_7 then
							local var_34_24 = Mathf.Lerp(iter_34_7.color.r, 1, var_34_23)

							iter_34_7.color = Color.New(var_34_24, var_34_24, var_34_24)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 then
				local var_34_25 = 1

				for iter_34_8, iter_34_9 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_34_9 then
						iter_34_9.color = Color.New(var_34_25, var_34_25, var_34_25)
					end
				end

				arg_31_1.var_.actorSpriteComps1060 = nil
			end

			local var_34_26 = 0
			local var_34_27 = 0.575

			if var_34_26 < arg_31_1.time_ and arg_31_1.time_ <= var_34_26 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_28 = arg_31_1:FormatText(StoryNameCfg[584].name)

				arg_31_1.leftNameTxt_.text = var_34_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_29 = arg_31_1:GetWordFromCfg(410111008)
				local var_34_30 = arg_31_1:FormatText(var_34_29.content)

				arg_31_1.text_.text = var_34_30

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_31 = 23
				local var_34_32 = utf8.len(var_34_30)
				local var_34_33 = var_34_31 <= 0 and var_34_27 or var_34_27 * (var_34_32 / var_34_31)

				if var_34_33 > 0 and var_34_27 < var_34_33 then
					arg_31_1.talkMaxDuration = var_34_33

					if var_34_33 + var_34_26 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_33 + var_34_26
					end
				end

				arg_31_1.text_.text = var_34_30
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111008", "story_v_out_410111.awb") ~= 0 then
					local var_34_34 = manager.audio:GetVoiceLength("story_v_out_410111", "410111008", "story_v_out_410111.awb") / 1000

					if var_34_34 + var_34_26 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_34 + var_34_26
					end

					if var_34_29.prefab_name ~= "" and arg_31_1.actors_[var_34_29.prefab_name] ~= nil then
						local var_34_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_29.prefab_name].transform, "story_v_out_410111", "410111008", "story_v_out_410111.awb")

						arg_31_1:RecordAudio("410111008", var_34_35)
						arg_31_1:RecordAudio("410111008", var_34_35)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410111", "410111008", "story_v_out_410111.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410111", "410111008", "story_v_out_410111.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_36 = math.max(var_34_27, arg_31_1.talkMaxDuration)

			if var_34_26 <= arg_31_1.time_ and arg_31_1.time_ < var_34_26 + var_34_36 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_26) / var_34_36

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_26 + var_34_36 and arg_31_1.time_ < var_34_26 + var_34_36 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play410111009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410111009
		arg_35_1.duration_ = 11.133

		local var_35_0 = {
			zh = 8.933,
			ja = 11.133
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
				arg_35_0:Play410111010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.05

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[584].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(410111009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111009", "story_v_out_410111.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111009", "story_v_out_410111.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_410111", "410111009", "story_v_out_410111.awb")

						arg_35_1:RecordAudio("410111009", var_38_9)
						arg_35_1:RecordAudio("410111009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410111", "410111009", "story_v_out_410111.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410111", "410111009", "story_v_out_410111.awb")
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
	Play410111010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410111010
		arg_39_1.duration_ = 17.533

		local var_39_0 = {
			zh = 10.3,
			ja = 17.533
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
				arg_39_0:Play410111011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10062"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10062 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10062", 2)

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
				local var_42_6 = Vector3.New(-370, -390, -290)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10062, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_42_7 = arg_39_1.actors_["10062"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps10062 == nil then
				arg_39_1.var_.actorSpriteComps10062 = var_42_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_9 = 0.034

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_9 then
				local var_42_10 = (arg_39_1.time_ - var_42_8) / var_42_9

				if arg_39_1.var_.actorSpriteComps10062 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_42_2 then
							local var_42_11 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_10)

							iter_42_2.color = Color.New(var_42_11, var_42_11, var_42_11)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_9 and arg_39_1.time_ < var_42_8 + var_42_9 + arg_42_0 and arg_39_1.var_.actorSpriteComps10062 then
				local var_42_12 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_12, var_42_12, var_42_12)
					end
				end

				arg_39_1.var_.actorSpriteComps10062 = nil
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
			local var_42_20 = 0.95

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_21 = arg_39_1:FormatText(StoryNameCfg[600].name)

				arg_39_1.leftNameTxt_.text = var_42_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_22 = arg_39_1:GetWordFromCfg(410111010)
				local var_42_23 = arg_39_1:FormatText(var_42_22.content)

				arg_39_1.text_.text = var_42_23

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_24 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111010", "story_v_out_410111.awb") ~= 0 then
					local var_42_27 = manager.audio:GetVoiceLength("story_v_out_410111", "410111010", "story_v_out_410111.awb") / 1000

					if var_42_27 + var_42_19 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_27 + var_42_19
					end

					if var_42_22.prefab_name ~= "" and arg_39_1.actors_[var_42_22.prefab_name] ~= nil then
						local var_42_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_22.prefab_name].transform, "story_v_out_410111", "410111010", "story_v_out_410111.awb")

						arg_39_1:RecordAudio("410111010", var_42_28)
						arg_39_1:RecordAudio("410111010", var_42_28)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410111", "410111010", "story_v_out_410111.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410111", "410111010", "story_v_out_410111.awb")
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
	Play410111011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410111011
		arg_43_1.duration_ = 6.966

		local var_43_0 = {
			zh = 3.8,
			ja = 6.966
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
				arg_43_0:Play410111012(arg_43_1)
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

			local var_46_13 = arg_43_1.actors_["10062"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps10062 == nil then
				arg_43_1.var_.actorSpriteComps10062 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.034

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps10062 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps10062 then
				local var_46_18 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps10062 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.425

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

				local var_46_22 = arg_43_1:GetWordFromCfg(410111011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111011", "story_v_out_410111.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_410111", "410111011", "story_v_out_410111.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_410111", "410111011", "story_v_out_410111.awb")

						arg_43_1:RecordAudio("410111011", var_46_28)
						arg_43_1:RecordAudio("410111011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410111", "410111011", "story_v_out_410111.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410111", "410111011", "story_v_out_410111.awb")
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
	Play410111012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410111012
		arg_47_1.duration_ = 8.533

		local var_47_0 = {
			zh = 4.5,
			ja = 8.533
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
				arg_47_0:Play410111013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10062"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 == nil then
				arg_47_1.var_.actorSpriteComps10062 = var_50_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_2 = 0.034

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.actorSpriteComps10062 then
					for iter_50_0, iter_50_1 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_50_1 then
							local var_50_4 = Mathf.Lerp(iter_50_1.color.r, 1, var_50_3)

							iter_50_1.color = Color.New(var_50_4, var_50_4, var_50_4)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 then
				local var_50_5 = 1

				for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_50_3 then
						iter_50_3.color = Color.New(var_50_5, var_50_5, var_50_5)
					end
				end

				arg_47_1.var_.actorSpriteComps10062 = nil
			end

			local var_50_6 = arg_47_1.actors_["1060"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 == nil then
				arg_47_1.var_.actorSpriteComps1060 = var_50_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_8 = 0.034

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.actorSpriteComps1060 then
					for iter_50_4, iter_50_5 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_50_5 then
							local var_50_10 = Mathf.Lerp(iter_50_5.color.r, 0.5, var_50_9)

							iter_50_5.color = Color.New(var_50_10, var_50_10, var_50_10)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps1060 then
				local var_50_11 = 0.5

				for iter_50_6, iter_50_7 in pairs(arg_47_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_50_7 then
						iter_50_7.color = Color.New(var_50_11, var_50_11, var_50_11)
					end
				end

				arg_47_1.var_.actorSpriteComps1060 = nil
			end

			local var_50_12 = 0
			local var_50_13 = 0.3

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[600].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(410111012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 12
				local var_50_18 = utf8.len(var_50_16)
				local var_50_19 = var_50_17 <= 0 and var_50_13 or var_50_13 * (var_50_18 / var_50_17)

				if var_50_19 > 0 and var_50_13 < var_50_19 then
					arg_47_1.talkMaxDuration = var_50_19

					if var_50_19 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_12
					end
				end

				arg_47_1.text_.text = var_50_16
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111012", "story_v_out_410111.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111012", "story_v_out_410111.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_410111", "410111012", "story_v_out_410111.awb")

						arg_47_1:RecordAudio("410111012", var_50_21)
						arg_47_1:RecordAudio("410111012", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410111", "410111012", "story_v_out_410111.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410111", "410111012", "story_v_out_410111.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_22 = math.max(var_50_13, arg_47_1.talkMaxDuration)

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_22 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_12) / var_50_22

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_12 + var_50_22 and arg_47_1.time_ < var_50_12 + var_50_22 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410111013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410111013
		arg_51_1.duration_ = 3.933

		local var_51_0 = {
			zh = 3.3,
			ja = 3.933
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
				arg_51_0:Play410111014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1060"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1060 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1060", 4)

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
				local var_54_6 = Vector3.New(390, -435, -40)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1060, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(390, -435, -40)
			end

			local var_54_7 = arg_51_1.actors_["1060"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 == nil then
				arg_51_1.var_.actorSpriteComps1060 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.034

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps1060 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 then
				local var_54_12 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps1060 = nil
			end

			local var_54_13 = arg_51_1.actors_["10062"]
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 == nil then
				arg_51_1.var_.actorSpriteComps10062 = var_54_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_15 = 0.034

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15

				if arg_51_1.var_.actorSpriteComps10062 then
					for iter_54_5, iter_54_6 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_54_6 then
							local var_54_17 = Mathf.Lerp(iter_54_6.color.r, 0.5, var_54_16)

							iter_54_6.color = Color.New(var_54_17, var_54_17, var_54_17)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 then
				local var_54_18 = 0.5

				for iter_54_7, iter_54_8 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_54_8 then
						iter_54_8.color = Color.New(var_54_18, var_54_18, var_54_18)
					end
				end

				arg_51_1.var_.actorSpriteComps10062 = nil
			end

			local var_54_19 = 0
			local var_54_20 = 0.25

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_21 = arg_51_1:FormatText(StoryNameCfg[584].name)

				arg_51_1.leftNameTxt_.text = var_54_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_22 = arg_51_1:GetWordFromCfg(410111013)
				local var_54_23 = arg_51_1:FormatText(var_54_22.content)

				arg_51_1.text_.text = var_54_23

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_24 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111013", "story_v_out_410111.awb") ~= 0 then
					local var_54_27 = manager.audio:GetVoiceLength("story_v_out_410111", "410111013", "story_v_out_410111.awb") / 1000

					if var_54_27 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_19
					end

					if var_54_22.prefab_name ~= "" and arg_51_1.actors_[var_54_22.prefab_name] ~= nil then
						local var_54_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_22.prefab_name].transform, "story_v_out_410111", "410111013", "story_v_out_410111.awb")

						arg_51_1:RecordAudio("410111013", var_54_28)
						arg_51_1:RecordAudio("410111013", var_54_28)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410111", "410111013", "story_v_out_410111.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410111", "410111013", "story_v_out_410111.awb")
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
	Play410111014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410111014
		arg_55_1.duration_ = 7.3

		local var_55_0 = {
			zh = 5.8,
			ja = 7.3
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
				arg_55_0:Play410111015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10062"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps10062 == nil then
				arg_55_1.var_.actorSpriteComps10062 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.034

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps10062 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 1, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps10062 then
				local var_58_5 = 1

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps10062 = nil
			end

			local var_58_6 = arg_55_1.actors_["1060"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 == nil then
				arg_55_1.var_.actorSpriteComps1060 = var_58_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_8 = 0.034

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.actorSpriteComps1060 then
					for iter_58_4, iter_58_5 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_58_5 then
							local var_58_10 = Mathf.Lerp(iter_58_5.color.r, 0.5, var_58_9)

							iter_58_5.color = Color.New(var_58_10, var_58_10, var_58_10)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 then
				local var_58_11 = 0.5

				for iter_58_6, iter_58_7 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_58_7 then
						iter_58_7.color = Color.New(var_58_11, var_58_11, var_58_11)
					end
				end

				arg_55_1.var_.actorSpriteComps1060 = nil
			end

			local var_58_12 = 0
			local var_58_13 = 0.575

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[600].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(410111014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 23
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111014", "story_v_out_410111.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111014", "story_v_out_410111.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_410111", "410111014", "story_v_out_410111.awb")

						arg_55_1:RecordAudio("410111014", var_58_21)
						arg_55_1:RecordAudio("410111014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410111", "410111014", "story_v_out_410111.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410111", "410111014", "story_v_out_410111.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410111015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410111015
		arg_59_1.duration_ = 3.466

		local var_59_0 = {
			zh = 1.866,
			ja = 3.466
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
				arg_59_0:Play410111016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10062"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos10062 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10062", 2)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(-370, -390, -290)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10062, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_62_7 = arg_59_1.actors_["1060"].transform
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 then
				arg_59_1.var_.moveOldPos1060 = var_62_7.localPosition
				var_62_7.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1060", 7)

				local var_62_9 = var_62_7.childCount

				for iter_62_1 = 0, var_62_9 - 1 do
					local var_62_10 = var_62_7:GetChild(iter_62_1)

					if var_62_10.name == "" or not string.find(var_62_10.name, "split") then
						var_62_10.gameObject:SetActive(true)
					else
						var_62_10.gameObject:SetActive(false)
					end
				end
			end

			local var_62_11 = 0.001

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_8) / var_62_11
				local var_62_13 = Vector3.New(0, -2000, -40)

				var_62_7.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1060, var_62_13, var_62_12)
			end

			if arg_59_1.time_ >= var_62_8 + var_62_11 and arg_59_1.time_ < var_62_8 + var_62_11 + arg_62_0 then
				var_62_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_62_14 = "10059"

			if arg_59_1.actors_[var_62_14] == nil then
				local var_62_15 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_62_14), arg_59_1.canvasGo_.transform)

				var_62_15.transform:SetSiblingIndex(1)

				var_62_15.name = var_62_14
				var_62_15.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_59_1.actors_[var_62_14] = var_62_15
			end

			local var_62_16 = arg_59_1.actors_["10059"].transform
			local var_62_17 = 0

			if var_62_17 < arg_59_1.time_ and arg_59_1.time_ <= var_62_17 + arg_62_0 then
				arg_59_1.var_.moveOldPos10059 = var_62_16.localPosition
				var_62_16.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("10059", 4)

				local var_62_18 = var_62_16.childCount

				for iter_62_2 = 0, var_62_18 - 1 do
					local var_62_19 = var_62_16:GetChild(iter_62_2)

					if var_62_19.name == "" or not string.find(var_62_19.name, "split") then
						var_62_19.gameObject:SetActive(true)
					else
						var_62_19.gameObject:SetActive(false)
					end
				end
			end

			local var_62_20 = 0.001

			if var_62_17 <= arg_59_1.time_ and arg_59_1.time_ < var_62_17 + var_62_20 then
				local var_62_21 = (arg_59_1.time_ - var_62_17) / var_62_20
				local var_62_22 = Vector3.New(390, -530, 35)

				var_62_16.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos10059, var_62_22, var_62_21)
			end

			if arg_59_1.time_ >= var_62_17 + var_62_20 and arg_59_1.time_ < var_62_17 + var_62_20 + arg_62_0 then
				var_62_16.localPosition = Vector3.New(390, -530, 35)
			end

			local var_62_23 = arg_59_1.actors_["10062"]
			local var_62_24 = 0

			if var_62_24 < arg_59_1.time_ and arg_59_1.time_ <= var_62_24 + arg_62_0 and arg_59_1.var_.actorSpriteComps10062 == nil then
				arg_59_1.var_.actorSpriteComps10062 = var_62_23:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_25 = 0.034

			if var_62_24 <= arg_59_1.time_ and arg_59_1.time_ < var_62_24 + var_62_25 then
				local var_62_26 = (arg_59_1.time_ - var_62_24) / var_62_25

				if arg_59_1.var_.actorSpriteComps10062 then
					for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_62_4 then
							local var_62_27 = Mathf.Lerp(iter_62_4.color.r, 0.5, var_62_26)

							iter_62_4.color = Color.New(var_62_27, var_62_27, var_62_27)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_24 + var_62_25 and arg_59_1.time_ < var_62_24 + var_62_25 + arg_62_0 and arg_59_1.var_.actorSpriteComps10062 then
				local var_62_28 = 0.5

				for iter_62_5, iter_62_6 in pairs(arg_59_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_62_6 then
						iter_62_6.color = Color.New(var_62_28, var_62_28, var_62_28)
					end
				end

				arg_59_1.var_.actorSpriteComps10062 = nil
			end

			local var_62_29 = arg_59_1.actors_["1060"]
			local var_62_30 = 0

			if var_62_30 < arg_59_1.time_ and arg_59_1.time_ <= var_62_30 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 == nil then
				arg_59_1.var_.actorSpriteComps1060 = var_62_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_31 = 0.034

			if var_62_30 <= arg_59_1.time_ and arg_59_1.time_ < var_62_30 + var_62_31 then
				local var_62_32 = (arg_59_1.time_ - var_62_30) / var_62_31

				if arg_59_1.var_.actorSpriteComps1060 then
					for iter_62_7, iter_62_8 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_62_8 then
							local var_62_33 = Mathf.Lerp(iter_62_8.color.r, 0.5, var_62_32)

							iter_62_8.color = Color.New(var_62_33, var_62_33, var_62_33)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_30 + var_62_31 and arg_59_1.time_ < var_62_30 + var_62_31 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 then
				local var_62_34 = 0.5

				for iter_62_9, iter_62_10 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_62_10 then
						iter_62_10.color = Color.New(var_62_34, var_62_34, var_62_34)
					end
				end

				arg_59_1.var_.actorSpriteComps1060 = nil
			end

			local var_62_35 = arg_59_1.actors_["10059"]
			local var_62_36 = 0

			if var_62_36 < arg_59_1.time_ and arg_59_1.time_ <= var_62_36 + arg_62_0 and arg_59_1.var_.actorSpriteComps10059 == nil then
				arg_59_1.var_.actorSpriteComps10059 = var_62_35:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_37 = 0.034

			if var_62_36 <= arg_59_1.time_ and arg_59_1.time_ < var_62_36 + var_62_37 then
				local var_62_38 = (arg_59_1.time_ - var_62_36) / var_62_37

				if arg_59_1.var_.actorSpriteComps10059 then
					for iter_62_11, iter_62_12 in pairs(arg_59_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_62_12 then
							local var_62_39 = Mathf.Lerp(iter_62_12.color.r, 1, var_62_38)

							iter_62_12.color = Color.New(var_62_39, var_62_39, var_62_39)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_36 + var_62_37 and arg_59_1.time_ < var_62_36 + var_62_37 + arg_62_0 and arg_59_1.var_.actorSpriteComps10059 then
				local var_62_40 = 1

				for iter_62_13, iter_62_14 in pairs(arg_59_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_62_14 then
						iter_62_14.color = Color.New(var_62_40, var_62_40, var_62_40)
					end
				end

				arg_59_1.var_.actorSpriteComps10059 = nil
			end

			local var_62_41 = 0
			local var_62_42 = 0.225

			if var_62_41 < arg_59_1.time_ and arg_59_1.time_ <= var_62_41 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_43 = arg_59_1:FormatText(StoryNameCfg[596].name)

				arg_59_1.leftNameTxt_.text = var_62_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_44 = arg_59_1:GetWordFromCfg(410111015)
				local var_62_45 = arg_59_1:FormatText(var_62_44.content)

				arg_59_1.text_.text = var_62_45

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_46 = 9
				local var_62_47 = utf8.len(var_62_45)
				local var_62_48 = var_62_46 <= 0 and var_62_42 or var_62_42 * (var_62_47 / var_62_46)

				if var_62_48 > 0 and var_62_42 < var_62_48 then
					arg_59_1.talkMaxDuration = var_62_48

					if var_62_48 + var_62_41 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_48 + var_62_41
					end
				end

				arg_59_1.text_.text = var_62_45
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111015", "story_v_out_410111.awb") ~= 0 then
					local var_62_49 = manager.audio:GetVoiceLength("story_v_out_410111", "410111015", "story_v_out_410111.awb") / 1000

					if var_62_49 + var_62_41 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_49 + var_62_41
					end

					if var_62_44.prefab_name ~= "" and arg_59_1.actors_[var_62_44.prefab_name] ~= nil then
						local var_62_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_44.prefab_name].transform, "story_v_out_410111", "410111015", "story_v_out_410111.awb")

						arg_59_1:RecordAudio("410111015", var_62_50)
						arg_59_1:RecordAudio("410111015", var_62_50)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410111", "410111015", "story_v_out_410111.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410111", "410111015", "story_v_out_410111.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_51 = math.max(var_62_42, arg_59_1.talkMaxDuration)

			if var_62_41 <= arg_59_1.time_ and arg_59_1.time_ < var_62_41 + var_62_51 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_41) / var_62_51

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_41 + var_62_51 and arg_59_1.time_ < var_62_41 + var_62_51 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410111016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410111016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play410111017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1.3

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_2 = arg_63_1:GetWordFromCfg(410111016)
				local var_66_3 = arg_63_1:FormatText(var_66_2.content)

				arg_63_1.text_.text = var_66_3

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_4 = 52
				local var_66_5 = utf8.len(var_66_3)
				local var_66_6 = var_66_4 <= 0 and var_66_1 or var_66_1 * (var_66_5 / var_66_4)

				if var_66_6 > 0 and var_66_1 < var_66_6 then
					arg_63_1.talkMaxDuration = var_66_6

					if var_66_6 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_6 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_3
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_7 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_7 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_7

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_7 and arg_63_1.time_ < var_66_0 + var_66_7 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410111017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410111017
		arg_67_1.duration_ = 6.533

		local var_67_0 = {
			zh = 5.133,
			ja = 6.533
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
				arg_67_0:Play410111018(arg_67_1)
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

			local var_70_6 = arg_67_1.actors_["10062"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 and arg_67_1.var_.actorSpriteComps10062 == nil then
				arg_67_1.var_.actorSpriteComps10062 = var_70_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_8 = 0.034

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8

				if arg_67_1.var_.actorSpriteComps10062 then
					for iter_70_4, iter_70_5 in pairs(arg_67_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_70_5 then
							local var_70_10 = Mathf.Lerp(iter_70_5.color.r, 1, var_70_9)

							iter_70_5.color = Color.New(var_70_10, var_70_10, var_70_10)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps10062 then
				local var_70_11 = 1

				for iter_70_6, iter_70_7 in pairs(arg_67_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_70_7 then
						iter_70_7.color = Color.New(var_70_11, var_70_11, var_70_11)
					end
				end

				arg_67_1.var_.actorSpriteComps10062 = nil
			end

			local var_70_12 = 0
			local var_70_13 = 0.575

			if var_70_12 < arg_67_1.time_ and arg_67_1.time_ <= var_70_12 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_14 = arg_67_1:FormatText(StoryNameCfg[600].name)

				arg_67_1.leftNameTxt_.text = var_70_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_15 = arg_67_1:GetWordFromCfg(410111017)
				local var_70_16 = arg_67_1:FormatText(var_70_15.content)

				arg_67_1.text_.text = var_70_16

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_17 = 23
				local var_70_18 = utf8.len(var_70_16)
				local var_70_19 = var_70_17 <= 0 and var_70_13 or var_70_13 * (var_70_18 / var_70_17)

				if var_70_19 > 0 and var_70_13 < var_70_19 then
					arg_67_1.talkMaxDuration = var_70_19

					if var_70_19 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_12
					end
				end

				arg_67_1.text_.text = var_70_16
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111017", "story_v_out_410111.awb") ~= 0 then
					local var_70_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111017", "story_v_out_410111.awb") / 1000

					if var_70_20 + var_70_12 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_12
					end

					if var_70_15.prefab_name ~= "" and arg_67_1.actors_[var_70_15.prefab_name] ~= nil then
						local var_70_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_15.prefab_name].transform, "story_v_out_410111", "410111017", "story_v_out_410111.awb")

						arg_67_1:RecordAudio("410111017", var_70_21)
						arg_67_1:RecordAudio("410111017", var_70_21)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410111", "410111017", "story_v_out_410111.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410111", "410111017", "story_v_out_410111.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_22 = math.max(var_70_13, arg_67_1.talkMaxDuration)

			if var_70_12 <= arg_67_1.time_ and arg_67_1.time_ < var_70_12 + var_70_22 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_12) / var_70_22

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_12 + var_70_22 and arg_67_1.time_ < var_70_12 + var_70_22 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410111018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410111018
		arg_71_1.duration_ = 16.866

		local var_71_0 = {
			zh = 11.033,
			ja = 16.866
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
				arg_71_0:Play410111019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10059"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.actorSpriteComps10059 == nil then
				arg_71_1.var_.actorSpriteComps10059 = var_74_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_2 = 0.034

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.actorSpriteComps10059 then
					for iter_74_0, iter_74_1 in pairs(arg_71_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_74_1 then
							local var_74_4 = Mathf.Lerp(iter_74_1.color.r, 1, var_74_3)

							iter_74_1.color = Color.New(var_74_4, var_74_4, var_74_4)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.actorSpriteComps10059 then
				local var_74_5 = 1

				for iter_74_2, iter_74_3 in pairs(arg_71_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_74_3 then
						iter_74_3.color = Color.New(var_74_5, var_74_5, var_74_5)
					end
				end

				arg_71_1.var_.actorSpriteComps10059 = nil
			end

			local var_74_6 = arg_71_1.actors_["10062"]
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 and arg_71_1.var_.actorSpriteComps10062 == nil then
				arg_71_1.var_.actorSpriteComps10062 = var_74_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_8 = 0.034

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / var_74_8

				if arg_71_1.var_.actorSpriteComps10062 then
					for iter_74_4, iter_74_5 in pairs(arg_71_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_74_5 then
							local var_74_10 = Mathf.Lerp(iter_74_5.color.r, 0.5, var_74_9)

							iter_74_5.color = Color.New(var_74_10, var_74_10, var_74_10)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps10062 then
				local var_74_11 = 0.5

				for iter_74_6, iter_74_7 in pairs(arg_71_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_74_7 then
						iter_74_7.color = Color.New(var_74_11, var_74_11, var_74_11)
					end
				end

				arg_71_1.var_.actorSpriteComps10062 = nil
			end

			local var_74_12 = 0
			local var_74_13 = 1.25

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_14 = arg_71_1:FormatText(StoryNameCfg[596].name)

				arg_71_1.leftNameTxt_.text = var_74_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_15 = arg_71_1:GetWordFromCfg(410111018)
				local var_74_16 = arg_71_1:FormatText(var_74_15.content)

				arg_71_1.text_.text = var_74_16

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_17 = 50
				local var_74_18 = utf8.len(var_74_16)
				local var_74_19 = var_74_17 <= 0 and var_74_13 or var_74_13 * (var_74_18 / var_74_17)

				if var_74_19 > 0 and var_74_13 < var_74_19 then
					arg_71_1.talkMaxDuration = var_74_19

					if var_74_19 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_16
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111018", "story_v_out_410111.awb") ~= 0 then
					local var_74_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111018", "story_v_out_410111.awb") / 1000

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end

					if var_74_15.prefab_name ~= "" and arg_71_1.actors_[var_74_15.prefab_name] ~= nil then
						local var_74_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_15.prefab_name].transform, "story_v_out_410111", "410111018", "story_v_out_410111.awb")

						arg_71_1:RecordAudio("410111018", var_74_21)
						arg_71_1:RecordAudio("410111018", var_74_21)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410111", "410111018", "story_v_out_410111.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410111", "410111018", "story_v_out_410111.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_12) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_12 + var_74_22 and arg_71_1.time_ < var_74_12 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410111019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410111019
		arg_75_1.duration_ = 5.6

		local var_75_0 = {
			zh = 1.333,
			ja = 5.6
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
				arg_75_0:Play410111020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10059"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.actorSpriteComps10059 == nil then
				arg_75_1.var_.actorSpriteComps10059 = var_78_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_2 = 0.034

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.actorSpriteComps10059 then
					for iter_78_0, iter_78_1 in pairs(arg_75_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_78_1 then
							local var_78_4 = Mathf.Lerp(iter_78_1.color.r, 0.5, var_78_3)

							iter_78_1.color = Color.New(var_78_4, var_78_4, var_78_4)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.actorSpriteComps10059 then
				local var_78_5 = 0.5

				for iter_78_2, iter_78_3 in pairs(arg_75_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_78_3 then
						iter_78_3.color = Color.New(var_78_5, var_78_5, var_78_5)
					end
				end

				arg_75_1.var_.actorSpriteComps10059 = nil
			end

			local var_78_6 = arg_75_1.actors_["1060"]
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 == nil then
				arg_75_1.var_.actorSpriteComps1060 = var_78_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_8 = 0.034

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8

				if arg_75_1.var_.actorSpriteComps1060 then
					for iter_78_4, iter_78_5 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_78_5 then
							local var_78_10 = Mathf.Lerp(iter_78_5.color.r, 1, var_78_9)

							iter_78_5.color = Color.New(var_78_10, var_78_10, var_78_10)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_7 + var_78_8 and arg_75_1.time_ < var_78_7 + var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 then
				local var_78_11 = 1

				for iter_78_6, iter_78_7 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_78_7 then
						iter_78_7.color = Color.New(var_78_11, var_78_11, var_78_11)
					end
				end

				arg_75_1.var_.actorSpriteComps1060 = nil
			end

			local var_78_12 = arg_75_1.actors_["10062"].transform
			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1.var_.moveOldPos10062 = var_78_12.localPosition
				var_78_12.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10062", 7)

				local var_78_14 = var_78_12.childCount

				for iter_78_8 = 0, var_78_14 - 1 do
					local var_78_15 = var_78_12:GetChild(iter_78_8)

					if var_78_15.name == "" or not string.find(var_78_15.name, "split") then
						var_78_15.gameObject:SetActive(true)
					else
						var_78_15.gameObject:SetActive(false)
					end
				end
			end

			local var_78_16 = 0.001

			if var_78_13 <= arg_75_1.time_ and arg_75_1.time_ < var_78_13 + var_78_16 then
				local var_78_17 = (arg_75_1.time_ - var_78_13) / var_78_16
				local var_78_18 = Vector3.New(0, -2000, -290)

				var_78_12.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10062, var_78_18, var_78_17)
			end

			if arg_75_1.time_ >= var_78_13 + var_78_16 and arg_75_1.time_ < var_78_13 + var_78_16 + arg_78_0 then
				var_78_12.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_78_19 = arg_75_1.actors_["10059"].transform
			local var_78_20 = 0

			if var_78_20 < arg_75_1.time_ and arg_75_1.time_ <= var_78_20 + arg_78_0 then
				arg_75_1.var_.moveOldPos10059 = var_78_19.localPosition
				var_78_19.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10059", 2)

				local var_78_21 = var_78_19.childCount

				for iter_78_9 = 0, var_78_21 - 1 do
					local var_78_22 = var_78_19:GetChild(iter_78_9)

					if var_78_22.name == "" or not string.find(var_78_22.name, "split") then
						var_78_22.gameObject:SetActive(true)
					else
						var_78_22.gameObject:SetActive(false)
					end
				end
			end

			local var_78_23 = 0.001

			if var_78_20 <= arg_75_1.time_ and arg_75_1.time_ < var_78_20 + var_78_23 then
				local var_78_24 = (arg_75_1.time_ - var_78_20) / var_78_23
				local var_78_25 = Vector3.New(-390, -530, 35)

				var_78_19.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10059, var_78_25, var_78_24)
			end

			if arg_75_1.time_ >= var_78_20 + var_78_23 and arg_75_1.time_ < var_78_20 + var_78_23 + arg_78_0 then
				var_78_19.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_78_26 = arg_75_1.actors_["1060"].transform
			local var_78_27 = 0

			if var_78_27 < arg_75_1.time_ and arg_75_1.time_ <= var_78_27 + arg_78_0 then
				arg_75_1.var_.moveOldPos1060 = var_78_26.localPosition
				var_78_26.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1060", 4)

				local var_78_28 = var_78_26.childCount

				for iter_78_10 = 0, var_78_28 - 1 do
					local var_78_29 = var_78_26:GetChild(iter_78_10)

					if var_78_29.name == "" or not string.find(var_78_29.name, "split") then
						var_78_29.gameObject:SetActive(true)
					else
						var_78_29.gameObject:SetActive(false)
					end
				end
			end

			local var_78_30 = 0.001

			if var_78_27 <= arg_75_1.time_ and arg_75_1.time_ < var_78_27 + var_78_30 then
				local var_78_31 = (arg_75_1.time_ - var_78_27) / var_78_30
				local var_78_32 = Vector3.New(390, -435, -40)

				var_78_26.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1060, var_78_32, var_78_31)
			end

			if arg_75_1.time_ >= var_78_27 + var_78_30 and arg_75_1.time_ < var_78_27 + var_78_30 + arg_78_0 then
				var_78_26.localPosition = Vector3.New(390, -435, -40)
			end

			local var_78_33 = 0
			local var_78_34 = 0.075

			if var_78_33 < arg_75_1.time_ and arg_75_1.time_ <= var_78_33 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_35 = arg_75_1:FormatText(StoryNameCfg[584].name)

				arg_75_1.leftNameTxt_.text = var_78_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_36 = arg_75_1:GetWordFromCfg(410111019)
				local var_78_37 = arg_75_1:FormatText(var_78_36.content)

				arg_75_1.text_.text = var_78_37

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_38 = 3
				local var_78_39 = utf8.len(var_78_37)
				local var_78_40 = var_78_38 <= 0 and var_78_34 or var_78_34 * (var_78_39 / var_78_38)

				if var_78_40 > 0 and var_78_34 < var_78_40 then
					arg_75_1.talkMaxDuration = var_78_40

					if var_78_40 + var_78_33 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_40 + var_78_33
					end
				end

				arg_75_1.text_.text = var_78_37
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111019", "story_v_out_410111.awb") ~= 0 then
					local var_78_41 = manager.audio:GetVoiceLength("story_v_out_410111", "410111019", "story_v_out_410111.awb") / 1000

					if var_78_41 + var_78_33 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_41 + var_78_33
					end

					if var_78_36.prefab_name ~= "" and arg_75_1.actors_[var_78_36.prefab_name] ~= nil then
						local var_78_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_36.prefab_name].transform, "story_v_out_410111", "410111019", "story_v_out_410111.awb")

						arg_75_1:RecordAudio("410111019", var_78_42)
						arg_75_1:RecordAudio("410111019", var_78_42)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410111", "410111019", "story_v_out_410111.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410111", "410111019", "story_v_out_410111.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_43 = math.max(var_78_34, arg_75_1.talkMaxDuration)

			if var_78_33 <= arg_75_1.time_ and arg_75_1.time_ < var_78_33 + var_78_43 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_33) / var_78_43

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_33 + var_78_43 and arg_75_1.time_ < var_78_33 + var_78_43 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410111020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410111020
		arg_79_1.duration_ = 14.4

		local var_79_0 = {
			zh = 8.233,
			ja = 14.4
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
				arg_79_0:Play410111021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10062"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.actorSpriteComps10062 == nil then
				arg_79_1.var_.actorSpriteComps10062 = var_82_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_2 = 0.034

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.actorSpriteComps10062 then
					for iter_82_0, iter_82_1 in pairs(arg_79_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_82_1 then
							local var_82_4 = Mathf.Lerp(iter_82_1.color.r, 1, var_82_3)

							iter_82_1.color = Color.New(var_82_4, var_82_4, var_82_4)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.actorSpriteComps10062 then
				local var_82_5 = 1

				for iter_82_2, iter_82_3 in pairs(arg_79_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_82_3 then
						iter_82_3.color = Color.New(var_82_5, var_82_5, var_82_5)
					end
				end

				arg_79_1.var_.actorSpriteComps10062 = nil
			end

			local var_82_6 = arg_79_1.actors_["1060"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.actorSpriteComps1060 == nil then
				arg_79_1.var_.actorSpriteComps1060 = var_82_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_8 = 0.034

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.actorSpriteComps1060 then
					for iter_82_4, iter_82_5 in pairs(arg_79_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_82_5 then
							local var_82_10 = Mathf.Lerp(iter_82_5.color.r, 0.5, var_82_9)

							iter_82_5.color = Color.New(var_82_10, var_82_10, var_82_10)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps1060 then
				local var_82_11 = 0.5

				for iter_82_6, iter_82_7 in pairs(arg_79_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_82_7 then
						iter_82_7.color = Color.New(var_82_11, var_82_11, var_82_11)
					end
				end

				arg_79_1.var_.actorSpriteComps1060 = nil
			end

			local var_82_12 = arg_79_1.actors_["10062"].transform
			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1.var_.moveOldPos10062 = var_82_12.localPosition
				var_82_12.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("10062", 4)

				local var_82_14 = var_82_12.childCount

				for iter_82_8 = 0, var_82_14 - 1 do
					local var_82_15 = var_82_12:GetChild(iter_82_8)

					if var_82_15.name == "" or not string.find(var_82_15.name, "split") then
						var_82_15.gameObject:SetActive(true)
					else
						var_82_15.gameObject:SetActive(false)
					end
				end
			end

			local var_82_16 = 0.001

			if var_82_13 <= arg_79_1.time_ and arg_79_1.time_ < var_82_13 + var_82_16 then
				local var_82_17 = (arg_79_1.time_ - var_82_13) / var_82_16
				local var_82_18 = Vector3.New(370, -390, -290)

				var_82_12.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10062, var_82_18, var_82_17)
			end

			if arg_79_1.time_ >= var_82_13 + var_82_16 and arg_79_1.time_ < var_82_13 + var_82_16 + arg_82_0 then
				var_82_12.localPosition = Vector3.New(370, -390, -290)
			end

			local var_82_19 = arg_79_1.actors_["1060"].transform
			local var_82_20 = 0

			if var_82_20 < arg_79_1.time_ and arg_79_1.time_ <= var_82_20 + arg_82_0 then
				arg_79_1.var_.moveOldPos1060 = var_82_19.localPosition
				var_82_19.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1060", 2)

				local var_82_21 = var_82_19.childCount

				for iter_82_9 = 0, var_82_21 - 1 do
					local var_82_22 = var_82_19:GetChild(iter_82_9)

					if var_82_22.name == "" or not string.find(var_82_22.name, "split") then
						var_82_22.gameObject:SetActive(true)
					else
						var_82_22.gameObject:SetActive(false)
					end
				end
			end

			local var_82_23 = 0.001

			if var_82_20 <= arg_79_1.time_ and arg_79_1.time_ < var_82_20 + var_82_23 then
				local var_82_24 = (arg_79_1.time_ - var_82_20) / var_82_23
				local var_82_25 = Vector3.New(-390, -435, -40)

				var_82_19.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1060, var_82_25, var_82_24)
			end

			if arg_79_1.time_ >= var_82_20 + var_82_23 and arg_79_1.time_ < var_82_20 + var_82_23 + arg_82_0 then
				var_82_19.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_82_26 = arg_79_1.actors_["10059"].transform
			local var_82_27 = 0

			if var_82_27 < arg_79_1.time_ and arg_79_1.time_ <= var_82_27 + arg_82_0 then
				arg_79_1.var_.moveOldPos10059 = var_82_26.localPosition
				var_82_26.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("10059", 7)

				local var_82_28 = var_82_26.childCount

				for iter_82_10 = 0, var_82_28 - 1 do
					local var_82_29 = var_82_26:GetChild(iter_82_10)

					if var_82_29.name == "" or not string.find(var_82_29.name, "split") then
						var_82_29.gameObject:SetActive(true)
					else
						var_82_29.gameObject:SetActive(false)
					end
				end
			end

			local var_82_30 = 0.001

			if var_82_27 <= arg_79_1.time_ and arg_79_1.time_ < var_82_27 + var_82_30 then
				local var_82_31 = (arg_79_1.time_ - var_82_27) / var_82_30
				local var_82_32 = Vector3.New(0, -2000, 35)

				var_82_26.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10059, var_82_32, var_82_31)
			end

			if arg_79_1.time_ >= var_82_27 + var_82_30 and arg_79_1.time_ < var_82_27 + var_82_30 + arg_82_0 then
				var_82_26.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_82_33 = 0
			local var_82_34 = 0.925

			if var_82_33 < arg_79_1.time_ and arg_79_1.time_ <= var_82_33 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_35 = arg_79_1:FormatText(StoryNameCfg[600].name)

				arg_79_1.leftNameTxt_.text = var_82_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_36 = arg_79_1:GetWordFromCfg(410111020)
				local var_82_37 = arg_79_1:FormatText(var_82_36.content)

				arg_79_1.text_.text = var_82_37

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_38 = 37
				local var_82_39 = utf8.len(var_82_37)
				local var_82_40 = var_82_38 <= 0 and var_82_34 or var_82_34 * (var_82_39 / var_82_38)

				if var_82_40 > 0 and var_82_34 < var_82_40 then
					arg_79_1.talkMaxDuration = var_82_40

					if var_82_40 + var_82_33 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_40 + var_82_33
					end
				end

				arg_79_1.text_.text = var_82_37
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111020", "story_v_out_410111.awb") ~= 0 then
					local var_82_41 = manager.audio:GetVoiceLength("story_v_out_410111", "410111020", "story_v_out_410111.awb") / 1000

					if var_82_41 + var_82_33 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_41 + var_82_33
					end

					if var_82_36.prefab_name ~= "" and arg_79_1.actors_[var_82_36.prefab_name] ~= nil then
						local var_82_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_36.prefab_name].transform, "story_v_out_410111", "410111020", "story_v_out_410111.awb")

						arg_79_1:RecordAudio("410111020", var_82_42)
						arg_79_1:RecordAudio("410111020", var_82_42)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410111", "410111020", "story_v_out_410111.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410111", "410111020", "story_v_out_410111.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_43 = math.max(var_82_34, arg_79_1.talkMaxDuration)

			if var_82_33 <= arg_79_1.time_ and arg_79_1.time_ < var_82_33 + var_82_43 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_33) / var_82_43

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_33 + var_82_43 and arg_79_1.time_ < var_82_33 + var_82_43 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play410111021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410111021
		arg_83_1.duration_ = 11.433

		local var_83_0 = {
			zh = 7.166,
			ja = 11.433
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
				arg_83_0:Play410111022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.7

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[600].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(410111021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 28
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111021", "story_v_out_410111.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111021", "story_v_out_410111.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_410111", "410111021", "story_v_out_410111.awb")

						arg_83_1:RecordAudio("410111021", var_86_9)
						arg_83_1:RecordAudio("410111021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410111", "410111021", "story_v_out_410111.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410111", "410111021", "story_v_out_410111.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410111022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410111022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play410111023(arg_87_1)
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

			local var_90_7 = arg_87_1.actors_["1060"].transform
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 then
				arg_87_1.var_.moveOldPos1060 = var_90_7.localPosition
				var_90_7.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1060", 7)

				local var_90_9 = var_90_7.childCount

				for iter_90_1 = 0, var_90_9 - 1 do
					local var_90_10 = var_90_7:GetChild(iter_90_1)

					if var_90_10.name == "" or not string.find(var_90_10.name, "split") then
						var_90_10.gameObject:SetActive(true)
					else
						var_90_10.gameObject:SetActive(false)
					end
				end
			end

			local var_90_11 = 0.001

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_8) / var_90_11
				local var_90_13 = Vector3.New(0, -2000, -40)

				var_90_7.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1060, var_90_13, var_90_12)
			end

			if arg_87_1.time_ >= var_90_8 + var_90_11 and arg_87_1.time_ < var_90_8 + var_90_11 + arg_90_0 then
				var_90_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_90_14 = arg_87_1.actors_["10062"]
			local var_90_15 = 0

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps10062 == nil then
				arg_87_1.var_.actorSpriteComps10062 = var_90_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_16 = 0.034

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_16 then
				local var_90_17 = (arg_87_1.time_ - var_90_15) / var_90_16

				if arg_87_1.var_.actorSpriteComps10062 then
					for iter_90_2, iter_90_3 in pairs(arg_87_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_90_3 then
							local var_90_18 = Mathf.Lerp(iter_90_3.color.r, 0.5, var_90_17)

							iter_90_3.color = Color.New(var_90_18, var_90_18, var_90_18)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_15 + var_90_16 and arg_87_1.time_ < var_90_15 + var_90_16 + arg_90_0 and arg_87_1.var_.actorSpriteComps10062 then
				local var_90_19 = 0.5

				for iter_90_4, iter_90_5 in pairs(arg_87_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_90_5 then
						iter_90_5.color = Color.New(var_90_19, var_90_19, var_90_19)
					end
				end

				arg_87_1.var_.actorSpriteComps10062 = nil
			end

			local var_90_20 = 0
			local var_90_21 = 0.7

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410111022)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 28
				local var_90_25 = utf8.len(var_90_23)
				local var_90_26 = var_90_24 <= 0 and var_90_21 or var_90_21 * (var_90_25 / var_90_24)

				if var_90_26 > 0 and var_90_21 < var_90_26 then
					arg_87_1.talkMaxDuration = var_90_26

					if var_90_26 + var_90_20 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_20
					end
				end

				arg_87_1.text_.text = var_90_23
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_27 = math.max(var_90_21, arg_87_1.talkMaxDuration)

			if var_90_20 <= arg_87_1.time_ and arg_87_1.time_ < var_90_20 + var_90_27 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_20) / var_90_27

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_20 + var_90_27 and arg_87_1.time_ < var_90_20 + var_90_27 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410111023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410111023
		arg_91_1.duration_ = 6.3

		local var_91_0 = {
			zh = 5.866,
			ja = 6.3
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
				arg_91_0:Play410111024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10059"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos10059 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("10059", 2)

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
				local var_94_6 = Vector3.New(-390, -530, 35)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10059, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_94_7 = arg_91_1.actors_["1060"].transform
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 then
				arg_91_1.var_.moveOldPos1060 = var_94_7.localPosition
				var_94_7.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1060", 4)

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
				local var_94_13 = Vector3.New(390, -435, -40)

				var_94_7.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1060, var_94_13, var_94_12)
			end

			if arg_91_1.time_ >= var_94_8 + var_94_11 and arg_91_1.time_ < var_94_8 + var_94_11 + arg_94_0 then
				var_94_7.localPosition = Vector3.New(390, -435, -40)
			end

			local var_94_14 = arg_91_1.actors_["1060"]
			local var_94_15 = 0

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 == nil then
				arg_91_1.var_.actorSpriteComps1060 = var_94_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_16 = 0.034

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_16 then
				local var_94_17 = (arg_91_1.time_ - var_94_15) / var_94_16

				if arg_91_1.var_.actorSpriteComps1060 then
					for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_94_3 then
							local var_94_18 = Mathf.Lerp(iter_94_3.color.r, 1, var_94_17)

							iter_94_3.color = Color.New(var_94_18, var_94_18, var_94_18)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_15 + var_94_16 and arg_91_1.time_ < var_94_15 + var_94_16 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 then
				local var_94_19 = 1

				for iter_94_4, iter_94_5 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_94_5 then
						iter_94_5.color = Color.New(var_94_19, var_94_19, var_94_19)
					end
				end

				arg_91_1.var_.actorSpriteComps1060 = nil
			end

			local var_94_20 = 0
			local var_94_21 = 0.425

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_22 = arg_91_1:FormatText(StoryNameCfg[584].name)

				arg_91_1.leftNameTxt_.text = var_94_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_23 = arg_91_1:GetWordFromCfg(410111023)
				local var_94_24 = arg_91_1:FormatText(var_94_23.content)

				arg_91_1.text_.text = var_94_24

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_25 = 17
				local var_94_26 = utf8.len(var_94_24)
				local var_94_27 = var_94_25 <= 0 and var_94_21 or var_94_21 * (var_94_26 / var_94_25)

				if var_94_27 > 0 and var_94_21 < var_94_27 then
					arg_91_1.talkMaxDuration = var_94_27

					if var_94_27 + var_94_20 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_27 + var_94_20
					end
				end

				arg_91_1.text_.text = var_94_24
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111023", "story_v_out_410111.awb") ~= 0 then
					local var_94_28 = manager.audio:GetVoiceLength("story_v_out_410111", "410111023", "story_v_out_410111.awb") / 1000

					if var_94_28 + var_94_20 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_28 + var_94_20
					end

					if var_94_23.prefab_name ~= "" and arg_91_1.actors_[var_94_23.prefab_name] ~= nil then
						local var_94_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_23.prefab_name].transform, "story_v_out_410111", "410111023", "story_v_out_410111.awb")

						arg_91_1:RecordAudio("410111023", var_94_29)
						arg_91_1:RecordAudio("410111023", var_94_29)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410111", "410111023", "story_v_out_410111.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410111", "410111023", "story_v_out_410111.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_30 = math.max(var_94_21, arg_91_1.talkMaxDuration)

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_30 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_20) / var_94_30

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_20 + var_94_30 and arg_91_1.time_ < var_94_20 + var_94_30 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410111024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410111024
		arg_95_1.duration_ = 4.1

		local var_95_0 = {
			zh = 4.033,
			ja = 4.1
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
				arg_95_0:Play410111025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10059"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.actorSpriteComps10059 == nil then
				arg_95_1.var_.actorSpriteComps10059 = var_98_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_2 = 0.034

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.actorSpriteComps10059 then
					for iter_98_0, iter_98_1 in pairs(arg_95_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_98_1 then
							local var_98_4 = Mathf.Lerp(iter_98_1.color.r, 1, var_98_3)

							iter_98_1.color = Color.New(var_98_4, var_98_4, var_98_4)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.actorSpriteComps10059 then
				local var_98_5 = 1

				for iter_98_2, iter_98_3 in pairs(arg_95_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_98_3 then
						iter_98_3.color = Color.New(var_98_5, var_98_5, var_98_5)
					end
				end

				arg_95_1.var_.actorSpriteComps10059 = nil
			end

			local var_98_6 = arg_95_1.actors_["1060"]
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 == nil then
				arg_95_1.var_.actorSpriteComps1060 = var_98_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_8 = 0.034

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_7) / var_98_8

				if arg_95_1.var_.actorSpriteComps1060 then
					for iter_98_4, iter_98_5 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_98_5 then
							local var_98_10 = Mathf.Lerp(iter_98_5.color.r, 0.5, var_98_9)

							iter_98_5.color = Color.New(var_98_10, var_98_10, var_98_10)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_7 + var_98_8 and arg_95_1.time_ < var_98_7 + var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 then
				local var_98_11 = 0.5

				for iter_98_6, iter_98_7 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_98_7 then
						iter_98_7.color = Color.New(var_98_11, var_98_11, var_98_11)
					end
				end

				arg_95_1.var_.actorSpriteComps1060 = nil
			end

			local var_98_12 = 0
			local var_98_13 = 0.45

			if var_98_12 < arg_95_1.time_ and arg_95_1.time_ <= var_98_12 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_14 = arg_95_1:FormatText(StoryNameCfg[596].name)

				arg_95_1.leftNameTxt_.text = var_98_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_15 = arg_95_1:GetWordFromCfg(410111024)
				local var_98_16 = arg_95_1:FormatText(var_98_15.content)

				arg_95_1.text_.text = var_98_16

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_17 = 18
				local var_98_18 = utf8.len(var_98_16)
				local var_98_19 = var_98_17 <= 0 and var_98_13 or var_98_13 * (var_98_18 / var_98_17)

				if var_98_19 > 0 and var_98_13 < var_98_19 then
					arg_95_1.talkMaxDuration = var_98_19

					if var_98_19 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_19 + var_98_12
					end
				end

				arg_95_1.text_.text = var_98_16
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111024", "story_v_out_410111.awb") ~= 0 then
					local var_98_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111024", "story_v_out_410111.awb") / 1000

					if var_98_20 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_12
					end

					if var_98_15.prefab_name ~= "" and arg_95_1.actors_[var_98_15.prefab_name] ~= nil then
						local var_98_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_15.prefab_name].transform, "story_v_out_410111", "410111024", "story_v_out_410111.awb")

						arg_95_1:RecordAudio("410111024", var_98_21)
						arg_95_1:RecordAudio("410111024", var_98_21)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410111", "410111024", "story_v_out_410111.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410111", "410111024", "story_v_out_410111.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_22 = math.max(var_98_13, arg_95_1.talkMaxDuration)

			if var_98_12 <= arg_95_1.time_ and arg_95_1.time_ < var_98_12 + var_98_22 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_12) / var_98_22

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_12 + var_98_22 and arg_95_1.time_ < var_98_12 + var_98_22 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410111025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410111025
		arg_99_1.duration_ = 11.766

		local var_99_0 = {
			zh = 7.5,
			ja = 11.766
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
				arg_99_0:Play410111026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1060"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 == nil then
				arg_99_1.var_.actorSpriteComps1060 = var_102_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_2 = 0.034

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.actorSpriteComps1060 then
					for iter_102_0, iter_102_1 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_102_1 then
							local var_102_4 = Mathf.Lerp(iter_102_1.color.r, 1, var_102_3)

							iter_102_1.color = Color.New(var_102_4, var_102_4, var_102_4)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 then
				local var_102_5 = 1

				for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_102_3 then
						iter_102_3.color = Color.New(var_102_5, var_102_5, var_102_5)
					end
				end

				arg_99_1.var_.actorSpriteComps1060 = nil
			end

			local var_102_6 = arg_99_1.actors_["10059"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.actorSpriteComps10059 == nil then
				arg_99_1.var_.actorSpriteComps10059 = var_102_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_8 = 0.034

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.actorSpriteComps10059 then
					for iter_102_4, iter_102_5 in pairs(arg_99_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_102_5 then
							local var_102_10 = Mathf.Lerp(iter_102_5.color.r, 0.5, var_102_9)

							iter_102_5.color = Color.New(var_102_10, var_102_10, var_102_10)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps10059 then
				local var_102_11 = 0.5

				for iter_102_6, iter_102_7 in pairs(arg_99_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_102_7 then
						iter_102_7.color = Color.New(var_102_11, var_102_11, var_102_11)
					end
				end

				arg_99_1.var_.actorSpriteComps10059 = nil
			end

			local var_102_12 = 0
			local var_102_13 = 0.775

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[584].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(410111025)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 31
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111025", "story_v_out_410111.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111025", "story_v_out_410111.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_410111", "410111025", "story_v_out_410111.awb")

						arg_99_1:RecordAudio("410111025", var_102_21)
						arg_99_1:RecordAudio("410111025", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410111", "410111025", "story_v_out_410111.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410111", "410111025", "story_v_out_410111.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_22 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_22 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_22

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_22 and arg_99_1.time_ < var_102_12 + var_102_22 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410111026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410111026
		arg_103_1.duration_ = 5.3

		local var_103_0 = {
			zh = 5.3,
			ja = 4.133
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
				arg_103_0:Play410111027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.475

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[584].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(410111026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 19
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111026", "story_v_out_410111.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111026", "story_v_out_410111.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_410111", "410111026", "story_v_out_410111.awb")

						arg_103_1:RecordAudio("410111026", var_106_9)
						arg_103_1:RecordAudio("410111026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410111", "410111026", "story_v_out_410111.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410111", "410111026", "story_v_out_410111.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410111027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410111027
		arg_107_1.duration_ = 4

		local var_107_0 = {
			zh = 3.466,
			ja = 4
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
				arg_107_0:Play410111028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10059"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.actorSpriteComps10059 == nil then
				arg_107_1.var_.actorSpriteComps10059 = var_110_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_2 = 0.034

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.actorSpriteComps10059 then
					for iter_110_0, iter_110_1 in pairs(arg_107_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_110_1 then
							local var_110_4 = Mathf.Lerp(iter_110_1.color.r, 1, var_110_3)

							iter_110_1.color = Color.New(var_110_4, var_110_4, var_110_4)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.actorSpriteComps10059 then
				local var_110_5 = 1

				for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_110_3 then
						iter_110_3.color = Color.New(var_110_5, var_110_5, var_110_5)
					end
				end

				arg_107_1.var_.actorSpriteComps10059 = nil
			end

			local var_110_6 = arg_107_1.actors_["1060"]
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 == nil then
				arg_107_1.var_.actorSpriteComps1060 = var_110_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_8 = 0.034

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8

				if arg_107_1.var_.actorSpriteComps1060 then
					for iter_110_4, iter_110_5 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_110_5 then
							local var_110_10 = Mathf.Lerp(iter_110_5.color.r, 0.5, var_110_9)

							iter_110_5.color = Color.New(var_110_10, var_110_10, var_110_10)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 then
				local var_110_11 = 0.5

				for iter_110_6, iter_110_7 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_110_7 then
						iter_110_7.color = Color.New(var_110_11, var_110_11, var_110_11)
					end
				end

				arg_107_1.var_.actorSpriteComps1060 = nil
			end

			local var_110_12 = 0
			local var_110_13 = 0.3

			if var_110_12 < arg_107_1.time_ and arg_107_1.time_ <= var_110_12 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_14 = arg_107_1:FormatText(StoryNameCfg[596].name)

				arg_107_1.leftNameTxt_.text = var_110_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_15 = arg_107_1:GetWordFromCfg(410111027)
				local var_110_16 = arg_107_1:FormatText(var_110_15.content)

				arg_107_1.text_.text = var_110_16

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_17 = 12
				local var_110_18 = utf8.len(var_110_16)
				local var_110_19 = var_110_17 <= 0 and var_110_13 or var_110_13 * (var_110_18 / var_110_17)

				if var_110_19 > 0 and var_110_13 < var_110_19 then
					arg_107_1.talkMaxDuration = var_110_19

					if var_110_19 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_12
					end
				end

				arg_107_1.text_.text = var_110_16
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111027", "story_v_out_410111.awb") ~= 0 then
					local var_110_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111027", "story_v_out_410111.awb") / 1000

					if var_110_20 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_20 + var_110_12
					end

					if var_110_15.prefab_name ~= "" and arg_107_1.actors_[var_110_15.prefab_name] ~= nil then
						local var_110_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_15.prefab_name].transform, "story_v_out_410111", "410111027", "story_v_out_410111.awb")

						arg_107_1:RecordAudio("410111027", var_110_21)
						arg_107_1:RecordAudio("410111027", var_110_21)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410111", "410111027", "story_v_out_410111.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410111", "410111027", "story_v_out_410111.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_22 = math.max(var_110_13, arg_107_1.talkMaxDuration)

			if var_110_12 <= arg_107_1.time_ and arg_107_1.time_ < var_110_12 + var_110_22 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_12) / var_110_22

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_12 + var_110_22 and arg_107_1.time_ < var_110_12 + var_110_22 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410111028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410111028
		arg_111_1.duration_ = 9.1

		local var_111_0 = {
			zh = 9.1,
			ja = 8.933
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
				arg_111_0:Play410111029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.85

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[596].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(410111028)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 34
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111028", "story_v_out_410111.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111028", "story_v_out_410111.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_410111", "410111028", "story_v_out_410111.awb")

						arg_111_1:RecordAudio("410111028", var_114_9)
						arg_111_1:RecordAudio("410111028", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410111", "410111028", "story_v_out_410111.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410111", "410111028", "story_v_out_410111.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410111029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410111029
		arg_115_1.duration_ = 9.333

		local var_115_0 = {
			zh = 8.933,
			ja = 9.333
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
				arg_115_0:Play410111030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.625

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[596].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(410111029)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111029", "story_v_out_410111.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111029", "story_v_out_410111.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_410111", "410111029", "story_v_out_410111.awb")

						arg_115_1:RecordAudio("410111029", var_118_9)
						arg_115_1:RecordAudio("410111029", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410111", "410111029", "story_v_out_410111.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410111", "410111029", "story_v_out_410111.awb")
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
	Play410111030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410111030
		arg_119_1.duration_ = 13.666

		local var_119_0 = {
			zh = 13.166,
			ja = 13.666
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
				arg_119_0:Play410111031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1060"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.actorSpriteComps1060 == nil then
				arg_119_1.var_.actorSpriteComps1060 = var_122_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_2 = 0.034

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.actorSpriteComps1060 then
					for iter_122_0, iter_122_1 in pairs(arg_119_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_122_1 then
							local var_122_4 = Mathf.Lerp(iter_122_1.color.r, 1, var_122_3)

							iter_122_1.color = Color.New(var_122_4, var_122_4, var_122_4)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.actorSpriteComps1060 then
				local var_122_5 = 1

				for iter_122_2, iter_122_3 in pairs(arg_119_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_122_3 then
						iter_122_3.color = Color.New(var_122_5, var_122_5, var_122_5)
					end
				end

				arg_119_1.var_.actorSpriteComps1060 = nil
			end

			local var_122_6 = arg_119_1.actors_["10059"]
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 and arg_119_1.var_.actorSpriteComps10059 == nil then
				arg_119_1.var_.actorSpriteComps10059 = var_122_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_8 = 0.034

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_8 then
				local var_122_9 = (arg_119_1.time_ - var_122_7) / var_122_8

				if arg_119_1.var_.actorSpriteComps10059 then
					for iter_122_4, iter_122_5 in pairs(arg_119_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_122_5 then
							local var_122_10 = Mathf.Lerp(iter_122_5.color.r, 0.5, var_122_9)

							iter_122_5.color = Color.New(var_122_10, var_122_10, var_122_10)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_7 + var_122_8 and arg_119_1.time_ < var_122_7 + var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps10059 then
				local var_122_11 = 0.5

				for iter_122_6, iter_122_7 in pairs(arg_119_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_122_7 then
						iter_122_7.color = Color.New(var_122_11, var_122_11, var_122_11)
					end
				end

				arg_119_1.var_.actorSpriteComps10059 = nil
			end

			local var_122_12 = 0
			local var_122_13 = 1.375

			if var_122_12 < arg_119_1.time_ and arg_119_1.time_ <= var_122_12 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_14 = arg_119_1:FormatText(StoryNameCfg[584].name)

				arg_119_1.leftNameTxt_.text = var_122_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_15 = arg_119_1:GetWordFromCfg(410111030)
				local var_122_16 = arg_119_1:FormatText(var_122_15.content)

				arg_119_1.text_.text = var_122_16

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_17 = 55
				local var_122_18 = utf8.len(var_122_16)
				local var_122_19 = var_122_17 <= 0 and var_122_13 or var_122_13 * (var_122_18 / var_122_17)

				if var_122_19 > 0 and var_122_13 < var_122_19 then
					arg_119_1.talkMaxDuration = var_122_19

					if var_122_19 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_19 + var_122_12
					end
				end

				arg_119_1.text_.text = var_122_16
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111030", "story_v_out_410111.awb") ~= 0 then
					local var_122_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111030", "story_v_out_410111.awb") / 1000

					if var_122_20 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_12
					end

					if var_122_15.prefab_name ~= "" and arg_119_1.actors_[var_122_15.prefab_name] ~= nil then
						local var_122_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_15.prefab_name].transform, "story_v_out_410111", "410111030", "story_v_out_410111.awb")

						arg_119_1:RecordAudio("410111030", var_122_21)
						arg_119_1:RecordAudio("410111030", var_122_21)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410111", "410111030", "story_v_out_410111.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410111", "410111030", "story_v_out_410111.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_22 = math.max(var_122_13, arg_119_1.talkMaxDuration)

			if var_122_12 <= arg_119_1.time_ and arg_119_1.time_ < var_122_12 + var_122_22 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_12) / var_122_22

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_12 + var_122_22 and arg_119_1.time_ < var_122_12 + var_122_22 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410111031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410111031
		arg_123_1.duration_ = 9.333

		local var_123_0 = {
			zh = 7.466,
			ja = 9.333
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
				arg_123_0:Play410111032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10059"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.actorSpriteComps10059 == nil then
				arg_123_1.var_.actorSpriteComps10059 = var_126_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_2 = 0.034

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.actorSpriteComps10059 then
					for iter_126_0, iter_126_1 in pairs(arg_123_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_126_1 then
							local var_126_4 = Mathf.Lerp(iter_126_1.color.r, 1, var_126_3)

							iter_126_1.color = Color.New(var_126_4, var_126_4, var_126_4)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.actorSpriteComps10059 then
				local var_126_5 = 1

				for iter_126_2, iter_126_3 in pairs(arg_123_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_126_3 then
						iter_126_3.color = Color.New(var_126_5, var_126_5, var_126_5)
					end
				end

				arg_123_1.var_.actorSpriteComps10059 = nil
			end

			local var_126_6 = arg_123_1.actors_["1060"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 and arg_123_1.var_.actorSpriteComps1060 == nil then
				arg_123_1.var_.actorSpriteComps1060 = var_126_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_8 = 0.034

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8

				if arg_123_1.var_.actorSpriteComps1060 then
					for iter_126_4, iter_126_5 in pairs(arg_123_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_126_5 then
							local var_126_10 = Mathf.Lerp(iter_126_5.color.r, 0.5, var_126_9)

							iter_126_5.color = Color.New(var_126_10, var_126_10, var_126_10)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 and arg_123_1.var_.actorSpriteComps1060 then
				local var_126_11 = 0.5

				for iter_126_6, iter_126_7 in pairs(arg_123_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_126_7 then
						iter_126_7.color = Color.New(var_126_11, var_126_11, var_126_11)
					end
				end

				arg_123_1.var_.actorSpriteComps1060 = nil
			end

			local var_126_12 = 0
			local var_126_13 = 0.6

			if var_126_12 < arg_123_1.time_ and arg_123_1.time_ <= var_126_12 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_14 = arg_123_1:FormatText(StoryNameCfg[596].name)

				arg_123_1.leftNameTxt_.text = var_126_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_15 = arg_123_1:GetWordFromCfg(410111031)
				local var_126_16 = arg_123_1:FormatText(var_126_15.content)

				arg_123_1.text_.text = var_126_16

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_17 = 24
				local var_126_18 = utf8.len(var_126_16)
				local var_126_19 = var_126_17 <= 0 and var_126_13 or var_126_13 * (var_126_18 / var_126_17)

				if var_126_19 > 0 and var_126_13 < var_126_19 then
					arg_123_1.talkMaxDuration = var_126_19

					if var_126_19 + var_126_12 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_19 + var_126_12
					end
				end

				arg_123_1.text_.text = var_126_16
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111031", "story_v_out_410111.awb") ~= 0 then
					local var_126_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111031", "story_v_out_410111.awb") / 1000

					if var_126_20 + var_126_12 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_20 + var_126_12
					end

					if var_126_15.prefab_name ~= "" and arg_123_1.actors_[var_126_15.prefab_name] ~= nil then
						local var_126_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_15.prefab_name].transform, "story_v_out_410111", "410111031", "story_v_out_410111.awb")

						arg_123_1:RecordAudio("410111031", var_126_21)
						arg_123_1:RecordAudio("410111031", var_126_21)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_410111", "410111031", "story_v_out_410111.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_410111", "410111031", "story_v_out_410111.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_22 = math.max(var_126_13, arg_123_1.talkMaxDuration)

			if var_126_12 <= arg_123_1.time_ and arg_123_1.time_ < var_126_12 + var_126_22 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_12) / var_126_22

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_12 + var_126_22 and arg_123_1.time_ < var_126_12 + var_126_22 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410111032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410111032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play410111033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10059"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.actorSpriteComps10059 == nil then
				arg_127_1.var_.actorSpriteComps10059 = var_130_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_2 = 0.034

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.actorSpriteComps10059 then
					for iter_130_0, iter_130_1 in pairs(arg_127_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_130_1 then
							local var_130_4 = Mathf.Lerp(iter_130_1.color.r, 0.5, var_130_3)

							iter_130_1.color = Color.New(var_130_4, var_130_4, var_130_4)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.actorSpriteComps10059 then
				local var_130_5 = 0.5

				for iter_130_2, iter_130_3 in pairs(arg_127_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_130_3 then
						iter_130_3.color = Color.New(var_130_5, var_130_5, var_130_5)
					end
				end

				arg_127_1.var_.actorSpriteComps10059 = nil
			end

			local var_130_6 = 0
			local var_130_7 = 0.8

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_8 = arg_127_1:GetWordFromCfg(410111032)
				local var_130_9 = arg_127_1:FormatText(var_130_8.content)

				arg_127_1.text_.text = var_130_9

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_10 = 32
				local var_130_11 = utf8.len(var_130_9)
				local var_130_12 = var_130_10 <= 0 and var_130_7 or var_130_7 * (var_130_11 / var_130_10)

				if var_130_12 > 0 and var_130_7 < var_130_12 then
					arg_127_1.talkMaxDuration = var_130_12

					if var_130_12 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_12 + var_130_6
					end
				end

				arg_127_1.text_.text = var_130_9
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_13 = math.max(var_130_7, arg_127_1.talkMaxDuration)

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_13 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_6) / var_130_13

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_6 + var_130_13 and arg_127_1.time_ < var_130_6 + var_130_13 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play410111033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410111033
		arg_131_1.duration_ = 16.1

		local var_131_0 = {
			zh = 14.333,
			ja = 16.1
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
				arg_131_0:Play410111034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10059"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.actorSpriteComps10059 == nil then
				arg_131_1.var_.actorSpriteComps10059 = var_134_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_2 = 0.034

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.actorSpriteComps10059 then
					for iter_134_0, iter_134_1 in pairs(arg_131_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_134_1 then
							local var_134_4 = Mathf.Lerp(iter_134_1.color.r, 1, var_134_3)

							iter_134_1.color = Color.New(var_134_4, var_134_4, var_134_4)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.actorSpriteComps10059 then
				local var_134_5 = 1

				for iter_134_2, iter_134_3 in pairs(arg_131_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_134_3 then
						iter_134_3.color = Color.New(var_134_5, var_134_5, var_134_5)
					end
				end

				arg_131_1.var_.actorSpriteComps10059 = nil
			end

			local var_134_6 = 0
			local var_134_7 = 1.25

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_8 = arg_131_1:FormatText(StoryNameCfg[596].name)

				arg_131_1.leftNameTxt_.text = var_134_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_9 = arg_131_1:GetWordFromCfg(410111033)
				local var_134_10 = arg_131_1:FormatText(var_134_9.content)

				arg_131_1.text_.text = var_134_10

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_11 = 50
				local var_134_12 = utf8.len(var_134_10)
				local var_134_13 = var_134_11 <= 0 and var_134_7 or var_134_7 * (var_134_12 / var_134_11)

				if var_134_13 > 0 and var_134_7 < var_134_13 then
					arg_131_1.talkMaxDuration = var_134_13

					if var_134_13 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_13 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_10
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111033", "story_v_out_410111.awb") ~= 0 then
					local var_134_14 = manager.audio:GetVoiceLength("story_v_out_410111", "410111033", "story_v_out_410111.awb") / 1000

					if var_134_14 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_14 + var_134_6
					end

					if var_134_9.prefab_name ~= "" and arg_131_1.actors_[var_134_9.prefab_name] ~= nil then
						local var_134_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_9.prefab_name].transform, "story_v_out_410111", "410111033", "story_v_out_410111.awb")

						arg_131_1:RecordAudio("410111033", var_134_15)
						arg_131_1:RecordAudio("410111033", var_134_15)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_410111", "410111033", "story_v_out_410111.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_410111", "410111033", "story_v_out_410111.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_16 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_16 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_16

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_16 and arg_131_1.time_ < var_134_6 + var_134_16 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play410111034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410111034
		arg_135_1.duration_ = 8.066

		local var_135_0 = {
			zh = 5.2,
			ja = 8.066
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
				arg_135_0:Play410111035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1060"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.actorSpriteComps1060 == nil then
				arg_135_1.var_.actorSpriteComps1060 = var_138_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_2 = 0.034

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.actorSpriteComps1060 then
					for iter_138_0, iter_138_1 in pairs(arg_135_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_138_1 then
							local var_138_4 = Mathf.Lerp(iter_138_1.color.r, 1, var_138_3)

							iter_138_1.color = Color.New(var_138_4, var_138_4, var_138_4)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.actorSpriteComps1060 then
				local var_138_5 = 1

				for iter_138_2, iter_138_3 in pairs(arg_135_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_138_3 then
						iter_138_3.color = Color.New(var_138_5, var_138_5, var_138_5)
					end
				end

				arg_135_1.var_.actorSpriteComps1060 = nil
			end

			local var_138_6 = arg_135_1.actors_["10059"]
			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 and arg_135_1.var_.actorSpriteComps10059 == nil then
				arg_135_1.var_.actorSpriteComps10059 = var_138_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_8 = 0.034

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_8 then
				local var_138_9 = (arg_135_1.time_ - var_138_7) / var_138_8

				if arg_135_1.var_.actorSpriteComps10059 then
					for iter_138_4, iter_138_5 in pairs(arg_135_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_138_5 then
							local var_138_10 = Mathf.Lerp(iter_138_5.color.r, 0.5, var_138_9)

							iter_138_5.color = Color.New(var_138_10, var_138_10, var_138_10)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_7 + var_138_8 and arg_135_1.time_ < var_138_7 + var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps10059 then
				local var_138_11 = 0.5

				for iter_138_6, iter_138_7 in pairs(arg_135_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_138_7 then
						iter_138_7.color = Color.New(var_138_11, var_138_11, var_138_11)
					end
				end

				arg_135_1.var_.actorSpriteComps10059 = nil
			end

			local var_138_12 = 0
			local var_138_13 = 0.7

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[584].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(410111034)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 28
				local var_138_18 = utf8.len(var_138_16)
				local var_138_19 = var_138_17 <= 0 and var_138_13 or var_138_13 * (var_138_18 / var_138_17)

				if var_138_19 > 0 and var_138_13 < var_138_19 then
					arg_135_1.talkMaxDuration = var_138_19

					if var_138_19 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_19 + var_138_12
					end
				end

				arg_135_1.text_.text = var_138_16
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111034", "story_v_out_410111.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111034", "story_v_out_410111.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_out_410111", "410111034", "story_v_out_410111.awb")

						arg_135_1:RecordAudio("410111034", var_138_21)
						arg_135_1:RecordAudio("410111034", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_410111", "410111034", "story_v_out_410111.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_410111", "410111034", "story_v_out_410111.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_22 and arg_135_1.time_ < var_138_12 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play410111035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410111035
		arg_139_1.duration_ = 7

		local var_139_0 = {
			zh = 5.633,
			ja = 7
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
				arg_139_0:Play410111036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10059"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.actorSpriteComps10059 == nil then
				arg_139_1.var_.actorSpriteComps10059 = var_142_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_2 = 0.034

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.actorSpriteComps10059 then
					for iter_142_0, iter_142_1 in pairs(arg_139_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_142_1 then
							local var_142_4 = Mathf.Lerp(iter_142_1.color.r, 1, var_142_3)

							iter_142_1.color = Color.New(var_142_4, var_142_4, var_142_4)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.actorSpriteComps10059 then
				local var_142_5 = 1

				for iter_142_2, iter_142_3 in pairs(arg_139_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_142_3 then
						iter_142_3.color = Color.New(var_142_5, var_142_5, var_142_5)
					end
				end

				arg_139_1.var_.actorSpriteComps10059 = nil
			end

			local var_142_6 = arg_139_1.actors_["1060"]
			local var_142_7 = 0

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 and arg_139_1.var_.actorSpriteComps1060 == nil then
				arg_139_1.var_.actorSpriteComps1060 = var_142_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_8 = 0.034

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_8 then
				local var_142_9 = (arg_139_1.time_ - var_142_7) / var_142_8

				if arg_139_1.var_.actorSpriteComps1060 then
					for iter_142_4, iter_142_5 in pairs(arg_139_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_142_5 then
							local var_142_10 = Mathf.Lerp(iter_142_5.color.r, 0.5, var_142_9)

							iter_142_5.color = Color.New(var_142_10, var_142_10, var_142_10)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_7 + var_142_8 and arg_139_1.time_ < var_142_7 + var_142_8 + arg_142_0 and arg_139_1.var_.actorSpriteComps1060 then
				local var_142_11 = 0.5

				for iter_142_6, iter_142_7 in pairs(arg_139_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_142_7 then
						iter_142_7.color = Color.New(var_142_11, var_142_11, var_142_11)
					end
				end

				arg_139_1.var_.actorSpriteComps1060 = nil
			end

			local var_142_12 = 0
			local var_142_13 = 0.65

			if var_142_12 < arg_139_1.time_ and arg_139_1.time_ <= var_142_12 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_14 = arg_139_1:FormatText(StoryNameCfg[596].name)

				arg_139_1.leftNameTxt_.text = var_142_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_15 = arg_139_1:GetWordFromCfg(410111035)
				local var_142_16 = arg_139_1:FormatText(var_142_15.content)

				arg_139_1.text_.text = var_142_16

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_17 = 26
				local var_142_18 = utf8.len(var_142_16)
				local var_142_19 = var_142_17 <= 0 and var_142_13 or var_142_13 * (var_142_18 / var_142_17)

				if var_142_19 > 0 and var_142_13 < var_142_19 then
					arg_139_1.talkMaxDuration = var_142_19

					if var_142_19 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_19 + var_142_12
					end
				end

				arg_139_1.text_.text = var_142_16
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111035", "story_v_out_410111.awb") ~= 0 then
					local var_142_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111035", "story_v_out_410111.awb") / 1000

					if var_142_20 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_20 + var_142_12
					end

					if var_142_15.prefab_name ~= "" and arg_139_1.actors_[var_142_15.prefab_name] ~= nil then
						local var_142_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_15.prefab_name].transform, "story_v_out_410111", "410111035", "story_v_out_410111.awb")

						arg_139_1:RecordAudio("410111035", var_142_21)
						arg_139_1:RecordAudio("410111035", var_142_21)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_410111", "410111035", "story_v_out_410111.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_410111", "410111035", "story_v_out_410111.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_22 = math.max(var_142_13, arg_139_1.talkMaxDuration)

			if var_142_12 <= arg_139_1.time_ and arg_139_1.time_ < var_142_12 + var_142_22 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_12) / var_142_22

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_12 + var_142_22 and arg_139_1.time_ < var_142_12 + var_142_22 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410111036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410111036
		arg_143_1.duration_ = 6.833

		local var_143_0 = {
			zh = 4,
			ja = 6.833
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
				arg_143_0:Play410111037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1060"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.actorSpriteComps1060 == nil then
				arg_143_1.var_.actorSpriteComps1060 = var_146_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_2 = 0.034

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.actorSpriteComps1060 then
					for iter_146_0, iter_146_1 in pairs(arg_143_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_146_1 then
							local var_146_4 = Mathf.Lerp(iter_146_1.color.r, 1, var_146_3)

							iter_146_1.color = Color.New(var_146_4, var_146_4, var_146_4)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.actorSpriteComps1060 then
				local var_146_5 = 1

				for iter_146_2, iter_146_3 in pairs(arg_143_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_146_3 then
						iter_146_3.color = Color.New(var_146_5, var_146_5, var_146_5)
					end
				end

				arg_143_1.var_.actorSpriteComps1060 = nil
			end

			local var_146_6 = arg_143_1.actors_["10059"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.actorSpriteComps10059 == nil then
				arg_143_1.var_.actorSpriteComps10059 = var_146_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_8 = 0.034

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.actorSpriteComps10059 then
					for iter_146_4, iter_146_5 in pairs(arg_143_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_146_5 then
							local var_146_10 = Mathf.Lerp(iter_146_5.color.r, 0.5, var_146_9)

							iter_146_5.color = Color.New(var_146_10, var_146_10, var_146_10)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.actorSpriteComps10059 then
				local var_146_11 = 0.5

				for iter_146_6, iter_146_7 in pairs(arg_143_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_146_7 then
						iter_146_7.color = Color.New(var_146_11, var_146_11, var_146_11)
					end
				end

				arg_143_1.var_.actorSpriteComps10059 = nil
			end

			local var_146_12 = 0
			local var_146_13 = 0.225

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_14 = arg_143_1:FormatText(StoryNameCfg[584].name)

				arg_143_1.leftNameTxt_.text = var_146_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(410111036)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 9
				local var_146_18 = utf8.len(var_146_16)
				local var_146_19 = var_146_17 <= 0 and var_146_13 or var_146_13 * (var_146_18 / var_146_17)

				if var_146_19 > 0 and var_146_13 < var_146_19 then
					arg_143_1.talkMaxDuration = var_146_19

					if var_146_19 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_19 + var_146_12
					end
				end

				arg_143_1.text_.text = var_146_16
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111036", "story_v_out_410111.awb") ~= 0 then
					local var_146_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111036", "story_v_out_410111.awb") / 1000

					if var_146_20 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_12
					end

					if var_146_15.prefab_name ~= "" and arg_143_1.actors_[var_146_15.prefab_name] ~= nil then
						local var_146_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_15.prefab_name].transform, "story_v_out_410111", "410111036", "story_v_out_410111.awb")

						arg_143_1:RecordAudio("410111036", var_146_21)
						arg_143_1:RecordAudio("410111036", var_146_21)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_410111", "410111036", "story_v_out_410111.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_410111", "410111036", "story_v_out_410111.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_22 = math.max(var_146_13, arg_143_1.talkMaxDuration)

			if var_146_12 <= arg_143_1.time_ and arg_143_1.time_ < var_146_12 + var_146_22 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_12) / var_146_22

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_12 + var_146_22 and arg_143_1.time_ < var_146_12 + var_146_22 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410111037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410111037
		arg_147_1.duration_ = 6.8

		local var_147_0 = {
			zh = 2.9,
			ja = 6.8
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
				arg_147_0:Play410111038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10059"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.actorSpriteComps10059 == nil then
				arg_147_1.var_.actorSpriteComps10059 = var_150_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_2 = 0.034

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.actorSpriteComps10059 then
					for iter_150_0, iter_150_1 in pairs(arg_147_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_150_1 then
							local var_150_4 = Mathf.Lerp(iter_150_1.color.r, 1, var_150_3)

							iter_150_1.color = Color.New(var_150_4, var_150_4, var_150_4)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.actorSpriteComps10059 then
				local var_150_5 = 1

				for iter_150_2, iter_150_3 in pairs(arg_147_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_150_3 then
						iter_150_3.color = Color.New(var_150_5, var_150_5, var_150_5)
					end
				end

				arg_147_1.var_.actorSpriteComps10059 = nil
			end

			local var_150_6 = arg_147_1.actors_["1060"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 and arg_147_1.var_.actorSpriteComps1060 == nil then
				arg_147_1.var_.actorSpriteComps1060 = var_150_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_8 = 0.034

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_8 then
				local var_150_9 = (arg_147_1.time_ - var_150_7) / var_150_8

				if arg_147_1.var_.actorSpriteComps1060 then
					for iter_150_4, iter_150_5 in pairs(arg_147_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_150_5 then
							local var_150_10 = Mathf.Lerp(iter_150_5.color.r, 0.5, var_150_9)

							iter_150_5.color = Color.New(var_150_10, var_150_10, var_150_10)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_8 and arg_147_1.time_ < var_150_7 + var_150_8 + arg_150_0 and arg_147_1.var_.actorSpriteComps1060 then
				local var_150_11 = 0.5

				for iter_150_6, iter_150_7 in pairs(arg_147_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_150_7 then
						iter_150_7.color = Color.New(var_150_11, var_150_11, var_150_11)
					end
				end

				arg_147_1.var_.actorSpriteComps1060 = nil
			end

			local var_150_12 = 0
			local var_150_13 = 0.375

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_14 = arg_147_1:FormatText(StoryNameCfg[596].name)

				arg_147_1.leftNameTxt_.text = var_150_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_15 = arg_147_1:GetWordFromCfg(410111037)
				local var_150_16 = arg_147_1:FormatText(var_150_15.content)

				arg_147_1.text_.text = var_150_16

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_17 = 15
				local var_150_18 = utf8.len(var_150_16)
				local var_150_19 = var_150_17 <= 0 and var_150_13 or var_150_13 * (var_150_18 / var_150_17)

				if var_150_19 > 0 and var_150_13 < var_150_19 then
					arg_147_1.talkMaxDuration = var_150_19

					if var_150_19 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_12
					end
				end

				arg_147_1.text_.text = var_150_16
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111037", "story_v_out_410111.awb") ~= 0 then
					local var_150_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111037", "story_v_out_410111.awb") / 1000

					if var_150_20 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_20 + var_150_12
					end

					if var_150_15.prefab_name ~= "" and arg_147_1.actors_[var_150_15.prefab_name] ~= nil then
						local var_150_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_15.prefab_name].transform, "story_v_out_410111", "410111037", "story_v_out_410111.awb")

						arg_147_1:RecordAudio("410111037", var_150_21)
						arg_147_1:RecordAudio("410111037", var_150_21)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_410111", "410111037", "story_v_out_410111.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_410111", "410111037", "story_v_out_410111.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_22 = math.max(var_150_13, arg_147_1.talkMaxDuration)

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_22 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_12) / var_150_22

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_12 + var_150_22 and arg_147_1.time_ < var_150_12 + var_150_22 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410111038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410111038
		arg_151_1.duration_ = 11.6

		local var_151_0 = {
			zh = 10.1,
			ja = 11.6
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
				arg_151_0:Play410111039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1060"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.actorSpriteComps1060 == nil then
				arg_151_1.var_.actorSpriteComps1060 = var_154_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_2 = 0.034

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.actorSpriteComps1060 then
					for iter_154_0, iter_154_1 in pairs(arg_151_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_154_1 then
							local var_154_4 = Mathf.Lerp(iter_154_1.color.r, 1, var_154_3)

							iter_154_1.color = Color.New(var_154_4, var_154_4, var_154_4)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.actorSpriteComps1060 then
				local var_154_5 = 1

				for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_154_3 then
						iter_154_3.color = Color.New(var_154_5, var_154_5, var_154_5)
					end
				end

				arg_151_1.var_.actorSpriteComps1060 = nil
			end

			local var_154_6 = arg_151_1.actors_["10059"]
			local var_154_7 = 0

			if var_154_7 < arg_151_1.time_ and arg_151_1.time_ <= var_154_7 + arg_154_0 and arg_151_1.var_.actorSpriteComps10059 == nil then
				arg_151_1.var_.actorSpriteComps10059 = var_154_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_8 = 0.034

			if var_154_7 <= arg_151_1.time_ and arg_151_1.time_ < var_154_7 + var_154_8 then
				local var_154_9 = (arg_151_1.time_ - var_154_7) / var_154_8

				if arg_151_1.var_.actorSpriteComps10059 then
					for iter_154_4, iter_154_5 in pairs(arg_151_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_154_5 then
							local var_154_10 = Mathf.Lerp(iter_154_5.color.r, 0.5, var_154_9)

							iter_154_5.color = Color.New(var_154_10, var_154_10, var_154_10)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_7 + var_154_8 and arg_151_1.time_ < var_154_7 + var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps10059 then
				local var_154_11 = 0.5

				for iter_154_6, iter_154_7 in pairs(arg_151_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_154_7 then
						iter_154_7.color = Color.New(var_154_11, var_154_11, var_154_11)
					end
				end

				arg_151_1.var_.actorSpriteComps10059 = nil
			end

			local var_154_12 = 0
			local var_154_13 = 1.025

			if var_154_12 < arg_151_1.time_ and arg_151_1.time_ <= var_154_12 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_14 = arg_151_1:FormatText(StoryNameCfg[584].name)

				arg_151_1.leftNameTxt_.text = var_154_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_15 = arg_151_1:GetWordFromCfg(410111038)
				local var_154_16 = arg_151_1:FormatText(var_154_15.content)

				arg_151_1.text_.text = var_154_16

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_17 = 41
				local var_154_18 = utf8.len(var_154_16)
				local var_154_19 = var_154_17 <= 0 and var_154_13 or var_154_13 * (var_154_18 / var_154_17)

				if var_154_19 > 0 and var_154_13 < var_154_19 then
					arg_151_1.talkMaxDuration = var_154_19

					if var_154_19 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_12
					end
				end

				arg_151_1.text_.text = var_154_16
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111038", "story_v_out_410111.awb") ~= 0 then
					local var_154_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111038", "story_v_out_410111.awb") / 1000

					if var_154_20 + var_154_12 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_20 + var_154_12
					end

					if var_154_15.prefab_name ~= "" and arg_151_1.actors_[var_154_15.prefab_name] ~= nil then
						local var_154_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_15.prefab_name].transform, "story_v_out_410111", "410111038", "story_v_out_410111.awb")

						arg_151_1:RecordAudio("410111038", var_154_21)
						arg_151_1:RecordAudio("410111038", var_154_21)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410111", "410111038", "story_v_out_410111.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410111", "410111038", "story_v_out_410111.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_22 = math.max(var_154_13, arg_151_1.talkMaxDuration)

			if var_154_12 <= arg_151_1.time_ and arg_151_1.time_ < var_154_12 + var_154_22 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_12) / var_154_22

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_12 + var_154_22 and arg_151_1.time_ < var_154_12 + var_154_22 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410111039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410111039
		arg_155_1.duration_ = 17.366

		local var_155_0 = {
			zh = 14.2,
			ja = 17.366
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
				arg_155_0:Play410111040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.2

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[584].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(410111039)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111039", "story_v_out_410111.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111039", "story_v_out_410111.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_410111", "410111039", "story_v_out_410111.awb")

						arg_155_1:RecordAudio("410111039", var_158_9)
						arg_155_1:RecordAudio("410111039", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410111", "410111039", "story_v_out_410111.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410111", "410111039", "story_v_out_410111.awb")
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
	Play410111040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410111040
		arg_159_1.duration_ = 17.833

		local var_159_0 = {
			zh = 17.833,
			ja = 15.1
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
				arg_159_0:Play410111041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1.775

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
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(410111040)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 71
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111040", "story_v_out_410111.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111040", "story_v_out_410111.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_410111", "410111040", "story_v_out_410111.awb")

						arg_159_1:RecordAudio("410111040", var_162_9)
						arg_159_1:RecordAudio("410111040", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410111", "410111040", "story_v_out_410111.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410111", "410111040", "story_v_out_410111.awb")
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
	Play410111041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410111041
		arg_163_1.duration_ = 15.7

		local var_163_0 = {
			zh = 15.7,
			ja = 11.566
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
				arg_163_0:Play410111042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1.65

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[584].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(410111041)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 66
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111041", "story_v_out_410111.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111041", "story_v_out_410111.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_410111", "410111041", "story_v_out_410111.awb")

						arg_163_1:RecordAudio("410111041", var_166_9)
						arg_163_1:RecordAudio("410111041", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_410111", "410111041", "story_v_out_410111.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_410111", "410111041", "story_v_out_410111.awb")
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
	Play410111042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410111042
		arg_167_1.duration_ = 10.866

		local var_167_0 = {
			zh = 10.866,
			ja = 9.833
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
				arg_167_0:Play410111043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.95

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
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(410111042)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111042", "story_v_out_410111.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111042", "story_v_out_410111.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_410111", "410111042", "story_v_out_410111.awb")

						arg_167_1:RecordAudio("410111042", var_170_9)
						arg_167_1:RecordAudio("410111042", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410111", "410111042", "story_v_out_410111.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410111", "410111042", "story_v_out_410111.awb")
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
	Play410111043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410111043
		arg_171_1.duration_ = 19.7

		local var_171_0 = {
			zh = 11.833,
			ja = 19.7
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
				arg_171_0:Play410111044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1.325

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

				local var_174_3 = arg_171_1:GetWordFromCfg(410111043)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111043", "story_v_out_410111.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111043", "story_v_out_410111.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_410111", "410111043", "story_v_out_410111.awb")

						arg_171_1:RecordAudio("410111043", var_174_9)
						arg_171_1:RecordAudio("410111043", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410111", "410111043", "story_v_out_410111.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410111", "410111043", "story_v_out_410111.awb")
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
	Play410111044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410111044
		arg_175_1.duration_ = 8.3

		local var_175_0 = {
			zh = 7.8,
			ja = 8.3
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
				arg_175_0:Play410111045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.75

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

				local var_178_3 = arg_175_1:GetWordFromCfg(410111044)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111044", "story_v_out_410111.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111044", "story_v_out_410111.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_410111", "410111044", "story_v_out_410111.awb")

						arg_175_1:RecordAudio("410111044", var_178_9)
						arg_175_1:RecordAudio("410111044", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_410111", "410111044", "story_v_out_410111.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_410111", "410111044", "story_v_out_410111.awb")
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
	Play410111045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410111045
		arg_179_1.duration_ = 10.633

		local var_179_0 = {
			zh = 4.7,
			ja = 10.633
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
				arg_179_0:Play410111046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.4

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

				local var_182_3 = arg_179_1:GetWordFromCfg(410111045)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111045", "story_v_out_410111.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111045", "story_v_out_410111.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_410111", "410111045", "story_v_out_410111.awb")

						arg_179_1:RecordAudio("410111045", var_182_9)
						arg_179_1:RecordAudio("410111045", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410111", "410111045", "story_v_out_410111.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410111", "410111045", "story_v_out_410111.awb")
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
	Play410111046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410111046
		arg_183_1.duration_ = 8.5

		local var_183_0 = {
			zh = 8.5,
			ja = 1.3
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
				arg_183_0:Play410111047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10059"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.actorSpriteComps10059 == nil then
				arg_183_1.var_.actorSpriteComps10059 = var_186_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_2 = 0.034

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.actorSpriteComps10059 then
					for iter_186_0, iter_186_1 in pairs(arg_183_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_186_1 then
							local var_186_4 = Mathf.Lerp(iter_186_1.color.r, 1, var_186_3)

							iter_186_1.color = Color.New(var_186_4, var_186_4, var_186_4)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.actorSpriteComps10059 then
				local var_186_5 = 1

				for iter_186_2, iter_186_3 in pairs(arg_183_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_186_3 then
						iter_186_3.color = Color.New(var_186_5, var_186_5, var_186_5)
					end
				end

				arg_183_1.var_.actorSpriteComps10059 = nil
			end

			local var_186_6 = arg_183_1.actors_["1060"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.actorSpriteComps1060 == nil then
				arg_183_1.var_.actorSpriteComps1060 = var_186_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_8 = 0.034

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.actorSpriteComps1060 then
					for iter_186_4, iter_186_5 in pairs(arg_183_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_186_5 then
							local var_186_10 = Mathf.Lerp(iter_186_5.color.r, 0.5, var_186_9)

							iter_186_5.color = Color.New(var_186_10, var_186_10, var_186_10)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps1060 then
				local var_186_11 = 0.5

				for iter_186_6, iter_186_7 in pairs(arg_183_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_186_7 then
						iter_186_7.color = Color.New(var_186_11, var_186_11, var_186_11)
					end
				end

				arg_183_1.var_.actorSpriteComps1060 = nil
			end

			local var_186_12 = 0
			local var_186_13 = 0.05

			if var_186_12 < arg_183_1.time_ and arg_183_1.time_ <= var_186_12 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_14 = arg_183_1:FormatText(StoryNameCfg[596].name)

				arg_183_1.leftNameTxt_.text = var_186_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_15 = arg_183_1:GetWordFromCfg(410111046)
				local var_186_16 = arg_183_1:FormatText(var_186_15.content)

				arg_183_1.text_.text = var_186_16

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_17 = 2
				local var_186_18 = utf8.len(var_186_16)
				local var_186_19 = var_186_17 <= 0 and var_186_13 or var_186_13 * (var_186_18 / var_186_17)

				if var_186_19 > 0 and var_186_13 < var_186_19 then
					arg_183_1.talkMaxDuration = var_186_19

					if var_186_19 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_19 + var_186_12
					end
				end

				arg_183_1.text_.text = var_186_16
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111046", "story_v_out_410111.awb") ~= 0 then
					local var_186_20 = manager.audio:GetVoiceLength("story_v_out_410111", "410111046", "story_v_out_410111.awb") / 1000

					if var_186_20 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_12
					end

					if var_186_15.prefab_name ~= "" and arg_183_1.actors_[var_186_15.prefab_name] ~= nil then
						local var_186_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_15.prefab_name].transform, "story_v_out_410111", "410111046", "story_v_out_410111.awb")

						arg_183_1:RecordAudio("410111046", var_186_21)
						arg_183_1:RecordAudio("410111046", var_186_21)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410111", "410111046", "story_v_out_410111.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410111", "410111046", "story_v_out_410111.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_22 = math.max(var_186_13, arg_183_1.talkMaxDuration)

			if var_186_12 <= arg_183_1.time_ and arg_183_1.time_ < var_186_12 + var_186_22 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_12) / var_186_22

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_12 + var_186_22 and arg_183_1.time_ < var_186_12 + var_186_22 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play410111047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410111047
		arg_187_1.duration_ = 5.8

		local var_187_0 = {
			zh = 2.966,
			ja = 5.8
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
				arg_187_0:Play410111048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10059"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10059 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10059", 7)

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
				local var_190_6 = Vector3.New(0, -2000, 35)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10059, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_190_7 = arg_187_1.actors_["1060"].transform
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 then
				arg_187_1.var_.moveOldPos1060 = var_190_7.localPosition
				var_190_7.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("1060", 4)

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
				local var_190_13 = Vector3.New(390, -435, -40)

				var_190_7.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1060, var_190_13, var_190_12)
			end

			if arg_187_1.time_ >= var_190_8 + var_190_11 and arg_187_1.time_ < var_190_8 + var_190_11 + arg_190_0 then
				var_190_7.localPosition = Vector3.New(390, -435, -40)
			end

			local var_190_14 = arg_187_1.actors_["10062"].transform
			local var_190_15 = 0

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 then
				arg_187_1.var_.moveOldPos10062 = var_190_14.localPosition
				var_190_14.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10062", 2)

				local var_190_16 = var_190_14.childCount

				for iter_190_2 = 0, var_190_16 - 1 do
					local var_190_17 = var_190_14:GetChild(iter_190_2)

					if var_190_17.name == "" or not string.find(var_190_17.name, "split") then
						var_190_17.gameObject:SetActive(true)
					else
						var_190_17.gameObject:SetActive(false)
					end
				end
			end

			local var_190_18 = 0.001

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_18 then
				local var_190_19 = (arg_187_1.time_ - var_190_15) / var_190_18
				local var_190_20 = Vector3.New(-370, -390, -290)

				var_190_14.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10062, var_190_20, var_190_19)
			end

			if arg_187_1.time_ >= var_190_15 + var_190_18 and arg_187_1.time_ < var_190_15 + var_190_18 + arg_190_0 then
				var_190_14.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_190_21 = arg_187_1.actors_["10059"]
			local var_190_22 = 0

			if var_190_22 < arg_187_1.time_ and arg_187_1.time_ <= var_190_22 + arg_190_0 and arg_187_1.var_.actorSpriteComps10059 == nil then
				arg_187_1.var_.actorSpriteComps10059 = var_190_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_23 = 0.034

			if var_190_22 <= arg_187_1.time_ and arg_187_1.time_ < var_190_22 + var_190_23 then
				local var_190_24 = (arg_187_1.time_ - var_190_22) / var_190_23

				if arg_187_1.var_.actorSpriteComps10059 then
					for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_190_4 then
							local var_190_25 = Mathf.Lerp(iter_190_4.color.r, 0.5, var_190_24)

							iter_190_4.color = Color.New(var_190_25, var_190_25, var_190_25)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_22 + var_190_23 and arg_187_1.time_ < var_190_22 + var_190_23 + arg_190_0 and arg_187_1.var_.actorSpriteComps10059 then
				local var_190_26 = 0.5

				for iter_190_5, iter_190_6 in pairs(arg_187_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_190_6 then
						iter_190_6.color = Color.New(var_190_26, var_190_26, var_190_26)
					end
				end

				arg_187_1.var_.actorSpriteComps10059 = nil
			end

			local var_190_27 = arg_187_1.actors_["1060"]
			local var_190_28 = 0

			if var_190_28 < arg_187_1.time_ and arg_187_1.time_ <= var_190_28 + arg_190_0 and arg_187_1.var_.actorSpriteComps1060 == nil then
				arg_187_1.var_.actorSpriteComps1060 = var_190_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_29 = 0.034

			if var_190_28 <= arg_187_1.time_ and arg_187_1.time_ < var_190_28 + var_190_29 then
				local var_190_30 = (arg_187_1.time_ - var_190_28) / var_190_29

				if arg_187_1.var_.actorSpriteComps1060 then
					for iter_190_7, iter_190_8 in pairs(arg_187_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_190_8 then
							local var_190_31 = Mathf.Lerp(iter_190_8.color.r, 0.5, var_190_30)

							iter_190_8.color = Color.New(var_190_31, var_190_31, var_190_31)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_28 + var_190_29 and arg_187_1.time_ < var_190_28 + var_190_29 + arg_190_0 and arg_187_1.var_.actorSpriteComps1060 then
				local var_190_32 = 0.5

				for iter_190_9, iter_190_10 in pairs(arg_187_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_190_10 then
						iter_190_10.color = Color.New(var_190_32, var_190_32, var_190_32)
					end
				end

				arg_187_1.var_.actorSpriteComps1060 = nil
			end

			local var_190_33 = arg_187_1.actors_["10062"]
			local var_190_34 = 0

			if var_190_34 < arg_187_1.time_ and arg_187_1.time_ <= var_190_34 + arg_190_0 and arg_187_1.var_.actorSpriteComps10062 == nil then
				arg_187_1.var_.actorSpriteComps10062 = var_190_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_35 = 0.034

			if var_190_34 <= arg_187_1.time_ and arg_187_1.time_ < var_190_34 + var_190_35 then
				local var_190_36 = (arg_187_1.time_ - var_190_34) / var_190_35

				if arg_187_1.var_.actorSpriteComps10062 then
					for iter_190_11, iter_190_12 in pairs(arg_187_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_190_12 then
							local var_190_37 = Mathf.Lerp(iter_190_12.color.r, 1, var_190_36)

							iter_190_12.color = Color.New(var_190_37, var_190_37, var_190_37)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_34 + var_190_35 and arg_187_1.time_ < var_190_34 + var_190_35 + arg_190_0 and arg_187_1.var_.actorSpriteComps10062 then
				local var_190_38 = 1

				for iter_190_13, iter_190_14 in pairs(arg_187_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_190_14 then
						iter_190_14.color = Color.New(var_190_38, var_190_38, var_190_38)
					end
				end

				arg_187_1.var_.actorSpriteComps10062 = nil
			end

			local var_190_39 = 0
			local var_190_40 = 0.25

			if var_190_39 < arg_187_1.time_ and arg_187_1.time_ <= var_190_39 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_41 = arg_187_1:FormatText(StoryNameCfg[600].name)

				arg_187_1.leftNameTxt_.text = var_190_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_42 = arg_187_1:GetWordFromCfg(410111047)
				local var_190_43 = arg_187_1:FormatText(var_190_42.content)

				arg_187_1.text_.text = var_190_43

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_44 = 10
				local var_190_45 = utf8.len(var_190_43)
				local var_190_46 = var_190_44 <= 0 and var_190_40 or var_190_40 * (var_190_45 / var_190_44)

				if var_190_46 > 0 and var_190_40 < var_190_46 then
					arg_187_1.talkMaxDuration = var_190_46

					if var_190_46 + var_190_39 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_46 + var_190_39
					end
				end

				arg_187_1.text_.text = var_190_43
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111047", "story_v_out_410111.awb") ~= 0 then
					local var_190_47 = manager.audio:GetVoiceLength("story_v_out_410111", "410111047", "story_v_out_410111.awb") / 1000

					if var_190_47 + var_190_39 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_47 + var_190_39
					end

					if var_190_42.prefab_name ~= "" and arg_187_1.actors_[var_190_42.prefab_name] ~= nil then
						local var_190_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_42.prefab_name].transform, "story_v_out_410111", "410111047", "story_v_out_410111.awb")

						arg_187_1:RecordAudio("410111047", var_190_48)
						arg_187_1:RecordAudio("410111047", var_190_48)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410111", "410111047", "story_v_out_410111.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410111", "410111047", "story_v_out_410111.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_49 = math.max(var_190_40, arg_187_1.talkMaxDuration)

			if var_190_39 <= arg_187_1.time_ and arg_187_1.time_ < var_190_39 + var_190_49 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_39) / var_190_49

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_39 + var_190_49 and arg_187_1.time_ < var_190_39 + var_190_49 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410111048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410111048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play410111049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10062"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 == nil then
				arg_191_1.var_.actorSpriteComps10062 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 0.034

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps10062 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_194_1 then
							local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 0.5, var_194_3)

							iter_194_1.color = Color.New(var_194_4, var_194_4, var_194_4)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 then
				local var_194_5 = 0.5

				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_194_3 then
						iter_194_3.color = Color.New(var_194_5, var_194_5, var_194_5)
					end
				end

				arg_191_1.var_.actorSpriteComps10062 = nil
			end

			local var_194_6 = 0
			local var_194_7 = 0.725

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_8 = arg_191_1:GetWordFromCfg(410111048)
				local var_194_9 = arg_191_1:FormatText(var_194_8.content)

				arg_191_1.text_.text = var_194_9

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_10 = 29
				local var_194_11 = utf8.len(var_194_9)
				local var_194_12 = var_194_10 <= 0 and var_194_7 or var_194_7 * (var_194_11 / var_194_10)

				if var_194_12 > 0 and var_194_7 < var_194_12 then
					arg_191_1.talkMaxDuration = var_194_12

					if var_194_12 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_12 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_9
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_13 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_13 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_13

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_13 and arg_191_1.time_ < var_194_6 + var_194_13 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410111049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410111049
		arg_195_1.duration_ = 16.366

		local var_195_0 = {
			zh = 11,
			ja = 16.366
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
				arg_195_0:Play410111050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10062"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10062 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10062", 2)

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
				local var_198_6 = Vector3.New(-370, -390, -290)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10062, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_198_7 = arg_195_1.actors_["1060"].transform
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 then
				arg_195_1.var_.moveOldPos1060 = var_198_7.localPosition
				var_198_7.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("1060", 4)

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
				local var_198_13 = Vector3.New(390, -435, -40)

				var_198_7.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1060, var_198_13, var_198_12)
			end

			if arg_195_1.time_ >= var_198_8 + var_198_11 and arg_195_1.time_ < var_198_8 + var_198_11 + arg_198_0 then
				var_198_7.localPosition = Vector3.New(390, -435, -40)
			end

			local var_198_14 = arg_195_1.actors_["1060"]
			local var_198_15 = 0

			if var_198_15 < arg_195_1.time_ and arg_195_1.time_ <= var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps1060 == nil then
				arg_195_1.var_.actorSpriteComps1060 = var_198_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_16 = 0.034

			if var_198_15 <= arg_195_1.time_ and arg_195_1.time_ < var_198_15 + var_198_16 then
				local var_198_17 = (arg_195_1.time_ - var_198_15) / var_198_16

				if arg_195_1.var_.actorSpriteComps1060 then
					for iter_198_2, iter_198_3 in pairs(arg_195_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_198_3 then
							local var_198_18 = Mathf.Lerp(iter_198_3.color.r, 1, var_198_17)

							iter_198_3.color = Color.New(var_198_18, var_198_18, var_198_18)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_15 + var_198_16 and arg_195_1.time_ < var_198_15 + var_198_16 + arg_198_0 and arg_195_1.var_.actorSpriteComps1060 then
				local var_198_19 = 1

				for iter_198_4, iter_198_5 in pairs(arg_195_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_198_5 then
						iter_198_5.color = Color.New(var_198_19, var_198_19, var_198_19)
					end
				end

				arg_195_1.var_.actorSpriteComps1060 = nil
			end

			local var_198_20 = 0
			local var_198_21 = 0.9

			if var_198_20 < arg_195_1.time_ and arg_195_1.time_ <= var_198_20 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_22 = arg_195_1:FormatText(StoryNameCfg[584].name)

				arg_195_1.leftNameTxt_.text = var_198_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_23 = arg_195_1:GetWordFromCfg(410111049)
				local var_198_24 = arg_195_1:FormatText(var_198_23.content)

				arg_195_1.text_.text = var_198_24

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_25 = 36
				local var_198_26 = utf8.len(var_198_24)
				local var_198_27 = var_198_25 <= 0 and var_198_21 or var_198_21 * (var_198_26 / var_198_25)

				if var_198_27 > 0 and var_198_21 < var_198_27 then
					arg_195_1.talkMaxDuration = var_198_27

					if var_198_27 + var_198_20 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_20
					end
				end

				arg_195_1.text_.text = var_198_24
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111049", "story_v_out_410111.awb") ~= 0 then
					local var_198_28 = manager.audio:GetVoiceLength("story_v_out_410111", "410111049", "story_v_out_410111.awb") / 1000

					if var_198_28 + var_198_20 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_28 + var_198_20
					end

					if var_198_23.prefab_name ~= "" and arg_195_1.actors_[var_198_23.prefab_name] ~= nil then
						local var_198_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_23.prefab_name].transform, "story_v_out_410111", "410111049", "story_v_out_410111.awb")

						arg_195_1:RecordAudio("410111049", var_198_29)
						arg_195_1:RecordAudio("410111049", var_198_29)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410111", "410111049", "story_v_out_410111.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410111", "410111049", "story_v_out_410111.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_30 = math.max(var_198_21, arg_195_1.talkMaxDuration)

			if var_198_20 <= arg_195_1.time_ and arg_195_1.time_ < var_198_20 + var_198_30 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_20) / var_198_30

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_20 + var_198_30 and arg_195_1.time_ < var_198_20 + var_198_30 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play410111050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410111050
		arg_199_1.duration_ = 8.1

		local var_199_0 = {
			zh = 8.1,
			ja = 7.2
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
				arg_199_0:Play410111051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.875

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[584].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(410111050)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111050", "story_v_out_410111.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111050", "story_v_out_410111.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_410111", "410111050", "story_v_out_410111.awb")

						arg_199_1:RecordAudio("410111050", var_202_9)
						arg_199_1:RecordAudio("410111050", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410111", "410111050", "story_v_out_410111.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410111", "410111050", "story_v_out_410111.awb")
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
	Play410111051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410111051
		arg_203_1.duration_ = 8.066

		local var_203_0 = {
			zh = 3.9,
			ja = 8.066
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
				arg_203_0:Play410111052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.425

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[584].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(410111051)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111051", "story_v_out_410111.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111051", "story_v_out_410111.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_410111", "410111051", "story_v_out_410111.awb")

						arg_203_1:RecordAudio("410111051", var_206_9)
						arg_203_1:RecordAudio("410111051", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410111", "410111051", "story_v_out_410111.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410111", "410111051", "story_v_out_410111.awb")
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
	Play410111052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410111052
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play410111053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1060"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1060 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1060", 7)

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
				local var_210_6 = Vector3.New(0, -2000, -40)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1060, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -2000, -40)
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

			local var_210_13 = arg_207_1.actors_["10062"].transform
			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				arg_207_1.var_.moveOldPos10062 = var_210_13.localPosition
				var_210_13.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("10062", 7)

				local var_210_15 = var_210_13.childCount

				for iter_210_5 = 0, var_210_15 - 1 do
					local var_210_16 = var_210_13:GetChild(iter_210_5)

					if var_210_16.name == "" or not string.find(var_210_16.name, "split") then
						var_210_16.gameObject:SetActive(true)
					else
						var_210_16.gameObject:SetActive(false)
					end
				end
			end

			local var_210_17 = 0.001

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_17 then
				local var_210_18 = (arg_207_1.time_ - var_210_14) / var_210_17
				local var_210_19 = Vector3.New(0, -2000, -40)

				var_210_13.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10062, var_210_19, var_210_18)
			end

			if arg_207_1.time_ >= var_210_14 + var_210_17 and arg_207_1.time_ < var_210_14 + var_210_17 + arg_210_0 then
				var_210_13.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_210_20 = 0
			local var_210_21 = 1.375

			if var_210_20 < arg_207_1.time_ and arg_207_1.time_ <= var_210_20 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_22 = arg_207_1:GetWordFromCfg(410111052)
				local var_210_23 = arg_207_1:FormatText(var_210_22.content)

				arg_207_1.text_.text = var_210_23

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_24 = 55
				local var_210_25 = utf8.len(var_210_23)
				local var_210_26 = var_210_24 <= 0 and var_210_21 or var_210_21 * (var_210_25 / var_210_24)

				if var_210_26 > 0 and var_210_21 < var_210_26 then
					arg_207_1.talkMaxDuration = var_210_26

					if var_210_26 + var_210_20 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_26 + var_210_20
					end
				end

				arg_207_1.text_.text = var_210_23
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_27 = math.max(var_210_21, arg_207_1.talkMaxDuration)

			if var_210_20 <= arg_207_1.time_ and arg_207_1.time_ < var_210_20 + var_210_27 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_20) / var_210_27

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_20 + var_210_27 and arg_207_1.time_ < var_210_20 + var_210_27 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410111053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410111053
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play410111054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_1 = 1

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_1 then
				local var_214_2 = (arg_211_1.time_ - var_214_0) / var_214_1
				local var_214_3 = Color.New(1, 1, 1)

				var_214_3.a = Mathf.Lerp(1, 0, var_214_2)
				arg_211_1.mask_.color = var_214_3
			end

			if arg_211_1.time_ >= var_214_0 + var_214_1 and arg_211_1.time_ < var_214_0 + var_214_1 + arg_214_0 then
				local var_214_4 = Color.New(1, 1, 1)
				local var_214_5 = 0

				arg_211_1.mask_.enabled = false
				var_214_4.a = var_214_5
				arg_211_1.mask_.color = var_214_4
			end

			local var_214_6 = 0
			local var_214_7 = 1

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				local var_214_8 = "play"
				local var_214_9 = "effect"

				arg_211_1:AudioAction(var_214_8, var_214_9, "se_story_side_1033", "se_story_1033_gun", "")
			end

			local var_214_10 = 0
			local var_214_11 = 0.075

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				arg_211_1.dialog_:SetActive(true)

				local var_214_12 = LeanTween.value(arg_211_1.dialog_, 0, 1, 0.3)

				var_214_12:setOnUpdate(LuaHelper.FloatAction(function(arg_215_0)
					arg_211_1.dialogCg_.alpha = arg_215_0
				end))
				var_214_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_211_1.dialog_)
					var_214_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_211_1.duration_ = arg_211_1.duration_ + 0.3

				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_13 = arg_211_1:GetWordFromCfg(410111053)
				local var_214_14 = arg_211_1:FormatText(var_214_13.content)

				arg_211_1.text_.text = var_214_14

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_15 = 3
				local var_214_16 = utf8.len(var_214_14)
				local var_214_17 = var_214_15 <= 0 and var_214_11 or var_214_11 * (var_214_16 / var_214_15)

				if var_214_17 > 0 and var_214_11 < var_214_17 then
					arg_211_1.talkMaxDuration = var_214_17
					var_214_10 = var_214_10 + 0.3

					if var_214_17 + var_214_10 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_17 + var_214_10
					end
				end

				arg_211_1.text_.text = var_214_14
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_18 = var_214_10 + 0.3
			local var_214_19 = math.max(var_214_11, arg_211_1.talkMaxDuration)

			if var_214_18 <= arg_211_1.time_ and arg_211_1.time_ < var_214_18 + var_214_19 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_18) / var_214_19

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_18 + var_214_19 and arg_211_1.time_ < var_214_18 + var_214_19 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play410111054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 410111054
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play410111055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1.25

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

				local var_220_2 = arg_217_1:GetWordFromCfg(410111054)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 50
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
	Play410111055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 410111055
		arg_221_1.duration_ = 4.133

		local var_221_0 = {
			zh = 3.433,
			ja = 4.133
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
				arg_221_0:Play410111056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10062"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos10062 = var_224_0.localPosition
				var_224_0.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("10062", 3)

				local var_224_2 = var_224_0.childCount

				for iter_224_0 = 0, var_224_2 - 1 do
					local var_224_3 = var_224_0:GetChild(iter_224_0)

					if var_224_3.name == "" or not string.find(var_224_3.name, "split") then
						var_224_3.gameObject:SetActive(true)
					else
						var_224_3.gameObject:SetActive(false)
					end
				end
			end

			local var_224_4 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_4 then
				local var_224_5 = (arg_221_1.time_ - var_224_1) / var_224_4
				local var_224_6 = Vector3.New(0, -390, -290)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10062, var_224_6, var_224_5)
			end

			if arg_221_1.time_ >= var_224_1 + var_224_4 and arg_221_1.time_ < var_224_1 + var_224_4 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_224_7 = arg_221_1.actors_["10062"]
			local var_224_8 = 0

			if var_224_8 < arg_221_1.time_ and arg_221_1.time_ <= var_224_8 + arg_224_0 and arg_221_1.var_.actorSpriteComps10062 == nil then
				arg_221_1.var_.actorSpriteComps10062 = var_224_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_9 = 0.034

			if var_224_8 <= arg_221_1.time_ and arg_221_1.time_ < var_224_8 + var_224_9 then
				local var_224_10 = (arg_221_1.time_ - var_224_8) / var_224_9

				if arg_221_1.var_.actorSpriteComps10062 then
					for iter_224_1, iter_224_2 in pairs(arg_221_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_224_2 then
							local var_224_11 = Mathf.Lerp(iter_224_2.color.r, 1, var_224_10)

							iter_224_2.color = Color.New(var_224_11, var_224_11, var_224_11)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_8 + var_224_9 and arg_221_1.time_ < var_224_8 + var_224_9 + arg_224_0 and arg_221_1.var_.actorSpriteComps10062 then
				local var_224_12 = 1

				for iter_224_3, iter_224_4 in pairs(arg_221_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_224_4 then
						iter_224_4.color = Color.New(var_224_12, var_224_12, var_224_12)
					end
				end

				arg_221_1.var_.actorSpriteComps10062 = nil
			end

			local var_224_13 = 0
			local var_224_14 = 0.15

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_15 = arg_221_1:FormatText(StoryNameCfg[600].name)

				arg_221_1.leftNameTxt_.text = var_224_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_16 = arg_221_1:GetWordFromCfg(410111055)
				local var_224_17 = arg_221_1:FormatText(var_224_16.content)

				arg_221_1.text_.text = var_224_17

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_18 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111055", "story_v_out_410111.awb") ~= 0 then
					local var_224_21 = manager.audio:GetVoiceLength("story_v_out_410111", "410111055", "story_v_out_410111.awb") / 1000

					if var_224_21 + var_224_13 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_21 + var_224_13
					end

					if var_224_16.prefab_name ~= "" and arg_221_1.actors_[var_224_16.prefab_name] ~= nil then
						local var_224_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_16.prefab_name].transform, "story_v_out_410111", "410111055", "story_v_out_410111.awb")

						arg_221_1:RecordAudio("410111055", var_224_22)
						arg_221_1:RecordAudio("410111055", var_224_22)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_410111", "410111055", "story_v_out_410111.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_410111", "410111055", "story_v_out_410111.awb")
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
	Play410111056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 410111056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play410111057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = "STblack"

			if arg_225_1.bgs_[var_228_0] == nil then
				local var_228_1 = Object.Instantiate(arg_225_1.paintGo_)

				var_228_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_228_0)
				var_228_1.name = var_228_0
				var_228_1.transform.parent = arg_225_1.stage_.transform
				var_228_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_225_1.bgs_[var_228_0] = var_228_1
			end

			local var_228_2 = 2

			if var_228_2 < arg_225_1.time_ and arg_225_1.time_ <= var_228_2 + arg_228_0 then
				local var_228_3 = manager.ui.mainCamera.transform.localPosition
				local var_228_4 = Vector3.New(0, 0, 10) + Vector3.New(var_228_3.x, var_228_3.y, 0)
				local var_228_5 = arg_225_1.bgs_.STblack

				var_228_5.transform.localPosition = var_228_4
				var_228_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_228_6 = var_228_5:GetComponent("SpriteRenderer")

				if var_228_6 and var_228_6.sprite then
					local var_228_7 = (var_228_5.transform.localPosition - var_228_3).z
					local var_228_8 = manager.ui.mainCameraCom_
					local var_228_9 = 2 * var_228_7 * Mathf.Tan(var_228_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_228_10 = var_228_9 * var_228_8.aspect
					local var_228_11 = var_228_6.sprite.bounds.size.x
					local var_228_12 = var_228_6.sprite.bounds.size.y
					local var_228_13 = var_228_10 / var_228_11
					local var_228_14 = var_228_9 / var_228_12
					local var_228_15 = var_228_14 < var_228_13 and var_228_13 or var_228_14

					var_228_5.transform.localScale = Vector3.New(var_228_15, var_228_15, 0)
				end

				for iter_228_0, iter_228_1 in pairs(arg_225_1.bgs_) do
					if iter_228_0 ~= "STblack" then
						iter_228_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_228_16 = 0

			if var_228_16 < arg_225_1.time_ and arg_225_1.time_ <= var_228_16 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_17 = 2

			if var_228_16 <= arg_225_1.time_ and arg_225_1.time_ < var_228_16 + var_228_17 then
				local var_228_18 = (arg_225_1.time_ - var_228_16) / var_228_17
				local var_228_19 = Color.New(0, 0, 0)

				var_228_19.a = Mathf.Lerp(0, 1, var_228_18)
				arg_225_1.mask_.color = var_228_19
			end

			if arg_225_1.time_ >= var_228_16 + var_228_17 and arg_225_1.time_ < var_228_16 + var_228_17 + arg_228_0 then
				local var_228_20 = Color.New(0, 0, 0)

				var_228_20.a = 1
				arg_225_1.mask_.color = var_228_20
			end

			local var_228_21 = 2

			if var_228_21 < arg_225_1.time_ and arg_225_1.time_ <= var_228_21 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_22 = 0.5

			if var_228_21 <= arg_225_1.time_ and arg_225_1.time_ < var_228_21 + var_228_22 then
				local var_228_23 = (arg_225_1.time_ - var_228_21) / var_228_22
				local var_228_24 = Color.New(0, 0, 0)

				var_228_24.a = Mathf.Lerp(1, 0, var_228_23)
				arg_225_1.mask_.color = var_228_24
			end

			if arg_225_1.time_ >= var_228_21 + var_228_22 and arg_225_1.time_ < var_228_21 + var_228_22 + arg_228_0 then
				local var_228_25 = Color.New(0, 0, 0)
				local var_228_26 = 0

				arg_225_1.mask_.enabled = false
				var_228_25.a = var_228_26
				arg_225_1.mask_.color = var_228_25
			end

			local var_228_27 = arg_225_1.actors_["10062"].transform
			local var_228_28 = 0

			if var_228_28 < arg_225_1.time_ and arg_225_1.time_ <= var_228_28 + arg_228_0 then
				arg_225_1.var_.moveOldPos10062 = var_228_27.localPosition
				var_228_27.localScale = Vector3.New(1, 1, 1)

				arg_225_1:CheckSpriteTmpPos("10062", 7)

				local var_228_29 = var_228_27.childCount

				for iter_228_2 = 0, var_228_29 - 1 do
					local var_228_30 = var_228_27:GetChild(iter_228_2)

					if var_228_30.name == "" or not string.find(var_228_30.name, "split") then
						var_228_30.gameObject:SetActive(true)
					else
						var_228_30.gameObject:SetActive(false)
					end
				end
			end

			local var_228_31 = 0.001

			if var_228_28 <= arg_225_1.time_ and arg_225_1.time_ < var_228_28 + var_228_31 then
				local var_228_32 = (arg_225_1.time_ - var_228_28) / var_228_31
				local var_228_33 = Vector3.New(0, -2000, -290)

				var_228_27.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos10062, var_228_33, var_228_32)
			end

			if arg_225_1.time_ >= var_228_28 + var_228_31 and arg_225_1.time_ < var_228_28 + var_228_31 + arg_228_0 then
				var_228_27.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_228_34 = arg_225_1.actors_["10062"]
			local var_228_35 = 0

			if var_228_35 < arg_225_1.time_ and arg_225_1.time_ <= var_228_35 + arg_228_0 and arg_225_1.var_.actorSpriteComps10062 == nil then
				arg_225_1.var_.actorSpriteComps10062 = var_228_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_36 = 0.034

			if var_228_35 <= arg_225_1.time_ and arg_225_1.time_ < var_228_35 + var_228_36 then
				local var_228_37 = (arg_225_1.time_ - var_228_35) / var_228_36

				if arg_225_1.var_.actorSpriteComps10062 then
					for iter_228_3, iter_228_4 in pairs(arg_225_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_228_4 then
							local var_228_38 = Mathf.Lerp(iter_228_4.color.r, 0.5, var_228_37)

							iter_228_4.color = Color.New(var_228_38, var_228_38, var_228_38)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_35 + var_228_36 and arg_225_1.time_ < var_228_35 + var_228_36 + arg_228_0 and arg_225_1.var_.actorSpriteComps10062 then
				local var_228_39 = 0.5

				for iter_228_5, iter_228_6 in pairs(arg_225_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_228_6 then
						iter_228_6.color = Color.New(var_228_39, var_228_39, var_228_39)
					end
				end

				arg_225_1.var_.actorSpriteComps10062 = nil
			end

			local var_228_40 = 0
			local var_228_41 = 1

			if var_228_40 < arg_225_1.time_ and arg_225_1.time_ <= var_228_40 + arg_228_0 then
				local var_228_42 = "play"
				local var_228_43 = "effect"

				arg_225_1:AudioAction(var_228_42, var_228_43, "se_story_128", "se_story_128_metal", "")
			end

			local var_228_44 = 0
			local var_228_45 = 1.475

			if var_228_44 < arg_225_1.time_ and arg_225_1.time_ <= var_228_44 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0

				arg_225_1.dialog_:SetActive(true)

				local var_228_46 = LeanTween.value(arg_225_1.dialog_, 0, 1, 0.3)

				var_228_46:setOnUpdate(LuaHelper.FloatAction(function(arg_229_0)
					arg_225_1.dialogCg_.alpha = arg_229_0
				end))
				var_228_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_225_1.dialog_)
					var_228_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_225_1.duration_ = arg_225_1.duration_ + 0.3

				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_47 = arg_225_1:GetWordFromCfg(410111056)
				local var_228_48 = arg_225_1:FormatText(var_228_47.content)

				arg_225_1.text_.text = var_228_48

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_49 = 59
				local var_228_50 = utf8.len(var_228_48)
				local var_228_51 = var_228_49 <= 0 and var_228_45 or var_228_45 * (var_228_50 / var_228_49)

				if var_228_51 > 0 and var_228_45 < var_228_51 then
					arg_225_1.talkMaxDuration = var_228_51
					var_228_44 = var_228_44 + 0.3

					if var_228_51 + var_228_44 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_51 + var_228_44
					end
				end

				arg_225_1.text_.text = var_228_48
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_52 = var_228_44 + 0.3
			local var_228_53 = math.max(var_228_45, arg_225_1.talkMaxDuration)

			if var_228_52 <= arg_225_1.time_ and arg_225_1.time_ < var_228_52 + var_228_53 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_52) / var_228_53

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_52 + var_228_53 and arg_225_1.time_ < var_228_52 + var_228_53 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play410111057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410111057
		arg_231_1.duration_ = 7

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play410111058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = "L03g"

			if arg_231_1.bgs_[var_234_0] == nil then
				local var_234_1 = Object.Instantiate(arg_231_1.paintGo_)

				var_234_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_234_0)
				var_234_1.name = var_234_0
				var_234_1.transform.parent = arg_231_1.stage_.transform
				var_234_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_231_1.bgs_[var_234_0] = var_234_1
			end

			local var_234_2 = 0

			if var_234_2 < arg_231_1.time_ and arg_231_1.time_ <= var_234_2 + arg_234_0 then
				local var_234_3 = manager.ui.mainCamera.transform.localPosition
				local var_234_4 = Vector3.New(0, 0, 10) + Vector3.New(var_234_3.x, var_234_3.y, 0)
				local var_234_5 = arg_231_1.bgs_.L03g

				var_234_5.transform.localPosition = var_234_4
				var_234_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_234_6 = var_234_5:GetComponent("SpriteRenderer")

				if var_234_6 and var_234_6.sprite then
					local var_234_7 = (var_234_5.transform.localPosition - var_234_3).z
					local var_234_8 = manager.ui.mainCameraCom_
					local var_234_9 = 2 * var_234_7 * Mathf.Tan(var_234_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_234_10 = var_234_9 * var_234_8.aspect
					local var_234_11 = var_234_6.sprite.bounds.size.x
					local var_234_12 = var_234_6.sprite.bounds.size.y
					local var_234_13 = var_234_10 / var_234_11
					local var_234_14 = var_234_9 / var_234_12
					local var_234_15 = var_234_14 < var_234_13 and var_234_13 or var_234_14

					var_234_5.transform.localScale = Vector3.New(var_234_15, var_234_15, 0)
				end

				for iter_234_0, iter_234_1 in pairs(arg_231_1.bgs_) do
					if iter_234_0 ~= "L03g" then
						iter_234_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_234_16 = 0

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 then
				arg_231_1.mask_.enabled = true
				arg_231_1.mask_.raycastTarget = true

				arg_231_1:SetGaussion(false)
			end

			local var_234_17 = 2

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_17 then
				local var_234_18 = (arg_231_1.time_ - var_234_16) / var_234_17
				local var_234_19 = Color.New(0, 0, 0)

				var_234_19.a = Mathf.Lerp(1, 0, var_234_18)
				arg_231_1.mask_.color = var_234_19
			end

			if arg_231_1.time_ >= var_234_16 + var_234_17 and arg_231_1.time_ < var_234_16 + var_234_17 + arg_234_0 then
				local var_234_20 = Color.New(0, 0, 0)
				local var_234_21 = 0

				arg_231_1.mask_.enabled = false
				var_234_20.a = var_234_21
				arg_231_1.mask_.color = var_234_20
			end

			if arg_231_1.frameCnt_ <= 1 then
				arg_231_1.dialog_:SetActive(false)
			end

			local var_234_22 = 2
			local var_234_23 = 1.175

			if var_234_22 < arg_231_1.time_ and arg_231_1.time_ <= var_234_22 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0

				arg_231_1.dialog_:SetActive(true)

				local var_234_24 = LeanTween.value(arg_231_1.dialog_, 0, 1, 0.3)

				var_234_24:setOnUpdate(LuaHelper.FloatAction(function(arg_235_0)
					arg_231_1.dialogCg_.alpha = arg_235_0
				end))
				var_234_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_231_1.dialog_)
					var_234_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_231_1.duration_ = arg_231_1.duration_ + 0.3

				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_25 = arg_231_1:GetWordFromCfg(410111057)
				local var_234_26 = arg_231_1:FormatText(var_234_25.content)

				arg_231_1.text_.text = var_234_26

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_27 = 47
				local var_234_28 = utf8.len(var_234_26)
				local var_234_29 = var_234_27 <= 0 and var_234_23 or var_234_23 * (var_234_28 / var_234_27)

				if var_234_29 > 0 and var_234_23 < var_234_29 then
					arg_231_1.talkMaxDuration = var_234_29
					var_234_22 = var_234_22 + 0.3

					if var_234_29 + var_234_22 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_29 + var_234_22
					end
				end

				arg_231_1.text_.text = var_234_26
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_30 = var_234_22 + 0.3
			local var_234_31 = math.max(var_234_23, arg_231_1.talkMaxDuration)

			if var_234_30 <= arg_231_1.time_ and arg_231_1.time_ < var_234_30 + var_234_31 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_30) / var_234_31

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_30 + var_234_31 and arg_231_1.time_ < var_234_30 + var_234_31 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410111058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 410111058
		arg_237_1.duration_ = 11.533

		local var_237_0 = {
			zh = 5.066,
			ja = 11.533
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
				arg_237_0:Play410111059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1060"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos1060 = var_240_0.localPosition
				var_240_0.localScale = Vector3.New(1, 1, 1)

				arg_237_1:CheckSpriteTmpPos("1060", 3)

				local var_240_2 = var_240_0.childCount

				for iter_240_0 = 0, var_240_2 - 1 do
					local var_240_3 = var_240_0:GetChild(iter_240_0)

					if var_240_3.name == "split_3" or not string.find(var_240_3.name, "split") then
						var_240_3.gameObject:SetActive(true)
					else
						var_240_3.gameObject:SetActive(false)
					end
				end
			end

			local var_240_4 = 0.001

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_4 then
				local var_240_5 = (arg_237_1.time_ - var_240_1) / var_240_4
				local var_240_6 = Vector3.New(0, -435, -40)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1060, var_240_6, var_240_5)
			end

			if arg_237_1.time_ >= var_240_1 + var_240_4 and arg_237_1.time_ < var_240_1 + var_240_4 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_240_7 = arg_237_1.actors_["1060"]
			local var_240_8 = 0

			if var_240_8 < arg_237_1.time_ and arg_237_1.time_ <= var_240_8 + arg_240_0 and arg_237_1.var_.actorSpriteComps1060 == nil then
				arg_237_1.var_.actorSpriteComps1060 = var_240_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_9 = 0.034

			if var_240_8 <= arg_237_1.time_ and arg_237_1.time_ < var_240_8 + var_240_9 then
				local var_240_10 = (arg_237_1.time_ - var_240_8) / var_240_9

				if arg_237_1.var_.actorSpriteComps1060 then
					for iter_240_1, iter_240_2 in pairs(arg_237_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_240_2 then
							local var_240_11 = Mathf.Lerp(iter_240_2.color.r, 1, var_240_10)

							iter_240_2.color = Color.New(var_240_11, var_240_11, var_240_11)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_8 + var_240_9 and arg_237_1.time_ < var_240_8 + var_240_9 + arg_240_0 and arg_237_1.var_.actorSpriteComps1060 then
				local var_240_12 = 1

				for iter_240_3, iter_240_4 in pairs(arg_237_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_240_4 then
						iter_240_4.color = Color.New(var_240_12, var_240_12, var_240_12)
					end
				end

				arg_237_1.var_.actorSpriteComps1060 = nil
			end

			local var_240_13 = 0
			local var_240_14 = 0.575

			if var_240_13 < arg_237_1.time_ and arg_237_1.time_ <= var_240_13 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_15 = arg_237_1:FormatText(StoryNameCfg[584].name)

				arg_237_1.leftNameTxt_.text = var_240_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_16 = arg_237_1:GetWordFromCfg(410111058)
				local var_240_17 = arg_237_1:FormatText(var_240_16.content)

				arg_237_1.text_.text = var_240_17

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_18 = 23
				local var_240_19 = utf8.len(var_240_17)
				local var_240_20 = var_240_18 <= 0 and var_240_14 or var_240_14 * (var_240_19 / var_240_18)

				if var_240_20 > 0 and var_240_14 < var_240_20 then
					arg_237_1.talkMaxDuration = var_240_20

					if var_240_20 + var_240_13 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_20 + var_240_13
					end
				end

				arg_237_1.text_.text = var_240_17
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111058", "story_v_out_410111.awb") ~= 0 then
					local var_240_21 = manager.audio:GetVoiceLength("story_v_out_410111", "410111058", "story_v_out_410111.awb") / 1000

					if var_240_21 + var_240_13 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_21 + var_240_13
					end

					if var_240_16.prefab_name ~= "" and arg_237_1.actors_[var_240_16.prefab_name] ~= nil then
						local var_240_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_16.prefab_name].transform, "story_v_out_410111", "410111058", "story_v_out_410111.awb")

						arg_237_1:RecordAudio("410111058", var_240_22)
						arg_237_1:RecordAudio("410111058", var_240_22)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_410111", "410111058", "story_v_out_410111.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_410111", "410111058", "story_v_out_410111.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_23 = math.max(var_240_14, arg_237_1.talkMaxDuration)

			if var_240_13 <= arg_237_1.time_ and arg_237_1.time_ < var_240_13 + var_240_23 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_13) / var_240_23

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_13 + var_240_23 and arg_237_1.time_ < var_240_13 + var_240_23 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play410111059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 410111059
		arg_241_1.duration_ = 14.199999999999

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play410111060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_1 = 3

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_1 then
				local var_244_2 = (arg_241_1.time_ - var_244_0) / var_244_1
				local var_244_3 = Color.New(0, 0, 0)

				var_244_3.a = Mathf.Lerp(0, 1, var_244_2)
				arg_241_1.mask_.color = var_244_3
			end

			if arg_241_1.time_ >= var_244_0 + var_244_1 and arg_241_1.time_ < var_244_0 + var_244_1 + arg_244_0 then
				local var_244_4 = Color.New(0, 0, 0)

				var_244_4.a = 1
				arg_241_1.mask_.color = var_244_4
			end

			local var_244_5 = 3

			if var_244_5 < arg_241_1.time_ and arg_241_1.time_ <= var_244_5 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_6 = 1

			if var_244_5 <= arg_241_1.time_ and arg_241_1.time_ < var_244_5 + var_244_6 then
				local var_244_7 = (arg_241_1.time_ - var_244_5) / var_244_6
				local var_244_8 = Color.New(0, 0, 0)

				var_244_8.a = Mathf.Lerp(1, 0, var_244_7)
				arg_241_1.mask_.color = var_244_8
			end

			if arg_241_1.time_ >= var_244_5 + var_244_6 and arg_241_1.time_ < var_244_5 + var_244_6 + arg_244_0 then
				local var_244_9 = Color.New(0, 0, 0)
				local var_244_10 = 0

				arg_241_1.mask_.enabled = false
				var_244_9.a = var_244_10
				arg_241_1.mask_.color = var_244_9
			end

			local var_244_11 = 4

			if var_244_11 < arg_241_1.time_ and arg_241_1.time_ <= var_244_11 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_12 = 1

			if var_244_11 <= arg_241_1.time_ and arg_241_1.time_ < var_244_11 + var_244_12 then
				local var_244_13 = (arg_241_1.time_ - var_244_11) / var_244_12
				local var_244_14 = Color.New(0, 0, 0)

				var_244_14.a = Mathf.Lerp(0, 1, var_244_13)
				arg_241_1.mask_.color = var_244_14
			end

			if arg_241_1.time_ >= var_244_11 + var_244_12 and arg_241_1.time_ < var_244_11 + var_244_12 + arg_244_0 then
				local var_244_15 = Color.New(0, 0, 0)

				var_244_15.a = 1
				arg_241_1.mask_.color = var_244_15
			end

			local var_244_16 = 7

			if var_244_16 < arg_241_1.time_ and arg_241_1.time_ <= var_244_16 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_17 = 2

			if var_244_16 <= arg_241_1.time_ and arg_241_1.time_ < var_244_16 + var_244_17 then
				local var_244_18 = (arg_241_1.time_ - var_244_16) / var_244_17
				local var_244_19 = Color.New(0, 0, 0)

				var_244_19.a = Mathf.Lerp(1, 0, var_244_18)
				arg_241_1.mask_.color = var_244_19
			end

			if arg_241_1.time_ >= var_244_16 + var_244_17 and arg_241_1.time_ < var_244_16 + var_244_17 + arg_244_0 then
				local var_244_20 = Color.New(0, 0, 0)
				local var_244_21 = 0

				arg_241_1.mask_.enabled = false
				var_244_20.a = var_244_21
				arg_241_1.mask_.color = var_244_20
			end

			local var_244_22 = 5

			if var_244_22 < arg_241_1.time_ and arg_241_1.time_ <= var_244_22 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_23 = 1

			if var_244_22 <= arg_241_1.time_ and arg_241_1.time_ < var_244_22 + var_244_23 then
				local var_244_24 = (arg_241_1.time_ - var_244_22) / var_244_23
				local var_244_25 = Color.New(0, 0, 0)

				var_244_25.a = Mathf.Lerp(1, 0, var_244_24)
				arg_241_1.mask_.color = var_244_25
			end

			if arg_241_1.time_ >= var_244_22 + var_244_23 and arg_241_1.time_ < var_244_22 + var_244_23 + arg_244_0 then
				local var_244_26 = Color.New(0, 0, 0)
				local var_244_27 = 0

				arg_241_1.mask_.enabled = false
				var_244_26.a = var_244_27
				arg_241_1.mask_.color = var_244_26
			end

			local var_244_28 = 6

			if var_244_28 < arg_241_1.time_ and arg_241_1.time_ <= var_244_28 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_29 = 1

			if var_244_28 <= arg_241_1.time_ and arg_241_1.time_ < var_244_28 + var_244_29 then
				local var_244_30 = (arg_241_1.time_ - var_244_28) / var_244_29
				local var_244_31 = Color.New(0, 0, 0)

				var_244_31.a = Mathf.Lerp(0, 1, var_244_30)
				arg_241_1.mask_.color = var_244_31
			end

			if arg_241_1.time_ >= var_244_28 + var_244_29 and arg_241_1.time_ < var_244_28 + var_244_29 + arg_244_0 then
				local var_244_32 = Color.New(0, 0, 0)

				var_244_32.a = 1
				arg_241_1.mask_.color = var_244_32
			end

			local var_244_33 = arg_241_1.actors_["1060"].transform
			local var_244_34 = 3

			if var_244_34 < arg_241_1.time_ and arg_241_1.time_ <= var_244_34 + arg_244_0 then
				arg_241_1.var_.moveOldPos1060 = var_244_33.localPosition
				var_244_33.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("1060", 7)

				local var_244_35 = var_244_33.childCount

				for iter_244_0 = 0, var_244_35 - 1 do
					local var_244_36 = var_244_33:GetChild(iter_244_0)

					if var_244_36.name == "" or not string.find(var_244_36.name, "split") then
						var_244_36.gameObject:SetActive(true)
					else
						var_244_36.gameObject:SetActive(false)
					end
				end
			end

			local var_244_37 = 0.001

			if var_244_34 <= arg_241_1.time_ and arg_241_1.time_ < var_244_34 + var_244_37 then
				local var_244_38 = (arg_241_1.time_ - var_244_34) / var_244_37
				local var_244_39 = Vector3.New(0, -2000, -40)

				var_244_33.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1060, var_244_39, var_244_38)
			end

			if arg_241_1.time_ >= var_244_34 + var_244_37 and arg_241_1.time_ < var_244_34 + var_244_37 + arg_244_0 then
				var_244_33.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_244_40 = arg_241_1.actors_["1060"]
			local var_244_41 = 3

			if var_244_41 < arg_241_1.time_ and arg_241_1.time_ <= var_244_41 + arg_244_0 and arg_241_1.var_.actorSpriteComps1060 == nil then
				arg_241_1.var_.actorSpriteComps1060 = var_244_40:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_42 = 0.034

			if var_244_41 <= arg_241_1.time_ and arg_241_1.time_ < var_244_41 + var_244_42 then
				local var_244_43 = (arg_241_1.time_ - var_244_41) / var_244_42

				if arg_241_1.var_.actorSpriteComps1060 then
					for iter_244_1, iter_244_2 in pairs(arg_241_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_244_2 then
							local var_244_44 = Mathf.Lerp(iter_244_2.color.r, 0.5, var_244_43)

							iter_244_2.color = Color.New(var_244_44, var_244_44, var_244_44)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_41 + var_244_42 and arg_241_1.time_ < var_244_41 + var_244_42 + arg_244_0 and arg_241_1.var_.actorSpriteComps1060 then
				local var_244_45 = 0.5

				for iter_244_3, iter_244_4 in pairs(arg_241_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_244_4 then
						iter_244_4.color = Color.New(var_244_45, var_244_45, var_244_45)
					end
				end

				arg_241_1.var_.actorSpriteComps1060 = nil
			end

			local var_244_46 = "LZ0106"

			if arg_241_1.bgs_[var_244_46] == nil then
				local var_244_47 = Object.Instantiate(arg_241_1.paintGo_)

				var_244_47:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_244_46)
				var_244_47.name = var_244_46
				var_244_47.transform.parent = arg_241_1.stage_.transform
				var_244_47.transform.localPosition = Vector3.New(0, 100, 0)
				arg_241_1.bgs_[var_244_46] = var_244_47
			end

			local var_244_48 = arg_241_1.bgs_.LZ0106.transform
			local var_244_49 = 3

			if var_244_49 < arg_241_1.time_ and arg_241_1.time_ <= var_244_49 + arg_244_0 then
				arg_241_1.var_.moveOldPosLZ0106 = var_244_48.localPosition
			end

			local var_244_50 = 0.001

			if var_244_49 <= arg_241_1.time_ and arg_241_1.time_ < var_244_49 + var_244_50 then
				local var_244_51 = (arg_241_1.time_ - var_244_49) / var_244_50
				local var_244_52 = Vector3.New(6, 2.7, 0.25)

				var_244_48.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPosLZ0106, var_244_52, var_244_51)
			end

			if arg_241_1.time_ >= var_244_49 + var_244_50 and arg_241_1.time_ < var_244_49 + var_244_50 + arg_244_0 then
				var_244_48.localPosition = Vector3.New(6, 2.7, 0.25)
			end

			local var_244_53 = arg_241_1.bgs_.LZ0106.transform
			local var_244_54 = 5

			if var_244_54 < arg_241_1.time_ and arg_241_1.time_ <= var_244_54 + arg_244_0 then
				arg_241_1.var_.moveOldPosLZ0106 = var_244_53.localPosition
			end

			local var_244_55 = 0.001

			if var_244_54 <= arg_241_1.time_ and arg_241_1.time_ < var_244_54 + var_244_55 then
				local var_244_56 = (arg_241_1.time_ - var_244_54) / var_244_55
				local var_244_57 = Vector3.New(-4.5, 2.7, 0.25)

				var_244_53.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPosLZ0106, var_244_57, var_244_56)
			end

			if arg_241_1.time_ >= var_244_54 + var_244_55 and arg_241_1.time_ < var_244_54 + var_244_55 + arg_244_0 then
				var_244_53.localPosition = Vector3.New(-4.5, 2.7, 0.25)
			end

			local var_244_58 = arg_241_1.bgs_.LZ0106.transform
			local var_244_59 = 7

			if var_244_59 < arg_241_1.time_ and arg_241_1.time_ <= var_244_59 + arg_244_0 then
				arg_241_1.var_.moveOldPosLZ0106 = var_244_58.localPosition
			end

			local var_244_60 = 0.001

			if var_244_59 <= arg_241_1.time_ and arg_241_1.time_ < var_244_59 + var_244_60 then
				local var_244_61 = (arg_241_1.time_ - var_244_59) / var_244_60
				local var_244_62 = Vector3.New(0, 1, 10)

				var_244_58.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPosLZ0106, var_244_62, var_244_61)
			end

			if arg_241_1.time_ >= var_244_59 + var_244_60 and arg_241_1.time_ < var_244_59 + var_244_60 + arg_244_0 then
				var_244_58.localPosition = Vector3.New(0, 1, 10)
			end

			local var_244_63 = arg_241_1.bgs_.LZ0106.transform
			local var_244_64 = 7.034

			if var_244_64 < arg_241_1.time_ and arg_241_1.time_ <= var_244_64 + arg_244_0 then
				arg_241_1.var_.moveOldPosLZ0106 = var_244_63.localPosition
			end

			local var_244_65 = 7.166

			if var_244_64 <= arg_241_1.time_ and arg_241_1.time_ < var_244_64 + var_244_65 then
				local var_244_66 = (arg_241_1.time_ - var_244_64) / var_244_65
				local var_244_67 = Vector3.New(0, 1, 9)

				var_244_63.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPosLZ0106, var_244_67, var_244_66)
			end

			if arg_241_1.time_ >= var_244_64 + var_244_65 and arg_241_1.time_ < var_244_64 + var_244_65 + arg_244_0 then
				var_244_63.localPosition = Vector3.New(0, 1, 9)
			end

			if arg_241_1.frameCnt_ <= 1 then
				arg_241_1.dialog_:SetActive(false)
			end

			local var_244_68 = 8.99999999999999
			local var_244_69 = 1.375

			if var_244_68 < arg_241_1.time_ and arg_241_1.time_ <= var_244_68 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0

				arg_241_1.dialog_:SetActive(true)

				local var_244_70 = LeanTween.value(arg_241_1.dialog_, 0, 1, 0.3)

				var_244_70:setOnUpdate(LuaHelper.FloatAction(function(arg_245_0)
					arg_241_1.dialogCg_.alpha = arg_245_0
				end))
				var_244_70:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_241_1.dialog_)
					var_244_70:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_241_1.duration_ = arg_241_1.duration_ + 0.3

				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_71 = arg_241_1:GetWordFromCfg(410111059)
				local var_244_72 = arg_241_1:FormatText(var_244_71.content)

				arg_241_1.text_.text = var_244_72

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_73 = 55
				local var_244_74 = utf8.len(var_244_72)
				local var_244_75 = var_244_73 <= 0 and var_244_69 or var_244_69 * (var_244_74 / var_244_73)

				if var_244_75 > 0 and var_244_69 < var_244_75 then
					arg_241_1.talkMaxDuration = var_244_75
					var_244_68 = var_244_68 + 0.3

					if var_244_75 + var_244_68 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_75 + var_244_68
					end
				end

				arg_241_1.text_.text = var_244_72
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_76 = var_244_68 + 0.3
			local var_244_77 = math.max(var_244_69, arg_241_1.talkMaxDuration)

			if var_244_76 <= arg_241_1.time_ and arg_241_1.time_ < var_244_76 + var_244_77 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_76) / var_244_77

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_76 + var_244_77 and arg_241_1.time_ < var_244_76 + var_244_77 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play410111060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410111060
		arg_247_1.duration_ = 6.333

		local var_247_0 = {
			zh = 3.633,
			ja = 6.333
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
				arg_247_0:Play410111061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.25

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[600].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, true)
				arg_247_1.iconController_:SetSelectedState("hero")

				arg_247_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10062_split_3")

				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(410111060)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111060", "story_v_out_410111.awb") ~= 0 then
					local var_250_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111060", "story_v_out_410111.awb") / 1000

					if var_250_8 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_8 + var_250_0
					end

					if var_250_3.prefab_name ~= "" and arg_247_1.actors_[var_250_3.prefab_name] ~= nil then
						local var_250_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_3.prefab_name].transform, "story_v_out_410111", "410111060", "story_v_out_410111.awb")

						arg_247_1:RecordAudio("410111060", var_250_9)
						arg_247_1:RecordAudio("410111060", var_250_9)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410111", "410111060", "story_v_out_410111.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410111", "410111060", "story_v_out_410111.awb")
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
	Play410111061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410111061
		arg_251_1.duration_ = 7.6

		local var_251_0 = {
			zh = 6.9,
			ja = 7.6
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
				arg_251_0:Play410111062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.85

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[584].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(410111061)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 34
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111061", "story_v_out_410111.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111061", "story_v_out_410111.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_410111", "410111061", "story_v_out_410111.awb")

						arg_251_1:RecordAudio("410111061", var_254_9)
						arg_251_1:RecordAudio("410111061", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_410111", "410111061", "story_v_out_410111.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_410111", "410111061", "story_v_out_410111.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_10 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_10 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_10

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_10 and arg_251_1.time_ < var_254_0 + var_254_10 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play410111062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410111062
		arg_255_1.duration_ = 18.666

		local var_255_0 = {
			zh = 6.066,
			ja = 18.666
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
				arg_255_0:Play410111063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.65

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[600].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, true)
				arg_255_1.iconController_:SetSelectedState("hero")

				arg_255_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10062_split_4")

				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(410111062)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111062", "story_v_out_410111.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111062", "story_v_out_410111.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_410111", "410111062", "story_v_out_410111.awb")

						arg_255_1:RecordAudio("410111062", var_258_9)
						arg_255_1:RecordAudio("410111062", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_410111", "410111062", "story_v_out_410111.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_410111", "410111062", "story_v_out_410111.awb")
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
	Play410111063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410111063
		arg_259_1.duration_ = 5.733

		local var_259_0 = {
			zh = 3.133,
			ja = 5.733
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
				arg_259_0:Play410111064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.375

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[584].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(410111063)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 15
				local var_262_6 = utf8.len(var_262_4)
				local var_262_7 = var_262_5 <= 0 and var_262_1 or var_262_1 * (var_262_6 / var_262_5)

				if var_262_7 > 0 and var_262_1 < var_262_7 then
					arg_259_1.talkMaxDuration = var_262_7

					if var_262_7 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_7 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_4
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111063", "story_v_out_410111.awb") ~= 0 then
					local var_262_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111063", "story_v_out_410111.awb") / 1000

					if var_262_8 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_8 + var_262_0
					end

					if var_262_3.prefab_name ~= "" and arg_259_1.actors_[var_262_3.prefab_name] ~= nil then
						local var_262_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_3.prefab_name].transform, "story_v_out_410111", "410111063", "story_v_out_410111.awb")

						arg_259_1:RecordAudio("410111063", var_262_9)
						arg_259_1:RecordAudio("410111063", var_262_9)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410111", "410111063", "story_v_out_410111.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410111", "410111063", "story_v_out_410111.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_10 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_10 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_10

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_10 and arg_259_1.time_ < var_262_0 + var_262_10 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410111064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410111064
		arg_263_1.duration_ = 12.2

		local var_263_0 = {
			zh = 8.766,
			ja = 12.2
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
				arg_263_0:Play410111065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 1.075

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[584].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(410111064)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111064", "story_v_out_410111.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111064", "story_v_out_410111.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_out_410111", "410111064", "story_v_out_410111.awb")

						arg_263_1:RecordAudio("410111064", var_266_9)
						arg_263_1:RecordAudio("410111064", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_410111", "410111064", "story_v_out_410111.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_410111", "410111064", "story_v_out_410111.awb")
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
	Play410111065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410111065
		arg_267_1.duration_ = 7.6

		local var_267_0 = {
			zh = 2.633,
			ja = 7.6
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
				arg_267_0:Play410111066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.375

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[596].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, true)
				arg_267_1.iconController_:SetSelectedState("hero")

				arg_267_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_2")

				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(410111065)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111065", "story_v_out_410111.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111065", "story_v_out_410111.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_410111", "410111065", "story_v_out_410111.awb")

						arg_267_1:RecordAudio("410111065", var_270_9)
						arg_267_1:RecordAudio("410111065", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_410111", "410111065", "story_v_out_410111.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_410111", "410111065", "story_v_out_410111.awb")
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
	Play410111066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410111066
		arg_271_1.duration_ = 9.9

		local var_271_0 = {
			zh = 8.866,
			ja = 9.9
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
				arg_271_0:Play410111067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 0.825

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_2 = arg_271_1:FormatText(StoryNameCfg[584].name)

				arg_271_1.leftNameTxt_.text = var_274_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_3 = arg_271_1:GetWordFromCfg(410111066)
				local var_274_4 = arg_271_1:FormatText(var_274_3.content)

				arg_271_1.text_.text = var_274_4

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_5 = 33
				local var_274_6 = utf8.len(var_274_4)
				local var_274_7 = var_274_5 <= 0 and var_274_1 or var_274_1 * (var_274_6 / var_274_5)

				if var_274_7 > 0 and var_274_1 < var_274_7 then
					arg_271_1.talkMaxDuration = var_274_7

					if var_274_7 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_7 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_4
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111066", "story_v_out_410111.awb") ~= 0 then
					local var_274_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111066", "story_v_out_410111.awb") / 1000

					if var_274_8 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_0
					end

					if var_274_3.prefab_name ~= "" and arg_271_1.actors_[var_274_3.prefab_name] ~= nil then
						local var_274_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_3.prefab_name].transform, "story_v_out_410111", "410111066", "story_v_out_410111.awb")

						arg_271_1:RecordAudio("410111066", var_274_9)
						arg_271_1:RecordAudio("410111066", var_274_9)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_410111", "410111066", "story_v_out_410111.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_410111", "410111066", "story_v_out_410111.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_10 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_10 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_10

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_10 and arg_271_1.time_ < var_274_0 + var_274_10 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410111067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 410111067
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play410111068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 1.025

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, false)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_2 = arg_275_1:GetWordFromCfg(410111067)
				local var_278_3 = arg_275_1:FormatText(var_278_2.content)

				arg_275_1.text_.text = var_278_3

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_4 = 41
				local var_278_5 = utf8.len(var_278_3)
				local var_278_6 = var_278_4 <= 0 and var_278_1 or var_278_1 * (var_278_5 / var_278_4)

				if var_278_6 > 0 and var_278_1 < var_278_6 then
					arg_275_1.talkMaxDuration = var_278_6

					if var_278_6 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_6 + var_278_0
					end
				end

				arg_275_1.text_.text = var_278_3
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_7 = math.max(var_278_1, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_7 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_0) / var_278_7

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_7 and arg_275_1.time_ < var_278_0 + var_278_7 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play410111068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 410111068
		arg_279_1.duration_ = 7.53333333333333

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play410111069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 2

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				local var_282_1 = manager.ui.mainCamera.transform.localPosition
				local var_282_2 = Vector3.New(0, 0, 10) + Vector3.New(var_282_1.x, var_282_1.y, 0)
				local var_282_3 = arg_279_1.bgs_.STblack

				var_282_3.transform.localPosition = var_282_2
				var_282_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_282_4 = var_282_3:GetComponent("SpriteRenderer")

				if var_282_4 and var_282_4.sprite then
					local var_282_5 = (var_282_3.transform.localPosition - var_282_1).z
					local var_282_6 = manager.ui.mainCameraCom_
					local var_282_7 = 2 * var_282_5 * Mathf.Tan(var_282_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_282_8 = var_282_7 * var_282_6.aspect
					local var_282_9 = var_282_4.sprite.bounds.size.x
					local var_282_10 = var_282_4.sprite.bounds.size.y
					local var_282_11 = var_282_8 / var_282_9
					local var_282_12 = var_282_7 / var_282_10
					local var_282_13 = var_282_12 < var_282_11 and var_282_11 or var_282_12

					var_282_3.transform.localScale = Vector3.New(var_282_13, var_282_13, 0)
				end

				for iter_282_0, iter_282_1 in pairs(arg_279_1.bgs_) do
					if iter_282_0 ~= "STblack" then
						iter_282_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_282_14 = 0

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 then
				arg_279_1.mask_.enabled = true
				arg_279_1.mask_.raycastTarget = true

				arg_279_1:SetGaussion(false)
			end

			local var_282_15 = 2

			if var_282_14 <= arg_279_1.time_ and arg_279_1.time_ < var_282_14 + var_282_15 then
				local var_282_16 = (arg_279_1.time_ - var_282_14) / var_282_15
				local var_282_17 = Color.New(0, 0, 0)

				var_282_17.a = Mathf.Lerp(0, 1, var_282_16)
				arg_279_1.mask_.color = var_282_17
			end

			if arg_279_1.time_ >= var_282_14 + var_282_15 and arg_279_1.time_ < var_282_14 + var_282_15 + arg_282_0 then
				local var_282_18 = Color.New(0, 0, 0)

				var_282_18.a = 1
				arg_279_1.mask_.color = var_282_18
			end

			local var_282_19 = 2

			if var_282_19 < arg_279_1.time_ and arg_279_1.time_ <= var_282_19 + arg_282_0 then
				arg_279_1.mask_.enabled = true
				arg_279_1.mask_.raycastTarget = true

				arg_279_1:SetGaussion(false)
			end

			local var_282_20 = 0.533333333333333

			if var_282_19 <= arg_279_1.time_ and arg_279_1.time_ < var_282_19 + var_282_20 then
				local var_282_21 = (arg_279_1.time_ - var_282_19) / var_282_20
				local var_282_22 = Color.New(0, 0, 0)

				var_282_22.a = Mathf.Lerp(1, 0, var_282_21)
				arg_279_1.mask_.color = var_282_22
			end

			if arg_279_1.time_ >= var_282_19 + var_282_20 and arg_279_1.time_ < var_282_19 + var_282_20 + arg_282_0 then
				local var_282_23 = Color.New(0, 0, 0)
				local var_282_24 = 0

				arg_279_1.mask_.enabled = false
				var_282_23.a = var_282_24
				arg_279_1.mask_.color = var_282_23
			end

			local var_282_25 = 2.53333333333333
			local var_282_26 = 1

			if var_282_25 < arg_279_1.time_ and arg_279_1.time_ <= var_282_25 + arg_282_0 then
				local var_282_27 = "play"
				local var_282_28 = "effect"

				arg_279_1:AudioAction(var_282_27, var_282_28, "se_story_5", "se_story_5_signal", "")
			end

			if arg_279_1.frameCnt_ <= 1 then
				arg_279_1.dialog_:SetActive(false)
			end

			local var_282_29 = 2.53333333333333
			local var_282_30 = 1.2

			if var_282_29 < arg_279_1.time_ and arg_279_1.time_ <= var_282_29 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0

				arg_279_1.dialog_:SetActive(true)

				local var_282_31 = LeanTween.value(arg_279_1.dialog_, 0, 1, 0.3)

				var_282_31:setOnUpdate(LuaHelper.FloatAction(function(arg_283_0)
					arg_279_1.dialogCg_.alpha = arg_283_0
				end))
				var_282_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_279_1.dialog_)
					var_282_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_279_1.duration_ = arg_279_1.duration_ + 0.3

				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_32 = arg_279_1:GetWordFromCfg(410111068)
				local var_282_33 = arg_279_1:FormatText(var_282_32.content)

				arg_279_1.text_.text = var_282_33

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_34 = 48
				local var_282_35 = utf8.len(var_282_33)
				local var_282_36 = var_282_34 <= 0 and var_282_30 or var_282_30 * (var_282_35 / var_282_34)

				if var_282_36 > 0 and var_282_30 < var_282_36 then
					arg_279_1.talkMaxDuration = var_282_36
					var_282_29 = var_282_29 + 0.3

					if var_282_36 + var_282_29 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_36 + var_282_29
					end
				end

				arg_279_1.text_.text = var_282_33
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_37 = var_282_29 + 0.3
			local var_282_38 = math.max(var_282_30, arg_279_1.talkMaxDuration)

			if var_282_37 <= arg_279_1.time_ and arg_279_1.time_ < var_282_37 + var_282_38 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_37) / var_282_38

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_37 + var_282_38 and arg_279_1.time_ < var_282_37 + var_282_38 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play410111069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 410111069
		arg_285_1.duration_ = 2.933

		local var_285_0 = {
			zh = 2.7,
			ja = 2.933
		}
		local var_285_1 = manager.audio:GetLocalizationFlag()

		if var_285_0[var_285_1] ~= nil then
			arg_285_1.duration_ = var_285_0[var_285_1]
		end

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play410111070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.275

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[596].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_4")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(410111069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 11
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111069", "story_v_out_410111.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111069", "story_v_out_410111.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_410111", "410111069", "story_v_out_410111.awb")

						arg_285_1:RecordAudio("410111069", var_288_9)
						arg_285_1:RecordAudio("410111069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_410111", "410111069", "story_v_out_410111.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_410111", "410111069", "story_v_out_410111.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play410111070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 410111070
		arg_289_1.duration_ = 6.166

		local var_289_0 = {
			zh = 3.133,
			ja = 6.166
		}
		local var_289_1 = manager.audio:GetLocalizationFlag()

		if var_289_0[var_289_1] ~= nil then
			arg_289_1.duration_ = var_289_0[var_289_1]
		end

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play410111071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.45

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[600].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, true)
				arg_289_1.iconController_:SetSelectedState("hero")

				arg_289_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10062_split_2")

				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(410111070)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 18
				local var_292_6 = utf8.len(var_292_4)
				local var_292_7 = var_292_5 <= 0 and var_292_1 or var_292_1 * (var_292_6 / var_292_5)

				if var_292_7 > 0 and var_292_1 < var_292_7 then
					arg_289_1.talkMaxDuration = var_292_7

					if var_292_7 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_7 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_4
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111070", "story_v_out_410111.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111070", "story_v_out_410111.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_410111", "410111070", "story_v_out_410111.awb")

						arg_289_1:RecordAudio("410111070", var_292_9)
						arg_289_1:RecordAudio("410111070", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_410111", "410111070", "story_v_out_410111.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_410111", "410111070", "story_v_out_410111.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_10 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_10 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_10

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_10 and arg_289_1.time_ < var_292_0 + var_292_10 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play410111071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 410111071
		arg_293_1.duration_ = 13

		local var_293_0 = {
			zh = 8.566,
			ja = 13
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play410111072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 1.075

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[600].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, true)
				arg_293_1.iconController_:SetSelectedState("hero")

				arg_293_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10062_split_3")

				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(410111071)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 43
				local var_296_6 = utf8.len(var_296_4)
				local var_296_7 = var_296_5 <= 0 and var_296_1 or var_296_1 * (var_296_6 / var_296_5)

				if var_296_7 > 0 and var_296_1 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_4
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111071", "story_v_out_410111.awb") ~= 0 then
					local var_296_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111071", "story_v_out_410111.awb") / 1000

					if var_296_8 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_8 + var_296_0
					end

					if var_296_3.prefab_name ~= "" and arg_293_1.actors_[var_296_3.prefab_name] ~= nil then
						local var_296_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_3.prefab_name].transform, "story_v_out_410111", "410111071", "story_v_out_410111.awb")

						arg_293_1:RecordAudio("410111071", var_296_9)
						arg_293_1:RecordAudio("410111071", var_296_9)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_410111", "410111071", "story_v_out_410111.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_410111", "410111071", "story_v_out_410111.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_10 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_10 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_10

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_10 and arg_293_1.time_ < var_296_0 + var_296_10 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play410111072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 410111072
		arg_297_1.duration_ = 2.5

		local var_297_0 = {
			zh = 1.4,
			ja = 2.5
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play410111073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.125

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[596].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, true)
				arg_297_1.iconController_:SetSelectedState("hero")

				arg_297_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_2")

				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(410111072)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 5
				local var_300_6 = utf8.len(var_300_4)
				local var_300_7 = var_300_5 <= 0 and var_300_1 or var_300_1 * (var_300_6 / var_300_5)

				if var_300_7 > 0 and var_300_1 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_4
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111072", "story_v_out_410111.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111072", "story_v_out_410111.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_410111", "410111072", "story_v_out_410111.awb")

						arg_297_1:RecordAudio("410111072", var_300_9)
						arg_297_1:RecordAudio("410111072", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_410111", "410111072", "story_v_out_410111.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_410111", "410111072", "story_v_out_410111.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_10 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_10 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_10

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_10 and arg_297_1.time_ < var_300_0 + var_300_10 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play410111073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 410111073
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play410111074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.575

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_2 = arg_301_1:GetWordFromCfg(410111073)
				local var_304_3 = arg_301_1:FormatText(var_304_2.content)

				arg_301_1.text_.text = var_304_3

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_4 = 23
				local var_304_5 = utf8.len(var_304_3)
				local var_304_6 = var_304_4 <= 0 and var_304_1 or var_304_1 * (var_304_5 / var_304_4)

				if var_304_6 > 0 and var_304_1 < var_304_6 then
					arg_301_1.talkMaxDuration = var_304_6

					if var_304_6 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_6 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_3
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_7 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_7 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_7

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_7 and arg_301_1.time_ < var_304_0 + var_304_7 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play410111074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 410111074
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play410111075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.925

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_2 = arg_305_1:GetWordFromCfg(410111074)
				local var_308_3 = arg_305_1:FormatText(var_308_2.content)

				arg_305_1.text_.text = var_308_3

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_4 = 37
				local var_308_5 = utf8.len(var_308_3)
				local var_308_6 = var_308_4 <= 0 and var_308_1 or var_308_1 * (var_308_5 / var_308_4)

				if var_308_6 > 0 and var_308_1 < var_308_6 then
					arg_305_1.talkMaxDuration = var_308_6

					if var_308_6 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_6 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_3
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_7 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_7 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_7

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_7 and arg_305_1.time_ < var_308_0 + var_308_7 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play410111075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 410111075
		arg_309_1.duration_ = 6.333

		local var_309_0 = {
			zh = 5.466,
			ja = 6.333
		}
		local var_309_1 = manager.audio:GetLocalizationFlag()

		if var_309_0[var_309_1] ~= nil then
			arg_309_1.duration_ = var_309_0[var_309_1]
		end

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play410111076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.275

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[596].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, true)
				arg_309_1.iconController_:SetSelectedState("hero")

				arg_309_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_2")

				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(410111075)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 11
				local var_312_6 = utf8.len(var_312_4)
				local var_312_7 = var_312_5 <= 0 and var_312_1 or var_312_1 * (var_312_6 / var_312_5)

				if var_312_7 > 0 and var_312_1 < var_312_7 then
					arg_309_1.talkMaxDuration = var_312_7

					if var_312_7 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_7 + var_312_0
					end
				end

				arg_309_1.text_.text = var_312_4
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111075", "story_v_out_410111.awb") ~= 0 then
					local var_312_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111075", "story_v_out_410111.awb") / 1000

					if var_312_8 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_8 + var_312_0
					end

					if var_312_3.prefab_name ~= "" and arg_309_1.actors_[var_312_3.prefab_name] ~= nil then
						local var_312_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_3.prefab_name].transform, "story_v_out_410111", "410111075", "story_v_out_410111.awb")

						arg_309_1:RecordAudio("410111075", var_312_9)
						arg_309_1:RecordAudio("410111075", var_312_9)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_410111", "410111075", "story_v_out_410111.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_410111", "410111075", "story_v_out_410111.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_10 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_10 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_10

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_10 and arg_309_1.time_ < var_312_0 + var_312_10 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play410111076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 410111076
		arg_313_1.duration_ = 7

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play410111077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = "L04g"

			if arg_313_1.bgs_[var_316_0] == nil then
				local var_316_1 = Object.Instantiate(arg_313_1.paintGo_)

				var_316_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_316_0)
				var_316_1.name = var_316_0
				var_316_1.transform.parent = arg_313_1.stage_.transform
				var_316_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_313_1.bgs_[var_316_0] = var_316_1
			end

			local var_316_2 = 0

			if var_316_2 < arg_313_1.time_ and arg_313_1.time_ <= var_316_2 + arg_316_0 then
				local var_316_3 = manager.ui.mainCamera.transform.localPosition
				local var_316_4 = Vector3.New(0, 0, 10) + Vector3.New(var_316_3.x, var_316_3.y, 0)
				local var_316_5 = arg_313_1.bgs_.L04g

				var_316_5.transform.localPosition = var_316_4
				var_316_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_316_6 = var_316_5:GetComponent("SpriteRenderer")

				if var_316_6 and var_316_6.sprite then
					local var_316_7 = (var_316_5.transform.localPosition - var_316_3).z
					local var_316_8 = manager.ui.mainCameraCom_
					local var_316_9 = 2 * var_316_7 * Mathf.Tan(var_316_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_316_10 = var_316_9 * var_316_8.aspect
					local var_316_11 = var_316_6.sprite.bounds.size.x
					local var_316_12 = var_316_6.sprite.bounds.size.y
					local var_316_13 = var_316_10 / var_316_11
					local var_316_14 = var_316_9 / var_316_12
					local var_316_15 = var_316_14 < var_316_13 and var_316_13 or var_316_14

					var_316_5.transform.localScale = Vector3.New(var_316_15, var_316_15, 0)
				end

				for iter_316_0, iter_316_1 in pairs(arg_313_1.bgs_) do
					if iter_316_0 ~= "L04g" then
						iter_316_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_316_16 = 0

			if var_316_16 < arg_313_1.time_ and arg_313_1.time_ <= var_316_16 + arg_316_0 then
				arg_313_1.mask_.enabled = true
				arg_313_1.mask_.raycastTarget = true

				arg_313_1:SetGaussion(false)
			end

			local var_316_17 = 2

			if var_316_16 <= arg_313_1.time_ and arg_313_1.time_ < var_316_16 + var_316_17 then
				local var_316_18 = (arg_313_1.time_ - var_316_16) / var_316_17
				local var_316_19 = Color.New(0, 0, 0)

				var_316_19.a = Mathf.Lerp(1, 0, var_316_18)
				arg_313_1.mask_.color = var_316_19
			end

			if arg_313_1.time_ >= var_316_16 + var_316_17 and arg_313_1.time_ < var_316_16 + var_316_17 + arg_316_0 then
				local var_316_20 = Color.New(0, 0, 0)
				local var_316_21 = 0

				arg_313_1.mask_.enabled = false
				var_316_20.a = var_316_21
				arg_313_1.mask_.color = var_316_20
			end

			if arg_313_1.frameCnt_ <= 1 then
				arg_313_1.dialog_:SetActive(false)
			end

			local var_316_22 = 2
			local var_316_23 = 1.05

			if var_316_22 < arg_313_1.time_ and arg_313_1.time_ <= var_316_22 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0

				arg_313_1.dialog_:SetActive(true)

				local var_316_24 = LeanTween.value(arg_313_1.dialog_, 0, 1, 0.3)

				var_316_24:setOnUpdate(LuaHelper.FloatAction(function(arg_317_0)
					arg_313_1.dialogCg_.alpha = arg_317_0
				end))
				var_316_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_313_1.dialog_)
					var_316_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_313_1.duration_ = arg_313_1.duration_ + 0.3

				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_25 = arg_313_1:GetWordFromCfg(410111076)
				local var_316_26 = arg_313_1:FormatText(var_316_25.content)

				arg_313_1.text_.text = var_316_26

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_27 = 42
				local var_316_28 = utf8.len(var_316_26)
				local var_316_29 = var_316_27 <= 0 and var_316_23 or var_316_23 * (var_316_28 / var_316_27)

				if var_316_29 > 0 and var_316_23 < var_316_29 then
					arg_313_1.talkMaxDuration = var_316_29
					var_316_22 = var_316_22 + 0.3

					if var_316_29 + var_316_22 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_29 + var_316_22
					end
				end

				arg_313_1.text_.text = var_316_26
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_30 = var_316_22 + 0.3
			local var_316_31 = math.max(var_316_23, arg_313_1.talkMaxDuration)

			if var_316_30 <= arg_313_1.time_ and arg_313_1.time_ < var_316_30 + var_316_31 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_30) / var_316_31

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_30 + var_316_31 and arg_313_1.time_ < var_316_30 + var_316_31 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play410111077 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 410111077
		arg_319_1.duration_ = 4.133

		local var_319_0 = {
			zh = 3.5,
			ja = 4.133
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
				arg_319_0:Play410111078(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1060"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1060 = var_322_0.localPosition
				var_322_0.localScale = Vector3.New(1, 1, 1)

				arg_319_1:CheckSpriteTmpPos("1060", 3)

				local var_322_2 = var_322_0.childCount

				for iter_322_0 = 0, var_322_2 - 1 do
					local var_322_3 = var_322_0:GetChild(iter_322_0)

					if var_322_3.name == "" or not string.find(var_322_3.name, "split") then
						var_322_3.gameObject:SetActive(true)
					else
						var_322_3.gameObject:SetActive(false)
					end
				end
			end

			local var_322_4 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_4 then
				local var_322_5 = (arg_319_1.time_ - var_322_1) / var_322_4
				local var_322_6 = Vector3.New(0, -435, -40)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1060, var_322_6, var_322_5)
			end

			if arg_319_1.time_ >= var_322_1 + var_322_4 and arg_319_1.time_ < var_322_1 + var_322_4 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_322_7 = arg_319_1.actors_["1060"]
			local var_322_8 = 0

			if var_322_8 < arg_319_1.time_ and arg_319_1.time_ <= var_322_8 + arg_322_0 and arg_319_1.var_.actorSpriteComps1060 == nil then
				arg_319_1.var_.actorSpriteComps1060 = var_322_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_9 = 0.034

			if var_322_8 <= arg_319_1.time_ and arg_319_1.time_ < var_322_8 + var_322_9 then
				local var_322_10 = (arg_319_1.time_ - var_322_8) / var_322_9

				if arg_319_1.var_.actorSpriteComps1060 then
					for iter_322_1, iter_322_2 in pairs(arg_319_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_322_2 then
							local var_322_11 = Mathf.Lerp(iter_322_2.color.r, 1, var_322_10)

							iter_322_2.color = Color.New(var_322_11, var_322_11, var_322_11)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_8 + var_322_9 and arg_319_1.time_ < var_322_8 + var_322_9 + arg_322_0 and arg_319_1.var_.actorSpriteComps1060 then
				local var_322_12 = 1

				for iter_322_3, iter_322_4 in pairs(arg_319_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_322_4 then
						iter_322_4.color = Color.New(var_322_12, var_322_12, var_322_12)
					end
				end

				arg_319_1.var_.actorSpriteComps1060 = nil
			end

			local var_322_13 = 0
			local var_322_14 = 0.275

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_15 = arg_319_1:FormatText(StoryNameCfg[584].name)

				arg_319_1.leftNameTxt_.text = var_322_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_16 = arg_319_1:GetWordFromCfg(410111077)
				local var_322_17 = arg_319_1:FormatText(var_322_16.content)

				arg_319_1.text_.text = var_322_17

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_18 = 11
				local var_322_19 = utf8.len(var_322_17)
				local var_322_20 = var_322_18 <= 0 and var_322_14 or var_322_14 * (var_322_19 / var_322_18)

				if var_322_20 > 0 and var_322_14 < var_322_20 then
					arg_319_1.talkMaxDuration = var_322_20

					if var_322_20 + var_322_13 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_20 + var_322_13
					end
				end

				arg_319_1.text_.text = var_322_17
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111077", "story_v_out_410111.awb") ~= 0 then
					local var_322_21 = manager.audio:GetVoiceLength("story_v_out_410111", "410111077", "story_v_out_410111.awb") / 1000

					if var_322_21 + var_322_13 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_21 + var_322_13
					end

					if var_322_16.prefab_name ~= "" and arg_319_1.actors_[var_322_16.prefab_name] ~= nil then
						local var_322_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_16.prefab_name].transform, "story_v_out_410111", "410111077", "story_v_out_410111.awb")

						arg_319_1:RecordAudio("410111077", var_322_22)
						arg_319_1:RecordAudio("410111077", var_322_22)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_410111", "410111077", "story_v_out_410111.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_410111", "410111077", "story_v_out_410111.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_23 = math.max(var_322_14, arg_319_1.talkMaxDuration)

			if var_322_13 <= arg_319_1.time_ and arg_319_1.time_ < var_322_13 + var_322_23 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_13) / var_322_23

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_13 + var_322_23 and arg_319_1.time_ < var_322_13 + var_322_23 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play410111078 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 410111078
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play410111079(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1060"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos1060 = var_326_0.localPosition
				var_326_0.localScale = Vector3.New(1, 1, 1)

				arg_323_1:CheckSpriteTmpPos("1060", 7)

				local var_326_2 = var_326_0.childCount

				for iter_326_0 = 0, var_326_2 - 1 do
					local var_326_3 = var_326_0:GetChild(iter_326_0)

					if var_326_3.name == "" or not string.find(var_326_3.name, "split") then
						var_326_3.gameObject:SetActive(true)
					else
						var_326_3.gameObject:SetActive(false)
					end
				end
			end

			local var_326_4 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_4 then
				local var_326_5 = (arg_323_1.time_ - var_326_1) / var_326_4
				local var_326_6 = Vector3.New(0, -2000, -40)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1060, var_326_6, var_326_5)
			end

			if arg_323_1.time_ >= var_326_1 + var_326_4 and arg_323_1.time_ < var_326_1 + var_326_4 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_326_7 = arg_323_1.actors_["1060"]
			local var_326_8 = 0

			if var_326_8 < arg_323_1.time_ and arg_323_1.time_ <= var_326_8 + arg_326_0 and arg_323_1.var_.actorSpriteComps1060 == nil then
				arg_323_1.var_.actorSpriteComps1060 = var_326_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_326_9 = 0.034

			if var_326_8 <= arg_323_1.time_ and arg_323_1.time_ < var_326_8 + var_326_9 then
				local var_326_10 = (arg_323_1.time_ - var_326_8) / var_326_9

				if arg_323_1.var_.actorSpriteComps1060 then
					for iter_326_1, iter_326_2 in pairs(arg_323_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_326_2 then
							local var_326_11 = Mathf.Lerp(iter_326_2.color.r, 0.5, var_326_10)

							iter_326_2.color = Color.New(var_326_11, var_326_11, var_326_11)
						end
					end
				end
			end

			if arg_323_1.time_ >= var_326_8 + var_326_9 and arg_323_1.time_ < var_326_8 + var_326_9 + arg_326_0 and arg_323_1.var_.actorSpriteComps1060 then
				local var_326_12 = 0.5

				for iter_326_3, iter_326_4 in pairs(arg_323_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_326_4 then
						iter_326_4.color = Color.New(var_326_12, var_326_12, var_326_12)
					end
				end

				arg_323_1.var_.actorSpriteComps1060 = nil
			end

			local var_326_13 = 0
			local var_326_14 = 1.55

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_15 = arg_323_1:GetWordFromCfg(410111078)
				local var_326_16 = arg_323_1:FormatText(var_326_15.content)

				arg_323_1.text_.text = var_326_16

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_17 = 62
				local var_326_18 = utf8.len(var_326_16)
				local var_326_19 = var_326_17 <= 0 and var_326_14 or var_326_14 * (var_326_18 / var_326_17)

				if var_326_19 > 0 and var_326_14 < var_326_19 then
					arg_323_1.talkMaxDuration = var_326_19

					if var_326_19 + var_326_13 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_19 + var_326_13
					end
				end

				arg_323_1.text_.text = var_326_16
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_20 = math.max(var_326_14, arg_323_1.talkMaxDuration)

			if var_326_13 <= arg_323_1.time_ and arg_323_1.time_ < var_326_13 + var_326_20 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_13) / var_326_20

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_13 + var_326_20 and arg_323_1.time_ < var_326_13 + var_326_20 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play410111079 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 410111079
		arg_327_1.duration_ = 16.7

		local var_327_0 = {
			zh = 7.5,
			ja = 16.7
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
				arg_327_0:Play410111080(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1060"].transform
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.var_.moveOldPos1060 = var_330_0.localPosition
				var_330_0.localScale = Vector3.New(1, 1, 1)

				arg_327_1:CheckSpriteTmpPos("1060", 3)

				local var_330_2 = var_330_0.childCount

				for iter_330_0 = 0, var_330_2 - 1 do
					local var_330_3 = var_330_0:GetChild(iter_330_0)

					if var_330_3.name == "" or not string.find(var_330_3.name, "split") then
						var_330_3.gameObject:SetActive(true)
					else
						var_330_3.gameObject:SetActive(false)
					end
				end
			end

			local var_330_4 = 0.001

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_4 then
				local var_330_5 = (arg_327_1.time_ - var_330_1) / var_330_4
				local var_330_6 = Vector3.New(0, -435, -40)

				var_330_0.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1060, var_330_6, var_330_5)
			end

			if arg_327_1.time_ >= var_330_1 + var_330_4 and arg_327_1.time_ < var_330_1 + var_330_4 + arg_330_0 then
				var_330_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_330_7 = arg_327_1.actors_["1060"]
			local var_330_8 = 0

			if var_330_8 < arg_327_1.time_ and arg_327_1.time_ <= var_330_8 + arg_330_0 and arg_327_1.var_.actorSpriteComps1060 == nil then
				arg_327_1.var_.actorSpriteComps1060 = var_330_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_9 = 0.034

			if var_330_8 <= arg_327_1.time_ and arg_327_1.time_ < var_330_8 + var_330_9 then
				local var_330_10 = (arg_327_1.time_ - var_330_8) / var_330_9

				if arg_327_1.var_.actorSpriteComps1060 then
					for iter_330_1, iter_330_2 in pairs(arg_327_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_330_2 then
							local var_330_11 = Mathf.Lerp(iter_330_2.color.r, 1, var_330_10)

							iter_330_2.color = Color.New(var_330_11, var_330_11, var_330_11)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_8 + var_330_9 and arg_327_1.time_ < var_330_8 + var_330_9 + arg_330_0 and arg_327_1.var_.actorSpriteComps1060 then
				local var_330_12 = 1

				for iter_330_3, iter_330_4 in pairs(arg_327_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_330_4 then
						iter_330_4.color = Color.New(var_330_12, var_330_12, var_330_12)
					end
				end

				arg_327_1.var_.actorSpriteComps1060 = nil
			end

			local var_330_13 = 0
			local var_330_14 = 0.725

			if var_330_13 < arg_327_1.time_ and arg_327_1.time_ <= var_330_13 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_15 = arg_327_1:FormatText(StoryNameCfg[584].name)

				arg_327_1.leftNameTxt_.text = var_330_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_16 = arg_327_1:GetWordFromCfg(410111079)
				local var_330_17 = arg_327_1:FormatText(var_330_16.content)

				arg_327_1.text_.text = var_330_17

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_18 = 29
				local var_330_19 = utf8.len(var_330_17)
				local var_330_20 = var_330_18 <= 0 and var_330_14 or var_330_14 * (var_330_19 / var_330_18)

				if var_330_20 > 0 and var_330_14 < var_330_20 then
					arg_327_1.talkMaxDuration = var_330_20

					if var_330_20 + var_330_13 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_20 + var_330_13
					end
				end

				arg_327_1.text_.text = var_330_17
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111079", "story_v_out_410111.awb") ~= 0 then
					local var_330_21 = manager.audio:GetVoiceLength("story_v_out_410111", "410111079", "story_v_out_410111.awb") / 1000

					if var_330_21 + var_330_13 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_21 + var_330_13
					end

					if var_330_16.prefab_name ~= "" and arg_327_1.actors_[var_330_16.prefab_name] ~= nil then
						local var_330_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_16.prefab_name].transform, "story_v_out_410111", "410111079", "story_v_out_410111.awb")

						arg_327_1:RecordAudio("410111079", var_330_22)
						arg_327_1:RecordAudio("410111079", var_330_22)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_410111", "410111079", "story_v_out_410111.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_410111", "410111079", "story_v_out_410111.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_23 = math.max(var_330_14, arg_327_1.talkMaxDuration)

			if var_330_13 <= arg_327_1.time_ and arg_327_1.time_ < var_330_13 + var_330_23 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_13) / var_330_23

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_13 + var_330_23 and arg_327_1.time_ < var_330_13 + var_330_23 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play410111080 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 410111080
		arg_331_1.duration_ = 6.333

		local var_331_0 = {
			zh = 6.333,
			ja = 4.2
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
				arg_331_0:Play410111081(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 0.625

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_2 = arg_331_1:FormatText(StoryNameCfg[584].name)

				arg_331_1.leftNameTxt_.text = var_334_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_3 = arg_331_1:GetWordFromCfg(410111080)
				local var_334_4 = arg_331_1:FormatText(var_334_3.content)

				arg_331_1.text_.text = var_334_4

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_5 = 25
				local var_334_6 = utf8.len(var_334_4)
				local var_334_7 = var_334_5 <= 0 and var_334_1 or var_334_1 * (var_334_6 / var_334_5)

				if var_334_7 > 0 and var_334_1 < var_334_7 then
					arg_331_1.talkMaxDuration = var_334_7

					if var_334_7 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_7 + var_334_0
					end
				end

				arg_331_1.text_.text = var_334_4
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111080", "story_v_out_410111.awb") ~= 0 then
					local var_334_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111080", "story_v_out_410111.awb") / 1000

					if var_334_8 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_8 + var_334_0
					end

					if var_334_3.prefab_name ~= "" and arg_331_1.actors_[var_334_3.prefab_name] ~= nil then
						local var_334_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_3.prefab_name].transform, "story_v_out_410111", "410111080", "story_v_out_410111.awb")

						arg_331_1:RecordAudio("410111080", var_334_9)
						arg_331_1:RecordAudio("410111080", var_334_9)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_410111", "410111080", "story_v_out_410111.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_410111", "410111080", "story_v_out_410111.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_10 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_10 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_10

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_10 and arg_331_1.time_ < var_334_0 + var_334_10 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play410111081 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 410111081
		arg_335_1.duration_ = 4.766

		local var_335_0 = {
			zh = 3.8,
			ja = 4.766
		}
		local var_335_1 = manager.audio:GetLocalizationFlag()

		if var_335_0[var_335_1] ~= nil then
			arg_335_1.duration_ = var_335_0[var_335_1]
		end

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play410111082(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.225

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[584].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(410111081)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 9
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410111", "410111081", "story_v_out_410111.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_410111", "410111081", "story_v_out_410111.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_410111", "410111081", "story_v_out_410111.awb")

						arg_335_1:RecordAudio("410111081", var_338_9)
						arg_335_1:RecordAudio("410111081", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_410111", "410111081", "story_v_out_410111.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_410111", "410111081", "story_v_out_410111.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_10 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_10 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_10

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_10 and arg_335_1.time_ < var_338_0 + var_338_10 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play410111082 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 410111082
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play410111083(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1060"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1060 = var_342_0.localPosition
				var_342_0.localScale = Vector3.New(1, 1, 1)

				arg_339_1:CheckSpriteTmpPos("1060", 7)

				local var_342_2 = var_342_0.childCount

				for iter_342_0 = 0, var_342_2 - 1 do
					local var_342_3 = var_342_0:GetChild(iter_342_0)

					if var_342_3.name == "" or not string.find(var_342_3.name, "split") then
						var_342_3.gameObject:SetActive(true)
					else
						var_342_3.gameObject:SetActive(false)
					end
				end
			end

			local var_342_4 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_4 then
				local var_342_5 = (arg_339_1.time_ - var_342_1) / var_342_4
				local var_342_6 = Vector3.New(0, -2000, -40)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1060, var_342_6, var_342_5)
			end

			if arg_339_1.time_ >= var_342_1 + var_342_4 and arg_339_1.time_ < var_342_1 + var_342_4 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_342_7 = arg_339_1.actors_["1060"]
			local var_342_8 = 0

			if var_342_8 < arg_339_1.time_ and arg_339_1.time_ <= var_342_8 + arg_342_0 and arg_339_1.var_.actorSpriteComps1060 == nil then
				arg_339_1.var_.actorSpriteComps1060 = var_342_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_342_9 = 0.034

			if var_342_8 <= arg_339_1.time_ and arg_339_1.time_ < var_342_8 + var_342_9 then
				local var_342_10 = (arg_339_1.time_ - var_342_8) / var_342_9

				if arg_339_1.var_.actorSpriteComps1060 then
					for iter_342_1, iter_342_2 in pairs(arg_339_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_342_2 then
							local var_342_11 = Mathf.Lerp(iter_342_2.color.r, 0.5, var_342_10)

							iter_342_2.color = Color.New(var_342_11, var_342_11, var_342_11)
						end
					end
				end
			end

			if arg_339_1.time_ >= var_342_8 + var_342_9 and arg_339_1.time_ < var_342_8 + var_342_9 + arg_342_0 and arg_339_1.var_.actorSpriteComps1060 then
				local var_342_12 = 0.5

				for iter_342_3, iter_342_4 in pairs(arg_339_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_342_4 then
						iter_342_4.color = Color.New(var_342_12, var_342_12, var_342_12)
					end
				end

				arg_339_1.var_.actorSpriteComps1060 = nil
			end

			local var_342_13 = 0
			local var_342_14 = 0.65

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, false)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_15 = arg_339_1:GetWordFromCfg(410111082)
				local var_342_16 = arg_339_1:FormatText(var_342_15.content)

				arg_339_1.text_.text = var_342_16

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_17 = 26
				local var_342_18 = utf8.len(var_342_16)
				local var_342_19 = var_342_17 <= 0 and var_342_14 or var_342_14 * (var_342_18 / var_342_17)

				if var_342_19 > 0 and var_342_14 < var_342_19 then
					arg_339_1.talkMaxDuration = var_342_19

					if var_342_19 + var_342_13 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_19 + var_342_13
					end
				end

				arg_339_1.text_.text = var_342_16
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_20 = math.max(var_342_14, arg_339_1.talkMaxDuration)

			if var_342_13 <= arg_339_1.time_ and arg_339_1.time_ < var_342_13 + var_342_20 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_13) / var_342_20

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_13 + var_342_20 and arg_339_1.time_ < var_342_13 + var_342_20 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play410111083 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 410111083
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
			arg_343_1.auto_ = false
		end

		function arg_343_1.playNext_(arg_345_0)
			arg_343_1.onStoryFinished_()
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 1.675

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_2 = arg_343_1:GetWordFromCfg(410111083)
				local var_346_3 = arg_343_1:FormatText(var_346_2.content)

				arg_343_1.text_.text = var_346_3

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_4 = 67
				local var_346_5 = utf8.len(var_346_3)
				local var_346_6 = var_346_4 <= 0 and var_346_1 or var_346_1 * (var_346_5 / var_346_4)

				if var_346_6 > 0 and var_346_1 < var_346_6 then
					arg_343_1.talkMaxDuration = var_346_6

					if var_346_6 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_6 + var_346_0
					end
				end

				arg_343_1.text_.text = var_346_3
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_7 = math.max(var_346_1, arg_343_1.talkMaxDuration)

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_7 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_0) / var_346_7

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_0 + var_346_7 and arg_343_1.time_ < var_346_0 + var_346_7 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L03g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04g"
	},
	voices = {
		"story_v_out_410111.awb"
	}
}
