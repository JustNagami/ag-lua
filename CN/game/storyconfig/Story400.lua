return {
	Play100 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 100
		arg_1_1.duration_ = 9.3

		local var_1_0 = {
			ja = 9.3,
			ko = 5.533,
			zh = 5.3,
			en = 6.233
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
				arg_1_0:Play101(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "A02a"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = arg_1_1.bgs_.A02a
			local var_4_3 = 0

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				local var_4_4 = var_4_2:GetComponent("SpriteRenderer")

				if var_4_4 then
					var_4_4.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_5 = var_4_4.material
					local var_4_6 = var_4_5:GetColor("_Color")

					arg_1_1.var_.alphaOldValueA02a = var_4_6.a
					arg_1_1.var_.alphaMatValueA02a = var_4_5
				end

				arg_1_1.var_.alphaOldValueA02a = 0
			end

			local var_4_7 = 0.034

			if var_4_3 <= arg_1_1.time_ and arg_1_1.time_ < var_4_3 + var_4_7 then
				local var_4_8 = (arg_1_1.time_ - var_4_3) / var_4_7
				local var_4_9 = Mathf.Lerp(arg_1_1.var_.alphaOldValueA02a, 1, var_4_8)

				if arg_1_1.var_.alphaMatValueA02a then
					local var_4_10 = arg_1_1.var_.alphaMatValueA02a
					local var_4_11 = var_4_10:GetColor("_Color")

					var_4_11.a = var_4_9

					var_4_10:SetColor("_Color", var_4_11)
				end
			end

			if arg_1_1.time_ >= var_4_3 + var_4_7 and arg_1_1.time_ < var_4_3 + var_4_7 + arg_4_0 and arg_1_1.var_.alphaMatValueA02a then
				local var_4_12 = arg_1_1.var_.alphaMatValueA02a
				local var_4_13 = var_4_12:GetColor("_Color")

				var_4_13.a = 1

				var_4_12:SetColor("_Color", var_4_13)
			end

			local var_4_14 = arg_1_1.bgs_.A02a.transform
			local var_4_15 = 0.0333333333333333

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				arg_1_1.var_.moveOldPosA02a = var_4_14.localPosition
			end

			local var_4_16 = 0.001

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_16 then
				local var_4_17 = (arg_1_1.time_ - var_4_15) / var_4_16
				local var_4_18 = Vector3.New(0, 0, 0)

				var_4_14.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosA02a, var_4_18, var_4_17)
			end

			if arg_1_1.time_ >= var_4_15 + var_4_16 and arg_1_1.time_ < var_4_15 + var_4_16 + arg_4_0 then
				var_4_14.localPosition = Vector3.New(0, 0, 0)
			end

			local var_4_19 = "A03"

			if arg_1_1.bgs_[var_4_19] == nil then
				local var_4_20 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_20:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_19)
				var_4_20.name = var_4_19
				var_4_20.transform.parent = arg_1_1.stage_.transform
				var_4_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_19] = var_4_20
			end

			local var_4_21 = arg_1_1.bgs_.A03
			local var_4_22 = 0

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_23 = var_4_21:GetComponent("SpriteRenderer")

				if var_4_23 then
					var_4_23.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_24 = var_4_23.material
					local var_4_25 = var_4_24:GetColor("_Color")

					arg_1_1.var_.alphaOldValueA03 = var_4_25.a
					arg_1_1.var_.alphaMatValueA03 = var_4_24
				end

				arg_1_1.var_.alphaOldValueA03 = 1
			end

			local var_4_26 = 0.034

			if var_4_22 <= arg_1_1.time_ and arg_1_1.time_ < var_4_22 + var_4_26 then
				local var_4_27 = (arg_1_1.time_ - var_4_22) / var_4_26
				local var_4_28 = Mathf.Lerp(arg_1_1.var_.alphaOldValueA03, 0, var_4_27)

				if arg_1_1.var_.alphaMatValueA03 then
					local var_4_29 = arg_1_1.var_.alphaMatValueA03
					local var_4_30 = var_4_29:GetColor("_Color")

					var_4_30.a = var_4_28

					var_4_29:SetColor("_Color", var_4_30)
				end
			end

			if arg_1_1.time_ >= var_4_22 + var_4_26 and arg_1_1.time_ < var_4_22 + var_4_26 + arg_4_0 and arg_1_1.var_.alphaMatValueA03 then
				local var_4_31 = arg_1_1.var_.alphaMatValueA03
				local var_4_32 = var_4_31:GetColor("_Color")

				var_4_32.a = 0

				var_4_31:SetColor("_Color", var_4_32)
			end

			local var_4_33 = arg_1_1.bgs_.A03.transform
			local var_4_34 = 0.0333333333333333

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.var_.moveOldPosA03 = var_4_33.localPosition
			end

			local var_4_35 = 0.001

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_35 then
				local var_4_36 = (arg_1_1.time_ - var_4_34) / var_4_35
				local var_4_37 = Vector3.New(0, 0, 0)

				var_4_33.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosA03, var_4_37, var_4_36)
			end

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				var_4_33.localPosition = Vector3.New(0, 0, 0)
			end

			local var_4_38 = arg_1_1.bgs_.A02a
			local var_4_39 = 0.133333333333333

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				local var_4_40 = var_4_38:GetComponent("SpriteRenderer")

				if var_4_40 then
					var_4_40.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_41 = var_4_40.material
					local var_4_42 = var_4_41:GetColor("_Color")

					arg_1_1.var_.alphaOldValueA02a = var_4_42.a
					arg_1_1.var_.alphaMatValueA02a = var_4_41
				end

				arg_1_1.var_.alphaOldValueA02a = 1
			end

			local var_4_43 = 1.86666666666667

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_39) / var_4_43
				local var_4_45 = Mathf.Lerp(arg_1_1.var_.alphaOldValueA02a, 0, var_4_44)

				if arg_1_1.var_.alphaMatValueA02a then
					local var_4_46 = arg_1_1.var_.alphaMatValueA02a
					local var_4_47 = var_4_46:GetColor("_Color")

					var_4_47.a = var_4_45

					var_4_46:SetColor("_Color", var_4_47)
				end
			end

			if arg_1_1.time_ >= var_4_39 + var_4_43 and arg_1_1.time_ < var_4_39 + var_4_43 + arg_4_0 and arg_1_1.var_.alphaMatValueA02a then
				local var_4_48 = arg_1_1.var_.alphaMatValueA02a
				local var_4_49 = var_4_48:GetColor("_Color")

				var_4_49.a = 0

				var_4_48:SetColor("_Color", var_4_49)
			end

			local var_4_50 = arg_1_1.bgs_.A03
			local var_4_51 = 0.133333333333333

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				local var_4_52 = var_4_50:GetComponent("SpriteRenderer")

				if var_4_52 then
					var_4_52.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_53 = var_4_52.material
					local var_4_54 = var_4_53:GetColor("_Color")

					arg_1_1.var_.alphaOldValueA03 = var_4_54.a
					arg_1_1.var_.alphaMatValueA03 = var_4_53
				end

				arg_1_1.var_.alphaOldValueA03 = 0
			end

			local var_4_55 = 1.86666666666667

			if var_4_51 <= arg_1_1.time_ and arg_1_1.time_ < var_4_51 + var_4_55 then
				local var_4_56 = (arg_1_1.time_ - var_4_51) / var_4_55
				local var_4_57 = Mathf.Lerp(arg_1_1.var_.alphaOldValueA03, 1, var_4_56)

				if arg_1_1.var_.alphaMatValueA03 then
					local var_4_58 = arg_1_1.var_.alphaMatValueA03
					local var_4_59 = var_4_58:GetColor("_Color")

					var_4_59.a = var_4_57

					var_4_58:SetColor("_Color", var_4_59)
				end
			end

			if arg_1_1.time_ >= var_4_51 + var_4_55 and arg_1_1.time_ < var_4_51 + var_4_55 + arg_4_0 and arg_1_1.var_.alphaMatValueA03 then
				local var_4_60 = arg_1_1.var_.alphaMatValueA03
				local var_4_61 = var_4_60:GetColor("_Color")

				var_4_61.a = 1

				var_4_60:SetColor("_Color", var_4_61)
			end

			local var_4_62 = 0
			local var_4_63 = 2.13333333333333

			if var_4_62 < arg_1_1.time_ and arg_1_1.time_ <= var_4_62 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_64 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_64:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_64:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_64:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_65 = arg_1_1:GetWordFromCfg(100011001)
				local var_4_66 = arg_1_1:FormatText(var_4_65.content)

				arg_1_1.text_.text = var_4_66

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_67 = 28
				local var_4_68 = utf8.len(var_4_66)
				local var_4_69 = var_4_67 <= 0 and var_4_63 or var_4_63 * (var_4_68 / var_4_67)

				if var_4_69 > 0 and var_4_63 < var_4_69 then
					arg_1_1.talkMaxDuration = var_4_69
					var_4_62 = var_4_62 + 0.3

					if var_4_69 + var_4_62 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_69 + var_4_62
					end
				end

				arg_1_1.text_.text = var_4_66
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011001", "story_v_out_100011.awb") ~= 0 then
					local var_4_70 = manager.audio:GetVoiceLength("story_v_out_100011", "100011001", "story_v_out_100011.awb") / 1000

					if var_4_70 + var_4_62 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_70 + var_4_62
					end

					if var_4_65.prefab_name ~= "" and arg_1_1.actors_[var_4_65.prefab_name] ~= nil then
						local var_4_71 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_65.prefab_name].transform, "story_v_out_100011", "100011001", "story_v_out_100011.awb")

						arg_1_1:RecordAudio("100011001", var_4_71)
						arg_1_1:RecordAudio("100011001", var_4_71)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_100011", "100011001", "story_v_out_100011.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_100011", "100011001", "story_v_out_100011.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_72 = var_4_62 + 0.3
			local var_4_73 = math.max(var_4_63, arg_1_1.talkMaxDuration)

			if var_4_72 <= arg_1_1.time_ and arg_1_1.time_ < var_4_72 + var_4_73 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_72) / var_4_73

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_72 + var_4_73 and arg_1_1.time_ < var_4_72 + var_4_73 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play101 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play102(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.story_ui_effectTrs_.transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				local var_10_2 = arg_7_1.var_.effecttest

				if not var_10_2 then
					var_10_2 = Object.Instantiate(Asset.Load("Widget/System/Story/story_ui_flash"))
					var_10_2.name = "test"
					arg_7_1.var_.effecttest = var_10_2
				end

				local var_10_3 = var_10_0:Find("")

				if var_10_3 then
					var_10_2.transform.parent = var_10_3
				else
					var_10_2.transform.parent = var_10_0
				end

				var_10_2.transform.localPosition = Vector3.New(0, 0, 0)
				var_10_2.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_10_4 = arg_7_1.bgs_.A03
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				local var_10_6 = var_10_4:GetComponent("SpriteRenderer")

				if var_10_6 then
					var_10_6.material = arg_7_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_10_7 = var_10_6.material
					local var_10_8 = var_10_7:GetColor("_Color")

					arg_7_1.var_.alphaOldValueA03 = var_10_8.a
					arg_7_1.var_.alphaMatValueA03 = var_10_7
				end

				arg_7_1.var_.alphaOldValueA03 = 1
			end

			local var_10_9 = 0.733333333333333

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_9 then
				local var_10_10 = (arg_7_1.time_ - var_10_5) / var_10_9
				local var_10_11 = Mathf.Lerp(arg_7_1.var_.alphaOldValueA03, 0, var_10_10)

				if arg_7_1.var_.alphaMatValueA03 then
					local var_10_12 = arg_7_1.var_.alphaMatValueA03
					local var_10_13 = var_10_12:GetColor("_Color")

					var_10_13.a = var_10_11

					var_10_12:SetColor("_Color", var_10_13)
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_9 and arg_7_1.time_ < var_10_5 + var_10_9 + arg_10_0 and arg_7_1.var_.alphaMatValueA03 then
				local var_10_14 = arg_7_1.var_.alphaMatValueA03
				local var_10_15 = var_10_14:GetColor("_Color")

				var_10_15.a = 0

				var_10_14:SetColor("_Color", var_10_15)
			end

			local var_10_16 = "ML0204"

			if arg_7_1.bgs_[var_10_16] == nil then
				local var_10_17 = Object.Instantiate(arg_7_1.paintGo_)

				var_10_17:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_10_16)
				var_10_17.name = var_10_16
				var_10_17.transform.parent = arg_7_1.stage_.transform
				var_10_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.bgs_[var_10_16] = var_10_17
			end

			local var_10_18 = arg_7_1.bgs_.ML0204.transform
			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.var_.moveOldPosML0204 = var_10_18.localPosition
			end

			local var_10_20 = 0.733333333333333

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_20 then
				local var_10_21 = (arg_7_1.time_ - var_10_19) / var_10_20
				local var_10_22 = Vector3.New(0, 0, 0)

				var_10_18.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPosML0204, var_10_22, var_10_21)
			end

			if arg_7_1.time_ >= var_10_19 + var_10_20 and arg_7_1.time_ < var_10_19 + var_10_20 + arg_10_0 then
				var_10_18.localPosition = Vector3.New(0, 0, 0)
			end
		end
	end,
	Play102 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 102
		arg_11_1.duration_ = 1

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play103(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			return
		end
	end,
	Play103 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103
		arg_15_1.duration_ = 1

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play104(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			return
		end
	end,
	Play104 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104
		arg_19_1.duration_ = 1

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play105(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			return
		end
	end,
	Play105 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 105
		arg_23_1.duration_ = 1

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play106(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			return
		end
	end,
	Play106 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 106
		arg_27_1.duration_ = 1

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play107(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			return
		end
	end,
	Play107 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 107
		arg_31_1.duration_ = 1

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play108(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			return
		end
	end,
	Play108 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 108
		arg_35_1.duration_ = 1

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play109(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			return
		end
	end,
	Play109 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 109
		arg_39_1.duration_ = 1

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play110(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			return
		end
	end,
	Play110 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 110
		arg_43_1.duration_ = 1

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play111(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			return
		end
	end,
	Play111 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 111
		arg_47_1.duration_ = 1

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play112(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			return
		end
	end,
	Play112 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 112
		arg_51_1.duration_ = 1

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
			return
		end
	end,
	assets = {},
	voices = {
		"story_v_out_100011.awb"
	}
}
