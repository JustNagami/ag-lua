return {
	Play117102001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117102001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117102002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I08"

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
				local var_4_5 = arg_1_1.bgs_.I08

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
					if iter_4_0 ~= "I08" then
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

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_v0_battleground", "bgm_story_v0_battleground", "bgm_story_v0_battleground.awb")
			end

			local var_4_30 = 0
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_8", "se_story_8_fire_environment_loop", "")
			end

			local var_4_34 = 0
			local var_4_35 = 1

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_36 = "play"
				local var_4_37 = "effect"

				arg_1_1:AudioAction(var_4_36, var_4_37, "se_story_8", "se_story_8_fire_loop", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 1.275

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_40 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_40:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(117102001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 51
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_39 or var_4_39 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_39 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_38 = var_4_38 + 0.3

					if var_4_45 + var_4_38 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_38
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_46 = var_4_38 + 0.3
			local var_4_47 = math.max(var_4_39, arg_1_1.talkMaxDuration)

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_46) / var_4_47

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play117102002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117102002
		arg_7_1.duration_ = 3.4

		local var_7_0 = {
			zh = 3.366,
			ja = 3.4
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
				arg_7_0:Play117102003(arg_7_1)
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

			local var_10_2 = arg_7_1.actors_["1132"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos1132 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1132", 3)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "split_6" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(0, -413, -185)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1132, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(0, -413, -185)
			end

			local var_10_9 = arg_7_1.actors_["1132"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 and arg_7_1.var_.actorSpriteComps1132 == nil then
				arg_7_1.var_.actorSpriteComps1132 = var_10_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_11 = 0.2

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11

				if arg_7_1.var_.actorSpriteComps1132 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_10_2 then
							local var_10_13 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_12)

							iter_10_2.color = Color.New(var_10_13, var_10_13, var_10_13)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 and arg_7_1.var_.actorSpriteComps1132 then
				local var_10_14 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_14, var_10_14, var_10_14)
					end
				end

				arg_7_1.var_.actorSpriteComps1132 = nil
			end

			local var_10_15 = 0
			local var_10_16 = 0.2

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_17 = arg_7_1:FormatText(StoryNameCfg[61].name)

				arg_7_1.leftNameTxt_.text = var_10_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_18 = arg_7_1:GetWordFromCfg(117102002)
				local var_10_19 = arg_7_1:FormatText(var_10_18.content)

				arg_7_1.text_.text = var_10_19

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_20 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102002", "story_v_out_117102.awb") ~= 0 then
					local var_10_23 = manager.audio:GetVoiceLength("story_v_out_117102", "117102002", "story_v_out_117102.awb") / 1000

					if var_10_23 + var_10_15 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_23 + var_10_15
					end

					if var_10_18.prefab_name ~= "" and arg_7_1.actors_[var_10_18.prefab_name] ~= nil then
						local var_10_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_18.prefab_name].transform, "story_v_out_117102", "117102002", "story_v_out_117102.awb")

						arg_7_1:RecordAudio("117102002", var_10_24)
						arg_7_1:RecordAudio("117102002", var_10_24)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_117102", "117102002", "story_v_out_117102.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_117102", "117102002", "story_v_out_117102.awb")
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
	Play117102003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117102003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play117102004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1132"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1132 = var_14_0.localPosition
				var_14_0.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1132", 7)

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
				local var_14_6 = Vector3.New(0, -2000, -185)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1132, var_14_6, var_14_5)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_4 and arg_11_1.time_ < var_14_1 + var_14_4 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, -2000, -185)
			end

			local var_14_7 = 0
			local var_14_8 = 0.7

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(117102003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 28
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_8 or var_14_8 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_8 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_7 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_7
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_8, arg_11_1.talkMaxDuration)

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_7) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_7 + var_14_14 and arg_11_1.time_ < var_14_7 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play117102004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117102004
		arg_15_1.duration_ = 6.433

		local var_15_0 = {
			zh = 5.333,
			ja = 6.433
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
				arg_15_0:Play117102005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1132"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1132 = var_18_0.localPosition
				var_18_0.localScale = Vector3.New(1, 1, 1)

				arg_15_1:CheckSpriteTmpPos("1132", 3)

				local var_18_2 = var_18_0.childCount

				for iter_18_0 = 0, var_18_2 - 1 do
					local var_18_3 = var_18_0:GetChild(iter_18_0)

					if var_18_3.name == "split_6" or not string.find(var_18_3.name, "split") then
						var_18_3.gameObject:SetActive(true)
					else
						var_18_3.gameObject:SetActive(false)
					end
				end
			end

			local var_18_4 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_4 then
				local var_18_5 = (arg_15_1.time_ - var_18_1) / var_18_4
				local var_18_6 = Vector3.New(0, -413, -185)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1132, var_18_6, var_18_5)
			end

			if arg_15_1.time_ >= var_18_1 + var_18_4 and arg_15_1.time_ < var_18_1 + var_18_4 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -413, -185)
			end

			local var_18_7 = arg_15_1.actors_["1132"]
			local var_18_8 = 0

			if var_18_8 < arg_15_1.time_ and arg_15_1.time_ <= var_18_8 + arg_18_0 and arg_15_1.var_.actorSpriteComps1132 == nil then
				arg_15_1.var_.actorSpriteComps1132 = var_18_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_9 = 0.2

			if var_18_8 <= arg_15_1.time_ and arg_15_1.time_ < var_18_8 + var_18_9 then
				local var_18_10 = (arg_15_1.time_ - var_18_8) / var_18_9

				if arg_15_1.var_.actorSpriteComps1132 then
					for iter_18_1, iter_18_2 in pairs(arg_15_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_18_2 then
							local var_18_11 = Mathf.Lerp(iter_18_2.color.r, 1, var_18_10)

							iter_18_2.color = Color.New(var_18_11, var_18_11, var_18_11)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_8 + var_18_9 and arg_15_1.time_ < var_18_8 + var_18_9 + arg_18_0 and arg_15_1.var_.actorSpriteComps1132 then
				local var_18_12 = 1

				for iter_18_3, iter_18_4 in pairs(arg_15_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_18_4 then
						iter_18_4.color = Color.New(var_18_12, var_18_12, var_18_12)
					end
				end

				arg_15_1.var_.actorSpriteComps1132 = nil
			end

			local var_18_13 = 0
			local var_18_14 = 0.5

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_15 = arg_15_1:FormatText(StoryNameCfg[61].name)

				arg_15_1.leftNameTxt_.text = var_18_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_16 = arg_15_1:GetWordFromCfg(117102004)
				local var_18_17 = arg_15_1:FormatText(var_18_16.content)

				arg_15_1.text_.text = var_18_17

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_18 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102004", "story_v_out_117102.awb") ~= 0 then
					local var_18_21 = manager.audio:GetVoiceLength("story_v_out_117102", "117102004", "story_v_out_117102.awb") / 1000

					if var_18_21 + var_18_13 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_13
					end

					if var_18_16.prefab_name ~= "" and arg_15_1.actors_[var_18_16.prefab_name] ~= nil then
						local var_18_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_16.prefab_name].transform, "story_v_out_117102", "117102004", "story_v_out_117102.awb")

						arg_15_1:RecordAudio("117102004", var_18_22)
						arg_15_1:RecordAudio("117102004", var_18_22)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_117102", "117102004", "story_v_out_117102.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_117102", "117102004", "story_v_out_117102.awb")
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
	Play117102005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117102005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play117102006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1132"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1132 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1132", 7)

				local var_22_2 = var_22_0.childCount

				for iter_22_0 = 0, var_22_2 - 1 do
					local var_22_3 = var_22_0:GetChild(iter_22_0)

					if var_22_3.name == "split_6" or not string.find(var_22_3.name, "split") then
						var_22_3.gameObject:SetActive(true)
					else
						var_22_3.gameObject:SetActive(false)
					end
				end
			end

			local var_22_4 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_4 then
				local var_22_5 = (arg_19_1.time_ - var_22_1) / var_22_4
				local var_22_6 = Vector3.New(0, -2000, -185)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1132, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -2000, -185)
			end

			local var_22_7 = 0
			local var_22_8 = 0.975

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(117102005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 39
				local var_22_12 = utf8.len(var_22_10)
				local var_22_13 = var_22_11 <= 0 and var_22_8 or var_22_8 * (var_22_12 / var_22_11)

				if var_22_13 > 0 and var_22_8 < var_22_13 then
					arg_19_1.talkMaxDuration = var_22_13

					if var_22_13 + var_22_7 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_7
					end
				end

				arg_19_1.text_.text = var_22_10
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_8, arg_19_1.talkMaxDuration)

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_7) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_7 + var_22_14 and arg_19_1.time_ < var_22_7 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play117102006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 117102006
		arg_23_1.duration_ = 5

		local var_23_0 = {
			zh = 3.766,
			ja = 5
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
				arg_23_0:Play117102007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "10036"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_26_0), arg_23_1.canvasGo_.transform)

				var_26_1.transform:SetSiblingIndex(1)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_23_1.actors_[var_26_0] = var_26_1
			end

			local var_26_2 = arg_23_1.actors_["10036"].transform
			local var_26_3 = 0

			if var_26_3 < arg_23_1.time_ and arg_23_1.time_ <= var_26_3 + arg_26_0 then
				arg_23_1.var_.moveOldPos10036 = var_26_2.localPosition
				var_26_2.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10036", 4)

				local var_26_4 = var_26_2.childCount

				for iter_26_0 = 0, var_26_4 - 1 do
					local var_26_5 = var_26_2:GetChild(iter_26_0)

					if var_26_5.name == "split_5" or not string.find(var_26_5.name, "split") then
						var_26_5.gameObject:SetActive(true)
					else
						var_26_5.gameObject:SetActive(false)
					end
				end
			end

			local var_26_6 = 0.001

			if var_26_3 <= arg_23_1.time_ and arg_23_1.time_ < var_26_3 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_3) / var_26_6
				local var_26_8 = Vector3.New(390, -445, -290)

				var_26_2.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10036, var_26_8, var_26_7)
			end

			if arg_23_1.time_ >= var_26_3 + var_26_6 and arg_23_1.time_ < var_26_3 + var_26_6 + arg_26_0 then
				var_26_2.localPosition = Vector3.New(390, -445, -290)
			end

			local var_26_9 = arg_23_1.actors_["1132"].transform
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 then
				arg_23_1.var_.moveOldPos1132 = var_26_9.localPosition
				var_26_9.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("1132", 2)

				local var_26_11 = var_26_9.childCount

				for iter_26_1 = 0, var_26_11 - 1 do
					local var_26_12 = var_26_9:GetChild(iter_26_1)

					if var_26_12.name == "split_6" or not string.find(var_26_12.name, "split") then
						var_26_12.gameObject:SetActive(true)
					else
						var_26_12.gameObject:SetActive(false)
					end
				end
			end

			local var_26_13 = 0.001

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_13 then
				local var_26_14 = (arg_23_1.time_ - var_26_10) / var_26_13
				local var_26_15 = Vector3.New(-390, -413, -185)

				var_26_9.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1132, var_26_15, var_26_14)
			end

			if arg_23_1.time_ >= var_26_10 + var_26_13 and arg_23_1.time_ < var_26_10 + var_26_13 + arg_26_0 then
				var_26_9.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_26_16 = arg_23_1.actors_["1132"]
			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 and arg_23_1.var_.actorSpriteComps1132 == nil then
				arg_23_1.var_.actorSpriteComps1132 = var_26_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_18 = 0.2

			if var_26_17 <= arg_23_1.time_ and arg_23_1.time_ < var_26_17 + var_26_18 then
				local var_26_19 = (arg_23_1.time_ - var_26_17) / var_26_18

				if arg_23_1.var_.actorSpriteComps1132 then
					for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_26_3 then
							local var_26_20 = Mathf.Lerp(iter_26_3.color.r, 1, var_26_19)

							iter_26_3.color = Color.New(var_26_20, var_26_20, var_26_20)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_17 + var_26_18 and arg_23_1.time_ < var_26_17 + var_26_18 + arg_26_0 and arg_23_1.var_.actorSpriteComps1132 then
				local var_26_21 = 1

				for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_26_5 then
						iter_26_5.color = Color.New(var_26_21, var_26_21, var_26_21)
					end
				end

				arg_23_1.var_.actorSpriteComps1132 = nil
			end

			local var_26_22 = arg_23_1.actors_["10036"]
			local var_26_23 = 0

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 and arg_23_1.var_.actorSpriteComps10036 == nil then
				arg_23_1.var_.actorSpriteComps10036 = var_26_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_24 = 0.034

			if var_26_23 <= arg_23_1.time_ and arg_23_1.time_ < var_26_23 + var_26_24 then
				local var_26_25 = (arg_23_1.time_ - var_26_23) / var_26_24

				if arg_23_1.var_.actorSpriteComps10036 then
					for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_26_7 then
							local var_26_26 = Mathf.Lerp(iter_26_7.color.r, 0.5, var_26_25)

							iter_26_7.color = Color.New(var_26_26, var_26_26, var_26_26)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_23 + var_26_24 and arg_23_1.time_ < var_26_23 + var_26_24 + arg_26_0 and arg_23_1.var_.actorSpriteComps10036 then
				local var_26_27 = 0.5

				for iter_26_8, iter_26_9 in pairs(arg_23_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_26_9 then
						iter_26_9.color = Color.New(var_26_27, var_26_27, var_26_27)
					end
				end

				arg_23_1.var_.actorSpriteComps10036 = nil
			end

			local var_26_28 = 0
			local var_26_29 = 0.3

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_30 = arg_23_1:FormatText(StoryNameCfg[61].name)

				arg_23_1.leftNameTxt_.text = var_26_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_31 = arg_23_1:GetWordFromCfg(117102006)
				local var_26_32 = arg_23_1:FormatText(var_26_31.content)

				arg_23_1.text_.text = var_26_32

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_33 = 12
				local var_26_34 = utf8.len(var_26_32)
				local var_26_35 = var_26_33 <= 0 and var_26_29 or var_26_29 * (var_26_34 / var_26_33)

				if var_26_35 > 0 and var_26_29 < var_26_35 then
					arg_23_1.talkMaxDuration = var_26_35

					if var_26_35 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_35 + var_26_28
					end
				end

				arg_23_1.text_.text = var_26_32
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102006", "story_v_out_117102.awb") ~= 0 then
					local var_26_36 = manager.audio:GetVoiceLength("story_v_out_117102", "117102006", "story_v_out_117102.awb") / 1000

					if var_26_36 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_36 + var_26_28
					end

					if var_26_31.prefab_name ~= "" and arg_23_1.actors_[var_26_31.prefab_name] ~= nil then
						local var_26_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_31.prefab_name].transform, "story_v_out_117102", "117102006", "story_v_out_117102.awb")

						arg_23_1:RecordAudio("117102006", var_26_37)
						arg_23_1:RecordAudio("117102006", var_26_37)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_117102", "117102006", "story_v_out_117102.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_117102", "117102006", "story_v_out_117102.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_38 = math.max(var_26_29, arg_23_1.talkMaxDuration)

			if var_26_28 <= arg_23_1.time_ and arg_23_1.time_ < var_26_28 + var_26_38 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_28) / var_26_38

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_28 + var_26_38 and arg_23_1.time_ < var_26_28 + var_26_38 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play117102007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117102007
		arg_27_1.duration_ = 4.9

		local var_27_0 = {
			zh = 2.5,
			ja = 4.9
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
				arg_27_0:Play117102008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10036"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10036 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10036", 4)

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
				local var_30_6 = Vector3.New(390, -445, -290)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10036, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(390, -445, -290)
			end

			local var_30_7 = arg_27_1.actors_["1132"].transform
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 then
				arg_27_1.var_.moveOldPos1132 = var_30_7.localPosition
				var_30_7.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1132", 2)

				local var_30_9 = var_30_7.childCount

				for iter_30_1 = 0, var_30_9 - 1 do
					local var_30_10 = var_30_7:GetChild(iter_30_1)

					if var_30_10.name == "split_6" or not string.find(var_30_10.name, "split") then
						var_30_10.gameObject:SetActive(true)
					else
						var_30_10.gameObject:SetActive(false)
					end
				end
			end

			local var_30_11 = 0.001

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_8) / var_30_11
				local var_30_13 = Vector3.New(-390, -413, -185)

				var_30_7.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1132, var_30_13, var_30_12)
			end

			if arg_27_1.time_ >= var_30_8 + var_30_11 and arg_27_1.time_ < var_30_8 + var_30_11 + arg_30_0 then
				var_30_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_30_14 = arg_27_1.actors_["1132"]
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 and arg_27_1.var_.actorSpriteComps1132 == nil then
				arg_27_1.var_.actorSpriteComps1132 = var_30_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_16 = 0.2

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16

				if arg_27_1.var_.actorSpriteComps1132 then
					for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_30_3 then
							local var_30_18 = Mathf.Lerp(iter_30_3.color.r, 0.5, var_30_17)

							iter_30_3.color = Color.New(var_30_18, var_30_18, var_30_18)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 and arg_27_1.var_.actorSpriteComps1132 then
				local var_30_19 = 0.5

				for iter_30_4, iter_30_5 in pairs(arg_27_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_30_5 then
						iter_30_5.color = Color.New(var_30_19, var_30_19, var_30_19)
					end
				end

				arg_27_1.var_.actorSpriteComps1132 = nil
			end

			local var_30_20 = arg_27_1.actors_["10036"]
			local var_30_21 = 0

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 and arg_27_1.var_.actorSpriteComps10036 == nil then
				arg_27_1.var_.actorSpriteComps10036 = var_30_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_22 = 0.2

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_21) / var_30_22

				if arg_27_1.var_.actorSpriteComps10036 then
					for iter_30_6, iter_30_7 in pairs(arg_27_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_30_7 then
							local var_30_24 = Mathf.Lerp(iter_30_7.color.r, 1, var_30_23)

							iter_30_7.color = Color.New(var_30_24, var_30_24, var_30_24)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_21 + var_30_22 and arg_27_1.time_ < var_30_21 + var_30_22 + arg_30_0 and arg_27_1.var_.actorSpriteComps10036 then
				local var_30_25 = 1

				for iter_30_8, iter_30_9 in pairs(arg_27_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_30_9 then
						iter_30_9.color = Color.New(var_30_25, var_30_25, var_30_25)
					end
				end

				arg_27_1.var_.actorSpriteComps10036 = nil
			end

			local var_30_26 = 0
			local var_30_27 = 0.275

			if var_30_26 < arg_27_1.time_ and arg_27_1.time_ <= var_30_26 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_28 = arg_27_1:FormatText(StoryNameCfg[370].name)

				arg_27_1.leftNameTxt_.text = var_30_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_29 = arg_27_1:GetWordFromCfg(117102007)
				local var_30_30 = arg_27_1:FormatText(var_30_29.content)

				arg_27_1.text_.text = var_30_30

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_31 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102007", "story_v_out_117102.awb") ~= 0 then
					local var_30_34 = manager.audio:GetVoiceLength("story_v_out_117102", "117102007", "story_v_out_117102.awb") / 1000

					if var_30_34 + var_30_26 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_34 + var_30_26
					end

					if var_30_29.prefab_name ~= "" and arg_27_1.actors_[var_30_29.prefab_name] ~= nil then
						local var_30_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_29.prefab_name].transform, "story_v_out_117102", "117102007", "story_v_out_117102.awb")

						arg_27_1:RecordAudio("117102007", var_30_35)
						arg_27_1:RecordAudio("117102007", var_30_35)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_117102", "117102007", "story_v_out_117102.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_117102", "117102007", "story_v_out_117102.awb")
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
	Play117102008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117102008
		arg_31_1.duration_ = 7

		local var_31_0 = {
			zh = 6.333,
			ja = 7
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
				arg_31_0:Play117102009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.7

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[370].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(117102008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 28
				local var_34_6 = utf8.len(var_34_4)
				local var_34_7 = var_34_5 <= 0 and var_34_1 or var_34_1 * (var_34_6 / var_34_5)

				if var_34_7 > 0 and var_34_1 < var_34_7 then
					arg_31_1.talkMaxDuration = var_34_7

					if var_34_7 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_7 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_4
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102008", "story_v_out_117102.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_117102", "117102008", "story_v_out_117102.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_117102", "117102008", "story_v_out_117102.awb")

						arg_31_1:RecordAudio("117102008", var_34_9)
						arg_31_1:RecordAudio("117102008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_117102", "117102008", "story_v_out_117102.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_117102", "117102008", "story_v_out_117102.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play117102009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 117102009
		arg_35_1.duration_ = 8.033

		local var_35_0 = {
			zh = 4.833,
			ja = 8.033
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
				arg_35_0:Play117102010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.625

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[370].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(117102009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102009", "story_v_out_117102.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_117102", "117102009", "story_v_out_117102.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_117102", "117102009", "story_v_out_117102.awb")

						arg_35_1:RecordAudio("117102009", var_38_9)
						arg_35_1:RecordAudio("117102009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_117102", "117102009", "story_v_out_117102.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_117102", "117102009", "story_v_out_117102.awb")
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
	Play117102010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 117102010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play117102011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10036"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10036 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10036", 4)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_5" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(390, -445, -290)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10036, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(390, -445, -290)
			end

			local var_42_7 = arg_39_1.actors_["1132"].transform
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 then
				arg_39_1.var_.moveOldPos1132 = var_42_7.localPosition
				var_42_7.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1132", 2)

				local var_42_9 = var_42_7.childCount

				for iter_42_1 = 0, var_42_9 - 1 do
					local var_42_10 = var_42_7:GetChild(iter_42_1)

					if var_42_10.name == "split_6" or not string.find(var_42_10.name, "split") then
						var_42_10.gameObject:SetActive(true)
					else
						var_42_10.gameObject:SetActive(false)
					end
				end
			end

			local var_42_11 = 0.001

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_8) / var_42_11
				local var_42_13 = Vector3.New(-390, -413, -185)

				var_42_7.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1132, var_42_13, var_42_12)
			end

			if arg_39_1.time_ >= var_42_8 + var_42_11 and arg_39_1.time_ < var_42_8 + var_42_11 + arg_42_0 then
				var_42_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_42_14 = arg_39_1.actors_["10036"]
			local var_42_15 = 0

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 and arg_39_1.var_.actorSpriteComps10036 == nil then
				arg_39_1.var_.actorSpriteComps10036 = var_42_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_16 = 0.2

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_15) / var_42_16

				if arg_39_1.var_.actorSpriteComps10036 then
					for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_42_3 then
							local var_42_18 = Mathf.Lerp(iter_42_3.color.r, 0.5, var_42_17)

							iter_42_3.color = Color.New(var_42_18, var_42_18, var_42_18)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_15 + var_42_16 and arg_39_1.time_ < var_42_15 + var_42_16 + arg_42_0 and arg_39_1.var_.actorSpriteComps10036 then
				local var_42_19 = 0.5

				for iter_42_4, iter_42_5 in pairs(arg_39_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_42_5 then
						iter_42_5.color = Color.New(var_42_19, var_42_19, var_42_19)
					end
				end

				arg_39_1.var_.actorSpriteComps10036 = nil
			end

			local var_42_20 = 0
			local var_42_21 = 0.45

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

				local var_42_22 = arg_39_1:GetWordFromCfg(117102010)
				local var_42_23 = arg_39_1:FormatText(var_42_22.content)

				arg_39_1.text_.text = var_42_23

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_24 = 18
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
	Play117102011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 117102011
		arg_43_1.duration_ = 7.466

		local var_43_0 = {
			zh = 5.533,
			ja = 7.466
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
				arg_43_0:Play117102012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10036"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos10036 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10036", 4)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "split_5" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(390, -445, -290)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10036, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(390, -445, -290)
			end

			local var_46_7 = arg_43_1.actors_["1132"].transform
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 then
				arg_43_1.var_.moveOldPos1132 = var_46_7.localPosition
				var_46_7.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("1132", 2)

				local var_46_9 = var_46_7.childCount

				for iter_46_1 = 0, var_46_9 - 1 do
					local var_46_10 = var_46_7:GetChild(iter_46_1)

					if var_46_10.name == "split_6" or not string.find(var_46_10.name, "split") then
						var_46_10.gameObject:SetActive(true)
					else
						var_46_10.gameObject:SetActive(false)
					end
				end
			end

			local var_46_11 = 0.001

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_8) / var_46_11
				local var_46_13 = Vector3.New(-390, -413, -185)

				var_46_7.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1132, var_46_13, var_46_12)
			end

			if arg_43_1.time_ >= var_46_8 + var_46_11 and arg_43_1.time_ < var_46_8 + var_46_11 + arg_46_0 then
				var_46_7.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_46_14 = arg_43_1.actors_["1132"]
			local var_46_15 = 0

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1132 == nil then
				arg_43_1.var_.actorSpriteComps1132 = var_46_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_16 = 0.2

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_16 then
				local var_46_17 = (arg_43_1.time_ - var_46_15) / var_46_16

				if arg_43_1.var_.actorSpriteComps1132 then
					for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_46_3 then
							local var_46_18 = Mathf.Lerp(iter_46_3.color.r, 1, var_46_17)

							iter_46_3.color = Color.New(var_46_18, var_46_18, var_46_18)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_15 + var_46_16 and arg_43_1.time_ < var_46_15 + var_46_16 + arg_46_0 and arg_43_1.var_.actorSpriteComps1132 then
				local var_46_19 = 1

				for iter_46_4, iter_46_5 in pairs(arg_43_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_46_5 then
						iter_46_5.color = Color.New(var_46_19, var_46_19, var_46_19)
					end
				end

				arg_43_1.var_.actorSpriteComps1132 = nil
			end

			local var_46_20 = 0
			local var_46_21 = 0.6

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_22 = arg_43_1:FormatText(StoryNameCfg[61].name)

				arg_43_1.leftNameTxt_.text = var_46_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_23 = arg_43_1:GetWordFromCfg(117102011)
				local var_46_24 = arg_43_1:FormatText(var_46_23.content)

				arg_43_1.text_.text = var_46_24

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_25 = 24
				local var_46_26 = utf8.len(var_46_24)
				local var_46_27 = var_46_25 <= 0 and var_46_21 or var_46_21 * (var_46_26 / var_46_25)

				if var_46_27 > 0 and var_46_21 < var_46_27 then
					arg_43_1.talkMaxDuration = var_46_27

					if var_46_27 + var_46_20 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_20
					end
				end

				arg_43_1.text_.text = var_46_24
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102011", "story_v_out_117102.awb") ~= 0 then
					local var_46_28 = manager.audio:GetVoiceLength("story_v_out_117102", "117102011", "story_v_out_117102.awb") / 1000

					if var_46_28 + var_46_20 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_28 + var_46_20
					end

					if var_46_23.prefab_name ~= "" and arg_43_1.actors_[var_46_23.prefab_name] ~= nil then
						local var_46_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_23.prefab_name].transform, "story_v_out_117102", "117102011", "story_v_out_117102.awb")

						arg_43_1:RecordAudio("117102011", var_46_29)
						arg_43_1:RecordAudio("117102011", var_46_29)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_117102", "117102011", "story_v_out_117102.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_117102", "117102011", "story_v_out_117102.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_30 = math.max(var_46_21, arg_43_1.talkMaxDuration)

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_30 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_20) / var_46_30

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_20 + var_46_30 and arg_43_1.time_ < var_46_20 + var_46_30 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play117102012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 117102012
		arg_47_1.duration_ = 5.3

		local var_47_0 = {
			zh = 3.733,
			ja = 5.3
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
				arg_47_0:Play117102013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.275

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[61].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(117102012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117102", "117102012", "story_v_out_117102.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_117102", "117102012", "story_v_out_117102.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_117102", "117102012", "story_v_out_117102.awb")

						arg_47_1:RecordAudio("117102012", var_50_9)
						arg_47_1:RecordAudio("117102012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_117102", "117102012", "story_v_out_117102.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_117102", "117102012", "story_v_out_117102.awb")
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
	Play117102013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 117102013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
			arg_51_1.auto_ = false
		end

		function arg_51_1.playNext_(arg_53_0)
			arg_51_1.onStoryFinished_()
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1132"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				local var_54_2 = var_54_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_54_2 then
					arg_51_1.var_.alphaOldValue1132 = var_54_2.alpha
					arg_51_1.var_.characterEffect1132 = var_54_2
				end

				arg_51_1.var_.alphaOldValue1132 = 1
			end

			local var_54_3 = 0.3

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_3 then
				local var_54_4 = (arg_51_1.time_ - var_54_1) / var_54_3
				local var_54_5 = Mathf.Lerp(arg_51_1.var_.alphaOldValue1132, 0, var_54_4)

				if arg_51_1.var_.characterEffect1132 then
					arg_51_1.var_.characterEffect1132.alpha = var_54_5
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_3 and arg_51_1.time_ < var_54_1 + var_54_3 + arg_54_0 and arg_51_1.var_.characterEffect1132 then
				arg_51_1.var_.characterEffect1132.alpha = 0
			end

			local var_54_6 = arg_51_1.actors_["10036"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 then
				local var_54_8 = var_54_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_54_8 then
					arg_51_1.var_.alphaOldValue10036 = var_54_8.alpha
					arg_51_1.var_.characterEffect10036 = var_54_8
				end

				arg_51_1.var_.alphaOldValue10036 = 1
			end

			local var_54_9 = 0.3

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_7) / var_54_9
				local var_54_11 = Mathf.Lerp(arg_51_1.var_.alphaOldValue10036, 0, var_54_10)

				if arg_51_1.var_.characterEffect10036 then
					arg_51_1.var_.characterEffect10036.alpha = var_54_11
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_9 and arg_51_1.time_ < var_54_7 + var_54_9 + arg_54_0 and arg_51_1.var_.characterEffect10036 then
				arg_51_1.var_.characterEffect10036.alpha = 0
			end

			local var_54_12 = manager.ui.mainCamera.transform
			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1.var_.shakeOldPos = var_54_12.localPosition
			end

			local var_54_14 = 2

			if var_54_13 <= arg_51_1.time_ and arg_51_1.time_ < var_54_13 + var_54_14 then
				local var_54_15 = (arg_51_1.time_ - var_54_13) / 0.066
				local var_54_16, var_54_17 = math.modf(var_54_15)

				var_54_12.localPosition = Vector3.New(var_54_17 * 0.13, var_54_17 * 0.13, var_54_17 * 0.13) + arg_51_1.var_.shakeOldPos
			end

			if arg_51_1.time_ >= var_54_13 + var_54_14 and arg_51_1.time_ < var_54_13 + var_54_14 + arg_54_0 then
				var_54_12.localPosition = arg_51_1.var_.shakeOldPos
			end

			local var_54_18 = 0
			local var_54_19 = 1

			if var_54_18 < arg_51_1.time_ and arg_51_1.time_ <= var_54_18 + arg_54_0 then
				local var_54_20 = "play"
				local var_54_21 = "effect"

				arg_51_1:AudioAction(var_54_20, var_54_21, "se_story_17", "se_story_17_boss_hawk1", "")
			end

			local var_54_22 = 0
			local var_54_23 = 0.825

			if var_54_22 < arg_51_1.time_ and arg_51_1.time_ <= var_54_22 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_24 = arg_51_1:GetWordFromCfg(117102013)
				local var_54_25 = arg_51_1:FormatText(var_54_24.content)

				arg_51_1.text_.text = var_54_25

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_26 = 33
				local var_54_27 = utf8.len(var_54_25)
				local var_54_28 = var_54_26 <= 0 and var_54_23 or var_54_23 * (var_54_27 / var_54_26)

				if var_54_28 > 0 and var_54_23 < var_54_28 then
					arg_51_1.talkMaxDuration = var_54_28

					if var_54_28 + var_54_22 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_22
					end
				end

				arg_51_1.text_.text = var_54_25
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_29 = math.max(var_54_23, arg_51_1.talkMaxDuration)

			if var_54_22 <= arg_51_1.time_ and arg_51_1.time_ < var_54_22 + var_54_29 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_22) / var_54_29

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_22 + var_54_29 and arg_51_1.time_ < var_54_22 + var_54_29 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I08"
	},
	voices = {
		"story_v_out_117102.awb"
	}
}
