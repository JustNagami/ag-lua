return {
	Play117062001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117062001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117062002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "A02d"

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
				local var_4_5 = arg_1_1.bgs_.A02d

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
					if iter_4_0 ~= "A02d" then
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
			local var_4_23 = 0.466666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.725

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

				local var_4_33 = arg_1_1:GetWordFromCfg(117062001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 29
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
	Play117062002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117062002
		arg_7_1.duration_ = 5.066

		local var_7_0 = {
			zh = 2.8,
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
				arg_7_0:Play117062003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1132"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["1132"]
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				local var_10_4 = var_10_2:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_4 then
					arg_7_1.var_.alphaOldValue1132 = var_10_4.alpha
					arg_7_1.var_.characterEffect1132 = var_10_4
				end

				arg_7_1.var_.alphaOldValue1132 = 0
			end

			local var_10_5 = 0.333333333333333

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_5 then
				local var_10_6 = (arg_7_1.time_ - var_10_3) / var_10_5
				local var_10_7 = Mathf.Lerp(arg_7_1.var_.alphaOldValue1132, 1, var_10_6)

				if arg_7_1.var_.characterEffect1132 then
					arg_7_1.var_.characterEffect1132.alpha = var_10_7
				end
			end

			if arg_7_1.time_ >= var_10_3 + var_10_5 and arg_7_1.time_ < var_10_3 + var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1132 then
				arg_7_1.var_.characterEffect1132.alpha = 1
			end

			local var_10_8 = "1033"

			if arg_7_1.actors_[var_10_8] == nil then
				local var_10_9 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_8), arg_7_1.canvasGo_.transform)

				var_10_9.transform:SetSiblingIndex(1)

				var_10_9.name = var_10_8
				var_10_9.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_8] = var_10_9
			end

			local var_10_10 = arg_7_1.actors_["1033"].transform
			local var_10_11 = 0

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 then
				arg_7_1.var_.moveOldPos1033 = var_10_10.localPosition
				var_10_10.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1033", 4)

				local var_10_12 = var_10_10.childCount

				for iter_10_0 = 0, var_10_12 - 1 do
					local var_10_13 = var_10_10:GetChild(iter_10_0)

					if var_10_13.name == "split_6" or not string.find(var_10_13.name, "split") then
						var_10_13.gameObject:SetActive(true)
					else
						var_10_13.gameObject:SetActive(false)
					end
				end
			end

			local var_10_14 = 0.001

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_11) / var_10_14
				local var_10_16 = Vector3.New(390, -420, 0)

				var_10_10.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1033, var_10_16, var_10_15)
			end

			if arg_7_1.time_ >= var_10_11 + var_10_14 and arg_7_1.time_ < var_10_11 + var_10_14 + arg_10_0 then
				var_10_10.localPosition = Vector3.New(390, -420, 0)
			end

			local var_10_17 = arg_7_1.actors_["1132"].transform
			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1.var_.moveOldPos1132 = var_10_17.localPosition
				var_10_17.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1132", 2)

				local var_10_19 = var_10_17.childCount

				for iter_10_1 = 0, var_10_19 - 1 do
					local var_10_20 = var_10_17:GetChild(iter_10_1)

					if var_10_20.name == "split_6" or not string.find(var_10_20.name, "split") then
						var_10_20.gameObject:SetActive(true)
					else
						var_10_20.gameObject:SetActive(false)
					end
				end
			end

			local var_10_21 = 0.001

			if var_10_18 <= arg_7_1.time_ and arg_7_1.time_ < var_10_18 + var_10_21 then
				local var_10_22 = (arg_7_1.time_ - var_10_18) / var_10_21
				local var_10_23 = Vector3.New(-390, -413, -185)

				var_10_17.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1132, var_10_23, var_10_22)
			end

			if arg_7_1.time_ >= var_10_18 + var_10_21 and arg_7_1.time_ < var_10_18 + var_10_21 + arg_10_0 then
				var_10_17.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_10_24 = arg_7_1.actors_["1132"]
			local var_10_25 = 0

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 and arg_7_1.var_.actorSpriteComps1132 == nil then
				arg_7_1.var_.actorSpriteComps1132 = var_10_24:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_26 = 0.2

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_26 then
				local var_10_27 = (arg_7_1.time_ - var_10_25) / var_10_26

				if arg_7_1.var_.actorSpriteComps1132 then
					for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_10_3 then
							local var_10_28 = Mathf.Lerp(iter_10_3.color.r, 1, var_10_27)

							iter_10_3.color = Color.New(var_10_28, var_10_28, var_10_28)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_25 + var_10_26 and arg_7_1.time_ < var_10_25 + var_10_26 + arg_10_0 and arg_7_1.var_.actorSpriteComps1132 then
				local var_10_29 = 1

				for iter_10_4, iter_10_5 in pairs(arg_7_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_10_5 then
						iter_10_5.color = Color.New(var_10_29, var_10_29, var_10_29)
					end
				end

				arg_7_1.var_.actorSpriteComps1132 = nil
			end

			local var_10_30 = arg_7_1.actors_["1033"]
			local var_10_31 = 0

			if var_10_31 < arg_7_1.time_ and arg_7_1.time_ <= var_10_31 + arg_10_0 and arg_7_1.var_.actorSpriteComps1033 == nil then
				arg_7_1.var_.actorSpriteComps1033 = var_10_30:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_32 = 0.2

			if var_10_31 <= arg_7_1.time_ and arg_7_1.time_ < var_10_31 + var_10_32 then
				local var_10_33 = (arg_7_1.time_ - var_10_31) / var_10_32

				if arg_7_1.var_.actorSpriteComps1033 then
					for iter_10_6, iter_10_7 in pairs(arg_7_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_10_7 then
							local var_10_34 = Mathf.Lerp(iter_10_7.color.r, 0.5, var_10_33)

							iter_10_7.color = Color.New(var_10_34, var_10_34, var_10_34)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_31 + var_10_32 and arg_7_1.time_ < var_10_31 + var_10_32 + arg_10_0 and arg_7_1.var_.actorSpriteComps1033 then
				local var_10_35 = 0.5

				for iter_10_8, iter_10_9 in pairs(arg_7_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_10_9 then
						iter_10_9.color = Color.New(var_10_35, var_10_35, var_10_35)
					end
				end

				arg_7_1.var_.actorSpriteComps1033 = nil
			end

			local var_10_36 = arg_7_1.actors_["1033"]
			local var_10_37 = 0

			if var_10_37 < arg_7_1.time_ and arg_7_1.time_ <= var_10_37 + arg_10_0 then
				local var_10_38 = var_10_36:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_38 then
					arg_7_1.var_.alphaOldValue1033 = var_10_38.alpha
					arg_7_1.var_.characterEffect1033 = var_10_38
				end

				arg_7_1.var_.alphaOldValue1033 = 0
			end

			local var_10_39 = 0.333333333333333

			if var_10_37 <= arg_7_1.time_ and arg_7_1.time_ < var_10_37 + var_10_39 then
				local var_10_40 = (arg_7_1.time_ - var_10_37) / var_10_39
				local var_10_41 = Mathf.Lerp(arg_7_1.var_.alphaOldValue1033, 1, var_10_40)

				if arg_7_1.var_.characterEffect1033 then
					arg_7_1.var_.characterEffect1033.alpha = var_10_41
				end
			end

			if arg_7_1.time_ >= var_10_37 + var_10_39 and arg_7_1.time_ < var_10_37 + var_10_39 + arg_10_0 and arg_7_1.var_.characterEffect1033 then
				arg_7_1.var_.characterEffect1033.alpha = 1
			end

			local var_10_42 = 0
			local var_10_43 = 0.3

			if var_10_42 < arg_7_1.time_ and arg_7_1.time_ <= var_10_42 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_44 = arg_7_1:FormatText(StoryNameCfg[61].name)

				arg_7_1.leftNameTxt_.text = var_10_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_45 = arg_7_1:GetWordFromCfg(117062002)
				local var_10_46 = arg_7_1:FormatText(var_10_45.content)

				arg_7_1.text_.text = var_10_46

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_47 = 12
				local var_10_48 = utf8.len(var_10_46)
				local var_10_49 = var_10_47 <= 0 and var_10_43 or var_10_43 * (var_10_48 / var_10_47)

				if var_10_49 > 0 and var_10_43 < var_10_49 then
					arg_7_1.talkMaxDuration = var_10_49

					if var_10_49 + var_10_42 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_49 + var_10_42
					end
				end

				arg_7_1.text_.text = var_10_46
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062002", "story_v_out_117062.awb") ~= 0 then
					local var_10_50 = manager.audio:GetVoiceLength("story_v_out_117062", "117062002", "story_v_out_117062.awb") / 1000

					if var_10_50 + var_10_42 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_50 + var_10_42
					end

					if var_10_45.prefab_name ~= "" and arg_7_1.actors_[var_10_45.prefab_name] ~= nil then
						local var_10_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_45.prefab_name].transform, "story_v_out_117062", "117062002", "story_v_out_117062.awb")

						arg_7_1:RecordAudio("117062002", var_10_51)
						arg_7_1:RecordAudio("117062002", var_10_51)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_117062", "117062002", "story_v_out_117062.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_117062", "117062002", "story_v_out_117062.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_52 = math.max(var_10_43, arg_7_1.talkMaxDuration)

			if var_10_42 <= arg_7_1.time_ and arg_7_1.time_ < var_10_42 + var_10_52 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_42) / var_10_52

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_42 + var_10_52 and arg_7_1.time_ < var_10_42 + var_10_52 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play117062003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117062003
		arg_11_1.duration_ = 5.866

		local var_11_0 = {
			zh = 3.7,
			ja = 5.866
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
				arg_11_0:Play117062004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1033"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1033 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1033", 4)

				local var_14_2 = var_14_0.childCount

				for iter_14_0 = 0, var_14_2 - 1 do
					local var_14_3 = var_14_0:GetChild(iter_14_0)

					if var_14_3.name == "split_6" or not string.find(var_14_3.name, "split") then
						var_14_3.gameObject:SetActive(true)
					else
						var_14_3.gameObject:SetActive(false)
					end
				end
			end

			local var_14_4 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_4 then
				local var_14_5 = (arg_11_1.time_ - var_14_1) / var_14_4
				local var_14_6 = Vector3.New(390, -420, 0)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1033, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_14_7 = arg_11_1.actors_["1132"].transform
			local var_14_8 = 0

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 then
				arg_11_1.var_.moveOldPos1132 = var_14_7.localPosition
				var_14_7.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1132", 2)

				local var_14_9 = var_14_7.childCount

				for iter_14_1 = 0, var_14_9 - 1 do
					local var_14_10 = var_14_7:GetChild(iter_14_1)

					if var_14_10.name == "split_6" or not string.find(var_14_10.name, "split") then
						var_14_10.gameObject:SetActive(true)
					else
						var_14_10.gameObject:SetActive(false)
					end
				end
			end

			local var_14_11 = 0.001

			if var_14_8 <= arg_11_1.time_ and arg_11_1.time_ < var_14_8 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_8) / var_14_11
				local var_14_13 = Vector3.New(-390, -413, -185)

				var_14_7.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1132, var_14_13, var_14_12)
			end

			if arg_11_1.time_ >= var_14_8 + var_14_11 and arg_11_1.time_ < var_14_8 + var_14_11 + arg_14_0 then
				var_14_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_14_14 = arg_11_1.actors_["1132"]
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 and arg_11_1.var_.actorSpriteComps1132 == nil then
				arg_11_1.var_.actorSpriteComps1132 = var_14_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_16 = 0.2

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16

				if arg_11_1.var_.actorSpriteComps1132 then
					for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_14_3 then
							local var_14_18 = Mathf.Lerp(iter_14_3.color.r, 0.5, var_14_17)

							iter_14_3.color = Color.New(var_14_18, var_14_18, var_14_18)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps1132 then
				local var_14_19 = 0.5

				for iter_14_4, iter_14_5 in pairs(arg_11_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_14_5 then
						iter_14_5.color = Color.New(var_14_19, var_14_19, var_14_19)
					end
				end

				arg_11_1.var_.actorSpriteComps1132 = nil
			end

			local var_14_20 = arg_11_1.actors_["1033"]
			local var_14_21 = 0

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 == nil then
				arg_11_1.var_.actorSpriteComps1033 = var_14_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_22 = 0.2

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_22 then
				local var_14_23 = (arg_11_1.time_ - var_14_21) / var_14_22

				if arg_11_1.var_.actorSpriteComps1033 then
					for iter_14_6, iter_14_7 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_14_7 then
							local var_14_24 = Mathf.Lerp(iter_14_7.color.r, 1, var_14_23)

							iter_14_7.color = Color.New(var_14_24, var_14_24, var_14_24)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_21 + var_14_22 and arg_11_1.time_ < var_14_21 + var_14_22 + arg_14_0 and arg_11_1.var_.actorSpriteComps1033 then
				local var_14_25 = 1

				for iter_14_8, iter_14_9 in pairs(arg_11_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_14_9 then
						iter_14_9.color = Color.New(var_14_25, var_14_25, var_14_25)
					end
				end

				arg_11_1.var_.actorSpriteComps1033 = nil
			end

			local var_14_26 = 0
			local var_14_27 = 0.5

			if var_14_26 < arg_11_1.time_ and arg_11_1.time_ <= var_14_26 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_28 = arg_11_1:FormatText(StoryNameCfg[236].name)

				arg_11_1.leftNameTxt_.text = var_14_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_29 = arg_11_1:GetWordFromCfg(117062003)
				local var_14_30 = arg_11_1:FormatText(var_14_29.content)

				arg_11_1.text_.text = var_14_30

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_31 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062003", "story_v_out_117062.awb") ~= 0 then
					local var_14_34 = manager.audio:GetVoiceLength("story_v_out_117062", "117062003", "story_v_out_117062.awb") / 1000

					if var_14_34 + var_14_26 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_34 + var_14_26
					end

					if var_14_29.prefab_name ~= "" and arg_11_1.actors_[var_14_29.prefab_name] ~= nil then
						local var_14_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_29.prefab_name].transform, "story_v_out_117062", "117062003", "story_v_out_117062.awb")

						arg_11_1:RecordAudio("117062003", var_14_35)
						arg_11_1:RecordAudio("117062003", var_14_35)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_117062", "117062003", "story_v_out_117062.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_117062", "117062003", "story_v_out_117062.awb")
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
	Play117062004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117062004
		arg_15_1.duration_ = 5.933

		local var_15_0 = {
			zh = 3.4,
			ja = 5.933
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
				arg_15_0:Play117062005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1132"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps1132 == nil then
				arg_15_1.var_.actorSpriteComps1132 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps1132 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 1, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps1132 then
				local var_18_5 = 1

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps1132 = nil
			end

			local var_18_6 = arg_15_1.actors_["1033"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 == nil then
				arg_15_1.var_.actorSpriteComps1033 = var_18_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_8 = 0.2

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8

				if arg_15_1.var_.actorSpriteComps1033 then
					for iter_18_4, iter_18_5 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_18_5 then
							local var_18_10 = Mathf.Lerp(iter_18_5.color.r, 0.5, var_18_9)

							iter_18_5.color = Color.New(var_18_10, var_18_10, var_18_10)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps1033 then
				local var_18_11 = 0.5

				for iter_18_6, iter_18_7 in pairs(arg_15_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_18_7 then
						iter_18_7.color = Color.New(var_18_11, var_18_11, var_18_11)
					end
				end

				arg_15_1.var_.actorSpriteComps1033 = nil
			end

			local var_18_12 = 0
			local var_18_13 = 0.5

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_14 = arg_15_1:FormatText(StoryNameCfg[61].name)

				arg_15_1.leftNameTxt_.text = var_18_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_15 = arg_15_1:GetWordFromCfg(117062004)
				local var_18_16 = arg_15_1:FormatText(var_18_15.content)

				arg_15_1.text_.text = var_18_16

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_17 = 20
				local var_18_18 = utf8.len(var_18_16)
				local var_18_19 = var_18_17 <= 0 and var_18_13 or var_18_13 * (var_18_18 / var_18_17)

				if var_18_19 > 0 and var_18_13 < var_18_19 then
					arg_15_1.talkMaxDuration = var_18_19

					if var_18_19 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_19 + var_18_12
					end
				end

				arg_15_1.text_.text = var_18_16
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062004", "story_v_out_117062.awb") ~= 0 then
					local var_18_20 = manager.audio:GetVoiceLength("story_v_out_117062", "117062004", "story_v_out_117062.awb") / 1000

					if var_18_20 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_12
					end

					if var_18_15.prefab_name ~= "" and arg_15_1.actors_[var_18_15.prefab_name] ~= nil then
						local var_18_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_15.prefab_name].transform, "story_v_out_117062", "117062004", "story_v_out_117062.awb")

						arg_15_1:RecordAudio("117062004", var_18_21)
						arg_15_1:RecordAudio("117062004", var_18_21)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_117062", "117062004", "story_v_out_117062.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_117062", "117062004", "story_v_out_117062.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_13, arg_15_1.talkMaxDuration)

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_12) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_12 + var_18_22 and arg_15_1.time_ < var_18_12 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play117062005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117062005
		arg_19_1.duration_ = 15

		local var_19_0 = {
			zh = 11.433,
			ja = 15
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
				arg_19_0:Play117062006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1132"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps1132 == nil then
				arg_19_1.var_.actorSpriteComps1132 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps1132 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 0.5, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps1132 then
				local var_22_5 = 0.5

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps1132 = nil
			end

			local var_22_6 = arg_19_1.actors_["1033"]
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 == nil then
				arg_19_1.var_.actorSpriteComps1033 = var_22_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_8 = 0.2

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8

				if arg_19_1.var_.actorSpriteComps1033 then
					for iter_22_4, iter_22_5 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_22_5 then
							local var_22_10 = Mathf.Lerp(iter_22_5.color.r, 1, var_22_9)

							iter_22_5.color = Color.New(var_22_10, var_22_10, var_22_10)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 then
				local var_22_11 = 1

				for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_22_7 then
						iter_22_7.color = Color.New(var_22_11, var_22_11, var_22_11)
					end
				end

				arg_19_1.var_.actorSpriteComps1033 = nil
			end

			local var_22_12 = 0
			local var_22_13 = 1.425

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[236].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(117062005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 57
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062005", "story_v_out_117062.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_out_117062", "117062005", "story_v_out_117062.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_out_117062", "117062005", "story_v_out_117062.awb")

						arg_19_1:RecordAudio("117062005", var_22_21)
						arg_19_1:RecordAudio("117062005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_117062", "117062005", "story_v_out_117062.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_117062", "117062005", "story_v_out_117062.awb")
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
	Play117062006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 117062006
		arg_23_1.duration_ = 11.566

		local var_23_0 = {
			zh = 4.233,
			ja = 11.566
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
				arg_23_0:Play117062007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.5

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[236].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(117062006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062006", "story_v_out_117062.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062006", "story_v_out_117062.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_117062", "117062006", "story_v_out_117062.awb")

						arg_23_1:RecordAudio("117062006", var_26_9)
						arg_23_1:RecordAudio("117062006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_117062", "117062006", "story_v_out_117062.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_117062", "117062006", "story_v_out_117062.awb")
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
	Play117062007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117062007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play117062008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1033"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 == nil then
				arg_27_1.var_.actorSpriteComps1033 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps1033 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps1033 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps1033 = nil
			end

			local var_30_6 = 0
			local var_30_7 = 1

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				local var_30_8 = "play"
				local var_30_9 = "effect"

				arg_27_1:AudioAction(var_30_8, var_30_9, "se_story_17", "se_story_17_boss_hawk3", "")
			end

			local var_30_10 = 0
			local var_30_11 = 0.875

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_12 = arg_27_1:GetWordFromCfg(117062007)
				local var_30_13 = arg_27_1:FormatText(var_30_12.content)

				arg_27_1.text_.text = var_30_13

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_14 = 35
				local var_30_15 = utf8.len(var_30_13)
				local var_30_16 = var_30_14 <= 0 and var_30_11 or var_30_11 * (var_30_15 / var_30_14)

				if var_30_16 > 0 and var_30_11 < var_30_16 then
					arg_27_1.talkMaxDuration = var_30_16

					if var_30_16 + var_30_10 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_16 + var_30_10
					end
				end

				arg_27_1.text_.text = var_30_13
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_17 = math.max(var_30_11, arg_27_1.talkMaxDuration)

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_17 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_10) / var_30_17

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_10 + var_30_17 and arg_27_1.time_ < var_30_10 + var_30_17 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play117062008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117062008
		arg_31_1.duration_ = 4.1

		local var_31_0 = {
			zh = 2.733,
			ja = 4.1
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
				arg_31_0:Play117062009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1033"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1033 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1033", 4)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "split_4" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(390, -420, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1033, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_34_7 = arg_31_1.actors_["1033"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 == nil then
				arg_31_1.var_.actorSpriteComps1033 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.2

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps1033 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1033 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.275

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[236].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(117062008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062008", "story_v_out_117062.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_117062", "117062008", "story_v_out_117062.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_117062", "117062008", "story_v_out_117062.awb")

						arg_31_1:RecordAudio("117062008", var_34_22)
						arg_31_1:RecordAudio("117062008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_117062", "117062008", "story_v_out_117062.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_117062", "117062008", "story_v_out_117062.awb")
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
	Play117062009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 117062009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play117062010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1033"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				local var_38_2 = var_38_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_38_2 then
					arg_35_1.var_.alphaOldValue1033 = var_38_2.alpha
					arg_35_1.var_.characterEffect1033 = var_38_2
				end

				arg_35_1.var_.alphaOldValue1033 = 1
			end

			local var_38_3 = 0.333333333333333

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_3 then
				local var_38_4 = (arg_35_1.time_ - var_38_1) / var_38_3
				local var_38_5 = Mathf.Lerp(arg_35_1.var_.alphaOldValue1033, 0, var_38_4)

				if arg_35_1.var_.characterEffect1033 then
					arg_35_1.var_.characterEffect1033.alpha = var_38_5
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_3 and arg_35_1.time_ < var_38_1 + var_38_3 + arg_38_0 and arg_35_1.var_.characterEffect1033 then
				arg_35_1.var_.characterEffect1033.alpha = 0
			end

			local var_38_6 = arg_35_1.actors_["1132"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				local var_38_8 = var_38_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_38_8 then
					arg_35_1.var_.alphaOldValue1132 = var_38_8.alpha
					arg_35_1.var_.characterEffect1132 = var_38_8
				end

				arg_35_1.var_.alphaOldValue1132 = 1
			end

			local var_38_9 = 0.333333333333333

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_7) / var_38_9
				local var_38_11 = Mathf.Lerp(arg_35_1.var_.alphaOldValue1132, 0, var_38_10)

				if arg_35_1.var_.characterEffect1132 then
					arg_35_1.var_.characterEffect1132.alpha = var_38_11
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_9 and arg_35_1.time_ < var_38_7 + var_38_9 + arg_38_0 and arg_35_1.var_.characterEffect1132 then
				arg_35_1.var_.characterEffect1132.alpha = 0
			end

			local var_38_12 = 0
			local var_38_13 = 0.925

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_14 = arg_35_1:GetWordFromCfg(117062009)
				local var_38_15 = arg_35_1:FormatText(var_38_14.content)

				arg_35_1.text_.text = var_38_15

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_16 = 37
				local var_38_17 = utf8.len(var_38_15)
				local var_38_18 = var_38_16 <= 0 and var_38_13 or var_38_13 * (var_38_17 / var_38_16)

				if var_38_18 > 0 and var_38_13 < var_38_18 then
					arg_35_1.talkMaxDuration = var_38_18

					if var_38_18 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_12
					end
				end

				arg_35_1.text_.text = var_38_15
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_19 = math.max(var_38_13, arg_35_1.talkMaxDuration)

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_19 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_12) / var_38_19

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_12 + var_38_19 and arg_35_1.time_ < var_38_12 + var_38_19 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play117062010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 117062010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play117062011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1.25

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

				local var_42_2 = arg_39_1:GetWordFromCfg(117062010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 50
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
	Play117062011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 117062011
		arg_43_1.duration_ = 2.633

		local var_43_0 = {
			zh = 1.333,
			ja = 2.633
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
				arg_43_0:Play117062012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1132"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1132 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1132", 3)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "split_6" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(0, -413, -185)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1132, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -413, -185)
			end

			local var_46_7 = arg_43_1.actors_["1132"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 then
				local var_46_9 = var_46_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_46_9 then
					arg_43_1.var_.alphaOldValue1132 = var_46_9.alpha
					arg_43_1.var_.characterEffect1132 = var_46_9
				end

				arg_43_1.var_.alphaOldValue1132 = 0
			end

			local var_46_10 = 0.333333333333333

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_10 then
				local var_46_11 = (arg_43_1.time_ - var_46_8) / var_46_10
				local var_46_12 = Mathf.Lerp(arg_43_1.var_.alphaOldValue1132, 1, var_46_11)

				if arg_43_1.var_.characterEffect1132 then
					arg_43_1.var_.characterEffect1132.alpha = var_46_12
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_10 and arg_43_1.time_ < var_46_8 + var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1132 then
				arg_43_1.var_.characterEffect1132.alpha = 1
			end

			local var_46_13 = arg_43_1.actors_["1132"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1132 == nil then
				arg_43_1.var_.actorSpriteComps1132 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.2

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1132 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_46_2 then
							local var_46_17 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_16)

							iter_46_2.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1132 then
				local var_46_18 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1132 = nil
			end

			local var_46_19 = manager.ui.mainCamera.transform
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.var_.shakeOldPos = var_46_19.localPosition
			end

			local var_46_21 = 0.333333333333333

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / 0.066
				local var_46_23, var_46_24 = math.modf(var_46_22)

				var_46_19.localPosition = Vector3.New(var_46_24 * 0.13, var_46_24 * 0.13, var_46_24 * 0.13) + arg_43_1.var_.shakeOldPos
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 then
				var_46_19.localPosition = arg_43_1.var_.shakeOldPos
			end

			local var_46_25 = 0
			local var_46_26 = 0.15

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_27 = arg_43_1:FormatText(StoryNameCfg[61].name)

				arg_43_1.leftNameTxt_.text = var_46_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_28 = arg_43_1:GetWordFromCfg(117062011)
				local var_46_29 = arg_43_1:FormatText(var_46_28.content)

				arg_43_1.text_.text = var_46_29

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_30 = 6
				local var_46_31 = utf8.len(var_46_29)
				local var_46_32 = var_46_30 <= 0 and var_46_26 or var_46_26 * (var_46_31 / var_46_30)

				if var_46_32 > 0 and var_46_26 < var_46_32 then
					arg_43_1.talkMaxDuration = var_46_32

					if var_46_32 + var_46_25 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_32 + var_46_25
					end
				end

				arg_43_1.text_.text = var_46_29
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062011", "story_v_out_117062.awb") ~= 0 then
					local var_46_33 = manager.audio:GetVoiceLength("story_v_out_117062", "117062011", "story_v_out_117062.awb") / 1000

					if var_46_33 + var_46_25 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_33 + var_46_25
					end

					if var_46_28.prefab_name ~= "" and arg_43_1.actors_[var_46_28.prefab_name] ~= nil then
						local var_46_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_28.prefab_name].transform, "story_v_out_117062", "117062011", "story_v_out_117062.awb")

						arg_43_1:RecordAudio("117062011", var_46_34)
						arg_43_1:RecordAudio("117062011", var_46_34)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_117062", "117062011", "story_v_out_117062.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_117062", "117062011", "story_v_out_117062.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_35 = math.max(var_46_26, arg_43_1.talkMaxDuration)

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_35 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_25) / var_46_35

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_25 + var_46_35 and arg_43_1.time_ < var_46_25 + var_46_35 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play117062012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 117062012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play117062013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1132"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				local var_50_2 = var_50_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_50_2 then
					arg_47_1.var_.alphaOldValue1132 = var_50_2.alpha
					arg_47_1.var_.characterEffect1132 = var_50_2
				end

				arg_47_1.var_.alphaOldValue1132 = 1
			end

			local var_50_3 = 0.333333333333333

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_3 then
				local var_50_4 = (arg_47_1.time_ - var_50_1) / var_50_3
				local var_50_5 = Mathf.Lerp(arg_47_1.var_.alphaOldValue1132, 0, var_50_4)

				if arg_47_1.var_.characterEffect1132 then
					arg_47_1.var_.characterEffect1132.alpha = var_50_5
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_3 and arg_47_1.time_ < var_50_1 + var_50_3 + arg_50_0 and arg_47_1.var_.characterEffect1132 then
				arg_47_1.var_.characterEffect1132.alpha = 0
			end

			local var_50_6 = 0
			local var_50_7 = 1

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				local var_50_8 = "play"
				local var_50_9 = "effect"

				arg_47_1:AudioAction(var_50_8, var_50_9, "se_story_17", "se_story_17_boss_change", "")
			end

			local var_50_10 = 0
			local var_50_11 = 1.425

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_12 = arg_47_1:GetWordFromCfg(117062012)
				local var_50_13 = arg_47_1:FormatText(var_50_12.content)

				arg_47_1.text_.text = var_50_13

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_14 = 57
				local var_50_15 = utf8.len(var_50_13)
				local var_50_16 = var_50_14 <= 0 and var_50_11 or var_50_11 * (var_50_15 / var_50_14)

				if var_50_16 > 0 and var_50_11 < var_50_16 then
					arg_47_1.talkMaxDuration = var_50_16

					if var_50_16 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_16 + var_50_10
					end
				end

				arg_47_1.text_.text = var_50_13
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_17 = math.max(var_50_11, arg_47_1.talkMaxDuration)

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_17 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_10) / var_50_17

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_10 + var_50_17 and arg_47_1.time_ < var_50_10 + var_50_17 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play117062013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 117062013
		arg_51_1.duration_ = 8.533333333332

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play117062014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "TI0104"

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
				local var_54_5 = arg_51_1.bgs_.TI0104

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
					if iter_54_0 ~= "TI0104" then
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

			local var_54_27 = arg_51_1.bgs_.TI0104.transform
			local var_54_28 = 2

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1.var_.moveOldPosTI0104 = var_54_27.localPosition
			end

			local var_54_29 = 0.001

			if var_54_28 <= arg_51_1.time_ and arg_51_1.time_ < var_54_28 + var_54_29 then
				local var_54_30 = (arg_51_1.time_ - var_54_28) / var_54_29
				local var_54_31 = Vector3.New(-1, 0, 3)

				var_54_27.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosTI0104, var_54_31, var_54_30)
			end

			if arg_51_1.time_ >= var_54_28 + var_54_29 and arg_51_1.time_ < var_54_28 + var_54_29 + arg_54_0 then
				var_54_27.localPosition = Vector3.New(-1, 0, 3)
			end

			local var_54_32 = arg_51_1.bgs_.TI0104.transform
			local var_54_33 = 2.03333333333333

			if var_54_33 < arg_51_1.time_ and arg_51_1.time_ <= var_54_33 + arg_54_0 then
				arg_51_1.var_.moveOldPosTI0104 = var_54_32.localPosition
			end

			local var_54_34 = 6.5

			if var_54_33 <= arg_51_1.time_ and arg_51_1.time_ < var_54_33 + var_54_34 then
				local var_54_35 = (arg_51_1.time_ - var_54_33) / var_54_34
				local var_54_36 = Vector3.New(-1, 0, 4)

				var_54_32.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosTI0104, var_54_36, var_54_35)
			end

			if arg_51_1.time_ >= var_54_33 + var_54_34 and arg_51_1.time_ < var_54_33 + var_54_34 + arg_54_0 then
				var_54_32.localPosition = Vector3.New(-1, 0, 4)
			end

			local var_54_37 = 4

			if var_54_37 < arg_51_1.time_ and arg_51_1.time_ <= var_54_37 + arg_54_0 then
				arg_51_1.allBtn_.enabled = false
			end

			local var_54_38 = 4.53333333333333

			if arg_51_1.time_ >= var_54_37 + var_54_38 and arg_51_1.time_ < var_54_37 + var_54_38 + arg_54_0 then
				arg_51_1.allBtn_.enabled = true
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_39 = 2
			local var_54_40 = 1.325

			if var_54_39 < arg_51_1.time_ and arg_51_1.time_ <= var_54_39 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_41 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_41:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_42 = arg_51_1:GetWordFromCfg(117062013)
				local var_54_43 = arg_51_1:FormatText(var_54_42.content)

				arg_51_1.text_.text = var_54_43

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_44 = 53
				local var_54_45 = utf8.len(var_54_43)
				local var_54_46 = var_54_44 <= 0 and var_54_40 or var_54_40 * (var_54_45 / var_54_44)

				if var_54_46 > 0 and var_54_40 < var_54_46 then
					arg_51_1.talkMaxDuration = var_54_46
					var_54_39 = var_54_39 + 0.3

					if var_54_46 + var_54_39 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_46 + var_54_39
					end
				end

				arg_51_1.text_.text = var_54_43
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_47 = var_54_39 + 0.3
			local var_54_48 = math.max(var_54_40, arg_51_1.talkMaxDuration)

			if var_54_47 <= arg_51_1.time_ and arg_51_1.time_ < var_54_47 + var_54_48 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_47) / var_54_48

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_47 + var_54_48 and arg_51_1.time_ < var_54_47 + var_54_48 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play117062014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 117062014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play117062015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = manager.ui.mainCamera.transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.shakeOldPos = var_60_0.localPosition
			end

			local var_60_2 = 2

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / 0.066
				local var_60_4, var_60_5 = math.modf(var_60_3)

				var_60_0.localPosition = Vector3.New(var_60_5 * 0.13, var_60_5 * 0.13, var_60_5 * 0.13) + arg_57_1.var_.shakeOldPos
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = arg_57_1.var_.shakeOldPos
			end

			local var_60_6 = 0
			local var_60_7 = 1

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				local var_60_8 = "play"
				local var_60_9 = "effect"

				arg_57_1:AudioAction(var_60_8, var_60_9, "se_story_17", "se_story_17_boss_hawk1", "")
			end

			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1.allBtn_.enabled = false
			end

			local var_60_11 = 2

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 then
				arg_57_1.allBtn_.enabled = true
			end

			local var_60_12 = 0
			local var_60_13 = 0.075

			if var_60_12 < arg_57_1.time_ and arg_57_1.time_ <= var_60_12 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_14 = arg_57_1:FormatText(StoryNameCfg[371].name)

				arg_57_1.leftNameTxt_.text = var_60_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_15 = arg_57_1:GetWordFromCfg(117062014)
				local var_60_16 = arg_57_1:FormatText(var_60_15.content)

				arg_57_1.text_.text = var_60_16

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_17 = 3
				local var_60_18 = utf8.len(var_60_16)
				local var_60_19 = var_60_17 <= 0 and var_60_13 or var_60_13 * (var_60_18 / var_60_17)

				if var_60_19 > 0 and var_60_13 < var_60_19 then
					arg_57_1.talkMaxDuration = var_60_19

					if var_60_19 + var_60_12 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_19 + var_60_12
					end
				end

				arg_57_1.text_.text = var_60_16
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_20 = math.max(var_60_13, arg_57_1.talkMaxDuration)

			if var_60_12 <= arg_57_1.time_ and arg_57_1.time_ < var_60_12 + var_60_20 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_12) / var_60_20

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_12 + var_60_20 and arg_57_1.time_ < var_60_12 + var_60_20 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play117062015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 117062015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play117062016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 1

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				local var_64_2 = "play"
				local var_64_3 = "effect"

				arg_61_1:AudioAction(var_64_2, var_64_3, "se_story_17", "se_story_17_messenger02", "")
			end

			local var_64_4 = 0
			local var_64_5 = 1

			if var_64_4 < arg_61_1.time_ and arg_61_1.time_ <= var_64_4 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_6 = arg_61_1:GetWordFromCfg(117062015)
				local var_64_7 = arg_61_1:FormatText(var_64_6.content)

				arg_61_1.text_.text = var_64_7

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_8 = 40
				local var_64_9 = utf8.len(var_64_7)
				local var_64_10 = var_64_8 <= 0 and var_64_5 or var_64_5 * (var_64_9 / var_64_8)

				if var_64_10 > 0 and var_64_5 < var_64_10 then
					arg_61_1.talkMaxDuration = var_64_10

					if var_64_10 + var_64_4 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_10 + var_64_4
					end
				end

				arg_61_1.text_.text = var_64_7
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_11 = math.max(var_64_5, arg_61_1.talkMaxDuration)

			if var_64_4 <= arg_61_1.time_ and arg_61_1.time_ < var_64_4 + var_64_11 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_4) / var_64_11

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_4 + var_64_11 and arg_61_1.time_ < var_64_4 + var_64_11 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play117062016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 117062016
		arg_65_1.duration_ = 2.233

		local var_65_0 = {
			zh = 1.2,
			ja = 2.233
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
				arg_65_0:Play117062017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.1

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[236].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_5")

				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(117062016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062016", "story_v_out_117062.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062016", "story_v_out_117062.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_117062", "117062016", "story_v_out_117062.awb")

						arg_65_1:RecordAudio("117062016", var_68_9)
						arg_65_1:RecordAudio("117062016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_117062", "117062016", "story_v_out_117062.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_117062", "117062016", "story_v_out_117062.awb")
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
	Play117062017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 117062017
		arg_69_1.duration_ = 6.933

		local var_69_0 = {
			zh = 5.866,
			ja = 6.933
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
				arg_69_0:Play117062018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_1 = 2

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_1 then
				local var_72_2 = (arg_69_1.time_ - var_72_0) / var_72_1
				local var_72_3 = Color.New(0, 0, 0)

				var_72_3.a = Mathf.Lerp(0, 1, var_72_2)
				arg_69_1.mask_.color = var_72_3
			end

			if arg_69_1.time_ >= var_72_0 + var_72_1 and arg_69_1.time_ < var_72_0 + var_72_1 + arg_72_0 then
				local var_72_4 = Color.New(0, 0, 0)

				var_72_4.a = 1
				arg_69_1.mask_.color = var_72_4
			end

			local var_72_5 = 2

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_6 = 2

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6
				local var_72_8 = Color.New(0, 0, 0)

				var_72_8.a = Mathf.Lerp(1, 0, var_72_7)
				arg_69_1.mask_.color = var_72_8
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 then
				local var_72_9 = Color.New(0, 0, 0)
				local var_72_10 = 0

				arg_69_1.mask_.enabled = false
				var_72_9.a = var_72_10
				arg_69_1.mask_.color = var_72_9
			end

			local var_72_11 = arg_69_1.bgs_.TI0104.transform
			local var_72_12 = 2

			if var_72_12 < arg_69_1.time_ and arg_69_1.time_ <= var_72_12 + arg_72_0 then
				arg_69_1.var_.moveOldPosTI0104 = var_72_11.localPosition
			end

			local var_72_13 = 0.001

			if var_72_12 <= arg_69_1.time_ and arg_69_1.time_ < var_72_12 + var_72_13 then
				local var_72_14 = (arg_69_1.time_ - var_72_12) / var_72_13
				local var_72_15 = Vector3.New(0, 1, 9.5)

				var_72_11.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPosTI0104, var_72_15, var_72_14)
			end

			if arg_69_1.time_ >= var_72_12 + var_72_13 and arg_69_1.time_ < var_72_12 + var_72_13 + arg_72_0 then
				var_72_11.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_72_16 = arg_69_1.bgs_.TI0104.transform
			local var_72_17 = 2.01666666666667

			if var_72_17 < arg_69_1.time_ and arg_69_1.time_ <= var_72_17 + arg_72_0 then
				arg_69_1.var_.moveOldPosTI0104 = var_72_16.localPosition
			end

			local var_72_18 = 2.566666

			if var_72_17 <= arg_69_1.time_ and arg_69_1.time_ < var_72_17 + var_72_18 then
				local var_72_19 = (arg_69_1.time_ - var_72_17) / var_72_18
				local var_72_20 = Vector3.New(0, 1, 10)

				var_72_16.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPosTI0104, var_72_20, var_72_19)
			end

			if arg_69_1.time_ >= var_72_17 + var_72_18 and arg_69_1.time_ < var_72_17 + var_72_18 + arg_72_0 then
				var_72_16.localPosition = Vector3.New(0, 1, 10)
			end

			local var_72_21 = 4

			if var_72_21 < arg_69_1.time_ and arg_69_1.time_ <= var_72_21 + arg_72_0 then
				arg_69_1.allBtn_.enabled = false
			end

			local var_72_22 = 0.583332666666667

			if arg_69_1.time_ >= var_72_21 + var_72_22 and arg_69_1.time_ < var_72_21 + var_72_22 + arg_72_0 then
				arg_69_1.allBtn_.enabled = true
			end

			if arg_69_1.frameCnt_ <= 1 then
				arg_69_1.dialog_:SetActive(false)
			end

			local var_72_23 = 3.5
			local var_72_24 = 0.25

			if var_72_23 < arg_69_1.time_ and arg_69_1.time_ <= var_72_23 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_25 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_25:setOnUpdate(LuaHelper.FloatAction(function(arg_73_0)
					arg_69_1.dialogCg_.alpha = arg_73_0
				end))
				var_72_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_26 = arg_69_1:FormatText(StoryNameCfg[61].name)

				arg_69_1.leftNameTxt_.text = var_72_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1132_split_6")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_27 = arg_69_1:GetWordFromCfg(117062017)
				local var_72_28 = arg_69_1:FormatText(var_72_27.content)

				arg_69_1.text_.text = var_72_28

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_29 = 10
				local var_72_30 = utf8.len(var_72_28)
				local var_72_31 = var_72_29 <= 0 and var_72_24 or var_72_24 * (var_72_30 / var_72_29)

				if var_72_31 > 0 and var_72_24 < var_72_31 then
					arg_69_1.talkMaxDuration = var_72_31
					var_72_23 = var_72_23 + 0.3

					if var_72_31 + var_72_23 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_31 + var_72_23
					end
				end

				arg_69_1.text_.text = var_72_28
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062017", "story_v_out_117062.awb") ~= 0 then
					local var_72_32 = manager.audio:GetVoiceLength("story_v_out_117062", "117062017", "story_v_out_117062.awb") / 1000

					if var_72_32 + var_72_23 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_32 + var_72_23
					end

					if var_72_27.prefab_name ~= "" and arg_69_1.actors_[var_72_27.prefab_name] ~= nil then
						local var_72_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_27.prefab_name].transform, "story_v_out_117062", "117062017", "story_v_out_117062.awb")

						arg_69_1:RecordAudio("117062017", var_72_33)
						arg_69_1:RecordAudio("117062017", var_72_33)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_117062", "117062017", "story_v_out_117062.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_117062", "117062017", "story_v_out_117062.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_34 = var_72_23 + 0.3
			local var_72_35 = math.max(var_72_24, arg_69_1.talkMaxDuration)

			if var_72_34 <= arg_69_1.time_ and arg_69_1.time_ < var_72_34 + var_72_35 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_34) / var_72_35

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_34 + var_72_35 and arg_69_1.time_ < var_72_34 + var_72_35 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play117062018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 117062018
		arg_75_1.duration_ = 7.066

		local var_75_0 = {
			zh = 7.066,
			ja = 3.6
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
				arg_75_0:Play117062019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.9

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[236].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_6")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(117062018)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 36
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062018", "story_v_out_117062.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062018", "story_v_out_117062.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_117062", "117062018", "story_v_out_117062.awb")

						arg_75_1:RecordAudio("117062018", var_78_9)
						arg_75_1:RecordAudio("117062018", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_117062", "117062018", "story_v_out_117062.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_117062", "117062018", "story_v_out_117062.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play117062019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 117062019
		arg_79_1.duration_ = 7.2

		local var_79_0 = {
			zh = 7.2,
			ja = 3.733
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
				arg_79_0:Play117062020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 1.175

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[236].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_6")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(117062019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062019", "story_v_out_117062.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062019", "story_v_out_117062.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_117062", "117062019", "story_v_out_117062.awb")

						arg_79_1:RecordAudio("117062019", var_82_9)
						arg_79_1:RecordAudio("117062019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_117062", "117062019", "story_v_out_117062.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_117062", "117062019", "story_v_out_117062.awb")
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
	Play117062020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 117062020
		arg_83_1.duration_ = 4.466

		local var_83_0 = {
			zh = 1.9,
			ja = 4.466
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
				arg_83_0:Play117062021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.3

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[61].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1132_split_6")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(117062020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062020", "story_v_out_117062.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062020", "story_v_out_117062.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_117062", "117062020", "story_v_out_117062.awb")

						arg_83_1:RecordAudio("117062020", var_86_9)
						arg_83_1:RecordAudio("117062020", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_117062", "117062020", "story_v_out_117062.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_117062", "117062020", "story_v_out_117062.awb")
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
	Play117062021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 117062021
		arg_87_1.duration_ = 1.666

		local var_87_0 = {
			zh = 1.133,
			ja = 1.666
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
				arg_87_0:Play117062022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.075

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[236].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_4")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(117062021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062021", "story_v_out_117062.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062021", "story_v_out_117062.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_117062", "117062021", "story_v_out_117062.awb")

						arg_87_1:RecordAudio("117062021", var_90_9)
						arg_87_1:RecordAudio("117062021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_117062", "117062021", "story_v_out_117062.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_117062", "117062021", "story_v_out_117062.awb")
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
	Play117062022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 117062022
		arg_91_1.duration_ = 4.833

		local var_91_0 = {
			zh = 4.833,
			ja = 4
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
				arg_91_0:Play117062023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.575

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[61].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1132_split_6")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(117062022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 23
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062022", "story_v_out_117062.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062022", "story_v_out_117062.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_117062", "117062022", "story_v_out_117062.awb")

						arg_91_1:RecordAudio("117062022", var_94_9)
						arg_91_1:RecordAudio("117062022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_117062", "117062022", "story_v_out_117062.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_117062", "117062022", "story_v_out_117062.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play117062023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 117062023
		arg_95_1.duration_ = 2.633

		local var_95_0 = {
			zh = 2.533,
			ja = 2.633
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
				arg_95_0:Play117062024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.225

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[236].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_4")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(117062023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 9
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062023", "story_v_out_117062.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062023", "story_v_out_117062.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_117062", "117062023", "story_v_out_117062.awb")

						arg_95_1:RecordAudio("117062023", var_98_9)
						arg_95_1:RecordAudio("117062023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_117062", "117062023", "story_v_out_117062.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_117062", "117062023", "story_v_out_117062.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play117062024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 117062024
		arg_99_1.duration_ = 4.9

		local var_99_0 = {
			zh = 3.1,
			ja = 4.9
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
			arg_99_1.auto_ = false
		end

		function arg_99_1.playNext_(arg_101_0)
			arg_99_1.onStoryFinished_()
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.375

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[61].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1132_split_6")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(117062024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 15
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117062", "117062024", "story_v_out_117062.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_117062", "117062024", "story_v_out_117062.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_117062", "117062024", "story_v_out_117062.awb")

						arg_99_1:RecordAudio("117062024", var_102_9)
						arg_99_1:RecordAudio("117062024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_117062", "117062024", "story_v_out_117062.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_117062", "117062024", "story_v_out_117062.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/A02d",
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0104"
	},
	voices = {
		"story_v_out_117062.awb"
	}
}
