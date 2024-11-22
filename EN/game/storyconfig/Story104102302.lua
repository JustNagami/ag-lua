return {
	Play410232001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410232001
		arg_1_1.duration_ = 7.266

		local var_1_0 = {
			ja = 7.266,
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
				arg_1_0:Play410232002(arg_1_1)
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

			local var_4_22 = "10062"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["10062"].transform
			local var_4_25 = 2

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos10062 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10062", 3)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_1_1" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(0, -390, -290)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10062, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(0, -390, -290)
			end

			local var_4_31 = arg_1_1.actors_["10062"]
			local var_4_32 = 2

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps10062 == nil then
				arg_1_1.var_.actorSpriteComps10062 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.034

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps10062 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps10062 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps10062 = nil
			end

			local var_4_37 = 0
			local var_4_38 = 0.166666666666667

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				local var_4_39 = "play"
				local var_4_40 = "music"

				arg_1_1:AudioAction(var_4_39, var_4_40, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_41 = 0.3
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_45 = 2
			local var_4_46 = 0.15

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

				local var_4_48 = arg_1_1:FormatText(StoryNameCfg[600].name)

				arg_1_1.leftNameTxt_.text = var_4_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_49 = arg_1_1:GetWordFromCfg(410232001)
				local var_4_50 = arg_1_1:FormatText(var_4_49.content)

				arg_1_1.text_.text = var_4_50

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_51 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232001", "story_v_out_410232.awb") ~= 0 then
					local var_4_54 = manager.audio:GetVoiceLength("story_v_out_410232", "410232001", "story_v_out_410232.awb") / 1000

					if var_4_54 + var_4_45 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_54 + var_4_45
					end

					if var_4_49.prefab_name ~= "" and arg_1_1.actors_[var_4_49.prefab_name] ~= nil then
						local var_4_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_49.prefab_name].transform, "story_v_out_410232", "410232001", "story_v_out_410232.awb")

						arg_1_1:RecordAudio("410232001", var_4_55)
						arg_1_1:RecordAudio("410232001", var_4_55)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410232", "410232001", "story_v_out_410232.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410232", "410232001", "story_v_out_410232.awb")
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
	Play410232002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410232002
		arg_7_1.duration_ = 4.133

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410232003(arg_7_1)
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

				arg_7_1:CheckSpriteTmpPos("1061", 3)

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
				local var_10_8 = Vector3.New(0, -490, 18)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1061, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(0, -490, 18)
			end

			local var_10_9 = arg_7_1.actors_["10062"].transform
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				arg_7_1.var_.moveOldPos10062 = var_10_9.localPosition
				var_10_9.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10062", 7)

				local var_10_11 = var_10_9.childCount

				for iter_10_1 = 0, var_10_11 - 1 do
					local var_10_12 = var_10_9:GetChild(iter_10_1)

					if var_10_12.name == "" or not string.find(var_10_12.name, "split") then
						var_10_12.gameObject:SetActive(true)
					else
						var_10_12.gameObject:SetActive(false)
					end
				end
			end

			local var_10_13 = 0.001

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_13 then
				local var_10_14 = (arg_7_1.time_ - var_10_10) / var_10_13
				local var_10_15 = Vector3.New(0, -2000, -290)

				var_10_9.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10062, var_10_15, var_10_14)
			end

			if arg_7_1.time_ >= var_10_10 + var_10_13 and arg_7_1.time_ < var_10_10 + var_10_13 + arg_10_0 then
				var_10_9.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_10_16 = arg_7_1.actors_["1061"]
			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 == nil then
				arg_7_1.var_.actorSpriteComps1061 = var_10_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_18 = 0.034

			if var_10_17 <= arg_7_1.time_ and arg_7_1.time_ < var_10_17 + var_10_18 then
				local var_10_19 = (arg_7_1.time_ - var_10_17) / var_10_18

				if arg_7_1.var_.actorSpriteComps1061 then
					for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_10_3 then
							local var_10_20 = Mathf.Lerp(iter_10_3.color.r, 1, var_10_19)

							iter_10_3.color = Color.New(var_10_20, var_10_20, var_10_20)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_17 + var_10_18 and arg_7_1.time_ < var_10_17 + var_10_18 + arg_10_0 and arg_7_1.var_.actorSpriteComps1061 then
				local var_10_21 = 1

				for iter_10_4, iter_10_5 in pairs(arg_7_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_10_5 then
						iter_10_5.color = Color.New(var_10_21, var_10_21, var_10_21)
					end
				end

				arg_7_1.var_.actorSpriteComps1061 = nil
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
			local var_10_29 = 0.175

			if var_10_28 < arg_7_1.time_ and arg_7_1.time_ <= var_10_28 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_30 = arg_7_1:FormatText(StoryNameCfg[612].name)

				arg_7_1.leftNameTxt_.text = var_10_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_31 = arg_7_1:GetWordFromCfg(410232002)
				local var_10_32 = arg_7_1:FormatText(var_10_31.content)

				arg_7_1.text_.text = var_10_32

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_33 = 7
				local var_10_34 = utf8.len(var_10_32)
				local var_10_35 = var_10_33 <= 0 and var_10_29 or var_10_29 * (var_10_34 / var_10_33)

				if var_10_35 > 0 and var_10_29 < var_10_35 then
					arg_7_1.talkMaxDuration = var_10_35

					if var_10_35 + var_10_28 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_35 + var_10_28
					end
				end

				arg_7_1.text_.text = var_10_32
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232002", "story_v_out_410232.awb") ~= 0 then
					local var_10_36 = manager.audio:GetVoiceLength("story_v_out_410232", "410232002", "story_v_out_410232.awb") / 1000

					if var_10_36 + var_10_28 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_36 + var_10_28
					end

					if var_10_31.prefab_name ~= "" and arg_7_1.actors_[var_10_31.prefab_name] ~= nil then
						local var_10_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_31.prefab_name].transform, "story_v_out_410232", "410232002", "story_v_out_410232.awb")

						arg_7_1:RecordAudio("410232002", var_10_37)
						arg_7_1:RecordAudio("410232002", var_10_37)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410232", "410232002", "story_v_out_410232.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410232", "410232002", "story_v_out_410232.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_38 = math.max(var_10_29, arg_7_1.talkMaxDuration)

			if var_10_28 <= arg_7_1.time_ and arg_7_1.time_ < var_10_28 + var_10_38 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_28) / var_10_38

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_28 + var_10_38 and arg_7_1.time_ < var_10_28 + var_10_38 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410232003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410232003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play410232004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1061"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1061 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1061", 7)

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
				local var_14_6 = Vector3.New(0, -2000, 18)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1061, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_14_7 = arg_11_1.actors_["1061"]
			local var_14_8 = 0

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 == nil then
				arg_11_1.var_.actorSpriteComps1061 = var_14_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_9 = 0.034

			if var_14_8 <= arg_11_1.time_ and arg_11_1.time_ < var_14_8 + var_14_9 then
				local var_14_10 = (arg_11_1.time_ - var_14_8) / var_14_9

				if arg_11_1.var_.actorSpriteComps1061 then
					for iter_14_1, iter_14_2 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_14_2 then
							local var_14_11 = Mathf.Lerp(iter_14_2.color.r, 0.5, var_14_10)

							iter_14_2.color = Color.New(var_14_11, var_14_11, var_14_11)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_8 + var_14_9 and arg_11_1.time_ < var_14_8 + var_14_9 + arg_14_0 and arg_11_1.var_.actorSpriteComps1061 then
				local var_14_12 = 0.5

				for iter_14_3, iter_14_4 in pairs(arg_11_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_14_4 then
						iter_14_4.color = Color.New(var_14_12, var_14_12, var_14_12)
					end
				end

				arg_11_1.var_.actorSpriteComps1061 = nil
			end

			local var_14_13 = 0
			local var_14_14 = 1.45

			if var_14_13 < arg_11_1.time_ and arg_11_1.time_ <= var_14_13 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_15 = arg_11_1:GetWordFromCfg(410232003)
				local var_14_16 = arg_11_1:FormatText(var_14_15.content)

				arg_11_1.text_.text = var_14_16

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_17 = 58
				local var_14_18 = utf8.len(var_14_16)
				local var_14_19 = var_14_17 <= 0 and var_14_14 or var_14_14 * (var_14_18 / var_14_17)

				if var_14_19 > 0 and var_14_14 < var_14_19 then
					arg_11_1.talkMaxDuration = var_14_19

					if var_14_19 + var_14_13 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_19 + var_14_13
					end
				end

				arg_11_1.text_.text = var_14_16
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_20 = math.max(var_14_14, arg_11_1.talkMaxDuration)

			if var_14_13 <= arg_11_1.time_ and arg_11_1.time_ < var_14_13 + var_14_20 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_13) / var_14_20

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_13 + var_14_20 and arg_11_1.time_ < var_14_13 + var_14_20 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410232004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410232004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play410232005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.9

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

				local var_18_2 = arg_15_1:GetWordFromCfg(410232004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 36
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
	Play410232005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410232005
		arg_19_1.duration_ = 7.1

		local var_19_0 = {
			ja = 7.1,
			CriLanguages = 6.333,
			zh = 6.333
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
				arg_19_0:Play410232006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10062"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10062 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10062", 3)

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
				local var_22_6 = Vector3.New(0, -390, -290)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10062, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_22_7 = arg_19_1.actors_["10062"]
			local var_22_8 = 0

			if var_22_8 < arg_19_1.time_ and arg_19_1.time_ <= var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps10062 == nil then
				arg_19_1.var_.actorSpriteComps10062 = var_22_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_9 = 0.034

			if var_22_8 <= arg_19_1.time_ and arg_19_1.time_ < var_22_8 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_8) / var_22_9

				if arg_19_1.var_.actorSpriteComps10062 then
					for iter_22_1, iter_22_2 in pairs(arg_19_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_22_2 then
							local var_22_11 = Mathf.Lerp(iter_22_2.color.r, 1, var_22_10)

							iter_22_2.color = Color.New(var_22_11, var_22_11, var_22_11)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_8 + var_22_9 and arg_19_1.time_ < var_22_8 + var_22_9 + arg_22_0 and arg_19_1.var_.actorSpriteComps10062 then
				local var_22_12 = 1

				for iter_22_3, iter_22_4 in pairs(arg_19_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_22_4 then
						iter_22_4.color = Color.New(var_22_12, var_22_12, var_22_12)
					end
				end

				arg_19_1.var_.actorSpriteComps10062 = nil
			end

			local var_22_13 = 0
			local var_22_14 = 0.625

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_15 = arg_19_1:FormatText(StoryNameCfg[600].name)

				arg_19_1.leftNameTxt_.text = var_22_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_16 = arg_19_1:GetWordFromCfg(410232005)
				local var_22_17 = arg_19_1:FormatText(var_22_16.content)

				arg_19_1.text_.text = var_22_17

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_18 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232005", "story_v_out_410232.awb") ~= 0 then
					local var_22_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232005", "story_v_out_410232.awb") / 1000

					if var_22_21 + var_22_13 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_13
					end

					if var_22_16.prefab_name ~= "" and arg_19_1.actors_[var_22_16.prefab_name] ~= nil then
						local var_22_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_16.prefab_name].transform, "story_v_out_410232", "410232005", "story_v_out_410232.awb")

						arg_19_1:RecordAudio("410232005", var_22_22)
						arg_19_1:RecordAudio("410232005", var_22_22)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410232", "410232005", "story_v_out_410232.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410232", "410232005", "story_v_out_410232.awb")
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
	Play410232006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410232006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play410232007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10062"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos10062 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10062", 7)

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
				local var_26_6 = Vector3.New(0, -2000, -290)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10062, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_26_7 = arg_23_1.actors_["10062"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps10062 == nil then
				arg_23_1.var_.actorSpriteComps10062 = var_26_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_9 = 0.034

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.actorSpriteComps10062 then
					for iter_26_1, iter_26_2 in pairs(arg_23_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_26_2 then
							local var_26_11 = Mathf.Lerp(iter_26_2.color.r, 0.5, var_26_10)

							iter_26_2.color = Color.New(var_26_11, var_26_11, var_26_11)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.actorSpriteComps10062 then
				local var_26_12 = 0.5

				for iter_26_3, iter_26_4 in pairs(arg_23_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_26_4 then
						iter_26_4.color = Color.New(var_26_12, var_26_12, var_26_12)
					end
				end

				arg_23_1.var_.actorSpriteComps10062 = nil
			end

			local var_26_13 = 0
			local var_26_14 = 1.55

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_15 = arg_23_1:GetWordFromCfg(410232006)
				local var_26_16 = arg_23_1:FormatText(var_26_15.content)

				arg_23_1.text_.text = var_26_16

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_17 = 62
				local var_26_18 = utf8.len(var_26_16)
				local var_26_19 = var_26_17 <= 0 and var_26_14 or var_26_14 * (var_26_18 / var_26_17)

				if var_26_19 > 0 and var_26_14 < var_26_19 then
					arg_23_1.talkMaxDuration = var_26_19

					if var_26_19 + var_26_13 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_13
					end
				end

				arg_23_1.text_.text = var_26_16
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_20 = math.max(var_26_14, arg_23_1.talkMaxDuration)

			if var_26_13 <= arg_23_1.time_ and arg_23_1.time_ < var_26_13 + var_26_20 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_13) / var_26_20

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_13 + var_26_20 and arg_23_1.time_ < var_26_13 + var_26_20 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play410232007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410232007
		arg_27_1.duration_ = 12.433

		local var_27_0 = {
			ja = 12.433,
			CriLanguages = 4.833,
			zh = 4.833
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
				arg_27_0:Play410232008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10062"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10062 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10062", 3)

				local var_30_2 = var_30_0.childCount

				for iter_30_0 = 0, var_30_2 - 1 do
					local var_30_3 = var_30_0:GetChild(iter_30_0)

					if var_30_3.name == "split_5" or not string.find(var_30_3.name, "split") then
						var_30_3.gameObject:SetActive(true)
					else
						var_30_3.gameObject:SetActive(false)
					end
				end
			end

			local var_30_4 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_4 then
				local var_30_5 = (arg_27_1.time_ - var_30_1) / var_30_4
				local var_30_6 = Vector3.New(0, -390, -290)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10062, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_30_7 = arg_27_1.actors_["10062"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.actorSpriteComps10062 == nil then
				arg_27_1.var_.actorSpriteComps10062 = var_30_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_9 = 0.034

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.actorSpriteComps10062 then
					for iter_30_1, iter_30_2 in pairs(arg_27_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_30_2 then
							local var_30_11 = Mathf.Lerp(iter_30_2.color.r, 1, var_30_10)

							iter_30_2.color = Color.New(var_30_11, var_30_11, var_30_11)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.actorSpriteComps10062 then
				local var_30_12 = 1

				for iter_30_3, iter_30_4 in pairs(arg_27_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_30_4 then
						iter_30_4.color = Color.New(var_30_12, var_30_12, var_30_12)
					end
				end

				arg_27_1.var_.actorSpriteComps10062 = nil
			end

			local var_30_13 = 0
			local var_30_14 = 0.45

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_15 = arg_27_1:FormatText(StoryNameCfg[600].name)

				arg_27_1.leftNameTxt_.text = var_30_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_16 = arg_27_1:GetWordFromCfg(410232007)
				local var_30_17 = arg_27_1:FormatText(var_30_16.content)

				arg_27_1.text_.text = var_30_17

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_18 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232007", "story_v_out_410232.awb") ~= 0 then
					local var_30_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232007", "story_v_out_410232.awb") / 1000

					if var_30_21 + var_30_13 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_13
					end

					if var_30_16.prefab_name ~= "" and arg_27_1.actors_[var_30_16.prefab_name] ~= nil then
						local var_30_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_16.prefab_name].transform, "story_v_out_410232", "410232007", "story_v_out_410232.awb")

						arg_27_1:RecordAudio("410232007", var_30_22)
						arg_27_1:RecordAudio("410232007", var_30_22)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_410232", "410232007", "story_v_out_410232.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_410232", "410232007", "story_v_out_410232.awb")
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
	Play410232008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410232008
		arg_31_1.duration_ = 7

		local var_31_0 = {
			ja = 7,
			CriLanguages = 4.966,
			zh = 4.966
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
				arg_31_0:Play410232009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10062"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos10062 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10062", 7)

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
				local var_34_6 = Vector3.New(0, -2000, -290)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10062, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_34_7 = arg_31_1.actors_["1061"].transform
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 then
				arg_31_1.var_.moveOldPos1061 = var_34_7.localPosition
				var_34_7.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1061", 3)

				local var_34_9 = var_34_7.childCount

				for iter_34_1 = 0, var_34_9 - 1 do
					local var_34_10 = var_34_7:GetChild(iter_34_1)

					if var_34_10.name == "split_5" or not string.find(var_34_10.name, "split") then
						var_34_10.gameObject:SetActive(true)
					else
						var_34_10.gameObject:SetActive(false)
					end
				end
			end

			local var_34_11 = 0.001

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_8) / var_34_11
				local var_34_13 = Vector3.New(0, -490, 18)

				var_34_7.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1061, var_34_13, var_34_12)
			end

			if arg_31_1.time_ >= var_34_8 + var_34_11 and arg_31_1.time_ < var_34_8 + var_34_11 + arg_34_0 then
				var_34_7.localPosition = Vector3.New(0, -490, 18)
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

			local var_34_20 = arg_31_1.actors_["1061"]
			local var_34_21 = 0

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 and arg_31_1.var_.actorSpriteComps1061 == nil then
				arg_31_1.var_.actorSpriteComps1061 = var_34_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_22 = 0.034

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22

				if arg_31_1.var_.actorSpriteComps1061 then
					for iter_34_6, iter_34_7 in pairs(arg_31_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_34_7 then
							local var_34_24 = Mathf.Lerp(iter_34_7.color.r, 1, var_34_23)

							iter_34_7.color = Color.New(var_34_24, var_34_24, var_34_24)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 and arg_31_1.var_.actorSpriteComps1061 then
				local var_34_25 = 1

				for iter_34_8, iter_34_9 in pairs(arg_31_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_34_9 then
						iter_34_9.color = Color.New(var_34_25, var_34_25, var_34_25)
					end
				end

				arg_31_1.var_.actorSpriteComps1061 = nil
			end

			local var_34_26 = 0
			local var_34_27 = 0.35

			if var_34_26 < arg_31_1.time_ and arg_31_1.time_ <= var_34_26 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_28 = arg_31_1:FormatText(StoryNameCfg[612].name)

				arg_31_1.leftNameTxt_.text = var_34_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_29 = arg_31_1:GetWordFromCfg(410232008)
				local var_34_30 = arg_31_1:FormatText(var_34_29.content)

				arg_31_1.text_.text = var_34_30

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_31 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232008", "story_v_out_410232.awb") ~= 0 then
					local var_34_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232008", "story_v_out_410232.awb") / 1000

					if var_34_34 + var_34_26 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_34 + var_34_26
					end

					if var_34_29.prefab_name ~= "" and arg_31_1.actors_[var_34_29.prefab_name] ~= nil then
						local var_34_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_29.prefab_name].transform, "story_v_out_410232", "410232008", "story_v_out_410232.awb")

						arg_31_1:RecordAudio("410232008", var_34_35)
						arg_31_1:RecordAudio("410232008", var_34_35)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410232", "410232008", "story_v_out_410232.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410232", "410232008", "story_v_out_410232.awb")
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
	Play410232009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410232009
		arg_35_1.duration_ = 4.9

		local var_35_0 = {
			ja = 4.9,
			CriLanguages = 2.466,
			zh = 2.466
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
				arg_35_0:Play410232010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1061"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1061 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1061", 7)

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
				local var_38_6 = Vector3.New(0, -2000, 18)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1061, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_38_7 = arg_35_1.actors_["10062"].transform
			local var_38_8 = 0

			if var_38_8 < arg_35_1.time_ and arg_35_1.time_ <= var_38_8 + arg_38_0 then
				arg_35_1.var_.moveOldPos10062 = var_38_7.localPosition
				var_38_7.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("10062", 3)

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
				local var_38_13 = Vector3.New(0, -390, -290)

				var_38_7.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10062, var_38_13, var_38_12)
			end

			if arg_35_1.time_ >= var_38_8 + var_38_11 and arg_35_1.time_ < var_38_8 + var_38_11 + arg_38_0 then
				var_38_7.localPosition = Vector3.New(0, -390, -290)
			end

			local var_38_14 = arg_35_1.actors_["1061"]
			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 == nil then
				arg_35_1.var_.actorSpriteComps1061 = var_38_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_16 = 0.034

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16

				if arg_35_1.var_.actorSpriteComps1061 then
					for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_38_3 then
							local var_38_18 = Mathf.Lerp(iter_38_3.color.r, 0.5, var_38_17)

							iter_38_3.color = Color.New(var_38_18, var_38_18, var_38_18)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 and arg_35_1.var_.actorSpriteComps1061 then
				local var_38_19 = 0.5

				for iter_38_4, iter_38_5 in pairs(arg_35_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_38_5 then
						iter_38_5.color = Color.New(var_38_19, var_38_19, var_38_19)
					end
				end

				arg_35_1.var_.actorSpriteComps1061 = nil
			end

			local var_38_20 = arg_35_1.actors_["10062"]
			local var_38_21 = 0

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 and arg_35_1.var_.actorSpriteComps10062 == nil then
				arg_35_1.var_.actorSpriteComps10062 = var_38_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_22 = 0.034

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22

				if arg_35_1.var_.actorSpriteComps10062 then
					for iter_38_6, iter_38_7 in pairs(arg_35_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_38_7 then
							local var_38_24 = Mathf.Lerp(iter_38_7.color.r, 1, var_38_23)

							iter_38_7.color = Color.New(var_38_24, var_38_24, var_38_24)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 and arg_35_1.var_.actorSpriteComps10062 then
				local var_38_25 = 1

				for iter_38_8, iter_38_9 in pairs(arg_35_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_38_9 then
						iter_38_9.color = Color.New(var_38_25, var_38_25, var_38_25)
					end
				end

				arg_35_1.var_.actorSpriteComps10062 = nil
			end

			local var_38_26 = 0
			local var_38_27 = 0.175

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_28 = arg_35_1:FormatText(StoryNameCfg[600].name)

				arg_35_1.leftNameTxt_.text = var_38_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_29 = arg_35_1:GetWordFromCfg(410232009)
				local var_38_30 = arg_35_1:FormatText(var_38_29.content)

				arg_35_1.text_.text = var_38_30

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_31 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232009", "story_v_out_410232.awb") ~= 0 then
					local var_38_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232009", "story_v_out_410232.awb") / 1000

					if var_38_34 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_34 + var_38_26
					end

					if var_38_29.prefab_name ~= "" and arg_35_1.actors_[var_38_29.prefab_name] ~= nil then
						local var_38_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_29.prefab_name].transform, "story_v_out_410232", "410232009", "story_v_out_410232.awb")

						arg_35_1:RecordAudio("410232009", var_38_35)
						arg_35_1:RecordAudio("410232009", var_38_35)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_410232", "410232009", "story_v_out_410232.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_410232", "410232009", "story_v_out_410232.awb")
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
	Play410232010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410232010
		arg_39_1.duration_ = 16.866

		local var_39_0 = {
			ja = 16.866,
			CriLanguages = 8.466,
			zh = 8.466
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
				arg_39_0:Play410232011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10062"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10062 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10062", 3)

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
				local var_42_6 = Vector3.New(0, -390, -290)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10062, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -390, -290)
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

			local var_42_13 = 0
			local var_42_14 = 0.9

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_15 = arg_39_1:FormatText(StoryNameCfg[600].name)

				arg_39_1.leftNameTxt_.text = var_42_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_16 = arg_39_1:GetWordFromCfg(410232010)
				local var_42_17 = arg_39_1:FormatText(var_42_16.content)

				arg_39_1.text_.text = var_42_17

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_18 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232010", "story_v_out_410232.awb") ~= 0 then
					local var_42_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232010", "story_v_out_410232.awb") / 1000

					if var_42_21 + var_42_13 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_13
					end

					if var_42_16.prefab_name ~= "" and arg_39_1.actors_[var_42_16.prefab_name] ~= nil then
						local var_42_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_16.prefab_name].transform, "story_v_out_410232", "410232010", "story_v_out_410232.awb")

						arg_39_1:RecordAudio("410232010", var_42_22)
						arg_39_1:RecordAudio("410232010", var_42_22)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_410232", "410232010", "story_v_out_410232.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_410232", "410232010", "story_v_out_410232.awb")
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
	Play410232011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410232011
		arg_43_1.duration_ = 12.033

		local var_43_0 = {
			ja = 12.033,
			CriLanguages = 5.133,
			zh = 5.133
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
				arg_43_0:Play410232012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10062"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos10062 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10062", 3)

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
				local var_46_6 = Vector3.New(0, -390, -290)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10062, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_46_7 = arg_43_1.actors_["10062"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps10062 == nil then
				arg_43_1.var_.actorSpriteComps10062 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.034

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps10062 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps10062 then
				local var_46_12 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps10062 = nil
			end

			local var_46_13 = 0
			local var_46_14 = 0.5

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_15 = arg_43_1:FormatText(StoryNameCfg[600].name)

				arg_43_1.leftNameTxt_.text = var_46_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_16 = arg_43_1:GetWordFromCfg(410232011)
				local var_46_17 = arg_43_1:FormatText(var_46_16.content)

				arg_43_1.text_.text = var_46_17

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_18 = 20
				local var_46_19 = utf8.len(var_46_17)
				local var_46_20 = var_46_18 <= 0 and var_46_14 or var_46_14 * (var_46_19 / var_46_18)

				if var_46_20 > 0 and var_46_14 < var_46_20 then
					arg_43_1.talkMaxDuration = var_46_20

					if var_46_20 + var_46_13 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_13
					end
				end

				arg_43_1.text_.text = var_46_17
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232011", "story_v_out_410232.awb") ~= 0 then
					local var_46_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232011", "story_v_out_410232.awb") / 1000

					if var_46_21 + var_46_13 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_21 + var_46_13
					end

					if var_46_16.prefab_name ~= "" and arg_43_1.actors_[var_46_16.prefab_name] ~= nil then
						local var_46_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_16.prefab_name].transform, "story_v_out_410232", "410232011", "story_v_out_410232.awb")

						arg_43_1:RecordAudio("410232011", var_46_22)
						arg_43_1:RecordAudio("410232011", var_46_22)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410232", "410232011", "story_v_out_410232.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410232", "410232011", "story_v_out_410232.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_23 = math.max(var_46_14, arg_43_1.talkMaxDuration)

			if var_46_13 <= arg_43_1.time_ and arg_43_1.time_ < var_46_13 + var_46_23 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_13) / var_46_23

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_13 + var_46_23 and arg_43_1.time_ < var_46_13 + var_46_23 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410232012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410232012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play410232013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10062"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos10062 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("10062", 7)

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
				local var_50_6 = Vector3.New(0, -2000, -290)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10062, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_50_7 = arg_47_1.actors_["10062"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 == nil then
				arg_47_1.var_.actorSpriteComps10062 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps10062 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 0.5, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 then
				local var_50_12 = 0.5

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps10062 = nil
			end

			local var_50_13 = 0
			local var_50_14 = 1.475

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(410232012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 59
				local var_50_18 = utf8.len(var_50_16)
				local var_50_19 = var_50_17 <= 0 and var_50_14 or var_50_14 * (var_50_18 / var_50_17)

				if var_50_19 > 0 and var_50_14 < var_50_19 then
					arg_47_1.talkMaxDuration = var_50_19

					if var_50_19 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_13
					end
				end

				arg_47_1.text_.text = var_50_16
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_20 = math.max(var_50_14, arg_47_1.talkMaxDuration)

			if var_50_13 <= arg_47_1.time_ and arg_47_1.time_ < var_50_13 + var_50_20 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_13) / var_50_20

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_13 + var_50_20 and arg_47_1.time_ < var_50_13 + var_50_20 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410232013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410232013
		arg_51_1.duration_ = 5.8

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play410232014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_1 = 1

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_1 then
				local var_54_2 = (arg_51_1.time_ - var_54_0) / var_54_1
				local var_54_3 = Color.New(1, 1, 1)

				var_54_3.a = Mathf.Lerp(1, 0, var_54_2)
				arg_51_1.mask_.color = var_54_3
			end

			if arg_51_1.time_ >= var_54_0 + var_54_1 and arg_51_1.time_ < var_54_0 + var_54_1 + arg_54_0 then
				local var_54_4 = Color.New(1, 1, 1)
				local var_54_5 = 0

				arg_51_1.mask_.enabled = false
				var_54_4.a = var_54_5
				arg_51_1.mask_.color = var_54_4
			end

			local var_54_6 = manager.ui.mainCamera.transform
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 then
				arg_51_1.var_.shakeOldPos = var_54_6.localPosition
			end

			local var_54_8 = 1

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / 0.066
				local var_54_10, var_54_11 = math.modf(var_54_9)

				var_54_6.localPosition = Vector3.New(var_54_11 * 0.13, var_54_11 * 0.13, var_54_11 * 0.13) + arg_51_1.var_.shakeOldPos
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 then
				var_54_6.localPosition = arg_51_1.var_.shakeOldPos
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_12 = 0.8
			local var_54_13 = 1.125

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_14 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_14:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(410232013)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 45
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19
					var_54_12 = var_54_12 + 0.3

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = var_54_12 + 0.3
			local var_54_21 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_21 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_20) / var_54_21

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_20 + var_54_21 and arg_51_1.time_ < var_54_20 + var_54_21 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410232014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 410232014
		arg_57_1.duration_ = 13.6

		local var_57_0 = {
			ja = 13.6,
			CriLanguages = 8.366,
			zh = 8.366
		}
		local var_57_1 = manager.audio:GetLocalizationFlag()

		if var_57_0[var_57_1] ~= nil then
			arg_57_1.duration_ = var_57_0[var_57_1]
		end

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play410232015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10062"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10062 = var_60_0.localPosition
				var_60_0.localScale = Vector3.New(1, 1, 1)

				arg_57_1:CheckSpriteTmpPos("10062", 2)

				local var_60_2 = var_60_0.childCount

				for iter_60_0 = 0, var_60_2 - 1 do
					local var_60_3 = var_60_0:GetChild(iter_60_0)

					if var_60_3.name == "" or not string.find(var_60_3.name, "split") then
						var_60_3.gameObject:SetActive(true)
					else
						var_60_3.gameObject:SetActive(false)
					end
				end
			end

			local var_60_4 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_4 then
				local var_60_5 = (arg_57_1.time_ - var_60_1) / var_60_4
				local var_60_6 = Vector3.New(-370, -390, -290)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10062, var_60_6, var_60_5)
			end

			if arg_57_1.time_ >= var_60_1 + var_60_4 and arg_57_1.time_ < var_60_1 + var_60_4 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_60_7 = "10059"

			if arg_57_1.actors_[var_60_7] == nil then
				local var_60_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_60_7), arg_57_1.canvasGo_.transform)

				var_60_8.transform:SetSiblingIndex(1)

				var_60_8.name = var_60_7
				var_60_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_57_1.actors_[var_60_7] = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["10059"].transform
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1.var_.moveOldPos10059 = var_60_9.localPosition
				var_60_9.localScale = Vector3.New(1, 1, 1)

				arg_57_1:CheckSpriteTmpPos("10059", 4)

				local var_60_11 = var_60_9.childCount

				for iter_60_1 = 0, var_60_11 - 1 do
					local var_60_12 = var_60_9:GetChild(iter_60_1)

					if var_60_12.name == "" or not string.find(var_60_12.name, "split") then
						var_60_12.gameObject:SetActive(true)
					else
						var_60_12.gameObject:SetActive(false)
					end
				end
			end

			local var_60_13 = 0.001

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_13 then
				local var_60_14 = (arg_57_1.time_ - var_60_10) / var_60_13
				local var_60_15 = Vector3.New(390, -530, 35)

				var_60_9.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10059, var_60_15, var_60_14)
			end

			if arg_57_1.time_ >= var_60_10 + var_60_13 and arg_57_1.time_ < var_60_10 + var_60_13 + arg_60_0 then
				var_60_9.localPosition = Vector3.New(390, -530, 35)
			end

			local var_60_16 = arg_57_1.actors_["10062"]
			local var_60_17 = 0

			if var_60_17 < arg_57_1.time_ and arg_57_1.time_ <= var_60_17 + arg_60_0 and arg_57_1.var_.actorSpriteComps10062 == nil then
				arg_57_1.var_.actorSpriteComps10062 = var_60_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_60_18 = 0.034

			if var_60_17 <= arg_57_1.time_ and arg_57_1.time_ < var_60_17 + var_60_18 then
				local var_60_19 = (arg_57_1.time_ - var_60_17) / var_60_18

				if arg_57_1.var_.actorSpriteComps10062 then
					for iter_60_2, iter_60_3 in pairs(arg_57_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_60_3 then
							local var_60_20 = Mathf.Lerp(iter_60_3.color.r, 1, var_60_19)

							iter_60_3.color = Color.New(var_60_20, var_60_20, var_60_20)
						end
					end
				end
			end

			if arg_57_1.time_ >= var_60_17 + var_60_18 and arg_57_1.time_ < var_60_17 + var_60_18 + arg_60_0 and arg_57_1.var_.actorSpriteComps10062 then
				local var_60_21 = 1

				for iter_60_4, iter_60_5 in pairs(arg_57_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_60_5 then
						iter_60_5.color = Color.New(var_60_21, var_60_21, var_60_21)
					end
				end

				arg_57_1.var_.actorSpriteComps10062 = nil
			end

			local var_60_22 = arg_57_1.actors_["10059"]
			local var_60_23 = 0

			if var_60_23 < arg_57_1.time_ and arg_57_1.time_ <= var_60_23 + arg_60_0 and arg_57_1.var_.actorSpriteComps10059 == nil then
				arg_57_1.var_.actorSpriteComps10059 = var_60_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_60_24 = 0.034

			if var_60_23 <= arg_57_1.time_ and arg_57_1.time_ < var_60_23 + var_60_24 then
				local var_60_25 = (arg_57_1.time_ - var_60_23) / var_60_24

				if arg_57_1.var_.actorSpriteComps10059 then
					for iter_60_6, iter_60_7 in pairs(arg_57_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_60_7 then
							local var_60_26 = Mathf.Lerp(iter_60_7.color.r, 0.5, var_60_25)

							iter_60_7.color = Color.New(var_60_26, var_60_26, var_60_26)
						end
					end
				end
			end

			if arg_57_1.time_ >= var_60_23 + var_60_24 and arg_57_1.time_ < var_60_23 + var_60_24 + arg_60_0 and arg_57_1.var_.actorSpriteComps10059 then
				local var_60_27 = 0.5

				for iter_60_8, iter_60_9 in pairs(arg_57_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_60_9 then
						iter_60_9.color = Color.New(var_60_27, var_60_27, var_60_27)
					end
				end

				arg_57_1.var_.actorSpriteComps10059 = nil
			end

			local var_60_28 = 0
			local var_60_29 = 0.9

			if var_60_28 < arg_57_1.time_ and arg_57_1.time_ <= var_60_28 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_30 = arg_57_1:FormatText(StoryNameCfg[600].name)

				arg_57_1.leftNameTxt_.text = var_60_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_31 = arg_57_1:GetWordFromCfg(410232014)
				local var_60_32 = arg_57_1:FormatText(var_60_31.content)

				arg_57_1.text_.text = var_60_32

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_33 = 36
				local var_60_34 = utf8.len(var_60_32)
				local var_60_35 = var_60_33 <= 0 and var_60_29 or var_60_29 * (var_60_34 / var_60_33)

				if var_60_35 > 0 and var_60_29 < var_60_35 then
					arg_57_1.talkMaxDuration = var_60_35

					if var_60_35 + var_60_28 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_35 + var_60_28
					end
				end

				arg_57_1.text_.text = var_60_32
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232014", "story_v_out_410232.awb") ~= 0 then
					local var_60_36 = manager.audio:GetVoiceLength("story_v_out_410232", "410232014", "story_v_out_410232.awb") / 1000

					if var_60_36 + var_60_28 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_36 + var_60_28
					end

					if var_60_31.prefab_name ~= "" and arg_57_1.actors_[var_60_31.prefab_name] ~= nil then
						local var_60_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_31.prefab_name].transform, "story_v_out_410232", "410232014", "story_v_out_410232.awb")

						arg_57_1:RecordAudio("410232014", var_60_37)
						arg_57_1:RecordAudio("410232014", var_60_37)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_410232", "410232014", "story_v_out_410232.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_410232", "410232014", "story_v_out_410232.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_38 = math.max(var_60_29, arg_57_1.talkMaxDuration)

			if var_60_28 <= arg_57_1.time_ and arg_57_1.time_ < var_60_28 + var_60_38 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_28) / var_60_38

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_28 + var_60_38 and arg_57_1.time_ < var_60_28 + var_60_38 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play410232015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 410232015
		arg_61_1.duration_ = 1.6

		local var_61_0 = {
			ja = 1.566,
			CriLanguages = 1.6,
			zh = 1.6
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
				arg_61_0:Play410232016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10059"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos10059 = var_64_0.localPosition
				var_64_0.localScale = Vector3.New(1, 1, 1)

				arg_61_1:CheckSpriteTmpPos("10059", 4)

				local var_64_2 = var_64_0.childCount

				for iter_64_0 = 0, var_64_2 - 1 do
					local var_64_3 = var_64_0:GetChild(iter_64_0)

					if var_64_3.name == "" or not string.find(var_64_3.name, "split") then
						var_64_3.gameObject:SetActive(true)
					else
						var_64_3.gameObject:SetActive(false)
					end
				end
			end

			local var_64_4 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_4 then
				local var_64_5 = (arg_61_1.time_ - var_64_1) / var_64_4
				local var_64_6 = Vector3.New(390, -530, 35)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10059, var_64_6, var_64_5)
			end

			if arg_61_1.time_ >= var_64_1 + var_64_4 and arg_61_1.time_ < var_64_1 + var_64_4 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_64_7 = arg_61_1.actors_["10059"]
			local var_64_8 = 0

			if var_64_8 < arg_61_1.time_ and arg_61_1.time_ <= var_64_8 + arg_64_0 and arg_61_1.var_.actorSpriteComps10059 == nil then
				arg_61_1.var_.actorSpriteComps10059 = var_64_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_9 = 0.034

			if var_64_8 <= arg_61_1.time_ and arg_61_1.time_ < var_64_8 + var_64_9 then
				local var_64_10 = (arg_61_1.time_ - var_64_8) / var_64_9

				if arg_61_1.var_.actorSpriteComps10059 then
					for iter_64_1, iter_64_2 in pairs(arg_61_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_64_2 then
							local var_64_11 = Mathf.Lerp(iter_64_2.color.r, 1, var_64_10)

							iter_64_2.color = Color.New(var_64_11, var_64_11, var_64_11)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_8 + var_64_9 and arg_61_1.time_ < var_64_8 + var_64_9 + arg_64_0 and arg_61_1.var_.actorSpriteComps10059 then
				local var_64_12 = 1

				for iter_64_3, iter_64_4 in pairs(arg_61_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_64_4 then
						iter_64_4.color = Color.New(var_64_12, var_64_12, var_64_12)
					end
				end

				arg_61_1.var_.actorSpriteComps10059 = nil
			end

			local var_64_13 = arg_61_1.actors_["10062"]
			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 and arg_61_1.var_.actorSpriteComps10062 == nil then
				arg_61_1.var_.actorSpriteComps10062 = var_64_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_15 = 0.034

			if var_64_14 <= arg_61_1.time_ and arg_61_1.time_ < var_64_14 + var_64_15 then
				local var_64_16 = (arg_61_1.time_ - var_64_14) / var_64_15

				if arg_61_1.var_.actorSpriteComps10062 then
					for iter_64_5, iter_64_6 in pairs(arg_61_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_64_6 then
							local var_64_17 = Mathf.Lerp(iter_64_6.color.r, 0.5, var_64_16)

							iter_64_6.color = Color.New(var_64_17, var_64_17, var_64_17)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_14 + var_64_15 and arg_61_1.time_ < var_64_14 + var_64_15 + arg_64_0 and arg_61_1.var_.actorSpriteComps10062 then
				local var_64_18 = 0.5

				for iter_64_7, iter_64_8 in pairs(arg_61_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_64_8 then
						iter_64_8.color = Color.New(var_64_18, var_64_18, var_64_18)
					end
				end

				arg_61_1.var_.actorSpriteComps10062 = nil
			end

			local var_64_19 = 0
			local var_64_20 = 0.175

			if var_64_19 < arg_61_1.time_ and arg_61_1.time_ <= var_64_19 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_21 = arg_61_1:FormatText(StoryNameCfg[596].name)

				arg_61_1.leftNameTxt_.text = var_64_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_22 = arg_61_1:GetWordFromCfg(410232015)
				local var_64_23 = arg_61_1:FormatText(var_64_22.content)

				arg_61_1.text_.text = var_64_23

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_24 = 7
				local var_64_25 = utf8.len(var_64_23)
				local var_64_26 = var_64_24 <= 0 and var_64_20 or var_64_20 * (var_64_25 / var_64_24)

				if var_64_26 > 0 and var_64_20 < var_64_26 then
					arg_61_1.talkMaxDuration = var_64_26

					if var_64_26 + var_64_19 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_26 + var_64_19
					end
				end

				arg_61_1.text_.text = var_64_23
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232015", "story_v_out_410232.awb") ~= 0 then
					local var_64_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232015", "story_v_out_410232.awb") / 1000

					if var_64_27 + var_64_19 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_27 + var_64_19
					end

					if var_64_22.prefab_name ~= "" and arg_61_1.actors_[var_64_22.prefab_name] ~= nil then
						local var_64_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_22.prefab_name].transform, "story_v_out_410232", "410232015", "story_v_out_410232.awb")

						arg_61_1:RecordAudio("410232015", var_64_28)
						arg_61_1:RecordAudio("410232015", var_64_28)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_410232", "410232015", "story_v_out_410232.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_410232", "410232015", "story_v_out_410232.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_29 = math.max(var_64_20, arg_61_1.talkMaxDuration)

			if var_64_19 <= arg_61_1.time_ and arg_61_1.time_ < var_64_19 + var_64_29 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_19) / var_64_29

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_19 + var_64_29 and arg_61_1.time_ < var_64_19 + var_64_29 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play410232016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 410232016
		arg_65_1.duration_ = 13.3

		local var_65_0 = {
			ja = 13.3,
			CriLanguages = 8.2,
			zh = 8.2
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
				arg_65_0:Play410232017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10062"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos10062 = var_68_0.localPosition
				var_68_0.localScale = Vector3.New(1, 1, 1)

				arg_65_1:CheckSpriteTmpPos("10062", 2)

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
				local var_68_6 = Vector3.New(-370, -390, -290)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos10062, var_68_6, var_68_5)
			end

			if arg_65_1.time_ >= var_68_1 + var_68_4 and arg_65_1.time_ < var_68_1 + var_68_4 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_68_7 = arg_65_1.actors_["10059"]
			local var_68_8 = 0

			if var_68_8 < arg_65_1.time_ and arg_65_1.time_ <= var_68_8 + arg_68_0 and arg_65_1.var_.actorSpriteComps10059 == nil then
				arg_65_1.var_.actorSpriteComps10059 = var_68_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_9 = 0.034

			if var_68_8 <= arg_65_1.time_ and arg_65_1.time_ < var_68_8 + var_68_9 then
				local var_68_10 = (arg_65_1.time_ - var_68_8) / var_68_9

				if arg_65_1.var_.actorSpriteComps10059 then
					for iter_68_1, iter_68_2 in pairs(arg_65_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_68_2 then
							local var_68_11 = Mathf.Lerp(iter_68_2.color.r, 0.5, var_68_10)

							iter_68_2.color = Color.New(var_68_11, var_68_11, var_68_11)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_8 + var_68_9 and arg_65_1.time_ < var_68_8 + var_68_9 + arg_68_0 and arg_65_1.var_.actorSpriteComps10059 then
				local var_68_12 = 0.5

				for iter_68_3, iter_68_4 in pairs(arg_65_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_68_4 then
						iter_68_4.color = Color.New(var_68_12, var_68_12, var_68_12)
					end
				end

				arg_65_1.var_.actorSpriteComps10059 = nil
			end

			local var_68_13 = arg_65_1.actors_["10062"]
			local var_68_14 = 0

			if var_68_14 < arg_65_1.time_ and arg_65_1.time_ <= var_68_14 + arg_68_0 and arg_65_1.var_.actorSpriteComps10062 == nil then
				arg_65_1.var_.actorSpriteComps10062 = var_68_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_15 = 0.034

			if var_68_14 <= arg_65_1.time_ and arg_65_1.time_ < var_68_14 + var_68_15 then
				local var_68_16 = (arg_65_1.time_ - var_68_14) / var_68_15

				if arg_65_1.var_.actorSpriteComps10062 then
					for iter_68_5, iter_68_6 in pairs(arg_65_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_68_6 then
							local var_68_17 = Mathf.Lerp(iter_68_6.color.r, 1, var_68_16)

							iter_68_6.color = Color.New(var_68_17, var_68_17, var_68_17)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_14 + var_68_15 and arg_65_1.time_ < var_68_14 + var_68_15 + arg_68_0 and arg_65_1.var_.actorSpriteComps10062 then
				local var_68_18 = 1

				for iter_68_7, iter_68_8 in pairs(arg_65_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_68_8 then
						iter_68_8.color = Color.New(var_68_18, var_68_18, var_68_18)
					end
				end

				arg_65_1.var_.actorSpriteComps10062 = nil
			end

			local var_68_19 = 0
			local var_68_20 = 0.8

			if var_68_19 < arg_65_1.time_ and arg_65_1.time_ <= var_68_19 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_21 = arg_65_1:FormatText(StoryNameCfg[600].name)

				arg_65_1.leftNameTxt_.text = var_68_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_22 = arg_65_1:GetWordFromCfg(410232016)
				local var_68_23 = arg_65_1:FormatText(var_68_22.content)

				arg_65_1.text_.text = var_68_23

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_24 = 32
				local var_68_25 = utf8.len(var_68_23)
				local var_68_26 = var_68_24 <= 0 and var_68_20 or var_68_20 * (var_68_25 / var_68_24)

				if var_68_26 > 0 and var_68_20 < var_68_26 then
					arg_65_1.talkMaxDuration = var_68_26

					if var_68_26 + var_68_19 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_26 + var_68_19
					end
				end

				arg_65_1.text_.text = var_68_23
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232016", "story_v_out_410232.awb") ~= 0 then
					local var_68_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232016", "story_v_out_410232.awb") / 1000

					if var_68_27 + var_68_19 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_27 + var_68_19
					end

					if var_68_22.prefab_name ~= "" and arg_65_1.actors_[var_68_22.prefab_name] ~= nil then
						local var_68_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_22.prefab_name].transform, "story_v_out_410232", "410232016", "story_v_out_410232.awb")

						arg_65_1:RecordAudio("410232016", var_68_28)
						arg_65_1:RecordAudio("410232016", var_68_28)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_410232", "410232016", "story_v_out_410232.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_410232", "410232016", "story_v_out_410232.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_29 = math.max(var_68_20, arg_65_1.talkMaxDuration)

			if var_68_19 <= arg_65_1.time_ and arg_65_1.time_ < var_68_19 + var_68_29 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_19) / var_68_29

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_19 + var_68_29 and arg_65_1.time_ < var_68_19 + var_68_29 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play410232017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 410232017
		arg_69_1.duration_ = 17.666

		local var_69_0 = {
			ja = 17.666,
			CriLanguages = 9.2,
			zh = 9.2
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
				arg_69_0:Play410232018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["10062"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos10062 = var_72_0.localPosition
				var_72_0.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("10062", 2)

				local var_72_2 = var_72_0.childCount

				for iter_72_0 = 0, var_72_2 - 1 do
					local var_72_3 = var_72_0:GetChild(iter_72_0)

					if var_72_3.name == "" or not string.find(var_72_3.name, "split") then
						var_72_3.gameObject:SetActive(true)
					else
						var_72_3.gameObject:SetActive(false)
					end
				end
			end

			local var_72_4 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_4 then
				local var_72_5 = (arg_69_1.time_ - var_72_1) / var_72_4
				local var_72_6 = Vector3.New(-370, -390, -290)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos10062, var_72_6, var_72_5)
			end

			if arg_69_1.time_ >= var_72_1 + var_72_4 and arg_69_1.time_ < var_72_1 + var_72_4 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_72_7 = arg_69_1.actors_["10062"]
			local var_72_8 = 0

			if var_72_8 < arg_69_1.time_ and arg_69_1.time_ <= var_72_8 + arg_72_0 and arg_69_1.var_.actorSpriteComps10062 == nil then
				arg_69_1.var_.actorSpriteComps10062 = var_72_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_9 = 0.034

			if var_72_8 <= arg_69_1.time_ and arg_69_1.time_ < var_72_8 + var_72_9 then
				local var_72_10 = (arg_69_1.time_ - var_72_8) / var_72_9

				if arg_69_1.var_.actorSpriteComps10062 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_72_2 then
							local var_72_11 = Mathf.Lerp(iter_72_2.color.r, 1, var_72_10)

							iter_72_2.color = Color.New(var_72_11, var_72_11, var_72_11)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_8 + var_72_9 and arg_69_1.time_ < var_72_8 + var_72_9 + arg_72_0 and arg_69_1.var_.actorSpriteComps10062 then
				local var_72_12 = 1

				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_72_4 then
						iter_72_4.color = Color.New(var_72_12, var_72_12, var_72_12)
					end
				end

				arg_69_1.var_.actorSpriteComps10062 = nil
			end

			local var_72_13 = 0
			local var_72_14 = 1

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_15 = arg_69_1:FormatText(StoryNameCfg[600].name)

				arg_69_1.leftNameTxt_.text = var_72_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_16 = arg_69_1:GetWordFromCfg(410232017)
				local var_72_17 = arg_69_1:FormatText(var_72_16.content)

				arg_69_1.text_.text = var_72_17

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_18 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232017", "story_v_out_410232.awb") ~= 0 then
					local var_72_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232017", "story_v_out_410232.awb") / 1000

					if var_72_21 + var_72_13 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_13
					end

					if var_72_16.prefab_name ~= "" and arg_69_1.actors_[var_72_16.prefab_name] ~= nil then
						local var_72_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_16.prefab_name].transform, "story_v_out_410232", "410232017", "story_v_out_410232.awb")

						arg_69_1:RecordAudio("410232017", var_72_22)
						arg_69_1:RecordAudio("410232017", var_72_22)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_410232", "410232017", "story_v_out_410232.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_410232", "410232017", "story_v_out_410232.awb")
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
	Play410232018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 410232018
		arg_73_1.duration_ = 1.633

		local var_73_0 = {
			ja = 1.4,
			CriLanguages = 1.633,
			zh = 1.633
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
				arg_73_0:Play410232019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10059"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos10059 = var_76_0.localPosition
				var_76_0.localScale = Vector3.New(1, 1, 1)

				arg_73_1:CheckSpriteTmpPos("10059", 4)

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
				local var_76_6 = Vector3.New(390, -530, 35)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10059, var_76_6, var_76_5)
			end

			if arg_73_1.time_ >= var_76_1 + var_76_4 and arg_73_1.time_ < var_76_1 + var_76_4 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_76_7 = arg_73_1.actors_["10059"]
			local var_76_8 = 0

			if var_76_8 < arg_73_1.time_ and arg_73_1.time_ <= var_76_8 + arg_76_0 and arg_73_1.var_.actorSpriteComps10059 == nil then
				arg_73_1.var_.actorSpriteComps10059 = var_76_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_9 = 0.034

			if var_76_8 <= arg_73_1.time_ and arg_73_1.time_ < var_76_8 + var_76_9 then
				local var_76_10 = (arg_73_1.time_ - var_76_8) / var_76_9

				if arg_73_1.var_.actorSpriteComps10059 then
					for iter_76_1, iter_76_2 in pairs(arg_73_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_76_2 then
							local var_76_11 = Mathf.Lerp(iter_76_2.color.r, 1, var_76_10)

							iter_76_2.color = Color.New(var_76_11, var_76_11, var_76_11)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_8 + var_76_9 and arg_73_1.time_ < var_76_8 + var_76_9 + arg_76_0 and arg_73_1.var_.actorSpriteComps10059 then
				local var_76_12 = 1

				for iter_76_3, iter_76_4 in pairs(arg_73_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_76_4 then
						iter_76_4.color = Color.New(var_76_12, var_76_12, var_76_12)
					end
				end

				arg_73_1.var_.actorSpriteComps10059 = nil
			end

			local var_76_13 = arg_73_1.actors_["10062"]
			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 and arg_73_1.var_.actorSpriteComps10062 == nil then
				arg_73_1.var_.actorSpriteComps10062 = var_76_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_15 = 0.034

			if var_76_14 <= arg_73_1.time_ and arg_73_1.time_ < var_76_14 + var_76_15 then
				local var_76_16 = (arg_73_1.time_ - var_76_14) / var_76_15

				if arg_73_1.var_.actorSpriteComps10062 then
					for iter_76_5, iter_76_6 in pairs(arg_73_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_76_6 then
							local var_76_17 = Mathf.Lerp(iter_76_6.color.r, 0.5, var_76_16)

							iter_76_6.color = Color.New(var_76_17, var_76_17, var_76_17)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_14 + var_76_15 and arg_73_1.time_ < var_76_14 + var_76_15 + arg_76_0 and arg_73_1.var_.actorSpriteComps10062 then
				local var_76_18 = 0.5

				for iter_76_7, iter_76_8 in pairs(arg_73_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_76_8 then
						iter_76_8.color = Color.New(var_76_18, var_76_18, var_76_18)
					end
				end

				arg_73_1.var_.actorSpriteComps10062 = nil
			end

			local var_76_19 = 0
			local var_76_20 = 0.1

			if var_76_19 < arg_73_1.time_ and arg_73_1.time_ <= var_76_19 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_21 = arg_73_1:FormatText(StoryNameCfg[596].name)

				arg_73_1.leftNameTxt_.text = var_76_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_22 = arg_73_1:GetWordFromCfg(410232018)
				local var_76_23 = arg_73_1:FormatText(var_76_22.content)

				arg_73_1.text_.text = var_76_23

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_24 = 4
				local var_76_25 = utf8.len(var_76_23)
				local var_76_26 = var_76_24 <= 0 and var_76_20 or var_76_20 * (var_76_25 / var_76_24)

				if var_76_26 > 0 and var_76_20 < var_76_26 then
					arg_73_1.talkMaxDuration = var_76_26

					if var_76_26 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_26 + var_76_19
					end
				end

				arg_73_1.text_.text = var_76_23
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232018", "story_v_out_410232.awb") ~= 0 then
					local var_76_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232018", "story_v_out_410232.awb") / 1000

					if var_76_27 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_27 + var_76_19
					end

					if var_76_22.prefab_name ~= "" and arg_73_1.actors_[var_76_22.prefab_name] ~= nil then
						local var_76_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_22.prefab_name].transform, "story_v_out_410232", "410232018", "story_v_out_410232.awb")

						arg_73_1:RecordAudio("410232018", var_76_28)
						arg_73_1:RecordAudio("410232018", var_76_28)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_410232", "410232018", "story_v_out_410232.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_410232", "410232018", "story_v_out_410232.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_29 = math.max(var_76_20, arg_73_1.talkMaxDuration)

			if var_76_19 <= arg_73_1.time_ and arg_73_1.time_ < var_76_19 + var_76_29 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_19) / var_76_29

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_19 + var_76_29 and arg_73_1.time_ < var_76_19 + var_76_29 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play410232019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 410232019
		arg_77_1.duration_ = 3.566

		local var_77_0 = {
			ja = 3.566,
			CriLanguages = 1.833,
			zh = 1.833
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
				arg_77_0:Play410232020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10062"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10062 = var_80_0.localPosition
				var_80_0.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10062", 7)

				local var_80_2 = var_80_0.childCount

				for iter_80_0 = 0, var_80_2 - 1 do
					local var_80_3 = var_80_0:GetChild(iter_80_0)

					if var_80_3.name == "" or not string.find(var_80_3.name, "split") then
						var_80_3.gameObject:SetActive(true)
					else
						var_80_3.gameObject:SetActive(false)
					end
				end
			end

			local var_80_4 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_4 then
				local var_80_5 = (arg_77_1.time_ - var_80_1) / var_80_4
				local var_80_6 = Vector3.New(0, -2000, -290)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10062, var_80_6, var_80_5)
			end

			if arg_77_1.time_ >= var_80_1 + var_80_4 and arg_77_1.time_ < var_80_1 + var_80_4 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_80_7 = arg_77_1.actors_["10059"].transform
			local var_80_8 = 0

			if var_80_8 < arg_77_1.time_ and arg_77_1.time_ <= var_80_8 + arg_80_0 then
				arg_77_1.var_.moveOldPos10059 = var_80_7.localPosition
				var_80_7.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10059", 7)

				local var_80_9 = var_80_7.childCount

				for iter_80_1 = 0, var_80_9 - 1 do
					local var_80_10 = var_80_7:GetChild(iter_80_1)

					if var_80_10.name == "" or not string.find(var_80_10.name, "split") then
						var_80_10.gameObject:SetActive(true)
					else
						var_80_10.gameObject:SetActive(false)
					end
				end
			end

			local var_80_11 = 0.001

			if var_80_8 <= arg_77_1.time_ and arg_77_1.time_ < var_80_8 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_8) / var_80_11
				local var_80_13 = Vector3.New(0, -2000, 35)

				var_80_7.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10059, var_80_13, var_80_12)
			end

			if arg_77_1.time_ >= var_80_8 + var_80_11 and arg_77_1.time_ < var_80_8 + var_80_11 + arg_80_0 then
				var_80_7.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_80_14 = "10060"

			if arg_77_1.actors_[var_80_14] == nil then
				local var_80_15 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_80_14), arg_77_1.canvasGo_.transform)

				var_80_15.transform:SetSiblingIndex(1)

				var_80_15.name = var_80_14
				var_80_15.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_77_1.actors_[var_80_14] = var_80_15
			end

			local var_80_16 = arg_77_1.actors_["10060"].transform
			local var_80_17 = 0

			if var_80_17 < arg_77_1.time_ and arg_77_1.time_ <= var_80_17 + arg_80_0 then
				arg_77_1.var_.moveOldPos10060 = var_80_16.localPosition
				var_80_16.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10060", 3)

				local var_80_18 = var_80_16.childCount

				for iter_80_2 = 0, var_80_18 - 1 do
					local var_80_19 = var_80_16:GetChild(iter_80_2)

					if var_80_19.name == "split_5" or not string.find(var_80_19.name, "split") then
						var_80_19.gameObject:SetActive(true)
					else
						var_80_19.gameObject:SetActive(false)
					end
				end
			end

			local var_80_20 = 0.001

			if var_80_17 <= arg_77_1.time_ and arg_77_1.time_ < var_80_17 + var_80_20 then
				local var_80_21 = (arg_77_1.time_ - var_80_17) / var_80_20
				local var_80_22 = Vector3.New(0, -400, 0)

				var_80_16.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10060, var_80_22, var_80_21)
			end

			if arg_77_1.time_ >= var_80_17 + var_80_20 and arg_77_1.time_ < var_80_17 + var_80_20 + arg_80_0 then
				var_80_16.localPosition = Vector3.New(0, -400, 0)
			end

			local var_80_23 = arg_77_1.actors_["10062"]
			local var_80_24 = 0

			if var_80_24 < arg_77_1.time_ and arg_77_1.time_ <= var_80_24 + arg_80_0 and arg_77_1.var_.actorSpriteComps10062 == nil then
				arg_77_1.var_.actorSpriteComps10062 = var_80_23:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_25 = 0.034

			if var_80_24 <= arg_77_1.time_ and arg_77_1.time_ < var_80_24 + var_80_25 then
				local var_80_26 = (arg_77_1.time_ - var_80_24) / var_80_25

				if arg_77_1.var_.actorSpriteComps10062 then
					for iter_80_3, iter_80_4 in pairs(arg_77_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_80_4 then
							local var_80_27 = Mathf.Lerp(iter_80_4.color.r, 0.5, var_80_26)

							iter_80_4.color = Color.New(var_80_27, var_80_27, var_80_27)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_24 + var_80_25 and arg_77_1.time_ < var_80_24 + var_80_25 + arg_80_0 and arg_77_1.var_.actorSpriteComps10062 then
				local var_80_28 = 0.5

				for iter_80_5, iter_80_6 in pairs(arg_77_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_80_6 then
						iter_80_6.color = Color.New(var_80_28, var_80_28, var_80_28)
					end
				end

				arg_77_1.var_.actorSpriteComps10062 = nil
			end

			local var_80_29 = arg_77_1.actors_["10059"]
			local var_80_30 = 0

			if var_80_30 < arg_77_1.time_ and arg_77_1.time_ <= var_80_30 + arg_80_0 and arg_77_1.var_.actorSpriteComps10059 == nil then
				arg_77_1.var_.actorSpriteComps10059 = var_80_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_31 = 0.034

			if var_80_30 <= arg_77_1.time_ and arg_77_1.time_ < var_80_30 + var_80_31 then
				local var_80_32 = (arg_77_1.time_ - var_80_30) / var_80_31

				if arg_77_1.var_.actorSpriteComps10059 then
					for iter_80_7, iter_80_8 in pairs(arg_77_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_80_8 then
							local var_80_33 = Mathf.Lerp(iter_80_8.color.r, 0.5, var_80_32)

							iter_80_8.color = Color.New(var_80_33, var_80_33, var_80_33)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_30 + var_80_31 and arg_77_1.time_ < var_80_30 + var_80_31 + arg_80_0 and arg_77_1.var_.actorSpriteComps10059 then
				local var_80_34 = 0.5

				for iter_80_9, iter_80_10 in pairs(arg_77_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_80_10 then
						iter_80_10.color = Color.New(var_80_34, var_80_34, var_80_34)
					end
				end

				arg_77_1.var_.actorSpriteComps10059 = nil
			end

			local var_80_35 = arg_77_1.actors_["10060"]
			local var_80_36 = 0

			if var_80_36 < arg_77_1.time_ and arg_77_1.time_ <= var_80_36 + arg_80_0 and arg_77_1.var_.actorSpriteComps10060 == nil then
				arg_77_1.var_.actorSpriteComps10060 = var_80_35:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_37 = 0.034

			if var_80_36 <= arg_77_1.time_ and arg_77_1.time_ < var_80_36 + var_80_37 then
				local var_80_38 = (arg_77_1.time_ - var_80_36) / var_80_37

				if arg_77_1.var_.actorSpriteComps10060 then
					for iter_80_11, iter_80_12 in pairs(arg_77_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_80_12 then
							local var_80_39 = Mathf.Lerp(iter_80_12.color.r, 1, var_80_38)

							iter_80_12.color = Color.New(var_80_39, var_80_39, var_80_39)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_36 + var_80_37 and arg_77_1.time_ < var_80_36 + var_80_37 + arg_80_0 and arg_77_1.var_.actorSpriteComps10060 then
				local var_80_40 = 1

				for iter_80_13, iter_80_14 in pairs(arg_77_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_80_14 then
						iter_80_14.color = Color.New(var_80_40, var_80_40, var_80_40)
					end
				end

				arg_77_1.var_.actorSpriteComps10060 = nil
			end

			local var_80_41 = 0
			local var_80_42 = 0.225

			if var_80_41 < arg_77_1.time_ and arg_77_1.time_ <= var_80_41 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_43 = arg_77_1:FormatText(StoryNameCfg[597].name)

				arg_77_1.leftNameTxt_.text = var_80_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_44 = arg_77_1:GetWordFromCfg(410232019)
				local var_80_45 = arg_77_1:FormatText(var_80_44.content)

				arg_77_1.text_.text = var_80_45

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_46 = 9
				local var_80_47 = utf8.len(var_80_45)
				local var_80_48 = var_80_46 <= 0 and var_80_42 or var_80_42 * (var_80_47 / var_80_46)

				if var_80_48 > 0 and var_80_42 < var_80_48 then
					arg_77_1.talkMaxDuration = var_80_48

					if var_80_48 + var_80_41 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_48 + var_80_41
					end
				end

				arg_77_1.text_.text = var_80_45
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232019", "story_v_out_410232.awb") ~= 0 then
					local var_80_49 = manager.audio:GetVoiceLength("story_v_out_410232", "410232019", "story_v_out_410232.awb") / 1000

					if var_80_49 + var_80_41 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_49 + var_80_41
					end

					if var_80_44.prefab_name ~= "" and arg_77_1.actors_[var_80_44.prefab_name] ~= nil then
						local var_80_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_44.prefab_name].transform, "story_v_out_410232", "410232019", "story_v_out_410232.awb")

						arg_77_1:RecordAudio("410232019", var_80_50)
						arg_77_1:RecordAudio("410232019", var_80_50)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_410232", "410232019", "story_v_out_410232.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_410232", "410232019", "story_v_out_410232.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_51 = math.max(var_80_42, arg_77_1.talkMaxDuration)

			if var_80_41 <= arg_77_1.time_ and arg_77_1.time_ < var_80_41 + var_80_51 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_41) / var_80_51

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_41 + var_80_51 and arg_77_1.time_ < var_80_41 + var_80_51 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play410232020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 410232020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play410232021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10060"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.actorSpriteComps10060 == nil then
				arg_81_1.var_.actorSpriteComps10060 = var_84_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_2 = 0.034

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.actorSpriteComps10060 then
					for iter_84_0, iter_84_1 in pairs(arg_81_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_84_1 then
							local var_84_4 = Mathf.Lerp(iter_84_1.color.r, 0.5, var_84_3)

							iter_84_1.color = Color.New(var_84_4, var_84_4, var_84_4)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.actorSpriteComps10060 then
				local var_84_5 = 0.5

				for iter_84_2, iter_84_3 in pairs(arg_81_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_84_3 then
						iter_84_3.color = Color.New(var_84_5, var_84_5, var_84_5)
					end
				end

				arg_81_1.var_.actorSpriteComps10060 = nil
			end

			local var_84_6 = 0
			local var_84_7 = 1.525

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

				local var_84_8 = arg_81_1:GetWordFromCfg(410232020)
				local var_84_9 = arg_81_1:FormatText(var_84_8.content)

				arg_81_1.text_.text = var_84_9

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_10 = 61
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
	Play410232021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 410232021
		arg_85_1.duration_ = 9.533

		local var_85_0 = {
			ja = 9.533,
			CriLanguages = 5.066,
			zh = 5.066
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
				arg_85_0:Play410232022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10060"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos10060 = var_88_0.localPosition
				var_88_0.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("10060", 7)

				local var_88_2 = var_88_0.childCount

				for iter_88_0 = 0, var_88_2 - 1 do
					local var_88_3 = var_88_0:GetChild(iter_88_0)

					if var_88_3.name == "" or not string.find(var_88_3.name, "split") then
						var_88_3.gameObject:SetActive(true)
					else
						var_88_3.gameObject:SetActive(false)
					end
				end
			end

			local var_88_4 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_4 then
				local var_88_5 = (arg_85_1.time_ - var_88_1) / var_88_4
				local var_88_6 = Vector3.New(0, -2000, 0)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10060, var_88_6, var_88_5)
			end

			if arg_85_1.time_ >= var_88_1 + var_88_4 and arg_85_1.time_ < var_88_1 + var_88_4 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_88_7 = arg_85_1.actors_["10062"].transform
			local var_88_8 = 0

			if var_88_8 < arg_85_1.time_ and arg_85_1.time_ <= var_88_8 + arg_88_0 then
				arg_85_1.var_.moveOldPos10062 = var_88_7.localPosition
				var_88_7.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("10062", 3)

				local var_88_9 = var_88_7.childCount

				for iter_88_1 = 0, var_88_9 - 1 do
					local var_88_10 = var_88_7:GetChild(iter_88_1)

					if var_88_10.name == "split_1_1" or not string.find(var_88_10.name, "split") then
						var_88_10.gameObject:SetActive(true)
					else
						var_88_10.gameObject:SetActive(false)
					end
				end
			end

			local var_88_11 = 0.001

			if var_88_8 <= arg_85_1.time_ and arg_85_1.time_ < var_88_8 + var_88_11 then
				local var_88_12 = (arg_85_1.time_ - var_88_8) / var_88_11
				local var_88_13 = Vector3.New(0, -390, -290)

				var_88_7.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10062, var_88_13, var_88_12)
			end

			if arg_85_1.time_ >= var_88_8 + var_88_11 and arg_85_1.time_ < var_88_8 + var_88_11 + arg_88_0 then
				var_88_7.localPosition = Vector3.New(0, -390, -290)
			end

			local var_88_14 = arg_85_1.actors_["10060"]
			local var_88_15 = 0

			if var_88_15 < arg_85_1.time_ and arg_85_1.time_ <= var_88_15 + arg_88_0 and arg_85_1.var_.actorSpriteComps10060 == nil then
				arg_85_1.var_.actorSpriteComps10060 = var_88_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_16 = 0.034

			if var_88_15 <= arg_85_1.time_ and arg_85_1.time_ < var_88_15 + var_88_16 then
				local var_88_17 = (arg_85_1.time_ - var_88_15) / var_88_16

				if arg_85_1.var_.actorSpriteComps10060 then
					for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_88_3 then
							local var_88_18 = Mathf.Lerp(iter_88_3.color.r, 0.5, var_88_17)

							iter_88_3.color = Color.New(var_88_18, var_88_18, var_88_18)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_15 + var_88_16 and arg_85_1.time_ < var_88_15 + var_88_16 + arg_88_0 and arg_85_1.var_.actorSpriteComps10060 then
				local var_88_19 = 0.5

				for iter_88_4, iter_88_5 in pairs(arg_85_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_88_5 then
						iter_88_5.color = Color.New(var_88_19, var_88_19, var_88_19)
					end
				end

				arg_85_1.var_.actorSpriteComps10060 = nil
			end

			local var_88_20 = arg_85_1.actors_["10062"]
			local var_88_21 = 0

			if var_88_21 < arg_85_1.time_ and arg_85_1.time_ <= var_88_21 + arg_88_0 and arg_85_1.var_.actorSpriteComps10062 == nil then
				arg_85_1.var_.actorSpriteComps10062 = var_88_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_22 = 0.034

			if var_88_21 <= arg_85_1.time_ and arg_85_1.time_ < var_88_21 + var_88_22 then
				local var_88_23 = (arg_85_1.time_ - var_88_21) / var_88_22

				if arg_85_1.var_.actorSpriteComps10062 then
					for iter_88_6, iter_88_7 in pairs(arg_85_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_88_7 then
							local var_88_24 = Mathf.Lerp(iter_88_7.color.r, 1, var_88_23)

							iter_88_7.color = Color.New(var_88_24, var_88_24, var_88_24)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_21 + var_88_22 and arg_85_1.time_ < var_88_21 + var_88_22 + arg_88_0 and arg_85_1.var_.actorSpriteComps10062 then
				local var_88_25 = 1

				for iter_88_8, iter_88_9 in pairs(arg_85_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_88_9 then
						iter_88_9.color = Color.New(var_88_25, var_88_25, var_88_25)
					end
				end

				arg_85_1.var_.actorSpriteComps10062 = nil
			end

			local var_88_26 = 0
			local var_88_27 = 0.525

			if var_88_26 < arg_85_1.time_ and arg_85_1.time_ <= var_88_26 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_28 = arg_85_1:FormatText(StoryNameCfg[600].name)

				arg_85_1.leftNameTxt_.text = var_88_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_29 = arg_85_1:GetWordFromCfg(410232021)
				local var_88_30 = arg_85_1:FormatText(var_88_29.content)

				arg_85_1.text_.text = var_88_30

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_31 = 21
				local var_88_32 = utf8.len(var_88_30)
				local var_88_33 = var_88_31 <= 0 and var_88_27 or var_88_27 * (var_88_32 / var_88_31)

				if var_88_33 > 0 and var_88_27 < var_88_33 then
					arg_85_1.talkMaxDuration = var_88_33

					if var_88_33 + var_88_26 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_33 + var_88_26
					end
				end

				arg_85_1.text_.text = var_88_30
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232021", "story_v_out_410232.awb") ~= 0 then
					local var_88_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232021", "story_v_out_410232.awb") / 1000

					if var_88_34 + var_88_26 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_34 + var_88_26
					end

					if var_88_29.prefab_name ~= "" and arg_85_1.actors_[var_88_29.prefab_name] ~= nil then
						local var_88_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_29.prefab_name].transform, "story_v_out_410232", "410232021", "story_v_out_410232.awb")

						arg_85_1:RecordAudio("410232021", var_88_35)
						arg_85_1:RecordAudio("410232021", var_88_35)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_410232", "410232021", "story_v_out_410232.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_410232", "410232021", "story_v_out_410232.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_36 = math.max(var_88_27, arg_85_1.talkMaxDuration)

			if var_88_26 <= arg_85_1.time_ and arg_85_1.time_ < var_88_26 + var_88_36 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_26) / var_88_36

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_26 + var_88_36 and arg_85_1.time_ < var_88_26 + var_88_36 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play410232022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 410232022
		arg_89_1.duration_ = 3.233

		local var_89_0 = {
			ja = 3.233,
			CriLanguages = 3.166,
			zh = 3.166
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
				arg_89_0:Play410232023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10060"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos10060 = var_92_0.localPosition
				var_92_0.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("10060", 3)

				local var_92_2 = var_92_0.childCount

				for iter_92_0 = 0, var_92_2 - 1 do
					local var_92_3 = var_92_0:GetChild(iter_92_0)

					if var_92_3.name == "split_3" or not string.find(var_92_3.name, "split") then
						var_92_3.gameObject:SetActive(true)
					else
						var_92_3.gameObject:SetActive(false)
					end
				end
			end

			local var_92_4 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_4 then
				local var_92_5 = (arg_89_1.time_ - var_92_1) / var_92_4
				local var_92_6 = Vector3.New(0, -400, 0)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10060, var_92_6, var_92_5)
			end

			if arg_89_1.time_ >= var_92_1 + var_92_4 and arg_89_1.time_ < var_92_1 + var_92_4 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_92_7 = arg_89_1.actors_["10062"].transform
			local var_92_8 = 0

			if var_92_8 < arg_89_1.time_ and arg_89_1.time_ <= var_92_8 + arg_92_0 then
				arg_89_1.var_.moveOldPos10062 = var_92_7.localPosition
				var_92_7.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("10062", 7)

				local var_92_9 = var_92_7.childCount

				for iter_92_1 = 0, var_92_9 - 1 do
					local var_92_10 = var_92_7:GetChild(iter_92_1)

					if var_92_10.name == "" or not string.find(var_92_10.name, "split") then
						var_92_10.gameObject:SetActive(true)
					else
						var_92_10.gameObject:SetActive(false)
					end
				end
			end

			local var_92_11 = 0.001

			if var_92_8 <= arg_89_1.time_ and arg_89_1.time_ < var_92_8 + var_92_11 then
				local var_92_12 = (arg_89_1.time_ - var_92_8) / var_92_11
				local var_92_13 = Vector3.New(0, -2000, -290)

				var_92_7.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10062, var_92_13, var_92_12)
			end

			if arg_89_1.time_ >= var_92_8 + var_92_11 and arg_89_1.time_ < var_92_8 + var_92_11 + arg_92_0 then
				var_92_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_92_14 = arg_89_1.actors_["10060"]
			local var_92_15 = 0

			if var_92_15 < arg_89_1.time_ and arg_89_1.time_ <= var_92_15 + arg_92_0 and arg_89_1.var_.actorSpriteComps10060 == nil then
				arg_89_1.var_.actorSpriteComps10060 = var_92_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_16 = 0.034

			if var_92_15 <= arg_89_1.time_ and arg_89_1.time_ < var_92_15 + var_92_16 then
				local var_92_17 = (arg_89_1.time_ - var_92_15) / var_92_16

				if arg_89_1.var_.actorSpriteComps10060 then
					for iter_92_2, iter_92_3 in pairs(arg_89_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_92_3 then
							local var_92_18 = Mathf.Lerp(iter_92_3.color.r, 1, var_92_17)

							iter_92_3.color = Color.New(var_92_18, var_92_18, var_92_18)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_15 + var_92_16 and arg_89_1.time_ < var_92_15 + var_92_16 + arg_92_0 and arg_89_1.var_.actorSpriteComps10060 then
				local var_92_19 = 1

				for iter_92_4, iter_92_5 in pairs(arg_89_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_92_5 then
						iter_92_5.color = Color.New(var_92_19, var_92_19, var_92_19)
					end
				end

				arg_89_1.var_.actorSpriteComps10060 = nil
			end

			local var_92_20 = arg_89_1.actors_["10062"]
			local var_92_21 = 0

			if var_92_21 < arg_89_1.time_ and arg_89_1.time_ <= var_92_21 + arg_92_0 and arg_89_1.var_.actorSpriteComps10062 == nil then
				arg_89_1.var_.actorSpriteComps10062 = var_92_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_22 = 0.034

			if var_92_21 <= arg_89_1.time_ and arg_89_1.time_ < var_92_21 + var_92_22 then
				local var_92_23 = (arg_89_1.time_ - var_92_21) / var_92_22

				if arg_89_1.var_.actorSpriteComps10062 then
					for iter_92_6, iter_92_7 in pairs(arg_89_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_92_7 then
							local var_92_24 = Mathf.Lerp(iter_92_7.color.r, 0.5, var_92_23)

							iter_92_7.color = Color.New(var_92_24, var_92_24, var_92_24)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_21 + var_92_22 and arg_89_1.time_ < var_92_21 + var_92_22 + arg_92_0 and arg_89_1.var_.actorSpriteComps10062 then
				local var_92_25 = 0.5

				for iter_92_8, iter_92_9 in pairs(arg_89_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_92_9 then
						iter_92_9.color = Color.New(var_92_25, var_92_25, var_92_25)
					end
				end

				arg_89_1.var_.actorSpriteComps10062 = nil
			end

			local var_92_26 = 0
			local var_92_27 = 0.325

			if var_92_26 < arg_89_1.time_ and arg_89_1.time_ <= var_92_26 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_28 = arg_89_1:FormatText(StoryNameCfg[597].name)

				arg_89_1.leftNameTxt_.text = var_92_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_29 = arg_89_1:GetWordFromCfg(410232022)
				local var_92_30 = arg_89_1:FormatText(var_92_29.content)

				arg_89_1.text_.text = var_92_30

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_31 = 13
				local var_92_32 = utf8.len(var_92_30)
				local var_92_33 = var_92_31 <= 0 and var_92_27 or var_92_27 * (var_92_32 / var_92_31)

				if var_92_33 > 0 and var_92_27 < var_92_33 then
					arg_89_1.talkMaxDuration = var_92_33

					if var_92_33 + var_92_26 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_33 + var_92_26
					end
				end

				arg_89_1.text_.text = var_92_30
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232022", "story_v_out_410232.awb") ~= 0 then
					local var_92_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232022", "story_v_out_410232.awb") / 1000

					if var_92_34 + var_92_26 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_34 + var_92_26
					end

					if var_92_29.prefab_name ~= "" and arg_89_1.actors_[var_92_29.prefab_name] ~= nil then
						local var_92_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_29.prefab_name].transform, "story_v_out_410232", "410232022", "story_v_out_410232.awb")

						arg_89_1:RecordAudio("410232022", var_92_35)
						arg_89_1:RecordAudio("410232022", var_92_35)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_410232", "410232022", "story_v_out_410232.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_410232", "410232022", "story_v_out_410232.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_36 = math.max(var_92_27, arg_89_1.talkMaxDuration)

			if var_92_26 <= arg_89_1.time_ and arg_89_1.time_ < var_92_26 + var_92_36 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_26) / var_92_36

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_26 + var_92_36 and arg_89_1.time_ < var_92_26 + var_92_36 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play410232023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 410232023
		arg_93_1.duration_ = 9.133

		local var_93_0 = {
			ja = 9.133,
			CriLanguages = 5.266,
			zh = 5.266
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
				arg_93_0:Play410232024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["10060"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos10060 = var_96_0.localPosition
				var_96_0.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("10060", 7)

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
				local var_96_6 = Vector3.New(0, -2000, 0)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10060, var_96_6, var_96_5)
			end

			if arg_93_1.time_ >= var_96_1 + var_96_4 and arg_93_1.time_ < var_96_1 + var_96_4 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_96_7 = arg_93_1.actors_["10062"].transform
			local var_96_8 = 0

			if var_96_8 < arg_93_1.time_ and arg_93_1.time_ <= var_96_8 + arg_96_0 then
				arg_93_1.var_.moveOldPos10062 = var_96_7.localPosition
				var_96_7.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("10062", 3)

				local var_96_9 = var_96_7.childCount

				for iter_96_1 = 0, var_96_9 - 1 do
					local var_96_10 = var_96_7:GetChild(iter_96_1)

					if var_96_10.name == "split_5" or not string.find(var_96_10.name, "split") then
						var_96_10.gameObject:SetActive(true)
					else
						var_96_10.gameObject:SetActive(false)
					end
				end
			end

			local var_96_11 = 0.001

			if var_96_8 <= arg_93_1.time_ and arg_93_1.time_ < var_96_8 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_8) / var_96_11
				local var_96_13 = Vector3.New(0, -390, -290)

				var_96_7.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10062, var_96_13, var_96_12)
			end

			if arg_93_1.time_ >= var_96_8 + var_96_11 and arg_93_1.time_ < var_96_8 + var_96_11 + arg_96_0 then
				var_96_7.localPosition = Vector3.New(0, -390, -290)
			end

			local var_96_14 = arg_93_1.actors_["10060"]
			local var_96_15 = 0

			if var_96_15 < arg_93_1.time_ and arg_93_1.time_ <= var_96_15 + arg_96_0 and arg_93_1.var_.actorSpriteComps10060 == nil then
				arg_93_1.var_.actorSpriteComps10060 = var_96_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_16 = 0.034

			if var_96_15 <= arg_93_1.time_ and arg_93_1.time_ < var_96_15 + var_96_16 then
				local var_96_17 = (arg_93_1.time_ - var_96_15) / var_96_16

				if arg_93_1.var_.actorSpriteComps10060 then
					for iter_96_2, iter_96_3 in pairs(arg_93_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_96_3 then
							local var_96_18 = Mathf.Lerp(iter_96_3.color.r, 0.5, var_96_17)

							iter_96_3.color = Color.New(var_96_18, var_96_18, var_96_18)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_15 + var_96_16 and arg_93_1.time_ < var_96_15 + var_96_16 + arg_96_0 and arg_93_1.var_.actorSpriteComps10060 then
				local var_96_19 = 0.5

				for iter_96_4, iter_96_5 in pairs(arg_93_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_96_5 then
						iter_96_5.color = Color.New(var_96_19, var_96_19, var_96_19)
					end
				end

				arg_93_1.var_.actorSpriteComps10060 = nil
			end

			local var_96_20 = arg_93_1.actors_["10062"]
			local var_96_21 = 0

			if var_96_21 < arg_93_1.time_ and arg_93_1.time_ <= var_96_21 + arg_96_0 and arg_93_1.var_.actorSpriteComps10062 == nil then
				arg_93_1.var_.actorSpriteComps10062 = var_96_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_22 = 0.034

			if var_96_21 <= arg_93_1.time_ and arg_93_1.time_ < var_96_21 + var_96_22 then
				local var_96_23 = (arg_93_1.time_ - var_96_21) / var_96_22

				if arg_93_1.var_.actorSpriteComps10062 then
					for iter_96_6, iter_96_7 in pairs(arg_93_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_96_7 then
							local var_96_24 = Mathf.Lerp(iter_96_7.color.r, 1, var_96_23)

							iter_96_7.color = Color.New(var_96_24, var_96_24, var_96_24)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_21 + var_96_22 and arg_93_1.time_ < var_96_21 + var_96_22 + arg_96_0 and arg_93_1.var_.actorSpriteComps10062 then
				local var_96_25 = 1

				for iter_96_8, iter_96_9 in pairs(arg_93_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_96_9 then
						iter_96_9.color = Color.New(var_96_25, var_96_25, var_96_25)
					end
				end

				arg_93_1.var_.actorSpriteComps10062 = nil
			end

			local var_96_26 = 0
			local var_96_27 = 0.55

			if var_96_26 < arg_93_1.time_ and arg_93_1.time_ <= var_96_26 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_28 = arg_93_1:FormatText(StoryNameCfg[600].name)

				arg_93_1.leftNameTxt_.text = var_96_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_29 = arg_93_1:GetWordFromCfg(410232023)
				local var_96_30 = arg_93_1:FormatText(var_96_29.content)

				arg_93_1.text_.text = var_96_30

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_31 = 22
				local var_96_32 = utf8.len(var_96_30)
				local var_96_33 = var_96_31 <= 0 and var_96_27 or var_96_27 * (var_96_32 / var_96_31)

				if var_96_33 > 0 and var_96_27 < var_96_33 then
					arg_93_1.talkMaxDuration = var_96_33

					if var_96_33 + var_96_26 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_33 + var_96_26
					end
				end

				arg_93_1.text_.text = var_96_30
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232023", "story_v_out_410232.awb") ~= 0 then
					local var_96_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232023", "story_v_out_410232.awb") / 1000

					if var_96_34 + var_96_26 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_34 + var_96_26
					end

					if var_96_29.prefab_name ~= "" and arg_93_1.actors_[var_96_29.prefab_name] ~= nil then
						local var_96_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_29.prefab_name].transform, "story_v_out_410232", "410232023", "story_v_out_410232.awb")

						arg_93_1:RecordAudio("410232023", var_96_35)
						arg_93_1:RecordAudio("410232023", var_96_35)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_410232", "410232023", "story_v_out_410232.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_410232", "410232023", "story_v_out_410232.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_36 = math.max(var_96_27, arg_93_1.talkMaxDuration)

			if var_96_26 <= arg_93_1.time_ and arg_93_1.time_ < var_96_26 + var_96_36 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_26) / var_96_36

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_26 + var_96_36 and arg_93_1.time_ < var_96_26 + var_96_36 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play410232024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 410232024
		arg_97_1.duration_ = 2.9

		local var_97_0 = {
			ja = 2.866,
			CriLanguages = 2.9,
			zh = 2.9
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
				arg_97_0:Play410232025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10060"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos10060 = var_100_0.localPosition
				var_100_0.localScale = Vector3.New(1, 1, 1)

				arg_97_1:CheckSpriteTmpPos("10060", 2)

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
				local var_100_6 = Vector3.New(-390, -400, 0)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10060, var_100_6, var_100_5)
			end

			if arg_97_1.time_ >= var_100_1 + var_100_4 and arg_97_1.time_ < var_100_1 + var_100_4 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_100_7 = arg_97_1.actors_["10059"].transform
			local var_100_8 = 0

			if var_100_8 < arg_97_1.time_ and arg_97_1.time_ <= var_100_8 + arg_100_0 then
				arg_97_1.var_.moveOldPos10059 = var_100_7.localPosition
				var_100_7.localScale = Vector3.New(1, 1, 1)

				arg_97_1:CheckSpriteTmpPos("10059", 4)

				local var_100_9 = var_100_7.childCount

				for iter_100_1 = 0, var_100_9 - 1 do
					local var_100_10 = var_100_7:GetChild(iter_100_1)

					if var_100_10.name == "split_4" or not string.find(var_100_10.name, "split") then
						var_100_10.gameObject:SetActive(true)
					else
						var_100_10.gameObject:SetActive(false)
					end
				end
			end

			local var_100_11 = 0.001

			if var_100_8 <= arg_97_1.time_ and arg_97_1.time_ < var_100_8 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_8) / var_100_11
				local var_100_13 = Vector3.New(390, -530, 35)

				var_100_7.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10059, var_100_13, var_100_12)
			end

			if arg_97_1.time_ >= var_100_8 + var_100_11 and arg_97_1.time_ < var_100_8 + var_100_11 + arg_100_0 then
				var_100_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_100_14 = arg_97_1.actors_["10060"]
			local var_100_15 = 0

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 and arg_97_1.var_.actorSpriteComps10060 == nil then
				arg_97_1.var_.actorSpriteComps10060 = var_100_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_16 = 0.034

			if var_100_15 <= arg_97_1.time_ and arg_97_1.time_ < var_100_15 + var_100_16 then
				local var_100_17 = (arg_97_1.time_ - var_100_15) / var_100_16

				if arg_97_1.var_.actorSpriteComps10060 then
					for iter_100_2, iter_100_3 in pairs(arg_97_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_100_3 then
							local var_100_18 = Mathf.Lerp(iter_100_3.color.r, 0.5, var_100_17)

							iter_100_3.color = Color.New(var_100_18, var_100_18, var_100_18)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_15 + var_100_16 and arg_97_1.time_ < var_100_15 + var_100_16 + arg_100_0 and arg_97_1.var_.actorSpriteComps10060 then
				local var_100_19 = 0.5

				for iter_100_4, iter_100_5 in pairs(arg_97_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_100_5 then
						iter_100_5.color = Color.New(var_100_19, var_100_19, var_100_19)
					end
				end

				arg_97_1.var_.actorSpriteComps10060 = nil
			end

			local var_100_20 = arg_97_1.actors_["10059"]
			local var_100_21 = 0

			if var_100_21 < arg_97_1.time_ and arg_97_1.time_ <= var_100_21 + arg_100_0 and arg_97_1.var_.actorSpriteComps10059 == nil then
				arg_97_1.var_.actorSpriteComps10059 = var_100_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_22 = 0.034

			if var_100_21 <= arg_97_1.time_ and arg_97_1.time_ < var_100_21 + var_100_22 then
				local var_100_23 = (arg_97_1.time_ - var_100_21) / var_100_22

				if arg_97_1.var_.actorSpriteComps10059 then
					for iter_100_6, iter_100_7 in pairs(arg_97_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_100_7 then
							local var_100_24 = Mathf.Lerp(iter_100_7.color.r, 1, var_100_23)

							iter_100_7.color = Color.New(var_100_24, var_100_24, var_100_24)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_21 + var_100_22 and arg_97_1.time_ < var_100_21 + var_100_22 + arg_100_0 and arg_97_1.var_.actorSpriteComps10059 then
				local var_100_25 = 1

				for iter_100_8, iter_100_9 in pairs(arg_97_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_100_9 then
						iter_100_9.color = Color.New(var_100_25, var_100_25, var_100_25)
					end
				end

				arg_97_1.var_.actorSpriteComps10059 = nil
			end

			local var_100_26 = arg_97_1.actors_["10062"].transform
			local var_100_27 = 0

			if var_100_27 < arg_97_1.time_ and arg_97_1.time_ <= var_100_27 + arg_100_0 then
				arg_97_1.var_.moveOldPos10062 = var_100_26.localPosition
				var_100_26.localScale = Vector3.New(1, 1, 1)

				arg_97_1:CheckSpriteTmpPos("10062", 7)

				local var_100_28 = var_100_26.childCount

				for iter_100_10 = 0, var_100_28 - 1 do
					local var_100_29 = var_100_26:GetChild(iter_100_10)

					if var_100_29.name == "split_5" or not string.find(var_100_29.name, "split") then
						var_100_29.gameObject:SetActive(true)
					else
						var_100_29.gameObject:SetActive(false)
					end
				end
			end

			local var_100_30 = 0.001

			if var_100_27 <= arg_97_1.time_ and arg_97_1.time_ < var_100_27 + var_100_30 then
				local var_100_31 = (arg_97_1.time_ - var_100_27) / var_100_30
				local var_100_32 = Vector3.New(0, -2000, -290)

				var_100_26.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10062, var_100_32, var_100_31)
			end

			if arg_97_1.time_ >= var_100_27 + var_100_30 and arg_97_1.time_ < var_100_27 + var_100_30 + arg_100_0 then
				var_100_26.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_100_33 = 0
			local var_100_34 = 0.275

			if var_100_33 < arg_97_1.time_ and arg_97_1.time_ <= var_100_33 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_35 = arg_97_1:FormatText(StoryNameCfg[596].name)

				arg_97_1.leftNameTxt_.text = var_100_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_36 = arg_97_1:GetWordFromCfg(410232024)
				local var_100_37 = arg_97_1:FormatText(var_100_36.content)

				arg_97_1.text_.text = var_100_37

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_38 = 11
				local var_100_39 = utf8.len(var_100_37)
				local var_100_40 = var_100_38 <= 0 and var_100_34 or var_100_34 * (var_100_39 / var_100_38)

				if var_100_40 > 0 and var_100_34 < var_100_40 then
					arg_97_1.talkMaxDuration = var_100_40

					if var_100_40 + var_100_33 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_40 + var_100_33
					end
				end

				arg_97_1.text_.text = var_100_37
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232024", "story_v_out_410232.awb") ~= 0 then
					local var_100_41 = manager.audio:GetVoiceLength("story_v_out_410232", "410232024", "story_v_out_410232.awb") / 1000

					if var_100_41 + var_100_33 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_41 + var_100_33
					end

					if var_100_36.prefab_name ~= "" and arg_97_1.actors_[var_100_36.prefab_name] ~= nil then
						local var_100_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_36.prefab_name].transform, "story_v_out_410232", "410232024", "story_v_out_410232.awb")

						arg_97_1:RecordAudio("410232024", var_100_42)
						arg_97_1:RecordAudio("410232024", var_100_42)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_410232", "410232024", "story_v_out_410232.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_410232", "410232024", "story_v_out_410232.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_43 = math.max(var_100_34, arg_97_1.talkMaxDuration)

			if var_100_33 <= arg_97_1.time_ and arg_97_1.time_ < var_100_33 + var_100_43 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_33) / var_100_43

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_33 + var_100_43 and arg_97_1.time_ < var_100_33 + var_100_43 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play410232025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 410232025
		arg_101_1.duration_ = 4.7

		local var_101_0 = {
			ja = 4.7,
			CriLanguages = 2.866,
			zh = 2.866
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
				arg_101_0:Play410232026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10062"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos10062 = var_104_0.localPosition
				var_104_0.localScale = Vector3.New(1, 1, 1)

				arg_101_1:CheckSpriteTmpPos("10062", 3)

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
				local var_104_6 = Vector3.New(0, -390, -290)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10062, var_104_6, var_104_5)
			end

			if arg_101_1.time_ >= var_104_1 + var_104_4 and arg_101_1.time_ < var_104_1 + var_104_4 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_104_7 = arg_101_1.actors_["10060"].transform
			local var_104_8 = 0

			if var_104_8 < arg_101_1.time_ and arg_101_1.time_ <= var_104_8 + arg_104_0 then
				arg_101_1.var_.moveOldPos10060 = var_104_7.localPosition
				var_104_7.localScale = Vector3.New(1, 1, 1)

				arg_101_1:CheckSpriteTmpPos("10060", 7)

				local var_104_9 = var_104_7.childCount

				for iter_104_1 = 0, var_104_9 - 1 do
					local var_104_10 = var_104_7:GetChild(iter_104_1)

					if var_104_10.name == "" or not string.find(var_104_10.name, "split") then
						var_104_10.gameObject:SetActive(true)
					else
						var_104_10.gameObject:SetActive(false)
					end
				end
			end

			local var_104_11 = 0.001

			if var_104_8 <= arg_101_1.time_ and arg_101_1.time_ < var_104_8 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_8) / var_104_11
				local var_104_13 = Vector3.New(0, -2000, 0)

				var_104_7.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10060, var_104_13, var_104_12)
			end

			if arg_101_1.time_ >= var_104_8 + var_104_11 and arg_101_1.time_ < var_104_8 + var_104_11 + arg_104_0 then
				var_104_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_104_14 = arg_101_1.actors_["10059"].transform
			local var_104_15 = 0

			if var_104_15 < arg_101_1.time_ and arg_101_1.time_ <= var_104_15 + arg_104_0 then
				arg_101_1.var_.moveOldPos10059 = var_104_14.localPosition
				var_104_14.localScale = Vector3.New(1, 1, 1)

				arg_101_1:CheckSpriteTmpPos("10059", 7)

				local var_104_16 = var_104_14.childCount

				for iter_104_2 = 0, var_104_16 - 1 do
					local var_104_17 = var_104_14:GetChild(iter_104_2)

					if var_104_17.name == "" or not string.find(var_104_17.name, "split") then
						var_104_17.gameObject:SetActive(true)
					else
						var_104_17.gameObject:SetActive(false)
					end
				end
			end

			local var_104_18 = 0.001

			if var_104_15 <= arg_101_1.time_ and arg_101_1.time_ < var_104_15 + var_104_18 then
				local var_104_19 = (arg_101_1.time_ - var_104_15) / var_104_18
				local var_104_20 = Vector3.New(0, -2000, 35)

				var_104_14.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10059, var_104_20, var_104_19)
			end

			if arg_101_1.time_ >= var_104_15 + var_104_18 and arg_101_1.time_ < var_104_15 + var_104_18 + arg_104_0 then
				var_104_14.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_104_21 = arg_101_1.actors_["10062"]
			local var_104_22 = 0

			if var_104_22 < arg_101_1.time_ and arg_101_1.time_ <= var_104_22 + arg_104_0 and arg_101_1.var_.actorSpriteComps10062 == nil then
				arg_101_1.var_.actorSpriteComps10062 = var_104_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_23 = 0.034

			if var_104_22 <= arg_101_1.time_ and arg_101_1.time_ < var_104_22 + var_104_23 then
				local var_104_24 = (arg_101_1.time_ - var_104_22) / var_104_23

				if arg_101_1.var_.actorSpriteComps10062 then
					for iter_104_3, iter_104_4 in pairs(arg_101_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_104_4 then
							local var_104_25 = Mathf.Lerp(iter_104_4.color.r, 1, var_104_24)

							iter_104_4.color = Color.New(var_104_25, var_104_25, var_104_25)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_22 + var_104_23 and arg_101_1.time_ < var_104_22 + var_104_23 + arg_104_0 and arg_101_1.var_.actorSpriteComps10062 then
				local var_104_26 = 1

				for iter_104_5, iter_104_6 in pairs(arg_101_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_104_6 then
						iter_104_6.color = Color.New(var_104_26, var_104_26, var_104_26)
					end
				end

				arg_101_1.var_.actorSpriteComps10062 = nil
			end

			local var_104_27 = arg_101_1.actors_["10060"]
			local var_104_28 = 0

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 and arg_101_1.var_.actorSpriteComps10060 == nil then
				arg_101_1.var_.actorSpriteComps10060 = var_104_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_29 = 0.034

			if var_104_28 <= arg_101_1.time_ and arg_101_1.time_ < var_104_28 + var_104_29 then
				local var_104_30 = (arg_101_1.time_ - var_104_28) / var_104_29

				if arg_101_1.var_.actorSpriteComps10060 then
					for iter_104_7, iter_104_8 in pairs(arg_101_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_104_8 then
							local var_104_31 = Mathf.Lerp(iter_104_8.color.r, 0.5, var_104_30)

							iter_104_8.color = Color.New(var_104_31, var_104_31, var_104_31)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_28 + var_104_29 and arg_101_1.time_ < var_104_28 + var_104_29 + arg_104_0 and arg_101_1.var_.actorSpriteComps10060 then
				local var_104_32 = 0.5

				for iter_104_9, iter_104_10 in pairs(arg_101_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_104_10 then
						iter_104_10.color = Color.New(var_104_32, var_104_32, var_104_32)
					end
				end

				arg_101_1.var_.actorSpriteComps10060 = nil
			end

			local var_104_33 = arg_101_1.actors_["10059"]
			local var_104_34 = 0

			if var_104_34 < arg_101_1.time_ and arg_101_1.time_ <= var_104_34 + arg_104_0 and arg_101_1.var_.actorSpriteComps10059 == nil then
				arg_101_1.var_.actorSpriteComps10059 = var_104_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_35 = 0.034

			if var_104_34 <= arg_101_1.time_ and arg_101_1.time_ < var_104_34 + var_104_35 then
				local var_104_36 = (arg_101_1.time_ - var_104_34) / var_104_35

				if arg_101_1.var_.actorSpriteComps10059 then
					for iter_104_11, iter_104_12 in pairs(arg_101_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_104_12 then
							local var_104_37 = Mathf.Lerp(iter_104_12.color.r, 0.5, var_104_36)

							iter_104_12.color = Color.New(var_104_37, var_104_37, var_104_37)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_34 + var_104_35 and arg_101_1.time_ < var_104_34 + var_104_35 + arg_104_0 and arg_101_1.var_.actorSpriteComps10059 then
				local var_104_38 = 0.5

				for iter_104_13, iter_104_14 in pairs(arg_101_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_104_14 then
						iter_104_14.color = Color.New(var_104_38, var_104_38, var_104_38)
					end
				end

				arg_101_1.var_.actorSpriteComps10059 = nil
			end

			local var_104_39 = 0
			local var_104_40 = 0.275

			if var_104_39 < arg_101_1.time_ and arg_101_1.time_ <= var_104_39 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_41 = arg_101_1:FormatText(StoryNameCfg[600].name)

				arg_101_1.leftNameTxt_.text = var_104_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_42 = arg_101_1:GetWordFromCfg(410232025)
				local var_104_43 = arg_101_1:FormatText(var_104_42.content)

				arg_101_1.text_.text = var_104_43

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_44 = 11
				local var_104_45 = utf8.len(var_104_43)
				local var_104_46 = var_104_44 <= 0 and var_104_40 or var_104_40 * (var_104_45 / var_104_44)

				if var_104_46 > 0 and var_104_40 < var_104_46 then
					arg_101_1.talkMaxDuration = var_104_46

					if var_104_46 + var_104_39 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_46 + var_104_39
					end
				end

				arg_101_1.text_.text = var_104_43
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232025", "story_v_out_410232.awb") ~= 0 then
					local var_104_47 = manager.audio:GetVoiceLength("story_v_out_410232", "410232025", "story_v_out_410232.awb") / 1000

					if var_104_47 + var_104_39 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_47 + var_104_39
					end

					if var_104_42.prefab_name ~= "" and arg_101_1.actors_[var_104_42.prefab_name] ~= nil then
						local var_104_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_42.prefab_name].transform, "story_v_out_410232", "410232025", "story_v_out_410232.awb")

						arg_101_1:RecordAudio("410232025", var_104_48)
						arg_101_1:RecordAudio("410232025", var_104_48)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_410232", "410232025", "story_v_out_410232.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_410232", "410232025", "story_v_out_410232.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_49 = math.max(var_104_40, arg_101_1.talkMaxDuration)

			if var_104_39 <= arg_101_1.time_ and arg_101_1.time_ < var_104_39 + var_104_49 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_39) / var_104_49

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_39 + var_104_49 and arg_101_1.time_ < var_104_39 + var_104_49 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play410232026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 410232026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play410232027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10062"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.actorSpriteComps10062 == nil then
				arg_105_1.var_.actorSpriteComps10062 = var_108_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_2 = 0.034

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.actorSpriteComps10062 then
					for iter_108_0, iter_108_1 in pairs(arg_105_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_108_1 then
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 0.5, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps10062 then
				local var_108_5 = 0.5

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps10062 = nil
			end

			local var_108_6 = 0
			local var_108_7 = 0.975

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

				local var_108_8 = arg_105_1:GetWordFromCfg(410232026)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 39
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
	Play410232027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 410232027
		arg_109_1.duration_ = 3

		local var_109_0 = {
			ja = 3,
			CriLanguages = 2.933,
			zh = 2.933
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
				arg_109_0:Play410232028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["10060"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos10060 = var_112_0.localPosition
				var_112_0.localScale = Vector3.New(1, 1, 1)

				arg_109_1:CheckSpriteTmpPos("10060", 2)

				local var_112_2 = var_112_0.childCount

				for iter_112_0 = 0, var_112_2 - 1 do
					local var_112_3 = var_112_0:GetChild(iter_112_0)

					if var_112_3.name == "" or not string.find(var_112_3.name, "split") then
						var_112_3.gameObject:SetActive(true)
					else
						var_112_3.gameObject:SetActive(false)
					end
				end
			end

			local var_112_4 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_4 then
				local var_112_5 = (arg_109_1.time_ - var_112_1) / var_112_4
				local var_112_6 = Vector3.New(-390, -400, 0)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos10060, var_112_6, var_112_5)
			end

			if arg_109_1.time_ >= var_112_1 + var_112_4 and arg_109_1.time_ < var_112_1 + var_112_4 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_112_7 = arg_109_1.actors_["10062"].transform
			local var_112_8 = 0

			if var_112_8 < arg_109_1.time_ and arg_109_1.time_ <= var_112_8 + arg_112_0 then
				arg_109_1.var_.moveOldPos10062 = var_112_7.localPosition
				var_112_7.localScale = Vector3.New(1, 1, 1)

				arg_109_1:CheckSpriteTmpPos("10062", 4)

				local var_112_9 = var_112_7.childCount

				for iter_112_1 = 0, var_112_9 - 1 do
					local var_112_10 = var_112_7:GetChild(iter_112_1)

					if var_112_10.name == "" or not string.find(var_112_10.name, "split") then
						var_112_10.gameObject:SetActive(true)
					else
						var_112_10.gameObject:SetActive(false)
					end
				end
			end

			local var_112_11 = 0.001

			if var_112_8 <= arg_109_1.time_ and arg_109_1.time_ < var_112_8 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_8) / var_112_11
				local var_112_13 = Vector3.New(370, -390, -290)

				var_112_7.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos10062, var_112_13, var_112_12)
			end

			if arg_109_1.time_ >= var_112_8 + var_112_11 and arg_109_1.time_ < var_112_8 + var_112_11 + arg_112_0 then
				var_112_7.localPosition = Vector3.New(370, -390, -290)
			end

			local var_112_14 = arg_109_1.actors_["10060"]
			local var_112_15 = 0

			if var_112_15 < arg_109_1.time_ and arg_109_1.time_ <= var_112_15 + arg_112_0 and arg_109_1.var_.actorSpriteComps10060 == nil then
				arg_109_1.var_.actorSpriteComps10060 = var_112_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_16 = 0.034

			if var_112_15 <= arg_109_1.time_ and arg_109_1.time_ < var_112_15 + var_112_16 then
				local var_112_17 = (arg_109_1.time_ - var_112_15) / var_112_16

				if arg_109_1.var_.actorSpriteComps10060 then
					for iter_112_2, iter_112_3 in pairs(arg_109_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_112_3 then
							local var_112_18 = Mathf.Lerp(iter_112_3.color.r, 1, var_112_17)

							iter_112_3.color = Color.New(var_112_18, var_112_18, var_112_18)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_15 + var_112_16 and arg_109_1.time_ < var_112_15 + var_112_16 + arg_112_0 and arg_109_1.var_.actorSpriteComps10060 then
				local var_112_19 = 1

				for iter_112_4, iter_112_5 in pairs(arg_109_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_112_5 then
						iter_112_5.color = Color.New(var_112_19, var_112_19, var_112_19)
					end
				end

				arg_109_1.var_.actorSpriteComps10060 = nil
			end

			local var_112_20 = arg_109_1.actors_["10062"]
			local var_112_21 = 0

			if var_112_21 < arg_109_1.time_ and arg_109_1.time_ <= var_112_21 + arg_112_0 and arg_109_1.var_.actorSpriteComps10062 == nil then
				arg_109_1.var_.actorSpriteComps10062 = var_112_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_22 = 0.034

			if var_112_21 <= arg_109_1.time_ and arg_109_1.time_ < var_112_21 + var_112_22 then
				local var_112_23 = (arg_109_1.time_ - var_112_21) / var_112_22

				if arg_109_1.var_.actorSpriteComps10062 then
					for iter_112_6, iter_112_7 in pairs(arg_109_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_112_7 then
							local var_112_24 = Mathf.Lerp(iter_112_7.color.r, 0.5, var_112_23)

							iter_112_7.color = Color.New(var_112_24, var_112_24, var_112_24)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_21 + var_112_22 and arg_109_1.time_ < var_112_21 + var_112_22 + arg_112_0 and arg_109_1.var_.actorSpriteComps10062 then
				local var_112_25 = 0.5

				for iter_112_8, iter_112_9 in pairs(arg_109_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_112_9 then
						iter_112_9.color = Color.New(var_112_25, var_112_25, var_112_25)
					end
				end

				arg_109_1.var_.actorSpriteComps10062 = nil
			end

			local var_112_26 = 0
			local var_112_27 = 0.275

			if var_112_26 < arg_109_1.time_ and arg_109_1.time_ <= var_112_26 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_28 = arg_109_1:FormatText(StoryNameCfg[597].name)

				arg_109_1.leftNameTxt_.text = var_112_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_29 = arg_109_1:GetWordFromCfg(410232027)
				local var_112_30 = arg_109_1:FormatText(var_112_29.content)

				arg_109_1.text_.text = var_112_30

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_31 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232027", "story_v_out_410232.awb") ~= 0 then
					local var_112_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232027", "story_v_out_410232.awb") / 1000

					if var_112_34 + var_112_26 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_34 + var_112_26
					end

					if var_112_29.prefab_name ~= "" and arg_109_1.actors_[var_112_29.prefab_name] ~= nil then
						local var_112_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_29.prefab_name].transform, "story_v_out_410232", "410232027", "story_v_out_410232.awb")

						arg_109_1:RecordAudio("410232027", var_112_35)
						arg_109_1:RecordAudio("410232027", var_112_35)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_410232", "410232027", "story_v_out_410232.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_410232", "410232027", "story_v_out_410232.awb")
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
	Play410232028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 410232028
		arg_113_1.duration_ = 8.966

		local var_113_0 = {
			ja = 8.966,
			CriLanguages = 6.6,
			zh = 6.6
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
				arg_113_0:Play410232029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10062"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos10062 = var_116_0.localPosition
				var_116_0.localScale = Vector3.New(1, 1, 1)

				arg_113_1:CheckSpriteTmpPos("10062", 4)

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
				local var_116_6 = Vector3.New(370, -390, -290)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10062, var_116_6, var_116_5)
			end

			if arg_113_1.time_ >= var_116_1 + var_116_4 and arg_113_1.time_ < var_116_1 + var_116_4 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_116_7 = arg_113_1.actors_["10062"]
			local var_116_8 = 0

			if var_116_8 < arg_113_1.time_ and arg_113_1.time_ <= var_116_8 + arg_116_0 and arg_113_1.var_.actorSpriteComps10062 == nil then
				arg_113_1.var_.actorSpriteComps10062 = var_116_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_9 = 0.034

			if var_116_8 <= arg_113_1.time_ and arg_113_1.time_ < var_116_8 + var_116_9 then
				local var_116_10 = (arg_113_1.time_ - var_116_8) / var_116_9

				if arg_113_1.var_.actorSpriteComps10062 then
					for iter_116_1, iter_116_2 in pairs(arg_113_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_116_2 then
							local var_116_11 = Mathf.Lerp(iter_116_2.color.r, 1, var_116_10)

							iter_116_2.color = Color.New(var_116_11, var_116_11, var_116_11)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_8 + var_116_9 and arg_113_1.time_ < var_116_8 + var_116_9 + arg_116_0 and arg_113_1.var_.actorSpriteComps10062 then
				local var_116_12 = 1

				for iter_116_3, iter_116_4 in pairs(arg_113_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_116_4 then
						iter_116_4.color = Color.New(var_116_12, var_116_12, var_116_12)
					end
				end

				arg_113_1.var_.actorSpriteComps10062 = nil
			end

			local var_116_13 = arg_113_1.actors_["10060"]
			local var_116_14 = 0

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 and arg_113_1.var_.actorSpriteComps10060 == nil then
				arg_113_1.var_.actorSpriteComps10060 = var_116_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_15 = 0.034

			if var_116_14 <= arg_113_1.time_ and arg_113_1.time_ < var_116_14 + var_116_15 then
				local var_116_16 = (arg_113_1.time_ - var_116_14) / var_116_15

				if arg_113_1.var_.actorSpriteComps10060 then
					for iter_116_5, iter_116_6 in pairs(arg_113_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_116_6 then
							local var_116_17 = Mathf.Lerp(iter_116_6.color.r, 0.5, var_116_16)

							iter_116_6.color = Color.New(var_116_17, var_116_17, var_116_17)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_14 + var_116_15 and arg_113_1.time_ < var_116_14 + var_116_15 + arg_116_0 and arg_113_1.var_.actorSpriteComps10060 then
				local var_116_18 = 0.5

				for iter_116_7, iter_116_8 in pairs(arg_113_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_116_8 then
						iter_116_8.color = Color.New(var_116_18, var_116_18, var_116_18)
					end
				end

				arg_113_1.var_.actorSpriteComps10060 = nil
			end

			local var_116_19 = 0
			local var_116_20 = 0.425

			if var_116_19 < arg_113_1.time_ and arg_113_1.time_ <= var_116_19 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_21 = arg_113_1:FormatText(StoryNameCfg[600].name)

				arg_113_1.leftNameTxt_.text = var_116_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_22 = arg_113_1:GetWordFromCfg(410232028)
				local var_116_23 = arg_113_1:FormatText(var_116_22.content)

				arg_113_1.text_.text = var_116_23

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_24 = 17
				local var_116_25 = utf8.len(var_116_23)
				local var_116_26 = var_116_24 <= 0 and var_116_20 or var_116_20 * (var_116_25 / var_116_24)

				if var_116_26 > 0 and var_116_20 < var_116_26 then
					arg_113_1.talkMaxDuration = var_116_26

					if var_116_26 + var_116_19 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_26 + var_116_19
					end
				end

				arg_113_1.text_.text = var_116_23
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232028", "story_v_out_410232.awb") ~= 0 then
					local var_116_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232028", "story_v_out_410232.awb") / 1000

					if var_116_27 + var_116_19 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_27 + var_116_19
					end

					if var_116_22.prefab_name ~= "" and arg_113_1.actors_[var_116_22.prefab_name] ~= nil then
						local var_116_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_22.prefab_name].transform, "story_v_out_410232", "410232028", "story_v_out_410232.awb")

						arg_113_1:RecordAudio("410232028", var_116_28)
						arg_113_1:RecordAudio("410232028", var_116_28)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_410232", "410232028", "story_v_out_410232.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_410232", "410232028", "story_v_out_410232.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_29 = math.max(var_116_20, arg_113_1.talkMaxDuration)

			if var_116_19 <= arg_113_1.time_ and arg_113_1.time_ < var_116_19 + var_116_29 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_19) / var_116_29

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_19 + var_116_29 and arg_113_1.time_ < var_116_19 + var_116_29 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play410232029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 410232029
		arg_117_1.duration_ = 9.6

		local var_117_0 = {
			ja = 8.5,
			CriLanguages = 9.6,
			zh = 9.6
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
				arg_117_0:Play410232030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10060"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos10060 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("10060", 2)

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
				local var_120_6 = Vector3.New(-390, -400, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10060, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_120_7 = arg_117_1.actors_["10060"]
			local var_120_8 = 0

			if var_120_8 < arg_117_1.time_ and arg_117_1.time_ <= var_120_8 + arg_120_0 and arg_117_1.var_.actorSpriteComps10060 == nil then
				arg_117_1.var_.actorSpriteComps10060 = var_120_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_9 = 0.034

			if var_120_8 <= arg_117_1.time_ and arg_117_1.time_ < var_120_8 + var_120_9 then
				local var_120_10 = (arg_117_1.time_ - var_120_8) / var_120_9

				if arg_117_1.var_.actorSpriteComps10060 then
					for iter_120_1, iter_120_2 in pairs(arg_117_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_120_2 then
							local var_120_11 = Mathf.Lerp(iter_120_2.color.r, 1, var_120_10)

							iter_120_2.color = Color.New(var_120_11, var_120_11, var_120_11)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_8 + var_120_9 and arg_117_1.time_ < var_120_8 + var_120_9 + arg_120_0 and arg_117_1.var_.actorSpriteComps10060 then
				local var_120_12 = 1

				for iter_120_3, iter_120_4 in pairs(arg_117_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_120_4 then
						iter_120_4.color = Color.New(var_120_12, var_120_12, var_120_12)
					end
				end

				arg_117_1.var_.actorSpriteComps10060 = nil
			end

			local var_120_13 = arg_117_1.actors_["10062"]
			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 and arg_117_1.var_.actorSpriteComps10062 == nil then
				arg_117_1.var_.actorSpriteComps10062 = var_120_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_15 = 0.034

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_15 then
				local var_120_16 = (arg_117_1.time_ - var_120_14) / var_120_15

				if arg_117_1.var_.actorSpriteComps10062 then
					for iter_120_5, iter_120_6 in pairs(arg_117_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_120_6 then
							local var_120_17 = Mathf.Lerp(iter_120_6.color.r, 0.5, var_120_16)

							iter_120_6.color = Color.New(var_120_17, var_120_17, var_120_17)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_14 + var_120_15 and arg_117_1.time_ < var_120_14 + var_120_15 + arg_120_0 and arg_117_1.var_.actorSpriteComps10062 then
				local var_120_18 = 0.5

				for iter_120_7, iter_120_8 in pairs(arg_117_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_120_8 then
						iter_120_8.color = Color.New(var_120_18, var_120_18, var_120_18)
					end
				end

				arg_117_1.var_.actorSpriteComps10062 = nil
			end

			local var_120_19 = 0
			local var_120_20 = 0.875

			if var_120_19 < arg_117_1.time_ and arg_117_1.time_ <= var_120_19 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_21 = arg_117_1:FormatText(StoryNameCfg[597].name)

				arg_117_1.leftNameTxt_.text = var_120_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_22 = arg_117_1:GetWordFromCfg(410232029)
				local var_120_23 = arg_117_1:FormatText(var_120_22.content)

				arg_117_1.text_.text = var_120_23

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_24 = 35
				local var_120_25 = utf8.len(var_120_23)
				local var_120_26 = var_120_24 <= 0 and var_120_20 or var_120_20 * (var_120_25 / var_120_24)

				if var_120_26 > 0 and var_120_20 < var_120_26 then
					arg_117_1.talkMaxDuration = var_120_26

					if var_120_26 + var_120_19 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_26 + var_120_19
					end
				end

				arg_117_1.text_.text = var_120_23
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232029", "story_v_out_410232.awb") ~= 0 then
					local var_120_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232029", "story_v_out_410232.awb") / 1000

					if var_120_27 + var_120_19 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_27 + var_120_19
					end

					if var_120_22.prefab_name ~= "" and arg_117_1.actors_[var_120_22.prefab_name] ~= nil then
						local var_120_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_22.prefab_name].transform, "story_v_out_410232", "410232029", "story_v_out_410232.awb")

						arg_117_1:RecordAudio("410232029", var_120_28)
						arg_117_1:RecordAudio("410232029", var_120_28)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_410232", "410232029", "story_v_out_410232.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_410232", "410232029", "story_v_out_410232.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_29 = math.max(var_120_20, arg_117_1.talkMaxDuration)

			if var_120_19 <= arg_117_1.time_ and arg_117_1.time_ < var_120_19 + var_120_29 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_19) / var_120_29

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_19 + var_120_29 and arg_117_1.time_ < var_120_19 + var_120_29 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play410232030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410232030
		arg_121_1.duration_ = 5.066

		local var_121_0 = {
			ja = 5.066,
			CriLanguages = 4.866,
			zh = 4.866
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
				arg_121_0:Play410232031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10060"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos10060 = var_124_0.localPosition
				var_124_0.localScale = Vector3.New(1, 1, 1)

				arg_121_1:CheckSpriteTmpPos("10060", 2)

				local var_124_2 = var_124_0.childCount

				for iter_124_0 = 0, var_124_2 - 1 do
					local var_124_3 = var_124_0:GetChild(iter_124_0)

					if var_124_3.name == "" or not string.find(var_124_3.name, "split") then
						var_124_3.gameObject:SetActive(true)
					else
						var_124_3.gameObject:SetActive(false)
					end
				end
			end

			local var_124_4 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_4 then
				local var_124_5 = (arg_121_1.time_ - var_124_1) / var_124_4
				local var_124_6 = Vector3.New(-390, -400, 0)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10060, var_124_6, var_124_5)
			end

			if arg_121_1.time_ >= var_124_1 + var_124_4 and arg_121_1.time_ < var_124_1 + var_124_4 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_124_7 = arg_121_1.actors_["10060"]
			local var_124_8 = 0

			if var_124_8 < arg_121_1.time_ and arg_121_1.time_ <= var_124_8 + arg_124_0 and arg_121_1.var_.actorSpriteComps10060 == nil then
				arg_121_1.var_.actorSpriteComps10060 = var_124_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_9 = 0.034

			if var_124_8 <= arg_121_1.time_ and arg_121_1.time_ < var_124_8 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_8) / var_124_9

				if arg_121_1.var_.actorSpriteComps10060 then
					for iter_124_1, iter_124_2 in pairs(arg_121_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_124_2 then
							local var_124_11 = Mathf.Lerp(iter_124_2.color.r, 1, var_124_10)

							iter_124_2.color = Color.New(var_124_11, var_124_11, var_124_11)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_8 + var_124_9 and arg_121_1.time_ < var_124_8 + var_124_9 + arg_124_0 and arg_121_1.var_.actorSpriteComps10060 then
				local var_124_12 = 1

				for iter_124_3, iter_124_4 in pairs(arg_121_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_124_4 then
						iter_124_4.color = Color.New(var_124_12, var_124_12, var_124_12)
					end
				end

				arg_121_1.var_.actorSpriteComps10060 = nil
			end

			local var_124_13 = 0
			local var_124_14 = 0.475

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_15 = arg_121_1:FormatText(StoryNameCfg[597].name)

				arg_121_1.leftNameTxt_.text = var_124_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_16 = arg_121_1:GetWordFromCfg(410232030)
				local var_124_17 = arg_121_1:FormatText(var_124_16.content)

				arg_121_1.text_.text = var_124_17

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_18 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232030", "story_v_out_410232.awb") ~= 0 then
					local var_124_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232030", "story_v_out_410232.awb") / 1000

					if var_124_21 + var_124_13 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_21 + var_124_13
					end

					if var_124_16.prefab_name ~= "" and arg_121_1.actors_[var_124_16.prefab_name] ~= nil then
						local var_124_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_16.prefab_name].transform, "story_v_out_410232", "410232030", "story_v_out_410232.awb")

						arg_121_1:RecordAudio("410232030", var_124_22)
						arg_121_1:RecordAudio("410232030", var_124_22)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_410232", "410232030", "story_v_out_410232.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_410232", "410232030", "story_v_out_410232.awb")
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
	Play410232031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410232031
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play410232032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10060"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos10060 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10060", 7)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(0, -2000, 0)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10060, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_128_7 = arg_125_1.actors_["10062"].transform
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 then
				arg_125_1.var_.moveOldPos10062 = var_128_7.localPosition
				var_128_7.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10062", 7)

				local var_128_9 = var_128_7.childCount

				for iter_128_1 = 0, var_128_9 - 1 do
					local var_128_10 = var_128_7:GetChild(iter_128_1)

					if var_128_10.name == "" or not string.find(var_128_10.name, "split") then
						var_128_10.gameObject:SetActive(true)
					else
						var_128_10.gameObject:SetActive(false)
					end
				end
			end

			local var_128_11 = 0.001

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_11 then
				local var_128_12 = (arg_125_1.time_ - var_128_8) / var_128_11
				local var_128_13 = Vector3.New(0, -2000, -290)

				var_128_7.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10062, var_128_13, var_128_12)
			end

			if arg_125_1.time_ >= var_128_8 + var_128_11 and arg_125_1.time_ < var_128_8 + var_128_11 + arg_128_0 then
				var_128_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_128_14 = arg_125_1.actors_["10059"].transform
			local var_128_15 = 0

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.var_.moveOldPos10059 = var_128_14.localPosition
				var_128_14.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10059", 3)

				local var_128_16 = var_128_14.childCount

				for iter_128_2 = 0, var_128_16 - 1 do
					local var_128_17 = var_128_14:GetChild(iter_128_2)

					if var_128_17.name == "split_3" or not string.find(var_128_17.name, "split") then
						var_128_17.gameObject:SetActive(true)
					else
						var_128_17.gameObject:SetActive(false)
					end
				end
			end

			local var_128_18 = 0.001

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_18 then
				local var_128_19 = (arg_125_1.time_ - var_128_15) / var_128_18
				local var_128_20 = Vector3.New(0, -530, 35)

				var_128_14.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10059, var_128_20, var_128_19)
			end

			if arg_125_1.time_ >= var_128_15 + var_128_18 and arg_125_1.time_ < var_128_15 + var_128_18 + arg_128_0 then
				var_128_14.localPosition = Vector3.New(0, -530, 35)
			end

			local var_128_21 = arg_125_1.actors_["10060"]
			local var_128_22 = 0

			if var_128_22 < arg_125_1.time_ and arg_125_1.time_ <= var_128_22 + arg_128_0 and arg_125_1.var_.actorSpriteComps10060 == nil then
				arg_125_1.var_.actorSpriteComps10060 = var_128_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_23 = 0.034

			if var_128_22 <= arg_125_1.time_ and arg_125_1.time_ < var_128_22 + var_128_23 then
				local var_128_24 = (arg_125_1.time_ - var_128_22) / var_128_23

				if arg_125_1.var_.actorSpriteComps10060 then
					for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_128_4 then
							local var_128_25 = Mathf.Lerp(iter_128_4.color.r, 0.5, var_128_24)

							iter_128_4.color = Color.New(var_128_25, var_128_25, var_128_25)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_22 + var_128_23 and arg_125_1.time_ < var_128_22 + var_128_23 + arg_128_0 and arg_125_1.var_.actorSpriteComps10060 then
				local var_128_26 = 0.5

				for iter_128_5, iter_128_6 in pairs(arg_125_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_128_6 then
						iter_128_6.color = Color.New(var_128_26, var_128_26, var_128_26)
					end
				end

				arg_125_1.var_.actorSpriteComps10060 = nil
			end

			local var_128_27 = arg_125_1.actors_["10062"]
			local var_128_28 = 0

			if var_128_28 < arg_125_1.time_ and arg_125_1.time_ <= var_128_28 + arg_128_0 and arg_125_1.var_.actorSpriteComps10062 == nil then
				arg_125_1.var_.actorSpriteComps10062 = var_128_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_29 = 0.034

			if var_128_28 <= arg_125_1.time_ and arg_125_1.time_ < var_128_28 + var_128_29 then
				local var_128_30 = (arg_125_1.time_ - var_128_28) / var_128_29

				if arg_125_1.var_.actorSpriteComps10062 then
					for iter_128_7, iter_128_8 in pairs(arg_125_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_128_8 then
							local var_128_31 = Mathf.Lerp(iter_128_8.color.r, 0.5, var_128_30)

							iter_128_8.color = Color.New(var_128_31, var_128_31, var_128_31)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_28 + var_128_29 and arg_125_1.time_ < var_128_28 + var_128_29 + arg_128_0 and arg_125_1.var_.actorSpriteComps10062 then
				local var_128_32 = 0.5

				for iter_128_9, iter_128_10 in pairs(arg_125_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_128_10 then
						iter_128_10.color = Color.New(var_128_32, var_128_32, var_128_32)
					end
				end

				arg_125_1.var_.actorSpriteComps10062 = nil
			end

			local var_128_33 = arg_125_1.actors_["10059"]
			local var_128_34 = 0

			if var_128_34 < arg_125_1.time_ and arg_125_1.time_ <= var_128_34 + arg_128_0 and arg_125_1.var_.actorSpriteComps10059 == nil then
				arg_125_1.var_.actorSpriteComps10059 = var_128_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_35 = 0.034

			if var_128_34 <= arg_125_1.time_ and arg_125_1.time_ < var_128_34 + var_128_35 then
				local var_128_36 = (arg_125_1.time_ - var_128_34) / var_128_35

				if arg_125_1.var_.actorSpriteComps10059 then
					for iter_128_11, iter_128_12 in pairs(arg_125_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_128_12 then
							local var_128_37 = Mathf.Lerp(iter_128_12.color.r, 0.5, var_128_36)

							iter_128_12.color = Color.New(var_128_37, var_128_37, var_128_37)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_34 + var_128_35 and arg_125_1.time_ < var_128_34 + var_128_35 + arg_128_0 and arg_125_1.var_.actorSpriteComps10059 then
				local var_128_38 = 0.5

				for iter_128_13, iter_128_14 in pairs(arg_125_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_128_14 then
						iter_128_14.color = Color.New(var_128_38, var_128_38, var_128_38)
					end
				end

				arg_125_1.var_.actorSpriteComps10059 = nil
			end

			local var_128_39 = 0
			local var_128_40 = 0.975

			if var_128_39 < arg_125_1.time_ and arg_125_1.time_ <= var_128_39 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_41 = arg_125_1:GetWordFromCfg(410232031)
				local var_128_42 = arg_125_1:FormatText(var_128_41.content)

				arg_125_1.text_.text = var_128_42

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_43 = 39
				local var_128_44 = utf8.len(var_128_42)
				local var_128_45 = var_128_43 <= 0 and var_128_40 or var_128_40 * (var_128_44 / var_128_43)

				if var_128_45 > 0 and var_128_40 < var_128_45 then
					arg_125_1.talkMaxDuration = var_128_45

					if var_128_45 + var_128_39 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_45 + var_128_39
					end
				end

				arg_125_1.text_.text = var_128_42
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_46 = math.max(var_128_40, arg_125_1.talkMaxDuration)

			if var_128_39 <= arg_125_1.time_ and arg_125_1.time_ < var_128_39 + var_128_46 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_39) / var_128_46

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_39 + var_128_46 and arg_125_1.time_ < var_128_39 + var_128_46 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410232032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410232032
		arg_129_1.duration_ = 10

		local var_129_0 = {
			ja = 7.333,
			CriLanguages = 10,
			zh = 10
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
				arg_129_0:Play410232033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10059"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos10059 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10059", 7)

				local var_132_2 = var_132_0.childCount

				for iter_132_0 = 0, var_132_2 - 1 do
					local var_132_3 = var_132_0:GetChild(iter_132_0)

					if var_132_3.name == "" or not string.find(var_132_3.name, "split") then
						var_132_3.gameObject:SetActive(true)
					else
						var_132_3.gameObject:SetActive(false)
					end
				end
			end

			local var_132_4 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_1) / var_132_4
				local var_132_6 = Vector3.New(0, -2000, 35)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10059, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_132_7 = arg_129_1.actors_["10062"].transform
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 then
				arg_129_1.var_.moveOldPos10062 = var_132_7.localPosition
				var_132_7.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10062", 3)

				local var_132_9 = var_132_7.childCount

				for iter_132_1 = 0, var_132_9 - 1 do
					local var_132_10 = var_132_7:GetChild(iter_132_1)

					if var_132_10.name == "split_2" or not string.find(var_132_10.name, "split") then
						var_132_10.gameObject:SetActive(true)
					else
						var_132_10.gameObject:SetActive(false)
					end
				end
			end

			local var_132_11 = 0.001

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_8) / var_132_11
				local var_132_13 = Vector3.New(0, -390, -290)

				var_132_7.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10062, var_132_13, var_132_12)
			end

			if arg_129_1.time_ >= var_132_8 + var_132_11 and arg_129_1.time_ < var_132_8 + var_132_11 + arg_132_0 then
				var_132_7.localPosition = Vector3.New(0, -390, -290)
			end

			local var_132_14 = arg_129_1.actors_["10059"]
			local var_132_15 = 0

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 and arg_129_1.var_.actorSpriteComps10059 == nil then
				arg_129_1.var_.actorSpriteComps10059 = var_132_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_16 = 0.034

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_16 then
				local var_132_17 = (arg_129_1.time_ - var_132_15) / var_132_16

				if arg_129_1.var_.actorSpriteComps10059 then
					for iter_132_2, iter_132_3 in pairs(arg_129_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_132_3 then
							local var_132_18 = Mathf.Lerp(iter_132_3.color.r, 0.5, var_132_17)

							iter_132_3.color = Color.New(var_132_18, var_132_18, var_132_18)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_15 + var_132_16 and arg_129_1.time_ < var_132_15 + var_132_16 + arg_132_0 and arg_129_1.var_.actorSpriteComps10059 then
				local var_132_19 = 0.5

				for iter_132_4, iter_132_5 in pairs(arg_129_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_132_5 then
						iter_132_5.color = Color.New(var_132_19, var_132_19, var_132_19)
					end
				end

				arg_129_1.var_.actorSpriteComps10059 = nil
			end

			local var_132_20 = arg_129_1.actors_["10062"]
			local var_132_21 = 0

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 and arg_129_1.var_.actorSpriteComps10062 == nil then
				arg_129_1.var_.actorSpriteComps10062 = var_132_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_22 = 0.034

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_22 then
				local var_132_23 = (arg_129_1.time_ - var_132_21) / var_132_22

				if arg_129_1.var_.actorSpriteComps10062 then
					for iter_132_6, iter_132_7 in pairs(arg_129_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_132_7 then
							local var_132_24 = Mathf.Lerp(iter_132_7.color.r, 1, var_132_23)

							iter_132_7.color = Color.New(var_132_24, var_132_24, var_132_24)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_21 + var_132_22 and arg_129_1.time_ < var_132_21 + var_132_22 + arg_132_0 and arg_129_1.var_.actorSpriteComps10062 then
				local var_132_25 = 1

				for iter_132_8, iter_132_9 in pairs(arg_129_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_132_9 then
						iter_132_9.color = Color.New(var_132_25, var_132_25, var_132_25)
					end
				end

				arg_129_1.var_.actorSpriteComps10062 = nil
			end

			local var_132_26 = 0
			local var_132_27 = 0.425

			if var_132_26 < arg_129_1.time_ and arg_129_1.time_ <= var_132_26 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_28 = arg_129_1:FormatText(StoryNameCfg[600].name)

				arg_129_1.leftNameTxt_.text = var_132_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_29 = arg_129_1:GetWordFromCfg(410232032)
				local var_132_30 = arg_129_1:FormatText(var_132_29.content)

				arg_129_1.text_.text = var_132_30

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_31 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232032", "story_v_out_410232.awb") ~= 0 then
					local var_132_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232032", "story_v_out_410232.awb") / 1000

					if var_132_34 + var_132_26 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_34 + var_132_26
					end

					if var_132_29.prefab_name ~= "" and arg_129_1.actors_[var_132_29.prefab_name] ~= nil then
						local var_132_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_29.prefab_name].transform, "story_v_out_410232", "410232032", "story_v_out_410232.awb")

						arg_129_1:RecordAudio("410232032", var_132_35)
						arg_129_1:RecordAudio("410232032", var_132_35)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_410232", "410232032", "story_v_out_410232.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_410232", "410232032", "story_v_out_410232.awb")
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
	Play410232033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410232033
		arg_133_1.duration_ = 6.5

		local var_133_0 = {
			ja = 6.5,
			CriLanguages = 6.266,
			zh = 6.266
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
				arg_133_0:Play410232034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = "ST67"

			if arg_133_1.bgs_[var_136_0] == nil then
				local var_136_1 = Object.Instantiate(arg_133_1.paintGo_)

				var_136_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_136_0)
				var_136_1.name = var_136_0
				var_136_1.transform.parent = arg_133_1.stage_.transform
				var_136_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_133_1.bgs_[var_136_0] = var_136_1
			end

			local var_136_2 = 2

			if var_136_2 < arg_133_1.time_ and arg_133_1.time_ <= var_136_2 + arg_136_0 then
				local var_136_3 = manager.ui.mainCamera.transform.localPosition
				local var_136_4 = Vector3.New(0, 0, 10) + Vector3.New(var_136_3.x, var_136_3.y, 0)
				local var_136_5 = arg_133_1.bgs_.ST67

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
					if iter_136_0 ~= "ST67" then
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
				local var_136_19 = Color.New(0, 0, 0)

				var_136_19.a = Mathf.Lerp(0, 1, var_136_18)
				arg_133_1.mask_.color = var_136_19
			end

			if arg_133_1.time_ >= var_136_16 + var_136_17 and arg_133_1.time_ < var_136_16 + var_136_17 + arg_136_0 then
				local var_136_20 = Color.New(0, 0, 0)

				var_136_20.a = 1
				arg_133_1.mask_.color = var_136_20
			end

			local var_136_21 = 2

			if var_136_21 < arg_133_1.time_ and arg_133_1.time_ <= var_136_21 + arg_136_0 then
				arg_133_1.mask_.enabled = true
				arg_133_1.mask_.raycastTarget = true

				arg_133_1:SetGaussion(false)
			end

			local var_136_22 = 2

			if var_136_21 <= arg_133_1.time_ and arg_133_1.time_ < var_136_21 + var_136_22 then
				local var_136_23 = (arg_133_1.time_ - var_136_21) / var_136_22
				local var_136_24 = Color.New(0, 0, 0)

				var_136_24.a = Mathf.Lerp(1, 0, var_136_23)
				arg_133_1.mask_.color = var_136_24
			end

			if arg_133_1.time_ >= var_136_21 + var_136_22 and arg_133_1.time_ < var_136_21 + var_136_22 + arg_136_0 then
				local var_136_25 = Color.New(0, 0, 0)
				local var_136_26 = 0

				arg_133_1.mask_.enabled = false
				var_136_25.a = var_136_26
				arg_133_1.mask_.color = var_136_25
			end

			local var_136_27 = arg_133_1.actors_["10062"].transform
			local var_136_28 = 4

			if var_136_28 < arg_133_1.time_ and arg_133_1.time_ <= var_136_28 + arg_136_0 then
				arg_133_1.var_.moveOldPos10062 = var_136_27.localPosition
				var_136_27.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("10062", 3)

				local var_136_29 = var_136_27.childCount

				for iter_136_2 = 0, var_136_29 - 1 do
					local var_136_30 = var_136_27:GetChild(iter_136_2)

					if var_136_30.name == "" or not string.find(var_136_30.name, "split") then
						var_136_30.gameObject:SetActive(true)
					else
						var_136_30.gameObject:SetActive(false)
					end
				end
			end

			local var_136_31 = 0.001

			if var_136_28 <= arg_133_1.time_ and arg_133_1.time_ < var_136_28 + var_136_31 then
				local var_136_32 = (arg_133_1.time_ - var_136_28) / var_136_31
				local var_136_33 = Vector3.New(0, -390, -290)

				var_136_27.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10062, var_136_33, var_136_32)
			end

			if arg_133_1.time_ >= var_136_28 + var_136_31 and arg_133_1.time_ < var_136_28 + var_136_31 + arg_136_0 then
				var_136_27.localPosition = Vector3.New(0, -390, -290)
			end

			local var_136_34 = arg_133_1.actors_["10062"]
			local var_136_35 = 4

			if var_136_35 < arg_133_1.time_ and arg_133_1.time_ <= var_136_35 + arg_136_0 and arg_133_1.var_.actorSpriteComps10062 == nil then
				arg_133_1.var_.actorSpriteComps10062 = var_136_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_36 = 0.034

			if var_136_35 <= arg_133_1.time_ and arg_133_1.time_ < var_136_35 + var_136_36 then
				local var_136_37 = (arg_133_1.time_ - var_136_35) / var_136_36

				if arg_133_1.var_.actorSpriteComps10062 then
					for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_136_4 then
							local var_136_38 = Mathf.Lerp(iter_136_4.color.r, 1, var_136_37)

							iter_136_4.color = Color.New(var_136_38, var_136_38, var_136_38)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_35 + var_136_36 and arg_133_1.time_ < var_136_35 + var_136_36 + arg_136_0 and arg_133_1.var_.actorSpriteComps10062 then
				local var_136_39 = 1

				for iter_136_5, iter_136_6 in pairs(arg_133_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_136_6 then
						iter_136_6.color = Color.New(var_136_39, var_136_39, var_136_39)
					end
				end

				arg_133_1.var_.actorSpriteComps10062 = nil
			end

			local var_136_40 = arg_133_1.actors_["10062"].transform
			local var_136_41 = 2

			if var_136_41 < arg_133_1.time_ and arg_133_1.time_ <= var_136_41 + arg_136_0 then
				arg_133_1.var_.moveOldPos10062 = var_136_40.localPosition
				var_136_40.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("10062", 7)

				local var_136_42 = var_136_40.childCount

				for iter_136_7 = 0, var_136_42 - 1 do
					local var_136_43 = var_136_40:GetChild(iter_136_7)

					if var_136_43.name == "" or not string.find(var_136_43.name, "split") then
						var_136_43.gameObject:SetActive(true)
					else
						var_136_43.gameObject:SetActive(false)
					end
				end
			end

			local var_136_44 = 0.001

			if var_136_41 <= arg_133_1.time_ and arg_133_1.time_ < var_136_41 + var_136_44 then
				local var_136_45 = (arg_133_1.time_ - var_136_41) / var_136_44
				local var_136_46 = Vector3.New(0, -2000, -290)

				var_136_40.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10062, var_136_46, var_136_45)
			end

			if arg_133_1.time_ >= var_136_41 + var_136_44 and arg_133_1.time_ < var_136_41 + var_136_44 + arg_136_0 then
				var_136_40.localPosition = Vector3.New(0, -2000, -290)
			end

			if arg_133_1.frameCnt_ <= 1 then
				arg_133_1.dialog_:SetActive(false)
			end

			local var_136_47 = 4
			local var_136_48 = 0.2

			if var_136_47 < arg_133_1.time_ and arg_133_1.time_ <= var_136_47 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0

				arg_133_1.dialog_:SetActive(true)

				local var_136_49 = LeanTween.value(arg_133_1.dialog_, 0, 1, 0.3)

				var_136_49:setOnUpdate(LuaHelper.FloatAction(function(arg_137_0)
					arg_133_1.dialogCg_.alpha = arg_137_0
				end))
				var_136_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_133_1.dialog_)
					var_136_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_133_1.duration_ = arg_133_1.duration_ + 0.3

				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_50 = arg_133_1:FormatText(StoryNameCfg[600].name)

				arg_133_1.leftNameTxt_.text = var_136_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_51 = arg_133_1:GetWordFromCfg(410232033)
				local var_136_52 = arg_133_1:FormatText(var_136_51.content)

				arg_133_1.text_.text = var_136_52

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_53 = 8
				local var_136_54 = utf8.len(var_136_52)
				local var_136_55 = var_136_53 <= 0 and var_136_48 or var_136_48 * (var_136_54 / var_136_53)

				if var_136_55 > 0 and var_136_48 < var_136_55 then
					arg_133_1.talkMaxDuration = var_136_55
					var_136_47 = var_136_47 + 0.3

					if var_136_55 + var_136_47 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_55 + var_136_47
					end
				end

				arg_133_1.text_.text = var_136_52
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232033", "story_v_out_410232.awb") ~= 0 then
					local var_136_56 = manager.audio:GetVoiceLength("story_v_out_410232", "410232033", "story_v_out_410232.awb") / 1000

					if var_136_56 + var_136_47 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_56 + var_136_47
					end

					if var_136_51.prefab_name ~= "" and arg_133_1.actors_[var_136_51.prefab_name] ~= nil then
						local var_136_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_51.prefab_name].transform, "story_v_out_410232", "410232033", "story_v_out_410232.awb")

						arg_133_1:RecordAudio("410232033", var_136_57)
						arg_133_1:RecordAudio("410232033", var_136_57)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410232", "410232033", "story_v_out_410232.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410232", "410232033", "story_v_out_410232.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_58 = var_136_47 + 0.3
			local var_136_59 = math.max(var_136_48, arg_133_1.talkMaxDuration)

			if var_136_58 <= arg_133_1.time_ and arg_133_1.time_ < var_136_58 + var_136_59 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_58) / var_136_59

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_58 + var_136_59 and arg_133_1.time_ < var_136_58 + var_136_59 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410232034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410232034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play410232035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10062"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.actorSpriteComps10062 == nil then
				arg_139_1.var_.actorSpriteComps10062 = var_142_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_2 = 0.034

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.actorSpriteComps10062 then
					for iter_142_0, iter_142_1 in pairs(arg_139_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_142_1 then
							local var_142_4 = Mathf.Lerp(iter_142_1.color.r, 0.5, var_142_3)

							iter_142_1.color = Color.New(var_142_4, var_142_4, var_142_4)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.actorSpriteComps10062 then
				local var_142_5 = 0.5

				for iter_142_2, iter_142_3 in pairs(arg_139_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_142_3 then
						iter_142_3.color = Color.New(var_142_5, var_142_5, var_142_5)
					end
				end

				arg_139_1.var_.actorSpriteComps10062 = nil
			end

			local var_142_6 = 0
			local var_142_7 = 0.925

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_8 = arg_139_1:GetWordFromCfg(410232034)
				local var_142_9 = arg_139_1:FormatText(var_142_8.content)

				arg_139_1.text_.text = var_142_9

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_10 = 37
				local var_142_11 = utf8.len(var_142_9)
				local var_142_12 = var_142_10 <= 0 and var_142_7 or var_142_7 * (var_142_11 / var_142_10)

				if var_142_12 > 0 and var_142_7 < var_142_12 then
					arg_139_1.talkMaxDuration = var_142_12

					if var_142_12 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_12 + var_142_6
					end
				end

				arg_139_1.text_.text = var_142_9
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_13 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_13 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_13

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_13 and arg_139_1.time_ < var_142_6 + var_142_13 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410232035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410232035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play410232036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.925

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(410232035)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 37
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410232036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410232036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play410232037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 1.575

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_2 = arg_147_1:GetWordFromCfg(410232036)
				local var_150_3 = arg_147_1:FormatText(var_150_2.content)

				arg_147_1.text_.text = var_150_3

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_4 = 63
				local var_150_5 = utf8.len(var_150_3)
				local var_150_6 = var_150_4 <= 0 and var_150_1 or var_150_1 * (var_150_5 / var_150_4)

				if var_150_6 > 0 and var_150_1 < var_150_6 then
					arg_147_1.talkMaxDuration = var_150_6

					if var_150_6 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_6 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_3
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_7 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_7 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_7

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_7 and arg_147_1.time_ < var_150_0 + var_150_7 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play410232037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410232037
		arg_151_1.duration_ = 5.233

		local var_151_0 = {
			ja = 5.233,
			CriLanguages = 1.8,
			zh = 1.8
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
				arg_151_0:Play410232038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10062"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos10062 = var_154_0.localPosition
				var_154_0.localScale = Vector3.New(1, 1, 1)

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
				local var_154_6 = Vector3.New(-370, -390, -290)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10062, var_154_6, var_154_5)
			end

			if arg_151_1.time_ >= var_154_1 + var_154_4 and arg_151_1.time_ < var_154_1 + var_154_4 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_154_7 = arg_151_1.actors_["10060"].transform
			local var_154_8 = 0

			if var_154_8 < arg_151_1.time_ and arg_151_1.time_ <= var_154_8 + arg_154_0 then
				arg_151_1.var_.moveOldPos10060 = var_154_7.localPosition
				var_154_7.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("10060", 4)

				local var_154_9 = var_154_7.childCount

				for iter_154_1 = 0, var_154_9 - 1 do
					local var_154_10 = var_154_7:GetChild(iter_154_1)

					if var_154_10.name == "" or not string.find(var_154_10.name, "split") then
						var_154_10.gameObject:SetActive(true)
					else
						var_154_10.gameObject:SetActive(false)
					end
				end
			end

			local var_154_11 = 0.001

			if var_154_8 <= arg_151_1.time_ and arg_151_1.time_ < var_154_8 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_8) / var_154_11
				local var_154_13 = Vector3.New(390, -400, 0)

				var_154_7.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10060, var_154_13, var_154_12)
			end

			if arg_151_1.time_ >= var_154_8 + var_154_11 and arg_151_1.time_ < var_154_8 + var_154_11 + arg_154_0 then
				var_154_7.localPosition = Vector3.New(390, -400, 0)
			end

			local var_154_14 = arg_151_1.actors_["10062"]
			local var_154_15 = 0

			if var_154_15 < arg_151_1.time_ and arg_151_1.time_ <= var_154_15 + arg_154_0 and arg_151_1.var_.actorSpriteComps10062 == nil then
				arg_151_1.var_.actorSpriteComps10062 = var_154_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_16 = 0.034

			if var_154_15 <= arg_151_1.time_ and arg_151_1.time_ < var_154_15 + var_154_16 then
				local var_154_17 = (arg_151_1.time_ - var_154_15) / var_154_16

				if arg_151_1.var_.actorSpriteComps10062 then
					for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_154_3 then
							local var_154_18 = Mathf.Lerp(iter_154_3.color.r, 1, var_154_17)

							iter_154_3.color = Color.New(var_154_18, var_154_18, var_154_18)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_15 + var_154_16 and arg_151_1.time_ < var_154_15 + var_154_16 + arg_154_0 and arg_151_1.var_.actorSpriteComps10062 then
				local var_154_19 = 1

				for iter_154_4, iter_154_5 in pairs(arg_151_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_154_5 then
						iter_154_5.color = Color.New(var_154_19, var_154_19, var_154_19)
					end
				end

				arg_151_1.var_.actorSpriteComps10062 = nil
			end

			local var_154_20 = arg_151_1.actors_["10060"]
			local var_154_21 = 0

			if var_154_21 < arg_151_1.time_ and arg_151_1.time_ <= var_154_21 + arg_154_0 and arg_151_1.var_.actorSpriteComps10060 == nil then
				arg_151_1.var_.actorSpriteComps10060 = var_154_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_22 = 0.034

			if var_154_21 <= arg_151_1.time_ and arg_151_1.time_ < var_154_21 + var_154_22 then
				local var_154_23 = (arg_151_1.time_ - var_154_21) / var_154_22

				if arg_151_1.var_.actorSpriteComps10060 then
					for iter_154_6, iter_154_7 in pairs(arg_151_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_154_7 then
							local var_154_24 = Mathf.Lerp(iter_154_7.color.r, 0.5, var_154_23)

							iter_154_7.color = Color.New(var_154_24, var_154_24, var_154_24)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_21 + var_154_22 and arg_151_1.time_ < var_154_21 + var_154_22 + arg_154_0 and arg_151_1.var_.actorSpriteComps10060 then
				local var_154_25 = 0.5

				for iter_154_8, iter_154_9 in pairs(arg_151_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_154_9 then
						iter_154_9.color = Color.New(var_154_25, var_154_25, var_154_25)
					end
				end

				arg_151_1.var_.actorSpriteComps10060 = nil
			end

			local var_154_26 = 0
			local var_154_27 = 0.1

			if var_154_26 < arg_151_1.time_ and arg_151_1.time_ <= var_154_26 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_28 = arg_151_1:FormatText(StoryNameCfg[600].name)

				arg_151_1.leftNameTxt_.text = var_154_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_29 = arg_151_1:GetWordFromCfg(410232037)
				local var_154_30 = arg_151_1:FormatText(var_154_29.content)

				arg_151_1.text_.text = var_154_30

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_31 = 4
				local var_154_32 = utf8.len(var_154_30)
				local var_154_33 = var_154_31 <= 0 and var_154_27 or var_154_27 * (var_154_32 / var_154_31)

				if var_154_33 > 0 and var_154_27 < var_154_33 then
					arg_151_1.talkMaxDuration = var_154_33

					if var_154_33 + var_154_26 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_33 + var_154_26
					end
				end

				arg_151_1.text_.text = var_154_30
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232037", "story_v_out_410232.awb") ~= 0 then
					local var_154_34 = manager.audio:GetVoiceLength("story_v_out_410232", "410232037", "story_v_out_410232.awb") / 1000

					if var_154_34 + var_154_26 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_34 + var_154_26
					end

					if var_154_29.prefab_name ~= "" and arg_151_1.actors_[var_154_29.prefab_name] ~= nil then
						local var_154_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_29.prefab_name].transform, "story_v_out_410232", "410232037", "story_v_out_410232.awb")

						arg_151_1:RecordAudio("410232037", var_154_35)
						arg_151_1:RecordAudio("410232037", var_154_35)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410232", "410232037", "story_v_out_410232.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410232", "410232037", "story_v_out_410232.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_36 = math.max(var_154_27, arg_151_1.talkMaxDuration)

			if var_154_26 <= arg_151_1.time_ and arg_151_1.time_ < var_154_26 + var_154_36 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_26) / var_154_36

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_26 + var_154_36 and arg_151_1.time_ < var_154_26 + var_154_36 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410232038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410232038
		arg_155_1.duration_ = 3.166

		local var_155_0 = {
			ja = 3.166,
			CriLanguages = 2.1,
			zh = 2.1
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
				arg_155_0:Play410232039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10060"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10060 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10060", 4)

				local var_158_2 = var_158_0.childCount

				for iter_158_0 = 0, var_158_2 - 1 do
					local var_158_3 = var_158_0:GetChild(iter_158_0)

					if var_158_3.name == "" or not string.find(var_158_3.name, "split") then
						var_158_3.gameObject:SetActive(true)
					else
						var_158_3.gameObject:SetActive(false)
					end
				end
			end

			local var_158_4 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_1) / var_158_4
				local var_158_6 = Vector3.New(390, -400, 0)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10060, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_158_7 = arg_155_1.actors_["10060"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps10060 == nil then
				arg_155_1.var_.actorSpriteComps10060 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 0.034

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps10060 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_158_2 then
							local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

							iter_158_2.color = Color.New(var_158_11, var_158_11, var_158_11)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps10060 then
				local var_158_12 = 1

				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_158_4 then
						iter_158_4.color = Color.New(var_158_12, var_158_12, var_158_12)
					end
				end

				arg_155_1.var_.actorSpriteComps10060 = nil
			end

			local var_158_13 = arg_155_1.actors_["10062"]
			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 and arg_155_1.var_.actorSpriteComps10062 == nil then
				arg_155_1.var_.actorSpriteComps10062 = var_158_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_15 = 0.034

			if var_158_14 <= arg_155_1.time_ and arg_155_1.time_ < var_158_14 + var_158_15 then
				local var_158_16 = (arg_155_1.time_ - var_158_14) / var_158_15

				if arg_155_1.var_.actorSpriteComps10062 then
					for iter_158_5, iter_158_6 in pairs(arg_155_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_158_6 then
							local var_158_17 = Mathf.Lerp(iter_158_6.color.r, 0.5, var_158_16)

							iter_158_6.color = Color.New(var_158_17, var_158_17, var_158_17)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_14 + var_158_15 and arg_155_1.time_ < var_158_14 + var_158_15 + arg_158_0 and arg_155_1.var_.actorSpriteComps10062 then
				local var_158_18 = 0.5

				for iter_158_7, iter_158_8 in pairs(arg_155_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_158_8 then
						iter_158_8.color = Color.New(var_158_18, var_158_18, var_158_18)
					end
				end

				arg_155_1.var_.actorSpriteComps10062 = nil
			end

			local var_158_19 = 0
			local var_158_20 = 0.2

			if var_158_19 < arg_155_1.time_ and arg_155_1.time_ <= var_158_19 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_21 = arg_155_1:FormatText(StoryNameCfg[597].name)

				arg_155_1.leftNameTxt_.text = var_158_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_22 = arg_155_1:GetWordFromCfg(410232038)
				local var_158_23 = arg_155_1:FormatText(var_158_22.content)

				arg_155_1.text_.text = var_158_23

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_24 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232038", "story_v_out_410232.awb") ~= 0 then
					local var_158_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232038", "story_v_out_410232.awb") / 1000

					if var_158_27 + var_158_19 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_27 + var_158_19
					end

					if var_158_22.prefab_name ~= "" and arg_155_1.actors_[var_158_22.prefab_name] ~= nil then
						local var_158_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_22.prefab_name].transform, "story_v_out_410232", "410232038", "story_v_out_410232.awb")

						arg_155_1:RecordAudio("410232038", var_158_28)
						arg_155_1:RecordAudio("410232038", var_158_28)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410232", "410232038", "story_v_out_410232.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410232", "410232038", "story_v_out_410232.awb")
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
	Play410232039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410232039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play410232040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10060"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.actorSpriteComps10060 == nil then
				arg_159_1.var_.actorSpriteComps10060 = var_162_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_2 = 0.034

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.actorSpriteComps10060 then
					for iter_162_0, iter_162_1 in pairs(arg_159_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_162_1 then
							local var_162_4 = Mathf.Lerp(iter_162_1.color.r, 0.5, var_162_3)

							iter_162_1.color = Color.New(var_162_4, var_162_4, var_162_4)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.actorSpriteComps10060 then
				local var_162_5 = 0.5

				for iter_162_2, iter_162_3 in pairs(arg_159_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_162_3 then
						iter_162_3.color = Color.New(var_162_5, var_162_5, var_162_5)
					end
				end

				arg_159_1.var_.actorSpriteComps10060 = nil
			end

			local var_162_6 = 0
			local var_162_7 = 1.4

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_8 = arg_159_1:GetWordFromCfg(410232039)
				local var_162_9 = arg_159_1:FormatText(var_162_8.content)

				arg_159_1.text_.text = var_162_9

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_10 = 56
				local var_162_11 = utf8.len(var_162_9)
				local var_162_12 = var_162_10 <= 0 and var_162_7 or var_162_7 * (var_162_11 / var_162_10)

				if var_162_12 > 0 and var_162_7 < var_162_12 then
					arg_159_1.talkMaxDuration = var_162_12

					if var_162_12 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_12 + var_162_6
					end
				end

				arg_159_1.text_.text = var_162_9
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_13 = math.max(var_162_7, arg_159_1.talkMaxDuration)

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_13 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_6) / var_162_13

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_6 + var_162_13 and arg_159_1.time_ < var_162_6 + var_162_13 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play410232040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410232040
		arg_163_1.duration_ = 15.233

		local var_163_0 = {
			ja = 15.233,
			CriLanguages = 9.433,
			zh = 9.433
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
				arg_163_0:Play410232041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10062"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos10062 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

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
				local var_166_6 = Vector3.New(-370, -390, -290)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10062, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_166_7 = arg_163_1.actors_["10062"]
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 and arg_163_1.var_.actorSpriteComps10062 == nil then
				arg_163_1.var_.actorSpriteComps10062 = var_166_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_9 = 0.034

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_8) / var_166_9

				if arg_163_1.var_.actorSpriteComps10062 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_166_2 then
							local var_166_11 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_10)

							iter_166_2.color = Color.New(var_166_11, var_166_11, var_166_11)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_8 + var_166_9 and arg_163_1.time_ < var_166_8 + var_166_9 + arg_166_0 and arg_163_1.var_.actorSpriteComps10062 then
				local var_166_12 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_12, var_166_12, var_166_12)
					end
				end

				arg_163_1.var_.actorSpriteComps10062 = nil
			end

			local var_166_13 = 0
			local var_166_14 = 0.975

			if var_166_13 < arg_163_1.time_ and arg_163_1.time_ <= var_166_13 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_15 = arg_163_1:FormatText(StoryNameCfg[600].name)

				arg_163_1.leftNameTxt_.text = var_166_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_16 = arg_163_1:GetWordFromCfg(410232040)
				local var_166_17 = arg_163_1:FormatText(var_166_16.content)

				arg_163_1.text_.text = var_166_17

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_18 = 39
				local var_166_19 = utf8.len(var_166_17)
				local var_166_20 = var_166_18 <= 0 and var_166_14 or var_166_14 * (var_166_19 / var_166_18)

				if var_166_20 > 0 and var_166_14 < var_166_20 then
					arg_163_1.talkMaxDuration = var_166_20

					if var_166_20 + var_166_13 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_20 + var_166_13
					end
				end

				arg_163_1.text_.text = var_166_17
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232040", "story_v_out_410232.awb") ~= 0 then
					local var_166_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232040", "story_v_out_410232.awb") / 1000

					if var_166_21 + var_166_13 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_21 + var_166_13
					end

					if var_166_16.prefab_name ~= "" and arg_163_1.actors_[var_166_16.prefab_name] ~= nil then
						local var_166_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_16.prefab_name].transform, "story_v_out_410232", "410232040", "story_v_out_410232.awb")

						arg_163_1:RecordAudio("410232040", var_166_22)
						arg_163_1:RecordAudio("410232040", var_166_22)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_410232", "410232040", "story_v_out_410232.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_410232", "410232040", "story_v_out_410232.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_23 = math.max(var_166_14, arg_163_1.talkMaxDuration)

			if var_166_13 <= arg_163_1.time_ and arg_163_1.time_ < var_166_13 + var_166_23 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_13) / var_166_23

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_13 + var_166_23 and arg_163_1.time_ < var_166_13 + var_166_23 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play410232041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410232041
		arg_167_1.duration_ = 17

		local var_167_0 = {
			ja = 17,
			CriLanguages = 10.7,
			zh = 10.7
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
				arg_167_0:Play410232042(arg_167_1)
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

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[600].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(410232041)
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232041", "story_v_out_410232.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_410232", "410232041", "story_v_out_410232.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_410232", "410232041", "story_v_out_410232.awb")

						arg_167_1:RecordAudio("410232041", var_170_9)
						arg_167_1:RecordAudio("410232041", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410232", "410232041", "story_v_out_410232.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410232", "410232041", "story_v_out_410232.awb")
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
	Play410232042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410232042
		arg_171_1.duration_ = 2.5

		local var_171_0 = {
			ja = 2.233,
			CriLanguages = 2.5,
			zh = 2.5
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
				arg_171_0:Play410232043(arg_171_1)
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

					if var_174_3.name == "split_4" or not string.find(var_174_3.name, "split") then
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

			local var_174_7 = arg_171_1.actors_["10060"]
			local var_174_8 = 0

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps10060 == nil then
				arg_171_1.var_.actorSpriteComps10060 = var_174_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_9 = 0.034

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_8) / var_174_9

				if arg_171_1.var_.actorSpriteComps10060 then
					for iter_174_1, iter_174_2 in pairs(arg_171_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_174_2 then
							local var_174_11 = Mathf.Lerp(iter_174_2.color.r, 1, var_174_10)

							iter_174_2.color = Color.New(var_174_11, var_174_11, var_174_11)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_8 + var_174_9 and arg_171_1.time_ < var_174_8 + var_174_9 + arg_174_0 and arg_171_1.var_.actorSpriteComps10060 then
				local var_174_12 = 1

				for iter_174_3, iter_174_4 in pairs(arg_171_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_174_4 then
						iter_174_4.color = Color.New(var_174_12, var_174_12, var_174_12)
					end
				end

				arg_171_1.var_.actorSpriteComps10060 = nil
			end

			local var_174_13 = arg_171_1.actors_["10062"]
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 and arg_171_1.var_.actorSpriteComps10062 == nil then
				arg_171_1.var_.actorSpriteComps10062 = var_174_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_15 = 0.034

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15

				if arg_171_1.var_.actorSpriteComps10062 then
					for iter_174_5, iter_174_6 in pairs(arg_171_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_174_6 then
							local var_174_17 = Mathf.Lerp(iter_174_6.color.r, 0.5, var_174_16)

							iter_174_6.color = Color.New(var_174_17, var_174_17, var_174_17)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 and arg_171_1.var_.actorSpriteComps10062 then
				local var_174_18 = 0.5

				for iter_174_7, iter_174_8 in pairs(arg_171_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_174_8 then
						iter_174_8.color = Color.New(var_174_18, var_174_18, var_174_18)
					end
				end

				arg_171_1.var_.actorSpriteComps10062 = nil
			end

			local var_174_19 = 0
			local var_174_20 = 0.175

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

				local var_174_22 = arg_171_1:GetWordFromCfg(410232042)
				local var_174_23 = arg_171_1:FormatText(var_174_22.content)

				arg_171_1.text_.text = var_174_23

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_24 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232042", "story_v_out_410232.awb") ~= 0 then
					local var_174_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232042", "story_v_out_410232.awb") / 1000

					if var_174_27 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_27 + var_174_19
					end

					if var_174_22.prefab_name ~= "" and arg_171_1.actors_[var_174_22.prefab_name] ~= nil then
						local var_174_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_22.prefab_name].transform, "story_v_out_410232", "410232042", "story_v_out_410232.awb")

						arg_171_1:RecordAudio("410232042", var_174_28)
						arg_171_1:RecordAudio("410232042", var_174_28)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410232", "410232042", "story_v_out_410232.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410232", "410232042", "story_v_out_410232.awb")
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
	Play410232043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410232043
		arg_175_1.duration_ = 9.133

		local var_175_0 = {
			ja = 9.133,
			CriLanguages = 7.3,
			zh = 7.3
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
				arg_175_0:Play410232044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10062"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10062 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

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
				local var_178_6 = Vector3.New(-370, -390, -290)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10062, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_178_7 = arg_175_1.actors_["10060"]
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 and arg_175_1.var_.actorSpriteComps10060 == nil then
				arg_175_1.var_.actorSpriteComps10060 = var_178_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_9 = 0.034

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_9 then
				local var_178_10 = (arg_175_1.time_ - var_178_8) / var_178_9

				if arg_175_1.var_.actorSpriteComps10060 then
					for iter_178_1, iter_178_2 in pairs(arg_175_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_178_2 then
							local var_178_11 = Mathf.Lerp(iter_178_2.color.r, 0.5, var_178_10)

							iter_178_2.color = Color.New(var_178_11, var_178_11, var_178_11)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_8 + var_178_9 and arg_175_1.time_ < var_178_8 + var_178_9 + arg_178_0 and arg_175_1.var_.actorSpriteComps10060 then
				local var_178_12 = 0.5

				for iter_178_3, iter_178_4 in pairs(arg_175_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_178_4 then
						iter_178_4.color = Color.New(var_178_12, var_178_12, var_178_12)
					end
				end

				arg_175_1.var_.actorSpriteComps10060 = nil
			end

			local var_178_13 = arg_175_1.actors_["10062"]
			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 and arg_175_1.var_.actorSpriteComps10062 == nil then
				arg_175_1.var_.actorSpriteComps10062 = var_178_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_15 = 0.034

			if var_178_14 <= arg_175_1.time_ and arg_175_1.time_ < var_178_14 + var_178_15 then
				local var_178_16 = (arg_175_1.time_ - var_178_14) / var_178_15

				if arg_175_1.var_.actorSpriteComps10062 then
					for iter_178_5, iter_178_6 in pairs(arg_175_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_178_6 then
							local var_178_17 = Mathf.Lerp(iter_178_6.color.r, 1, var_178_16)

							iter_178_6.color = Color.New(var_178_17, var_178_17, var_178_17)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_14 + var_178_15 and arg_175_1.time_ < var_178_14 + var_178_15 + arg_178_0 and arg_175_1.var_.actorSpriteComps10062 then
				local var_178_18 = 1

				for iter_178_7, iter_178_8 in pairs(arg_175_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_178_8 then
						iter_178_8.color = Color.New(var_178_18, var_178_18, var_178_18)
					end
				end

				arg_175_1.var_.actorSpriteComps10062 = nil
			end

			local var_178_19 = 0
			local var_178_20 = 0.75

			if var_178_19 < arg_175_1.time_ and arg_175_1.time_ <= var_178_19 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_21 = arg_175_1:FormatText(StoryNameCfg[600].name)

				arg_175_1.leftNameTxt_.text = var_178_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_22 = arg_175_1:GetWordFromCfg(410232043)
				local var_178_23 = arg_175_1:FormatText(var_178_22.content)

				arg_175_1.text_.text = var_178_23

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_24 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232043", "story_v_out_410232.awb") ~= 0 then
					local var_178_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232043", "story_v_out_410232.awb") / 1000

					if var_178_27 + var_178_19 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_27 + var_178_19
					end

					if var_178_22.prefab_name ~= "" and arg_175_1.actors_[var_178_22.prefab_name] ~= nil then
						local var_178_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_22.prefab_name].transform, "story_v_out_410232", "410232043", "story_v_out_410232.awb")

						arg_175_1:RecordAudio("410232043", var_178_28)
						arg_175_1:RecordAudio("410232043", var_178_28)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_410232", "410232043", "story_v_out_410232.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_410232", "410232043", "story_v_out_410232.awb")
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
	Play410232044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410232044
		arg_179_1.duration_ = 5.566

		local var_179_0 = {
			ja = 5.566,
			CriLanguages = 2.866,
			zh = 2.866
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
				arg_179_0:Play410232045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10060"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10060 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10060", 4)

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
				local var_182_6 = Vector3.New(390, -400, 0)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10060, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_182_7 = arg_179_1.actors_["10060"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps10060 == nil then
				arg_179_1.var_.actorSpriteComps10060 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 0.034

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps10060 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_182_2 then
							local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

							iter_182_2.color = Color.New(var_182_11, var_182_11, var_182_11)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps10060 then
				local var_182_12 = 1

				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_182_4 then
						iter_182_4.color = Color.New(var_182_12, var_182_12, var_182_12)
					end
				end

				arg_179_1.var_.actorSpriteComps10060 = nil
			end

			local var_182_13 = arg_179_1.actors_["10062"]
			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 and arg_179_1.var_.actorSpriteComps10062 == nil then
				arg_179_1.var_.actorSpriteComps10062 = var_182_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_15 = 0.034

			if var_182_14 <= arg_179_1.time_ and arg_179_1.time_ < var_182_14 + var_182_15 then
				local var_182_16 = (arg_179_1.time_ - var_182_14) / var_182_15

				if arg_179_1.var_.actorSpriteComps10062 then
					for iter_182_5, iter_182_6 in pairs(arg_179_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_182_6 then
							local var_182_17 = Mathf.Lerp(iter_182_6.color.r, 0.5, var_182_16)

							iter_182_6.color = Color.New(var_182_17, var_182_17, var_182_17)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_14 + var_182_15 and arg_179_1.time_ < var_182_14 + var_182_15 + arg_182_0 and arg_179_1.var_.actorSpriteComps10062 then
				local var_182_18 = 0.5

				for iter_182_7, iter_182_8 in pairs(arg_179_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_182_8 then
						iter_182_8.color = Color.New(var_182_18, var_182_18, var_182_18)
					end
				end

				arg_179_1.var_.actorSpriteComps10062 = nil
			end

			local var_182_19 = 0
			local var_182_20 = 0.225

			if var_182_19 < arg_179_1.time_ and arg_179_1.time_ <= var_182_19 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_21 = arg_179_1:FormatText(StoryNameCfg[597].name)

				arg_179_1.leftNameTxt_.text = var_182_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_22 = arg_179_1:GetWordFromCfg(410232044)
				local var_182_23 = arg_179_1:FormatText(var_182_22.content)

				arg_179_1.text_.text = var_182_23

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232044", "story_v_out_410232.awb") ~= 0 then
					local var_182_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232044", "story_v_out_410232.awb") / 1000

					if var_182_27 + var_182_19 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_27 + var_182_19
					end

					if var_182_22.prefab_name ~= "" and arg_179_1.actors_[var_182_22.prefab_name] ~= nil then
						local var_182_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_22.prefab_name].transform, "story_v_out_410232", "410232044", "story_v_out_410232.awb")

						arg_179_1:RecordAudio("410232044", var_182_28)
						arg_179_1:RecordAudio("410232044", var_182_28)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410232", "410232044", "story_v_out_410232.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410232", "410232044", "story_v_out_410232.awb")
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
	Play410232045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410232045
		arg_183_1.duration_ = 12.566

		local var_183_0 = {
			ja = 12.566,
			CriLanguages = 6.833,
			zh = 6.833
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
				arg_183_0:Play410232046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10062"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10062 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				local var_186_2 = var_186_0.childCount

				for iter_186_0 = 0, var_186_2 - 1 do
					local var_186_3 = var_186_0:GetChild(iter_186_0)

					if var_186_3.name == "" or not string.find(var_186_3.name, "split") then
						var_186_3.gameObject:SetActive(true)
					else
						var_186_3.gameObject:SetActive(false)
					end
				end
			end

			local var_186_4 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_4 then
				local var_186_5 = (arg_183_1.time_ - var_186_1) / var_186_4
				local var_186_6 = Vector3.New(-370, -390, -290)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10062, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-370, -390, -290)
			end

			local var_186_7 = arg_183_1.actors_["10060"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps10060 == nil then
				arg_183_1.var_.actorSpriteComps10060 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps10060 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 0.5, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps10060 then
				local var_186_12 = 0.5

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps10060 = nil
			end

			local var_186_13 = arg_183_1.actors_["10062"]
			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 and arg_183_1.var_.actorSpriteComps10062 == nil then
				arg_183_1.var_.actorSpriteComps10062 = var_186_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_15 = 0.034

			if var_186_14 <= arg_183_1.time_ and arg_183_1.time_ < var_186_14 + var_186_15 then
				local var_186_16 = (arg_183_1.time_ - var_186_14) / var_186_15

				if arg_183_1.var_.actorSpriteComps10062 then
					for iter_186_5, iter_186_6 in pairs(arg_183_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_186_6 then
							local var_186_17 = Mathf.Lerp(iter_186_6.color.r, 1, var_186_16)

							iter_186_6.color = Color.New(var_186_17, var_186_17, var_186_17)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_15 and arg_183_1.time_ < var_186_14 + var_186_15 + arg_186_0 and arg_183_1.var_.actorSpriteComps10062 then
				local var_186_18 = 1

				for iter_186_7, iter_186_8 in pairs(arg_183_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_186_8 then
						iter_186_8.color = Color.New(var_186_18, var_186_18, var_186_18)
					end
				end

				arg_183_1.var_.actorSpriteComps10062 = nil
			end

			local var_186_19 = 0
			local var_186_20 = 0.7

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[600].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(410232045)
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232045", "story_v_out_410232.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232045", "story_v_out_410232.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_410232", "410232045", "story_v_out_410232.awb")

						arg_183_1:RecordAudio("410232045", var_186_28)
						arg_183_1:RecordAudio("410232045", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410232", "410232045", "story_v_out_410232.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410232", "410232045", "story_v_out_410232.awb")
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
	Play410232046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410232046
		arg_187_1.duration_ = 16.333

		local var_187_0 = {
			ja = 16.333,
			CriLanguages = 10.433,
			zh = 10.433
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
				arg_187_0:Play410232047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 1

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[600].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(410232046)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232046", "story_v_out_410232.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_410232", "410232046", "story_v_out_410232.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_410232", "410232046", "story_v_out_410232.awb")

						arg_187_1:RecordAudio("410232046", var_190_9)
						arg_187_1:RecordAudio("410232046", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410232", "410232046", "story_v_out_410232.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410232", "410232046", "story_v_out_410232.awb")
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
	Play410232047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410232047
		arg_191_1.duration_ = 7.3

		local var_191_0 = {
			ja = 7.3,
			CriLanguages = 5.2,
			zh = 5.2
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
				arg_191_0:Play410232048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10060"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos10060 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10060", 4)

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
				local var_194_6 = Vector3.New(390, -400, 0)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10060, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(390, -400, 0)
			end

			local var_194_7 = arg_191_1.actors_["10060"]
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps10060 == nil then
				arg_191_1.var_.actorSpriteComps10060 = var_194_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_9 = 0.034

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_9 then
				local var_194_10 = (arg_191_1.time_ - var_194_8) / var_194_9

				if arg_191_1.var_.actorSpriteComps10060 then
					for iter_194_1, iter_194_2 in pairs(arg_191_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_194_2 then
							local var_194_11 = Mathf.Lerp(iter_194_2.color.r, 1, var_194_10)

							iter_194_2.color = Color.New(var_194_11, var_194_11, var_194_11)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_8 + var_194_9 and arg_191_1.time_ < var_194_8 + var_194_9 + arg_194_0 and arg_191_1.var_.actorSpriteComps10060 then
				local var_194_12 = 1

				for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_194_4 then
						iter_194_4.color = Color.New(var_194_12, var_194_12, var_194_12)
					end
				end

				arg_191_1.var_.actorSpriteComps10060 = nil
			end

			local var_194_13 = arg_191_1.actors_["10062"]
			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 == nil then
				arg_191_1.var_.actorSpriteComps10062 = var_194_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_15 = 0.034

			if var_194_14 <= arg_191_1.time_ and arg_191_1.time_ < var_194_14 + var_194_15 then
				local var_194_16 = (arg_191_1.time_ - var_194_14) / var_194_15

				if arg_191_1.var_.actorSpriteComps10062 then
					for iter_194_5, iter_194_6 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_194_6 then
							local var_194_17 = Mathf.Lerp(iter_194_6.color.r, 0.5, var_194_16)

							iter_194_6.color = Color.New(var_194_17, var_194_17, var_194_17)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_14 + var_194_15 and arg_191_1.time_ < var_194_14 + var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 then
				local var_194_18 = 0.5

				for iter_194_7, iter_194_8 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_194_8 then
						iter_194_8.color = Color.New(var_194_18, var_194_18, var_194_18)
					end
				end

				arg_191_1.var_.actorSpriteComps10062 = nil
			end

			local var_194_19 = 0
			local var_194_20 = 0.375

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_21 = arg_191_1:FormatText(StoryNameCfg[597].name)

				arg_191_1.leftNameTxt_.text = var_194_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_22 = arg_191_1:GetWordFromCfg(410232047)
				local var_194_23 = arg_191_1:FormatText(var_194_22.content)

				arg_191_1.text_.text = var_194_23

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232047", "story_v_out_410232.awb") ~= 0 then
					local var_194_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232047", "story_v_out_410232.awb") / 1000

					if var_194_27 + var_194_19 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_27 + var_194_19
					end

					if var_194_22.prefab_name ~= "" and arg_191_1.actors_[var_194_22.prefab_name] ~= nil then
						local var_194_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_22.prefab_name].transform, "story_v_out_410232", "410232047", "story_v_out_410232.awb")

						arg_191_1:RecordAudio("410232047", var_194_28)
						arg_191_1:RecordAudio("410232047", var_194_28)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410232", "410232047", "story_v_out_410232.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410232", "410232047", "story_v_out_410232.awb")
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
	Play410232048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410232048
		arg_195_1.duration_ = 12.4

		local var_195_0 = {
			ja = 12.4,
			CriLanguages = 5.366,
			zh = 5.366
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
				arg_195_0:Play410232049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10062"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10062 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

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

			local var_198_7 = arg_195_1.actors_["10060"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps10060 == nil then
				arg_195_1.var_.actorSpriteComps10060 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.034

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps10060 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 0.5, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps10060 then
				local var_198_12 = 0.5

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps10060 = nil
			end

			local var_198_13 = arg_195_1.actors_["10062"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.actorSpriteComps10062 == nil then
				arg_195_1.var_.actorSpriteComps10062 = var_198_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_15 = 0.034

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.actorSpriteComps10062 then
					for iter_198_5, iter_198_6 in pairs(arg_195_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_198_6 then
							local var_198_17 = Mathf.Lerp(iter_198_6.color.r, 1, var_198_16)

							iter_198_6.color = Color.New(var_198_17, var_198_17, var_198_17)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps10062 then
				local var_198_18 = 1

				for iter_198_7, iter_198_8 in pairs(arg_195_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_198_8 then
						iter_198_8.color = Color.New(var_198_18, var_198_18, var_198_18)
					end
				end

				arg_195_1.var_.actorSpriteComps10062 = nil
			end

			local var_198_19 = 0
			local var_198_20 = 0.6

			if var_198_19 < arg_195_1.time_ and arg_195_1.time_ <= var_198_19 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_21 = arg_195_1:FormatText(StoryNameCfg[600].name)

				arg_195_1.leftNameTxt_.text = var_198_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_22 = arg_195_1:GetWordFromCfg(410232048)
				local var_198_23 = arg_195_1:FormatText(var_198_22.content)

				arg_195_1.text_.text = var_198_23

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_24 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232048", "story_v_out_410232.awb") ~= 0 then
					local var_198_27 = manager.audio:GetVoiceLength("story_v_out_410232", "410232048", "story_v_out_410232.awb") / 1000

					if var_198_27 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_19
					end

					if var_198_22.prefab_name ~= "" and arg_195_1.actors_[var_198_22.prefab_name] ~= nil then
						local var_198_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_22.prefab_name].transform, "story_v_out_410232", "410232048", "story_v_out_410232.awb")

						arg_195_1:RecordAudio("410232048", var_198_28)
						arg_195_1:RecordAudio("410232048", var_198_28)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410232", "410232048", "story_v_out_410232.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410232", "410232048", "story_v_out_410232.awb")
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
	Play410232049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410232049
		arg_199_1.duration_ = 15.033

		local var_199_0 = {
			ja = 15.033,
			CriLanguages = 8.233,
			zh = 8.233
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
				arg_199_0:Play410232050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.9

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[600].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(410232049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232049", "story_v_out_410232.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_410232", "410232049", "story_v_out_410232.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_410232", "410232049", "story_v_out_410232.awb")

						arg_199_1:RecordAudio("410232049", var_202_9)
						arg_199_1:RecordAudio("410232049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410232", "410232049", "story_v_out_410232.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410232", "410232049", "story_v_out_410232.awb")
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
	Play410232050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410232050
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play410232051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10060"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos10060 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10060", 7)

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
				local var_206_6 = Vector3.New(0, -2000, 0)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10060, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_206_7 = arg_203_1.actors_["10062"].transform
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 then
				arg_203_1.var_.moveOldPos10062 = var_206_7.localPosition
				var_206_7.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10062", 7)

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
				local var_206_13 = Vector3.New(0, -2000, -290)

				var_206_7.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10062, var_206_13, var_206_12)
			end

			if arg_203_1.time_ >= var_206_8 + var_206_11 and arg_203_1.time_ < var_206_8 + var_206_11 + arg_206_0 then
				var_206_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_206_14 = arg_203_1.actors_["10060"]
			local var_206_15 = 0

			if var_206_15 < arg_203_1.time_ and arg_203_1.time_ <= var_206_15 + arg_206_0 and arg_203_1.var_.actorSpriteComps10060 == nil then
				arg_203_1.var_.actorSpriteComps10060 = var_206_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_16 = 0.034

			if var_206_15 <= arg_203_1.time_ and arg_203_1.time_ < var_206_15 + var_206_16 then
				local var_206_17 = (arg_203_1.time_ - var_206_15) / var_206_16

				if arg_203_1.var_.actorSpriteComps10060 then
					for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_206_3 then
							local var_206_18 = Mathf.Lerp(iter_206_3.color.r, 0.5, var_206_17)

							iter_206_3.color = Color.New(var_206_18, var_206_18, var_206_18)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_15 + var_206_16 and arg_203_1.time_ < var_206_15 + var_206_16 + arg_206_0 and arg_203_1.var_.actorSpriteComps10060 then
				local var_206_19 = 0.5

				for iter_206_4, iter_206_5 in pairs(arg_203_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_206_5 then
						iter_206_5.color = Color.New(var_206_19, var_206_19, var_206_19)
					end
				end

				arg_203_1.var_.actorSpriteComps10060 = nil
			end

			local var_206_20 = arg_203_1.actors_["10062"]
			local var_206_21 = 0

			if var_206_21 < arg_203_1.time_ and arg_203_1.time_ <= var_206_21 + arg_206_0 and arg_203_1.var_.actorSpriteComps10062 == nil then
				arg_203_1.var_.actorSpriteComps10062 = var_206_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_22 = 0.034

			if var_206_21 <= arg_203_1.time_ and arg_203_1.time_ < var_206_21 + var_206_22 then
				local var_206_23 = (arg_203_1.time_ - var_206_21) / var_206_22

				if arg_203_1.var_.actorSpriteComps10062 then
					for iter_206_6, iter_206_7 in pairs(arg_203_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_206_7 then
							local var_206_24 = Mathf.Lerp(iter_206_7.color.r, 0.5, var_206_23)

							iter_206_7.color = Color.New(var_206_24, var_206_24, var_206_24)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_21 + var_206_22 and arg_203_1.time_ < var_206_21 + var_206_22 + arg_206_0 and arg_203_1.var_.actorSpriteComps10062 then
				local var_206_25 = 0.5

				for iter_206_8, iter_206_9 in pairs(arg_203_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_206_9 then
						iter_206_9.color = Color.New(var_206_25, var_206_25, var_206_25)
					end
				end

				arg_203_1.var_.actorSpriteComps10062 = nil
			end

			local var_206_26 = 0
			local var_206_27 = 1.975

			if var_206_26 < arg_203_1.time_ and arg_203_1.time_ <= var_206_26 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_28 = arg_203_1:GetWordFromCfg(410232050)
				local var_206_29 = arg_203_1:FormatText(var_206_28.content)

				arg_203_1.text_.text = var_206_29

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_30 = 79
				local var_206_31 = utf8.len(var_206_29)
				local var_206_32 = var_206_30 <= 0 and var_206_27 or var_206_27 * (var_206_31 / var_206_30)

				if var_206_32 > 0 and var_206_27 < var_206_32 then
					arg_203_1.talkMaxDuration = var_206_32

					if var_206_32 + var_206_26 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_32 + var_206_26
					end
				end

				arg_203_1.text_.text = var_206_29
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_33 = math.max(var_206_27, arg_203_1.talkMaxDuration)

			if var_206_26 <= arg_203_1.time_ and arg_203_1.time_ < var_206_26 + var_206_33 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_26) / var_206_33

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_26 + var_206_33 and arg_203_1.time_ < var_206_26 + var_206_33 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410232051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410232051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play410232052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.175

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_2 = arg_207_1:GetWordFromCfg(410232051)
				local var_210_3 = arg_207_1:FormatText(var_210_2.content)

				arg_207_1.text_.text = var_210_3

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_4 = 47
				local var_210_5 = utf8.len(var_210_3)
				local var_210_6 = var_210_4 <= 0 and var_210_1 or var_210_1 * (var_210_5 / var_210_4)

				if var_210_6 > 0 and var_210_1 < var_210_6 then
					arg_207_1.talkMaxDuration = var_210_6

					if var_210_6 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_6 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_3
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_7 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_7 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_7

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_7 and arg_207_1.time_ < var_210_0 + var_210_7 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410232052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410232052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play410232053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.875

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

				local var_214_2 = arg_211_1:GetWordFromCfg(410232052)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 35
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
	Play410232053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410232053
		arg_215_1.duration_ = 9.866

		local var_215_0 = {
			ja = 9.866,
			CriLanguages = 7.633,
			zh = 7.633
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
				arg_215_0:Play410232054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10060"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos10060 = var_218_0.localPosition
				var_218_0.localScale = Vector3.New(1, 1, 1)

				arg_215_1:CheckSpriteTmpPos("10060", 3)

				local var_218_2 = var_218_0.childCount

				for iter_218_0 = 0, var_218_2 - 1 do
					local var_218_3 = var_218_0:GetChild(iter_218_0)

					if var_218_3.name == "" or not string.find(var_218_3.name, "split") then
						var_218_3.gameObject:SetActive(true)
					else
						var_218_3.gameObject:SetActive(false)
					end
				end
			end

			local var_218_4 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_4 then
				local var_218_5 = (arg_215_1.time_ - var_218_1) / var_218_4
				local var_218_6 = Vector3.New(0, -400, 0)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos10060, var_218_6, var_218_5)
			end

			if arg_215_1.time_ >= var_218_1 + var_218_4 and arg_215_1.time_ < var_218_1 + var_218_4 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, -400, 0)
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
			local var_218_14 = 0.65

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

				local var_218_16 = arg_215_1:GetWordFromCfg(410232053)
				local var_218_17 = arg_215_1:FormatText(var_218_16.content)

				arg_215_1.text_.text = var_218_17

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_18 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232053", "story_v_out_410232.awb") ~= 0 then
					local var_218_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232053", "story_v_out_410232.awb") / 1000

					if var_218_21 + var_218_13 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_21 + var_218_13
					end

					if var_218_16.prefab_name ~= "" and arg_215_1.actors_[var_218_16.prefab_name] ~= nil then
						local var_218_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_16.prefab_name].transform, "story_v_out_410232", "410232053", "story_v_out_410232.awb")

						arg_215_1:RecordAudio("410232053", var_218_22)
						arg_215_1:RecordAudio("410232053", var_218_22)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_410232", "410232053", "story_v_out_410232.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_410232", "410232053", "story_v_out_410232.awb")
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
	Play410232054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410232054
		arg_219_1.duration_ = 4.133

		local var_219_0 = {
			ja = 4.133,
			CriLanguages = 2.2,
			zh = 1.733
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
			arg_219_1.auto_ = false
		end

		function arg_219_1.playNext_(arg_221_0)
			arg_219_1.onStoryFinished_()
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10060"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos10060 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10060", 3)

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
				local var_222_6 = Vector3.New(0, -400, 0)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10060, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_222_7 = arg_219_1.actors_["10060"]
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps10060 == nil then
				arg_219_1.var_.actorSpriteComps10060 = var_222_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_9 = 0.034

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_9 then
				local var_222_10 = (arg_219_1.time_ - var_222_8) / var_222_9

				if arg_219_1.var_.actorSpriteComps10060 then
					for iter_222_1, iter_222_2 in pairs(arg_219_1.var_.actorSpriteComps10060:ToTable()) do
						if iter_222_2 then
							local var_222_11 = Mathf.Lerp(iter_222_2.color.r, 1, var_222_10)

							iter_222_2.color = Color.New(var_222_11, var_222_11, var_222_11)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_8 + var_222_9 and arg_219_1.time_ < var_222_8 + var_222_9 + arg_222_0 and arg_219_1.var_.actorSpriteComps10060 then
				local var_222_12 = 1

				for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps10060:ToTable()) do
					if iter_222_4 then
						iter_222_4.color = Color.New(var_222_12, var_222_12, var_222_12)
					end
				end

				arg_219_1.var_.actorSpriteComps10060 = nil
			end

			local var_222_13 = 0
			local var_222_14 = 0.125

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_15 = arg_219_1:FormatText(StoryNameCfg[597].name)

				arg_219_1.leftNameTxt_.text = var_222_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_16 = arg_219_1:GetWordFromCfg(410232054)
				local var_222_17 = arg_219_1:FormatText(var_222_16.content)

				arg_219_1.text_.text = var_222_17

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_18 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_410232", "410232054", "story_v_out_410232.awb") ~= 0 then
					local var_222_21 = manager.audio:GetVoiceLength("story_v_out_410232", "410232054", "story_v_out_410232.awb") / 1000

					if var_222_21 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_21 + var_222_13
					end

					if var_222_16.prefab_name ~= "" and arg_219_1.actors_[var_222_16.prefab_name] ~= nil then
						local var_222_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_16.prefab_name].transform, "story_v_out_410232", "410232054", "story_v_out_410232.awb")

						arg_219_1:RecordAudio("410232054", var_222_22)
						arg_219_1:RecordAudio("410232054", var_222_22)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410232", "410232054", "story_v_out_410232.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410232", "410232054", "story_v_out_410232.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST62",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST67"
	},
	voices = {
		"story_v_out_410232.awb"
	}
}
