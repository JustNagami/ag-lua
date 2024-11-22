return {
	Play100011001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 100011001
		arg_1_1.duration_ = 4.949999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play100011002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v0_prologue", "bgm_story_v0_prologue", "bgm_story_v0_prologue")
			end

			local var_4_4 = "STblack"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = 0

			if var_4_6 < arg_1_1.time_ and arg_1_1.time_ <= var_4_6 + arg_4_0 then
				local var_4_7 = manager.ui.mainCamera.transform.localPosition
				local var_4_8 = Vector3.New(0, 0, 10) + Vector3.New(var_4_7.x, var_4_7.y, 0)
				local var_4_9 = arg_1_1.bgs_.STblack

				var_4_9.transform.localPosition = var_4_8
				var_4_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_10 = var_4_9:GetComponent("SpriteRenderer")

				if var_4_10 and var_4_10.sprite then
					local var_4_11 = (var_4_9.transform.localPosition - var_4_7).z
					local var_4_12 = manager.ui.mainCameraCom_
					local var_4_13 = 2 * var_4_11 * Mathf.Tan(var_4_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_14 = var_4_13 * var_4_12.aspect
					local var_4_15 = var_4_10.sprite.bounds.size.x
					local var_4_16 = var_4_10.sprite.bounds.size.y
					local var_4_17 = var_4_14 / var_4_15
					local var_4_18 = var_4_13 / var_4_16
					local var_4_19 = var_4_18 < var_4_17 and var_4_17 or var_4_18

					var_4_9.transform.localScale = Vector3.New(var_4_19, var_4_19, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "STblack" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_20 = "S0018"

			if arg_1_1.bgs_[var_4_20] == nil then
				local var_4_21 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_21:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_20)
				var_4_21.name = var_4_20
				var_4_21.transform.parent = arg_1_1.stage_.transform
				var_4_21.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_20] = var_4_21
			end

			local var_4_22 = arg_1_1.bgs_.S0018
			local var_4_23 = 0

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				local var_4_24 = var_4_22:GetComponent("SpriteRenderer")

				if var_4_24 then
					var_4_24.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_25 = var_4_24.material
					local var_4_26 = var_4_25:GetColor("_Color")

					arg_1_1.var_.alphaOldValueS0018 = var_4_26.a
					arg_1_1.var_.alphaMatValueS0018 = var_4_25
				end

				arg_1_1.var_.alphaOldValueS0018 = 0
			end

			local var_4_27 = 1.5

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_27 then
				local var_4_28 = (arg_1_1.time_ - var_4_23) / var_4_27
				local var_4_29 = Mathf.Lerp(arg_1_1.var_.alphaOldValueS0018, 1, var_4_28)

				if arg_1_1.var_.alphaMatValueS0018 then
					local var_4_30 = arg_1_1.var_.alphaMatValueS0018
					local var_4_31 = var_4_30:GetColor("_Color")

					var_4_31.a = var_4_29

					var_4_30:SetColor("_Color", var_4_31)
				end
			end

			if arg_1_1.time_ >= var_4_23 + var_4_27 and arg_1_1.time_ < var_4_23 + var_4_27 + arg_4_0 and arg_1_1.var_.alphaMatValueS0018 then
				local var_4_32 = arg_1_1.var_.alphaMatValueS0018
				local var_4_33 = var_4_32:GetColor("_Color")

				var_4_33.a = 1

				var_4_32:SetColor("_Color", var_4_33)
			end

			local var_4_34 = 0
			local var_4_35 = 4.95
			local var_4_36 = manager.audio:GetVoiceLength("story_v_out_100011", "100011001", "story_v_out_100011.awb") / 1000

			if var_4_36 > 0 and var_4_35 < var_4_36 and var_4_36 + var_4_34 > arg_1_1.duration_ then
				local var_4_37 = var_4_36

				arg_1_1.duration_ = var_4_36 + var_4_34
			end

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "voice"

				arg_1_1:AudioAction(var_4_38, var_4_39, "story_v_out_100011", "100011001", "story_v_out_100011.awb")
			end

			local var_4_40 = 0

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				local var_4_41 = arg_1_1.fswbg_.transform:Find("textbox/adapt/content") or arg_1_1.fswbg_.transform:Find("textbox/content")
				local var_4_42 = var_4_41:GetComponent("Text")
				local var_4_43 = var_4_41:GetComponent("RectTransform")

				var_4_42.alignment = UnityEngine.TextAnchor.MiddleLeft
				var_4_43.offsetMin = Vector2.New(400, 105)
				var_4_43.offsetMax = Vector2.New(-400, -200)
			end

			local var_4_44 = 0

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_45 = arg_1_1:GetWordFromCfg(100011001)
				local var_4_46 = arg_1_1:FormatText(var_4_45.content)

				arg_1_1.fswt_.text = var_4_46

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				SetActive(arg_1_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_1_1:ShowNextGo(false)
			end

			local var_4_47 = 0.100000001490116

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_48 = 28
			local var_4_49 = 1.86666666666667
			local var_4_50 = arg_1_1:GetWordFromCfg(100011001)
			local var_4_51 = arg_1_1:FormatText(var_4_50.content)
			local var_4_52, var_4_53 = arg_1_1:GetPercentByPara(var_4_51, 1)

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				local var_4_54 = var_4_48 <= 0 and var_4_49 or var_4_49 * ((var_4_53 - arg_1_1.typewritterCharCountI18N) / var_4_48)

				if var_4_54 > 0 and var_4_49 < var_4_54 then
					arg_1_1.talkMaxDuration = var_4_54

					if var_4_54 + var_4_47 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_54 + var_4_47
					end
				end
			end

			local var_4_55 = 1.86666666666667
			local var_4_56 = math.max(var_4_55, arg_1_1.talkMaxDuration)

			if var_4_47 <= arg_1_1.time_ and arg_1_1.time_ < var_4_47 + var_4_56 then
				local var_4_57 = (arg_1_1.time_ - var_4_47) / var_4_56

				arg_1_1.fswtw_.percent = Mathf.Lerp(arg_1_1.var_.oldValueTypewriter, var_4_52, var_4_57)
				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()
			end

			if arg_1_1.time_ >= var_4_47 + var_4_56 and arg_1_1.time_ < var_4_47 + var_4_56 + arg_4_0 then
				arg_1_1.fswtw_.percent = var_4_52

				arg_1_1.fswtw_:SetDirty()
				arg_1_1:ShowNextGo(true)

				arg_1_1.typewritterCharCountI18N = var_4_53
			end
		end
	end,
	Play100011002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 100011002
		arg_5_1.duration_ = 21.166

		local var_5_0 = {
			ja = 21.166,
			ko = 14.766,
			zh = 16.166,
			en = 17.4
		}
		local var_5_1 = manager.audio:GetLocalizationFlag()

		if var_5_0[var_5_1] ~= nil then
			arg_5_1.duration_ = var_5_0[var_5_1]
		end

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play100011003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = "S0015"

			if arg_5_1.bgs_[var_8_0] == nil then
				local var_8_1 = Object.Instantiate(arg_5_1.paintGo_)

				var_8_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_8_0)
				var_8_1.name = var_8_0
				var_8_1.transform.parent = arg_5_1.stage_.transform
				var_8_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.bgs_[var_8_0] = var_8_1
			end

			local var_8_2 = 0

			if var_8_2 < arg_5_1.time_ and arg_5_1.time_ <= var_8_2 + arg_8_0 then
				local var_8_3 = manager.ui.mainCamera.transform.localPosition
				local var_8_4 = Vector3.New(0, 0, 10) + Vector3.New(var_8_3.x, var_8_3.y, 0)
				local var_8_5 = arg_5_1.bgs_.S0015

				var_8_5.transform.localPosition = var_8_4
				var_8_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_8_6 = var_8_5:GetComponent("SpriteRenderer")

				if var_8_6 and var_8_6.sprite then
					local var_8_7 = (var_8_5.transform.localPosition - var_8_3).z
					local var_8_8 = manager.ui.mainCameraCom_
					local var_8_9 = 2 * var_8_7 * Mathf.Tan(var_8_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_8_10 = var_8_9 * var_8_8.aspect
					local var_8_11 = var_8_6.sprite.bounds.size.x
					local var_8_12 = var_8_6.sprite.bounds.size.y
					local var_8_13 = var_8_10 / var_8_11
					local var_8_14 = var_8_9 / var_8_12
					local var_8_15 = var_8_14 < var_8_13 and var_8_13 or var_8_14

					var_8_5.transform.localScale = Vector3.New(var_8_15, var_8_15, 0)
				end

				for iter_8_0, iter_8_1 in pairs(arg_5_1.bgs_) do
					if iter_8_0 ~= "S0015" then
						iter_8_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_8_16 = 0

			if var_8_16 < arg_5_1.time_ and arg_5_1.time_ <= var_8_16 + arg_8_0 then
				arg_5_1.fswbg_:SetActive(false)
				arg_5_1.dialog_:SetActive(true)
				arg_5_1:ShowNextGo(false)
			end

			local var_8_17 = arg_5_1.bgs_.S0015
			local var_8_18 = 0

			if var_8_18 < arg_5_1.time_ and arg_5_1.time_ <= var_8_18 + arg_8_0 then
				local var_8_19 = var_8_17:GetComponent("SpriteRenderer")

				if var_8_19 then
					var_8_19.material = arg_5_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_8_20 = var_8_19.material
					local var_8_21 = var_8_20:GetColor("_Color")

					arg_5_1.var_.alphaOldValueS0015 = var_8_21.a
					arg_5_1.var_.alphaMatValueS0015 = var_8_20
				end

				arg_5_1.var_.alphaOldValueS0015 = 0
			end

			local var_8_22 = 1.5

			if var_8_18 <= arg_5_1.time_ and arg_5_1.time_ < var_8_18 + var_8_22 then
				local var_8_23 = (arg_5_1.time_ - var_8_18) / var_8_22
				local var_8_24 = Mathf.Lerp(arg_5_1.var_.alphaOldValueS0015, 1, var_8_23)

				if arg_5_1.var_.alphaMatValueS0015 then
					local var_8_25 = arg_5_1.var_.alphaMatValueS0015
					local var_8_26 = var_8_25:GetColor("_Color")

					var_8_26.a = var_8_24

					var_8_25:SetColor("_Color", var_8_26)
				end
			end

			if arg_5_1.time_ >= var_8_18 + var_8_22 and arg_5_1.time_ < var_8_18 + var_8_22 + arg_8_0 and arg_5_1.var_.alphaMatValueS0015 then
				local var_8_27 = arg_5_1.var_.alphaMatValueS0015
				local var_8_28 = var_8_27:GetColor("_Color")

				var_8_28.a = 1

				var_8_27:SetColor("_Color", var_8_28)
			end

			local var_8_29 = arg_5_1.bgs_.S0015.transform
			local var_8_30 = 0

			if var_8_30 < arg_5_1.time_ and arg_5_1.time_ <= var_8_30 + arg_8_0 then
				arg_5_1.var_.moveOldPosS0015 = var_8_29.localPosition
			end

			local var_8_31 = 3

			if var_8_30 <= arg_5_1.time_ and arg_5_1.time_ < var_8_30 + var_8_31 then
				local var_8_32 = (arg_5_1.time_ - var_8_30) / var_8_31
				local var_8_33 = Vector3.New(0, 1, 8)

				var_8_29.localPosition = Vector3.Lerp(arg_5_1.var_.moveOldPosS0015, var_8_33, var_8_32)
			end

			if arg_5_1.time_ >= var_8_30 + var_8_31 and arg_5_1.time_ < var_8_30 + var_8_31 + arg_8_0 then
				var_8_29.localPosition = Vector3.New(0, 1, 8)
			end

			local var_8_34 = 0

			if var_8_34 < arg_5_1.time_ and arg_5_1.time_ <= var_8_34 + arg_8_0 then
				arg_5_1.allBtn_.enabled = false
			end

			local var_8_35 = 1.5

			if arg_5_1.time_ >= var_8_34 + var_8_35 and arg_5_1.time_ < var_8_34 + var_8_35 + arg_8_0 then
				arg_5_1.allBtn_.enabled = true
			end

			if arg_5_1.frameCnt_ <= 1 then
				arg_5_1.dialog_:SetActive(false)
			end

			local var_8_36 = 1.5
			local var_8_37 = 1.5

			if var_8_36 < arg_5_1.time_ and arg_5_1.time_ <= var_8_36 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0

				arg_5_1.dialog_:SetActive(true)

				local var_8_38 = LeanTween.value(arg_5_1.dialog_, 0, 1, 0.3)

				var_8_38:setOnUpdate(LuaHelper.FloatAction(function(arg_9_0)
					arg_5_1.dialogCg_.alpha = arg_9_0
				end))
				var_8_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_5_1.dialog_)
					var_8_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_5_1.duration_ = arg_5_1.duration_ + 0.3

				SetActive(arg_5_1.leftNameGo_, false)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_39 = arg_5_1:GetWordFromCfg(100011002)
				local var_8_40 = arg_5_1:FormatText(var_8_39.content)

				arg_5_1.text_.text = var_8_40

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_41 = 60
				local var_8_42 = utf8.len(var_8_40)
				local var_8_43 = var_8_41 <= 0 and var_8_37 or var_8_37 * (var_8_42 / var_8_41)

				if var_8_43 > 0 and var_8_37 < var_8_43 then
					arg_5_1.talkMaxDuration = var_8_43
					var_8_36 = var_8_36 + 0.3

					if var_8_43 + var_8_36 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_43 + var_8_36
					end
				end

				arg_5_1.text_.text = var_8_40
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011002", "story_v_out_100011.awb") ~= 0 then
					local var_8_44 = manager.audio:GetVoiceLength("story_v_out_100011", "100011002", "story_v_out_100011.awb") / 1000

					if var_8_44 + var_8_36 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_44 + var_8_36
					end

					if var_8_39.prefab_name ~= "" and arg_5_1.actors_[var_8_39.prefab_name] ~= nil then
						local var_8_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_5_1.actors_[var_8_39.prefab_name].transform, "story_v_out_100011", "100011002", "story_v_out_100011.awb")

						arg_5_1:RecordAudio("100011002", var_8_45)
						arg_5_1:RecordAudio("100011002", var_8_45)
					else
						arg_5_1:AudioAction("play", "voice", "story_v_out_100011", "100011002", "story_v_out_100011.awb")
					end

					arg_5_1:RecordHistoryTalkVoice("story_v_out_100011", "100011002", "story_v_out_100011.awb")
				end

				local var_8_46 = string.gsub(var_8_40, "「盖亚」", "「盖亚」(Geyser宇宙)")

				arg_5_1:RecordContent(var_8_46)
			end

			local var_8_47 = var_8_36 + 0.3
			local var_8_48 = math.max(var_8_37, arg_5_1.talkMaxDuration)

			if var_8_47 <= arg_5_1.time_ and arg_5_1.time_ < var_8_47 + var_8_48 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_47) / var_8_48

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_47 + var_8_48 and arg_5_1.time_ < var_8_47 + var_8_48 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play100011003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 100011003
		arg_11_1.duration_ = 23.333

		local var_11_0 = {
			ja = 23.333,
			ko = 16.7,
			zh = 15.066,
			en = 19.766
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
				arg_11_0:Play100011004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.bgs_.S0015.transform
			local var_14_1 = 0.967

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPosS0015 = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, -100, 10)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPosS0015, var_14_4, var_14_3)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_14_5 = "S0011"

			if arg_11_1.bgs_[var_14_5] == nil then
				local var_14_6 = Object.Instantiate(arg_11_1.paintGo_)

				var_14_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_14_5)
				var_14_6.name = var_14_5
				var_14_6.transform.parent = arg_11_1.stage_.transform
				var_14_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.bgs_[var_14_5] = var_14_6
			end

			local var_14_7 = 1

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				local var_14_8 = manager.ui.mainCamera.transform.localPosition
				local var_14_9 = Vector3.New(0, 0, 10) + Vector3.New(var_14_8.x, var_14_8.y, 0)
				local var_14_10 = arg_11_1.bgs_.S0011

				var_14_10.transform.localPosition = var_14_9
				var_14_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_14_11 = var_14_10:GetComponent("SpriteRenderer")

				if var_14_11 and var_14_11.sprite then
					local var_14_12 = (var_14_10.transform.localPosition - var_14_8).z
					local var_14_13 = manager.ui.mainCameraCom_
					local var_14_14 = 2 * var_14_12 * Mathf.Tan(var_14_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_14_15 = var_14_14 * var_14_13.aspect
					local var_14_16 = var_14_11.sprite.bounds.size.x
					local var_14_17 = var_14_11.sprite.bounds.size.y
					local var_14_18 = var_14_15 / var_14_16
					local var_14_19 = var_14_14 / var_14_17
					local var_14_20 = var_14_19 < var_14_18 and var_14_18 or var_14_19

					var_14_10.transform.localScale = Vector3.New(var_14_20, var_14_20, 0)
				end

				for iter_14_0, iter_14_1 in pairs(arg_11_1.bgs_) do
					if iter_14_0 ~= "S0011" then
						iter_14_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_14_21 = arg_11_1.bgs_.S0015
			local var_14_22 = 0

			if var_14_22 < arg_11_1.time_ and arg_11_1.time_ <= var_14_22 + arg_14_0 then
				local var_14_23 = var_14_21:GetComponent("SpriteRenderer")

				if var_14_23 then
					var_14_23.material = arg_11_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_14_24 = var_14_23.material
					local var_14_25 = var_14_24:GetColor("_Color")

					arg_11_1.var_.alphaOldValueS0015 = var_14_25.a
					arg_11_1.var_.alphaMatValueS0015 = var_14_24
				end

				arg_11_1.var_.alphaOldValueS0015 = 1
			end

			local var_14_26 = 1

			if var_14_22 <= arg_11_1.time_ and arg_11_1.time_ < var_14_22 + var_14_26 then
				local var_14_27 = (arg_11_1.time_ - var_14_22) / var_14_26
				local var_14_28 = Mathf.Lerp(arg_11_1.var_.alphaOldValueS0015, 0, var_14_27)

				if arg_11_1.var_.alphaMatValueS0015 then
					local var_14_29 = arg_11_1.var_.alphaMatValueS0015
					local var_14_30 = var_14_29:GetColor("_Color")

					var_14_30.a = var_14_28

					var_14_29:SetColor("_Color", var_14_30)
				end
			end

			if arg_11_1.time_ >= var_14_22 + var_14_26 and arg_11_1.time_ < var_14_22 + var_14_26 + arg_14_0 and arg_11_1.var_.alphaMatValueS0015 then
				local var_14_31 = arg_11_1.var_.alphaMatValueS0015
				local var_14_32 = var_14_31:GetColor("_Color")

				var_14_32.a = 0

				var_14_31:SetColor("_Color", var_14_32)
			end

			local var_14_33 = arg_11_1.bgs_.S0011
			local var_14_34 = 1

			if var_14_34 < arg_11_1.time_ and arg_11_1.time_ <= var_14_34 + arg_14_0 then
				local var_14_35 = var_14_33:GetComponent("SpriteRenderer")

				if var_14_35 then
					var_14_35.material = arg_11_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_14_36 = var_14_35.material
					local var_14_37 = var_14_36:GetColor("_Color")

					arg_11_1.var_.alphaOldValueS0011 = var_14_37.a
					arg_11_1.var_.alphaMatValueS0011 = var_14_36
				end

				arg_11_1.var_.alphaOldValueS0011 = 0
			end

			local var_14_38 = 1.5

			if var_14_34 <= arg_11_1.time_ and arg_11_1.time_ < var_14_34 + var_14_38 then
				local var_14_39 = (arg_11_1.time_ - var_14_34) / var_14_38
				local var_14_40 = Mathf.Lerp(arg_11_1.var_.alphaOldValueS0011, 1, var_14_39)

				if arg_11_1.var_.alphaMatValueS0011 then
					local var_14_41 = arg_11_1.var_.alphaMatValueS0011
					local var_14_42 = var_14_41:GetColor("_Color")

					var_14_42.a = var_14_40

					var_14_41:SetColor("_Color", var_14_42)
				end
			end

			if arg_11_1.time_ >= var_14_34 + var_14_38 and arg_11_1.time_ < var_14_34 + var_14_38 + arg_14_0 and arg_11_1.var_.alphaMatValueS0011 then
				local var_14_43 = arg_11_1.var_.alphaMatValueS0011
				local var_14_44 = var_14_43:GetColor("_Color")

				var_14_44.a = 1

				var_14_43:SetColor("_Color", var_14_44)
			end

			local var_14_45 = arg_11_1.bgs_.S0011.transform
			local var_14_46 = 1

			if var_14_46 < arg_11_1.time_ and arg_11_1.time_ <= var_14_46 + arg_14_0 then
				arg_11_1.var_.moveOldPosS0011 = var_14_45.localPosition
			end

			local var_14_47 = 3.075

			if var_14_46 <= arg_11_1.time_ and arg_11_1.time_ < var_14_46 + var_14_47 then
				local var_14_48 = (arg_11_1.time_ - var_14_46) / var_14_47
				local var_14_49 = Vector3.New(0, 1, 9)

				var_14_45.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPosS0011, var_14_49, var_14_48)
			end

			if arg_11_1.time_ >= var_14_46 + var_14_47 and arg_11_1.time_ < var_14_46 + var_14_47 + arg_14_0 then
				var_14_45.localPosition = Vector3.New(0, 1, 9)
			end

			local var_14_50 = 0

			if var_14_50 < arg_11_1.time_ and arg_11_1.time_ <= var_14_50 + arg_14_0 then
				arg_11_1.allBtn_.enabled = false
			end

			local var_14_51 = 2.5

			if arg_11_1.time_ >= var_14_50 + var_14_51 and arg_11_1.time_ < var_14_50 + var_14_51 + arg_14_0 then
				arg_11_1.allBtn_.enabled = true
			end

			if arg_11_1.frameCnt_ <= 1 then
				arg_11_1.dialog_:SetActive(false)
			end

			local var_14_52 = 2.5
			local var_14_53 = 1.575

			if var_14_52 < arg_11_1.time_ and arg_11_1.time_ <= var_14_52 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_54 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_54:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_55 = arg_11_1:GetWordFromCfg(100011003)
				local var_14_56 = arg_11_1:FormatText(var_14_55.content)

				arg_11_1.text_.text = var_14_56

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_57 = 64
				local var_14_58 = utf8.len(var_14_56)
				local var_14_59 = var_14_57 <= 0 and var_14_53 or var_14_53 * (var_14_58 / var_14_57)

				if var_14_59 > 0 and var_14_53 < var_14_59 then
					arg_11_1.talkMaxDuration = var_14_59
					var_14_52 = var_14_52 + 0.3

					if var_14_59 + var_14_52 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_59 + var_14_52
					end
				end

				arg_11_1.text_.text = var_14_56
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011003", "story_v_out_100011.awb") ~= 0 then
					local var_14_60 = manager.audio:GetVoiceLength("story_v_out_100011", "100011003", "story_v_out_100011.awb") / 1000

					if var_14_60 + var_14_52 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_60 + var_14_52
					end

					if var_14_55.prefab_name ~= "" and arg_11_1.actors_[var_14_55.prefab_name] ~= nil then
						local var_14_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_55.prefab_name].transform, "story_v_out_100011", "100011003", "story_v_out_100011.awb")

						arg_11_1:RecordAudio("100011003", var_14_61)
						arg_11_1:RecordAudio("100011003", var_14_61)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_100011", "100011003", "story_v_out_100011.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_100011", "100011003", "story_v_out_100011.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_62 = var_14_52 + 0.3
			local var_14_63 = math.max(var_14_53, arg_11_1.talkMaxDuration)

			if var_14_62 <= arg_11_1.time_ and arg_11_1.time_ < var_14_62 + var_14_63 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_62) / var_14_63

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_62 + var_14_63 and arg_11_1.time_ < var_14_62 + var_14_63 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play100011004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 100011004
		arg_17_1.duration_ = 21.1

		local var_17_0 = {
			ja = 21.1,
			ko = 14.933,
			zh = 16.366,
			en = 18.233
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play100011005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.bgs_.S0011.transform
			local var_20_1 = 1

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				arg_17_1.var_.moveOldPosS0011 = var_20_0.localPosition
			end

			local var_20_2 = 0.001

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2
				local var_20_4 = Vector3.New(0, -100, 10)

				var_20_0.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPosS0011, var_20_4, var_20_3)
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 then
				var_20_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_20_5 = "S0012"

			if arg_17_1.bgs_[var_20_5] == nil then
				local var_20_6 = Object.Instantiate(arg_17_1.paintGo_)

				var_20_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_20_5)
				var_20_6.name = var_20_5
				var_20_6.transform.parent = arg_17_1.stage_.transform
				var_20_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_17_1.bgs_[var_20_5] = var_20_6
			end

			local var_20_7 = 1

			if var_20_7 < arg_17_1.time_ and arg_17_1.time_ <= var_20_7 + arg_20_0 then
				local var_20_8 = manager.ui.mainCamera.transform.localPosition
				local var_20_9 = Vector3.New(0, 0, 10) + Vector3.New(var_20_8.x, var_20_8.y, 0)
				local var_20_10 = arg_17_1.bgs_.S0012

				var_20_10.transform.localPosition = var_20_9
				var_20_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_20_11 = var_20_10:GetComponent("SpriteRenderer")

				if var_20_11 and var_20_11.sprite then
					local var_20_12 = (var_20_10.transform.localPosition - var_20_8).z
					local var_20_13 = manager.ui.mainCameraCom_
					local var_20_14 = 2 * var_20_12 * Mathf.Tan(var_20_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_20_15 = var_20_14 * var_20_13.aspect
					local var_20_16 = var_20_11.sprite.bounds.size.x
					local var_20_17 = var_20_11.sprite.bounds.size.y
					local var_20_18 = var_20_15 / var_20_16
					local var_20_19 = var_20_14 / var_20_17
					local var_20_20 = var_20_19 < var_20_18 and var_20_18 or var_20_19

					var_20_10.transform.localScale = Vector3.New(var_20_20, var_20_20, 0)
				end

				for iter_20_0, iter_20_1 in pairs(arg_17_1.bgs_) do
					if iter_20_0 ~= "S0012" then
						iter_20_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_20_21 = arg_17_1.bgs_.S0011
			local var_20_22 = 0

			if var_20_22 < arg_17_1.time_ and arg_17_1.time_ <= var_20_22 + arg_20_0 then
				local var_20_23 = var_20_21:GetComponent("SpriteRenderer")

				if var_20_23 then
					var_20_23.material = arg_17_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_20_24 = var_20_23.material
					local var_20_25 = var_20_24:GetColor("_Color")

					arg_17_1.var_.alphaOldValueS0011 = var_20_25.a
					arg_17_1.var_.alphaMatValueS0011 = var_20_24
				end

				arg_17_1.var_.alphaOldValueS0011 = 1
			end

			local var_20_26 = 1

			if var_20_22 <= arg_17_1.time_ and arg_17_1.time_ < var_20_22 + var_20_26 then
				local var_20_27 = (arg_17_1.time_ - var_20_22) / var_20_26
				local var_20_28 = Mathf.Lerp(arg_17_1.var_.alphaOldValueS0011, 0, var_20_27)

				if arg_17_1.var_.alphaMatValueS0011 then
					local var_20_29 = arg_17_1.var_.alphaMatValueS0011
					local var_20_30 = var_20_29:GetColor("_Color")

					var_20_30.a = var_20_28

					var_20_29:SetColor("_Color", var_20_30)
				end
			end

			if arg_17_1.time_ >= var_20_22 + var_20_26 and arg_17_1.time_ < var_20_22 + var_20_26 + arg_20_0 and arg_17_1.var_.alphaMatValueS0011 then
				local var_20_31 = arg_17_1.var_.alphaMatValueS0011
				local var_20_32 = var_20_31:GetColor("_Color")

				var_20_32.a = 0

				var_20_31:SetColor("_Color", var_20_32)
			end

			local var_20_33 = arg_17_1.bgs_.S0012
			local var_20_34 = 1

			if var_20_34 < arg_17_1.time_ and arg_17_1.time_ <= var_20_34 + arg_20_0 then
				local var_20_35 = var_20_33:GetComponent("SpriteRenderer")

				if var_20_35 then
					var_20_35.material = arg_17_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_20_36 = var_20_35.material
					local var_20_37 = var_20_36:GetColor("_Color")

					arg_17_1.var_.alphaOldValueS0012 = var_20_37.a
					arg_17_1.var_.alphaMatValueS0012 = var_20_36
				end

				arg_17_1.var_.alphaOldValueS0012 = 0
			end

			local var_20_38 = 1.5

			if var_20_34 <= arg_17_1.time_ and arg_17_1.time_ < var_20_34 + var_20_38 then
				local var_20_39 = (arg_17_1.time_ - var_20_34) / var_20_38
				local var_20_40 = Mathf.Lerp(arg_17_1.var_.alphaOldValueS0012, 1, var_20_39)

				if arg_17_1.var_.alphaMatValueS0012 then
					local var_20_41 = arg_17_1.var_.alphaMatValueS0012
					local var_20_42 = var_20_41:GetColor("_Color")

					var_20_42.a = var_20_40

					var_20_41:SetColor("_Color", var_20_42)
				end
			end

			if arg_17_1.time_ >= var_20_34 + var_20_38 and arg_17_1.time_ < var_20_34 + var_20_38 + arg_20_0 and arg_17_1.var_.alphaMatValueS0012 then
				local var_20_43 = arg_17_1.var_.alphaMatValueS0012
				local var_20_44 = var_20_43:GetColor("_Color")

				var_20_44.a = 1

				var_20_43:SetColor("_Color", var_20_44)
			end

			local var_20_45 = arg_17_1.bgs_.S0012.transform
			local var_20_46 = 1

			if var_20_46 < arg_17_1.time_ and arg_17_1.time_ <= var_20_46 + arg_20_0 then
				arg_17_1.var_.moveOldPosS0012 = var_20_45.localPosition
			end

			local var_20_47 = 3.65

			if var_20_46 <= arg_17_1.time_ and arg_17_1.time_ < var_20_46 + var_20_47 then
				local var_20_48 = (arg_17_1.time_ - var_20_46) / var_20_47
				local var_20_49 = Vector3.New(0, 1, 8)

				var_20_45.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPosS0012, var_20_49, var_20_48)
			end

			if arg_17_1.time_ >= var_20_46 + var_20_47 and arg_17_1.time_ < var_20_46 + var_20_47 + arg_20_0 then
				var_20_45.localPosition = Vector3.New(0, 1, 8)
			end

			local var_20_50 = 0

			if var_20_50 < arg_17_1.time_ and arg_17_1.time_ <= var_20_50 + arg_20_0 then
				arg_17_1.allBtn_.enabled = false
			end

			local var_20_51 = 2.5

			if arg_17_1.time_ >= var_20_50 + var_20_51 and arg_17_1.time_ < var_20_50 + var_20_51 + arg_20_0 then
				arg_17_1.allBtn_.enabled = true
			end

			if arg_17_1.frameCnt_ <= 1 then
				arg_17_1.dialog_:SetActive(false)
			end

			local var_20_52 = 2.5
			local var_20_53 = 2.15

			if var_20_52 < arg_17_1.time_ and arg_17_1.time_ <= var_20_52 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0

				arg_17_1.dialog_:SetActive(true)

				local var_20_54 = LeanTween.value(arg_17_1.dialog_, 0, 1, 0.3)

				var_20_54:setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
					arg_17_1.dialogCg_.alpha = arg_21_0
				end))
				var_20_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_17_1.dialog_)
					var_20_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_17_1.duration_ = arg_17_1.duration_ + 0.3

				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_55 = arg_17_1:GetWordFromCfg(100011004)
				local var_20_56 = arg_17_1:FormatText(var_20_55.content)

				arg_17_1.text_.text = var_20_56

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_57 = 61
				local var_20_58 = utf8.len(var_20_56)
				local var_20_59 = var_20_57 <= 0 and var_20_53 or var_20_53 * (var_20_58 / var_20_57)

				if var_20_59 > 0 and var_20_53 < var_20_59 then
					arg_17_1.talkMaxDuration = var_20_59
					var_20_52 = var_20_52 + 0.3

					if var_20_59 + var_20_52 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_59 + var_20_52
					end
				end

				arg_17_1.text_.text = var_20_56
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011004", "story_v_out_100011.awb") ~= 0 then
					local var_20_60 = manager.audio:GetVoiceLength("story_v_out_100011", "100011004", "story_v_out_100011.awb") / 1000

					if var_20_60 + var_20_52 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_60 + var_20_52
					end

					if var_20_55.prefab_name ~= "" and arg_17_1.actors_[var_20_55.prefab_name] ~= nil then
						local var_20_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_55.prefab_name].transform, "story_v_out_100011", "100011004", "story_v_out_100011.awb")

						arg_17_1:RecordAudio("100011004", var_20_61)
						arg_17_1:RecordAudio("100011004", var_20_61)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_100011", "100011004", "story_v_out_100011.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_100011", "100011004", "story_v_out_100011.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_62 = var_20_52 + 0.3
			local var_20_63 = math.max(var_20_53, arg_17_1.talkMaxDuration)

			if var_20_62 <= arg_17_1.time_ and arg_17_1.time_ < var_20_62 + var_20_63 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_62) / var_20_63

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_62 + var_20_63 and arg_17_1.time_ < var_20_62 + var_20_63 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play100011005 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 100011005
		arg_23_1.duration_ = 6.433

		local var_23_0 = {
			ja = 6.433,
			ko = 4.233,
			zh = 4.666,
			en = 3.766
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
				arg_23_0:Play100011006(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.075

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				arg_23_1.dialog_:SetActive(true)

				local var_26_2 = LeanTween.value(arg_23_1.dialog_, 0, 1, 0.3)

				var_26_2:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_23_1.dialogCg_.alpha = arg_27_0
				end))
				var_26_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_23_1.dialog_)
					var_26_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_23_1.duration_ = arg_23_1.duration_ + 0.3

				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(100011005)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 19
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7
					var_26_0 = var_26_0 + 0.3

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011005", "story_v_out_100011.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_100011", "100011005", "story_v_out_100011.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_100011", "100011005", "story_v_out_100011.awb")

						arg_23_1:RecordAudio("100011005", var_26_9)
						arg_23_1:RecordAudio("100011005", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_100011", "100011005", "story_v_out_100011.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_100011", "100011005", "story_v_out_100011.awb")
				end

				local var_26_10 = string.gsub(var_26_4, "「视骸」", "「视骸」(BUG)")

				arg_23_1:RecordContent(var_26_10)
			end

			local var_26_11 = var_26_0 + 0.3
			local var_26_12 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_12 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_11) / var_26_12

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_11 + var_26_12 and arg_23_1.time_ < var_26_11 + var_26_12 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play100011006 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 100011006
		arg_29_1.duration_ = 16.466

		local var_29_0 = {
			ja = 16.466,
			ko = 13.766,
			zh = 10.833,
			en = 14.533
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play100011007(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.bgs_.S0012.transform
			local var_32_1 = 1

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPosS0012 = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(0, -100, 10)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPosS0012, var_32_4, var_32_3)
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_32_5 = "S0016"

			if arg_29_1.bgs_[var_32_5] == nil then
				local var_32_6 = Object.Instantiate(arg_29_1.paintGo_)

				var_32_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_32_5)
				var_32_6.name = var_32_5
				var_32_6.transform.parent = arg_29_1.stage_.transform
				var_32_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.bgs_[var_32_5] = var_32_6
			end

			local var_32_7 = 1

			if var_32_7 < arg_29_1.time_ and arg_29_1.time_ <= var_32_7 + arg_32_0 then
				local var_32_8 = manager.ui.mainCamera.transform.localPosition
				local var_32_9 = Vector3.New(0, 0, 10) + Vector3.New(var_32_8.x, var_32_8.y, 0)
				local var_32_10 = arg_29_1.bgs_.S0016

				var_32_10.transform.localPosition = var_32_9
				var_32_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_32_11 = var_32_10:GetComponent("SpriteRenderer")

				if var_32_11 and var_32_11.sprite then
					local var_32_12 = (var_32_10.transform.localPosition - var_32_8).z
					local var_32_13 = manager.ui.mainCameraCom_
					local var_32_14 = 2 * var_32_12 * Mathf.Tan(var_32_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_32_15 = var_32_14 * var_32_13.aspect
					local var_32_16 = var_32_11.sprite.bounds.size.x
					local var_32_17 = var_32_11.sprite.bounds.size.y
					local var_32_18 = var_32_15 / var_32_16
					local var_32_19 = var_32_14 / var_32_17
					local var_32_20 = var_32_19 < var_32_18 and var_32_18 or var_32_19

					var_32_10.transform.localScale = Vector3.New(var_32_20, var_32_20, 0)
				end

				for iter_32_0, iter_32_1 in pairs(arg_29_1.bgs_) do
					if iter_32_0 ~= "S0016" then
						iter_32_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_32_21 = arg_29_1.bgs_.S0012
			local var_32_22 = 0

			if var_32_22 < arg_29_1.time_ and arg_29_1.time_ <= var_32_22 + arg_32_0 then
				local var_32_23 = var_32_21:GetComponent("SpriteRenderer")

				if var_32_23 then
					var_32_23.material = arg_29_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_32_24 = var_32_23.material
					local var_32_25 = var_32_24:GetColor("_Color")

					arg_29_1.var_.alphaOldValueS0012 = var_32_25.a
					arg_29_1.var_.alphaMatValueS0012 = var_32_24
				end

				arg_29_1.var_.alphaOldValueS0012 = 1
			end

			local var_32_26 = 1

			if var_32_22 <= arg_29_1.time_ and arg_29_1.time_ < var_32_22 + var_32_26 then
				local var_32_27 = (arg_29_1.time_ - var_32_22) / var_32_26
				local var_32_28 = Mathf.Lerp(arg_29_1.var_.alphaOldValueS0012, 0, var_32_27)

				if arg_29_1.var_.alphaMatValueS0012 then
					local var_32_29 = arg_29_1.var_.alphaMatValueS0012
					local var_32_30 = var_32_29:GetColor("_Color")

					var_32_30.a = var_32_28

					var_32_29:SetColor("_Color", var_32_30)
				end
			end

			if arg_29_1.time_ >= var_32_22 + var_32_26 and arg_29_1.time_ < var_32_22 + var_32_26 + arg_32_0 and arg_29_1.var_.alphaMatValueS0012 then
				local var_32_31 = arg_29_1.var_.alphaMatValueS0012
				local var_32_32 = var_32_31:GetColor("_Color")

				var_32_32.a = 0

				var_32_31:SetColor("_Color", var_32_32)
			end

			local var_32_33 = arg_29_1.bgs_.S0016
			local var_32_34 = 1

			if var_32_34 < arg_29_1.time_ and arg_29_1.time_ <= var_32_34 + arg_32_0 then
				local var_32_35 = var_32_33:GetComponent("SpriteRenderer")

				if var_32_35 then
					var_32_35.material = arg_29_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_32_36 = var_32_35.material
					local var_32_37 = var_32_36:GetColor("_Color")

					arg_29_1.var_.alphaOldValueS0016 = var_32_37.a
					arg_29_1.var_.alphaMatValueS0016 = var_32_36
				end

				arg_29_1.var_.alphaOldValueS0016 = 0
			end

			local var_32_38 = 1.5

			if var_32_34 <= arg_29_1.time_ and arg_29_1.time_ < var_32_34 + var_32_38 then
				local var_32_39 = (arg_29_1.time_ - var_32_34) / var_32_38
				local var_32_40 = Mathf.Lerp(arg_29_1.var_.alphaOldValueS0016, 1, var_32_39)

				if arg_29_1.var_.alphaMatValueS0016 then
					local var_32_41 = arg_29_1.var_.alphaMatValueS0016
					local var_32_42 = var_32_41:GetColor("_Color")

					var_32_42.a = var_32_40

					var_32_41:SetColor("_Color", var_32_42)
				end
			end

			if arg_29_1.time_ >= var_32_34 + var_32_38 and arg_29_1.time_ < var_32_34 + var_32_38 + arg_32_0 and arg_29_1.var_.alphaMatValueS0016 then
				local var_32_43 = arg_29_1.var_.alphaMatValueS0016
				local var_32_44 = var_32_43:GetColor("_Color")

				var_32_44.a = 1

				var_32_43:SetColor("_Color", var_32_44)
			end

			local var_32_45 = arg_29_1.bgs_.S0016.transform
			local var_32_46 = 1.73333333333333

			if var_32_46 < arg_29_1.time_ and arg_29_1.time_ <= var_32_46 + arg_32_0 then
				arg_29_1.var_.moveOldPosS0016 = var_32_45.localPosition
			end

			local var_32_47 = 3.3

			if var_32_46 <= arg_29_1.time_ and arg_29_1.time_ < var_32_46 + var_32_47 then
				local var_32_48 = (arg_29_1.time_ - var_32_46) / var_32_47
				local var_32_49 = Vector3.New(0, 1, 9)

				var_32_45.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPosS0016, var_32_49, var_32_48)
			end

			if arg_29_1.time_ >= var_32_46 + var_32_47 and arg_29_1.time_ < var_32_46 + var_32_47 + arg_32_0 then
				var_32_45.localPosition = Vector3.New(0, 1, 9)
			end

			local var_32_50 = 0

			if var_32_50 < arg_29_1.time_ and arg_29_1.time_ <= var_32_50 + arg_32_0 then
				arg_29_1.allBtn_.enabled = false
			end

			local var_32_51 = 2.5

			if arg_29_1.time_ >= var_32_50 + var_32_51 and arg_29_1.time_ < var_32_50 + var_32_51 + arg_32_0 then
				arg_29_1.allBtn_.enabled = true
			end

			if arg_29_1.frameCnt_ <= 1 then
				arg_29_1.dialog_:SetActive(false)
			end

			local var_32_52 = 2.5
			local var_32_53 = 0.975

			if var_32_52 < arg_29_1.time_ and arg_29_1.time_ <= var_32_52 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0

				arg_29_1.dialog_:SetActive(true)

				local var_32_54 = LeanTween.value(arg_29_1.dialog_, 0, 1, 0.3)

				var_32_54:setOnUpdate(LuaHelper.FloatAction(function(arg_33_0)
					arg_29_1.dialogCg_.alpha = arg_33_0
				end))
				var_32_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_29_1.dialog_)
					var_32_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_29_1.duration_ = arg_29_1.duration_ + 0.3

				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_55 = arg_29_1:GetWordFromCfg(100011006)
				local var_32_56 = arg_29_1:FormatText(var_32_55.content)

				arg_29_1.text_.text = var_32_56

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_57 = 43
				local var_32_58 = utf8.len(var_32_56)
				local var_32_59 = var_32_57 <= 0 and var_32_53 or var_32_53 * (var_32_58 / var_32_57)

				if var_32_59 > 0 and var_32_53 < var_32_59 then
					arg_29_1.talkMaxDuration = var_32_59
					var_32_52 = var_32_52 + 0.3

					if var_32_59 + var_32_52 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_59 + var_32_52
					end
				end

				arg_29_1.text_.text = var_32_56
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011006", "story_v_out_100011.awb") ~= 0 then
					local var_32_60 = manager.audio:GetVoiceLength("story_v_out_100011", "100011006", "story_v_out_100011.awb") / 1000

					if var_32_60 + var_32_52 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_60 + var_32_52
					end

					if var_32_55.prefab_name ~= "" and arg_29_1.actors_[var_32_55.prefab_name] ~= nil then
						local var_32_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_55.prefab_name].transform, "story_v_out_100011", "100011006", "story_v_out_100011.awb")

						arg_29_1:RecordAudio("100011006", var_32_61)
						arg_29_1:RecordAudio("100011006", var_32_61)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_100011", "100011006", "story_v_out_100011.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_100011", "100011006", "story_v_out_100011.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_62 = var_32_52 + 0.3
			local var_32_63 = math.max(var_32_53, arg_29_1.talkMaxDuration)

			if var_32_62 <= arg_29_1.time_ and arg_29_1.time_ < var_32_62 + var_32_63 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_62) / var_32_63

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_62 + var_32_63 and arg_29_1.time_ < var_32_62 + var_32_63 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play100011007 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 100011007
		arg_35_1.duration_ = 13.933

		local var_35_0 = {
			ja = 13.933,
			ko = 12.2,
			zh = 10.7,
			en = 12.733
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
				arg_35_0:Play100011008(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.bgs_.S0016.transform
			local var_38_1 = 1

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPosS0016 = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, -100, 10)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPosS0016, var_38_4, var_38_3)
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_38_5 = "S0017"

			if arg_35_1.bgs_[var_38_5] == nil then
				local var_38_6 = Object.Instantiate(arg_35_1.paintGo_)

				var_38_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_38_5)
				var_38_6.name = var_38_5
				var_38_6.transform.parent = arg_35_1.stage_.transform
				var_38_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.bgs_[var_38_5] = var_38_6
			end

			local var_38_7 = 1

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				local var_38_8 = manager.ui.mainCamera.transform.localPosition
				local var_38_9 = Vector3.New(0, 0, 10) + Vector3.New(var_38_8.x, var_38_8.y, 0)
				local var_38_10 = arg_35_1.bgs_.S0017

				var_38_10.transform.localPosition = var_38_9
				var_38_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_38_11 = var_38_10:GetComponent("SpriteRenderer")

				if var_38_11 and var_38_11.sprite then
					local var_38_12 = (var_38_10.transform.localPosition - var_38_8).z
					local var_38_13 = manager.ui.mainCameraCom_
					local var_38_14 = 2 * var_38_12 * Mathf.Tan(var_38_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_38_15 = var_38_14 * var_38_13.aspect
					local var_38_16 = var_38_11.sprite.bounds.size.x
					local var_38_17 = var_38_11.sprite.bounds.size.y
					local var_38_18 = var_38_15 / var_38_16
					local var_38_19 = var_38_14 / var_38_17
					local var_38_20 = var_38_19 < var_38_18 and var_38_18 or var_38_19

					var_38_10.transform.localScale = Vector3.New(var_38_20, var_38_20, 0)
				end

				for iter_38_0, iter_38_1 in pairs(arg_35_1.bgs_) do
					if iter_38_0 ~= "S0017" then
						iter_38_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_38_21 = arg_35_1.bgs_.S0017
			local var_38_22 = 0

			if var_38_22 < arg_35_1.time_ and arg_35_1.time_ <= var_38_22 + arg_38_0 then
				local var_38_23 = var_38_21:GetComponent("SpriteRenderer")

				if var_38_23 then
					var_38_23.material = arg_35_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_38_24 = var_38_23.material
					local var_38_25 = var_38_24:GetColor("_Color")

					arg_35_1.var_.alphaOldValueS0017 = var_38_25.a
					arg_35_1.var_.alphaMatValueS0017 = var_38_24
				end

				arg_35_1.var_.alphaOldValueS0017 = 1
			end

			local var_38_26 = 1

			if var_38_22 <= arg_35_1.time_ and arg_35_1.time_ < var_38_22 + var_38_26 then
				local var_38_27 = (arg_35_1.time_ - var_38_22) / var_38_26
				local var_38_28 = Mathf.Lerp(arg_35_1.var_.alphaOldValueS0017, 0, var_38_27)

				if arg_35_1.var_.alphaMatValueS0017 then
					local var_38_29 = arg_35_1.var_.alphaMatValueS0017
					local var_38_30 = var_38_29:GetColor("_Color")

					var_38_30.a = var_38_28

					var_38_29:SetColor("_Color", var_38_30)
				end
			end

			if arg_35_1.time_ >= var_38_22 + var_38_26 and arg_35_1.time_ < var_38_22 + var_38_26 + arg_38_0 and arg_35_1.var_.alphaMatValueS0017 then
				local var_38_31 = arg_35_1.var_.alphaMatValueS0017
				local var_38_32 = var_38_31:GetColor("_Color")

				var_38_32.a = 0

				var_38_31:SetColor("_Color", var_38_32)
			end

			local var_38_33 = arg_35_1.bgs_.S0017
			local var_38_34 = 1

			if var_38_34 < arg_35_1.time_ and arg_35_1.time_ <= var_38_34 + arg_38_0 then
				local var_38_35 = var_38_33:GetComponent("SpriteRenderer")

				if var_38_35 then
					var_38_35.material = arg_35_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_38_36 = var_38_35.material
					local var_38_37 = var_38_36:GetColor("_Color")

					arg_35_1.var_.alphaOldValueS0017 = var_38_37.a
					arg_35_1.var_.alphaMatValueS0017 = var_38_36
				end

				arg_35_1.var_.alphaOldValueS0017 = 0
			end

			local var_38_38 = 1

			if var_38_34 <= arg_35_1.time_ and arg_35_1.time_ < var_38_34 + var_38_38 then
				local var_38_39 = (arg_35_1.time_ - var_38_34) / var_38_38
				local var_38_40 = Mathf.Lerp(arg_35_1.var_.alphaOldValueS0017, 1, var_38_39)

				if arg_35_1.var_.alphaMatValueS0017 then
					local var_38_41 = arg_35_1.var_.alphaMatValueS0017
					local var_38_42 = var_38_41:GetColor("_Color")

					var_38_42.a = var_38_40

					var_38_41:SetColor("_Color", var_38_42)
				end
			end

			if arg_35_1.time_ >= var_38_34 + var_38_38 and arg_35_1.time_ < var_38_34 + var_38_38 + arg_38_0 and arg_35_1.var_.alphaMatValueS0017 then
				local var_38_43 = arg_35_1.var_.alphaMatValueS0017
				local var_38_44 = var_38_43:GetColor("_Color")

				var_38_44.a = 1

				var_38_43:SetColor("_Color", var_38_44)
			end

			local var_38_45 = arg_35_1.bgs_.S0017.transform
			local var_38_46 = 1.5

			if var_38_46 < arg_35_1.time_ and arg_35_1.time_ <= var_38_46 + arg_38_0 then
				arg_35_1.var_.moveOldPosS0017 = var_38_45.localPosition
			end

			local var_38_47 = 1.8

			if var_38_46 <= arg_35_1.time_ and arg_35_1.time_ < var_38_46 + var_38_47 then
				local var_38_48 = (arg_35_1.time_ - var_38_46) / var_38_47
				local var_38_49 = Vector3.New(0, 1, 9)

				var_38_45.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPosS0017, var_38_49, var_38_48)
			end

			if arg_35_1.time_ >= var_38_46 + var_38_47 and arg_35_1.time_ < var_38_46 + var_38_47 + arg_38_0 then
				var_38_45.localPosition = Vector3.New(0, 1, 9)
			end

			local var_38_50 = 0

			if var_38_50 < arg_35_1.time_ and arg_35_1.time_ <= var_38_50 + arg_38_0 then
				arg_35_1.allBtn_.enabled = false
			end

			local var_38_51 = 2

			if arg_35_1.time_ >= var_38_50 + var_38_51 and arg_35_1.time_ < var_38_50 + var_38_51 + arg_38_0 then
				arg_35_1.allBtn_.enabled = true
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_52 = 2
			local var_38_53 = 1.65

			if var_38_52 < arg_35_1.time_ and arg_35_1.time_ <= var_38_52 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_54 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_54:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_55 = arg_35_1:GetWordFromCfg(100011007)
				local var_38_56 = arg_35_1:FormatText(var_38_55.content)

				arg_35_1.text_.text = var_38_56

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_57 = 39
				local var_38_58 = utf8.len(var_38_56)
				local var_38_59 = var_38_57 <= 0 and var_38_53 or var_38_53 * (var_38_58 / var_38_57)

				if var_38_59 > 0 and var_38_53 < var_38_59 then
					arg_35_1.talkMaxDuration = var_38_59
					var_38_52 = var_38_52 + 0.3

					if var_38_59 + var_38_52 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_59 + var_38_52
					end
				end

				arg_35_1.text_.text = var_38_56
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011007", "story_v_out_100011.awb") ~= 0 then
					local var_38_60 = manager.audio:GetVoiceLength("story_v_out_100011", "100011007", "story_v_out_100011.awb") / 1000

					if var_38_60 + var_38_52 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_60 + var_38_52
					end

					if var_38_55.prefab_name ~= "" and arg_35_1.actors_[var_38_55.prefab_name] ~= nil then
						local var_38_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_55.prefab_name].transform, "story_v_out_100011", "100011007", "story_v_out_100011.awb")

						arg_35_1:RecordAudio("100011007", var_38_61)
						arg_35_1:RecordAudio("100011007", var_38_61)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_100011", "100011007", "story_v_out_100011.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_100011", "100011007", "story_v_out_100011.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_62 = var_38_52 + 0.3
			local var_38_63 = math.max(var_38_53, arg_35_1.talkMaxDuration)

			if var_38_62 <= arg_35_1.time_ and arg_35_1.time_ < var_38_62 + var_38_63 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_62) / var_38_63

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_62 + var_38_63 and arg_35_1.time_ < var_38_62 + var_38_63 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play100011008 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 100011008
		arg_41_1.duration_ = 14.3

		local var_41_0 = {
			ja = 14.3,
			ko = 10.466,
			zh = 10.266,
			en = 11.4
		}
		local var_41_1 = manager.audio:GetLocalizationFlag()

		if var_41_0[var_41_1] ~= nil then
			arg_41_1.duration_ = var_41_0[var_41_1]
		end

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play100011009(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.bgs_.S0017.transform
			local var_44_1 = 1

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPosS0017 = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(0, -100, 10)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPosS0017, var_44_4, var_44_3)
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_44_5 = "S0013"

			if arg_41_1.bgs_[var_44_5] == nil then
				local var_44_6 = Object.Instantiate(arg_41_1.paintGo_)

				var_44_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_44_5)
				var_44_6.name = var_44_5
				var_44_6.transform.parent = arg_41_1.stage_.transform
				var_44_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_41_1.bgs_[var_44_5] = var_44_6
			end

			local var_44_7 = 1

			if var_44_7 < arg_41_1.time_ and arg_41_1.time_ <= var_44_7 + arg_44_0 then
				local var_44_8 = manager.ui.mainCamera.transform.localPosition
				local var_44_9 = Vector3.New(0, 0, 10) + Vector3.New(var_44_8.x, var_44_8.y, 0)
				local var_44_10 = arg_41_1.bgs_.S0013

				var_44_10.transform.localPosition = var_44_9
				var_44_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_44_11 = var_44_10:GetComponent("SpriteRenderer")

				if var_44_11 and var_44_11.sprite then
					local var_44_12 = (var_44_10.transform.localPosition - var_44_8).z
					local var_44_13 = manager.ui.mainCameraCom_
					local var_44_14 = 2 * var_44_12 * Mathf.Tan(var_44_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_44_15 = var_44_14 * var_44_13.aspect
					local var_44_16 = var_44_11.sprite.bounds.size.x
					local var_44_17 = var_44_11.sprite.bounds.size.y
					local var_44_18 = var_44_15 / var_44_16
					local var_44_19 = var_44_14 / var_44_17
					local var_44_20 = var_44_19 < var_44_18 and var_44_18 or var_44_19

					var_44_10.transform.localScale = Vector3.New(var_44_20, var_44_20, 0)
				end

				for iter_44_0, iter_44_1 in pairs(arg_41_1.bgs_) do
					if iter_44_0 ~= "S0013" then
						iter_44_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_44_21 = arg_41_1.bgs_.S0017
			local var_44_22 = 0

			if var_44_22 < arg_41_1.time_ and arg_41_1.time_ <= var_44_22 + arg_44_0 then
				local var_44_23 = var_44_21:GetComponent("SpriteRenderer")

				if var_44_23 then
					var_44_23.material = arg_41_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_44_24 = var_44_23.material
					local var_44_25 = var_44_24:GetColor("_Color")

					arg_41_1.var_.alphaOldValueS0017 = var_44_25.a
					arg_41_1.var_.alphaMatValueS0017 = var_44_24
				end

				arg_41_1.var_.alphaOldValueS0017 = 1
			end

			local var_44_26 = 1

			if var_44_22 <= arg_41_1.time_ and arg_41_1.time_ < var_44_22 + var_44_26 then
				local var_44_27 = (arg_41_1.time_ - var_44_22) / var_44_26
				local var_44_28 = Mathf.Lerp(arg_41_1.var_.alphaOldValueS0017, 0, var_44_27)

				if arg_41_1.var_.alphaMatValueS0017 then
					local var_44_29 = arg_41_1.var_.alphaMatValueS0017
					local var_44_30 = var_44_29:GetColor("_Color")

					var_44_30.a = var_44_28

					var_44_29:SetColor("_Color", var_44_30)
				end
			end

			if arg_41_1.time_ >= var_44_22 + var_44_26 and arg_41_1.time_ < var_44_22 + var_44_26 + arg_44_0 and arg_41_1.var_.alphaMatValueS0017 then
				local var_44_31 = arg_41_1.var_.alphaMatValueS0017
				local var_44_32 = var_44_31:GetColor("_Color")

				var_44_32.a = 0

				var_44_31:SetColor("_Color", var_44_32)
			end

			local var_44_33 = arg_41_1.bgs_.S0013
			local var_44_34 = 1

			if var_44_34 < arg_41_1.time_ and arg_41_1.time_ <= var_44_34 + arg_44_0 then
				local var_44_35 = var_44_33:GetComponent("SpriteRenderer")

				if var_44_35 then
					var_44_35.material = arg_41_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_44_36 = var_44_35.material
					local var_44_37 = var_44_36:GetColor("_Color")

					arg_41_1.var_.alphaOldValueS0013 = var_44_37.a
					arg_41_1.var_.alphaMatValueS0013 = var_44_36
				end

				arg_41_1.var_.alphaOldValueS0013 = 0
			end

			local var_44_38 = 1

			if var_44_34 <= arg_41_1.time_ and arg_41_1.time_ < var_44_34 + var_44_38 then
				local var_44_39 = (arg_41_1.time_ - var_44_34) / var_44_38
				local var_44_40 = Mathf.Lerp(arg_41_1.var_.alphaOldValueS0013, 1, var_44_39)

				if arg_41_1.var_.alphaMatValueS0013 then
					local var_44_41 = arg_41_1.var_.alphaMatValueS0013
					local var_44_42 = var_44_41:GetColor("_Color")

					var_44_42.a = var_44_40

					var_44_41:SetColor("_Color", var_44_42)
				end
			end

			if arg_41_1.time_ >= var_44_34 + var_44_38 and arg_41_1.time_ < var_44_34 + var_44_38 + arg_44_0 and arg_41_1.var_.alphaMatValueS0013 then
				local var_44_43 = arg_41_1.var_.alphaMatValueS0013
				local var_44_44 = var_44_43:GetColor("_Color")

				var_44_44.a = 1

				var_44_43:SetColor("_Color", var_44_44)
			end

			local var_44_45 = arg_41_1.bgs_.S0013.transform
			local var_44_46 = 1.76666666666667

			if var_44_46 < arg_41_1.time_ and arg_41_1.time_ <= var_44_46 + arg_44_0 then
				arg_41_1.var_.moveOldPosS0013 = var_44_45.localPosition
			end

			local var_44_47 = 1.7

			if var_44_46 <= arg_41_1.time_ and arg_41_1.time_ < var_44_46 + var_44_47 then
				local var_44_48 = (arg_41_1.time_ - var_44_46) / var_44_47
				local var_44_49 = Vector3.New(0, 1, 9)

				var_44_45.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPosS0013, var_44_49, var_44_48)
			end

			if arg_41_1.time_ >= var_44_46 + var_44_47 and arg_41_1.time_ < var_44_46 + var_44_47 + arg_44_0 then
				var_44_45.localPosition = Vector3.New(0, 1, 9)
			end

			local var_44_50 = 0

			if var_44_50 < arg_41_1.time_ and arg_41_1.time_ <= var_44_50 + arg_44_0 then
				arg_41_1.allBtn_.enabled = false
			end

			local var_44_51 = 2

			if arg_41_1.time_ >= var_44_50 + var_44_51 and arg_41_1.time_ < var_44_50 + var_44_51 + arg_44_0 then
				arg_41_1.allBtn_.enabled = true
			end

			if arg_41_1.frameCnt_ <= 1 then
				arg_41_1.dialog_:SetActive(false)
			end

			local var_44_52 = 2
			local var_44_53 = 1.025

			if var_44_52 < arg_41_1.time_ and arg_41_1.time_ <= var_44_52 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				arg_41_1.dialog_:SetActive(true)

				local var_44_54 = LeanTween.value(arg_41_1.dialog_, 0, 1, 0.3)

				var_44_54:setOnUpdate(LuaHelper.FloatAction(function(arg_45_0)
					arg_41_1.dialogCg_.alpha = arg_45_0
				end))
				var_44_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_41_1.dialog_)
					var_44_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_41_1.duration_ = arg_41_1.duration_ + 0.3

				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_55 = arg_41_1:GetWordFromCfg(100011008)
				local var_44_56 = arg_41_1:FormatText(var_44_55.content)

				arg_41_1.text_.text = var_44_56

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_57 = 41
				local var_44_58 = utf8.len(var_44_56)
				local var_44_59 = var_44_57 <= 0 and var_44_53 or var_44_53 * (var_44_58 / var_44_57)

				if var_44_59 > 0 and var_44_53 < var_44_59 then
					arg_41_1.talkMaxDuration = var_44_59
					var_44_52 = var_44_52 + 0.3

					if var_44_59 + var_44_52 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_59 + var_44_52
					end
				end

				arg_41_1.text_.text = var_44_56
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011008", "story_v_out_100011.awb") ~= 0 then
					local var_44_60 = manager.audio:GetVoiceLength("story_v_out_100011", "100011008", "story_v_out_100011.awb") / 1000

					if var_44_60 + var_44_52 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_60 + var_44_52
					end

					if var_44_55.prefab_name ~= "" and arg_41_1.actors_[var_44_55.prefab_name] ~= nil then
						local var_44_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_55.prefab_name].transform, "story_v_out_100011", "100011008", "story_v_out_100011.awb")

						arg_41_1:RecordAudio("100011008", var_44_61)
						arg_41_1:RecordAudio("100011008", var_44_61)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_100011", "100011008", "story_v_out_100011.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_100011", "100011008", "story_v_out_100011.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_62 = var_44_52 + 0.3
			local var_44_63 = math.max(var_44_53, arg_41_1.talkMaxDuration)

			if var_44_62 <= arg_41_1.time_ and arg_41_1.time_ < var_44_62 + var_44_63 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_62) / var_44_63

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_62 + var_44_63 and arg_41_1.time_ < var_44_62 + var_44_63 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play100011009 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 100011009
		arg_47_1.duration_ = 6.733

		local var_47_0 = {
			ja = 5.8,
			ko = 4.933,
			zh = 5.033,
			en = 6.733
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
				arg_47_0:Play100011010(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.bgs_.S0013.transform
			local var_50_1 = 0.0166666666666667

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPosS0013 = var_50_0.localPosition
			end

			local var_50_2 = 1.7

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0.32, 0.72, 8)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPosS0013, var_50_4, var_50_3)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0.32, 0.72, 8)
			end

			local var_50_5 = arg_47_1.bgs_.S0013.transform
			local var_50_6 = 0

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.var_.moveOldPosS0013 = var_50_5.localPosition
			end

			local var_50_7 = 0.001

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_7 then
				local var_50_8 = (arg_47_1.time_ - var_50_6) / var_50_7
				local var_50_9 = Vector3.New(0, 1, 9)

				var_50_5.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPosS0013, var_50_9, var_50_8)
			end

			if arg_47_1.time_ >= var_50_6 + var_50_7 and arg_47_1.time_ < var_50_6 + var_50_7 + arg_50_0 then
				var_50_5.localPosition = Vector3.New(0, 1, 9)
			end

			local var_50_10 = 0
			local var_50_11 = 0.8

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

				local var_50_12 = arg_47_1:GetWordFromCfg(100011009)
				local var_50_13 = arg_47_1:FormatText(var_50_12.content)

				arg_47_1.text_.text = var_50_13

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_14 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011009", "story_v_out_100011.awb") ~= 0 then
					local var_50_17 = manager.audio:GetVoiceLength("story_v_out_100011", "100011009", "story_v_out_100011.awb") / 1000

					if var_50_17 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_17 + var_50_10
					end

					if var_50_12.prefab_name ~= "" and arg_47_1.actors_[var_50_12.prefab_name] ~= nil then
						local var_50_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_12.prefab_name].transform, "story_v_out_100011", "100011009", "story_v_out_100011.awb")

						arg_47_1:RecordAudio("100011009", var_50_18)
						arg_47_1:RecordAudio("100011009", var_50_18)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_100011", "100011009", "story_v_out_100011.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_100011", "100011009", "story_v_out_100011.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_19 = math.max(var_50_11, arg_47_1.talkMaxDuration)

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_19 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_10) / var_50_19

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_10 + var_50_19 and arg_47_1.time_ < var_50_10 + var_50_19 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play100011010 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 100011010
		arg_51_1.duration_ = 13.433

		local var_51_0 = {
			ja = 13.4,
			ko = 11.4,
			zh = 9.933,
			en = 13.433
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
				arg_51_0:Play100011011(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.bgs_.S0013.transform
			local var_54_1 = 1

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPosS0013 = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, -100, 10)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosS0013, var_54_4, var_54_3)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -100, 10)
			end

			local var_54_5 = "S0014"

			if arg_51_1.bgs_[var_54_5] == nil then
				local var_54_6 = Object.Instantiate(arg_51_1.paintGo_)

				var_54_6:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_54_5)
				var_54_6.name = var_54_5
				var_54_6.transform.parent = arg_51_1.stage_.transform
				var_54_6.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.bgs_[var_54_5] = var_54_6
			end

			local var_54_7 = 1

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 then
				local var_54_8 = manager.ui.mainCamera.transform.localPosition
				local var_54_9 = Vector3.New(0, 0, 10) + Vector3.New(var_54_8.x, var_54_8.y, 0)
				local var_54_10 = arg_51_1.bgs_.S0014

				var_54_10.transform.localPosition = var_54_9
				var_54_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_54_11 = var_54_10:GetComponent("SpriteRenderer")

				if var_54_11 and var_54_11.sprite then
					local var_54_12 = (var_54_10.transform.localPosition - var_54_8).z
					local var_54_13 = manager.ui.mainCameraCom_
					local var_54_14 = 2 * var_54_12 * Mathf.Tan(var_54_13.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_54_15 = var_54_14 * var_54_13.aspect
					local var_54_16 = var_54_11.sprite.bounds.size.x
					local var_54_17 = var_54_11.sprite.bounds.size.y
					local var_54_18 = var_54_15 / var_54_16
					local var_54_19 = var_54_14 / var_54_17
					local var_54_20 = var_54_19 < var_54_18 and var_54_18 or var_54_19

					var_54_10.transform.localScale = Vector3.New(var_54_20, var_54_20, 0)
				end

				for iter_54_0, iter_54_1 in pairs(arg_51_1.bgs_) do
					if iter_54_0 ~= "S0014" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_21 = 0

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_22 = 1

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_22 then
				local var_54_23 = (arg_51_1.time_ - var_54_21) / var_54_22
				local var_54_24 = Color.New(1, 1, 1)

				var_54_24.a = Mathf.Lerp(0, 1, var_54_23)
				arg_51_1.mask_.color = var_54_24
			end

			if arg_51_1.time_ >= var_54_21 + var_54_22 and arg_51_1.time_ < var_54_21 + var_54_22 + arg_54_0 then
				local var_54_25 = Color.New(1, 1, 1)

				var_54_25.a = 1
				arg_51_1.mask_.color = var_54_25
			end

			local var_54_26 = 1

			if var_54_26 < arg_51_1.time_ and arg_51_1.time_ <= var_54_26 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_27 = 1

			if var_54_26 <= arg_51_1.time_ and arg_51_1.time_ < var_54_26 + var_54_27 then
				local var_54_28 = (arg_51_1.time_ - var_54_26) / var_54_27
				local var_54_29 = Color.New(1, 1, 1)

				var_54_29.a = Mathf.Lerp(1, 0, var_54_28)
				arg_51_1.mask_.color = var_54_29
			end

			if arg_51_1.time_ >= var_54_26 + var_54_27 and arg_51_1.time_ < var_54_26 + var_54_27 + arg_54_0 then
				local var_54_30 = Color.New(1, 1, 1)
				local var_54_31 = 0

				arg_51_1.mask_.enabled = false
				var_54_30.a = var_54_31
				arg_51_1.mask_.color = var_54_30
			end

			local var_54_32 = arg_51_1.bgs_.S0014.transform
			local var_54_33 = 1

			if var_54_33 < arg_51_1.time_ and arg_51_1.time_ <= var_54_33 + arg_54_0 then
				arg_51_1.var_.moveOldPosS0014 = var_54_32.localPosition
			end

			local var_54_34 = 0.001

			if var_54_33 <= arg_51_1.time_ and arg_51_1.time_ < var_54_33 + var_54_34 then
				local var_54_35 = (arg_51_1.time_ - var_54_33) / var_54_34
				local var_54_36 = Vector3.New(0, 1, 7)

				var_54_32.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosS0014, var_54_36, var_54_35)
			end

			if arg_51_1.time_ >= var_54_33 + var_54_34 and arg_51_1.time_ < var_54_33 + var_54_34 + arg_54_0 then
				var_54_32.localPosition = Vector3.New(0, 1, 7)
			end

			local var_54_37 = 0

			if var_54_37 < arg_51_1.time_ and arg_51_1.time_ <= var_54_37 + arg_54_0 then
				arg_51_1.allBtn_.enabled = false
			end

			local var_54_38 = 2

			if arg_51_1.time_ >= var_54_37 + var_54_38 and arg_51_1.time_ < var_54_37 + var_54_38 + arg_54_0 then
				arg_51_1.allBtn_.enabled = true
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_39 = 2
			local var_54_40 = 1.025

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

				local var_54_42 = arg_51_1:GetWordFromCfg(100011010)
				local var_54_43 = arg_51_1:FormatText(var_54_42.content)

				arg_51_1.text_.text = var_54_43

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_44 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011010", "story_v_out_100011.awb") ~= 0 then
					local var_54_47 = manager.audio:GetVoiceLength("story_v_out_100011", "100011010", "story_v_out_100011.awb") / 1000

					if var_54_47 + var_54_39 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_47 + var_54_39
					end

					if var_54_42.prefab_name ~= "" and arg_51_1.actors_[var_54_42.prefab_name] ~= nil then
						local var_54_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_42.prefab_name].transform, "story_v_out_100011", "100011010", "story_v_out_100011.awb")

						arg_51_1:RecordAudio("100011010", var_54_48)
						arg_51_1:RecordAudio("100011010", var_54_48)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_100011", "100011010", "story_v_out_100011.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_100011", "100011010", "story_v_out_100011.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_49 = var_54_39 + 0.3
			local var_54_50 = math.max(var_54_40, arg_51_1.talkMaxDuration)

			if var_54_49 <= arg_51_1.time_ and arg_51_1.time_ < var_54_49 + var_54_50 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_49) / var_54_50

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_49 + var_54_50 and arg_51_1.time_ < var_54_49 + var_54_50 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play100011011 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 100011011
		arg_57_1.duration_ = 10.433

		local var_57_0 = {
			ja = 10.433,
			ko = 7.233,
			zh = 6.833,
			en = 9.266
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
				arg_57_0:Play100011012(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.bgs_.S0014.transform
			local var_60_1 = 0.0166666666666667

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPosS0014 = var_60_0.localPosition
			end

			local var_60_2 = 3

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0, 1, 10)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPosS0014, var_60_4, var_60_3)
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_60_5 = arg_57_1.bgs_.S0014.transform
			local var_60_6 = 0

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				arg_57_1.var_.moveOldPosS0014 = var_60_5.localPosition
			end

			local var_60_7 = 0.001

			if var_60_6 <= arg_57_1.time_ and arg_57_1.time_ < var_60_6 + var_60_7 then
				local var_60_8 = (arg_57_1.time_ - var_60_6) / var_60_7
				local var_60_9 = Vector3.New(0, 1, 7)

				var_60_5.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPosS0014, var_60_9, var_60_8)
			end

			if arg_57_1.time_ >= var_60_6 + var_60_7 and arg_57_1.time_ < var_60_6 + var_60_7 + arg_60_0 then
				var_60_5.localPosition = Vector3.New(0, 1, 7)
			end

			local var_60_10 = 0
			local var_60_11 = 0.8

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_12 = arg_57_1:GetWordFromCfg(100011011)
				local var_60_13 = arg_57_1:FormatText(var_60_12.content)

				arg_57_1.text_.text = var_60_13

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_14 = 32
				local var_60_15 = utf8.len(var_60_13)
				local var_60_16 = var_60_14 <= 0 and var_60_11 or var_60_11 * (var_60_15 / var_60_14)

				if var_60_16 > 0 and var_60_11 < var_60_16 then
					arg_57_1.talkMaxDuration = var_60_16

					if var_60_16 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_16 + var_60_10
					end
				end

				arg_57_1.text_.text = var_60_13
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011011", "story_v_out_100011.awb") ~= 0 then
					local var_60_17 = manager.audio:GetVoiceLength("story_v_out_100011", "100011011", "story_v_out_100011.awb") / 1000

					if var_60_17 + var_60_10 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_17 + var_60_10
					end

					if var_60_12.prefab_name ~= "" and arg_57_1.actors_[var_60_12.prefab_name] ~= nil then
						local var_60_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_12.prefab_name].transform, "story_v_out_100011", "100011011", "story_v_out_100011.awb")

						arg_57_1:RecordAudio("100011011", var_60_18)
						arg_57_1:RecordAudio("100011011", var_60_18)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_100011", "100011011", "story_v_out_100011.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_100011", "100011011", "story_v_out_100011.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_19 = math.max(var_60_11, arg_57_1.talkMaxDuration)

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_19 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_10) / var_60_19

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_10 + var_60_19 and arg_57_1.time_ < var_60_10 + var_60_19 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play100011012 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 100011012
		arg_61_1.duration_ = 15.066

		local var_61_0 = {
			ja = 15.066,
			ko = 9.6,
			zh = 8.766,
			en = 13.5
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
			arg_61_1.auto_ = false
		end

		function arg_61_1.playNext_(arg_63_0)
			arg_61_1.onStoryFinished_()
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 1.075

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_2 = arg_61_1:GetWordFromCfg(100011012)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 43
				local var_64_5 = utf8.len(var_64_3)
				local var_64_6 = var_64_4 <= 0 and var_64_1 or var_64_1 * (var_64_5 / var_64_4)

				if var_64_6 > 0 and var_64_1 < var_64_6 then
					arg_61_1.talkMaxDuration = var_64_6

					if var_64_6 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_6 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_3
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011012", "story_v_out_100011.awb") ~= 0 then
					local var_64_7 = manager.audio:GetVoiceLength("story_v_out_100011", "100011012", "story_v_out_100011.awb") / 1000

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end

					if var_64_2.prefab_name ~= "" and arg_61_1.actors_[var_64_2.prefab_name] ~= nil then
						local var_64_8 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_2.prefab_name].transform, "story_v_out_100011", "100011012", "story_v_out_100011.awb")

						arg_61_1:RecordAudio("100011012", var_64_8)
						arg_61_1:RecordAudio("100011012", var_64_8)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_100011", "100011012", "story_v_out_100011.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_100011", "100011012", "story_v_out_100011.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_9 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_9 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_9

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_9 and arg_61_1.time_ < var_64_0 + var_64_9 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0015",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0011",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0012",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0016",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0017",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0013",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0014"
	},
	voices = {
		"story_v_out_100011.awb"
	}
}
