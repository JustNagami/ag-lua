return {
	Play106132001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 106132001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play106132002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "C01b"

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
				local var_4_5 = arg_1_1.bgs_.C01b

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
					if iter_4_0 ~= "C01b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.C01b
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueC01b = var_4_20.a
					arg_1_1.var_.alphaMatValueC01b = var_4_19
				end

				arg_1_1.var_.alphaOldValueC01b = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueC01b, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueC01b then
					local var_4_24 = arg_1_1.var_.alphaMatValueC01b
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueC01b then
				local var_4_26 = arg_1_1.var_.alphaMatValueC01b
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = manager.ui.mainCamera.transform
			local var_4_29 = 1

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_28.localPosition
			end

			local var_4_30 = 0.6

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / 0.066
				local var_4_32, var_4_33 = math.modf(var_4_31)

				var_4_28.localPosition = Vector3.New(var_4_33 * 0.13, var_4_33 * 0.13, var_4_33 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_34 = manager.ui.mainCamera.transform
			local var_4_35 = 2

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_34.localPosition
			end

			local var_4_36 = 0.6

			if var_4_35 <= arg_1_1.time_ and arg_1_1.time_ < var_4_35 + var_4_36 then
				local var_4_37 = (arg_1_1.time_ - var_4_35) / 0.099
				local var_4_38, var_4_39 = math.modf(var_4_37)

				var_4_34.localPosition = Vector3.New(var_4_39 * 0.13, var_4_39 * 0.13, var_4_39 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_35 + var_4_36 and arg_1_1.time_ < var_4_35 + var_4_36 + arg_4_0 then
				var_4_34.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_40 = 0
			local var_4_41 = 1

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				local var_4_42 = "play"
				local var_4_43 = "music"

				arg_1_1:AudioAction(var_4_42, var_4_43, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_44 = 0

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_45 = 2

			if arg_1_1.time_ >= var_4_44 + var_4_45 and arg_1_1.time_ < var_4_44 + var_4_45 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_46 = 0
			local var_4_47 = 2.10843759123236

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				local var_4_48 = "play"
				local var_4_49 = "effect"

				arg_1_1:AudioAction(var_4_48, var_4_49, "se_story_6", "se_story_6_giant_sword", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_50 = 2
			local var_4_51 = 0.65

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_52 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_52:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(106132001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 26
				local var_4_56 = utf8.len(var_4_54)
				local var_4_57 = var_4_55 <= 0 and var_4_51 or var_4_51 * (var_4_56 / var_4_55)

				if var_4_57 > 0 and var_4_51 < var_4_57 then
					arg_1_1.talkMaxDuration = var_4_57
					var_4_50 = var_4_50 + 0.3

					if var_4_57 + var_4_50 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_50
					end
				end

				arg_1_1.text_.text = var_4_54
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_58 = var_4_50 + 0.3
			local var_4_59 = math.max(var_4_51, arg_1_1.talkMaxDuration)

			if var_4_58 <= arg_1_1.time_ and arg_1_1.time_ < var_4_58 + var_4_59 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_58) / var_4_59

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_58 + var_4_59 and arg_1_1.time_ < var_4_58 + var_4_59 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play106132002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 106132002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play106132003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.275

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_2 = arg_7_1:GetWordFromCfg(106132002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 51
				local var_10_5 = utf8.len(var_10_3)
				local var_10_6 = var_10_4 <= 0 and var_10_1 or var_10_1 * (var_10_5 / var_10_4)

				if var_10_6 > 0 and var_10_1 < var_10_6 then
					arg_7_1.talkMaxDuration = var_10_6

					if var_10_6 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_6 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_3
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_7 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_7 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_7

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_7 and arg_7_1.time_ < var_10_0 + var_10_7 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play106132003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 106132003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play106132004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1

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

				local var_14_2 = arg_11_1:GetWordFromCfg(106132003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 40
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
	Play106132004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 106132004
		arg_15_1.duration_ = 3.7

		local var_15_0 = {
			ja = 2.866,
			ko = 3.4,
			zh = 3.7,
			en = 1.999999999999
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
				arg_15_0:Play106132005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "3004_tpose"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("Char/" .. var_18_0), arg_15_1.stage_.transform)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_0] = var_18_1

				local var_18_2 = var_18_1:GetComponentInChildren(typeof(CharacterEffect))

				var_18_2.enabled = true

				local var_18_3 = GameObjectTools.GetOrAddComponent(var_18_1, typeof(DynamicBoneHelper))

				if var_18_3 then
					var_18_3:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_2.transform, false)

				arg_15_1.var_[var_18_0 .. "Animator"] = var_18_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_0 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_0 .. "LipSync"] = var_18_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_4 = arg_15_1.actors_["3004_tpose"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect3004_tpose == nil then
				arg_15_1.var_.characterEffect3004_tpose = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect3004_tpose then
					arg_15_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect3004_tpose then
				arg_15_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["3004_tpose"].transform
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 then
				arg_15_1.var_.moveOldPos3004_tpose = var_18_8.localPosition
			end

			local var_18_10 = 0.001

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10
				local var_18_12 = Vector3.New(0, -2.22, -3.1)

				var_18_8.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos3004_tpose, var_18_12, var_18_11)

				local var_18_13 = manager.ui.mainCamera.transform.position - var_18_8.position

				var_18_8.forward = Vector3.New(var_18_13.x, var_18_13.y, var_18_13.z)

				local var_18_14 = var_18_8.localEulerAngles

				var_18_14.z = 0
				var_18_14.x = 0
				var_18_8.localEulerAngles = var_18_14
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 then
				var_18_8.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_18_15 = manager.ui.mainCamera.transform.position - var_18_8.position

				var_18_8.forward = Vector3.New(var_18_15.x, var_18_15.y, var_18_15.z)

				local var_18_16 = var_18_8.localEulerAngles

				var_18_16.z = 0
				var_18_16.x = 0
				var_18_8.localEulerAngles = var_18_16
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_18_18 = 0
			local var_18_19 = 0.125

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_20 = arg_15_1:FormatText(StoryNameCfg[82].name)

				arg_15_1.leftNameTxt_.text = var_18_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_21 = arg_15_1:GetWordFromCfg(106132004)
				local var_18_22 = arg_15_1:FormatText(var_18_21.content)

				arg_15_1.text_.text = var_18_22

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_23 = 5
				local var_18_24 = utf8.len(var_18_22)
				local var_18_25 = var_18_23 <= 0 and var_18_19 or var_18_19 * (var_18_24 / var_18_23)

				if var_18_25 > 0 and var_18_19 < var_18_25 then
					arg_15_1.talkMaxDuration = var_18_25

					if var_18_25 + var_18_18 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_25 + var_18_18
					end
				end

				arg_15_1.text_.text = var_18_22
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132004", "story_v_out_106132.awb") ~= 0 then
					local var_18_26 = manager.audio:GetVoiceLength("story_v_out_106132", "106132004", "story_v_out_106132.awb") / 1000

					if var_18_26 + var_18_18 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_26 + var_18_18
					end

					if var_18_21.prefab_name ~= "" and arg_15_1.actors_[var_18_21.prefab_name] ~= nil then
						local var_18_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_21.prefab_name].transform, "story_v_out_106132", "106132004", "story_v_out_106132.awb")

						arg_15_1:RecordAudio("106132004", var_18_27)
						arg_15_1:RecordAudio("106132004", var_18_27)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_106132", "106132004", "story_v_out_106132.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_106132", "106132004", "story_v_out_106132.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_28 = math.max(var_18_19, arg_15_1.talkMaxDuration)

			if var_18_18 <= arg_15_1.time_ and arg_15_1.time_ < var_18_18 + var_18_28 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_18) / var_18_28

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_18 + var_18_28 and arg_15_1.time_ < var_18_18 + var_18_28 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play106132005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 106132005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play106132006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["3004_tpose"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect3004_tpose == nil then
				arg_19_1.var_.characterEffect3004_tpose = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect3004_tpose then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_19_1.var_.characterEffect3004_tpose.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect3004_tpose then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_19_1.var_.characterEffect3004_tpose.fillRatio = var_22_5
			end

			local var_22_6 = arg_19_1.actors_["3004_tpose"].transform
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.var_.moveOldPos3004_tpose = var_22_6.localPosition
			end

			local var_22_8 = 0.001

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8
				local var_22_10 = Vector3.New(0, 100, 0)

				var_22_6.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos3004_tpose, var_22_10, var_22_9)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_6.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_6.localEulerAngles = var_22_12
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 then
				var_22_6.localPosition = Vector3.New(0, 100, 0)

				local var_22_13 = manager.ui.mainCamera.transform.position - var_22_6.position

				var_22_6.forward = Vector3.New(var_22_13.x, var_22_13.y, var_22_13.z)

				local var_22_14 = var_22_6.localEulerAngles

				var_22_14.z = 0
				var_22_14.x = 0
				var_22_6.localEulerAngles = var_22_14
			end

			local var_22_15 = 0
			local var_22_16 = 1.025

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_17 = arg_19_1:GetWordFromCfg(106132005)
				local var_22_18 = arg_19_1:FormatText(var_22_17.content)

				arg_19_1.text_.text = var_22_18

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_19 = 41
				local var_22_20 = utf8.len(var_22_18)
				local var_22_21 = var_22_19 <= 0 and var_22_16 or var_22_16 * (var_22_20 / var_22_19)

				if var_22_21 > 0 and var_22_16 < var_22_21 then
					arg_19_1.talkMaxDuration = var_22_21

					if var_22_21 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_21 + var_22_15
					end
				end

				arg_19_1.text_.text = var_22_18
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_22 = math.max(var_22_16, arg_19_1.talkMaxDuration)

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_22 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_15) / var_22_22

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_15 + var_22_22 and arg_19_1.time_ < var_22_15 + var_22_22 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play106132006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 106132006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play106132007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0.4
			local var_26_1 = 1

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				local var_26_2 = "play"
				local var_26_3 = "effect"

				arg_23_1:AudioAction(var_26_2, var_26_3, "se_story_6", "se_story_6_tearing", "")
			end

			local var_26_4 = 0
			local var_26_5 = 0.7

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_6 = arg_23_1:GetWordFromCfg(106132006)
				local var_26_7 = arg_23_1:FormatText(var_26_6.content)

				arg_23_1.text_.text = var_26_7

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_8 = 28
				local var_26_9 = utf8.len(var_26_7)
				local var_26_10 = var_26_8 <= 0 and var_26_5 or var_26_5 * (var_26_9 / var_26_8)

				if var_26_10 > 0 and var_26_5 < var_26_10 then
					arg_23_1.talkMaxDuration = var_26_10

					if var_26_10 + var_26_4 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_10 + var_26_4
					end
				end

				arg_23_1.text_.text = var_26_7
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_11 = math.max(var_26_5, arg_23_1.talkMaxDuration)

			if var_26_4 <= arg_23_1.time_ and arg_23_1.time_ < var_26_4 + var_26_11 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_4) / var_26_11

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_4 + var_26_11 and arg_23_1.time_ < var_26_4 + var_26_11 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play106132007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 106132007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play106132008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.mask_.enabled = true
				arg_27_1.mask_.raycastTarget = true

				arg_27_1:SetGaussion(false)
			end

			local var_30_1 = 0.5

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_1 then
				local var_30_2 = (arg_27_1.time_ - var_30_0) / var_30_1
				local var_30_3 = Color.New(1, 1, 1)

				var_30_3.a = Mathf.Lerp(1, 0, var_30_2)
				arg_27_1.mask_.color = var_30_3
			end

			if arg_27_1.time_ >= var_30_0 + var_30_1 and arg_27_1.time_ < var_30_0 + var_30_1 + arg_30_0 then
				local var_30_4 = Color.New(1, 1, 1)
				local var_30_5 = 0

				arg_27_1.mask_.enabled = false
				var_30_4.a = var_30_5
				arg_27_1.mask_.color = var_30_4
			end

			local var_30_6 = 0
			local var_30_7 = 1

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				local var_30_8 = "play"
				local var_30_9 = "effect"

				arg_27_1:AudioAction(var_30_8, var_30_9, "se_story_6", "se_story_6_burning", "")
			end

			local var_30_10 = 0
			local var_30_11 = 1.15

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

				local var_30_12 = arg_27_1:GetWordFromCfg(106132007)
				local var_30_13 = arg_27_1:FormatText(var_30_12.content)

				arg_27_1.text_.text = var_30_13

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_14 = 46
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
	Play106132008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 106132008
		arg_31_1.duration_ = 5.166

		local var_31_0 = {
			ja = 2.266,
			ko = 3.1,
			zh = 5.166,
			en = 3.533
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
				arg_31_0:Play106132009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["3004_tpose"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect3004_tpose == nil then
				arg_31_1.var_.characterEffect3004_tpose = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect3004_tpose then
					arg_31_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect3004_tpose then
				arg_31_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["3004_tpose"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos3004_tpose = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0, -2.22, -3.1)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos3004_tpose, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_34_14 = 0
			local var_34_15 = 0.35

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_16 = arg_31_1:FormatText(StoryNameCfg[82].name)

				arg_31_1.leftNameTxt_.text = var_34_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_17 = arg_31_1:GetWordFromCfg(106132008)
				local var_34_18 = arg_31_1:FormatText(var_34_17.content)

				arg_31_1.text_.text = var_34_18

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_19 = 12
				local var_34_20 = utf8.len(var_34_18)
				local var_34_21 = var_34_19 <= 0 and var_34_15 or var_34_15 * (var_34_20 / var_34_19)

				if var_34_21 > 0 and var_34_15 < var_34_21 then
					arg_31_1.talkMaxDuration = var_34_21

					if var_34_21 + var_34_14 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_14
					end
				end

				arg_31_1.text_.text = var_34_18
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132008", "story_v_out_106132.awb") ~= 0 then
					local var_34_22 = manager.audio:GetVoiceLength("story_v_out_106132", "106132008", "story_v_out_106132.awb") / 1000

					if var_34_22 + var_34_14 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_22 + var_34_14
					end

					if var_34_17.prefab_name ~= "" and arg_31_1.actors_[var_34_17.prefab_name] ~= nil then
						local var_34_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_17.prefab_name].transform, "story_v_out_106132", "106132008", "story_v_out_106132.awb")

						arg_31_1:RecordAudio("106132008", var_34_23)
						arg_31_1:RecordAudio("106132008", var_34_23)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_106132", "106132008", "story_v_out_106132.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_106132", "106132008", "story_v_out_106132.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_24 = math.max(var_34_15, arg_31_1.talkMaxDuration)

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_24 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_14) / var_34_24

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_14 + var_34_24 and arg_31_1.time_ < var_34_14 + var_34_24 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play106132009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 106132009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play106132010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["3004_tpose"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect3004_tpose == nil then
				arg_35_1.var_.characterEffect3004_tpose = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect3004_tpose then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_35_1.var_.characterEffect3004_tpose.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect3004_tpose then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_35_1.var_.characterEffect3004_tpose.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["3004_tpose"].transform
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.var_.moveOldPos3004_tpose = var_38_6.localPosition
			end

			local var_38_8 = 0.001

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8
				local var_38_10 = Vector3.New(0, 100, 0)

				var_38_6.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos3004_tpose, var_38_10, var_38_9)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_6.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_6.localEulerAngles = var_38_12
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 then
				var_38_6.localPosition = Vector3.New(0, 100, 0)

				local var_38_13 = manager.ui.mainCamera.transform.position - var_38_6.position

				var_38_6.forward = Vector3.New(var_38_13.x, var_38_13.y, var_38_13.z)

				local var_38_14 = var_38_6.localEulerAngles

				var_38_14.z = 0
				var_38_14.x = 0
				var_38_6.localEulerAngles = var_38_14
			end

			local var_38_15 = 0
			local var_38_16 = 0.775

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_17 = arg_35_1:GetWordFromCfg(106132009)
				local var_38_18 = arg_35_1:FormatText(var_38_17.content)

				arg_35_1.text_.text = var_38_18

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_19 = 31
				local var_38_20 = utf8.len(var_38_18)
				local var_38_21 = var_38_19 <= 0 and var_38_16 or var_38_16 * (var_38_20 / var_38_19)

				if var_38_21 > 0 and var_38_16 < var_38_21 then
					arg_35_1.talkMaxDuration = var_38_21

					if var_38_21 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_21 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_18
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_22 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_22 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_22

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_22 and arg_35_1.time_ < var_38_15 + var_38_22 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play106132010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 106132010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play106132011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = manager.ui.mainCamera.transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.shakeOldPos = var_42_0.localPosition
			end

			local var_42_2 = 0.6

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / 0.099
				local var_42_4, var_42_5 = math.modf(var_42_3)

				var_42_0.localPosition = Vector3.New(var_42_5 * 0.13, var_42_5 * 0.13, var_42_5 * 0.13) + arg_39_1.var_.shakeOldPos
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = arg_39_1.var_.shakeOldPos
			end

			local var_42_6 = 0
			local var_42_7 = 1.3

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_8 = arg_39_1:GetWordFromCfg(106132010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 52
				local var_42_11 = utf8.len(var_42_9)
				local var_42_12 = var_42_10 <= 0 and var_42_7 or var_42_7 * (var_42_11 / var_42_10)

				if var_42_12 > 0 and var_42_7 < var_42_12 then
					arg_39_1.talkMaxDuration = var_42_12

					if var_42_12 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_9
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_13 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_13 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_13

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_13 and arg_39_1.time_ < var_42_6 + var_42_13 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play106132011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 106132011
		arg_43_1.duration_ = 3.133

		local var_43_0 = {
			ja = 3.133,
			ko = 1.999999999999,
			zh = 2.333,
			en = 2.766
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
				arg_43_0:Play106132012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["3004_tpose"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect3004_tpose == nil then
				arg_43_1.var_.characterEffect3004_tpose = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect3004_tpose then
					arg_43_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect3004_tpose then
				arg_43_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["3004_tpose"].transform
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				arg_43_1.var_.moveOldPos3004_tpose = var_46_4.localPosition
			end

			local var_46_6 = 0.001

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6
				local var_46_8 = Vector3.New(0, -2.22, -3.1)

				var_46_4.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos3004_tpose, var_46_8, var_46_7)

				local var_46_9 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_9.x, var_46_9.y, var_46_9.z)

				local var_46_10 = var_46_4.localEulerAngles

				var_46_10.z = 0
				var_46_10.x = 0
				var_46_4.localEulerAngles = var_46_10
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 then
				var_46_4.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_46_11 = manager.ui.mainCamera.transform.position - var_46_4.position

				var_46_4.forward = Vector3.New(var_46_11.x, var_46_11.y, var_46_11.z)

				local var_46_12 = var_46_4.localEulerAngles

				var_46_12.z = 0
				var_46_12.x = 0
				var_46_4.localEulerAngles = var_46_12
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_46_14 = manager.ui.mainCamera.transform
			local var_46_15 = 0

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.var_.shakeOldPos = var_46_14.localPosition
			end

			local var_46_16 = 0.6

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_16 then
				local var_46_17 = (arg_43_1.time_ - var_46_15) / 0.066
				local var_46_18, var_46_19 = math.modf(var_46_17)

				var_46_14.localPosition = Vector3.New(var_46_19 * 0.13, var_46_19 * 0.13, var_46_19 * 0.13) + arg_43_1.var_.shakeOldPos
			end

			if arg_43_1.time_ >= var_46_15 + var_46_16 and arg_43_1.time_ < var_46_15 + var_46_16 + arg_46_0 then
				var_46_14.localPosition = arg_43_1.var_.shakeOldPos
			end

			local var_46_20 = 0
			local var_46_21 = 0.125

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_22 = arg_43_1:FormatText(StoryNameCfg[82].name)

				arg_43_1.leftNameTxt_.text = var_46_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_23 = arg_43_1:GetWordFromCfg(106132011)
				local var_46_24 = arg_43_1:FormatText(var_46_23.content)

				arg_43_1.text_.text = var_46_24

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_25 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132011", "story_v_out_106132.awb") ~= 0 then
					local var_46_28 = manager.audio:GetVoiceLength("story_v_out_106132", "106132011", "story_v_out_106132.awb") / 1000

					if var_46_28 + var_46_20 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_28 + var_46_20
					end

					if var_46_23.prefab_name ~= "" and arg_43_1.actors_[var_46_23.prefab_name] ~= nil then
						local var_46_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_23.prefab_name].transform, "story_v_out_106132", "106132011", "story_v_out_106132.awb")

						arg_43_1:RecordAudio("106132011", var_46_29)
						arg_43_1:RecordAudio("106132011", var_46_29)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_106132", "106132011", "story_v_out_106132.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_106132", "106132011", "story_v_out_106132.awb")
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
	Play106132012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 106132012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play106132013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["3004_tpose"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect3004_tpose == nil then
				arg_47_1.var_.characterEffect3004_tpose = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect3004_tpose then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_47_1.var_.characterEffect3004_tpose.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect3004_tpose then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_47_1.var_.characterEffect3004_tpose.fillRatio = var_50_5
			end

			local var_50_6 = arg_47_1.actors_["3004_tpose"].transform
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 then
				arg_47_1.var_.moveOldPos3004_tpose = var_50_6.localPosition
			end

			local var_50_8 = 0.001

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8
				local var_50_10 = Vector3.New(0, 100, 0)

				var_50_6.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos3004_tpose, var_50_10, var_50_9)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_6.position

				var_50_6.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_6.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_6.localEulerAngles = var_50_12
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 then
				var_50_6.localPosition = Vector3.New(0, 100, 0)

				local var_50_13 = manager.ui.mainCamera.transform.position - var_50_6.position

				var_50_6.forward = Vector3.New(var_50_13.x, var_50_13.y, var_50_13.z)

				local var_50_14 = var_50_6.localEulerAngles

				var_50_14.z = 0
				var_50_14.x = 0
				var_50_6.localEulerAngles = var_50_14
			end

			local var_50_15 = 0
			local var_50_16 = 0.975

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_17 = arg_47_1:GetWordFromCfg(106132012)
				local var_50_18 = arg_47_1:FormatText(var_50_17.content)

				arg_47_1.text_.text = var_50_18

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_19 = 39
				local var_50_20 = utf8.len(var_50_18)
				local var_50_21 = var_50_19 <= 0 and var_50_16 or var_50_16 * (var_50_20 / var_50_19)

				if var_50_21 > 0 and var_50_16 < var_50_21 then
					arg_47_1.talkMaxDuration = var_50_21

					if var_50_21 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_21 + var_50_15
					end
				end

				arg_47_1.text_.text = var_50_18
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_22 = math.max(var_50_16, arg_47_1.talkMaxDuration)

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_22 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_15) / var_50_22

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_15 + var_50_22 and arg_47_1.time_ < var_50_15 + var_50_22 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play106132013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 106132013
		arg_51_1.duration_ = 4.333

		local var_51_0 = {
			ja = 2.766,
			ko = 4.333,
			zh = 3.1,
			en = 3.266
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
				arg_51_0:Play106132014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["3004_tpose"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect3004_tpose == nil then
				arg_51_1.var_.characterEffect3004_tpose = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect3004_tpose then
					arg_51_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect3004_tpose then
				arg_51_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["3004_tpose"].transform
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1.var_.moveOldPos3004_tpose = var_54_4.localPosition
			end

			local var_54_6 = 0.001

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6
				local var_54_8 = Vector3.New(0, -2.22, -3.1)

				var_54_4.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos3004_tpose, var_54_8, var_54_7)

				local var_54_9 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_9.x, var_54_9.y, var_54_9.z)

				local var_54_10 = var_54_4.localEulerAngles

				var_54_10.z = 0
				var_54_10.x = 0
				var_54_4.localEulerAngles = var_54_10
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 then
				var_54_4.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_54_11 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_11.x, var_54_11.y, var_54_11.z)

				local var_54_12 = var_54_4.localEulerAngles

				var_54_12.z = 0
				var_54_12.x = 0
				var_54_4.localEulerAngles = var_54_12
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_54_14 = 0
			local var_54_15 = 0.225

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_16 = arg_51_1:FormatText(StoryNameCfg[82].name)

				arg_51_1.leftNameTxt_.text = var_54_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_17 = arg_51_1:GetWordFromCfg(106132013)
				local var_54_18 = arg_51_1:FormatText(var_54_17.content)

				arg_51_1.text_.text = var_54_18

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_19 = 9
				local var_54_20 = utf8.len(var_54_18)
				local var_54_21 = var_54_19 <= 0 and var_54_15 or var_54_15 * (var_54_20 / var_54_19)

				if var_54_21 > 0 and var_54_15 < var_54_21 then
					arg_51_1.talkMaxDuration = var_54_21

					if var_54_21 + var_54_14 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_21 + var_54_14
					end
				end

				arg_51_1.text_.text = var_54_18
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132013", "story_v_out_106132.awb") ~= 0 then
					local var_54_22 = manager.audio:GetVoiceLength("story_v_out_106132", "106132013", "story_v_out_106132.awb") / 1000

					if var_54_22 + var_54_14 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_22 + var_54_14
					end

					if var_54_17.prefab_name ~= "" and arg_51_1.actors_[var_54_17.prefab_name] ~= nil then
						local var_54_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_17.prefab_name].transform, "story_v_out_106132", "106132013", "story_v_out_106132.awb")

						arg_51_1:RecordAudio("106132013", var_54_23)
						arg_51_1:RecordAudio("106132013", var_54_23)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_106132", "106132013", "story_v_out_106132.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_106132", "106132013", "story_v_out_106132.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_24 = math.max(var_54_15, arg_51_1.talkMaxDuration)

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_24 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_14) / var_54_24

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_14 + var_54_24 and arg_51_1.time_ < var_54_14 + var_54_24 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play106132014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 106132014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play106132015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["3004_tpose"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect3004_tpose == nil then
				arg_55_1.var_.characterEffect3004_tpose = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect3004_tpose then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_55_1.var_.characterEffect3004_tpose.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect3004_tpose then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_55_1.var_.characterEffect3004_tpose.fillRatio = var_58_5
			end

			local var_58_6 = arg_55_1.actors_["3004_tpose"].transform
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 then
				arg_55_1.var_.moveOldPos3004_tpose = var_58_6.localPosition
			end

			local var_58_8 = 0.001

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8
				local var_58_10 = Vector3.New(0, 100, 0)

				var_58_6.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos3004_tpose, var_58_10, var_58_9)

				local var_58_11 = manager.ui.mainCamera.transform.position - var_58_6.position

				var_58_6.forward = Vector3.New(var_58_11.x, var_58_11.y, var_58_11.z)

				local var_58_12 = var_58_6.localEulerAngles

				var_58_12.z = 0
				var_58_12.x = 0
				var_58_6.localEulerAngles = var_58_12
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 then
				var_58_6.localPosition = Vector3.New(0, 100, 0)

				local var_58_13 = manager.ui.mainCamera.transform.position - var_58_6.position

				var_58_6.forward = Vector3.New(var_58_13.x, var_58_13.y, var_58_13.z)

				local var_58_14 = var_58_6.localEulerAngles

				var_58_14.z = 0
				var_58_14.x = 0
				var_58_6.localEulerAngles = var_58_14
			end

			local var_58_15 = 0.366666666666667
			local var_58_16 = 0.367

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				local var_58_17 = "play"
				local var_58_18 = "effect"

				arg_55_1:AudioAction(var_58_17, var_58_18, "se_story_6", "se_story_6_snake02", "")
			end

			local var_58_19 = 0
			local var_58_20 = 1.025

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_21 = arg_55_1:GetWordFromCfg(106132014)
				local var_58_22 = arg_55_1:FormatText(var_58_21.content)

				arg_55_1.text_.text = var_58_22

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_23 = 41
				local var_58_24 = utf8.len(var_58_22)
				local var_58_25 = var_58_23 <= 0 and var_58_20 or var_58_20 * (var_58_24 / var_58_23)

				if var_58_25 > 0 and var_58_20 < var_58_25 then
					arg_55_1.talkMaxDuration = var_58_25

					if var_58_25 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_25 + var_58_19
					end
				end

				arg_55_1.text_.text = var_58_22
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_26 = math.max(var_58_20, arg_55_1.talkMaxDuration)

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_26 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_19) / var_58_26

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_19 + var_58_26 and arg_55_1.time_ < var_58_19 + var_58_26 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play106132015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 106132015
		arg_59_1.duration_ = 9.966

		local var_59_0 = {
			ja = 3.4,
			ko = 6.9,
			zh = 9.966,
			en = 5.733
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
				arg_59_0:Play106132016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.675

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_2 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_2:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_3 = arg_59_1:FormatText(StoryNameCfg[82].name)

				arg_59_1.leftNameTxt_.text = var_62_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3004")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_4 = arg_59_1:GetWordFromCfg(106132015)
				local var_62_5 = arg_59_1:FormatText(var_62_4.content)

				arg_59_1.text_.text = var_62_5

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_6 = 27
				local var_62_7 = utf8.len(var_62_5)
				local var_62_8 = var_62_6 <= 0 and var_62_1 or var_62_1 * (var_62_7 / var_62_6)

				if var_62_8 > 0 and var_62_1 < var_62_8 then
					arg_59_1.talkMaxDuration = var_62_8
					var_62_0 = var_62_0 + 0.3

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_5
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132015", "story_v_out_106132.awb") ~= 0 then
					local var_62_9 = manager.audio:GetVoiceLength("story_v_out_106132", "106132015", "story_v_out_106132.awb") / 1000

					if var_62_9 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_9 + var_62_0
					end

					if var_62_4.prefab_name ~= "" and arg_59_1.actors_[var_62_4.prefab_name] ~= nil then
						local var_62_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_4.prefab_name].transform, "story_v_out_106132", "106132015", "story_v_out_106132.awb")

						arg_59_1:RecordAudio("106132015", var_62_10)
						arg_59_1:RecordAudio("106132015", var_62_10)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_106132", "106132015", "story_v_out_106132.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_106132", "106132015", "story_v_out_106132.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_11 = var_62_0 + 0.3
			local var_62_12 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_12 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_11) / var_62_12

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_11 + var_62_12 and arg_59_1.time_ < var_62_11 + var_62_12 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play106132016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 106132016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play106132017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["3004_tpose"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect3004_tpose == nil then
				arg_65_1.var_.characterEffect3004_tpose = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.1

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect3004_tpose then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_65_1.var_.characterEffect3004_tpose.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect3004_tpose then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_65_1.var_.characterEffect3004_tpose.fillRatio = var_68_5
			end

			local var_68_6 = arg_65_1.actors_["3004_tpose"].transform
			local var_68_7 = 0

			if var_68_7 < arg_65_1.time_ and arg_65_1.time_ <= var_68_7 + arg_68_0 then
				arg_65_1.var_.moveOldPos3004_tpose = var_68_6.localPosition
			end

			local var_68_8 = 0.001

			if var_68_7 <= arg_65_1.time_ and arg_65_1.time_ < var_68_7 + var_68_8 then
				local var_68_9 = (arg_65_1.time_ - var_68_7) / var_68_8
				local var_68_10 = Vector3.New(0, 100, 0)

				var_68_6.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos3004_tpose, var_68_10, var_68_9)

				local var_68_11 = manager.ui.mainCamera.transform.position - var_68_6.position

				var_68_6.forward = Vector3.New(var_68_11.x, var_68_11.y, var_68_11.z)

				local var_68_12 = var_68_6.localEulerAngles

				var_68_12.z = 0
				var_68_12.x = 0
				var_68_6.localEulerAngles = var_68_12
			end

			if arg_65_1.time_ >= var_68_7 + var_68_8 and arg_65_1.time_ < var_68_7 + var_68_8 + arg_68_0 then
				var_68_6.localPosition = Vector3.New(0, 100, 0)

				local var_68_13 = manager.ui.mainCamera.transform.position - var_68_6.position

				var_68_6.forward = Vector3.New(var_68_13.x, var_68_13.y, var_68_13.z)

				local var_68_14 = var_68_6.localEulerAngles

				var_68_14.z = 0
				var_68_14.x = 0
				var_68_6.localEulerAngles = var_68_14
			end

			local var_68_15 = 0
			local var_68_16 = 1

			if var_68_15 < arg_65_1.time_ and arg_65_1.time_ <= var_68_15 + arg_68_0 then
				local var_68_17 = "play"
				local var_68_18 = "effect"

				arg_65_1:AudioAction(var_68_17, var_68_18, "se_story_6", "se_story_6_black_fog", "")
			end

			local var_68_19 = 0
			local var_68_20 = 1.1

			if var_68_19 < arg_65_1.time_ and arg_65_1.time_ <= var_68_19 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_21 = arg_65_1:GetWordFromCfg(106132016)
				local var_68_22 = arg_65_1:FormatText(var_68_21.content)

				arg_65_1.text_.text = var_68_22

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_23 = 44
				local var_68_24 = utf8.len(var_68_22)
				local var_68_25 = var_68_23 <= 0 and var_68_20 or var_68_20 * (var_68_24 / var_68_23)

				if var_68_25 > 0 and var_68_20 < var_68_25 then
					arg_65_1.talkMaxDuration = var_68_25

					if var_68_25 + var_68_19 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_25 + var_68_19
					end
				end

				arg_65_1.text_.text = var_68_22
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_26 = math.max(var_68_20, arg_65_1.talkMaxDuration)

			if var_68_19 <= arg_65_1.time_ and arg_65_1.time_ < var_68_19 + var_68_26 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_19) / var_68_26

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_19 + var_68_26 and arg_65_1.time_ < var_68_19 + var_68_26 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play106132017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 106132017
		arg_69_1.duration_ = 1.999999999999

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play106132018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "1099ui_story"

			if arg_69_1.actors_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(Asset.Load("Char/" .. var_72_0), arg_69_1.stage_.transform)

				var_72_1.name = var_72_0
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.actors_[var_72_0] = var_72_1

				local var_72_2 = var_72_1:GetComponentInChildren(typeof(CharacterEffect))

				var_72_2.enabled = true

				local var_72_3 = GameObjectTools.GetOrAddComponent(var_72_1, typeof(DynamicBoneHelper))

				if var_72_3 then
					var_72_3:EnableDynamicBone(false)
				end

				arg_69_1:ShowWeapon(var_72_2.transform, false)

				arg_69_1.var_[var_72_0 .. "Animator"] = var_72_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_69_1.var_[var_72_0 .. "Animator"].applyRootMotion = true
				arg_69_1.var_[var_72_0 .. "LipSync"] = var_72_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_72_4 = arg_69_1.actors_["1099ui_story"]
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and arg_69_1.var_.characterEffect1099ui_story == nil then
				arg_69_1.var_.characterEffect1099ui_story = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.1

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect1099ui_story then
					arg_69_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and arg_69_1.var_.characterEffect1099ui_story then
				arg_69_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_72_8 = arg_69_1.actors_["1099ui_story"].transform
			local var_72_9 = 0

			if var_72_9 < arg_69_1.time_ and arg_69_1.time_ <= var_72_9 + arg_72_0 then
				arg_69_1.var_.moveOldPos1099ui_story = var_72_8.localPosition
			end

			local var_72_10 = 0.001

			if var_72_9 <= arg_69_1.time_ and arg_69_1.time_ < var_72_9 + var_72_10 then
				local var_72_11 = (arg_69_1.time_ - var_72_9) / var_72_10
				local var_72_12 = Vector3.New(0, -1.08, -5.9)

				var_72_8.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1099ui_story, var_72_12, var_72_11)

				local var_72_13 = manager.ui.mainCamera.transform.position - var_72_8.position

				var_72_8.forward = Vector3.New(var_72_13.x, var_72_13.y, var_72_13.z)

				local var_72_14 = var_72_8.localEulerAngles

				var_72_14.z = 0
				var_72_14.x = 0
				var_72_8.localEulerAngles = var_72_14
			end

			if arg_69_1.time_ >= var_72_9 + var_72_10 and arg_69_1.time_ < var_72_9 + var_72_10 + arg_72_0 then
				var_72_8.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_72_15 = manager.ui.mainCamera.transform.position - var_72_8.position

				var_72_8.forward = Vector3.New(var_72_15.x, var_72_15.y, var_72_15.z)

				local var_72_16 = var_72_8.localEulerAngles

				var_72_16.z = 0
				var_72_16.x = 0
				var_72_8.localEulerAngles = var_72_16
			end

			local var_72_17 = 0

			if var_72_17 < arg_69_1.time_ and arg_69_1.time_ <= var_72_17 + arg_72_0 then
				arg_69_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_72_18 = 0

			if var_72_18 < arg_69_1.time_ and arg_69_1.time_ <= var_72_18 + arg_72_0 then
				arg_69_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_72_19 = 0
			local var_72_20 = 0.125

			if var_72_19 < arg_69_1.time_ and arg_69_1.time_ <= var_72_19 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_21 = arg_69_1:FormatText(StoryNameCfg[84].name)

				arg_69_1.leftNameTxt_.text = var_72_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_22 = arg_69_1:GetWordFromCfg(106132017)
				local var_72_23 = arg_69_1:FormatText(var_72_22.content)

				arg_69_1.text_.text = var_72_23

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_24 = 5
				local var_72_25 = utf8.len(var_72_23)
				local var_72_26 = var_72_24 <= 0 and var_72_20 or var_72_20 * (var_72_25 / var_72_24)

				if var_72_26 > 0 and var_72_20 < var_72_26 then
					arg_69_1.talkMaxDuration = var_72_26

					if var_72_26 + var_72_19 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_26 + var_72_19
					end
				end

				arg_69_1.text_.text = var_72_23
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132017", "story_v_out_106132.awb") ~= 0 then
					local var_72_27 = manager.audio:GetVoiceLength("story_v_out_106132", "106132017", "story_v_out_106132.awb") / 1000

					if var_72_27 + var_72_19 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_27 + var_72_19
					end

					if var_72_22.prefab_name ~= "" and arg_69_1.actors_[var_72_22.prefab_name] ~= nil then
						local var_72_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_22.prefab_name].transform, "story_v_out_106132", "106132017", "story_v_out_106132.awb")

						arg_69_1:RecordAudio("106132017", var_72_28)
						arg_69_1:RecordAudio("106132017", var_72_28)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_106132", "106132017", "story_v_out_106132.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_106132", "106132017", "story_v_out_106132.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_29 = math.max(var_72_20, arg_69_1.talkMaxDuration)

			if var_72_19 <= arg_69_1.time_ and arg_69_1.time_ < var_72_19 + var_72_29 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_19) / var_72_29

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_19 + var_72_29 and arg_69_1.time_ < var_72_19 + var_72_29 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play106132018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 106132018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play106132019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1099ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1099ui_story == nil then
				arg_73_1.var_.characterEffect1099ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1099ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1099ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1099ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1099ui_story.fillRatio = var_76_5
			end

			local var_76_6 = arg_73_1.actors_["1099ui_story"].transform
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 then
				arg_73_1.var_.moveOldPos1099ui_story = var_76_6.localPosition
			end

			local var_76_8 = 0.001

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_7) / var_76_8
				local var_76_10 = Vector3.New(0, 100, 0)

				var_76_6.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1099ui_story, var_76_10, var_76_9)

				local var_76_11 = manager.ui.mainCamera.transform.position - var_76_6.position

				var_76_6.forward = Vector3.New(var_76_11.x, var_76_11.y, var_76_11.z)

				local var_76_12 = var_76_6.localEulerAngles

				var_76_12.z = 0
				var_76_12.x = 0
				var_76_6.localEulerAngles = var_76_12
			end

			if arg_73_1.time_ >= var_76_7 + var_76_8 and arg_73_1.time_ < var_76_7 + var_76_8 + arg_76_0 then
				var_76_6.localPosition = Vector3.New(0, 100, 0)

				local var_76_13 = manager.ui.mainCamera.transform.position - var_76_6.position

				var_76_6.forward = Vector3.New(var_76_13.x, var_76_13.y, var_76_13.z)

				local var_76_14 = var_76_6.localEulerAngles

				var_76_14.z = 0
				var_76_14.x = 0
				var_76_6.localEulerAngles = var_76_14
			end

			local var_76_15 = 0
			local var_76_16 = 0.525

			if var_76_15 < arg_73_1.time_ and arg_73_1.time_ <= var_76_15 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_17 = arg_73_1:GetWordFromCfg(106132018)
				local var_76_18 = arg_73_1:FormatText(var_76_17.content)

				arg_73_1.text_.text = var_76_18

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_19 = 21
				local var_76_20 = utf8.len(var_76_18)
				local var_76_21 = var_76_19 <= 0 and var_76_16 or var_76_16 * (var_76_20 / var_76_19)

				if var_76_21 > 0 and var_76_16 < var_76_21 then
					arg_73_1.talkMaxDuration = var_76_21

					if var_76_21 + var_76_15 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_21 + var_76_15
					end
				end

				arg_73_1.text_.text = var_76_18
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_22 = math.max(var_76_16, arg_73_1.talkMaxDuration)

			if var_76_15 <= arg_73_1.time_ and arg_73_1.time_ < var_76_15 + var_76_22 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_15) / var_76_22

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_15 + var_76_22 and arg_73_1.time_ < var_76_15 + var_76_22 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play106132019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 106132019
		arg_77_1.duration_ = 4

		local var_77_0 = {
			ja = 1.999999999999,
			ko = 2.233,
			zh = 2.8,
			en = 4
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
				arg_77_0:Play106132020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1099ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1099ui_story == nil then
				arg_77_1.var_.characterEffect1099ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.1

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1099ui_story then
					arg_77_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1099ui_story then
				arg_77_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_80_4 = arg_77_1.actors_["1099ui_story"].transform
			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1.var_.moveOldPos1099ui_story = var_80_4.localPosition
			end

			local var_80_6 = 0.001

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_6 then
				local var_80_7 = (arg_77_1.time_ - var_80_5) / var_80_6
				local var_80_8 = Vector3.New(0, -1.08, -5.9)

				var_80_4.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1099ui_story, var_80_8, var_80_7)

				local var_80_9 = manager.ui.mainCamera.transform.position - var_80_4.position

				var_80_4.forward = Vector3.New(var_80_9.x, var_80_9.y, var_80_9.z)

				local var_80_10 = var_80_4.localEulerAngles

				var_80_10.z = 0
				var_80_10.x = 0
				var_80_4.localEulerAngles = var_80_10
			end

			if arg_77_1.time_ >= var_80_5 + var_80_6 and arg_77_1.time_ < var_80_5 + var_80_6 + arg_80_0 then
				var_80_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_80_11 = manager.ui.mainCamera.transform.position - var_80_4.position

				var_80_4.forward = Vector3.New(var_80_11.x, var_80_11.y, var_80_11.z)

				local var_80_12 = var_80_4.localEulerAngles

				var_80_12.z = 0
				var_80_12.x = 0
				var_80_4.localEulerAngles = var_80_12
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_1")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_80_15 = 0
			local var_80_16 = 0.3

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_17 = arg_77_1:FormatText(StoryNameCfg[84].name)

				arg_77_1.leftNameTxt_.text = var_80_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_18 = arg_77_1:GetWordFromCfg(106132019)
				local var_80_19 = arg_77_1:FormatText(var_80_18.content)

				arg_77_1.text_.text = var_80_19

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_20 = 12
				local var_80_21 = utf8.len(var_80_19)
				local var_80_22 = var_80_20 <= 0 and var_80_16 or var_80_16 * (var_80_21 / var_80_20)

				if var_80_22 > 0 and var_80_16 < var_80_22 then
					arg_77_1.talkMaxDuration = var_80_22

					if var_80_22 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_22 + var_80_15
					end
				end

				arg_77_1.text_.text = var_80_19
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132019", "story_v_out_106132.awb") ~= 0 then
					local var_80_23 = manager.audio:GetVoiceLength("story_v_out_106132", "106132019", "story_v_out_106132.awb") / 1000

					if var_80_23 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_23 + var_80_15
					end

					if var_80_18.prefab_name ~= "" and arg_77_1.actors_[var_80_18.prefab_name] ~= nil then
						local var_80_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_18.prefab_name].transform, "story_v_out_106132", "106132019", "story_v_out_106132.awb")

						arg_77_1:RecordAudio("106132019", var_80_24)
						arg_77_1:RecordAudio("106132019", var_80_24)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_106132", "106132019", "story_v_out_106132.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_106132", "106132019", "story_v_out_106132.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_25 = math.max(var_80_16, arg_77_1.talkMaxDuration)

			if var_80_15 <= arg_77_1.time_ and arg_77_1.time_ < var_80_15 + var_80_25 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_15) / var_80_25

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_15 + var_80_25 and arg_77_1.time_ < var_80_15 + var_80_25 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play106132020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 106132020
		arg_81_1.duration_ = 9.6

		local var_81_0 = {
			ja = 6.666,
			ko = 6.066,
			zh = 8.666,
			en = 9.6
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
				arg_81_0:Play106132021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = "1093ui_story"

			if arg_81_1.actors_[var_84_0] == nil then
				local var_84_1 = Object.Instantiate(Asset.Load("Char/" .. var_84_0), arg_81_1.stage_.transform)

				var_84_1.name = var_84_0
				var_84_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_81_1.actors_[var_84_0] = var_84_1

				local var_84_2 = var_84_1:GetComponentInChildren(typeof(CharacterEffect))

				var_84_2.enabled = true

				local var_84_3 = GameObjectTools.GetOrAddComponent(var_84_1, typeof(DynamicBoneHelper))

				if var_84_3 then
					var_84_3:EnableDynamicBone(false)
				end

				arg_81_1:ShowWeapon(var_84_2.transform, false)

				arg_81_1.var_[var_84_0 .. "Animator"] = var_84_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_81_1.var_[var_84_0 .. "Animator"].applyRootMotion = true
				arg_81_1.var_[var_84_0 .. "LipSync"] = var_84_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_84_4 = arg_81_1.actors_["1093ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1093ui_story == nil then
				arg_81_1.var_.characterEffect1093ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.1

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1093ui_story then
					arg_81_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1093ui_story then
				arg_81_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_84_8 = arg_81_1.actors_["1099ui_story"]
			local var_84_9 = 0

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 and arg_81_1.var_.characterEffect1099ui_story == nil then
				arg_81_1.var_.characterEffect1099ui_story = var_84_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_10 = 0.1

			if var_84_9 <= arg_81_1.time_ and arg_81_1.time_ < var_84_9 + var_84_10 then
				local var_84_11 = (arg_81_1.time_ - var_84_9) / var_84_10

				if arg_81_1.var_.characterEffect1099ui_story then
					local var_84_12 = Mathf.Lerp(0, 0.5, var_84_11)

					arg_81_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1099ui_story.fillRatio = var_84_12
				end
			end

			if arg_81_1.time_ >= var_84_9 + var_84_10 and arg_81_1.time_ < var_84_9 + var_84_10 + arg_84_0 and arg_81_1.var_.characterEffect1099ui_story then
				local var_84_13 = 0.5

				arg_81_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1099ui_story.fillRatio = var_84_13
			end

			local var_84_14 = arg_81_1.actors_["1099ui_story"].transform
			local var_84_15 = 0.033

			if var_84_15 < arg_81_1.time_ and arg_81_1.time_ <= var_84_15 + arg_84_0 then
				arg_81_1.var_.moveOldPos1099ui_story = var_84_14.localPosition
			end

			local var_84_16 = 0.5

			if var_84_15 <= arg_81_1.time_ and arg_81_1.time_ < var_84_15 + var_84_16 then
				local var_84_17 = (arg_81_1.time_ - var_84_15) / var_84_16
				local var_84_18 = Vector3.New(0.7, -1.08, -5.9)

				var_84_14.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1099ui_story, var_84_18, var_84_17)

				local var_84_19 = manager.ui.mainCamera.transform.position - var_84_14.position

				var_84_14.forward = Vector3.New(var_84_19.x, var_84_19.y, var_84_19.z)

				local var_84_20 = var_84_14.localEulerAngles

				var_84_20.z = 0
				var_84_20.x = 0
				var_84_14.localEulerAngles = var_84_20
			end

			if arg_81_1.time_ >= var_84_15 + var_84_16 and arg_81_1.time_ < var_84_15 + var_84_16 + arg_84_0 then
				var_84_14.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_84_21 = manager.ui.mainCamera.transform.position - var_84_14.position

				var_84_14.forward = Vector3.New(var_84_21.x, var_84_21.y, var_84_21.z)

				local var_84_22 = var_84_14.localEulerAngles

				var_84_22.z = 0
				var_84_22.x = 0
				var_84_14.localEulerAngles = var_84_22
			end

			local var_84_23 = arg_81_1.actors_["1099ui_story"].transform
			local var_84_24 = 0

			if var_84_24 < arg_81_1.time_ and arg_81_1.time_ <= var_84_24 + arg_84_0 then
				arg_81_1.var_.moveOldPos1099ui_story = var_84_23.localPosition
			end

			local var_84_25 = 0.001

			if var_84_24 <= arg_81_1.time_ and arg_81_1.time_ < var_84_24 + var_84_25 then
				local var_84_26 = (arg_81_1.time_ - var_84_24) / var_84_25
				local var_84_27 = Vector3.New(0, -1.08, -5.9)

				var_84_23.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1099ui_story, var_84_27, var_84_26)

				local var_84_28 = manager.ui.mainCamera.transform.position - var_84_23.position

				var_84_23.forward = Vector3.New(var_84_28.x, var_84_28.y, var_84_28.z)

				local var_84_29 = var_84_23.localEulerAngles

				var_84_29.z = 0
				var_84_29.x = 0
				var_84_23.localEulerAngles = var_84_29
			end

			if arg_81_1.time_ >= var_84_24 + var_84_25 and arg_81_1.time_ < var_84_24 + var_84_25 + arg_84_0 then
				var_84_23.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_84_30 = manager.ui.mainCamera.transform.position - var_84_23.position

				var_84_23.forward = Vector3.New(var_84_30.x, var_84_30.y, var_84_30.z)

				local var_84_31 = var_84_23.localEulerAngles

				var_84_31.z = 0
				var_84_31.x = 0
				var_84_23.localEulerAngles = var_84_31
			end

			local var_84_32 = arg_81_1.actors_["1093ui_story"].transform
			local var_84_33 = 0

			if var_84_33 < arg_81_1.time_ and arg_81_1.time_ <= var_84_33 + arg_84_0 then
				arg_81_1.var_.moveOldPos1093ui_story = var_84_32.localPosition

				local var_84_34 = "1093ui_story"

				arg_81_1:ShowWeapon(arg_81_1.var_[var_84_34 .. "Animator"].transform, true)
			end

			local var_84_35 = 0.001

			if var_84_33 <= arg_81_1.time_ and arg_81_1.time_ < var_84_33 + var_84_35 then
				local var_84_36 = (arg_81_1.time_ - var_84_33) / var_84_35
				local var_84_37 = Vector3.New(-0.7, -1.11, -5.88)

				var_84_32.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1093ui_story, var_84_37, var_84_36)

				local var_84_38 = manager.ui.mainCamera.transform.position - var_84_32.position

				var_84_32.forward = Vector3.New(var_84_38.x, var_84_38.y, var_84_38.z)

				local var_84_39 = var_84_32.localEulerAngles

				var_84_39.z = 0
				var_84_39.x = 0
				var_84_32.localEulerAngles = var_84_39
			end

			if arg_81_1.time_ >= var_84_33 + var_84_35 and arg_81_1.time_ < var_84_33 + var_84_35 + arg_84_0 then
				var_84_32.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_84_40 = manager.ui.mainCamera.transform.position - var_84_32.position

				var_84_32.forward = Vector3.New(var_84_40.x, var_84_40.y, var_84_40.z)

				local var_84_41 = var_84_32.localEulerAngles

				var_84_41.z = 0
				var_84_41.x = 0
				var_84_32.localEulerAngles = var_84_41
			end

			local var_84_42 = 0

			if var_84_42 < arg_81_1.time_ and arg_81_1.time_ <= var_84_42 + arg_84_0 then
				arg_81_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action10_2")
			end

			local var_84_43 = 0

			if var_84_43 < arg_81_1.time_ and arg_81_1.time_ <= var_84_43 + arg_84_0 then
				arg_81_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_84_44 = 0
			local var_84_45 = 0.8

			if var_84_44 < arg_81_1.time_ and arg_81_1.time_ <= var_84_44 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_46 = arg_81_1:FormatText(StoryNameCfg[73].name)

				arg_81_1.leftNameTxt_.text = var_84_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_47 = arg_81_1:GetWordFromCfg(106132020)
				local var_84_48 = arg_81_1:FormatText(var_84_47.content)

				arg_81_1.text_.text = var_84_48

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_49 = 32
				local var_84_50 = utf8.len(var_84_48)
				local var_84_51 = var_84_49 <= 0 and var_84_45 or var_84_45 * (var_84_50 / var_84_49)

				if var_84_51 > 0 and var_84_45 < var_84_51 then
					arg_81_1.talkMaxDuration = var_84_51

					if var_84_51 + var_84_44 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_51 + var_84_44
					end
				end

				arg_81_1.text_.text = var_84_48
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132020", "story_v_out_106132.awb") ~= 0 then
					local var_84_52 = manager.audio:GetVoiceLength("story_v_out_106132", "106132020", "story_v_out_106132.awb") / 1000

					if var_84_52 + var_84_44 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_52 + var_84_44
					end

					if var_84_47.prefab_name ~= "" and arg_81_1.actors_[var_84_47.prefab_name] ~= nil then
						local var_84_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_47.prefab_name].transform, "story_v_out_106132", "106132020", "story_v_out_106132.awb")

						arg_81_1:RecordAudio("106132020", var_84_53)
						arg_81_1:RecordAudio("106132020", var_84_53)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_106132", "106132020", "story_v_out_106132.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_106132", "106132020", "story_v_out_106132.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_54 = math.max(var_84_45, arg_81_1.talkMaxDuration)

			if var_84_44 <= arg_81_1.time_ and arg_81_1.time_ < var_84_44 + var_84_54 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_44) / var_84_54

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_44 + var_84_54 and arg_81_1.time_ < var_84_44 + var_84_54 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play106132021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 106132021
		arg_85_1.duration_ = 5.333

		local var_85_0 = {
			ja = 3.033,
			ko = 2.766,
			zh = 3,
			en = 5.333
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
				arg_85_0:Play106132022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1099ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1099ui_story == nil then
				arg_85_1.var_.characterEffect1099ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.1

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1099ui_story then
					arg_85_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1099ui_story then
				arg_85_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_88_4 = arg_85_1.actors_["1093ui_story"]
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 and arg_85_1.var_.characterEffect1093ui_story == nil then
				arg_85_1.var_.characterEffect1093ui_story = var_88_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_6 = 0.1

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6

				if arg_85_1.var_.characterEffect1093ui_story then
					local var_88_8 = Mathf.Lerp(0, 0.5, var_88_7)

					arg_85_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1093ui_story.fillRatio = var_88_8
				end
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 and arg_85_1.var_.characterEffect1093ui_story then
				local var_88_9 = 0.5

				arg_85_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1093ui_story.fillRatio = var_88_9
			end

			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 then
				arg_85_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action456")
			end

			local var_88_11 = 0

			if var_88_11 < arg_85_1.time_ and arg_85_1.time_ <= var_88_11 + arg_88_0 then
				arg_85_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_88_12 = 0
			local var_88_13 = 0.4

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_14 = arg_85_1:FormatText(StoryNameCfg[84].name)

				arg_85_1.leftNameTxt_.text = var_88_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_15 = arg_85_1:GetWordFromCfg(106132021)
				local var_88_16 = arg_85_1:FormatText(var_88_15.content)

				arg_85_1.text_.text = var_88_16

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_17 = 16
				local var_88_18 = utf8.len(var_88_16)
				local var_88_19 = var_88_17 <= 0 and var_88_13 or var_88_13 * (var_88_18 / var_88_17)

				if var_88_19 > 0 and var_88_13 < var_88_19 then
					arg_85_1.talkMaxDuration = var_88_19

					if var_88_19 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_19 + var_88_12
					end
				end

				arg_85_1.text_.text = var_88_16
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132021", "story_v_out_106132.awb") ~= 0 then
					local var_88_20 = manager.audio:GetVoiceLength("story_v_out_106132", "106132021", "story_v_out_106132.awb") / 1000

					if var_88_20 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_20 + var_88_12
					end

					if var_88_15.prefab_name ~= "" and arg_85_1.actors_[var_88_15.prefab_name] ~= nil then
						local var_88_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_15.prefab_name].transform, "story_v_out_106132", "106132021", "story_v_out_106132.awb")

						arg_85_1:RecordAudio("106132021", var_88_21)
						arg_85_1:RecordAudio("106132021", var_88_21)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_106132", "106132021", "story_v_out_106132.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_106132", "106132021", "story_v_out_106132.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_22 = math.max(var_88_13, arg_85_1.talkMaxDuration)

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_22 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_12) / var_88_22

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_12 + var_88_22 and arg_85_1.time_ < var_88_12 + var_88_22 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play106132022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 106132022
		arg_89_1.duration_ = 8.133

		local var_89_0 = {
			ja = 8.066,
			ko = 5.433,
			zh = 8.133,
			en = 6.666
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
				arg_89_0:Play106132023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1093ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1093ui_story == nil then
				arg_89_1.var_.characterEffect1093ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.1

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1093ui_story then
					arg_89_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1093ui_story then
				arg_89_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_92_4 = arg_89_1.actors_["1099ui_story"]
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 and arg_89_1.var_.characterEffect1099ui_story == nil then
				arg_89_1.var_.characterEffect1099ui_story = var_92_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_6 = 0.1

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6

				if arg_89_1.var_.characterEffect1099ui_story then
					local var_92_8 = Mathf.Lerp(0, 0.5, var_92_7)

					arg_89_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1099ui_story.fillRatio = var_92_8
				end
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 and arg_89_1.var_.characterEffect1099ui_story then
				local var_92_9 = 0.5

				arg_89_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1099ui_story.fillRatio = var_92_9
			end

			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_92_11 = 0
			local var_92_12 = 0.55

			if var_92_11 < arg_89_1.time_ and arg_89_1.time_ <= var_92_11 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_13 = arg_89_1:FormatText(StoryNameCfg[73].name)

				arg_89_1.leftNameTxt_.text = var_92_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_14 = arg_89_1:GetWordFromCfg(106132022)
				local var_92_15 = arg_89_1:FormatText(var_92_14.content)

				arg_89_1.text_.text = var_92_15

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_16 = 22
				local var_92_17 = utf8.len(var_92_15)
				local var_92_18 = var_92_16 <= 0 and var_92_12 or var_92_12 * (var_92_17 / var_92_16)

				if var_92_18 > 0 and var_92_12 < var_92_18 then
					arg_89_1.talkMaxDuration = var_92_18

					if var_92_18 + var_92_11 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_18 + var_92_11
					end
				end

				arg_89_1.text_.text = var_92_15
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132022", "story_v_out_106132.awb") ~= 0 then
					local var_92_19 = manager.audio:GetVoiceLength("story_v_out_106132", "106132022", "story_v_out_106132.awb") / 1000

					if var_92_19 + var_92_11 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_19 + var_92_11
					end

					if var_92_14.prefab_name ~= "" and arg_89_1.actors_[var_92_14.prefab_name] ~= nil then
						local var_92_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_14.prefab_name].transform, "story_v_out_106132", "106132022", "story_v_out_106132.awb")

						arg_89_1:RecordAudio("106132022", var_92_20)
						arg_89_1:RecordAudio("106132022", var_92_20)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_106132", "106132022", "story_v_out_106132.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_106132", "106132022", "story_v_out_106132.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_21 = math.max(var_92_12, arg_89_1.talkMaxDuration)

			if var_92_11 <= arg_89_1.time_ and arg_89_1.time_ < var_92_11 + var_92_21 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_11) / var_92_21

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_11 + var_92_21 and arg_89_1.time_ < var_92_11 + var_92_21 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play106132023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 106132023
		arg_93_1.duration_ = 1.999999999999

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play106132024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1099ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1099ui_story == nil then
				arg_93_1.var_.characterEffect1099ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.1

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1099ui_story then
					arg_93_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1099ui_story then
				arg_93_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_96_4 = arg_93_1.actors_["1093ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect1093ui_story == nil then
				arg_93_1.var_.characterEffect1093ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect1093ui_story then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1093ui_story.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect1093ui_story then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1093ui_story.fillRatio = var_96_9
			end

			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 then
				arg_93_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_2")
			end

			local var_96_11 = 0

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_96_12 = 0
			local var_96_13 = 0.15

			if var_96_12 < arg_93_1.time_ and arg_93_1.time_ <= var_96_12 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_14 = arg_93_1:FormatText(StoryNameCfg[84].name)

				arg_93_1.leftNameTxt_.text = var_96_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_15 = arg_93_1:GetWordFromCfg(106132023)
				local var_96_16 = arg_93_1:FormatText(var_96_15.content)

				arg_93_1.text_.text = var_96_16

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_17 = 6
				local var_96_18 = utf8.len(var_96_16)
				local var_96_19 = var_96_17 <= 0 and var_96_13 or var_96_13 * (var_96_18 / var_96_17)

				if var_96_19 > 0 and var_96_13 < var_96_19 then
					arg_93_1.talkMaxDuration = var_96_19

					if var_96_19 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_19 + var_96_12
					end
				end

				arg_93_1.text_.text = var_96_16
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132023", "story_v_out_106132.awb") ~= 0 then
					local var_96_20 = manager.audio:GetVoiceLength("story_v_out_106132", "106132023", "story_v_out_106132.awb") / 1000

					if var_96_20 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_20 + var_96_12
					end

					if var_96_15.prefab_name ~= "" and arg_93_1.actors_[var_96_15.prefab_name] ~= nil then
						local var_96_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_15.prefab_name].transform, "story_v_out_106132", "106132023", "story_v_out_106132.awb")

						arg_93_1:RecordAudio("106132023", var_96_21)
						arg_93_1:RecordAudio("106132023", var_96_21)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_106132", "106132023", "story_v_out_106132.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_106132", "106132023", "story_v_out_106132.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_22 = math.max(var_96_13, arg_93_1.talkMaxDuration)

			if var_96_12 <= arg_93_1.time_ and arg_93_1.time_ < var_96_12 + var_96_22 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_12) / var_96_22

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_12 + var_96_22 and arg_93_1.time_ < var_96_12 + var_96_22 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play106132024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 106132024
		arg_97_1.duration_ = 9.833

		local var_97_0 = {
			ja = 9.833,
			ko = 6.6,
			zh = 8.733,
			en = 6.033
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
				arg_97_0:Play106132025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1093ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1093ui_story == nil then
				arg_97_1.var_.characterEffect1093ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1093ui_story then
					arg_97_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1093ui_story then
				arg_97_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["1099ui_story"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect1099ui_story == nil then
				arg_97_1.var_.characterEffect1099ui_story = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.1

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect1099ui_story then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1099ui_story.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect1099ui_story then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1099ui_story.fillRatio = var_100_9
			end

			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_100_11 = 0
			local var_100_12 = 0.8

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_13 = arg_97_1:FormatText(StoryNameCfg[73].name)

				arg_97_1.leftNameTxt_.text = var_100_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_14 = arg_97_1:GetWordFromCfg(106132024)
				local var_100_15 = arg_97_1:FormatText(var_100_14.content)

				arg_97_1.text_.text = var_100_15

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_16 = 33
				local var_100_17 = utf8.len(var_100_15)
				local var_100_18 = var_100_16 <= 0 and var_100_12 or var_100_12 * (var_100_17 / var_100_16)

				if var_100_18 > 0 and var_100_12 < var_100_18 then
					arg_97_1.talkMaxDuration = var_100_18

					if var_100_18 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_11
					end
				end

				arg_97_1.text_.text = var_100_15
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132024", "story_v_out_106132.awb") ~= 0 then
					local var_100_19 = manager.audio:GetVoiceLength("story_v_out_106132", "106132024", "story_v_out_106132.awb") / 1000

					if var_100_19 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_19 + var_100_11
					end

					if var_100_14.prefab_name ~= "" and arg_97_1.actors_[var_100_14.prefab_name] ~= nil then
						local var_100_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_14.prefab_name].transform, "story_v_out_106132", "106132024", "story_v_out_106132.awb")

						arg_97_1:RecordAudio("106132024", var_100_20)
						arg_97_1:RecordAudio("106132024", var_100_20)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_106132", "106132024", "story_v_out_106132.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_106132", "106132024", "story_v_out_106132.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_21 = math.max(var_100_12, arg_97_1.talkMaxDuration)

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_21 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_11) / var_100_21

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_11 + var_100_21 and arg_97_1.time_ < var_100_11 + var_100_21 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play106132025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 106132025
		arg_101_1.duration_ = 12.133

		local var_101_0 = {
			ja = 12.133,
			ko = 8.366,
			zh = 7.066,
			en = 7.7
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
				arg_101_0:Play106132026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_104_1 = 0
			local var_104_2 = 0.725

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_3 = arg_101_1:FormatText(StoryNameCfg[73].name)

				arg_101_1.leftNameTxt_.text = var_104_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_4 = arg_101_1:GetWordFromCfg(106132025)
				local var_104_5 = arg_101_1:FormatText(var_104_4.content)

				arg_101_1.text_.text = var_104_5

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_6 = 29
				local var_104_7 = utf8.len(var_104_5)
				local var_104_8 = var_104_6 <= 0 and var_104_2 or var_104_2 * (var_104_7 / var_104_6)

				if var_104_8 > 0 and var_104_2 < var_104_8 then
					arg_101_1.talkMaxDuration = var_104_8

					if var_104_8 + var_104_1 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_1
					end
				end

				arg_101_1.text_.text = var_104_5
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132025", "story_v_out_106132.awb") ~= 0 then
					local var_104_9 = manager.audio:GetVoiceLength("story_v_out_106132", "106132025", "story_v_out_106132.awb") / 1000

					if var_104_9 + var_104_1 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_9 + var_104_1
					end

					if var_104_4.prefab_name ~= "" and arg_101_1.actors_[var_104_4.prefab_name] ~= nil then
						local var_104_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_4.prefab_name].transform, "story_v_out_106132", "106132025", "story_v_out_106132.awb")

						arg_101_1:RecordAudio("106132025", var_104_10)
						arg_101_1:RecordAudio("106132025", var_104_10)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_106132", "106132025", "story_v_out_106132.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_106132", "106132025", "story_v_out_106132.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_11 = math.max(var_104_2, arg_101_1.talkMaxDuration)

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_11 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_1) / var_104_11

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_1 + var_104_11 and arg_101_1.time_ < var_104_1 + var_104_11 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play106132026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 106132026
		arg_105_1.duration_ = 7.033

		local var_105_0 = {
			ja = 7.033,
			ko = 4.4,
			zh = 5.066,
			en = 4.8
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play106132027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1099ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1099ui_story == nil then
				arg_105_1.var_.characterEffect1099ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.1

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1099ui_story then
					arg_105_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1099ui_story then
				arg_105_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_108_4 = arg_105_1.actors_["1093ui_story"]
			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 and arg_105_1.var_.characterEffect1093ui_story == nil then
				arg_105_1.var_.characterEffect1093ui_story = var_108_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_6 = 0.1

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6

				if arg_105_1.var_.characterEffect1093ui_story then
					local var_108_8 = Mathf.Lerp(0, 0.5, var_108_7)

					arg_105_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1093ui_story.fillRatio = var_108_8
				end
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 and arg_105_1.var_.characterEffect1093ui_story then
				local var_108_9 = 0.5

				arg_105_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1093ui_story.fillRatio = var_108_9
			end

			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action465")
			end

			local var_108_11 = 0

			if var_108_11 < arg_105_1.time_ and arg_105_1.time_ <= var_108_11 + arg_108_0 then
				arg_105_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_108_12 = 0
			local var_108_13 = 0.575

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_14 = arg_105_1:FormatText(StoryNameCfg[84].name)

				arg_105_1.leftNameTxt_.text = var_108_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_15 = arg_105_1:GetWordFromCfg(106132026)
				local var_108_16 = arg_105_1:FormatText(var_108_15.content)

				arg_105_1.text_.text = var_108_16

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_17 = 23
				local var_108_18 = utf8.len(var_108_16)
				local var_108_19 = var_108_17 <= 0 and var_108_13 or var_108_13 * (var_108_18 / var_108_17)

				if var_108_19 > 0 and var_108_13 < var_108_19 then
					arg_105_1.talkMaxDuration = var_108_19

					if var_108_19 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_12
					end
				end

				arg_105_1.text_.text = var_108_16
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132026", "story_v_out_106132.awb") ~= 0 then
					local var_108_20 = manager.audio:GetVoiceLength("story_v_out_106132", "106132026", "story_v_out_106132.awb") / 1000

					if var_108_20 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_20 + var_108_12
					end

					if var_108_15.prefab_name ~= "" and arg_105_1.actors_[var_108_15.prefab_name] ~= nil then
						local var_108_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_15.prefab_name].transform, "story_v_out_106132", "106132026", "story_v_out_106132.awb")

						arg_105_1:RecordAudio("106132026", var_108_21)
						arg_105_1:RecordAudio("106132026", var_108_21)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_106132", "106132026", "story_v_out_106132.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_106132", "106132026", "story_v_out_106132.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_22 = math.max(var_108_13, arg_105_1.talkMaxDuration)

			if var_108_12 <= arg_105_1.time_ and arg_105_1.time_ < var_108_12 + var_108_22 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_12) / var_108_22

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_12 + var_108_22 and arg_105_1.time_ < var_108_12 + var_108_22 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play106132027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 106132027
		arg_109_1.duration_ = 7.766

		local var_109_0 = {
			ja = 7.766,
			ko = 4.533,
			zh = 5.7,
			en = 6.566
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
				arg_109_0:Play106132028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1093ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1093ui_story == nil then
				arg_109_1.var_.characterEffect1093ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.1

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1093ui_story then
					arg_109_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1093ui_story then
				arg_109_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_112_4 = arg_109_1.actors_["1099ui_story"]
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 and arg_109_1.var_.characterEffect1099ui_story == nil then
				arg_109_1.var_.characterEffect1099ui_story = var_112_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_6 = 0.1

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6

				if arg_109_1.var_.characterEffect1099ui_story then
					local var_112_8 = Mathf.Lerp(0, 0.5, var_112_7)

					arg_109_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1099ui_story.fillRatio = var_112_8
				end
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 and arg_109_1.var_.characterEffect1099ui_story then
				local var_112_9 = 0.5

				arg_109_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1099ui_story.fillRatio = var_112_9
			end

			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 then
				arg_109_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_112_11 = 0
			local var_112_12 = 0.475

			if var_112_11 < arg_109_1.time_ and arg_109_1.time_ <= var_112_11 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_13 = arg_109_1:FormatText(StoryNameCfg[73].name)

				arg_109_1.leftNameTxt_.text = var_112_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_14 = arg_109_1:GetWordFromCfg(106132027)
				local var_112_15 = arg_109_1:FormatText(var_112_14.content)

				arg_109_1.text_.text = var_112_15

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_16 = 17
				local var_112_17 = utf8.len(var_112_15)
				local var_112_18 = var_112_16 <= 0 and var_112_12 or var_112_12 * (var_112_17 / var_112_16)

				if var_112_18 > 0 and var_112_12 < var_112_18 then
					arg_109_1.talkMaxDuration = var_112_18

					if var_112_18 + var_112_11 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_18 + var_112_11
					end
				end

				arg_109_1.text_.text = var_112_15
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132027", "story_v_out_106132.awb") ~= 0 then
					local var_112_19 = manager.audio:GetVoiceLength("story_v_out_106132", "106132027", "story_v_out_106132.awb") / 1000

					if var_112_19 + var_112_11 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_19 + var_112_11
					end

					if var_112_14.prefab_name ~= "" and arg_109_1.actors_[var_112_14.prefab_name] ~= nil then
						local var_112_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_14.prefab_name].transform, "story_v_out_106132", "106132027", "story_v_out_106132.awb")

						arg_109_1:RecordAudio("106132027", var_112_20)
						arg_109_1:RecordAudio("106132027", var_112_20)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_106132", "106132027", "story_v_out_106132.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_106132", "106132027", "story_v_out_106132.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_21 = math.max(var_112_12, arg_109_1.talkMaxDuration)

			if var_112_11 <= arg_109_1.time_ and arg_109_1.time_ < var_112_11 + var_112_21 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_11) / var_112_21

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_11 + var_112_21 and arg_109_1.time_ < var_112_11 + var_112_21 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play106132028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 106132028
		arg_113_1.duration_ = 8

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play106132029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1093ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1093ui_story == nil then
				arg_113_1.var_.characterEffect1093ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.1

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1093ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1093ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1093ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1093ui_story.fillRatio = var_116_5
			end

			local var_116_6 = arg_113_1.bgs_.C01b.transform
			local var_116_7 = 1.5

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 then
				arg_113_1.var_.moveOldPosC01b = var_116_6.localPosition
			end

			local var_116_8 = 0.001

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8
				local var_116_10 = Vector3.New(0, -100, 10)

				var_116_6.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPosC01b, var_116_10, var_116_9)
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 then
				var_116_6.localPosition = Vector3.New(0, -100, 10)
			end

			local var_116_11 = "C07_1"

			if arg_113_1.bgs_[var_116_11] == nil then
				local var_116_12 = Object.Instantiate(arg_113_1.paintGo_)

				var_116_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_116_11)
				var_116_12.name = var_116_11
				var_116_12.transform.parent = arg_113_1.stage_.transform
				var_116_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.bgs_[var_116_11] = var_116_12
			end

			local var_116_13 = 1.5

			if var_116_13 < arg_113_1.time_ and arg_113_1.time_ <= var_116_13 + arg_116_0 then
				local var_116_14 = manager.ui.mainCamera.transform.localPosition
				local var_116_15 = Vector3.New(0, 0, 10) + Vector3.New(var_116_14.x, var_116_14.y, 0)
				local var_116_16 = arg_113_1.bgs_.C07_1

				var_116_16.transform.localPosition = var_116_15
				var_116_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_116_17 = var_116_16:GetComponent("SpriteRenderer")

				if var_116_17 and var_116_17.sprite then
					local var_116_18 = (var_116_16.transform.localPosition - var_116_14).z
					local var_116_19 = manager.ui.mainCameraCom_
					local var_116_20 = 2 * var_116_18 * Mathf.Tan(var_116_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_116_21 = var_116_20 * var_116_19.aspect
					local var_116_22 = var_116_17.sprite.bounds.size.x
					local var_116_23 = var_116_17.sprite.bounds.size.y
					local var_116_24 = var_116_21 / var_116_22
					local var_116_25 = var_116_20 / var_116_23
					local var_116_26 = var_116_25 < var_116_24 and var_116_24 or var_116_25

					var_116_16.transform.localScale = Vector3.New(var_116_26, var_116_26, 0)
				end

				for iter_116_0, iter_116_1 in pairs(arg_113_1.bgs_) do
					if iter_116_0 ~= "C07_1" then
						iter_116_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_116_27 = arg_113_1.actors_["1099ui_story"].transform
			local var_116_28 = 0

			if var_116_28 < arg_113_1.time_ and arg_113_1.time_ <= var_116_28 + arg_116_0 then
				arg_113_1.var_.moveOldPos1099ui_story = var_116_27.localPosition
			end

			local var_116_29 = 0.001

			if var_116_28 <= arg_113_1.time_ and arg_113_1.time_ < var_116_28 + var_116_29 then
				local var_116_30 = (arg_113_1.time_ - var_116_28) / var_116_29
				local var_116_31 = Vector3.New(0, 100, 0)

				var_116_27.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1099ui_story, var_116_31, var_116_30)

				local var_116_32 = manager.ui.mainCamera.transform.position - var_116_27.position

				var_116_27.forward = Vector3.New(var_116_32.x, var_116_32.y, var_116_32.z)

				local var_116_33 = var_116_27.localEulerAngles

				var_116_33.z = 0
				var_116_33.x = 0
				var_116_27.localEulerAngles = var_116_33
			end

			if arg_113_1.time_ >= var_116_28 + var_116_29 and arg_113_1.time_ < var_116_28 + var_116_29 + arg_116_0 then
				var_116_27.localPosition = Vector3.New(0, 100, 0)

				local var_116_34 = manager.ui.mainCamera.transform.position - var_116_27.position

				var_116_27.forward = Vector3.New(var_116_34.x, var_116_34.y, var_116_34.z)

				local var_116_35 = var_116_27.localEulerAngles

				var_116_35.z = 0
				var_116_35.x = 0
				var_116_27.localEulerAngles = var_116_35
			end

			local var_116_36 = arg_113_1.actors_["1093ui_story"].transform
			local var_116_37 = 0

			if var_116_37 < arg_113_1.time_ and arg_113_1.time_ <= var_116_37 + arg_116_0 then
				arg_113_1.var_.moveOldPos1093ui_story = var_116_36.localPosition
			end

			local var_116_38 = 0.001

			if var_116_37 <= arg_113_1.time_ and arg_113_1.time_ < var_116_37 + var_116_38 then
				local var_116_39 = (arg_113_1.time_ - var_116_37) / var_116_38
				local var_116_40 = Vector3.New(0, 100, 0)

				var_116_36.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1093ui_story, var_116_40, var_116_39)

				local var_116_41 = manager.ui.mainCamera.transform.position - var_116_36.position

				var_116_36.forward = Vector3.New(var_116_41.x, var_116_41.y, var_116_41.z)

				local var_116_42 = var_116_36.localEulerAngles

				var_116_42.z = 0
				var_116_42.x = 0
				var_116_36.localEulerAngles = var_116_42
			end

			if arg_113_1.time_ >= var_116_37 + var_116_38 and arg_113_1.time_ < var_116_37 + var_116_38 + arg_116_0 then
				var_116_36.localPosition = Vector3.New(0, 100, 0)

				local var_116_43 = manager.ui.mainCamera.transform.position - var_116_36.position

				var_116_36.forward = Vector3.New(var_116_43.x, var_116_43.y, var_116_43.z)

				local var_116_44 = var_116_36.localEulerAngles

				var_116_44.z = 0
				var_116_44.x = 0
				var_116_36.localEulerAngles = var_116_44
			end

			local var_116_45 = arg_113_1.bgs_.C07_1
			local var_116_46 = 1.5

			if var_116_46 < arg_113_1.time_ and arg_113_1.time_ <= var_116_46 + arg_116_0 then
				local var_116_47 = var_116_45:GetComponent("SpriteRenderer")

				if var_116_47 then
					var_116_47.material = arg_113_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_116_48 = var_116_47.material
					local var_116_49 = var_116_48:GetColor("_Color")

					arg_113_1.var_.alphaOldValueC07_1 = var_116_49.a
					arg_113_1.var_.alphaMatValueC07_1 = var_116_48
				end

				arg_113_1.var_.alphaOldValueC07_1 = 0
			end

			local var_116_50 = 1.5

			if var_116_46 <= arg_113_1.time_ and arg_113_1.time_ < var_116_46 + var_116_50 then
				local var_116_51 = (arg_113_1.time_ - var_116_46) / var_116_50
				local var_116_52 = Mathf.Lerp(arg_113_1.var_.alphaOldValueC07_1, 1, var_116_51)

				if arg_113_1.var_.alphaMatValueC07_1 then
					local var_116_53 = arg_113_1.var_.alphaMatValueC07_1
					local var_116_54 = var_116_53:GetColor("_Color")

					var_116_54.a = var_116_52

					var_116_53:SetColor("_Color", var_116_54)
				end
			end

			if arg_113_1.time_ >= var_116_46 + var_116_50 and arg_113_1.time_ < var_116_46 + var_116_50 + arg_116_0 and arg_113_1.var_.alphaMatValueC07_1 then
				local var_116_55 = arg_113_1.var_.alphaMatValueC07_1
				local var_116_56 = var_116_55:GetColor("_Color")

				var_116_56.a = 1

				var_116_55:SetColor("_Color", var_116_56)
			end

			local var_116_57 = arg_113_1.bgs_.C01b
			local var_116_58 = 0

			if var_116_58 < arg_113_1.time_ and arg_113_1.time_ <= var_116_58 + arg_116_0 then
				local var_116_59 = var_116_57:GetComponent("SpriteRenderer")

				if var_116_59 then
					var_116_59.material = arg_113_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_116_60 = var_116_59.material
					local var_116_61 = var_116_60:GetColor("_Color")

					arg_113_1.var_.alphaOldValueC01b = var_116_61.a
					arg_113_1.var_.alphaMatValueC01b = var_116_60
				end

				arg_113_1.var_.alphaOldValueC01b = 1
			end

			local var_116_62 = 1.5

			if var_116_58 <= arg_113_1.time_ and arg_113_1.time_ < var_116_58 + var_116_62 then
				local var_116_63 = (arg_113_1.time_ - var_116_58) / var_116_62
				local var_116_64 = Mathf.Lerp(arg_113_1.var_.alphaOldValueC01b, 0, var_116_63)

				if arg_113_1.var_.alphaMatValueC01b then
					local var_116_65 = arg_113_1.var_.alphaMatValueC01b
					local var_116_66 = var_116_65:GetColor("_Color")

					var_116_66.a = var_116_64

					var_116_65:SetColor("_Color", var_116_66)
				end
			end

			if arg_113_1.time_ >= var_116_58 + var_116_62 and arg_113_1.time_ < var_116_58 + var_116_62 + arg_116_0 and arg_113_1.var_.alphaMatValueC01b then
				local var_116_67 = arg_113_1.var_.alphaMatValueC01b
				local var_116_68 = var_116_67:GetColor("_Color")

				var_116_68.a = 0

				var_116_67:SetColor("_Color", var_116_68)
			end

			local var_116_69 = 0

			if var_116_69 < arg_113_1.time_ and arg_113_1.time_ <= var_116_69 + arg_116_0 then
				arg_113_1.allBtn_.enabled = false
			end

			local var_116_70 = 3

			if arg_113_1.time_ >= var_116_69 + var_116_70 and arg_113_1.time_ < var_116_69 + var_116_70 + arg_116_0 then
				arg_113_1.allBtn_.enabled = true
			end

			if arg_113_1.frameCnt_ <= 1 then
				arg_113_1.dialog_:SetActive(false)
			end

			local var_116_71 = 3
			local var_116_72 = 0.125

			if var_116_71 < arg_113_1.time_ and arg_113_1.time_ <= var_116_71 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0

				arg_113_1.dialog_:SetActive(true)

				local var_116_73 = LeanTween.value(arg_113_1.dialog_, 0, 1, 0.3)

				var_116_73:setOnUpdate(LuaHelper.FloatAction(function(arg_117_0)
					arg_113_1.dialogCg_.alpha = arg_117_0
				end))
				var_116_73:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_113_1.dialog_)
					var_116_73:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_113_1.duration_ = arg_113_1.duration_ + 0.3

				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_74 = arg_113_1:GetWordFromCfg(106132028)
				local var_116_75 = arg_113_1:FormatText(var_116_74.content)

				arg_113_1.text_.text = var_116_75

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_76 = 5
				local var_116_77 = utf8.len(var_116_75)
				local var_116_78 = var_116_76 <= 0 and var_116_72 or var_116_72 * (var_116_77 / var_116_76)

				if var_116_78 > 0 and var_116_72 < var_116_78 then
					arg_113_1.talkMaxDuration = var_116_78
					var_116_71 = var_116_71 + 0.3

					if var_116_78 + var_116_71 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_78 + var_116_71
					end
				end

				arg_113_1.text_.text = var_116_75
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_79 = var_116_71 + 0.3
			local var_116_80 = math.max(var_116_72, arg_113_1.talkMaxDuration)

			if var_116_79 <= arg_113_1.time_ and arg_113_1.time_ < var_116_79 + var_116_80 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_79) / var_116_80

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_79 + var_116_80 and arg_113_1.time_ < var_116_79 + var_116_80 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play106132029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 106132029
		arg_119_1.duration_ = 4.966

		local var_119_0 = {
			ja = 1.999999999999,
			ko = 2.366,
			zh = 3.9,
			en = 4.966
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
				arg_119_0:Play106132030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = "4014_tpose"

			if arg_119_1.actors_[var_122_0] == nil then
				local var_122_1 = Object.Instantiate(Asset.Load("Char/" .. var_122_0), arg_119_1.stage_.transform)

				var_122_1.name = var_122_0
				var_122_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_119_1.actors_[var_122_0] = var_122_1

				local var_122_2 = var_122_1:GetComponentInChildren(typeof(CharacterEffect))

				var_122_2.enabled = true

				local var_122_3 = GameObjectTools.GetOrAddComponent(var_122_1, typeof(DynamicBoneHelper))

				if var_122_3 then
					var_122_3:EnableDynamicBone(false)
				end

				arg_119_1:ShowWeapon(var_122_2.transform, false)

				arg_119_1.var_[var_122_0 .. "Animator"] = var_122_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_119_1.var_[var_122_0 .. "Animator"].applyRootMotion = true
				arg_119_1.var_[var_122_0 .. "LipSync"] = var_122_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_122_4 = arg_119_1.actors_["4014_tpose"]
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 and arg_119_1.var_.characterEffect4014_tpose == nil then
				arg_119_1.var_.characterEffect4014_tpose = var_122_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_6 = 0.1

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6

				if arg_119_1.var_.characterEffect4014_tpose then
					arg_119_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 and arg_119_1.var_.characterEffect4014_tpose then
				arg_119_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_122_8 = arg_119_1.actors_["4014_tpose"].transform
			local var_122_9 = 0

			if var_122_9 < arg_119_1.time_ and arg_119_1.time_ <= var_122_9 + arg_122_0 then
				arg_119_1.var_.moveOldPos4014_tpose = var_122_8.localPosition
			end

			local var_122_10 = 0.001

			if var_122_9 <= arg_119_1.time_ and arg_119_1.time_ < var_122_9 + var_122_10 then
				local var_122_11 = (arg_119_1.time_ - var_122_9) / var_122_10
				local var_122_12 = Vector3.New(0, -1.95, -4.2)

				var_122_8.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos4014_tpose, var_122_12, var_122_11)

				local var_122_13 = manager.ui.mainCamera.transform.position - var_122_8.position

				var_122_8.forward = Vector3.New(var_122_13.x, var_122_13.y, var_122_13.z)

				local var_122_14 = var_122_8.localEulerAngles

				var_122_14.z = 0
				var_122_14.x = 0
				var_122_8.localEulerAngles = var_122_14
			end

			if arg_119_1.time_ >= var_122_9 + var_122_10 and arg_119_1.time_ < var_122_9 + var_122_10 + arg_122_0 then
				var_122_8.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_122_15 = manager.ui.mainCamera.transform.position - var_122_8.position

				var_122_8.forward = Vector3.New(var_122_15.x, var_122_15.y, var_122_15.z)

				local var_122_16 = var_122_8.localEulerAngles

				var_122_16.z = 0
				var_122_16.x = 0
				var_122_8.localEulerAngles = var_122_16
			end

			local var_122_17 = 0

			if var_122_17 < arg_119_1.time_ and arg_119_1.time_ <= var_122_17 + arg_122_0 then
				arg_119_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_122_18 = 0

			if var_122_18 < arg_119_1.time_ and arg_119_1.time_ <= var_122_18 + arg_122_0 then
				arg_119_1.mask_.enabled = true
				arg_119_1.mask_.raycastTarget = true

				arg_119_1:SetGaussion(false)
			end

			local var_122_19 = 0.5

			if var_122_18 <= arg_119_1.time_ and arg_119_1.time_ < var_122_18 + var_122_19 then
				local var_122_20 = (arg_119_1.time_ - var_122_18) / var_122_19
				local var_122_21 = Color.New(1, 1, 1)

				var_122_21.a = Mathf.Lerp(1, 0, var_122_20)
				arg_119_1.mask_.color = var_122_21
			end

			if arg_119_1.time_ >= var_122_18 + var_122_19 and arg_119_1.time_ < var_122_18 + var_122_19 + arg_122_0 then
				local var_122_22 = Color.New(1, 1, 1)
				local var_122_23 = 0

				arg_119_1.mask_.enabled = false
				var_122_22.a = var_122_23
				arg_119_1.mask_.color = var_122_22
			end

			local var_122_24 = 0.5
			local var_122_25 = 0.225

			if var_122_24 < arg_119_1.time_ and arg_119_1.time_ <= var_122_24 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_26 = arg_119_1:FormatText(StoryNameCfg[87].name)

				arg_119_1.leftNameTxt_.text = var_122_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_27 = arg_119_1:GetWordFromCfg(106132029)
				local var_122_28 = arg_119_1:FormatText(var_122_27.content)

				arg_119_1.text_.text = var_122_28

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_29 = 9
				local var_122_30 = utf8.len(var_122_28)
				local var_122_31 = var_122_29 <= 0 and var_122_25 or var_122_25 * (var_122_30 / var_122_29)

				if var_122_31 > 0 and var_122_25 < var_122_31 then
					arg_119_1.talkMaxDuration = var_122_31

					if var_122_31 + var_122_24 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_31 + var_122_24
					end
				end

				arg_119_1.text_.text = var_122_28
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132029", "story_v_out_106132.awb") ~= 0 then
					local var_122_32 = manager.audio:GetVoiceLength("story_v_out_106132", "106132029", "story_v_out_106132.awb") / 1000

					if var_122_32 + var_122_24 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_32 + var_122_24
					end

					if var_122_27.prefab_name ~= "" and arg_119_1.actors_[var_122_27.prefab_name] ~= nil then
						local var_122_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_27.prefab_name].transform, "story_v_out_106132", "106132029", "story_v_out_106132.awb")

						arg_119_1:RecordAudio("106132029", var_122_33)
						arg_119_1:RecordAudio("106132029", var_122_33)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_106132", "106132029", "story_v_out_106132.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_106132", "106132029", "story_v_out_106132.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_34 = math.max(var_122_25, arg_119_1.talkMaxDuration)

			if var_122_24 <= arg_119_1.time_ and arg_119_1.time_ < var_122_24 + var_122_34 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_24) / var_122_34

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_24 + var_122_34 and arg_119_1.time_ < var_122_24 + var_122_34 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play106132030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 106132030
		arg_123_1.duration_ = 2.566

		local var_123_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2.566,
			en = 1.999999999999
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
				arg_123_0:Play106132031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["4014_tpose"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect4014_tpose == nil then
				arg_123_1.var_.characterEffect4014_tpose = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.1

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect4014_tpose then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_123_1.var_.characterEffect4014_tpose.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect4014_tpose then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_123_1.var_.characterEffect4014_tpose.fillRatio = var_126_5
			end

			local var_126_6 = "10004ui_story"

			if arg_123_1.actors_[var_126_6] == nil then
				local var_126_7 = Object.Instantiate(Asset.Load("Char/" .. var_126_6), arg_123_1.stage_.transform)

				var_126_7.name = var_126_6
				var_126_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.actors_[var_126_6] = var_126_7

				local var_126_8 = var_126_7:GetComponentInChildren(typeof(CharacterEffect))

				var_126_8.enabled = true

				local var_126_9 = GameObjectTools.GetOrAddComponent(var_126_7, typeof(DynamicBoneHelper))

				if var_126_9 then
					var_126_9:EnableDynamicBone(false)
				end

				arg_123_1:ShowWeapon(var_126_8.transform, false)

				arg_123_1.var_[var_126_6 .. "Animator"] = var_126_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_123_1.var_[var_126_6 .. "Animator"].applyRootMotion = true
				arg_123_1.var_[var_126_6 .. "LipSync"] = var_126_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_126_10 = arg_123_1.actors_["10004ui_story"]
			local var_126_11 = 0

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect10004ui_story == nil then
				arg_123_1.var_.characterEffect10004ui_story = var_126_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_12 = 0.1

			if var_126_11 <= arg_123_1.time_ and arg_123_1.time_ < var_126_11 + var_126_12 then
				local var_126_13 = (arg_123_1.time_ - var_126_11) / var_126_12

				if arg_123_1.var_.characterEffect10004ui_story then
					arg_123_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_11 + var_126_12 and arg_123_1.time_ < var_126_11 + var_126_12 + arg_126_0 and arg_123_1.var_.characterEffect10004ui_story then
				arg_123_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_126_14 = arg_123_1.actors_["4014_tpose"].transform
			local var_126_15 = 0

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.var_.moveOldPos4014_tpose = var_126_14.localPosition
			end

			local var_126_16 = 0.001

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_16 then
				local var_126_17 = (arg_123_1.time_ - var_126_15) / var_126_16
				local var_126_18 = Vector3.New(0, 100, 0)

				var_126_14.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos4014_tpose, var_126_18, var_126_17)

				local var_126_19 = manager.ui.mainCamera.transform.position - var_126_14.position

				var_126_14.forward = Vector3.New(var_126_19.x, var_126_19.y, var_126_19.z)

				local var_126_20 = var_126_14.localEulerAngles

				var_126_20.z = 0
				var_126_20.x = 0
				var_126_14.localEulerAngles = var_126_20
			end

			if arg_123_1.time_ >= var_126_15 + var_126_16 and arg_123_1.time_ < var_126_15 + var_126_16 + arg_126_0 then
				var_126_14.localPosition = Vector3.New(0, 100, 0)

				local var_126_21 = manager.ui.mainCamera.transform.position - var_126_14.position

				var_126_14.forward = Vector3.New(var_126_21.x, var_126_21.y, var_126_21.z)

				local var_126_22 = var_126_14.localEulerAngles

				var_126_22.z = 0
				var_126_22.x = 0
				var_126_14.localEulerAngles = var_126_22
			end

			local var_126_23 = arg_123_1.actors_["10004ui_story"].transform
			local var_126_24 = 0

			if var_126_24 < arg_123_1.time_ and arg_123_1.time_ <= var_126_24 + arg_126_0 then
				arg_123_1.var_.moveOldPos10004ui_story = var_126_23.localPosition
			end

			local var_126_25 = 0.001

			if var_126_24 <= arg_123_1.time_ and arg_123_1.time_ < var_126_24 + var_126_25 then
				local var_126_26 = (arg_123_1.time_ - var_126_24) / var_126_25
				local var_126_27 = Vector3.New(0, -1.1, -5.6)

				var_126_23.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10004ui_story, var_126_27, var_126_26)

				local var_126_28 = manager.ui.mainCamera.transform.position - var_126_23.position

				var_126_23.forward = Vector3.New(var_126_28.x, var_126_28.y, var_126_28.z)

				local var_126_29 = var_126_23.localEulerAngles

				var_126_29.z = 0
				var_126_29.x = 0
				var_126_23.localEulerAngles = var_126_29
			end

			if arg_123_1.time_ >= var_126_24 + var_126_25 and arg_123_1.time_ < var_126_24 + var_126_25 + arg_126_0 then
				var_126_23.localPosition = Vector3.New(0, -1.1, -5.6)

				local var_126_30 = manager.ui.mainCamera.transform.position - var_126_23.position

				var_126_23.forward = Vector3.New(var_126_30.x, var_126_30.y, var_126_30.z)

				local var_126_31 = var_126_23.localEulerAngles

				var_126_31.z = 0
				var_126_31.x = 0
				var_126_23.localEulerAngles = var_126_31
			end

			local var_126_32 = 0

			if var_126_32 < arg_123_1.time_ and arg_123_1.time_ <= var_126_32 + arg_126_0 then
				arg_123_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action1_1")
			end

			local var_126_33 = 0

			if var_126_33 < arg_123_1.time_ and arg_123_1.time_ <= var_126_33 + arg_126_0 then
				arg_123_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_126_34 = 0
			local var_126_35 = 0.2

			if var_126_34 < arg_123_1.time_ and arg_123_1.time_ <= var_126_34 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_36 = arg_123_1:FormatText(StoryNameCfg[80].name)

				arg_123_1.leftNameTxt_.text = var_126_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_37 = arg_123_1:GetWordFromCfg(106132030)
				local var_126_38 = arg_123_1:FormatText(var_126_37.content)

				arg_123_1.text_.text = var_126_38

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_39 = 8
				local var_126_40 = utf8.len(var_126_38)
				local var_126_41 = var_126_39 <= 0 and var_126_35 or var_126_35 * (var_126_40 / var_126_39)

				if var_126_41 > 0 and var_126_35 < var_126_41 then
					arg_123_1.talkMaxDuration = var_126_41

					if var_126_41 + var_126_34 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_41 + var_126_34
					end
				end

				arg_123_1.text_.text = var_126_38
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132030", "story_v_out_106132.awb") ~= 0 then
					local var_126_42 = manager.audio:GetVoiceLength("story_v_out_106132", "106132030", "story_v_out_106132.awb") / 1000

					if var_126_42 + var_126_34 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_42 + var_126_34
					end

					if var_126_37.prefab_name ~= "" and arg_123_1.actors_[var_126_37.prefab_name] ~= nil then
						local var_126_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_37.prefab_name].transform, "story_v_out_106132", "106132030", "story_v_out_106132.awb")

						arg_123_1:RecordAudio("106132030", var_126_43)
						arg_123_1:RecordAudio("106132030", var_126_43)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_106132", "106132030", "story_v_out_106132.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_106132", "106132030", "story_v_out_106132.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_44 = math.max(var_126_35, arg_123_1.talkMaxDuration)

			if var_126_34 <= arg_123_1.time_ and arg_123_1.time_ < var_126_34 + var_126_44 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_34) / var_126_44

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_34 + var_126_44 and arg_123_1.time_ < var_126_34 + var_126_44 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play106132031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 106132031
		arg_127_1.duration_ = 3.733

		local var_127_0 = {
			ja = 3.333,
			ko = 2.8,
			zh = 3.733,
			en = 3.3
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
				arg_127_0:Play106132032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["4014_tpose"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect4014_tpose == nil then
				arg_127_1.var_.characterEffect4014_tpose = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.1

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect4014_tpose then
					arg_127_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect4014_tpose then
				arg_127_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_130_4 = arg_127_1.actors_["10004ui_story"]
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 and arg_127_1.var_.characterEffect10004ui_story == nil then
				arg_127_1.var_.characterEffect10004ui_story = var_130_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_6 = 0.1

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6

				if arg_127_1.var_.characterEffect10004ui_story then
					local var_130_8 = Mathf.Lerp(0, 0.5, var_130_7)

					arg_127_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_127_1.var_.characterEffect10004ui_story.fillRatio = var_130_8
				end
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect10004ui_story then
				local var_130_9 = 0.5

				arg_127_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_127_1.var_.characterEffect10004ui_story.fillRatio = var_130_9
			end

			local var_130_10 = arg_127_1.actors_["4014_tpose"].transform
			local var_130_11 = 0

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1.var_.moveOldPos4014_tpose = var_130_10.localPosition
			end

			local var_130_12 = 0.001

			if var_130_11 <= arg_127_1.time_ and arg_127_1.time_ < var_130_11 + var_130_12 then
				local var_130_13 = (arg_127_1.time_ - var_130_11) / var_130_12
				local var_130_14 = Vector3.New(0, -1.95, -4.2)

				var_130_10.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos4014_tpose, var_130_14, var_130_13)

				local var_130_15 = manager.ui.mainCamera.transform.position - var_130_10.position

				var_130_10.forward = Vector3.New(var_130_15.x, var_130_15.y, var_130_15.z)

				local var_130_16 = var_130_10.localEulerAngles

				var_130_16.z = 0
				var_130_16.x = 0
				var_130_10.localEulerAngles = var_130_16
			end

			if arg_127_1.time_ >= var_130_11 + var_130_12 and arg_127_1.time_ < var_130_11 + var_130_12 + arg_130_0 then
				var_130_10.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_130_17 = manager.ui.mainCamera.transform.position - var_130_10.position

				var_130_10.forward = Vector3.New(var_130_17.x, var_130_17.y, var_130_17.z)

				local var_130_18 = var_130_10.localEulerAngles

				var_130_18.z = 0
				var_130_18.x = 0
				var_130_10.localEulerAngles = var_130_18
			end

			local var_130_19 = arg_127_1.actors_["10004ui_story"].transform
			local var_130_20 = 0

			if var_130_20 < arg_127_1.time_ and arg_127_1.time_ <= var_130_20 + arg_130_0 then
				arg_127_1.var_.moveOldPos10004ui_story = var_130_19.localPosition
			end

			local var_130_21 = 0.001

			if var_130_20 <= arg_127_1.time_ and arg_127_1.time_ < var_130_20 + var_130_21 then
				local var_130_22 = (arg_127_1.time_ - var_130_20) / var_130_21
				local var_130_23 = Vector3.New(0, 100, 0)

				var_130_19.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10004ui_story, var_130_23, var_130_22)

				local var_130_24 = manager.ui.mainCamera.transform.position - var_130_19.position

				var_130_19.forward = Vector3.New(var_130_24.x, var_130_24.y, var_130_24.z)

				local var_130_25 = var_130_19.localEulerAngles

				var_130_25.z = 0
				var_130_25.x = 0
				var_130_19.localEulerAngles = var_130_25
			end

			if arg_127_1.time_ >= var_130_20 + var_130_21 and arg_127_1.time_ < var_130_20 + var_130_21 + arg_130_0 then
				var_130_19.localPosition = Vector3.New(0, 100, 0)

				local var_130_26 = manager.ui.mainCamera.transform.position - var_130_19.position

				var_130_19.forward = Vector3.New(var_130_26.x, var_130_26.y, var_130_26.z)

				local var_130_27 = var_130_19.localEulerAngles

				var_130_27.z = 0
				var_130_27.x = 0
				var_130_19.localEulerAngles = var_130_27
			end

			local var_130_28 = 0
			local var_130_29 = 0.3

			if var_130_28 < arg_127_1.time_ and arg_127_1.time_ <= var_130_28 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_30 = arg_127_1:FormatText(StoryNameCfg[87].name)

				arg_127_1.leftNameTxt_.text = var_130_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_31 = arg_127_1:GetWordFromCfg(106132031)
				local var_130_32 = arg_127_1:FormatText(var_130_31.content)

				arg_127_1.text_.text = var_130_32

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_33 = 12
				local var_130_34 = utf8.len(var_130_32)
				local var_130_35 = var_130_33 <= 0 and var_130_29 or var_130_29 * (var_130_34 / var_130_33)

				if var_130_35 > 0 and var_130_29 < var_130_35 then
					arg_127_1.talkMaxDuration = var_130_35

					if var_130_35 + var_130_28 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_35 + var_130_28
					end
				end

				arg_127_1.text_.text = var_130_32
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132031", "story_v_out_106132.awb") ~= 0 then
					local var_130_36 = manager.audio:GetVoiceLength("story_v_out_106132", "106132031", "story_v_out_106132.awb") / 1000

					if var_130_36 + var_130_28 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_36 + var_130_28
					end

					if var_130_31.prefab_name ~= "" and arg_127_1.actors_[var_130_31.prefab_name] ~= nil then
						local var_130_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_31.prefab_name].transform, "story_v_out_106132", "106132031", "story_v_out_106132.awb")

						arg_127_1:RecordAudio("106132031", var_130_37)
						arg_127_1:RecordAudio("106132031", var_130_37)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_106132", "106132031", "story_v_out_106132.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_106132", "106132031", "story_v_out_106132.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_38 = math.max(var_130_29, arg_127_1.talkMaxDuration)

			if var_130_28 <= arg_127_1.time_ and arg_127_1.time_ < var_130_28 + var_130_38 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_28) / var_130_38

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_28 + var_130_38 and arg_127_1.time_ < var_130_28 + var_130_38 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play106132032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 106132032
		arg_131_1.duration_ = 3.466

		local var_131_0 = {
			ja = 3.466,
			ko = 2.866,
			zh = 3.2,
			en = 2.033
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
				arg_131_0:Play106132033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["4014_tpose"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect4014_tpose == nil then
				arg_131_1.var_.characterEffect4014_tpose = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.1

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect4014_tpose then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_131_1.var_.characterEffect4014_tpose.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect4014_tpose then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_131_1.var_.characterEffect4014_tpose.fillRatio = var_134_5
			end

			local var_134_6 = arg_131_1.actors_["10004ui_story"]
			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 and arg_131_1.var_.characterEffect10004ui_story == nil then
				arg_131_1.var_.characterEffect10004ui_story = var_134_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_8 = 0.1

			if var_134_7 <= arg_131_1.time_ and arg_131_1.time_ < var_134_7 + var_134_8 then
				local var_134_9 = (arg_131_1.time_ - var_134_7) / var_134_8

				if arg_131_1.var_.characterEffect10004ui_story then
					arg_131_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_7 + var_134_8 and arg_131_1.time_ < var_134_7 + var_134_8 + arg_134_0 and arg_131_1.var_.characterEffect10004ui_story then
				arg_131_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_134_10 = arg_131_1.actors_["4014_tpose"].transform
			local var_134_11 = 0

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				arg_131_1.var_.moveOldPos4014_tpose = var_134_10.localPosition
			end

			local var_134_12 = 0.001

			if var_134_11 <= arg_131_1.time_ and arg_131_1.time_ < var_134_11 + var_134_12 then
				local var_134_13 = (arg_131_1.time_ - var_134_11) / var_134_12
				local var_134_14 = Vector3.New(0, 100, 0)

				var_134_10.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos4014_tpose, var_134_14, var_134_13)

				local var_134_15 = manager.ui.mainCamera.transform.position - var_134_10.position

				var_134_10.forward = Vector3.New(var_134_15.x, var_134_15.y, var_134_15.z)

				local var_134_16 = var_134_10.localEulerAngles

				var_134_16.z = 0
				var_134_16.x = 0
				var_134_10.localEulerAngles = var_134_16
			end

			if arg_131_1.time_ >= var_134_11 + var_134_12 and arg_131_1.time_ < var_134_11 + var_134_12 + arg_134_0 then
				var_134_10.localPosition = Vector3.New(0, 100, 0)

				local var_134_17 = manager.ui.mainCamera.transform.position - var_134_10.position

				var_134_10.forward = Vector3.New(var_134_17.x, var_134_17.y, var_134_17.z)

				local var_134_18 = var_134_10.localEulerAngles

				var_134_18.z = 0
				var_134_18.x = 0
				var_134_10.localEulerAngles = var_134_18
			end

			local var_134_19 = arg_131_1.actors_["10004ui_story"].transform
			local var_134_20 = 0

			if var_134_20 < arg_131_1.time_ and arg_131_1.time_ <= var_134_20 + arg_134_0 then
				arg_131_1.var_.moveOldPos10004ui_story = var_134_19.localPosition
			end

			local var_134_21 = 0.001

			if var_134_20 <= arg_131_1.time_ and arg_131_1.time_ < var_134_20 + var_134_21 then
				local var_134_22 = (arg_131_1.time_ - var_134_20) / var_134_21
				local var_134_23 = Vector3.New(0, -1.1, -5.6)

				var_134_19.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10004ui_story, var_134_23, var_134_22)

				local var_134_24 = manager.ui.mainCamera.transform.position - var_134_19.position

				var_134_19.forward = Vector3.New(var_134_24.x, var_134_24.y, var_134_24.z)

				local var_134_25 = var_134_19.localEulerAngles

				var_134_25.z = 0
				var_134_25.x = 0
				var_134_19.localEulerAngles = var_134_25
			end

			if arg_131_1.time_ >= var_134_20 + var_134_21 and arg_131_1.time_ < var_134_20 + var_134_21 + arg_134_0 then
				var_134_19.localPosition = Vector3.New(0, -1.1, -5.6)

				local var_134_26 = manager.ui.mainCamera.transform.position - var_134_19.position

				var_134_19.forward = Vector3.New(var_134_26.x, var_134_26.y, var_134_26.z)

				local var_134_27 = var_134_19.localEulerAngles

				var_134_27.z = 0
				var_134_27.x = 0
				var_134_19.localEulerAngles = var_134_27
			end

			local var_134_28 = 0

			if var_134_28 < arg_131_1.time_ and arg_131_1.time_ <= var_134_28 + arg_134_0 then
				arg_131_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action3_1")
			end

			local var_134_29 = 0

			if var_134_29 < arg_131_1.time_ and arg_131_1.time_ <= var_134_29 + arg_134_0 then
				arg_131_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_134_30 = 0
			local var_134_31 = 0.375

			if var_134_30 < arg_131_1.time_ and arg_131_1.time_ <= var_134_30 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_32 = arg_131_1:FormatText(StoryNameCfg[80].name)

				arg_131_1.leftNameTxt_.text = var_134_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_33 = arg_131_1:GetWordFromCfg(106132032)
				local var_134_34 = arg_131_1:FormatText(var_134_33.content)

				arg_131_1.text_.text = var_134_34

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_35 = 15
				local var_134_36 = utf8.len(var_134_34)
				local var_134_37 = var_134_35 <= 0 and var_134_31 or var_134_31 * (var_134_36 / var_134_35)

				if var_134_37 > 0 and var_134_31 < var_134_37 then
					arg_131_1.talkMaxDuration = var_134_37

					if var_134_37 + var_134_30 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_37 + var_134_30
					end
				end

				arg_131_1.text_.text = var_134_34
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132032", "story_v_out_106132.awb") ~= 0 then
					local var_134_38 = manager.audio:GetVoiceLength("story_v_out_106132", "106132032", "story_v_out_106132.awb") / 1000

					if var_134_38 + var_134_30 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_38 + var_134_30
					end

					if var_134_33.prefab_name ~= "" and arg_131_1.actors_[var_134_33.prefab_name] ~= nil then
						local var_134_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_33.prefab_name].transform, "story_v_out_106132", "106132032", "story_v_out_106132.awb")

						arg_131_1:RecordAudio("106132032", var_134_39)
						arg_131_1:RecordAudio("106132032", var_134_39)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_106132", "106132032", "story_v_out_106132.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_106132", "106132032", "story_v_out_106132.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_40 = math.max(var_134_31, arg_131_1.talkMaxDuration)

			if var_134_30 <= arg_131_1.time_ and arg_131_1.time_ < var_134_30 + var_134_40 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_30) / var_134_40

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_30 + var_134_40 and arg_131_1.time_ < var_134_30 + var_134_40 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play106132033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 106132033
		arg_135_1.duration_ = 5.466

		local var_135_0 = {
			ja = 5.466,
			ko = 4.1,
			zh = 4.2,
			en = 4.866
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
				arg_135_0:Play106132034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["4014_tpose"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect4014_tpose == nil then
				arg_135_1.var_.characterEffect4014_tpose = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.1

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect4014_tpose then
					arg_135_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect4014_tpose then
				arg_135_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_138_4 = arg_135_1.actors_["10004ui_story"]
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 and arg_135_1.var_.characterEffect10004ui_story == nil then
				arg_135_1.var_.characterEffect10004ui_story = var_138_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_6 = 0.1

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6

				if arg_135_1.var_.characterEffect10004ui_story then
					local var_138_8 = Mathf.Lerp(0, 0.5, var_138_7)

					arg_135_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10004ui_story.fillRatio = var_138_8
				end
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect10004ui_story then
				local var_138_9 = 0.5

				arg_135_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10004ui_story.fillRatio = var_138_9
			end

			local var_138_10 = arg_135_1.actors_["4014_tpose"].transform
			local var_138_11 = 0

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1.var_.moveOldPos4014_tpose = var_138_10.localPosition
			end

			local var_138_12 = 0.001

			if var_138_11 <= arg_135_1.time_ and arg_135_1.time_ < var_138_11 + var_138_12 then
				local var_138_13 = (arg_135_1.time_ - var_138_11) / var_138_12
				local var_138_14 = Vector3.New(0, -1.95, -4.2)

				var_138_10.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos4014_tpose, var_138_14, var_138_13)

				local var_138_15 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_15.x, var_138_15.y, var_138_15.z)

				local var_138_16 = var_138_10.localEulerAngles

				var_138_16.z = 0
				var_138_16.x = 0
				var_138_10.localEulerAngles = var_138_16
			end

			if arg_135_1.time_ >= var_138_11 + var_138_12 and arg_135_1.time_ < var_138_11 + var_138_12 + arg_138_0 then
				var_138_10.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_138_17 = manager.ui.mainCamera.transform.position - var_138_10.position

				var_138_10.forward = Vector3.New(var_138_17.x, var_138_17.y, var_138_17.z)

				local var_138_18 = var_138_10.localEulerAngles

				var_138_18.z = 0
				var_138_18.x = 0
				var_138_10.localEulerAngles = var_138_18
			end

			local var_138_19 = arg_135_1.actors_["10004ui_story"].transform
			local var_138_20 = 0

			if var_138_20 < arg_135_1.time_ and arg_135_1.time_ <= var_138_20 + arg_138_0 then
				arg_135_1.var_.moveOldPos10004ui_story = var_138_19.localPosition
			end

			local var_138_21 = 0.001

			if var_138_20 <= arg_135_1.time_ and arg_135_1.time_ < var_138_20 + var_138_21 then
				local var_138_22 = (arg_135_1.time_ - var_138_20) / var_138_21
				local var_138_23 = Vector3.New(0, 100, 0)

				var_138_19.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10004ui_story, var_138_23, var_138_22)

				local var_138_24 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_24.x, var_138_24.y, var_138_24.z)

				local var_138_25 = var_138_19.localEulerAngles

				var_138_25.z = 0
				var_138_25.x = 0
				var_138_19.localEulerAngles = var_138_25
			end

			if arg_135_1.time_ >= var_138_20 + var_138_21 and arg_135_1.time_ < var_138_20 + var_138_21 + arg_138_0 then
				var_138_19.localPosition = Vector3.New(0, 100, 0)

				local var_138_26 = manager.ui.mainCamera.transform.position - var_138_19.position

				var_138_19.forward = Vector3.New(var_138_26.x, var_138_26.y, var_138_26.z)

				local var_138_27 = var_138_19.localEulerAngles

				var_138_27.z = 0
				var_138_27.x = 0
				var_138_19.localEulerAngles = var_138_27
			end

			local var_138_28 = 0
			local var_138_29 = 0.35

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_30 = arg_135_1:FormatText(StoryNameCfg[87].name)

				arg_135_1.leftNameTxt_.text = var_138_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_31 = arg_135_1:GetWordFromCfg(106132033)
				local var_138_32 = arg_135_1:FormatText(var_138_31.content)

				arg_135_1.text_.text = var_138_32

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_33 = 14
				local var_138_34 = utf8.len(var_138_32)
				local var_138_35 = var_138_33 <= 0 and var_138_29 or var_138_29 * (var_138_34 / var_138_33)

				if var_138_35 > 0 and var_138_29 < var_138_35 then
					arg_135_1.talkMaxDuration = var_138_35

					if var_138_35 + var_138_28 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_35 + var_138_28
					end
				end

				arg_135_1.text_.text = var_138_32
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132033", "story_v_out_106132.awb") ~= 0 then
					local var_138_36 = manager.audio:GetVoiceLength("story_v_out_106132", "106132033", "story_v_out_106132.awb") / 1000

					if var_138_36 + var_138_28 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_36 + var_138_28
					end

					if var_138_31.prefab_name ~= "" and arg_135_1.actors_[var_138_31.prefab_name] ~= nil then
						local var_138_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_31.prefab_name].transform, "story_v_out_106132", "106132033", "story_v_out_106132.awb")

						arg_135_1:RecordAudio("106132033", var_138_37)
						arg_135_1:RecordAudio("106132033", var_138_37)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_106132", "106132033", "story_v_out_106132.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_106132", "106132033", "story_v_out_106132.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_38 = math.max(var_138_29, arg_135_1.talkMaxDuration)

			if var_138_28 <= arg_135_1.time_ and arg_135_1.time_ < var_138_28 + var_138_38 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_28) / var_138_38

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_28 + var_138_38 and arg_135_1.time_ < var_138_28 + var_138_38 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play106132034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 106132034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play106132035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["4014_tpose"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect4014_tpose == nil then
				arg_139_1.var_.characterEffect4014_tpose = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.1

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect4014_tpose then
					local var_142_4 = Mathf.Lerp(0, 0.5, var_142_3)

					arg_139_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_139_1.var_.characterEffect4014_tpose.fillRatio = var_142_4
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect4014_tpose then
				local var_142_5 = 0.5

				arg_139_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_139_1.var_.characterEffect4014_tpose.fillRatio = var_142_5
			end

			local var_142_6 = 0
			local var_142_7 = 0.75

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

				local var_142_8 = arg_139_1:GetWordFromCfg(106132034)
				local var_142_9 = arg_139_1:FormatText(var_142_8.content)

				arg_139_1.text_.text = var_142_9

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_10 = 30
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
	Play106132035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 106132035
		arg_143_1.duration_ = 7.633

		local var_143_0 = {
			ja = 5.9,
			ko = 6.433,
			zh = 6.066,
			en = 7.633
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
			arg_143_1.auto_ = false
		end

		function arg_143_1.playNext_(arg_145_0)
			arg_143_1.onStoryFinished_()
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["4014_tpose"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect4014_tpose == nil then
				arg_143_1.var_.characterEffect4014_tpose = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.1

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect4014_tpose then
					arg_143_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect4014_tpose then
				arg_143_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_146_4 = 0
			local var_146_5 = 0.525

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_6 = arg_143_1:FormatText(StoryNameCfg[87].name)

				arg_143_1.leftNameTxt_.text = var_146_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_7 = arg_143_1:GetWordFromCfg(106132035)
				local var_146_8 = arg_143_1:FormatText(var_146_7.content)

				arg_143_1.text_.text = var_146_8

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_9 = 21
				local var_146_10 = utf8.len(var_146_8)
				local var_146_11 = var_146_9 <= 0 and var_146_5 or var_146_5 * (var_146_10 / var_146_9)

				if var_146_11 > 0 and var_146_5 < var_146_11 then
					arg_143_1.talkMaxDuration = var_146_11

					if var_146_11 + var_146_4 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_11 + var_146_4
					end
				end

				arg_143_1.text_.text = var_146_8
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106132", "106132035", "story_v_out_106132.awb") ~= 0 then
					local var_146_12 = manager.audio:GetVoiceLength("story_v_out_106132", "106132035", "story_v_out_106132.awb") / 1000

					if var_146_12 + var_146_4 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_4
					end

					if var_146_7.prefab_name ~= "" and arg_143_1.actors_[var_146_7.prefab_name] ~= nil then
						local var_146_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_7.prefab_name].transform, "story_v_out_106132", "106132035", "story_v_out_106132.awb")

						arg_143_1:RecordAudio("106132035", var_146_13)
						arg_143_1:RecordAudio("106132035", var_146_13)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_106132", "106132035", "story_v_out_106132.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_106132", "106132035", "story_v_out_106132.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_14 = math.max(var_146_5, arg_143_1.talkMaxDuration)

			if var_146_4 <= arg_143_1.time_ and arg_143_1.time_ < var_146_4 + var_146_14 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_4) / var_146_14

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_4 + var_146_14 and arg_143_1.time_ < var_146_4 + var_146_14 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C01b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/C07_1"
	},
	voices = {
		"story_v_out_106132.awb"
	}
}
