return {
	Play410082001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410082001
		arg_1_1.duration_ = 8.8

		local var_1_0 = {
			zh = 5.5,
			ja = 8.8
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
				arg_1_0:Play410082002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "L01f"

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
				local var_4_5 = arg_1_1.bgs_.L01f

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
					if iter_4_0 ~= "L01f" then
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

				arg_1_1:CheckSpriteTmpPos("1060", 2)

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
				local var_4_30 = Vector3.New(-390, -435, -40)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1060, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_4_31 = "10062"

			if arg_1_1.actors_[var_4_31] == nil then
				local var_4_32 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_31), arg_1_1.canvasGo_.transform)

				var_4_32.transform:SetSiblingIndex(1)

				var_4_32.name = var_4_31
				var_4_32.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_31] = var_4_32
			end

			local var_4_33 = arg_1_1.actors_["10062"].transform
			local var_4_34 = 2

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.var_.moveOldPos10062 = var_4_33.localPosition
				var_4_33.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10062", 4)

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
				local var_4_39 = Vector3.New(370, -390, -290)

				var_4_33.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10062, var_4_39, var_4_38)
			end

			if arg_1_1.time_ >= var_4_34 + var_4_37 and arg_1_1.time_ < var_4_34 + var_4_37 + arg_4_0 then
				var_4_33.localPosition = Vector3.New(370, -390, -290)
			end

			local var_4_40 = arg_1_1.actors_["1060"]
			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 and arg_1_1.var_.actorSpriteComps1060 == nil then
				arg_1_1.var_.actorSpriteComps1060 = var_4_40:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_42 = 0.034

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42

				if arg_1_1.var_.actorSpriteComps1060 then
					for iter_4_4, iter_4_5 in pairs(arg_1_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_4_5 then
							local var_4_44 = Mathf.Lerp(iter_4_5.color.r, 1, var_4_43)

							iter_4_5.color = Color.New(var_4_44, var_4_44, var_4_44)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 and arg_1_1.var_.actorSpriteComps1060 then
				local var_4_45 = 1

				for iter_4_6, iter_4_7 in pairs(arg_1_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_4_7 then
						iter_4_7.color = Color.New(var_4_45, var_4_45, var_4_45)
					end
				end

				arg_1_1.var_.actorSpriteComps1060 = nil
			end

			local var_4_46 = arg_1_1.actors_["10062"]
			local var_4_47 = 2

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 and arg_1_1.var_.actorSpriteComps10062 == nil then
				arg_1_1.var_.actorSpriteComps10062 = var_4_46:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_48 = 0.034

			if var_4_47 <= arg_1_1.time_ and arg_1_1.time_ < var_4_47 + var_4_48 then
				local var_4_49 = (arg_1_1.time_ - var_4_47) / var_4_48

				if arg_1_1.var_.actorSpriteComps10062 then
					for iter_4_8, iter_4_9 in pairs(arg_1_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_4_9 then
							local var_4_50 = Mathf.Lerp(iter_4_9.color.r, 0.5, var_4_49)

							iter_4_9.color = Color.New(var_4_50, var_4_50, var_4_50)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_47 + var_4_48 and arg_1_1.time_ < var_4_47 + var_4_48 + arg_4_0 and arg_1_1.var_.actorSpriteComps10062 then
				local var_4_51 = 0.5

				for iter_4_10, iter_4_11 in pairs(arg_1_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_4_11 then
						iter_4_11.color = Color.New(var_4_51, var_4_51, var_4_51)
					end
				end

				arg_1_1.var_.actorSpriteComps10062 = nil
			end

			local var_4_52 = 0
			local var_4_53 = 1

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				local var_4_54 = "play"
				local var_4_55 = "music"

				arg_1_1:AudioAction(var_4_54, var_4_55, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_56 = 1.56666666666667
			local var_4_57 = 1

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				local var_4_58 = "play"
				local var_4_59 = "music"

				arg_1_1:AudioAction(var_4_58, var_4_59, "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_60 = 2
			local var_4_61 = 0.35

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

				local var_4_63 = arg_1_1:FormatText(StoryNameCfg[584].name)

				arg_1_1.leftNameTxt_.text = var_4_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_64 = arg_1_1:GetWordFromCfg(410082001)
				local var_4_65 = arg_1_1:FormatText(var_4_64.content)

				arg_1_1.text_.text = var_4_65

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_66 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082001", "story_v_out_410082.awb") ~= 0 then
					local var_4_69 = manager.audio:GetVoiceLength("story_v_out_410082", "410082001", "story_v_out_410082.awb") / 1000

					if var_4_69 + var_4_60 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_69 + var_4_60
					end

					if var_4_64.prefab_name ~= "" and arg_1_1.actors_[var_4_64.prefab_name] ~= nil then
						local var_4_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_64.prefab_name].transform, "story_v_out_410082", "410082001", "story_v_out_410082.awb")

						arg_1_1:RecordAudio("410082001", var_4_70)
						arg_1_1:RecordAudio("410082001", var_4_70)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410082", "410082001", "story_v_out_410082.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410082", "410082001", "story_v_out_410082.awb")
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
	Play410082002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410082002
		arg_7_1.duration_ = 10.633

		local var_7_0 = {
			zh = 5.1,
			ja = 10.633
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
				arg_7_0:Play410082003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["10062"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos10062 = var_10_0.localPosition
				var_10_0.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10062", 4)

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
				local var_10_6 = Vector3.New(370, -390, -290)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10062, var_10_6, var_10_5)
			end

			if arg_7_1.time_ >= var_10_1 + var_10_4 and arg_7_1.time_ < var_10_1 + var_10_4 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_10_7 = arg_7_1.actors_["10062"]
			local var_10_8 = 0

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 and arg_7_1.var_.actorSpriteComps10062 == nil then
				arg_7_1.var_.actorSpriteComps10062 = var_10_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_9 = 0.034

			if var_10_8 <= arg_7_1.time_ and arg_7_1.time_ < var_10_8 + var_10_9 then
				local var_10_10 = (arg_7_1.time_ - var_10_8) / var_10_9

				if arg_7_1.var_.actorSpriteComps10062 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_10_2 then
							local var_10_11 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_10)

							iter_10_2.color = Color.New(var_10_11, var_10_11, var_10_11)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_8 + var_10_9 and arg_7_1.time_ < var_10_8 + var_10_9 + arg_10_0 and arg_7_1.var_.actorSpriteComps10062 then
				local var_10_12 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_12, var_10_12, var_10_12)
					end
				end

				arg_7_1.var_.actorSpriteComps10062 = nil
			end

			local var_10_13 = arg_7_1.actors_["1060"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.actorSpriteComps1060 == nil then
				arg_7_1.var_.actorSpriteComps1060 = var_10_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_15 = 0.034

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.actorSpriteComps1060 then
					for iter_10_5, iter_10_6 in pairs(arg_7_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_10_6 then
							local var_10_17 = Mathf.Lerp(iter_10_6.color.r, 0.5, var_10_16)

							iter_10_6.color = Color.New(var_10_17, var_10_17, var_10_17)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.actorSpriteComps1060 then
				local var_10_18 = 0.5

				for iter_10_7, iter_10_8 in pairs(arg_7_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_10_8 then
						iter_10_8.color = Color.New(var_10_18, var_10_18, var_10_18)
					end
				end

				arg_7_1.var_.actorSpriteComps1060 = nil
			end

			local var_10_19 = 0
			local var_10_20 = 0.5

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[600].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(410082002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082002", "story_v_out_410082.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082002", "story_v_out_410082.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_410082", "410082002", "story_v_out_410082.awb")

						arg_7_1:RecordAudio("410082002", var_10_28)
						arg_7_1:RecordAudio("410082002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410082", "410082002", "story_v_out_410082.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410082", "410082002", "story_v_out_410082.awb")
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
	Play410082003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410082003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play410082004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10062"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.actorSpriteComps10062 == nil then
				arg_11_1.var_.actorSpriteComps10062 = var_14_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_2 = 0.034

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.actorSpriteComps10062 then
					for iter_14_0, iter_14_1 in pairs(arg_11_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_14_1 then
							local var_14_4 = Mathf.Lerp(iter_14_1.color.r, 0.5, var_14_3)

							iter_14_1.color = Color.New(var_14_4, var_14_4, var_14_4)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.actorSpriteComps10062 then
				local var_14_5 = 0.5

				for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_14_3 then
						iter_14_3.color = Color.New(var_14_5, var_14_5, var_14_5)
					end
				end

				arg_11_1.var_.actorSpriteComps10062 = nil
			end

			local var_14_6 = arg_11_1.actors_["1060"].transform
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.var_.moveOldPos1060 = var_14_6.localPosition
				var_14_6.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("1060", 7)

				local var_14_8 = var_14_6.childCount

				for iter_14_4 = 0, var_14_8 - 1 do
					local var_14_9 = var_14_6:GetChild(iter_14_4)

					if var_14_9.name == "" or not string.find(var_14_9.name, "split") then
						var_14_9.gameObject:SetActive(true)
					else
						var_14_9.gameObject:SetActive(false)
					end
				end
			end

			local var_14_10 = 0.001

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_7) / var_14_10
				local var_14_12 = Vector3.New(0, -2000, -40)

				var_14_6.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1060, var_14_12, var_14_11)
			end

			if arg_11_1.time_ >= var_14_7 + var_14_10 and arg_11_1.time_ < var_14_7 + var_14_10 + arg_14_0 then
				var_14_6.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_14_13 = arg_11_1.actors_["10062"].transform
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1.var_.moveOldPos10062 = var_14_13.localPosition
				var_14_13.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10062", 7)

				local var_14_15 = var_14_13.childCount

				for iter_14_5 = 0, var_14_15 - 1 do
					local var_14_16 = var_14_13:GetChild(iter_14_5)

					if var_14_16.name == "" or not string.find(var_14_16.name, "split") then
						var_14_16.gameObject:SetActive(true)
					else
						var_14_16.gameObject:SetActive(false)
					end
				end
			end

			local var_14_17 = 0.001

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_14) / var_14_17
				local var_14_19 = Vector3.New(0, -2000, -290)

				var_14_13.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10062, var_14_19, var_14_18)
			end

			if arg_11_1.time_ >= var_14_14 + var_14_17 and arg_11_1.time_ < var_14_14 + var_14_17 + arg_14_0 then
				var_14_13.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_14_20 = 0
			local var_14_21 = 1.575

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(410082003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 63
				local var_14_25 = utf8.len(var_14_23)
				local var_14_26 = var_14_24 <= 0 and var_14_21 or var_14_21 * (var_14_25 / var_14_24)

				if var_14_26 > 0 and var_14_21 < var_14_26 then
					arg_11_1.talkMaxDuration = var_14_26

					if var_14_26 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_26 + var_14_20
					end
				end

				arg_11_1.text_.text = var_14_23
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_27 = math.max(var_14_21, arg_11_1.talkMaxDuration)

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_27 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_20) / var_14_27

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_20 + var_14_27 and arg_11_1.time_ < var_14_20 + var_14_27 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play410082004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410082004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play410082005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.1

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

				local var_18_2 = arg_15_1:GetWordFromCfg(410082004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 44
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
	Play410082005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410082005
		arg_19_1.duration_ = 8.7

		local var_19_0 = {
			zh = 5.933,
			ja = 8.7
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
				arg_19_0:Play410082006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10062"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10062 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("10062", 4)

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
				local var_22_6 = Vector3.New(370, -390, -290)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10062, var_22_6, var_22_5)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_4 and arg_19_1.time_ < var_22_1 + var_22_4 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(370, -390, -290)
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

			local var_22_13 = arg_19_1.actors_["1060"].transform
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1.var_.moveOldPos1060 = var_22_13.localPosition
				var_22_13.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1060", 2)

				local var_22_15 = var_22_13.childCount

				for iter_22_5 = 0, var_22_15 - 1 do
					local var_22_16 = var_22_13:GetChild(iter_22_5)

					if var_22_16.name == "" or not string.find(var_22_16.name, "split") then
						var_22_16.gameObject:SetActive(true)
					else
						var_22_16.gameObject:SetActive(false)
					end
				end
			end

			local var_22_17 = 0.001

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_14) / var_22_17
				local var_22_19 = Vector3.New(-390, -435, -40)

				var_22_13.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1060, var_22_19, var_22_18)
			end

			if arg_19_1.time_ >= var_22_14 + var_22_17 and arg_19_1.time_ < var_22_14 + var_22_17 + arg_22_0 then
				var_22_13.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_22_20 = arg_19_1.actors_["1060"]
			local var_22_21 = 0

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 and arg_19_1.var_.actorSpriteComps1060 == nil then
				arg_19_1.var_.actorSpriteComps1060 = var_22_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_22 = 0.034

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_22 then
				local var_22_23 = (arg_19_1.time_ - var_22_21) / var_22_22

				if arg_19_1.var_.actorSpriteComps1060 then
					for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_22_7 then
							local var_22_24 = Mathf.Lerp(iter_22_7.color.r, 0.5, var_22_23)

							iter_22_7.color = Color.New(var_22_24, var_22_24, var_22_24)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_21 + var_22_22 and arg_19_1.time_ < var_22_21 + var_22_22 + arg_22_0 and arg_19_1.var_.actorSpriteComps1060 then
				local var_22_25 = 0.5

				for iter_22_8, iter_22_9 in pairs(arg_19_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_22_9 then
						iter_22_9.color = Color.New(var_22_25, var_22_25, var_22_25)
					end
				end

				arg_19_1.var_.actorSpriteComps1060 = nil
			end

			local var_22_26 = 0
			local var_22_27 = 0.45

			if var_22_26 < arg_19_1.time_ and arg_19_1.time_ <= var_22_26 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_28 = arg_19_1:FormatText(StoryNameCfg[600].name)

				arg_19_1.leftNameTxt_.text = var_22_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_29 = arg_19_1:GetWordFromCfg(410082005)
				local var_22_30 = arg_19_1:FormatText(var_22_29.content)

				arg_19_1.text_.text = var_22_30

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_31 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082005", "story_v_out_410082.awb") ~= 0 then
					local var_22_34 = manager.audio:GetVoiceLength("story_v_out_410082", "410082005", "story_v_out_410082.awb") / 1000

					if var_22_34 + var_22_26 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_34 + var_22_26
					end

					if var_22_29.prefab_name ~= "" and arg_19_1.actors_[var_22_29.prefab_name] ~= nil then
						local var_22_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_29.prefab_name].transform, "story_v_out_410082", "410082005", "story_v_out_410082.awb")

						arg_19_1:RecordAudio("410082005", var_22_35)
						arg_19_1:RecordAudio("410082005", var_22_35)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_410082", "410082005", "story_v_out_410082.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_410082", "410082005", "story_v_out_410082.awb")
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
	Play410082006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 410082006
		arg_23_1.duration_ = 7.333

		local var_23_0 = {
			zh = 4.9,
			ja = 7.333
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
				arg_23_0:Play410082007(arg_23_1)
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

			local var_26_13 = arg_23_1.actors_["10062"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.actorSpriteComps10062 == nil then
				arg_23_1.var_.actorSpriteComps10062 = var_26_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_15 = 0.034

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.actorSpriteComps10062 then
					for iter_26_5, iter_26_6 in pairs(arg_23_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_26_6 then
							local var_26_17 = Mathf.Lerp(iter_26_6.color.r, 0.5, var_26_16)

							iter_26_6.color = Color.New(var_26_17, var_26_17, var_26_17)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.actorSpriteComps10062 then
				local var_26_18 = 0.5

				for iter_26_7, iter_26_8 in pairs(arg_23_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_26_8 then
						iter_26_8.color = Color.New(var_26_18, var_26_18, var_26_18)
					end
				end

				arg_23_1.var_.actorSpriteComps10062 = nil
			end

			local var_26_19 = 0
			local var_26_20 = 0.5

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

				local var_26_22 = arg_23_1:GetWordFromCfg(410082006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082006", "story_v_out_410082.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082006", "story_v_out_410082.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_410082", "410082006", "story_v_out_410082.awb")

						arg_23_1:RecordAudio("410082006", var_26_28)
						arg_23_1:RecordAudio("410082006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_410082", "410082006", "story_v_out_410082.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_410082", "410082006", "story_v_out_410082.awb")
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
	Play410082007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 410082007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play410082008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1060"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1060 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("1060", 7)

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
				local var_30_6 = Vector3.New(0, -2000, -40)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1060, var_30_6, var_30_5)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_4 and arg_27_1.time_ < var_30_1 + var_30_4 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_30_7 = arg_27_1.actors_["10062"].transform
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 then
				arg_27_1.var_.moveOldPos10062 = var_30_7.localPosition
				var_30_7.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10062", 7)

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
				local var_30_13 = Vector3.New(0, -2000, -290)

				var_30_7.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10062, var_30_13, var_30_12)
			end

			if arg_27_1.time_ >= var_30_8 + var_30_11 and arg_27_1.time_ < var_30_8 + var_30_11 + arg_30_0 then
				var_30_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_30_14 = manager.ui.mainCamera.transform
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.var_.shakeOldPos = var_30_14.localPosition
			end

			local var_30_16 = 0.5

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / 0.066
				local var_30_18, var_30_19 = math.modf(var_30_17)

				var_30_14.localPosition = Vector3.New(var_30_19 * 0.13, var_30_19 * 0.13, var_30_19 * 0.13) + arg_27_1.var_.shakeOldPos
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 then
				var_30_14.localPosition = arg_27_1.var_.shakeOldPos
			end

			local var_30_20 = 0
			local var_30_21 = 1

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				local var_30_22 = "play"
				local var_30_23 = "effect"

				arg_27_1:AudioAction(var_30_22, var_30_23, "se_story_122_03", "se_story_122_03_hit", "")
			end

			local var_30_24 = 0
			local var_30_25 = 1.375

			if var_30_24 < arg_27_1.time_ and arg_27_1.time_ <= var_30_24 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_26 = arg_27_1:GetWordFromCfg(410082007)
				local var_30_27 = arg_27_1:FormatText(var_30_26.content)

				arg_27_1.text_.text = var_30_27

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_28 = 55
				local var_30_29 = utf8.len(var_30_27)
				local var_30_30 = var_30_28 <= 0 and var_30_25 or var_30_25 * (var_30_29 / var_30_28)

				if var_30_30 > 0 and var_30_25 < var_30_30 then
					arg_27_1.talkMaxDuration = var_30_30

					if var_30_30 + var_30_24 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_30 + var_30_24
					end
				end

				arg_27_1.text_.text = var_30_27
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_31 = math.max(var_30_25, arg_27_1.talkMaxDuration)

			if var_30_24 <= arg_27_1.time_ and arg_27_1.time_ < var_30_24 + var_30_31 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_24) / var_30_31

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_24 + var_30_31 and arg_27_1.time_ < var_30_24 + var_30_31 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play410082008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 410082008
		arg_31_1.duration_ = 3.833

		local var_31_0 = {
			zh = 3.833,
			ja = 3.733
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
				arg_31_0:Play410082009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1060"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1060 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1060", 3)

				local var_34_2 = var_34_0.childCount

				for iter_34_0 = 0, var_34_2 - 1 do
					local var_34_3 = var_34_0:GetChild(iter_34_0)

					if var_34_3.name == "split_3" or not string.find(var_34_3.name, "split") then
						var_34_3.gameObject:SetActive(true)
					else
						var_34_3.gameObject:SetActive(false)
					end
				end
			end

			local var_34_4 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_4 then
				local var_34_5 = (arg_31_1.time_ - var_34_1) / var_34_4
				local var_34_6 = Vector3.New(0, -435, -40)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1060, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_34_7 = arg_31_1.actors_["1060"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 == nil then
				arg_31_1.var_.actorSpriteComps1060 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.034

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps1060 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1060 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1060 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.325

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[584].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(410082008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082008", "story_v_out_410082.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_410082", "410082008", "story_v_out_410082.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_410082", "410082008", "story_v_out_410082.awb")

						arg_31_1:RecordAudio("410082008", var_34_22)
						arg_31_1:RecordAudio("410082008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_410082", "410082008", "story_v_out_410082.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_410082", "410082008", "story_v_out_410082.awb")
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
	Play410082009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 410082009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play410082010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1060"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1060 = var_38_0.localPosition
				var_38_0.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("1060", 7)

				local var_38_2 = var_38_0.childCount

				for iter_38_0 = 0, var_38_2 - 1 do
					local var_38_3 = var_38_0:GetChild(iter_38_0)

					if var_38_3.name == "split_3" or not string.find(var_38_3.name, "split") then
						var_38_3.gameObject:SetActive(true)
					else
						var_38_3.gameObject:SetActive(false)
					end
				end
			end

			local var_38_4 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_4 then
				local var_38_5 = (arg_35_1.time_ - var_38_1) / var_38_4
				local var_38_6 = Vector3.New(0, -2000, -40)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1060, var_38_6, var_38_5)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_4 and arg_35_1.time_ < var_38_1 + var_38_4 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_38_7 = 0
			local var_38_8 = 0.925

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(410082009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 37
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_8 or var_38_8 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_8 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_7 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_7
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_8, arg_35_1.talkMaxDuration)

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_7) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_7 + var_38_14 and arg_35_1.time_ < var_38_7 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play410082010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 410082010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play410082011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.6

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

				local var_42_2 = arg_39_1:GetWordFromCfg(410082010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 24
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
	Play410082011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410082011
		arg_43_1.duration_ = 4.5

		local var_43_0 = {
			zh = 2.1,
			ja = 4.5
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
				arg_43_0:Play410082012(arg_43_1)
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
			local var_46_14 = 0.125

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

				local var_46_16 = arg_43_1:GetWordFromCfg(410082011)
				local var_46_17 = arg_43_1:FormatText(var_46_16.content)

				arg_43_1.text_.text = var_46_17

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_18 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082011", "story_v_out_410082.awb") ~= 0 then
					local var_46_21 = manager.audio:GetVoiceLength("story_v_out_410082", "410082011", "story_v_out_410082.awb") / 1000

					if var_46_21 + var_46_13 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_21 + var_46_13
					end

					if var_46_16.prefab_name ~= "" and arg_43_1.actors_[var_46_16.prefab_name] ~= nil then
						local var_46_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_16.prefab_name].transform, "story_v_out_410082", "410082011", "story_v_out_410082.awb")

						arg_43_1:RecordAudio("410082011", var_46_22)
						arg_43_1:RecordAudio("410082011", var_46_22)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_410082", "410082011", "story_v_out_410082.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_410082", "410082011", "story_v_out_410082.awb")
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
	Play410082012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410082012
		arg_47_1.duration_ = 7.333

		local var_47_0 = {
			zh = 3.9,
			ja = 7.333
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
				arg_47_0:Play410082013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1060"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1060 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1060", 2)

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
				local var_50_6 = Vector3.New(-390, -435, -40)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1060, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-390, -435, -40)
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

			local var_50_13 = arg_47_1.actors_["10062"].transform
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1.var_.moveOldPos10062 = var_50_13.localPosition
				var_50_13.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("10062", 4)

				local var_50_15 = var_50_13.childCount

				for iter_50_5 = 0, var_50_15 - 1 do
					local var_50_16 = var_50_13:GetChild(iter_50_5)

					if var_50_16.name == "" or not string.find(var_50_16.name, "split") then
						var_50_16.gameObject:SetActive(true)
					else
						var_50_16.gameObject:SetActive(false)
					end
				end
			end

			local var_50_17 = 0.001

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_14) / var_50_17
				local var_50_19 = Vector3.New(370, -390, -290)

				var_50_13.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10062, var_50_19, var_50_18)
			end

			if arg_47_1.time_ >= var_50_14 + var_50_17 and arg_47_1.time_ < var_50_14 + var_50_17 + arg_50_0 then
				var_50_13.localPosition = Vector3.New(370, -390, -290)
			end

			local var_50_20 = arg_47_1.actors_["10062"]
			local var_50_21 = 0

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 == nil then
				arg_47_1.var_.actorSpriteComps10062 = var_50_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_22 = 0.034

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22

				if arg_47_1.var_.actorSpriteComps10062 then
					for iter_50_6, iter_50_7 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_50_7 then
							local var_50_24 = Mathf.Lerp(iter_50_7.color.r, 0.5, var_50_23)

							iter_50_7.color = Color.New(var_50_24, var_50_24, var_50_24)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 then
				local var_50_25 = 0.5

				for iter_50_8, iter_50_9 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_50_9 then
						iter_50_9.color = Color.New(var_50_25, var_50_25, var_50_25)
					end
				end

				arg_47_1.var_.actorSpriteComps10062 = nil
			end

			local var_50_26 = 0
			local var_50_27 = 0.275

			if var_50_26 < arg_47_1.time_ and arg_47_1.time_ <= var_50_26 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_28 = arg_47_1:FormatText(StoryNameCfg[584].name)

				arg_47_1.leftNameTxt_.text = var_50_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_29 = arg_47_1:GetWordFromCfg(410082012)
				local var_50_30 = arg_47_1:FormatText(var_50_29.content)

				arg_47_1.text_.text = var_50_30

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_31 = 11
				local var_50_32 = utf8.len(var_50_30)
				local var_50_33 = var_50_31 <= 0 and var_50_27 or var_50_27 * (var_50_32 / var_50_31)

				if var_50_33 > 0 and var_50_27 < var_50_33 then
					arg_47_1.talkMaxDuration = var_50_33

					if var_50_33 + var_50_26 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_33 + var_50_26
					end
				end

				arg_47_1.text_.text = var_50_30
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082012", "story_v_out_410082.awb") ~= 0 then
					local var_50_34 = manager.audio:GetVoiceLength("story_v_out_410082", "410082012", "story_v_out_410082.awb") / 1000

					if var_50_34 + var_50_26 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_34 + var_50_26
					end

					if var_50_29.prefab_name ~= "" and arg_47_1.actors_[var_50_29.prefab_name] ~= nil then
						local var_50_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_29.prefab_name].transform, "story_v_out_410082", "410082012", "story_v_out_410082.awb")

						arg_47_1:RecordAudio("410082012", var_50_35)
						arg_47_1:RecordAudio("410082012", var_50_35)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410082", "410082012", "story_v_out_410082.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410082", "410082012", "story_v_out_410082.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_36 = math.max(var_50_27, arg_47_1.talkMaxDuration)

			if var_50_26 <= arg_47_1.time_ and arg_47_1.time_ < var_50_26 + var_50_36 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_26) / var_50_36

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_26 + var_50_36 and arg_47_1.time_ < var_50_26 + var_50_36 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410082013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410082013
		arg_51_1.duration_ = 7.933

		local var_51_0 = {
			zh = 4.333,
			ja = 7.933
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
				arg_51_0:Play410082014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10062"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10062 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10062", 4)

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
				local var_54_6 = Vector3.New(370, -390, -290)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10062, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_54_7 = arg_51_1.actors_["10062"]
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 == nil then
				arg_51_1.var_.actorSpriteComps10062 = var_54_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_9 = 0.034

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_8) / var_54_9

				if arg_51_1.var_.actorSpriteComps10062 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_54_2 then
							local var_54_11 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_10)

							iter_54_2.color = Color.New(var_54_11, var_54_11, var_54_11)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_8 + var_54_9 and arg_51_1.time_ < var_54_8 + var_54_9 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 then
				local var_54_12 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_12, var_54_12, var_54_12)
					end
				end

				arg_51_1.var_.actorSpriteComps10062 = nil
			end

			local var_54_13 = arg_51_1.actors_["1060"]
			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 == nil then
				arg_51_1.var_.actorSpriteComps1060 = var_54_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_15 = 0.034

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15

				if arg_51_1.var_.actorSpriteComps1060 then
					for iter_54_5, iter_54_6 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_54_6 then
							local var_54_17 = Mathf.Lerp(iter_54_6.color.r, 0.5, var_54_16)

							iter_54_6.color = Color.New(var_54_17, var_54_17, var_54_17)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 then
				local var_54_18 = 0.5

				for iter_54_7, iter_54_8 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_54_8 then
						iter_54_8.color = Color.New(var_54_18, var_54_18, var_54_18)
					end
				end

				arg_51_1.var_.actorSpriteComps1060 = nil
			end

			local var_54_19 = 0
			local var_54_20 = 0.375

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_21 = arg_51_1:FormatText(StoryNameCfg[600].name)

				arg_51_1.leftNameTxt_.text = var_54_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_22 = arg_51_1:GetWordFromCfg(410082013)
				local var_54_23 = arg_51_1:FormatText(var_54_22.content)

				arg_51_1.text_.text = var_54_23

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082013", "story_v_out_410082.awb") ~= 0 then
					local var_54_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082013", "story_v_out_410082.awb") / 1000

					if var_54_27 + var_54_19 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_19
					end

					if var_54_22.prefab_name ~= "" and arg_51_1.actors_[var_54_22.prefab_name] ~= nil then
						local var_54_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_22.prefab_name].transform, "story_v_out_410082", "410082013", "story_v_out_410082.awb")

						arg_51_1:RecordAudio("410082013", var_54_28)
						arg_51_1:RecordAudio("410082013", var_54_28)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410082", "410082013", "story_v_out_410082.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410082", "410082013", "story_v_out_410082.awb")
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
	Play410082014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410082014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410082015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1060"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1060 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1060", 7)

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
				local var_58_6 = Vector3.New(0, -2000, -40)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1060, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_58_7 = arg_55_1.actors_["10062"].transform
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 then
				arg_55_1.var_.moveOldPos10062 = var_58_7.localPosition
				var_58_7.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10062", 7)

				local var_58_9 = var_58_7.childCount

				for iter_58_1 = 0, var_58_9 - 1 do
					local var_58_10 = var_58_7:GetChild(iter_58_1)

					if var_58_10.name == "" or not string.find(var_58_10.name, "split") then
						var_58_10.gameObject:SetActive(true)
					else
						var_58_10.gameObject:SetActive(false)
					end
				end
			end

			local var_58_11 = 0.001

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_8) / var_58_11
				local var_58_13 = Vector3.New(0, -2000, -290)

				var_58_7.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10062, var_58_13, var_58_12)
			end

			if arg_55_1.time_ >= var_58_8 + var_58_11 and arg_55_1.time_ < var_58_8 + var_58_11 + arg_58_0 then
				var_58_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_58_14 = 0
			local var_58_15 = 1.225

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_16 = arg_55_1:GetWordFromCfg(410082014)
				local var_58_17 = arg_55_1:FormatText(var_58_16.content)

				arg_55_1.text_.text = var_58_17

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_18 = 49
				local var_58_19 = utf8.len(var_58_17)
				local var_58_20 = var_58_18 <= 0 and var_58_15 or var_58_15 * (var_58_19 / var_58_18)

				if var_58_20 > 0 and var_58_15 < var_58_20 then
					arg_55_1.talkMaxDuration = var_58_20

					if var_58_20 + var_58_14 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_14
					end
				end

				arg_55_1.text_.text = var_58_17
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_21 = math.max(var_58_15, arg_55_1.talkMaxDuration)

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_21 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_14) / var_58_21

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_14 + var_58_21 and arg_55_1.time_ < var_58_14 + var_58_21 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410082015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410082015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play410082016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.025

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_2 = arg_59_1:GetWordFromCfg(410082015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 41
				local var_62_5 = utf8.len(var_62_3)
				local var_62_6 = var_62_4 <= 0 and var_62_1 or var_62_1 * (var_62_5 / var_62_4)

				if var_62_6 > 0 and var_62_1 < var_62_6 then
					arg_59_1.talkMaxDuration = var_62_6

					if var_62_6 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_6 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_3
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_7 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_7 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_7

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_7 and arg_59_1.time_ < var_62_0 + var_62_7 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410082016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410082016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play410082017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1.375

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

				local var_66_2 = arg_63_1:GetWordFromCfg(410082016)
				local var_66_3 = arg_63_1:FormatText(var_66_2.content)

				arg_63_1.text_.text = var_66_3

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_4 = 55
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
	Play410082017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410082017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play410082018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1.3

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_2 = arg_67_1:GetWordFromCfg(410082017)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 52
				local var_70_5 = utf8.len(var_70_3)
				local var_70_6 = var_70_4 <= 0 and var_70_1 or var_70_1 * (var_70_5 / var_70_4)

				if var_70_6 > 0 and var_70_1 < var_70_6 then
					arg_67_1.talkMaxDuration = var_70_6

					if var_70_6 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_6 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_3
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_7 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_7 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_7

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_7 and arg_67_1.time_ < var_70_0 + var_70_7 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410082018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410082018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play410082019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_1 = 0.5

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_1 then
				local var_74_2 = (arg_71_1.time_ - var_74_0) / var_74_1
				local var_74_3 = Color.New(1, 1, 1)

				var_74_3.a = Mathf.Lerp(1, 0, var_74_2)
				arg_71_1.mask_.color = var_74_3
			end

			if arg_71_1.time_ >= var_74_0 + var_74_1 and arg_71_1.time_ < var_74_0 + var_74_1 + arg_74_0 then
				local var_74_4 = Color.New(1, 1, 1)
				local var_74_5 = 0

				arg_71_1.mask_.enabled = false
				var_74_4.a = var_74_5
				arg_71_1.mask_.color = var_74_4
			end

			local var_74_6 = manager.ui.mainCamera.transform
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 then
				arg_71_1.var_.shakeOldPos = var_74_6.localPosition
			end

			local var_74_8 = 1

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / 0.066
				local var_74_10, var_74_11 = math.modf(var_74_9)

				var_74_6.localPosition = Vector3.New(var_74_11 * 0.13, var_74_11 * 0.13, var_74_11 * 0.13) + arg_71_1.var_.shakeOldPos
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 then
				var_74_6.localPosition = arg_71_1.var_.shakeOldPos
			end

			local var_74_12 = 0
			local var_74_13 = 1

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				local var_74_14 = "play"
				local var_74_15 = "effect"

				arg_71_1:AudioAction(var_74_14, var_74_15, "se_story_126_01", "se_story_126_01_whoosh", "")
			end

			local var_74_16 = 0
			local var_74_17 = 1.525

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_18 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_18:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_19 = arg_71_1:GetWordFromCfg(410082018)
				local var_74_20 = arg_71_1:FormatText(var_74_19.content)

				arg_71_1.text_.text = var_74_20

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_21 = 61
				local var_74_22 = utf8.len(var_74_20)
				local var_74_23 = var_74_21 <= 0 and var_74_17 or var_74_17 * (var_74_22 / var_74_21)

				if var_74_23 > 0 and var_74_17 < var_74_23 then
					arg_71_1.talkMaxDuration = var_74_23
					var_74_16 = var_74_16 + 0.3

					if var_74_23 + var_74_16 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_23 + var_74_16
					end
				end

				arg_71_1.text_.text = var_74_20
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_24 = var_74_16 + 0.3
			local var_74_25 = math.max(var_74_17, arg_71_1.talkMaxDuration)

			if var_74_24 <= arg_71_1.time_ and arg_71_1.time_ < var_74_24 + var_74_25 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_24) / var_74_25

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_24 + var_74_25 and arg_71_1.time_ < var_74_24 + var_74_25 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410082019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 410082019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play410082020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.85

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

				local var_80_2 = arg_77_1:GetWordFromCfg(410082019)
				local var_80_3 = arg_77_1:FormatText(var_80_2.content)

				arg_77_1.text_.text = var_80_3

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_4 = 34
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
	Play410082020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 410082020
		arg_81_1.duration_ = 13.466

		local var_81_0 = {
			zh = 4.6,
			ja = 13.466
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
				arg_81_0:Play410082021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10062"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos10062 = var_84_0.localPosition
				var_84_0.localScale = Vector3.New(1, 1, 1)

				arg_81_1:CheckSpriteTmpPos("10062", 3)

				local var_84_2 = var_84_0.childCount

				for iter_84_0 = 0, var_84_2 - 1 do
					local var_84_3 = var_84_0:GetChild(iter_84_0)

					if var_84_3.name == "split_1_1" or not string.find(var_84_3.name, "split") then
						var_84_3.gameObject:SetActive(true)
					else
						var_84_3.gameObject:SetActive(false)
					end
				end
			end

			local var_84_4 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_1) / var_84_4
				local var_84_6 = Vector3.New(0, -390, -290)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10062, var_84_6, var_84_5)
			end

			if arg_81_1.time_ >= var_84_1 + var_84_4 and arg_81_1.time_ < var_84_1 + var_84_4 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_84_7 = arg_81_1.actors_["10062"]
			local var_84_8 = 0

			if var_84_8 < arg_81_1.time_ and arg_81_1.time_ <= var_84_8 + arg_84_0 and arg_81_1.var_.actorSpriteComps10062 == nil then
				arg_81_1.var_.actorSpriteComps10062 = var_84_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_9 = 0.034

			if var_84_8 <= arg_81_1.time_ and arg_81_1.time_ < var_84_8 + var_84_9 then
				local var_84_10 = (arg_81_1.time_ - var_84_8) / var_84_9

				if arg_81_1.var_.actorSpriteComps10062 then
					for iter_84_1, iter_84_2 in pairs(arg_81_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_84_2 then
							local var_84_11 = Mathf.Lerp(iter_84_2.color.r, 1, var_84_10)

							iter_84_2.color = Color.New(var_84_11, var_84_11, var_84_11)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_8 + var_84_9 and arg_81_1.time_ < var_84_8 + var_84_9 + arg_84_0 and arg_81_1.var_.actorSpriteComps10062 then
				local var_84_12 = 1

				for iter_84_3, iter_84_4 in pairs(arg_81_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_84_4 then
						iter_84_4.color = Color.New(var_84_12, var_84_12, var_84_12)
					end
				end

				arg_81_1.var_.actorSpriteComps10062 = nil
			end

			local var_84_13 = 0
			local var_84_14 = 0.5

			if var_84_13 < arg_81_1.time_ and arg_81_1.time_ <= var_84_13 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_15 = arg_81_1:FormatText(StoryNameCfg[600].name)

				arg_81_1.leftNameTxt_.text = var_84_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_16 = arg_81_1:GetWordFromCfg(410082020)
				local var_84_17 = arg_81_1:FormatText(var_84_16.content)

				arg_81_1.text_.text = var_84_17

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_18 = 20
				local var_84_19 = utf8.len(var_84_17)
				local var_84_20 = var_84_18 <= 0 and var_84_14 or var_84_14 * (var_84_19 / var_84_18)

				if var_84_20 > 0 and var_84_14 < var_84_20 then
					arg_81_1.talkMaxDuration = var_84_20

					if var_84_20 + var_84_13 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_13
					end
				end

				arg_81_1.text_.text = var_84_17
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082020", "story_v_out_410082.awb") ~= 0 then
					local var_84_21 = manager.audio:GetVoiceLength("story_v_out_410082", "410082020", "story_v_out_410082.awb") / 1000

					if var_84_21 + var_84_13 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_21 + var_84_13
					end

					if var_84_16.prefab_name ~= "" and arg_81_1.actors_[var_84_16.prefab_name] ~= nil then
						local var_84_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_16.prefab_name].transform, "story_v_out_410082", "410082020", "story_v_out_410082.awb")

						arg_81_1:RecordAudio("410082020", var_84_22)
						arg_81_1:RecordAudio("410082020", var_84_22)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_410082", "410082020", "story_v_out_410082.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_410082", "410082020", "story_v_out_410082.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_23 = math.max(var_84_14, arg_81_1.talkMaxDuration)

			if var_84_13 <= arg_81_1.time_ and arg_81_1.time_ < var_84_13 + var_84_23 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_13) / var_84_23

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_13 + var_84_23 and arg_81_1.time_ < var_84_13 + var_84_23 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play410082021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 410082021
		arg_85_1.duration_ = 8.633

		local var_85_0 = {
			zh = 6.533,
			ja = 8.633
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
				arg_85_0:Play410082022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1060"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos1060 = var_88_0.localPosition
				var_88_0.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("1060", 2)

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
				local var_88_6 = Vector3.New(-390, -435, -40)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1060, var_88_6, var_88_5)
			end

			if arg_85_1.time_ >= var_88_1 + var_88_4 and arg_85_1.time_ < var_88_1 + var_88_4 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_88_7 = arg_85_1.actors_["1060"]
			local var_88_8 = 0

			if var_88_8 < arg_85_1.time_ and arg_85_1.time_ <= var_88_8 + arg_88_0 and arg_85_1.var_.actorSpriteComps1060 == nil then
				arg_85_1.var_.actorSpriteComps1060 = var_88_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_9 = 0.034

			if var_88_8 <= arg_85_1.time_ and arg_85_1.time_ < var_88_8 + var_88_9 then
				local var_88_10 = (arg_85_1.time_ - var_88_8) / var_88_9

				if arg_85_1.var_.actorSpriteComps1060 then
					for iter_88_1, iter_88_2 in pairs(arg_85_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_88_2 then
							local var_88_11 = Mathf.Lerp(iter_88_2.color.r, 1, var_88_10)

							iter_88_2.color = Color.New(var_88_11, var_88_11, var_88_11)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_8 + var_88_9 and arg_85_1.time_ < var_88_8 + var_88_9 + arg_88_0 and arg_85_1.var_.actorSpriteComps1060 then
				local var_88_12 = 1

				for iter_88_3, iter_88_4 in pairs(arg_85_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_88_4 then
						iter_88_4.color = Color.New(var_88_12, var_88_12, var_88_12)
					end
				end

				arg_85_1.var_.actorSpriteComps1060 = nil
			end

			local var_88_13 = arg_85_1.actors_["10062"].transform
			local var_88_14 = 0

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 then
				arg_85_1.var_.moveOldPos10062 = var_88_13.localPosition
				var_88_13.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("10062", 4)

				local var_88_15 = var_88_13.childCount

				for iter_88_5 = 0, var_88_15 - 1 do
					local var_88_16 = var_88_13:GetChild(iter_88_5)

					if var_88_16.name == "split_1_1" or not string.find(var_88_16.name, "split") then
						var_88_16.gameObject:SetActive(true)
					else
						var_88_16.gameObject:SetActive(false)
					end
				end
			end

			local var_88_17 = 0.001

			if var_88_14 <= arg_85_1.time_ and arg_85_1.time_ < var_88_14 + var_88_17 then
				local var_88_18 = (arg_85_1.time_ - var_88_14) / var_88_17
				local var_88_19 = Vector3.New(370, -390, -290)

				var_88_13.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10062, var_88_19, var_88_18)
			end

			if arg_85_1.time_ >= var_88_14 + var_88_17 and arg_85_1.time_ < var_88_14 + var_88_17 + arg_88_0 then
				var_88_13.localPosition = Vector3.New(370, -390, -290)
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
							local var_88_24 = Mathf.Lerp(iter_88_7.color.r, 0.5, var_88_23)

							iter_88_7.color = Color.New(var_88_24, var_88_24, var_88_24)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_21 + var_88_22 and arg_85_1.time_ < var_88_21 + var_88_22 + arg_88_0 and arg_85_1.var_.actorSpriteComps10062 then
				local var_88_25 = 0.5

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

				local var_88_28 = arg_85_1:FormatText(StoryNameCfg[584].name)

				arg_85_1.leftNameTxt_.text = var_88_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_29 = arg_85_1:GetWordFromCfg(410082021)
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082021", "story_v_out_410082.awb") ~= 0 then
					local var_88_34 = manager.audio:GetVoiceLength("story_v_out_410082", "410082021", "story_v_out_410082.awb") / 1000

					if var_88_34 + var_88_26 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_34 + var_88_26
					end

					if var_88_29.prefab_name ~= "" and arg_85_1.actors_[var_88_29.prefab_name] ~= nil then
						local var_88_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_29.prefab_name].transform, "story_v_out_410082", "410082021", "story_v_out_410082.awb")

						arg_85_1:RecordAudio("410082021", var_88_35)
						arg_85_1:RecordAudio("410082021", var_88_35)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_410082", "410082021", "story_v_out_410082.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_410082", "410082021", "story_v_out_410082.awb")
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
	Play410082022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 410082022
		arg_89_1.duration_ = 12.833

		local var_89_0 = {
			zh = 2.666,
			ja = 12.833
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
				arg_89_0:Play410082023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10062"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos10062 = var_92_0.localPosition
				var_92_0.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("10062", 4)

				local var_92_2 = var_92_0.childCount

				for iter_92_0 = 0, var_92_2 - 1 do
					local var_92_3 = var_92_0:GetChild(iter_92_0)

					if var_92_3.name == "split_5" or not string.find(var_92_3.name, "split") then
						var_92_3.gameObject:SetActive(true)
					else
						var_92_3.gameObject:SetActive(false)
					end
				end
			end

			local var_92_4 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_4 then
				local var_92_5 = (arg_89_1.time_ - var_92_1) / var_92_4
				local var_92_6 = Vector3.New(370, -390, -290)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10062, var_92_6, var_92_5)
			end

			if arg_89_1.time_ >= var_92_1 + var_92_4 and arg_89_1.time_ < var_92_1 + var_92_4 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_92_7 = arg_89_1.actors_["10062"]
			local var_92_8 = 0

			if var_92_8 < arg_89_1.time_ and arg_89_1.time_ <= var_92_8 + arg_92_0 and arg_89_1.var_.actorSpriteComps10062 == nil then
				arg_89_1.var_.actorSpriteComps10062 = var_92_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_9 = 0.034

			if var_92_8 <= arg_89_1.time_ and arg_89_1.time_ < var_92_8 + var_92_9 then
				local var_92_10 = (arg_89_1.time_ - var_92_8) / var_92_9

				if arg_89_1.var_.actorSpriteComps10062 then
					for iter_92_1, iter_92_2 in pairs(arg_89_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_92_2 then
							local var_92_11 = Mathf.Lerp(iter_92_2.color.r, 1, var_92_10)

							iter_92_2.color = Color.New(var_92_11, var_92_11, var_92_11)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_8 + var_92_9 and arg_89_1.time_ < var_92_8 + var_92_9 + arg_92_0 and arg_89_1.var_.actorSpriteComps10062 then
				local var_92_12 = 1

				for iter_92_3, iter_92_4 in pairs(arg_89_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_92_4 then
						iter_92_4.color = Color.New(var_92_12, var_92_12, var_92_12)
					end
				end

				arg_89_1.var_.actorSpriteComps10062 = nil
			end

			local var_92_13 = arg_89_1.actors_["1060"]
			local var_92_14 = 0

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 and arg_89_1.var_.actorSpriteComps1060 == nil then
				arg_89_1.var_.actorSpriteComps1060 = var_92_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_15 = 0.034

			if var_92_14 <= arg_89_1.time_ and arg_89_1.time_ < var_92_14 + var_92_15 then
				local var_92_16 = (arg_89_1.time_ - var_92_14) / var_92_15

				if arg_89_1.var_.actorSpriteComps1060 then
					for iter_92_5, iter_92_6 in pairs(arg_89_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_92_6 then
							local var_92_17 = Mathf.Lerp(iter_92_6.color.r, 0.5, var_92_16)

							iter_92_6.color = Color.New(var_92_17, var_92_17, var_92_17)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_14 + var_92_15 and arg_89_1.time_ < var_92_14 + var_92_15 + arg_92_0 and arg_89_1.var_.actorSpriteComps1060 then
				local var_92_18 = 0.5

				for iter_92_7, iter_92_8 in pairs(arg_89_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_92_8 then
						iter_92_8.color = Color.New(var_92_18, var_92_18, var_92_18)
					end
				end

				arg_89_1.var_.actorSpriteComps1060 = nil
			end

			local var_92_19 = 0
			local var_92_20 = 0.2

			if var_92_19 < arg_89_1.time_ and arg_89_1.time_ <= var_92_19 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_21 = arg_89_1:FormatText(StoryNameCfg[600].name)

				arg_89_1.leftNameTxt_.text = var_92_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_22 = arg_89_1:GetWordFromCfg(410082022)
				local var_92_23 = arg_89_1:FormatText(var_92_22.content)

				arg_89_1.text_.text = var_92_23

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_24 = 8
				local var_92_25 = utf8.len(var_92_23)
				local var_92_26 = var_92_24 <= 0 and var_92_20 or var_92_20 * (var_92_25 / var_92_24)

				if var_92_26 > 0 and var_92_20 < var_92_26 then
					arg_89_1.talkMaxDuration = var_92_26

					if var_92_26 + var_92_19 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_26 + var_92_19
					end
				end

				arg_89_1.text_.text = var_92_23
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082022", "story_v_out_410082.awb") ~= 0 then
					local var_92_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082022", "story_v_out_410082.awb") / 1000

					if var_92_27 + var_92_19 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_27 + var_92_19
					end

					if var_92_22.prefab_name ~= "" and arg_89_1.actors_[var_92_22.prefab_name] ~= nil then
						local var_92_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_22.prefab_name].transform, "story_v_out_410082", "410082022", "story_v_out_410082.awb")

						arg_89_1:RecordAudio("410082022", var_92_28)
						arg_89_1:RecordAudio("410082022", var_92_28)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_410082", "410082022", "story_v_out_410082.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_410082", "410082022", "story_v_out_410082.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_29 = math.max(var_92_20, arg_89_1.talkMaxDuration)

			if var_92_19 <= arg_89_1.time_ and arg_89_1.time_ < var_92_19 + var_92_29 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_19) / var_92_29

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_19 + var_92_29 and arg_89_1.time_ < var_92_19 + var_92_29 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play410082023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 410082023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play410082024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1060"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1060 = var_96_0.localPosition
				var_96_0.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("1060", 7)

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
				local var_96_6 = Vector3.New(0, -2000, -40)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1060, var_96_6, var_96_5)
			end

			if arg_93_1.time_ >= var_96_1 + var_96_4 and arg_93_1.time_ < var_96_1 + var_96_4 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_96_7 = arg_93_1.actors_["10062"].transform
			local var_96_8 = 0

			if var_96_8 < arg_93_1.time_ and arg_93_1.time_ <= var_96_8 + arg_96_0 then
				arg_93_1.var_.moveOldPos10062 = var_96_7.localPosition
				var_96_7.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("10062", 7)

				local var_96_9 = var_96_7.childCount

				for iter_96_1 = 0, var_96_9 - 1 do
					local var_96_10 = var_96_7:GetChild(iter_96_1)

					if var_96_10.name == "split_1_1" or not string.find(var_96_10.name, "split") then
						var_96_10.gameObject:SetActive(true)
					else
						var_96_10.gameObject:SetActive(false)
					end
				end
			end

			local var_96_11 = 0.001

			if var_96_8 <= arg_93_1.time_ and arg_93_1.time_ < var_96_8 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_8) / var_96_11
				local var_96_13 = Vector3.New(0, -2000, -290)

				var_96_7.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10062, var_96_13, var_96_12)
			end

			if arg_93_1.time_ >= var_96_8 + var_96_11 and arg_93_1.time_ < var_96_8 + var_96_11 + arg_96_0 then
				var_96_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_96_14 = 0
			local var_96_15 = 1.225

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_16 = arg_93_1:GetWordFromCfg(410082023)
				local var_96_17 = arg_93_1:FormatText(var_96_16.content)

				arg_93_1.text_.text = var_96_17

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_18 = 49
				local var_96_19 = utf8.len(var_96_17)
				local var_96_20 = var_96_18 <= 0 and var_96_15 or var_96_15 * (var_96_19 / var_96_18)

				if var_96_20 > 0 and var_96_15 < var_96_20 then
					arg_93_1.talkMaxDuration = var_96_20

					if var_96_20 + var_96_14 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_20 + var_96_14
					end
				end

				arg_93_1.text_.text = var_96_17
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_21 = math.max(var_96_15, arg_93_1.talkMaxDuration)

			if var_96_14 <= arg_93_1.time_ and arg_93_1.time_ < var_96_14 + var_96_21 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_14) / var_96_21

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_14 + var_96_21 and arg_93_1.time_ < var_96_14 + var_96_21 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play410082024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 410082024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play410082025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 1.675

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

				local var_100_2 = arg_97_1:GetWordFromCfg(410082024)
				local var_100_3 = arg_97_1:FormatText(var_100_2.content)

				arg_97_1.text_.text = var_100_3

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_4 = 67
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
	Play410082025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 410082025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play410082026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.975

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_2 = arg_101_1:GetWordFromCfg(410082025)
				local var_104_3 = arg_101_1:FormatText(var_104_2.content)

				arg_101_1.text_.text = var_104_3

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_4 = 39
				local var_104_5 = utf8.len(var_104_3)
				local var_104_6 = var_104_4 <= 0 and var_104_1 or var_104_1 * (var_104_5 / var_104_4)

				if var_104_6 > 0 and var_104_1 < var_104_6 then
					arg_101_1.talkMaxDuration = var_104_6

					if var_104_6 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_6 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_3
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_7 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_7 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_7

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_7 and arg_101_1.time_ < var_104_0 + var_104_7 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play410082026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 410082026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play410082027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 1.45

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_2 = arg_105_1:GetWordFromCfg(410082026)
				local var_108_3 = arg_105_1:FormatText(var_108_2.content)

				arg_105_1.text_.text = var_108_3

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_4 = 58
				local var_108_5 = utf8.len(var_108_3)
				local var_108_6 = var_108_4 <= 0 and var_108_1 or var_108_1 * (var_108_5 / var_108_4)

				if var_108_6 > 0 and var_108_1 < var_108_6 then
					arg_105_1.talkMaxDuration = var_108_6

					if var_108_6 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_6 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_3
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_7 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_7 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_7

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_7 and arg_105_1.time_ < var_108_0 + var_108_7 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play410082027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 410082027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play410082028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.875

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

				local var_112_2 = arg_109_1:GetWordFromCfg(410082027)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 35
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
	Play410082028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 410082028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play410082029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.mask_.enabled = true
				arg_113_1.mask_.raycastTarget = true

				arg_113_1:SetGaussion(false)
			end

			local var_116_1 = 0.5

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_1 then
				local var_116_2 = (arg_113_1.time_ - var_116_0) / var_116_1
				local var_116_3 = Color.New(1, 1, 1)

				var_116_3.a = Mathf.Lerp(1, 0, var_116_2)
				arg_113_1.mask_.color = var_116_3
			end

			if arg_113_1.time_ >= var_116_0 + var_116_1 and arg_113_1.time_ < var_116_0 + var_116_1 + arg_116_0 then
				local var_116_4 = Color.New(1, 1, 1)
				local var_116_5 = 0

				arg_113_1.mask_.enabled = false
				var_116_4.a = var_116_5
				arg_113_1.mask_.color = var_116_4
			end

			local var_116_6 = manager.ui.mainCamera.transform
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 then
				arg_113_1.var_.shakeOldPos = var_116_6.localPosition
			end

			local var_116_8 = 1

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / 0.066
				local var_116_10, var_116_11 = math.modf(var_116_9)

				var_116_6.localPosition = Vector3.New(var_116_11 * 0.13, var_116_11 * 0.13, var_116_11 * 0.13) + arg_113_1.var_.shakeOldPos
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 then
				var_116_6.localPosition = arg_113_1.var_.shakeOldPos
			end

			local var_116_12 = 0
			local var_116_13 = 1

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				local var_116_14 = "play"
				local var_116_15 = "effect"

				arg_113_1:AudioAction(var_116_14, var_116_15, "se_story_123_01", "se_story_123_01_explosion", "")
			end

			local var_116_16 = 0
			local var_116_17 = 0.075

			if var_116_16 < arg_113_1.time_ and arg_113_1.time_ <= var_116_16 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0

				arg_113_1.dialog_:SetActive(true)

				local var_116_18 = LeanTween.value(arg_113_1.dialog_, 0, 1, 0.3)

				var_116_18:setOnUpdate(LuaHelper.FloatAction(function(arg_117_0)
					arg_113_1.dialogCg_.alpha = arg_117_0
				end))
				var_116_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_113_1.dialog_)
					var_116_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_113_1.duration_ = arg_113_1.duration_ + 0.3

				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_19 = arg_113_1:GetWordFromCfg(410082028)
				local var_116_20 = arg_113_1:FormatText(var_116_19.content)

				arg_113_1.text_.text = var_116_20

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_21 = 3
				local var_116_22 = utf8.len(var_116_20)
				local var_116_23 = var_116_21 <= 0 and var_116_17 or var_116_17 * (var_116_22 / var_116_21)

				if var_116_23 > 0 and var_116_17 < var_116_23 then
					arg_113_1.talkMaxDuration = var_116_23
					var_116_16 = var_116_16 + 0.3

					if var_116_23 + var_116_16 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_23 + var_116_16
					end
				end

				arg_113_1.text_.text = var_116_20
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_24 = var_116_16 + 0.3
			local var_116_25 = math.max(var_116_17, arg_113_1.talkMaxDuration)

			if var_116_24 <= arg_113_1.time_ and arg_113_1.time_ < var_116_24 + var_116_25 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_24) / var_116_25

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_24 + var_116_25 and arg_113_1.time_ < var_116_24 + var_116_25 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play410082029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410082029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play410082030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1.1

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

				local var_122_2 = arg_119_1:GetWordFromCfg(410082029)
				local var_122_3 = arg_119_1:FormatText(var_122_2.content)

				arg_119_1.text_.text = var_122_3

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_4 = 44
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
	Play410082030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410082030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play410082031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 1.375

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_2 = arg_123_1:GetWordFromCfg(410082030)
				local var_126_3 = arg_123_1:FormatText(var_126_2.content)

				arg_123_1.text_.text = var_126_3

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_4 = 55
				local var_126_5 = utf8.len(var_126_3)
				local var_126_6 = var_126_4 <= 0 and var_126_1 or var_126_1 * (var_126_5 / var_126_4)

				if var_126_6 > 0 and var_126_1 < var_126_6 then
					arg_123_1.talkMaxDuration = var_126_6

					if var_126_6 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_6 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_3
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_7 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_7 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_7

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_7 and arg_123_1.time_ < var_126_0 + var_126_7 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410082031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410082031
		arg_127_1.duration_ = 1.733

		local var_127_0 = {
			zh = 1.466,
			ja = 1.733
		}
		local var_127_1 = manager.audio:GetLocalizationFlag()

		if var_127_0[var_127_1] ~= nil then
			arg_127_1.duration_ = var_127_0[var_127_1]
		end

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play410082032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10062"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10062 = var_130_0.localPosition
				var_130_0.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("10062", 3)

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
				local var_130_6 = Vector3.New(0, -390, -290)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10062, var_130_6, var_130_5)
			end

			if arg_127_1.time_ >= var_130_1 + var_130_4 and arg_127_1.time_ < var_130_1 + var_130_4 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_130_7 = arg_127_1.actors_["10062"]
			local var_130_8 = 0

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 and arg_127_1.var_.actorSpriteComps10062 == nil then
				arg_127_1.var_.actorSpriteComps10062 = var_130_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_9 = 0.034

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_8) / var_130_9

				if arg_127_1.var_.actorSpriteComps10062 then
					for iter_130_1, iter_130_2 in pairs(arg_127_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_130_2 then
							local var_130_11 = Mathf.Lerp(iter_130_2.color.r, 1, var_130_10)

							iter_130_2.color = Color.New(var_130_11, var_130_11, var_130_11)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_8 + var_130_9 and arg_127_1.time_ < var_130_8 + var_130_9 + arg_130_0 and arg_127_1.var_.actorSpriteComps10062 then
				local var_130_12 = 1

				for iter_130_3, iter_130_4 in pairs(arg_127_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_130_4 then
						iter_130_4.color = Color.New(var_130_12, var_130_12, var_130_12)
					end
				end

				arg_127_1.var_.actorSpriteComps10062 = nil
			end

			local var_130_13 = 0
			local var_130_14 = 0.1

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_15 = arg_127_1:FormatText(StoryNameCfg[600].name)

				arg_127_1.leftNameTxt_.text = var_130_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_16 = arg_127_1:GetWordFromCfg(410082031)
				local var_130_17 = arg_127_1:FormatText(var_130_16.content)

				arg_127_1.text_.text = var_130_17

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_18 = 4
				local var_130_19 = utf8.len(var_130_17)
				local var_130_20 = var_130_18 <= 0 and var_130_14 or var_130_14 * (var_130_19 / var_130_18)

				if var_130_20 > 0 and var_130_14 < var_130_20 then
					arg_127_1.talkMaxDuration = var_130_20

					if var_130_20 + var_130_13 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_20 + var_130_13
					end
				end

				arg_127_1.text_.text = var_130_17
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082031", "story_v_out_410082.awb") ~= 0 then
					local var_130_21 = manager.audio:GetVoiceLength("story_v_out_410082", "410082031", "story_v_out_410082.awb") / 1000

					if var_130_21 + var_130_13 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_21 + var_130_13
					end

					if var_130_16.prefab_name ~= "" and arg_127_1.actors_[var_130_16.prefab_name] ~= nil then
						local var_130_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_16.prefab_name].transform, "story_v_out_410082", "410082031", "story_v_out_410082.awb")

						arg_127_1:RecordAudio("410082031", var_130_22)
						arg_127_1:RecordAudio("410082031", var_130_22)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_410082", "410082031", "story_v_out_410082.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_410082", "410082031", "story_v_out_410082.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_23 = math.max(var_130_14, arg_127_1.talkMaxDuration)

			if var_130_13 <= arg_127_1.time_ and arg_127_1.time_ < var_130_13 + var_130_23 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_13) / var_130_23

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_13 + var_130_23 and arg_127_1.time_ < var_130_13 + var_130_23 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play410082032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410082032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play410082033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10062"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.actorSpriteComps10062 == nil then
				arg_131_1.var_.actorSpriteComps10062 = var_134_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_2 = 0.034

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.actorSpriteComps10062 then
					for iter_134_0, iter_134_1 in pairs(arg_131_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_134_1 then
							local var_134_4 = Mathf.Lerp(iter_134_1.color.r, 0.5, var_134_3)

							iter_134_1.color = Color.New(var_134_4, var_134_4, var_134_4)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.actorSpriteComps10062 then
				local var_134_5 = 0.5

				for iter_134_2, iter_134_3 in pairs(arg_131_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_134_3 then
						iter_134_3.color = Color.New(var_134_5, var_134_5, var_134_5)
					end
				end

				arg_131_1.var_.actorSpriteComps10062 = nil
			end

			local var_134_6 = 0
			local var_134_7 = 0.975

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_8 = arg_131_1:GetWordFromCfg(410082032)
				local var_134_9 = arg_131_1:FormatText(var_134_8.content)

				arg_131_1.text_.text = var_134_9

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_10 = 39
				local var_134_11 = utf8.len(var_134_9)
				local var_134_12 = var_134_10 <= 0 and var_134_7 or var_134_7 * (var_134_11 / var_134_10)

				if var_134_12 > 0 and var_134_7 < var_134_12 then
					arg_131_1.talkMaxDuration = var_134_12

					if var_134_12 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_12 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_9
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_13 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_13 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_13

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_13 and arg_131_1.time_ < var_134_6 + var_134_13 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play410082033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410082033
		arg_135_1.duration_ = 15.933

		local var_135_0 = {
			zh = 5.6,
			ja = 15.933
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
				arg_135_0:Play410082034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10062"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos10062 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("10062", 3)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "split_2" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(0, -390, -290)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10062, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_138_7 = arg_135_1.actors_["10062"]
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps10062 == nil then
				arg_135_1.var_.actorSpriteComps10062 = var_138_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_9 = 0.034

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9

				if arg_135_1.var_.actorSpriteComps10062 then
					for iter_138_1, iter_138_2 in pairs(arg_135_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_138_2 then
							local var_138_11 = Mathf.Lerp(iter_138_2.color.r, 1, var_138_10)

							iter_138_2.color = Color.New(var_138_11, var_138_11, var_138_11)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.actorSpriteComps10062 then
				local var_138_12 = 1

				for iter_138_3, iter_138_4 in pairs(arg_135_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_138_4 then
						iter_138_4.color = Color.New(var_138_12, var_138_12, var_138_12)
					end
				end

				arg_135_1.var_.actorSpriteComps10062 = nil
			end

			local var_138_13 = 0
			local var_138_14 = 0.7

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_15 = arg_135_1:FormatText(StoryNameCfg[600].name)

				arg_135_1.leftNameTxt_.text = var_138_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_16 = arg_135_1:GetWordFromCfg(410082033)
				local var_138_17 = arg_135_1:FormatText(var_138_16.content)

				arg_135_1.text_.text = var_138_17

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_18 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082033", "story_v_out_410082.awb") ~= 0 then
					local var_138_21 = manager.audio:GetVoiceLength("story_v_out_410082", "410082033", "story_v_out_410082.awb") / 1000

					if var_138_21 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_13
					end

					if var_138_16.prefab_name ~= "" and arg_135_1.actors_[var_138_16.prefab_name] ~= nil then
						local var_138_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_16.prefab_name].transform, "story_v_out_410082", "410082033", "story_v_out_410082.awb")

						arg_135_1:RecordAudio("410082033", var_138_22)
						arg_135_1:RecordAudio("410082033", var_138_22)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_410082", "410082033", "story_v_out_410082.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_410082", "410082033", "story_v_out_410082.awb")
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
	Play410082034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410082034
		arg_139_1.duration_ = 4.233

		local var_139_0 = {
			zh = 1.266,
			ja = 4.233
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
				arg_139_0:Play410082035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1060"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1060 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("1060", 2)

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
				local var_142_6 = Vector3.New(-390, -435, -40)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1060, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_142_7 = arg_139_1.actors_["1060"]
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 and arg_139_1.var_.actorSpriteComps1060 == nil then
				arg_139_1.var_.actorSpriteComps1060 = var_142_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_9 = 0.034

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_9 then
				local var_142_10 = (arg_139_1.time_ - var_142_8) / var_142_9

				if arg_139_1.var_.actorSpriteComps1060 then
					for iter_142_1, iter_142_2 in pairs(arg_139_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_142_2 then
							local var_142_11 = Mathf.Lerp(iter_142_2.color.r, 1, var_142_10)

							iter_142_2.color = Color.New(var_142_11, var_142_11, var_142_11)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_8 + var_142_9 and arg_139_1.time_ < var_142_8 + var_142_9 + arg_142_0 and arg_139_1.var_.actorSpriteComps1060 then
				local var_142_12 = 1

				for iter_142_3, iter_142_4 in pairs(arg_139_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_142_4 then
						iter_142_4.color = Color.New(var_142_12, var_142_12, var_142_12)
					end
				end

				arg_139_1.var_.actorSpriteComps1060 = nil
			end

			local var_142_13 = arg_139_1.actors_["10062"].transform
			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1.var_.moveOldPos10062 = var_142_13.localPosition
				var_142_13.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10062", 4)

				local var_142_15 = var_142_13.childCount

				for iter_142_5 = 0, var_142_15 - 1 do
					local var_142_16 = var_142_13:GetChild(iter_142_5)

					if var_142_16.name == "split_2" or not string.find(var_142_16.name, "split") then
						var_142_16.gameObject:SetActive(true)
					else
						var_142_16.gameObject:SetActive(false)
					end
				end
			end

			local var_142_17 = 0.001

			if var_142_14 <= arg_139_1.time_ and arg_139_1.time_ < var_142_14 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_14) / var_142_17
				local var_142_19 = Vector3.New(370, -390, -290)

				var_142_13.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10062, var_142_19, var_142_18)
			end

			if arg_139_1.time_ >= var_142_14 + var_142_17 and arg_139_1.time_ < var_142_14 + var_142_17 + arg_142_0 then
				var_142_13.localPosition = Vector3.New(370, -390, -290)
			end

			local var_142_20 = arg_139_1.actors_["10062"]
			local var_142_21 = 0

			if var_142_21 < arg_139_1.time_ and arg_139_1.time_ <= var_142_21 + arg_142_0 and arg_139_1.var_.actorSpriteComps10062 == nil then
				arg_139_1.var_.actorSpriteComps10062 = var_142_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_22 = 0.034

			if var_142_21 <= arg_139_1.time_ and arg_139_1.time_ < var_142_21 + var_142_22 then
				local var_142_23 = (arg_139_1.time_ - var_142_21) / var_142_22

				if arg_139_1.var_.actorSpriteComps10062 then
					for iter_142_6, iter_142_7 in pairs(arg_139_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_142_7 then
							local var_142_24 = Mathf.Lerp(iter_142_7.color.r, 0.5, var_142_23)

							iter_142_7.color = Color.New(var_142_24, var_142_24, var_142_24)
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_21 + var_142_22 and arg_139_1.time_ < var_142_21 + var_142_22 + arg_142_0 and arg_139_1.var_.actorSpriteComps10062 then
				local var_142_25 = 0.5

				for iter_142_8, iter_142_9 in pairs(arg_139_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_142_9 then
						iter_142_9.color = Color.New(var_142_25, var_142_25, var_142_25)
					end
				end

				arg_139_1.var_.actorSpriteComps10062 = nil
			end

			local var_142_26 = 0
			local var_142_27 = 0.125

			if var_142_26 < arg_139_1.time_ and arg_139_1.time_ <= var_142_26 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_28 = arg_139_1:FormatText(StoryNameCfg[584].name)

				arg_139_1.leftNameTxt_.text = var_142_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_29 = arg_139_1:GetWordFromCfg(410082034)
				local var_142_30 = arg_139_1:FormatText(var_142_29.content)

				arg_139_1.text_.text = var_142_30

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_31 = 5
				local var_142_32 = utf8.len(var_142_30)
				local var_142_33 = var_142_31 <= 0 and var_142_27 or var_142_27 * (var_142_32 / var_142_31)

				if var_142_33 > 0 and var_142_27 < var_142_33 then
					arg_139_1.talkMaxDuration = var_142_33

					if var_142_33 + var_142_26 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_33 + var_142_26
					end
				end

				arg_139_1.text_.text = var_142_30
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082034", "story_v_out_410082.awb") ~= 0 then
					local var_142_34 = manager.audio:GetVoiceLength("story_v_out_410082", "410082034", "story_v_out_410082.awb") / 1000

					if var_142_34 + var_142_26 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_34 + var_142_26
					end

					if var_142_29.prefab_name ~= "" and arg_139_1.actors_[var_142_29.prefab_name] ~= nil then
						local var_142_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_29.prefab_name].transform, "story_v_out_410082", "410082034", "story_v_out_410082.awb")

						arg_139_1:RecordAudio("410082034", var_142_35)
						arg_139_1:RecordAudio("410082034", var_142_35)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_410082", "410082034", "story_v_out_410082.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_410082", "410082034", "story_v_out_410082.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_36 = math.max(var_142_27, arg_139_1.talkMaxDuration)

			if var_142_26 <= arg_139_1.time_ and arg_139_1.time_ < var_142_26 + var_142_36 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_26) / var_142_36

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_26 + var_142_36 and arg_139_1.time_ < var_142_26 + var_142_36 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410082035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410082035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play410082036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10062"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos10062 = var_146_0.localPosition
				var_146_0.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("10062", 7)

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
				local var_146_6 = Vector3.New(0, -2000, -290)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10062, var_146_6, var_146_5)
			end

			if arg_143_1.time_ >= var_146_1 + var_146_4 and arg_143_1.time_ < var_146_1 + var_146_4 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_146_7 = arg_143_1.actors_["1060"].transform
			local var_146_8 = 0

			if var_146_8 < arg_143_1.time_ and arg_143_1.time_ <= var_146_8 + arg_146_0 then
				arg_143_1.var_.moveOldPos1060 = var_146_7.localPosition
				var_146_7.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("1060", 7)

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
				local var_146_13 = Vector3.New(0, -2000, -40)

				var_146_7.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1060, var_146_13, var_146_12)
			end

			if arg_143_1.time_ >= var_146_8 + var_146_11 and arg_143_1.time_ < var_146_8 + var_146_11 + arg_146_0 then
				var_146_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_146_14 = 0
			local var_146_15 = 1.15

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_16 = arg_143_1:GetWordFromCfg(410082035)
				local var_146_17 = arg_143_1:FormatText(var_146_16.content)

				arg_143_1.text_.text = var_146_17

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_18 = 46
				local var_146_19 = utf8.len(var_146_17)
				local var_146_20 = var_146_18 <= 0 and var_146_15 or var_146_15 * (var_146_19 / var_146_18)

				if var_146_20 > 0 and var_146_15 < var_146_20 then
					arg_143_1.talkMaxDuration = var_146_20

					if var_146_20 + var_146_14 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_14
					end
				end

				arg_143_1.text_.text = var_146_17
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_21 = math.max(var_146_15, arg_143_1.talkMaxDuration)

			if var_146_14 <= arg_143_1.time_ and arg_143_1.time_ < var_146_14 + var_146_21 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_14) / var_146_21

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_14 + var_146_21 and arg_143_1.time_ < var_146_14 + var_146_21 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play410082036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410082036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play410082037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.975

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

				local var_150_2 = arg_147_1:GetWordFromCfg(410082036)
				local var_150_3 = arg_147_1:FormatText(var_150_2.content)

				arg_147_1.text_.text = var_150_3

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_4 = 39
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
	Play410082037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410082037
		arg_151_1.duration_ = 8.866

		local var_151_0 = {
			zh = 3.733,
			ja = 8.866
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
				arg_151_0:Play410082038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = "1056"

			if arg_151_1.actors_[var_154_0] == nil then
				local var_154_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_154_0), arg_151_1.canvasGo_.transform)

				var_154_1.transform:SetSiblingIndex(1)

				var_154_1.name = var_154_0
				var_154_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_151_1.actors_[var_154_0] = var_154_1
			end

			local var_154_2 = arg_151_1.actors_["1056"].transform
			local var_154_3 = 0

			if var_154_3 < arg_151_1.time_ and arg_151_1.time_ <= var_154_3 + arg_154_0 then
				arg_151_1.var_.moveOldPos1056 = var_154_2.localPosition
				var_154_2.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("1056", 4)

				local var_154_4 = var_154_2.childCount

				for iter_154_0 = 0, var_154_4 - 1 do
					local var_154_5 = var_154_2:GetChild(iter_154_0)

					if var_154_5.name == "split_1" or not string.find(var_154_5.name, "split") then
						var_154_5.gameObject:SetActive(true)
					else
						var_154_5.gameObject:SetActive(false)
					end
				end
			end

			local var_154_6 = 0.001

			if var_154_3 <= arg_151_1.time_ and arg_151_1.time_ < var_154_3 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_3) / var_154_6
				local var_154_8 = Vector3.New(390, -350, -180)

				var_154_2.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1056, var_154_8, var_154_7)
			end

			if arg_151_1.time_ >= var_154_3 + var_154_6 and arg_151_1.time_ < var_154_3 + var_154_6 + arg_154_0 then
				var_154_2.localPosition = Vector3.New(390, -350, -180)
			end

			local var_154_9 = arg_151_1.actors_["1060"].transform
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1.var_.moveOldPos1060 = var_154_9.localPosition
				var_154_9.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("1060", 2)

				local var_154_11 = var_154_9.childCount

				for iter_154_1 = 0, var_154_11 - 1 do
					local var_154_12 = var_154_9:GetChild(iter_154_1)

					if var_154_12.name == "" or not string.find(var_154_12.name, "split") then
						var_154_12.gameObject:SetActive(true)
					else
						var_154_12.gameObject:SetActive(false)
					end
				end
			end

			local var_154_13 = 0.001

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_13 then
				local var_154_14 = (arg_151_1.time_ - var_154_10) / var_154_13
				local var_154_15 = Vector3.New(-390, -435, -40)

				var_154_9.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1060, var_154_15, var_154_14)
			end

			if arg_151_1.time_ >= var_154_10 + var_154_13 and arg_151_1.time_ < var_154_10 + var_154_13 + arg_154_0 then
				var_154_9.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_154_16 = arg_151_1.actors_["1056"]
			local var_154_17 = 0

			if var_154_17 < arg_151_1.time_ and arg_151_1.time_ <= var_154_17 + arg_154_0 and arg_151_1.var_.actorSpriteComps1056 == nil then
				arg_151_1.var_.actorSpriteComps1056 = var_154_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_18 = 0.034

			if var_154_17 <= arg_151_1.time_ and arg_151_1.time_ < var_154_17 + var_154_18 then
				local var_154_19 = (arg_151_1.time_ - var_154_17) / var_154_18

				if arg_151_1.var_.actorSpriteComps1056 then
					for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_154_3 then
							local var_154_20 = Mathf.Lerp(iter_154_3.color.r, 1, var_154_19)

							iter_154_3.color = Color.New(var_154_20, var_154_20, var_154_20)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_17 + var_154_18 and arg_151_1.time_ < var_154_17 + var_154_18 + arg_154_0 and arg_151_1.var_.actorSpriteComps1056 then
				local var_154_21 = 1

				for iter_154_4, iter_154_5 in pairs(arg_151_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_154_5 then
						iter_154_5.color = Color.New(var_154_21, var_154_21, var_154_21)
					end
				end

				arg_151_1.var_.actorSpriteComps1056 = nil
			end

			local var_154_22 = arg_151_1.actors_["1060"]
			local var_154_23 = 0

			if var_154_23 < arg_151_1.time_ and arg_151_1.time_ <= var_154_23 + arg_154_0 and arg_151_1.var_.actorSpriteComps1060 == nil then
				arg_151_1.var_.actorSpriteComps1060 = var_154_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_24 = 0.034

			if var_154_23 <= arg_151_1.time_ and arg_151_1.time_ < var_154_23 + var_154_24 then
				local var_154_25 = (arg_151_1.time_ - var_154_23) / var_154_24

				if arg_151_1.var_.actorSpriteComps1060 then
					for iter_154_6, iter_154_7 in pairs(arg_151_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_154_7 then
							local var_154_26 = Mathf.Lerp(iter_154_7.color.r, 0.5, var_154_25)

							iter_154_7.color = Color.New(var_154_26, var_154_26, var_154_26)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_23 + var_154_24 and arg_151_1.time_ < var_154_23 + var_154_24 + arg_154_0 and arg_151_1.var_.actorSpriteComps1060 then
				local var_154_27 = 0.5

				for iter_154_8, iter_154_9 in pairs(arg_151_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_154_9 then
						iter_154_9.color = Color.New(var_154_27, var_154_27, var_154_27)
					end
				end

				arg_151_1.var_.actorSpriteComps1060 = nil
			end

			local var_154_28 = 0
			local var_154_29 = 0.5

			if var_154_28 < arg_151_1.time_ and arg_151_1.time_ <= var_154_28 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_30 = arg_151_1:FormatText(StoryNameCfg[605].name)

				arg_151_1.leftNameTxt_.text = var_154_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_31 = arg_151_1:GetWordFromCfg(410082037)
				local var_154_32 = arg_151_1:FormatText(var_154_31.content)

				arg_151_1.text_.text = var_154_32

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_33 = 20
				local var_154_34 = utf8.len(var_154_32)
				local var_154_35 = var_154_33 <= 0 and var_154_29 or var_154_29 * (var_154_34 / var_154_33)

				if var_154_35 > 0 and var_154_29 < var_154_35 then
					arg_151_1.talkMaxDuration = var_154_35

					if var_154_35 + var_154_28 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_35 + var_154_28
					end
				end

				arg_151_1.text_.text = var_154_32
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082037", "story_v_out_410082.awb") ~= 0 then
					local var_154_36 = manager.audio:GetVoiceLength("story_v_out_410082", "410082037", "story_v_out_410082.awb") / 1000

					if var_154_36 + var_154_28 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_36 + var_154_28
					end

					if var_154_31.prefab_name ~= "" and arg_151_1.actors_[var_154_31.prefab_name] ~= nil then
						local var_154_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_31.prefab_name].transform, "story_v_out_410082", "410082037", "story_v_out_410082.awb")

						arg_151_1:RecordAudio("410082037", var_154_37)
						arg_151_1:RecordAudio("410082037", var_154_37)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410082", "410082037", "story_v_out_410082.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410082", "410082037", "story_v_out_410082.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_38 = math.max(var_154_29, arg_151_1.talkMaxDuration)

			if var_154_28 <= arg_151_1.time_ and arg_151_1.time_ < var_154_28 + var_154_38 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_28) / var_154_38

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_28 + var_154_38 and arg_151_1.time_ < var_154_28 + var_154_38 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410082038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410082038
		arg_155_1.duration_ = 8.633

		local var_155_0 = {
			zh = 3.633,
			ja = 8.633
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
				arg_155_0:Play410082039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1060"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1060 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("1060", 2)

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
				local var_158_6 = Vector3.New(-390, -435, -40)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1060, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_158_7 = arg_155_1.actors_["1060"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps1060 == nil then
				arg_155_1.var_.actorSpriteComps1060 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 0.034

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps1060 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_158_2 then
							local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

							iter_158_2.color = Color.New(var_158_11, var_158_11, var_158_11)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps1060 then
				local var_158_12 = 1

				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_158_4 then
						iter_158_4.color = Color.New(var_158_12, var_158_12, var_158_12)
					end
				end

				arg_155_1.var_.actorSpriteComps1060 = nil
			end

			local var_158_13 = arg_155_1.actors_["1056"]
			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 and arg_155_1.var_.actorSpriteComps1056 == nil then
				arg_155_1.var_.actorSpriteComps1056 = var_158_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_15 = 0.034

			if var_158_14 <= arg_155_1.time_ and arg_155_1.time_ < var_158_14 + var_158_15 then
				local var_158_16 = (arg_155_1.time_ - var_158_14) / var_158_15

				if arg_155_1.var_.actorSpriteComps1056 then
					for iter_158_5, iter_158_6 in pairs(arg_155_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_158_6 then
							local var_158_17 = Mathf.Lerp(iter_158_6.color.r, 0.5, var_158_16)

							iter_158_6.color = Color.New(var_158_17, var_158_17, var_158_17)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_14 + var_158_15 and arg_155_1.time_ < var_158_14 + var_158_15 + arg_158_0 and arg_155_1.var_.actorSpriteComps1056 then
				local var_158_18 = 0.5

				for iter_158_7, iter_158_8 in pairs(arg_155_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_158_8 then
						iter_158_8.color = Color.New(var_158_18, var_158_18, var_158_18)
					end
				end

				arg_155_1.var_.actorSpriteComps1056 = nil
			end

			local var_158_19 = 0
			local var_158_20 = 0.5

			if var_158_19 < arg_155_1.time_ and arg_155_1.time_ <= var_158_19 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_21 = arg_155_1:FormatText(StoryNameCfg[584].name)

				arg_155_1.leftNameTxt_.text = var_158_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_22 = arg_155_1:GetWordFromCfg(410082038)
				local var_158_23 = arg_155_1:FormatText(var_158_22.content)

				arg_155_1.text_.text = var_158_23

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_24 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082038", "story_v_out_410082.awb") ~= 0 then
					local var_158_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082038", "story_v_out_410082.awb") / 1000

					if var_158_27 + var_158_19 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_27 + var_158_19
					end

					if var_158_22.prefab_name ~= "" and arg_155_1.actors_[var_158_22.prefab_name] ~= nil then
						local var_158_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_22.prefab_name].transform, "story_v_out_410082", "410082038", "story_v_out_410082.awb")

						arg_155_1:RecordAudio("410082038", var_158_28)
						arg_155_1:RecordAudio("410082038", var_158_28)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410082", "410082038", "story_v_out_410082.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410082", "410082038", "story_v_out_410082.awb")
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
	Play410082039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410082039
		arg_159_1.duration_ = 8.733

		local var_159_0 = {
			zh = 6.2,
			ja = 8.733
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
				arg_159_0:Play410082040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.8

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

				local var_162_3 = arg_159_1:GetWordFromCfg(410082039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082039", "story_v_out_410082.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082039", "story_v_out_410082.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_410082", "410082039", "story_v_out_410082.awb")

						arg_159_1:RecordAudio("410082039", var_162_9)
						arg_159_1:RecordAudio("410082039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410082", "410082039", "story_v_out_410082.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410082", "410082039", "story_v_out_410082.awb")
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
	Play410082040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410082040
		arg_163_1.duration_ = 7.5

		local var_163_0 = {
			zh = 3.333,
			ja = 7.5
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
				arg_163_0:Play410082041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1056"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1056 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("1056", 4)

				local var_166_2 = var_166_0.childCount

				for iter_166_0 = 0, var_166_2 - 1 do
					local var_166_3 = var_166_0:GetChild(iter_166_0)

					if var_166_3.name == "split_2" or not string.find(var_166_3.name, "split") then
						var_166_3.gameObject:SetActive(true)
					else
						var_166_3.gameObject:SetActive(false)
					end
				end
			end

			local var_166_4 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_4 then
				local var_166_5 = (arg_163_1.time_ - var_166_1) / var_166_4
				local var_166_6 = Vector3.New(390, -350, -180)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1056, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_166_7 = arg_163_1.actors_["1056"]
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 and arg_163_1.var_.actorSpriteComps1056 == nil then
				arg_163_1.var_.actorSpriteComps1056 = var_166_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_9 = 0.034

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_8) / var_166_9

				if arg_163_1.var_.actorSpriteComps1056 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_166_2 then
							local var_166_11 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_10)

							iter_166_2.color = Color.New(var_166_11, var_166_11, var_166_11)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_8 + var_166_9 and arg_163_1.time_ < var_166_8 + var_166_9 + arg_166_0 and arg_163_1.var_.actorSpriteComps1056 then
				local var_166_12 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_12, var_166_12, var_166_12)
					end
				end

				arg_163_1.var_.actorSpriteComps1056 = nil
			end

			local var_166_13 = arg_163_1.actors_["1060"]
			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 and arg_163_1.var_.actorSpriteComps1060 == nil then
				arg_163_1.var_.actorSpriteComps1060 = var_166_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_15 = 0.034

			if var_166_14 <= arg_163_1.time_ and arg_163_1.time_ < var_166_14 + var_166_15 then
				local var_166_16 = (arg_163_1.time_ - var_166_14) / var_166_15

				if arg_163_1.var_.actorSpriteComps1060 then
					for iter_166_5, iter_166_6 in pairs(arg_163_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_166_6 then
							local var_166_17 = Mathf.Lerp(iter_166_6.color.r, 0.5, var_166_16)

							iter_166_6.color = Color.New(var_166_17, var_166_17, var_166_17)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_14 + var_166_15 and arg_163_1.time_ < var_166_14 + var_166_15 + arg_166_0 and arg_163_1.var_.actorSpriteComps1060 then
				local var_166_18 = 0.5

				for iter_166_7, iter_166_8 in pairs(arg_163_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_166_8 then
						iter_166_8.color = Color.New(var_166_18, var_166_18, var_166_18)
					end
				end

				arg_163_1.var_.actorSpriteComps1060 = nil
			end

			local var_166_19 = 0
			local var_166_20 = 0.375

			if var_166_19 < arg_163_1.time_ and arg_163_1.time_ <= var_166_19 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_21 = arg_163_1:FormatText(StoryNameCfg[605].name)

				arg_163_1.leftNameTxt_.text = var_166_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_22 = arg_163_1:GetWordFromCfg(410082040)
				local var_166_23 = arg_163_1:FormatText(var_166_22.content)

				arg_163_1.text_.text = var_166_23

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082040", "story_v_out_410082.awb") ~= 0 then
					local var_166_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082040", "story_v_out_410082.awb") / 1000

					if var_166_27 + var_166_19 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_27 + var_166_19
					end

					if var_166_22.prefab_name ~= "" and arg_163_1.actors_[var_166_22.prefab_name] ~= nil then
						local var_166_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_22.prefab_name].transform, "story_v_out_410082", "410082040", "story_v_out_410082.awb")

						arg_163_1:RecordAudio("410082040", var_166_28)
						arg_163_1:RecordAudio("410082040", var_166_28)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_410082", "410082040", "story_v_out_410082.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_410082", "410082040", "story_v_out_410082.awb")
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
	Play410082041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410082041
		arg_167_1.duration_ = 11.933

		local var_167_0 = {
			zh = 5,
			ja = 11.933
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
				arg_167_0:Play410082042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1060"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1060 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("1060", 2)

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
				local var_170_6 = Vector3.New(-390, -435, -40)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1060, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_170_7 = arg_167_1.actors_["1060"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps1060 == nil then
				arg_167_1.var_.actorSpriteComps1060 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.034

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps1060 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 1, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps1060 then
				local var_170_12 = 1

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps1060 = nil
			end

			local var_170_13 = arg_167_1.actors_["1056"]
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 and arg_167_1.var_.actorSpriteComps1056 == nil then
				arg_167_1.var_.actorSpriteComps1056 = var_170_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_15 = 0.034

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_15 then
				local var_170_16 = (arg_167_1.time_ - var_170_14) / var_170_15

				if arg_167_1.var_.actorSpriteComps1056 then
					for iter_170_5, iter_170_6 in pairs(arg_167_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_170_6 then
							local var_170_17 = Mathf.Lerp(iter_170_6.color.r, 0.5, var_170_16)

							iter_170_6.color = Color.New(var_170_17, var_170_17, var_170_17)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_14 + var_170_15 and arg_167_1.time_ < var_170_14 + var_170_15 + arg_170_0 and arg_167_1.var_.actorSpriteComps1056 then
				local var_170_18 = 0.5

				for iter_170_7, iter_170_8 in pairs(arg_167_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_170_8 then
						iter_170_8.color = Color.New(var_170_18, var_170_18, var_170_18)
					end
				end

				arg_167_1.var_.actorSpriteComps1056 = nil
			end

			local var_170_19 = 0
			local var_170_20 = 0.55

			if var_170_19 < arg_167_1.time_ and arg_167_1.time_ <= var_170_19 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_21 = arg_167_1:FormatText(StoryNameCfg[584].name)

				arg_167_1.leftNameTxt_.text = var_170_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_22 = arg_167_1:GetWordFromCfg(410082041)
				local var_170_23 = arg_167_1:FormatText(var_170_22.content)

				arg_167_1.text_.text = var_170_23

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_24 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082041", "story_v_out_410082.awb") ~= 0 then
					local var_170_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082041", "story_v_out_410082.awb") / 1000

					if var_170_27 + var_170_19 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_27 + var_170_19
					end

					if var_170_22.prefab_name ~= "" and arg_167_1.actors_[var_170_22.prefab_name] ~= nil then
						local var_170_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_22.prefab_name].transform, "story_v_out_410082", "410082041", "story_v_out_410082.awb")

						arg_167_1:RecordAudio("410082041", var_170_28)
						arg_167_1:RecordAudio("410082041", var_170_28)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410082", "410082041", "story_v_out_410082.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410082", "410082041", "story_v_out_410082.awb")
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
	Play410082042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410082042
		arg_171_1.duration_ = 9.066

		local var_171_0 = {
			zh = 7.266,
			ja = 9.066
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
				arg_171_0:Play410082043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.725

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

				local var_174_3 = arg_171_1:GetWordFromCfg(410082042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082042", "story_v_out_410082.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082042", "story_v_out_410082.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_410082", "410082042", "story_v_out_410082.awb")

						arg_171_1:RecordAudio("410082042", var_174_9)
						arg_171_1:RecordAudio("410082042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410082", "410082042", "story_v_out_410082.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410082", "410082042", "story_v_out_410082.awb")
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
	Play410082043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410082043
		arg_175_1.duration_ = 9.8

		local var_175_0 = {
			zh = 9.2,
			ja = 9.8
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
				arg_175_0:Play410082044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1056"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1056 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("1056", 4)

				local var_178_2 = var_178_0.childCount

				for iter_178_0 = 0, var_178_2 - 1 do
					local var_178_3 = var_178_0:GetChild(iter_178_0)

					if var_178_3.name == "split_2" or not string.find(var_178_3.name, "split") then
						var_178_3.gameObject:SetActive(true)
					else
						var_178_3.gameObject:SetActive(false)
					end
				end
			end

			local var_178_4 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_1) / var_178_4
				local var_178_6 = Vector3.New(390, -350, -180)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1056, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_178_7 = arg_175_1.actors_["1056"]
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 and arg_175_1.var_.actorSpriteComps1056 == nil then
				arg_175_1.var_.actorSpriteComps1056 = var_178_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_9 = 0.034

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_9 then
				local var_178_10 = (arg_175_1.time_ - var_178_8) / var_178_9

				if arg_175_1.var_.actorSpriteComps1056 then
					for iter_178_1, iter_178_2 in pairs(arg_175_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_178_2 then
							local var_178_11 = Mathf.Lerp(iter_178_2.color.r, 1, var_178_10)

							iter_178_2.color = Color.New(var_178_11, var_178_11, var_178_11)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_8 + var_178_9 and arg_175_1.time_ < var_178_8 + var_178_9 + arg_178_0 and arg_175_1.var_.actorSpriteComps1056 then
				local var_178_12 = 1

				for iter_178_3, iter_178_4 in pairs(arg_175_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_178_4 then
						iter_178_4.color = Color.New(var_178_12, var_178_12, var_178_12)
					end
				end

				arg_175_1.var_.actorSpriteComps1056 = nil
			end

			local var_178_13 = arg_175_1.actors_["1060"]
			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 and arg_175_1.var_.actorSpriteComps1060 == nil then
				arg_175_1.var_.actorSpriteComps1060 = var_178_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_15 = 0.034

			if var_178_14 <= arg_175_1.time_ and arg_175_1.time_ < var_178_14 + var_178_15 then
				local var_178_16 = (arg_175_1.time_ - var_178_14) / var_178_15

				if arg_175_1.var_.actorSpriteComps1060 then
					for iter_178_5, iter_178_6 in pairs(arg_175_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_178_6 then
							local var_178_17 = Mathf.Lerp(iter_178_6.color.r, 0.5, var_178_16)

							iter_178_6.color = Color.New(var_178_17, var_178_17, var_178_17)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_14 + var_178_15 and arg_175_1.time_ < var_178_14 + var_178_15 + arg_178_0 and arg_175_1.var_.actorSpriteComps1060 then
				local var_178_18 = 0.5

				for iter_178_7, iter_178_8 in pairs(arg_175_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_178_8 then
						iter_178_8.color = Color.New(var_178_18, var_178_18, var_178_18)
					end
				end

				arg_175_1.var_.actorSpriteComps1060 = nil
			end

			local var_178_19 = 0
			local var_178_20 = 1.025

			if var_178_19 < arg_175_1.time_ and arg_175_1.time_ <= var_178_19 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_21 = arg_175_1:FormatText(StoryNameCfg[605].name)

				arg_175_1.leftNameTxt_.text = var_178_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_22 = arg_175_1:GetWordFromCfg(410082043)
				local var_178_23 = arg_175_1:FormatText(var_178_22.content)

				arg_175_1.text_.text = var_178_23

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_24 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082043", "story_v_out_410082.awb") ~= 0 then
					local var_178_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082043", "story_v_out_410082.awb") / 1000

					if var_178_27 + var_178_19 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_27 + var_178_19
					end

					if var_178_22.prefab_name ~= "" and arg_175_1.actors_[var_178_22.prefab_name] ~= nil then
						local var_178_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_22.prefab_name].transform, "story_v_out_410082", "410082043", "story_v_out_410082.awb")

						arg_175_1:RecordAudio("410082043", var_178_28)
						arg_175_1:RecordAudio("410082043", var_178_28)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_410082", "410082043", "story_v_out_410082.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_410082", "410082043", "story_v_out_410082.awb")
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
	Play410082044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410082044
		arg_179_1.duration_ = 8.466

		local var_179_0 = {
			zh = 5.3,
			ja = 8.466
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
				arg_179_0:Play410082045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.75

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[605].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(410082044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082044", "story_v_out_410082.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082044", "story_v_out_410082.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_410082", "410082044", "story_v_out_410082.awb")

						arg_179_1:RecordAudio("410082044", var_182_9)
						arg_179_1:RecordAudio("410082044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410082", "410082044", "story_v_out_410082.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410082", "410082044", "story_v_out_410082.awb")
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
	Play410082045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410082045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play410082046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1056"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.actorSpriteComps1056 == nil then
				arg_183_1.var_.actorSpriteComps1056 = var_186_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_2 = 0.034

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.actorSpriteComps1056 then
					for iter_186_0, iter_186_1 in pairs(arg_183_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_186_1 then
							local var_186_4 = Mathf.Lerp(iter_186_1.color.r, 0.5, var_186_3)

							iter_186_1.color = Color.New(var_186_4, var_186_4, var_186_4)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.actorSpriteComps1056 then
				local var_186_5 = 0.5

				for iter_186_2, iter_186_3 in pairs(arg_183_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_186_3 then
						iter_186_3.color = Color.New(var_186_5, var_186_5, var_186_5)
					end
				end

				arg_183_1.var_.actorSpriteComps1056 = nil
			end

			local var_186_6 = 0
			local var_186_7 = 1.3

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_8 = arg_183_1:GetWordFromCfg(410082045)
				local var_186_9 = arg_183_1:FormatText(var_186_8.content)

				arg_183_1.text_.text = var_186_9

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_10 = 52
				local var_186_11 = utf8.len(var_186_9)
				local var_186_12 = var_186_10 <= 0 and var_186_7 or var_186_7 * (var_186_11 / var_186_10)

				if var_186_12 > 0 and var_186_7 < var_186_12 then
					arg_183_1.talkMaxDuration = var_186_12

					if var_186_12 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_12 + var_186_6
					end
				end

				arg_183_1.text_.text = var_186_9
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_13 = math.max(var_186_7, arg_183_1.talkMaxDuration)

			if var_186_6 <= arg_183_1.time_ and arg_183_1.time_ < var_186_6 + var_186_13 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_6) / var_186_13

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_6 + var_186_13 and arg_183_1.time_ < var_186_6 + var_186_13 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play410082046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410082046
		arg_187_1.duration_ = 4.266

		local var_187_0 = {
			zh = 4.266,
			ja = 3.1
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
				arg_187_0:Play410082047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1060"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1060 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("1060", 2)

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
				local var_190_6 = Vector3.New(-390, -435, -40)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1060, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_190_7 = arg_187_1.actors_["1060"]
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps1060 == nil then
				arg_187_1.var_.actorSpriteComps1060 = var_190_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_9 = 0.034

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_8) / var_190_9

				if arg_187_1.var_.actorSpriteComps1060 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_190_2 then
							local var_190_11 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_10)

							iter_190_2.color = Color.New(var_190_11, var_190_11, var_190_11)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_8 + var_190_9 and arg_187_1.time_ < var_190_8 + var_190_9 + arg_190_0 and arg_187_1.var_.actorSpriteComps1060 then
				local var_190_12 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_12, var_190_12, var_190_12)
					end
				end

				arg_187_1.var_.actorSpriteComps1060 = nil
			end

			local var_190_13 = 0
			local var_190_14 = 0.55

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_15 = arg_187_1:FormatText(StoryNameCfg[584].name)

				arg_187_1.leftNameTxt_.text = var_190_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_16 = arg_187_1:GetWordFromCfg(410082046)
				local var_190_17 = arg_187_1:FormatText(var_190_16.content)

				arg_187_1.text_.text = var_190_17

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_18 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082046", "story_v_out_410082.awb") ~= 0 then
					local var_190_21 = manager.audio:GetVoiceLength("story_v_out_410082", "410082046", "story_v_out_410082.awb") / 1000

					if var_190_21 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_21 + var_190_13
					end

					if var_190_16.prefab_name ~= "" and arg_187_1.actors_[var_190_16.prefab_name] ~= nil then
						local var_190_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_16.prefab_name].transform, "story_v_out_410082", "410082046", "story_v_out_410082.awb")

						arg_187_1:RecordAudio("410082046", var_190_22)
						arg_187_1:RecordAudio("410082046", var_190_22)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410082", "410082046", "story_v_out_410082.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410082", "410082046", "story_v_out_410082.awb")
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
	Play410082047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410082047
		arg_191_1.duration_ = 12.766

		local var_191_0 = {
			zh = 12.733,
			ja = 12.766
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
				arg_191_0:Play410082048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1056"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1056 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1056", 4)

				local var_194_2 = var_194_0.childCount

				for iter_194_0 = 0, var_194_2 - 1 do
					local var_194_3 = var_194_0:GetChild(iter_194_0)

					if var_194_3.name == "split_1" or not string.find(var_194_3.name, "split") then
						var_194_3.gameObject:SetActive(true)
					else
						var_194_3.gameObject:SetActive(false)
					end
				end
			end

			local var_194_4 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_1) / var_194_4
				local var_194_6 = Vector3.New(390, -350, -180)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1056, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_194_7 = arg_191_1.actors_["1056"]
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps1056 == nil then
				arg_191_1.var_.actorSpriteComps1056 = var_194_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_9 = 0.034

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_9 then
				local var_194_10 = (arg_191_1.time_ - var_194_8) / var_194_9

				if arg_191_1.var_.actorSpriteComps1056 then
					for iter_194_1, iter_194_2 in pairs(arg_191_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_194_2 then
							local var_194_11 = Mathf.Lerp(iter_194_2.color.r, 1, var_194_10)

							iter_194_2.color = Color.New(var_194_11, var_194_11, var_194_11)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_8 + var_194_9 and arg_191_1.time_ < var_194_8 + var_194_9 + arg_194_0 and arg_191_1.var_.actorSpriteComps1056 then
				local var_194_12 = 1

				for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_194_4 then
						iter_194_4.color = Color.New(var_194_12, var_194_12, var_194_12)
					end
				end

				arg_191_1.var_.actorSpriteComps1056 = nil
			end

			local var_194_13 = arg_191_1.actors_["1060"]
			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 and arg_191_1.var_.actorSpriteComps1060 == nil then
				arg_191_1.var_.actorSpriteComps1060 = var_194_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_15 = 0.034

			if var_194_14 <= arg_191_1.time_ and arg_191_1.time_ < var_194_14 + var_194_15 then
				local var_194_16 = (arg_191_1.time_ - var_194_14) / var_194_15

				if arg_191_1.var_.actorSpriteComps1060 then
					for iter_194_5, iter_194_6 in pairs(arg_191_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_194_6 then
							local var_194_17 = Mathf.Lerp(iter_194_6.color.r, 0.5, var_194_16)

							iter_194_6.color = Color.New(var_194_17, var_194_17, var_194_17)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_14 + var_194_15 and arg_191_1.time_ < var_194_14 + var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps1060 then
				local var_194_18 = 0.5

				for iter_194_7, iter_194_8 in pairs(arg_191_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_194_8 then
						iter_194_8.color = Color.New(var_194_18, var_194_18, var_194_18)
					end
				end

				arg_191_1.var_.actorSpriteComps1060 = nil
			end

			local var_194_19 = 0
			local var_194_20 = 1.45

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_21 = arg_191_1:FormatText(StoryNameCfg[605].name)

				arg_191_1.leftNameTxt_.text = var_194_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_22 = arg_191_1:GetWordFromCfg(410082047)
				local var_194_23 = arg_191_1:FormatText(var_194_22.content)

				arg_191_1.text_.text = var_194_23

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_24 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082047", "story_v_out_410082.awb") ~= 0 then
					local var_194_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082047", "story_v_out_410082.awb") / 1000

					if var_194_27 + var_194_19 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_27 + var_194_19
					end

					if var_194_22.prefab_name ~= "" and arg_191_1.actors_[var_194_22.prefab_name] ~= nil then
						local var_194_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_22.prefab_name].transform, "story_v_out_410082", "410082047", "story_v_out_410082.awb")

						arg_191_1:RecordAudio("410082047", var_194_28)
						arg_191_1:RecordAudio("410082047", var_194_28)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410082", "410082047", "story_v_out_410082.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410082", "410082047", "story_v_out_410082.awb")
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
	Play410082048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410082048
		arg_195_1.duration_ = 8.533

		local var_195_0 = {
			zh = 3.7,
			ja = 8.533
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
				arg_195_0:Play410082049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.45

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[605].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(410082048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082048", "story_v_out_410082.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082048", "story_v_out_410082.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_410082", "410082048", "story_v_out_410082.awb")

						arg_195_1:RecordAudio("410082048", var_198_9)
						arg_195_1:RecordAudio("410082048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410082", "410082048", "story_v_out_410082.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410082", "410082048", "story_v_out_410082.awb")
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
	Play410082049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410082049
		arg_199_1.duration_ = 9.4

		local var_199_0 = {
			zh = 6.2,
			ja = 9.4
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
				arg_199_0:Play410082050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1060"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1060 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("1060", 2)

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
				local var_202_6 = Vector3.New(-390, -435, -40)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1060, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_202_7 = arg_199_1.actors_["1060"]
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps1060 == nil then
				arg_199_1.var_.actorSpriteComps1060 = var_202_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_9 = 0.034

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_8) / var_202_9

				if arg_199_1.var_.actorSpriteComps1060 then
					for iter_202_1, iter_202_2 in pairs(arg_199_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_202_2 then
							local var_202_11 = Mathf.Lerp(iter_202_2.color.r, 1, var_202_10)

							iter_202_2.color = Color.New(var_202_11, var_202_11, var_202_11)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_8 + var_202_9 and arg_199_1.time_ < var_202_8 + var_202_9 + arg_202_0 and arg_199_1.var_.actorSpriteComps1060 then
				local var_202_12 = 1

				for iter_202_3, iter_202_4 in pairs(arg_199_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_202_4 then
						iter_202_4.color = Color.New(var_202_12, var_202_12, var_202_12)
					end
				end

				arg_199_1.var_.actorSpriteComps1060 = nil
			end

			local var_202_13 = arg_199_1.actors_["1056"]
			local var_202_14 = 0

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 and arg_199_1.var_.actorSpriteComps1056 == nil then
				arg_199_1.var_.actorSpriteComps1056 = var_202_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_15 = 0.034

			if var_202_14 <= arg_199_1.time_ and arg_199_1.time_ < var_202_14 + var_202_15 then
				local var_202_16 = (arg_199_1.time_ - var_202_14) / var_202_15

				if arg_199_1.var_.actorSpriteComps1056 then
					for iter_202_5, iter_202_6 in pairs(arg_199_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_202_6 then
							local var_202_17 = Mathf.Lerp(iter_202_6.color.r, 0.5, var_202_16)

							iter_202_6.color = Color.New(var_202_17, var_202_17, var_202_17)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_14 + var_202_15 and arg_199_1.time_ < var_202_14 + var_202_15 + arg_202_0 and arg_199_1.var_.actorSpriteComps1056 then
				local var_202_18 = 0.5

				for iter_202_7, iter_202_8 in pairs(arg_199_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_202_8 then
						iter_202_8.color = Color.New(var_202_18, var_202_18, var_202_18)
					end
				end

				arg_199_1.var_.actorSpriteComps1056 = nil
			end

			local var_202_19 = 0
			local var_202_20 = 0.65

			if var_202_19 < arg_199_1.time_ and arg_199_1.time_ <= var_202_19 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_21 = arg_199_1:FormatText(StoryNameCfg[584].name)

				arg_199_1.leftNameTxt_.text = var_202_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_22 = arg_199_1:GetWordFromCfg(410082049)
				local var_202_23 = arg_199_1:FormatText(var_202_22.content)

				arg_199_1.text_.text = var_202_23

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_24 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082049", "story_v_out_410082.awb") ~= 0 then
					local var_202_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082049", "story_v_out_410082.awb") / 1000

					if var_202_27 + var_202_19 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_27 + var_202_19
					end

					if var_202_22.prefab_name ~= "" and arg_199_1.actors_[var_202_22.prefab_name] ~= nil then
						local var_202_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_22.prefab_name].transform, "story_v_out_410082", "410082049", "story_v_out_410082.awb")

						arg_199_1:RecordAudio("410082049", var_202_28)
						arg_199_1:RecordAudio("410082049", var_202_28)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_410082", "410082049", "story_v_out_410082.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_410082", "410082049", "story_v_out_410082.awb")
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
	Play410082050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410082050
		arg_203_1.duration_ = 6.133

		local var_203_0 = {
			zh = 3.166,
			ja = 6.133
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
				arg_203_0:Play410082051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1060"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.actorSpriteComps1060 == nil then
				arg_203_1.var_.actorSpriteComps1060 = var_206_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_2 = 0.034

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.actorSpriteComps1060 then
					for iter_206_0, iter_206_1 in pairs(arg_203_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_206_1 then
							local var_206_4 = Mathf.Lerp(iter_206_1.color.r, 0.5, var_206_3)

							iter_206_1.color = Color.New(var_206_4, var_206_4, var_206_4)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.actorSpriteComps1060 then
				local var_206_5 = 0.5

				for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_206_3 then
						iter_206_3.color = Color.New(var_206_5, var_206_5, var_206_5)
					end
				end

				arg_203_1.var_.actorSpriteComps1060 = nil
			end

			local var_206_6 = 0
			local var_206_7 = 0.3

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[36].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(410082050)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 12
				local var_206_12 = utf8.len(var_206_10)
				local var_206_13 = var_206_11 <= 0 and var_206_7 or var_206_7 * (var_206_12 / var_206_11)

				if var_206_13 > 0 and var_206_7 < var_206_13 then
					arg_203_1.talkMaxDuration = var_206_13

					if var_206_13 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_13 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_10
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082050", "story_v_out_410082.awb") ~= 0 then
					local var_206_14 = manager.audio:GetVoiceLength("story_v_out_410082", "410082050", "story_v_out_410082.awb") / 1000

					if var_206_14 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_14 + var_206_6
					end

					if var_206_9.prefab_name ~= "" and arg_203_1.actors_[var_206_9.prefab_name] ~= nil then
						local var_206_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_9.prefab_name].transform, "story_v_out_410082", "410082050", "story_v_out_410082.awb")

						arg_203_1:RecordAudio("410082050", var_206_15)
						arg_203_1:RecordAudio("410082050", var_206_15)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410082", "410082050", "story_v_out_410082.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410082", "410082050", "story_v_out_410082.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_16 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_16 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_16

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_16 and arg_203_1.time_ < var_206_6 + var_206_16 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410082051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410082051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play410082052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1056"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1056 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1056", 7)

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
				local var_210_6 = Vector3.New(0, -2000, -180)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1056, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_210_7 = arg_207_1.actors_["1060"].transform
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 then
				arg_207_1.var_.moveOldPos1060 = var_210_7.localPosition
				var_210_7.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("1060", 7)

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
				local var_210_13 = Vector3.New(0, -2000, -40)

				var_210_7.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1060, var_210_13, var_210_12)
			end

			if arg_207_1.time_ >= var_210_8 + var_210_11 and arg_207_1.time_ < var_210_8 + var_210_11 + arg_210_0 then
				var_210_7.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_210_14 = 0
			local var_210_15 = 0.875

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

				local var_210_16 = arg_207_1:GetWordFromCfg(410082051)
				local var_210_17 = arg_207_1:FormatText(var_210_16.content)

				arg_207_1.text_.text = var_210_17

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_18 = 35
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
	Play410082052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 410082052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play410082053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.95

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

				local var_214_2 = arg_211_1:GetWordFromCfg(410082052)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 38
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
	Play410082053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 410082053
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play410082054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 1.45

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_2 = arg_215_1:GetWordFromCfg(410082053)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 58
				local var_218_5 = utf8.len(var_218_3)
				local var_218_6 = var_218_4 <= 0 and var_218_1 or var_218_1 * (var_218_5 / var_218_4)

				if var_218_6 > 0 and var_218_1 < var_218_6 then
					arg_215_1.talkMaxDuration = var_218_6

					if var_218_6 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_6 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_3
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_7 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_7 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_7

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_7 and arg_215_1.time_ < var_218_0 + var_218_7 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play410082054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 410082054
		arg_219_1.duration_ = 5.4

		local var_219_0 = {
			zh = 1.4,
			ja = 5.4
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
				arg_219_0:Play410082055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1060"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1060 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1060", 2)

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
				local var_222_6 = Vector3.New(-390, -435, -40)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1060, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_222_7 = arg_219_1.actors_["1056"].transform
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 then
				arg_219_1.var_.moveOldPos1056 = var_222_7.localPosition
				var_222_7.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1056", 3)

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
				local var_222_13 = Vector3.New(0, -350, -180)

				var_222_7.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1056, var_222_13, var_222_12)
			end

			if arg_219_1.time_ >= var_222_8 + var_222_11 and arg_219_1.time_ < var_222_8 + var_222_11 + arg_222_0 then
				var_222_7.localPosition = Vector3.New(0, -350, -180)
			end

			local var_222_14 = "1012"

			if arg_219_1.actors_[var_222_14] == nil then
				local var_222_15 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_222_14), arg_219_1.canvasGo_.transform)

				var_222_15.transform:SetSiblingIndex(1)

				var_222_15.name = var_222_14
				var_222_15.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_219_1.actors_[var_222_14] = var_222_15
			end

			local var_222_16 = arg_219_1.actors_["1012"].transform
			local var_222_17 = 0

			if var_222_17 < arg_219_1.time_ and arg_219_1.time_ <= var_222_17 + arg_222_0 then
				arg_219_1.var_.moveOldPos1012 = var_222_16.localPosition
				var_222_16.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("1012", 4)

				local var_222_18 = var_222_16.childCount

				for iter_222_2 = 0, var_222_18 - 1 do
					local var_222_19 = var_222_16:GetChild(iter_222_2)

					if var_222_19.name == "" or not string.find(var_222_19.name, "split") then
						var_222_19.gameObject:SetActive(true)
					else
						var_222_19.gameObject:SetActive(false)
					end
				end
			end

			local var_222_20 = 0.001

			if var_222_17 <= arg_219_1.time_ and arg_219_1.time_ < var_222_17 + var_222_20 then
				local var_222_21 = (arg_219_1.time_ - var_222_17) / var_222_20
				local var_222_22 = Vector3.New(390, -465, 300)

				var_222_16.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1012, var_222_22, var_222_21)
			end

			if arg_219_1.time_ >= var_222_17 + var_222_20 and arg_219_1.time_ < var_222_17 + var_222_20 + arg_222_0 then
				var_222_16.localPosition = Vector3.New(390, -465, 300)
			end

			local var_222_23 = arg_219_1.actors_["1060"]
			local var_222_24 = 0

			if var_222_24 < arg_219_1.time_ and arg_219_1.time_ <= var_222_24 + arg_222_0 and arg_219_1.var_.actorSpriteComps1060 == nil then
				arg_219_1.var_.actorSpriteComps1060 = var_222_23:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_25 = 0.034

			if var_222_24 <= arg_219_1.time_ and arg_219_1.time_ < var_222_24 + var_222_25 then
				local var_222_26 = (arg_219_1.time_ - var_222_24) / var_222_25

				if arg_219_1.var_.actorSpriteComps1060 then
					for iter_222_3, iter_222_4 in pairs(arg_219_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_222_4 then
							local var_222_27 = Mathf.Lerp(iter_222_4.color.r, 1, var_222_26)

							iter_222_4.color = Color.New(var_222_27, var_222_27, var_222_27)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_24 + var_222_25 and arg_219_1.time_ < var_222_24 + var_222_25 + arg_222_0 and arg_219_1.var_.actorSpriteComps1060 then
				local var_222_28 = 1

				for iter_222_5, iter_222_6 in pairs(arg_219_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_222_6 then
						iter_222_6.color = Color.New(var_222_28, var_222_28, var_222_28)
					end
				end

				arg_219_1.var_.actorSpriteComps1060 = nil
			end

			local var_222_29 = arg_219_1.actors_["1056"]
			local var_222_30 = 0

			if var_222_30 < arg_219_1.time_ and arg_219_1.time_ <= var_222_30 + arg_222_0 and arg_219_1.var_.actorSpriteComps1056 == nil then
				arg_219_1.var_.actorSpriteComps1056 = var_222_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_31 = 0.034

			if var_222_30 <= arg_219_1.time_ and arg_219_1.time_ < var_222_30 + var_222_31 then
				local var_222_32 = (arg_219_1.time_ - var_222_30) / var_222_31

				if arg_219_1.var_.actorSpriteComps1056 then
					for iter_222_7, iter_222_8 in pairs(arg_219_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_222_8 then
							local var_222_33 = Mathf.Lerp(iter_222_8.color.r, 0.5, var_222_32)

							iter_222_8.color = Color.New(var_222_33, var_222_33, var_222_33)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_30 + var_222_31 and arg_219_1.time_ < var_222_30 + var_222_31 + arg_222_0 and arg_219_1.var_.actorSpriteComps1056 then
				local var_222_34 = 0.5

				for iter_222_9, iter_222_10 in pairs(arg_219_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_222_10 then
						iter_222_10.color = Color.New(var_222_34, var_222_34, var_222_34)
					end
				end

				arg_219_1.var_.actorSpriteComps1056 = nil
			end

			local var_222_35 = arg_219_1.actors_["1012"]
			local var_222_36 = 0

			if var_222_36 < arg_219_1.time_ and arg_219_1.time_ <= var_222_36 + arg_222_0 and arg_219_1.var_.actorSpriteComps1012 == nil then
				arg_219_1.var_.actorSpriteComps1012 = var_222_35:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_37 = 0.034

			if var_222_36 <= arg_219_1.time_ and arg_219_1.time_ < var_222_36 + var_222_37 then
				local var_222_38 = (arg_219_1.time_ - var_222_36) / var_222_37

				if arg_219_1.var_.actorSpriteComps1012 then
					for iter_222_11, iter_222_12 in pairs(arg_219_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_222_12 then
							local var_222_39 = Mathf.Lerp(iter_222_12.color.r, 0.5, var_222_38)

							iter_222_12.color = Color.New(var_222_39, var_222_39, var_222_39)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_36 + var_222_37 and arg_219_1.time_ < var_222_36 + var_222_37 + arg_222_0 and arg_219_1.var_.actorSpriteComps1012 then
				local var_222_40 = 0.5

				for iter_222_13, iter_222_14 in pairs(arg_219_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_222_14 then
						iter_222_14.color = Color.New(var_222_40, var_222_40, var_222_40)
					end
				end

				arg_219_1.var_.actorSpriteComps1012 = nil
			end

			local var_222_41 = 0
			local var_222_42 = 0.1

			if var_222_41 < arg_219_1.time_ and arg_219_1.time_ <= var_222_41 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_43 = arg_219_1:FormatText(StoryNameCfg[584].name)

				arg_219_1.leftNameTxt_.text = var_222_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_44 = arg_219_1:GetWordFromCfg(410082054)
				local var_222_45 = arg_219_1:FormatText(var_222_44.content)

				arg_219_1.text_.text = var_222_45

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_46 = 4
				local var_222_47 = utf8.len(var_222_45)
				local var_222_48 = var_222_46 <= 0 and var_222_42 or var_222_42 * (var_222_47 / var_222_46)

				if var_222_48 > 0 and var_222_42 < var_222_48 then
					arg_219_1.talkMaxDuration = var_222_48

					if var_222_48 + var_222_41 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_48 + var_222_41
					end
				end

				arg_219_1.text_.text = var_222_45
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082054", "story_v_out_410082.awb") ~= 0 then
					local var_222_49 = manager.audio:GetVoiceLength("story_v_out_410082", "410082054", "story_v_out_410082.awb") / 1000

					if var_222_49 + var_222_41 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_49 + var_222_41
					end

					if var_222_44.prefab_name ~= "" and arg_219_1.actors_[var_222_44.prefab_name] ~= nil then
						local var_222_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_44.prefab_name].transform, "story_v_out_410082", "410082054", "story_v_out_410082.awb")

						arg_219_1:RecordAudio("410082054", var_222_50)
						arg_219_1:RecordAudio("410082054", var_222_50)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_410082", "410082054", "story_v_out_410082.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_410082", "410082054", "story_v_out_410082.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_51 = math.max(var_222_42, arg_219_1.talkMaxDuration)

			if var_222_41 <= arg_219_1.time_ and arg_219_1.time_ < var_222_41 + var_222_51 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_41) / var_222_51

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_41 + var_222_51 and arg_219_1.time_ < var_222_41 + var_222_51 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play410082055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 410082055
		arg_223_1.duration_ = 2.7

		local var_223_0 = {
			zh = 2.266,
			ja = 2.7
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
				arg_223_0:Play410082056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1056"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1056 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("1056", 3)

				local var_226_2 = var_226_0.childCount

				for iter_226_0 = 0, var_226_2 - 1 do
					local var_226_3 = var_226_0:GetChild(iter_226_0)

					if var_226_3.name == "split_4" or not string.find(var_226_3.name, "split") then
						var_226_3.gameObject:SetActive(true)
					else
						var_226_3.gameObject:SetActive(false)
					end
				end
			end

			local var_226_4 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_4 then
				local var_226_5 = (arg_223_1.time_ - var_226_1) / var_226_4
				local var_226_6 = Vector3.New(0, -350, -180)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1056, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_226_7 = arg_223_1.actors_["1056"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps1056 == nil then
				arg_223_1.var_.actorSpriteComps1056 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 0.034

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps1056 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_226_2 then
							local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 1, var_226_10)

							iter_226_2.color = Color.New(var_226_11, var_226_11, var_226_11)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps1056 then
				local var_226_12 = 1

				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_226_4 then
						iter_226_4.color = Color.New(var_226_12, var_226_12, var_226_12)
					end
				end

				arg_223_1.var_.actorSpriteComps1056 = nil
			end

			local var_226_13 = arg_223_1.actors_["1060"]
			local var_226_14 = 0

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 and arg_223_1.var_.actorSpriteComps1060 == nil then
				arg_223_1.var_.actorSpriteComps1060 = var_226_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_15 = 0.034

			if var_226_14 <= arg_223_1.time_ and arg_223_1.time_ < var_226_14 + var_226_15 then
				local var_226_16 = (arg_223_1.time_ - var_226_14) / var_226_15

				if arg_223_1.var_.actorSpriteComps1060 then
					for iter_226_5, iter_226_6 in pairs(arg_223_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_226_6 then
							local var_226_17 = Mathf.Lerp(iter_226_6.color.r, 0.5, var_226_16)

							iter_226_6.color = Color.New(var_226_17, var_226_17, var_226_17)
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_14 + var_226_15 and arg_223_1.time_ < var_226_14 + var_226_15 + arg_226_0 and arg_223_1.var_.actorSpriteComps1060 then
				local var_226_18 = 0.5

				for iter_226_7, iter_226_8 in pairs(arg_223_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_226_8 then
						iter_226_8.color = Color.New(var_226_18, var_226_18, var_226_18)
					end
				end

				arg_223_1.var_.actorSpriteComps1060 = nil
			end

			local var_226_19 = 0
			local var_226_20 = 0.225

			if var_226_19 < arg_223_1.time_ and arg_223_1.time_ <= var_226_19 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_21 = arg_223_1:FormatText(StoryNameCfg[605].name)

				arg_223_1.leftNameTxt_.text = var_226_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_22 = arg_223_1:GetWordFromCfg(410082055)
				local var_226_23 = arg_223_1:FormatText(var_226_22.content)

				arg_223_1.text_.text = var_226_23

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_24 = 9
				local var_226_25 = utf8.len(var_226_23)
				local var_226_26 = var_226_24 <= 0 and var_226_20 or var_226_20 * (var_226_25 / var_226_24)

				if var_226_26 > 0 and var_226_20 < var_226_26 then
					arg_223_1.talkMaxDuration = var_226_26

					if var_226_26 + var_226_19 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_26 + var_226_19
					end
				end

				arg_223_1.text_.text = var_226_23
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082055", "story_v_out_410082.awb") ~= 0 then
					local var_226_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082055", "story_v_out_410082.awb") / 1000

					if var_226_27 + var_226_19 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_27 + var_226_19
					end

					if var_226_22.prefab_name ~= "" and arg_223_1.actors_[var_226_22.prefab_name] ~= nil then
						local var_226_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_22.prefab_name].transform, "story_v_out_410082", "410082055", "story_v_out_410082.awb")

						arg_223_1:RecordAudio("410082055", var_226_28)
						arg_223_1:RecordAudio("410082055", var_226_28)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_410082", "410082055", "story_v_out_410082.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_410082", "410082055", "story_v_out_410082.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_29 = math.max(var_226_20, arg_223_1.talkMaxDuration)

			if var_226_19 <= arg_223_1.time_ and arg_223_1.time_ < var_226_19 + var_226_29 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_19) / var_226_29

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_19 + var_226_29 and arg_223_1.time_ < var_226_19 + var_226_29 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play410082056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 410082056
		arg_227_1.duration_ = 6.9

		local var_227_0 = {
			zh = 3.666,
			ja = 6.9
		}
		local var_227_1 = manager.audio:GetLocalizationFlag()

		if var_227_0[var_227_1] ~= nil then
			arg_227_1.duration_ = var_227_0[var_227_1]
		end

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play410082057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1012"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1012 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("1012", 4)

				local var_230_2 = var_230_0.childCount

				for iter_230_0 = 0, var_230_2 - 1 do
					local var_230_3 = var_230_0:GetChild(iter_230_0)

					if var_230_3.name == "split_3" or not string.find(var_230_3.name, "split") then
						var_230_3.gameObject:SetActive(true)
					else
						var_230_3.gameObject:SetActive(false)
					end
				end
			end

			local var_230_4 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_1) / var_230_4
				local var_230_6 = Vector3.New(390, -465, 300)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1012, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_230_7 = arg_227_1.actors_["1012"]
			local var_230_8 = 0

			if var_230_8 < arg_227_1.time_ and arg_227_1.time_ <= var_230_8 + arg_230_0 and arg_227_1.var_.actorSpriteComps1012 == nil then
				arg_227_1.var_.actorSpriteComps1012 = var_230_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_9 = 0.034

			if var_230_8 <= arg_227_1.time_ and arg_227_1.time_ < var_230_8 + var_230_9 then
				local var_230_10 = (arg_227_1.time_ - var_230_8) / var_230_9

				if arg_227_1.var_.actorSpriteComps1012 then
					for iter_230_1, iter_230_2 in pairs(arg_227_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_230_2 then
							local var_230_11 = Mathf.Lerp(iter_230_2.color.r, 1, var_230_10)

							iter_230_2.color = Color.New(var_230_11, var_230_11, var_230_11)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_8 + var_230_9 and arg_227_1.time_ < var_230_8 + var_230_9 + arg_230_0 and arg_227_1.var_.actorSpriteComps1012 then
				local var_230_12 = 1

				for iter_230_3, iter_230_4 in pairs(arg_227_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_230_4 then
						iter_230_4.color = Color.New(var_230_12, var_230_12, var_230_12)
					end
				end

				arg_227_1.var_.actorSpriteComps1012 = nil
			end

			local var_230_13 = arg_227_1.actors_["1056"]
			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 and arg_227_1.var_.actorSpriteComps1056 == nil then
				arg_227_1.var_.actorSpriteComps1056 = var_230_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_230_15 = 0.034

			if var_230_14 <= arg_227_1.time_ and arg_227_1.time_ < var_230_14 + var_230_15 then
				local var_230_16 = (arg_227_1.time_ - var_230_14) / var_230_15

				if arg_227_1.var_.actorSpriteComps1056 then
					for iter_230_5, iter_230_6 in pairs(arg_227_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_230_6 then
							local var_230_17 = Mathf.Lerp(iter_230_6.color.r, 0.5, var_230_16)

							iter_230_6.color = Color.New(var_230_17, var_230_17, var_230_17)
						end
					end
				end
			end

			if arg_227_1.time_ >= var_230_14 + var_230_15 and arg_227_1.time_ < var_230_14 + var_230_15 + arg_230_0 and arg_227_1.var_.actorSpriteComps1056 then
				local var_230_18 = 0.5

				for iter_230_7, iter_230_8 in pairs(arg_227_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_230_8 then
						iter_230_8.color = Color.New(var_230_18, var_230_18, var_230_18)
					end
				end

				arg_227_1.var_.actorSpriteComps1056 = nil
			end

			local var_230_19 = 0
			local var_230_20 = 0.5

			if var_230_19 < arg_227_1.time_ and arg_227_1.time_ <= var_230_19 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_21 = arg_227_1:FormatText(StoryNameCfg[595].name)

				arg_227_1.leftNameTxt_.text = var_230_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_22 = arg_227_1:GetWordFromCfg(410082056)
				local var_230_23 = arg_227_1:FormatText(var_230_22.content)

				arg_227_1.text_.text = var_230_23

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_24 = 20
				local var_230_25 = utf8.len(var_230_23)
				local var_230_26 = var_230_24 <= 0 and var_230_20 or var_230_20 * (var_230_25 / var_230_24)

				if var_230_26 > 0 and var_230_20 < var_230_26 then
					arg_227_1.talkMaxDuration = var_230_26

					if var_230_26 + var_230_19 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_26 + var_230_19
					end
				end

				arg_227_1.text_.text = var_230_23
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082056", "story_v_out_410082.awb") ~= 0 then
					local var_230_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082056", "story_v_out_410082.awb") / 1000

					if var_230_27 + var_230_19 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_27 + var_230_19
					end

					if var_230_22.prefab_name ~= "" and arg_227_1.actors_[var_230_22.prefab_name] ~= nil then
						local var_230_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_22.prefab_name].transform, "story_v_out_410082", "410082056", "story_v_out_410082.awb")

						arg_227_1:RecordAudio("410082056", var_230_28)
						arg_227_1:RecordAudio("410082056", var_230_28)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_410082", "410082056", "story_v_out_410082.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_410082", "410082056", "story_v_out_410082.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_29 = math.max(var_230_20, arg_227_1.talkMaxDuration)

			if var_230_19 <= arg_227_1.time_ and arg_227_1.time_ < var_230_19 + var_230_29 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_19) / var_230_29

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_19 + var_230_29 and arg_227_1.time_ < var_230_19 + var_230_29 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play410082057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 410082057
		arg_231_1.duration_ = 7.366

		local var_231_0 = {
			zh = 4.333,
			ja = 7.366
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
				arg_231_0:Play410082058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1060"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1060 = var_234_0.localPosition
				var_234_0.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("1060", 2)

				local var_234_2 = var_234_0.childCount

				for iter_234_0 = 0, var_234_2 - 1 do
					local var_234_3 = var_234_0:GetChild(iter_234_0)

					if var_234_3.name == "" or not string.find(var_234_3.name, "split") then
						var_234_3.gameObject:SetActive(true)
					else
						var_234_3.gameObject:SetActive(false)
					end
				end
			end

			local var_234_4 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_4 then
				local var_234_5 = (arg_231_1.time_ - var_234_1) / var_234_4
				local var_234_6 = Vector3.New(-390, -435, -40)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1060, var_234_6, var_234_5)
			end

			if arg_231_1.time_ >= var_234_1 + var_234_4 and arg_231_1.time_ < var_234_1 + var_234_4 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_234_7 = arg_231_1.actors_["1060"]
			local var_234_8 = 0

			if var_234_8 < arg_231_1.time_ and arg_231_1.time_ <= var_234_8 + arg_234_0 and arg_231_1.var_.actorSpriteComps1060 == nil then
				arg_231_1.var_.actorSpriteComps1060 = var_234_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_9 = 0.034

			if var_234_8 <= arg_231_1.time_ and arg_231_1.time_ < var_234_8 + var_234_9 then
				local var_234_10 = (arg_231_1.time_ - var_234_8) / var_234_9

				if arg_231_1.var_.actorSpriteComps1060 then
					for iter_234_1, iter_234_2 in pairs(arg_231_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_234_2 then
							local var_234_11 = Mathf.Lerp(iter_234_2.color.r, 1, var_234_10)

							iter_234_2.color = Color.New(var_234_11, var_234_11, var_234_11)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_8 + var_234_9 and arg_231_1.time_ < var_234_8 + var_234_9 + arg_234_0 and arg_231_1.var_.actorSpriteComps1060 then
				local var_234_12 = 1

				for iter_234_3, iter_234_4 in pairs(arg_231_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_234_4 then
						iter_234_4.color = Color.New(var_234_12, var_234_12, var_234_12)
					end
				end

				arg_231_1.var_.actorSpriteComps1060 = nil
			end

			local var_234_13 = arg_231_1.actors_["1012"]
			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 and arg_231_1.var_.actorSpriteComps1012 == nil then
				arg_231_1.var_.actorSpriteComps1012 = var_234_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_15 = 0.034

			if var_234_14 <= arg_231_1.time_ and arg_231_1.time_ < var_234_14 + var_234_15 then
				local var_234_16 = (arg_231_1.time_ - var_234_14) / var_234_15

				if arg_231_1.var_.actorSpriteComps1012 then
					for iter_234_5, iter_234_6 in pairs(arg_231_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_234_6 then
							local var_234_17 = Mathf.Lerp(iter_234_6.color.r, 0.5, var_234_16)

							iter_234_6.color = Color.New(var_234_17, var_234_17, var_234_17)
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_14 + var_234_15 and arg_231_1.time_ < var_234_14 + var_234_15 + arg_234_0 and arg_231_1.var_.actorSpriteComps1012 then
				local var_234_18 = 0.5

				for iter_234_7, iter_234_8 in pairs(arg_231_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_234_8 then
						iter_234_8.color = Color.New(var_234_18, var_234_18, var_234_18)
					end
				end

				arg_231_1.var_.actorSpriteComps1012 = nil
			end

			local var_234_19 = 0
			local var_234_20 = 0.575

			if var_234_19 < arg_231_1.time_ and arg_231_1.time_ <= var_234_19 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_21 = arg_231_1:FormatText(StoryNameCfg[584].name)

				arg_231_1.leftNameTxt_.text = var_234_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_22 = arg_231_1:GetWordFromCfg(410082057)
				local var_234_23 = arg_231_1:FormatText(var_234_22.content)

				arg_231_1.text_.text = var_234_23

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_24 = 23
				local var_234_25 = utf8.len(var_234_23)
				local var_234_26 = var_234_24 <= 0 and var_234_20 or var_234_20 * (var_234_25 / var_234_24)

				if var_234_26 > 0 and var_234_20 < var_234_26 then
					arg_231_1.talkMaxDuration = var_234_26

					if var_234_26 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_26 + var_234_19
					end
				end

				arg_231_1.text_.text = var_234_23
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082057", "story_v_out_410082.awb") ~= 0 then
					local var_234_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082057", "story_v_out_410082.awb") / 1000

					if var_234_27 + var_234_19 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_27 + var_234_19
					end

					if var_234_22.prefab_name ~= "" and arg_231_1.actors_[var_234_22.prefab_name] ~= nil then
						local var_234_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_22.prefab_name].transform, "story_v_out_410082", "410082057", "story_v_out_410082.awb")

						arg_231_1:RecordAudio("410082057", var_234_28)
						arg_231_1:RecordAudio("410082057", var_234_28)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_410082", "410082057", "story_v_out_410082.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_410082", "410082057", "story_v_out_410082.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_29 = math.max(var_234_20, arg_231_1.talkMaxDuration)

			if var_234_19 <= arg_231_1.time_ and arg_231_1.time_ < var_234_19 + var_234_29 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_19) / var_234_29

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_19 + var_234_29 and arg_231_1.time_ < var_234_19 + var_234_29 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play410082058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 410082058
		arg_235_1.duration_ = 8

		local var_235_0 = {
			zh = 4.833,
			ja = 8
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
				arg_235_0:Play410082059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1012"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1012 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("1012", 4)

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
				local var_238_6 = Vector3.New(390, -465, 300)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1012, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_238_7 = arg_235_1.actors_["1012"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps1012 == nil then
				arg_235_1.var_.actorSpriteComps1012 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.034

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps1012 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 1, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps1012 then
				local var_238_12 = 1

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps1012 = nil
			end

			local var_238_13 = arg_235_1.actors_["1060"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 and arg_235_1.var_.actorSpriteComps1060 == nil then
				arg_235_1.var_.actorSpriteComps1060 = var_238_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_15 = 0.034

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_15 then
				local var_238_16 = (arg_235_1.time_ - var_238_14) / var_238_15

				if arg_235_1.var_.actorSpriteComps1060 then
					for iter_238_5, iter_238_6 in pairs(arg_235_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_238_6 then
							local var_238_17 = Mathf.Lerp(iter_238_6.color.r, 0.5, var_238_16)

							iter_238_6.color = Color.New(var_238_17, var_238_17, var_238_17)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_15 and arg_235_1.time_ < var_238_14 + var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps1060 then
				local var_238_18 = 0.5

				for iter_238_7, iter_238_8 in pairs(arg_235_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_238_8 then
						iter_238_8.color = Color.New(var_238_18, var_238_18, var_238_18)
					end
				end

				arg_235_1.var_.actorSpriteComps1060 = nil
			end

			local var_238_19 = 0
			local var_238_20 = 0.7

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_21 = arg_235_1:FormatText(StoryNameCfg[595].name)

				arg_235_1.leftNameTxt_.text = var_238_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(410082058)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082058", "story_v_out_410082.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082058", "story_v_out_410082.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_410082", "410082058", "story_v_out_410082.awb")

						arg_235_1:RecordAudio("410082058", var_238_28)
						arg_235_1:RecordAudio("410082058", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_410082", "410082058", "story_v_out_410082.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_410082", "410082058", "story_v_out_410082.awb")
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
	Play410082059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 410082059
		arg_239_1.duration_ = 9

		local var_239_0 = {
			zh = 4.6,
			ja = 9
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
				arg_239_0:Play410082060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.675

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[595].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(410082059)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 27
				local var_242_6 = utf8.len(var_242_4)
				local var_242_7 = var_242_5 <= 0 and var_242_1 or var_242_1 * (var_242_6 / var_242_5)

				if var_242_7 > 0 and var_242_1 < var_242_7 then
					arg_239_1.talkMaxDuration = var_242_7

					if var_242_7 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_7 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_4
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082059", "story_v_out_410082.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082059", "story_v_out_410082.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_410082", "410082059", "story_v_out_410082.awb")

						arg_239_1:RecordAudio("410082059", var_242_9)
						arg_239_1:RecordAudio("410082059", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_410082", "410082059", "story_v_out_410082.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_410082", "410082059", "story_v_out_410082.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_10 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_10

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_10 and arg_239_1.time_ < var_242_0 + var_242_10 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play410082060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 410082060
		arg_243_1.duration_ = 14.866

		local var_243_0 = {
			zh = 8.6,
			ja = 14.866
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
				arg_243_0:Play410082061(arg_243_1)
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

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[595].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(410082060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082060", "story_v_out_410082.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082060", "story_v_out_410082.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_410082", "410082060", "story_v_out_410082.awb")

						arg_243_1:RecordAudio("410082060", var_246_9)
						arg_243_1:RecordAudio("410082060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_410082", "410082060", "story_v_out_410082.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_410082", "410082060", "story_v_out_410082.awb")
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
	Play410082061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 410082061
		arg_247_1.duration_ = 5.633

		local var_247_0 = {
			zh = 5.633,
			ja = 4.666
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
				arg_247_0:Play410082062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1056"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1056 = var_250_0.localPosition
				var_250_0.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("1056", 3)

				local var_250_2 = var_250_0.childCount

				for iter_250_0 = 0, var_250_2 - 1 do
					local var_250_3 = var_250_0:GetChild(iter_250_0)

					if var_250_3.name == "split_2" or not string.find(var_250_3.name, "split") then
						var_250_3.gameObject:SetActive(true)
					else
						var_250_3.gameObject:SetActive(false)
					end
				end
			end

			local var_250_4 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_4 then
				local var_250_5 = (arg_247_1.time_ - var_250_1) / var_250_4
				local var_250_6 = Vector3.New(0, -350, -180)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1056, var_250_6, var_250_5)
			end

			if arg_247_1.time_ >= var_250_1 + var_250_4 and arg_247_1.time_ < var_250_1 + var_250_4 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_250_7 = arg_247_1.actors_["1056"]
			local var_250_8 = 0

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 and arg_247_1.var_.actorSpriteComps1056 == nil then
				arg_247_1.var_.actorSpriteComps1056 = var_250_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_9 = 0.034

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_9 then
				local var_250_10 = (arg_247_1.time_ - var_250_8) / var_250_9

				if arg_247_1.var_.actorSpriteComps1056 then
					for iter_250_1, iter_250_2 in pairs(arg_247_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_250_2 then
							local var_250_11 = Mathf.Lerp(iter_250_2.color.r, 1, var_250_10)

							iter_250_2.color = Color.New(var_250_11, var_250_11, var_250_11)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_8 + var_250_9 and arg_247_1.time_ < var_250_8 + var_250_9 + arg_250_0 and arg_247_1.var_.actorSpriteComps1056 then
				local var_250_12 = 1

				for iter_250_3, iter_250_4 in pairs(arg_247_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_250_4 then
						iter_250_4.color = Color.New(var_250_12, var_250_12, var_250_12)
					end
				end

				arg_247_1.var_.actorSpriteComps1056 = nil
			end

			local var_250_13 = arg_247_1.actors_["1012"]
			local var_250_14 = 0

			if var_250_14 < arg_247_1.time_ and arg_247_1.time_ <= var_250_14 + arg_250_0 and arg_247_1.var_.actorSpriteComps1012 == nil then
				arg_247_1.var_.actorSpriteComps1012 = var_250_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_15 = 0.034

			if var_250_14 <= arg_247_1.time_ and arg_247_1.time_ < var_250_14 + var_250_15 then
				local var_250_16 = (arg_247_1.time_ - var_250_14) / var_250_15

				if arg_247_1.var_.actorSpriteComps1012 then
					for iter_250_5, iter_250_6 in pairs(arg_247_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_250_6 then
							local var_250_17 = Mathf.Lerp(iter_250_6.color.r, 0.5, var_250_16)

							iter_250_6.color = Color.New(var_250_17, var_250_17, var_250_17)
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_14 + var_250_15 and arg_247_1.time_ < var_250_14 + var_250_15 + arg_250_0 and arg_247_1.var_.actorSpriteComps1012 then
				local var_250_18 = 0.5

				for iter_250_7, iter_250_8 in pairs(arg_247_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_250_8 then
						iter_250_8.color = Color.New(var_250_18, var_250_18, var_250_18)
					end
				end

				arg_247_1.var_.actorSpriteComps1012 = nil
			end

			local var_250_19 = 0
			local var_250_20 = 0.7

			if var_250_19 < arg_247_1.time_ and arg_247_1.time_ <= var_250_19 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_21 = arg_247_1:FormatText(StoryNameCfg[605].name)

				arg_247_1.leftNameTxt_.text = var_250_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_22 = arg_247_1:GetWordFromCfg(410082061)
				local var_250_23 = arg_247_1:FormatText(var_250_22.content)

				arg_247_1.text_.text = var_250_23

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_24 = 28
				local var_250_25 = utf8.len(var_250_23)
				local var_250_26 = var_250_24 <= 0 and var_250_20 or var_250_20 * (var_250_25 / var_250_24)

				if var_250_26 > 0 and var_250_20 < var_250_26 then
					arg_247_1.talkMaxDuration = var_250_26

					if var_250_26 + var_250_19 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_26 + var_250_19
					end
				end

				arg_247_1.text_.text = var_250_23
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082061", "story_v_out_410082.awb") ~= 0 then
					local var_250_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082061", "story_v_out_410082.awb") / 1000

					if var_250_27 + var_250_19 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_27 + var_250_19
					end

					if var_250_22.prefab_name ~= "" and arg_247_1.actors_[var_250_22.prefab_name] ~= nil then
						local var_250_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_22.prefab_name].transform, "story_v_out_410082", "410082061", "story_v_out_410082.awb")

						arg_247_1:RecordAudio("410082061", var_250_28)
						arg_247_1:RecordAudio("410082061", var_250_28)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_410082", "410082061", "story_v_out_410082.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_410082", "410082061", "story_v_out_410082.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_29 = math.max(var_250_20, arg_247_1.talkMaxDuration)

			if var_250_19 <= arg_247_1.time_ and arg_247_1.time_ < var_250_19 + var_250_29 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_19) / var_250_29

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_19 + var_250_29 and arg_247_1.time_ < var_250_19 + var_250_29 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play410082062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410082062
		arg_251_1.duration_ = 4.533

		local var_251_0 = {
			zh = 1.833,
			ja = 4.533
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
				arg_251_0:Play410082063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1012"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1012 = var_254_0.localPosition
				var_254_0.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("1012", 4)

				local var_254_2 = var_254_0.childCount

				for iter_254_0 = 0, var_254_2 - 1 do
					local var_254_3 = var_254_0:GetChild(iter_254_0)

					if var_254_3.name == "" or not string.find(var_254_3.name, "split") then
						var_254_3.gameObject:SetActive(true)
					else
						var_254_3.gameObject:SetActive(false)
					end
				end
			end

			local var_254_4 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_4 then
				local var_254_5 = (arg_251_1.time_ - var_254_1) / var_254_4
				local var_254_6 = Vector3.New(390, -465, 300)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1012, var_254_6, var_254_5)
			end

			if arg_251_1.time_ >= var_254_1 + var_254_4 and arg_251_1.time_ < var_254_1 + var_254_4 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_254_7 = arg_251_1.actors_["1012"]
			local var_254_8 = 0

			if var_254_8 < arg_251_1.time_ and arg_251_1.time_ <= var_254_8 + arg_254_0 and arg_251_1.var_.actorSpriteComps1012 == nil then
				arg_251_1.var_.actorSpriteComps1012 = var_254_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_9 = 0.034

			if var_254_8 <= arg_251_1.time_ and arg_251_1.time_ < var_254_8 + var_254_9 then
				local var_254_10 = (arg_251_1.time_ - var_254_8) / var_254_9

				if arg_251_1.var_.actorSpriteComps1012 then
					for iter_254_1, iter_254_2 in pairs(arg_251_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_254_2 then
							local var_254_11 = Mathf.Lerp(iter_254_2.color.r, 1, var_254_10)

							iter_254_2.color = Color.New(var_254_11, var_254_11, var_254_11)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_8 + var_254_9 and arg_251_1.time_ < var_254_8 + var_254_9 + arg_254_0 and arg_251_1.var_.actorSpriteComps1012 then
				local var_254_12 = 1

				for iter_254_3, iter_254_4 in pairs(arg_251_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_254_4 then
						iter_254_4.color = Color.New(var_254_12, var_254_12, var_254_12)
					end
				end

				arg_251_1.var_.actorSpriteComps1012 = nil
			end

			local var_254_13 = arg_251_1.actors_["1056"]
			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 and arg_251_1.var_.actorSpriteComps1056 == nil then
				arg_251_1.var_.actorSpriteComps1056 = var_254_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_15 = 0.034

			if var_254_14 <= arg_251_1.time_ and arg_251_1.time_ < var_254_14 + var_254_15 then
				local var_254_16 = (arg_251_1.time_ - var_254_14) / var_254_15

				if arg_251_1.var_.actorSpriteComps1056 then
					for iter_254_5, iter_254_6 in pairs(arg_251_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_254_6 then
							local var_254_17 = Mathf.Lerp(iter_254_6.color.r, 0.5, var_254_16)

							iter_254_6.color = Color.New(var_254_17, var_254_17, var_254_17)
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_14 + var_254_15 and arg_251_1.time_ < var_254_14 + var_254_15 + arg_254_0 and arg_251_1.var_.actorSpriteComps1056 then
				local var_254_18 = 0.5

				for iter_254_7, iter_254_8 in pairs(arg_251_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_254_8 then
						iter_254_8.color = Color.New(var_254_18, var_254_18, var_254_18)
					end
				end

				arg_251_1.var_.actorSpriteComps1056 = nil
			end

			local var_254_19 = 0
			local var_254_20 = 0.15

			if var_254_19 < arg_251_1.time_ and arg_251_1.time_ <= var_254_19 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_21 = arg_251_1:FormatText(StoryNameCfg[595].name)

				arg_251_1.leftNameTxt_.text = var_254_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_22 = arg_251_1:GetWordFromCfg(410082062)
				local var_254_23 = arg_251_1:FormatText(var_254_22.content)

				arg_251_1.text_.text = var_254_23

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_24 = 6
				local var_254_25 = utf8.len(var_254_23)
				local var_254_26 = var_254_24 <= 0 and var_254_20 or var_254_20 * (var_254_25 / var_254_24)

				if var_254_26 > 0 and var_254_20 < var_254_26 then
					arg_251_1.talkMaxDuration = var_254_26

					if var_254_26 + var_254_19 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_26 + var_254_19
					end
				end

				arg_251_1.text_.text = var_254_23
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082062", "story_v_out_410082.awb") ~= 0 then
					local var_254_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082062", "story_v_out_410082.awb") / 1000

					if var_254_27 + var_254_19 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_27 + var_254_19
					end

					if var_254_22.prefab_name ~= "" and arg_251_1.actors_[var_254_22.prefab_name] ~= nil then
						local var_254_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_22.prefab_name].transform, "story_v_out_410082", "410082062", "story_v_out_410082.awb")

						arg_251_1:RecordAudio("410082062", var_254_28)
						arg_251_1:RecordAudio("410082062", var_254_28)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_410082", "410082062", "story_v_out_410082.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_410082", "410082062", "story_v_out_410082.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_29 = math.max(var_254_20, arg_251_1.talkMaxDuration)

			if var_254_19 <= arg_251_1.time_ and arg_251_1.time_ < var_254_19 + var_254_29 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_19) / var_254_29

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_19 + var_254_29 and arg_251_1.time_ < var_254_19 + var_254_29 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play410082063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410082063
		arg_255_1.duration_ = 3.7

		local var_255_0 = {
			zh = 1.066,
			ja = 3.7
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
				arg_255_0:Play410082064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1056"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1056 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1056", 3)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "split_4" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(0, -350, -180)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1056, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_258_7 = arg_255_1.actors_["1056"]
			local var_258_8 = 0

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 and arg_255_1.var_.actorSpriteComps1056 == nil then
				arg_255_1.var_.actorSpriteComps1056 = var_258_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_9 = 0.034

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_9 then
				local var_258_10 = (arg_255_1.time_ - var_258_8) / var_258_9

				if arg_255_1.var_.actorSpriteComps1056 then
					for iter_258_1, iter_258_2 in pairs(arg_255_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_258_2 then
							local var_258_11 = Mathf.Lerp(iter_258_2.color.r, 1, var_258_10)

							iter_258_2.color = Color.New(var_258_11, var_258_11, var_258_11)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_8 + var_258_9 and arg_255_1.time_ < var_258_8 + var_258_9 + arg_258_0 and arg_255_1.var_.actorSpriteComps1056 then
				local var_258_12 = 1

				for iter_258_3, iter_258_4 in pairs(arg_255_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_258_4 then
						iter_258_4.color = Color.New(var_258_12, var_258_12, var_258_12)
					end
				end

				arg_255_1.var_.actorSpriteComps1056 = nil
			end

			local var_258_13 = arg_255_1.actors_["1012"]
			local var_258_14 = 0

			if var_258_14 < arg_255_1.time_ and arg_255_1.time_ <= var_258_14 + arg_258_0 and arg_255_1.var_.actorSpriteComps1012 == nil then
				arg_255_1.var_.actorSpriteComps1012 = var_258_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_15 = 0.034

			if var_258_14 <= arg_255_1.time_ and arg_255_1.time_ < var_258_14 + var_258_15 then
				local var_258_16 = (arg_255_1.time_ - var_258_14) / var_258_15

				if arg_255_1.var_.actorSpriteComps1012 then
					for iter_258_5, iter_258_6 in pairs(arg_255_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_258_6 then
							local var_258_17 = Mathf.Lerp(iter_258_6.color.r, 0.5, var_258_16)

							iter_258_6.color = Color.New(var_258_17, var_258_17, var_258_17)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_14 + var_258_15 and arg_255_1.time_ < var_258_14 + var_258_15 + arg_258_0 and arg_255_1.var_.actorSpriteComps1012 then
				local var_258_18 = 0.5

				for iter_258_7, iter_258_8 in pairs(arg_255_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_258_8 then
						iter_258_8.color = Color.New(var_258_18, var_258_18, var_258_18)
					end
				end

				arg_255_1.var_.actorSpriteComps1012 = nil
			end

			local var_258_19 = 0
			local var_258_20 = 0.1

			if var_258_19 < arg_255_1.time_ and arg_255_1.time_ <= var_258_19 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_21 = arg_255_1:FormatText(StoryNameCfg[605].name)

				arg_255_1.leftNameTxt_.text = var_258_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_22 = arg_255_1:GetWordFromCfg(410082063)
				local var_258_23 = arg_255_1:FormatText(var_258_22.content)

				arg_255_1.text_.text = var_258_23

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_24 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082063", "story_v_out_410082.awb") ~= 0 then
					local var_258_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082063", "story_v_out_410082.awb") / 1000

					if var_258_27 + var_258_19 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_27 + var_258_19
					end

					if var_258_22.prefab_name ~= "" and arg_255_1.actors_[var_258_22.prefab_name] ~= nil then
						local var_258_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_22.prefab_name].transform, "story_v_out_410082", "410082063", "story_v_out_410082.awb")

						arg_255_1:RecordAudio("410082063", var_258_28)
						arg_255_1:RecordAudio("410082063", var_258_28)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_410082", "410082063", "story_v_out_410082.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_410082", "410082063", "story_v_out_410082.awb")
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
	Play410082064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410082064
		arg_259_1.duration_ = 7.266

		local var_259_0 = {
			zh = 4.166,
			ja = 7.266
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
				arg_259_0:Play410082065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1012"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1012 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1012", 4)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(390, -465, 300)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1012, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_262_7 = arg_259_1.actors_["1012"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps1012 == nil then
				arg_259_1.var_.actorSpriteComps1012 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.034

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps1012 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 1, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps1012 then
				local var_262_12 = 1

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps1012 = nil
			end

			local var_262_13 = arg_259_1.actors_["1056"]
			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 and arg_259_1.var_.actorSpriteComps1056 == nil then
				arg_259_1.var_.actorSpriteComps1056 = var_262_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_15 = 0.034

			if var_262_14 <= arg_259_1.time_ and arg_259_1.time_ < var_262_14 + var_262_15 then
				local var_262_16 = (arg_259_1.time_ - var_262_14) / var_262_15

				if arg_259_1.var_.actorSpriteComps1056 then
					for iter_262_5, iter_262_6 in pairs(arg_259_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_262_6 then
							local var_262_17 = Mathf.Lerp(iter_262_6.color.r, 0.5, var_262_16)

							iter_262_6.color = Color.New(var_262_17, var_262_17, var_262_17)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps1056 then
				local var_262_18 = 0.5

				for iter_262_7, iter_262_8 in pairs(arg_259_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_262_8 then
						iter_262_8.color = Color.New(var_262_18, var_262_18, var_262_18)
					end
				end

				arg_259_1.var_.actorSpriteComps1056 = nil
			end

			local var_262_19 = 0
			local var_262_20 = 0.525

			if var_262_19 < arg_259_1.time_ and arg_259_1.time_ <= var_262_19 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_21 = arg_259_1:FormatText(StoryNameCfg[595].name)

				arg_259_1.leftNameTxt_.text = var_262_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_22 = arg_259_1:GetWordFromCfg(410082064)
				local var_262_23 = arg_259_1:FormatText(var_262_22.content)

				arg_259_1.text_.text = var_262_23

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_24 = 21
				local var_262_25 = utf8.len(var_262_23)
				local var_262_26 = var_262_24 <= 0 and var_262_20 or var_262_20 * (var_262_25 / var_262_24)

				if var_262_26 > 0 and var_262_20 < var_262_26 then
					arg_259_1.talkMaxDuration = var_262_26

					if var_262_26 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_26 + var_262_19
					end
				end

				arg_259_1.text_.text = var_262_23
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082064", "story_v_out_410082.awb") ~= 0 then
					local var_262_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082064", "story_v_out_410082.awb") / 1000

					if var_262_27 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_27 + var_262_19
					end

					if var_262_22.prefab_name ~= "" and arg_259_1.actors_[var_262_22.prefab_name] ~= nil then
						local var_262_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_22.prefab_name].transform, "story_v_out_410082", "410082064", "story_v_out_410082.awb")

						arg_259_1:RecordAudio("410082064", var_262_28)
						arg_259_1:RecordAudio("410082064", var_262_28)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410082", "410082064", "story_v_out_410082.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410082", "410082064", "story_v_out_410082.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_29 = math.max(var_262_20, arg_259_1.talkMaxDuration)

			if var_262_19 <= arg_259_1.time_ and arg_259_1.time_ < var_262_19 + var_262_29 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_19) / var_262_29

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_19 + var_262_29 and arg_259_1.time_ < var_262_19 + var_262_29 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410082065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410082065
		arg_263_1.duration_ = 7.033

		local var_263_0 = {
			zh = 2.4,
			ja = 7.033
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
				arg_263_0:Play410082066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1056"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1056 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1056", 3)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "split_2" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(0, -350, -180)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1056, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_266_7 = arg_263_1.actors_["1056"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps1056 == nil then
				arg_263_1.var_.actorSpriteComps1056 = var_266_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_9 = 0.034

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_9 then
				local var_266_10 = (arg_263_1.time_ - var_266_8) / var_266_9

				if arg_263_1.var_.actorSpriteComps1056 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_266_2 then
							local var_266_11 = Mathf.Lerp(iter_266_2.color.r, 1, var_266_10)

							iter_266_2.color = Color.New(var_266_11, var_266_11, var_266_11)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_9 and arg_263_1.time_ < var_266_8 + var_266_9 + arg_266_0 and arg_263_1.var_.actorSpriteComps1056 then
				local var_266_12 = 1

				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_266_4 then
						iter_266_4.color = Color.New(var_266_12, var_266_12, var_266_12)
					end
				end

				arg_263_1.var_.actorSpriteComps1056 = nil
			end

			local var_266_13 = arg_263_1.actors_["1012"]
			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 and arg_263_1.var_.actorSpriteComps1012 == nil then
				arg_263_1.var_.actorSpriteComps1012 = var_266_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_15 = 0.034

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_15 then
				local var_266_16 = (arg_263_1.time_ - var_266_14) / var_266_15

				if arg_263_1.var_.actorSpriteComps1012 then
					for iter_266_5, iter_266_6 in pairs(arg_263_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_266_6 then
							local var_266_17 = Mathf.Lerp(iter_266_6.color.r, 0.5, var_266_16)

							iter_266_6.color = Color.New(var_266_17, var_266_17, var_266_17)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_14 + var_266_15 and arg_263_1.time_ < var_266_14 + var_266_15 + arg_266_0 and arg_263_1.var_.actorSpriteComps1012 then
				local var_266_18 = 0.5

				for iter_266_7, iter_266_8 in pairs(arg_263_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_266_8 then
						iter_266_8.color = Color.New(var_266_18, var_266_18, var_266_18)
					end
				end

				arg_263_1.var_.actorSpriteComps1012 = nil
			end

			local var_266_19 = 0
			local var_266_20 = 0.325

			if var_266_19 < arg_263_1.time_ and arg_263_1.time_ <= var_266_19 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_21 = arg_263_1:FormatText(StoryNameCfg[605].name)

				arg_263_1.leftNameTxt_.text = var_266_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_22 = arg_263_1:GetWordFromCfg(410082065)
				local var_266_23 = arg_263_1:FormatText(var_266_22.content)

				arg_263_1.text_.text = var_266_23

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_24 = 13
				local var_266_25 = utf8.len(var_266_23)
				local var_266_26 = var_266_24 <= 0 and var_266_20 or var_266_20 * (var_266_25 / var_266_24)

				if var_266_26 > 0 and var_266_20 < var_266_26 then
					arg_263_1.talkMaxDuration = var_266_26

					if var_266_26 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_26 + var_266_19
					end
				end

				arg_263_1.text_.text = var_266_23
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082065", "story_v_out_410082.awb") ~= 0 then
					local var_266_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082065", "story_v_out_410082.awb") / 1000

					if var_266_27 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_27 + var_266_19
					end

					if var_266_22.prefab_name ~= "" and arg_263_1.actors_[var_266_22.prefab_name] ~= nil then
						local var_266_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_22.prefab_name].transform, "story_v_out_410082", "410082065", "story_v_out_410082.awb")

						arg_263_1:RecordAudio("410082065", var_266_28)
						arg_263_1:RecordAudio("410082065", var_266_28)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_410082", "410082065", "story_v_out_410082.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_410082", "410082065", "story_v_out_410082.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_29 = math.max(var_266_20, arg_263_1.talkMaxDuration)

			if var_266_19 <= arg_263_1.time_ and arg_263_1.time_ < var_266_19 + var_266_29 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_19) / var_266_29

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_19 + var_266_29 and arg_263_1.time_ < var_266_19 + var_266_29 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play410082066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410082066
		arg_267_1.duration_ = 9.5

		local var_267_0 = {
			zh = 5.933,
			ja = 9.5
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
				arg_267_0:Play410082067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1060"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1060 = var_270_0.localPosition
				var_270_0.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("1060", 2)

				local var_270_2 = var_270_0.childCount

				for iter_270_0 = 0, var_270_2 - 1 do
					local var_270_3 = var_270_0:GetChild(iter_270_0)

					if var_270_3.name == "" or not string.find(var_270_3.name, "split") then
						var_270_3.gameObject:SetActive(true)
					else
						var_270_3.gameObject:SetActive(false)
					end
				end
			end

			local var_270_4 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_4 then
				local var_270_5 = (arg_267_1.time_ - var_270_1) / var_270_4
				local var_270_6 = Vector3.New(-390, -435, -40)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1060, var_270_6, var_270_5)
			end

			if arg_267_1.time_ >= var_270_1 + var_270_4 and arg_267_1.time_ < var_270_1 + var_270_4 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_270_7 = arg_267_1.actors_["1060"]
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps1060 == nil then
				arg_267_1.var_.actorSpriteComps1060 = var_270_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_9 = 0.034

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_9 then
				local var_270_10 = (arg_267_1.time_ - var_270_8) / var_270_9

				if arg_267_1.var_.actorSpriteComps1060 then
					for iter_270_1, iter_270_2 in pairs(arg_267_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_270_2 then
							local var_270_11 = Mathf.Lerp(iter_270_2.color.r, 1, var_270_10)

							iter_270_2.color = Color.New(var_270_11, var_270_11, var_270_11)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_8 + var_270_9 and arg_267_1.time_ < var_270_8 + var_270_9 + arg_270_0 and arg_267_1.var_.actorSpriteComps1060 then
				local var_270_12 = 1

				for iter_270_3, iter_270_4 in pairs(arg_267_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_270_4 then
						iter_270_4.color = Color.New(var_270_12, var_270_12, var_270_12)
					end
				end

				arg_267_1.var_.actorSpriteComps1060 = nil
			end

			local var_270_13 = arg_267_1.actors_["1056"]
			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 and arg_267_1.var_.actorSpriteComps1056 == nil then
				arg_267_1.var_.actorSpriteComps1056 = var_270_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_15 = 0.034

			if var_270_14 <= arg_267_1.time_ and arg_267_1.time_ < var_270_14 + var_270_15 then
				local var_270_16 = (arg_267_1.time_ - var_270_14) / var_270_15

				if arg_267_1.var_.actorSpriteComps1056 then
					for iter_270_5, iter_270_6 in pairs(arg_267_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_270_6 then
							local var_270_17 = Mathf.Lerp(iter_270_6.color.r, 0.5, var_270_16)

							iter_270_6.color = Color.New(var_270_17, var_270_17, var_270_17)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_14 + var_270_15 and arg_267_1.time_ < var_270_14 + var_270_15 + arg_270_0 and arg_267_1.var_.actorSpriteComps1056 then
				local var_270_18 = 0.5

				for iter_270_7, iter_270_8 in pairs(arg_267_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_270_8 then
						iter_270_8.color = Color.New(var_270_18, var_270_18, var_270_18)
					end
				end

				arg_267_1.var_.actorSpriteComps1056 = nil
			end

			local var_270_19 = 0
			local var_270_20 = 0.675

			if var_270_19 < arg_267_1.time_ and arg_267_1.time_ <= var_270_19 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_21 = arg_267_1:FormatText(StoryNameCfg[584].name)

				arg_267_1.leftNameTxt_.text = var_270_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_22 = arg_267_1:GetWordFromCfg(410082066)
				local var_270_23 = arg_267_1:FormatText(var_270_22.content)

				arg_267_1.text_.text = var_270_23

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_24 = 27
				local var_270_25 = utf8.len(var_270_23)
				local var_270_26 = var_270_24 <= 0 and var_270_20 or var_270_20 * (var_270_25 / var_270_24)

				if var_270_26 > 0 and var_270_20 < var_270_26 then
					arg_267_1.talkMaxDuration = var_270_26

					if var_270_26 + var_270_19 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_26 + var_270_19
					end
				end

				arg_267_1.text_.text = var_270_23
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082066", "story_v_out_410082.awb") ~= 0 then
					local var_270_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082066", "story_v_out_410082.awb") / 1000

					if var_270_27 + var_270_19 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_27 + var_270_19
					end

					if var_270_22.prefab_name ~= "" and arg_267_1.actors_[var_270_22.prefab_name] ~= nil then
						local var_270_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_22.prefab_name].transform, "story_v_out_410082", "410082066", "story_v_out_410082.awb")

						arg_267_1:RecordAudio("410082066", var_270_28)
						arg_267_1:RecordAudio("410082066", var_270_28)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_410082", "410082066", "story_v_out_410082.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_410082", "410082066", "story_v_out_410082.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_29 = math.max(var_270_20, arg_267_1.talkMaxDuration)

			if var_270_19 <= arg_267_1.time_ and arg_267_1.time_ < var_270_19 + var_270_29 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_19) / var_270_29

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_19 + var_270_29 and arg_267_1.time_ < var_270_19 + var_270_29 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play410082067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410082067
		arg_271_1.duration_ = 9

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play410082068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = "ST61"

			if arg_271_1.bgs_[var_274_0] == nil then
				local var_274_1 = Object.Instantiate(arg_271_1.paintGo_)

				var_274_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_274_0)
				var_274_1.name = var_274_0
				var_274_1.transform.parent = arg_271_1.stage_.transform
				var_274_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_271_1.bgs_[var_274_0] = var_274_1
			end

			local var_274_2 = 2

			if var_274_2 < arg_271_1.time_ and arg_271_1.time_ <= var_274_2 + arg_274_0 then
				local var_274_3 = manager.ui.mainCamera.transform.localPosition
				local var_274_4 = Vector3.New(0, 0, 10) + Vector3.New(var_274_3.x, var_274_3.y, 0)
				local var_274_5 = arg_271_1.bgs_.ST61

				var_274_5.transform.localPosition = var_274_4
				var_274_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_274_6 = var_274_5:GetComponent("SpriteRenderer")

				if var_274_6 and var_274_6.sprite then
					local var_274_7 = (var_274_5.transform.localPosition - var_274_3).z
					local var_274_8 = manager.ui.mainCameraCom_
					local var_274_9 = 2 * var_274_7 * Mathf.Tan(var_274_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_274_10 = var_274_9 * var_274_8.aspect
					local var_274_11 = var_274_6.sprite.bounds.size.x
					local var_274_12 = var_274_6.sprite.bounds.size.y
					local var_274_13 = var_274_10 / var_274_11
					local var_274_14 = var_274_9 / var_274_12
					local var_274_15 = var_274_14 < var_274_13 and var_274_13 or var_274_14

					var_274_5.transform.localScale = Vector3.New(var_274_15, var_274_15, 0)
				end

				for iter_274_0, iter_274_1 in pairs(arg_271_1.bgs_) do
					if iter_274_0 ~= "ST61" then
						iter_274_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_274_16 = 0

			if var_274_16 < arg_271_1.time_ and arg_271_1.time_ <= var_274_16 + arg_274_0 then
				arg_271_1.mask_.enabled = true
				arg_271_1.mask_.raycastTarget = true

				arg_271_1:SetGaussion(false)
			end

			local var_274_17 = 2

			if var_274_16 <= arg_271_1.time_ and arg_271_1.time_ < var_274_16 + var_274_17 then
				local var_274_18 = (arg_271_1.time_ - var_274_16) / var_274_17
				local var_274_19 = Color.New(0, 0, 0)

				var_274_19.a = Mathf.Lerp(0, 1, var_274_18)
				arg_271_1.mask_.color = var_274_19
			end

			if arg_271_1.time_ >= var_274_16 + var_274_17 and arg_271_1.time_ < var_274_16 + var_274_17 + arg_274_0 then
				local var_274_20 = Color.New(0, 0, 0)

				var_274_20.a = 1
				arg_271_1.mask_.color = var_274_20
			end

			local var_274_21 = 2

			if var_274_21 < arg_271_1.time_ and arg_271_1.time_ <= var_274_21 + arg_274_0 then
				arg_271_1.mask_.enabled = true
				arg_271_1.mask_.raycastTarget = true

				arg_271_1:SetGaussion(false)
			end

			local var_274_22 = 2

			if var_274_21 <= arg_271_1.time_ and arg_271_1.time_ < var_274_21 + var_274_22 then
				local var_274_23 = (arg_271_1.time_ - var_274_21) / var_274_22
				local var_274_24 = Color.New(0, 0, 0)

				var_274_24.a = Mathf.Lerp(1, 0, var_274_23)
				arg_271_1.mask_.color = var_274_24
			end

			if arg_271_1.time_ >= var_274_21 + var_274_22 and arg_271_1.time_ < var_274_21 + var_274_22 + arg_274_0 then
				local var_274_25 = Color.New(0, 0, 0)
				local var_274_26 = 0

				arg_271_1.mask_.enabled = false
				var_274_25.a = var_274_26
				arg_271_1.mask_.color = var_274_25
			end

			local var_274_27 = arg_271_1.actors_["1060"].transform
			local var_274_28 = 2

			if var_274_28 < arg_271_1.time_ and arg_271_1.time_ <= var_274_28 + arg_274_0 then
				arg_271_1.var_.moveOldPos1060 = var_274_27.localPosition
				var_274_27.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1060", 7)

				local var_274_29 = var_274_27.childCount

				for iter_274_2 = 0, var_274_29 - 1 do
					local var_274_30 = var_274_27:GetChild(iter_274_2)

					if var_274_30.name == "" or not string.find(var_274_30.name, "split") then
						var_274_30.gameObject:SetActive(true)
					else
						var_274_30.gameObject:SetActive(false)
					end
				end
			end

			local var_274_31 = 0.001

			if var_274_28 <= arg_271_1.time_ and arg_271_1.time_ < var_274_28 + var_274_31 then
				local var_274_32 = (arg_271_1.time_ - var_274_28) / var_274_31
				local var_274_33 = Vector3.New(0, -2000, -40)

				var_274_27.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1060, var_274_33, var_274_32)
			end

			if arg_271_1.time_ >= var_274_28 + var_274_31 and arg_271_1.time_ < var_274_28 + var_274_31 + arg_274_0 then
				var_274_27.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_274_34 = arg_271_1.actors_["1056"].transform
			local var_274_35 = 2

			if var_274_35 < arg_271_1.time_ and arg_271_1.time_ <= var_274_35 + arg_274_0 then
				arg_271_1.var_.moveOldPos1056 = var_274_34.localPosition
				var_274_34.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1056", 7)

				local var_274_36 = var_274_34.childCount

				for iter_274_3 = 0, var_274_36 - 1 do
					local var_274_37 = var_274_34:GetChild(iter_274_3)

					if var_274_37.name == "" or not string.find(var_274_37.name, "split") then
						var_274_37.gameObject:SetActive(true)
					else
						var_274_37.gameObject:SetActive(false)
					end
				end
			end

			local var_274_38 = 0.001

			if var_274_35 <= arg_271_1.time_ and arg_271_1.time_ < var_274_35 + var_274_38 then
				local var_274_39 = (arg_271_1.time_ - var_274_35) / var_274_38
				local var_274_40 = Vector3.New(0, -2000, -180)

				var_274_34.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1056, var_274_40, var_274_39)
			end

			if arg_271_1.time_ >= var_274_35 + var_274_38 and arg_271_1.time_ < var_274_35 + var_274_38 + arg_274_0 then
				var_274_34.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_274_41 = arg_271_1.actors_["1012"].transform
			local var_274_42 = 2

			if var_274_42 < arg_271_1.time_ and arg_271_1.time_ <= var_274_42 + arg_274_0 then
				arg_271_1.var_.moveOldPos1012 = var_274_41.localPosition
				var_274_41.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1012", 7)

				local var_274_43 = var_274_41.childCount

				for iter_274_4 = 0, var_274_43 - 1 do
					local var_274_44 = var_274_41:GetChild(iter_274_4)

					if var_274_44.name == "" or not string.find(var_274_44.name, "split") then
						var_274_44.gameObject:SetActive(true)
					else
						var_274_44.gameObject:SetActive(false)
					end
				end
			end

			local var_274_45 = 0.001

			if var_274_42 <= arg_271_1.time_ and arg_271_1.time_ < var_274_42 + var_274_45 then
				local var_274_46 = (arg_271_1.time_ - var_274_42) / var_274_45
				local var_274_47 = Vector3.New(0, -2000, 300)

				var_274_41.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1012, var_274_47, var_274_46)
			end

			if arg_271_1.time_ >= var_274_42 + var_274_45 and arg_271_1.time_ < var_274_42 + var_274_45 + arg_274_0 then
				var_274_41.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_274_48 = 0
			local var_274_49 = 0.133333333333333

			if var_274_48 < arg_271_1.time_ and arg_271_1.time_ <= var_274_48 + arg_274_0 then
				local var_274_50 = "play"
				local var_274_51 = "music"

				arg_271_1:AudioAction(var_274_50, var_274_51, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_274_52 = 0.266666666666667
			local var_274_53 = 1

			if var_274_52 < arg_271_1.time_ and arg_271_1.time_ <= var_274_52 + arg_274_0 then
				local var_274_54 = "play"
				local var_274_55 = "music"

				arg_271_1:AudioAction(var_274_54, var_274_55, "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism.awb")
			end

			if arg_271_1.frameCnt_ <= 1 then
				arg_271_1.dialog_:SetActive(false)
			end

			local var_274_56 = 4
			local var_274_57 = 1.475

			if var_274_56 < arg_271_1.time_ and arg_271_1.time_ <= var_274_56 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0

				arg_271_1.dialog_:SetActive(true)

				local var_274_58 = LeanTween.value(arg_271_1.dialog_, 0, 1, 0.3)

				var_274_58:setOnUpdate(LuaHelper.FloatAction(function(arg_275_0)
					arg_271_1.dialogCg_.alpha = arg_275_0
				end))
				var_274_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_271_1.dialog_)
					var_274_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_271_1.duration_ = arg_271_1.duration_ + 0.3

				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_59 = arg_271_1:GetWordFromCfg(410082067)
				local var_274_60 = arg_271_1:FormatText(var_274_59.content)

				arg_271_1.text_.text = var_274_60

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_61 = 59
				local var_274_62 = utf8.len(var_274_60)
				local var_274_63 = var_274_61 <= 0 and var_274_57 or var_274_57 * (var_274_62 / var_274_61)

				if var_274_63 > 0 and var_274_57 < var_274_63 then
					arg_271_1.talkMaxDuration = var_274_63
					var_274_56 = var_274_56 + 0.3

					if var_274_63 + var_274_56 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_63 + var_274_56
					end
				end

				arg_271_1.text_.text = var_274_60
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_64 = var_274_56 + 0.3
			local var_274_65 = math.max(var_274_57, arg_271_1.talkMaxDuration)

			if var_274_64 <= arg_271_1.time_ and arg_271_1.time_ < var_274_64 + var_274_65 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_64) / var_274_65

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_64 + var_274_65 and arg_271_1.time_ < var_274_64 + var_274_65 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410082068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 410082068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play410082069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.975

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

				local var_280_2 = arg_277_1:GetWordFromCfg(410082068)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 39
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
	Play410082069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 410082069
		arg_281_1.duration_ = 5.8

		local var_281_0 = {
			zh = 5.8,
			ja = 4.733
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
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play410082070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1060"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos1060 = var_284_0.localPosition
				var_284_0.localScale = Vector3.New(1, 1, 1)

				arg_281_1:CheckSpriteTmpPos("1060", 2)

				local var_284_2 = var_284_0.childCount

				for iter_284_0 = 0, var_284_2 - 1 do
					local var_284_3 = var_284_0:GetChild(iter_284_0)

					if var_284_3.name == "" or not string.find(var_284_3.name, "split") then
						var_284_3.gameObject:SetActive(true)
					else
						var_284_3.gameObject:SetActive(false)
					end
				end
			end

			local var_284_4 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_4 then
				local var_284_5 = (arg_281_1.time_ - var_284_1) / var_284_4
				local var_284_6 = Vector3.New(-390, -435, -40)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1060, var_284_6, var_284_5)
			end

			if arg_281_1.time_ >= var_284_1 + var_284_4 and arg_281_1.time_ < var_284_1 + var_284_4 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_284_7 = arg_281_1.actors_["1012"].transform
			local var_284_8 = 0

			if var_284_8 < arg_281_1.time_ and arg_281_1.time_ <= var_284_8 + arg_284_0 then
				arg_281_1.var_.moveOldPos1012 = var_284_7.localPosition
				var_284_7.localScale = Vector3.New(1, 1, 1)

				arg_281_1:CheckSpriteTmpPos("1012", 4)

				local var_284_9 = var_284_7.childCount

				for iter_284_1 = 0, var_284_9 - 1 do
					local var_284_10 = var_284_7:GetChild(iter_284_1)

					if var_284_10.name == "" or not string.find(var_284_10.name, "split") then
						var_284_10.gameObject:SetActive(true)
					else
						var_284_10.gameObject:SetActive(false)
					end
				end
			end

			local var_284_11 = 0.001

			if var_284_8 <= arg_281_1.time_ and arg_281_1.time_ < var_284_8 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_8) / var_284_11
				local var_284_13 = Vector3.New(390, -465, 300)

				var_284_7.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1012, var_284_13, var_284_12)
			end

			if arg_281_1.time_ >= var_284_8 + var_284_11 and arg_281_1.time_ < var_284_8 + var_284_11 + arg_284_0 then
				var_284_7.localPosition = Vector3.New(390, -465, 300)
			end

			local var_284_14 = arg_281_1.actors_["1060"]
			local var_284_15 = 0

			if var_284_15 < arg_281_1.time_ and arg_281_1.time_ <= var_284_15 + arg_284_0 and arg_281_1.var_.actorSpriteComps1060 == nil then
				arg_281_1.var_.actorSpriteComps1060 = var_284_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_16 = 0.034

			if var_284_15 <= arg_281_1.time_ and arg_281_1.time_ < var_284_15 + var_284_16 then
				local var_284_17 = (arg_281_1.time_ - var_284_15) / var_284_16

				if arg_281_1.var_.actorSpriteComps1060 then
					for iter_284_2, iter_284_3 in pairs(arg_281_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_284_3 then
							local var_284_18 = Mathf.Lerp(iter_284_3.color.r, 1, var_284_17)

							iter_284_3.color = Color.New(var_284_18, var_284_18, var_284_18)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_15 + var_284_16 and arg_281_1.time_ < var_284_15 + var_284_16 + arg_284_0 and arg_281_1.var_.actorSpriteComps1060 then
				local var_284_19 = 1

				for iter_284_4, iter_284_5 in pairs(arg_281_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_284_5 then
						iter_284_5.color = Color.New(var_284_19, var_284_19, var_284_19)
					end
				end

				arg_281_1.var_.actorSpriteComps1060 = nil
			end

			local var_284_20 = arg_281_1.actors_["1012"]
			local var_284_21 = 0

			if var_284_21 < arg_281_1.time_ and arg_281_1.time_ <= var_284_21 + arg_284_0 and arg_281_1.var_.actorSpriteComps1012 == nil then
				arg_281_1.var_.actorSpriteComps1012 = var_284_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_22 = 0.034

			if var_284_21 <= arg_281_1.time_ and arg_281_1.time_ < var_284_21 + var_284_22 then
				local var_284_23 = (arg_281_1.time_ - var_284_21) / var_284_22

				if arg_281_1.var_.actorSpriteComps1012 then
					for iter_284_6, iter_284_7 in pairs(arg_281_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_284_7 then
							local var_284_24 = Mathf.Lerp(iter_284_7.color.r, 0.5, var_284_23)

							iter_284_7.color = Color.New(var_284_24, var_284_24, var_284_24)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_21 + var_284_22 and arg_281_1.time_ < var_284_21 + var_284_22 + arg_284_0 and arg_281_1.var_.actorSpriteComps1012 then
				local var_284_25 = 0.5

				for iter_284_8, iter_284_9 in pairs(arg_281_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_284_9 then
						iter_284_9.color = Color.New(var_284_25, var_284_25, var_284_25)
					end
				end

				arg_281_1.var_.actorSpriteComps1012 = nil
			end

			local var_284_26 = 0
			local var_284_27 = 0.725

			if var_284_26 < arg_281_1.time_ and arg_281_1.time_ <= var_284_26 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_28 = arg_281_1:FormatText(StoryNameCfg[584].name)

				arg_281_1.leftNameTxt_.text = var_284_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_29 = arg_281_1:GetWordFromCfg(410082069)
				local var_284_30 = arg_281_1:FormatText(var_284_29.content)

				arg_281_1.text_.text = var_284_30

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_31 = 29
				local var_284_32 = utf8.len(var_284_30)
				local var_284_33 = var_284_31 <= 0 and var_284_27 or var_284_27 * (var_284_32 / var_284_31)

				if var_284_33 > 0 and var_284_27 < var_284_33 then
					arg_281_1.talkMaxDuration = var_284_33

					if var_284_33 + var_284_26 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_33 + var_284_26
					end
				end

				arg_281_1.text_.text = var_284_30
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082069", "story_v_out_410082.awb") ~= 0 then
					local var_284_34 = manager.audio:GetVoiceLength("story_v_out_410082", "410082069", "story_v_out_410082.awb") / 1000

					if var_284_34 + var_284_26 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_34 + var_284_26
					end

					if var_284_29.prefab_name ~= "" and arg_281_1.actors_[var_284_29.prefab_name] ~= nil then
						local var_284_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_29.prefab_name].transform, "story_v_out_410082", "410082069", "story_v_out_410082.awb")

						arg_281_1:RecordAudio("410082069", var_284_35)
						arg_281_1:RecordAudio("410082069", var_284_35)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_410082", "410082069", "story_v_out_410082.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_410082", "410082069", "story_v_out_410082.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_36 = math.max(var_284_27, arg_281_1.talkMaxDuration)

			if var_284_26 <= arg_281_1.time_ and arg_281_1.time_ < var_284_26 + var_284_36 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_26) / var_284_36

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_26 + var_284_36 and arg_281_1.time_ < var_284_26 + var_284_36 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play410082070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 410082070
		arg_285_1.duration_ = 5.3

		local var_285_0 = {
			zh = 2.333,
			ja = 5.3
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
				arg_285_0:Play410082071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1012"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos1012 = var_288_0.localPosition
				var_288_0.localScale = Vector3.New(1, 1, 1)

				arg_285_1:CheckSpriteTmpPos("1012", 4)

				local var_288_2 = var_288_0.childCount

				for iter_288_0 = 0, var_288_2 - 1 do
					local var_288_3 = var_288_0:GetChild(iter_288_0)

					if var_288_3.name == "" or not string.find(var_288_3.name, "split") then
						var_288_3.gameObject:SetActive(true)
					else
						var_288_3.gameObject:SetActive(false)
					end
				end
			end

			local var_288_4 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_4 then
				local var_288_5 = (arg_285_1.time_ - var_288_1) / var_288_4
				local var_288_6 = Vector3.New(390, -465, 300)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1012, var_288_6, var_288_5)
			end

			if arg_285_1.time_ >= var_288_1 + var_288_4 and arg_285_1.time_ < var_288_1 + var_288_4 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_288_7 = arg_285_1.actors_["1012"]
			local var_288_8 = 0

			if var_288_8 < arg_285_1.time_ and arg_285_1.time_ <= var_288_8 + arg_288_0 and arg_285_1.var_.actorSpriteComps1012 == nil then
				arg_285_1.var_.actorSpriteComps1012 = var_288_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_9 = 0.034

			if var_288_8 <= arg_285_1.time_ and arg_285_1.time_ < var_288_8 + var_288_9 then
				local var_288_10 = (arg_285_1.time_ - var_288_8) / var_288_9

				if arg_285_1.var_.actorSpriteComps1012 then
					for iter_288_1, iter_288_2 in pairs(arg_285_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_288_2 then
							local var_288_11 = Mathf.Lerp(iter_288_2.color.r, 1, var_288_10)

							iter_288_2.color = Color.New(var_288_11, var_288_11, var_288_11)
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_8 + var_288_9 and arg_285_1.time_ < var_288_8 + var_288_9 + arg_288_0 and arg_285_1.var_.actorSpriteComps1012 then
				local var_288_12 = 1

				for iter_288_3, iter_288_4 in pairs(arg_285_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_288_4 then
						iter_288_4.color = Color.New(var_288_12, var_288_12, var_288_12)
					end
				end

				arg_285_1.var_.actorSpriteComps1012 = nil
			end

			local var_288_13 = arg_285_1.actors_["1060"]
			local var_288_14 = 0

			if var_288_14 < arg_285_1.time_ and arg_285_1.time_ <= var_288_14 + arg_288_0 and arg_285_1.var_.actorSpriteComps1060 == nil then
				arg_285_1.var_.actorSpriteComps1060 = var_288_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_15 = 0.034

			if var_288_14 <= arg_285_1.time_ and arg_285_1.time_ < var_288_14 + var_288_15 then
				local var_288_16 = (arg_285_1.time_ - var_288_14) / var_288_15

				if arg_285_1.var_.actorSpriteComps1060 then
					for iter_288_5, iter_288_6 in pairs(arg_285_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_288_6 then
							local var_288_17 = Mathf.Lerp(iter_288_6.color.r, 0.5, var_288_16)

							iter_288_6.color = Color.New(var_288_17, var_288_17, var_288_17)
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_14 + var_288_15 and arg_285_1.time_ < var_288_14 + var_288_15 + arg_288_0 and arg_285_1.var_.actorSpriteComps1060 then
				local var_288_18 = 0.5

				for iter_288_7, iter_288_8 in pairs(arg_285_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_288_8 then
						iter_288_8.color = Color.New(var_288_18, var_288_18, var_288_18)
					end
				end

				arg_285_1.var_.actorSpriteComps1060 = nil
			end

			local var_288_19 = 0
			local var_288_20 = 0.325

			if var_288_19 < arg_285_1.time_ and arg_285_1.time_ <= var_288_19 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_21 = arg_285_1:FormatText(StoryNameCfg[595].name)

				arg_285_1.leftNameTxt_.text = var_288_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_22 = arg_285_1:GetWordFromCfg(410082070)
				local var_288_23 = arg_285_1:FormatText(var_288_22.content)

				arg_285_1.text_.text = var_288_23

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_24 = 13
				local var_288_25 = utf8.len(var_288_23)
				local var_288_26 = var_288_24 <= 0 and var_288_20 or var_288_20 * (var_288_25 / var_288_24)

				if var_288_26 > 0 and var_288_20 < var_288_26 then
					arg_285_1.talkMaxDuration = var_288_26

					if var_288_26 + var_288_19 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_26 + var_288_19
					end
				end

				arg_285_1.text_.text = var_288_23
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082070", "story_v_out_410082.awb") ~= 0 then
					local var_288_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082070", "story_v_out_410082.awb") / 1000

					if var_288_27 + var_288_19 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_27 + var_288_19
					end

					if var_288_22.prefab_name ~= "" and arg_285_1.actors_[var_288_22.prefab_name] ~= nil then
						local var_288_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_22.prefab_name].transform, "story_v_out_410082", "410082070", "story_v_out_410082.awb")

						arg_285_1:RecordAudio("410082070", var_288_28)
						arg_285_1:RecordAudio("410082070", var_288_28)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_410082", "410082070", "story_v_out_410082.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_410082", "410082070", "story_v_out_410082.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_29 = math.max(var_288_20, arg_285_1.talkMaxDuration)

			if var_288_19 <= arg_285_1.time_ and arg_285_1.time_ < var_288_19 + var_288_29 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_19) / var_288_29

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_19 + var_288_29 and arg_285_1.time_ < var_288_19 + var_288_29 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play410082071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 410082071
		arg_289_1.duration_ = 12.366

		local var_289_0 = {
			zh = 6.9,
			ja = 12.366
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
				arg_289_0:Play410082072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.75

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[595].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(410082071)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082071", "story_v_out_410082.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082071", "story_v_out_410082.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_410082", "410082071", "story_v_out_410082.awb")

						arg_289_1:RecordAudio("410082071", var_292_9)
						arg_289_1:RecordAudio("410082071", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_410082", "410082071", "story_v_out_410082.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_410082", "410082071", "story_v_out_410082.awb")
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
	Play410082072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 410082072
		arg_293_1.duration_ = 3.033

		local var_293_0 = {
			zh = 2.7,
			ja = 3.033
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
				arg_293_0:Play410082073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1056"].transform
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.moveOldPos1056 = var_296_0.localPosition
				var_296_0.localScale = Vector3.New(1, 1, 1)

				arg_293_1:CheckSpriteTmpPos("1056", 3)

				local var_296_2 = var_296_0.childCount

				for iter_296_0 = 0, var_296_2 - 1 do
					local var_296_3 = var_296_0:GetChild(iter_296_0)

					if var_296_3.name == "split_3" or not string.find(var_296_3.name, "split") then
						var_296_3.gameObject:SetActive(true)
					else
						var_296_3.gameObject:SetActive(false)
					end
				end
			end

			local var_296_4 = 0.001

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_4 then
				local var_296_5 = (arg_293_1.time_ - var_296_1) / var_296_4
				local var_296_6 = Vector3.New(0, -350, -180)

				var_296_0.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1056, var_296_6, var_296_5)
			end

			if arg_293_1.time_ >= var_296_1 + var_296_4 and arg_293_1.time_ < var_296_1 + var_296_4 + arg_296_0 then
				var_296_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_296_7 = arg_293_1.actors_["1056"]
			local var_296_8 = 0

			if var_296_8 < arg_293_1.time_ and arg_293_1.time_ <= var_296_8 + arg_296_0 and arg_293_1.var_.actorSpriteComps1056 == nil then
				arg_293_1.var_.actorSpriteComps1056 = var_296_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_296_9 = 0.034

			if var_296_8 <= arg_293_1.time_ and arg_293_1.time_ < var_296_8 + var_296_9 then
				local var_296_10 = (arg_293_1.time_ - var_296_8) / var_296_9

				if arg_293_1.var_.actorSpriteComps1056 then
					for iter_296_1, iter_296_2 in pairs(arg_293_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_296_2 then
							local var_296_11 = Mathf.Lerp(iter_296_2.color.r, 1, var_296_10)

							iter_296_2.color = Color.New(var_296_11, var_296_11, var_296_11)
						end
					end
				end
			end

			if arg_293_1.time_ >= var_296_8 + var_296_9 and arg_293_1.time_ < var_296_8 + var_296_9 + arg_296_0 and arg_293_1.var_.actorSpriteComps1056 then
				local var_296_12 = 1

				for iter_296_3, iter_296_4 in pairs(arg_293_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_296_4 then
						iter_296_4.color = Color.New(var_296_12, var_296_12, var_296_12)
					end
				end

				arg_293_1.var_.actorSpriteComps1056 = nil
			end

			local var_296_13 = arg_293_1.actors_["1060"].transform
			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1.var_.moveOldPos1060 = var_296_13.localPosition
				var_296_13.localScale = Vector3.New(1, 1, 1)

				arg_293_1:CheckSpriteTmpPos("1060", 7)

				local var_296_15 = var_296_13.childCount

				for iter_296_5 = 0, var_296_15 - 1 do
					local var_296_16 = var_296_13:GetChild(iter_296_5)

					if var_296_16.name == "" or not string.find(var_296_16.name, "split") then
						var_296_16.gameObject:SetActive(true)
					else
						var_296_16.gameObject:SetActive(false)
					end
				end
			end

			local var_296_17 = 0.001

			if var_296_14 <= arg_293_1.time_ and arg_293_1.time_ < var_296_14 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_14) / var_296_17
				local var_296_19 = Vector3.New(0, -2000, -40)

				var_296_13.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1060, var_296_19, var_296_18)
			end

			if arg_293_1.time_ >= var_296_14 + var_296_17 and arg_293_1.time_ < var_296_14 + var_296_17 + arg_296_0 then
				var_296_13.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_296_20 = arg_293_1.actors_["1012"].transform
			local var_296_21 = 0

			if var_296_21 < arg_293_1.time_ and arg_293_1.time_ <= var_296_21 + arg_296_0 then
				arg_293_1.var_.moveOldPos1012 = var_296_20.localPosition
				var_296_20.localScale = Vector3.New(1, 1, 1)

				arg_293_1:CheckSpriteTmpPos("1012", 7)

				local var_296_22 = var_296_20.childCount

				for iter_296_6 = 0, var_296_22 - 1 do
					local var_296_23 = var_296_20:GetChild(iter_296_6)

					if var_296_23.name == "" or not string.find(var_296_23.name, "split") then
						var_296_23.gameObject:SetActive(true)
					else
						var_296_23.gameObject:SetActive(false)
					end
				end
			end

			local var_296_24 = 0.001

			if var_296_21 <= arg_293_1.time_ and arg_293_1.time_ < var_296_21 + var_296_24 then
				local var_296_25 = (arg_293_1.time_ - var_296_21) / var_296_24
				local var_296_26 = Vector3.New(0, -2000, 300)

				var_296_20.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1012, var_296_26, var_296_25)
			end

			if arg_293_1.time_ >= var_296_21 + var_296_24 and arg_293_1.time_ < var_296_21 + var_296_24 + arg_296_0 then
				var_296_20.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_296_27 = 0
			local var_296_28 = 0.15

			if var_296_27 < arg_293_1.time_ and arg_293_1.time_ <= var_296_27 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_29 = arg_293_1:FormatText(StoryNameCfg[605].name)

				arg_293_1.leftNameTxt_.text = var_296_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_30 = arg_293_1:GetWordFromCfg(410082072)
				local var_296_31 = arg_293_1:FormatText(var_296_30.content)

				arg_293_1.text_.text = var_296_31

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_32 = 6
				local var_296_33 = utf8.len(var_296_31)
				local var_296_34 = var_296_32 <= 0 and var_296_28 or var_296_28 * (var_296_33 / var_296_32)

				if var_296_34 > 0 and var_296_28 < var_296_34 then
					arg_293_1.talkMaxDuration = var_296_34

					if var_296_34 + var_296_27 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_34 + var_296_27
					end
				end

				arg_293_1.text_.text = var_296_31
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082072", "story_v_out_410082.awb") ~= 0 then
					local var_296_35 = manager.audio:GetVoiceLength("story_v_out_410082", "410082072", "story_v_out_410082.awb") / 1000

					if var_296_35 + var_296_27 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_35 + var_296_27
					end

					if var_296_30.prefab_name ~= "" and arg_293_1.actors_[var_296_30.prefab_name] ~= nil then
						local var_296_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_30.prefab_name].transform, "story_v_out_410082", "410082072", "story_v_out_410082.awb")

						arg_293_1:RecordAudio("410082072", var_296_36)
						arg_293_1:RecordAudio("410082072", var_296_36)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_410082", "410082072", "story_v_out_410082.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_410082", "410082072", "story_v_out_410082.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_37 = math.max(var_296_28, arg_293_1.talkMaxDuration)

			if var_296_27 <= arg_293_1.time_ and arg_293_1.time_ < var_296_27 + var_296_37 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_27) / var_296_37

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_27 + var_296_37 and arg_293_1.time_ < var_296_27 + var_296_37 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play410082073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 410082073
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play410082074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1056"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.actorSpriteComps1056 == nil then
				arg_297_1.var_.actorSpriteComps1056 = var_300_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_2 = 0.034

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.actorSpriteComps1056 then
					for iter_300_0, iter_300_1 in pairs(arg_297_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_300_1 then
							local var_300_4 = Mathf.Lerp(iter_300_1.color.r, 0.5, var_300_3)

							iter_300_1.color = Color.New(var_300_4, var_300_4, var_300_4)
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.actorSpriteComps1056 then
				local var_300_5 = 0.5

				for iter_300_2, iter_300_3 in pairs(arg_297_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_300_3 then
						iter_300_3.color = Color.New(var_300_5, var_300_5, var_300_5)
					end
				end

				arg_297_1.var_.actorSpriteComps1056 = nil
			end

			local var_300_6 = 0
			local var_300_7 = 0.55

			if var_300_6 < arg_297_1.time_ and arg_297_1.time_ <= var_300_6 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_8 = arg_297_1:GetWordFromCfg(410082073)
				local var_300_9 = arg_297_1:FormatText(var_300_8.content)

				arg_297_1.text_.text = var_300_9

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_10 = 22
				local var_300_11 = utf8.len(var_300_9)
				local var_300_12 = var_300_10 <= 0 and var_300_7 or var_300_7 * (var_300_11 / var_300_10)

				if var_300_12 > 0 and var_300_7 < var_300_12 then
					arg_297_1.talkMaxDuration = var_300_12

					if var_300_12 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_12 + var_300_6
					end
				end

				arg_297_1.text_.text = var_300_9
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_13 = math.max(var_300_7, arg_297_1.talkMaxDuration)

			if var_300_6 <= arg_297_1.time_ and arg_297_1.time_ < var_300_6 + var_300_13 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_6) / var_300_13

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_6 + var_300_13 and arg_297_1.time_ < var_300_6 + var_300_13 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play410082074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 410082074
		arg_301_1.duration_ = 12.6

		local var_301_0 = {
			zh = 12.6,
			ja = 11.1
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play410082075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1012"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.actorSpriteComps1012 == nil then
				arg_301_1.var_.actorSpriteComps1012 = var_304_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_304_2 = 0.034

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.actorSpriteComps1012 then
					for iter_304_0, iter_304_1 in pairs(arg_301_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_304_1 then
							local var_304_4 = Mathf.Lerp(iter_304_1.color.r, 1, var_304_3)

							iter_304_1.color = Color.New(var_304_4, var_304_4, var_304_4)
						end
					end
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.actorSpriteComps1012 then
				local var_304_5 = 1

				for iter_304_2, iter_304_3 in pairs(arg_301_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_304_3 then
						iter_304_3.color = Color.New(var_304_5, var_304_5, var_304_5)
					end
				end

				arg_301_1.var_.actorSpriteComps1012 = nil
			end

			local var_304_6 = arg_301_1.actors_["1060"].transform
			local var_304_7 = 0

			if var_304_7 < arg_301_1.time_ and arg_301_1.time_ <= var_304_7 + arg_304_0 then
				arg_301_1.var_.moveOldPos1060 = var_304_6.localPosition
				var_304_6.localScale = Vector3.New(1, 1, 1)

				arg_301_1:CheckSpriteTmpPos("1060", 2)

				local var_304_8 = var_304_6.childCount

				for iter_304_4 = 0, var_304_8 - 1 do
					local var_304_9 = var_304_6:GetChild(iter_304_4)

					if var_304_9.name == "" or not string.find(var_304_9.name, "split") then
						var_304_9.gameObject:SetActive(true)
					else
						var_304_9.gameObject:SetActive(false)
					end
				end
			end

			local var_304_10 = 0.001

			if var_304_7 <= arg_301_1.time_ and arg_301_1.time_ < var_304_7 + var_304_10 then
				local var_304_11 = (arg_301_1.time_ - var_304_7) / var_304_10
				local var_304_12 = Vector3.New(-390, -435, -40)

				var_304_6.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1060, var_304_12, var_304_11)
			end

			if arg_301_1.time_ >= var_304_7 + var_304_10 and arg_301_1.time_ < var_304_7 + var_304_10 + arg_304_0 then
				var_304_6.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_304_13 = arg_301_1.actors_["1012"].transform
			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1.var_.moveOldPos1012 = var_304_13.localPosition
				var_304_13.localScale = Vector3.New(1, 1, 1)

				arg_301_1:CheckSpriteTmpPos("1012", 4)

				local var_304_15 = var_304_13.childCount

				for iter_304_5 = 0, var_304_15 - 1 do
					local var_304_16 = var_304_13:GetChild(iter_304_5)

					if var_304_16.name == "" or not string.find(var_304_16.name, "split") then
						var_304_16.gameObject:SetActive(true)
					else
						var_304_16.gameObject:SetActive(false)
					end
				end
			end

			local var_304_17 = 0.001

			if var_304_14 <= arg_301_1.time_ and arg_301_1.time_ < var_304_14 + var_304_17 then
				local var_304_18 = (arg_301_1.time_ - var_304_14) / var_304_17
				local var_304_19 = Vector3.New(390, -465, 300)

				var_304_13.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1012, var_304_19, var_304_18)
			end

			if arg_301_1.time_ >= var_304_14 + var_304_17 and arg_301_1.time_ < var_304_14 + var_304_17 + arg_304_0 then
				var_304_13.localPosition = Vector3.New(390, -465, 300)
			end

			local var_304_20 = arg_301_1.actors_["1056"].transform
			local var_304_21 = 0

			if var_304_21 < arg_301_1.time_ and arg_301_1.time_ <= var_304_21 + arg_304_0 then
				arg_301_1.var_.moveOldPos1056 = var_304_20.localPosition
				var_304_20.localScale = Vector3.New(1, 1, 1)

				arg_301_1:CheckSpriteTmpPos("1056", 7)

				local var_304_22 = var_304_20.childCount

				for iter_304_6 = 0, var_304_22 - 1 do
					local var_304_23 = var_304_20:GetChild(iter_304_6)

					if var_304_23.name == "" or not string.find(var_304_23.name, "split") then
						var_304_23.gameObject:SetActive(true)
					else
						var_304_23.gameObject:SetActive(false)
					end
				end
			end

			local var_304_24 = 0.001

			if var_304_21 <= arg_301_1.time_ and arg_301_1.time_ < var_304_21 + var_304_24 then
				local var_304_25 = (arg_301_1.time_ - var_304_21) / var_304_24
				local var_304_26 = Vector3.New(0, -2000, -180)

				var_304_20.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1056, var_304_26, var_304_25)
			end

			if arg_301_1.time_ >= var_304_21 + var_304_24 and arg_301_1.time_ < var_304_21 + var_304_24 + arg_304_0 then
				var_304_20.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_304_27 = arg_301_1.actors_["1060"]
			local var_304_28 = 0

			if var_304_28 < arg_301_1.time_ and arg_301_1.time_ <= var_304_28 + arg_304_0 and arg_301_1.var_.actorSpriteComps1060 == nil then
				arg_301_1.var_.actorSpriteComps1060 = var_304_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_304_29 = 0.034

			if var_304_28 <= arg_301_1.time_ and arg_301_1.time_ < var_304_28 + var_304_29 then
				local var_304_30 = (arg_301_1.time_ - var_304_28) / var_304_29

				if arg_301_1.var_.actorSpriteComps1060 then
					for iter_304_7, iter_304_8 in pairs(arg_301_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_304_8 then
							local var_304_31 = Mathf.Lerp(iter_304_8.color.r, 0.5, var_304_30)

							iter_304_8.color = Color.New(var_304_31, var_304_31, var_304_31)
						end
					end
				end
			end

			if arg_301_1.time_ >= var_304_28 + var_304_29 and arg_301_1.time_ < var_304_28 + var_304_29 + arg_304_0 and arg_301_1.var_.actorSpriteComps1060 then
				local var_304_32 = 0.5

				for iter_304_9, iter_304_10 in pairs(arg_301_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_304_10 then
						iter_304_10.color = Color.New(var_304_32, var_304_32, var_304_32)
					end
				end

				arg_301_1.var_.actorSpriteComps1060 = nil
			end

			local var_304_33 = 0
			local var_304_34 = 1.575

			if var_304_33 < arg_301_1.time_ and arg_301_1.time_ <= var_304_33 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_35 = arg_301_1:FormatText(StoryNameCfg[595].name)

				arg_301_1.leftNameTxt_.text = var_304_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_36 = arg_301_1:GetWordFromCfg(410082074)
				local var_304_37 = arg_301_1:FormatText(var_304_36.content)

				arg_301_1.text_.text = var_304_37

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_38 = 63
				local var_304_39 = utf8.len(var_304_37)
				local var_304_40 = var_304_38 <= 0 and var_304_34 or var_304_34 * (var_304_39 / var_304_38)

				if var_304_40 > 0 and var_304_34 < var_304_40 then
					arg_301_1.talkMaxDuration = var_304_40

					if var_304_40 + var_304_33 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_40 + var_304_33
					end
				end

				arg_301_1.text_.text = var_304_37
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082074", "story_v_out_410082.awb") ~= 0 then
					local var_304_41 = manager.audio:GetVoiceLength("story_v_out_410082", "410082074", "story_v_out_410082.awb") / 1000

					if var_304_41 + var_304_33 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_41 + var_304_33
					end

					if var_304_36.prefab_name ~= "" and arg_301_1.actors_[var_304_36.prefab_name] ~= nil then
						local var_304_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_36.prefab_name].transform, "story_v_out_410082", "410082074", "story_v_out_410082.awb")

						arg_301_1:RecordAudio("410082074", var_304_42)
						arg_301_1:RecordAudio("410082074", var_304_42)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_410082", "410082074", "story_v_out_410082.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_410082", "410082074", "story_v_out_410082.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_43 = math.max(var_304_34, arg_301_1.talkMaxDuration)

			if var_304_33 <= arg_301_1.time_ and arg_301_1.time_ < var_304_33 + var_304_43 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_33) / var_304_43

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_33 + var_304_43 and arg_301_1.time_ < var_304_33 + var_304_43 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play410082075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 410082075
		arg_305_1.duration_ = 6.7

		local var_305_0 = {
			zh = 6.7,
			ja = 6.533
		}
		local var_305_1 = manager.audio:GetLocalizationFlag()

		if var_305_0[var_305_1] ~= nil then
			arg_305_1.duration_ = var_305_0[var_305_1]
		end

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play410082076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.725

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[595].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(410082075)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 29
				local var_308_6 = utf8.len(var_308_4)
				local var_308_7 = var_308_5 <= 0 and var_308_1 or var_308_1 * (var_308_6 / var_308_5)

				if var_308_7 > 0 and var_308_1 < var_308_7 then
					arg_305_1.talkMaxDuration = var_308_7

					if var_308_7 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_7 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_4
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082075", "story_v_out_410082.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082075", "story_v_out_410082.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_410082", "410082075", "story_v_out_410082.awb")

						arg_305_1:RecordAudio("410082075", var_308_9)
						arg_305_1:RecordAudio("410082075", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_410082", "410082075", "story_v_out_410082.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_410082", "410082075", "story_v_out_410082.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_10 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_10 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_10

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_10 and arg_305_1.time_ < var_308_0 + var_308_10 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play410082076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 410082076
		arg_309_1.duration_ = 4.133

		local var_309_0 = {
			zh = 1.866,
			ja = 4.133
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
				arg_309_0:Play410082077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1056"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.actorSpriteComps1056 == nil then
				arg_309_1.var_.actorSpriteComps1056 = var_312_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_2 = 0.034

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.actorSpriteComps1056 then
					for iter_312_0, iter_312_1 in pairs(arg_309_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_312_1 then
							local var_312_4 = Mathf.Lerp(iter_312_1.color.r, 1, var_312_3)

							iter_312_1.color = Color.New(var_312_4, var_312_4, var_312_4)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.actorSpriteComps1056 then
				local var_312_5 = 1

				for iter_312_2, iter_312_3 in pairs(arg_309_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_312_3 then
						iter_312_3.color = Color.New(var_312_5, var_312_5, var_312_5)
					end
				end

				arg_309_1.var_.actorSpriteComps1056 = nil
			end

			local var_312_6 = arg_309_1.actors_["1012"]
			local var_312_7 = 0

			if var_312_7 < arg_309_1.time_ and arg_309_1.time_ <= var_312_7 + arg_312_0 and arg_309_1.var_.actorSpriteComps1012 == nil then
				arg_309_1.var_.actorSpriteComps1012 = var_312_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_8 = 0.034

			if var_312_7 <= arg_309_1.time_ and arg_309_1.time_ < var_312_7 + var_312_8 then
				local var_312_9 = (arg_309_1.time_ - var_312_7) / var_312_8

				if arg_309_1.var_.actorSpriteComps1012 then
					for iter_312_4, iter_312_5 in pairs(arg_309_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_312_5 then
							local var_312_10 = Mathf.Lerp(iter_312_5.color.r, 0.5, var_312_9)

							iter_312_5.color = Color.New(var_312_10, var_312_10, var_312_10)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_7 + var_312_8 and arg_309_1.time_ < var_312_7 + var_312_8 + arg_312_0 and arg_309_1.var_.actorSpriteComps1012 then
				local var_312_11 = 0.5

				for iter_312_6, iter_312_7 in pairs(arg_309_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_312_7 then
						iter_312_7.color = Color.New(var_312_11, var_312_11, var_312_11)
					end
				end

				arg_309_1.var_.actorSpriteComps1012 = nil
			end

			local var_312_12 = arg_309_1.actors_["1060"].transform
			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1.var_.moveOldPos1060 = var_312_12.localPosition
				var_312_12.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("1060", 7)

				local var_312_14 = var_312_12.childCount

				for iter_312_8 = 0, var_312_14 - 1 do
					local var_312_15 = var_312_12:GetChild(iter_312_8)

					if var_312_15.name == "" or not string.find(var_312_15.name, "split") then
						var_312_15.gameObject:SetActive(true)
					else
						var_312_15.gameObject:SetActive(false)
					end
				end
			end

			local var_312_16 = 0.001

			if var_312_13 <= arg_309_1.time_ and arg_309_1.time_ < var_312_13 + var_312_16 then
				local var_312_17 = (arg_309_1.time_ - var_312_13) / var_312_16
				local var_312_18 = Vector3.New(0, -2000, -40)

				var_312_12.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1060, var_312_18, var_312_17)
			end

			if arg_309_1.time_ >= var_312_13 + var_312_16 and arg_309_1.time_ < var_312_13 + var_312_16 + arg_312_0 then
				var_312_12.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_312_19 = arg_309_1.actors_["1012"].transform
			local var_312_20 = 0

			if var_312_20 < arg_309_1.time_ and arg_309_1.time_ <= var_312_20 + arg_312_0 then
				arg_309_1.var_.moveOldPos1012 = var_312_19.localPosition
				var_312_19.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("1012", 7)

				local var_312_21 = var_312_19.childCount

				for iter_312_9 = 0, var_312_21 - 1 do
					local var_312_22 = var_312_19:GetChild(iter_312_9)

					if var_312_22.name == "" or not string.find(var_312_22.name, "split") then
						var_312_22.gameObject:SetActive(true)
					else
						var_312_22.gameObject:SetActive(false)
					end
				end
			end

			local var_312_23 = 0.001

			if var_312_20 <= arg_309_1.time_ and arg_309_1.time_ < var_312_20 + var_312_23 then
				local var_312_24 = (arg_309_1.time_ - var_312_20) / var_312_23
				local var_312_25 = Vector3.New(0, -2000, 300)

				var_312_19.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1012, var_312_25, var_312_24)
			end

			if arg_309_1.time_ >= var_312_20 + var_312_23 and arg_309_1.time_ < var_312_20 + var_312_23 + arg_312_0 then
				var_312_19.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_312_26 = arg_309_1.actors_["1056"].transform
			local var_312_27 = 0

			if var_312_27 < arg_309_1.time_ and arg_309_1.time_ <= var_312_27 + arg_312_0 then
				arg_309_1.var_.moveOldPos1056 = var_312_26.localPosition
				var_312_26.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("1056", 3)

				local var_312_28 = var_312_26.childCount

				for iter_312_10 = 0, var_312_28 - 1 do
					local var_312_29 = var_312_26:GetChild(iter_312_10)

					if var_312_29.name == "split_3" or not string.find(var_312_29.name, "split") then
						var_312_29.gameObject:SetActive(true)
					else
						var_312_29.gameObject:SetActive(false)
					end
				end
			end

			local var_312_30 = 0.001

			if var_312_27 <= arg_309_1.time_ and arg_309_1.time_ < var_312_27 + var_312_30 then
				local var_312_31 = (arg_309_1.time_ - var_312_27) / var_312_30
				local var_312_32 = Vector3.New(0, -350, -180)

				var_312_26.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1056, var_312_32, var_312_31)
			end

			if arg_309_1.time_ >= var_312_27 + var_312_30 and arg_309_1.time_ < var_312_27 + var_312_30 + arg_312_0 then
				var_312_26.localPosition = Vector3.New(0, -350, -180)
			end

			local var_312_33 = arg_309_1.actors_["1060"]
			local var_312_34 = 0

			if var_312_34 < arg_309_1.time_ and arg_309_1.time_ <= var_312_34 + arg_312_0 and arg_309_1.var_.actorSpriteComps1060 == nil then
				arg_309_1.var_.actorSpriteComps1060 = var_312_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_35 = 0.034

			if var_312_34 <= arg_309_1.time_ and arg_309_1.time_ < var_312_34 + var_312_35 then
				local var_312_36 = (arg_309_1.time_ - var_312_34) / var_312_35

				if arg_309_1.var_.actorSpriteComps1060 then
					for iter_312_11, iter_312_12 in pairs(arg_309_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_312_12 then
							local var_312_37 = Mathf.Lerp(iter_312_12.color.r, 0.5, var_312_36)

							iter_312_12.color = Color.New(var_312_37, var_312_37, var_312_37)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_34 + var_312_35 and arg_309_1.time_ < var_312_34 + var_312_35 + arg_312_0 and arg_309_1.var_.actorSpriteComps1060 then
				local var_312_38 = 0.5

				for iter_312_13, iter_312_14 in pairs(arg_309_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_312_14 then
						iter_312_14.color = Color.New(var_312_38, var_312_38, var_312_38)
					end
				end

				arg_309_1.var_.actorSpriteComps1060 = nil
			end

			local var_312_39 = 0
			local var_312_40 = 0.25

			if var_312_39 < arg_309_1.time_ and arg_309_1.time_ <= var_312_39 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_41 = arg_309_1:FormatText(StoryNameCfg[605].name)

				arg_309_1.leftNameTxt_.text = var_312_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_42 = arg_309_1:GetWordFromCfg(410082076)
				local var_312_43 = arg_309_1:FormatText(var_312_42.content)

				arg_309_1.text_.text = var_312_43

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_44 = 10
				local var_312_45 = utf8.len(var_312_43)
				local var_312_46 = var_312_44 <= 0 and var_312_40 or var_312_40 * (var_312_45 / var_312_44)

				if var_312_46 > 0 and var_312_40 < var_312_46 then
					arg_309_1.talkMaxDuration = var_312_46

					if var_312_46 + var_312_39 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_46 + var_312_39
					end
				end

				arg_309_1.text_.text = var_312_43
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082076", "story_v_out_410082.awb") ~= 0 then
					local var_312_47 = manager.audio:GetVoiceLength("story_v_out_410082", "410082076", "story_v_out_410082.awb") / 1000

					if var_312_47 + var_312_39 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_47 + var_312_39
					end

					if var_312_42.prefab_name ~= "" and arg_309_1.actors_[var_312_42.prefab_name] ~= nil then
						local var_312_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_42.prefab_name].transform, "story_v_out_410082", "410082076", "story_v_out_410082.awb")

						arg_309_1:RecordAudio("410082076", var_312_48)
						arg_309_1:RecordAudio("410082076", var_312_48)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_410082", "410082076", "story_v_out_410082.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_410082", "410082076", "story_v_out_410082.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_49 = math.max(var_312_40, arg_309_1.talkMaxDuration)

			if var_312_39 <= arg_309_1.time_ and arg_309_1.time_ < var_312_39 + var_312_49 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_39) / var_312_49

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_39 + var_312_49 and arg_309_1.time_ < var_312_39 + var_312_49 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play410082077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 410082077
		arg_313_1.duration_ = 8.4

		local var_313_0 = {
			zh = 8.4,
			ja = 6.166
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play410082078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1012"].transform
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 then
				arg_313_1.var_.moveOldPos1012 = var_316_0.localPosition
				var_316_0.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("1012", 4)

				local var_316_2 = var_316_0.childCount

				for iter_316_0 = 0, var_316_2 - 1 do
					local var_316_3 = var_316_0:GetChild(iter_316_0)

					if var_316_3.name == "split_1" or not string.find(var_316_3.name, "split") then
						var_316_3.gameObject:SetActive(true)
					else
						var_316_3.gameObject:SetActive(false)
					end
				end
			end

			local var_316_4 = 0.001

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_4 then
				local var_316_5 = (arg_313_1.time_ - var_316_1) / var_316_4
				local var_316_6 = Vector3.New(390, -465, 300)

				var_316_0.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos1012, var_316_6, var_316_5)
			end

			if arg_313_1.time_ >= var_316_1 + var_316_4 and arg_313_1.time_ < var_316_1 + var_316_4 + arg_316_0 then
				var_316_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_316_7 = arg_313_1.actors_["1012"]
			local var_316_8 = 0

			if var_316_8 < arg_313_1.time_ and arg_313_1.time_ <= var_316_8 + arg_316_0 and arg_313_1.var_.actorSpriteComps1012 == nil then
				arg_313_1.var_.actorSpriteComps1012 = var_316_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_9 = 0.034

			if var_316_8 <= arg_313_1.time_ and arg_313_1.time_ < var_316_8 + var_316_9 then
				local var_316_10 = (arg_313_1.time_ - var_316_8) / var_316_9

				if arg_313_1.var_.actorSpriteComps1012 then
					for iter_316_1, iter_316_2 in pairs(arg_313_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_316_2 then
							local var_316_11 = Mathf.Lerp(iter_316_2.color.r, 1, var_316_10)

							iter_316_2.color = Color.New(var_316_11, var_316_11, var_316_11)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_8 + var_316_9 and arg_313_1.time_ < var_316_8 + var_316_9 + arg_316_0 and arg_313_1.var_.actorSpriteComps1012 then
				local var_316_12 = 1

				for iter_316_3, iter_316_4 in pairs(arg_313_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_316_4 then
						iter_316_4.color = Color.New(var_316_12, var_316_12, var_316_12)
					end
				end

				arg_313_1.var_.actorSpriteComps1012 = nil
			end

			local var_316_13 = arg_313_1.actors_["1060"]
			local var_316_14 = 0

			if var_316_14 < arg_313_1.time_ and arg_313_1.time_ <= var_316_14 + arg_316_0 and arg_313_1.var_.actorSpriteComps1060 == nil then
				arg_313_1.var_.actorSpriteComps1060 = var_316_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_15 = 0.034

			if var_316_14 <= arg_313_1.time_ and arg_313_1.time_ < var_316_14 + var_316_15 then
				local var_316_16 = (arg_313_1.time_ - var_316_14) / var_316_15

				if arg_313_1.var_.actorSpriteComps1060 then
					for iter_316_5, iter_316_6 in pairs(arg_313_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_316_6 then
							local var_316_17 = Mathf.Lerp(iter_316_6.color.r, 0.5, var_316_16)

							iter_316_6.color = Color.New(var_316_17, var_316_17, var_316_17)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_14 + var_316_15 and arg_313_1.time_ < var_316_14 + var_316_15 + arg_316_0 and arg_313_1.var_.actorSpriteComps1060 then
				local var_316_18 = 0.5

				for iter_316_7, iter_316_8 in pairs(arg_313_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_316_8 then
						iter_316_8.color = Color.New(var_316_18, var_316_18, var_316_18)
					end
				end

				arg_313_1.var_.actorSpriteComps1060 = nil
			end

			local var_316_19 = arg_313_1.actors_["1056"].transform
			local var_316_20 = 0

			if var_316_20 < arg_313_1.time_ and arg_313_1.time_ <= var_316_20 + arg_316_0 then
				arg_313_1.var_.moveOldPos1056 = var_316_19.localPosition
				var_316_19.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("1056", 7)

				local var_316_21 = var_316_19.childCount

				for iter_316_9 = 0, var_316_21 - 1 do
					local var_316_22 = var_316_19:GetChild(iter_316_9)

					if var_316_22.name == "" or not string.find(var_316_22.name, "split") then
						var_316_22.gameObject:SetActive(true)
					else
						var_316_22.gameObject:SetActive(false)
					end
				end
			end

			local var_316_23 = 0.001

			if var_316_20 <= arg_313_1.time_ and arg_313_1.time_ < var_316_20 + var_316_23 then
				local var_316_24 = (arg_313_1.time_ - var_316_20) / var_316_23
				local var_316_25 = Vector3.New(0, -2000, -180)

				var_316_19.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos1056, var_316_25, var_316_24)
			end

			if arg_313_1.time_ >= var_316_20 + var_316_23 and arg_313_1.time_ < var_316_20 + var_316_23 + arg_316_0 then
				var_316_19.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_316_26 = arg_313_1.actors_["1060"].transform
			local var_316_27 = 0

			if var_316_27 < arg_313_1.time_ and arg_313_1.time_ <= var_316_27 + arg_316_0 then
				arg_313_1.var_.moveOldPos1060 = var_316_26.localPosition
				var_316_26.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("1060", 2)

				local var_316_28 = var_316_26.childCount

				for iter_316_10 = 0, var_316_28 - 1 do
					local var_316_29 = var_316_26:GetChild(iter_316_10)

					if var_316_29.name == "split_1" or not string.find(var_316_29.name, "split") then
						var_316_29.gameObject:SetActive(true)
					else
						var_316_29.gameObject:SetActive(false)
					end
				end
			end

			local var_316_30 = 0.001

			if var_316_27 <= arg_313_1.time_ and arg_313_1.time_ < var_316_27 + var_316_30 then
				local var_316_31 = (arg_313_1.time_ - var_316_27) / var_316_30
				local var_316_32 = Vector3.New(-390, -435, -40)

				var_316_26.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos1060, var_316_32, var_316_31)
			end

			if arg_313_1.time_ >= var_316_27 + var_316_30 and arg_313_1.time_ < var_316_27 + var_316_30 + arg_316_0 then
				var_316_26.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_316_33 = 0
			local var_316_34 = 1.05

			if var_316_33 < arg_313_1.time_ and arg_313_1.time_ <= var_316_33 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_35 = arg_313_1:FormatText(StoryNameCfg[595].name)

				arg_313_1.leftNameTxt_.text = var_316_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_36 = arg_313_1:GetWordFromCfg(410082077)
				local var_316_37 = arg_313_1:FormatText(var_316_36.content)

				arg_313_1.text_.text = var_316_37

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_38 = 42
				local var_316_39 = utf8.len(var_316_37)
				local var_316_40 = var_316_38 <= 0 and var_316_34 or var_316_34 * (var_316_39 / var_316_38)

				if var_316_40 > 0 and var_316_34 < var_316_40 then
					arg_313_1.talkMaxDuration = var_316_40

					if var_316_40 + var_316_33 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_40 + var_316_33
					end
				end

				arg_313_1.text_.text = var_316_37
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082077", "story_v_out_410082.awb") ~= 0 then
					local var_316_41 = manager.audio:GetVoiceLength("story_v_out_410082", "410082077", "story_v_out_410082.awb") / 1000

					if var_316_41 + var_316_33 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_41 + var_316_33
					end

					if var_316_36.prefab_name ~= "" and arg_313_1.actors_[var_316_36.prefab_name] ~= nil then
						local var_316_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_36.prefab_name].transform, "story_v_out_410082", "410082077", "story_v_out_410082.awb")

						arg_313_1:RecordAudio("410082077", var_316_42)
						arg_313_1:RecordAudio("410082077", var_316_42)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_410082", "410082077", "story_v_out_410082.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_410082", "410082077", "story_v_out_410082.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_43 = math.max(var_316_34, arg_313_1.talkMaxDuration)

			if var_316_33 <= arg_313_1.time_ and arg_313_1.time_ < var_316_33 + var_316_43 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_33) / var_316_43

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_33 + var_316_43 and arg_313_1.time_ < var_316_33 + var_316_43 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play410082078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 410082078
		arg_317_1.duration_ = 10.9

		local var_317_0 = {
			zh = 4.233,
			ja = 10.9
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play410082079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 0.65

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_2 = arg_317_1:FormatText(StoryNameCfg[595].name)

				arg_317_1.leftNameTxt_.text = var_320_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_3 = arg_317_1:GetWordFromCfg(410082078)
				local var_320_4 = arg_317_1:FormatText(var_320_3.content)

				arg_317_1.text_.text = var_320_4

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_5 = 26
				local var_320_6 = utf8.len(var_320_4)
				local var_320_7 = var_320_5 <= 0 and var_320_1 or var_320_1 * (var_320_6 / var_320_5)

				if var_320_7 > 0 and var_320_1 < var_320_7 then
					arg_317_1.talkMaxDuration = var_320_7

					if var_320_7 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_7 + var_320_0
					end
				end

				arg_317_1.text_.text = var_320_4
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082078", "story_v_out_410082.awb") ~= 0 then
					local var_320_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082078", "story_v_out_410082.awb") / 1000

					if var_320_8 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_8 + var_320_0
					end

					if var_320_3.prefab_name ~= "" and arg_317_1.actors_[var_320_3.prefab_name] ~= nil then
						local var_320_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_3.prefab_name].transform, "story_v_out_410082", "410082078", "story_v_out_410082.awb")

						arg_317_1:RecordAudio("410082078", var_320_9)
						arg_317_1:RecordAudio("410082078", var_320_9)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_410082", "410082078", "story_v_out_410082.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_410082", "410082078", "story_v_out_410082.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_10 = math.max(var_320_1, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_10 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_0) / var_320_10

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_10 and arg_317_1.time_ < var_320_0 + var_320_10 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play410082079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 410082079
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play410082080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1060"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1060 = var_324_0.localPosition
				var_324_0.localScale = Vector3.New(1, 1, 1)

				arg_321_1:CheckSpriteTmpPos("1060", 7)

				local var_324_2 = var_324_0.childCount

				for iter_324_0 = 0, var_324_2 - 1 do
					local var_324_3 = var_324_0:GetChild(iter_324_0)

					if var_324_3.name == "" or not string.find(var_324_3.name, "split") then
						var_324_3.gameObject:SetActive(true)
					else
						var_324_3.gameObject:SetActive(false)
					end
				end
			end

			local var_324_4 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_4 then
				local var_324_5 = (arg_321_1.time_ - var_324_1) / var_324_4
				local var_324_6 = Vector3.New(0, -2000, -40)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1060, var_324_6, var_324_5)
			end

			if arg_321_1.time_ >= var_324_1 + var_324_4 and arg_321_1.time_ < var_324_1 + var_324_4 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_324_7 = arg_321_1.actors_["1056"].transform
			local var_324_8 = 0

			if var_324_8 < arg_321_1.time_ and arg_321_1.time_ <= var_324_8 + arg_324_0 then
				arg_321_1.var_.moveOldPos1056 = var_324_7.localPosition
				var_324_7.localScale = Vector3.New(1, 1, 1)

				arg_321_1:CheckSpriteTmpPos("1056", 7)

				local var_324_9 = var_324_7.childCount

				for iter_324_1 = 0, var_324_9 - 1 do
					local var_324_10 = var_324_7:GetChild(iter_324_1)

					if var_324_10.name == "" or not string.find(var_324_10.name, "split") then
						var_324_10.gameObject:SetActive(true)
					else
						var_324_10.gameObject:SetActive(false)
					end
				end
			end

			local var_324_11 = 0.001

			if var_324_8 <= arg_321_1.time_ and arg_321_1.time_ < var_324_8 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_8) / var_324_11
				local var_324_13 = Vector3.New(0, -2000, -180)

				var_324_7.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1056, var_324_13, var_324_12)
			end

			if arg_321_1.time_ >= var_324_8 + var_324_11 and arg_321_1.time_ < var_324_8 + var_324_11 + arg_324_0 then
				var_324_7.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_324_14 = arg_321_1.actors_["1012"].transform
			local var_324_15 = 0

			if var_324_15 < arg_321_1.time_ and arg_321_1.time_ <= var_324_15 + arg_324_0 then
				arg_321_1.var_.moveOldPos1012 = var_324_14.localPosition
				var_324_14.localScale = Vector3.New(1, 1, 1)

				arg_321_1:CheckSpriteTmpPos("1012", 7)

				local var_324_16 = var_324_14.childCount

				for iter_324_2 = 0, var_324_16 - 1 do
					local var_324_17 = var_324_14:GetChild(iter_324_2)

					if var_324_17.name == "" or not string.find(var_324_17.name, "split") then
						var_324_17.gameObject:SetActive(true)
					else
						var_324_17.gameObject:SetActive(false)
					end
				end
			end

			local var_324_18 = 0.001

			if var_324_15 <= arg_321_1.time_ and arg_321_1.time_ < var_324_15 + var_324_18 then
				local var_324_19 = (arg_321_1.time_ - var_324_15) / var_324_18
				local var_324_20 = Vector3.New(0, -2000, 300)

				var_324_14.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1012, var_324_20, var_324_19)
			end

			if arg_321_1.time_ >= var_324_15 + var_324_18 and arg_321_1.time_ < var_324_15 + var_324_18 + arg_324_0 then
				var_324_14.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_324_21 = 0
			local var_324_22 = 0.975

			if var_324_21 < arg_321_1.time_ and arg_321_1.time_ <= var_324_21 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_23 = arg_321_1:GetWordFromCfg(410082079)
				local var_324_24 = arg_321_1:FormatText(var_324_23.content)

				arg_321_1.text_.text = var_324_24

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_25 = 39
				local var_324_26 = utf8.len(var_324_24)
				local var_324_27 = var_324_25 <= 0 and var_324_22 or var_324_22 * (var_324_26 / var_324_25)

				if var_324_27 > 0 and var_324_22 < var_324_27 then
					arg_321_1.talkMaxDuration = var_324_27

					if var_324_27 + var_324_21 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_27 + var_324_21
					end
				end

				arg_321_1.text_.text = var_324_24
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_28 = math.max(var_324_22, arg_321_1.talkMaxDuration)

			if var_324_21 <= arg_321_1.time_ and arg_321_1.time_ < var_324_21 + var_324_28 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_21) / var_324_28

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_21 + var_324_28 and arg_321_1.time_ < var_324_21 + var_324_28 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play410082080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 410082080
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play410082081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 1.725

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_2 = arg_325_1:GetWordFromCfg(410082080)
				local var_328_3 = arg_325_1:FormatText(var_328_2.content)

				arg_325_1.text_.text = var_328_3

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_4 = 69
				local var_328_5 = utf8.len(var_328_3)
				local var_328_6 = var_328_4 <= 0 and var_328_1 or var_328_1 * (var_328_5 / var_328_4)

				if var_328_6 > 0 and var_328_1 < var_328_6 then
					arg_325_1.talkMaxDuration = var_328_6

					if var_328_6 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_6 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_3
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_7 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_7 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_7

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_7 and arg_325_1.time_ < var_328_0 + var_328_7 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play410082081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 410082081
		arg_329_1.duration_ = 9.1

		local var_329_0 = {
			zh = 4.8,
			ja = 9.1
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play410082082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1012"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1012 = var_332_0.localPosition
				var_332_0.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("1012", 4)

				local var_332_2 = var_332_0.childCount

				for iter_332_0 = 0, var_332_2 - 1 do
					local var_332_3 = var_332_0:GetChild(iter_332_0)

					if var_332_3.name == "split_3" or not string.find(var_332_3.name, "split") then
						var_332_3.gameObject:SetActive(true)
					else
						var_332_3.gameObject:SetActive(false)
					end
				end
			end

			local var_332_4 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_4 then
				local var_332_5 = (arg_329_1.time_ - var_332_1) / var_332_4
				local var_332_6 = Vector3.New(390, -465, 300)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1012, var_332_6, var_332_5)
			end

			if arg_329_1.time_ >= var_332_1 + var_332_4 and arg_329_1.time_ < var_332_1 + var_332_4 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_332_7 = arg_329_1.actors_["1012"]
			local var_332_8 = 0

			if var_332_8 < arg_329_1.time_ and arg_329_1.time_ <= var_332_8 + arg_332_0 and arg_329_1.var_.actorSpriteComps1012 == nil then
				arg_329_1.var_.actorSpriteComps1012 = var_332_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_9 = 0.034

			if var_332_8 <= arg_329_1.time_ and arg_329_1.time_ < var_332_8 + var_332_9 then
				local var_332_10 = (arg_329_1.time_ - var_332_8) / var_332_9

				if arg_329_1.var_.actorSpriteComps1012 then
					for iter_332_1, iter_332_2 in pairs(arg_329_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_332_2 then
							local var_332_11 = Mathf.Lerp(iter_332_2.color.r, 1, var_332_10)

							iter_332_2.color = Color.New(var_332_11, var_332_11, var_332_11)
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_8 + var_332_9 and arg_329_1.time_ < var_332_8 + var_332_9 + arg_332_0 and arg_329_1.var_.actorSpriteComps1012 then
				local var_332_12 = 1

				for iter_332_3, iter_332_4 in pairs(arg_329_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_332_4 then
						iter_332_4.color = Color.New(var_332_12, var_332_12, var_332_12)
					end
				end

				arg_329_1.var_.actorSpriteComps1012 = nil
			end

			local var_332_13 = arg_329_1.actors_["1060"].transform
			local var_332_14 = 0

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 then
				arg_329_1.var_.moveOldPos1060 = var_332_13.localPosition
				var_332_13.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("1060", 2)

				local var_332_15 = var_332_13.childCount

				for iter_332_5 = 0, var_332_15 - 1 do
					local var_332_16 = var_332_13:GetChild(iter_332_5)

					if var_332_16.name == "" or not string.find(var_332_16.name, "split") then
						var_332_16.gameObject:SetActive(true)
					else
						var_332_16.gameObject:SetActive(false)
					end
				end
			end

			local var_332_17 = 0.001

			if var_332_14 <= arg_329_1.time_ and arg_329_1.time_ < var_332_14 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_14) / var_332_17
				local var_332_19 = Vector3.New(-390, -435, -40)

				var_332_13.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1060, var_332_19, var_332_18)
			end

			if arg_329_1.time_ >= var_332_14 + var_332_17 and arg_329_1.time_ < var_332_14 + var_332_17 + arg_332_0 then
				var_332_13.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_332_20 = arg_329_1.actors_["1060"]
			local var_332_21 = 0

			if var_332_21 < arg_329_1.time_ and arg_329_1.time_ <= var_332_21 + arg_332_0 and arg_329_1.var_.actorSpriteComps1060 == nil then
				arg_329_1.var_.actorSpriteComps1060 = var_332_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_22 = 0.034

			if var_332_21 <= arg_329_1.time_ and arg_329_1.time_ < var_332_21 + var_332_22 then
				local var_332_23 = (arg_329_1.time_ - var_332_21) / var_332_22

				if arg_329_1.var_.actorSpriteComps1060 then
					for iter_332_6, iter_332_7 in pairs(arg_329_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_332_7 then
							local var_332_24 = Mathf.Lerp(iter_332_7.color.r, 0.5, var_332_23)

							iter_332_7.color = Color.New(var_332_24, var_332_24, var_332_24)
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_21 + var_332_22 and arg_329_1.time_ < var_332_21 + var_332_22 + arg_332_0 and arg_329_1.var_.actorSpriteComps1060 then
				local var_332_25 = 0.5

				for iter_332_8, iter_332_9 in pairs(arg_329_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_332_9 then
						iter_332_9.color = Color.New(var_332_25, var_332_25, var_332_25)
					end
				end

				arg_329_1.var_.actorSpriteComps1060 = nil
			end

			local var_332_26 = 0
			local var_332_27 = 0.45

			if var_332_26 < arg_329_1.time_ and arg_329_1.time_ <= var_332_26 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_28 = arg_329_1:FormatText(StoryNameCfg[595].name)

				arg_329_1.leftNameTxt_.text = var_332_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_29 = arg_329_1:GetWordFromCfg(410082081)
				local var_332_30 = arg_329_1:FormatText(var_332_29.content)

				arg_329_1.text_.text = var_332_30

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_31 = 18
				local var_332_32 = utf8.len(var_332_30)
				local var_332_33 = var_332_31 <= 0 and var_332_27 or var_332_27 * (var_332_32 / var_332_31)

				if var_332_33 > 0 and var_332_27 < var_332_33 then
					arg_329_1.talkMaxDuration = var_332_33

					if var_332_33 + var_332_26 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_33 + var_332_26
					end
				end

				arg_329_1.text_.text = var_332_30
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082081", "story_v_out_410082.awb") ~= 0 then
					local var_332_34 = manager.audio:GetVoiceLength("story_v_out_410082", "410082081", "story_v_out_410082.awb") / 1000

					if var_332_34 + var_332_26 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_34 + var_332_26
					end

					if var_332_29.prefab_name ~= "" and arg_329_1.actors_[var_332_29.prefab_name] ~= nil then
						local var_332_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_29.prefab_name].transform, "story_v_out_410082", "410082081", "story_v_out_410082.awb")

						arg_329_1:RecordAudio("410082081", var_332_35)
						arg_329_1:RecordAudio("410082081", var_332_35)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_410082", "410082081", "story_v_out_410082.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_410082", "410082081", "story_v_out_410082.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_36 = math.max(var_332_27, arg_329_1.talkMaxDuration)

			if var_332_26 <= arg_329_1.time_ and arg_329_1.time_ < var_332_26 + var_332_36 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_26) / var_332_36

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_26 + var_332_36 and arg_329_1.time_ < var_332_26 + var_332_36 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play410082082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 410082082
		arg_333_1.duration_ = 8.6

		local var_333_0 = {
			zh = 5.666,
			ja = 8.6
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play410082083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1060"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos1060 = var_336_0.localPosition
				var_336_0.localScale = Vector3.New(1, 1, 1)

				arg_333_1:CheckSpriteTmpPos("1060", 2)

				local var_336_2 = var_336_0.childCount

				for iter_336_0 = 0, var_336_2 - 1 do
					local var_336_3 = var_336_0:GetChild(iter_336_0)

					if var_336_3.name == "" or not string.find(var_336_3.name, "split") then
						var_336_3.gameObject:SetActive(true)
					else
						var_336_3.gameObject:SetActive(false)
					end
				end
			end

			local var_336_4 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_4 then
				local var_336_5 = (arg_333_1.time_ - var_336_1) / var_336_4
				local var_336_6 = Vector3.New(-390, -435, -40)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1060, var_336_6, var_336_5)
			end

			if arg_333_1.time_ >= var_336_1 + var_336_4 and arg_333_1.time_ < var_336_1 + var_336_4 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_336_7 = arg_333_1.actors_["1060"]
			local var_336_8 = 0

			if var_336_8 < arg_333_1.time_ and arg_333_1.time_ <= var_336_8 + arg_336_0 and arg_333_1.var_.actorSpriteComps1060 == nil then
				arg_333_1.var_.actorSpriteComps1060 = var_336_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_9 = 0.034

			if var_336_8 <= arg_333_1.time_ and arg_333_1.time_ < var_336_8 + var_336_9 then
				local var_336_10 = (arg_333_1.time_ - var_336_8) / var_336_9

				if arg_333_1.var_.actorSpriteComps1060 then
					for iter_336_1, iter_336_2 in pairs(arg_333_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_336_2 then
							local var_336_11 = Mathf.Lerp(iter_336_2.color.r, 1, var_336_10)

							iter_336_2.color = Color.New(var_336_11, var_336_11, var_336_11)
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_8 + var_336_9 and arg_333_1.time_ < var_336_8 + var_336_9 + arg_336_0 and arg_333_1.var_.actorSpriteComps1060 then
				local var_336_12 = 1

				for iter_336_3, iter_336_4 in pairs(arg_333_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_336_4 then
						iter_336_4.color = Color.New(var_336_12, var_336_12, var_336_12)
					end
				end

				arg_333_1.var_.actorSpriteComps1060 = nil
			end

			local var_336_13 = arg_333_1.actors_["1012"]
			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 and arg_333_1.var_.actorSpriteComps1012 == nil then
				arg_333_1.var_.actorSpriteComps1012 = var_336_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_15 = 0.034

			if var_336_14 <= arg_333_1.time_ and arg_333_1.time_ < var_336_14 + var_336_15 then
				local var_336_16 = (arg_333_1.time_ - var_336_14) / var_336_15

				if arg_333_1.var_.actorSpriteComps1012 then
					for iter_336_5, iter_336_6 in pairs(arg_333_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_336_6 then
							local var_336_17 = Mathf.Lerp(iter_336_6.color.r, 0.5, var_336_16)

							iter_336_6.color = Color.New(var_336_17, var_336_17, var_336_17)
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_14 + var_336_15 and arg_333_1.time_ < var_336_14 + var_336_15 + arg_336_0 and arg_333_1.var_.actorSpriteComps1012 then
				local var_336_18 = 0.5

				for iter_336_7, iter_336_8 in pairs(arg_333_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_336_8 then
						iter_336_8.color = Color.New(var_336_18, var_336_18, var_336_18)
					end
				end

				arg_333_1.var_.actorSpriteComps1012 = nil
			end

			local var_336_19 = 0
			local var_336_20 = 0.7

			if var_336_19 < arg_333_1.time_ and arg_333_1.time_ <= var_336_19 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_21 = arg_333_1:FormatText(StoryNameCfg[584].name)

				arg_333_1.leftNameTxt_.text = var_336_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_22 = arg_333_1:GetWordFromCfg(410082082)
				local var_336_23 = arg_333_1:FormatText(var_336_22.content)

				arg_333_1.text_.text = var_336_23

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_24 = 28
				local var_336_25 = utf8.len(var_336_23)
				local var_336_26 = var_336_24 <= 0 and var_336_20 or var_336_20 * (var_336_25 / var_336_24)

				if var_336_26 > 0 and var_336_20 < var_336_26 then
					arg_333_1.talkMaxDuration = var_336_26

					if var_336_26 + var_336_19 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_26 + var_336_19
					end
				end

				arg_333_1.text_.text = var_336_23
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082082", "story_v_out_410082.awb") ~= 0 then
					local var_336_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082082", "story_v_out_410082.awb") / 1000

					if var_336_27 + var_336_19 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_27 + var_336_19
					end

					if var_336_22.prefab_name ~= "" and arg_333_1.actors_[var_336_22.prefab_name] ~= nil then
						local var_336_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_22.prefab_name].transform, "story_v_out_410082", "410082082", "story_v_out_410082.awb")

						arg_333_1:RecordAudio("410082082", var_336_28)
						arg_333_1:RecordAudio("410082082", var_336_28)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_410082", "410082082", "story_v_out_410082.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_410082", "410082082", "story_v_out_410082.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_29 = math.max(var_336_20, arg_333_1.talkMaxDuration)

			if var_336_19 <= arg_333_1.time_ and arg_333_1.time_ < var_336_19 + var_336_29 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_19) / var_336_29

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_19 + var_336_29 and arg_333_1.time_ < var_336_19 + var_336_29 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play410082083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 410082083
		arg_337_1.duration_ = 4.066

		local var_337_0 = {
			zh = 4.066,
			ja = 3.133
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play410082084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1012"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1012 = var_340_0.localPosition
				var_340_0.localScale = Vector3.New(1, 1, 1)

				arg_337_1:CheckSpriteTmpPos("1012", 4)

				local var_340_2 = var_340_0.childCount

				for iter_340_0 = 0, var_340_2 - 1 do
					local var_340_3 = var_340_0:GetChild(iter_340_0)

					if var_340_3.name == "" or not string.find(var_340_3.name, "split") then
						var_340_3.gameObject:SetActive(true)
					else
						var_340_3.gameObject:SetActive(false)
					end
				end
			end

			local var_340_4 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_4 then
				local var_340_5 = (arg_337_1.time_ - var_340_1) / var_340_4
				local var_340_6 = Vector3.New(390, -465, 300)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1012, var_340_6, var_340_5)
			end

			if arg_337_1.time_ >= var_340_1 + var_340_4 and arg_337_1.time_ < var_340_1 + var_340_4 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_340_7 = arg_337_1.actors_["1012"]
			local var_340_8 = 0

			if var_340_8 < arg_337_1.time_ and arg_337_1.time_ <= var_340_8 + arg_340_0 and arg_337_1.var_.actorSpriteComps1012 == nil then
				arg_337_1.var_.actorSpriteComps1012 = var_340_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_9 = 0.034

			if var_340_8 <= arg_337_1.time_ and arg_337_1.time_ < var_340_8 + var_340_9 then
				local var_340_10 = (arg_337_1.time_ - var_340_8) / var_340_9

				if arg_337_1.var_.actorSpriteComps1012 then
					for iter_340_1, iter_340_2 in pairs(arg_337_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_340_2 then
							local var_340_11 = Mathf.Lerp(iter_340_2.color.r, 1, var_340_10)

							iter_340_2.color = Color.New(var_340_11, var_340_11, var_340_11)
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_8 + var_340_9 and arg_337_1.time_ < var_340_8 + var_340_9 + arg_340_0 and arg_337_1.var_.actorSpriteComps1012 then
				local var_340_12 = 1

				for iter_340_3, iter_340_4 in pairs(arg_337_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_340_4 then
						iter_340_4.color = Color.New(var_340_12, var_340_12, var_340_12)
					end
				end

				arg_337_1.var_.actorSpriteComps1012 = nil
			end

			local var_340_13 = arg_337_1.actors_["1060"]
			local var_340_14 = 0

			if var_340_14 < arg_337_1.time_ and arg_337_1.time_ <= var_340_14 + arg_340_0 and arg_337_1.var_.actorSpriteComps1060 == nil then
				arg_337_1.var_.actorSpriteComps1060 = var_340_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_15 = 0.034

			if var_340_14 <= arg_337_1.time_ and arg_337_1.time_ < var_340_14 + var_340_15 then
				local var_340_16 = (arg_337_1.time_ - var_340_14) / var_340_15

				if arg_337_1.var_.actorSpriteComps1060 then
					for iter_340_5, iter_340_6 in pairs(arg_337_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_340_6 then
							local var_340_17 = Mathf.Lerp(iter_340_6.color.r, 0.5, var_340_16)

							iter_340_6.color = Color.New(var_340_17, var_340_17, var_340_17)
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_14 + var_340_15 and arg_337_1.time_ < var_340_14 + var_340_15 + arg_340_0 and arg_337_1.var_.actorSpriteComps1060 then
				local var_340_18 = 0.5

				for iter_340_7, iter_340_8 in pairs(arg_337_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_340_8 then
						iter_340_8.color = Color.New(var_340_18, var_340_18, var_340_18)
					end
				end

				arg_337_1.var_.actorSpriteComps1060 = nil
			end

			local var_340_19 = 0
			local var_340_20 = 0.3

			if var_340_19 < arg_337_1.time_ and arg_337_1.time_ <= var_340_19 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_21 = arg_337_1:FormatText(StoryNameCfg[595].name)

				arg_337_1.leftNameTxt_.text = var_340_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_22 = arg_337_1:GetWordFromCfg(410082083)
				local var_340_23 = arg_337_1:FormatText(var_340_22.content)

				arg_337_1.text_.text = var_340_23

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_24 = 12
				local var_340_25 = utf8.len(var_340_23)
				local var_340_26 = var_340_24 <= 0 and var_340_20 or var_340_20 * (var_340_25 / var_340_24)

				if var_340_26 > 0 and var_340_20 < var_340_26 then
					arg_337_1.talkMaxDuration = var_340_26

					if var_340_26 + var_340_19 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_26 + var_340_19
					end
				end

				arg_337_1.text_.text = var_340_23
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082083", "story_v_out_410082.awb") ~= 0 then
					local var_340_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082083", "story_v_out_410082.awb") / 1000

					if var_340_27 + var_340_19 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_27 + var_340_19
					end

					if var_340_22.prefab_name ~= "" and arg_337_1.actors_[var_340_22.prefab_name] ~= nil then
						local var_340_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_22.prefab_name].transform, "story_v_out_410082", "410082083", "story_v_out_410082.awb")

						arg_337_1:RecordAudio("410082083", var_340_28)
						arg_337_1:RecordAudio("410082083", var_340_28)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_410082", "410082083", "story_v_out_410082.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_410082", "410082083", "story_v_out_410082.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_29 = math.max(var_340_20, arg_337_1.talkMaxDuration)

			if var_340_19 <= arg_337_1.time_ and arg_337_1.time_ < var_340_19 + var_340_29 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_19) / var_340_29

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_19 + var_340_29 and arg_337_1.time_ < var_340_19 + var_340_29 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play410082084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 410082084
		arg_341_1.duration_ = 4.433

		local var_341_0 = {
			zh = 1.6,
			ja = 4.433
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play410082085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1060"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1060 = var_344_0.localPosition
				var_344_0.localScale = Vector3.New(1, 1, 1)

				arg_341_1:CheckSpriteTmpPos("1060", 2)

				local var_344_2 = var_344_0.childCount

				for iter_344_0 = 0, var_344_2 - 1 do
					local var_344_3 = var_344_0:GetChild(iter_344_0)

					if var_344_3.name == "" or not string.find(var_344_3.name, "split") then
						var_344_3.gameObject:SetActive(true)
					else
						var_344_3.gameObject:SetActive(false)
					end
				end
			end

			local var_344_4 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_4 then
				local var_344_5 = (arg_341_1.time_ - var_344_1) / var_344_4
				local var_344_6 = Vector3.New(-390, -435, -40)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1060, var_344_6, var_344_5)
			end

			if arg_341_1.time_ >= var_344_1 + var_344_4 and arg_341_1.time_ < var_344_1 + var_344_4 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_344_7 = arg_341_1.actors_["1060"]
			local var_344_8 = 0

			if var_344_8 < arg_341_1.time_ and arg_341_1.time_ <= var_344_8 + arg_344_0 and arg_341_1.var_.actorSpriteComps1060 == nil then
				arg_341_1.var_.actorSpriteComps1060 = var_344_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_9 = 0.034

			if var_344_8 <= arg_341_1.time_ and arg_341_1.time_ < var_344_8 + var_344_9 then
				local var_344_10 = (arg_341_1.time_ - var_344_8) / var_344_9

				if arg_341_1.var_.actorSpriteComps1060 then
					for iter_344_1, iter_344_2 in pairs(arg_341_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_344_2 then
							local var_344_11 = Mathf.Lerp(iter_344_2.color.r, 1, var_344_10)

							iter_344_2.color = Color.New(var_344_11, var_344_11, var_344_11)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_8 + var_344_9 and arg_341_1.time_ < var_344_8 + var_344_9 + arg_344_0 and arg_341_1.var_.actorSpriteComps1060 then
				local var_344_12 = 1

				for iter_344_3, iter_344_4 in pairs(arg_341_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_344_4 then
						iter_344_4.color = Color.New(var_344_12, var_344_12, var_344_12)
					end
				end

				arg_341_1.var_.actorSpriteComps1060 = nil
			end

			local var_344_13 = arg_341_1.actors_["1012"]
			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 and arg_341_1.var_.actorSpriteComps1012 == nil then
				arg_341_1.var_.actorSpriteComps1012 = var_344_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_15 = 0.034

			if var_344_14 <= arg_341_1.time_ and arg_341_1.time_ < var_344_14 + var_344_15 then
				local var_344_16 = (arg_341_1.time_ - var_344_14) / var_344_15

				if arg_341_1.var_.actorSpriteComps1012 then
					for iter_344_5, iter_344_6 in pairs(arg_341_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_344_6 then
							local var_344_17 = Mathf.Lerp(iter_344_6.color.r, 0.5, var_344_16)

							iter_344_6.color = Color.New(var_344_17, var_344_17, var_344_17)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_14 + var_344_15 and arg_341_1.time_ < var_344_14 + var_344_15 + arg_344_0 and arg_341_1.var_.actorSpriteComps1012 then
				local var_344_18 = 0.5

				for iter_344_7, iter_344_8 in pairs(arg_341_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_344_8 then
						iter_344_8.color = Color.New(var_344_18, var_344_18, var_344_18)
					end
				end

				arg_341_1.var_.actorSpriteComps1012 = nil
			end

			local var_344_19 = 0
			local var_344_20 = 0.25

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_21 = arg_341_1:FormatText(StoryNameCfg[584].name)

				arg_341_1.leftNameTxt_.text = var_344_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_22 = arg_341_1:GetWordFromCfg(410082084)
				local var_344_23 = arg_341_1:FormatText(var_344_22.content)

				arg_341_1.text_.text = var_344_23

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_24 = 10
				local var_344_25 = utf8.len(var_344_23)
				local var_344_26 = var_344_24 <= 0 and var_344_20 or var_344_20 * (var_344_25 / var_344_24)

				if var_344_26 > 0 and var_344_20 < var_344_26 then
					arg_341_1.talkMaxDuration = var_344_26

					if var_344_26 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_26 + var_344_19
					end
				end

				arg_341_1.text_.text = var_344_23
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082084", "story_v_out_410082.awb") ~= 0 then
					local var_344_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082084", "story_v_out_410082.awb") / 1000

					if var_344_27 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_27 + var_344_19
					end

					if var_344_22.prefab_name ~= "" and arg_341_1.actors_[var_344_22.prefab_name] ~= nil then
						local var_344_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_22.prefab_name].transform, "story_v_out_410082", "410082084", "story_v_out_410082.awb")

						arg_341_1:RecordAudio("410082084", var_344_28)
						arg_341_1:RecordAudio("410082084", var_344_28)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_410082", "410082084", "story_v_out_410082.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_410082", "410082084", "story_v_out_410082.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_29 = math.max(var_344_20, arg_341_1.talkMaxDuration)

			if var_344_19 <= arg_341_1.time_ and arg_341_1.time_ < var_344_19 + var_344_29 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_19) / var_344_29

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_19 + var_344_29 and arg_341_1.time_ < var_344_19 + var_344_29 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play410082085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 410082085
		arg_345_1.duration_ = 12.366

		local var_345_0 = {
			zh = 8.1,
			ja = 12.366
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play410082086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1012"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1012 = var_348_0.localPosition
				var_348_0.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("1012", 4)

				local var_348_2 = var_348_0.childCount

				for iter_348_0 = 0, var_348_2 - 1 do
					local var_348_3 = var_348_0:GetChild(iter_348_0)

					if var_348_3.name == "" or not string.find(var_348_3.name, "split") then
						var_348_3.gameObject:SetActive(true)
					else
						var_348_3.gameObject:SetActive(false)
					end
				end
			end

			local var_348_4 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_4 then
				local var_348_5 = (arg_345_1.time_ - var_348_1) / var_348_4
				local var_348_6 = Vector3.New(390, -465, 300)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1012, var_348_6, var_348_5)
			end

			if arg_345_1.time_ >= var_348_1 + var_348_4 and arg_345_1.time_ < var_348_1 + var_348_4 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_348_7 = arg_345_1.actors_["1012"]
			local var_348_8 = 0

			if var_348_8 < arg_345_1.time_ and arg_345_1.time_ <= var_348_8 + arg_348_0 and arg_345_1.var_.actorSpriteComps1012 == nil then
				arg_345_1.var_.actorSpriteComps1012 = var_348_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_9 = 0.034

			if var_348_8 <= arg_345_1.time_ and arg_345_1.time_ < var_348_8 + var_348_9 then
				local var_348_10 = (arg_345_1.time_ - var_348_8) / var_348_9

				if arg_345_1.var_.actorSpriteComps1012 then
					for iter_348_1, iter_348_2 in pairs(arg_345_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_348_2 then
							local var_348_11 = Mathf.Lerp(iter_348_2.color.r, 1, var_348_10)

							iter_348_2.color = Color.New(var_348_11, var_348_11, var_348_11)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_8 + var_348_9 and arg_345_1.time_ < var_348_8 + var_348_9 + arg_348_0 and arg_345_1.var_.actorSpriteComps1012 then
				local var_348_12 = 1

				for iter_348_3, iter_348_4 in pairs(arg_345_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_348_4 then
						iter_348_4.color = Color.New(var_348_12, var_348_12, var_348_12)
					end
				end

				arg_345_1.var_.actorSpriteComps1012 = nil
			end

			local var_348_13 = arg_345_1.actors_["1060"]
			local var_348_14 = 0

			if var_348_14 < arg_345_1.time_ and arg_345_1.time_ <= var_348_14 + arg_348_0 and arg_345_1.var_.actorSpriteComps1060 == nil then
				arg_345_1.var_.actorSpriteComps1060 = var_348_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_15 = 0.034

			if var_348_14 <= arg_345_1.time_ and arg_345_1.time_ < var_348_14 + var_348_15 then
				local var_348_16 = (arg_345_1.time_ - var_348_14) / var_348_15

				if arg_345_1.var_.actorSpriteComps1060 then
					for iter_348_5, iter_348_6 in pairs(arg_345_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_348_6 then
							local var_348_17 = Mathf.Lerp(iter_348_6.color.r, 0.5, var_348_16)

							iter_348_6.color = Color.New(var_348_17, var_348_17, var_348_17)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_14 + var_348_15 and arg_345_1.time_ < var_348_14 + var_348_15 + arg_348_0 and arg_345_1.var_.actorSpriteComps1060 then
				local var_348_18 = 0.5

				for iter_348_7, iter_348_8 in pairs(arg_345_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_348_8 then
						iter_348_8.color = Color.New(var_348_18, var_348_18, var_348_18)
					end
				end

				arg_345_1.var_.actorSpriteComps1060 = nil
			end

			local var_348_19 = 0
			local var_348_20 = 0.9

			if var_348_19 < arg_345_1.time_ and arg_345_1.time_ <= var_348_19 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_21 = arg_345_1:FormatText(StoryNameCfg[595].name)

				arg_345_1.leftNameTxt_.text = var_348_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_22 = arg_345_1:GetWordFromCfg(410082085)
				local var_348_23 = arg_345_1:FormatText(var_348_22.content)

				arg_345_1.text_.text = var_348_23

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_24 = 36
				local var_348_25 = utf8.len(var_348_23)
				local var_348_26 = var_348_24 <= 0 and var_348_20 or var_348_20 * (var_348_25 / var_348_24)

				if var_348_26 > 0 and var_348_20 < var_348_26 then
					arg_345_1.talkMaxDuration = var_348_26

					if var_348_26 + var_348_19 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_26 + var_348_19
					end
				end

				arg_345_1.text_.text = var_348_23
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082085", "story_v_out_410082.awb") ~= 0 then
					local var_348_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082085", "story_v_out_410082.awb") / 1000

					if var_348_27 + var_348_19 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_27 + var_348_19
					end

					if var_348_22.prefab_name ~= "" and arg_345_1.actors_[var_348_22.prefab_name] ~= nil then
						local var_348_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_22.prefab_name].transform, "story_v_out_410082", "410082085", "story_v_out_410082.awb")

						arg_345_1:RecordAudio("410082085", var_348_28)
						arg_345_1:RecordAudio("410082085", var_348_28)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_410082", "410082085", "story_v_out_410082.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_410082", "410082085", "story_v_out_410082.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_29 = math.max(var_348_20, arg_345_1.talkMaxDuration)

			if var_348_19 <= arg_345_1.time_ and arg_345_1.time_ < var_348_19 + var_348_29 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_19) / var_348_29

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_19 + var_348_29 and arg_345_1.time_ < var_348_19 + var_348_29 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play410082086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 410082086
		arg_349_1.duration_ = 7.166

		local var_349_0 = {
			zh = 2.833,
			ja = 7.166
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play410082087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1060"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos1060 = var_352_0.localPosition
				var_352_0.localScale = Vector3.New(1, 1, 1)

				arg_349_1:CheckSpriteTmpPos("1060", 2)

				local var_352_2 = var_352_0.childCount

				for iter_352_0 = 0, var_352_2 - 1 do
					local var_352_3 = var_352_0:GetChild(iter_352_0)

					if var_352_3.name == "" or not string.find(var_352_3.name, "split") then
						var_352_3.gameObject:SetActive(true)
					else
						var_352_3.gameObject:SetActive(false)
					end
				end
			end

			local var_352_4 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_4 then
				local var_352_5 = (arg_349_1.time_ - var_352_1) / var_352_4
				local var_352_6 = Vector3.New(-390, -435, -40)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1060, var_352_6, var_352_5)
			end

			if arg_349_1.time_ >= var_352_1 + var_352_4 and arg_349_1.time_ < var_352_1 + var_352_4 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_352_7 = arg_349_1.actors_["1060"]
			local var_352_8 = 0

			if var_352_8 < arg_349_1.time_ and arg_349_1.time_ <= var_352_8 + arg_352_0 and arg_349_1.var_.actorSpriteComps1060 == nil then
				arg_349_1.var_.actorSpriteComps1060 = var_352_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_9 = 0.034

			if var_352_8 <= arg_349_1.time_ and arg_349_1.time_ < var_352_8 + var_352_9 then
				local var_352_10 = (arg_349_1.time_ - var_352_8) / var_352_9

				if arg_349_1.var_.actorSpriteComps1060 then
					for iter_352_1, iter_352_2 in pairs(arg_349_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_352_2 then
							local var_352_11 = Mathf.Lerp(iter_352_2.color.r, 1, var_352_10)

							iter_352_2.color = Color.New(var_352_11, var_352_11, var_352_11)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_8 + var_352_9 and arg_349_1.time_ < var_352_8 + var_352_9 + arg_352_0 and arg_349_1.var_.actorSpriteComps1060 then
				local var_352_12 = 1

				for iter_352_3, iter_352_4 in pairs(arg_349_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_352_4 then
						iter_352_4.color = Color.New(var_352_12, var_352_12, var_352_12)
					end
				end

				arg_349_1.var_.actorSpriteComps1060 = nil
			end

			local var_352_13 = arg_349_1.actors_["1012"]
			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 and arg_349_1.var_.actorSpriteComps1012 == nil then
				arg_349_1.var_.actorSpriteComps1012 = var_352_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_15 = 0.034

			if var_352_14 <= arg_349_1.time_ and arg_349_1.time_ < var_352_14 + var_352_15 then
				local var_352_16 = (arg_349_1.time_ - var_352_14) / var_352_15

				if arg_349_1.var_.actorSpriteComps1012 then
					for iter_352_5, iter_352_6 in pairs(arg_349_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_352_6 then
							local var_352_17 = Mathf.Lerp(iter_352_6.color.r, 0.5, var_352_16)

							iter_352_6.color = Color.New(var_352_17, var_352_17, var_352_17)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_14 + var_352_15 and arg_349_1.time_ < var_352_14 + var_352_15 + arg_352_0 and arg_349_1.var_.actorSpriteComps1012 then
				local var_352_18 = 0.5

				for iter_352_7, iter_352_8 in pairs(arg_349_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_352_8 then
						iter_352_8.color = Color.New(var_352_18, var_352_18, var_352_18)
					end
				end

				arg_349_1.var_.actorSpriteComps1012 = nil
			end

			local var_352_19 = 0
			local var_352_20 = 0.125

			if var_352_19 < arg_349_1.time_ and arg_349_1.time_ <= var_352_19 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_21 = arg_349_1:FormatText(StoryNameCfg[584].name)

				arg_349_1.leftNameTxt_.text = var_352_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_22 = arg_349_1:GetWordFromCfg(410082086)
				local var_352_23 = arg_349_1:FormatText(var_352_22.content)

				arg_349_1.text_.text = var_352_23

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_24 = 5
				local var_352_25 = utf8.len(var_352_23)
				local var_352_26 = var_352_24 <= 0 and var_352_20 or var_352_20 * (var_352_25 / var_352_24)

				if var_352_26 > 0 and var_352_20 < var_352_26 then
					arg_349_1.talkMaxDuration = var_352_26

					if var_352_26 + var_352_19 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_26 + var_352_19
					end
				end

				arg_349_1.text_.text = var_352_23
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082086", "story_v_out_410082.awb") ~= 0 then
					local var_352_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082086", "story_v_out_410082.awb") / 1000

					if var_352_27 + var_352_19 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_27 + var_352_19
					end

					if var_352_22.prefab_name ~= "" and arg_349_1.actors_[var_352_22.prefab_name] ~= nil then
						local var_352_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_22.prefab_name].transform, "story_v_out_410082", "410082086", "story_v_out_410082.awb")

						arg_349_1:RecordAudio("410082086", var_352_28)
						arg_349_1:RecordAudio("410082086", var_352_28)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_410082", "410082086", "story_v_out_410082.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_410082", "410082086", "story_v_out_410082.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_29 = math.max(var_352_20, arg_349_1.talkMaxDuration)

			if var_352_19 <= arg_349_1.time_ and arg_349_1.time_ < var_352_19 + var_352_29 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_19) / var_352_29

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_19 + var_352_29 and arg_349_1.time_ < var_352_19 + var_352_29 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play410082087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 410082087
		arg_353_1.duration_ = 11.2

		local var_353_0 = {
			zh = 9.666,
			ja = 11.2
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play410082088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1012"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos1012 = var_356_0.localPosition
				var_356_0.localScale = Vector3.New(1, 1, 1)

				arg_353_1:CheckSpriteTmpPos("1012", 4)

				local var_356_2 = var_356_0.childCount

				for iter_356_0 = 0, var_356_2 - 1 do
					local var_356_3 = var_356_0:GetChild(iter_356_0)

					if var_356_3.name == "" or not string.find(var_356_3.name, "split") then
						var_356_3.gameObject:SetActive(true)
					else
						var_356_3.gameObject:SetActive(false)
					end
				end
			end

			local var_356_4 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_4 then
				local var_356_5 = (arg_353_1.time_ - var_356_1) / var_356_4
				local var_356_6 = Vector3.New(390, -465, 300)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1012, var_356_6, var_356_5)
			end

			if arg_353_1.time_ >= var_356_1 + var_356_4 and arg_353_1.time_ < var_356_1 + var_356_4 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_356_7 = arg_353_1.actors_["1012"]
			local var_356_8 = 0

			if var_356_8 < arg_353_1.time_ and arg_353_1.time_ <= var_356_8 + arg_356_0 and arg_353_1.var_.actorSpriteComps1012 == nil then
				arg_353_1.var_.actorSpriteComps1012 = var_356_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_9 = 0.034

			if var_356_8 <= arg_353_1.time_ and arg_353_1.time_ < var_356_8 + var_356_9 then
				local var_356_10 = (arg_353_1.time_ - var_356_8) / var_356_9

				if arg_353_1.var_.actorSpriteComps1012 then
					for iter_356_1, iter_356_2 in pairs(arg_353_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_356_2 then
							local var_356_11 = Mathf.Lerp(iter_356_2.color.r, 1, var_356_10)

							iter_356_2.color = Color.New(var_356_11, var_356_11, var_356_11)
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_8 + var_356_9 and arg_353_1.time_ < var_356_8 + var_356_9 + arg_356_0 and arg_353_1.var_.actorSpriteComps1012 then
				local var_356_12 = 1

				for iter_356_3, iter_356_4 in pairs(arg_353_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_356_4 then
						iter_356_4.color = Color.New(var_356_12, var_356_12, var_356_12)
					end
				end

				arg_353_1.var_.actorSpriteComps1012 = nil
			end

			local var_356_13 = arg_353_1.actors_["1060"]
			local var_356_14 = 0

			if var_356_14 < arg_353_1.time_ and arg_353_1.time_ <= var_356_14 + arg_356_0 and arg_353_1.var_.actorSpriteComps1060 == nil then
				arg_353_1.var_.actorSpriteComps1060 = var_356_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_15 = 0.034

			if var_356_14 <= arg_353_1.time_ and arg_353_1.time_ < var_356_14 + var_356_15 then
				local var_356_16 = (arg_353_1.time_ - var_356_14) / var_356_15

				if arg_353_1.var_.actorSpriteComps1060 then
					for iter_356_5, iter_356_6 in pairs(arg_353_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_356_6 then
							local var_356_17 = Mathf.Lerp(iter_356_6.color.r, 0.5, var_356_16)

							iter_356_6.color = Color.New(var_356_17, var_356_17, var_356_17)
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_14 + var_356_15 and arg_353_1.time_ < var_356_14 + var_356_15 + arg_356_0 and arg_353_1.var_.actorSpriteComps1060 then
				local var_356_18 = 0.5

				for iter_356_7, iter_356_8 in pairs(arg_353_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_356_8 then
						iter_356_8.color = Color.New(var_356_18, var_356_18, var_356_18)
					end
				end

				arg_353_1.var_.actorSpriteComps1060 = nil
			end

			local var_356_19 = 0
			local var_356_20 = 1.225

			if var_356_19 < arg_353_1.time_ and arg_353_1.time_ <= var_356_19 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_21 = arg_353_1:FormatText(StoryNameCfg[595].name)

				arg_353_1.leftNameTxt_.text = var_356_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_22 = arg_353_1:GetWordFromCfg(410082087)
				local var_356_23 = arg_353_1:FormatText(var_356_22.content)

				arg_353_1.text_.text = var_356_23

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_24 = 49
				local var_356_25 = utf8.len(var_356_23)
				local var_356_26 = var_356_24 <= 0 and var_356_20 or var_356_20 * (var_356_25 / var_356_24)

				if var_356_26 > 0 and var_356_20 < var_356_26 then
					arg_353_1.talkMaxDuration = var_356_26

					if var_356_26 + var_356_19 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_26 + var_356_19
					end
				end

				arg_353_1.text_.text = var_356_23
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082087", "story_v_out_410082.awb") ~= 0 then
					local var_356_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082087", "story_v_out_410082.awb") / 1000

					if var_356_27 + var_356_19 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_27 + var_356_19
					end

					if var_356_22.prefab_name ~= "" and arg_353_1.actors_[var_356_22.prefab_name] ~= nil then
						local var_356_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_22.prefab_name].transform, "story_v_out_410082", "410082087", "story_v_out_410082.awb")

						arg_353_1:RecordAudio("410082087", var_356_28)
						arg_353_1:RecordAudio("410082087", var_356_28)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_410082", "410082087", "story_v_out_410082.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_410082", "410082087", "story_v_out_410082.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_29 = math.max(var_356_20, arg_353_1.talkMaxDuration)

			if var_356_19 <= arg_353_1.time_ and arg_353_1.time_ < var_356_19 + var_356_29 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_19) / var_356_29

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_19 + var_356_29 and arg_353_1.time_ < var_356_19 + var_356_29 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play410082088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 410082088
		arg_357_1.duration_ = 9.533

		local var_357_0 = {
			zh = 4.666,
			ja = 9.533
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play410082089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.575

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[595].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(410082088)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 23
				local var_360_6 = utf8.len(var_360_4)
				local var_360_7 = var_360_5 <= 0 and var_360_1 or var_360_1 * (var_360_6 / var_360_5)

				if var_360_7 > 0 and var_360_1 < var_360_7 then
					arg_357_1.talkMaxDuration = var_360_7

					if var_360_7 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_7 + var_360_0
					end
				end

				arg_357_1.text_.text = var_360_4
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082088", "story_v_out_410082.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082088", "story_v_out_410082.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_410082", "410082088", "story_v_out_410082.awb")

						arg_357_1:RecordAudio("410082088", var_360_9)
						arg_357_1:RecordAudio("410082088", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_410082", "410082088", "story_v_out_410082.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_410082", "410082088", "story_v_out_410082.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_10 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_10 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_10

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_10 and arg_357_1.time_ < var_360_0 + var_360_10 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play410082089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 410082089
		arg_361_1.duration_ = 5.133

		local var_361_0 = {
			zh = 1.7,
			ja = 5.133
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play410082090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1060"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos1060 = var_364_0.localPosition
				var_364_0.localScale = Vector3.New(1, 1, 1)

				arg_361_1:CheckSpriteTmpPos("1060", 2)

				local var_364_2 = var_364_0.childCount

				for iter_364_0 = 0, var_364_2 - 1 do
					local var_364_3 = var_364_0:GetChild(iter_364_0)

					if var_364_3.name == "" or not string.find(var_364_3.name, "split") then
						var_364_3.gameObject:SetActive(true)
					else
						var_364_3.gameObject:SetActive(false)
					end
				end
			end

			local var_364_4 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_4 then
				local var_364_5 = (arg_361_1.time_ - var_364_1) / var_364_4
				local var_364_6 = Vector3.New(-390, -435, -40)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos1060, var_364_6, var_364_5)
			end

			if arg_361_1.time_ >= var_364_1 + var_364_4 and arg_361_1.time_ < var_364_1 + var_364_4 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_364_7 = arg_361_1.actors_["1060"]
			local var_364_8 = 0

			if var_364_8 < arg_361_1.time_ and arg_361_1.time_ <= var_364_8 + arg_364_0 and arg_361_1.var_.actorSpriteComps1060 == nil then
				arg_361_1.var_.actorSpriteComps1060 = var_364_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_9 = 0.034

			if var_364_8 <= arg_361_1.time_ and arg_361_1.time_ < var_364_8 + var_364_9 then
				local var_364_10 = (arg_361_1.time_ - var_364_8) / var_364_9

				if arg_361_1.var_.actorSpriteComps1060 then
					for iter_364_1, iter_364_2 in pairs(arg_361_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_364_2 then
							local var_364_11 = Mathf.Lerp(iter_364_2.color.r, 1, var_364_10)

							iter_364_2.color = Color.New(var_364_11, var_364_11, var_364_11)
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_8 + var_364_9 and arg_361_1.time_ < var_364_8 + var_364_9 + arg_364_0 and arg_361_1.var_.actorSpriteComps1060 then
				local var_364_12 = 1

				for iter_364_3, iter_364_4 in pairs(arg_361_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_364_4 then
						iter_364_4.color = Color.New(var_364_12, var_364_12, var_364_12)
					end
				end

				arg_361_1.var_.actorSpriteComps1060 = nil
			end

			local var_364_13 = arg_361_1.actors_["1012"]
			local var_364_14 = 0

			if var_364_14 < arg_361_1.time_ and arg_361_1.time_ <= var_364_14 + arg_364_0 and arg_361_1.var_.actorSpriteComps1012 == nil then
				arg_361_1.var_.actorSpriteComps1012 = var_364_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_15 = 0.034

			if var_364_14 <= arg_361_1.time_ and arg_361_1.time_ < var_364_14 + var_364_15 then
				local var_364_16 = (arg_361_1.time_ - var_364_14) / var_364_15

				if arg_361_1.var_.actorSpriteComps1012 then
					for iter_364_5, iter_364_6 in pairs(arg_361_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_364_6 then
							local var_364_17 = Mathf.Lerp(iter_364_6.color.r, 0.5, var_364_16)

							iter_364_6.color = Color.New(var_364_17, var_364_17, var_364_17)
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_14 + var_364_15 and arg_361_1.time_ < var_364_14 + var_364_15 + arg_364_0 and arg_361_1.var_.actorSpriteComps1012 then
				local var_364_18 = 0.5

				for iter_364_7, iter_364_8 in pairs(arg_361_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_364_8 then
						iter_364_8.color = Color.New(var_364_18, var_364_18, var_364_18)
					end
				end

				arg_361_1.var_.actorSpriteComps1012 = nil
			end

			local var_364_19 = 0
			local var_364_20 = 0.25

			if var_364_19 < arg_361_1.time_ and arg_361_1.time_ <= var_364_19 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_21 = arg_361_1:FormatText(StoryNameCfg[584].name)

				arg_361_1.leftNameTxt_.text = var_364_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_22 = arg_361_1:GetWordFromCfg(410082089)
				local var_364_23 = arg_361_1:FormatText(var_364_22.content)

				arg_361_1.text_.text = var_364_23

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_24 = 10
				local var_364_25 = utf8.len(var_364_23)
				local var_364_26 = var_364_24 <= 0 and var_364_20 or var_364_20 * (var_364_25 / var_364_24)

				if var_364_26 > 0 and var_364_20 < var_364_26 then
					arg_361_1.talkMaxDuration = var_364_26

					if var_364_26 + var_364_19 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_26 + var_364_19
					end
				end

				arg_361_1.text_.text = var_364_23
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082089", "story_v_out_410082.awb") ~= 0 then
					local var_364_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082089", "story_v_out_410082.awb") / 1000

					if var_364_27 + var_364_19 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_27 + var_364_19
					end

					if var_364_22.prefab_name ~= "" and arg_361_1.actors_[var_364_22.prefab_name] ~= nil then
						local var_364_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_22.prefab_name].transform, "story_v_out_410082", "410082089", "story_v_out_410082.awb")

						arg_361_1:RecordAudio("410082089", var_364_28)
						arg_361_1:RecordAudio("410082089", var_364_28)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_410082", "410082089", "story_v_out_410082.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_410082", "410082089", "story_v_out_410082.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_29 = math.max(var_364_20, arg_361_1.talkMaxDuration)

			if var_364_19 <= arg_361_1.time_ and arg_361_1.time_ < var_364_19 + var_364_29 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_19) / var_364_29

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_19 + var_364_29 and arg_361_1.time_ < var_364_19 + var_364_29 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play410082090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 410082090
		arg_365_1.duration_ = 6.833

		local var_365_0 = {
			zh = 2.833,
			ja = 6.833
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play410082091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1012"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos1012 = var_368_0.localPosition
				var_368_0.localScale = Vector3.New(1, 1, 1)

				arg_365_1:CheckSpriteTmpPos("1012", 4)

				local var_368_2 = var_368_0.childCount

				for iter_368_0 = 0, var_368_2 - 1 do
					local var_368_3 = var_368_0:GetChild(iter_368_0)

					if var_368_3.name == "split_3" or not string.find(var_368_3.name, "split") then
						var_368_3.gameObject:SetActive(true)
					else
						var_368_3.gameObject:SetActive(false)
					end
				end
			end

			local var_368_4 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_4 then
				local var_368_5 = (arg_365_1.time_ - var_368_1) / var_368_4
				local var_368_6 = Vector3.New(390, -465, 300)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1012, var_368_6, var_368_5)
			end

			if arg_365_1.time_ >= var_368_1 + var_368_4 and arg_365_1.time_ < var_368_1 + var_368_4 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_368_7 = arg_365_1.actors_["1012"]
			local var_368_8 = 0

			if var_368_8 < arg_365_1.time_ and arg_365_1.time_ <= var_368_8 + arg_368_0 and arg_365_1.var_.actorSpriteComps1012 == nil then
				arg_365_1.var_.actorSpriteComps1012 = var_368_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_368_9 = 0.034

			if var_368_8 <= arg_365_1.time_ and arg_365_1.time_ < var_368_8 + var_368_9 then
				local var_368_10 = (arg_365_1.time_ - var_368_8) / var_368_9

				if arg_365_1.var_.actorSpriteComps1012 then
					for iter_368_1, iter_368_2 in pairs(arg_365_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_368_2 then
							local var_368_11 = Mathf.Lerp(iter_368_2.color.r, 1, var_368_10)

							iter_368_2.color = Color.New(var_368_11, var_368_11, var_368_11)
						end
					end
				end
			end

			if arg_365_1.time_ >= var_368_8 + var_368_9 and arg_365_1.time_ < var_368_8 + var_368_9 + arg_368_0 and arg_365_1.var_.actorSpriteComps1012 then
				local var_368_12 = 1

				for iter_368_3, iter_368_4 in pairs(arg_365_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_368_4 then
						iter_368_4.color = Color.New(var_368_12, var_368_12, var_368_12)
					end
				end

				arg_365_1.var_.actorSpriteComps1012 = nil
			end

			local var_368_13 = arg_365_1.actors_["1060"]
			local var_368_14 = 0

			if var_368_14 < arg_365_1.time_ and arg_365_1.time_ <= var_368_14 + arg_368_0 and arg_365_1.var_.actorSpriteComps1060 == nil then
				arg_365_1.var_.actorSpriteComps1060 = var_368_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_368_15 = 0.034

			if var_368_14 <= arg_365_1.time_ and arg_365_1.time_ < var_368_14 + var_368_15 then
				local var_368_16 = (arg_365_1.time_ - var_368_14) / var_368_15

				if arg_365_1.var_.actorSpriteComps1060 then
					for iter_368_5, iter_368_6 in pairs(arg_365_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_368_6 then
							local var_368_17 = Mathf.Lerp(iter_368_6.color.r, 0.5, var_368_16)

							iter_368_6.color = Color.New(var_368_17, var_368_17, var_368_17)
						end
					end
				end
			end

			if arg_365_1.time_ >= var_368_14 + var_368_15 and arg_365_1.time_ < var_368_14 + var_368_15 + arg_368_0 and arg_365_1.var_.actorSpriteComps1060 then
				local var_368_18 = 0.5

				for iter_368_7, iter_368_8 in pairs(arg_365_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_368_8 then
						iter_368_8.color = Color.New(var_368_18, var_368_18, var_368_18)
					end
				end

				arg_365_1.var_.actorSpriteComps1060 = nil
			end

			local var_368_19 = 0
			local var_368_20 = 0.4

			if var_368_19 < arg_365_1.time_ and arg_365_1.time_ <= var_368_19 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_21 = arg_365_1:FormatText(StoryNameCfg[595].name)

				arg_365_1.leftNameTxt_.text = var_368_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_22 = arg_365_1:GetWordFromCfg(410082090)
				local var_368_23 = arg_365_1:FormatText(var_368_22.content)

				arg_365_1.text_.text = var_368_23

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_24 = 16
				local var_368_25 = utf8.len(var_368_23)
				local var_368_26 = var_368_24 <= 0 and var_368_20 or var_368_20 * (var_368_25 / var_368_24)

				if var_368_26 > 0 and var_368_20 < var_368_26 then
					arg_365_1.talkMaxDuration = var_368_26

					if var_368_26 + var_368_19 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_26 + var_368_19
					end
				end

				arg_365_1.text_.text = var_368_23
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082090", "story_v_out_410082.awb") ~= 0 then
					local var_368_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082090", "story_v_out_410082.awb") / 1000

					if var_368_27 + var_368_19 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_27 + var_368_19
					end

					if var_368_22.prefab_name ~= "" and arg_365_1.actors_[var_368_22.prefab_name] ~= nil then
						local var_368_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_22.prefab_name].transform, "story_v_out_410082", "410082090", "story_v_out_410082.awb")

						arg_365_1:RecordAudio("410082090", var_368_28)
						arg_365_1:RecordAudio("410082090", var_368_28)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_410082", "410082090", "story_v_out_410082.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_410082", "410082090", "story_v_out_410082.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_29 = math.max(var_368_20, arg_365_1.talkMaxDuration)

			if var_368_19 <= arg_365_1.time_ and arg_365_1.time_ < var_368_19 + var_368_29 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_19) / var_368_29

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_19 + var_368_29 and arg_365_1.time_ < var_368_19 + var_368_29 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play410082091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 410082091
		arg_369_1.duration_ = 5.933

		local var_369_0 = {
			zh = 2.733,
			ja = 5.933
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play410082092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1060"].transform
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.var_.moveOldPos1060 = var_372_0.localPosition
				var_372_0.localScale = Vector3.New(1, 1, 1)

				arg_369_1:CheckSpriteTmpPos("1060", 2)

				local var_372_2 = var_372_0.childCount

				for iter_372_0 = 0, var_372_2 - 1 do
					local var_372_3 = var_372_0:GetChild(iter_372_0)

					if var_372_3.name == "split_3" or not string.find(var_372_3.name, "split") then
						var_372_3.gameObject:SetActive(true)
					else
						var_372_3.gameObject:SetActive(false)
					end
				end
			end

			local var_372_4 = 0.001

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_4 then
				local var_372_5 = (arg_369_1.time_ - var_372_1) / var_372_4
				local var_372_6 = Vector3.New(-390, -435, -40)

				var_372_0.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos1060, var_372_6, var_372_5)
			end

			if arg_369_1.time_ >= var_372_1 + var_372_4 and arg_369_1.time_ < var_372_1 + var_372_4 + arg_372_0 then
				var_372_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_372_7 = arg_369_1.actors_["1060"]
			local var_372_8 = 0

			if var_372_8 < arg_369_1.time_ and arg_369_1.time_ <= var_372_8 + arg_372_0 and arg_369_1.var_.actorSpriteComps1060 == nil then
				arg_369_1.var_.actorSpriteComps1060 = var_372_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_372_9 = 0.034

			if var_372_8 <= arg_369_1.time_ and arg_369_1.time_ < var_372_8 + var_372_9 then
				local var_372_10 = (arg_369_1.time_ - var_372_8) / var_372_9

				if arg_369_1.var_.actorSpriteComps1060 then
					for iter_372_1, iter_372_2 in pairs(arg_369_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_372_2 then
							local var_372_11 = Mathf.Lerp(iter_372_2.color.r, 1, var_372_10)

							iter_372_2.color = Color.New(var_372_11, var_372_11, var_372_11)
						end
					end
				end
			end

			if arg_369_1.time_ >= var_372_8 + var_372_9 and arg_369_1.time_ < var_372_8 + var_372_9 + arg_372_0 and arg_369_1.var_.actorSpriteComps1060 then
				local var_372_12 = 1

				for iter_372_3, iter_372_4 in pairs(arg_369_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_372_4 then
						iter_372_4.color = Color.New(var_372_12, var_372_12, var_372_12)
					end
				end

				arg_369_1.var_.actorSpriteComps1060 = nil
			end

			local var_372_13 = arg_369_1.actors_["1012"]
			local var_372_14 = 0

			if var_372_14 < arg_369_1.time_ and arg_369_1.time_ <= var_372_14 + arg_372_0 and arg_369_1.var_.actorSpriteComps1012 == nil then
				arg_369_1.var_.actorSpriteComps1012 = var_372_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_372_15 = 0.034

			if var_372_14 <= arg_369_1.time_ and arg_369_1.time_ < var_372_14 + var_372_15 then
				local var_372_16 = (arg_369_1.time_ - var_372_14) / var_372_15

				if arg_369_1.var_.actorSpriteComps1012 then
					for iter_372_5, iter_372_6 in pairs(arg_369_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_372_6 then
							local var_372_17 = Mathf.Lerp(iter_372_6.color.r, 0.5, var_372_16)

							iter_372_6.color = Color.New(var_372_17, var_372_17, var_372_17)
						end
					end
				end
			end

			if arg_369_1.time_ >= var_372_14 + var_372_15 and arg_369_1.time_ < var_372_14 + var_372_15 + arg_372_0 and arg_369_1.var_.actorSpriteComps1012 then
				local var_372_18 = 0.5

				for iter_372_7, iter_372_8 in pairs(arg_369_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_372_8 then
						iter_372_8.color = Color.New(var_372_18, var_372_18, var_372_18)
					end
				end

				arg_369_1.var_.actorSpriteComps1012 = nil
			end

			local var_372_19 = 0
			local var_372_20 = 0.35

			if var_372_19 < arg_369_1.time_ and arg_369_1.time_ <= var_372_19 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_21 = arg_369_1:FormatText(StoryNameCfg[584].name)

				arg_369_1.leftNameTxt_.text = var_372_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_22 = arg_369_1:GetWordFromCfg(410082091)
				local var_372_23 = arg_369_1:FormatText(var_372_22.content)

				arg_369_1.text_.text = var_372_23

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_24 = 14
				local var_372_25 = utf8.len(var_372_23)
				local var_372_26 = var_372_24 <= 0 and var_372_20 or var_372_20 * (var_372_25 / var_372_24)

				if var_372_26 > 0 and var_372_20 < var_372_26 then
					arg_369_1.talkMaxDuration = var_372_26

					if var_372_26 + var_372_19 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_26 + var_372_19
					end
				end

				arg_369_1.text_.text = var_372_23
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082091", "story_v_out_410082.awb") ~= 0 then
					local var_372_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082091", "story_v_out_410082.awb") / 1000

					if var_372_27 + var_372_19 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_27 + var_372_19
					end

					if var_372_22.prefab_name ~= "" and arg_369_1.actors_[var_372_22.prefab_name] ~= nil then
						local var_372_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_22.prefab_name].transform, "story_v_out_410082", "410082091", "story_v_out_410082.awb")

						arg_369_1:RecordAudio("410082091", var_372_28)
						arg_369_1:RecordAudio("410082091", var_372_28)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_410082", "410082091", "story_v_out_410082.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_410082", "410082091", "story_v_out_410082.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_29 = math.max(var_372_20, arg_369_1.talkMaxDuration)

			if var_372_19 <= arg_369_1.time_ and arg_369_1.time_ < var_372_19 + var_372_29 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_19) / var_372_29

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_19 + var_372_29 and arg_369_1.time_ < var_372_19 + var_372_29 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play410082092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 410082092
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play410082093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1060"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1060 = var_376_0.localPosition
				var_376_0.localScale = Vector3.New(1, 1, 1)

				arg_373_1:CheckSpriteTmpPos("1060", 7)

				local var_376_2 = var_376_0.childCount

				for iter_376_0 = 0, var_376_2 - 1 do
					local var_376_3 = var_376_0:GetChild(iter_376_0)

					if var_376_3.name == "" or not string.find(var_376_3.name, "split") then
						var_376_3.gameObject:SetActive(true)
					else
						var_376_3.gameObject:SetActive(false)
					end
				end
			end

			local var_376_4 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_4 then
				local var_376_5 = (arg_373_1.time_ - var_376_1) / var_376_4
				local var_376_6 = Vector3.New(0, -2000, -40)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1060, var_376_6, var_376_5)
			end

			if arg_373_1.time_ >= var_376_1 + var_376_4 and arg_373_1.time_ < var_376_1 + var_376_4 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_376_7 = arg_373_1.actors_["1012"].transform
			local var_376_8 = 0

			if var_376_8 < arg_373_1.time_ and arg_373_1.time_ <= var_376_8 + arg_376_0 then
				arg_373_1.var_.moveOldPos1012 = var_376_7.localPosition
				var_376_7.localScale = Vector3.New(1, 1, 1)

				arg_373_1:CheckSpriteTmpPos("1012", 7)

				local var_376_9 = var_376_7.childCount

				for iter_376_1 = 0, var_376_9 - 1 do
					local var_376_10 = var_376_7:GetChild(iter_376_1)

					if var_376_10.name == "" or not string.find(var_376_10.name, "split") then
						var_376_10.gameObject:SetActive(true)
					else
						var_376_10.gameObject:SetActive(false)
					end
				end
			end

			local var_376_11 = 0.001

			if var_376_8 <= arg_373_1.time_ and arg_373_1.time_ < var_376_8 + var_376_11 then
				local var_376_12 = (arg_373_1.time_ - var_376_8) / var_376_11
				local var_376_13 = Vector3.New(0, -2000, 300)

				var_376_7.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1012, var_376_13, var_376_12)
			end

			if arg_373_1.time_ >= var_376_8 + var_376_11 and arg_373_1.time_ < var_376_8 + var_376_11 + arg_376_0 then
				var_376_7.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_376_14 = 0
			local var_376_15 = 1.45

			if var_376_14 < arg_373_1.time_ and arg_373_1.time_ <= var_376_14 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, false)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_16 = arg_373_1:GetWordFromCfg(410082092)
				local var_376_17 = arg_373_1:FormatText(var_376_16.content)

				arg_373_1.text_.text = var_376_17

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_18 = 58
				local var_376_19 = utf8.len(var_376_17)
				local var_376_20 = var_376_18 <= 0 and var_376_15 or var_376_15 * (var_376_19 / var_376_18)

				if var_376_20 > 0 and var_376_15 < var_376_20 then
					arg_373_1.talkMaxDuration = var_376_20

					if var_376_20 + var_376_14 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_20 + var_376_14
					end
				end

				arg_373_1.text_.text = var_376_17
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_21 = math.max(var_376_15, arg_373_1.talkMaxDuration)

			if var_376_14 <= arg_373_1.time_ and arg_373_1.time_ < var_376_14 + var_376_21 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_14) / var_376_21

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_14 + var_376_21 and arg_373_1.time_ < var_376_14 + var_376_21 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play410082093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 410082093
		arg_377_1.duration_ = 3.433

		local var_377_0 = {
			zh = 3.133,
			ja = 3.433
		}
		local var_377_1 = manager.audio:GetLocalizationFlag()

		if var_377_0[var_377_1] ~= nil then
			arg_377_1.duration_ = var_377_0[var_377_1]
		end

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play410082094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1056"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos1056 = var_380_0.localPosition
				var_380_0.localScale = Vector3.New(1, 1, 1)

				arg_377_1:CheckSpriteTmpPos("1056", 3)

				local var_380_2 = var_380_0.childCount

				for iter_380_0 = 0, var_380_2 - 1 do
					local var_380_3 = var_380_0:GetChild(iter_380_0)

					if var_380_3.name == "split_1" or not string.find(var_380_3.name, "split") then
						var_380_3.gameObject:SetActive(true)
					else
						var_380_3.gameObject:SetActive(false)
					end
				end
			end

			local var_380_4 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_4 then
				local var_380_5 = (arg_377_1.time_ - var_380_1) / var_380_4
				local var_380_6 = Vector3.New(0, -350, -180)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1056, var_380_6, var_380_5)
			end

			if arg_377_1.time_ >= var_380_1 + var_380_4 and arg_377_1.time_ < var_380_1 + var_380_4 + arg_380_0 then
				var_380_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_380_7 = arg_377_1.actors_["1056"]
			local var_380_8 = 0

			if var_380_8 < arg_377_1.time_ and arg_377_1.time_ <= var_380_8 + arg_380_0 and arg_377_1.var_.actorSpriteComps1056 == nil then
				arg_377_1.var_.actorSpriteComps1056 = var_380_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_9 = 0.034

			if var_380_8 <= arg_377_1.time_ and arg_377_1.time_ < var_380_8 + var_380_9 then
				local var_380_10 = (arg_377_1.time_ - var_380_8) / var_380_9

				if arg_377_1.var_.actorSpriteComps1056 then
					for iter_380_1, iter_380_2 in pairs(arg_377_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_380_2 then
							local var_380_11 = Mathf.Lerp(iter_380_2.color.r, 1, var_380_10)

							iter_380_2.color = Color.New(var_380_11, var_380_11, var_380_11)
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_8 + var_380_9 and arg_377_1.time_ < var_380_8 + var_380_9 + arg_380_0 and arg_377_1.var_.actorSpriteComps1056 then
				local var_380_12 = 1

				for iter_380_3, iter_380_4 in pairs(arg_377_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_380_4 then
						iter_380_4.color = Color.New(var_380_12, var_380_12, var_380_12)
					end
				end

				arg_377_1.var_.actorSpriteComps1056 = nil
			end

			local var_380_13 = arg_377_1.actors_["1060"].transform
			local var_380_14 = 0

			if var_380_14 < arg_377_1.time_ and arg_377_1.time_ <= var_380_14 + arg_380_0 then
				arg_377_1.var_.moveOldPos1060 = var_380_13.localPosition
				var_380_13.localScale = Vector3.New(1, 1, 1)

				arg_377_1:CheckSpriteTmpPos("1060", 2)

				local var_380_15 = var_380_13.childCount

				for iter_380_5 = 0, var_380_15 - 1 do
					local var_380_16 = var_380_13:GetChild(iter_380_5)

					if var_380_16.name == "split_3" or not string.find(var_380_16.name, "split") then
						var_380_16.gameObject:SetActive(true)
					else
						var_380_16.gameObject:SetActive(false)
					end
				end
			end

			local var_380_17 = 0.001

			if var_380_14 <= arg_377_1.time_ and arg_377_1.time_ < var_380_14 + var_380_17 then
				local var_380_18 = (arg_377_1.time_ - var_380_14) / var_380_17
				local var_380_19 = Vector3.New(-390, -435, -40)

				var_380_13.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1060, var_380_19, var_380_18)
			end

			if arg_377_1.time_ >= var_380_14 + var_380_17 and arg_377_1.time_ < var_380_14 + var_380_17 + arg_380_0 then
				var_380_13.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_380_20 = arg_377_1.actors_["1012"].transform
			local var_380_21 = 0

			if var_380_21 < arg_377_1.time_ and arg_377_1.time_ <= var_380_21 + arg_380_0 then
				arg_377_1.var_.moveOldPos1012 = var_380_20.localPosition
				var_380_20.localScale = Vector3.New(1, 1, 1)

				arg_377_1:CheckSpriteTmpPos("1012", 4)

				local var_380_22 = var_380_20.childCount

				for iter_380_6 = 0, var_380_22 - 1 do
					local var_380_23 = var_380_20:GetChild(iter_380_6)

					if var_380_23.name == "split_3" or not string.find(var_380_23.name, "split") then
						var_380_23.gameObject:SetActive(true)
					else
						var_380_23.gameObject:SetActive(false)
					end
				end
			end

			local var_380_24 = 0.001

			if var_380_21 <= arg_377_1.time_ and arg_377_1.time_ < var_380_21 + var_380_24 then
				local var_380_25 = (arg_377_1.time_ - var_380_21) / var_380_24
				local var_380_26 = Vector3.New(390, -465, 300)

				var_380_20.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1012, var_380_26, var_380_25)
			end

			if arg_377_1.time_ >= var_380_21 + var_380_24 and arg_377_1.time_ < var_380_21 + var_380_24 + arg_380_0 then
				var_380_20.localPosition = Vector3.New(390, -465, 300)
			end

			local var_380_27 = arg_377_1.actors_["1060"]
			local var_380_28 = 0

			if var_380_28 < arg_377_1.time_ and arg_377_1.time_ <= var_380_28 + arg_380_0 and arg_377_1.var_.actorSpriteComps1060 == nil then
				arg_377_1.var_.actorSpriteComps1060 = var_380_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_29 = 0.034

			if var_380_28 <= arg_377_1.time_ and arg_377_1.time_ < var_380_28 + var_380_29 then
				local var_380_30 = (arg_377_1.time_ - var_380_28) / var_380_29

				if arg_377_1.var_.actorSpriteComps1060 then
					for iter_380_7, iter_380_8 in pairs(arg_377_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_380_8 then
							local var_380_31 = Mathf.Lerp(iter_380_8.color.r, 0.5, var_380_30)

							iter_380_8.color = Color.New(var_380_31, var_380_31, var_380_31)
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_28 + var_380_29 and arg_377_1.time_ < var_380_28 + var_380_29 + arg_380_0 and arg_377_1.var_.actorSpriteComps1060 then
				local var_380_32 = 0.5

				for iter_380_9, iter_380_10 in pairs(arg_377_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_380_10 then
						iter_380_10.color = Color.New(var_380_32, var_380_32, var_380_32)
					end
				end

				arg_377_1.var_.actorSpriteComps1060 = nil
			end

			local var_380_33 = arg_377_1.actors_["1012"]
			local var_380_34 = 0

			if var_380_34 < arg_377_1.time_ and arg_377_1.time_ <= var_380_34 + arg_380_0 and arg_377_1.var_.actorSpriteComps1012 == nil then
				arg_377_1.var_.actorSpriteComps1012 = var_380_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_35 = 0.034

			if var_380_34 <= arg_377_1.time_ and arg_377_1.time_ < var_380_34 + var_380_35 then
				local var_380_36 = (arg_377_1.time_ - var_380_34) / var_380_35

				if arg_377_1.var_.actorSpriteComps1012 then
					for iter_380_11, iter_380_12 in pairs(arg_377_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_380_12 then
							local var_380_37 = Mathf.Lerp(iter_380_12.color.r, 0.5, var_380_36)

							iter_380_12.color = Color.New(var_380_37, var_380_37, var_380_37)
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_34 + var_380_35 and arg_377_1.time_ < var_380_34 + var_380_35 + arg_380_0 and arg_377_1.var_.actorSpriteComps1012 then
				local var_380_38 = 0.5

				for iter_380_13, iter_380_14 in pairs(arg_377_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_380_14 then
						iter_380_14.color = Color.New(var_380_38, var_380_38, var_380_38)
					end
				end

				arg_377_1.var_.actorSpriteComps1012 = nil
			end

			local var_380_39 = 0
			local var_380_40 = 0.125

			if var_380_39 < arg_377_1.time_ and arg_377_1.time_ <= var_380_39 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_41 = arg_377_1:FormatText(StoryNameCfg[605].name)

				arg_377_1.leftNameTxt_.text = var_380_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_42 = arg_377_1:GetWordFromCfg(410082093)
				local var_380_43 = arg_377_1:FormatText(var_380_42.content)

				arg_377_1.text_.text = var_380_43

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_44 = 5
				local var_380_45 = utf8.len(var_380_43)
				local var_380_46 = var_380_44 <= 0 and var_380_40 or var_380_40 * (var_380_45 / var_380_44)

				if var_380_46 > 0 and var_380_40 < var_380_46 then
					arg_377_1.talkMaxDuration = var_380_46

					if var_380_46 + var_380_39 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_46 + var_380_39
					end
				end

				arg_377_1.text_.text = var_380_43
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082093", "story_v_out_410082.awb") ~= 0 then
					local var_380_47 = manager.audio:GetVoiceLength("story_v_out_410082", "410082093", "story_v_out_410082.awb") / 1000

					if var_380_47 + var_380_39 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_47 + var_380_39
					end

					if var_380_42.prefab_name ~= "" and arg_377_1.actors_[var_380_42.prefab_name] ~= nil then
						local var_380_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_42.prefab_name].transform, "story_v_out_410082", "410082093", "story_v_out_410082.awb")

						arg_377_1:RecordAudio("410082093", var_380_48)
						arg_377_1:RecordAudio("410082093", var_380_48)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_410082", "410082093", "story_v_out_410082.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_410082", "410082093", "story_v_out_410082.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_49 = math.max(var_380_40, arg_377_1.talkMaxDuration)

			if var_380_39 <= arg_377_1.time_ and arg_377_1.time_ < var_380_39 + var_380_49 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_39) / var_380_49

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_39 + var_380_49 and arg_377_1.time_ < var_380_39 + var_380_49 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play410082094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 410082094
		arg_381_1.duration_ = 2.766

		local var_381_0 = {
			zh = 1.033,
			ja = 2.766
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
				arg_381_0:Play410082095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1060"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos1060 = var_384_0.localPosition
				var_384_0.localScale = Vector3.New(1, 1, 1)

				arg_381_1:CheckSpriteTmpPos("1060", 2)

				local var_384_2 = var_384_0.childCount

				for iter_384_0 = 0, var_384_2 - 1 do
					local var_384_3 = var_384_0:GetChild(iter_384_0)

					if var_384_3.name == "" or not string.find(var_384_3.name, "split") then
						var_384_3.gameObject:SetActive(true)
					else
						var_384_3.gameObject:SetActive(false)
					end
				end
			end

			local var_384_4 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_4 then
				local var_384_5 = (arg_381_1.time_ - var_384_1) / var_384_4
				local var_384_6 = Vector3.New(-390, -435, -40)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1060, var_384_6, var_384_5)
			end

			if arg_381_1.time_ >= var_384_1 + var_384_4 and arg_381_1.time_ < var_384_1 + var_384_4 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_384_7 = arg_381_1.actors_["1012"].transform
			local var_384_8 = 0

			if var_384_8 < arg_381_1.time_ and arg_381_1.time_ <= var_384_8 + arg_384_0 then
				arg_381_1.var_.moveOldPos1012 = var_384_7.localPosition
				var_384_7.localScale = Vector3.New(1, 1, 1)

				arg_381_1:CheckSpriteTmpPos("1012", 4)

				local var_384_9 = var_384_7.childCount

				for iter_384_1 = 0, var_384_9 - 1 do
					local var_384_10 = var_384_7:GetChild(iter_384_1)

					if var_384_10.name == "" or not string.find(var_384_10.name, "split") then
						var_384_10.gameObject:SetActive(true)
					else
						var_384_10.gameObject:SetActive(false)
					end
				end
			end

			local var_384_11 = 0.001

			if var_384_8 <= arg_381_1.time_ and arg_381_1.time_ < var_384_8 + var_384_11 then
				local var_384_12 = (arg_381_1.time_ - var_384_8) / var_384_11
				local var_384_13 = Vector3.New(390, -465, 300)

				var_384_7.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1012, var_384_13, var_384_12)
			end

			if arg_381_1.time_ >= var_384_8 + var_384_11 and arg_381_1.time_ < var_384_8 + var_384_11 + arg_384_0 then
				var_384_7.localPosition = Vector3.New(390, -465, 300)
			end

			local var_384_14 = arg_381_1.actors_["1060"]
			local var_384_15 = 0

			if var_384_15 < arg_381_1.time_ and arg_381_1.time_ <= var_384_15 + arg_384_0 and arg_381_1.var_.actorSpriteComps1060 == nil then
				arg_381_1.var_.actorSpriteComps1060 = var_384_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_16 = 0.034

			if var_384_15 <= arg_381_1.time_ and arg_381_1.time_ < var_384_15 + var_384_16 then
				local var_384_17 = (arg_381_1.time_ - var_384_15) / var_384_16

				if arg_381_1.var_.actorSpriteComps1060 then
					for iter_384_2, iter_384_3 in pairs(arg_381_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_384_3 then
							local var_384_18 = Mathf.Lerp(iter_384_3.color.r, 1, var_384_17)

							iter_384_3.color = Color.New(var_384_18, var_384_18, var_384_18)
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_15 + var_384_16 and arg_381_1.time_ < var_384_15 + var_384_16 + arg_384_0 and arg_381_1.var_.actorSpriteComps1060 then
				local var_384_19 = 1

				for iter_384_4, iter_384_5 in pairs(arg_381_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_384_5 then
						iter_384_5.color = Color.New(var_384_19, var_384_19, var_384_19)
					end
				end

				arg_381_1.var_.actorSpriteComps1060 = nil
			end

			local var_384_20 = arg_381_1.actors_["1012"]
			local var_384_21 = 0

			if var_384_21 < arg_381_1.time_ and arg_381_1.time_ <= var_384_21 + arg_384_0 and arg_381_1.var_.actorSpriteComps1012 == nil then
				arg_381_1.var_.actorSpriteComps1012 = var_384_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_22 = 0.034

			if var_384_21 <= arg_381_1.time_ and arg_381_1.time_ < var_384_21 + var_384_22 then
				local var_384_23 = (arg_381_1.time_ - var_384_21) / var_384_22

				if arg_381_1.var_.actorSpriteComps1012 then
					for iter_384_6, iter_384_7 in pairs(arg_381_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_384_7 then
							local var_384_24 = Mathf.Lerp(iter_384_7.color.r, 1, var_384_23)

							iter_384_7.color = Color.New(var_384_24, var_384_24, var_384_24)
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_21 + var_384_22 and arg_381_1.time_ < var_384_21 + var_384_22 + arg_384_0 and arg_381_1.var_.actorSpriteComps1012 then
				local var_384_25 = 1

				for iter_384_8, iter_384_9 in pairs(arg_381_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_384_9 then
						iter_384_9.color = Color.New(var_384_25, var_384_25, var_384_25)
					end
				end

				arg_381_1.var_.actorSpriteComps1012 = nil
			end

			local var_384_26 = arg_381_1.actors_["1056"]
			local var_384_27 = 0

			if var_384_27 < arg_381_1.time_ and arg_381_1.time_ <= var_384_27 + arg_384_0 and arg_381_1.var_.actorSpriteComps1056 == nil then
				arg_381_1.var_.actorSpriteComps1056 = var_384_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_28 = 0.034

			if var_384_27 <= arg_381_1.time_ and arg_381_1.time_ < var_384_27 + var_384_28 then
				local var_384_29 = (arg_381_1.time_ - var_384_27) / var_384_28

				if arg_381_1.var_.actorSpriteComps1056 then
					for iter_384_10, iter_384_11 in pairs(arg_381_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_384_11 then
							local var_384_30 = Mathf.Lerp(iter_384_11.color.r, 0.5, var_384_29)

							iter_384_11.color = Color.New(var_384_30, var_384_30, var_384_30)
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_27 + var_384_28 and arg_381_1.time_ < var_384_27 + var_384_28 + arg_384_0 and arg_381_1.var_.actorSpriteComps1056 then
				local var_384_31 = 0.5

				for iter_384_12, iter_384_13 in pairs(arg_381_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_384_13 then
						iter_384_13.color = Color.New(var_384_31, var_384_31, var_384_31)
					end
				end

				arg_381_1.var_.actorSpriteComps1056 = nil
			end

			local var_384_32 = 0
			local var_384_33 = 0.075

			if var_384_32 < arg_381_1.time_ and arg_381_1.time_ <= var_384_32 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_34 = arg_381_1:FormatText(StoryNameCfg[601].name)

				arg_381_1.leftNameTxt_.text = var_384_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_35 = arg_381_1:GetWordFromCfg(410082094)
				local var_384_36 = arg_381_1:FormatText(var_384_35.content)

				arg_381_1.text_.text = var_384_36

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_37 = 3
				local var_384_38 = utf8.len(var_384_36)
				local var_384_39 = var_384_37 <= 0 and var_384_33 or var_384_33 * (var_384_38 / var_384_37)

				if var_384_39 > 0 and var_384_33 < var_384_39 then
					arg_381_1.talkMaxDuration = var_384_39

					if var_384_39 + var_384_32 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_39 + var_384_32
					end
				end

				arg_381_1.text_.text = var_384_36
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082094", "story_v_out_410082.awb") ~= 0 then
					local var_384_40 = manager.audio:GetVoiceLength("story_v_out_410082", "410082094", "story_v_out_410082.awb") / 1000

					if var_384_40 + var_384_32 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_40 + var_384_32
					end

					if var_384_35.prefab_name ~= "" and arg_381_1.actors_[var_384_35.prefab_name] ~= nil then
						local var_384_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_35.prefab_name].transform, "story_v_out_410082", "410082094", "story_v_out_410082.awb")

						arg_381_1:RecordAudio("410082094", var_384_41)
						arg_381_1:RecordAudio("410082094", var_384_41)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_410082", "410082094", "story_v_out_410082.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_410082", "410082094", "story_v_out_410082.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_42 = math.max(var_384_33, arg_381_1.talkMaxDuration)

			if var_384_32 <= arg_381_1.time_ and arg_381_1.time_ < var_384_32 + var_384_42 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_32) / var_384_42

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_32 + var_384_42 and arg_381_1.time_ < var_384_32 + var_384_42 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play410082095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 410082095
		arg_385_1.duration_ = 13.533

		local var_385_0 = {
			zh = 9.366,
			ja = 13.533
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
				arg_385_0:Play410082096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1056"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos1056 = var_388_0.localPosition
				var_388_0.localScale = Vector3.New(1, 1, 1)

				arg_385_1:CheckSpriteTmpPos("1056", 3)

				local var_388_2 = var_388_0.childCount

				for iter_388_0 = 0, var_388_2 - 1 do
					local var_388_3 = var_388_0:GetChild(iter_388_0)

					if var_388_3.name == "split_1" or not string.find(var_388_3.name, "split") then
						var_388_3.gameObject:SetActive(true)
					else
						var_388_3.gameObject:SetActive(false)
					end
				end
			end

			local var_388_4 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_4 then
				local var_388_5 = (arg_385_1.time_ - var_388_1) / var_388_4
				local var_388_6 = Vector3.New(0, -350, -180)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1056, var_388_6, var_388_5)
			end

			if arg_385_1.time_ >= var_388_1 + var_388_4 and arg_385_1.time_ < var_388_1 + var_388_4 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_388_7 = arg_385_1.actors_["1056"]
			local var_388_8 = 0

			if var_388_8 < arg_385_1.time_ and arg_385_1.time_ <= var_388_8 + arg_388_0 and arg_385_1.var_.actorSpriteComps1056 == nil then
				arg_385_1.var_.actorSpriteComps1056 = var_388_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_9 = 0.034

			if var_388_8 <= arg_385_1.time_ and arg_385_1.time_ < var_388_8 + var_388_9 then
				local var_388_10 = (arg_385_1.time_ - var_388_8) / var_388_9

				if arg_385_1.var_.actorSpriteComps1056 then
					for iter_388_1, iter_388_2 in pairs(arg_385_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_388_2 then
							local var_388_11 = Mathf.Lerp(iter_388_2.color.r, 1, var_388_10)

							iter_388_2.color = Color.New(var_388_11, var_388_11, var_388_11)
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_8 + var_388_9 and arg_385_1.time_ < var_388_8 + var_388_9 + arg_388_0 and arg_385_1.var_.actorSpriteComps1056 then
				local var_388_12 = 1

				for iter_388_3, iter_388_4 in pairs(arg_385_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_388_4 then
						iter_388_4.color = Color.New(var_388_12, var_388_12, var_388_12)
					end
				end

				arg_385_1.var_.actorSpriteComps1056 = nil
			end

			local var_388_13 = arg_385_1.actors_["1012"]
			local var_388_14 = 0

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 and arg_385_1.var_.actorSpriteComps1012 == nil then
				arg_385_1.var_.actorSpriteComps1012 = var_388_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_15 = 0.034

			if var_388_14 <= arg_385_1.time_ and arg_385_1.time_ < var_388_14 + var_388_15 then
				local var_388_16 = (arg_385_1.time_ - var_388_14) / var_388_15

				if arg_385_1.var_.actorSpriteComps1012 then
					for iter_388_5, iter_388_6 in pairs(arg_385_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_388_6 then
							local var_388_17 = Mathf.Lerp(iter_388_6.color.r, 0.5, var_388_16)

							iter_388_6.color = Color.New(var_388_17, var_388_17, var_388_17)
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_14 + var_388_15 and arg_385_1.time_ < var_388_14 + var_388_15 + arg_388_0 and arg_385_1.var_.actorSpriteComps1012 then
				local var_388_18 = 0.5

				for iter_388_7, iter_388_8 in pairs(arg_385_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_388_8 then
						iter_388_8.color = Color.New(var_388_18, var_388_18, var_388_18)
					end
				end

				arg_385_1.var_.actorSpriteComps1012 = nil
			end

			local var_388_19 = arg_385_1.actors_["1060"]
			local var_388_20 = 0

			if var_388_20 < arg_385_1.time_ and arg_385_1.time_ <= var_388_20 + arg_388_0 and arg_385_1.var_.actorSpriteComps1060 == nil then
				arg_385_1.var_.actorSpriteComps1060 = var_388_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_21 = 0.034

			if var_388_20 <= arg_385_1.time_ and arg_385_1.time_ < var_388_20 + var_388_21 then
				local var_388_22 = (arg_385_1.time_ - var_388_20) / var_388_21

				if arg_385_1.var_.actorSpriteComps1060 then
					for iter_388_9, iter_388_10 in pairs(arg_385_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_388_10 then
							local var_388_23 = Mathf.Lerp(iter_388_10.color.r, 0.5, var_388_22)

							iter_388_10.color = Color.New(var_388_23, var_388_23, var_388_23)
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_20 + var_388_21 and arg_385_1.time_ < var_388_20 + var_388_21 + arg_388_0 and arg_385_1.var_.actorSpriteComps1060 then
				local var_388_24 = 0.5

				for iter_388_11, iter_388_12 in pairs(arg_385_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_388_12 then
						iter_388_12.color = Color.New(var_388_24, var_388_24, var_388_24)
					end
				end

				arg_385_1.var_.actorSpriteComps1060 = nil
			end

			local var_388_25 = 0
			local var_388_26 = 1

			if var_388_25 < arg_385_1.time_ and arg_385_1.time_ <= var_388_25 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_27 = arg_385_1:FormatText(StoryNameCfg[605].name)

				arg_385_1.leftNameTxt_.text = var_388_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_28 = arg_385_1:GetWordFromCfg(410082095)
				local var_388_29 = arg_385_1:FormatText(var_388_28.content)

				arg_385_1.text_.text = var_388_29

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_30 = 40
				local var_388_31 = utf8.len(var_388_29)
				local var_388_32 = var_388_30 <= 0 and var_388_26 or var_388_26 * (var_388_31 / var_388_30)

				if var_388_32 > 0 and var_388_26 < var_388_32 then
					arg_385_1.talkMaxDuration = var_388_32

					if var_388_32 + var_388_25 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_32 + var_388_25
					end
				end

				arg_385_1.text_.text = var_388_29
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082095", "story_v_out_410082.awb") ~= 0 then
					local var_388_33 = manager.audio:GetVoiceLength("story_v_out_410082", "410082095", "story_v_out_410082.awb") / 1000

					if var_388_33 + var_388_25 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_33 + var_388_25
					end

					if var_388_28.prefab_name ~= "" and arg_385_1.actors_[var_388_28.prefab_name] ~= nil then
						local var_388_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_28.prefab_name].transform, "story_v_out_410082", "410082095", "story_v_out_410082.awb")

						arg_385_1:RecordAudio("410082095", var_388_34)
						arg_385_1:RecordAudio("410082095", var_388_34)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_410082", "410082095", "story_v_out_410082.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_410082", "410082095", "story_v_out_410082.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_35 = math.max(var_388_26, arg_385_1.talkMaxDuration)

			if var_388_25 <= arg_385_1.time_ and arg_385_1.time_ < var_388_25 + var_388_35 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_25) / var_388_35

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_25 + var_388_35 and arg_385_1.time_ < var_388_25 + var_388_35 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play410082096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 410082096
		arg_389_1.duration_ = 8.433

		local var_389_0 = {
			zh = 7.566,
			ja = 8.433
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
				arg_389_0:Play410082097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1012"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1012 = var_392_0.localPosition
				var_392_0.localScale = Vector3.New(1, 1, 1)

				arg_389_1:CheckSpriteTmpPos("1012", 4)

				local var_392_2 = var_392_0.childCount

				for iter_392_0 = 0, var_392_2 - 1 do
					local var_392_3 = var_392_0:GetChild(iter_392_0)

					if var_392_3.name == "" or not string.find(var_392_3.name, "split") then
						var_392_3.gameObject:SetActive(true)
					else
						var_392_3.gameObject:SetActive(false)
					end
				end
			end

			local var_392_4 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_4 then
				local var_392_5 = (arg_389_1.time_ - var_392_1) / var_392_4
				local var_392_6 = Vector3.New(390, -465, 300)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1012, var_392_6, var_392_5)
			end

			if arg_389_1.time_ >= var_392_1 + var_392_4 and arg_389_1.time_ < var_392_1 + var_392_4 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_392_7 = arg_389_1.actors_["1012"]
			local var_392_8 = 0

			if var_392_8 < arg_389_1.time_ and arg_389_1.time_ <= var_392_8 + arg_392_0 and arg_389_1.var_.actorSpriteComps1012 == nil then
				arg_389_1.var_.actorSpriteComps1012 = var_392_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_392_9 = 0.034

			if var_392_8 <= arg_389_1.time_ and arg_389_1.time_ < var_392_8 + var_392_9 then
				local var_392_10 = (arg_389_1.time_ - var_392_8) / var_392_9

				if arg_389_1.var_.actorSpriteComps1012 then
					for iter_392_1, iter_392_2 in pairs(arg_389_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_392_2 then
							local var_392_11 = Mathf.Lerp(iter_392_2.color.r, 1, var_392_10)

							iter_392_2.color = Color.New(var_392_11, var_392_11, var_392_11)
						end
					end
				end
			end

			if arg_389_1.time_ >= var_392_8 + var_392_9 and arg_389_1.time_ < var_392_8 + var_392_9 + arg_392_0 and arg_389_1.var_.actorSpriteComps1012 then
				local var_392_12 = 1

				for iter_392_3, iter_392_4 in pairs(arg_389_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_392_4 then
						iter_392_4.color = Color.New(var_392_12, var_392_12, var_392_12)
					end
				end

				arg_389_1.var_.actorSpriteComps1012 = nil
			end

			local var_392_13 = arg_389_1.actors_["1056"]
			local var_392_14 = 0

			if var_392_14 < arg_389_1.time_ and arg_389_1.time_ <= var_392_14 + arg_392_0 and arg_389_1.var_.actorSpriteComps1056 == nil then
				arg_389_1.var_.actorSpriteComps1056 = var_392_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_392_15 = 0.034

			if var_392_14 <= arg_389_1.time_ and arg_389_1.time_ < var_392_14 + var_392_15 then
				local var_392_16 = (arg_389_1.time_ - var_392_14) / var_392_15

				if arg_389_1.var_.actorSpriteComps1056 then
					for iter_392_5, iter_392_6 in pairs(arg_389_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_392_6 then
							local var_392_17 = Mathf.Lerp(iter_392_6.color.r, 0.5, var_392_16)

							iter_392_6.color = Color.New(var_392_17, var_392_17, var_392_17)
						end
					end
				end
			end

			if arg_389_1.time_ >= var_392_14 + var_392_15 and arg_389_1.time_ < var_392_14 + var_392_15 + arg_392_0 and arg_389_1.var_.actorSpriteComps1056 then
				local var_392_18 = 0.5

				for iter_392_7, iter_392_8 in pairs(arg_389_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_392_8 then
						iter_392_8.color = Color.New(var_392_18, var_392_18, var_392_18)
					end
				end

				arg_389_1.var_.actorSpriteComps1056 = nil
			end

			local var_392_19 = 0
			local var_392_20 = 0.8

			if var_392_19 < arg_389_1.time_ and arg_389_1.time_ <= var_392_19 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_21 = arg_389_1:FormatText(StoryNameCfg[595].name)

				arg_389_1.leftNameTxt_.text = var_392_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_22 = arg_389_1:GetWordFromCfg(410082096)
				local var_392_23 = arg_389_1:FormatText(var_392_22.content)

				arg_389_1.text_.text = var_392_23

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_24 = 32
				local var_392_25 = utf8.len(var_392_23)
				local var_392_26 = var_392_24 <= 0 and var_392_20 or var_392_20 * (var_392_25 / var_392_24)

				if var_392_26 > 0 and var_392_20 < var_392_26 then
					arg_389_1.talkMaxDuration = var_392_26

					if var_392_26 + var_392_19 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_26 + var_392_19
					end
				end

				arg_389_1.text_.text = var_392_23
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082096", "story_v_out_410082.awb") ~= 0 then
					local var_392_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082096", "story_v_out_410082.awb") / 1000

					if var_392_27 + var_392_19 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_27 + var_392_19
					end

					if var_392_22.prefab_name ~= "" and arg_389_1.actors_[var_392_22.prefab_name] ~= nil then
						local var_392_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_22.prefab_name].transform, "story_v_out_410082", "410082096", "story_v_out_410082.awb")

						arg_389_1:RecordAudio("410082096", var_392_28)
						arg_389_1:RecordAudio("410082096", var_392_28)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_410082", "410082096", "story_v_out_410082.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_410082", "410082096", "story_v_out_410082.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_29 = math.max(var_392_20, arg_389_1.talkMaxDuration)

			if var_392_19 <= arg_389_1.time_ and arg_389_1.time_ < var_392_19 + var_392_29 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_19) / var_392_29

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_19 + var_392_29 and arg_389_1.time_ < var_392_19 + var_392_29 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play410082097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 410082097
		arg_393_1.duration_ = 20.266

		local var_393_0 = {
			zh = 9.7,
			ja = 20.266
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
				arg_393_0:Play410082098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 1.125

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_2 = arg_393_1:FormatText(StoryNameCfg[595].name)

				arg_393_1.leftNameTxt_.text = var_396_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_3 = arg_393_1:GetWordFromCfg(410082097)
				local var_396_4 = arg_393_1:FormatText(var_396_3.content)

				arg_393_1.text_.text = var_396_4

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082097", "story_v_out_410082.awb") ~= 0 then
					local var_396_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082097", "story_v_out_410082.awb") / 1000

					if var_396_8 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_8 + var_396_0
					end

					if var_396_3.prefab_name ~= "" and arg_393_1.actors_[var_396_3.prefab_name] ~= nil then
						local var_396_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_3.prefab_name].transform, "story_v_out_410082", "410082097", "story_v_out_410082.awb")

						arg_393_1:RecordAudio("410082097", var_396_9)
						arg_393_1:RecordAudio("410082097", var_396_9)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_410082", "410082097", "story_v_out_410082.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_410082", "410082097", "story_v_out_410082.awb")
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
	Play410082098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 410082098
		arg_397_1.duration_ = 9.6

		local var_397_0 = {
			zh = 4.1,
			ja = 9.6
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
				arg_397_0:Play410082099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 0.5

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_2 = arg_397_1:FormatText(StoryNameCfg[595].name)

				arg_397_1.leftNameTxt_.text = var_400_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_3 = arg_397_1:GetWordFromCfg(410082098)
				local var_400_4 = arg_397_1:FormatText(var_400_3.content)

				arg_397_1.text_.text = var_400_4

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_5 = 20
				local var_400_6 = utf8.len(var_400_4)
				local var_400_7 = var_400_5 <= 0 and var_400_1 or var_400_1 * (var_400_6 / var_400_5)

				if var_400_7 > 0 and var_400_1 < var_400_7 then
					arg_397_1.talkMaxDuration = var_400_7

					if var_400_7 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_7 + var_400_0
					end
				end

				arg_397_1.text_.text = var_400_4
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082098", "story_v_out_410082.awb") ~= 0 then
					local var_400_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082098", "story_v_out_410082.awb") / 1000

					if var_400_8 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_8 + var_400_0
					end

					if var_400_3.prefab_name ~= "" and arg_397_1.actors_[var_400_3.prefab_name] ~= nil then
						local var_400_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_3.prefab_name].transform, "story_v_out_410082", "410082098", "story_v_out_410082.awb")

						arg_397_1:RecordAudio("410082098", var_400_9)
						arg_397_1:RecordAudio("410082098", var_400_9)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_410082", "410082098", "story_v_out_410082.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_410082", "410082098", "story_v_out_410082.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_10 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_10 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_10

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_10 and arg_397_1.time_ < var_400_0 + var_400_10 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play410082099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 410082099
		arg_401_1.duration_ = 3.233

		local var_401_0 = {
			zh = 3.233,
			ja = 3.2
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
				arg_401_0:Play410082100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1060"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1060 = var_404_0.localPosition
				var_404_0.localScale = Vector3.New(1, 1, 1)

				arg_401_1:CheckSpriteTmpPos("1060", 2)

				local var_404_2 = var_404_0.childCount

				for iter_404_0 = 0, var_404_2 - 1 do
					local var_404_3 = var_404_0:GetChild(iter_404_0)

					if var_404_3.name == "" or not string.find(var_404_3.name, "split") then
						var_404_3.gameObject:SetActive(true)
					else
						var_404_3.gameObject:SetActive(false)
					end
				end
			end

			local var_404_4 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_4 then
				local var_404_5 = (arg_401_1.time_ - var_404_1) / var_404_4
				local var_404_6 = Vector3.New(-390, -435, -40)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1060, var_404_6, var_404_5)
			end

			if arg_401_1.time_ >= var_404_1 + var_404_4 and arg_401_1.time_ < var_404_1 + var_404_4 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_404_7 = arg_401_1.actors_["1060"]
			local var_404_8 = 0

			if var_404_8 < arg_401_1.time_ and arg_401_1.time_ <= var_404_8 + arg_404_0 and arg_401_1.var_.actorSpriteComps1060 == nil then
				arg_401_1.var_.actorSpriteComps1060 = var_404_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_9 = 0.034

			if var_404_8 <= arg_401_1.time_ and arg_401_1.time_ < var_404_8 + var_404_9 then
				local var_404_10 = (arg_401_1.time_ - var_404_8) / var_404_9

				if arg_401_1.var_.actorSpriteComps1060 then
					for iter_404_1, iter_404_2 in pairs(arg_401_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_404_2 then
							local var_404_11 = Mathf.Lerp(iter_404_2.color.r, 1, var_404_10)

							iter_404_2.color = Color.New(var_404_11, var_404_11, var_404_11)
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_8 + var_404_9 and arg_401_1.time_ < var_404_8 + var_404_9 + arg_404_0 and arg_401_1.var_.actorSpriteComps1060 then
				local var_404_12 = 1

				for iter_404_3, iter_404_4 in pairs(arg_401_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_404_4 then
						iter_404_4.color = Color.New(var_404_12, var_404_12, var_404_12)
					end
				end

				arg_401_1.var_.actorSpriteComps1060 = nil
			end

			local var_404_13 = arg_401_1.actors_["1012"]
			local var_404_14 = 0

			if var_404_14 < arg_401_1.time_ and arg_401_1.time_ <= var_404_14 + arg_404_0 and arg_401_1.var_.actorSpriteComps1012 == nil then
				arg_401_1.var_.actorSpriteComps1012 = var_404_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_15 = 0.034

			if var_404_14 <= arg_401_1.time_ and arg_401_1.time_ < var_404_14 + var_404_15 then
				local var_404_16 = (arg_401_1.time_ - var_404_14) / var_404_15

				if arg_401_1.var_.actorSpriteComps1012 then
					for iter_404_5, iter_404_6 in pairs(arg_401_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_404_6 then
							local var_404_17 = Mathf.Lerp(iter_404_6.color.r, 0.5, var_404_16)

							iter_404_6.color = Color.New(var_404_17, var_404_17, var_404_17)
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_14 + var_404_15 and arg_401_1.time_ < var_404_14 + var_404_15 + arg_404_0 and arg_401_1.var_.actorSpriteComps1012 then
				local var_404_18 = 0.5

				for iter_404_7, iter_404_8 in pairs(arg_401_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_404_8 then
						iter_404_8.color = Color.New(var_404_18, var_404_18, var_404_18)
					end
				end

				arg_401_1.var_.actorSpriteComps1012 = nil
			end

			local var_404_19 = 0
			local var_404_20 = 0.375

			if var_404_19 < arg_401_1.time_ and arg_401_1.time_ <= var_404_19 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_21 = arg_401_1:FormatText(StoryNameCfg[584].name)

				arg_401_1.leftNameTxt_.text = var_404_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_22 = arg_401_1:GetWordFromCfg(410082099)
				local var_404_23 = arg_401_1:FormatText(var_404_22.content)

				arg_401_1.text_.text = var_404_23

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_24 = 15
				local var_404_25 = utf8.len(var_404_23)
				local var_404_26 = var_404_24 <= 0 and var_404_20 or var_404_20 * (var_404_25 / var_404_24)

				if var_404_26 > 0 and var_404_20 < var_404_26 then
					arg_401_1.talkMaxDuration = var_404_26

					if var_404_26 + var_404_19 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_26 + var_404_19
					end
				end

				arg_401_1.text_.text = var_404_23
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082099", "story_v_out_410082.awb") ~= 0 then
					local var_404_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082099", "story_v_out_410082.awb") / 1000

					if var_404_27 + var_404_19 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_27 + var_404_19
					end

					if var_404_22.prefab_name ~= "" and arg_401_1.actors_[var_404_22.prefab_name] ~= nil then
						local var_404_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_22.prefab_name].transform, "story_v_out_410082", "410082099", "story_v_out_410082.awb")

						arg_401_1:RecordAudio("410082099", var_404_28)
						arg_401_1:RecordAudio("410082099", var_404_28)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_410082", "410082099", "story_v_out_410082.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_410082", "410082099", "story_v_out_410082.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_29 = math.max(var_404_20, arg_401_1.talkMaxDuration)

			if var_404_19 <= arg_401_1.time_ and arg_401_1.time_ < var_404_19 + var_404_29 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_19) / var_404_29

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_19 + var_404_29 and arg_401_1.time_ < var_404_19 + var_404_29 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play410082100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 410082100
		arg_405_1.duration_ = 9.366

		local var_405_0 = {
			zh = 6.966,
			ja = 9.366
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
				arg_405_0:Play410082101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1012"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos1012 = var_408_0.localPosition
				var_408_0.localScale = Vector3.New(1, 1, 1)

				arg_405_1:CheckSpriteTmpPos("1012", 4)

				local var_408_2 = var_408_0.childCount

				for iter_408_0 = 0, var_408_2 - 1 do
					local var_408_3 = var_408_0:GetChild(iter_408_0)

					if var_408_3.name == "" or not string.find(var_408_3.name, "split") then
						var_408_3.gameObject:SetActive(true)
					else
						var_408_3.gameObject:SetActive(false)
					end
				end
			end

			local var_408_4 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_4 then
				local var_408_5 = (arg_405_1.time_ - var_408_1) / var_408_4
				local var_408_6 = Vector3.New(390, -465, 300)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1012, var_408_6, var_408_5)
			end

			if arg_405_1.time_ >= var_408_1 + var_408_4 and arg_405_1.time_ < var_408_1 + var_408_4 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_408_7 = arg_405_1.actors_["1012"]
			local var_408_8 = 0

			if var_408_8 < arg_405_1.time_ and arg_405_1.time_ <= var_408_8 + arg_408_0 and arg_405_1.var_.actorSpriteComps1012 == nil then
				arg_405_1.var_.actorSpriteComps1012 = var_408_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_9 = 0.034

			if var_408_8 <= arg_405_1.time_ and arg_405_1.time_ < var_408_8 + var_408_9 then
				local var_408_10 = (arg_405_1.time_ - var_408_8) / var_408_9

				if arg_405_1.var_.actorSpriteComps1012 then
					for iter_408_1, iter_408_2 in pairs(arg_405_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_408_2 then
							local var_408_11 = Mathf.Lerp(iter_408_2.color.r, 1, var_408_10)

							iter_408_2.color = Color.New(var_408_11, var_408_11, var_408_11)
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_8 + var_408_9 and arg_405_1.time_ < var_408_8 + var_408_9 + arg_408_0 and arg_405_1.var_.actorSpriteComps1012 then
				local var_408_12 = 1

				for iter_408_3, iter_408_4 in pairs(arg_405_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_408_4 then
						iter_408_4.color = Color.New(var_408_12, var_408_12, var_408_12)
					end
				end

				arg_405_1.var_.actorSpriteComps1012 = nil
			end

			local var_408_13 = arg_405_1.actors_["1060"]
			local var_408_14 = 0

			if var_408_14 < arg_405_1.time_ and arg_405_1.time_ <= var_408_14 + arg_408_0 and arg_405_1.var_.actorSpriteComps1060 == nil then
				arg_405_1.var_.actorSpriteComps1060 = var_408_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_15 = 0.034

			if var_408_14 <= arg_405_1.time_ and arg_405_1.time_ < var_408_14 + var_408_15 then
				local var_408_16 = (arg_405_1.time_ - var_408_14) / var_408_15

				if arg_405_1.var_.actorSpriteComps1060 then
					for iter_408_5, iter_408_6 in pairs(arg_405_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_408_6 then
							local var_408_17 = Mathf.Lerp(iter_408_6.color.r, 0.5, var_408_16)

							iter_408_6.color = Color.New(var_408_17, var_408_17, var_408_17)
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_14 + var_408_15 and arg_405_1.time_ < var_408_14 + var_408_15 + arg_408_0 and arg_405_1.var_.actorSpriteComps1060 then
				local var_408_18 = 0.5

				for iter_408_7, iter_408_8 in pairs(arg_405_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_408_8 then
						iter_408_8.color = Color.New(var_408_18, var_408_18, var_408_18)
					end
				end

				arg_405_1.var_.actorSpriteComps1060 = nil
			end

			local var_408_19 = 0
			local var_408_20 = 0.75

			if var_408_19 < arg_405_1.time_ and arg_405_1.time_ <= var_408_19 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_21 = arg_405_1:FormatText(StoryNameCfg[595].name)

				arg_405_1.leftNameTxt_.text = var_408_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_22 = arg_405_1:GetWordFromCfg(410082100)
				local var_408_23 = arg_405_1:FormatText(var_408_22.content)

				arg_405_1.text_.text = var_408_23

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_24 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082100", "story_v_out_410082.awb") ~= 0 then
					local var_408_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082100", "story_v_out_410082.awb") / 1000

					if var_408_27 + var_408_19 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_27 + var_408_19
					end

					if var_408_22.prefab_name ~= "" and arg_405_1.actors_[var_408_22.prefab_name] ~= nil then
						local var_408_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_22.prefab_name].transform, "story_v_out_410082", "410082100", "story_v_out_410082.awb")

						arg_405_1:RecordAudio("410082100", var_408_28)
						arg_405_1:RecordAudio("410082100", var_408_28)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_410082", "410082100", "story_v_out_410082.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_410082", "410082100", "story_v_out_410082.awb")
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
	Play410082101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 410082101
		arg_409_1.duration_ = 3.7

		local var_409_0 = {
			zh = 3.3,
			ja = 3.7
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
				arg_409_0:Play410082102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1060"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1060 = var_412_0.localPosition
				var_412_0.localScale = Vector3.New(1, 1, 1)

				arg_409_1:CheckSpriteTmpPos("1060", 2)

				local var_412_2 = var_412_0.childCount

				for iter_412_0 = 0, var_412_2 - 1 do
					local var_412_3 = var_412_0:GetChild(iter_412_0)

					if var_412_3.name == "" or not string.find(var_412_3.name, "split") then
						var_412_3.gameObject:SetActive(true)
					else
						var_412_3.gameObject:SetActive(false)
					end
				end
			end

			local var_412_4 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_4 then
				local var_412_5 = (arg_409_1.time_ - var_412_1) / var_412_4
				local var_412_6 = Vector3.New(-390, -435, -40)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1060, var_412_6, var_412_5)
			end

			if arg_409_1.time_ >= var_412_1 + var_412_4 and arg_409_1.time_ < var_412_1 + var_412_4 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_412_7 = arg_409_1.actors_["1060"]
			local var_412_8 = 0

			if var_412_8 < arg_409_1.time_ and arg_409_1.time_ <= var_412_8 + arg_412_0 and arg_409_1.var_.actorSpriteComps1060 == nil then
				arg_409_1.var_.actorSpriteComps1060 = var_412_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_9 = 0.034

			if var_412_8 <= arg_409_1.time_ and arg_409_1.time_ < var_412_8 + var_412_9 then
				local var_412_10 = (arg_409_1.time_ - var_412_8) / var_412_9

				if arg_409_1.var_.actorSpriteComps1060 then
					for iter_412_1, iter_412_2 in pairs(arg_409_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_412_2 then
							local var_412_11 = Mathf.Lerp(iter_412_2.color.r, 1, var_412_10)

							iter_412_2.color = Color.New(var_412_11, var_412_11, var_412_11)
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_8 + var_412_9 and arg_409_1.time_ < var_412_8 + var_412_9 + arg_412_0 and arg_409_1.var_.actorSpriteComps1060 then
				local var_412_12 = 1

				for iter_412_3, iter_412_4 in pairs(arg_409_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_412_4 then
						iter_412_4.color = Color.New(var_412_12, var_412_12, var_412_12)
					end
				end

				arg_409_1.var_.actorSpriteComps1060 = nil
			end

			local var_412_13 = arg_409_1.actors_["1012"]
			local var_412_14 = 0

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 and arg_409_1.var_.actorSpriteComps1012 == nil then
				arg_409_1.var_.actorSpriteComps1012 = var_412_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_15 = 0.034

			if var_412_14 <= arg_409_1.time_ and arg_409_1.time_ < var_412_14 + var_412_15 then
				local var_412_16 = (arg_409_1.time_ - var_412_14) / var_412_15

				if arg_409_1.var_.actorSpriteComps1012 then
					for iter_412_5, iter_412_6 in pairs(arg_409_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_412_6 then
							local var_412_17 = Mathf.Lerp(iter_412_6.color.r, 0.5, var_412_16)

							iter_412_6.color = Color.New(var_412_17, var_412_17, var_412_17)
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_14 + var_412_15 and arg_409_1.time_ < var_412_14 + var_412_15 + arg_412_0 and arg_409_1.var_.actorSpriteComps1012 then
				local var_412_18 = 0.5

				for iter_412_7, iter_412_8 in pairs(arg_409_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_412_8 then
						iter_412_8.color = Color.New(var_412_18, var_412_18, var_412_18)
					end
				end

				arg_409_1.var_.actorSpriteComps1012 = nil
			end

			local var_412_19 = 0
			local var_412_20 = 0.45

			if var_412_19 < arg_409_1.time_ and arg_409_1.time_ <= var_412_19 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_21 = arg_409_1:FormatText(StoryNameCfg[584].name)

				arg_409_1.leftNameTxt_.text = var_412_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_22 = arg_409_1:GetWordFromCfg(410082101)
				local var_412_23 = arg_409_1:FormatText(var_412_22.content)

				arg_409_1.text_.text = var_412_23

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_24 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082101", "story_v_out_410082.awb") ~= 0 then
					local var_412_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082101", "story_v_out_410082.awb") / 1000

					if var_412_27 + var_412_19 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_27 + var_412_19
					end

					if var_412_22.prefab_name ~= "" and arg_409_1.actors_[var_412_22.prefab_name] ~= nil then
						local var_412_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_22.prefab_name].transform, "story_v_out_410082", "410082101", "story_v_out_410082.awb")

						arg_409_1:RecordAudio("410082101", var_412_28)
						arg_409_1:RecordAudio("410082101", var_412_28)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_410082", "410082101", "story_v_out_410082.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_410082", "410082101", "story_v_out_410082.awb")
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
	Play410082102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 410082102
		arg_413_1.duration_ = 8.033

		local var_413_0 = {
			zh = 4.766,
			ja = 8.033
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
				arg_413_0:Play410082103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1012"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1012 = var_416_0.localPosition
				var_416_0.localScale = Vector3.New(1, 1, 1)

				arg_413_1:CheckSpriteTmpPos("1012", 4)

				local var_416_2 = var_416_0.childCount

				for iter_416_0 = 0, var_416_2 - 1 do
					local var_416_3 = var_416_0:GetChild(iter_416_0)

					if var_416_3.name == "" or not string.find(var_416_3.name, "split") then
						var_416_3.gameObject:SetActive(true)
					else
						var_416_3.gameObject:SetActive(false)
					end
				end
			end

			local var_416_4 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_4 then
				local var_416_5 = (arg_413_1.time_ - var_416_1) / var_416_4
				local var_416_6 = Vector3.New(390, -465, 300)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1012, var_416_6, var_416_5)
			end

			if arg_413_1.time_ >= var_416_1 + var_416_4 and arg_413_1.time_ < var_416_1 + var_416_4 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_416_7 = arg_413_1.actors_["1012"]
			local var_416_8 = 0

			if var_416_8 < arg_413_1.time_ and arg_413_1.time_ <= var_416_8 + arg_416_0 and arg_413_1.var_.actorSpriteComps1012 == nil then
				arg_413_1.var_.actorSpriteComps1012 = var_416_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_416_9 = 0.034

			if var_416_8 <= arg_413_1.time_ and arg_413_1.time_ < var_416_8 + var_416_9 then
				local var_416_10 = (arg_413_1.time_ - var_416_8) / var_416_9

				if arg_413_1.var_.actorSpriteComps1012 then
					for iter_416_1, iter_416_2 in pairs(arg_413_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_416_2 then
							local var_416_11 = Mathf.Lerp(iter_416_2.color.r, 1, var_416_10)

							iter_416_2.color = Color.New(var_416_11, var_416_11, var_416_11)
						end
					end
				end
			end

			if arg_413_1.time_ >= var_416_8 + var_416_9 and arg_413_1.time_ < var_416_8 + var_416_9 + arg_416_0 and arg_413_1.var_.actorSpriteComps1012 then
				local var_416_12 = 1

				for iter_416_3, iter_416_4 in pairs(arg_413_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_416_4 then
						iter_416_4.color = Color.New(var_416_12, var_416_12, var_416_12)
					end
				end

				arg_413_1.var_.actorSpriteComps1012 = nil
			end

			local var_416_13 = arg_413_1.actors_["1060"]
			local var_416_14 = 0

			if var_416_14 < arg_413_1.time_ and arg_413_1.time_ <= var_416_14 + arg_416_0 and arg_413_1.var_.actorSpriteComps1060 == nil then
				arg_413_1.var_.actorSpriteComps1060 = var_416_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_416_15 = 0.034

			if var_416_14 <= arg_413_1.time_ and arg_413_1.time_ < var_416_14 + var_416_15 then
				local var_416_16 = (arg_413_1.time_ - var_416_14) / var_416_15

				if arg_413_1.var_.actorSpriteComps1060 then
					for iter_416_5, iter_416_6 in pairs(arg_413_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_416_6 then
							local var_416_17 = Mathf.Lerp(iter_416_6.color.r, 0.5, var_416_16)

							iter_416_6.color = Color.New(var_416_17, var_416_17, var_416_17)
						end
					end
				end
			end

			if arg_413_1.time_ >= var_416_14 + var_416_15 and arg_413_1.time_ < var_416_14 + var_416_15 + arg_416_0 and arg_413_1.var_.actorSpriteComps1060 then
				local var_416_18 = 0.5

				for iter_416_7, iter_416_8 in pairs(arg_413_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_416_8 then
						iter_416_8.color = Color.New(var_416_18, var_416_18, var_416_18)
					end
				end

				arg_413_1.var_.actorSpriteComps1060 = nil
			end

			local var_416_19 = 0
			local var_416_20 = 0.55

			if var_416_19 < arg_413_1.time_ and arg_413_1.time_ <= var_416_19 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_21 = arg_413_1:FormatText(StoryNameCfg[595].name)

				arg_413_1.leftNameTxt_.text = var_416_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_22 = arg_413_1:GetWordFromCfg(410082102)
				local var_416_23 = arg_413_1:FormatText(var_416_22.content)

				arg_413_1.text_.text = var_416_23

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_24 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082102", "story_v_out_410082.awb") ~= 0 then
					local var_416_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082102", "story_v_out_410082.awb") / 1000

					if var_416_27 + var_416_19 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_27 + var_416_19
					end

					if var_416_22.prefab_name ~= "" and arg_413_1.actors_[var_416_22.prefab_name] ~= nil then
						local var_416_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_22.prefab_name].transform, "story_v_out_410082", "410082102", "story_v_out_410082.awb")

						arg_413_1:RecordAudio("410082102", var_416_28)
						arg_413_1:RecordAudio("410082102", var_416_28)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_410082", "410082102", "story_v_out_410082.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_410082", "410082102", "story_v_out_410082.awb")
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
	Play410082103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 410082103
		arg_417_1.duration_ = 5.366

		local var_417_0 = {
			zh = 2.7,
			ja = 5.366
		}
		local var_417_1 = manager.audio:GetLocalizationFlag()

		if var_417_0[var_417_1] ~= nil then
			arg_417_1.duration_ = var_417_0[var_417_1]
		end

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play410082104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1060"].transform
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.var_.moveOldPos1060 = var_420_0.localPosition
				var_420_0.localScale = Vector3.New(1, 1, 1)

				arg_417_1:CheckSpriteTmpPos("1060", 2)

				local var_420_2 = var_420_0.childCount

				for iter_420_0 = 0, var_420_2 - 1 do
					local var_420_3 = var_420_0:GetChild(iter_420_0)

					if var_420_3.name == "split_3" or not string.find(var_420_3.name, "split") then
						var_420_3.gameObject:SetActive(true)
					else
						var_420_3.gameObject:SetActive(false)
					end
				end
			end

			local var_420_4 = 0.001

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_4 then
				local var_420_5 = (arg_417_1.time_ - var_420_1) / var_420_4
				local var_420_6 = Vector3.New(-390, -435, -40)

				var_420_0.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1060, var_420_6, var_420_5)
			end

			if arg_417_1.time_ >= var_420_1 + var_420_4 and arg_417_1.time_ < var_420_1 + var_420_4 + arg_420_0 then
				var_420_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_420_7 = arg_417_1.actors_["1060"]
			local var_420_8 = 0

			if var_420_8 < arg_417_1.time_ and arg_417_1.time_ <= var_420_8 + arg_420_0 and arg_417_1.var_.actorSpriteComps1060 == nil then
				arg_417_1.var_.actorSpriteComps1060 = var_420_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_420_9 = 0.034

			if var_420_8 <= arg_417_1.time_ and arg_417_1.time_ < var_420_8 + var_420_9 then
				local var_420_10 = (arg_417_1.time_ - var_420_8) / var_420_9

				if arg_417_1.var_.actorSpriteComps1060 then
					for iter_420_1, iter_420_2 in pairs(arg_417_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_420_2 then
							local var_420_11 = Mathf.Lerp(iter_420_2.color.r, 1, var_420_10)

							iter_420_2.color = Color.New(var_420_11, var_420_11, var_420_11)
						end
					end
				end
			end

			if arg_417_1.time_ >= var_420_8 + var_420_9 and arg_417_1.time_ < var_420_8 + var_420_9 + arg_420_0 and arg_417_1.var_.actorSpriteComps1060 then
				local var_420_12 = 1

				for iter_420_3, iter_420_4 in pairs(arg_417_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_420_4 then
						iter_420_4.color = Color.New(var_420_12, var_420_12, var_420_12)
					end
				end

				arg_417_1.var_.actorSpriteComps1060 = nil
			end

			local var_420_13 = arg_417_1.actors_["1012"]
			local var_420_14 = 0

			if var_420_14 < arg_417_1.time_ and arg_417_1.time_ <= var_420_14 + arg_420_0 and arg_417_1.var_.actorSpriteComps1012 == nil then
				arg_417_1.var_.actorSpriteComps1012 = var_420_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_420_15 = 0.034

			if var_420_14 <= arg_417_1.time_ and arg_417_1.time_ < var_420_14 + var_420_15 then
				local var_420_16 = (arg_417_1.time_ - var_420_14) / var_420_15

				if arg_417_1.var_.actorSpriteComps1012 then
					for iter_420_5, iter_420_6 in pairs(arg_417_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_420_6 then
							local var_420_17 = Mathf.Lerp(iter_420_6.color.r, 0.5, var_420_16)

							iter_420_6.color = Color.New(var_420_17, var_420_17, var_420_17)
						end
					end
				end
			end

			if arg_417_1.time_ >= var_420_14 + var_420_15 and arg_417_1.time_ < var_420_14 + var_420_15 + arg_420_0 and arg_417_1.var_.actorSpriteComps1012 then
				local var_420_18 = 0.5

				for iter_420_7, iter_420_8 in pairs(arg_417_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_420_8 then
						iter_420_8.color = Color.New(var_420_18, var_420_18, var_420_18)
					end
				end

				arg_417_1.var_.actorSpriteComps1012 = nil
			end

			local var_420_19 = 0
			local var_420_20 = 0.35

			if var_420_19 < arg_417_1.time_ and arg_417_1.time_ <= var_420_19 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_21 = arg_417_1:FormatText(StoryNameCfg[584].name)

				arg_417_1.leftNameTxt_.text = var_420_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_22 = arg_417_1:GetWordFromCfg(410082103)
				local var_420_23 = arg_417_1:FormatText(var_420_22.content)

				arg_417_1.text_.text = var_420_23

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_24 = 14
				local var_420_25 = utf8.len(var_420_23)
				local var_420_26 = var_420_24 <= 0 and var_420_20 or var_420_20 * (var_420_25 / var_420_24)

				if var_420_26 > 0 and var_420_20 < var_420_26 then
					arg_417_1.talkMaxDuration = var_420_26

					if var_420_26 + var_420_19 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_26 + var_420_19
					end
				end

				arg_417_1.text_.text = var_420_23
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082103", "story_v_out_410082.awb") ~= 0 then
					local var_420_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082103", "story_v_out_410082.awb") / 1000

					if var_420_27 + var_420_19 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_27 + var_420_19
					end

					if var_420_22.prefab_name ~= "" and arg_417_1.actors_[var_420_22.prefab_name] ~= nil then
						local var_420_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_22.prefab_name].transform, "story_v_out_410082", "410082103", "story_v_out_410082.awb")

						arg_417_1:RecordAudio("410082103", var_420_28)
						arg_417_1:RecordAudio("410082103", var_420_28)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_410082", "410082103", "story_v_out_410082.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_410082", "410082103", "story_v_out_410082.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_29 = math.max(var_420_20, arg_417_1.talkMaxDuration)

			if var_420_19 <= arg_417_1.time_ and arg_417_1.time_ < var_420_19 + var_420_29 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_19) / var_420_29

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_19 + var_420_29 and arg_417_1.time_ < var_420_19 + var_420_29 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play410082104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 410082104
		arg_421_1.duration_ = 1.466

		local var_421_0 = {
			zh = 1.466,
			ja = 1.266
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
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play410082105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1012"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos1012 = var_424_0.localPosition
				var_424_0.localScale = Vector3.New(1, 1, 1)

				arg_421_1:CheckSpriteTmpPos("1012", 4)

				local var_424_2 = var_424_0.childCount

				for iter_424_0 = 0, var_424_2 - 1 do
					local var_424_3 = var_424_0:GetChild(iter_424_0)

					if var_424_3.name == "" or not string.find(var_424_3.name, "split") then
						var_424_3.gameObject:SetActive(true)
					else
						var_424_3.gameObject:SetActive(false)
					end
				end
			end

			local var_424_4 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_4 then
				local var_424_5 = (arg_421_1.time_ - var_424_1) / var_424_4
				local var_424_6 = Vector3.New(390, -465, 300)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1012, var_424_6, var_424_5)
			end

			if arg_421_1.time_ >= var_424_1 + var_424_4 and arg_421_1.time_ < var_424_1 + var_424_4 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_424_7 = arg_421_1.actors_["1012"]
			local var_424_8 = 0

			if var_424_8 < arg_421_1.time_ and arg_421_1.time_ <= var_424_8 + arg_424_0 and arg_421_1.var_.actorSpriteComps1012 == nil then
				arg_421_1.var_.actorSpriteComps1012 = var_424_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_424_9 = 0.034

			if var_424_8 <= arg_421_1.time_ and arg_421_1.time_ < var_424_8 + var_424_9 then
				local var_424_10 = (arg_421_1.time_ - var_424_8) / var_424_9

				if arg_421_1.var_.actorSpriteComps1012 then
					for iter_424_1, iter_424_2 in pairs(arg_421_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_424_2 then
							local var_424_11 = Mathf.Lerp(iter_424_2.color.r, 1, var_424_10)

							iter_424_2.color = Color.New(var_424_11, var_424_11, var_424_11)
						end
					end
				end
			end

			if arg_421_1.time_ >= var_424_8 + var_424_9 and arg_421_1.time_ < var_424_8 + var_424_9 + arg_424_0 and arg_421_1.var_.actorSpriteComps1012 then
				local var_424_12 = 1

				for iter_424_3, iter_424_4 in pairs(arg_421_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_424_4 then
						iter_424_4.color = Color.New(var_424_12, var_424_12, var_424_12)
					end
				end

				arg_421_1.var_.actorSpriteComps1012 = nil
			end

			local var_424_13 = arg_421_1.actors_["1060"]
			local var_424_14 = 0

			if var_424_14 < arg_421_1.time_ and arg_421_1.time_ <= var_424_14 + arg_424_0 and arg_421_1.var_.actorSpriteComps1060 == nil then
				arg_421_1.var_.actorSpriteComps1060 = var_424_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_424_15 = 0.034

			if var_424_14 <= arg_421_1.time_ and arg_421_1.time_ < var_424_14 + var_424_15 then
				local var_424_16 = (arg_421_1.time_ - var_424_14) / var_424_15

				if arg_421_1.var_.actorSpriteComps1060 then
					for iter_424_5, iter_424_6 in pairs(arg_421_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_424_6 then
							local var_424_17 = Mathf.Lerp(iter_424_6.color.r, 0.5, var_424_16)

							iter_424_6.color = Color.New(var_424_17, var_424_17, var_424_17)
						end
					end
				end
			end

			if arg_421_1.time_ >= var_424_14 + var_424_15 and arg_421_1.time_ < var_424_14 + var_424_15 + arg_424_0 and arg_421_1.var_.actorSpriteComps1060 then
				local var_424_18 = 0.5

				for iter_424_7, iter_424_8 in pairs(arg_421_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_424_8 then
						iter_424_8.color = Color.New(var_424_18, var_424_18, var_424_18)
					end
				end

				arg_421_1.var_.actorSpriteComps1060 = nil
			end

			local var_424_19 = 0
			local var_424_20 = 0.1

			if var_424_19 < arg_421_1.time_ and arg_421_1.time_ <= var_424_19 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_21 = arg_421_1:FormatText(StoryNameCfg[595].name)

				arg_421_1.leftNameTxt_.text = var_424_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_22 = arg_421_1:GetWordFromCfg(410082104)
				local var_424_23 = arg_421_1:FormatText(var_424_22.content)

				arg_421_1.text_.text = var_424_23

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_24 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082104", "story_v_out_410082.awb") ~= 0 then
					local var_424_27 = manager.audio:GetVoiceLength("story_v_out_410082", "410082104", "story_v_out_410082.awb") / 1000

					if var_424_27 + var_424_19 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_27 + var_424_19
					end

					if var_424_22.prefab_name ~= "" and arg_421_1.actors_[var_424_22.prefab_name] ~= nil then
						local var_424_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_22.prefab_name].transform, "story_v_out_410082", "410082104", "story_v_out_410082.awb")

						arg_421_1:RecordAudio("410082104", var_424_28)
						arg_421_1:RecordAudio("410082104", var_424_28)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_410082", "410082104", "story_v_out_410082.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_410082", "410082104", "story_v_out_410082.awb")
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
	Play410082105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 410082105
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play410082106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1012"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.actorSpriteComps1012 == nil then
				arg_425_1.var_.actorSpriteComps1012 = var_428_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_428_2 = 0.034

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.actorSpriteComps1012 then
					for iter_428_0, iter_428_1 in pairs(arg_425_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_428_1 then
							local var_428_4 = Mathf.Lerp(iter_428_1.color.r, 0.5, var_428_3)

							iter_428_1.color = Color.New(var_428_4, var_428_4, var_428_4)
						end
					end
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.actorSpriteComps1012 then
				local var_428_5 = 0.5

				for iter_428_2, iter_428_3 in pairs(arg_425_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_428_3 then
						iter_428_3.color = Color.New(var_428_5, var_428_5, var_428_5)
					end
				end

				arg_425_1.var_.actorSpriteComps1012 = nil
			end

			local var_428_6 = arg_425_1.actors_["1012"].transform
			local var_428_7 = 0

			if var_428_7 < arg_425_1.time_ and arg_425_1.time_ <= var_428_7 + arg_428_0 then
				arg_425_1.var_.moveOldPos1012 = var_428_6.localPosition
				var_428_6.localScale = Vector3.New(1, 1, 1)

				arg_425_1:CheckSpriteTmpPos("1012", 4)

				local var_428_8 = var_428_6.childCount

				for iter_428_4 = 0, var_428_8 - 1 do
					local var_428_9 = var_428_6:GetChild(iter_428_4)

					if var_428_9.name == "split_2" or not string.find(var_428_9.name, "split") then
						var_428_9.gameObject:SetActive(true)
					else
						var_428_9.gameObject:SetActive(false)
					end
				end
			end

			local var_428_10 = 0.001

			if var_428_7 <= arg_425_1.time_ and arg_425_1.time_ < var_428_7 + var_428_10 then
				local var_428_11 = (arg_425_1.time_ - var_428_7) / var_428_10
				local var_428_12 = Vector3.New(390, -465, 300)

				var_428_6.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1012, var_428_12, var_428_11)
			end

			if arg_425_1.time_ >= var_428_7 + var_428_10 and arg_425_1.time_ < var_428_7 + var_428_10 + arg_428_0 then
				var_428_6.localPosition = Vector3.New(390, -465, 300)
			end

			local var_428_13 = 0
			local var_428_14 = 0.95

			if var_428_13 < arg_425_1.time_ and arg_425_1.time_ <= var_428_13 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_15 = arg_425_1:GetWordFromCfg(410082105)
				local var_428_16 = arg_425_1:FormatText(var_428_15.content)

				arg_425_1.text_.text = var_428_16

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_17 = 38
				local var_428_18 = utf8.len(var_428_16)
				local var_428_19 = var_428_17 <= 0 and var_428_14 or var_428_14 * (var_428_18 / var_428_17)

				if var_428_19 > 0 and var_428_14 < var_428_19 then
					arg_425_1.talkMaxDuration = var_428_19

					if var_428_19 + var_428_13 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_19 + var_428_13
					end
				end

				arg_425_1.text_.text = var_428_16
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_20 = math.max(var_428_14, arg_425_1.talkMaxDuration)

			if var_428_13 <= arg_425_1.time_ and arg_425_1.time_ < var_428_13 + var_428_20 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_13) / var_428_20

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_13 + var_428_20 and arg_425_1.time_ < var_428_13 + var_428_20 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play410082106 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 410082106
		arg_429_1.duration_ = 10.633

		local var_429_0 = {
			zh = 10.633,
			ja = 9.5
		}
		local var_429_1 = manager.audio:GetLocalizationFlag()

		if var_429_0[var_429_1] ~= nil then
			arg_429_1.duration_ = var_429_0[var_429_1]
		end

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play410082107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1012"].transform
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 then
				arg_429_1.var_.moveOldPos1012 = var_432_0.localPosition
				var_432_0.localScale = Vector3.New(1, 1, 1)

				arg_429_1:CheckSpriteTmpPos("1012", 4)

				local var_432_2 = var_432_0.childCount

				for iter_432_0 = 0, var_432_2 - 1 do
					local var_432_3 = var_432_0:GetChild(iter_432_0)

					if var_432_3.name == "split_3" or not string.find(var_432_3.name, "split") then
						var_432_3.gameObject:SetActive(true)
					else
						var_432_3.gameObject:SetActive(false)
					end
				end
			end

			local var_432_4 = 0.001

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_4 then
				local var_432_5 = (arg_429_1.time_ - var_432_1) / var_432_4
				local var_432_6 = Vector3.New(390, -465, 300)

				var_432_0.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1012, var_432_6, var_432_5)
			end

			if arg_429_1.time_ >= var_432_1 + var_432_4 and arg_429_1.time_ < var_432_1 + var_432_4 + arg_432_0 then
				var_432_0.localPosition = Vector3.New(390, -465, 300)
			end

			local var_432_7 = arg_429_1.actors_["1012"]
			local var_432_8 = 0

			if var_432_8 < arg_429_1.time_ and arg_429_1.time_ <= var_432_8 + arg_432_0 and arg_429_1.var_.actorSpriteComps1012 == nil then
				arg_429_1.var_.actorSpriteComps1012 = var_432_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_432_9 = 0.034

			if var_432_8 <= arg_429_1.time_ and arg_429_1.time_ < var_432_8 + var_432_9 then
				local var_432_10 = (arg_429_1.time_ - var_432_8) / var_432_9

				if arg_429_1.var_.actorSpriteComps1012 then
					for iter_432_1, iter_432_2 in pairs(arg_429_1.var_.actorSpriteComps1012:ToTable()) do
						if iter_432_2 then
							local var_432_11 = Mathf.Lerp(iter_432_2.color.r, 1, var_432_10)

							iter_432_2.color = Color.New(var_432_11, var_432_11, var_432_11)
						end
					end
				end
			end

			if arg_429_1.time_ >= var_432_8 + var_432_9 and arg_429_1.time_ < var_432_8 + var_432_9 + arg_432_0 and arg_429_1.var_.actorSpriteComps1012 then
				local var_432_12 = 1

				for iter_432_3, iter_432_4 in pairs(arg_429_1.var_.actorSpriteComps1012:ToTable()) do
					if iter_432_4 then
						iter_432_4.color = Color.New(var_432_12, var_432_12, var_432_12)
					end
				end

				arg_429_1.var_.actorSpriteComps1012 = nil
			end

			local var_432_13 = 0
			local var_432_14 = 1.1

			if var_432_13 < arg_429_1.time_ and arg_429_1.time_ <= var_432_13 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_15 = arg_429_1:FormatText(StoryNameCfg[595].name)

				arg_429_1.leftNameTxt_.text = var_432_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_16 = arg_429_1:GetWordFromCfg(410082106)
				local var_432_17 = arg_429_1:FormatText(var_432_16.content)

				arg_429_1.text_.text = var_432_17

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_18 = 44
				local var_432_19 = utf8.len(var_432_17)
				local var_432_20 = var_432_18 <= 0 and var_432_14 or var_432_14 * (var_432_19 / var_432_18)

				if var_432_20 > 0 and var_432_14 < var_432_20 then
					arg_429_1.talkMaxDuration = var_432_20

					if var_432_20 + var_432_13 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_20 + var_432_13
					end
				end

				arg_429_1.text_.text = var_432_17
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082106", "story_v_out_410082.awb") ~= 0 then
					local var_432_21 = manager.audio:GetVoiceLength("story_v_out_410082", "410082106", "story_v_out_410082.awb") / 1000

					if var_432_21 + var_432_13 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_21 + var_432_13
					end

					if var_432_16.prefab_name ~= "" and arg_429_1.actors_[var_432_16.prefab_name] ~= nil then
						local var_432_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_16.prefab_name].transform, "story_v_out_410082", "410082106", "story_v_out_410082.awb")

						arg_429_1:RecordAudio("410082106", var_432_22)
						arg_429_1:RecordAudio("410082106", var_432_22)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_410082", "410082106", "story_v_out_410082.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_410082", "410082106", "story_v_out_410082.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_23 = math.max(var_432_14, arg_429_1.talkMaxDuration)

			if var_432_13 <= arg_429_1.time_ and arg_429_1.time_ < var_432_13 + var_432_23 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_13) / var_432_23

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_13 + var_432_23 and arg_429_1.time_ < var_432_13 + var_432_23 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play410082107 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 410082107
		arg_433_1.duration_ = 2.333

		local var_433_0 = {
			zh = 2.066,
			ja = 2.333
		}
		local var_433_1 = manager.audio:GetLocalizationFlag()

		if var_433_0[var_433_1] ~= nil then
			arg_433_1.duration_ = var_433_0[var_433_1]
		end

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
			arg_433_1.auto_ = false
		end

		function arg_433_1.playNext_(arg_435_0)
			arg_433_1.onStoryFinished_()
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0
			local var_436_1 = 0.125

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_2 = arg_433_1:FormatText(StoryNameCfg[595].name)

				arg_433_1.leftNameTxt_.text = var_436_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_3 = arg_433_1:GetWordFromCfg(410082107)
				local var_436_4 = arg_433_1:FormatText(var_436_3.content)

				arg_433_1.text_.text = var_436_4

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_5 = 5
				local var_436_6 = utf8.len(var_436_4)
				local var_436_7 = var_436_5 <= 0 and var_436_1 or var_436_1 * (var_436_6 / var_436_5)

				if var_436_7 > 0 and var_436_1 < var_436_7 then
					arg_433_1.talkMaxDuration = var_436_7

					if var_436_7 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_7 + var_436_0
					end
				end

				arg_433_1.text_.text = var_436_4
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410082", "410082107", "story_v_out_410082.awb") ~= 0 then
					local var_436_8 = manager.audio:GetVoiceLength("story_v_out_410082", "410082107", "story_v_out_410082.awb") / 1000

					if var_436_8 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_8 + var_436_0
					end

					if var_436_3.prefab_name ~= "" and arg_433_1.actors_[var_436_3.prefab_name] ~= nil then
						local var_436_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_3.prefab_name].transform, "story_v_out_410082", "410082107", "story_v_out_410082.awb")

						arg_433_1:RecordAudio("410082107", var_436_9)
						arg_433_1:RecordAudio("410082107", var_436_9)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_410082", "410082107", "story_v_out_410082.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_410082", "410082107", "story_v_out_410082.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_10 = math.max(var_436_1, arg_433_1.talkMaxDuration)

			if var_436_0 <= arg_433_1.time_ and arg_433_1.time_ < var_436_0 + var_436_10 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_0) / var_436_10

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_0 + var_436_10 and arg_433_1.time_ < var_436_0 + var_436_10 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/L01f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST61"
	},
	voices = {
		"story_v_out_410082.awb"
	}
}
