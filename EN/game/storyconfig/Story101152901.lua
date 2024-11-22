return {
	Play115291001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115291001
		arg_1_1.duration_ = 7.9

		local var_1_0 = {
			ja = 6.266,
			ko = 6.4,
			zh = 7.3,
			en = 7.9
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
				arg_1_0:Play115291002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST22a"

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
				local var_4_5 = arg_1_1.bgs_.ST22a

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
					if iter_4_0 ~= "ST22a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

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

			local var_4_22 = 2
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_activity_1_5_3", "se_story_activity_1_5_3_rain_loop", "")
			end

			local var_4_26 = 0
			local var_4_27 = 0.366666666666667

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 2
			local var_4_31 = 0.475

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_1_3_story_destroyed", "bgm_activity_1_3_story_destroyed", "bgm_activity_1_3_story_destroyed.awb")
			end

			local var_4_34 = "1041_1"

			if arg_1_1.actors_[var_4_34] == nil then
				local var_4_35 = Object.Instantiate(arg_1_1.imageGo_, arg_1_1.canvasGo_.transform)

				var_4_35.transform:SetSiblingIndex(1)

				var_4_35.name = var_4_34

				local var_4_36 = var_4_35:GetComponent(typeof(Image))

				var_4_36.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_4_34)

				var_4_36:SetNativeSize()

				var_4_35.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_34] = var_4_35
			end

			local var_4_37 = arg_1_1.actors_["1041_1"].transform
			local var_4_38 = 2

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.var_.moveOldPos1041_1 = var_4_37.localPosition
				var_4_37.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("1041_1", 4)
			end

			local var_4_39 = 0.001

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39
				local var_4_41 = Vector3.New(440, -310, -370)

				var_4_37.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1041_1, var_4_41, var_4_40)
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				var_4_37.localPosition = Vector3.New(440, -310, -370)
			end

			local var_4_42 = "1041"

			if arg_1_1.actors_[var_4_42] == nil then
				local var_4_43 = Object.Instantiate(arg_1_1.imageGo_, arg_1_1.canvasGo_.transform)

				var_4_43.transform:SetSiblingIndex(1)

				var_4_43.name = var_4_42

				local var_4_44 = var_4_43:GetComponent(typeof(Image))

				var_4_44.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_4_42)

				var_4_44:SetNativeSize()

				var_4_43.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_42] = var_4_43
			end

			local var_4_45 = arg_1_1.actors_["1041"]
			local var_4_46 = 2

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				local var_4_47 = var_4_45:GetComponent("Image")

				if var_4_47 then
					arg_1_1.var_.alphaMatValue1041 = var_4_47
					arg_1_1.var_.alphaOldValue1041 = var_4_47.color.a
				end

				arg_1_1.var_.alphaOldValue1041 = 0
			end

			local var_4_48 = 0.333333333333333

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_48 then
				local var_4_49 = (arg_1_1.time_ - var_4_46) / var_4_48
				local var_4_50 = Mathf.Lerp(arg_1_1.var_.alphaOldValue1041, 1, var_4_49)

				if arg_1_1.var_.alphaMatValue1041 then
					local var_4_51 = arg_1_1.var_.alphaMatValue1041.color

					var_4_51.a = var_4_50
					arg_1_1.var_.alphaMatValue1041.color = var_4_51
				end
			end

			if arg_1_1.time_ >= var_4_46 + var_4_48 and arg_1_1.time_ < var_4_46 + var_4_48 + arg_4_0 and arg_1_1.var_.alphaMatValue1041 then
				local var_4_52 = arg_1_1.var_.alphaMatValue1041
				local var_4_53 = var_4_52.color

				var_4_53.a = 1
				var_4_52.color = var_4_53
			end

			local var_4_54 = 0

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_55 = 3

			if arg_1_1.time_ >= var_4_54 + var_4_55 and arg_1_1.time_ < var_4_54 + var_4_55 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_56 = arg_1_1.actors_["1041_1"]
			local var_4_57 = 2

			if var_4_57 < arg_1_1.time_ and arg_1_1.time_ <= var_4_57 + arg_4_0 then
				local var_4_58 = var_4_56:GetComponent("Image")

				if var_4_58 then
					arg_1_1.var_.highlightMatValue1041_1 = var_4_58
				end
			end

			local var_4_59 = 0.2

			if var_4_57 <= arg_1_1.time_ and arg_1_1.time_ < var_4_57 + var_4_59 then
				local var_4_60 = (arg_1_1.time_ - var_4_57) / var_4_59

				if arg_1_1.var_.highlightMatValue1041_1 then
					local var_4_61 = Mathf.Lerp(0.5, 1, var_4_60)
					local var_4_62 = arg_1_1.var_.highlightMatValue1041_1
					local var_4_63 = var_4_62.color

					var_4_63.r = var_4_61
					var_4_63.g = var_4_61
					var_4_63.b = var_4_61
					var_4_62.color = var_4_63
				end
			end

			if arg_1_1.time_ >= var_4_57 + var_4_59 and arg_1_1.time_ < var_4_57 + var_4_59 + arg_4_0 and arg_1_1.var_.highlightMatValue1041_1 then
				local var_4_64 = 1

				var_4_56.transform:SetSiblingIndex(1)

				local var_4_65 = arg_1_1.var_.highlightMatValue1041_1
				local var_4_66 = var_4_65.color

				var_4_66.r = var_4_64
				var_4_66.g = var_4_64
				var_4_66.b = var_4_64
				var_4_65.color = var_4_66
			end

			local var_4_67 = manager.ui.mainCamera.transform
			local var_4_68 = 0

			if var_4_68 < arg_1_1.time_ and arg_1_1.time_ <= var_4_68 + arg_4_0 then
				local var_4_69 = arg_1_1.var_.effectYU

				if not var_4_69 then
					var_4_69 = Object.Instantiate(Asset.Load("Effect/Scene/fx_raindrop"))
					var_4_69.name = "YU"
					arg_1_1.var_.effectYU = var_4_69
				end

				local var_4_70 = var_4_67:Find("")

				if var_4_70 then
					var_4_69.transform.parent = var_4_70
				else
					var_4_69.transform.parent = var_4_67
				end

				var_4_69.transform.localPosition = Vector3.New(0, 0, 0.03)
				var_4_69.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_71 = 2
			local var_4_72 = 0.525

			if var_4_71 < arg_1_1.time_ and arg_1_1.time_ <= var_4_71 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_73 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_73:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_73:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_73:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_74 = arg_1_1:FormatText(StoryNameCfg[208].name)

				arg_1_1.leftNameTxt_.text = var_4_74

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_75 = arg_1_1:GetWordFromCfg(115291001)
				local var_4_76 = arg_1_1:FormatText(var_4_75.content)

				arg_1_1.text_.text = var_4_76

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_77 = 21
				local var_4_78 = utf8.len(var_4_76)
				local var_4_79 = var_4_77 <= 0 and var_4_72 or var_4_72 * (var_4_78 / var_4_77)

				if var_4_79 > 0 and var_4_72 < var_4_79 then
					arg_1_1.talkMaxDuration = var_4_79
					var_4_71 = var_4_71 + 0.3

					if var_4_79 + var_4_71 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_79 + var_4_71
					end
				end

				arg_1_1.text_.text = var_4_76
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291001", "story_v_out_115291.awb") ~= 0 then
					local var_4_80 = manager.audio:GetVoiceLength("story_v_out_115291", "115291001", "story_v_out_115291.awb") / 1000

					if var_4_80 + var_4_71 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_80 + var_4_71
					end

					if var_4_75.prefab_name ~= "" and arg_1_1.actors_[var_4_75.prefab_name] ~= nil then
						local var_4_81 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_75.prefab_name].transform, "story_v_out_115291", "115291001", "story_v_out_115291.awb")

						arg_1_1:RecordAudio("115291001", var_4_81)
						arg_1_1:RecordAudio("115291001", var_4_81)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_115291", "115291001", "story_v_out_115291.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_115291", "115291001", "story_v_out_115291.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_82 = var_4_71 + 0.3
			local var_4_83 = math.max(var_4_72, arg_1_1.talkMaxDuration)

			if var_4_82 <= arg_1_1.time_ and arg_1_1.time_ < var_4_82 + var_4_83 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_82) / var_4_83

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_82 + var_4_83 and arg_1_1.time_ < var_4_82 + var_4_83 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play115291002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 115291002
		arg_7_1.duration_ = 3.9

		local var_7_0 = {
			ja = 3.9,
			ko = 3.9,
			zh = 3.8,
			en = 3.533
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
				arg_7_0:Play115291003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10030"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["10030"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos10030 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10030", 2)

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
				local var_10_8 = Vector3.New(-390, -390, 150)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10030, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(-390, -390, 150)
			end

			local var_10_9 = arg_7_1.actors_["1041_1"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				local var_10_11 = var_10_9:GetComponent("Image")

				if var_10_11 then
					arg_7_1.var_.highlightMatValue1041_1 = var_10_11
				end
			end

			local var_10_12 = 0.2

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_10) / var_10_12

				if arg_7_1.var_.highlightMatValue1041_1 then
					local var_10_14 = Mathf.Lerp(1, 0.5, var_10_13)
					local var_10_15 = arg_7_1.var_.highlightMatValue1041_1
					local var_10_16 = var_10_15.color

					var_10_16.r = var_10_14
					var_10_16.g = var_10_14
					var_10_16.b = var_10_14
					var_10_15.color = var_10_16
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_12 and arg_7_1.time_ < var_10_10 + var_10_12 + arg_10_0 and arg_7_1.var_.highlightMatValue1041_1 then
				local var_10_17 = 0.5
				local var_10_18 = arg_7_1.var_.highlightMatValue1041_1
				local var_10_19 = var_10_18.color

				var_10_19.r = var_10_17
				var_10_19.g = var_10_17
				var_10_19.b = var_10_17
				var_10_18.color = var_10_19
			end

			local var_10_20 = arg_7_1.actors_["10030"]
			local var_10_21 = 0

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 then
				local var_10_22 = var_10_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_22 then
					arg_7_1.var_.alphaOldValue10030 = var_10_22.alpha
					arg_7_1.var_.characterEffect10030 = var_10_22
				end

				arg_7_1.var_.alphaOldValue10030 = 0
			end

			local var_10_23 = 0.333333333333333

			if var_10_21 <= arg_7_1.time_ and arg_7_1.time_ < var_10_21 + var_10_23 then
				local var_10_24 = (arg_7_1.time_ - var_10_21) / var_10_23
				local var_10_25 = Mathf.Lerp(arg_7_1.var_.alphaOldValue10030, 1, var_10_24)

				if arg_7_1.var_.characterEffect10030 then
					arg_7_1.var_.characterEffect10030.alpha = var_10_25
				end
			end

			if arg_7_1.time_ >= var_10_21 + var_10_23 and arg_7_1.time_ < var_10_21 + var_10_23 + arg_10_0 and arg_7_1.var_.characterEffect10030 then
				arg_7_1.var_.characterEffect10030.alpha = 1
			end

			local var_10_26 = 0
			local var_10_27 = 0.325

			if var_10_26 < arg_7_1.time_ and arg_7_1.time_ <= var_10_26 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_28 = arg_7_1:FormatText(StoryNameCfg[309].name)

				arg_7_1.leftNameTxt_.text = var_10_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_29 = arg_7_1:GetWordFromCfg(115291002)
				local var_10_30 = arg_7_1:FormatText(var_10_29.content)

				arg_7_1.text_.text = var_10_30

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_31 = 13
				local var_10_32 = utf8.len(var_10_30)
				local var_10_33 = var_10_31 <= 0 and var_10_27 or var_10_27 * (var_10_32 / var_10_31)

				if var_10_33 > 0 and var_10_27 < var_10_33 then
					arg_7_1.talkMaxDuration = var_10_33

					if var_10_33 + var_10_26 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_26
					end
				end

				arg_7_1.text_.text = var_10_30
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291002", "story_v_out_115291.awb") ~= 0 then
					local var_10_34 = manager.audio:GetVoiceLength("story_v_out_115291", "115291002", "story_v_out_115291.awb") / 1000

					if var_10_34 + var_10_26 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_34 + var_10_26
					end

					if var_10_29.prefab_name ~= "" and arg_7_1.actors_[var_10_29.prefab_name] ~= nil then
						local var_10_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_29.prefab_name].transform, "story_v_out_115291", "115291002", "story_v_out_115291.awb")

						arg_7_1:RecordAudio("115291002", var_10_35)
						arg_7_1:RecordAudio("115291002", var_10_35)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_115291", "115291002", "story_v_out_115291.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_115291", "115291002", "story_v_out_115291.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_36 = math.max(var_10_27, arg_7_1.talkMaxDuration)

			if var_10_26 <= arg_7_1.time_ and arg_7_1.time_ < var_10_26 + var_10_36 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_26) / var_10_36

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_26 + var_10_36 and arg_7_1.time_ < var_10_26 + var_10_36 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play115291003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 115291003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play115291004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10030"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				local var_14_2 = var_14_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_14_2 then
					arg_11_1.var_.alphaOldValue10030 = var_14_2.alpha
					arg_11_1.var_.characterEffect10030 = var_14_2
				end

				arg_11_1.var_.alphaOldValue10030 = 1
			end

			local var_14_3 = 0.333333333333333

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_3 then
				local var_14_4 = (arg_11_1.time_ - var_14_1) / var_14_3
				local var_14_5 = Mathf.Lerp(arg_11_1.var_.alphaOldValue10030, 0, var_14_4)

				if arg_11_1.var_.characterEffect10030 then
					arg_11_1.var_.characterEffect10030.alpha = var_14_5
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_3 and arg_11_1.time_ < var_14_1 + var_14_3 + arg_14_0 and arg_11_1.var_.characterEffect10030 then
				arg_11_1.var_.characterEffect10030.alpha = 0
			end

			local var_14_6 = arg_11_1.actors_["1041_1"]
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				local var_14_8 = var_14_6:GetComponent("Image")

				if var_14_8 then
					arg_11_1.var_.alphaMatValue1041_1 = var_14_8
					arg_11_1.var_.alphaOldValue1041_1 = var_14_8.color.a
				end

				arg_11_1.var_.alphaOldValue1041_1 = 1
			end

			local var_14_9 = 0.333333333333333

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_9 then
				local var_14_10 = (arg_11_1.time_ - var_14_7) / var_14_9
				local var_14_11 = Mathf.Lerp(arg_11_1.var_.alphaOldValue1041_1, 0, var_14_10)

				if arg_11_1.var_.alphaMatValue1041_1 then
					local var_14_12 = arg_11_1.var_.alphaMatValue1041_1.color

					var_14_12.a = var_14_11
					arg_11_1.var_.alphaMatValue1041_1.color = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_7 + var_14_9 and arg_11_1.time_ < var_14_7 + var_14_9 + arg_14_0 and arg_11_1.var_.alphaMatValue1041_1 then
				local var_14_13 = arg_11_1.var_.alphaMatValue1041_1
				local var_14_14 = var_14_13.color

				var_14_14.a = 0
				var_14_13.color = var_14_14
			end

			local var_14_15 = arg_11_1.actors_["10030"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.actorSpriteComps10030 == nil then
				arg_11_1.var_.actorSpriteComps10030 = var_14_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_17 = 0.0166666666666667

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.actorSpriteComps10030 then
					for iter_14_0, iter_14_1 in pairs(arg_11_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_14_1 then
							local var_14_19 = Mathf.Lerp(iter_14_1.color.r, 0.5, var_14_18)

							iter_14_1.color = Color.New(var_14_19, var_14_19, var_14_19)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.actorSpriteComps10030 then
				local var_14_20 = 0.5

				for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_14_3 then
						iter_14_3.color = Color.New(var_14_20, var_14_20, var_14_20)
					end
				end

				arg_11_1.var_.actorSpriteComps10030 = nil
			end

			local var_14_21 = 0
			local var_14_22 = 0.45

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_23 = arg_11_1:GetWordFromCfg(115291003)
				local var_14_24 = arg_11_1:FormatText(var_14_23.content)

				arg_11_1.text_.text = var_14_24

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_25 = 18
				local var_14_26 = utf8.len(var_14_24)
				local var_14_27 = var_14_25 <= 0 and var_14_22 or var_14_22 * (var_14_26 / var_14_25)

				if var_14_27 > 0 and var_14_22 < var_14_27 then
					arg_11_1.talkMaxDuration = var_14_27

					if var_14_27 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_21
					end
				end

				arg_11_1.text_.text = var_14_24
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_28 = math.max(var_14_22, arg_11_1.talkMaxDuration)

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_28 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_21) / var_14_28

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_21 + var_14_28 and arg_11_1.time_ < var_14_21 + var_14_28 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play115291004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 115291004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play115291005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.125

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

				local var_18_2 = arg_15_1:GetWordFromCfg(115291004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 45
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
	Play115291005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 115291005
		arg_19_1.duration_ = 13.6

		local var_19_0 = {
			ja = 9.6,
			ko = 8.9,
			zh = 9.366,
			en = 13.6
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
				arg_19_0:Play115291006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1041_1"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1041_1 = var_22_0.localPosition
				var_22_0.localScale = Vector3.New(1, 1, 1)

				arg_19_1:CheckSpriteTmpPos("1041_1", 3)
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(120, -310, -370)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1041_1, var_22_4, var_22_3)
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(120, -310, -370)
			end

			local var_22_5 = 0
			local var_22_6 = 1

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				local var_22_7 = "stop"
				local var_22_8 = "music"

				arg_19_1:AudioAction(var_22_7, var_22_8, "se_story_activity_1_5_3", "se_story_activity_1_5_3_rain_loop", "")
			end

			local var_22_9 = arg_19_1.actors_["1041_1"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				local var_22_11 = var_22_9:GetComponent("Image")

				if var_22_11 then
					arg_19_1.var_.highlightMatValue1041_1 = var_22_11
				end
			end

			local var_22_12 = 0.2

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_12 then
				local var_22_13 = (arg_19_1.time_ - var_22_10) / var_22_12

				if arg_19_1.var_.highlightMatValue1041_1 then
					local var_22_14 = Mathf.Lerp(0.5, 1, var_22_13)
					local var_22_15 = arg_19_1.var_.highlightMatValue1041_1
					local var_22_16 = var_22_15.color

					var_22_16.r = var_22_14
					var_22_16.g = var_22_14
					var_22_16.b = var_22_14
					var_22_15.color = var_22_16
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_12 and arg_19_1.time_ < var_22_10 + var_22_12 + arg_22_0 and arg_19_1.var_.highlightMatValue1041_1 then
				local var_22_17 = 1

				var_22_9.transform:SetSiblingIndex(1)

				local var_22_18 = arg_19_1.var_.highlightMatValue1041_1
				local var_22_19 = var_22_18.color

				var_22_19.r = var_22_17
				var_22_19.g = var_22_17
				var_22_19.b = var_22_17
				var_22_18.color = var_22_19
			end

			local var_22_20 = arg_19_1.actors_["1041_1"]
			local var_22_21 = 0

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				local var_22_22 = var_22_20:GetComponent("Image")

				if var_22_22 then
					arg_19_1.var_.alphaMatValue1041_1 = var_22_22
					arg_19_1.var_.alphaOldValue1041_1 = var_22_22.color.a
				end

				arg_19_1.var_.alphaOldValue1041_1 = 0
			end

			local var_22_23 = 0.333333333333333

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_23 then
				local var_22_24 = (arg_19_1.time_ - var_22_21) / var_22_23
				local var_22_25 = Mathf.Lerp(arg_19_1.var_.alphaOldValue1041_1, 1, var_22_24)

				if arg_19_1.var_.alphaMatValue1041_1 then
					local var_22_26 = arg_19_1.var_.alphaMatValue1041_1.color

					var_22_26.a = var_22_25
					arg_19_1.var_.alphaMatValue1041_1.color = var_22_26
				end
			end

			if arg_19_1.time_ >= var_22_21 + var_22_23 and arg_19_1.time_ < var_22_21 + var_22_23 + arg_22_0 and arg_19_1.var_.alphaMatValue1041_1 then
				local var_22_27 = arg_19_1.var_.alphaMatValue1041_1
				local var_22_28 = var_22_27.color

				var_22_28.a = 1
				var_22_27.color = var_22_28
			end

			local var_22_29 = 0
			local var_22_30 = 1.075

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_31 = arg_19_1:FormatText(StoryNameCfg[208].name)

				arg_19_1.leftNameTxt_.text = var_22_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_32 = arg_19_1:GetWordFromCfg(115291005)
				local var_22_33 = arg_19_1:FormatText(var_22_32.content)

				arg_19_1.text_.text = var_22_33

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_34 = 43
				local var_22_35 = utf8.len(var_22_33)
				local var_22_36 = var_22_34 <= 0 and var_22_30 or var_22_30 * (var_22_35 / var_22_34)

				if var_22_36 > 0 and var_22_30 < var_22_36 then
					arg_19_1.talkMaxDuration = var_22_36

					if var_22_36 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_29
					end
				end

				arg_19_1.text_.text = var_22_33
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291005", "story_v_out_115291.awb") ~= 0 then
					local var_22_37 = manager.audio:GetVoiceLength("story_v_out_115291", "115291005", "story_v_out_115291.awb") / 1000

					if var_22_37 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_37 + var_22_29
					end

					if var_22_32.prefab_name ~= "" and arg_19_1.actors_[var_22_32.prefab_name] ~= nil then
						local var_22_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_32.prefab_name].transform, "story_v_out_115291", "115291005", "story_v_out_115291.awb")

						arg_19_1:RecordAudio("115291005", var_22_38)
						arg_19_1:RecordAudio("115291005", var_22_38)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_115291", "115291005", "story_v_out_115291.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_115291", "115291005", "story_v_out_115291.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_39 = math.max(var_22_30, arg_19_1.talkMaxDuration)

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_39 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_29) / var_22_39

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_29 + var_22_39 and arg_19_1.time_ < var_22_29 + var_22_39 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play115291006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 115291006
		arg_23_1.duration_ = 14.533

		local var_23_0 = {
			ja = 14.533,
			ko = 7.733,
			zh = 6.766,
			en = 9.7
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
				arg_23_0:Play115291007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.825

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[208].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(115291006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291006", "story_v_out_115291.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291006", "story_v_out_115291.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_115291", "115291006", "story_v_out_115291.awb")

						arg_23_1:RecordAudio("115291006", var_26_9)
						arg_23_1:RecordAudio("115291006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_115291", "115291006", "story_v_out_115291.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_115291", "115291006", "story_v_out_115291.awb")
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
	Play115291007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 115291007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play115291008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1041_1"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				local var_30_2 = var_30_0:GetComponent("Image")

				if var_30_2 then
					arg_27_1.var_.alphaMatValue1041_1 = var_30_2
					arg_27_1.var_.alphaOldValue1041_1 = var_30_2.color.a
				end

				arg_27_1.var_.alphaOldValue1041_1 = 1
			end

			local var_30_3 = 0.333333333333333

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_3 then
				local var_30_4 = (arg_27_1.time_ - var_30_1) / var_30_3
				local var_30_5 = Mathf.Lerp(arg_27_1.var_.alphaOldValue1041_1, 0, var_30_4)

				if arg_27_1.var_.alphaMatValue1041_1 then
					local var_30_6 = arg_27_1.var_.alphaMatValue1041_1.color

					var_30_6.a = var_30_5
					arg_27_1.var_.alphaMatValue1041_1.color = var_30_6
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_3 and arg_27_1.time_ < var_30_1 + var_30_3 + arg_30_0 and arg_27_1.var_.alphaMatValue1041_1 then
				local var_30_7 = arg_27_1.var_.alphaMatValue1041_1
				local var_30_8 = var_30_7.color

				var_30_8.a = 0
				var_30_7.color = var_30_8
			end

			local var_30_9 = 0
			local var_30_10 = 0.9

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_11 = arg_27_1:GetWordFromCfg(115291007)
				local var_30_12 = arg_27_1:FormatText(var_30_11.content)

				arg_27_1.text_.text = var_30_12

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_13 = 36
				local var_30_14 = utf8.len(var_30_12)
				local var_30_15 = var_30_13 <= 0 and var_30_10 or var_30_10 * (var_30_14 / var_30_13)

				if var_30_15 > 0 and var_30_10 < var_30_15 then
					arg_27_1.talkMaxDuration = var_30_15

					if var_30_15 + var_30_9 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_15 + var_30_9
					end
				end

				arg_27_1.text_.text = var_30_12
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_10, arg_27_1.talkMaxDuration)

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_9) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_9 + var_30_16 and arg_27_1.time_ < var_30_9 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play115291008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 115291008
		arg_31_1.duration_ = 5.666

		local var_31_0 = {
			ja = 5,
			ko = 5.666,
			zh = 3.9,
			en = 5.166
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
				arg_31_0:Play115291009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1041_1"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1041_1 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1041_1", 4)
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(440, -310, -370)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1041_1, var_34_4, var_34_3)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(440, -310, -370)
			end

			local var_34_5 = arg_31_1.actors_["1041_1"]
			local var_34_6 = 0

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				local var_34_7 = var_34_5:GetComponent("Image")

				if var_34_7 then
					arg_31_1.var_.alphaMatValue1041_1 = var_34_7
					arg_31_1.var_.alphaOldValue1041_1 = var_34_7.color.a
				end

				arg_31_1.var_.alphaOldValue1041_1 = 0
			end

			local var_34_8 = 0.333333333333333

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_6) / var_34_8
				local var_34_10 = Mathf.Lerp(arg_31_1.var_.alphaOldValue1041_1, 1, var_34_9)

				if arg_31_1.var_.alphaMatValue1041_1 then
					local var_34_11 = arg_31_1.var_.alphaMatValue1041_1.color

					var_34_11.a = var_34_10
					arg_31_1.var_.alphaMatValue1041_1.color = var_34_11
				end
			end

			if arg_31_1.time_ >= var_34_6 + var_34_8 and arg_31_1.time_ < var_34_6 + var_34_8 + arg_34_0 and arg_31_1.var_.alphaMatValue1041_1 then
				local var_34_12 = arg_31_1.var_.alphaMatValue1041_1
				local var_34_13 = var_34_12.color

				var_34_13.a = 1
				var_34_12.color = var_34_13
			end

			local var_34_14 = arg_31_1.actors_["10030"].transform
			local var_34_15 = 0

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.var_.moveOldPos10030 = var_34_14.localPosition
				var_34_14.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("10030", 2)

				local var_34_16 = var_34_14.childCount

				for iter_34_0 = 0, var_34_16 - 1 do
					local var_34_17 = var_34_14:GetChild(iter_34_0)

					if var_34_17.name == "split_3" or not string.find(var_34_17.name, "split") then
						var_34_17.gameObject:SetActive(true)
					else
						var_34_17.gameObject:SetActive(false)
					end
				end
			end

			local var_34_18 = 0.001

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_18 then
				local var_34_19 = (arg_31_1.time_ - var_34_15) / var_34_18
				local var_34_20 = Vector3.New(-390, -390, 150)

				var_34_14.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10030, var_34_20, var_34_19)
			end

			if arg_31_1.time_ >= var_34_15 + var_34_18 and arg_31_1.time_ < var_34_15 + var_34_18 + arg_34_0 then
				var_34_14.localPosition = Vector3.New(-390, -390, 150)
			end

			local var_34_21 = arg_31_1.actors_["10030"]
			local var_34_22 = 0

			if var_34_22 < arg_31_1.time_ and arg_31_1.time_ <= var_34_22 + arg_34_0 then
				local var_34_23 = var_34_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_34_23 then
					arg_31_1.var_.alphaOldValue10030 = var_34_23.alpha
					arg_31_1.var_.characterEffect10030 = var_34_23
				end

				arg_31_1.var_.alphaOldValue10030 = 0
			end

			local var_34_24 = 0.333333333333333

			if var_34_22 <= arg_31_1.time_ and arg_31_1.time_ < var_34_22 + var_34_24 then
				local var_34_25 = (arg_31_1.time_ - var_34_22) / var_34_24
				local var_34_26 = Mathf.Lerp(arg_31_1.var_.alphaOldValue10030, 1, var_34_25)

				if arg_31_1.var_.characterEffect10030 then
					arg_31_1.var_.characterEffect10030.alpha = var_34_26
				end
			end

			if arg_31_1.time_ >= var_34_22 + var_34_24 and arg_31_1.time_ < var_34_22 + var_34_24 + arg_34_0 and arg_31_1.var_.characterEffect10030 then
				arg_31_1.var_.characterEffect10030.alpha = 1
			end

			local var_34_27 = arg_31_1.actors_["1041_1"]
			local var_34_28 = 0

			if var_34_28 < arg_31_1.time_ and arg_31_1.time_ <= var_34_28 + arg_34_0 then
				local var_34_29 = var_34_27:GetComponent("Image")

				if var_34_29 then
					arg_31_1.var_.highlightMatValue1041_1 = var_34_29
				end
			end

			local var_34_30 = 0.2

			if var_34_28 <= arg_31_1.time_ and arg_31_1.time_ < var_34_28 + var_34_30 then
				local var_34_31 = (arg_31_1.time_ - var_34_28) / var_34_30

				if arg_31_1.var_.highlightMatValue1041_1 then
					local var_34_32 = Mathf.Lerp(0.5, 1, var_34_31)
					local var_34_33 = arg_31_1.var_.highlightMatValue1041_1
					local var_34_34 = var_34_33.color

					var_34_34.r = var_34_32
					var_34_34.g = var_34_32
					var_34_34.b = var_34_32
					var_34_33.color = var_34_34
				end
			end

			if arg_31_1.time_ >= var_34_28 + var_34_30 and arg_31_1.time_ < var_34_28 + var_34_30 + arg_34_0 and arg_31_1.var_.highlightMatValue1041_1 then
				local var_34_35 = 1

				var_34_27.transform:SetSiblingIndex(1)

				local var_34_36 = arg_31_1.var_.highlightMatValue1041_1
				local var_34_37 = var_34_36.color

				var_34_37.r = var_34_35
				var_34_37.g = var_34_35
				var_34_37.b = var_34_35
				var_34_36.color = var_34_37
			end

			local var_34_38 = 0
			local var_34_39 = 0.575

			if var_34_38 < arg_31_1.time_ and arg_31_1.time_ <= var_34_38 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_40 = arg_31_1:FormatText(StoryNameCfg[208].name)

				arg_31_1.leftNameTxt_.text = var_34_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_41 = arg_31_1:GetWordFromCfg(115291008)
				local var_34_42 = arg_31_1:FormatText(var_34_41.content)

				arg_31_1.text_.text = var_34_42

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_43 = 23
				local var_34_44 = utf8.len(var_34_42)
				local var_34_45 = var_34_43 <= 0 and var_34_39 or var_34_39 * (var_34_44 / var_34_43)

				if var_34_45 > 0 and var_34_39 < var_34_45 then
					arg_31_1.talkMaxDuration = var_34_45

					if var_34_45 + var_34_38 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_45 + var_34_38
					end
				end

				arg_31_1.text_.text = var_34_42
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291008", "story_v_out_115291.awb") ~= 0 then
					local var_34_46 = manager.audio:GetVoiceLength("story_v_out_115291", "115291008", "story_v_out_115291.awb") / 1000

					if var_34_46 + var_34_38 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_46 + var_34_38
					end

					if var_34_41.prefab_name ~= "" and arg_31_1.actors_[var_34_41.prefab_name] ~= nil then
						local var_34_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_41.prefab_name].transform, "story_v_out_115291", "115291008", "story_v_out_115291.awb")

						arg_31_1:RecordAudio("115291008", var_34_47)
						arg_31_1:RecordAudio("115291008", var_34_47)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_115291", "115291008", "story_v_out_115291.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_115291", "115291008", "story_v_out_115291.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_48 = math.max(var_34_39, arg_31_1.talkMaxDuration)

			if var_34_38 <= arg_31_1.time_ and arg_31_1.time_ < var_34_38 + var_34_48 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_38) / var_34_48

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_38 + var_34_48 and arg_31_1.time_ < var_34_38 + var_34_48 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play115291009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 115291009
		arg_35_1.duration_ = 10.066

		local var_35_0 = {
			ja = 5.766,
			ko = 6.6,
			zh = 6.733,
			en = 10.066
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
				arg_35_0:Play115291010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.85

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[208].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(115291009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291009", "story_v_out_115291.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291009", "story_v_out_115291.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_115291", "115291009", "story_v_out_115291.awb")

						arg_35_1:RecordAudio("115291009", var_38_9)
						arg_35_1:RecordAudio("115291009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_115291", "115291009", "story_v_out_115291.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_115291", "115291009", "story_v_out_115291.awb")
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
	Play115291010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 115291010
		arg_39_1.duration_ = 5.233

		local var_39_0 = {
			ja = 5.233,
			ko = 3.2,
			zh = 3.266,
			en = 4.666
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
				arg_39_0:Play115291011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10030"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10030 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("10030", 2)

				local var_42_2 = var_42_0.childCount

				for iter_42_0 = 0, var_42_2 - 1 do
					local var_42_3 = var_42_0:GetChild(iter_42_0)

					if var_42_3.name == "split_3" or not string.find(var_42_3.name, "split") then
						var_42_3.gameObject:SetActive(true)
					else
						var_42_3.gameObject:SetActive(false)
					end
				end
			end

			local var_42_4 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_4 then
				local var_42_5 = (arg_39_1.time_ - var_42_1) / var_42_4
				local var_42_6 = Vector3.New(-390, -390, 150)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10030, var_42_6, var_42_5)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_4 and arg_39_1.time_ < var_42_1 + var_42_4 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-390, -390, 150)
			end

			local var_42_7 = arg_39_1.actors_["1041_1"]
			local var_42_8 = 0

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 then
				local var_42_9 = var_42_7:GetComponent("Image")

				if var_42_9 then
					arg_39_1.var_.highlightMatValue1041_1 = var_42_9
				end
			end

			local var_42_10 = 0.2

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_10 then
				local var_42_11 = (arg_39_1.time_ - var_42_8) / var_42_10

				if arg_39_1.var_.highlightMatValue1041_1 then
					local var_42_12 = Mathf.Lerp(1, 0.5, var_42_11)
					local var_42_13 = arg_39_1.var_.highlightMatValue1041_1
					local var_42_14 = var_42_13.color

					var_42_14.r = var_42_12
					var_42_14.g = var_42_12
					var_42_14.b = var_42_12
					var_42_13.color = var_42_14
				end
			end

			if arg_39_1.time_ >= var_42_8 + var_42_10 and arg_39_1.time_ < var_42_8 + var_42_10 + arg_42_0 and arg_39_1.var_.highlightMatValue1041_1 then
				local var_42_15 = 0.5
				local var_42_16 = arg_39_1.var_.highlightMatValue1041_1
				local var_42_17 = var_42_16.color

				var_42_17.r = var_42_15
				var_42_17.g = var_42_15
				var_42_17.b = var_42_15
				var_42_16.color = var_42_17
			end

			local var_42_18 = arg_39_1.actors_["10030"]
			local var_42_19 = 0

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 and arg_39_1.var_.actorSpriteComps10030 == nil then
				arg_39_1.var_.actorSpriteComps10030 = var_42_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_20 = 0.2

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_20 then
				local var_42_21 = (arg_39_1.time_ - var_42_19) / var_42_20

				if arg_39_1.var_.actorSpriteComps10030 then
					for iter_42_1, iter_42_2 in pairs(arg_39_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_42_2 then
							local var_42_22 = Mathf.Lerp(iter_42_2.color.r, 1, var_42_21)

							iter_42_2.color = Color.New(var_42_22, var_42_22, var_42_22)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_19 + var_42_20 and arg_39_1.time_ < var_42_19 + var_42_20 + arg_42_0 and arg_39_1.var_.actorSpriteComps10030 then
				local var_42_23 = 1

				for iter_42_3, iter_42_4 in pairs(arg_39_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_42_4 then
						iter_42_4.color = Color.New(var_42_23, var_42_23, var_42_23)
					end
				end

				arg_39_1.var_.actorSpriteComps10030 = nil
			end

			local var_42_24 = 0
			local var_42_25 = 0.25

			if var_42_24 < arg_39_1.time_ and arg_39_1.time_ <= var_42_24 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_26 = arg_39_1:FormatText(StoryNameCfg[309].name)

				arg_39_1.leftNameTxt_.text = var_42_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_27 = arg_39_1:GetWordFromCfg(115291010)
				local var_42_28 = arg_39_1:FormatText(var_42_27.content)

				arg_39_1.text_.text = var_42_28

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_29 = 10
				local var_42_30 = utf8.len(var_42_28)
				local var_42_31 = var_42_29 <= 0 and var_42_25 or var_42_25 * (var_42_30 / var_42_29)

				if var_42_31 > 0 and var_42_25 < var_42_31 then
					arg_39_1.talkMaxDuration = var_42_31

					if var_42_31 + var_42_24 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_31 + var_42_24
					end
				end

				arg_39_1.text_.text = var_42_28
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291010", "story_v_out_115291.awb") ~= 0 then
					local var_42_32 = manager.audio:GetVoiceLength("story_v_out_115291", "115291010", "story_v_out_115291.awb") / 1000

					if var_42_32 + var_42_24 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_32 + var_42_24
					end

					if var_42_27.prefab_name ~= "" and arg_39_1.actors_[var_42_27.prefab_name] ~= nil then
						local var_42_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_27.prefab_name].transform, "story_v_out_115291", "115291010", "story_v_out_115291.awb")

						arg_39_1:RecordAudio("115291010", var_42_33)
						arg_39_1:RecordAudio("115291010", var_42_33)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_115291", "115291010", "story_v_out_115291.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_115291", "115291010", "story_v_out_115291.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_34 = math.max(var_42_25, arg_39_1.talkMaxDuration)

			if var_42_24 <= arg_39_1.time_ and arg_39_1.time_ < var_42_24 + var_42_34 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_24) / var_42_34

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_24 + var_42_34 and arg_39_1.time_ < var_42_24 + var_42_34 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play115291011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 115291011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play115291012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10030"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps10030 == nil then
				arg_43_1.var_.actorSpriteComps10030 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps10030 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 0.5, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps10030 then
				local var_46_5 = 0.5

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps10030 = nil
			end

			local var_46_6 = 0
			local var_46_7 = 1.25

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

				local var_46_8 = arg_43_1:GetWordFromCfg(115291011)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 50
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
	Play115291012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 115291012
		arg_47_1.duration_ = 14.5

		local var_47_0 = {
			ja = 14.5,
			ko = 13.366,
			zh = 10.166,
			en = 11.1
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
				arg_47_0:Play115291013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1041_1"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1041_1 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1041_1", 4)
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(440, -310, -370)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1041_1, var_50_4, var_50_3)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(440, -310, -370)
			end

			local var_50_5 = arg_47_1.actors_["1041_1"]
			local var_50_6 = 0

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				local var_50_7 = var_50_5:GetComponent("Image")

				if var_50_7 then
					arg_47_1.var_.highlightMatValue1041_1 = var_50_7
				end
			end

			local var_50_8 = 0.2

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_6) / var_50_8

				if arg_47_1.var_.highlightMatValue1041_1 then
					local var_50_10 = Mathf.Lerp(0.5, 1, var_50_9)
					local var_50_11 = arg_47_1.var_.highlightMatValue1041_1
					local var_50_12 = var_50_11.color

					var_50_12.r = var_50_10
					var_50_12.g = var_50_10
					var_50_12.b = var_50_10
					var_50_11.color = var_50_12
				end
			end

			if arg_47_1.time_ >= var_50_6 + var_50_8 and arg_47_1.time_ < var_50_6 + var_50_8 + arg_50_0 and arg_47_1.var_.highlightMatValue1041_1 then
				local var_50_13 = 1

				var_50_5.transform:SetSiblingIndex(1)

				local var_50_14 = arg_47_1.var_.highlightMatValue1041_1
				local var_50_15 = var_50_14.color

				var_50_15.r = var_50_13
				var_50_15.g = var_50_13
				var_50_15.b = var_50_13
				var_50_14.color = var_50_15
			end

			local var_50_16 = 0
			local var_50_17 = 1.2

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_18 = arg_47_1:FormatText(StoryNameCfg[208].name)

				arg_47_1.leftNameTxt_.text = var_50_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_19 = arg_47_1:GetWordFromCfg(115291012)
				local var_50_20 = arg_47_1:FormatText(var_50_19.content)

				arg_47_1.text_.text = var_50_20

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_21 = 48
				local var_50_22 = utf8.len(var_50_20)
				local var_50_23 = var_50_21 <= 0 and var_50_17 or var_50_17 * (var_50_22 / var_50_21)

				if var_50_23 > 0 and var_50_17 < var_50_23 then
					arg_47_1.talkMaxDuration = var_50_23

					if var_50_23 + var_50_16 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_16
					end
				end

				arg_47_1.text_.text = var_50_20
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291012", "story_v_out_115291.awb") ~= 0 then
					local var_50_24 = manager.audio:GetVoiceLength("story_v_out_115291", "115291012", "story_v_out_115291.awb") / 1000

					if var_50_24 + var_50_16 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_24 + var_50_16
					end

					if var_50_19.prefab_name ~= "" and arg_47_1.actors_[var_50_19.prefab_name] ~= nil then
						local var_50_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_19.prefab_name].transform, "story_v_out_115291", "115291012", "story_v_out_115291.awb")

						arg_47_1:RecordAudio("115291012", var_50_25)
						arg_47_1:RecordAudio("115291012", var_50_25)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_115291", "115291012", "story_v_out_115291.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_115291", "115291012", "story_v_out_115291.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_26 = math.max(var_50_17, arg_47_1.talkMaxDuration)

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_26 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_16) / var_50_26

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_16 + var_50_26 and arg_47_1.time_ < var_50_16 + var_50_26 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play115291013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 115291013
		arg_51_1.duration_ = 9.633

		local var_51_0 = {
			ja = 8.5,
			ko = 6.7,
			zh = 7.033,
			en = 9.633
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
				arg_51_0:Play115291014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.85

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[208].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(115291013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291013", "story_v_out_115291.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291013", "story_v_out_115291.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_115291", "115291013", "story_v_out_115291.awb")

						arg_51_1:RecordAudio("115291013", var_54_9)
						arg_51_1:RecordAudio("115291013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_115291", "115291013", "story_v_out_115291.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_115291", "115291013", "story_v_out_115291.awb")
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
	Play115291014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 115291014
		arg_55_1.duration_ = 5.433

		local var_55_0 = {
			ja = 5.433,
			ko = 4.666,
			zh = 3.9,
			en = 4.6
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
				arg_55_0:Play115291015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10030"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10030 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10030", 2)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "split_3" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(-390, -390, 150)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10030, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-390, -390, 150)
			end

			local var_58_7 = arg_55_1.actors_["1041_1"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 then
				local var_58_9 = var_58_7:GetComponent("Image")

				if var_58_9 then
					arg_55_1.var_.highlightMatValue1041_1 = var_58_9
				end
			end

			local var_58_10 = 0.2

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_10 then
				local var_58_11 = (arg_55_1.time_ - var_58_8) / var_58_10

				if arg_55_1.var_.highlightMatValue1041_1 then
					local var_58_12 = Mathf.Lerp(1, 0.5, var_58_11)
					local var_58_13 = arg_55_1.var_.highlightMatValue1041_1
					local var_58_14 = var_58_13.color

					var_58_14.r = var_58_12
					var_58_14.g = var_58_12
					var_58_14.b = var_58_12
					var_58_13.color = var_58_14
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_10 and arg_55_1.time_ < var_58_8 + var_58_10 + arg_58_0 and arg_55_1.var_.highlightMatValue1041_1 then
				local var_58_15 = 0.5
				local var_58_16 = arg_55_1.var_.highlightMatValue1041_1
				local var_58_17 = var_58_16.color

				var_58_17.r = var_58_15
				var_58_17.g = var_58_15
				var_58_17.b = var_58_15
				var_58_16.color = var_58_17
			end

			local var_58_18 = arg_55_1.actors_["10030"]
			local var_58_19 = 0

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 and arg_55_1.var_.actorSpriteComps10030 == nil then
				arg_55_1.var_.actorSpriteComps10030 = var_58_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_20 = 0.2

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_20 then
				local var_58_21 = (arg_55_1.time_ - var_58_19) / var_58_20

				if arg_55_1.var_.actorSpriteComps10030 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_58_2 then
							local var_58_22 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_21)

							iter_58_2.color = Color.New(var_58_22, var_58_22, var_58_22)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_19 + var_58_20 and arg_55_1.time_ < var_58_19 + var_58_20 + arg_58_0 and arg_55_1.var_.actorSpriteComps10030 then
				local var_58_23 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_23, var_58_23, var_58_23)
					end
				end

				arg_55_1.var_.actorSpriteComps10030 = nil
			end

			local var_58_24 = 0
			local var_58_25 = 0.35

			if var_58_24 < arg_55_1.time_ and arg_55_1.time_ <= var_58_24 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_26 = arg_55_1:FormatText(StoryNameCfg[309].name)

				arg_55_1.leftNameTxt_.text = var_58_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_27 = arg_55_1:GetWordFromCfg(115291014)
				local var_58_28 = arg_55_1:FormatText(var_58_27.content)

				arg_55_1.text_.text = var_58_28

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_29 = 14
				local var_58_30 = utf8.len(var_58_28)
				local var_58_31 = var_58_29 <= 0 and var_58_25 or var_58_25 * (var_58_30 / var_58_29)

				if var_58_31 > 0 and var_58_25 < var_58_31 then
					arg_55_1.talkMaxDuration = var_58_31

					if var_58_31 + var_58_24 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_31 + var_58_24
					end
				end

				arg_55_1.text_.text = var_58_28
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291014", "story_v_out_115291.awb") ~= 0 then
					local var_58_32 = manager.audio:GetVoiceLength("story_v_out_115291", "115291014", "story_v_out_115291.awb") / 1000

					if var_58_32 + var_58_24 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_32 + var_58_24
					end

					if var_58_27.prefab_name ~= "" and arg_55_1.actors_[var_58_27.prefab_name] ~= nil then
						local var_58_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_27.prefab_name].transform, "story_v_out_115291", "115291014", "story_v_out_115291.awb")

						arg_55_1:RecordAudio("115291014", var_58_33)
						arg_55_1:RecordAudio("115291014", var_58_33)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_115291", "115291014", "story_v_out_115291.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_115291", "115291014", "story_v_out_115291.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_34 = math.max(var_58_25, arg_55_1.talkMaxDuration)

			if var_58_24 <= arg_55_1.time_ and arg_55_1.time_ < var_58_24 + var_58_34 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_24) / var_58_34

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_24 + var_58_34 and arg_55_1.time_ < var_58_24 + var_58_34 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play115291015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 115291015
		arg_59_1.duration_ = 4.5

		local var_59_0 = {
			ja = 4.333,
			ko = 4.466,
			zh = 4.3,
			en = 4.5
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
				arg_59_0:Play115291016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.4

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[309].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(115291015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 16
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291015", "story_v_out_115291.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291015", "story_v_out_115291.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_115291", "115291015", "story_v_out_115291.awb")

						arg_59_1:RecordAudio("115291015", var_62_9)
						arg_59_1:RecordAudio("115291015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_115291", "115291015", "story_v_out_115291.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_115291", "115291015", "story_v_out_115291.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play115291016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 115291016
		arg_63_1.duration_ = 12.466

		local var_63_0 = {
			ja = 12.2,
			ko = 10.766,
			zh = 10.1,
			en = 12.466
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
				arg_63_0:Play115291017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1041_1"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				local var_66_2 = var_66_0:GetComponent("Image")

				if var_66_2 then
					arg_63_1.var_.highlightMatValue1041_1 = var_66_2
				end
			end

			local var_66_3 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_3 then
				local var_66_4 = (arg_63_1.time_ - var_66_1) / var_66_3

				if arg_63_1.var_.highlightMatValue1041_1 then
					local var_66_5 = Mathf.Lerp(0.5, 1, var_66_4)
					local var_66_6 = arg_63_1.var_.highlightMatValue1041_1
					local var_66_7 = var_66_6.color

					var_66_7.r = var_66_5
					var_66_7.g = var_66_5
					var_66_7.b = var_66_5
					var_66_6.color = var_66_7
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_3 and arg_63_1.time_ < var_66_1 + var_66_3 + arg_66_0 and arg_63_1.var_.highlightMatValue1041_1 then
				local var_66_8 = 1

				var_66_0.transform:SetSiblingIndex(1)

				local var_66_9 = arg_63_1.var_.highlightMatValue1041_1
				local var_66_10 = var_66_9.color

				var_66_10.r = var_66_8
				var_66_10.g = var_66_8
				var_66_10.b = var_66_8
				var_66_9.color = var_66_10
			end

			local var_66_11 = arg_63_1.actors_["10030"]
			local var_66_12 = 0

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 and arg_63_1.var_.actorSpriteComps10030 == nil then
				arg_63_1.var_.actorSpriteComps10030 = var_66_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_13 = 0.2

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_13 then
				local var_66_14 = (arg_63_1.time_ - var_66_12) / var_66_13

				if arg_63_1.var_.actorSpriteComps10030 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_66_1 then
							local var_66_15 = Mathf.Lerp(iter_66_1.color.r, 0.5, var_66_14)

							iter_66_1.color = Color.New(var_66_15, var_66_15, var_66_15)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_12 + var_66_13 and arg_63_1.time_ < var_66_12 + var_66_13 + arg_66_0 and arg_63_1.var_.actorSpriteComps10030 then
				local var_66_16 = 0.5

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_16, var_66_16, var_66_16)
					end
				end

				arg_63_1.var_.actorSpriteComps10030 = nil
			end

			local var_66_17 = 0
			local var_66_18 = 1.15

			if var_66_17 < arg_63_1.time_ and arg_63_1.time_ <= var_66_17 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_19 = arg_63_1:FormatText(StoryNameCfg[208].name)

				arg_63_1.leftNameTxt_.text = var_66_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_20 = arg_63_1:GetWordFromCfg(115291016)
				local var_66_21 = arg_63_1:FormatText(var_66_20.content)

				arg_63_1.text_.text = var_66_21

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_22 = 46
				local var_66_23 = utf8.len(var_66_21)
				local var_66_24 = var_66_22 <= 0 and var_66_18 or var_66_18 * (var_66_23 / var_66_22)

				if var_66_24 > 0 and var_66_18 < var_66_24 then
					arg_63_1.talkMaxDuration = var_66_24

					if var_66_24 + var_66_17 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_24 + var_66_17
					end
				end

				arg_63_1.text_.text = var_66_21
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291016", "story_v_out_115291.awb") ~= 0 then
					local var_66_25 = manager.audio:GetVoiceLength("story_v_out_115291", "115291016", "story_v_out_115291.awb") / 1000

					if var_66_25 + var_66_17 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_25 + var_66_17
					end

					if var_66_20.prefab_name ~= "" and arg_63_1.actors_[var_66_20.prefab_name] ~= nil then
						local var_66_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_20.prefab_name].transform, "story_v_out_115291", "115291016", "story_v_out_115291.awb")

						arg_63_1:RecordAudio("115291016", var_66_26)
						arg_63_1:RecordAudio("115291016", var_66_26)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_115291", "115291016", "story_v_out_115291.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_115291", "115291016", "story_v_out_115291.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_27 = math.max(var_66_18, arg_63_1.talkMaxDuration)

			if var_66_17 <= arg_63_1.time_ and arg_63_1.time_ < var_66_17 + var_66_27 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_17) / var_66_27

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_17 + var_66_27 and arg_63_1.time_ < var_66_17 + var_66_27 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play115291017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 115291017
		arg_67_1.duration_ = 10.733

		local var_67_0 = {
			ja = 10.733,
			ko = 9.9,
			zh = 6.433,
			en = 8.966
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
				arg_67_0:Play115291018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.775

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[208].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(115291017)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 31
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291017", "story_v_out_115291.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291017", "story_v_out_115291.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_115291", "115291017", "story_v_out_115291.awb")

						arg_67_1:RecordAudio("115291017", var_70_9)
						arg_67_1:RecordAudio("115291017", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_115291", "115291017", "story_v_out_115291.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_115291", "115291017", "story_v_out_115291.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play115291018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 115291018
		arg_71_1.duration_ = 11.733

		local var_71_0 = {
			ja = 11.266,
			ko = 9.666,
			zh = 10.166,
			en = 11.733
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
				arg_71_0:Play115291019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.2

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[208].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(115291018)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 48
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291018", "story_v_out_115291.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291018", "story_v_out_115291.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_115291", "115291018", "story_v_out_115291.awb")

						arg_71_1:RecordAudio("115291018", var_74_9)
						arg_71_1:RecordAudio("115291018", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_115291", "115291018", "story_v_out_115291.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_115291", "115291018", "story_v_out_115291.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_10 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_10 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_10

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_10 and arg_71_1.time_ < var_74_0 + var_74_10 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play115291019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 115291019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play115291020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1041_1"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				local var_78_2 = var_78_0:GetComponent("Image")

				if var_78_2 then
					arg_75_1.var_.alphaMatValue1041_1 = var_78_2
					arg_75_1.var_.alphaOldValue1041_1 = var_78_2.color.a
				end

				arg_75_1.var_.alphaOldValue1041_1 = 1
			end

			local var_78_3 = 0.333333333333333

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_3 then
				local var_78_4 = (arg_75_1.time_ - var_78_1) / var_78_3
				local var_78_5 = Mathf.Lerp(arg_75_1.var_.alphaOldValue1041_1, 0, var_78_4)

				if arg_75_1.var_.alphaMatValue1041_1 then
					local var_78_6 = arg_75_1.var_.alphaMatValue1041_1.color

					var_78_6.a = var_78_5
					arg_75_1.var_.alphaMatValue1041_1.color = var_78_6
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_3 and arg_75_1.time_ < var_78_1 + var_78_3 + arg_78_0 and arg_75_1.var_.alphaMatValue1041_1 then
				local var_78_7 = arg_75_1.var_.alphaMatValue1041_1
				local var_78_8 = var_78_7.color

				var_78_8.a = 0
				var_78_7.color = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["10030"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				local var_78_11 = var_78_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_78_11 then
					arg_75_1.var_.alphaOldValue10030 = var_78_11.alpha
					arg_75_1.var_.characterEffect10030 = var_78_11
				end

				arg_75_1.var_.alphaOldValue10030 = 1
			end

			local var_78_12 = 0.333333333333333

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_12 then
				local var_78_13 = (arg_75_1.time_ - var_78_10) / var_78_12
				local var_78_14 = Mathf.Lerp(arg_75_1.var_.alphaOldValue10030, 0, var_78_13)

				if arg_75_1.var_.characterEffect10030 then
					arg_75_1.var_.characterEffect10030.alpha = var_78_14
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_12 and arg_75_1.time_ < var_78_10 + var_78_12 + arg_78_0 and arg_75_1.var_.characterEffect10030 then
				arg_75_1.var_.characterEffect10030.alpha = 0
			end

			local var_78_15 = 0
			local var_78_16 = 1

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_17 = arg_75_1:GetWordFromCfg(115291019)
				local var_78_18 = arg_75_1:FormatText(var_78_17.content)

				arg_75_1.text_.text = var_78_18

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_19 = 40
				local var_78_20 = utf8.len(var_78_18)
				local var_78_21 = var_78_19 <= 0 and var_78_16 or var_78_16 * (var_78_20 / var_78_19)

				if var_78_21 > 0 and var_78_16 < var_78_21 then
					arg_75_1.talkMaxDuration = var_78_21

					if var_78_21 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_21 + var_78_15
					end
				end

				arg_75_1.text_.text = var_78_18
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_22 = math.max(var_78_16, arg_75_1.talkMaxDuration)

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_22 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_15) / var_78_22

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_15 + var_78_22 and arg_75_1.time_ < var_78_15 + var_78_22 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play115291020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 115291020
		arg_79_1.duration_ = 7.1

		local var_79_0 = {
			ja = 7.1,
			ko = 4.366,
			zh = 4.1,
			en = 4
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
				arg_79_0:Play115291021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10030"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos10030 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("10030", 2)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "split_3" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(-390, -390, 150)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10030, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(-390, -390, 150)
			end

			local var_82_7 = arg_79_1.actors_["10030"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps10030 == nil then
				arg_79_1.var_.actorSpriteComps10030 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.2

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps10030 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps10030 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps10030 = nil
			end

			local var_82_13 = arg_79_1.actors_["10030"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				local var_82_15 = var_82_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_82_15 then
					arg_79_1.var_.alphaOldValue10030 = var_82_15.alpha
					arg_79_1.var_.characterEffect10030 = var_82_15
				end

				arg_79_1.var_.alphaOldValue10030 = 0
			end

			local var_82_16 = 0.333333333333333

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_16 then
				local var_82_17 = (arg_79_1.time_ - var_82_14) / var_82_16
				local var_82_18 = Mathf.Lerp(arg_79_1.var_.alphaOldValue10030, 1, var_82_17)

				if arg_79_1.var_.characterEffect10030 then
					arg_79_1.var_.characterEffect10030.alpha = var_82_18
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_16 and arg_79_1.time_ < var_82_14 + var_82_16 + arg_82_0 and arg_79_1.var_.characterEffect10030 then
				arg_79_1.var_.characterEffect10030.alpha = 1
			end

			local var_82_19 = 0
			local var_82_20 = 0.425

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[309].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(115291020)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291020", "story_v_out_115291.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_115291", "115291020", "story_v_out_115291.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_115291", "115291020", "story_v_out_115291.awb")

						arg_79_1:RecordAudio("115291020", var_82_28)
						arg_79_1:RecordAudio("115291020", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_115291", "115291020", "story_v_out_115291.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_115291", "115291020", "story_v_out_115291.awb")
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
	Play115291021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 115291021
		arg_83_1.duration_ = 10.3

		local var_83_0 = {
			ja = 5.766,
			ko = 7.866,
			zh = 9.433,
			en = 10.3
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
				arg_83_0:Play115291022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1041_1"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1041_1 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1041_1", 4)
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(440, -310, -370)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1041_1, var_86_4, var_86_3)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(440, -310, -370)
			end

			local var_86_5 = arg_83_1.actors_["10030"]
			local var_86_6 = 0

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 and arg_83_1.var_.actorSpriteComps10030 == nil then
				arg_83_1.var_.actorSpriteComps10030 = var_86_5:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_7 = 0.2

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_7 then
				local var_86_8 = (arg_83_1.time_ - var_86_6) / var_86_7

				if arg_83_1.var_.actorSpriteComps10030 then
					for iter_86_0, iter_86_1 in pairs(arg_83_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_86_1 then
							local var_86_9 = Mathf.Lerp(iter_86_1.color.r, 0.5, var_86_8)

							iter_86_1.color = Color.New(var_86_9, var_86_9, var_86_9)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_6 + var_86_7 and arg_83_1.time_ < var_86_6 + var_86_7 + arg_86_0 and arg_83_1.var_.actorSpriteComps10030 then
				local var_86_10 = 0.5

				for iter_86_2, iter_86_3 in pairs(arg_83_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_86_3 then
						iter_86_3.color = Color.New(var_86_10, var_86_10, var_86_10)
					end
				end

				arg_83_1.var_.actorSpriteComps10030 = nil
			end

			local var_86_11 = arg_83_1.actors_["1041_1"]
			local var_86_12 = 0

			if var_86_12 < arg_83_1.time_ and arg_83_1.time_ <= var_86_12 + arg_86_0 then
				local var_86_13 = var_86_11:GetComponent("Image")

				if var_86_13 then
					arg_83_1.var_.alphaMatValue1041_1 = var_86_13
					arg_83_1.var_.alphaOldValue1041_1 = var_86_13.color.a
				end

				arg_83_1.var_.alphaOldValue1041_1 = 0
			end

			local var_86_14 = 0.333333333333333

			if var_86_12 <= arg_83_1.time_ and arg_83_1.time_ < var_86_12 + var_86_14 then
				local var_86_15 = (arg_83_1.time_ - var_86_12) / var_86_14
				local var_86_16 = Mathf.Lerp(arg_83_1.var_.alphaOldValue1041_1, 1, var_86_15)

				if arg_83_1.var_.alphaMatValue1041_1 then
					local var_86_17 = arg_83_1.var_.alphaMatValue1041_1.color

					var_86_17.a = var_86_16
					arg_83_1.var_.alphaMatValue1041_1.color = var_86_17
				end
			end

			if arg_83_1.time_ >= var_86_12 + var_86_14 and arg_83_1.time_ < var_86_12 + var_86_14 + arg_86_0 and arg_83_1.var_.alphaMatValue1041_1 then
				local var_86_18 = arg_83_1.var_.alphaMatValue1041_1
				local var_86_19 = var_86_18.color

				var_86_19.a = 1
				var_86_18.color = var_86_19
			end

			local var_86_20 = 0
			local var_86_21 = 1

			if var_86_20 < arg_83_1.time_ and arg_83_1.time_ <= var_86_20 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_22 = arg_83_1:FormatText(StoryNameCfg[208].name)

				arg_83_1.leftNameTxt_.text = var_86_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_23 = arg_83_1:GetWordFromCfg(115291021)
				local var_86_24 = arg_83_1:FormatText(var_86_23.content)

				arg_83_1.text_.text = var_86_24

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_25 = 40
				local var_86_26 = utf8.len(var_86_24)
				local var_86_27 = var_86_25 <= 0 and var_86_21 or var_86_21 * (var_86_26 / var_86_25)

				if var_86_27 > 0 and var_86_21 < var_86_27 then
					arg_83_1.talkMaxDuration = var_86_27

					if var_86_27 + var_86_20 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_27 + var_86_20
					end
				end

				arg_83_1.text_.text = var_86_24
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291021", "story_v_out_115291.awb") ~= 0 then
					local var_86_28 = manager.audio:GetVoiceLength("story_v_out_115291", "115291021", "story_v_out_115291.awb") / 1000

					if var_86_28 + var_86_20 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_28 + var_86_20
					end

					if var_86_23.prefab_name ~= "" and arg_83_1.actors_[var_86_23.prefab_name] ~= nil then
						local var_86_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_23.prefab_name].transform, "story_v_out_115291", "115291021", "story_v_out_115291.awb")

						arg_83_1:RecordAudio("115291021", var_86_29)
						arg_83_1:RecordAudio("115291021", var_86_29)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_115291", "115291021", "story_v_out_115291.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_115291", "115291021", "story_v_out_115291.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_30 = math.max(var_86_21, arg_83_1.talkMaxDuration)

			if var_86_20 <= arg_83_1.time_ and arg_83_1.time_ < var_86_20 + var_86_30 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_20) / var_86_30

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_20 + var_86_30 and arg_83_1.time_ < var_86_20 + var_86_30 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play115291022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 115291022
		arg_87_1.duration_ = 6.133

		local var_87_0 = {
			ja = 5.833,
			ko = 5.2,
			zh = 6.133,
			en = 6.1
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
				arg_87_0:Play115291023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1041_1"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				local var_90_2 = var_90_0:GetComponent("Image")

				if var_90_2 then
					arg_87_1.var_.highlightMatValue1041_1 = var_90_2
				end
			end

			local var_90_3 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_3 then
				local var_90_4 = (arg_87_1.time_ - var_90_1) / var_90_3

				if arg_87_1.var_.highlightMatValue1041_1 then
					local var_90_5 = Mathf.Lerp(1, 0.5, var_90_4)
					local var_90_6 = arg_87_1.var_.highlightMatValue1041_1
					local var_90_7 = var_90_6.color

					var_90_7.r = var_90_5
					var_90_7.g = var_90_5
					var_90_7.b = var_90_5
					var_90_6.color = var_90_7
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_3 and arg_87_1.time_ < var_90_1 + var_90_3 + arg_90_0 and arg_87_1.var_.highlightMatValue1041_1 then
				local var_90_8 = 0.5
				local var_90_9 = arg_87_1.var_.highlightMatValue1041_1
				local var_90_10 = var_90_9.color

				var_90_10.r = var_90_8
				var_90_10.g = var_90_8
				var_90_10.b = var_90_8
				var_90_9.color = var_90_10
			end

			local var_90_11 = arg_87_1.actors_["10030"]
			local var_90_12 = 0

			if var_90_12 < arg_87_1.time_ and arg_87_1.time_ <= var_90_12 + arg_90_0 and arg_87_1.var_.actorSpriteComps10030 == nil then
				arg_87_1.var_.actorSpriteComps10030 = var_90_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_13 = 0.2

			if var_90_12 <= arg_87_1.time_ and arg_87_1.time_ < var_90_12 + var_90_13 then
				local var_90_14 = (arg_87_1.time_ - var_90_12) / var_90_13

				if arg_87_1.var_.actorSpriteComps10030 then
					for iter_90_0, iter_90_1 in pairs(arg_87_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_90_1 then
							local var_90_15 = Mathf.Lerp(iter_90_1.color.r, 1, var_90_14)

							iter_90_1.color = Color.New(var_90_15, var_90_15, var_90_15)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_12 + var_90_13 and arg_87_1.time_ < var_90_12 + var_90_13 + arg_90_0 and arg_87_1.var_.actorSpriteComps10030 then
				local var_90_16 = 1

				for iter_90_2, iter_90_3 in pairs(arg_87_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_90_3 then
						iter_90_3.color = Color.New(var_90_16, var_90_16, var_90_16)
					end
				end

				arg_87_1.var_.actorSpriteComps10030 = nil
			end

			local var_90_17 = 0
			local var_90_18 = 0.65

			if var_90_17 < arg_87_1.time_ and arg_87_1.time_ <= var_90_17 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_19 = arg_87_1:FormatText(StoryNameCfg[309].name)

				arg_87_1.leftNameTxt_.text = var_90_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_20 = arg_87_1:GetWordFromCfg(115291022)
				local var_90_21 = arg_87_1:FormatText(var_90_20.content)

				arg_87_1.text_.text = var_90_21

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_22 = 26
				local var_90_23 = utf8.len(var_90_21)
				local var_90_24 = var_90_22 <= 0 and var_90_18 or var_90_18 * (var_90_23 / var_90_22)

				if var_90_24 > 0 and var_90_18 < var_90_24 then
					arg_87_1.talkMaxDuration = var_90_24

					if var_90_24 + var_90_17 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_24 + var_90_17
					end
				end

				arg_87_1.text_.text = var_90_21
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291022", "story_v_out_115291.awb") ~= 0 then
					local var_90_25 = manager.audio:GetVoiceLength("story_v_out_115291", "115291022", "story_v_out_115291.awb") / 1000

					if var_90_25 + var_90_17 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_25 + var_90_17
					end

					if var_90_20.prefab_name ~= "" and arg_87_1.actors_[var_90_20.prefab_name] ~= nil then
						local var_90_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_20.prefab_name].transform, "story_v_out_115291", "115291022", "story_v_out_115291.awb")

						arg_87_1:RecordAudio("115291022", var_90_26)
						arg_87_1:RecordAudio("115291022", var_90_26)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_115291", "115291022", "story_v_out_115291.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_115291", "115291022", "story_v_out_115291.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_27 = math.max(var_90_18, arg_87_1.talkMaxDuration)

			if var_90_17 <= arg_87_1.time_ and arg_87_1.time_ < var_90_17 + var_90_27 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_17) / var_90_27

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_17 + var_90_27 and arg_87_1.time_ < var_90_17 + var_90_27 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play115291023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 115291023
		arg_91_1.duration_ = 10.9

		local var_91_0 = {
			ja = 6,
			ko = 10.133,
			zh = 8.3,
			en = 10.9
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
				arg_91_0:Play115291024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1041_1"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				local var_94_2 = var_94_0:GetComponent("Image")

				if var_94_2 then
					arg_91_1.var_.highlightMatValue1041_1 = var_94_2
				end
			end

			local var_94_3 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_3 then
				local var_94_4 = (arg_91_1.time_ - var_94_1) / var_94_3

				if arg_91_1.var_.highlightMatValue1041_1 then
					local var_94_5 = Mathf.Lerp(0.5, 1, var_94_4)
					local var_94_6 = arg_91_1.var_.highlightMatValue1041_1
					local var_94_7 = var_94_6.color

					var_94_7.r = var_94_5
					var_94_7.g = var_94_5
					var_94_7.b = var_94_5
					var_94_6.color = var_94_7
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_3 and arg_91_1.time_ < var_94_1 + var_94_3 + arg_94_0 and arg_91_1.var_.highlightMatValue1041_1 then
				local var_94_8 = 1

				var_94_0.transform:SetSiblingIndex(1)

				local var_94_9 = arg_91_1.var_.highlightMatValue1041_1
				local var_94_10 = var_94_9.color

				var_94_10.r = var_94_8
				var_94_10.g = var_94_8
				var_94_10.b = var_94_8
				var_94_9.color = var_94_10
			end

			local var_94_11 = arg_91_1.actors_["10030"]
			local var_94_12 = 0

			if var_94_12 < arg_91_1.time_ and arg_91_1.time_ <= var_94_12 + arg_94_0 and arg_91_1.var_.actorSpriteComps10030 == nil then
				arg_91_1.var_.actorSpriteComps10030 = var_94_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_13 = 0.2

			if var_94_12 <= arg_91_1.time_ and arg_91_1.time_ < var_94_12 + var_94_13 then
				local var_94_14 = (arg_91_1.time_ - var_94_12) / var_94_13

				if arg_91_1.var_.actorSpriteComps10030 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_94_1 then
							local var_94_15 = Mathf.Lerp(iter_94_1.color.r, 0.5, var_94_14)

							iter_94_1.color = Color.New(var_94_15, var_94_15, var_94_15)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_12 + var_94_13 and arg_91_1.time_ < var_94_12 + var_94_13 + arg_94_0 and arg_91_1.var_.actorSpriteComps10030 then
				local var_94_16 = 0.5

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_16, var_94_16, var_94_16)
					end
				end

				arg_91_1.var_.actorSpriteComps10030 = nil
			end

			local var_94_17 = 0
			local var_94_18 = 1.025

			if var_94_17 < arg_91_1.time_ and arg_91_1.time_ <= var_94_17 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_19 = arg_91_1:FormatText(StoryNameCfg[208].name)

				arg_91_1.leftNameTxt_.text = var_94_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_20 = arg_91_1:GetWordFromCfg(115291023)
				local var_94_21 = arg_91_1:FormatText(var_94_20.content)

				arg_91_1.text_.text = var_94_21

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_22 = 41
				local var_94_23 = utf8.len(var_94_21)
				local var_94_24 = var_94_22 <= 0 and var_94_18 or var_94_18 * (var_94_23 / var_94_22)

				if var_94_24 > 0 and var_94_18 < var_94_24 then
					arg_91_1.talkMaxDuration = var_94_24

					if var_94_24 + var_94_17 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_24 + var_94_17
					end
				end

				arg_91_1.text_.text = var_94_21
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291023", "story_v_out_115291.awb") ~= 0 then
					local var_94_25 = manager.audio:GetVoiceLength("story_v_out_115291", "115291023", "story_v_out_115291.awb") / 1000

					if var_94_25 + var_94_17 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_25 + var_94_17
					end

					if var_94_20.prefab_name ~= "" and arg_91_1.actors_[var_94_20.prefab_name] ~= nil then
						local var_94_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_20.prefab_name].transform, "story_v_out_115291", "115291023", "story_v_out_115291.awb")

						arg_91_1:RecordAudio("115291023", var_94_26)
						arg_91_1:RecordAudio("115291023", var_94_26)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_115291", "115291023", "story_v_out_115291.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_115291", "115291023", "story_v_out_115291.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_27 = math.max(var_94_18, arg_91_1.talkMaxDuration)

			if var_94_17 <= arg_91_1.time_ and arg_91_1.time_ < var_94_17 + var_94_27 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_17) / var_94_27

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_17 + var_94_27 and arg_91_1.time_ < var_94_17 + var_94_27 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play115291024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 115291024
		arg_95_1.duration_ = 7.066

		local var_95_0 = {
			ja = 5.8,
			ko = 5.766,
			zh = 5.833,
			en = 7.066
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
				arg_95_0:Play115291025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.75

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[208].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(115291024)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291024", "story_v_out_115291.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291024", "story_v_out_115291.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_115291", "115291024", "story_v_out_115291.awb")

						arg_95_1:RecordAudio("115291024", var_98_9)
						arg_95_1:RecordAudio("115291024", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_115291", "115291024", "story_v_out_115291.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_115291", "115291024", "story_v_out_115291.awb")
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
	Play115291025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 115291025
		arg_99_1.duration_ = 11.5

		local var_99_0 = {
			ja = 9.5,
			ko = 9,
			zh = 7.5,
			en = 11.5
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
				arg_99_0:Play115291026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				local var_102_1 = manager.ui.mainCamera.transform.localPosition
				local var_102_2 = Vector3.New(0, 0, 10) + Vector3.New(var_102_1.x, var_102_1.y, 0)
				local var_102_3 = arg_99_1.bgs_.ST22a

				var_102_3.transform.localPosition = var_102_2
				var_102_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_102_4 = var_102_3:GetComponent("SpriteRenderer")

				if var_102_4 and var_102_4.sprite then
					local var_102_5 = (var_102_3.transform.localPosition - var_102_1).z
					local var_102_6 = manager.ui.mainCameraCom_
					local var_102_7 = 2 * var_102_5 * Mathf.Tan(var_102_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_102_8 = var_102_7 * var_102_6.aspect
					local var_102_9 = var_102_4.sprite.bounds.size.x
					local var_102_10 = var_102_4.sprite.bounds.size.y
					local var_102_11 = var_102_8 / var_102_9
					local var_102_12 = var_102_7 / var_102_10
					local var_102_13 = var_102_12 < var_102_11 and var_102_11 or var_102_12

					var_102_3.transform.localScale = Vector3.New(var_102_13, var_102_13, 0)
				end

				for iter_102_0, iter_102_1 in pairs(arg_99_1.bgs_) do
					if iter_102_0 ~= "ST22a" then
						iter_102_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = false

				arg_99_1:SetGaussion(false)
			end

			local var_102_15 = 2

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_15 then
				local var_102_16 = (arg_99_1.time_ - var_102_14) / var_102_15
				local var_102_17 = Color.New(0, 0, 0)

				var_102_17.a = Mathf.Lerp(0, 1, var_102_16)
				arg_99_1.mask_.color = var_102_17
			end

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 then
				local var_102_18 = Color.New(0, 0, 0)

				var_102_18.a = 1
				arg_99_1.mask_.color = var_102_18
			end

			local var_102_19 = 2

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = false

				arg_99_1:SetGaussion(false)
			end

			local var_102_20 = 2

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_20 then
				local var_102_21 = (arg_99_1.time_ - var_102_19) / var_102_20
				local var_102_22 = Color.New(0, 0, 0)

				var_102_22.a = Mathf.Lerp(1, 0, var_102_21)
				arg_99_1.mask_.color = var_102_22
			end

			if arg_99_1.time_ >= var_102_19 + var_102_20 and arg_99_1.time_ < var_102_19 + var_102_20 + arg_102_0 then
				local var_102_23 = Color.New(0, 0, 0)
				local var_102_24 = 0

				arg_99_1.mask_.enabled = false
				var_102_23.a = var_102_24
				arg_99_1.mask_.color = var_102_23
			end

			local var_102_25 = arg_99_1.actors_["1041_1"].transform
			local var_102_26 = 2

			if var_102_26 < arg_99_1.time_ and arg_99_1.time_ <= var_102_26 + arg_102_0 then
				arg_99_1.var_.moveOldPos1041_1 = var_102_25.localPosition
				var_102_25.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1041_1", 7)
			end

			local var_102_27 = 0.001

			if var_102_26 <= arg_99_1.time_ and arg_99_1.time_ < var_102_26 + var_102_27 then
				local var_102_28 = (arg_99_1.time_ - var_102_26) / var_102_27
				local var_102_29 = Vector3.New(0, -2000, -370)

				var_102_25.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1041_1, var_102_29, var_102_28)
			end

			if arg_99_1.time_ >= var_102_26 + var_102_27 and arg_99_1.time_ < var_102_26 + var_102_27 + arg_102_0 then
				var_102_25.localPosition = Vector3.New(0, -2000, -370)
			end

			local var_102_30 = arg_99_1.actors_["10030"].transform
			local var_102_31 = 2

			if var_102_31 < arg_99_1.time_ and arg_99_1.time_ <= var_102_31 + arg_102_0 then
				arg_99_1.var_.moveOldPos10030 = var_102_30.localPosition
				var_102_30.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("10030", 7)

				local var_102_32 = var_102_30.childCount

				for iter_102_2 = 0, var_102_32 - 1 do
					local var_102_33 = var_102_30:GetChild(iter_102_2)

					if var_102_33.name == "split_3" or not string.find(var_102_33.name, "split") then
						var_102_33.gameObject:SetActive(true)
					else
						var_102_33.gameObject:SetActive(false)
					end
				end
			end

			local var_102_34 = 0.001

			if var_102_31 <= arg_99_1.time_ and arg_99_1.time_ < var_102_31 + var_102_34 then
				local var_102_35 = (arg_99_1.time_ - var_102_31) / var_102_34
				local var_102_36 = Vector3.New(0, -2000, 150)

				var_102_30.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10030, var_102_36, var_102_35)
			end

			if arg_99_1.time_ >= var_102_31 + var_102_34 and arg_99_1.time_ < var_102_31 + var_102_34 + arg_102_0 then
				var_102_30.localPosition = Vector3.New(0, -2000, 150)
			end

			if arg_99_1.frameCnt_ <= 1 then
				arg_99_1.dialog_:SetActive(false)
			end

			local var_102_37 = 4
			local var_102_38 = 0.375

			if var_102_37 < arg_99_1.time_ and arg_99_1.time_ <= var_102_37 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0

				arg_99_1.dialog_:SetActive(true)

				local var_102_39 = LeanTween.value(arg_99_1.dialog_, 0, 1, 0.3)

				var_102_39:setOnUpdate(LuaHelper.FloatAction(function(arg_103_0)
					arg_99_1.dialogCg_.alpha = arg_103_0
				end))
				var_102_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_99_1.dialog_)
					var_102_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_99_1.duration_ = arg_99_1.duration_ + 0.3

				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_40 = arg_99_1:FormatText(StoryNameCfg[311].name)

				arg_99_1.leftNameTxt_.text = var_102_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterm")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_41 = arg_99_1:GetWordFromCfg(115291025)
				local var_102_42 = arg_99_1:FormatText(var_102_41.content)

				arg_99_1.text_.text = var_102_42

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_43 = 15
				local var_102_44 = utf8.len(var_102_42)
				local var_102_45 = var_102_43 <= 0 and var_102_38 or var_102_38 * (var_102_44 / var_102_43)

				if var_102_45 > 0 and var_102_38 < var_102_45 then
					arg_99_1.talkMaxDuration = var_102_45
					var_102_37 = var_102_37 + 0.3

					if var_102_45 + var_102_37 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_45 + var_102_37
					end
				end

				arg_99_1.text_.text = var_102_42
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291025", "story_v_out_115291.awb") ~= 0 then
					local var_102_46 = manager.audio:GetVoiceLength("story_v_out_115291", "115291025", "story_v_out_115291.awb") / 1000

					if var_102_46 + var_102_37 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_46 + var_102_37
					end

					if var_102_41.prefab_name ~= "" and arg_99_1.actors_[var_102_41.prefab_name] ~= nil then
						local var_102_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_41.prefab_name].transform, "story_v_out_115291", "115291025", "story_v_out_115291.awb")

						arg_99_1:RecordAudio("115291025", var_102_47)
						arg_99_1:RecordAudio("115291025", var_102_47)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_115291", "115291025", "story_v_out_115291.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_115291", "115291025", "story_v_out_115291.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_48 = var_102_37 + 0.3
			local var_102_49 = math.max(var_102_38, arg_99_1.talkMaxDuration)

			if var_102_48 <= arg_99_1.time_ and arg_99_1.time_ < var_102_48 + var_102_49 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_48) / var_102_49

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_48 + var_102_49 and arg_99_1.time_ < var_102_48 + var_102_49 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play115291026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 115291026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play115291027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 1

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				local var_108_2 = "play"
				local var_108_3 = "effect"

				arg_105_1:AudioAction(var_108_2, var_108_3, "se_story_activity_1_5_3", "se_story_activity_1_5_3_case", "")
			end

			local var_108_4 = 0
			local var_108_5 = 1.3

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_6 = arg_105_1:GetWordFromCfg(115291026)
				local var_108_7 = arg_105_1:FormatText(var_108_6.content)

				arg_105_1.text_.text = var_108_7

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_8 = 52
				local var_108_9 = utf8.len(var_108_7)
				local var_108_10 = var_108_8 <= 0 and var_108_5 or var_108_5 * (var_108_9 / var_108_8)

				if var_108_10 > 0 and var_108_5 < var_108_10 then
					arg_105_1.talkMaxDuration = var_108_10

					if var_108_10 + var_108_4 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_10 + var_108_4
					end
				end

				arg_105_1.text_.text = var_108_7
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_11 = math.max(var_108_5, arg_105_1.talkMaxDuration)

			if var_108_4 <= arg_105_1.time_ and arg_105_1.time_ < var_108_4 + var_108_11 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_4) / var_108_11

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_4 + var_108_11 and arg_105_1.time_ < var_108_4 + var_108_11 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play115291027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 115291027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play115291028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.45

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

				local var_112_2 = arg_109_1:GetWordFromCfg(115291027)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 58
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
	Play115291028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 115291028
		arg_113_1.duration_ = 3.166

		local var_113_0 = {
			ja = 3.133,
			ko = 2.7,
			zh = 2.633,
			en = 3.166
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
				arg_113_0:Play115291029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10030"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos10030 = var_116_0.localPosition
				var_116_0.localScale = Vector3.New(1, 1, 1)

				arg_113_1:CheckSpriteTmpPos("10030", 3)

				local var_116_2 = var_116_0.childCount

				for iter_116_0 = 0, var_116_2 - 1 do
					local var_116_3 = var_116_0:GetChild(iter_116_0)

					if var_116_3.name == "split_5" or not string.find(var_116_3.name, "split") then
						var_116_3.gameObject:SetActive(true)
					else
						var_116_3.gameObject:SetActive(false)
					end
				end
			end

			local var_116_4 = 0.001

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_4 then
				local var_116_5 = (arg_113_1.time_ - var_116_1) / var_116_4
				local var_116_6 = Vector3.New(0, -390, 150)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10030, var_116_6, var_116_5)
			end

			if arg_113_1.time_ >= var_116_1 + var_116_4 and arg_113_1.time_ < var_116_1 + var_116_4 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_116_7 = arg_113_1.actors_["10030"]
			local var_116_8 = 0

			if var_116_8 < arg_113_1.time_ and arg_113_1.time_ <= var_116_8 + arg_116_0 then
				local var_116_9 = var_116_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_116_9 then
					arg_113_1.var_.alphaOldValue10030 = var_116_9.alpha
					arg_113_1.var_.characterEffect10030 = var_116_9
				end

				arg_113_1.var_.alphaOldValue10030 = 0
			end

			local var_116_10 = 0.333333333333333

			if var_116_8 <= arg_113_1.time_ and arg_113_1.time_ < var_116_8 + var_116_10 then
				local var_116_11 = (arg_113_1.time_ - var_116_8) / var_116_10
				local var_116_12 = Mathf.Lerp(arg_113_1.var_.alphaOldValue10030, 1, var_116_11)

				if arg_113_1.var_.characterEffect10030 then
					arg_113_1.var_.characterEffect10030.alpha = var_116_12
				end
			end

			if arg_113_1.time_ >= var_116_8 + var_116_10 and arg_113_1.time_ < var_116_8 + var_116_10 + arg_116_0 and arg_113_1.var_.characterEffect10030 then
				arg_113_1.var_.characterEffect10030.alpha = 1
			end

			local var_116_13 = 0
			local var_116_14 = 0.275

			if var_116_13 < arg_113_1.time_ and arg_113_1.time_ <= var_116_13 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_15 = arg_113_1:FormatText(StoryNameCfg[309].name)

				arg_113_1.leftNameTxt_.text = var_116_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_16 = arg_113_1:GetWordFromCfg(115291028)
				local var_116_17 = arg_113_1:FormatText(var_116_16.content)

				arg_113_1.text_.text = var_116_17

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_18 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291028", "story_v_out_115291.awb") ~= 0 then
					local var_116_21 = manager.audio:GetVoiceLength("story_v_out_115291", "115291028", "story_v_out_115291.awb") / 1000

					if var_116_21 + var_116_13 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_21 + var_116_13
					end

					if var_116_16.prefab_name ~= "" and arg_113_1.actors_[var_116_16.prefab_name] ~= nil then
						local var_116_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_16.prefab_name].transform, "story_v_out_115291", "115291028", "story_v_out_115291.awb")

						arg_113_1:RecordAudio("115291028", var_116_22)
						arg_113_1:RecordAudio("115291028", var_116_22)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_115291", "115291028", "story_v_out_115291.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_115291", "115291028", "story_v_out_115291.awb")
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
	Play115291029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 115291029
		arg_117_1.duration_ = 5.1

		local var_117_0 = {
			ja = 3.3,
			ko = 5.1,
			zh = 3.933,
			en = 4.633
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
				arg_117_0:Play115291030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10030"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.actorSpriteComps10030 == nil then
				arg_117_1.var_.actorSpriteComps10030 = var_120_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_2 = 0.2

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.actorSpriteComps10030 then
					for iter_120_0, iter_120_1 in pairs(arg_117_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_120_1 then
							local var_120_4 = Mathf.Lerp(iter_120_1.color.r, 0.5, var_120_3)

							iter_120_1.color = Color.New(var_120_4, var_120_4, var_120_4)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.actorSpriteComps10030 then
				local var_120_5 = 0.5

				for iter_120_2, iter_120_3 in pairs(arg_117_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_120_3 then
						iter_120_3.color = Color.New(var_120_5, var_120_5, var_120_5)
					end
				end

				arg_117_1.var_.actorSpriteComps10030 = nil
			end

			local var_120_6 = 0
			local var_120_7 = 0.525

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[316].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_9 = arg_117_1:GetWordFromCfg(115291029)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291029", "story_v_out_115291.awb") ~= 0 then
					local var_120_14 = manager.audio:GetVoiceLength("story_v_out_115291", "115291029", "story_v_out_115291.awb") / 1000

					if var_120_14 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_14 + var_120_6
					end

					if var_120_9.prefab_name ~= "" and arg_117_1.actors_[var_120_9.prefab_name] ~= nil then
						local var_120_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_9.prefab_name].transform, "story_v_out_115291", "115291029", "story_v_out_115291.awb")

						arg_117_1:RecordAudio("115291029", var_120_15)
						arg_117_1:RecordAudio("115291029", var_120_15)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_115291", "115291029", "story_v_out_115291.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_115291", "115291029", "story_v_out_115291.awb")
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
	Play115291030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 115291030
		arg_121_1.duration_ = 11.366

		local var_121_0 = {
			ja = 7.766,
			ko = 6.8,
			zh = 7.633,
			en = 11.366
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
				arg_121_0:Play115291031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 1.075

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[311].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterm")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(115291030)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 43
				local var_124_6 = utf8.len(var_124_4)
				local var_124_7 = var_124_5 <= 0 and var_124_1 or var_124_1 * (var_124_6 / var_124_5)

				if var_124_7 > 0 and var_124_1 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_4
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291030", "story_v_out_115291.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291030", "story_v_out_115291.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_115291", "115291030", "story_v_out_115291.awb")

						arg_121_1:RecordAudio("115291030", var_124_9)
						arg_121_1:RecordAudio("115291030", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_115291", "115291030", "story_v_out_115291.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_115291", "115291030", "story_v_out_115291.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_10 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_10 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_10

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_10 and arg_121_1.time_ < var_124_0 + var_124_10 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play115291031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 115291031
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play115291032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10030"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				local var_128_2 = var_128_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_128_2 then
					arg_125_1.var_.alphaOldValue10030 = var_128_2.alpha
					arg_125_1.var_.characterEffect10030 = var_128_2
				end

				arg_125_1.var_.alphaOldValue10030 = 1
			end

			local var_128_3 = 0.333333333333333

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_3 then
				local var_128_4 = (arg_125_1.time_ - var_128_1) / var_128_3
				local var_128_5 = Mathf.Lerp(arg_125_1.var_.alphaOldValue10030, 0, var_128_4)

				if arg_125_1.var_.characterEffect10030 then
					arg_125_1.var_.characterEffect10030.alpha = var_128_5
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_3 and arg_125_1.time_ < var_128_1 + var_128_3 + arg_128_0 and arg_125_1.var_.characterEffect10030 then
				arg_125_1.var_.characterEffect10030.alpha = 0
			end

			local var_128_6 = 0
			local var_128_7 = 1.275

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_8 = arg_125_1:GetWordFromCfg(115291031)
				local var_128_9 = arg_125_1:FormatText(var_128_8.content)

				arg_125_1.text_.text = var_128_9

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_10 = 51
				local var_128_11 = utf8.len(var_128_9)
				local var_128_12 = var_128_10 <= 0 and var_128_7 or var_128_7 * (var_128_11 / var_128_10)

				if var_128_12 > 0 and var_128_7 < var_128_12 then
					arg_125_1.talkMaxDuration = var_128_12

					if var_128_12 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_12 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_9
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_13 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_13 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_13

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_13 and arg_125_1.time_ < var_128_6 + var_128_13 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play115291032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 115291032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play115291033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.675

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_2 = arg_129_1:GetWordFromCfg(115291032)
				local var_132_3 = arg_129_1:FormatText(var_132_2.content)

				arg_129_1.text_.text = var_132_3

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_4 = 27
				local var_132_5 = utf8.len(var_132_3)
				local var_132_6 = var_132_4 <= 0 and var_132_1 or var_132_1 * (var_132_5 / var_132_4)

				if var_132_6 > 0 and var_132_1 < var_132_6 then
					arg_129_1.talkMaxDuration = var_132_6

					if var_132_6 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_6 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_3
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_7 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_7 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_7

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_7 and arg_129_1.time_ < var_132_0 + var_132_7 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play115291033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 115291033
		arg_133_1.duration_ = 8.733

		local var_133_0 = {
			ja = 8.2,
			ko = 8.733,
			zh = 8.1,
			en = 8.6
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
				arg_133_0:Play115291034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.875

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[314].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwb")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(115291033)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 35
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291033", "story_v_out_115291.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291033", "story_v_out_115291.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_115291", "115291033", "story_v_out_115291.awb")

						arg_133_1:RecordAudio("115291033", var_136_9)
						arg_133_1:RecordAudio("115291033", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_115291", "115291033", "story_v_out_115291.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_115291", "115291033", "story_v_out_115291.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play115291034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 115291034
		arg_137_1.duration_ = 8.2

		local var_137_0 = {
			ja = 4,
			ko = 6.5,
			zh = 5.1,
			en = 8.2
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
				arg_137_0:Play115291035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.725

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[315].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(115291034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 29
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291034", "story_v_out_115291.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291034", "story_v_out_115291.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_115291", "115291034", "story_v_out_115291.awb")

						arg_137_1:RecordAudio("115291034", var_140_9)
						arg_137_1:RecordAudio("115291034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_115291", "115291034", "story_v_out_115291.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_115291", "115291034", "story_v_out_115291.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play115291035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 115291035
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play115291036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.65

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_2 = arg_141_1:GetWordFromCfg(115291035)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 26
				local var_144_5 = utf8.len(var_144_3)
				local var_144_6 = var_144_4 <= 0 and var_144_1 or var_144_1 * (var_144_5 / var_144_4)

				if var_144_6 > 0 and var_144_1 < var_144_6 then
					arg_141_1.talkMaxDuration = var_144_6

					if var_144_6 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_6 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_3
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_7 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_7 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_7

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_7 and arg_141_1.time_ < var_144_0 + var_144_7 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play115291036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 115291036
		arg_145_1.duration_ = 5.133

		local var_145_0 = {
			ja = 5.133,
			ko = 3,
			zh = 2.366,
			en = 3.566
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
				arg_145_0:Play115291037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.25

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[315].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(115291036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291036", "story_v_out_115291.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291036", "story_v_out_115291.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_115291", "115291036", "story_v_out_115291.awb")

						arg_145_1:RecordAudio("115291036", var_148_9)
						arg_145_1:RecordAudio("115291036", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_115291", "115291036", "story_v_out_115291.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_115291", "115291036", "story_v_out_115291.awb")
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
	Play115291037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 115291037
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play115291038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.575

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_2 = arg_149_1:GetWordFromCfg(115291037)
				local var_152_3 = arg_149_1:FormatText(var_152_2.content)

				arg_149_1.text_.text = var_152_3

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_4 = 23
				local var_152_5 = utf8.len(var_152_3)
				local var_152_6 = var_152_4 <= 0 and var_152_1 or var_152_1 * (var_152_5 / var_152_4)

				if var_152_6 > 0 and var_152_1 < var_152_6 then
					arg_149_1.talkMaxDuration = var_152_6

					if var_152_6 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_6 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_3
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_7 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_7 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_7

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_7 and arg_149_1.time_ < var_152_0 + var_152_7 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play115291038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 115291038
		arg_153_1.duration_ = 6.4

		local var_153_0 = {
			ja = 3.966,
			ko = 3.833,
			zh = 4.133,
			en = 6.4
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
				arg_153_0:Play115291039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = "10029"

			if arg_153_1.actors_[var_156_0] == nil then
				local var_156_1 = Object.Instantiate(arg_153_1.imageGo_, arg_153_1.canvasGo_.transform)

				var_156_1.transform:SetSiblingIndex(1)

				var_156_1.name = var_156_0

				local var_156_2 = var_156_1:GetComponent(typeof(Image))

				var_156_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_156_0)

				var_156_2:SetNativeSize()

				var_156_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_153_1.actors_[var_156_0] = var_156_1
			end

			local var_156_3 = arg_153_1.actors_["10029"].transform
			local var_156_4 = 0

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				arg_153_1.var_.moveOldPos10029 = var_156_3.localPosition
				var_156_3.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_156_5 = 0.001

			if var_156_4 <= arg_153_1.time_ and arg_153_1.time_ < var_156_4 + var_156_5 then
				local var_156_6 = (arg_153_1.time_ - var_156_4) / var_156_5
				local var_156_7 = Vector3.New(0, -350, -180)

				var_156_3.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10029, var_156_7, var_156_6)
			end

			if arg_153_1.time_ >= var_156_4 + var_156_5 and arg_153_1.time_ < var_156_4 + var_156_5 + arg_156_0 then
				var_156_3.localPosition = Vector3.New(0, -350, -180)
			end

			local var_156_8 = arg_153_1.actors_["10029"]
			local var_156_9 = 0

			if var_156_9 < arg_153_1.time_ and arg_153_1.time_ <= var_156_9 + arg_156_0 then
				local var_156_10 = var_156_8:GetComponent("Image")

				if var_156_10 then
					arg_153_1.var_.alphaMatValue10029 = var_156_10
					arg_153_1.var_.alphaOldValue10029 = var_156_10.color.a
				end

				arg_153_1.var_.alphaOldValue10029 = 0
			end

			local var_156_11 = 0.333333333333333

			if var_156_9 <= arg_153_1.time_ and arg_153_1.time_ < var_156_9 + var_156_11 then
				local var_156_12 = (arg_153_1.time_ - var_156_9) / var_156_11
				local var_156_13 = Mathf.Lerp(arg_153_1.var_.alphaOldValue10029, 1, var_156_12)

				if arg_153_1.var_.alphaMatValue10029 then
					local var_156_14 = arg_153_1.var_.alphaMatValue10029.color

					var_156_14.a = var_156_13
					arg_153_1.var_.alphaMatValue10029.color = var_156_14
				end
			end

			if arg_153_1.time_ >= var_156_9 + var_156_11 and arg_153_1.time_ < var_156_9 + var_156_11 + arg_156_0 and arg_153_1.var_.alphaMatValue10029 then
				local var_156_15 = arg_153_1.var_.alphaMatValue10029
				local var_156_16 = var_156_15.color

				var_156_16.a = 1
				var_156_15.color = var_156_16
			end

			local var_156_17 = 0
			local var_156_18 = 0.425

			if var_156_17 < arg_153_1.time_ and arg_153_1.time_ <= var_156_17 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_19 = arg_153_1:FormatText(StoryNameCfg[312].name)

				arg_153_1.leftNameTxt_.text = var_156_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_20 = arg_153_1:GetWordFromCfg(115291038)
				local var_156_21 = arg_153_1:FormatText(var_156_20.content)

				arg_153_1.text_.text = var_156_21

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_22 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291038", "story_v_out_115291.awb") ~= 0 then
					local var_156_25 = manager.audio:GetVoiceLength("story_v_out_115291", "115291038", "story_v_out_115291.awb") / 1000

					if var_156_25 + var_156_17 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_25 + var_156_17
					end

					if var_156_20.prefab_name ~= "" and arg_153_1.actors_[var_156_20.prefab_name] ~= nil then
						local var_156_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_20.prefab_name].transform, "story_v_out_115291", "115291038", "story_v_out_115291.awb")

						arg_153_1:RecordAudio("115291038", var_156_26)
						arg_153_1:RecordAudio("115291038", var_156_26)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_115291", "115291038", "story_v_out_115291.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_115291", "115291038", "story_v_out_115291.awb")
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
	Play115291039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 115291039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play115291040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10029"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				local var_160_2 = var_160_0:GetComponent("Image")

				if var_160_2 then
					arg_157_1.var_.alphaMatValue10029 = var_160_2
					arg_157_1.var_.alphaOldValue10029 = var_160_2.color.a
				end

				arg_157_1.var_.alphaOldValue10029 = 1
			end

			local var_160_3 = 0.333333333333333

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_3 then
				local var_160_4 = (arg_157_1.time_ - var_160_1) / var_160_3
				local var_160_5 = Mathf.Lerp(arg_157_1.var_.alphaOldValue10029, 0, var_160_4)

				if arg_157_1.var_.alphaMatValue10029 then
					local var_160_6 = arg_157_1.var_.alphaMatValue10029.color

					var_160_6.a = var_160_5
					arg_157_1.var_.alphaMatValue10029.color = var_160_6
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_3 and arg_157_1.time_ < var_160_1 + var_160_3 + arg_160_0 and arg_157_1.var_.alphaMatValue10029 then
				local var_160_7 = arg_157_1.var_.alphaMatValue10029
				local var_160_8 = var_160_7.color

				var_160_8.a = 0
				var_160_7.color = var_160_8
			end

			local var_160_9 = 0
			local var_160_10 = 1.125

			if var_160_9 < arg_157_1.time_ and arg_157_1.time_ <= var_160_9 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_11 = arg_157_1:GetWordFromCfg(115291039)
				local var_160_12 = arg_157_1:FormatText(var_160_11.content)

				arg_157_1.text_.text = var_160_12

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_13 = 45
				local var_160_14 = utf8.len(var_160_12)
				local var_160_15 = var_160_13 <= 0 and var_160_10 or var_160_10 * (var_160_14 / var_160_13)

				if var_160_15 > 0 and var_160_10 < var_160_15 then
					arg_157_1.talkMaxDuration = var_160_15

					if var_160_15 + var_160_9 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_15 + var_160_9
					end
				end

				arg_157_1.text_.text = var_160_12
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_16 = math.max(var_160_10, arg_157_1.talkMaxDuration)

			if var_160_9 <= arg_157_1.time_ and arg_157_1.time_ < var_160_9 + var_160_16 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_9) / var_160_16

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_9 + var_160_16 and arg_157_1.time_ < var_160_9 + var_160_16 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play115291040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 115291040
		arg_161_1.duration_ = 12.3

		local var_161_0 = {
			ja = 11.666,
			ko = 8.1,
			zh = 11.1,
			en = 12.3
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
				arg_161_0:Play115291041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.825

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[310].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(115291040)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 33
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291040", "story_v_out_115291.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291040", "story_v_out_115291.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_115291", "115291040", "story_v_out_115291.awb")

						arg_161_1:RecordAudio("115291040", var_164_9)
						arg_161_1:RecordAudio("115291040", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_115291", "115291040", "story_v_out_115291.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_115291", "115291040", "story_v_out_115291.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play115291041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 115291041
		arg_165_1.duration_ = 6.033

		local var_165_0 = {
			ja = 6.033,
			ko = 4.666,
			zh = 2.9,
			en = 3
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
				arg_165_0:Play115291042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10029"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				local var_168_2 = var_168_0:GetComponent("Image")

				if var_168_2 then
					arg_165_1.var_.alphaMatValue10029 = var_168_2
					arg_165_1.var_.alphaOldValue10029 = var_168_2.color.a
				end

				arg_165_1.var_.alphaOldValue10029 = 0
			end

			local var_168_3 = 0.333333333333333

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_3 then
				local var_168_4 = (arg_165_1.time_ - var_168_1) / var_168_3
				local var_168_5 = Mathf.Lerp(arg_165_1.var_.alphaOldValue10029, 1, var_168_4)

				if arg_165_1.var_.alphaMatValue10029 then
					local var_168_6 = arg_165_1.var_.alphaMatValue10029.color

					var_168_6.a = var_168_5
					arg_165_1.var_.alphaMatValue10029.color = var_168_6
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_3 and arg_165_1.time_ < var_168_1 + var_168_3 + arg_168_0 and arg_165_1.var_.alphaMatValue10029 then
				local var_168_7 = arg_165_1.var_.alphaMatValue10029
				local var_168_8 = var_168_7.color

				var_168_8.a = 1
				var_168_7.color = var_168_8
			end

			local var_168_9 = 0
			local var_168_10 = 0.25

			if var_168_9 < arg_165_1.time_ and arg_165_1.time_ <= var_168_9 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_11 = arg_165_1:FormatText(StoryNameCfg[312].name)

				arg_165_1.leftNameTxt_.text = var_168_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_12 = arg_165_1:GetWordFromCfg(115291041)
				local var_168_13 = arg_165_1:FormatText(var_168_12.content)

				arg_165_1.text_.text = var_168_13

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_14 = 10
				local var_168_15 = utf8.len(var_168_13)
				local var_168_16 = var_168_14 <= 0 and var_168_10 or var_168_10 * (var_168_15 / var_168_14)

				if var_168_16 > 0 and var_168_10 < var_168_16 then
					arg_165_1.talkMaxDuration = var_168_16

					if var_168_16 + var_168_9 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_16 + var_168_9
					end
				end

				arg_165_1.text_.text = var_168_13
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291041", "story_v_out_115291.awb") ~= 0 then
					local var_168_17 = manager.audio:GetVoiceLength("story_v_out_115291", "115291041", "story_v_out_115291.awb") / 1000

					if var_168_17 + var_168_9 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_17 + var_168_9
					end

					if var_168_12.prefab_name ~= "" and arg_165_1.actors_[var_168_12.prefab_name] ~= nil then
						local var_168_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_12.prefab_name].transform, "story_v_out_115291", "115291041", "story_v_out_115291.awb")

						arg_165_1:RecordAudio("115291041", var_168_18)
						arg_165_1:RecordAudio("115291041", var_168_18)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_115291", "115291041", "story_v_out_115291.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_115291", "115291041", "story_v_out_115291.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_19 = math.max(var_168_10, arg_165_1.talkMaxDuration)

			if var_168_9 <= arg_165_1.time_ and arg_165_1.time_ < var_168_9 + var_168_19 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_9) / var_168_19

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_9 + var_168_19 and arg_165_1.time_ < var_168_9 + var_168_19 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play115291042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 115291042
		arg_169_1.duration_ = 16.3

		local var_169_0 = {
			ja = 16.3,
			ko = 11.3,
			zh = 12.4,
			en = 9.8
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
				arg_169_0:Play115291043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10029"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				local var_172_2 = var_172_0:GetComponent("Image")

				if var_172_2 then
					arg_169_1.var_.highlightMatValue10029 = var_172_2
				end
			end

			local var_172_3 = 0.2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_3 then
				local var_172_4 = (arg_169_1.time_ - var_172_1) / var_172_3

				if arg_169_1.var_.highlightMatValue10029 then
					local var_172_5 = Mathf.Lerp(1, 0.5, var_172_4)
					local var_172_6 = arg_169_1.var_.highlightMatValue10029
					local var_172_7 = var_172_6.color

					var_172_7.r = var_172_5
					var_172_7.g = var_172_5
					var_172_7.b = var_172_5
					var_172_6.color = var_172_7
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_3 and arg_169_1.time_ < var_172_1 + var_172_3 + arg_172_0 and arg_169_1.var_.highlightMatValue10029 then
				local var_172_8 = 0.5
				local var_172_9 = arg_169_1.var_.highlightMatValue10029
				local var_172_10 = var_172_9.color

				var_172_10.r = var_172_8
				var_172_10.g = var_172_8
				var_172_10.b = var_172_8
				var_172_9.color = var_172_10
			end

			local var_172_11 = 0
			local var_172_12 = 0.975

			if var_172_11 < arg_169_1.time_ and arg_169_1.time_ <= var_172_11 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_13 = arg_169_1:FormatText(StoryNameCfg[310].name)

				arg_169_1.leftNameTxt_.text = var_172_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, true)
				arg_169_1.iconController_:SetSelectedState("hero")

				arg_169_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_14 = arg_169_1:GetWordFromCfg(115291042)
				local var_172_15 = arg_169_1:FormatText(var_172_14.content)

				arg_169_1.text_.text = var_172_15

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_16 = 37
				local var_172_17 = utf8.len(var_172_15)
				local var_172_18 = var_172_16 <= 0 and var_172_12 or var_172_12 * (var_172_17 / var_172_16)

				if var_172_18 > 0 and var_172_12 < var_172_18 then
					arg_169_1.talkMaxDuration = var_172_18

					if var_172_18 + var_172_11 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_18 + var_172_11
					end
				end

				arg_169_1.text_.text = var_172_15
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291042", "story_v_out_115291.awb") ~= 0 then
					local var_172_19 = manager.audio:GetVoiceLength("story_v_out_115291", "115291042", "story_v_out_115291.awb") / 1000

					if var_172_19 + var_172_11 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_19 + var_172_11
					end

					if var_172_14.prefab_name ~= "" and arg_169_1.actors_[var_172_14.prefab_name] ~= nil then
						local var_172_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_14.prefab_name].transform, "story_v_out_115291", "115291042", "story_v_out_115291.awb")

						arg_169_1:RecordAudio("115291042", var_172_20)
						arg_169_1:RecordAudio("115291042", var_172_20)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_115291", "115291042", "story_v_out_115291.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_115291", "115291042", "story_v_out_115291.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_21 = math.max(var_172_12, arg_169_1.talkMaxDuration)

			if var_172_11 <= arg_169_1.time_ and arg_169_1.time_ < var_172_11 + var_172_21 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_11) / var_172_21

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_11 + var_172_21 and arg_169_1.time_ < var_172_11 + var_172_21 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play115291043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 115291043
		arg_173_1.duration_ = 9.533

		local var_173_0 = {
			ja = 5.766,
			ko = 9.133,
			zh = 8,
			en = 9.533
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play115291044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10029"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				local var_176_2 = var_176_0:GetComponent("Image")

				if var_176_2 then
					arg_173_1.var_.highlightMatValue10029 = var_176_2
				end
			end

			local var_176_3 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_3 then
				local var_176_4 = (arg_173_1.time_ - var_176_1) / var_176_3

				if arg_173_1.var_.highlightMatValue10029 then
					local var_176_5 = Mathf.Lerp(0.5, 1, var_176_4)
					local var_176_6 = arg_173_1.var_.highlightMatValue10029
					local var_176_7 = var_176_6.color

					var_176_7.r = var_176_5
					var_176_7.g = var_176_5
					var_176_7.b = var_176_5
					var_176_6.color = var_176_7
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_3 and arg_173_1.time_ < var_176_1 + var_176_3 + arg_176_0 and arg_173_1.var_.highlightMatValue10029 then
				local var_176_8 = 1

				var_176_0.transform:SetSiblingIndex(1)

				local var_176_9 = arg_173_1.var_.highlightMatValue10029
				local var_176_10 = var_176_9.color

				var_176_10.r = var_176_8
				var_176_10.g = var_176_8
				var_176_10.b = var_176_8
				var_176_9.color = var_176_10
			end

			local var_176_11 = 0
			local var_176_12 = 0.7

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_13 = arg_173_1:FormatText(StoryNameCfg[312].name)

				arg_173_1.leftNameTxt_.text = var_176_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_14 = arg_173_1:GetWordFromCfg(115291043)
				local var_176_15 = arg_173_1:FormatText(var_176_14.content)

				arg_173_1.text_.text = var_176_15

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_16 = 28
				local var_176_17 = utf8.len(var_176_15)
				local var_176_18 = var_176_16 <= 0 and var_176_12 or var_176_12 * (var_176_17 / var_176_16)

				if var_176_18 > 0 and var_176_12 < var_176_18 then
					arg_173_1.talkMaxDuration = var_176_18

					if var_176_18 + var_176_11 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_18 + var_176_11
					end
				end

				arg_173_1.text_.text = var_176_15
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291043", "story_v_out_115291.awb") ~= 0 then
					local var_176_19 = manager.audio:GetVoiceLength("story_v_out_115291", "115291043", "story_v_out_115291.awb") / 1000

					if var_176_19 + var_176_11 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_11
					end

					if var_176_14.prefab_name ~= "" and arg_173_1.actors_[var_176_14.prefab_name] ~= nil then
						local var_176_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_14.prefab_name].transform, "story_v_out_115291", "115291043", "story_v_out_115291.awb")

						arg_173_1:RecordAudio("115291043", var_176_20)
						arg_173_1:RecordAudio("115291043", var_176_20)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_115291", "115291043", "story_v_out_115291.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_115291", "115291043", "story_v_out_115291.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_21 = math.max(var_176_12, arg_173_1.talkMaxDuration)

			if var_176_11 <= arg_173_1.time_ and arg_173_1.time_ < var_176_11 + var_176_21 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_11) / var_176_21

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_11 + var_176_21 and arg_173_1.time_ < var_176_11 + var_176_21 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play115291044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 115291044
		arg_177_1.duration_ = 5.666

		local var_177_0 = {
			ja = 5.633,
			ko = 3.466,
			zh = 4.9,
			en = 5.666
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
				arg_177_0:Play115291045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["10029"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				local var_180_2 = var_180_0:GetComponent("Image")

				if var_180_2 then
					arg_177_1.var_.highlightMatValue10029 = var_180_2
				end
			end

			local var_180_3 = 0.2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_3 then
				local var_180_4 = (arg_177_1.time_ - var_180_1) / var_180_3

				if arg_177_1.var_.highlightMatValue10029 then
					local var_180_5 = Mathf.Lerp(1, 0.5, var_180_4)
					local var_180_6 = arg_177_1.var_.highlightMatValue10029
					local var_180_7 = var_180_6.color

					var_180_7.r = var_180_5
					var_180_7.g = var_180_5
					var_180_7.b = var_180_5
					var_180_6.color = var_180_7
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_3 and arg_177_1.time_ < var_180_1 + var_180_3 + arg_180_0 and arg_177_1.var_.highlightMatValue10029 then
				local var_180_8 = 0.5
				local var_180_9 = arg_177_1.var_.highlightMatValue10029
				local var_180_10 = var_180_9.color

				var_180_10.r = var_180_8
				var_180_10.g = var_180_8
				var_180_10.b = var_180_8
				var_180_9.color = var_180_10
			end

			local var_180_11 = 0
			local var_180_12 = 0.45

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_13 = arg_177_1:FormatText(StoryNameCfg[310].name)

				arg_177_1.leftNameTxt_.text = var_180_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_14 = arg_177_1:GetWordFromCfg(115291044)
				local var_180_15 = arg_177_1:FormatText(var_180_14.content)

				arg_177_1.text_.text = var_180_15

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_16 = 18
				local var_180_17 = utf8.len(var_180_15)
				local var_180_18 = var_180_16 <= 0 and var_180_12 or var_180_12 * (var_180_17 / var_180_16)

				if var_180_18 > 0 and var_180_12 < var_180_18 then
					arg_177_1.talkMaxDuration = var_180_18

					if var_180_18 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_18 + var_180_11
					end
				end

				arg_177_1.text_.text = var_180_15
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291044", "story_v_out_115291.awb") ~= 0 then
					local var_180_19 = manager.audio:GetVoiceLength("story_v_out_115291", "115291044", "story_v_out_115291.awb") / 1000

					if var_180_19 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_11
					end

					if var_180_14.prefab_name ~= "" and arg_177_1.actors_[var_180_14.prefab_name] ~= nil then
						local var_180_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_14.prefab_name].transform, "story_v_out_115291", "115291044", "story_v_out_115291.awb")

						arg_177_1:RecordAudio("115291044", var_180_20)
						arg_177_1:RecordAudio("115291044", var_180_20)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_115291", "115291044", "story_v_out_115291.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_115291", "115291044", "story_v_out_115291.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_21 = math.max(var_180_12, arg_177_1.talkMaxDuration)

			if var_180_11 <= arg_177_1.time_ and arg_177_1.time_ < var_180_11 + var_180_21 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_11) / var_180_21

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_11 + var_180_21 and arg_177_1.time_ < var_180_11 + var_180_21 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play115291045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 115291045
		arg_181_1.duration_ = 11.066

		local var_181_0 = {
			ja = 5.6,
			ko = 8.366,
			zh = 7.766,
			en = 11.066
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
				arg_181_0:Play115291046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["10029"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				local var_184_2 = var_184_0:GetComponent("Image")

				if var_184_2 then
					arg_181_1.var_.highlightMatValue10029 = var_184_2
				end
			end

			local var_184_3 = 0.2

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_3 then
				local var_184_4 = (arg_181_1.time_ - var_184_1) / var_184_3

				if arg_181_1.var_.highlightMatValue10029 then
					local var_184_5 = Mathf.Lerp(0.5, 1, var_184_4)
					local var_184_6 = arg_181_1.var_.highlightMatValue10029
					local var_184_7 = var_184_6.color

					var_184_7.r = var_184_5
					var_184_7.g = var_184_5
					var_184_7.b = var_184_5
					var_184_6.color = var_184_7
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_3 and arg_181_1.time_ < var_184_1 + var_184_3 + arg_184_0 and arg_181_1.var_.highlightMatValue10029 then
				local var_184_8 = 1

				var_184_0.transform:SetSiblingIndex(1)

				local var_184_9 = arg_181_1.var_.highlightMatValue10029
				local var_184_10 = var_184_9.color

				var_184_10.r = var_184_8
				var_184_10.g = var_184_8
				var_184_10.b = var_184_8
				var_184_9.color = var_184_10
			end

			local var_184_11 = 0
			local var_184_12 = 0.875

			if var_184_11 < arg_181_1.time_ and arg_181_1.time_ <= var_184_11 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_13 = arg_181_1:FormatText(StoryNameCfg[312].name)

				arg_181_1.leftNameTxt_.text = var_184_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_14 = arg_181_1:GetWordFromCfg(115291045)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 32
				local var_184_17 = utf8.len(var_184_15)
				local var_184_18 = var_184_16 <= 0 and var_184_12 or var_184_12 * (var_184_17 / var_184_16)

				if var_184_18 > 0 and var_184_12 < var_184_18 then
					arg_181_1.talkMaxDuration = var_184_18

					if var_184_18 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_11
					end
				end

				arg_181_1.text_.text = var_184_15
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291045", "story_v_out_115291.awb") ~= 0 then
					local var_184_19 = manager.audio:GetVoiceLength("story_v_out_115291", "115291045", "story_v_out_115291.awb") / 1000

					if var_184_19 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_11
					end

					if var_184_14.prefab_name ~= "" and arg_181_1.actors_[var_184_14.prefab_name] ~= nil then
						local var_184_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_14.prefab_name].transform, "story_v_out_115291", "115291045", "story_v_out_115291.awb")

						arg_181_1:RecordAudio("115291045", var_184_20)
						arg_181_1:RecordAudio("115291045", var_184_20)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_115291", "115291045", "story_v_out_115291.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_115291", "115291045", "story_v_out_115291.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_21 = math.max(var_184_12, arg_181_1.talkMaxDuration)

			if var_184_11 <= arg_181_1.time_ and arg_181_1.time_ < var_184_11 + var_184_21 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_11) / var_184_21

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_11 + var_184_21 and arg_181_1.time_ < var_184_11 + var_184_21 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play115291046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 115291046
		arg_185_1.duration_ = 7.3

		local var_185_0 = {
			ja = 7.066,
			ko = 3.033,
			zh = 5.933,
			en = 7.3
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
				arg_185_0:Play115291047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["10029"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				local var_188_2 = var_188_0:GetComponent("Image")

				if var_188_2 then
					arg_185_1.var_.highlightMatValue10029 = var_188_2
				end
			end

			local var_188_3 = 0.2

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_3 then
				local var_188_4 = (arg_185_1.time_ - var_188_1) / var_188_3

				if arg_185_1.var_.highlightMatValue10029 then
					local var_188_5 = Mathf.Lerp(1, 0.5, var_188_4)
					local var_188_6 = arg_185_1.var_.highlightMatValue10029
					local var_188_7 = var_188_6.color

					var_188_7.r = var_188_5
					var_188_7.g = var_188_5
					var_188_7.b = var_188_5
					var_188_6.color = var_188_7
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_3 and arg_185_1.time_ < var_188_1 + var_188_3 + arg_188_0 and arg_185_1.var_.highlightMatValue10029 then
				local var_188_8 = 0.5
				local var_188_9 = arg_185_1.var_.highlightMatValue10029
				local var_188_10 = var_188_9.color

				var_188_10.r = var_188_8
				var_188_10.g = var_188_8
				var_188_10.b = var_188_8
				var_188_9.color = var_188_10
			end

			local var_188_11 = 0
			local var_188_12 = 0.375

			if var_188_11 < arg_185_1.time_ and arg_185_1.time_ <= var_188_11 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_13 = arg_185_1:FormatText(StoryNameCfg[310].name)

				arg_185_1.leftNameTxt_.text = var_188_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, true)
				arg_185_1.iconController_:SetSelectedState("hero")

				arg_185_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_14 = arg_185_1:GetWordFromCfg(115291046)
				local var_188_15 = arg_185_1:FormatText(var_188_14.content)

				arg_185_1.text_.text = var_188_15

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_16 = 15
				local var_188_17 = utf8.len(var_188_15)
				local var_188_18 = var_188_16 <= 0 and var_188_12 or var_188_12 * (var_188_17 / var_188_16)

				if var_188_18 > 0 and var_188_12 < var_188_18 then
					arg_185_1.talkMaxDuration = var_188_18

					if var_188_18 + var_188_11 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_18 + var_188_11
					end
				end

				arg_185_1.text_.text = var_188_15
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291046", "story_v_out_115291.awb") ~= 0 then
					local var_188_19 = manager.audio:GetVoiceLength("story_v_out_115291", "115291046", "story_v_out_115291.awb") / 1000

					if var_188_19 + var_188_11 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_19 + var_188_11
					end

					if var_188_14.prefab_name ~= "" and arg_185_1.actors_[var_188_14.prefab_name] ~= nil then
						local var_188_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_14.prefab_name].transform, "story_v_out_115291", "115291046", "story_v_out_115291.awb")

						arg_185_1:RecordAudio("115291046", var_188_20)
						arg_185_1:RecordAudio("115291046", var_188_20)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_115291", "115291046", "story_v_out_115291.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_115291", "115291046", "story_v_out_115291.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_21 = math.max(var_188_12, arg_185_1.talkMaxDuration)

			if var_188_11 <= arg_185_1.time_ and arg_185_1.time_ < var_188_11 + var_188_21 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_11) / var_188_21

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_11 + var_188_21 and arg_185_1.time_ < var_188_11 + var_188_21 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play115291047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 115291047
		arg_189_1.duration_ = 14.366

		local var_189_0 = {
			ja = 14.366,
			ko = 5.633,
			zh = 6.133,
			en = 6.2
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play115291048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.45

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[310].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, true)
				arg_189_1.iconController_:SetSelectedState("hero")

				arg_189_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(115291047)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 18
				local var_192_6 = utf8.len(var_192_4)
				local var_192_7 = var_192_5 <= 0 and var_192_1 or var_192_1 * (var_192_6 / var_192_5)

				if var_192_7 > 0 and var_192_1 < var_192_7 then
					arg_189_1.talkMaxDuration = var_192_7

					if var_192_7 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_7 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_4
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291047", "story_v_out_115291.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291047", "story_v_out_115291.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_115291", "115291047", "story_v_out_115291.awb")

						arg_189_1:RecordAudio("115291047", var_192_9)
						arg_189_1:RecordAudio("115291047", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_115291", "115291047", "story_v_out_115291.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_115291", "115291047", "story_v_out_115291.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_10 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_10 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_10

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_10 and arg_189_1.time_ < var_192_0 + var_192_10 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play115291048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 115291048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play115291049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10029"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				local var_196_2 = var_196_0:GetComponent("Image")

				if var_196_2 then
					arg_193_1.var_.alphaMatValue10029 = var_196_2
					arg_193_1.var_.alphaOldValue10029 = var_196_2.color.a
				end

				arg_193_1.var_.alphaOldValue10029 = 1
			end

			local var_196_3 = 0.333333333333333

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_3 then
				local var_196_4 = (arg_193_1.time_ - var_196_1) / var_196_3
				local var_196_5 = Mathf.Lerp(arg_193_1.var_.alphaOldValue10029, 0, var_196_4)

				if arg_193_1.var_.alphaMatValue10029 then
					local var_196_6 = arg_193_1.var_.alphaMatValue10029.color

					var_196_6.a = var_196_5
					arg_193_1.var_.alphaMatValue10029.color = var_196_6
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_3 and arg_193_1.time_ < var_196_1 + var_196_3 + arg_196_0 and arg_193_1.var_.alphaMatValue10029 then
				local var_196_7 = arg_193_1.var_.alphaMatValue10029
				local var_196_8 = var_196_7.color

				var_196_8.a = 0
				var_196_7.color = var_196_8
			end

			local var_196_9 = 0
			local var_196_10 = 0.925

			if var_196_9 < arg_193_1.time_ and arg_193_1.time_ <= var_196_9 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_11 = arg_193_1:GetWordFromCfg(115291048)
				local var_196_12 = arg_193_1:FormatText(var_196_11.content)

				arg_193_1.text_.text = var_196_12

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_13 = 37
				local var_196_14 = utf8.len(var_196_12)
				local var_196_15 = var_196_13 <= 0 and var_196_10 or var_196_10 * (var_196_14 / var_196_13)

				if var_196_15 > 0 and var_196_10 < var_196_15 then
					arg_193_1.talkMaxDuration = var_196_15

					if var_196_15 + var_196_9 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_15 + var_196_9
					end
				end

				arg_193_1.text_.text = var_196_12
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_16 = math.max(var_196_10, arg_193_1.talkMaxDuration)

			if var_196_9 <= arg_193_1.time_ and arg_193_1.time_ < var_196_9 + var_196_16 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_9) / var_196_16

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_9 + var_196_16 and arg_193_1.time_ < var_196_9 + var_196_16 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play115291049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 115291049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play115291050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 1.075

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_2 = arg_197_1:GetWordFromCfg(115291049)
				local var_200_3 = arg_197_1:FormatText(var_200_2.content)

				arg_197_1.text_.text = var_200_3

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_4 = 43
				local var_200_5 = utf8.len(var_200_3)
				local var_200_6 = var_200_4 <= 0 and var_200_1 or var_200_1 * (var_200_5 / var_200_4)

				if var_200_6 > 0 and var_200_1 < var_200_6 then
					arg_197_1.talkMaxDuration = var_200_6

					if var_200_6 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_6 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_3
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_7 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_7 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_7

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_7 and arg_197_1.time_ < var_200_0 + var_200_7 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play115291050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 115291050
		arg_201_1.duration_ = 2.233

		local var_201_0 = {
			ja = 2,
			ko = 2.233,
			zh = 2.166,
			en = 1.8
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play115291051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10029"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos10029 = var_204_0.localPosition
				var_204_0.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(-390, -350, -180)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10029, var_204_4, var_204_3)
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_204_5 = arg_201_1.actors_["10029"]
			local var_204_6 = 0

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				local var_204_7 = var_204_5:GetComponent("Image")

				if var_204_7 then
					arg_201_1.var_.highlightMatValue10029 = var_204_7
				end
			end

			local var_204_8 = 0.2

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_8 then
				local var_204_9 = (arg_201_1.time_ - var_204_6) / var_204_8

				if arg_201_1.var_.highlightMatValue10029 then
					local var_204_10 = Mathf.Lerp(0.5, 1, var_204_9)
					local var_204_11 = arg_201_1.var_.highlightMatValue10029
					local var_204_12 = var_204_11.color

					var_204_12.r = var_204_10
					var_204_12.g = var_204_10
					var_204_12.b = var_204_10
					var_204_11.color = var_204_12
				end
			end

			if arg_201_1.time_ >= var_204_6 + var_204_8 and arg_201_1.time_ < var_204_6 + var_204_8 + arg_204_0 and arg_201_1.var_.highlightMatValue10029 then
				local var_204_13 = 1

				var_204_5.transform:SetSiblingIndex(1)

				local var_204_14 = arg_201_1.var_.highlightMatValue10029
				local var_204_15 = var_204_14.color

				var_204_15.r = var_204_13
				var_204_15.g = var_204_13
				var_204_15.b = var_204_13
				var_204_14.color = var_204_15
			end

			local var_204_16 = arg_201_1.actors_["10029"]
			local var_204_17 = 0

			if var_204_17 < arg_201_1.time_ and arg_201_1.time_ <= var_204_17 + arg_204_0 then
				local var_204_18 = var_204_16:GetComponent("Image")

				if var_204_18 then
					arg_201_1.var_.alphaMatValue10029 = var_204_18
					arg_201_1.var_.alphaOldValue10029 = var_204_18.color.a
				end

				arg_201_1.var_.alphaOldValue10029 = 0
			end

			local var_204_19 = 0.333333333333333

			if var_204_17 <= arg_201_1.time_ and arg_201_1.time_ < var_204_17 + var_204_19 then
				local var_204_20 = (arg_201_1.time_ - var_204_17) / var_204_19
				local var_204_21 = Mathf.Lerp(arg_201_1.var_.alphaOldValue10029, 1, var_204_20)

				if arg_201_1.var_.alphaMatValue10029 then
					local var_204_22 = arg_201_1.var_.alphaMatValue10029.color

					var_204_22.a = var_204_21
					arg_201_1.var_.alphaMatValue10029.color = var_204_22
				end
			end

			if arg_201_1.time_ >= var_204_17 + var_204_19 and arg_201_1.time_ < var_204_17 + var_204_19 + arg_204_0 and arg_201_1.var_.alphaMatValue10029 then
				local var_204_23 = arg_201_1.var_.alphaMatValue10029
				local var_204_24 = var_204_23.color

				var_204_24.a = 1
				var_204_23.color = var_204_24
			end

			local var_204_25 = 0
			local var_204_26 = 0.225

			if var_204_25 < arg_201_1.time_ and arg_201_1.time_ <= var_204_25 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_27 = arg_201_1:FormatText(StoryNameCfg[312].name)

				arg_201_1.leftNameTxt_.text = var_204_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_28 = arg_201_1:GetWordFromCfg(115291050)
				local var_204_29 = arg_201_1:FormatText(var_204_28.content)

				arg_201_1.text_.text = var_204_29

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_30 = 9
				local var_204_31 = utf8.len(var_204_29)
				local var_204_32 = var_204_30 <= 0 and var_204_26 or var_204_26 * (var_204_31 / var_204_30)

				if var_204_32 > 0 and var_204_26 < var_204_32 then
					arg_201_1.talkMaxDuration = var_204_32

					if var_204_32 + var_204_25 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_32 + var_204_25
					end
				end

				arg_201_1.text_.text = var_204_29
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291050", "story_v_out_115291.awb") ~= 0 then
					local var_204_33 = manager.audio:GetVoiceLength("story_v_out_115291", "115291050", "story_v_out_115291.awb") / 1000

					if var_204_33 + var_204_25 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_33 + var_204_25
					end

					if var_204_28.prefab_name ~= "" and arg_201_1.actors_[var_204_28.prefab_name] ~= nil then
						local var_204_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_28.prefab_name].transform, "story_v_out_115291", "115291050", "story_v_out_115291.awb")

						arg_201_1:RecordAudio("115291050", var_204_34)
						arg_201_1:RecordAudio("115291050", var_204_34)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_115291", "115291050", "story_v_out_115291.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_115291", "115291050", "story_v_out_115291.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_35 = math.max(var_204_26, arg_201_1.talkMaxDuration)

			if var_204_25 <= arg_201_1.time_ and arg_201_1.time_ < var_204_25 + var_204_35 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_25) / var_204_35

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_25 + var_204_35 and arg_201_1.time_ < var_204_25 + var_204_35 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play115291051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 115291051
		arg_205_1.duration_ = 4.733

		local var_205_0 = {
			ja = 3.7,
			ko = 4.733,
			zh = 3.833,
			en = 3.566
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
				arg_205_0:Play115291052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10030"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos10030 = var_208_0.localPosition
				var_208_0.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("10030", 4)

				local var_208_2 = var_208_0.childCount

				for iter_208_0 = 0, var_208_2 - 1 do
					local var_208_3 = var_208_0:GetChild(iter_208_0)

					if var_208_3.name == "split_3" or not string.find(var_208_3.name, "split") then
						var_208_3.gameObject:SetActive(true)
					else
						var_208_3.gameObject:SetActive(false)
					end
				end
			end

			local var_208_4 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_4 then
				local var_208_5 = (arg_205_1.time_ - var_208_1) / var_208_4
				local var_208_6 = Vector3.New(390, -390, 150)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10030, var_208_6, var_208_5)
			end

			if arg_205_1.time_ >= var_208_1 + var_208_4 and arg_205_1.time_ < var_208_1 + var_208_4 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_208_7 = arg_205_1.actors_["10029"]
			local var_208_8 = 0

			if var_208_8 < arg_205_1.time_ and arg_205_1.time_ <= var_208_8 + arg_208_0 then
				local var_208_9 = var_208_7:GetComponent("Image")

				if var_208_9 then
					arg_205_1.var_.highlightMatValue10029 = var_208_9
				end
			end

			local var_208_10 = 0.2

			if var_208_8 <= arg_205_1.time_ and arg_205_1.time_ < var_208_8 + var_208_10 then
				local var_208_11 = (arg_205_1.time_ - var_208_8) / var_208_10

				if arg_205_1.var_.highlightMatValue10029 then
					local var_208_12 = Mathf.Lerp(1, 0.5, var_208_11)
					local var_208_13 = arg_205_1.var_.highlightMatValue10029
					local var_208_14 = var_208_13.color

					var_208_14.r = var_208_12
					var_208_14.g = var_208_12
					var_208_14.b = var_208_12
					var_208_13.color = var_208_14
				end
			end

			if arg_205_1.time_ >= var_208_8 + var_208_10 and arg_205_1.time_ < var_208_8 + var_208_10 + arg_208_0 and arg_205_1.var_.highlightMatValue10029 then
				local var_208_15 = 0.5
				local var_208_16 = arg_205_1.var_.highlightMatValue10029
				local var_208_17 = var_208_16.color

				var_208_17.r = var_208_15
				var_208_17.g = var_208_15
				var_208_17.b = var_208_15
				var_208_16.color = var_208_17
			end

			local var_208_18 = arg_205_1.actors_["10030"]
			local var_208_19 = 0

			if var_208_19 < arg_205_1.time_ and arg_205_1.time_ <= var_208_19 + arg_208_0 and arg_205_1.var_.actorSpriteComps10030 == nil then
				arg_205_1.var_.actorSpriteComps10030 = var_208_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_20 = 0.2

			if var_208_19 <= arg_205_1.time_ and arg_205_1.time_ < var_208_19 + var_208_20 then
				local var_208_21 = (arg_205_1.time_ - var_208_19) / var_208_20

				if arg_205_1.var_.actorSpriteComps10030 then
					for iter_208_1, iter_208_2 in pairs(arg_205_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_208_2 then
							local var_208_22 = Mathf.Lerp(iter_208_2.color.r, 1, var_208_21)

							iter_208_2.color = Color.New(var_208_22, var_208_22, var_208_22)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_19 + var_208_20 and arg_205_1.time_ < var_208_19 + var_208_20 + arg_208_0 and arg_205_1.var_.actorSpriteComps10030 then
				local var_208_23 = 1

				for iter_208_3, iter_208_4 in pairs(arg_205_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_208_4 then
						iter_208_4.color = Color.New(var_208_23, var_208_23, var_208_23)
					end
				end

				arg_205_1.var_.actorSpriteComps10030 = nil
			end

			local var_208_24 = arg_205_1.actors_["10030"]
			local var_208_25 = 0

			if var_208_25 < arg_205_1.time_ and arg_205_1.time_ <= var_208_25 + arg_208_0 then
				local var_208_26 = var_208_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_208_26 then
					arg_205_1.var_.alphaOldValue10030 = var_208_26.alpha
					arg_205_1.var_.characterEffect10030 = var_208_26
				end

				arg_205_1.var_.alphaOldValue10030 = 0
			end

			local var_208_27 = 0.333333333333333

			if var_208_25 <= arg_205_1.time_ and arg_205_1.time_ < var_208_25 + var_208_27 then
				local var_208_28 = (arg_205_1.time_ - var_208_25) / var_208_27
				local var_208_29 = Mathf.Lerp(arg_205_1.var_.alphaOldValue10030, 1, var_208_28)

				if arg_205_1.var_.characterEffect10030 then
					arg_205_1.var_.characterEffect10030.alpha = var_208_29
				end
			end

			if arg_205_1.time_ >= var_208_25 + var_208_27 and arg_205_1.time_ < var_208_25 + var_208_27 + arg_208_0 and arg_205_1.var_.characterEffect10030 then
				arg_205_1.var_.characterEffect10030.alpha = 1
			end

			local var_208_30 = 0
			local var_208_31 = 0.375

			if var_208_30 < arg_205_1.time_ and arg_205_1.time_ <= var_208_30 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_32 = arg_205_1:FormatText(StoryNameCfg[309].name)

				arg_205_1.leftNameTxt_.text = var_208_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_33 = arg_205_1:GetWordFromCfg(115291051)
				local var_208_34 = arg_205_1:FormatText(var_208_33.content)

				arg_205_1.text_.text = var_208_34

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_35 = 15
				local var_208_36 = utf8.len(var_208_34)
				local var_208_37 = var_208_35 <= 0 and var_208_31 or var_208_31 * (var_208_36 / var_208_35)

				if var_208_37 > 0 and var_208_31 < var_208_37 then
					arg_205_1.talkMaxDuration = var_208_37

					if var_208_37 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_37 + var_208_30
					end
				end

				arg_205_1.text_.text = var_208_34
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291051", "story_v_out_115291.awb") ~= 0 then
					local var_208_38 = manager.audio:GetVoiceLength("story_v_out_115291", "115291051", "story_v_out_115291.awb") / 1000

					if var_208_38 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_38 + var_208_30
					end

					if var_208_33.prefab_name ~= "" and arg_205_1.actors_[var_208_33.prefab_name] ~= nil then
						local var_208_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_33.prefab_name].transform, "story_v_out_115291", "115291051", "story_v_out_115291.awb")

						arg_205_1:RecordAudio("115291051", var_208_39)
						arg_205_1:RecordAudio("115291051", var_208_39)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_115291", "115291051", "story_v_out_115291.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_115291", "115291051", "story_v_out_115291.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_40 = math.max(var_208_31, arg_205_1.talkMaxDuration)

			if var_208_30 <= arg_205_1.time_ and arg_205_1.time_ < var_208_30 + var_208_40 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_30) / var_208_40

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_30 + var_208_40 and arg_205_1.time_ < var_208_30 + var_208_40 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play115291052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 115291052
		arg_209_1.duration_ = 3.7

		local var_209_0 = {
			ja = 3.7,
			ko = 2.5,
			zh = 3,
			en = 3.366
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
				arg_209_0:Play115291053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10029"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				local var_212_2 = var_212_0:GetComponent("Image")

				if var_212_2 then
					arg_209_1.var_.highlightMatValue10029 = var_212_2
				end
			end

			local var_212_3 = 0.2

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_3 then
				local var_212_4 = (arg_209_1.time_ - var_212_1) / var_212_3

				if arg_209_1.var_.highlightMatValue10029 then
					local var_212_5 = Mathf.Lerp(0.5, 1, var_212_4)
					local var_212_6 = arg_209_1.var_.highlightMatValue10029
					local var_212_7 = var_212_6.color

					var_212_7.r = var_212_5
					var_212_7.g = var_212_5
					var_212_7.b = var_212_5
					var_212_6.color = var_212_7
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_3 and arg_209_1.time_ < var_212_1 + var_212_3 + arg_212_0 and arg_209_1.var_.highlightMatValue10029 then
				local var_212_8 = 1

				var_212_0.transform:SetSiblingIndex(1)

				local var_212_9 = arg_209_1.var_.highlightMatValue10029
				local var_212_10 = var_212_9.color

				var_212_10.r = var_212_8
				var_212_10.g = var_212_8
				var_212_10.b = var_212_8
				var_212_9.color = var_212_10
			end

			local var_212_11 = arg_209_1.actors_["10030"]
			local var_212_12 = 0

			if var_212_12 < arg_209_1.time_ and arg_209_1.time_ <= var_212_12 + arg_212_0 and arg_209_1.var_.actorSpriteComps10030 == nil then
				arg_209_1.var_.actorSpriteComps10030 = var_212_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_13 = 0.2

			if var_212_12 <= arg_209_1.time_ and arg_209_1.time_ < var_212_12 + var_212_13 then
				local var_212_14 = (arg_209_1.time_ - var_212_12) / var_212_13

				if arg_209_1.var_.actorSpriteComps10030 then
					for iter_212_0, iter_212_1 in pairs(arg_209_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_212_1 then
							local var_212_15 = Mathf.Lerp(iter_212_1.color.r, 0.5, var_212_14)

							iter_212_1.color = Color.New(var_212_15, var_212_15, var_212_15)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_12 + var_212_13 and arg_209_1.time_ < var_212_12 + var_212_13 + arg_212_0 and arg_209_1.var_.actorSpriteComps10030 then
				local var_212_16 = 0.5

				for iter_212_2, iter_212_3 in pairs(arg_209_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_212_3 then
						iter_212_3.color = Color.New(var_212_16, var_212_16, var_212_16)
					end
				end

				arg_209_1.var_.actorSpriteComps10030 = nil
			end

			local var_212_17 = 0
			local var_212_18 = 0.3

			if var_212_17 < arg_209_1.time_ and arg_209_1.time_ <= var_212_17 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_19 = arg_209_1:FormatText(StoryNameCfg[312].name)

				arg_209_1.leftNameTxt_.text = var_212_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_20 = arg_209_1:GetWordFromCfg(115291052)
				local var_212_21 = arg_209_1:FormatText(var_212_20.content)

				arg_209_1.text_.text = var_212_21

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_22 = 12
				local var_212_23 = utf8.len(var_212_21)
				local var_212_24 = var_212_22 <= 0 and var_212_18 or var_212_18 * (var_212_23 / var_212_22)

				if var_212_24 > 0 and var_212_18 < var_212_24 then
					arg_209_1.talkMaxDuration = var_212_24

					if var_212_24 + var_212_17 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_24 + var_212_17
					end
				end

				arg_209_1.text_.text = var_212_21
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291052", "story_v_out_115291.awb") ~= 0 then
					local var_212_25 = manager.audio:GetVoiceLength("story_v_out_115291", "115291052", "story_v_out_115291.awb") / 1000

					if var_212_25 + var_212_17 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_25 + var_212_17
					end

					if var_212_20.prefab_name ~= "" and arg_209_1.actors_[var_212_20.prefab_name] ~= nil then
						local var_212_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_20.prefab_name].transform, "story_v_out_115291", "115291052", "story_v_out_115291.awb")

						arg_209_1:RecordAudio("115291052", var_212_26)
						arg_209_1:RecordAudio("115291052", var_212_26)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_115291", "115291052", "story_v_out_115291.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_115291", "115291052", "story_v_out_115291.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_27 = math.max(var_212_18, arg_209_1.talkMaxDuration)

			if var_212_17 <= arg_209_1.time_ and arg_209_1.time_ < var_212_17 + var_212_27 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_17) / var_212_27

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_17 + var_212_27 and arg_209_1.time_ < var_212_17 + var_212_27 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play115291053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 115291053
		arg_213_1.duration_ = 14.9

		local var_213_0 = {
			ja = 10.866,
			ko = 11.9,
			zh = 10.7,
			en = 14.9
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
				arg_213_0:Play115291054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 1.05

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[312].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(115291053)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291053", "story_v_out_115291.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291053", "story_v_out_115291.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_115291", "115291053", "story_v_out_115291.awb")

						arg_213_1:RecordAudio("115291053", var_216_9)
						arg_213_1:RecordAudio("115291053", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_115291", "115291053", "story_v_out_115291.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_115291", "115291053", "story_v_out_115291.awb")
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
	Play115291054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 115291054
		arg_217_1.duration_ = 4.1

		local var_217_0 = {
			ja = 1.266,
			ko = 1.5,
			zh = 4.1,
			en = 1.533
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
				arg_217_0:Play115291055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10029"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				local var_220_2 = var_220_0:GetComponent("Image")

				if var_220_2 then
					arg_217_1.var_.highlightMatValue10029 = var_220_2
				end
			end

			local var_220_3 = 0.2

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_3 then
				local var_220_4 = (arg_217_1.time_ - var_220_1) / var_220_3

				if arg_217_1.var_.highlightMatValue10029 then
					local var_220_5 = Mathf.Lerp(1, 0.5, var_220_4)
					local var_220_6 = arg_217_1.var_.highlightMatValue10029
					local var_220_7 = var_220_6.color

					var_220_7.r = var_220_5
					var_220_7.g = var_220_5
					var_220_7.b = var_220_5
					var_220_6.color = var_220_7
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_3 and arg_217_1.time_ < var_220_1 + var_220_3 + arg_220_0 and arg_217_1.var_.highlightMatValue10029 then
				local var_220_8 = 0.5
				local var_220_9 = arg_217_1.var_.highlightMatValue10029
				local var_220_10 = var_220_9.color

				var_220_10.r = var_220_8
				var_220_10.g = var_220_8
				var_220_10.b = var_220_8
				var_220_9.color = var_220_10
			end

			local var_220_11 = arg_217_1.actors_["10030"]
			local var_220_12 = 0

			if var_220_12 < arg_217_1.time_ and arg_217_1.time_ <= var_220_12 + arg_220_0 and arg_217_1.var_.actorSpriteComps10030 == nil then
				arg_217_1.var_.actorSpriteComps10030 = var_220_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_13 = 0.2

			if var_220_12 <= arg_217_1.time_ and arg_217_1.time_ < var_220_12 + var_220_13 then
				local var_220_14 = (arg_217_1.time_ - var_220_12) / var_220_13

				if arg_217_1.var_.actorSpriteComps10030 then
					for iter_220_0, iter_220_1 in pairs(arg_217_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_220_1 then
							local var_220_15 = Mathf.Lerp(iter_220_1.color.r, 1, var_220_14)

							iter_220_1.color = Color.New(var_220_15, var_220_15, var_220_15)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_12 + var_220_13 and arg_217_1.time_ < var_220_12 + var_220_13 + arg_220_0 and arg_217_1.var_.actorSpriteComps10030 then
				local var_220_16 = 1

				for iter_220_2, iter_220_3 in pairs(arg_217_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_220_3 then
						iter_220_3.color = Color.New(var_220_16, var_220_16, var_220_16)
					end
				end

				arg_217_1.var_.actorSpriteComps10030 = nil
			end

			local var_220_17 = 0
			local var_220_18 = 0.15

			if var_220_17 < arg_217_1.time_ and arg_217_1.time_ <= var_220_17 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_19 = arg_217_1:FormatText(StoryNameCfg[309].name)

				arg_217_1.leftNameTxt_.text = var_220_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_20 = arg_217_1:GetWordFromCfg(115291054)
				local var_220_21 = arg_217_1:FormatText(var_220_20.content)

				arg_217_1.text_.text = var_220_21

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_22 = 6
				local var_220_23 = utf8.len(var_220_21)
				local var_220_24 = var_220_22 <= 0 and var_220_18 or var_220_18 * (var_220_23 / var_220_22)

				if var_220_24 > 0 and var_220_18 < var_220_24 then
					arg_217_1.talkMaxDuration = var_220_24

					if var_220_24 + var_220_17 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_24 + var_220_17
					end
				end

				arg_217_1.text_.text = var_220_21
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291054", "story_v_out_115291.awb") ~= 0 then
					local var_220_25 = manager.audio:GetVoiceLength("story_v_out_115291", "115291054", "story_v_out_115291.awb") / 1000

					if var_220_25 + var_220_17 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_25 + var_220_17
					end

					if var_220_20.prefab_name ~= "" and arg_217_1.actors_[var_220_20.prefab_name] ~= nil then
						local var_220_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_20.prefab_name].transform, "story_v_out_115291", "115291054", "story_v_out_115291.awb")

						arg_217_1:RecordAudio("115291054", var_220_26)
						arg_217_1:RecordAudio("115291054", var_220_26)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_115291", "115291054", "story_v_out_115291.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_115291", "115291054", "story_v_out_115291.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_27 = math.max(var_220_18, arg_217_1.talkMaxDuration)

			if var_220_17 <= arg_217_1.time_ and arg_217_1.time_ < var_220_17 + var_220_27 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_17) / var_220_27

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_17 + var_220_27 and arg_217_1.time_ < var_220_17 + var_220_27 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play115291055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 115291055
		arg_221_1.duration_ = 9.166

		local var_221_0 = {
			ja = 7.766,
			ko = 6.466,
			zh = 7.833,
			en = 9.166
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
				arg_221_0:Play115291056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10029"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				local var_224_2 = var_224_0:GetComponent("Image")

				if var_224_2 then
					arg_221_1.var_.highlightMatValue10029 = var_224_2
				end
			end

			local var_224_3 = 0.2

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_3 then
				local var_224_4 = (arg_221_1.time_ - var_224_1) / var_224_3

				if arg_221_1.var_.highlightMatValue10029 then
					local var_224_5 = Mathf.Lerp(0.5, 1, var_224_4)
					local var_224_6 = arg_221_1.var_.highlightMatValue10029
					local var_224_7 = var_224_6.color

					var_224_7.r = var_224_5
					var_224_7.g = var_224_5
					var_224_7.b = var_224_5
					var_224_6.color = var_224_7
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_3 and arg_221_1.time_ < var_224_1 + var_224_3 + arg_224_0 and arg_221_1.var_.highlightMatValue10029 then
				local var_224_8 = 1

				var_224_0.transform:SetSiblingIndex(1)

				local var_224_9 = arg_221_1.var_.highlightMatValue10029
				local var_224_10 = var_224_9.color

				var_224_10.r = var_224_8
				var_224_10.g = var_224_8
				var_224_10.b = var_224_8
				var_224_9.color = var_224_10
			end

			local var_224_11 = arg_221_1.actors_["10030"]
			local var_224_12 = 0

			if var_224_12 < arg_221_1.time_ and arg_221_1.time_ <= var_224_12 + arg_224_0 and arg_221_1.var_.actorSpriteComps10030 == nil then
				arg_221_1.var_.actorSpriteComps10030 = var_224_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_13 = 0.2

			if var_224_12 <= arg_221_1.time_ and arg_221_1.time_ < var_224_12 + var_224_13 then
				local var_224_14 = (arg_221_1.time_ - var_224_12) / var_224_13

				if arg_221_1.var_.actorSpriteComps10030 then
					for iter_224_0, iter_224_1 in pairs(arg_221_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_224_1 then
							local var_224_15 = Mathf.Lerp(iter_224_1.color.r, 0.5, var_224_14)

							iter_224_1.color = Color.New(var_224_15, var_224_15, var_224_15)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_12 + var_224_13 and arg_221_1.time_ < var_224_12 + var_224_13 + arg_224_0 and arg_221_1.var_.actorSpriteComps10030 then
				local var_224_16 = 0.5

				for iter_224_2, iter_224_3 in pairs(arg_221_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_224_3 then
						iter_224_3.color = Color.New(var_224_16, var_224_16, var_224_16)
					end
				end

				arg_221_1.var_.actorSpriteComps10030 = nil
			end

			local var_224_17 = 0
			local var_224_18 = 0.625

			if var_224_17 < arg_221_1.time_ and arg_221_1.time_ <= var_224_17 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_19 = arg_221_1:FormatText(StoryNameCfg[312].name)

				arg_221_1.leftNameTxt_.text = var_224_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_20 = arg_221_1:GetWordFromCfg(115291055)
				local var_224_21 = arg_221_1:FormatText(var_224_20.content)

				arg_221_1.text_.text = var_224_21

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_22 = 24
				local var_224_23 = utf8.len(var_224_21)
				local var_224_24 = var_224_22 <= 0 and var_224_18 or var_224_18 * (var_224_23 / var_224_22)

				if var_224_24 > 0 and var_224_18 < var_224_24 then
					arg_221_1.talkMaxDuration = var_224_24

					if var_224_24 + var_224_17 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_24 + var_224_17
					end
				end

				arg_221_1.text_.text = var_224_21
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291055", "story_v_out_115291.awb") ~= 0 then
					local var_224_25 = manager.audio:GetVoiceLength("story_v_out_115291", "115291055", "story_v_out_115291.awb") / 1000

					if var_224_25 + var_224_17 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_25 + var_224_17
					end

					if var_224_20.prefab_name ~= "" and arg_221_1.actors_[var_224_20.prefab_name] ~= nil then
						local var_224_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_20.prefab_name].transform, "story_v_out_115291", "115291055", "story_v_out_115291.awb")

						arg_221_1:RecordAudio("115291055", var_224_26)
						arg_221_1:RecordAudio("115291055", var_224_26)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_115291", "115291055", "story_v_out_115291.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_115291", "115291055", "story_v_out_115291.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_27 = math.max(var_224_18, arg_221_1.talkMaxDuration)

			if var_224_17 <= arg_221_1.time_ and arg_221_1.time_ < var_224_17 + var_224_27 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_17) / var_224_27

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_17 + var_224_27 and arg_221_1.time_ < var_224_17 + var_224_27 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play115291056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 115291056
		arg_225_1.duration_ = 17.266

		local var_225_0 = {
			ja = 14.566,
			ko = 12.266,
			zh = 12.5,
			en = 17.266
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
				arg_225_0:Play115291057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 1.325

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[312].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(115291056)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291056", "story_v_out_115291.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291056", "story_v_out_115291.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_115291", "115291056", "story_v_out_115291.awb")

						arg_225_1:RecordAudio("115291056", var_228_9)
						arg_225_1:RecordAudio("115291056", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_115291", "115291056", "story_v_out_115291.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_115291", "115291056", "story_v_out_115291.awb")
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
	Play115291057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 115291057
		arg_229_1.duration_ = 12.733

		local var_229_0 = {
			ja = 11.366,
			ko = 6.9,
			zh = 9,
			en = 12.733
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
				arg_229_0:Play115291058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 1.025

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[312].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(115291057)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 42
				local var_232_6 = utf8.len(var_232_4)
				local var_232_7 = var_232_5 <= 0 and var_232_1 or var_232_1 * (var_232_6 / var_232_5)

				if var_232_7 > 0 and var_232_1 < var_232_7 then
					arg_229_1.talkMaxDuration = var_232_7

					if var_232_7 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_7 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_4
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291057", "story_v_out_115291.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291057", "story_v_out_115291.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_115291", "115291057", "story_v_out_115291.awb")

						arg_229_1:RecordAudio("115291057", var_232_9)
						arg_229_1:RecordAudio("115291057", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_115291", "115291057", "story_v_out_115291.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_115291", "115291057", "story_v_out_115291.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_10 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_10 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_10

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_10 and arg_229_1.time_ < var_232_0 + var_232_10 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play115291058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 115291058
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play115291059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10029"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				local var_236_2 = var_236_0:GetComponent("Image")

				if var_236_2 then
					arg_233_1.var_.alphaMatValue10029 = var_236_2
					arg_233_1.var_.alphaOldValue10029 = var_236_2.color.a
				end

				arg_233_1.var_.alphaOldValue10029 = 1
			end

			local var_236_3 = 0.333333333333333

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_3 then
				local var_236_4 = (arg_233_1.time_ - var_236_1) / var_236_3
				local var_236_5 = Mathf.Lerp(arg_233_1.var_.alphaOldValue10029, 0, var_236_4)

				if arg_233_1.var_.alphaMatValue10029 then
					local var_236_6 = arg_233_1.var_.alphaMatValue10029.color

					var_236_6.a = var_236_5
					arg_233_1.var_.alphaMatValue10029.color = var_236_6
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_3 and arg_233_1.time_ < var_236_1 + var_236_3 + arg_236_0 and arg_233_1.var_.alphaMatValue10029 then
				local var_236_7 = arg_233_1.var_.alphaMatValue10029
				local var_236_8 = var_236_7.color

				var_236_8.a = 0
				var_236_7.color = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["10030"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 then
				local var_236_11 = var_236_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_236_11 then
					arg_233_1.var_.alphaOldValue10030 = var_236_11.alpha
					arg_233_1.var_.characterEffect10030 = var_236_11
				end

				arg_233_1.var_.alphaOldValue10030 = 1
			end

			local var_236_12 = 0.333333333333333

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_12 then
				local var_236_13 = (arg_233_1.time_ - var_236_10) / var_236_12
				local var_236_14 = Mathf.Lerp(arg_233_1.var_.alphaOldValue10030, 0, var_236_13)

				if arg_233_1.var_.characterEffect10030 then
					arg_233_1.var_.characterEffect10030.alpha = var_236_14
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_12 and arg_233_1.time_ < var_236_10 + var_236_12 + arg_236_0 and arg_233_1.var_.characterEffect10030 then
				arg_233_1.var_.characterEffect10030.alpha = 0
			end

			local var_236_15 = 0
			local var_236_16 = 0.725

			if var_236_15 < arg_233_1.time_ and arg_233_1.time_ <= var_236_15 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_17 = arg_233_1:GetWordFromCfg(115291058)
				local var_236_18 = arg_233_1:FormatText(var_236_17.content)

				arg_233_1.text_.text = var_236_18

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_19 = 29
				local var_236_20 = utf8.len(var_236_18)
				local var_236_21 = var_236_19 <= 0 and var_236_16 or var_236_16 * (var_236_20 / var_236_19)

				if var_236_21 > 0 and var_236_16 < var_236_21 then
					arg_233_1.talkMaxDuration = var_236_21

					if var_236_21 + var_236_15 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_21 + var_236_15
					end
				end

				arg_233_1.text_.text = var_236_18
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_22 = math.max(var_236_16, arg_233_1.talkMaxDuration)

			if var_236_15 <= arg_233_1.time_ and arg_233_1.time_ < var_236_15 + var_236_22 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_15) / var_236_22

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_15 + var_236_22 and arg_233_1.time_ < var_236_15 + var_236_22 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play115291059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 115291059
		arg_237_1.duration_ = 7.5

		local var_237_0 = {
			ja = 7.5,
			ko = 6.366,
			zh = 7,
			en = 6.2
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
				arg_237_0:Play115291060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10030"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos10030 = var_240_0.localPosition
				var_240_0.localScale = Vector3.New(1, 1, 1)

				arg_237_1:CheckSpriteTmpPos("10030", 4)

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
				local var_240_6 = Vector3.New(390, -390, 150)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos10030, var_240_6, var_240_5)
			end

			if arg_237_1.time_ >= var_240_1 + var_240_4 and arg_237_1.time_ < var_240_1 + var_240_4 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_240_7 = arg_237_1.actors_["10030"]
			local var_240_8 = 0

			if var_240_8 < arg_237_1.time_ and arg_237_1.time_ <= var_240_8 + arg_240_0 and arg_237_1.var_.actorSpriteComps10030 == nil then
				arg_237_1.var_.actorSpriteComps10030 = var_240_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_9 = 0.2

			if var_240_8 <= arg_237_1.time_ and arg_237_1.time_ < var_240_8 + var_240_9 then
				local var_240_10 = (arg_237_1.time_ - var_240_8) / var_240_9

				if arg_237_1.var_.actorSpriteComps10030 then
					for iter_240_1, iter_240_2 in pairs(arg_237_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_240_2 then
							local var_240_11 = Mathf.Lerp(iter_240_2.color.r, 1, var_240_10)

							iter_240_2.color = Color.New(var_240_11, var_240_11, var_240_11)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_8 + var_240_9 and arg_237_1.time_ < var_240_8 + var_240_9 + arg_240_0 and arg_237_1.var_.actorSpriteComps10030 then
				local var_240_12 = 1

				for iter_240_3, iter_240_4 in pairs(arg_237_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_240_4 then
						iter_240_4.color = Color.New(var_240_12, var_240_12, var_240_12)
					end
				end

				arg_237_1.var_.actorSpriteComps10030 = nil
			end

			local var_240_13 = arg_237_1.actors_["10030"]
			local var_240_14 = 0

			if var_240_14 < arg_237_1.time_ and arg_237_1.time_ <= var_240_14 + arg_240_0 then
				local var_240_15 = var_240_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_240_15 then
					arg_237_1.var_.alphaOldValue10030 = var_240_15.alpha
					arg_237_1.var_.characterEffect10030 = var_240_15
				end

				arg_237_1.var_.alphaOldValue10030 = 0
			end

			local var_240_16 = 0.333333333333333

			if var_240_14 <= arg_237_1.time_ and arg_237_1.time_ < var_240_14 + var_240_16 then
				local var_240_17 = (arg_237_1.time_ - var_240_14) / var_240_16
				local var_240_18 = Mathf.Lerp(arg_237_1.var_.alphaOldValue10030, 1, var_240_17)

				if arg_237_1.var_.characterEffect10030 then
					arg_237_1.var_.characterEffect10030.alpha = var_240_18
				end
			end

			if arg_237_1.time_ >= var_240_14 + var_240_16 and arg_237_1.time_ < var_240_14 + var_240_16 + arg_240_0 and arg_237_1.var_.characterEffect10030 then
				arg_237_1.var_.characterEffect10030.alpha = 1
			end

			local var_240_19 = 0
			local var_240_20 = 0.925

			if var_240_19 < arg_237_1.time_ and arg_237_1.time_ <= var_240_19 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_21 = arg_237_1:FormatText(StoryNameCfg[309].name)

				arg_237_1.leftNameTxt_.text = var_240_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_22 = arg_237_1:GetWordFromCfg(115291059)
				local var_240_23 = arg_237_1:FormatText(var_240_22.content)

				arg_237_1.text_.text = var_240_23

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_24 = 36
				local var_240_25 = utf8.len(var_240_23)
				local var_240_26 = var_240_24 <= 0 and var_240_20 or var_240_20 * (var_240_25 / var_240_24)

				if var_240_26 > 0 and var_240_20 < var_240_26 then
					arg_237_1.talkMaxDuration = var_240_26

					if var_240_26 + var_240_19 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_26 + var_240_19
					end
				end

				arg_237_1.text_.text = var_240_23
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291059", "story_v_out_115291.awb") ~= 0 then
					local var_240_27 = manager.audio:GetVoiceLength("story_v_out_115291", "115291059", "story_v_out_115291.awb") / 1000

					if var_240_27 + var_240_19 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_27 + var_240_19
					end

					if var_240_22.prefab_name ~= "" and arg_237_1.actors_[var_240_22.prefab_name] ~= nil then
						local var_240_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_22.prefab_name].transform, "story_v_out_115291", "115291059", "story_v_out_115291.awb")

						arg_237_1:RecordAudio("115291059", var_240_28)
						arg_237_1:RecordAudio("115291059", var_240_28)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_115291", "115291059", "story_v_out_115291.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_115291", "115291059", "story_v_out_115291.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_29 = math.max(var_240_20, arg_237_1.talkMaxDuration)

			if var_240_19 <= arg_237_1.time_ and arg_237_1.time_ < var_240_19 + var_240_29 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_19) / var_240_29

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_19 + var_240_29 and arg_237_1.time_ < var_240_19 + var_240_29 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play115291060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 115291060
		arg_241_1.duration_ = 2.9

		local var_241_0 = {
			ja = 1.966,
			ko = 2,
			zh = 1.766,
			en = 2.9
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
				arg_241_0:Play115291061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10029"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos10029 = var_244_0.localPosition
				var_244_0.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(-390, -350, -180)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos10029, var_244_4, var_244_3)
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_244_5 = arg_241_1.actors_["10030"]
			local var_244_6 = 0

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 and arg_241_1.var_.actorSpriteComps10030 == nil then
				arg_241_1.var_.actorSpriteComps10030 = var_244_5:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_7 = 0.2

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_7 then
				local var_244_8 = (arg_241_1.time_ - var_244_6) / var_244_7

				if arg_241_1.var_.actorSpriteComps10030 then
					for iter_244_0, iter_244_1 in pairs(arg_241_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_244_1 then
							local var_244_9 = Mathf.Lerp(iter_244_1.color.r, 0.5, var_244_8)

							iter_244_1.color = Color.New(var_244_9, var_244_9, var_244_9)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_6 + var_244_7 and arg_241_1.time_ < var_244_6 + var_244_7 + arg_244_0 and arg_241_1.var_.actorSpriteComps10030 then
				local var_244_10 = 0.5

				for iter_244_2, iter_244_3 in pairs(arg_241_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_244_3 then
						iter_244_3.color = Color.New(var_244_10, var_244_10, var_244_10)
					end
				end

				arg_241_1.var_.actorSpriteComps10030 = nil
			end

			local var_244_11 = arg_241_1.actors_["10029"]
			local var_244_12 = 0

			if var_244_12 < arg_241_1.time_ and arg_241_1.time_ <= var_244_12 + arg_244_0 then
				local var_244_13 = var_244_11:GetComponent("Image")

				if var_244_13 then
					arg_241_1.var_.alphaMatValue10029 = var_244_13
					arg_241_1.var_.alphaOldValue10029 = var_244_13.color.a
				end

				arg_241_1.var_.alphaOldValue10029 = 0
			end

			local var_244_14 = 0.333333333333333

			if var_244_12 <= arg_241_1.time_ and arg_241_1.time_ < var_244_12 + var_244_14 then
				local var_244_15 = (arg_241_1.time_ - var_244_12) / var_244_14
				local var_244_16 = Mathf.Lerp(arg_241_1.var_.alphaOldValue10029, 1, var_244_15)

				if arg_241_1.var_.alphaMatValue10029 then
					local var_244_17 = arg_241_1.var_.alphaMatValue10029.color

					var_244_17.a = var_244_16
					arg_241_1.var_.alphaMatValue10029.color = var_244_17
				end
			end

			if arg_241_1.time_ >= var_244_12 + var_244_14 and arg_241_1.time_ < var_244_12 + var_244_14 + arg_244_0 and arg_241_1.var_.alphaMatValue10029 then
				local var_244_18 = arg_241_1.var_.alphaMatValue10029
				local var_244_19 = var_244_18.color

				var_244_19.a = 1
				var_244_18.color = var_244_19
			end

			local var_244_20 = manager.ui.mainCamera.transform
			local var_244_21 = 0

			if var_244_21 < arg_241_1.time_ and arg_241_1.time_ <= var_244_21 + arg_244_0 then
				arg_241_1.var_.shakeOldPos = var_244_20.localPosition
			end

			local var_244_22 = 0.15

			if var_244_21 <= arg_241_1.time_ and arg_241_1.time_ < var_244_21 + var_244_22 then
				local var_244_23 = (arg_241_1.time_ - var_244_21) / 0.066
				local var_244_24, var_244_25 = math.modf(var_244_23)

				var_244_20.localPosition = Vector3.New(var_244_25 * 0.13, var_244_25 * 0.13, var_244_25 * 0.13) + arg_241_1.var_.shakeOldPos
			end

			if arg_241_1.time_ >= var_244_21 + var_244_22 and arg_241_1.time_ < var_244_21 + var_244_22 + arg_244_0 then
				var_244_20.localPosition = arg_241_1.var_.shakeOldPos
			end

			local var_244_26 = 0
			local var_244_27 = 0.15

			if var_244_26 < arg_241_1.time_ and arg_241_1.time_ <= var_244_26 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_28 = arg_241_1:FormatText(StoryNameCfg[312].name)

				arg_241_1.leftNameTxt_.text = var_244_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_29 = arg_241_1:GetWordFromCfg(115291060)
				local var_244_30 = arg_241_1:FormatText(var_244_29.content)

				arg_241_1.text_.text = var_244_30

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_31 = 6
				local var_244_32 = utf8.len(var_244_30)
				local var_244_33 = var_244_31 <= 0 and var_244_27 or var_244_27 * (var_244_32 / var_244_31)

				if var_244_33 > 0 and var_244_27 < var_244_33 then
					arg_241_1.talkMaxDuration = var_244_33

					if var_244_33 + var_244_26 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_33 + var_244_26
					end
				end

				arg_241_1.text_.text = var_244_30
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291060", "story_v_out_115291.awb") ~= 0 then
					local var_244_34 = manager.audio:GetVoiceLength("story_v_out_115291", "115291060", "story_v_out_115291.awb") / 1000

					if var_244_34 + var_244_26 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_34 + var_244_26
					end

					if var_244_29.prefab_name ~= "" and arg_241_1.actors_[var_244_29.prefab_name] ~= nil then
						local var_244_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_29.prefab_name].transform, "story_v_out_115291", "115291060", "story_v_out_115291.awb")

						arg_241_1:RecordAudio("115291060", var_244_35)
						arg_241_1:RecordAudio("115291060", var_244_35)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_115291", "115291060", "story_v_out_115291.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_115291", "115291060", "story_v_out_115291.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_36 = math.max(var_244_27, arg_241_1.talkMaxDuration)

			if var_244_26 <= arg_241_1.time_ and arg_241_1.time_ < var_244_26 + var_244_36 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_26) / var_244_36

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_26 + var_244_36 and arg_241_1.time_ < var_244_26 + var_244_36 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play115291061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 115291061
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play115291062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10029"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				local var_248_2 = var_248_0:GetComponent("Image")

				if var_248_2 then
					arg_245_1.var_.alphaMatValue10029 = var_248_2
					arg_245_1.var_.alphaOldValue10029 = var_248_2.color.a
				end

				arg_245_1.var_.alphaOldValue10029 = 1
			end

			local var_248_3 = 0.333333333333333

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_3 then
				local var_248_4 = (arg_245_1.time_ - var_248_1) / var_248_3
				local var_248_5 = Mathf.Lerp(arg_245_1.var_.alphaOldValue10029, 0, var_248_4)

				if arg_245_1.var_.alphaMatValue10029 then
					local var_248_6 = arg_245_1.var_.alphaMatValue10029.color

					var_248_6.a = var_248_5
					arg_245_1.var_.alphaMatValue10029.color = var_248_6
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_3 and arg_245_1.time_ < var_248_1 + var_248_3 + arg_248_0 and arg_245_1.var_.alphaMatValue10029 then
				local var_248_7 = arg_245_1.var_.alphaMatValue10029
				local var_248_8 = var_248_7.color

				var_248_8.a = 0
				var_248_7.color = var_248_8
			end

			local var_248_9 = arg_245_1.actors_["10030"]
			local var_248_10 = 0

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 then
				local var_248_11 = var_248_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_248_11 then
					arg_245_1.var_.alphaOldValue10030 = var_248_11.alpha
					arg_245_1.var_.characterEffect10030 = var_248_11
				end

				arg_245_1.var_.alphaOldValue10030 = 1
			end

			local var_248_12 = 0.333333333333333

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_12 then
				local var_248_13 = (arg_245_1.time_ - var_248_10) / var_248_12
				local var_248_14 = Mathf.Lerp(arg_245_1.var_.alphaOldValue10030, 0, var_248_13)

				if arg_245_1.var_.characterEffect10030 then
					arg_245_1.var_.characterEffect10030.alpha = var_248_14
				end
			end

			if arg_245_1.time_ >= var_248_10 + var_248_12 and arg_245_1.time_ < var_248_10 + var_248_12 + arg_248_0 and arg_245_1.var_.characterEffect10030 then
				arg_245_1.var_.characterEffect10030.alpha = 0
			end

			local var_248_15 = 0
			local var_248_16 = 0.625

			if var_248_15 < arg_245_1.time_ and arg_245_1.time_ <= var_248_15 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_17 = arg_245_1:GetWordFromCfg(115291061)
				local var_248_18 = arg_245_1:FormatText(var_248_17.content)

				arg_245_1.text_.text = var_248_18

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_19 = 25
				local var_248_20 = utf8.len(var_248_18)
				local var_248_21 = var_248_19 <= 0 and var_248_16 or var_248_16 * (var_248_20 / var_248_19)

				if var_248_21 > 0 and var_248_16 < var_248_21 then
					arg_245_1.talkMaxDuration = var_248_21

					if var_248_21 + var_248_15 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_21 + var_248_15
					end
				end

				arg_245_1.text_.text = var_248_18
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_22 = math.max(var_248_16, arg_245_1.talkMaxDuration)

			if var_248_15 <= arg_245_1.time_ and arg_245_1.time_ < var_248_15 + var_248_22 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_15) / var_248_22

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_15 + var_248_22 and arg_245_1.time_ < var_248_15 + var_248_22 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play115291062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 115291062
		arg_249_1.duration_ = 15.733

		local var_249_0 = {
			ja = 15,
			ko = 8.7,
			zh = 8.5,
			en = 15.733
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play115291063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10029"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos10029 = var_252_0.localPosition
				var_252_0.localScale = Vector3.New(1, 1, 1)

				arg_249_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, -350, -180)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos10029, var_252_4, var_252_3)
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_252_5 = arg_249_1.actors_["10029"]
			local var_252_6 = 0

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				local var_252_7 = var_252_5:GetComponent("Image")

				if var_252_7 then
					arg_249_1.var_.alphaMatValue10029 = var_252_7
					arg_249_1.var_.alphaOldValue10029 = var_252_7.color.a
				end

				arg_249_1.var_.alphaOldValue10029 = 0
			end

			local var_252_8 = 0.333333333333333

			if var_252_6 <= arg_249_1.time_ and arg_249_1.time_ < var_252_6 + var_252_8 then
				local var_252_9 = (arg_249_1.time_ - var_252_6) / var_252_8
				local var_252_10 = Mathf.Lerp(arg_249_1.var_.alphaOldValue10029, 1, var_252_9)

				if arg_249_1.var_.alphaMatValue10029 then
					local var_252_11 = arg_249_1.var_.alphaMatValue10029.color

					var_252_11.a = var_252_10
					arg_249_1.var_.alphaMatValue10029.color = var_252_11
				end
			end

			if arg_249_1.time_ >= var_252_6 + var_252_8 and arg_249_1.time_ < var_252_6 + var_252_8 + arg_252_0 and arg_249_1.var_.alphaMatValue10029 then
				local var_252_12 = arg_249_1.var_.alphaMatValue10029
				local var_252_13 = var_252_12.color

				var_252_13.a = 1
				var_252_12.color = var_252_13
			end

			local var_252_14 = 0
			local var_252_15 = 1.075

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_16 = arg_249_1:FormatText(StoryNameCfg[312].name)

				arg_249_1.leftNameTxt_.text = var_252_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_17 = arg_249_1:GetWordFromCfg(115291062)
				local var_252_18 = arg_249_1:FormatText(var_252_17.content)

				arg_249_1.text_.text = var_252_18

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_19 = 43
				local var_252_20 = utf8.len(var_252_18)
				local var_252_21 = var_252_19 <= 0 and var_252_15 or var_252_15 * (var_252_20 / var_252_19)

				if var_252_21 > 0 and var_252_15 < var_252_21 then
					arg_249_1.talkMaxDuration = var_252_21

					if var_252_21 + var_252_14 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_21 + var_252_14
					end
				end

				arg_249_1.text_.text = var_252_18
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291062", "story_v_out_115291.awb") ~= 0 then
					local var_252_22 = manager.audio:GetVoiceLength("story_v_out_115291", "115291062", "story_v_out_115291.awb") / 1000

					if var_252_22 + var_252_14 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_22 + var_252_14
					end

					if var_252_17.prefab_name ~= "" and arg_249_1.actors_[var_252_17.prefab_name] ~= nil then
						local var_252_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_17.prefab_name].transform, "story_v_out_115291", "115291062", "story_v_out_115291.awb")

						arg_249_1:RecordAudio("115291062", var_252_23)
						arg_249_1:RecordAudio("115291062", var_252_23)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_115291", "115291062", "story_v_out_115291.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_115291", "115291062", "story_v_out_115291.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_24 = math.max(var_252_15, arg_249_1.talkMaxDuration)

			if var_252_14 <= arg_249_1.time_ and arg_249_1.time_ < var_252_14 + var_252_24 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_14) / var_252_24

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_14 + var_252_24 and arg_249_1.time_ < var_252_14 + var_252_24 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play115291063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 115291063
		arg_253_1.duration_ = 16.666

		local var_253_0 = {
			ja = 12.933,
			ko = 14.366,
			zh = 10.633,
			en = 16.666
		}
		local var_253_1 = manager.audio:GetLocalizationFlag()

		if var_253_0[var_253_1] ~= nil then
			arg_253_1.duration_ = var_253_0[var_253_1]
		end

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play115291064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 1.225

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[312].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(115291063)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 49
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291063", "story_v_out_115291.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291063", "story_v_out_115291.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_115291", "115291063", "story_v_out_115291.awb")

						arg_253_1:RecordAudio("115291063", var_256_9)
						arg_253_1:RecordAudio("115291063", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_115291", "115291063", "story_v_out_115291.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_115291", "115291063", "story_v_out_115291.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_10 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_10

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_10 and arg_253_1.time_ < var_256_0 + var_256_10 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play115291064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 115291064
		arg_257_1.duration_ = 13.566

		local var_257_0 = {
			ja = 11.2,
			ko = 7.433,
			zh = 8.9,
			en = 13.566
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play115291065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 1.05

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[312].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(115291064)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 42
				local var_260_6 = utf8.len(var_260_4)
				local var_260_7 = var_260_5 <= 0 and var_260_1 or var_260_1 * (var_260_6 / var_260_5)

				if var_260_7 > 0 and var_260_1 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_4
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291064", "story_v_out_115291.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291064", "story_v_out_115291.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_115291", "115291064", "story_v_out_115291.awb")

						arg_257_1:RecordAudio("115291064", var_260_9)
						arg_257_1:RecordAudio("115291064", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_115291", "115291064", "story_v_out_115291.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_115291", "115291064", "story_v_out_115291.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_10 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_10 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_10

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_10 and arg_257_1.time_ < var_260_0 + var_260_10 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play115291065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 115291065
		arg_261_1.duration_ = 4.5

		local var_261_0 = {
			ja = 4.5,
			ko = 4,
			zh = 3.033,
			en = 4.3
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play115291066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.2

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[312].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(115291065)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 8
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291065", "story_v_out_115291.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291065", "story_v_out_115291.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_115291", "115291065", "story_v_out_115291.awb")

						arg_261_1:RecordAudio("115291065", var_264_9)
						arg_261_1:RecordAudio("115291065", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_115291", "115291065", "story_v_out_115291.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_115291", "115291065", "story_v_out_115291.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_10 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_10

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_10 and arg_261_1.time_ < var_264_0 + var_264_10 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play115291066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 115291066
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play115291067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 1

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				local var_268_2 = "play"
				local var_268_3 = "effect"

				arg_265_1:AudioAction(var_268_2, var_268_3, "se_story_activity_1_5_3", "se_story_activity_1_5_3_door", "")
			end

			local var_268_4 = 0
			local var_268_5 = 1

			if var_268_4 < arg_265_1.time_ and arg_265_1.time_ <= var_268_4 + arg_268_0 then
				local var_268_6 = "play"
				local var_268_7 = "effect"

				arg_265_1:AudioAction(var_268_6, var_268_7, "se_story_activity_1_5_3", "se_story_activity_1_5_3_rain_loop", "")
			end

			local var_268_8 = manager.ui.mainCamera.transform
			local var_268_9 = 0

			if var_268_9 < arg_265_1.time_ and arg_265_1.time_ <= var_268_9 + arg_268_0 then
				arg_265_1.var_.shakeOldPos = var_268_8.localPosition
			end

			local var_268_10 = 1

			if var_268_9 <= arg_265_1.time_ and arg_265_1.time_ < var_268_9 + var_268_10 then
				local var_268_11 = (arg_265_1.time_ - var_268_9) / 0.066
				local var_268_12, var_268_13 = math.modf(var_268_11)

				var_268_8.localPosition = Vector3.New(var_268_13 * 0.13, var_268_13 * 0.13, var_268_13 * 0.13) + arg_265_1.var_.shakeOldPos
			end

			if arg_265_1.time_ >= var_268_9 + var_268_10 and arg_265_1.time_ < var_268_9 + var_268_10 + arg_268_0 then
				var_268_8.localPosition = arg_265_1.var_.shakeOldPos
			end

			local var_268_14 = arg_265_1.actors_["10029"]
			local var_268_15 = 0

			if var_268_15 < arg_265_1.time_ and arg_265_1.time_ <= var_268_15 + arg_268_0 then
				local var_268_16 = var_268_14:GetComponent("Image")

				if var_268_16 then
					arg_265_1.var_.alphaMatValue10029 = var_268_16
					arg_265_1.var_.alphaOldValue10029 = var_268_16.color.a
				end

				arg_265_1.var_.alphaOldValue10029 = 1
			end

			local var_268_17 = 0.333333333333333

			if var_268_15 <= arg_265_1.time_ and arg_265_1.time_ < var_268_15 + var_268_17 then
				local var_268_18 = (arg_265_1.time_ - var_268_15) / var_268_17
				local var_268_19 = Mathf.Lerp(arg_265_1.var_.alphaOldValue10029, 0, var_268_18)

				if arg_265_1.var_.alphaMatValue10029 then
					local var_268_20 = arg_265_1.var_.alphaMatValue10029.color

					var_268_20.a = var_268_19
					arg_265_1.var_.alphaMatValue10029.color = var_268_20
				end
			end

			if arg_265_1.time_ >= var_268_15 + var_268_17 and arg_265_1.time_ < var_268_15 + var_268_17 + arg_268_0 and arg_265_1.var_.alphaMatValue10029 then
				local var_268_21 = arg_265_1.var_.alphaMatValue10029
				local var_268_22 = var_268_21.color

				var_268_22.a = 0
				var_268_21.color = var_268_22
			end

			local var_268_23 = 0
			local var_268_24 = 1.275

			if var_268_23 < arg_265_1.time_ and arg_265_1.time_ <= var_268_23 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_25 = arg_265_1:GetWordFromCfg(115291066)
				local var_268_26 = arg_265_1:FormatText(var_268_25.content)

				arg_265_1.text_.text = var_268_26

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_27 = 51
				local var_268_28 = utf8.len(var_268_26)
				local var_268_29 = var_268_27 <= 0 and var_268_24 or var_268_24 * (var_268_28 / var_268_27)

				if var_268_29 > 0 and var_268_24 < var_268_29 then
					arg_265_1.talkMaxDuration = var_268_29

					if var_268_29 + var_268_23 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_29 + var_268_23
					end
				end

				arg_265_1.text_.text = var_268_26
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_30 = math.max(var_268_24, arg_265_1.talkMaxDuration)

			if var_268_23 <= arg_265_1.time_ and arg_265_1.time_ < var_268_23 + var_268_30 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_23) / var_268_30

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_23 + var_268_30 and arg_265_1.time_ < var_268_23 + var_268_30 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play115291067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 115291067
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play115291068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.575

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_2 = arg_269_1:GetWordFromCfg(115291067)
				local var_272_3 = arg_269_1:FormatText(var_272_2.content)

				arg_269_1.text_.text = var_272_3

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_4 = 23
				local var_272_5 = utf8.len(var_272_3)
				local var_272_6 = var_272_4 <= 0 and var_272_1 or var_272_1 * (var_272_5 / var_272_4)

				if var_272_6 > 0 and var_272_1 < var_272_6 then
					arg_269_1.talkMaxDuration = var_272_6

					if var_272_6 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_6 + var_272_0
					end
				end

				arg_269_1.text_.text = var_272_3
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_7 = math.max(var_272_1, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_7 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_0) / var_272_7

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_7 and arg_269_1.time_ < var_272_0 + var_272_7 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play115291068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 115291068
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play115291069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.8

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_2 = arg_273_1:GetWordFromCfg(115291068)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 32
				local var_276_5 = utf8.len(var_276_3)
				local var_276_6 = var_276_4 <= 0 and var_276_1 or var_276_1 * (var_276_5 / var_276_4)

				if var_276_6 > 0 and var_276_1 < var_276_6 then
					arg_273_1.talkMaxDuration = var_276_6

					if var_276_6 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_6 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_3
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_7 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_7 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_7

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_7 and arg_273_1.time_ < var_276_0 + var_276_7 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play115291069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 115291069
		arg_277_1.duration_ = 6.4

		local var_277_0 = {
			ja = 6.4,
			ko = 3.6,
			zh = 4.6,
			en = 4.033
		}
		local var_277_1 = manager.audio:GetLocalizationFlag()

		if var_277_0[var_277_1] ~= nil then
			arg_277_1.duration_ = var_277_0[var_277_1]
		end

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play115291070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["10030"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos10030 = var_280_0.localPosition
				var_280_0.localScale = Vector3.New(1, 1, 1)

				arg_277_1:CheckSpriteTmpPos("10030", 3)

				local var_280_2 = var_280_0.childCount

				for iter_280_0 = 0, var_280_2 - 1 do
					local var_280_3 = var_280_0:GetChild(iter_280_0)

					if var_280_3.name == "split_3" or not string.find(var_280_3.name, "split") then
						var_280_3.gameObject:SetActive(true)
					else
						var_280_3.gameObject:SetActive(false)
					end
				end
			end

			local var_280_4 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_4 then
				local var_280_5 = (arg_277_1.time_ - var_280_1) / var_280_4
				local var_280_6 = Vector3.New(0, -390, 150)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10030, var_280_6, var_280_5)
			end

			if arg_277_1.time_ >= var_280_1 + var_280_4 and arg_277_1.time_ < var_280_1 + var_280_4 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_280_7 = arg_277_1.actors_["10030"]
			local var_280_8 = 0

			if var_280_8 < arg_277_1.time_ and arg_277_1.time_ <= var_280_8 + arg_280_0 and arg_277_1.var_.actorSpriteComps10030 == nil then
				arg_277_1.var_.actorSpriteComps10030 = var_280_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_280_9 = 0.2

			if var_280_8 <= arg_277_1.time_ and arg_277_1.time_ < var_280_8 + var_280_9 then
				local var_280_10 = (arg_277_1.time_ - var_280_8) / var_280_9

				if arg_277_1.var_.actorSpriteComps10030 then
					for iter_280_1, iter_280_2 in pairs(arg_277_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_280_2 then
							local var_280_11 = Mathf.Lerp(iter_280_2.color.r, 1, var_280_10)

							iter_280_2.color = Color.New(var_280_11, var_280_11, var_280_11)
						end
					end
				end
			end

			if arg_277_1.time_ >= var_280_8 + var_280_9 and arg_277_1.time_ < var_280_8 + var_280_9 + arg_280_0 and arg_277_1.var_.actorSpriteComps10030 then
				local var_280_12 = 1

				for iter_280_3, iter_280_4 in pairs(arg_277_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_280_4 then
						iter_280_4.color = Color.New(var_280_12, var_280_12, var_280_12)
					end
				end

				arg_277_1.var_.actorSpriteComps10030 = nil
			end

			local var_280_13 = arg_277_1.actors_["10030"]
			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				local var_280_15 = var_280_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_280_15 then
					arg_277_1.var_.alphaOldValue10030 = var_280_15.alpha
					arg_277_1.var_.characterEffect10030 = var_280_15
				end

				arg_277_1.var_.alphaOldValue10030 = 0
			end

			local var_280_16 = 0.333333333333333

			if var_280_14 <= arg_277_1.time_ and arg_277_1.time_ < var_280_14 + var_280_16 then
				local var_280_17 = (arg_277_1.time_ - var_280_14) / var_280_16
				local var_280_18 = Mathf.Lerp(arg_277_1.var_.alphaOldValue10030, 1, var_280_17)

				if arg_277_1.var_.characterEffect10030 then
					arg_277_1.var_.characterEffect10030.alpha = var_280_18
				end
			end

			if arg_277_1.time_ >= var_280_14 + var_280_16 and arg_277_1.time_ < var_280_14 + var_280_16 + arg_280_0 and arg_277_1.var_.characterEffect10030 then
				arg_277_1.var_.characterEffect10030.alpha = 1
			end

			local var_280_19 = 0
			local var_280_20 = 0.325

			if var_280_19 < arg_277_1.time_ and arg_277_1.time_ <= var_280_19 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_21 = arg_277_1:FormatText(StoryNameCfg[309].name)

				arg_277_1.leftNameTxt_.text = var_280_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_22 = arg_277_1:GetWordFromCfg(115291069)
				local var_280_23 = arg_277_1:FormatText(var_280_22.content)

				arg_277_1.text_.text = var_280_23

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_24 = 13
				local var_280_25 = utf8.len(var_280_23)
				local var_280_26 = var_280_24 <= 0 and var_280_20 or var_280_20 * (var_280_25 / var_280_24)

				if var_280_26 > 0 and var_280_20 < var_280_26 then
					arg_277_1.talkMaxDuration = var_280_26

					if var_280_26 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_26 + var_280_19
					end
				end

				arg_277_1.text_.text = var_280_23
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291069", "story_v_out_115291.awb") ~= 0 then
					local var_280_27 = manager.audio:GetVoiceLength("story_v_out_115291", "115291069", "story_v_out_115291.awb") / 1000

					if var_280_27 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_27 + var_280_19
					end

					if var_280_22.prefab_name ~= "" and arg_277_1.actors_[var_280_22.prefab_name] ~= nil then
						local var_280_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_22.prefab_name].transform, "story_v_out_115291", "115291069", "story_v_out_115291.awb")

						arg_277_1:RecordAudio("115291069", var_280_28)
						arg_277_1:RecordAudio("115291069", var_280_28)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_115291", "115291069", "story_v_out_115291.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_115291", "115291069", "story_v_out_115291.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_29 = math.max(var_280_20, arg_277_1.talkMaxDuration)

			if var_280_19 <= arg_277_1.time_ and arg_277_1.time_ < var_280_19 + var_280_29 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_19) / var_280_29

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_19 + var_280_29 and arg_277_1.time_ < var_280_19 + var_280_29 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play115291070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 115291070
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play115291071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["10030"].transform
			local var_284_1 = 0.332666666666667

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos10030 = var_284_0.localPosition
				var_284_0.localScale = Vector3.New(1, 1, 1)

				arg_281_1:CheckSpriteTmpPos("10030", 0)

				local var_284_2 = var_284_0.childCount

				for iter_284_0 = 0, var_284_2 - 1 do
					local var_284_3 = var_284_0:GetChild(iter_284_0)

					if var_284_3.name == "split_3" or not string.find(var_284_3.name, "split") then
						var_284_3.gameObject:SetActive(true)
					else
						var_284_3.gameObject:SetActive(false)
					end
				end
			end

			local var_284_4 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_4 then
				local var_284_5 = (arg_281_1.time_ - var_284_1) / var_284_4
				local var_284_6 = Vector3.New(-1500, -350, -180)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos10030, var_284_6, var_284_5)
			end

			if arg_281_1.time_ >= var_284_1 + var_284_4 and arg_281_1.time_ < var_284_1 + var_284_4 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_284_7 = arg_281_1.actors_["10030"]
			local var_284_8 = 0

			if var_284_8 < arg_281_1.time_ and arg_281_1.time_ <= var_284_8 + arg_284_0 then
				local var_284_9 = var_284_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_284_9 then
					arg_281_1.var_.alphaOldValue10030 = var_284_9.alpha
					arg_281_1.var_.characterEffect10030 = var_284_9
				end

				arg_281_1.var_.alphaOldValue10030 = 1
			end

			local var_284_10 = 0.333333333333333

			if var_284_8 <= arg_281_1.time_ and arg_281_1.time_ < var_284_8 + var_284_10 then
				local var_284_11 = (arg_281_1.time_ - var_284_8) / var_284_10
				local var_284_12 = Mathf.Lerp(arg_281_1.var_.alphaOldValue10030, 0, var_284_11)

				if arg_281_1.var_.characterEffect10030 then
					arg_281_1.var_.characterEffect10030.alpha = var_284_12
				end
			end

			if arg_281_1.time_ >= var_284_8 + var_284_10 and arg_281_1.time_ < var_284_8 + var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect10030 then
				arg_281_1.var_.characterEffect10030.alpha = 0
			end

			local var_284_13 = 0
			local var_284_14 = 0.4

			if var_284_13 < arg_281_1.time_ and arg_281_1.time_ <= var_284_13 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_15 = arg_281_1:GetWordFromCfg(115291070)
				local var_284_16 = arg_281_1:FormatText(var_284_15.content)

				arg_281_1.text_.text = var_284_16

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_17 = 17
				local var_284_18 = utf8.len(var_284_16)
				local var_284_19 = var_284_17 <= 0 and var_284_14 or var_284_14 * (var_284_18 / var_284_17)

				if var_284_19 > 0 and var_284_14 < var_284_19 then
					arg_281_1.talkMaxDuration = var_284_19

					if var_284_19 + var_284_13 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_19 + var_284_13
					end
				end

				arg_281_1.text_.text = var_284_16
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_20 = math.max(var_284_14, arg_281_1.talkMaxDuration)

			if var_284_13 <= arg_281_1.time_ and arg_281_1.time_ < var_284_13 + var_284_20 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_13) / var_284_20

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_13 + var_284_20 and arg_281_1.time_ < var_284_13 + var_284_20 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play115291071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 115291071
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play115291072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.725

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, false)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_2 = arg_285_1:GetWordFromCfg(115291071)
				local var_288_3 = arg_285_1:FormatText(var_288_2.content)

				arg_285_1.text_.text = var_288_3

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_4 = 29
				local var_288_5 = utf8.len(var_288_3)
				local var_288_6 = var_288_4 <= 0 and var_288_1 or var_288_1 * (var_288_5 / var_288_4)

				if var_288_6 > 0 and var_288_1 < var_288_6 then
					arg_285_1.talkMaxDuration = var_288_6

					if var_288_6 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_6 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_3
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_7 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_7 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_7

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_7 and arg_285_1.time_ < var_288_0 + var_288_7 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play115291072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 115291072
		arg_289_1.duration_ = 8

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play115291073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = "STblack"

			if arg_289_1.bgs_[var_292_0] == nil then
				local var_292_1 = Object.Instantiate(arg_289_1.paintGo_)

				var_292_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_292_0)
				var_292_1.name = var_292_0
				var_292_1.transform.parent = arg_289_1.stage_.transform
				var_292_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_289_1.bgs_[var_292_0] = var_292_1
			end

			local var_292_2 = 1

			if var_292_2 < arg_289_1.time_ and arg_289_1.time_ <= var_292_2 + arg_292_0 then
				local var_292_3 = manager.ui.mainCamera.transform.localPosition
				local var_292_4 = Vector3.New(0, 0, 10) + Vector3.New(var_292_3.x, var_292_3.y, 0)
				local var_292_5 = arg_289_1.bgs_.STblack

				var_292_5.transform.localPosition = var_292_4
				var_292_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_292_6 = var_292_5:GetComponent("SpriteRenderer")

				if var_292_6 and var_292_6.sprite then
					local var_292_7 = (var_292_5.transform.localPosition - var_292_3).z
					local var_292_8 = manager.ui.mainCameraCom_
					local var_292_9 = 2 * var_292_7 * Mathf.Tan(var_292_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_292_10 = var_292_9 * var_292_8.aspect
					local var_292_11 = var_292_6.sprite.bounds.size.x
					local var_292_12 = var_292_6.sprite.bounds.size.y
					local var_292_13 = var_292_10 / var_292_11
					local var_292_14 = var_292_9 / var_292_12
					local var_292_15 = var_292_14 < var_292_13 and var_292_13 or var_292_14

					var_292_5.transform.localScale = Vector3.New(var_292_15, var_292_15, 0)
				end

				for iter_292_0, iter_292_1 in pairs(arg_289_1.bgs_) do
					if iter_292_0 ~= "STblack" then
						iter_292_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_292_16 = 1

			if var_292_16 < arg_289_1.time_ and arg_289_1.time_ <= var_292_16 + arg_292_0 then
				arg_289_1.mask_.enabled = true
				arg_289_1.mask_.raycastTarget = false

				arg_289_1:SetGaussion(false)
			end

			local var_292_17 = 2

			if var_292_16 <= arg_289_1.time_ and arg_289_1.time_ < var_292_16 + var_292_17 then
				local var_292_18 = (arg_289_1.time_ - var_292_16) / var_292_17
				local var_292_19 = Color.New(0, 0, 0)

				var_292_19.a = Mathf.Lerp(1, 0, var_292_18)
				arg_289_1.mask_.color = var_292_19
			end

			if arg_289_1.time_ >= var_292_16 + var_292_17 and arg_289_1.time_ < var_292_16 + var_292_17 + arg_292_0 then
				local var_292_20 = Color.New(0, 0, 0)
				local var_292_21 = 0

				arg_289_1.mask_.enabled = false
				var_292_20.a = var_292_21
				arg_289_1.mask_.color = var_292_20
			end

			local var_292_22 = 0

			if var_292_22 < arg_289_1.time_ and arg_289_1.time_ <= var_292_22 + arg_292_0 then
				arg_289_1.mask_.enabled = true
				arg_289_1.mask_.raycastTarget = false

				arg_289_1:SetGaussion(false)
			end

			local var_292_23 = 1

			if var_292_22 <= arg_289_1.time_ and arg_289_1.time_ < var_292_22 + var_292_23 then
				local var_292_24 = (arg_289_1.time_ - var_292_22) / var_292_23
				local var_292_25 = Color.New(0, 0, 0)

				var_292_25.a = Mathf.Lerp(0, 1, var_292_24)
				arg_289_1.mask_.color = var_292_25
			end

			if arg_289_1.time_ >= var_292_22 + var_292_23 and arg_289_1.time_ < var_292_22 + var_292_23 + arg_292_0 then
				local var_292_26 = Color.New(0, 0, 0)

				var_292_26.a = 1
				arg_289_1.mask_.color = var_292_26
			end

			if arg_289_1.frameCnt_ <= 1 then
				arg_289_1.dialog_:SetActive(false)
			end

			local var_292_27 = 3
			local var_292_28 = 1.65

			if var_292_27 < arg_289_1.time_ and arg_289_1.time_ <= var_292_27 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0

				arg_289_1.dialog_:SetActive(true)

				local var_292_29 = LeanTween.value(arg_289_1.dialog_, 0, 1, 0.3)

				var_292_29:setOnUpdate(LuaHelper.FloatAction(function(arg_293_0)
					arg_289_1.dialogCg_.alpha = arg_293_0
				end))
				var_292_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_289_1.dialog_)
					var_292_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_289_1.duration_ = arg_289_1.duration_ + 0.3

				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_30 = arg_289_1:GetWordFromCfg(115291072)
				local var_292_31 = arg_289_1:FormatText(var_292_30.content)

				arg_289_1.text_.text = var_292_31

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_32 = 66
				local var_292_33 = utf8.len(var_292_31)
				local var_292_34 = var_292_32 <= 0 and var_292_28 or var_292_28 * (var_292_33 / var_292_32)

				if var_292_34 > 0 and var_292_28 < var_292_34 then
					arg_289_1.talkMaxDuration = var_292_34
					var_292_27 = var_292_27 + 0.3

					if var_292_34 + var_292_27 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_34 + var_292_27
					end
				end

				arg_289_1.text_.text = var_292_31
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_35 = var_292_27 + 0.3
			local var_292_36 = math.max(var_292_28, arg_289_1.talkMaxDuration)

			if var_292_35 <= arg_289_1.time_ and arg_289_1.time_ < var_292_35 + var_292_36 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_35) / var_292_36

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_35 + var_292_36 and arg_289_1.time_ < var_292_35 + var_292_36 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play115291073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 115291073
		arg_295_1.duration_ = 2.133

		local var_295_0 = {
			ja = 2.133,
			ko = 1.2,
			zh = 1.933,
			en = 1.166
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
				arg_295_0:Play115291074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 0.05

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_2 = arg_295_1:FormatText(StoryNameCfg[309].name)

				arg_295_1.leftNameTxt_.text = var_298_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, true)
				arg_295_1.iconController_:SetSelectedState("hero")

				arg_295_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_3")

				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_3 = arg_295_1:GetWordFromCfg(115291073)
				local var_298_4 = arg_295_1:FormatText(var_298_3.content)

				arg_295_1.text_.text = var_298_4

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_5 = 2
				local var_298_6 = utf8.len(var_298_4)
				local var_298_7 = var_298_5 <= 0 and var_298_1 or var_298_1 * (var_298_6 / var_298_5)

				if var_298_7 > 0 and var_298_1 < var_298_7 then
					arg_295_1.talkMaxDuration = var_298_7

					if var_298_7 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_7 + var_298_0
					end
				end

				arg_295_1.text_.text = var_298_4
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291073", "story_v_out_115291.awb") ~= 0 then
					local var_298_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291073", "story_v_out_115291.awb") / 1000

					if var_298_8 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_8 + var_298_0
					end

					if var_298_3.prefab_name ~= "" and arg_295_1.actors_[var_298_3.prefab_name] ~= nil then
						local var_298_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_3.prefab_name].transform, "story_v_out_115291", "115291073", "story_v_out_115291.awb")

						arg_295_1:RecordAudio("115291073", var_298_9)
						arg_295_1:RecordAudio("115291073", var_298_9)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_115291", "115291073", "story_v_out_115291.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_115291", "115291073", "story_v_out_115291.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_10 = math.max(var_298_1, arg_295_1.talkMaxDuration)

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_10 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_0) / var_298_10

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_0 + var_298_10 and arg_295_1.time_ < var_298_0 + var_298_10 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play115291074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 115291074
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play115291075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 1.925

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_2 = arg_299_1:GetWordFromCfg(115291074)
				local var_302_3 = arg_299_1:FormatText(var_302_2.content)

				arg_299_1.text_.text = var_302_3

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_4 = 77
				local var_302_5 = utf8.len(var_302_3)
				local var_302_6 = var_302_4 <= 0 and var_302_1 or var_302_1 * (var_302_5 / var_302_4)

				if var_302_6 > 0 and var_302_1 < var_302_6 then
					arg_299_1.talkMaxDuration = var_302_6

					if var_302_6 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_6 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_3
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_7 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_7 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_7

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_7 and arg_299_1.time_ < var_302_0 + var_302_7 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play115291075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 115291075
		arg_303_1.duration_ = 2.2

		local var_303_0 = {
			ja = 2.2,
			ko = 0.999999999999,
			zh = 2,
			en = 1.1
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
				arg_303_0:Play115291076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.05

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[309].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, true)
				arg_303_1.iconController_:SetSelectedState("hero")

				arg_303_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_3")

				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_3 = arg_303_1:GetWordFromCfg(115291075)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 2
				local var_306_6 = utf8.len(var_306_4)
				local var_306_7 = var_306_5 <= 0 and var_306_1 or var_306_1 * (var_306_6 / var_306_5)

				if var_306_7 > 0 and var_306_1 < var_306_7 then
					arg_303_1.talkMaxDuration = var_306_7

					if var_306_7 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_7 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_4
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291075", "story_v_out_115291.awb") ~= 0 then
					local var_306_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291075", "story_v_out_115291.awb") / 1000

					if var_306_8 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_8 + var_306_0
					end

					if var_306_3.prefab_name ~= "" and arg_303_1.actors_[var_306_3.prefab_name] ~= nil then
						local var_306_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_3.prefab_name].transform, "story_v_out_115291", "115291075", "story_v_out_115291.awb")

						arg_303_1:RecordAudio("115291075", var_306_9)
						arg_303_1:RecordAudio("115291075", var_306_9)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_115291", "115291075", "story_v_out_115291.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_115291", "115291075", "story_v_out_115291.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_10 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_10 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_10

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_10 and arg_303_1.time_ < var_306_0 + var_306_10 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play115291076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 115291076
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play115291077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 1.875

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

				local var_310_2 = arg_307_1:GetWordFromCfg(115291076)
				local var_310_3 = arg_307_1:FormatText(var_310_2.content)

				arg_307_1.text_.text = var_310_3

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_4 = 75
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
	Play115291077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 115291077
		arg_311_1.duration_ = 2.4

		local var_311_0 = {
			ja = 2.4,
			ko = 1.433,
			zh = 1.866,
			en = 2
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play115291078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.175

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_2 = arg_311_1:FormatText(StoryNameCfg[309].name)

				arg_311_1.leftNameTxt_.text = var_314_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, true)
				arg_311_1.iconController_:SetSelectedState("hero")

				arg_311_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_3")

				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_3 = arg_311_1:GetWordFromCfg(115291077)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 7
				local var_314_6 = utf8.len(var_314_4)
				local var_314_7 = var_314_5 <= 0 and var_314_1 or var_314_1 * (var_314_6 / var_314_5)

				if var_314_7 > 0 and var_314_1 < var_314_7 then
					arg_311_1.talkMaxDuration = var_314_7

					if var_314_7 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_7 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_4
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291077", "story_v_out_115291.awb") ~= 0 then
					local var_314_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291077", "story_v_out_115291.awb") / 1000

					if var_314_8 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_8 + var_314_0
					end

					if var_314_3.prefab_name ~= "" and arg_311_1.actors_[var_314_3.prefab_name] ~= nil then
						local var_314_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_3.prefab_name].transform, "story_v_out_115291", "115291077", "story_v_out_115291.awb")

						arg_311_1:RecordAudio("115291077", var_314_9)
						arg_311_1:RecordAudio("115291077", var_314_9)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_115291", "115291077", "story_v_out_115291.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_115291", "115291077", "story_v_out_115291.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_10 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_10 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_10

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_10 and arg_311_1.time_ < var_314_0 + var_314_10 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play115291078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 115291078
		arg_315_1.duration_ = 9

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play115291079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 2

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				local var_318_1 = manager.ui.mainCamera.transform.localPosition
				local var_318_2 = Vector3.New(0, 0, 10) + Vector3.New(var_318_1.x, var_318_1.y, 0)
				local var_318_3 = arg_315_1.bgs_.ST22a

				var_318_3.transform.localPosition = var_318_2
				var_318_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_318_4 = var_318_3:GetComponent("SpriteRenderer")

				if var_318_4 and var_318_4.sprite then
					local var_318_5 = (var_318_3.transform.localPosition - var_318_1).z
					local var_318_6 = manager.ui.mainCameraCom_
					local var_318_7 = 2 * var_318_5 * Mathf.Tan(var_318_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_318_8 = var_318_7 * var_318_6.aspect
					local var_318_9 = var_318_4.sprite.bounds.size.x
					local var_318_10 = var_318_4.sprite.bounds.size.y
					local var_318_11 = var_318_8 / var_318_9
					local var_318_12 = var_318_7 / var_318_10
					local var_318_13 = var_318_12 < var_318_11 and var_318_11 or var_318_12

					var_318_3.transform.localScale = Vector3.New(var_318_13, var_318_13, 0)
				end

				for iter_318_0, iter_318_1 in pairs(arg_315_1.bgs_) do
					if iter_318_0 ~= "ST22a" then
						iter_318_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_318_14 = 2

			if var_318_14 < arg_315_1.time_ and arg_315_1.time_ <= var_318_14 + arg_318_0 then
				arg_315_1.mask_.enabled = true
				arg_315_1.mask_.raycastTarget = false

				arg_315_1:SetGaussion(false)
			end

			local var_318_15 = 2

			if var_318_14 <= arg_315_1.time_ and arg_315_1.time_ < var_318_14 + var_318_15 then
				local var_318_16 = (arg_315_1.time_ - var_318_14) / var_318_15
				local var_318_17 = Color.New(0, 0, 0)

				var_318_17.a = Mathf.Lerp(1, 0, var_318_16)
				arg_315_1.mask_.color = var_318_17
			end

			if arg_315_1.time_ >= var_318_14 + var_318_15 and arg_315_1.time_ < var_318_14 + var_318_15 + arg_318_0 then
				local var_318_18 = Color.New(0, 0, 0)
				local var_318_19 = 0

				arg_315_1.mask_.enabled = false
				var_318_18.a = var_318_19
				arg_315_1.mask_.color = var_318_18
			end

			local var_318_20 = 0

			if var_318_20 < arg_315_1.time_ and arg_315_1.time_ <= var_318_20 + arg_318_0 then
				arg_315_1.mask_.enabled = true
				arg_315_1.mask_.raycastTarget = false

				arg_315_1:SetGaussion(false)
			end

			local var_318_21 = 2

			if var_318_20 <= arg_315_1.time_ and arg_315_1.time_ < var_318_20 + var_318_21 then
				local var_318_22 = (arg_315_1.time_ - var_318_20) / var_318_21
				local var_318_23 = Color.New(0, 0, 0)

				var_318_23.a = Mathf.Lerp(0, 1, var_318_22)
				arg_315_1.mask_.color = var_318_23
			end

			if arg_315_1.time_ >= var_318_20 + var_318_21 and arg_315_1.time_ < var_318_20 + var_318_21 + arg_318_0 then
				local var_318_24 = Color.New(0, 0, 0)

				var_318_24.a = 1
				arg_315_1.mask_.color = var_318_24
			end

			if arg_315_1.frameCnt_ <= 1 then
				arg_315_1.dialog_:SetActive(false)
			end

			local var_318_25 = 4
			local var_318_26 = 1.15

			if var_318_25 < arg_315_1.time_ and arg_315_1.time_ <= var_318_25 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0

				arg_315_1.dialog_:SetActive(true)

				local var_318_27 = LeanTween.value(arg_315_1.dialog_, 0, 1, 0.3)

				var_318_27:setOnUpdate(LuaHelper.FloatAction(function(arg_319_0)
					arg_315_1.dialogCg_.alpha = arg_319_0
				end))
				var_318_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_315_1.dialog_)
					var_318_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_315_1.duration_ = arg_315_1.duration_ + 0.3

				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_28 = arg_315_1:GetWordFromCfg(115291078)
				local var_318_29 = arg_315_1:FormatText(var_318_28.content)

				arg_315_1.text_.text = var_318_29

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_30 = 46
				local var_318_31 = utf8.len(var_318_29)
				local var_318_32 = var_318_30 <= 0 and var_318_26 or var_318_26 * (var_318_31 / var_318_30)

				if var_318_32 > 0 and var_318_26 < var_318_32 then
					arg_315_1.talkMaxDuration = var_318_32
					var_318_25 = var_318_25 + 0.3

					if var_318_32 + var_318_25 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_32 + var_318_25
					end
				end

				arg_315_1.text_.text = var_318_29
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_33 = var_318_25 + 0.3
			local var_318_34 = math.max(var_318_26, arg_315_1.talkMaxDuration)

			if var_318_33 <= arg_315_1.time_ and arg_315_1.time_ < var_318_33 + var_318_34 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_33) / var_318_34

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_33 + var_318_34 and arg_315_1.time_ < var_318_33 + var_318_34 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play115291079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 115291079
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play115291080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 1.425

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_2 = arg_321_1:GetWordFromCfg(115291079)
				local var_324_3 = arg_321_1:FormatText(var_324_2.content)

				arg_321_1.text_.text = var_324_3

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_4 = 57
				local var_324_5 = utf8.len(var_324_3)
				local var_324_6 = var_324_4 <= 0 and var_324_1 or var_324_1 * (var_324_5 / var_324_4)

				if var_324_6 > 0 and var_324_1 < var_324_6 then
					arg_321_1.talkMaxDuration = var_324_6

					if var_324_6 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_6 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_3
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_7 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_7 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_7

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_7 and arg_321_1.time_ < var_324_0 + var_324_7 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play115291080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 115291080
		arg_325_1.duration_ = 3.733

		local var_325_0 = {
			ja = 3.733,
			ko = 1.666,
			zh = 2.466,
			en = 2.8
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play115291081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["10030"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos10030 = var_328_0.localPosition
				var_328_0.localScale = Vector3.New(1, 1, 1)

				arg_325_1:CheckSpriteTmpPos("10030", 3)

				local var_328_2 = var_328_0.childCount

				for iter_328_0 = 0, var_328_2 - 1 do
					local var_328_3 = var_328_0:GetChild(iter_328_0)

					if var_328_3.name == "split_3" or not string.find(var_328_3.name, "split") then
						var_328_3.gameObject:SetActive(true)
					else
						var_328_3.gameObject:SetActive(false)
					end
				end
			end

			local var_328_4 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_4 then
				local var_328_5 = (arg_325_1.time_ - var_328_1) / var_328_4
				local var_328_6 = Vector3.New(0, -390, 150)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos10030, var_328_6, var_328_5)
			end

			if arg_325_1.time_ >= var_328_1 + var_328_4 and arg_325_1.time_ < var_328_1 + var_328_4 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_328_7 = arg_325_1.actors_["10030"]
			local var_328_8 = 0

			if var_328_8 < arg_325_1.time_ and arg_325_1.time_ <= var_328_8 + arg_328_0 then
				local var_328_9 = var_328_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_328_9 then
					arg_325_1.var_.alphaOldValue10030 = var_328_9.alpha
					arg_325_1.var_.characterEffect10030 = var_328_9
				end

				arg_325_1.var_.alphaOldValue10030 = 0
			end

			local var_328_10 = 0.333333333333333

			if var_328_8 <= arg_325_1.time_ and arg_325_1.time_ < var_328_8 + var_328_10 then
				local var_328_11 = (arg_325_1.time_ - var_328_8) / var_328_10
				local var_328_12 = Mathf.Lerp(arg_325_1.var_.alphaOldValue10030, 1, var_328_11)

				if arg_325_1.var_.characterEffect10030 then
					arg_325_1.var_.characterEffect10030.alpha = var_328_12
				end
			end

			if arg_325_1.time_ >= var_328_8 + var_328_10 and arg_325_1.time_ < var_328_8 + var_328_10 + arg_328_0 and arg_325_1.var_.characterEffect10030 then
				arg_325_1.var_.characterEffect10030.alpha = 1
			end

			local var_328_13 = 0
			local var_328_14 = 0.175

			if var_328_13 < arg_325_1.time_ and arg_325_1.time_ <= var_328_13 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_15 = arg_325_1:FormatText(StoryNameCfg[309].name)

				arg_325_1.leftNameTxt_.text = var_328_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_16 = arg_325_1:GetWordFromCfg(115291080)
				local var_328_17 = arg_325_1:FormatText(var_328_16.content)

				arg_325_1.text_.text = var_328_17

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_18 = 7
				local var_328_19 = utf8.len(var_328_17)
				local var_328_20 = var_328_18 <= 0 and var_328_14 or var_328_14 * (var_328_19 / var_328_18)

				if var_328_20 > 0 and var_328_14 < var_328_20 then
					arg_325_1.talkMaxDuration = var_328_20

					if var_328_20 + var_328_13 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_20 + var_328_13
					end
				end

				arg_325_1.text_.text = var_328_17
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291080", "story_v_out_115291.awb") ~= 0 then
					local var_328_21 = manager.audio:GetVoiceLength("story_v_out_115291", "115291080", "story_v_out_115291.awb") / 1000

					if var_328_21 + var_328_13 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_21 + var_328_13
					end

					if var_328_16.prefab_name ~= "" and arg_325_1.actors_[var_328_16.prefab_name] ~= nil then
						local var_328_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_16.prefab_name].transform, "story_v_out_115291", "115291080", "story_v_out_115291.awb")

						arg_325_1:RecordAudio("115291080", var_328_22)
						arg_325_1:RecordAudio("115291080", var_328_22)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_115291", "115291080", "story_v_out_115291.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_115291", "115291080", "story_v_out_115291.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_23 = math.max(var_328_14, arg_325_1.talkMaxDuration)

			if var_328_13 <= arg_325_1.time_ and arg_325_1.time_ < var_328_13 + var_328_23 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_13) / var_328_23

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_13 + var_328_23 and arg_325_1.time_ < var_328_13 + var_328_23 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play115291081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 115291081
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play115291082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["10030"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				local var_332_2 = var_332_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_332_2 then
					arg_329_1.var_.alphaOldValue10030 = var_332_2.alpha
					arg_329_1.var_.characterEffect10030 = var_332_2
				end

				arg_329_1.var_.alphaOldValue10030 = 1
			end

			local var_332_3 = 0.333333333333333

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_3 then
				local var_332_4 = (arg_329_1.time_ - var_332_1) / var_332_3
				local var_332_5 = Mathf.Lerp(arg_329_1.var_.alphaOldValue10030, 0, var_332_4)

				if arg_329_1.var_.characterEffect10030 then
					arg_329_1.var_.characterEffect10030.alpha = var_332_5
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_3 and arg_329_1.time_ < var_332_1 + var_332_3 + arg_332_0 and arg_329_1.var_.characterEffect10030 then
				arg_329_1.var_.characterEffect10030.alpha = 0
			end

			local var_332_6 = 0
			local var_332_7 = 1.25

			if var_332_6 < arg_329_1.time_ and arg_329_1.time_ <= var_332_6 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_8 = arg_329_1:GetWordFromCfg(115291081)
				local var_332_9 = arg_329_1:FormatText(var_332_8.content)

				arg_329_1.text_.text = var_332_9

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_10 = 50
				local var_332_11 = utf8.len(var_332_9)
				local var_332_12 = var_332_10 <= 0 and var_332_7 or var_332_7 * (var_332_11 / var_332_10)

				if var_332_12 > 0 and var_332_7 < var_332_12 then
					arg_329_1.talkMaxDuration = var_332_12

					if var_332_12 + var_332_6 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_12 + var_332_6
					end
				end

				arg_329_1.text_.text = var_332_9
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_13 = math.max(var_332_7, arg_329_1.talkMaxDuration)

			if var_332_6 <= arg_329_1.time_ and arg_329_1.time_ < var_332_6 + var_332_13 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_6) / var_332_13

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_6 + var_332_13 and arg_329_1.time_ < var_332_6 + var_332_13 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play115291082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 115291082
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play115291083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.9

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_2 = arg_333_1:GetWordFromCfg(115291082)
				local var_336_3 = arg_333_1:FormatText(var_336_2.content)

				arg_333_1.text_.text = var_336_3

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_4 = 36
				local var_336_5 = utf8.len(var_336_3)
				local var_336_6 = var_336_4 <= 0 and var_336_1 or var_336_1 * (var_336_5 / var_336_4)

				if var_336_6 > 0 and var_336_1 < var_336_6 then
					arg_333_1.talkMaxDuration = var_336_6

					if var_336_6 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_6 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_3
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_7 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_7 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_7

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_7 and arg_333_1.time_ < var_336_0 + var_336_7 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play115291083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 115291083
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play115291084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.975

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_2 = arg_337_1:GetWordFromCfg(115291083)
				local var_340_3 = arg_337_1:FormatText(var_340_2.content)

				arg_337_1.text_.text = var_340_3

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_4 = 39
				local var_340_5 = utf8.len(var_340_3)
				local var_340_6 = var_340_4 <= 0 and var_340_1 or var_340_1 * (var_340_5 / var_340_4)

				if var_340_6 > 0 and var_340_1 < var_340_6 then
					arg_337_1.talkMaxDuration = var_340_6

					if var_340_6 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_6 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_3
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_7 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_7 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_7

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_7 and arg_337_1.time_ < var_340_0 + var_340_7 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play115291084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 115291084
		arg_341_1.duration_ = 7.933

		local var_341_0 = {
			ja = 6.5,
			ko = 7.933,
			zh = 6.3,
			en = 6.533
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
				arg_341_0:Play115291085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10030"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos10030 = var_344_0.localPosition
				var_344_0.localScale = Vector3.New(1, 1, 1)

				arg_341_1:CheckSpriteTmpPos("10030", 3)

				local var_344_2 = var_344_0.childCount

				for iter_344_0 = 0, var_344_2 - 1 do
					local var_344_3 = var_344_0:GetChild(iter_344_0)

					if var_344_3.name == "split_3" or not string.find(var_344_3.name, "split") then
						var_344_3.gameObject:SetActive(true)
					else
						var_344_3.gameObject:SetActive(false)
					end
				end
			end

			local var_344_4 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_4 then
				local var_344_5 = (arg_341_1.time_ - var_344_1) / var_344_4
				local var_344_6 = Vector3.New(0, -390, 150)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos10030, var_344_6, var_344_5)
			end

			if arg_341_1.time_ >= var_344_1 + var_344_4 and arg_341_1.time_ < var_344_1 + var_344_4 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_344_7 = arg_341_1.actors_["10030"]
			local var_344_8 = 0

			if var_344_8 < arg_341_1.time_ and arg_341_1.time_ <= var_344_8 + arg_344_0 then
				local var_344_9 = var_344_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_344_9 then
					arg_341_1.var_.alphaOldValue10030 = var_344_9.alpha
					arg_341_1.var_.characterEffect10030 = var_344_9
				end

				arg_341_1.var_.alphaOldValue10030 = 0
			end

			local var_344_10 = 0.333333333333333

			if var_344_8 <= arg_341_1.time_ and arg_341_1.time_ < var_344_8 + var_344_10 then
				local var_344_11 = (arg_341_1.time_ - var_344_8) / var_344_10
				local var_344_12 = Mathf.Lerp(arg_341_1.var_.alphaOldValue10030, 1, var_344_11)

				if arg_341_1.var_.characterEffect10030 then
					arg_341_1.var_.characterEffect10030.alpha = var_344_12
				end
			end

			if arg_341_1.time_ >= var_344_8 + var_344_10 and arg_341_1.time_ < var_344_8 + var_344_10 + arg_344_0 and arg_341_1.var_.characterEffect10030 then
				arg_341_1.var_.characterEffect10030.alpha = 1
			end

			local var_344_13 = 0
			local var_344_14 = 0.55

			if var_344_13 < arg_341_1.time_ and arg_341_1.time_ <= var_344_13 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_15 = arg_341_1:FormatText(StoryNameCfg[309].name)

				arg_341_1.leftNameTxt_.text = var_344_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_16 = arg_341_1:GetWordFromCfg(115291084)
				local var_344_17 = arg_341_1:FormatText(var_344_16.content)

				arg_341_1.text_.text = var_344_17

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_18 = 25
				local var_344_19 = utf8.len(var_344_17)
				local var_344_20 = var_344_18 <= 0 and var_344_14 or var_344_14 * (var_344_19 / var_344_18)

				if var_344_20 > 0 and var_344_14 < var_344_20 then
					arg_341_1.talkMaxDuration = var_344_20

					if var_344_20 + var_344_13 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_20 + var_344_13
					end
				end

				arg_341_1.text_.text = var_344_17
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291084", "story_v_out_115291.awb") ~= 0 then
					local var_344_21 = manager.audio:GetVoiceLength("story_v_out_115291", "115291084", "story_v_out_115291.awb") / 1000

					if var_344_21 + var_344_13 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_21 + var_344_13
					end

					if var_344_16.prefab_name ~= "" and arg_341_1.actors_[var_344_16.prefab_name] ~= nil then
						local var_344_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_16.prefab_name].transform, "story_v_out_115291", "115291084", "story_v_out_115291.awb")

						arg_341_1:RecordAudio("115291084", var_344_22)
						arg_341_1:RecordAudio("115291084", var_344_22)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_115291", "115291084", "story_v_out_115291.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_115291", "115291084", "story_v_out_115291.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_23 = math.max(var_344_14, arg_341_1.talkMaxDuration)

			if var_344_13 <= arg_341_1.time_ and arg_341_1.time_ < var_344_13 + var_344_23 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_13) / var_344_23

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_13 + var_344_23 and arg_341_1.time_ < var_344_13 + var_344_23 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play115291085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 115291085
		arg_345_1.duration_ = 8

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play115291086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = "RO0502"

			if arg_345_1.bgs_[var_348_0] == nil then
				local var_348_1 = Object.Instantiate(arg_345_1.paintGo_)

				var_348_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_348_0)
				var_348_1.name = var_348_0
				var_348_1.transform.parent = arg_345_1.stage_.transform
				var_348_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_345_1.bgs_[var_348_0] = var_348_1
			end

			local var_348_2 = 1

			if var_348_2 < arg_345_1.time_ and arg_345_1.time_ <= var_348_2 + arg_348_0 then
				local var_348_3 = manager.ui.mainCamera.transform.localPosition
				local var_348_4 = Vector3.New(0, 0, 10) + Vector3.New(var_348_3.x, var_348_3.y, 0)
				local var_348_5 = arg_345_1.bgs_.RO0502

				var_348_5.transform.localPosition = var_348_4
				var_348_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_348_6 = var_348_5:GetComponent("SpriteRenderer")

				if var_348_6 and var_348_6.sprite then
					local var_348_7 = (var_348_5.transform.localPosition - var_348_3).z
					local var_348_8 = manager.ui.mainCameraCom_
					local var_348_9 = 2 * var_348_7 * Mathf.Tan(var_348_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_348_10 = var_348_9 * var_348_8.aspect
					local var_348_11 = var_348_6.sprite.bounds.size.x
					local var_348_12 = var_348_6.sprite.bounds.size.y
					local var_348_13 = var_348_10 / var_348_11
					local var_348_14 = var_348_9 / var_348_12
					local var_348_15 = var_348_14 < var_348_13 and var_348_13 or var_348_14

					var_348_5.transform.localScale = Vector3.New(var_348_15, var_348_15, 0)
				end

				for iter_348_0, iter_348_1 in pairs(arg_345_1.bgs_) do
					if iter_348_0 ~= "RO0502" then
						iter_348_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_348_16 = 0

			if var_348_16 < arg_345_1.time_ and arg_345_1.time_ <= var_348_16 + arg_348_0 then
				arg_345_1.mask_.enabled = true
				arg_345_1.mask_.raycastTarget = false

				arg_345_1:SetGaussion(false)
			end

			local var_348_17 = 1

			if var_348_16 <= arg_345_1.time_ and arg_345_1.time_ < var_348_16 + var_348_17 then
				local var_348_18 = (arg_345_1.time_ - var_348_16) / var_348_17
				local var_348_19 = Color.New(0, 0, 0)

				var_348_19.a = Mathf.Lerp(0, 1, var_348_18)
				arg_345_1.mask_.color = var_348_19
			end

			if arg_345_1.time_ >= var_348_16 + var_348_17 and arg_345_1.time_ < var_348_16 + var_348_17 + arg_348_0 then
				local var_348_20 = Color.New(0, 0, 0)

				var_348_20.a = 1
				arg_345_1.mask_.color = var_348_20
			end

			local var_348_21 = 1

			if var_348_21 < arg_345_1.time_ and arg_345_1.time_ <= var_348_21 + arg_348_0 then
				arg_345_1.mask_.enabled = true
				arg_345_1.mask_.raycastTarget = false

				arg_345_1:SetGaussion(false)
			end

			local var_348_22 = 2

			if var_348_21 <= arg_345_1.time_ and arg_345_1.time_ < var_348_21 + var_348_22 then
				local var_348_23 = (arg_345_1.time_ - var_348_21) / var_348_22
				local var_348_24 = Color.New(0, 0, 0)

				var_348_24.a = Mathf.Lerp(1, 0, var_348_23)
				arg_345_1.mask_.color = var_348_24
			end

			if arg_345_1.time_ >= var_348_21 + var_348_22 and arg_345_1.time_ < var_348_21 + var_348_22 + arg_348_0 then
				local var_348_25 = Color.New(0, 0, 0)
				local var_348_26 = 0

				arg_345_1.mask_.enabled = false
				var_348_25.a = var_348_26
				arg_345_1.mask_.color = var_348_25
			end

			local var_348_27 = arg_345_1.actors_["10030"].transform
			local var_348_28 = 0.999333333333333

			if var_348_28 < arg_345_1.time_ and arg_345_1.time_ <= var_348_28 + arg_348_0 then
				arg_345_1.var_.moveOldPos10030 = var_348_27.localPosition
				var_348_27.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("10030", 7)

				local var_348_29 = var_348_27.childCount

				for iter_348_2 = 0, var_348_29 - 1 do
					local var_348_30 = var_348_27:GetChild(iter_348_2)

					if var_348_30.name == "split_3" or not string.find(var_348_30.name, "split") then
						var_348_30.gameObject:SetActive(true)
					else
						var_348_30.gameObject:SetActive(false)
					end
				end
			end

			local var_348_31 = 0.001

			if var_348_28 <= arg_345_1.time_ and arg_345_1.time_ < var_348_28 + var_348_31 then
				local var_348_32 = (arg_345_1.time_ - var_348_28) / var_348_31
				local var_348_33 = Vector3.New(0, -2000, 150)

				var_348_27.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos10030, var_348_33, var_348_32)
			end

			if arg_345_1.time_ >= var_348_28 + var_348_31 and arg_345_1.time_ < var_348_28 + var_348_31 + arg_348_0 then
				var_348_27.localPosition = Vector3.New(0, -2000, 150)
			end

			if arg_345_1.frameCnt_ <= 1 then
				arg_345_1.dialog_:SetActive(false)
			end

			local var_348_34 = 3
			local var_348_35 = 1.55

			if var_348_34 < arg_345_1.time_ and arg_345_1.time_ <= var_348_34 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0

				arg_345_1.dialog_:SetActive(true)

				local var_348_36 = LeanTween.value(arg_345_1.dialog_, 0, 1, 0.3)

				var_348_36:setOnUpdate(LuaHelper.FloatAction(function(arg_349_0)
					arg_345_1.dialogCg_.alpha = arg_349_0
				end))
				var_348_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_345_1.dialog_)
					var_348_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_345_1.duration_ = arg_345_1.duration_ + 0.3

				SetActive(arg_345_1.leftNameGo_, false)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_37 = arg_345_1:GetWordFromCfg(115291085)
				local var_348_38 = arg_345_1:FormatText(var_348_37.content)

				arg_345_1.text_.text = var_348_38

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_39 = 62
				local var_348_40 = utf8.len(var_348_38)
				local var_348_41 = var_348_39 <= 0 and var_348_35 or var_348_35 * (var_348_40 / var_348_39)

				if var_348_41 > 0 and var_348_35 < var_348_41 then
					arg_345_1.talkMaxDuration = var_348_41
					var_348_34 = var_348_34 + 0.3

					if var_348_41 + var_348_34 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_41 + var_348_34
					end
				end

				arg_345_1.text_.text = var_348_38
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_42 = var_348_34 + 0.3
			local var_348_43 = math.max(var_348_35, arg_345_1.talkMaxDuration)

			if var_348_42 <= arg_345_1.time_ and arg_345_1.time_ < var_348_42 + var_348_43 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_42) / var_348_43

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_42 + var_348_43 and arg_345_1.time_ < var_348_42 + var_348_43 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play115291086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 115291086
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play115291087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 0.8

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_2 = arg_351_1:GetWordFromCfg(115291086)
				local var_354_3 = arg_351_1:FormatText(var_354_2.content)

				arg_351_1.text_.text = var_354_3

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_4 = 32
				local var_354_5 = utf8.len(var_354_3)
				local var_354_6 = var_354_4 <= 0 and var_354_1 or var_354_1 * (var_354_5 / var_354_4)

				if var_354_6 > 0 and var_354_1 < var_354_6 then
					arg_351_1.talkMaxDuration = var_354_6

					if var_354_6 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_6 + var_354_0
					end
				end

				arg_351_1.text_.text = var_354_3
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_7 = math.max(var_354_1, arg_351_1.talkMaxDuration)

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_7 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_0) / var_354_7

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_0 + var_354_7 and arg_351_1.time_ < var_354_0 + var_354_7 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play115291087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 115291087
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play115291088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.325

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_2 = arg_355_1:GetWordFromCfg(115291087)
				local var_358_3 = arg_355_1:FormatText(var_358_2.content)

				arg_355_1.text_.text = var_358_3

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_4 = 13
				local var_358_5 = utf8.len(var_358_3)
				local var_358_6 = var_358_4 <= 0 and var_358_1 or var_358_1 * (var_358_5 / var_358_4)

				if var_358_6 > 0 and var_358_1 < var_358_6 then
					arg_355_1.talkMaxDuration = var_358_6

					if var_358_6 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_6 + var_358_0
					end
				end

				arg_355_1.text_.text = var_358_3
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_7 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_7 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_7

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_7 and arg_355_1.time_ < var_358_0 + var_358_7 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play115291088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 115291088
		arg_359_1.duration_ = 3

		local var_359_0 = {
			ja = 3,
			ko = 1.9,
			zh = 2.7,
			en = 1.7
		}
		local var_359_1 = manager.audio:GetLocalizationFlag()

		if var_359_0[var_359_1] ~= nil then
			arg_359_1.duration_ = var_359_0[var_359_1]
		end

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play115291089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.175

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[309].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(115291088)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 7
				local var_362_6 = utf8.len(var_362_4)
				local var_362_7 = var_362_5 <= 0 and var_362_1 or var_362_1 * (var_362_6 / var_362_5)

				if var_362_7 > 0 and var_362_1 < var_362_7 then
					arg_359_1.talkMaxDuration = var_362_7

					if var_362_7 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_7 + var_362_0
					end
				end

				arg_359_1.text_.text = var_362_4
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291088", "story_v_out_115291.awb") ~= 0 then
					local var_362_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291088", "story_v_out_115291.awb") / 1000

					if var_362_8 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_8 + var_362_0
					end

					if var_362_3.prefab_name ~= "" and arg_359_1.actors_[var_362_3.prefab_name] ~= nil then
						local var_362_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_3.prefab_name].transform, "story_v_out_115291", "115291088", "story_v_out_115291.awb")

						arg_359_1:RecordAudio("115291088", var_362_9)
						arg_359_1:RecordAudio("115291088", var_362_9)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_115291", "115291088", "story_v_out_115291.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_115291", "115291088", "story_v_out_115291.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_10 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_10 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_10

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_10 and arg_359_1.time_ < var_362_0 + var_362_10 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play115291089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 115291089
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play115291090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0
			local var_366_1 = 0.5

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, false)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_2 = arg_363_1:GetWordFromCfg(115291089)
				local var_366_3 = arg_363_1:FormatText(var_366_2.content)

				arg_363_1.text_.text = var_366_3

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_4 = 20
				local var_366_5 = utf8.len(var_366_3)
				local var_366_6 = var_366_4 <= 0 and var_366_1 or var_366_1 * (var_366_5 / var_366_4)

				if var_366_6 > 0 and var_366_1 < var_366_6 then
					arg_363_1.talkMaxDuration = var_366_6

					if var_366_6 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_6 + var_366_0
					end
				end

				arg_363_1.text_.text = var_366_3
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_7 = math.max(var_366_1, arg_363_1.talkMaxDuration)

			if var_366_0 <= arg_363_1.time_ and arg_363_1.time_ < var_366_0 + var_366_7 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_0) / var_366_7

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_0 + var_366_7 and arg_363_1.time_ < var_366_0 + var_366_7 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play115291090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 115291090
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play115291091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0
			local var_370_1 = 1.475

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, false)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_2 = arg_367_1:GetWordFromCfg(115291090)
				local var_370_3 = arg_367_1:FormatText(var_370_2.content)

				arg_367_1.text_.text = var_370_3

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_4 = 59
				local var_370_5 = utf8.len(var_370_3)
				local var_370_6 = var_370_4 <= 0 and var_370_1 or var_370_1 * (var_370_5 / var_370_4)

				if var_370_6 > 0 and var_370_1 < var_370_6 then
					arg_367_1.talkMaxDuration = var_370_6

					if var_370_6 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_6 + var_370_0
					end
				end

				arg_367_1.text_.text = var_370_3
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_7 = math.max(var_370_1, arg_367_1.talkMaxDuration)

			if var_370_0 <= arg_367_1.time_ and arg_367_1.time_ < var_370_0 + var_370_7 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_0) / var_370_7

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_0 + var_370_7 and arg_367_1.time_ < var_370_0 + var_370_7 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play115291091 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 115291091
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play115291092(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 0.7

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_2 = arg_371_1:GetWordFromCfg(115291091)
				local var_374_3 = arg_371_1:FormatText(var_374_2.content)

				arg_371_1.text_.text = var_374_3

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_4 = 28
				local var_374_5 = utf8.len(var_374_3)
				local var_374_6 = var_374_4 <= 0 and var_374_1 or var_374_1 * (var_374_5 / var_374_4)

				if var_374_6 > 0 and var_374_1 < var_374_6 then
					arg_371_1.talkMaxDuration = var_374_6

					if var_374_6 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_6 + var_374_0
					end
				end

				arg_371_1.text_.text = var_374_3
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_7 = math.max(var_374_1, arg_371_1.talkMaxDuration)

			if var_374_0 <= arg_371_1.time_ and arg_371_1.time_ < var_374_0 + var_374_7 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_0) / var_374_7

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_0 + var_374_7 and arg_371_1.time_ < var_374_0 + var_374_7 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play115291092 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 115291092
		arg_375_1.duration_ = 3.7

		local var_375_0 = {
			ja = 2.5,
			ko = 1.1,
			zh = 3.7,
			en = 1.1
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
				arg_375_0:Play115291093(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0
			local var_378_1 = 0.075

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_2 = arg_375_1:FormatText(StoryNameCfg[309].name)

				arg_375_1.leftNameTxt_.text = var_378_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_3 = arg_375_1:GetWordFromCfg(115291092)
				local var_378_4 = arg_375_1:FormatText(var_378_3.content)

				arg_375_1.text_.text = var_378_4

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_5 = 3
				local var_378_6 = utf8.len(var_378_4)
				local var_378_7 = var_378_5 <= 0 and var_378_1 or var_378_1 * (var_378_6 / var_378_5)

				if var_378_7 > 0 and var_378_1 < var_378_7 then
					arg_375_1.talkMaxDuration = var_378_7

					if var_378_7 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_7 + var_378_0
					end
				end

				arg_375_1.text_.text = var_378_4
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291092", "story_v_out_115291.awb") ~= 0 then
					local var_378_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291092", "story_v_out_115291.awb") / 1000

					if var_378_8 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_8 + var_378_0
					end

					if var_378_3.prefab_name ~= "" and arg_375_1.actors_[var_378_3.prefab_name] ~= nil then
						local var_378_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_3.prefab_name].transform, "story_v_out_115291", "115291092", "story_v_out_115291.awb")

						arg_375_1:RecordAudio("115291092", var_378_9)
						arg_375_1:RecordAudio("115291092", var_378_9)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_115291", "115291092", "story_v_out_115291.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_115291", "115291092", "story_v_out_115291.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_10 = math.max(var_378_1, arg_375_1.talkMaxDuration)

			if var_378_0 <= arg_375_1.time_ and arg_375_1.time_ < var_378_0 + var_378_10 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_0) / var_378_10

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_0 + var_378_10 and arg_375_1.time_ < var_378_0 + var_378_10 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play115291093 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 115291093
		arg_379_1.duration_ = 5

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play115291094(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0
			local var_382_1 = 0.925

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, false)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_2 = arg_379_1:GetWordFromCfg(115291093)
				local var_382_3 = arg_379_1:FormatText(var_382_2.content)

				arg_379_1.text_.text = var_382_3

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_4 = 37
				local var_382_5 = utf8.len(var_382_3)
				local var_382_6 = var_382_4 <= 0 and var_382_1 or var_382_1 * (var_382_5 / var_382_4)

				if var_382_6 > 0 and var_382_1 < var_382_6 then
					arg_379_1.talkMaxDuration = var_382_6

					if var_382_6 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_6 + var_382_0
					end
				end

				arg_379_1.text_.text = var_382_3
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_7 = math.max(var_382_1, arg_379_1.talkMaxDuration)

			if var_382_0 <= arg_379_1.time_ and arg_379_1.time_ < var_382_0 + var_382_7 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_0) / var_382_7

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_0 + var_382_7 and arg_379_1.time_ < var_382_0 + var_382_7 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play115291094 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 115291094
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play115291095(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 0.625

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_2 = arg_383_1:GetWordFromCfg(115291094)
				local var_386_3 = arg_383_1:FormatText(var_386_2.content)

				arg_383_1.text_.text = var_386_3

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_4 = 25
				local var_386_5 = utf8.len(var_386_3)
				local var_386_6 = var_386_4 <= 0 and var_386_1 or var_386_1 * (var_386_5 / var_386_4)

				if var_386_6 > 0 and var_386_1 < var_386_6 then
					arg_383_1.talkMaxDuration = var_386_6

					if var_386_6 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_6 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_3
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_7 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_7 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_7

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_7 and arg_383_1.time_ < var_386_0 + var_386_7 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play115291095 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 115291095
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play115291096(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.2

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, false)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_2 = arg_387_1:GetWordFromCfg(115291095)
				local var_390_3 = arg_387_1:FormatText(var_390_2.content)

				arg_387_1.text_.text = var_390_3

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_4 = 8
				local var_390_5 = utf8.len(var_390_3)
				local var_390_6 = var_390_4 <= 0 and var_390_1 or var_390_1 * (var_390_5 / var_390_4)

				if var_390_6 > 0 and var_390_1 < var_390_6 then
					arg_387_1.talkMaxDuration = var_390_6

					if var_390_6 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_6 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_3
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_7 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_7 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_7

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_7 and arg_387_1.time_ < var_390_0 + var_390_7 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play115291096 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 115291096
		arg_391_1.duration_ = 6.1

		local var_391_0 = {
			ja = 6.1,
			ko = 1.3,
			zh = 2.466,
			en = 1.533
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play115291097(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0
			local var_394_1 = 0.15

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_2 = arg_391_1:FormatText(StoryNameCfg[36].name)

				arg_391_1.leftNameTxt_.text = var_394_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_3 = arg_391_1:GetWordFromCfg(115291096)
				local var_394_4 = arg_391_1:FormatText(var_394_3.content)

				arg_391_1.text_.text = var_394_4

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_5 = 6
				local var_394_6 = utf8.len(var_394_4)
				local var_394_7 = var_394_5 <= 0 and var_394_1 or var_394_1 * (var_394_6 / var_394_5)

				if var_394_7 > 0 and var_394_1 < var_394_7 then
					arg_391_1.talkMaxDuration = var_394_7

					if var_394_7 + var_394_0 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_7 + var_394_0
					end
				end

				arg_391_1.text_.text = var_394_4
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291096", "story_v_out_115291.awb") ~= 0 then
					local var_394_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291096", "story_v_out_115291.awb") / 1000

					if var_394_8 + var_394_0 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_8 + var_394_0
					end

					if var_394_3.prefab_name ~= "" and arg_391_1.actors_[var_394_3.prefab_name] ~= nil then
						local var_394_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_3.prefab_name].transform, "story_v_out_115291", "115291096", "story_v_out_115291.awb")

						arg_391_1:RecordAudio("115291096", var_394_9)
						arg_391_1:RecordAudio("115291096", var_394_9)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_115291", "115291096", "story_v_out_115291.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_115291", "115291096", "story_v_out_115291.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_10 = math.max(var_394_1, arg_391_1.talkMaxDuration)

			if var_394_0 <= arg_391_1.time_ and arg_391_1.time_ < var_394_0 + var_394_10 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_0) / var_394_10

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_0 + var_394_10 and arg_391_1.time_ < var_394_0 + var_394_10 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play115291097 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 115291097
		arg_395_1.duration_ = 9

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play115291098(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 2

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				local var_398_1 = manager.ui.mainCamera.transform.localPosition
				local var_398_2 = Vector3.New(0, 0, 10) + Vector3.New(var_398_1.x, var_398_1.y, 0)
				local var_398_3 = arg_395_1.bgs_.ST22a

				var_398_3.transform.localPosition = var_398_2
				var_398_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_398_4 = var_398_3:GetComponent("SpriteRenderer")

				if var_398_4 and var_398_4.sprite then
					local var_398_5 = (var_398_3.transform.localPosition - var_398_1).z
					local var_398_6 = manager.ui.mainCameraCom_
					local var_398_7 = 2 * var_398_5 * Mathf.Tan(var_398_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_398_8 = var_398_7 * var_398_6.aspect
					local var_398_9 = var_398_4.sprite.bounds.size.x
					local var_398_10 = var_398_4.sprite.bounds.size.y
					local var_398_11 = var_398_8 / var_398_9
					local var_398_12 = var_398_7 / var_398_10
					local var_398_13 = var_398_12 < var_398_11 and var_398_11 or var_398_12

					var_398_3.transform.localScale = Vector3.New(var_398_13, var_398_13, 0)
				end

				for iter_398_0, iter_398_1 in pairs(arg_395_1.bgs_) do
					if iter_398_0 ~= "ST22a" then
						iter_398_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_398_14 = 0

			if var_398_14 < arg_395_1.time_ and arg_395_1.time_ <= var_398_14 + arg_398_0 then
				arg_395_1.mask_.enabled = true
				arg_395_1.mask_.raycastTarget = false

				arg_395_1:SetGaussion(false)
			end

			local var_398_15 = 2

			if var_398_14 <= arg_395_1.time_ and arg_395_1.time_ < var_398_14 + var_398_15 then
				local var_398_16 = (arg_395_1.time_ - var_398_14) / var_398_15
				local var_398_17 = Color.New(0, 0, 0)

				var_398_17.a = Mathf.Lerp(0, 1, var_398_16)
				arg_395_1.mask_.color = var_398_17
			end

			if arg_395_1.time_ >= var_398_14 + var_398_15 and arg_395_1.time_ < var_398_14 + var_398_15 + arg_398_0 then
				local var_398_18 = Color.New(0, 0, 0)

				var_398_18.a = 1
				arg_395_1.mask_.color = var_398_18
			end

			local var_398_19 = 2

			if var_398_19 < arg_395_1.time_ and arg_395_1.time_ <= var_398_19 + arg_398_0 then
				arg_395_1.mask_.enabled = true
				arg_395_1.mask_.raycastTarget = false

				arg_395_1:SetGaussion(false)
			end

			local var_398_20 = 2

			if var_398_19 <= arg_395_1.time_ and arg_395_1.time_ < var_398_19 + var_398_20 then
				local var_398_21 = (arg_395_1.time_ - var_398_19) / var_398_20
				local var_398_22 = Color.New(0, 0, 0)

				var_398_22.a = Mathf.Lerp(1, 0, var_398_21)
				arg_395_1.mask_.color = var_398_22
			end

			if arg_395_1.time_ >= var_398_19 + var_398_20 and arg_395_1.time_ < var_398_19 + var_398_20 + arg_398_0 then
				local var_398_23 = Color.New(0, 0, 0)
				local var_398_24 = 0

				arg_395_1.mask_.enabled = false
				var_398_23.a = var_398_24
				arg_395_1.mask_.color = var_398_23
			end

			if arg_395_1.frameCnt_ <= 1 then
				arg_395_1.dialog_:SetActive(false)
			end

			local var_398_25 = 4
			local var_398_26 = 0.8

			if var_398_25 < arg_395_1.time_ and arg_395_1.time_ <= var_398_25 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0

				arg_395_1.dialog_:SetActive(true)

				local var_398_27 = LeanTween.value(arg_395_1.dialog_, 0, 1, 0.3)

				var_398_27:setOnUpdate(LuaHelper.FloatAction(function(arg_399_0)
					arg_395_1.dialogCg_.alpha = arg_399_0
				end))
				var_398_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_395_1.dialog_)
					var_398_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_395_1.duration_ = arg_395_1.duration_ + 0.3

				SetActive(arg_395_1.leftNameGo_, false)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_28 = arg_395_1:GetWordFromCfg(115291097)
				local var_398_29 = arg_395_1:FormatText(var_398_28.content)

				arg_395_1.text_.text = var_398_29

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_30 = 32
				local var_398_31 = utf8.len(var_398_29)
				local var_398_32 = var_398_30 <= 0 and var_398_26 or var_398_26 * (var_398_31 / var_398_30)

				if var_398_32 > 0 and var_398_26 < var_398_32 then
					arg_395_1.talkMaxDuration = var_398_32
					var_398_25 = var_398_25 + 0.3

					if var_398_32 + var_398_25 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_32 + var_398_25
					end
				end

				arg_395_1.text_.text = var_398_29
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_33 = var_398_25 + 0.3
			local var_398_34 = math.max(var_398_26, arg_395_1.talkMaxDuration)

			if var_398_33 <= arg_395_1.time_ and arg_395_1.time_ < var_398_33 + var_398_34 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_33) / var_398_34

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_33 + var_398_34 and arg_395_1.time_ < var_398_33 + var_398_34 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play115291098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 115291098
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play115291099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 0.75

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_2 = arg_401_1:GetWordFromCfg(115291098)
				local var_404_3 = arg_401_1:FormatText(var_404_2.content)

				arg_401_1.text_.text = var_404_3

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_4 = 30
				local var_404_5 = utf8.len(var_404_3)
				local var_404_6 = var_404_4 <= 0 and var_404_1 or var_404_1 * (var_404_5 / var_404_4)

				if var_404_6 > 0 and var_404_1 < var_404_6 then
					arg_401_1.talkMaxDuration = var_404_6

					if var_404_6 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_6 + var_404_0
					end
				end

				arg_401_1.text_.text = var_404_3
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_7 = math.max(var_404_1, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_7 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_0) / var_404_7

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_7 and arg_401_1.time_ < var_404_0 + var_404_7 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play115291099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 115291099
		arg_405_1.duration_ = 3.9

		local var_405_0 = {
			ja = 3.033,
			ko = 2.366,
			zh = 3.9,
			en = 2.533
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
				arg_405_0:Play115291100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["10030"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos10030 = var_408_0.localPosition
				var_408_0.localScale = Vector3.New(1, 1, 1)

				arg_405_1:CheckSpriteTmpPos("10030", 3)

				local var_408_2 = var_408_0.childCount

				for iter_408_0 = 0, var_408_2 - 1 do
					local var_408_3 = var_408_0:GetChild(iter_408_0)

					if var_408_3.name == "split_1" or not string.find(var_408_3.name, "split") then
						var_408_3.gameObject:SetActive(true)
					else
						var_408_3.gameObject:SetActive(false)
					end
				end
			end

			local var_408_4 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_4 then
				local var_408_5 = (arg_405_1.time_ - var_408_1) / var_408_4
				local var_408_6 = Vector3.New(0, -390, 150)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10030, var_408_6, var_408_5)
			end

			if arg_405_1.time_ >= var_408_1 + var_408_4 and arg_405_1.time_ < var_408_1 + var_408_4 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_408_7 = arg_405_1.actors_["10030"]
			local var_408_8 = 0

			if var_408_8 < arg_405_1.time_ and arg_405_1.time_ <= var_408_8 + arg_408_0 then
				local var_408_9 = var_408_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_408_9 then
					arg_405_1.var_.alphaOldValue10030 = var_408_9.alpha
					arg_405_1.var_.characterEffect10030 = var_408_9
				end

				arg_405_1.var_.alphaOldValue10030 = 0
			end

			local var_408_10 = 0.333333333333333

			if var_408_8 <= arg_405_1.time_ and arg_405_1.time_ < var_408_8 + var_408_10 then
				local var_408_11 = (arg_405_1.time_ - var_408_8) / var_408_10
				local var_408_12 = Mathf.Lerp(arg_405_1.var_.alphaOldValue10030, 1, var_408_11)

				if arg_405_1.var_.characterEffect10030 then
					arg_405_1.var_.characterEffect10030.alpha = var_408_12
				end
			end

			if arg_405_1.time_ >= var_408_8 + var_408_10 and arg_405_1.time_ < var_408_8 + var_408_10 + arg_408_0 and arg_405_1.var_.characterEffect10030 then
				arg_405_1.var_.characterEffect10030.alpha = 1
			end

			local var_408_13 = 0
			local var_408_14 = 0.125

			if var_408_13 < arg_405_1.time_ and arg_405_1.time_ <= var_408_13 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_15 = arg_405_1:FormatText(StoryNameCfg[309].name)

				arg_405_1.leftNameTxt_.text = var_408_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_16 = arg_405_1:GetWordFromCfg(115291099)
				local var_408_17 = arg_405_1:FormatText(var_408_16.content)

				arg_405_1.text_.text = var_408_17

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_18 = 5
				local var_408_19 = utf8.len(var_408_17)
				local var_408_20 = var_408_18 <= 0 and var_408_14 or var_408_14 * (var_408_19 / var_408_18)

				if var_408_20 > 0 and var_408_14 < var_408_20 then
					arg_405_1.talkMaxDuration = var_408_20

					if var_408_20 + var_408_13 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_20 + var_408_13
					end
				end

				arg_405_1.text_.text = var_408_17
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291099", "story_v_out_115291.awb") ~= 0 then
					local var_408_21 = manager.audio:GetVoiceLength("story_v_out_115291", "115291099", "story_v_out_115291.awb") / 1000

					if var_408_21 + var_408_13 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_21 + var_408_13
					end

					if var_408_16.prefab_name ~= "" and arg_405_1.actors_[var_408_16.prefab_name] ~= nil then
						local var_408_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_16.prefab_name].transform, "story_v_out_115291", "115291099", "story_v_out_115291.awb")

						arg_405_1:RecordAudio("115291099", var_408_22)
						arg_405_1:RecordAudio("115291099", var_408_22)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_115291", "115291099", "story_v_out_115291.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_115291", "115291099", "story_v_out_115291.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_23 = math.max(var_408_14, arg_405_1.talkMaxDuration)

			if var_408_13 <= arg_405_1.time_ and arg_405_1.time_ < var_408_13 + var_408_23 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_13) / var_408_23

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_13 + var_408_23 and arg_405_1.time_ < var_408_13 + var_408_23 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play115291100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 115291100
		arg_409_1.duration_ = 8.4

		local var_409_0 = {
			ja = 8.4,
			ko = 5.366,
			zh = 6.4,
			en = 6.166
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
				arg_409_0:Play115291101(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10030"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.actorSpriteComps10030 == nil then
				arg_409_1.var_.actorSpriteComps10030 = var_412_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_2 = 0.2

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.actorSpriteComps10030 then
					for iter_412_0, iter_412_1 in pairs(arg_409_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_412_1 then
							local var_412_4 = Mathf.Lerp(iter_412_1.color.r, 0.5, var_412_3)

							iter_412_1.color = Color.New(var_412_4, var_412_4, var_412_4)
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.actorSpriteComps10030 then
				local var_412_5 = 0.5

				for iter_412_2, iter_412_3 in pairs(arg_409_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_412_3 then
						iter_412_3.color = Color.New(var_412_5, var_412_5, var_412_5)
					end
				end

				arg_409_1.var_.actorSpriteComps10030 = nil
			end

			local var_412_6 = 0
			local var_412_7 = 0.55

			if var_412_6 < arg_409_1.time_ and arg_409_1.time_ <= var_412_6 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_8 = arg_409_1:FormatText(StoryNameCfg[215].name)

				arg_409_1.leftNameTxt_.text = var_412_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, true)
				arg_409_1.iconController_:SetSelectedState("hero")

				arg_409_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6046")

				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_9 = arg_409_1:GetWordFromCfg(115291100)
				local var_412_10 = arg_409_1:FormatText(var_412_9.content)

				arg_409_1.text_.text = var_412_10

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_11 = 22
				local var_412_12 = utf8.len(var_412_10)
				local var_412_13 = var_412_11 <= 0 and var_412_7 or var_412_7 * (var_412_12 / var_412_11)

				if var_412_13 > 0 and var_412_7 < var_412_13 then
					arg_409_1.talkMaxDuration = var_412_13

					if var_412_13 + var_412_6 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_13 + var_412_6
					end
				end

				arg_409_1.text_.text = var_412_10
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291100", "story_v_out_115291.awb") ~= 0 then
					local var_412_14 = manager.audio:GetVoiceLength("story_v_out_115291", "115291100", "story_v_out_115291.awb") / 1000

					if var_412_14 + var_412_6 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_14 + var_412_6
					end

					if var_412_9.prefab_name ~= "" and arg_409_1.actors_[var_412_9.prefab_name] ~= nil then
						local var_412_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_9.prefab_name].transform, "story_v_out_115291", "115291100", "story_v_out_115291.awb")

						arg_409_1:RecordAudio("115291100", var_412_15)
						arg_409_1:RecordAudio("115291100", var_412_15)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_115291", "115291100", "story_v_out_115291.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_115291", "115291100", "story_v_out_115291.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_16 = math.max(var_412_7, arg_409_1.talkMaxDuration)

			if var_412_6 <= arg_409_1.time_ and arg_409_1.time_ < var_412_6 + var_412_16 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_6) / var_412_16

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_6 + var_412_16 and arg_409_1.time_ < var_412_6 + var_412_16 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play115291101 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 115291101
		arg_413_1.duration_ = 3.1

		local var_413_0 = {
			ja = 3.1,
			ko = 2.066,
			zh = 2.6,
			en = 1.066
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
				arg_413_0:Play115291102(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["10030"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.actorSpriteComps10030 == nil then
				arg_413_1.var_.actorSpriteComps10030 = var_416_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_416_2 = 0.2

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.actorSpriteComps10030 then
					for iter_416_0, iter_416_1 in pairs(arg_413_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_416_1 then
							local var_416_4 = Mathf.Lerp(iter_416_1.color.r, 1, var_416_3)

							iter_416_1.color = Color.New(var_416_4, var_416_4, var_416_4)
						end
					end
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.actorSpriteComps10030 then
				local var_416_5 = 1

				for iter_416_2, iter_416_3 in pairs(arg_413_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_416_3 then
						iter_416_3.color = Color.New(var_416_5, var_416_5, var_416_5)
					end
				end

				arg_413_1.var_.actorSpriteComps10030 = nil
			end

			local var_416_6 = 0
			local var_416_7 = 0.1

			if var_416_6 < arg_413_1.time_ and arg_413_1.time_ <= var_416_6 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_8 = arg_413_1:FormatText(StoryNameCfg[309].name)

				arg_413_1.leftNameTxt_.text = var_416_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_9 = arg_413_1:GetWordFromCfg(115291101)
				local var_416_10 = arg_413_1:FormatText(var_416_9.content)

				arg_413_1.text_.text = var_416_10

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_11 = 4
				local var_416_12 = utf8.len(var_416_10)
				local var_416_13 = var_416_11 <= 0 and var_416_7 or var_416_7 * (var_416_12 / var_416_11)

				if var_416_13 > 0 and var_416_7 < var_416_13 then
					arg_413_1.talkMaxDuration = var_416_13

					if var_416_13 + var_416_6 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_13 + var_416_6
					end
				end

				arg_413_1.text_.text = var_416_10
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291101", "story_v_out_115291.awb") ~= 0 then
					local var_416_14 = manager.audio:GetVoiceLength("story_v_out_115291", "115291101", "story_v_out_115291.awb") / 1000

					if var_416_14 + var_416_6 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_14 + var_416_6
					end

					if var_416_9.prefab_name ~= "" and arg_413_1.actors_[var_416_9.prefab_name] ~= nil then
						local var_416_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_9.prefab_name].transform, "story_v_out_115291", "115291101", "story_v_out_115291.awb")

						arg_413_1:RecordAudio("115291101", var_416_15)
						arg_413_1:RecordAudio("115291101", var_416_15)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_115291", "115291101", "story_v_out_115291.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_115291", "115291101", "story_v_out_115291.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_16 = math.max(var_416_7, arg_413_1.talkMaxDuration)

			if var_416_6 <= arg_413_1.time_ and arg_413_1.time_ < var_416_6 + var_416_16 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_6) / var_416_16

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_6 + var_416_16 and arg_413_1.time_ < var_416_6 + var_416_16 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play115291102 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 115291102
		arg_417_1.duration_ = 3.033

		local var_417_0 = {
			ja = 2.9,
			ko = 2.6,
			zh = 3.033,
			en = 2.933
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
				arg_417_0:Play115291103(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["10030"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.actorSpriteComps10030 == nil then
				arg_417_1.var_.actorSpriteComps10030 = var_420_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_420_2 = 0.2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.actorSpriteComps10030 then
					for iter_420_0, iter_420_1 in pairs(arg_417_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_420_1 then
							local var_420_4 = Mathf.Lerp(iter_420_1.color.r, 0.5, var_420_3)

							iter_420_1.color = Color.New(var_420_4, var_420_4, var_420_4)
						end
					end
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.actorSpriteComps10030 then
				local var_420_5 = 0.5

				for iter_420_2, iter_420_3 in pairs(arg_417_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_420_3 then
						iter_420_3.color = Color.New(var_420_5, var_420_5, var_420_5)
					end
				end

				arg_417_1.var_.actorSpriteComps10030 = nil
			end

			local var_420_6 = 0
			local var_420_7 = 0.2

			if var_420_6 < arg_417_1.time_ and arg_417_1.time_ <= var_420_6 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_8 = arg_417_1:FormatText(StoryNameCfg[215].name)

				arg_417_1.leftNameTxt_.text = var_420_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, true)
				arg_417_1.iconController_:SetSelectedState("hero")

				arg_417_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6046")

				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_9 = arg_417_1:GetWordFromCfg(115291102)
				local var_420_10 = arg_417_1:FormatText(var_420_9.content)

				arg_417_1.text_.text = var_420_10

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_11 = 8
				local var_420_12 = utf8.len(var_420_10)
				local var_420_13 = var_420_11 <= 0 and var_420_7 or var_420_7 * (var_420_12 / var_420_11)

				if var_420_13 > 0 and var_420_7 < var_420_13 then
					arg_417_1.talkMaxDuration = var_420_13

					if var_420_13 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_13 + var_420_6
					end
				end

				arg_417_1.text_.text = var_420_10
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291102", "story_v_out_115291.awb") ~= 0 then
					local var_420_14 = manager.audio:GetVoiceLength("story_v_out_115291", "115291102", "story_v_out_115291.awb") / 1000

					if var_420_14 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_14 + var_420_6
					end

					if var_420_9.prefab_name ~= "" and arg_417_1.actors_[var_420_9.prefab_name] ~= nil then
						local var_420_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_9.prefab_name].transform, "story_v_out_115291", "115291102", "story_v_out_115291.awb")

						arg_417_1:RecordAudio("115291102", var_420_15)
						arg_417_1:RecordAudio("115291102", var_420_15)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_115291", "115291102", "story_v_out_115291.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_115291", "115291102", "story_v_out_115291.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_16 = math.max(var_420_7, arg_417_1.talkMaxDuration)

			if var_420_6 <= arg_417_1.time_ and arg_417_1.time_ < var_420_6 + var_420_16 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_6) / var_420_16

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_6 + var_420_16 and arg_417_1.time_ < var_420_6 + var_420_16 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play115291103 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 115291103
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play115291104(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["10030"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				local var_424_2 = var_424_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_424_2 then
					arg_421_1.var_.alphaOldValue10030 = var_424_2.alpha
					arg_421_1.var_.characterEffect10030 = var_424_2
				end

				arg_421_1.var_.alphaOldValue10030 = 1
			end

			local var_424_3 = 0.333333333333333

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_3 then
				local var_424_4 = (arg_421_1.time_ - var_424_1) / var_424_3
				local var_424_5 = Mathf.Lerp(arg_421_1.var_.alphaOldValue10030, 0, var_424_4)

				if arg_421_1.var_.characterEffect10030 then
					arg_421_1.var_.characterEffect10030.alpha = var_424_5
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_3 and arg_421_1.time_ < var_424_1 + var_424_3 + arg_424_0 and arg_421_1.var_.characterEffect10030 then
				arg_421_1.var_.characterEffect10030.alpha = 0
			end

			local var_424_6 = 0
			local var_424_7 = 0.575

			if var_424_6 < arg_421_1.time_ and arg_421_1.time_ <= var_424_6 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_8 = arg_421_1:GetWordFromCfg(115291103)
				local var_424_9 = arg_421_1:FormatText(var_424_8.content)

				arg_421_1.text_.text = var_424_9

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_10 = 23
				local var_424_11 = utf8.len(var_424_9)
				local var_424_12 = var_424_10 <= 0 and var_424_7 or var_424_7 * (var_424_11 / var_424_10)

				if var_424_12 > 0 and var_424_7 < var_424_12 then
					arg_421_1.talkMaxDuration = var_424_12

					if var_424_12 + var_424_6 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_12 + var_424_6
					end
				end

				arg_421_1.text_.text = var_424_9
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_13 = math.max(var_424_7, arg_421_1.talkMaxDuration)

			if var_424_6 <= arg_421_1.time_ and arg_421_1.time_ < var_424_6 + var_424_13 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_6) / var_424_13

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_6 + var_424_13 and arg_421_1.time_ < var_424_6 + var_424_13 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play115291104 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 115291104
		arg_425_1.duration_ = 7.6

		local var_425_0 = {
			ja = 4.4,
			ko = 4.666,
			zh = 7.6,
			en = 5.9
		}
		local var_425_1 = manager.audio:GetLocalizationFlag()

		if var_425_0[var_425_1] ~= nil then
			arg_425_1.duration_ = var_425_0[var_425_1]
		end

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play115291105(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0
			local var_428_1 = 0.525

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_2 = arg_425_1:FormatText(StoryNameCfg[215].name)

				arg_425_1.leftNameTxt_.text = var_428_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, true)
				arg_425_1.iconController_:SetSelectedState("hero")

				arg_425_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6046")

				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_3 = arg_425_1:GetWordFromCfg(115291104)
				local var_428_4 = arg_425_1:FormatText(var_428_3.content)

				arg_425_1.text_.text = var_428_4

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_5 = 21
				local var_428_6 = utf8.len(var_428_4)
				local var_428_7 = var_428_5 <= 0 and var_428_1 or var_428_1 * (var_428_6 / var_428_5)

				if var_428_7 > 0 and var_428_1 < var_428_7 then
					arg_425_1.talkMaxDuration = var_428_7

					if var_428_7 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_7 + var_428_0
					end
				end

				arg_425_1.text_.text = var_428_4
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291104", "story_v_out_115291.awb") ~= 0 then
					local var_428_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291104", "story_v_out_115291.awb") / 1000

					if var_428_8 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_8 + var_428_0
					end

					if var_428_3.prefab_name ~= "" and arg_425_1.actors_[var_428_3.prefab_name] ~= nil then
						local var_428_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_3.prefab_name].transform, "story_v_out_115291", "115291104", "story_v_out_115291.awb")

						arg_425_1:RecordAudio("115291104", var_428_9)
						arg_425_1:RecordAudio("115291104", var_428_9)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_115291", "115291104", "story_v_out_115291.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_115291", "115291104", "story_v_out_115291.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_10 = math.max(var_428_1, arg_425_1.talkMaxDuration)

			if var_428_0 <= arg_425_1.time_ and arg_425_1.time_ < var_428_0 + var_428_10 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_0) / var_428_10

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_0 + var_428_10 and arg_425_1.time_ < var_428_0 + var_428_10 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play115291105 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 115291105
		arg_429_1.duration_ = 3.166

		local var_429_0 = {
			ja = 3.166,
			ko = 1.9,
			zh = 3.166,
			en = 2.1
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
				arg_429_0:Play115291106(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["10030"].transform
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 then
				arg_429_1.var_.moveOldPos10030 = var_432_0.localPosition
				var_432_0.localScale = Vector3.New(1, 1, 1)

				arg_429_1:CheckSpriteTmpPos("10030", 3)

				local var_432_2 = var_432_0.childCount

				for iter_432_0 = 0, var_432_2 - 1 do
					local var_432_3 = var_432_0:GetChild(iter_432_0)

					if var_432_3.name == "split_1" or not string.find(var_432_3.name, "split") then
						var_432_3.gameObject:SetActive(true)
					else
						var_432_3.gameObject:SetActive(false)
					end
				end
			end

			local var_432_4 = 0.001

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_4 then
				local var_432_5 = (arg_429_1.time_ - var_432_1) / var_432_4
				local var_432_6 = Vector3.New(0, -390, 150)

				var_432_0.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos10030, var_432_6, var_432_5)
			end

			if arg_429_1.time_ >= var_432_1 + var_432_4 and arg_429_1.time_ < var_432_1 + var_432_4 + arg_432_0 then
				var_432_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_432_7 = arg_429_1.actors_["10030"]
			local var_432_8 = 0

			if var_432_8 < arg_429_1.time_ and arg_429_1.time_ <= var_432_8 + arg_432_0 and arg_429_1.var_.actorSpriteComps10030 == nil then
				arg_429_1.var_.actorSpriteComps10030 = var_432_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_432_9 = 0.2

			if var_432_8 <= arg_429_1.time_ and arg_429_1.time_ < var_432_8 + var_432_9 then
				local var_432_10 = (arg_429_1.time_ - var_432_8) / var_432_9

				if arg_429_1.var_.actorSpriteComps10030 then
					for iter_432_1, iter_432_2 in pairs(arg_429_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_432_2 then
							local var_432_11 = Mathf.Lerp(iter_432_2.color.r, 1, var_432_10)

							iter_432_2.color = Color.New(var_432_11, var_432_11, var_432_11)
						end
					end
				end
			end

			if arg_429_1.time_ >= var_432_8 + var_432_9 and arg_429_1.time_ < var_432_8 + var_432_9 + arg_432_0 and arg_429_1.var_.actorSpriteComps10030 then
				local var_432_12 = 1

				for iter_432_3, iter_432_4 in pairs(arg_429_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_432_4 then
						iter_432_4.color = Color.New(var_432_12, var_432_12, var_432_12)
					end
				end

				arg_429_1.var_.actorSpriteComps10030 = nil
			end

			local var_432_13 = arg_429_1.actors_["10030"]
			local var_432_14 = 0

			if var_432_14 < arg_429_1.time_ and arg_429_1.time_ <= var_432_14 + arg_432_0 then
				local var_432_15 = var_432_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_432_15 then
					arg_429_1.var_.alphaOldValue10030 = var_432_15.alpha
					arg_429_1.var_.characterEffect10030 = var_432_15
				end

				arg_429_1.var_.alphaOldValue10030 = 0
			end

			local var_432_16 = 0.333333333333333

			if var_432_14 <= arg_429_1.time_ and arg_429_1.time_ < var_432_14 + var_432_16 then
				local var_432_17 = (arg_429_1.time_ - var_432_14) / var_432_16
				local var_432_18 = Mathf.Lerp(arg_429_1.var_.alphaOldValue10030, 1, var_432_17)

				if arg_429_1.var_.characterEffect10030 then
					arg_429_1.var_.characterEffect10030.alpha = var_432_18
				end
			end

			if arg_429_1.time_ >= var_432_14 + var_432_16 and arg_429_1.time_ < var_432_14 + var_432_16 + arg_432_0 and arg_429_1.var_.characterEffect10030 then
				arg_429_1.var_.characterEffect10030.alpha = 1
			end

			local var_432_19 = 0
			local var_432_20 = 0.175

			if var_432_19 < arg_429_1.time_ and arg_429_1.time_ <= var_432_19 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_21 = arg_429_1:FormatText(StoryNameCfg[309].name)

				arg_429_1.leftNameTxt_.text = var_432_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_22 = arg_429_1:GetWordFromCfg(115291105)
				local var_432_23 = arg_429_1:FormatText(var_432_22.content)

				arg_429_1.text_.text = var_432_23

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_24 = 7
				local var_432_25 = utf8.len(var_432_23)
				local var_432_26 = var_432_24 <= 0 and var_432_20 or var_432_20 * (var_432_25 / var_432_24)

				if var_432_26 > 0 and var_432_20 < var_432_26 then
					arg_429_1.talkMaxDuration = var_432_26

					if var_432_26 + var_432_19 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_26 + var_432_19
					end
				end

				arg_429_1.text_.text = var_432_23
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291105", "story_v_out_115291.awb") ~= 0 then
					local var_432_27 = manager.audio:GetVoiceLength("story_v_out_115291", "115291105", "story_v_out_115291.awb") / 1000

					if var_432_27 + var_432_19 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_27 + var_432_19
					end

					if var_432_22.prefab_name ~= "" and arg_429_1.actors_[var_432_22.prefab_name] ~= nil then
						local var_432_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_22.prefab_name].transform, "story_v_out_115291", "115291105", "story_v_out_115291.awb")

						arg_429_1:RecordAudio("115291105", var_432_28)
						arg_429_1:RecordAudio("115291105", var_432_28)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_115291", "115291105", "story_v_out_115291.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_115291", "115291105", "story_v_out_115291.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_29 = math.max(var_432_20, arg_429_1.talkMaxDuration)

			if var_432_19 <= arg_429_1.time_ and arg_429_1.time_ < var_432_19 + var_432_29 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_19) / var_432_29

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_19 + var_432_29 and arg_429_1.time_ < var_432_19 + var_432_29 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play115291106 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 115291106
		arg_433_1.duration_ = 5

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play115291107(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["10030"]
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				local var_436_2 = var_436_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_436_2 then
					arg_433_1.var_.alphaOldValue10030 = var_436_2.alpha
					arg_433_1.var_.characterEffect10030 = var_436_2
				end

				arg_433_1.var_.alphaOldValue10030 = 1
			end

			local var_436_3 = 0.333333333333333

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_3 then
				local var_436_4 = (arg_433_1.time_ - var_436_1) / var_436_3
				local var_436_5 = Mathf.Lerp(arg_433_1.var_.alphaOldValue10030, 0, var_436_4)

				if arg_433_1.var_.characterEffect10030 then
					arg_433_1.var_.characterEffect10030.alpha = var_436_5
				end
			end

			if arg_433_1.time_ >= var_436_1 + var_436_3 and arg_433_1.time_ < var_436_1 + var_436_3 + arg_436_0 and arg_433_1.var_.characterEffect10030 then
				arg_433_1.var_.characterEffect10030.alpha = 0
			end

			local var_436_6 = 0
			local var_436_7 = 0.525

			if var_436_6 < arg_433_1.time_ and arg_433_1.time_ <= var_436_6 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, false)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_8 = arg_433_1:GetWordFromCfg(115291106)
				local var_436_9 = arg_433_1:FormatText(var_436_8.content)

				arg_433_1.text_.text = var_436_9

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_10 = 21
				local var_436_11 = utf8.len(var_436_9)
				local var_436_12 = var_436_10 <= 0 and var_436_7 or var_436_7 * (var_436_11 / var_436_10)

				if var_436_12 > 0 and var_436_7 < var_436_12 then
					arg_433_1.talkMaxDuration = var_436_12

					if var_436_12 + var_436_6 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_12 + var_436_6
					end
				end

				arg_433_1.text_.text = var_436_9
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)
				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_13 = math.max(var_436_7, arg_433_1.talkMaxDuration)

			if var_436_6 <= arg_433_1.time_ and arg_433_1.time_ < var_436_6 + var_436_13 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_6) / var_436_13

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_6 + var_436_13 and arg_433_1.time_ < var_436_6 + var_436_13 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play115291107 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 115291107
		arg_437_1.duration_ = 8.966

		local var_437_0 = {
			ja = 8.966,
			ko = 8.6,
			zh = 8.166,
			en = 8.9
		}
		local var_437_1 = manager.audio:GetLocalizationFlag()

		if var_437_0[var_437_1] ~= nil then
			arg_437_1.duration_ = var_437_0[var_437_1]
		end

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play115291108(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 0.675

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_2 = arg_437_1:FormatText(StoryNameCfg[215].name)

				arg_437_1.leftNameTxt_.text = var_440_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, true)
				arg_437_1.iconController_:SetSelectedState("hero")

				arg_437_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6046")

				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_3 = arg_437_1:GetWordFromCfg(115291107)
				local var_440_4 = arg_437_1:FormatText(var_440_3.content)

				arg_437_1.text_.text = var_440_4

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_5 = 27
				local var_440_6 = utf8.len(var_440_4)
				local var_440_7 = var_440_5 <= 0 and var_440_1 or var_440_1 * (var_440_6 / var_440_5)

				if var_440_7 > 0 and var_440_1 < var_440_7 then
					arg_437_1.talkMaxDuration = var_440_7

					if var_440_7 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_7 + var_440_0
					end
				end

				arg_437_1.text_.text = var_440_4
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291107", "story_v_out_115291.awb") ~= 0 then
					local var_440_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291107", "story_v_out_115291.awb") / 1000

					if var_440_8 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_8 + var_440_0
					end

					if var_440_3.prefab_name ~= "" and arg_437_1.actors_[var_440_3.prefab_name] ~= nil then
						local var_440_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_3.prefab_name].transform, "story_v_out_115291", "115291107", "story_v_out_115291.awb")

						arg_437_1:RecordAudio("115291107", var_440_9)
						arg_437_1:RecordAudio("115291107", var_440_9)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_115291", "115291107", "story_v_out_115291.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_115291", "115291107", "story_v_out_115291.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_10 = math.max(var_440_1, arg_437_1.talkMaxDuration)

			if var_440_0 <= arg_437_1.time_ and arg_437_1.time_ < var_440_0 + var_440_10 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_0) / var_440_10

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_0 + var_440_10 and arg_437_1.time_ < var_440_0 + var_440_10 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play115291108 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 115291108
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play115291109(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0
			local var_444_1 = 1.225

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, false)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_2 = arg_441_1:GetWordFromCfg(115291108)
				local var_444_3 = arg_441_1:FormatText(var_444_2.content)

				arg_441_1.text_.text = var_444_3

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_4 = 49
				local var_444_5 = utf8.len(var_444_3)
				local var_444_6 = var_444_4 <= 0 and var_444_1 or var_444_1 * (var_444_5 / var_444_4)

				if var_444_6 > 0 and var_444_1 < var_444_6 then
					arg_441_1.talkMaxDuration = var_444_6

					if var_444_6 + var_444_0 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_6 + var_444_0
					end
				end

				arg_441_1.text_.text = var_444_3
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_7 = math.max(var_444_1, arg_441_1.talkMaxDuration)

			if var_444_0 <= arg_441_1.time_ and arg_441_1.time_ < var_444_0 + var_444_7 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_0) / var_444_7

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_0 + var_444_7 and arg_441_1.time_ < var_444_0 + var_444_7 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play115291109 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 115291109
		arg_445_1.duration_ = 2.1

		local var_445_0 = {
			ja = 1.933,
			ko = 1.5,
			zh = 2.1,
			en = 1.866
		}
		local var_445_1 = manager.audio:GetLocalizationFlag()

		if var_445_0[var_445_1] ~= nil then
			arg_445_1.duration_ = var_445_0[var_445_1]
		end

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play115291110(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.15

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_2 = arg_445_1:FormatText(StoryNameCfg[215].name)

				arg_445_1.leftNameTxt_.text = var_448_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, true)
				arg_445_1.iconController_:SetSelectedState("hero")

				arg_445_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6046")

				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_3 = arg_445_1:GetWordFromCfg(115291109)
				local var_448_4 = arg_445_1:FormatText(var_448_3.content)

				arg_445_1.text_.text = var_448_4

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_5 = 6
				local var_448_6 = utf8.len(var_448_4)
				local var_448_7 = var_448_5 <= 0 and var_448_1 or var_448_1 * (var_448_6 / var_448_5)

				if var_448_7 > 0 and var_448_1 < var_448_7 then
					arg_445_1.talkMaxDuration = var_448_7

					if var_448_7 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_7 + var_448_0
					end
				end

				arg_445_1.text_.text = var_448_4
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291109", "story_v_out_115291.awb") ~= 0 then
					local var_448_8 = manager.audio:GetVoiceLength("story_v_out_115291", "115291109", "story_v_out_115291.awb") / 1000

					if var_448_8 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_8 + var_448_0
					end

					if var_448_3.prefab_name ~= "" and arg_445_1.actors_[var_448_3.prefab_name] ~= nil then
						local var_448_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_3.prefab_name].transform, "story_v_out_115291", "115291109", "story_v_out_115291.awb")

						arg_445_1:RecordAudio("115291109", var_448_9)
						arg_445_1:RecordAudio("115291109", var_448_9)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_115291", "115291109", "story_v_out_115291.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_115291", "115291109", "story_v_out_115291.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_10 = math.max(var_448_1, arg_445_1.talkMaxDuration)

			if var_448_0 <= arg_445_1.time_ and arg_445_1.time_ < var_448_0 + var_448_10 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_0) / var_448_10

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_0 + var_448_10 and arg_445_1.time_ < var_448_0 + var_448_10 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play115291110 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 115291110
		arg_449_1.duration_ = 3.466

		local var_449_0 = {
			ja = 3.466,
			ko = 2.3,
			zh = 3.2,
			en = 2.666
		}
		local var_449_1 = manager.audio:GetLocalizationFlag()

		if var_449_0[var_449_1] ~= nil then
			arg_449_1.duration_ = var_449_0[var_449_1]
		end

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
			arg_449_1.auto_ = false
		end

		function arg_449_1.playNext_(arg_451_0)
			arg_449_1.onStoryFinished_()
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["10030"].transform
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 then
				arg_449_1.var_.moveOldPos10030 = var_452_0.localPosition
				var_452_0.localScale = Vector3.New(1, 1, 1)

				arg_449_1:CheckSpriteTmpPos("10030", 3)

				local var_452_2 = var_452_0.childCount

				for iter_452_0 = 0, var_452_2 - 1 do
					local var_452_3 = var_452_0:GetChild(iter_452_0)

					if var_452_3.name == "split_1" or not string.find(var_452_3.name, "split") then
						var_452_3.gameObject:SetActive(true)
					else
						var_452_3.gameObject:SetActive(false)
					end
				end
			end

			local var_452_4 = 0.001

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_4 then
				local var_452_5 = (arg_449_1.time_ - var_452_1) / var_452_4
				local var_452_6 = Vector3.New(0, -390, 150)

				var_452_0.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos10030, var_452_6, var_452_5)
			end

			if arg_449_1.time_ >= var_452_1 + var_452_4 and arg_449_1.time_ < var_452_1 + var_452_4 + arg_452_0 then
				var_452_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_452_7 = arg_449_1.actors_["10030"]
			local var_452_8 = 0

			if var_452_8 < arg_449_1.time_ and arg_449_1.time_ <= var_452_8 + arg_452_0 then
				local var_452_9 = var_452_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_452_9 then
					arg_449_1.var_.alphaOldValue10030 = var_452_9.alpha
					arg_449_1.var_.characterEffect10030 = var_452_9
				end

				arg_449_1.var_.alphaOldValue10030 = 0
			end

			local var_452_10 = 0.333333333333333

			if var_452_8 <= arg_449_1.time_ and arg_449_1.time_ < var_452_8 + var_452_10 then
				local var_452_11 = (arg_449_1.time_ - var_452_8) / var_452_10
				local var_452_12 = Mathf.Lerp(arg_449_1.var_.alphaOldValue10030, 1, var_452_11)

				if arg_449_1.var_.characterEffect10030 then
					arg_449_1.var_.characterEffect10030.alpha = var_452_12
				end
			end

			if arg_449_1.time_ >= var_452_8 + var_452_10 and arg_449_1.time_ < var_452_8 + var_452_10 + arg_452_0 and arg_449_1.var_.characterEffect10030 then
				arg_449_1.var_.characterEffect10030.alpha = 1
			end

			local var_452_13 = 0
			local var_452_14 = 0.225

			if var_452_13 < arg_449_1.time_ and arg_449_1.time_ <= var_452_13 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_15 = arg_449_1:FormatText(StoryNameCfg[309].name)

				arg_449_1.leftNameTxt_.text = var_452_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_16 = arg_449_1:GetWordFromCfg(115291110)
				local var_452_17 = arg_449_1:FormatText(var_452_16.content)

				arg_449_1.text_.text = var_452_17

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_18 = 9
				local var_452_19 = utf8.len(var_452_17)
				local var_452_20 = var_452_18 <= 0 and var_452_14 or var_452_14 * (var_452_19 / var_452_18)

				if var_452_20 > 0 and var_452_14 < var_452_20 then
					arg_449_1.talkMaxDuration = var_452_20

					if var_452_20 + var_452_13 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_20 + var_452_13
					end
				end

				arg_449_1.text_.text = var_452_17
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115291", "115291110", "story_v_out_115291.awb") ~= 0 then
					local var_452_21 = manager.audio:GetVoiceLength("story_v_out_115291", "115291110", "story_v_out_115291.awb") / 1000

					if var_452_21 + var_452_13 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_21 + var_452_13
					end

					if var_452_16.prefab_name ~= "" and arg_449_1.actors_[var_452_16.prefab_name] ~= nil then
						local var_452_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_16.prefab_name].transform, "story_v_out_115291", "115291110", "story_v_out_115291.awb")

						arg_449_1:RecordAudio("115291110", var_452_22)
						arg_449_1:RecordAudio("115291110", var_452_22)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_115291", "115291110", "story_v_out_115291.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_115291", "115291110", "story_v_out_115291.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_23 = math.max(var_452_14, arg_449_1.talkMaxDuration)

			if var_452_13 <= arg_449_1.time_ and arg_449_1.time_ < var_452_13 + var_452_23 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_13) / var_452_23

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_13 + var_452_23 and arg_449_1.time_ < var_452_13 + var_452_23 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/RO0502"
	},
	voices = {
		"story_v_out_115291.awb"
	}
}
