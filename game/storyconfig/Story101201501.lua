return {
	Play120151001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120151001
		arg_1_1.duration_ = 6.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play120151002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J13f"

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
				local var_4_5 = arg_1_1.bgs_.J13f

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
					if iter_4_0 ~= "J13f" then
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
			local var_4_23 = 0.1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.5
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 1.999999999999
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

				local var_4_33 = arg_1_1:GetWordFromCfg(120151001)
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
	Play120151002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120151002
		arg_7_1.duration_ = 6

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play120151003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = manager.ui.mainCamera.transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.shakeOldPos = var_10_0.localPosition
			end

			local var_10_2 = 0.6

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / 0.066
				local var_10_4, var_10_5 = math.modf(var_10_3)

				var_10_0.localPosition = Vector3.New(var_10_5 * 0.13, var_10_5 * 0.13, var_10_5 * 0.13) + arg_7_1.var_.shakeOldPos
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 then
				var_10_0.localPosition = arg_7_1.var_.shakeOldPos
			end

			local var_10_6 = 0

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.allBtn_.enabled = false
			end

			local var_10_7 = 0.966666666666666

			if arg_7_1.time_ >= var_10_6 + var_10_7 and arg_7_1.time_ < var_10_6 + var_10_7 + arg_10_0 then
				arg_7_1.allBtn_.enabled = true
			end

			local var_10_8 = manager.ui.mainCamera.transform
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				local var_10_10 = arg_7_1.var_.effectF03daoguang1

				if not var_10_10 then
					var_10_10 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_10_10.name = "daoguang1"
					arg_7_1.var_.effectF03daoguang1 = var_10_10
				end

				local var_10_11 = var_10_8:Find("")

				if var_10_11 then
					var_10_10.transform.parent = var_10_11
				else
					var_10_10.transform.parent = var_10_8
				end

				var_10_10.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_10_10.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_10_12 = manager.ui.mainCamera.transform
			local var_10_13 = 0.866666666666666

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				local var_10_14 = arg_7_1.var_.effectF03daoguang1

				if var_10_14 then
					Object.Destroy(var_10_14)

					arg_7_1.var_.effectF03daoguang1 = nil
				end
			end

			local var_10_15 = 0
			local var_10_16 = 1

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				local var_10_17 = "play"
				local var_10_18 = "effect"

				arg_7_1:AudioAction(var_10_17, var_10_18, "se_story_16", "se_story_16_metal02", "")
			end

			local var_10_19 = "1071ui_story"

			if arg_7_1.actors_[var_10_19] == nil then
				local var_10_20 = Object.Instantiate(Asset.Load("Char/" .. var_10_19), arg_7_1.stage_.transform)

				var_10_20.name = var_10_19
				var_10_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_19] = var_10_20

				local var_10_21 = var_10_20:GetComponentInChildren(typeof(CharacterEffect))

				var_10_21.enabled = true

				local var_10_22 = GameObjectTools.GetOrAddComponent(var_10_20, typeof(DynamicBoneHelper))

				if var_10_22 then
					var_10_22:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_21.transform, false)

				arg_7_1.var_[var_10_19 .. "Animator"] = var_10_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_19 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_19 .. "LipSync"] = var_10_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			if arg_7_1.frameCnt_ <= 1 then
				arg_7_1.dialog_:SetActive(false)
			end

			local var_10_24 = 1
			local var_10_25 = 1.175

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0

				arg_7_1.dialog_:SetActive(true)

				local var_10_26 = LeanTween.value(arg_7_1.dialog_, 0, 1, 0.3)

				var_10_26:setOnUpdate(LuaHelper.FloatAction(function(arg_11_0)
					arg_7_1.dialogCg_.alpha = arg_11_0
				end))
				var_10_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_7_1.dialog_)
					var_10_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_7_1.duration_ = arg_7_1.duration_ + 0.3

				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_27 = arg_7_1:GetWordFromCfg(120151002)
				local var_10_28 = arg_7_1:FormatText(var_10_27.content)

				arg_7_1.text_.text = var_10_28

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_29 = 47
				local var_10_30 = utf8.len(var_10_28)
				local var_10_31 = var_10_29 <= 0 and var_10_25 or var_10_25 * (var_10_30 / var_10_29)

				if var_10_31 > 0 and var_10_25 < var_10_31 then
					arg_7_1.talkMaxDuration = var_10_31
					var_10_24 = var_10_24 + 0.3

					if var_10_31 + var_10_24 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_31 + var_10_24
					end
				end

				arg_7_1.text_.text = var_10_28
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_32 = var_10_24 + 0.3
			local var_10_33 = math.max(var_10_25, arg_7_1.talkMaxDuration)

			if var_10_32 <= arg_7_1.time_ and arg_7_1.time_ < var_10_32 + var_10_33 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_32) / var_10_33

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_32 + var_10_33 and arg_7_1.time_ < var_10_32 + var_10_33 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play120151003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 120151003
		arg_13_1.duration_ = 2.766

		local var_13_0 = {
			zh = 2.766,
			ja = 2.333
		}
		local var_13_1 = manager.audio:GetLocalizationFlag()

		if var_13_0[var_13_1] ~= nil then
			arg_13_1.duration_ = var_13_0[var_13_1]
		end

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play120151004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1071ui_story"].transform
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				arg_13_1.var_.moveOldPos1071ui_story = var_16_0.localPosition
			end

			local var_16_2 = 0.001

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2
				local var_16_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_16_0.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1071ui_story, var_16_4, var_16_3)

				local var_16_5 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_5.x, var_16_5.y, var_16_5.z)

				local var_16_6 = var_16_0.localEulerAngles

				var_16_6.z = 0
				var_16_6.x = 0
				var_16_0.localEulerAngles = var_16_6
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 then
				var_16_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_16_7 = manager.ui.mainCamera.transform.position - var_16_0.position

				var_16_0.forward = Vector3.New(var_16_7.x, var_16_7.y, var_16_7.z)

				local var_16_8 = var_16_0.localEulerAngles

				var_16_8.z = 0
				var_16_8.x = 0
				var_16_0.localEulerAngles = var_16_8
			end

			local var_16_9 = "10037ui_story"

			if arg_13_1.actors_[var_16_9] == nil then
				local var_16_10 = Object.Instantiate(Asset.Load("Char/" .. var_16_9), arg_13_1.stage_.transform)

				var_16_10.name = var_16_9
				var_16_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_13_1.actors_[var_16_9] = var_16_10

				local var_16_11 = var_16_10:GetComponentInChildren(typeof(CharacterEffect))

				var_16_11.enabled = true

				local var_16_12 = GameObjectTools.GetOrAddComponent(var_16_10, typeof(DynamicBoneHelper))

				if var_16_12 then
					var_16_12:EnableDynamicBone(false)
				end

				arg_13_1:ShowWeapon(var_16_11.transform, false)

				arg_13_1.var_[var_16_9 .. "Animator"] = var_16_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_13_1.var_[var_16_9 .. "Animator"].applyRootMotion = true
				arg_13_1.var_[var_16_9 .. "LipSync"] = var_16_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_16_13 = arg_13_1.actors_["10037ui_story"].transform
			local var_16_14 = 0

			if var_16_14 < arg_13_1.time_ and arg_13_1.time_ <= var_16_14 + arg_16_0 then
				arg_13_1.var_.moveOldPos10037ui_story = var_16_13.localPosition
			end

			local var_16_15 = 0.001

			if var_16_14 <= arg_13_1.time_ and arg_13_1.time_ < var_16_14 + var_16_15 then
				local var_16_16 = (arg_13_1.time_ - var_16_14) / var_16_15
				local var_16_17 = Vector3.New(0.7, -1.13, -6.2)

				var_16_13.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos10037ui_story, var_16_17, var_16_16)

				local var_16_18 = manager.ui.mainCamera.transform.position - var_16_13.position

				var_16_13.forward = Vector3.New(var_16_18.x, var_16_18.y, var_16_18.z)

				local var_16_19 = var_16_13.localEulerAngles

				var_16_19.z = 0
				var_16_19.x = 0
				var_16_13.localEulerAngles = var_16_19
			end

			if arg_13_1.time_ >= var_16_14 + var_16_15 and arg_13_1.time_ < var_16_14 + var_16_15 + arg_16_0 then
				var_16_13.localPosition = Vector3.New(0.7, -1.13, -6.2)

				local var_16_20 = manager.ui.mainCamera.transform.position - var_16_13.position

				var_16_13.forward = Vector3.New(var_16_20.x, var_16_20.y, var_16_20.z)

				local var_16_21 = var_16_13.localEulerAngles

				var_16_21.z = 0
				var_16_21.x = 0
				var_16_13.localEulerAngles = var_16_21
			end

			local var_16_22 = 0

			if var_16_22 < arg_13_1.time_ and arg_13_1.time_ <= var_16_22 + arg_16_0 then
				arg_13_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_16_23 = arg_13_1.actors_["1071ui_story"]
			local var_16_24 = 0

			if var_16_24 < arg_13_1.time_ and arg_13_1.time_ <= var_16_24 + arg_16_0 and arg_13_1.var_.characterEffect1071ui_story == nil then
				arg_13_1.var_.characterEffect1071ui_story = var_16_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_25 = 0.2

			if var_16_24 <= arg_13_1.time_ and arg_13_1.time_ < var_16_24 + var_16_25 then
				local var_16_26 = (arg_13_1.time_ - var_16_24) / var_16_25

				if arg_13_1.var_.characterEffect1071ui_story then
					arg_13_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_24 + var_16_25 and arg_13_1.time_ < var_16_24 + var_16_25 + arg_16_0 and arg_13_1.var_.characterEffect1071ui_story then
				arg_13_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_16_27 = 0

			if var_16_27 < arg_13_1.time_ and arg_13_1.time_ <= var_16_27 + arg_16_0 then
				arg_13_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_16_28 = 0

			if var_16_28 < arg_13_1.time_ and arg_13_1.time_ <= var_16_28 + arg_16_0 then
				arg_13_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action1_1")
			end

			local var_16_29 = arg_13_1.actors_["10037ui_story"]
			local var_16_30 = 0

			if var_16_30 < arg_13_1.time_ and arg_13_1.time_ <= var_16_30 + arg_16_0 and arg_13_1.var_.characterEffect10037ui_story == nil then
				arg_13_1.var_.characterEffect10037ui_story = var_16_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_31 = 0.0166666666666667

			if var_16_30 <= arg_13_1.time_ and arg_13_1.time_ < var_16_30 + var_16_31 then
				local var_16_32 = (arg_13_1.time_ - var_16_30) / var_16_31

				if arg_13_1.var_.characterEffect10037ui_story then
					local var_16_33 = Mathf.Lerp(0, 0.5, var_16_32)

					arg_13_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_13_1.var_.characterEffect10037ui_story.fillRatio = var_16_33
				end
			end

			if arg_13_1.time_ >= var_16_30 + var_16_31 and arg_13_1.time_ < var_16_30 + var_16_31 + arg_16_0 and arg_13_1.var_.characterEffect10037ui_story then
				local var_16_34 = 0.5

				arg_13_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_13_1.var_.characterEffect10037ui_story.fillRatio = var_16_34
			end

			local var_16_35 = 0
			local var_16_36 = 0.325

			if var_16_35 < arg_13_1.time_ and arg_13_1.time_ <= var_16_35 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_37 = arg_13_1:FormatText(StoryNameCfg[384].name)

				arg_13_1.leftNameTxt_.text = var_16_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_38 = arg_13_1:GetWordFromCfg(120151003)
				local var_16_39 = arg_13_1:FormatText(var_16_38.content)

				arg_13_1.text_.text = var_16_39

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_40 = 13
				local var_16_41 = utf8.len(var_16_39)
				local var_16_42 = var_16_40 <= 0 and var_16_36 or var_16_36 * (var_16_41 / var_16_40)

				if var_16_42 > 0 and var_16_36 < var_16_42 then
					arg_13_1.talkMaxDuration = var_16_42

					if var_16_42 + var_16_35 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_42 + var_16_35
					end
				end

				arg_13_1.text_.text = var_16_39
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151003", "story_v_out_120151.awb") ~= 0 then
					local var_16_43 = manager.audio:GetVoiceLength("story_v_out_120151", "120151003", "story_v_out_120151.awb") / 1000

					if var_16_43 + var_16_35 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_43 + var_16_35
					end

					if var_16_38.prefab_name ~= "" and arg_13_1.actors_[var_16_38.prefab_name] ~= nil then
						local var_16_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_38.prefab_name].transform, "story_v_out_120151", "120151003", "story_v_out_120151.awb")

						arg_13_1:RecordAudio("120151003", var_16_44)
						arg_13_1:RecordAudio("120151003", var_16_44)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_120151", "120151003", "story_v_out_120151.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_120151", "120151003", "story_v_out_120151.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_45 = math.max(var_16_36, arg_13_1.talkMaxDuration)

			if var_16_35 <= arg_13_1.time_ and arg_13_1.time_ < var_16_35 + var_16_45 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_35) / var_16_45

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_35 + var_16_45 and arg_13_1.time_ < var_16_35 + var_16_45 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play120151004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 120151004
		arg_17_1.duration_ = 5.433

		local var_17_0 = {
			zh = 2.933,
			ja = 5.433
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
				arg_17_0:Play120151005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1071ui_story"]
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 and arg_17_1.var_.characterEffect1071ui_story == nil then
				arg_17_1.var_.characterEffect1071ui_story = var_20_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_2 = 0.2

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2

				if arg_17_1.var_.characterEffect1071ui_story then
					local var_20_4 = Mathf.Lerp(0, 0.5, var_20_3)

					arg_17_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_17_1.var_.characterEffect1071ui_story.fillRatio = var_20_4
				end
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 and arg_17_1.var_.characterEffect1071ui_story then
				local var_20_5 = 0.5

				arg_17_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_17_1.var_.characterEffect1071ui_story.fillRatio = var_20_5
			end

			local var_20_6 = arg_17_1.actors_["10037ui_story"].transform
			local var_20_7 = 0

			if var_20_7 < arg_17_1.time_ and arg_17_1.time_ <= var_20_7 + arg_20_0 then
				arg_17_1.var_.moveOldPos10037ui_story = var_20_6.localPosition
			end

			local var_20_8 = 0.001

			if var_20_7 <= arg_17_1.time_ and arg_17_1.time_ < var_20_7 + var_20_8 then
				local var_20_9 = (arg_17_1.time_ - var_20_7) / var_20_8
				local var_20_10 = Vector3.New(0.7, -1.13, -6.2)

				var_20_6.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos10037ui_story, var_20_10, var_20_9)

				local var_20_11 = manager.ui.mainCamera.transform.position - var_20_6.position

				var_20_6.forward = Vector3.New(var_20_11.x, var_20_11.y, var_20_11.z)

				local var_20_12 = var_20_6.localEulerAngles

				var_20_12.z = 0
				var_20_12.x = 0
				var_20_6.localEulerAngles = var_20_12
			end

			if arg_17_1.time_ >= var_20_7 + var_20_8 and arg_17_1.time_ < var_20_7 + var_20_8 + arg_20_0 then
				var_20_6.localPosition = Vector3.New(0.7, -1.13, -6.2)

				local var_20_13 = manager.ui.mainCamera.transform.position - var_20_6.position

				var_20_6.forward = Vector3.New(var_20_13.x, var_20_13.y, var_20_13.z)

				local var_20_14 = var_20_6.localEulerAngles

				var_20_14.z = 0
				var_20_14.x = 0
				var_20_6.localEulerAngles = var_20_14
			end

			local var_20_15 = 0

			if var_20_15 < arg_17_1.time_ and arg_17_1.time_ <= var_20_15 + arg_20_0 then
				arg_17_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action3_1")
			end

			local var_20_16 = 0

			if var_20_16 < arg_17_1.time_ and arg_17_1.time_ <= var_20_16 + arg_20_0 then
				arg_17_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_20_17 = arg_17_1.actors_["10037ui_story"]
			local var_20_18 = 0

			if var_20_18 < arg_17_1.time_ and arg_17_1.time_ <= var_20_18 + arg_20_0 and arg_17_1.var_.characterEffect10037ui_story == nil then
				arg_17_1.var_.characterEffect10037ui_story = var_20_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_19 = 0.2

			if var_20_18 <= arg_17_1.time_ and arg_17_1.time_ < var_20_18 + var_20_19 then
				local var_20_20 = (arg_17_1.time_ - var_20_18) / var_20_19

				if arg_17_1.var_.characterEffect10037ui_story then
					arg_17_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_17_1.time_ >= var_20_18 + var_20_19 and arg_17_1.time_ < var_20_18 + var_20_19 + arg_20_0 and arg_17_1.var_.characterEffect10037ui_story then
				arg_17_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_20_21 = 0
			local var_20_22 = 0.325

			if var_20_21 < arg_17_1.time_ and arg_17_1.time_ <= var_20_21 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_23 = arg_17_1:FormatText(StoryNameCfg[383].name)

				arg_17_1.leftNameTxt_.text = var_20_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_24 = arg_17_1:GetWordFromCfg(120151004)
				local var_20_25 = arg_17_1:FormatText(var_20_24.content)

				arg_17_1.text_.text = var_20_25

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_26 = 13
				local var_20_27 = utf8.len(var_20_25)
				local var_20_28 = var_20_26 <= 0 and var_20_22 or var_20_22 * (var_20_27 / var_20_26)

				if var_20_28 > 0 and var_20_22 < var_20_28 then
					arg_17_1.talkMaxDuration = var_20_28

					if var_20_28 + var_20_21 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_28 + var_20_21
					end
				end

				arg_17_1.text_.text = var_20_25
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151004", "story_v_out_120151.awb") ~= 0 then
					local var_20_29 = manager.audio:GetVoiceLength("story_v_out_120151", "120151004", "story_v_out_120151.awb") / 1000

					if var_20_29 + var_20_21 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_29 + var_20_21
					end

					if var_20_24.prefab_name ~= "" and arg_17_1.actors_[var_20_24.prefab_name] ~= nil then
						local var_20_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_24.prefab_name].transform, "story_v_out_120151", "120151004", "story_v_out_120151.awb")

						arg_17_1:RecordAudio("120151004", var_20_30)
						arg_17_1:RecordAudio("120151004", var_20_30)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_120151", "120151004", "story_v_out_120151.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_120151", "120151004", "story_v_out_120151.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_31 = math.max(var_20_22, arg_17_1.talkMaxDuration)

			if var_20_21 <= arg_17_1.time_ and arg_17_1.time_ < var_20_21 + var_20_31 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_21) / var_20_31

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_21 + var_20_31 and arg_17_1.time_ < var_20_21 + var_20_31 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play120151005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 120151005
		arg_21_1.duration_ = 7.366

		local var_21_0 = {
			zh = 7.233,
			ja = 7.366
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play120151006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1071ui_story"]
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 and arg_21_1.var_.characterEffect1071ui_story == nil then
				arg_21_1.var_.characterEffect1071ui_story = var_24_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_2 = 0.2

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2

				if arg_21_1.var_.characterEffect1071ui_story then
					arg_21_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 and arg_21_1.var_.characterEffect1071ui_story then
				arg_21_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_24_4 = arg_21_1.actors_["10037ui_story"]
			local var_24_5 = 0

			if var_24_5 < arg_21_1.time_ and arg_21_1.time_ <= var_24_5 + arg_24_0 and arg_21_1.var_.characterEffect10037ui_story == nil then
				arg_21_1.var_.characterEffect10037ui_story = var_24_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_6 = 0.2

			if var_24_5 <= arg_21_1.time_ and arg_21_1.time_ < var_24_5 + var_24_6 then
				local var_24_7 = (arg_21_1.time_ - var_24_5) / var_24_6

				if arg_21_1.var_.characterEffect10037ui_story then
					local var_24_8 = Mathf.Lerp(0, 0.5, var_24_7)

					arg_21_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_21_1.var_.characterEffect10037ui_story.fillRatio = var_24_8
				end
			end

			if arg_21_1.time_ >= var_24_5 + var_24_6 and arg_21_1.time_ < var_24_5 + var_24_6 + arg_24_0 and arg_21_1.var_.characterEffect10037ui_story then
				local var_24_9 = 0.5

				arg_21_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_21_1.var_.characterEffect10037ui_story.fillRatio = var_24_9
			end

			local var_24_10 = 0
			local var_24_11 = 0.825

			if var_24_10 < arg_21_1.time_ and arg_21_1.time_ <= var_24_10 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_12 = arg_21_1:FormatText(StoryNameCfg[384].name)

				arg_21_1.leftNameTxt_.text = var_24_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_13 = arg_21_1:GetWordFromCfg(120151005)
				local var_24_14 = arg_21_1:FormatText(var_24_13.content)

				arg_21_1.text_.text = var_24_14

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_15 = 33
				local var_24_16 = utf8.len(var_24_14)
				local var_24_17 = var_24_15 <= 0 and var_24_11 or var_24_11 * (var_24_16 / var_24_15)

				if var_24_17 > 0 and var_24_11 < var_24_17 then
					arg_21_1.talkMaxDuration = var_24_17

					if var_24_17 + var_24_10 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_17 + var_24_10
					end
				end

				arg_21_1.text_.text = var_24_14
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151005", "story_v_out_120151.awb") ~= 0 then
					local var_24_18 = manager.audio:GetVoiceLength("story_v_out_120151", "120151005", "story_v_out_120151.awb") / 1000

					if var_24_18 + var_24_10 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_18 + var_24_10
					end

					if var_24_13.prefab_name ~= "" and arg_21_1.actors_[var_24_13.prefab_name] ~= nil then
						local var_24_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_13.prefab_name].transform, "story_v_out_120151", "120151005", "story_v_out_120151.awb")

						arg_21_1:RecordAudio("120151005", var_24_19)
						arg_21_1:RecordAudio("120151005", var_24_19)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_120151", "120151005", "story_v_out_120151.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_120151", "120151005", "story_v_out_120151.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_20 = math.max(var_24_11, arg_21_1.talkMaxDuration)

			if var_24_10 <= arg_21_1.time_ and arg_21_1.time_ < var_24_10 + var_24_20 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_10) / var_24_20

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_10 + var_24_20 and arg_21_1.time_ < var_24_10 + var_24_20 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play120151006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 120151006
		arg_25_1.duration_ = 2.833

		local var_25_0 = {
			zh = 1.999999999999,
			ja = 2.833
		}
		local var_25_1 = manager.audio:GetLocalizationFlag()

		if var_25_0[var_25_1] ~= nil then
			arg_25_1.duration_ = var_25_0[var_25_1]
		end

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play120151007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_28_1 = 0
			local var_28_2 = 0.125

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_3 = arg_25_1:FormatText(StoryNameCfg[384].name)

				arg_25_1.leftNameTxt_.text = var_28_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_4 = arg_25_1:GetWordFromCfg(120151006)
				local var_28_5 = arg_25_1:FormatText(var_28_4.content)

				arg_25_1.text_.text = var_28_5

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_6 = 5
				local var_28_7 = utf8.len(var_28_5)
				local var_28_8 = var_28_6 <= 0 and var_28_2 or var_28_2 * (var_28_7 / var_28_6)

				if var_28_8 > 0 and var_28_2 < var_28_8 then
					arg_25_1.talkMaxDuration = var_28_8

					if var_28_8 + var_28_1 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_1
					end
				end

				arg_25_1.text_.text = var_28_5
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151006", "story_v_out_120151.awb") ~= 0 then
					local var_28_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151006", "story_v_out_120151.awb") / 1000

					if var_28_9 + var_28_1 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_9 + var_28_1
					end

					if var_28_4.prefab_name ~= "" and arg_25_1.actors_[var_28_4.prefab_name] ~= nil then
						local var_28_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_4.prefab_name].transform, "story_v_out_120151", "120151006", "story_v_out_120151.awb")

						arg_25_1:RecordAudio("120151006", var_28_10)
						arg_25_1:RecordAudio("120151006", var_28_10)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_120151", "120151006", "story_v_out_120151.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_120151", "120151006", "story_v_out_120151.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_11 = math.max(var_28_2, arg_25_1.talkMaxDuration)

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_11 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_1) / var_28_11

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_1 + var_28_11 and arg_25_1.time_ < var_28_1 + var_28_11 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play120151007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 120151007
		arg_29_1.duration_ = 2.6

		local var_29_0 = {
			zh = 1.999999999999,
			ja = 2.6
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
				arg_29_0:Play120151008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_32_1 = arg_29_1.actors_["10037ui_story"]
			local var_32_2 = 0

			if var_32_2 < arg_29_1.time_ and arg_29_1.time_ <= var_32_2 + arg_32_0 and arg_29_1.var_.characterEffect10037ui_story == nil then
				arg_29_1.var_.characterEffect10037ui_story = var_32_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_3 = 0.2

			if var_32_2 <= arg_29_1.time_ and arg_29_1.time_ < var_32_2 + var_32_3 then
				local var_32_4 = (arg_29_1.time_ - var_32_2) / var_32_3

				if arg_29_1.var_.characterEffect10037ui_story then
					arg_29_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_2 + var_32_3 and arg_29_1.time_ < var_32_2 + var_32_3 + arg_32_0 and arg_29_1.var_.characterEffect10037ui_story then
				arg_29_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_32_5 = arg_29_1.actors_["1071ui_story"]
			local var_32_6 = 0

			if var_32_6 < arg_29_1.time_ and arg_29_1.time_ <= var_32_6 + arg_32_0 and arg_29_1.var_.characterEffect1071ui_story == nil then
				arg_29_1.var_.characterEffect1071ui_story = var_32_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_7 = 0.2

			if var_32_6 <= arg_29_1.time_ and arg_29_1.time_ < var_32_6 + var_32_7 then
				local var_32_8 = (arg_29_1.time_ - var_32_6) / var_32_7

				if arg_29_1.var_.characterEffect1071ui_story then
					local var_32_9 = Mathf.Lerp(0, 0.5, var_32_8)

					arg_29_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_29_1.var_.characterEffect1071ui_story.fillRatio = var_32_9
				end
			end

			if arg_29_1.time_ >= var_32_6 + var_32_7 and arg_29_1.time_ < var_32_6 + var_32_7 + arg_32_0 and arg_29_1.var_.characterEffect1071ui_story then
				local var_32_10 = 0.5

				arg_29_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_29_1.var_.characterEffect1071ui_story.fillRatio = var_32_10
			end

			local var_32_11 = 0
			local var_32_12 = 0.175

			if var_32_11 < arg_29_1.time_ and arg_29_1.time_ <= var_32_11 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_13 = arg_29_1:FormatText(StoryNameCfg[383].name)

				arg_29_1.leftNameTxt_.text = var_32_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_14 = arg_29_1:GetWordFromCfg(120151007)
				local var_32_15 = arg_29_1:FormatText(var_32_14.content)

				arg_29_1.text_.text = var_32_15

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_16 = 7
				local var_32_17 = utf8.len(var_32_15)
				local var_32_18 = var_32_16 <= 0 and var_32_12 or var_32_12 * (var_32_17 / var_32_16)

				if var_32_18 > 0 and var_32_12 < var_32_18 then
					arg_29_1.talkMaxDuration = var_32_18

					if var_32_18 + var_32_11 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_18 + var_32_11
					end
				end

				arg_29_1.text_.text = var_32_15
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151007", "story_v_out_120151.awb") ~= 0 then
					local var_32_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151007", "story_v_out_120151.awb") / 1000

					if var_32_19 + var_32_11 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_19 + var_32_11
					end

					if var_32_14.prefab_name ~= "" and arg_29_1.actors_[var_32_14.prefab_name] ~= nil then
						local var_32_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_14.prefab_name].transform, "story_v_out_120151", "120151007", "story_v_out_120151.awb")

						arg_29_1:RecordAudio("120151007", var_32_20)
						arg_29_1:RecordAudio("120151007", var_32_20)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_120151", "120151007", "story_v_out_120151.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_120151", "120151007", "story_v_out_120151.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_21 = math.max(var_32_12, arg_29_1.talkMaxDuration)

			if var_32_11 <= arg_29_1.time_ and arg_29_1.time_ < var_32_11 + var_32_21 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_11) / var_32_21

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_11 + var_32_21 and arg_29_1.time_ < var_32_11 + var_32_21 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play120151008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 120151008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play120151009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1071ui_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos1071ui_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(0, 100, 0)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1071ui_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0, 100, 0)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = arg_33_1.actors_["10037ui_story"].transform
			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 then
				arg_33_1.var_.moveOldPos10037ui_story = var_36_9.localPosition
			end

			local var_36_11 = 0.001

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_11 then
				local var_36_12 = (arg_33_1.time_ - var_36_10) / var_36_11
				local var_36_13 = Vector3.New(0, 100, 0)

				var_36_9.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos10037ui_story, var_36_13, var_36_12)

				local var_36_14 = manager.ui.mainCamera.transform.position - var_36_9.position

				var_36_9.forward = Vector3.New(var_36_14.x, var_36_14.y, var_36_14.z)

				local var_36_15 = var_36_9.localEulerAngles

				var_36_15.z = 0
				var_36_15.x = 0
				var_36_9.localEulerAngles = var_36_15
			end

			if arg_33_1.time_ >= var_36_10 + var_36_11 and arg_33_1.time_ < var_36_10 + var_36_11 + arg_36_0 then
				var_36_9.localPosition = Vector3.New(0, 100, 0)

				local var_36_16 = manager.ui.mainCamera.transform.position - var_36_9.position

				var_36_9.forward = Vector3.New(var_36_16.x, var_36_16.y, var_36_16.z)

				local var_36_17 = var_36_9.localEulerAngles

				var_36_17.z = 0
				var_36_17.x = 0
				var_36_9.localEulerAngles = var_36_17
			end

			local var_36_18 = 0
			local var_36_19 = 0.825

			if var_36_18 < arg_33_1.time_ and arg_33_1.time_ <= var_36_18 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_20 = arg_33_1:GetWordFromCfg(120151008)
				local var_36_21 = arg_33_1:FormatText(var_36_20.content)

				arg_33_1.text_.text = var_36_21

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_22 = 33
				local var_36_23 = utf8.len(var_36_21)
				local var_36_24 = var_36_22 <= 0 and var_36_19 or var_36_19 * (var_36_23 / var_36_22)

				if var_36_24 > 0 and var_36_19 < var_36_24 then
					arg_33_1.talkMaxDuration = var_36_24

					if var_36_24 + var_36_18 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_24 + var_36_18
					end
				end

				arg_33_1.text_.text = var_36_21
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_25 = math.max(var_36_19, arg_33_1.talkMaxDuration)

			if var_36_18 <= arg_33_1.time_ and arg_33_1.time_ < var_36_18 + var_36_25 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_18) / var_36_25

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_18 + var_36_25 and arg_33_1.time_ < var_36_18 + var_36_25 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play120151009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 120151009
		arg_37_1.duration_ = 3.033

		local var_37_0 = {
			zh = 1.999999999999,
			ja = 3.033
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play120151010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1071ui_story"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1071ui_story = var_40_0.localPosition
			end

			local var_40_2 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2
				local var_40_4 = Vector3.New(0, -1.05, -6.2)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1071ui_story, var_40_4, var_40_3)

				local var_40_5 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_5.x, var_40_5.y, var_40_5.z)

				local var_40_6 = var_40_0.localEulerAngles

				var_40_6.z = 0
				var_40_6.x = 0
				var_40_0.localEulerAngles = var_40_6
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_40_7 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_7.x, var_40_7.y, var_40_7.z)

				local var_40_8 = var_40_0.localEulerAngles

				var_40_8.z = 0
				var_40_8.x = 0
				var_40_0.localEulerAngles = var_40_8
			end

			local var_40_9 = 0

			if var_40_9 < arg_37_1.time_ and arg_37_1.time_ <= var_40_9 + arg_40_0 then
				arg_37_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 then
				arg_37_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_40_11 = arg_37_1.actors_["1071ui_story"]
			local var_40_12 = 0

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 and arg_37_1.var_.characterEffect1071ui_story == nil then
				arg_37_1.var_.characterEffect1071ui_story = var_40_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_13 = 0.2

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_13 then
				local var_40_14 = (arg_37_1.time_ - var_40_12) / var_40_13

				if arg_37_1.var_.characterEffect1071ui_story then
					arg_37_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_12 + var_40_13 and arg_37_1.time_ < var_40_12 + var_40_13 + arg_40_0 and arg_37_1.var_.characterEffect1071ui_story then
				arg_37_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_40_15 = 0
			local var_40_16 = 0.15

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_17 = arg_37_1:FormatText(StoryNameCfg[384].name)

				arg_37_1.leftNameTxt_.text = var_40_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_18 = arg_37_1:GetWordFromCfg(120151009)
				local var_40_19 = arg_37_1:FormatText(var_40_18.content)

				arg_37_1.text_.text = var_40_19

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_20 = 6
				local var_40_21 = utf8.len(var_40_19)
				local var_40_22 = var_40_20 <= 0 and var_40_16 or var_40_16 * (var_40_21 / var_40_20)

				if var_40_22 > 0 and var_40_16 < var_40_22 then
					arg_37_1.talkMaxDuration = var_40_22

					if var_40_22 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_22 + var_40_15
					end
				end

				arg_37_1.text_.text = var_40_19
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151009", "story_v_out_120151.awb") ~= 0 then
					local var_40_23 = manager.audio:GetVoiceLength("story_v_out_120151", "120151009", "story_v_out_120151.awb") / 1000

					if var_40_23 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_23 + var_40_15
					end

					if var_40_18.prefab_name ~= "" and arg_37_1.actors_[var_40_18.prefab_name] ~= nil then
						local var_40_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_18.prefab_name].transform, "story_v_out_120151", "120151009", "story_v_out_120151.awb")

						arg_37_1:RecordAudio("120151009", var_40_24)
						arg_37_1:RecordAudio("120151009", var_40_24)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_120151", "120151009", "story_v_out_120151.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_120151", "120151009", "story_v_out_120151.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_25 = math.max(var_40_16, arg_37_1.talkMaxDuration)

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_25 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_15) / var_40_25

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_15 + var_40_25 and arg_37_1.time_ < var_40_15 + var_40_25 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play120151010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 120151010
		arg_41_1.duration_ = 7.666

		local var_41_0 = {
			zh = 4.1,
			ja = 7.666
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
				arg_41_0:Play120151011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_44_1 = 0
			local var_44_2 = 0.575

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_3 = arg_41_1:FormatText(StoryNameCfg[384].name)

				arg_41_1.leftNameTxt_.text = var_44_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_4 = arg_41_1:GetWordFromCfg(120151010)
				local var_44_5 = arg_41_1:FormatText(var_44_4.content)

				arg_41_1.text_.text = var_44_5

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_6 = 23
				local var_44_7 = utf8.len(var_44_5)
				local var_44_8 = var_44_6 <= 0 and var_44_2 or var_44_2 * (var_44_7 / var_44_6)

				if var_44_8 > 0 and var_44_2 < var_44_8 then
					arg_41_1.talkMaxDuration = var_44_8

					if var_44_8 + var_44_1 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_1
					end
				end

				arg_41_1.text_.text = var_44_5
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151010", "story_v_out_120151.awb") ~= 0 then
					local var_44_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151010", "story_v_out_120151.awb") / 1000

					if var_44_9 + var_44_1 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_9 + var_44_1
					end

					if var_44_4.prefab_name ~= "" and arg_41_1.actors_[var_44_4.prefab_name] ~= nil then
						local var_44_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_4.prefab_name].transform, "story_v_out_120151", "120151010", "story_v_out_120151.awb")

						arg_41_1:RecordAudio("120151010", var_44_10)
						arg_41_1:RecordAudio("120151010", var_44_10)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_120151", "120151010", "story_v_out_120151.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_120151", "120151010", "story_v_out_120151.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_11 = math.max(var_44_2, arg_41_1.talkMaxDuration)

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_11 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_1) / var_44_11

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_1 + var_44_11 and arg_41_1.time_ < var_44_1 + var_44_11 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play120151011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 120151011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play120151012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1071ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1071ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, 100, 0)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1071ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, 100, 0)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = 0
			local var_48_10 = 1.075

			if var_48_9 < arg_45_1.time_ and arg_45_1.time_ <= var_48_9 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_11 = arg_45_1:GetWordFromCfg(120151011)
				local var_48_12 = arg_45_1:FormatText(var_48_11.content)

				arg_45_1.text_.text = var_48_12

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_13 = 43
				local var_48_14 = utf8.len(var_48_12)
				local var_48_15 = var_48_13 <= 0 and var_48_10 or var_48_10 * (var_48_14 / var_48_13)

				if var_48_15 > 0 and var_48_10 < var_48_15 then
					arg_45_1.talkMaxDuration = var_48_15

					if var_48_15 + var_48_9 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_15 + var_48_9
					end
				end

				arg_45_1.text_.text = var_48_12
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_16 = math.max(var_48_10, arg_45_1.talkMaxDuration)

			if var_48_9 <= arg_45_1.time_ and arg_45_1.time_ < var_48_9 + var_48_16 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_9) / var_48_16

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_9 + var_48_16 and arg_45_1.time_ < var_48_9 + var_48_16 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play120151012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 120151012
		arg_49_1.duration_ = 2.066

		local var_49_0 = {
			zh = 1.4,
			ja = 2.066
		}
		local var_49_1 = manager.audio:GetLocalizationFlag()

		if var_49_0[var_49_1] ~= nil then
			arg_49_1.duration_ = var_49_0[var_49_1]
		end

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play120151013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 0.075

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_2 = arg_49_1:FormatText(StoryNameCfg[384].name)

				arg_49_1.leftNameTxt_.text = var_52_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, true)
				arg_49_1.iconController_:SetSelectedState("hero")

				arg_49_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_3 = arg_49_1:GetWordFromCfg(120151012)
				local var_52_4 = arg_49_1:FormatText(var_52_3.content)

				arg_49_1.text_.text = var_52_4

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_5 = 3
				local var_52_6 = utf8.len(var_52_4)
				local var_52_7 = var_52_5 <= 0 and var_52_1 or var_52_1 * (var_52_6 / var_52_5)

				if var_52_7 > 0 and var_52_1 < var_52_7 then
					arg_49_1.talkMaxDuration = var_52_7

					if var_52_7 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_7 + var_52_0
					end
				end

				arg_49_1.text_.text = var_52_4
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151012", "story_v_out_120151.awb") ~= 0 then
					local var_52_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151012", "story_v_out_120151.awb") / 1000

					if var_52_8 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_8 + var_52_0
					end

					if var_52_3.prefab_name ~= "" and arg_49_1.actors_[var_52_3.prefab_name] ~= nil then
						local var_52_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_3.prefab_name].transform, "story_v_out_120151", "120151012", "story_v_out_120151.awb")

						arg_49_1:RecordAudio("120151012", var_52_9)
						arg_49_1:RecordAudio("120151012", var_52_9)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_120151", "120151012", "story_v_out_120151.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_120151", "120151012", "story_v_out_120151.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_10 = math.max(var_52_1, arg_49_1.talkMaxDuration)

			if var_52_0 <= arg_49_1.time_ and arg_49_1.time_ < var_52_0 + var_52_10 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_0) / var_52_10

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_0 + var_52_10 and arg_49_1.time_ < var_52_0 + var_52_10 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play120151013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 120151013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play120151014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 1.1

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_2 = arg_53_1:GetWordFromCfg(120151013)
				local var_56_3 = arg_53_1:FormatText(var_56_2.content)

				arg_53_1.text_.text = var_56_3

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_4 = 44
				local var_56_5 = utf8.len(var_56_3)
				local var_56_6 = var_56_4 <= 0 and var_56_1 or var_56_1 * (var_56_5 / var_56_4)

				if var_56_6 > 0 and var_56_1 < var_56_6 then
					arg_53_1.talkMaxDuration = var_56_6

					if var_56_6 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_6 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_3
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_7 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_7 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_7

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_7 and arg_53_1.time_ < var_56_0 + var_56_7 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play120151014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 120151014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play120151015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 1

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_2 = arg_57_1:GetWordFromCfg(120151014)
				local var_60_3 = arg_57_1:FormatText(var_60_2.content)

				arg_57_1.text_.text = var_60_3

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_4 = 40
				local var_60_5 = utf8.len(var_60_3)
				local var_60_6 = var_60_4 <= 0 and var_60_1 or var_60_1 * (var_60_5 / var_60_4)

				if var_60_6 > 0 and var_60_1 < var_60_6 then
					arg_57_1.talkMaxDuration = var_60_6

					if var_60_6 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_6 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_3
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_7 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_7 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_7

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_7 and arg_57_1.time_ < var_60_0 + var_60_7 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play120151015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 120151015
		arg_61_1.duration_ = 8.999999999999

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play120151016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "ST46"

			if arg_61_1.bgs_[var_64_0] == nil then
				local var_64_1 = Object.Instantiate(arg_61_1.paintGo_)

				var_64_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_64_0)
				var_64_1.name = var_64_0
				var_64_1.transform.parent = arg_61_1.stage_.transform
				var_64_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.bgs_[var_64_0] = var_64_1
			end

			local var_64_2 = 1.999999999999

			if var_64_2 < arg_61_1.time_ and arg_61_1.time_ <= var_64_2 + arg_64_0 then
				local var_64_3 = manager.ui.mainCamera.transform.localPosition
				local var_64_4 = Vector3.New(0, 0, 10) + Vector3.New(var_64_3.x, var_64_3.y, 0)
				local var_64_5 = arg_61_1.bgs_.ST46

				var_64_5.transform.localPosition = var_64_4
				var_64_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_6 = var_64_5:GetComponent("SpriteRenderer")

				if var_64_6 and var_64_6.sprite then
					local var_64_7 = (var_64_5.transform.localPosition - var_64_3).z
					local var_64_8 = manager.ui.mainCameraCom_
					local var_64_9 = 2 * var_64_7 * Mathf.Tan(var_64_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_10 = var_64_9 * var_64_8.aspect
					local var_64_11 = var_64_6.sprite.bounds.size.x
					local var_64_12 = var_64_6.sprite.bounds.size.y
					local var_64_13 = var_64_10 / var_64_11
					local var_64_14 = var_64_9 / var_64_12
					local var_64_15 = var_64_14 < var_64_13 and var_64_13 or var_64_14

					var_64_5.transform.localScale = Vector3.New(var_64_15, var_64_15, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "ST46" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_16 = 0

			if var_64_16 < arg_61_1.time_ and arg_61_1.time_ <= var_64_16 + arg_64_0 then
				arg_61_1.mask_.enabled = true
				arg_61_1.mask_.raycastTarget = true

				arg_61_1:SetGaussion(false)
			end

			local var_64_17 = 2

			if var_64_16 <= arg_61_1.time_ and arg_61_1.time_ < var_64_16 + var_64_17 then
				local var_64_18 = (arg_61_1.time_ - var_64_16) / var_64_17
				local var_64_19 = Color.New(0, 0, 0)

				var_64_19.a = Mathf.Lerp(0, 1, var_64_18)
				arg_61_1.mask_.color = var_64_19
			end

			if arg_61_1.time_ >= var_64_16 + var_64_17 and arg_61_1.time_ < var_64_16 + var_64_17 + arg_64_0 then
				local var_64_20 = Color.New(0, 0, 0)

				var_64_20.a = 1
				arg_61_1.mask_.color = var_64_20
			end

			local var_64_21 = 2

			if var_64_21 < arg_61_1.time_ and arg_61_1.time_ <= var_64_21 + arg_64_0 then
				arg_61_1.mask_.enabled = true
				arg_61_1.mask_.raycastTarget = true

				arg_61_1:SetGaussion(false)
			end

			local var_64_22 = 2

			if var_64_21 <= arg_61_1.time_ and arg_61_1.time_ < var_64_21 + var_64_22 then
				local var_64_23 = (arg_61_1.time_ - var_64_21) / var_64_22
				local var_64_24 = Color.New(0, 0, 0)

				var_64_24.a = Mathf.Lerp(1, 0, var_64_23)
				arg_61_1.mask_.color = var_64_24
			end

			if arg_61_1.time_ >= var_64_21 + var_64_22 and arg_61_1.time_ < var_64_21 + var_64_22 + arg_64_0 then
				local var_64_25 = Color.New(0, 0, 0)
				local var_64_26 = 0

				arg_61_1.mask_.enabled = false
				var_64_25.a = var_64_26
				arg_61_1.mask_.color = var_64_25
			end

			local var_64_27 = 3.999999999999

			if var_64_27 < arg_61_1.time_ and arg_61_1.time_ <= var_64_27 + arg_64_0 then
				arg_61_1.allBtn_.enabled = false
			end

			local var_64_28 = 1

			if arg_61_1.time_ >= var_64_27 + var_64_28 and arg_61_1.time_ < var_64_27 + var_64_28 + arg_64_0 then
				arg_61_1.allBtn_.enabled = true
			end

			local var_64_29 = arg_61_1.bgs_.ST46.transform
			local var_64_30 = 2

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.var_.moveOldPosST46 = var_64_29.localPosition
			end

			local var_64_31 = 3.5

			if var_64_30 <= arg_61_1.time_ and arg_61_1.time_ < var_64_30 + var_64_31 then
				local var_64_32 = (arg_61_1.time_ - var_64_30) / var_64_31
				local var_64_33 = Vector3.New(0, 1, 9.5)

				var_64_29.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPosST46, var_64_33, var_64_32)
			end

			if arg_61_1.time_ >= var_64_30 + var_64_31 and arg_61_1.time_ < var_64_30 + var_64_31 + arg_64_0 then
				var_64_29.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_64_34 = 4

			if var_64_34 < arg_61_1.time_ and arg_61_1.time_ <= var_64_34 + arg_64_0 then
				arg_61_1.allBtn_.enabled = false
			end

			local var_64_35 = 1.5

			if arg_61_1.time_ >= var_64_34 + var_64_35 and arg_61_1.time_ < var_64_34 + var_64_35 + arg_64_0 then
				arg_61_1.allBtn_.enabled = true
			end

			if arg_61_1.frameCnt_ <= 1 then
				arg_61_1.dialog_:SetActive(false)
			end

			local var_64_36 = 3.999999999999
			local var_64_37 = 1

			if var_64_36 < arg_61_1.time_ and arg_61_1.time_ <= var_64_36 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_38 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_38:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_39 = arg_61_1:GetWordFromCfg(120151015)
				local var_64_40 = arg_61_1:FormatText(var_64_39.content)

				arg_61_1.text_.text = var_64_40

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_41 = 40
				local var_64_42 = utf8.len(var_64_40)
				local var_64_43 = var_64_41 <= 0 and var_64_37 or var_64_37 * (var_64_42 / var_64_41)

				if var_64_43 > 0 and var_64_37 < var_64_43 then
					arg_61_1.talkMaxDuration = var_64_43
					var_64_36 = var_64_36 + 0.3

					if var_64_43 + var_64_36 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_43 + var_64_36
					end
				end

				arg_61_1.text_.text = var_64_40
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_44 = var_64_36 + 0.3
			local var_64_45 = math.max(var_64_37, arg_61_1.talkMaxDuration)

			if var_64_44 <= arg_61_1.time_ and arg_61_1.time_ < var_64_44 + var_64_45 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_44) / var_64_45

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_44 + var_64_45 and arg_61_1.time_ < var_64_44 + var_64_45 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play120151016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 120151016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play120151017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1.275

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

				local var_70_2 = arg_67_1:GetWordFromCfg(120151016)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 51
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
	Play120151017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 120151017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play120151018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.5

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(120151017)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 60
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play120151018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 120151018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play120151019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.2

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(120151018)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 48
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play120151019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 120151019
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play120151020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = manager.ui.mainCamera.transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.shakeOldPos = var_82_0.localPosition
			end

			local var_82_2 = 1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / 0.066
				local var_82_4, var_82_5 = math.modf(var_82_3)

				var_82_0.localPosition = Vector3.New(var_82_5 * 0.13, var_82_5 * 0.13, var_82_5 * 0.13) + arg_79_1.var_.shakeOldPos
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = arg_79_1.var_.shakeOldPos
			end

			local var_82_6 = 0

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.allBtn_.enabled = false
			end

			local var_82_7 = 1

			if arg_79_1.time_ >= var_82_6 + var_82_7 and arg_79_1.time_ < var_82_6 + var_82_7 + arg_82_0 then
				arg_79_1.allBtn_.enabled = true
			end

			local var_82_8 = 0
			local var_82_9 = 1

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 then
				local var_82_10 = "play"
				local var_82_11 = "effect"

				arg_79_1:AudioAction(var_82_10, var_82_11, "se_story_120_00", "se_story_120_00_jianbing_move", "")
			end

			local var_82_12 = 0
			local var_82_13 = 0.05

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_14 = arg_79_1:GetWordFromCfg(120151019)
				local var_82_15 = arg_79_1:FormatText(var_82_14.content)

				arg_79_1.text_.text = var_82_15

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_16 = 2
				local var_82_17 = utf8.len(var_82_15)
				local var_82_18 = var_82_16 <= 0 and var_82_13 or var_82_13 * (var_82_17 / var_82_16)

				if var_82_18 > 0 and var_82_13 < var_82_18 then
					arg_79_1.talkMaxDuration = var_82_18

					if var_82_18 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_18 + var_82_12
					end
				end

				arg_79_1.text_.text = var_82_15
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_19 = math.max(var_82_13, arg_79_1.talkMaxDuration)

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_19 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_12) / var_82_19

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_12 + var_82_19 and arg_79_1.time_ < var_82_12 + var_82_19 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play120151020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 120151020
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play120151021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 1.2

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_2 = arg_83_1:GetWordFromCfg(120151020)
				local var_86_3 = arg_83_1:FormatText(var_86_2.content)

				arg_83_1.text_.text = var_86_3

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_4 = 48
				local var_86_5 = utf8.len(var_86_3)
				local var_86_6 = var_86_4 <= 0 and var_86_1 or var_86_1 * (var_86_5 / var_86_4)

				if var_86_6 > 0 and var_86_1 < var_86_6 then
					arg_83_1.talkMaxDuration = var_86_6

					if var_86_6 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_6 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_3
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_7 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_7 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_7

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_7 and arg_83_1.time_ < var_86_0 + var_86_7 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play120151021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 120151021
		arg_87_1.duration_ = 3.1

		local var_87_0 = {
			zh = 1.8,
			ja = 3.1
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
				arg_87_0:Play120151022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.15

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[384].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(120151021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151021", "story_v_out_120151.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151021", "story_v_out_120151.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_120151", "120151021", "story_v_out_120151.awb")

						arg_87_1:RecordAudio("120151021", var_90_9)
						arg_87_1:RecordAudio("120151021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_120151", "120151021", "story_v_out_120151.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_120151", "120151021", "story_v_out_120151.awb")
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
	Play120151022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 120151022
		arg_91_1.duration_ = 1.266

		local var_91_0 = {
			zh = 1.066,
			ja = 1.266
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
				arg_91_0:Play120151023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.075

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[378].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(120151022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151022", "story_v_out_120151.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151022", "story_v_out_120151.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_120151", "120151022", "story_v_out_120151.awb")

						arg_91_1:RecordAudio("120151022", var_94_9)
						arg_91_1:RecordAudio("120151022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_120151", "120151022", "story_v_out_120151.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_120151", "120151022", "story_v_out_120151.awb")
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
	Play120151023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 120151023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play120151024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.675

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_2 = arg_95_1:GetWordFromCfg(120151023)
				local var_98_3 = arg_95_1:FormatText(var_98_2.content)

				arg_95_1.text_.text = var_98_3

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_4 = 27
				local var_98_5 = utf8.len(var_98_3)
				local var_98_6 = var_98_4 <= 0 and var_98_1 or var_98_1 * (var_98_5 / var_98_4)

				if var_98_6 > 0 and var_98_1 < var_98_6 then
					arg_95_1.talkMaxDuration = var_98_6

					if var_98_6 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_6 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_3
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_7 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_7 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_7

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_7 and arg_95_1.time_ < var_98_0 + var_98_7 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play120151024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 120151024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play120151025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_102_1 = 0
			local var_102_2 = 1.025

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(120151024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 41
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_2 or var_102_2 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_2 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_1 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_1
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_8 = math.max(var_102_2, arg_99_1.talkMaxDuration)

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_8 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_1) / var_102_8

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_1 + var_102_8 and arg_99_1.time_ < var_102_1 + var_102_8 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play120151025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 120151025
		arg_103_1.duration_ = 3.2

		local var_103_0 = {
			zh = 2.466666666666,
			ja = 3.2
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
				arg_103_0:Play120151026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1071ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1071ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0.7, -1.05, -6.2)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1071ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = 0

			if var_106_9 < arg_103_1.time_ and arg_103_1.time_ <= var_106_9 + arg_106_0 then
				arg_103_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_106_10 = arg_103_1.actors_["1071ui_story"]
			local var_106_11 = 0

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1071ui_story == nil then
				arg_103_1.var_.characterEffect1071ui_story = var_106_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_12 = 0.2

			if var_106_11 <= arg_103_1.time_ and arg_103_1.time_ < var_106_11 + var_106_12 then
				local var_106_13 = (arg_103_1.time_ - var_106_11) / var_106_12

				if arg_103_1.var_.characterEffect1071ui_story then
					local var_106_14 = Mathf.Lerp(0, 0.5, var_106_13)

					arg_103_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1071ui_story.fillRatio = var_106_14
				end
			end

			if arg_103_1.time_ >= var_106_11 + var_106_12 and arg_103_1.time_ < var_106_11 + var_106_12 + arg_106_0 and arg_103_1.var_.characterEffect1071ui_story then
				local var_106_15 = 0.5

				arg_103_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1071ui_story.fillRatio = var_106_15
			end

			local var_106_16 = "1069ui_story"

			if arg_103_1.actors_[var_106_16] == nil then
				local var_106_17 = Object.Instantiate(Asset.Load("Char/" .. var_106_16), arg_103_1.stage_.transform)

				var_106_17.name = var_106_16
				var_106_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_103_1.actors_[var_106_16] = var_106_17

				local var_106_18 = var_106_17:GetComponentInChildren(typeof(CharacterEffect))

				var_106_18.enabled = true

				local var_106_19 = GameObjectTools.GetOrAddComponent(var_106_17, typeof(DynamicBoneHelper))

				if var_106_19 then
					var_106_19:EnableDynamicBone(false)
				end

				arg_103_1:ShowWeapon(var_106_18.transform, false)

				arg_103_1.var_[var_106_16 .. "Animator"] = var_106_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_103_1.var_[var_106_16 .. "Animator"].applyRootMotion = true
				arg_103_1.var_[var_106_16 .. "LipSync"] = var_106_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_106_20 = arg_103_1.actors_["1069ui_story"].transform
			local var_106_21 = 0

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				arg_103_1.var_.moveOldPos1069ui_story = var_106_20.localPosition
			end

			local var_106_22 = 0.001

			if var_106_21 <= arg_103_1.time_ and arg_103_1.time_ < var_106_21 + var_106_22 then
				local var_106_23 = (arg_103_1.time_ - var_106_21) / var_106_22
				local var_106_24 = Vector3.New(-0.7, -1, -6)

				var_106_20.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1069ui_story, var_106_24, var_106_23)

				local var_106_25 = manager.ui.mainCamera.transform.position - var_106_20.position

				var_106_20.forward = Vector3.New(var_106_25.x, var_106_25.y, var_106_25.z)

				local var_106_26 = var_106_20.localEulerAngles

				var_106_26.z = 0
				var_106_26.x = 0
				var_106_20.localEulerAngles = var_106_26
			end

			if arg_103_1.time_ >= var_106_21 + var_106_22 and arg_103_1.time_ < var_106_21 + var_106_22 + arg_106_0 then
				var_106_20.localPosition = Vector3.New(-0.7, -1, -6)

				local var_106_27 = manager.ui.mainCamera.transform.position - var_106_20.position

				var_106_20.forward = Vector3.New(var_106_27.x, var_106_27.y, var_106_27.z)

				local var_106_28 = var_106_20.localEulerAngles

				var_106_28.z = 0
				var_106_28.x = 0
				var_106_20.localEulerAngles = var_106_28
			end

			local var_106_29 = 0

			if var_106_29 < arg_103_1.time_ and arg_103_1.time_ <= var_106_29 + arg_106_0 then
				arg_103_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/1032/1032action/1032action1_1")
			end

			local var_106_30 = 0

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_106_31 = arg_103_1.actors_["1069ui_story"]
			local var_106_32 = 0

			if var_106_32 < arg_103_1.time_ and arg_103_1.time_ <= var_106_32 + arg_106_0 and arg_103_1.var_.characterEffect1069ui_story == nil then
				arg_103_1.var_.characterEffect1069ui_story = var_106_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_33 = 0.2

			if var_106_32 <= arg_103_1.time_ and arg_103_1.time_ < var_106_32 + var_106_33 then
				local var_106_34 = (arg_103_1.time_ - var_106_32) / var_106_33

				if arg_103_1.var_.characterEffect1069ui_story then
					arg_103_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_32 + var_106_33 and arg_103_1.time_ < var_106_32 + var_106_33 + arg_106_0 and arg_103_1.var_.characterEffect1069ui_story then
				arg_103_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_106_35 = 0
			local var_106_36 = 0.1

			if var_106_35 < arg_103_1.time_ and arg_103_1.time_ <= var_106_35 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_37 = arg_103_1:FormatText(StoryNameCfg[378].name)

				arg_103_1.leftNameTxt_.text = var_106_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_38 = arg_103_1:GetWordFromCfg(120151025)
				local var_106_39 = arg_103_1:FormatText(var_106_38.content)

				arg_103_1.text_.text = var_106_39

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_40 = 4
				local var_106_41 = utf8.len(var_106_39)
				local var_106_42 = var_106_40 <= 0 and var_106_36 or var_106_36 * (var_106_41 / var_106_40)

				if var_106_42 > 0 and var_106_36 < var_106_42 then
					arg_103_1.talkMaxDuration = var_106_42

					if var_106_42 + var_106_35 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_42 + var_106_35
					end
				end

				arg_103_1.text_.text = var_106_39
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151025", "story_v_out_120151.awb") ~= 0 then
					local var_106_43 = manager.audio:GetVoiceLength("story_v_out_120151", "120151025", "story_v_out_120151.awb") / 1000

					if var_106_43 + var_106_35 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_43 + var_106_35
					end

					if var_106_38.prefab_name ~= "" and arg_103_1.actors_[var_106_38.prefab_name] ~= nil then
						local var_106_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_38.prefab_name].transform, "story_v_out_120151", "120151025", "story_v_out_120151.awb")

						arg_103_1:RecordAudio("120151025", var_106_44)
						arg_103_1:RecordAudio("120151025", var_106_44)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_120151", "120151025", "story_v_out_120151.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_120151", "120151025", "story_v_out_120151.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_45 = math.max(var_106_36, arg_103_1.talkMaxDuration)

			if var_106_35 <= arg_103_1.time_ and arg_103_1.time_ < var_106_35 + var_106_45 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_35) / var_106_45

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_35 + var_106_45 and arg_103_1.time_ < var_106_35 + var_106_45 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play120151026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 120151026
		arg_107_1.duration_ = 4.333

		local var_107_0 = {
			zh = 4.333,
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
				arg_107_0:Play120151027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1069ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1069ui_story == nil then
				arg_107_1.var_.characterEffect1069ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1069ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1069ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1069ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1069ui_story.fillRatio = var_110_5
			end

			local var_110_6 = arg_107_1.actors_["1071ui_story"]
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 and arg_107_1.var_.characterEffect1071ui_story == nil then
				arg_107_1.var_.characterEffect1071ui_story = var_110_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_8 = 0.2

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8

				if arg_107_1.var_.characterEffect1071ui_story then
					arg_107_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 and arg_107_1.var_.characterEffect1071ui_story then
				arg_107_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_110_11 = 0
			local var_110_12 = 0.3

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_13 = arg_107_1:FormatText(StoryNameCfg[384].name)

				arg_107_1.leftNameTxt_.text = var_110_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_14 = arg_107_1:GetWordFromCfg(120151026)
				local var_110_15 = arg_107_1:FormatText(var_110_14.content)

				arg_107_1.text_.text = var_110_15

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_16 = 12
				local var_110_17 = utf8.len(var_110_15)
				local var_110_18 = var_110_16 <= 0 and var_110_12 or var_110_12 * (var_110_17 / var_110_16)

				if var_110_18 > 0 and var_110_12 < var_110_18 then
					arg_107_1.talkMaxDuration = var_110_18

					if var_110_18 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_18 + var_110_11
					end
				end

				arg_107_1.text_.text = var_110_15
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151026", "story_v_out_120151.awb") ~= 0 then
					local var_110_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151026", "story_v_out_120151.awb") / 1000

					if var_110_19 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_11
					end

					if var_110_14.prefab_name ~= "" and arg_107_1.actors_[var_110_14.prefab_name] ~= nil then
						local var_110_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_14.prefab_name].transform, "story_v_out_120151", "120151026", "story_v_out_120151.awb")

						arg_107_1:RecordAudio("120151026", var_110_20)
						arg_107_1:RecordAudio("120151026", var_110_20)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_120151", "120151026", "story_v_out_120151.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_120151", "120151026", "story_v_out_120151.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_21 = math.max(var_110_12, arg_107_1.talkMaxDuration)

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_21 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_11) / var_110_21

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_11 + var_110_21 and arg_107_1.time_ < var_110_11 + var_110_21 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play120151027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120151027
		arg_111_1.duration_ = 9.466

		local var_111_0 = {
			zh = 6.566,
			ja = 9.466
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
				arg_111_0:Play120151028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_114_2 = 0
			local var_114_3 = 0.675

			if var_114_2 < arg_111_1.time_ and arg_111_1.time_ <= var_114_2 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_4 = arg_111_1:FormatText(StoryNameCfg[384].name)

				arg_111_1.leftNameTxt_.text = var_114_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_5 = arg_111_1:GetWordFromCfg(120151027)
				local var_114_6 = arg_111_1:FormatText(var_114_5.content)

				arg_111_1.text_.text = var_114_6

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_7 = 27
				local var_114_8 = utf8.len(var_114_6)
				local var_114_9 = var_114_7 <= 0 and var_114_3 or var_114_3 * (var_114_8 / var_114_7)

				if var_114_9 > 0 and var_114_3 < var_114_9 then
					arg_111_1.talkMaxDuration = var_114_9

					if var_114_9 + var_114_2 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_9 + var_114_2
					end
				end

				arg_111_1.text_.text = var_114_6
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151027", "story_v_out_120151.awb") ~= 0 then
					local var_114_10 = manager.audio:GetVoiceLength("story_v_out_120151", "120151027", "story_v_out_120151.awb") / 1000

					if var_114_10 + var_114_2 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_10 + var_114_2
					end

					if var_114_5.prefab_name ~= "" and arg_111_1.actors_[var_114_5.prefab_name] ~= nil then
						local var_114_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_5.prefab_name].transform, "story_v_out_120151", "120151027", "story_v_out_120151.awb")

						arg_111_1:RecordAudio("120151027", var_114_11)
						arg_111_1:RecordAudio("120151027", var_114_11)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_120151", "120151027", "story_v_out_120151.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_120151", "120151027", "story_v_out_120151.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_12 = math.max(var_114_3, arg_111_1.talkMaxDuration)

			if var_114_2 <= arg_111_1.time_ and arg_111_1.time_ < var_114_2 + var_114_12 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_2) / var_114_12

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_2 + var_114_12 and arg_111_1.time_ < var_114_2 + var_114_12 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play120151028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120151028
		arg_115_1.duration_ = 2.733

		local var_115_0 = {
			zh = 2.333,
			ja = 2.733
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
				arg_115_0:Play120151029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_118_1 = arg_115_1.actors_["1069ui_story"]
			local var_118_2 = 0

			if var_118_2 < arg_115_1.time_ and arg_115_1.time_ <= var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1069ui_story == nil then
				arg_115_1.var_.characterEffect1069ui_story = var_118_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_3 = 0.2

			if var_118_2 <= arg_115_1.time_ and arg_115_1.time_ < var_118_2 + var_118_3 then
				local var_118_4 = (arg_115_1.time_ - var_118_2) / var_118_3

				if arg_115_1.var_.characterEffect1069ui_story then
					arg_115_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_2 + var_118_3 and arg_115_1.time_ < var_118_2 + var_118_3 + arg_118_0 and arg_115_1.var_.characterEffect1069ui_story then
				arg_115_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_118_5 = arg_115_1.actors_["1071ui_story"]
			local var_118_6 = 0

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect1071ui_story == nil then
				arg_115_1.var_.characterEffect1071ui_story = var_118_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_7 = 0.2

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_7 then
				local var_118_8 = (arg_115_1.time_ - var_118_6) / var_118_7

				if arg_115_1.var_.characterEffect1071ui_story then
					local var_118_9 = Mathf.Lerp(0, 0.5, var_118_8)

					arg_115_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1071ui_story.fillRatio = var_118_9
				end
			end

			if arg_115_1.time_ >= var_118_6 + var_118_7 and arg_115_1.time_ < var_118_6 + var_118_7 + arg_118_0 and arg_115_1.var_.characterEffect1071ui_story then
				local var_118_10 = 0.5

				arg_115_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1071ui_story.fillRatio = var_118_10
			end

			local var_118_11 = 0

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_118_12 = 0
			local var_118_13 = 0.25

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_14 = arg_115_1:FormatText(StoryNameCfg[378].name)

				arg_115_1.leftNameTxt_.text = var_118_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_15 = arg_115_1:GetWordFromCfg(120151028)
				local var_118_16 = arg_115_1:FormatText(var_118_15.content)

				arg_115_1.text_.text = var_118_16

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_17 = 10
				local var_118_18 = utf8.len(var_118_16)
				local var_118_19 = var_118_17 <= 0 and var_118_13 or var_118_13 * (var_118_18 / var_118_17)

				if var_118_19 > 0 and var_118_13 < var_118_19 then
					arg_115_1.talkMaxDuration = var_118_19

					if var_118_19 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_12
					end
				end

				arg_115_1.text_.text = var_118_16
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151028", "story_v_out_120151.awb") ~= 0 then
					local var_118_20 = manager.audio:GetVoiceLength("story_v_out_120151", "120151028", "story_v_out_120151.awb") / 1000

					if var_118_20 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_20 + var_118_12
					end

					if var_118_15.prefab_name ~= "" and arg_115_1.actors_[var_118_15.prefab_name] ~= nil then
						local var_118_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_15.prefab_name].transform, "story_v_out_120151", "120151028", "story_v_out_120151.awb")

						arg_115_1:RecordAudio("120151028", var_118_21)
						arg_115_1:RecordAudio("120151028", var_118_21)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_120151", "120151028", "story_v_out_120151.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_120151", "120151028", "story_v_out_120151.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_22 = math.max(var_118_13, arg_115_1.talkMaxDuration)

			if var_118_12 <= arg_115_1.time_ and arg_115_1.time_ < var_118_12 + var_118_22 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_12) / var_118_22

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_12 + var_118_22 and arg_115_1.time_ < var_118_12 + var_118_22 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play120151029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120151029
		arg_119_1.duration_ = 4.9

		local var_119_0 = {
			zh = 4.333,
			ja = 4.9
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
				arg_119_0:Play120151030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_122_1 = 0
			local var_122_2 = 0.4

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_3 = arg_119_1:FormatText(StoryNameCfg[378].name)

				arg_119_1.leftNameTxt_.text = var_122_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_4 = arg_119_1:GetWordFromCfg(120151029)
				local var_122_5 = arg_119_1:FormatText(var_122_4.content)

				arg_119_1.text_.text = var_122_5

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_6 = 16
				local var_122_7 = utf8.len(var_122_5)
				local var_122_8 = var_122_6 <= 0 and var_122_2 or var_122_2 * (var_122_7 / var_122_6)

				if var_122_8 > 0 and var_122_2 < var_122_8 then
					arg_119_1.talkMaxDuration = var_122_8

					if var_122_8 + var_122_1 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_1
					end
				end

				arg_119_1.text_.text = var_122_5
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151029", "story_v_out_120151.awb") ~= 0 then
					local var_122_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151029", "story_v_out_120151.awb") / 1000

					if var_122_9 + var_122_1 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_9 + var_122_1
					end

					if var_122_4.prefab_name ~= "" and arg_119_1.actors_[var_122_4.prefab_name] ~= nil then
						local var_122_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_4.prefab_name].transform, "story_v_out_120151", "120151029", "story_v_out_120151.awb")

						arg_119_1:RecordAudio("120151029", var_122_10)
						arg_119_1:RecordAudio("120151029", var_122_10)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120151", "120151029", "story_v_out_120151.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120151", "120151029", "story_v_out_120151.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_11 = math.max(var_122_2, arg_119_1.talkMaxDuration)

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_11 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_1) / var_122_11

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_1 + var_122_11 and arg_119_1.time_ < var_122_1 + var_122_11 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play120151030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120151030
		arg_123_1.duration_ = 6.166

		local var_123_0 = {
			zh = 4,
			ja = 6.166
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
				arg_123_0:Play120151031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1069ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1069ui_story == nil then
				arg_123_1.var_.characterEffect1069ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1069ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1069ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1069ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1069ui_story.fillRatio = var_126_5
			end

			local var_126_6 = 0
			local var_126_7 = 0.375

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[383].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10037")

				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(120151030)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 15
				local var_126_12 = utf8.len(var_126_10)
				local var_126_13 = var_126_11 <= 0 and var_126_7 or var_126_7 * (var_126_12 / var_126_11)

				if var_126_13 > 0 and var_126_7 < var_126_13 then
					arg_123_1.talkMaxDuration = var_126_13

					if var_126_13 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_10
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151030", "story_v_out_120151.awb") ~= 0 then
					local var_126_14 = manager.audio:GetVoiceLength("story_v_out_120151", "120151030", "story_v_out_120151.awb") / 1000

					if var_126_14 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_14 + var_126_6
					end

					if var_126_9.prefab_name ~= "" and arg_123_1.actors_[var_126_9.prefab_name] ~= nil then
						local var_126_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_9.prefab_name].transform, "story_v_out_120151", "120151030", "story_v_out_120151.awb")

						arg_123_1:RecordAudio("120151030", var_126_15)
						arg_123_1:RecordAudio("120151030", var_126_15)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_120151", "120151030", "story_v_out_120151.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_120151", "120151030", "story_v_out_120151.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_16 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_16 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_16

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_16 and arg_123_1.time_ < var_126_6 + var_126_16 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play120151031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 120151031
		arg_127_1.duration_ = 7.433

		local var_127_0 = {
			zh = 4.6,
			ja = 7.433
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
				arg_127_0:Play120151032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_130_1 = arg_127_1.actors_["1069ui_story"]
			local var_130_2 = 0

			if var_130_2 < arg_127_1.time_ and arg_127_1.time_ <= var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1069ui_story == nil then
				arg_127_1.var_.characterEffect1069ui_story = var_130_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_3 = 0.2

			if var_130_2 <= arg_127_1.time_ and arg_127_1.time_ < var_130_2 + var_130_3 then
				local var_130_4 = (arg_127_1.time_ - var_130_2) / var_130_3

				if arg_127_1.var_.characterEffect1069ui_story then
					arg_127_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_2 + var_130_3 and arg_127_1.time_ < var_130_2 + var_130_3 + arg_130_0 and arg_127_1.var_.characterEffect1069ui_story then
				arg_127_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_130_5 = 0
			local var_130_6 = 0.5

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_7 = arg_127_1:FormatText(StoryNameCfg[378].name)

				arg_127_1.leftNameTxt_.text = var_130_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_8 = arg_127_1:GetWordFromCfg(120151031)
				local var_130_9 = arg_127_1:FormatText(var_130_8.content)

				arg_127_1.text_.text = var_130_9

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_10 = 20
				local var_130_11 = utf8.len(var_130_9)
				local var_130_12 = var_130_10 <= 0 and var_130_6 or var_130_6 * (var_130_11 / var_130_10)

				if var_130_12 > 0 and var_130_6 < var_130_12 then
					arg_127_1.talkMaxDuration = var_130_12

					if var_130_12 + var_130_5 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_12 + var_130_5
					end
				end

				arg_127_1.text_.text = var_130_9
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151031", "story_v_out_120151.awb") ~= 0 then
					local var_130_13 = manager.audio:GetVoiceLength("story_v_out_120151", "120151031", "story_v_out_120151.awb") / 1000

					if var_130_13 + var_130_5 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_13 + var_130_5
					end

					if var_130_8.prefab_name ~= "" and arg_127_1.actors_[var_130_8.prefab_name] ~= nil then
						local var_130_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_8.prefab_name].transform, "story_v_out_120151", "120151031", "story_v_out_120151.awb")

						arg_127_1:RecordAudio("120151031", var_130_14)
						arg_127_1:RecordAudio("120151031", var_130_14)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_120151", "120151031", "story_v_out_120151.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_120151", "120151031", "story_v_out_120151.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_15 = math.max(var_130_6, arg_127_1.talkMaxDuration)

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_15 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_5) / var_130_15

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_5 + var_130_15 and arg_127_1.time_ < var_130_5 + var_130_15 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play120151032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120151032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play120151033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1069ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1069ui_story == nil then
				arg_131_1.var_.characterEffect1069ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1069ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1069ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1069ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1069ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 0.05

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_8 = arg_131_1:FormatText(StoryNameCfg[383].name)

				arg_131_1.leftNameTxt_.text = var_134_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, true)
				arg_131_1.iconController_:SetSelectedState("hero")

				arg_131_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10037")

				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_9 = arg_131_1:GetWordFromCfg(120151032)
				local var_134_10 = arg_131_1:FormatText(var_134_9.content)

				arg_131_1.text_.text = var_134_10

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_11 = 2
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
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_14 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_14 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_14

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_14 and arg_131_1.time_ < var_134_6 + var_134_14 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play120151033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 120151033
		arg_135_1.duration_ = 4.9

		local var_135_0 = {
			zh = 4.9,
			ja = 4.2
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
				arg_135_0:Play120151034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_138_1 = arg_135_1.actors_["1069ui_story"]
			local var_138_2 = 0

			if var_138_2 < arg_135_1.time_ and arg_135_1.time_ <= var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1069ui_story == nil then
				arg_135_1.var_.characterEffect1069ui_story = var_138_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_3 = 0.2

			if var_138_2 <= arg_135_1.time_ and arg_135_1.time_ < var_138_2 + var_138_3 then
				local var_138_4 = (arg_135_1.time_ - var_138_2) / var_138_3

				if arg_135_1.var_.characterEffect1069ui_story then
					arg_135_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_2 + var_138_3 and arg_135_1.time_ < var_138_2 + var_138_3 + arg_138_0 and arg_135_1.var_.characterEffect1069ui_story then
				arg_135_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_138_5 = 0
			local var_138_6 = 0.475

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_7 = arg_135_1:FormatText(StoryNameCfg[378].name)

				arg_135_1.leftNameTxt_.text = var_138_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_8 = arg_135_1:GetWordFromCfg(120151033)
				local var_138_9 = arg_135_1:FormatText(var_138_8.content)

				arg_135_1.text_.text = var_138_9

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_10 = 19
				local var_138_11 = utf8.len(var_138_9)
				local var_138_12 = var_138_10 <= 0 and var_138_6 or var_138_6 * (var_138_11 / var_138_10)

				if var_138_12 > 0 and var_138_6 < var_138_12 then
					arg_135_1.talkMaxDuration = var_138_12

					if var_138_12 + var_138_5 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_12 + var_138_5
					end
				end

				arg_135_1.text_.text = var_138_9
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151033", "story_v_out_120151.awb") ~= 0 then
					local var_138_13 = manager.audio:GetVoiceLength("story_v_out_120151", "120151033", "story_v_out_120151.awb") / 1000

					if var_138_13 + var_138_5 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_13 + var_138_5
					end

					if var_138_8.prefab_name ~= "" and arg_135_1.actors_[var_138_8.prefab_name] ~= nil then
						local var_138_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_8.prefab_name].transform, "story_v_out_120151", "120151033", "story_v_out_120151.awb")

						arg_135_1:RecordAudio("120151033", var_138_14)
						arg_135_1:RecordAudio("120151033", var_138_14)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_120151", "120151033", "story_v_out_120151.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_120151", "120151033", "story_v_out_120151.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_15 = math.max(var_138_6, arg_135_1.talkMaxDuration)

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_15 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_5) / var_138_15

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_5 + var_138_15 and arg_135_1.time_ < var_138_5 + var_138_15 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play120151034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 120151034
		arg_139_1.duration_ = 3.333

		local var_139_0 = {
			zh = 1.999999999999,
			ja = 3.333
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
				arg_139_0:Play120151035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_142_1 = 0
			local var_142_2 = 0.2

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_3 = arg_139_1:FormatText(StoryNameCfg[378].name)

				arg_139_1.leftNameTxt_.text = var_142_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_4 = arg_139_1:GetWordFromCfg(120151034)
				local var_142_5 = arg_139_1:FormatText(var_142_4.content)

				arg_139_1.text_.text = var_142_5

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_6 = 8
				local var_142_7 = utf8.len(var_142_5)
				local var_142_8 = var_142_6 <= 0 and var_142_2 or var_142_2 * (var_142_7 / var_142_6)

				if var_142_8 > 0 and var_142_2 < var_142_8 then
					arg_139_1.talkMaxDuration = var_142_8

					if var_142_8 + var_142_1 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_1
					end
				end

				arg_139_1.text_.text = var_142_5
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151034", "story_v_out_120151.awb") ~= 0 then
					local var_142_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151034", "story_v_out_120151.awb") / 1000

					if var_142_9 + var_142_1 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_9 + var_142_1
					end

					if var_142_4.prefab_name ~= "" and arg_139_1.actors_[var_142_4.prefab_name] ~= nil then
						local var_142_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_4.prefab_name].transform, "story_v_out_120151", "120151034", "story_v_out_120151.awb")

						arg_139_1:RecordAudio("120151034", var_142_10)
						arg_139_1:RecordAudio("120151034", var_142_10)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_120151", "120151034", "story_v_out_120151.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_120151", "120151034", "story_v_out_120151.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_11 = math.max(var_142_2, arg_139_1.talkMaxDuration)

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_11 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_1) / var_142_11

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_1 + var_142_11 and arg_139_1.time_ < var_142_1 + var_142_11 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play120151035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 120151035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play120151036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1069ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1069ui_story == nil then
				arg_143_1.var_.characterEffect1069ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1069ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1069ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1069ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1069ui_story.fillRatio = var_146_5
			end

			local var_146_6 = 0
			local var_146_7 = 1.025

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_8 = arg_143_1:GetWordFromCfg(120151035)
				local var_146_9 = arg_143_1:FormatText(var_146_8.content)

				arg_143_1.text_.text = var_146_9

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_10 = 41
				local var_146_11 = utf8.len(var_146_9)
				local var_146_12 = var_146_10 <= 0 and var_146_7 or var_146_7 * (var_146_11 / var_146_10)

				if var_146_12 > 0 and var_146_7 < var_146_12 then
					arg_143_1.talkMaxDuration = var_146_12

					if var_146_12 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_9
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_13 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_13 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_13

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_13 and arg_143_1.time_ < var_146_6 + var_146_13 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play120151036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 120151036
		arg_147_1.duration_ = 11

		local var_147_0 = {
			zh = 4.8,
			ja = 11
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
				arg_147_0:Play120151037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_150_1 = arg_147_1.actors_["1071ui_story"]
			local var_150_2 = 0

			if var_150_2 < arg_147_1.time_ and arg_147_1.time_ <= var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1071ui_story == nil then
				arg_147_1.var_.characterEffect1071ui_story = var_150_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_3 = 0.2

			if var_150_2 <= arg_147_1.time_ and arg_147_1.time_ < var_150_2 + var_150_3 then
				local var_150_4 = (arg_147_1.time_ - var_150_2) / var_150_3

				if arg_147_1.var_.characterEffect1071ui_story then
					arg_147_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_2 + var_150_3 and arg_147_1.time_ < var_150_2 + var_150_3 + arg_150_0 and arg_147_1.var_.characterEffect1071ui_story then
				arg_147_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_150_5 = 0
			local var_150_6 = 0.4

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_7 = arg_147_1:FormatText(StoryNameCfg[384].name)

				arg_147_1.leftNameTxt_.text = var_150_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_8 = arg_147_1:GetWordFromCfg(120151036)
				local var_150_9 = arg_147_1:FormatText(var_150_8.content)

				arg_147_1.text_.text = var_150_9

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_10 = 16
				local var_150_11 = utf8.len(var_150_9)
				local var_150_12 = var_150_10 <= 0 and var_150_6 or var_150_6 * (var_150_11 / var_150_10)

				if var_150_12 > 0 and var_150_6 < var_150_12 then
					arg_147_1.talkMaxDuration = var_150_12

					if var_150_12 + var_150_5 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_12 + var_150_5
					end
				end

				arg_147_1.text_.text = var_150_9
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151036", "story_v_out_120151.awb") ~= 0 then
					local var_150_13 = manager.audio:GetVoiceLength("story_v_out_120151", "120151036", "story_v_out_120151.awb") / 1000

					if var_150_13 + var_150_5 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_13 + var_150_5
					end

					if var_150_8.prefab_name ~= "" and arg_147_1.actors_[var_150_8.prefab_name] ~= nil then
						local var_150_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_8.prefab_name].transform, "story_v_out_120151", "120151036", "story_v_out_120151.awb")

						arg_147_1:RecordAudio("120151036", var_150_14)
						arg_147_1:RecordAudio("120151036", var_150_14)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_120151", "120151036", "story_v_out_120151.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_120151", "120151036", "story_v_out_120151.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_15 = math.max(var_150_6, arg_147_1.talkMaxDuration)

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_15 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_5) / var_150_15

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_5 + var_150_15 and arg_147_1.time_ < var_150_5 + var_150_15 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play120151037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120151037
		arg_151_1.duration_ = 5.966

		local var_151_0 = {
			zh = 5.966,
			ja = 4.4
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
				arg_151_0:Play120151038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_154_1 = arg_151_1.actors_["1069ui_story"]
			local var_154_2 = 0

			if var_154_2 < arg_151_1.time_ and arg_151_1.time_ <= var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1069ui_story == nil then
				arg_151_1.var_.characterEffect1069ui_story = var_154_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_3 = 0.2

			if var_154_2 <= arg_151_1.time_ and arg_151_1.time_ < var_154_2 + var_154_3 then
				local var_154_4 = (arg_151_1.time_ - var_154_2) / var_154_3

				if arg_151_1.var_.characterEffect1069ui_story then
					arg_151_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_2 + var_154_3 and arg_151_1.time_ < var_154_2 + var_154_3 + arg_154_0 and arg_151_1.var_.characterEffect1069ui_story then
				arg_151_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_154_5 = arg_151_1.actors_["1071ui_story"]
			local var_154_6 = 0

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1071ui_story == nil then
				arg_151_1.var_.characterEffect1071ui_story = var_154_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_7 = 0.2

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_7 then
				local var_154_8 = (arg_151_1.time_ - var_154_6) / var_154_7

				if arg_151_1.var_.characterEffect1071ui_story then
					local var_154_9 = Mathf.Lerp(0, 0.5, var_154_8)

					arg_151_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1071ui_story.fillRatio = var_154_9
				end
			end

			if arg_151_1.time_ >= var_154_6 + var_154_7 and arg_151_1.time_ < var_154_6 + var_154_7 + arg_154_0 and arg_151_1.var_.characterEffect1071ui_story then
				local var_154_10 = 0.5

				arg_151_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1071ui_story.fillRatio = var_154_10
			end

			local var_154_11 = 0
			local var_154_12 = 0.675

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_13 = arg_151_1:FormatText(StoryNameCfg[378].name)

				arg_151_1.leftNameTxt_.text = var_154_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_14 = arg_151_1:GetWordFromCfg(120151037)
				local var_154_15 = arg_151_1:FormatText(var_154_14.content)

				arg_151_1.text_.text = var_154_15

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_16 = 27
				local var_154_17 = utf8.len(var_154_15)
				local var_154_18 = var_154_16 <= 0 and var_154_12 or var_154_12 * (var_154_17 / var_154_16)

				if var_154_18 > 0 and var_154_12 < var_154_18 then
					arg_151_1.talkMaxDuration = var_154_18

					if var_154_18 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_11
					end
				end

				arg_151_1.text_.text = var_154_15
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151037", "story_v_out_120151.awb") ~= 0 then
					local var_154_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151037", "story_v_out_120151.awb") / 1000

					if var_154_19 + var_154_11 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_19 + var_154_11
					end

					if var_154_14.prefab_name ~= "" and arg_151_1.actors_[var_154_14.prefab_name] ~= nil then
						local var_154_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_14.prefab_name].transform, "story_v_out_120151", "120151037", "story_v_out_120151.awb")

						arg_151_1:RecordAudio("120151037", var_154_20)
						arg_151_1:RecordAudio("120151037", var_154_20)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120151", "120151037", "story_v_out_120151.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120151", "120151037", "story_v_out_120151.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_21 = math.max(var_154_12, arg_151_1.talkMaxDuration)

			if var_154_11 <= arg_151_1.time_ and arg_151_1.time_ < var_154_11 + var_154_21 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_11) / var_154_21

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_11 + var_154_21 and arg_151_1.time_ < var_154_11 + var_154_21 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play120151038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 120151038
		arg_155_1.duration_ = 5.766

		local var_155_0 = {
			zh = 5.766,
			ja = 4.9
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
				arg_155_0:Play120151039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1069ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1069ui_story == nil then
				arg_155_1.var_.characterEffect1069ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.2

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1069ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1069ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1069ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1069ui_story.fillRatio = var_158_5
			end

			local var_158_6 = arg_155_1.actors_["1071ui_story"]
			local var_158_7 = 0

			if var_158_7 < arg_155_1.time_ and arg_155_1.time_ <= var_158_7 + arg_158_0 and arg_155_1.var_.characterEffect1071ui_story == nil then
				arg_155_1.var_.characterEffect1071ui_story = var_158_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_8 = 0.2

			if var_158_7 <= arg_155_1.time_ and arg_155_1.time_ < var_158_7 + var_158_8 then
				local var_158_9 = (arg_155_1.time_ - var_158_7) / var_158_8

				if arg_155_1.var_.characterEffect1071ui_story then
					arg_155_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_7 + var_158_8 and arg_155_1.time_ < var_158_7 + var_158_8 + arg_158_0 and arg_155_1.var_.characterEffect1071ui_story then
				arg_155_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 then
				arg_155_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_158_11 = 0

			if var_158_11 < arg_155_1.time_ and arg_155_1.time_ <= var_158_11 + arg_158_0 then
				arg_155_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_1")
			end

			local var_158_12 = 0
			local var_158_13 = 0.275

			if var_158_12 < arg_155_1.time_ and arg_155_1.time_ <= var_158_12 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_14 = arg_155_1:FormatText(StoryNameCfg[384].name)

				arg_155_1.leftNameTxt_.text = var_158_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_15 = arg_155_1:GetWordFromCfg(120151038)
				local var_158_16 = arg_155_1:FormatText(var_158_15.content)

				arg_155_1.text_.text = var_158_16

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_17 = 11
				local var_158_18 = utf8.len(var_158_16)
				local var_158_19 = var_158_17 <= 0 and var_158_13 or var_158_13 * (var_158_18 / var_158_17)

				if var_158_19 > 0 and var_158_13 < var_158_19 then
					arg_155_1.talkMaxDuration = var_158_19

					if var_158_19 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_19 + var_158_12
					end
				end

				arg_155_1.text_.text = var_158_16
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151038", "story_v_out_120151.awb") ~= 0 then
					local var_158_20 = manager.audio:GetVoiceLength("story_v_out_120151", "120151038", "story_v_out_120151.awb") / 1000

					if var_158_20 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_20 + var_158_12
					end

					if var_158_15.prefab_name ~= "" and arg_155_1.actors_[var_158_15.prefab_name] ~= nil then
						local var_158_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_15.prefab_name].transform, "story_v_out_120151", "120151038", "story_v_out_120151.awb")

						arg_155_1:RecordAudio("120151038", var_158_21)
						arg_155_1:RecordAudio("120151038", var_158_21)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_120151", "120151038", "story_v_out_120151.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_120151", "120151038", "story_v_out_120151.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_22 = math.max(var_158_13, arg_155_1.talkMaxDuration)

			if var_158_12 <= arg_155_1.time_ and arg_155_1.time_ < var_158_12 + var_158_22 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_12) / var_158_22

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_12 + var_158_22 and arg_155_1.time_ < var_158_12 + var_158_22 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play120151039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 120151039
		arg_159_1.duration_ = 4.433

		local var_159_0 = {
			zh = 4.2,
			ja = 4.433
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
				arg_159_0:Play120151040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_162_1 = arg_159_1.actors_["1069ui_story"]
			local var_162_2 = 0

			if var_162_2 < arg_159_1.time_ and arg_159_1.time_ <= var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1069ui_story == nil then
				arg_159_1.var_.characterEffect1069ui_story = var_162_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_3 = 0.2

			if var_162_2 <= arg_159_1.time_ and arg_159_1.time_ < var_162_2 + var_162_3 then
				local var_162_4 = (arg_159_1.time_ - var_162_2) / var_162_3

				if arg_159_1.var_.characterEffect1069ui_story then
					arg_159_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_2 + var_162_3 and arg_159_1.time_ < var_162_2 + var_162_3 + arg_162_0 and arg_159_1.var_.characterEffect1069ui_story then
				arg_159_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_162_5 = arg_159_1.actors_["1071ui_story"]
			local var_162_6 = 0

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 and arg_159_1.var_.characterEffect1071ui_story == nil then
				arg_159_1.var_.characterEffect1071ui_story = var_162_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_7 = 0.2

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_7 then
				local var_162_8 = (arg_159_1.time_ - var_162_6) / var_162_7

				if arg_159_1.var_.characterEffect1071ui_story then
					local var_162_9 = Mathf.Lerp(0, 0.5, var_162_8)

					arg_159_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1071ui_story.fillRatio = var_162_9
				end
			end

			if arg_159_1.time_ >= var_162_6 + var_162_7 and arg_159_1.time_ < var_162_6 + var_162_7 + arg_162_0 and arg_159_1.var_.characterEffect1071ui_story then
				local var_162_10 = 0.5

				arg_159_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1071ui_story.fillRatio = var_162_10
			end

			local var_162_11 = 0

			if var_162_11 < arg_159_1.time_ and arg_159_1.time_ <= var_162_11 + arg_162_0 then
				arg_159_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_2")
			end

			local var_162_12 = 0

			if var_162_12 < arg_159_1.time_ and arg_159_1.time_ <= var_162_12 + arg_162_0 then
				arg_159_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_162_13 = 0
			local var_162_14 = 0.45

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_15 = arg_159_1:FormatText(StoryNameCfg[378].name)

				arg_159_1.leftNameTxt_.text = var_162_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_16 = arg_159_1:GetWordFromCfg(120151039)
				local var_162_17 = arg_159_1:FormatText(var_162_16.content)

				arg_159_1.text_.text = var_162_17

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_18 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151039", "story_v_out_120151.awb") ~= 0 then
					local var_162_21 = manager.audio:GetVoiceLength("story_v_out_120151", "120151039", "story_v_out_120151.awb") / 1000

					if var_162_21 + var_162_13 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_21 + var_162_13
					end

					if var_162_16.prefab_name ~= "" and arg_159_1.actors_[var_162_16.prefab_name] ~= nil then
						local var_162_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_16.prefab_name].transform, "story_v_out_120151", "120151039", "story_v_out_120151.awb")

						arg_159_1:RecordAudio("120151039", var_162_22)
						arg_159_1:RecordAudio("120151039", var_162_22)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_120151", "120151039", "story_v_out_120151.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_120151", "120151039", "story_v_out_120151.awb")
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
	Play120151040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 120151040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play120151041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1069ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1069ui_story == nil then
				arg_163_1.var_.characterEffect1069ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.2

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1069ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1069ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1069ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1069ui_story.fillRatio = var_166_5
			end

			local var_166_6 = 0
			local var_166_7 = 1.275

			if var_166_6 < arg_163_1.time_ and arg_163_1.time_ <= var_166_6 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_8 = arg_163_1:GetWordFromCfg(120151040)
				local var_166_9 = arg_163_1:FormatText(var_166_8.content)

				arg_163_1.text_.text = var_166_9

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_10 = 51
				local var_166_11 = utf8.len(var_166_9)
				local var_166_12 = var_166_10 <= 0 and var_166_7 or var_166_7 * (var_166_11 / var_166_10)

				if var_166_12 > 0 and var_166_7 < var_166_12 then
					arg_163_1.talkMaxDuration = var_166_12

					if var_166_12 + var_166_6 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_12 + var_166_6
					end
				end

				arg_163_1.text_.text = var_166_9
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_13 = math.max(var_166_7, arg_163_1.talkMaxDuration)

			if var_166_6 <= arg_163_1.time_ and arg_163_1.time_ < var_166_6 + var_166_13 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_6) / var_166_13

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_6 + var_166_13 and arg_163_1.time_ < var_166_6 + var_166_13 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play120151041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 120151041
		arg_167_1.duration_ = 3.5

		local var_167_0 = {
			zh = 3.5,
			ja = 2.133
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
				arg_167_0:Play120151042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_170_1 = arg_167_1.actors_["1071ui_story"]
			local var_170_2 = 0

			if var_170_2 < arg_167_1.time_ and arg_167_1.time_ <= var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1071ui_story == nil then
				arg_167_1.var_.characterEffect1071ui_story = var_170_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_3 = 0.2

			if var_170_2 <= arg_167_1.time_ and arg_167_1.time_ < var_170_2 + var_170_3 then
				local var_170_4 = (arg_167_1.time_ - var_170_2) / var_170_3

				if arg_167_1.var_.characterEffect1071ui_story then
					arg_167_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_2 + var_170_3 and arg_167_1.time_ < var_170_2 + var_170_3 + arg_170_0 and arg_167_1.var_.characterEffect1071ui_story then
				arg_167_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_170_5 = 0
			local var_170_6 = 0.35

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_7 = arg_167_1:FormatText(StoryNameCfg[384].name)

				arg_167_1.leftNameTxt_.text = var_170_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_8 = arg_167_1:GetWordFromCfg(120151041)
				local var_170_9 = arg_167_1:FormatText(var_170_8.content)

				arg_167_1.text_.text = var_170_9

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_10 = 14
				local var_170_11 = utf8.len(var_170_9)
				local var_170_12 = var_170_10 <= 0 and var_170_6 or var_170_6 * (var_170_11 / var_170_10)

				if var_170_12 > 0 and var_170_6 < var_170_12 then
					arg_167_1.talkMaxDuration = var_170_12

					if var_170_12 + var_170_5 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_12 + var_170_5
					end
				end

				arg_167_1.text_.text = var_170_9
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151041", "story_v_out_120151.awb") ~= 0 then
					local var_170_13 = manager.audio:GetVoiceLength("story_v_out_120151", "120151041", "story_v_out_120151.awb") / 1000

					if var_170_13 + var_170_5 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_13 + var_170_5
					end

					if var_170_8.prefab_name ~= "" and arg_167_1.actors_[var_170_8.prefab_name] ~= nil then
						local var_170_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_8.prefab_name].transform, "story_v_out_120151", "120151041", "story_v_out_120151.awb")

						arg_167_1:RecordAudio("120151041", var_170_14)
						arg_167_1:RecordAudio("120151041", var_170_14)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_120151", "120151041", "story_v_out_120151.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_120151", "120151041", "story_v_out_120151.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_15 = math.max(var_170_6, arg_167_1.talkMaxDuration)

			if var_170_5 <= arg_167_1.time_ and arg_167_1.time_ < var_170_5 + var_170_15 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_5) / var_170_15

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_5 + var_170_15 and arg_167_1.time_ < var_170_5 + var_170_15 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play120151042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120151042
		arg_171_1.duration_ = 9.366

		local var_171_0 = {
			zh = 9.366,
			ja = 6.933
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
				arg_171_0:Play120151043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1.075

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[384].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(120151042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151042", "story_v_out_120151.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151042", "story_v_out_120151.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_120151", "120151042", "story_v_out_120151.awb")

						arg_171_1:RecordAudio("120151042", var_174_9)
						arg_171_1:RecordAudio("120151042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120151", "120151042", "story_v_out_120151.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120151", "120151042", "story_v_out_120151.awb")
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
	Play120151043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120151043
		arg_175_1.duration_ = 7.6

		local var_175_0 = {
			zh = 7.6,
			ja = 6.066
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
				arg_175_0:Play120151044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.975

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[384].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(120151043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151043", "story_v_out_120151.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151043", "story_v_out_120151.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_120151", "120151043", "story_v_out_120151.awb")

						arg_175_1:RecordAudio("120151043", var_178_9)
						arg_175_1:RecordAudio("120151043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_120151", "120151043", "story_v_out_120151.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_120151", "120151043", "story_v_out_120151.awb")
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
	Play120151044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120151044
		arg_179_1.duration_ = 6.9

		local var_179_0 = {
			zh = 2.666,
			ja = 6.9
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
				arg_179_0:Play120151045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10037ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect10037ui_story == nil then
				arg_179_1.var_.characterEffect10037ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.2

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect10037ui_story then
					arg_179_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect10037ui_story then
				arg_179_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_182_4 = arg_179_1.actors_["1071ui_story"].transform
			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 then
				arg_179_1.var_.moveOldPos1071ui_story = var_182_4.localPosition
			end

			local var_182_6 = 0.001

			if var_182_5 <= arg_179_1.time_ and arg_179_1.time_ < var_182_5 + var_182_6 then
				local var_182_7 = (arg_179_1.time_ - var_182_5) / var_182_6
				local var_182_8 = Vector3.New(0, 100, 0)

				var_182_4.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1071ui_story, var_182_8, var_182_7)

				local var_182_9 = manager.ui.mainCamera.transform.position - var_182_4.position

				var_182_4.forward = Vector3.New(var_182_9.x, var_182_9.y, var_182_9.z)

				local var_182_10 = var_182_4.localEulerAngles

				var_182_10.z = 0
				var_182_10.x = 0
				var_182_4.localEulerAngles = var_182_10
			end

			if arg_179_1.time_ >= var_182_5 + var_182_6 and arg_179_1.time_ < var_182_5 + var_182_6 + arg_182_0 then
				var_182_4.localPosition = Vector3.New(0, 100, 0)

				local var_182_11 = manager.ui.mainCamera.transform.position - var_182_4.position

				var_182_4.forward = Vector3.New(var_182_11.x, var_182_11.y, var_182_11.z)

				local var_182_12 = var_182_4.localEulerAngles

				var_182_12.z = 0
				var_182_12.x = 0
				var_182_4.localEulerAngles = var_182_12
			end

			local var_182_13 = arg_179_1.actors_["1069ui_story"].transform
			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 then
				arg_179_1.var_.moveOldPos1069ui_story = var_182_13.localPosition
			end

			local var_182_15 = 0.001

			if var_182_14 <= arg_179_1.time_ and arg_179_1.time_ < var_182_14 + var_182_15 then
				local var_182_16 = (arg_179_1.time_ - var_182_14) / var_182_15
				local var_182_17 = Vector3.New(0, 100, 0)

				var_182_13.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1069ui_story, var_182_17, var_182_16)

				local var_182_18 = manager.ui.mainCamera.transform.position - var_182_13.position

				var_182_13.forward = Vector3.New(var_182_18.x, var_182_18.y, var_182_18.z)

				local var_182_19 = var_182_13.localEulerAngles

				var_182_19.z = 0
				var_182_19.x = 0
				var_182_13.localEulerAngles = var_182_19
			end

			if arg_179_1.time_ >= var_182_14 + var_182_15 and arg_179_1.time_ < var_182_14 + var_182_15 + arg_182_0 then
				var_182_13.localPosition = Vector3.New(0, 100, 0)

				local var_182_20 = manager.ui.mainCamera.transform.position - var_182_13.position

				var_182_13.forward = Vector3.New(var_182_20.x, var_182_20.y, var_182_20.z)

				local var_182_21 = var_182_13.localEulerAngles

				var_182_21.z = 0
				var_182_21.x = 0
				var_182_13.localEulerAngles = var_182_21
			end

			local var_182_22 = arg_179_1.actors_["10037ui_story"].transform
			local var_182_23 = 0

			if var_182_23 < arg_179_1.time_ and arg_179_1.time_ <= var_182_23 + arg_182_0 then
				arg_179_1.var_.moveOldPos10037ui_story = var_182_22.localPosition
			end

			local var_182_24 = 0.001

			if var_182_23 <= arg_179_1.time_ and arg_179_1.time_ < var_182_23 + var_182_24 then
				local var_182_25 = (arg_179_1.time_ - var_182_23) / var_182_24
				local var_182_26 = Vector3.New(0, -1.13, -6.2)

				var_182_22.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10037ui_story, var_182_26, var_182_25)

				local var_182_27 = manager.ui.mainCamera.transform.position - var_182_22.position

				var_182_22.forward = Vector3.New(var_182_27.x, var_182_27.y, var_182_27.z)

				local var_182_28 = var_182_22.localEulerAngles

				var_182_28.z = 0
				var_182_28.x = 0
				var_182_22.localEulerAngles = var_182_28
			end

			if arg_179_1.time_ >= var_182_23 + var_182_24 and arg_179_1.time_ < var_182_23 + var_182_24 + arg_182_0 then
				var_182_22.localPosition = Vector3.New(0, -1.13, -6.2)

				local var_182_29 = manager.ui.mainCamera.transform.position - var_182_22.position

				var_182_22.forward = Vector3.New(var_182_29.x, var_182_29.y, var_182_29.z)

				local var_182_30 = var_182_22.localEulerAngles

				var_182_30.z = 0
				var_182_30.x = 0
				var_182_22.localEulerAngles = var_182_30
			end

			local var_182_31 = 0

			if var_182_31 < arg_179_1.time_ and arg_179_1.time_ <= var_182_31 + arg_182_0 then
				arg_179_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action2_1")
			end

			local var_182_32 = 0

			if var_182_32 < arg_179_1.time_ and arg_179_1.time_ <= var_182_32 + arg_182_0 then
				arg_179_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_182_33 = 0
			local var_182_34 = 0.225

			if var_182_33 < arg_179_1.time_ and arg_179_1.time_ <= var_182_33 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_35 = arg_179_1:FormatText(StoryNameCfg[383].name)

				arg_179_1.leftNameTxt_.text = var_182_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_36 = arg_179_1:GetWordFromCfg(120151044)
				local var_182_37 = arg_179_1:FormatText(var_182_36.content)

				arg_179_1.text_.text = var_182_37

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_38 = 9
				local var_182_39 = utf8.len(var_182_37)
				local var_182_40 = var_182_38 <= 0 and var_182_34 or var_182_34 * (var_182_39 / var_182_38)

				if var_182_40 > 0 and var_182_34 < var_182_40 then
					arg_179_1.talkMaxDuration = var_182_40

					if var_182_40 + var_182_33 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_40 + var_182_33
					end
				end

				arg_179_1.text_.text = var_182_37
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151044", "story_v_out_120151.awb") ~= 0 then
					local var_182_41 = manager.audio:GetVoiceLength("story_v_out_120151", "120151044", "story_v_out_120151.awb") / 1000

					if var_182_41 + var_182_33 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_41 + var_182_33
					end

					if var_182_36.prefab_name ~= "" and arg_179_1.actors_[var_182_36.prefab_name] ~= nil then
						local var_182_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_36.prefab_name].transform, "story_v_out_120151", "120151044", "story_v_out_120151.awb")

						arg_179_1:RecordAudio("120151044", var_182_42)
						arg_179_1:RecordAudio("120151044", var_182_42)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_120151", "120151044", "story_v_out_120151.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_120151", "120151044", "story_v_out_120151.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_43 = math.max(var_182_34, arg_179_1.talkMaxDuration)

			if var_182_33 <= arg_179_1.time_ and arg_179_1.time_ < var_182_33 + var_182_43 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_33) / var_182_43

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_33 + var_182_43 and arg_179_1.time_ < var_182_33 + var_182_43 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120151045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120151045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play120151046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10037ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10037ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(0, 100, 0)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10037ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(0, 100, 0)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = 0
			local var_186_10 = 1.175

			if var_186_9 < arg_183_1.time_ and arg_183_1.time_ <= var_186_9 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_11 = arg_183_1:GetWordFromCfg(120151045)
				local var_186_12 = arg_183_1:FormatText(var_186_11.content)

				arg_183_1.text_.text = var_186_12

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_13 = 47
				local var_186_14 = utf8.len(var_186_12)
				local var_186_15 = var_186_13 <= 0 and var_186_10 or var_186_10 * (var_186_14 / var_186_13)

				if var_186_15 > 0 and var_186_10 < var_186_15 then
					arg_183_1.talkMaxDuration = var_186_15

					if var_186_15 + var_186_9 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_15 + var_186_9
					end
				end

				arg_183_1.text_.text = var_186_12
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_16 = math.max(var_186_10, arg_183_1.talkMaxDuration)

			if var_186_9 <= arg_183_1.time_ and arg_183_1.time_ < var_186_9 + var_186_16 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_9) / var_186_16

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_9 + var_186_16 and arg_183_1.time_ < var_186_9 + var_186_16 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120151046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120151046
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play120151047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = manager.ui.mainCamera.transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.shakeOldPos = var_190_0.localPosition
			end

			local var_190_2 = 0.6

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / 0.066
				local var_190_4, var_190_5 = math.modf(var_190_3)

				var_190_0.localPosition = Vector3.New(var_190_5 * 0.13, var_190_5 * 0.13, var_190_5 * 0.13) + arg_187_1.var_.shakeOldPos
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = arg_187_1.var_.shakeOldPos
			end

			local var_190_6 = 0

			if var_190_6 < arg_187_1.time_ and arg_187_1.time_ <= var_190_6 + arg_190_0 then
				arg_187_1.allBtn_.enabled = false
			end

			local var_190_7 = 0.6

			if arg_187_1.time_ >= var_190_6 + var_190_7 and arg_187_1.time_ < var_190_6 + var_190_7 + arg_190_0 then
				arg_187_1.allBtn_.enabled = true
			end

			local var_190_8 = 0
			local var_190_9 = 1

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 then
				local var_190_10 = "play"
				local var_190_11 = "effect"

				arg_187_1:AudioAction(var_190_10, var_190_11, "se_story_120_00", "se_story_120_00_sword04", "")
			end

			local var_190_12 = 0

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_190_13 = arg_187_1.actors_["10037ui_story"].transform
			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1.var_.moveOldPos10037ui_story = var_190_13.localPosition
			end

			local var_190_15 = 0.001

			if var_190_14 <= arg_187_1.time_ and arg_187_1.time_ < var_190_14 + var_190_15 then
				local var_190_16 = (arg_187_1.time_ - var_190_14) / var_190_15
				local var_190_17 = Vector3.New(0, 100, 0)

				var_190_13.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10037ui_story, var_190_17, var_190_16)

				local var_190_18 = manager.ui.mainCamera.transform.position - var_190_13.position

				var_190_13.forward = Vector3.New(var_190_18.x, var_190_18.y, var_190_18.z)

				local var_190_19 = var_190_13.localEulerAngles

				var_190_19.z = 0
				var_190_19.x = 0
				var_190_13.localEulerAngles = var_190_19
			end

			if arg_187_1.time_ >= var_190_14 + var_190_15 and arg_187_1.time_ < var_190_14 + var_190_15 + arg_190_0 then
				var_190_13.localPosition = Vector3.New(0, 100, 0)

				local var_190_20 = manager.ui.mainCamera.transform.position - var_190_13.position

				var_190_13.forward = Vector3.New(var_190_20.x, var_190_20.y, var_190_20.z)

				local var_190_21 = var_190_13.localEulerAngles

				var_190_21.z = 0
				var_190_21.x = 0
				var_190_13.localEulerAngles = var_190_21
			end

			local var_190_22 = 0
			local var_190_23 = 0.05

			if var_190_22 < arg_187_1.time_ and arg_187_1.time_ <= var_190_22 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_24 = arg_187_1:GetWordFromCfg(120151046)
				local var_190_25 = arg_187_1:FormatText(var_190_24.content)

				arg_187_1.text_.text = var_190_25

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_26 = 2
				local var_190_27 = utf8.len(var_190_25)
				local var_190_28 = var_190_26 <= 0 and var_190_23 or var_190_23 * (var_190_27 / var_190_26)

				if var_190_28 > 0 and var_190_23 < var_190_28 then
					arg_187_1.talkMaxDuration = var_190_28

					if var_190_28 + var_190_22 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_28 + var_190_22
					end
				end

				arg_187_1.text_.text = var_190_25
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_29 = math.max(var_190_23, arg_187_1.talkMaxDuration)

			if var_190_22 <= arg_187_1.time_ and arg_187_1.time_ < var_190_22 + var_190_29 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_22) / var_190_29

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_22 + var_190_29 and arg_187_1.time_ < var_190_22 + var_190_29 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120151047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120151047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120151048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.95

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_2 = arg_191_1:GetWordFromCfg(120151047)
				local var_194_3 = arg_191_1:FormatText(var_194_2.content)

				arg_191_1.text_.text = var_194_3

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_4 = 61
				local var_194_5 = utf8.len(var_194_3)
				local var_194_6 = var_194_4 <= 0 and var_194_1 or var_194_1 * (var_194_5 / var_194_4)

				if var_194_6 > 0 and var_194_1 < var_194_6 then
					arg_191_1.talkMaxDuration = var_194_6

					if var_194_6 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_6 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_3
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_7 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_7 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_7

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_7 and arg_191_1.time_ < var_194_0 + var_194_7 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120151048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120151048
		arg_195_1.duration_ = 3.7

		local var_195_0 = {
			zh = 3.7,
			ja = 2.5
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
				arg_195_0:Play120151049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.375

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[384].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, true)
				arg_195_1.iconController_:SetSelectedState("hero")

				arg_195_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(120151048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151048", "story_v_out_120151.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151048", "story_v_out_120151.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_120151", "120151048", "story_v_out_120151.awb")

						arg_195_1:RecordAudio("120151048", var_198_9)
						arg_195_1:RecordAudio("120151048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120151", "120151048", "story_v_out_120151.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120151", "120151048", "story_v_out_120151.awb")
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
	Play120151049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120151049
		arg_199_1.duration_ = 1.866

		local var_199_0 = {
			zh = 1.866,
			ja = 1.166
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
				arg_199_0:Play120151050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.15

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[378].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, true)
				arg_199_1.iconController_:SetSelectedState("hero")

				arg_199_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(120151049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151049", "story_v_out_120151.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151049", "story_v_out_120151.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_120151", "120151049", "story_v_out_120151.awb")

						arg_199_1:RecordAudio("120151049", var_202_9)
						arg_199_1:RecordAudio("120151049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120151", "120151049", "story_v_out_120151.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120151", "120151049", "story_v_out_120151.awb")
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
	Play120151050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120151050
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play120151051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.bgs_.ST46.transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPosST46 = var_206_0.localPosition
			end

			local var_206_2 = 3

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, 1, 9)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPosST46, var_206_4, var_206_3)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, 1, 9)
			end

			local var_206_5 = 0

			if var_206_5 < arg_203_1.time_ and arg_203_1.time_ <= var_206_5 + arg_206_0 then
				arg_203_1.allBtn_.enabled = false
			end

			local var_206_6 = 3

			if arg_203_1.time_ >= var_206_5 + var_206_6 and arg_203_1.time_ < var_206_5 + var_206_6 + arg_206_0 then
				arg_203_1.allBtn_.enabled = true
			end

			local var_206_7 = manager.ui.mainCamera.transform
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 then
				local var_206_9 = arg_203_1.var_.effectnenglianglianyi1

				if not var_206_9 then
					var_206_9 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ripple"))
					var_206_9.name = "nenglianglianyi1"
					arg_203_1.var_.effectnenglianglianyi1 = var_206_9
				end

				local var_206_10 = var_206_7:Find("")

				if var_206_10 then
					var_206_9.transform.parent = var_206_10
				else
					var_206_9.transform.parent = var_206_7
				end

				var_206_9.transform.localPosition = Vector3.New(0, 0, 0)
				var_206_9.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_206_11 = 0
			local var_206_12 = 1.35

			if var_206_11 < arg_203_1.time_ and arg_203_1.time_ <= var_206_11 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_13 = arg_203_1:GetWordFromCfg(120151050)
				local var_206_14 = arg_203_1:FormatText(var_206_13.content)

				arg_203_1.text_.text = var_206_14

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_15 = 61
				local var_206_16 = utf8.len(var_206_14)
				local var_206_17 = var_206_15 <= 0 and var_206_12 or var_206_12 * (var_206_16 / var_206_15)

				if var_206_17 > 0 and var_206_12 < var_206_17 then
					arg_203_1.talkMaxDuration = var_206_17

					if var_206_17 + var_206_11 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_17 + var_206_11
					end
				end

				arg_203_1.text_.text = var_206_14
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_18 = math.max(var_206_12, arg_203_1.talkMaxDuration)

			if var_206_11 <= arg_203_1.time_ and arg_203_1.time_ < var_206_11 + var_206_18 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_11) / var_206_18

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_11 + var_206_18 and arg_203_1.time_ < var_206_11 + var_206_18 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play120151051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 120151051
		arg_207_1.duration_ = 1

		local var_207_0 = {
			zh = 0.999999999999,
			ja = 1
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
				arg_207_0:Play120151052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.1

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[378].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, true)
				arg_207_1.iconController_:SetSelectedState("hero")

				arg_207_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(120151051)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 4
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151051", "story_v_out_120151.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151051", "story_v_out_120151.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_120151", "120151051", "story_v_out_120151.awb")

						arg_207_1:RecordAudio("120151051", var_210_9)
						arg_207_1:RecordAudio("120151051", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_120151", "120151051", "story_v_out_120151.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_120151", "120151051", "story_v_out_120151.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_10 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_10 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_10

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_10 and arg_207_1.time_ < var_210_0 + var_210_10 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play120151052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 120151052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play120151053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.525

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

				local var_214_2 = arg_211_1:GetWordFromCfg(120151052)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 21
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
	Play120151053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 120151053
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play120151054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.85

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

				local var_218_2 = arg_215_1:GetWordFromCfg(120151053)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 34
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
	Play120151054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 120151054
		arg_219_1.duration_ = 5

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play120151055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.95

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, false)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_2 = arg_219_1:GetWordFromCfg(120151054)
				local var_222_3 = arg_219_1:FormatText(var_222_2.content)

				arg_219_1.text_.text = var_222_3

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_4 = 38
				local var_222_5 = utf8.len(var_222_3)
				local var_222_6 = var_222_4 <= 0 and var_222_1 or var_222_1 * (var_222_5 / var_222_4)

				if var_222_6 > 0 and var_222_1 < var_222_6 then
					arg_219_1.talkMaxDuration = var_222_6

					if var_222_6 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_6 + var_222_0
					end
				end

				arg_219_1.text_.text = var_222_3
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)
				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_7 = math.max(var_222_1, arg_219_1.talkMaxDuration)

			if var_222_0 <= arg_219_1.time_ and arg_219_1.time_ < var_222_0 + var_222_7 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_0) / var_222_7

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_0 + var_222_7 and arg_219_1.time_ < var_222_0 + var_222_7 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play120151055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 120151055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play120151056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 1.45

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_2 = arg_223_1:GetWordFromCfg(120151055)
				local var_226_3 = arg_223_1:FormatText(var_226_2.content)

				arg_223_1.text_.text = var_226_3

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_4 = 58
				local var_226_5 = utf8.len(var_226_3)
				local var_226_6 = var_226_4 <= 0 and var_226_1 or var_226_1 * (var_226_5 / var_226_4)

				if var_226_6 > 0 and var_226_1 < var_226_6 then
					arg_223_1.talkMaxDuration = var_226_6

					if var_226_6 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_6 + var_226_0
					end
				end

				arg_223_1.text_.text = var_226_3
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_7 = math.max(var_226_1, arg_223_1.talkMaxDuration)

			if var_226_0 <= arg_223_1.time_ and arg_223_1.time_ < var_226_0 + var_226_7 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_0) / var_226_7

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_0 + var_226_7 and arg_223_1.time_ < var_226_0 + var_226_7 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play120151056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 120151056
		arg_227_1.duration_ = 6.066

		local var_227_0 = {
			zh = 6.066,
			ja = 5.2
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
				arg_227_0:Play120151057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10037ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos10037ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, -1.13, -6.2)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos10037ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -1.13, -6.2)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = 0

			if var_230_9 < arg_227_1.time_ and arg_227_1.time_ <= var_230_9 + arg_230_0 then
				arg_227_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037actionlink/10037action423")
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_230_11 = arg_227_1.actors_["10037ui_story"]
			local var_230_12 = 0

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 and arg_227_1.var_.characterEffect10037ui_story == nil then
				arg_227_1.var_.characterEffect10037ui_story = var_230_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_13 = 0.2

			if var_230_12 <= arg_227_1.time_ and arg_227_1.time_ < var_230_12 + var_230_13 then
				local var_230_14 = (arg_227_1.time_ - var_230_12) / var_230_13

				if arg_227_1.var_.characterEffect10037ui_story then
					arg_227_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_12 + var_230_13 and arg_227_1.time_ < var_230_12 + var_230_13 + arg_230_0 and arg_227_1.var_.characterEffect10037ui_story then
				arg_227_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_230_15 = 0
			local var_230_16 = 0.45

			if var_230_15 < arg_227_1.time_ and arg_227_1.time_ <= var_230_15 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_17 = arg_227_1:FormatText(StoryNameCfg[383].name)

				arg_227_1.leftNameTxt_.text = var_230_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_18 = arg_227_1:GetWordFromCfg(120151056)
				local var_230_19 = arg_227_1:FormatText(var_230_18.content)

				arg_227_1.text_.text = var_230_19

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_20 = 18
				local var_230_21 = utf8.len(var_230_19)
				local var_230_22 = var_230_20 <= 0 and var_230_16 or var_230_16 * (var_230_21 / var_230_20)

				if var_230_22 > 0 and var_230_16 < var_230_22 then
					arg_227_1.talkMaxDuration = var_230_22

					if var_230_22 + var_230_15 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_22 + var_230_15
					end
				end

				arg_227_1.text_.text = var_230_19
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151056", "story_v_out_120151.awb") ~= 0 then
					local var_230_23 = manager.audio:GetVoiceLength("story_v_out_120151", "120151056", "story_v_out_120151.awb") / 1000

					if var_230_23 + var_230_15 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_23 + var_230_15
					end

					if var_230_18.prefab_name ~= "" and arg_227_1.actors_[var_230_18.prefab_name] ~= nil then
						local var_230_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_18.prefab_name].transform, "story_v_out_120151", "120151056", "story_v_out_120151.awb")

						arg_227_1:RecordAudio("120151056", var_230_24)
						arg_227_1:RecordAudio("120151056", var_230_24)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_120151", "120151056", "story_v_out_120151.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_120151", "120151056", "story_v_out_120151.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_25 = math.max(var_230_16, arg_227_1.talkMaxDuration)

			if var_230_15 <= arg_227_1.time_ and arg_227_1.time_ < var_230_15 + var_230_25 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_15) / var_230_25

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_15 + var_230_25 and arg_227_1.time_ < var_230_15 + var_230_25 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play120151057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 120151057
		arg_231_1.duration_ = 8.566

		local var_231_0 = {
			zh = 8.566,
			ja = 7.833
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
				arg_231_0:Play120151058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_234_1 = 0
			local var_234_2 = 0.8

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_3 = arg_231_1:FormatText(StoryNameCfg[383].name)

				arg_231_1.leftNameTxt_.text = var_234_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_4 = arg_231_1:GetWordFromCfg(120151057)
				local var_234_5 = arg_231_1:FormatText(var_234_4.content)

				arg_231_1.text_.text = var_234_5

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_6 = 32
				local var_234_7 = utf8.len(var_234_5)
				local var_234_8 = var_234_6 <= 0 and var_234_2 or var_234_2 * (var_234_7 / var_234_6)

				if var_234_8 > 0 and var_234_2 < var_234_8 then
					arg_231_1.talkMaxDuration = var_234_8

					if var_234_8 + var_234_1 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_1
					end
				end

				arg_231_1.text_.text = var_234_5
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151057", "story_v_out_120151.awb") ~= 0 then
					local var_234_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151057", "story_v_out_120151.awb") / 1000

					if var_234_9 + var_234_1 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_9 + var_234_1
					end

					if var_234_4.prefab_name ~= "" and arg_231_1.actors_[var_234_4.prefab_name] ~= nil then
						local var_234_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_4.prefab_name].transform, "story_v_out_120151", "120151057", "story_v_out_120151.awb")

						arg_231_1:RecordAudio("120151057", var_234_10)
						arg_231_1:RecordAudio("120151057", var_234_10)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_120151", "120151057", "story_v_out_120151.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_120151", "120151057", "story_v_out_120151.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_11 = math.max(var_234_2, arg_231_1.talkMaxDuration)

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_11 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_1) / var_234_11

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_1 + var_234_11 and arg_231_1.time_ < var_234_1 + var_234_11 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play120151058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 120151058
		arg_235_1.duration_ = 11.766

		local var_235_0 = {
			zh = 10.3,
			ja = 11.766
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
				arg_235_0:Play120151059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_238_1 = 0
			local var_238_2 = 0.85

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_3 = arg_235_1:FormatText(StoryNameCfg[383].name)

				arg_235_1.leftNameTxt_.text = var_238_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_4 = arg_235_1:GetWordFromCfg(120151058)
				local var_238_5 = arg_235_1:FormatText(var_238_4.content)

				arg_235_1.text_.text = var_238_5

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_6 = 34
				local var_238_7 = utf8.len(var_238_5)
				local var_238_8 = var_238_6 <= 0 and var_238_2 or var_238_2 * (var_238_7 / var_238_6)

				if var_238_8 > 0 and var_238_2 < var_238_8 then
					arg_235_1.talkMaxDuration = var_238_8

					if var_238_8 + var_238_1 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_1
					end
				end

				arg_235_1.text_.text = var_238_5
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151058", "story_v_out_120151.awb") ~= 0 then
					local var_238_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151058", "story_v_out_120151.awb") / 1000

					if var_238_9 + var_238_1 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_9 + var_238_1
					end

					if var_238_4.prefab_name ~= "" and arg_235_1.actors_[var_238_4.prefab_name] ~= nil then
						local var_238_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_4.prefab_name].transform, "story_v_out_120151", "120151058", "story_v_out_120151.awb")

						arg_235_1:RecordAudio("120151058", var_238_10)
						arg_235_1:RecordAudio("120151058", var_238_10)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_120151", "120151058", "story_v_out_120151.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_120151", "120151058", "story_v_out_120151.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_11 = math.max(var_238_2, arg_235_1.talkMaxDuration)

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_11 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_1) / var_238_11

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_1 + var_238_11 and arg_235_1.time_ < var_238_1 + var_238_11 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play120151059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 120151059
		arg_239_1.duration_ = 7.8

		local var_239_0 = {
			zh = 3.766,
			ja = 7.8
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
				arg_239_0:Play120151060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10037ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos10037ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(0, 100, 0)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos10037ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, 100, 0)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["1071ui_story"].transform
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1.var_.moveOldPos1071ui_story = var_242_9.localPosition
			end

			local var_242_11 = 0.001

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11
				local var_242_13 = Vector3.New(0, -1.05, -6.2)

				var_242_9.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1071ui_story, var_242_13, var_242_12)

				local var_242_14 = manager.ui.mainCamera.transform.position - var_242_9.position

				var_242_9.forward = Vector3.New(var_242_14.x, var_242_14.y, var_242_14.z)

				local var_242_15 = var_242_9.localEulerAngles

				var_242_15.z = 0
				var_242_15.x = 0
				var_242_9.localEulerAngles = var_242_15
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 then
				var_242_9.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_242_16 = manager.ui.mainCamera.transform.position - var_242_9.position

				var_242_9.forward = Vector3.New(var_242_16.x, var_242_16.y, var_242_16.z)

				local var_242_17 = var_242_9.localEulerAngles

				var_242_17.z = 0
				var_242_17.x = 0
				var_242_9.localEulerAngles = var_242_17
			end

			local var_242_18 = 0

			if var_242_18 < arg_239_1.time_ and arg_239_1.time_ <= var_242_18 + arg_242_0 then
				arg_239_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_242_19 = 0

			if var_242_19 < arg_239_1.time_ and arg_239_1.time_ <= var_242_19 + arg_242_0 then
				arg_239_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_242_20 = arg_239_1.actors_["1071ui_story"]
			local var_242_21 = 0

			if var_242_21 < arg_239_1.time_ and arg_239_1.time_ <= var_242_21 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story == nil then
				arg_239_1.var_.characterEffect1071ui_story = var_242_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_22 = 0.2

			if var_242_21 <= arg_239_1.time_ and arg_239_1.time_ < var_242_21 + var_242_22 then
				local var_242_23 = (arg_239_1.time_ - var_242_21) / var_242_22

				if arg_239_1.var_.characterEffect1071ui_story then
					arg_239_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_21 + var_242_22 and arg_239_1.time_ < var_242_21 + var_242_22 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story then
				arg_239_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_242_24 = 0
			local var_242_25 = 0.45

			if var_242_24 < arg_239_1.time_ and arg_239_1.time_ <= var_242_24 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_26 = arg_239_1:FormatText(StoryNameCfg[384].name)

				arg_239_1.leftNameTxt_.text = var_242_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_27 = arg_239_1:GetWordFromCfg(120151059)
				local var_242_28 = arg_239_1:FormatText(var_242_27.content)

				arg_239_1.text_.text = var_242_28

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_29 = 18
				local var_242_30 = utf8.len(var_242_28)
				local var_242_31 = var_242_29 <= 0 and var_242_25 or var_242_25 * (var_242_30 / var_242_29)

				if var_242_31 > 0 and var_242_25 < var_242_31 then
					arg_239_1.talkMaxDuration = var_242_31

					if var_242_31 + var_242_24 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_31 + var_242_24
					end
				end

				arg_239_1.text_.text = var_242_28
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151059", "story_v_out_120151.awb") ~= 0 then
					local var_242_32 = manager.audio:GetVoiceLength("story_v_out_120151", "120151059", "story_v_out_120151.awb") / 1000

					if var_242_32 + var_242_24 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_32 + var_242_24
					end

					if var_242_27.prefab_name ~= "" and arg_239_1.actors_[var_242_27.prefab_name] ~= nil then
						local var_242_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_27.prefab_name].transform, "story_v_out_120151", "120151059", "story_v_out_120151.awb")

						arg_239_1:RecordAudio("120151059", var_242_33)
						arg_239_1:RecordAudio("120151059", var_242_33)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_120151", "120151059", "story_v_out_120151.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_120151", "120151059", "story_v_out_120151.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_34 = math.max(var_242_25, arg_239_1.talkMaxDuration)

			if var_242_24 <= arg_239_1.time_ and arg_239_1.time_ < var_242_24 + var_242_34 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_24) / var_242_34

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_24 + var_242_34 and arg_239_1.time_ < var_242_24 + var_242_34 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play120151060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 120151060
		arg_243_1.duration_ = 5.566

		local var_243_0 = {
			zh = 5.566,
			ja = 5.366
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
				arg_243_0:Play120151061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.55

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[384].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(120151060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151060", "story_v_out_120151.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151060", "story_v_out_120151.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_120151", "120151060", "story_v_out_120151.awb")

						arg_243_1:RecordAudio("120151060", var_246_9)
						arg_243_1:RecordAudio("120151060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_120151", "120151060", "story_v_out_120151.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_120151", "120151060", "story_v_out_120151.awb")
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
	Play120151061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 120151061
		arg_247_1.duration_ = 8.3

		local var_247_0 = {
			zh = 4.466,
			ja = 8.3
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
				arg_247_0:Play120151062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1071ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1071ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(0, 100, 0)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1071ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, 100, 0)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = arg_247_1.actors_["10037ui_story"].transform
			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1.var_.moveOldPos10037ui_story = var_250_9.localPosition
			end

			local var_250_11 = 0.001

			if var_250_10 <= arg_247_1.time_ and arg_247_1.time_ < var_250_10 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_10) / var_250_11
				local var_250_13 = Vector3.New(0, -1.13, -6.2)

				var_250_9.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos10037ui_story, var_250_13, var_250_12)

				local var_250_14 = manager.ui.mainCamera.transform.position - var_250_9.position

				var_250_9.forward = Vector3.New(var_250_14.x, var_250_14.y, var_250_14.z)

				local var_250_15 = var_250_9.localEulerAngles

				var_250_15.z = 0
				var_250_15.x = 0
				var_250_9.localEulerAngles = var_250_15
			end

			if arg_247_1.time_ >= var_250_10 + var_250_11 and arg_247_1.time_ < var_250_10 + var_250_11 + arg_250_0 then
				var_250_9.localPosition = Vector3.New(0, -1.13, -6.2)

				local var_250_16 = manager.ui.mainCamera.transform.position - var_250_9.position

				var_250_9.forward = Vector3.New(var_250_16.x, var_250_16.y, var_250_16.z)

				local var_250_17 = var_250_9.localEulerAngles

				var_250_17.z = 0
				var_250_17.x = 0
				var_250_9.localEulerAngles = var_250_17
			end

			local var_250_18 = 0

			if var_250_18 < arg_247_1.time_ and arg_247_1.time_ <= var_250_18 + arg_250_0 then
				arg_247_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037actionlink/10037action432")
			end

			local var_250_19 = 0

			if var_250_19 < arg_247_1.time_ and arg_247_1.time_ <= var_250_19 + arg_250_0 then
				arg_247_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_250_20 = arg_247_1.actors_["10037ui_story"]
			local var_250_21 = 0

			if var_250_21 < arg_247_1.time_ and arg_247_1.time_ <= var_250_21 + arg_250_0 and arg_247_1.var_.characterEffect10037ui_story == nil then
				arg_247_1.var_.characterEffect10037ui_story = var_250_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_22 = 0.2

			if var_250_21 <= arg_247_1.time_ and arg_247_1.time_ < var_250_21 + var_250_22 then
				local var_250_23 = (arg_247_1.time_ - var_250_21) / var_250_22

				if arg_247_1.var_.characterEffect10037ui_story then
					arg_247_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_21 + var_250_22 and arg_247_1.time_ < var_250_21 + var_250_22 + arg_250_0 and arg_247_1.var_.characterEffect10037ui_story then
				arg_247_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_250_24 = 0
			local var_250_25 = 0.4

			if var_250_24 < arg_247_1.time_ and arg_247_1.time_ <= var_250_24 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_26 = arg_247_1:FormatText(StoryNameCfg[383].name)

				arg_247_1.leftNameTxt_.text = var_250_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_27 = arg_247_1:GetWordFromCfg(120151061)
				local var_250_28 = arg_247_1:FormatText(var_250_27.content)

				arg_247_1.text_.text = var_250_28

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_29 = 16
				local var_250_30 = utf8.len(var_250_28)
				local var_250_31 = var_250_29 <= 0 and var_250_25 or var_250_25 * (var_250_30 / var_250_29)

				if var_250_31 > 0 and var_250_25 < var_250_31 then
					arg_247_1.talkMaxDuration = var_250_31

					if var_250_31 + var_250_24 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_31 + var_250_24
					end
				end

				arg_247_1.text_.text = var_250_28
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151061", "story_v_out_120151.awb") ~= 0 then
					local var_250_32 = manager.audio:GetVoiceLength("story_v_out_120151", "120151061", "story_v_out_120151.awb") / 1000

					if var_250_32 + var_250_24 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_32 + var_250_24
					end

					if var_250_27.prefab_name ~= "" and arg_247_1.actors_[var_250_27.prefab_name] ~= nil then
						local var_250_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_27.prefab_name].transform, "story_v_out_120151", "120151061", "story_v_out_120151.awb")

						arg_247_1:RecordAudio("120151061", var_250_33)
						arg_247_1:RecordAudio("120151061", var_250_33)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_120151", "120151061", "story_v_out_120151.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_120151", "120151061", "story_v_out_120151.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_34 = math.max(var_250_25, arg_247_1.talkMaxDuration)

			if var_250_24 <= arg_247_1.time_ and arg_247_1.time_ < var_250_24 + var_250_34 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_24) / var_250_34

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_24 + var_250_34 and arg_247_1.time_ < var_250_24 + var_250_34 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play120151062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 120151062
		arg_251_1.duration_ = 13.1

		local var_251_0 = {
			zh = 11.9,
			ja = 13.1
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
				arg_251_0:Play120151063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_254_1 = 0
			local var_254_2 = 1

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_3 = arg_251_1:FormatText(StoryNameCfg[383].name)

				arg_251_1.leftNameTxt_.text = var_254_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_4 = arg_251_1:GetWordFromCfg(120151062)
				local var_254_5 = arg_251_1:FormatText(var_254_4.content)

				arg_251_1.text_.text = var_254_5

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_6 = 40
				local var_254_7 = utf8.len(var_254_5)
				local var_254_8 = var_254_6 <= 0 and var_254_2 or var_254_2 * (var_254_7 / var_254_6)

				if var_254_8 > 0 and var_254_2 < var_254_8 then
					arg_251_1.talkMaxDuration = var_254_8

					if var_254_8 + var_254_1 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_1
					end
				end

				arg_251_1.text_.text = var_254_5
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151062", "story_v_out_120151.awb") ~= 0 then
					local var_254_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151062", "story_v_out_120151.awb") / 1000

					if var_254_9 + var_254_1 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_9 + var_254_1
					end

					if var_254_4.prefab_name ~= "" and arg_251_1.actors_[var_254_4.prefab_name] ~= nil then
						local var_254_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_4.prefab_name].transform, "story_v_out_120151", "120151062", "story_v_out_120151.awb")

						arg_251_1:RecordAudio("120151062", var_254_10)
						arg_251_1:RecordAudio("120151062", var_254_10)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_120151", "120151062", "story_v_out_120151.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_120151", "120151062", "story_v_out_120151.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_11 = math.max(var_254_2, arg_251_1.talkMaxDuration)

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_11 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_1) / var_254_11

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_1 + var_254_11 and arg_251_1.time_ < var_254_1 + var_254_11 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play120151063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 120151063
		arg_255_1.duration_ = 10.5

		local var_255_0 = {
			zh = 4.433,
			ja = 10.5
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
				arg_255_0:Play120151064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_258_1 = 0
			local var_258_2 = 0.4

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_3 = arg_255_1:FormatText(StoryNameCfg[383].name)

				arg_255_1.leftNameTxt_.text = var_258_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_4 = arg_255_1:GetWordFromCfg(120151063)
				local var_258_5 = arg_255_1:FormatText(var_258_4.content)

				arg_255_1.text_.text = var_258_5

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_6 = 16
				local var_258_7 = utf8.len(var_258_5)
				local var_258_8 = var_258_6 <= 0 and var_258_2 or var_258_2 * (var_258_7 / var_258_6)

				if var_258_8 > 0 and var_258_2 < var_258_8 then
					arg_255_1.talkMaxDuration = var_258_8

					if var_258_8 + var_258_1 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_1
					end
				end

				arg_255_1.text_.text = var_258_5
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151063", "story_v_out_120151.awb") ~= 0 then
					local var_258_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151063", "story_v_out_120151.awb") / 1000

					if var_258_9 + var_258_1 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_9 + var_258_1
					end

					if var_258_4.prefab_name ~= "" and arg_255_1.actors_[var_258_4.prefab_name] ~= nil then
						local var_258_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_4.prefab_name].transform, "story_v_out_120151", "120151063", "story_v_out_120151.awb")

						arg_255_1:RecordAudio("120151063", var_258_10)
						arg_255_1:RecordAudio("120151063", var_258_10)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_120151", "120151063", "story_v_out_120151.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_120151", "120151063", "story_v_out_120151.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_11 = math.max(var_258_2, arg_255_1.talkMaxDuration)

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_11 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_1) / var_258_11

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_1 + var_258_11 and arg_255_1.time_ < var_258_1 + var_258_11 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play120151064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 120151064
		arg_259_1.duration_ = 2.4

		local var_259_0 = {
			zh = 2.333333333332,
			ja = 2.4
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
				arg_259_0:Play120151065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10037ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10037ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(0, 100, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10037ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, 100, 0)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = arg_259_1.actors_["1069ui_story"].transform
			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 then
				arg_259_1.var_.moveOldPos1069ui_story = var_262_9.localPosition
			end

			local var_262_11 = 0.001

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_10) / var_262_11
				local var_262_13 = Vector3.New(0, -1, -6)

				var_262_9.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1069ui_story, var_262_13, var_262_12)

				local var_262_14 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_14.x, var_262_14.y, var_262_14.z)

				local var_262_15 = var_262_9.localEulerAngles

				var_262_15.z = 0
				var_262_15.x = 0
				var_262_9.localEulerAngles = var_262_15
			end

			if arg_259_1.time_ >= var_262_10 + var_262_11 and arg_259_1.time_ < var_262_10 + var_262_11 + arg_262_0 then
				var_262_9.localPosition = Vector3.New(0, -1, -6)

				local var_262_16 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_16.x, var_262_16.y, var_262_16.z)

				local var_262_17 = var_262_9.localEulerAngles

				var_262_17.z = 0
				var_262_17.x = 0
				var_262_9.localEulerAngles = var_262_17
			end

			local var_262_18 = 0

			if var_262_18 < arg_259_1.time_ and arg_259_1.time_ <= var_262_18 + arg_262_0 then
				arg_259_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_262_19 = 0

			if var_262_19 < arg_259_1.time_ and arg_259_1.time_ <= var_262_19 + arg_262_0 then
				arg_259_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_262_20 = arg_259_1.actors_["1069ui_story"]
			local var_262_21 = 0

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 and arg_259_1.var_.characterEffect1069ui_story == nil then
				arg_259_1.var_.characterEffect1069ui_story = var_262_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_22 = 0.2

			if var_262_21 <= arg_259_1.time_ and arg_259_1.time_ < var_262_21 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_21) / var_262_22

				if arg_259_1.var_.characterEffect1069ui_story then
					arg_259_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_21 + var_262_22 and arg_259_1.time_ < var_262_21 + var_262_22 + arg_262_0 and arg_259_1.var_.characterEffect1069ui_story then
				arg_259_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_262_24 = 0
			local var_262_25 = 0.25

			if var_262_24 < arg_259_1.time_ and arg_259_1.time_ <= var_262_24 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_26 = arg_259_1:FormatText(StoryNameCfg[378].name)

				arg_259_1.leftNameTxt_.text = var_262_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_27 = arg_259_1:GetWordFromCfg(120151064)
				local var_262_28 = arg_259_1:FormatText(var_262_27.content)

				arg_259_1.text_.text = var_262_28

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_29 = 10
				local var_262_30 = utf8.len(var_262_28)
				local var_262_31 = var_262_29 <= 0 and var_262_25 or var_262_25 * (var_262_30 / var_262_29)

				if var_262_31 > 0 and var_262_25 < var_262_31 then
					arg_259_1.talkMaxDuration = var_262_31

					if var_262_31 + var_262_24 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_31 + var_262_24
					end
				end

				arg_259_1.text_.text = var_262_28
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151064", "story_v_out_120151.awb") ~= 0 then
					local var_262_32 = manager.audio:GetVoiceLength("story_v_out_120151", "120151064", "story_v_out_120151.awb") / 1000

					if var_262_32 + var_262_24 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_32 + var_262_24
					end

					if var_262_27.prefab_name ~= "" and arg_259_1.actors_[var_262_27.prefab_name] ~= nil then
						local var_262_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_27.prefab_name].transform, "story_v_out_120151", "120151064", "story_v_out_120151.awb")

						arg_259_1:RecordAudio("120151064", var_262_33)
						arg_259_1:RecordAudio("120151064", var_262_33)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_120151", "120151064", "story_v_out_120151.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_120151", "120151064", "story_v_out_120151.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_34 = math.max(var_262_25, arg_259_1.talkMaxDuration)

			if var_262_24 <= arg_259_1.time_ and arg_259_1.time_ < var_262_24 + var_262_34 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_24) / var_262_34

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_24 + var_262_34 and arg_259_1.time_ < var_262_24 + var_262_34 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play120151065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 120151065
		arg_263_1.duration_ = 5.933

		local var_263_0 = {
			zh = 4.366,
			ja = 5.933
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
				arg_263_0:Play120151066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_266_1 = 0
			local var_266_2 = 0.6

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_3 = arg_263_1:FormatText(StoryNameCfg[378].name)

				arg_263_1.leftNameTxt_.text = var_266_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_4 = arg_263_1:GetWordFromCfg(120151065)
				local var_266_5 = arg_263_1:FormatText(var_266_4.content)

				arg_263_1.text_.text = var_266_5

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_6 = 24
				local var_266_7 = utf8.len(var_266_5)
				local var_266_8 = var_266_6 <= 0 and var_266_2 or var_266_2 * (var_266_7 / var_266_6)

				if var_266_8 > 0 and var_266_2 < var_266_8 then
					arg_263_1.talkMaxDuration = var_266_8

					if var_266_8 + var_266_1 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_1
					end
				end

				arg_263_1.text_.text = var_266_5
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151065", "story_v_out_120151.awb") ~= 0 then
					local var_266_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151065", "story_v_out_120151.awb") / 1000

					if var_266_9 + var_266_1 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_9 + var_266_1
					end

					if var_266_4.prefab_name ~= "" and arg_263_1.actors_[var_266_4.prefab_name] ~= nil then
						local var_266_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_4.prefab_name].transform, "story_v_out_120151", "120151065", "story_v_out_120151.awb")

						arg_263_1:RecordAudio("120151065", var_266_10)
						arg_263_1:RecordAudio("120151065", var_266_10)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_120151", "120151065", "story_v_out_120151.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_120151", "120151065", "story_v_out_120151.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_11 = math.max(var_266_2, arg_263_1.talkMaxDuration)

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_11 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_1) / var_266_11

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_1 + var_266_11 and arg_263_1.time_ < var_266_1 + var_266_11 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play120151066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 120151066
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play120151067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1069ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1069ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, 100, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1069ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, 100, 0)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = arg_267_1.actors_["10037ui_story"].transform
			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 then
				arg_267_1.var_.moveOldPos10037ui_story = var_270_9.localPosition
			end

			local var_270_11 = 0.001

			if var_270_10 <= arg_267_1.time_ and arg_267_1.time_ < var_270_10 + var_270_11 then
				local var_270_12 = (arg_267_1.time_ - var_270_10) / var_270_11
				local var_270_13 = Vector3.New(0, -1.13, -6.2)

				var_270_9.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos10037ui_story, var_270_13, var_270_12)

				local var_270_14 = manager.ui.mainCamera.transform.position - var_270_9.position

				var_270_9.forward = Vector3.New(var_270_14.x, var_270_14.y, var_270_14.z)

				local var_270_15 = var_270_9.localEulerAngles

				var_270_15.z = 0
				var_270_15.x = 0
				var_270_9.localEulerAngles = var_270_15
			end

			if arg_267_1.time_ >= var_270_10 + var_270_11 and arg_267_1.time_ < var_270_10 + var_270_11 + arg_270_0 then
				var_270_9.localPosition = Vector3.New(0, -1.13, -6.2)

				local var_270_16 = manager.ui.mainCamera.transform.position - var_270_9.position

				var_270_9.forward = Vector3.New(var_270_16.x, var_270_16.y, var_270_16.z)

				local var_270_17 = var_270_9.localEulerAngles

				var_270_17.z = 0
				var_270_17.x = 0
				var_270_9.localEulerAngles = var_270_17
			end

			local var_270_18 = 0

			if var_270_18 < arg_267_1.time_ and arg_267_1.time_ <= var_270_18 + arg_270_0 then
				arg_267_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action1_1")
			end

			local var_270_19 = 0

			if var_270_19 < arg_267_1.time_ and arg_267_1.time_ <= var_270_19 + arg_270_0 then
				arg_267_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_270_20 = arg_267_1.actors_["10037ui_story"]
			local var_270_21 = 0

			if var_270_21 < arg_267_1.time_ and arg_267_1.time_ <= var_270_21 + arg_270_0 and arg_267_1.var_.characterEffect10037ui_story == nil then
				arg_267_1.var_.characterEffect10037ui_story = var_270_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_22 = 0.2

			if var_270_21 <= arg_267_1.time_ and arg_267_1.time_ < var_270_21 + var_270_22 then
				local var_270_23 = (arg_267_1.time_ - var_270_21) / var_270_22

				if arg_267_1.var_.characterEffect10037ui_story then
					arg_267_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_21 + var_270_22 and arg_267_1.time_ < var_270_21 + var_270_22 + arg_270_0 and arg_267_1.var_.characterEffect10037ui_story then
				arg_267_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_270_24 = 0
			local var_270_25 = 0.05

			if var_270_24 < arg_267_1.time_ and arg_267_1.time_ <= var_270_24 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_26 = arg_267_1:FormatText(StoryNameCfg[383].name)

				arg_267_1.leftNameTxt_.text = var_270_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_27 = arg_267_1:GetWordFromCfg(120151066)
				local var_270_28 = arg_267_1:FormatText(var_270_27.content)

				arg_267_1.text_.text = var_270_28

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_29 = 2
				local var_270_30 = utf8.len(var_270_28)
				local var_270_31 = var_270_29 <= 0 and var_270_25 or var_270_25 * (var_270_30 / var_270_29)

				if var_270_31 > 0 and var_270_25 < var_270_31 then
					arg_267_1.talkMaxDuration = var_270_31

					if var_270_31 + var_270_24 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_31 + var_270_24
					end
				end

				arg_267_1.text_.text = var_270_28
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_32 = math.max(var_270_25, arg_267_1.talkMaxDuration)

			if var_270_24 <= arg_267_1.time_ and arg_267_1.time_ < var_270_24 + var_270_32 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_24) / var_270_32

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_24 + var_270_32 and arg_267_1.time_ < var_270_24 + var_270_32 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play120151067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 120151067
		arg_271_1.duration_ = 6.633

		local var_271_0 = {
			zh = 4.266,
			ja = 6.633
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
				arg_271_0:Play120151068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["10037ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos10037ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(0, -1.13, -6.2)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos10037ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0, -1.13, -6.2)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = 0

			if var_274_9 < arg_271_1.time_ and arg_271_1.time_ <= var_274_9 + arg_274_0 then
				arg_271_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action2_1")
			end

			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_274_11 = 0
			local var_274_12 = 0.375

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_13 = arg_271_1:FormatText(StoryNameCfg[383].name)

				arg_271_1.leftNameTxt_.text = var_274_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_14 = arg_271_1:GetWordFromCfg(120151067)
				local var_274_15 = arg_271_1:FormatText(var_274_14.content)

				arg_271_1.text_.text = var_274_15

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_16 = 15
				local var_274_17 = utf8.len(var_274_15)
				local var_274_18 = var_274_16 <= 0 and var_274_12 or var_274_12 * (var_274_17 / var_274_16)

				if var_274_18 > 0 and var_274_12 < var_274_18 then
					arg_271_1.talkMaxDuration = var_274_18

					if var_274_18 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_18 + var_274_11
					end
				end

				arg_271_1.text_.text = var_274_15
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151067", "story_v_out_120151.awb") ~= 0 then
					local var_274_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151067", "story_v_out_120151.awb") / 1000

					if var_274_19 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_11
					end

					if var_274_14.prefab_name ~= "" and arg_271_1.actors_[var_274_14.prefab_name] ~= nil then
						local var_274_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_14.prefab_name].transform, "story_v_out_120151", "120151067", "story_v_out_120151.awb")

						arg_271_1:RecordAudio("120151067", var_274_20)
						arg_271_1:RecordAudio("120151067", var_274_20)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_120151", "120151067", "story_v_out_120151.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_120151", "120151067", "story_v_out_120151.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_21 = math.max(var_274_12, arg_271_1.talkMaxDuration)

			if var_274_11 <= arg_271_1.time_ and arg_271_1.time_ < var_274_11 + var_274_21 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_11) / var_274_21

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_11 + var_274_21 and arg_271_1.time_ < var_274_11 + var_274_21 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play120151068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 120151068
		arg_275_1.duration_ = 6.099999999999

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play120151069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["10037ui_story"].transform
			local var_278_1 = 1.966

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos10037ui_story = var_278_0.localPosition
			end

			local var_278_2 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2
				local var_278_4 = Vector3.New(0, 100, 0)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos10037ui_story, var_278_4, var_278_3)

				local var_278_5 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_5.x, var_278_5.y, var_278_5.z)

				local var_278_6 = var_278_0.localEulerAngles

				var_278_6.z = 0
				var_278_6.x = 0
				var_278_0.localEulerAngles = var_278_6
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(0, 100, 0)

				local var_278_7 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_7.x, var_278_7.y, var_278_7.z)

				local var_278_8 = var_278_0.localEulerAngles

				var_278_8.z = 0
				var_278_8.x = 0
				var_278_0.localEulerAngles = var_278_8
			end

			local var_278_9 = 0

			if var_278_9 < arg_275_1.time_ and arg_275_1.time_ <= var_278_9 + arg_278_0 then
				arg_275_1.mask_.enabled = true
				arg_275_1.mask_.raycastTarget = true

				arg_275_1:SetGaussion(false)
			end

			local var_278_10 = 2

			if var_278_9 <= arg_275_1.time_ and arg_275_1.time_ < var_278_9 + var_278_10 then
				local var_278_11 = (arg_275_1.time_ - var_278_9) / var_278_10
				local var_278_12 = Color.New(0, 0, 0)

				var_278_12.a = Mathf.Lerp(0, 1, var_278_11)
				arg_275_1.mask_.color = var_278_12
			end

			if arg_275_1.time_ >= var_278_9 + var_278_10 and arg_275_1.time_ < var_278_9 + var_278_10 + arg_278_0 then
				local var_278_13 = Color.New(0, 0, 0)

				var_278_13.a = 1
				arg_275_1.mask_.color = var_278_13
			end

			local var_278_14 = 2

			if var_278_14 < arg_275_1.time_ and arg_275_1.time_ <= var_278_14 + arg_278_0 then
				arg_275_1.mask_.enabled = true
				arg_275_1.mask_.raycastTarget = true

				arg_275_1:SetGaussion(false)
			end

			local var_278_15 = 2

			if var_278_14 <= arg_275_1.time_ and arg_275_1.time_ < var_278_14 + var_278_15 then
				local var_278_16 = (arg_275_1.time_ - var_278_14) / var_278_15
				local var_278_17 = Color.New(0, 0, 0)

				var_278_17.a = Mathf.Lerp(1, 0, var_278_16)
				arg_275_1.mask_.color = var_278_17
			end

			if arg_275_1.time_ >= var_278_14 + var_278_15 and arg_275_1.time_ < var_278_14 + var_278_15 + arg_278_0 then
				local var_278_18 = Color.New(0, 0, 0)
				local var_278_19 = 0

				arg_275_1.mask_.enabled = false
				var_278_18.a = var_278_19
				arg_275_1.mask_.color = var_278_18
			end

			local var_278_20 = 2

			if var_278_20 < arg_275_1.time_ and arg_275_1.time_ <= var_278_20 + arg_278_0 then
				arg_275_1.fswbg_:SetActive(true)
				arg_275_1.dialog_:SetActive(false)

				arg_275_1.fswtw_.percent = 0

				local var_278_21 = arg_275_1:GetWordFromCfg(120151068)
				local var_278_22 = arg_275_1:FormatText(var_278_21.content)

				arg_275_1.fswt_.text = var_278_22

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.fswt_)

				arg_275_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_275_1.fswtw_:SetDirty()

				arg_275_1.typewritterCharCountI18N = 0

				SetActive(arg_275_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_275_1:ShowNextGo(false)
			end

			local var_278_23 = 2.5

			if var_278_23 < arg_275_1.time_ and arg_275_1.time_ <= var_278_23 + arg_278_0 then
				arg_275_1.var_.oldValueTypewriter = arg_275_1.fswtw_.percent

				arg_275_1:ShowNextGo(false)
			end

			local var_278_24 = 40
			local var_278_25 = 2.66666666666667
			local var_278_26 = arg_275_1:GetWordFromCfg(120151068)
			local var_278_27 = arg_275_1:FormatText(var_278_26.content)
			local var_278_28, var_278_29 = arg_275_1:GetPercentByPara(var_278_27, 1)

			if var_278_23 < arg_275_1.time_ and arg_275_1.time_ <= var_278_23 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0

				local var_278_30 = var_278_24 <= 0 and var_278_25 or var_278_25 * ((var_278_29 - arg_275_1.typewritterCharCountI18N) / var_278_24)

				if var_278_30 > 0 and var_278_25 < var_278_30 then
					arg_275_1.talkMaxDuration = var_278_30

					if var_278_30 + var_278_23 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_30 + var_278_23
					end
				end
			end

			local var_278_31 = 2.66666666666667
			local var_278_32 = math.max(var_278_31, arg_275_1.talkMaxDuration)

			if var_278_23 <= arg_275_1.time_ and arg_275_1.time_ < var_278_23 + var_278_32 then
				local var_278_33 = (arg_275_1.time_ - var_278_23) / var_278_32

				arg_275_1.fswtw_.percent = Mathf.Lerp(arg_275_1.var_.oldValueTypewriter, var_278_28, var_278_33)
				arg_275_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_275_1.fswtw_:SetDirty()
			end

			if arg_275_1.time_ >= var_278_23 + var_278_32 and arg_275_1.time_ < var_278_23 + var_278_32 + arg_278_0 then
				arg_275_1.fswtw_.percent = var_278_28

				arg_275_1.fswtw_:SetDirty()
				arg_275_1:ShowNextGo(true)

				arg_275_1.typewritterCharCountI18N = var_278_29
			end

			local var_278_34 = 2

			if var_278_34 < arg_275_1.time_ and arg_275_1.time_ <= var_278_34 + arg_278_0 then
				local var_278_35 = arg_275_1.fswbg_.transform:Find("textbox/adapt/content") or arg_275_1.fswbg_.transform:Find("textbox/content")
				local var_278_36 = var_278_35:GetComponent("Text")
				local var_278_37 = var_278_35:GetComponent("RectTransform")

				var_278_36.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_278_37.offsetMin = Vector2.New(0, 0)
				var_278_37.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play120151069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 120151069
		arg_279_1.duration_ = 3.266666666666

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play120151070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.fswbg_:SetActive(true)
				arg_279_1.dialog_:SetActive(false)

				arg_279_1.fswtw_.percent = 0

				local var_282_1 = arg_279_1:GetWordFromCfg(120151069)
				local var_282_2 = arg_279_1:FormatText(var_282_1.content)

				arg_279_1.fswt_.text = var_282_2

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.fswt_)

				arg_279_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_279_1.fswtw_:SetDirty()

				arg_279_1.typewritterCharCountI18N = 0

				SetActive(arg_279_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_279_1:ShowNextGo(false)
			end

			local var_282_3 = 0.0166666666666667

			if var_282_3 < arg_279_1.time_ and arg_279_1.time_ <= var_282_3 + arg_282_0 then
				arg_279_1.var_.oldValueTypewriter = arg_279_1.fswtw_.percent

				arg_279_1:ShowNextGo(false)
			end

			local var_282_4 = 41
			local var_282_5 = 2.73333333333333
			local var_282_6 = arg_279_1:GetWordFromCfg(120151069)
			local var_282_7 = arg_279_1:FormatText(var_282_6.content)
			local var_282_8, var_282_9 = arg_279_1:GetPercentByPara(var_282_7, 1)

			if var_282_3 < arg_279_1.time_ and arg_279_1.time_ <= var_282_3 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0

				local var_282_10 = var_282_4 <= 0 and var_282_5 or var_282_5 * ((var_282_9 - arg_279_1.typewritterCharCountI18N) / var_282_4)

				if var_282_10 > 0 and var_282_5 < var_282_10 then
					arg_279_1.talkMaxDuration = var_282_10

					if var_282_10 + var_282_3 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_10 + var_282_3
					end
				end
			end

			local var_282_11 = 2.73333333333333
			local var_282_12 = math.max(var_282_11, arg_279_1.talkMaxDuration)

			if var_282_3 <= arg_279_1.time_ and arg_279_1.time_ < var_282_3 + var_282_12 then
				local var_282_13 = (arg_279_1.time_ - var_282_3) / var_282_12

				arg_279_1.fswtw_.percent = Mathf.Lerp(arg_279_1.var_.oldValueTypewriter, var_282_8, var_282_13)
				arg_279_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_279_1.fswtw_:SetDirty()
			end

			if arg_279_1.time_ >= var_282_3 + var_282_12 and arg_279_1.time_ < var_282_3 + var_282_12 + arg_282_0 then
				arg_279_1.fswtw_.percent = var_282_8

				arg_279_1.fswtw_:SetDirty()
				arg_279_1:ShowNextGo(true)

				arg_279_1.typewritterCharCountI18N = var_282_9
			end
		end
	end,
	Play120151070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 120151070
		arg_283_1.duration_ = 4.466666666666

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play120151071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 2

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.fswbg_:SetActive(false)
				arg_283_1.dialog_:SetActive(true)
				arg_283_1:ShowNextGo(false)
			end

			local var_286_1 = arg_283_1.actors_["1071ui_story"].transform
			local var_286_2 = 2

			if var_286_2 < arg_283_1.time_ and arg_283_1.time_ <= var_286_2 + arg_286_0 then
				arg_283_1.var_.moveOldPos1071ui_story = var_286_1.localPosition
			end

			local var_286_3 = 0.001

			if var_286_2 <= arg_283_1.time_ and arg_283_1.time_ < var_286_2 + var_286_3 then
				local var_286_4 = (arg_283_1.time_ - var_286_2) / var_286_3
				local var_286_5 = Vector3.New(0.7, -1.05, -6.2)

				var_286_1.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1071ui_story, var_286_5, var_286_4)

				local var_286_6 = manager.ui.mainCamera.transform.position - var_286_1.position

				var_286_1.forward = Vector3.New(var_286_6.x, var_286_6.y, var_286_6.z)

				local var_286_7 = var_286_1.localEulerAngles

				var_286_7.z = 0
				var_286_7.x = 0
				var_286_1.localEulerAngles = var_286_7
			end

			if arg_283_1.time_ >= var_286_2 + var_286_3 and arg_283_1.time_ < var_286_2 + var_286_3 + arg_286_0 then
				var_286_1.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_286_8 = manager.ui.mainCamera.transform.position - var_286_1.position

				var_286_1.forward = Vector3.New(var_286_8.x, var_286_8.y, var_286_8.z)

				local var_286_9 = var_286_1.localEulerAngles

				var_286_9.z = 0
				var_286_9.x = 0
				var_286_1.localEulerAngles = var_286_9
			end

			local var_286_10 = arg_283_1.actors_["1071ui_story"]
			local var_286_11 = 2

			if var_286_11 < arg_283_1.time_ and arg_283_1.time_ <= var_286_11 + arg_286_0 and arg_283_1.var_.characterEffect1071ui_story == nil then
				arg_283_1.var_.characterEffect1071ui_story = var_286_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_12 = 0.0166666666666667

			if var_286_11 <= arg_283_1.time_ and arg_283_1.time_ < var_286_11 + var_286_12 then
				local var_286_13 = (arg_283_1.time_ - var_286_11) / var_286_12

				if arg_283_1.var_.characterEffect1071ui_story then
					local var_286_14 = Mathf.Lerp(0, 0.5, var_286_13)

					arg_283_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1071ui_story.fillRatio = var_286_14
				end
			end

			if arg_283_1.time_ >= var_286_11 + var_286_12 and arg_283_1.time_ < var_286_11 + var_286_12 + arg_286_0 and arg_283_1.var_.characterEffect1071ui_story then
				local var_286_15 = 0.5

				arg_283_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1071ui_story.fillRatio = var_286_15
			end

			local var_286_16 = arg_283_1.actors_["1069ui_story"].transform
			local var_286_17 = 2

			if var_286_17 < arg_283_1.time_ and arg_283_1.time_ <= var_286_17 + arg_286_0 then
				arg_283_1.var_.moveOldPos1069ui_story = var_286_16.localPosition
			end

			local var_286_18 = 0.001

			if var_286_17 <= arg_283_1.time_ and arg_283_1.time_ < var_286_17 + var_286_18 then
				local var_286_19 = (arg_283_1.time_ - var_286_17) / var_286_18
				local var_286_20 = Vector3.New(-0.7, -1, -6)

				var_286_16.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1069ui_story, var_286_20, var_286_19)

				local var_286_21 = manager.ui.mainCamera.transform.position - var_286_16.position

				var_286_16.forward = Vector3.New(var_286_21.x, var_286_21.y, var_286_21.z)

				local var_286_22 = var_286_16.localEulerAngles

				var_286_22.z = 0
				var_286_22.x = 0
				var_286_16.localEulerAngles = var_286_22
			end

			if arg_283_1.time_ >= var_286_17 + var_286_18 and arg_283_1.time_ < var_286_17 + var_286_18 + arg_286_0 then
				var_286_16.localPosition = Vector3.New(-0.7, -1, -6)

				local var_286_23 = manager.ui.mainCamera.transform.position - var_286_16.position

				var_286_16.forward = Vector3.New(var_286_23.x, var_286_23.y, var_286_23.z)

				local var_286_24 = var_286_16.localEulerAngles

				var_286_24.z = 0
				var_286_24.x = 0
				var_286_16.localEulerAngles = var_286_24
			end

			local var_286_25 = 2

			if var_286_25 < arg_283_1.time_ and arg_283_1.time_ <= var_286_25 + arg_286_0 then
				arg_283_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_286_26 = 2

			if var_286_26 < arg_283_1.time_ and arg_283_1.time_ <= var_286_26 + arg_286_0 then
				arg_283_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_286_27 = arg_283_1.actors_["1069ui_story"]
			local var_286_28 = 2

			if var_286_28 < arg_283_1.time_ and arg_283_1.time_ <= var_286_28 + arg_286_0 and arg_283_1.var_.characterEffect1069ui_story == nil then
				arg_283_1.var_.characterEffect1069ui_story = var_286_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_29 = 0.2

			if var_286_28 <= arg_283_1.time_ and arg_283_1.time_ < var_286_28 + var_286_29 then
				local var_286_30 = (arg_283_1.time_ - var_286_28) / var_286_29

				if arg_283_1.var_.characterEffect1069ui_story then
					arg_283_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_28 + var_286_29 and arg_283_1.time_ < var_286_28 + var_286_29 + arg_286_0 and arg_283_1.var_.characterEffect1069ui_story then
				arg_283_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_286_31 = 2

			if var_286_31 < arg_283_1.time_ and arg_283_1.time_ <= var_286_31 + arg_286_0 then
				arg_283_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_286_32 = 1.96666666666667

			if var_286_32 < arg_283_1.time_ and arg_283_1.time_ <= var_286_32 + arg_286_0 then
				arg_283_1.fswbg_:SetActive(false)
				arg_283_1.dialog_:SetActive(false)
				arg_283_1:ShowNextGo(false)
			end

			local var_286_33 = 0

			if var_286_33 < arg_283_1.time_ and arg_283_1.time_ <= var_286_33 + arg_286_0 then
				arg_283_1.mask_.enabled = true
				arg_283_1.mask_.raycastTarget = true

				arg_283_1:SetGaussion(false)
			end

			local var_286_34 = 2

			if var_286_33 <= arg_283_1.time_ and arg_283_1.time_ < var_286_33 + var_286_34 then
				local var_286_35 = (arg_283_1.time_ - var_286_33) / var_286_34
				local var_286_36 = Color.New(0, 0, 0)

				var_286_36.a = Mathf.Lerp(0, 1, var_286_35)
				arg_283_1.mask_.color = var_286_36
			end

			if arg_283_1.time_ >= var_286_33 + var_286_34 and arg_283_1.time_ < var_286_33 + var_286_34 + arg_286_0 then
				local var_286_37 = Color.New(0, 0, 0)

				var_286_37.a = 1
				arg_283_1.mask_.color = var_286_37
			end

			local var_286_38 = 2

			if var_286_38 < arg_283_1.time_ and arg_283_1.time_ <= var_286_38 + arg_286_0 then
				arg_283_1.mask_.enabled = true
				arg_283_1.mask_.raycastTarget = true

				arg_283_1:SetGaussion(false)
			end

			local var_286_39 = 1

			if var_286_38 <= arg_283_1.time_ and arg_283_1.time_ < var_286_38 + var_286_39 then
				local var_286_40 = (arg_283_1.time_ - var_286_38) / var_286_39
				local var_286_41 = Color.New(0, 0, 0)

				var_286_41.a = Mathf.Lerp(1, 0, var_286_40)
				arg_283_1.mask_.color = var_286_41
			end

			if arg_283_1.time_ >= var_286_38 + var_286_39 and arg_283_1.time_ < var_286_38 + var_286_39 + arg_286_0 then
				local var_286_42 = Color.New(0, 0, 0)
				local var_286_43 = 0

				arg_283_1.mask_.enabled = false
				var_286_42.a = var_286_43
				arg_283_1.mask_.color = var_286_42
			end

			local var_286_44 = 2
			local var_286_45 = 0.125

			if var_286_44 < arg_283_1.time_ and arg_283_1.time_ <= var_286_44 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_46 = arg_283_1:FormatText(StoryNameCfg[378].name)

				arg_283_1.leftNameTxt_.text = var_286_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_47 = arg_283_1:GetWordFromCfg(120151070)
				local var_286_48 = arg_283_1:FormatText(var_286_47.content)

				arg_283_1.text_.text = var_286_48

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_49 = 5
				local var_286_50 = utf8.len(var_286_48)
				local var_286_51 = var_286_49 <= 0 and var_286_45 or var_286_45 * (var_286_50 / var_286_49)

				if var_286_51 > 0 and var_286_45 < var_286_51 then
					arg_283_1.talkMaxDuration = var_286_51

					if var_286_51 + var_286_44 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_51 + var_286_44
					end
				end

				arg_283_1.text_.text = var_286_48
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151070", "story_v_out_120151.awb") ~= 0 then
					local var_286_52 = manager.audio:GetVoiceLength("story_v_out_120151", "120151070", "story_v_out_120151.awb") / 1000

					if var_286_52 + var_286_44 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_52 + var_286_44
					end

					if var_286_47.prefab_name ~= "" and arg_283_1.actors_[var_286_47.prefab_name] ~= nil then
						local var_286_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_47.prefab_name].transform, "story_v_out_120151", "120151070", "story_v_out_120151.awb")

						arg_283_1:RecordAudio("120151070", var_286_53)
						arg_283_1:RecordAudio("120151070", var_286_53)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_120151", "120151070", "story_v_out_120151.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_120151", "120151070", "story_v_out_120151.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_54 = math.max(var_286_45, arg_283_1.talkMaxDuration)

			if var_286_44 <= arg_283_1.time_ and arg_283_1.time_ < var_286_44 + var_286_54 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_44) / var_286_54

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_44 + var_286_54 and arg_283_1.time_ < var_286_44 + var_286_54 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play120151071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 120151071
		arg_287_1.duration_ = 5

		local var_287_0 = {
			zh = 2.4,
			ja = 5
		}
		local var_287_1 = manager.audio:GetLocalizationFlag()

		if var_287_0[var_287_1] ~= nil then
			arg_287_1.duration_ = var_287_0[var_287_1]
		end

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play120151072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1071ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1071ui_story == nil then
				arg_287_1.var_.characterEffect1071ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.2

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1071ui_story then
					arg_287_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1071ui_story then
				arg_287_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_290_4 = arg_287_1.actors_["1069ui_story"]
			local var_290_5 = 0

			if var_290_5 < arg_287_1.time_ and arg_287_1.time_ <= var_290_5 + arg_290_0 and arg_287_1.var_.characterEffect1069ui_story == nil then
				arg_287_1.var_.characterEffect1069ui_story = var_290_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_6 = 0.2

			if var_290_5 <= arg_287_1.time_ and arg_287_1.time_ < var_290_5 + var_290_6 then
				local var_290_7 = (arg_287_1.time_ - var_290_5) / var_290_6

				if arg_287_1.var_.characterEffect1069ui_story then
					local var_290_8 = Mathf.Lerp(0, 0.5, var_290_7)

					arg_287_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1069ui_story.fillRatio = var_290_8
				end
			end

			if arg_287_1.time_ >= var_290_5 + var_290_6 and arg_287_1.time_ < var_290_5 + var_290_6 + arg_290_0 and arg_287_1.var_.characterEffect1069ui_story then
				local var_290_9 = 0.5

				arg_287_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1069ui_story.fillRatio = var_290_9
			end

			local var_290_10 = 0

			if var_290_10 < arg_287_1.time_ and arg_287_1.time_ <= var_290_10 + arg_290_0 then
				arg_287_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_290_11 = 0
			local var_290_12 = 0.35

			if var_290_11 < arg_287_1.time_ and arg_287_1.time_ <= var_290_11 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_13 = arg_287_1:FormatText(StoryNameCfg[384].name)

				arg_287_1.leftNameTxt_.text = var_290_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_14 = arg_287_1:GetWordFromCfg(120151071)
				local var_290_15 = arg_287_1:FormatText(var_290_14.content)

				arg_287_1.text_.text = var_290_15

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_16 = 14
				local var_290_17 = utf8.len(var_290_15)
				local var_290_18 = var_290_16 <= 0 and var_290_12 or var_290_12 * (var_290_17 / var_290_16)

				if var_290_18 > 0 and var_290_12 < var_290_18 then
					arg_287_1.talkMaxDuration = var_290_18

					if var_290_18 + var_290_11 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_18 + var_290_11
					end
				end

				arg_287_1.text_.text = var_290_15
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151071", "story_v_out_120151.awb") ~= 0 then
					local var_290_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151071", "story_v_out_120151.awb") / 1000

					if var_290_19 + var_290_11 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_19 + var_290_11
					end

					if var_290_14.prefab_name ~= "" and arg_287_1.actors_[var_290_14.prefab_name] ~= nil then
						local var_290_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_14.prefab_name].transform, "story_v_out_120151", "120151071", "story_v_out_120151.awb")

						arg_287_1:RecordAudio("120151071", var_290_20)
						arg_287_1:RecordAudio("120151071", var_290_20)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_120151", "120151071", "story_v_out_120151.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_120151", "120151071", "story_v_out_120151.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_21 = math.max(var_290_12, arg_287_1.talkMaxDuration)

			if var_290_11 <= arg_287_1.time_ and arg_287_1.time_ < var_290_11 + var_290_21 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_11) / var_290_21

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_11 + var_290_21 and arg_287_1.time_ < var_290_11 + var_290_21 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play120151072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 120151072
		arg_291_1.duration_ = 4.533

		local var_291_0 = {
			zh = 4.533,
			ja = 3.366
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play120151073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_294_1 = 0
			local var_294_2 = 0.5

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_3 = arg_291_1:FormatText(StoryNameCfg[384].name)

				arg_291_1.leftNameTxt_.text = var_294_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_4 = arg_291_1:GetWordFromCfg(120151072)
				local var_294_5 = arg_291_1:FormatText(var_294_4.content)

				arg_291_1.text_.text = var_294_5

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_6 = 20
				local var_294_7 = utf8.len(var_294_5)
				local var_294_8 = var_294_6 <= 0 and var_294_2 or var_294_2 * (var_294_7 / var_294_6)

				if var_294_8 > 0 and var_294_2 < var_294_8 then
					arg_291_1.talkMaxDuration = var_294_8

					if var_294_8 + var_294_1 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_8 + var_294_1
					end
				end

				arg_291_1.text_.text = var_294_5
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151072", "story_v_out_120151.awb") ~= 0 then
					local var_294_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151072", "story_v_out_120151.awb") / 1000

					if var_294_9 + var_294_1 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_9 + var_294_1
					end

					if var_294_4.prefab_name ~= "" and arg_291_1.actors_[var_294_4.prefab_name] ~= nil then
						local var_294_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_4.prefab_name].transform, "story_v_out_120151", "120151072", "story_v_out_120151.awb")

						arg_291_1:RecordAudio("120151072", var_294_10)
						arg_291_1:RecordAudio("120151072", var_294_10)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_120151", "120151072", "story_v_out_120151.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_120151", "120151072", "story_v_out_120151.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_11 = math.max(var_294_2, arg_291_1.talkMaxDuration)

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_11 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_1) / var_294_11

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_1 + var_294_11 and arg_291_1.time_ < var_294_1 + var_294_11 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play120151073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 120151073
		arg_295_1.duration_ = 2.533

		local var_295_0 = {
			zh = 1.999999999999,
			ja = 2.533
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
				arg_295_0:Play120151074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_298_1 = arg_295_1.actors_["1071ui_story"]
			local var_298_2 = 0

			if var_298_2 < arg_295_1.time_ and arg_295_1.time_ <= var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1071ui_story == nil then
				arg_295_1.var_.characterEffect1071ui_story = var_298_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_3 = 0.2

			if var_298_2 <= arg_295_1.time_ and arg_295_1.time_ < var_298_2 + var_298_3 then
				local var_298_4 = (arg_295_1.time_ - var_298_2) / var_298_3

				if arg_295_1.var_.characterEffect1071ui_story then
					local var_298_5 = Mathf.Lerp(0, 0.5, var_298_4)

					arg_295_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1071ui_story.fillRatio = var_298_5
				end
			end

			if arg_295_1.time_ >= var_298_2 + var_298_3 and arg_295_1.time_ < var_298_2 + var_298_3 + arg_298_0 and arg_295_1.var_.characterEffect1071ui_story then
				local var_298_6 = 0.5

				arg_295_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1071ui_story.fillRatio = var_298_6
			end

			local var_298_7 = arg_295_1.actors_["1069ui_story"]
			local var_298_8 = 0

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 and arg_295_1.var_.characterEffect1069ui_story == nil then
				arg_295_1.var_.characterEffect1069ui_story = var_298_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_9 = 0.2

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_8) / var_298_9

				if arg_295_1.var_.characterEffect1069ui_story then
					arg_295_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_8 + var_298_9 and arg_295_1.time_ < var_298_8 + var_298_9 + arg_298_0 and arg_295_1.var_.characterEffect1069ui_story then
				arg_295_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_298_11 = 0
			local var_298_12 = 0.15

			if var_298_11 < arg_295_1.time_ and arg_295_1.time_ <= var_298_11 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_13 = arg_295_1:FormatText(StoryNameCfg[378].name)

				arg_295_1.leftNameTxt_.text = var_298_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_14 = arg_295_1:GetWordFromCfg(120151073)
				local var_298_15 = arg_295_1:FormatText(var_298_14.content)

				arg_295_1.text_.text = var_298_15

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_16 = 6
				local var_298_17 = utf8.len(var_298_15)
				local var_298_18 = var_298_16 <= 0 and var_298_12 or var_298_12 * (var_298_17 / var_298_16)

				if var_298_18 > 0 and var_298_12 < var_298_18 then
					arg_295_1.talkMaxDuration = var_298_18

					if var_298_18 + var_298_11 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_18 + var_298_11
					end
				end

				arg_295_1.text_.text = var_298_15
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151073", "story_v_out_120151.awb") ~= 0 then
					local var_298_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151073", "story_v_out_120151.awb") / 1000

					if var_298_19 + var_298_11 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_19 + var_298_11
					end

					if var_298_14.prefab_name ~= "" and arg_295_1.actors_[var_298_14.prefab_name] ~= nil then
						local var_298_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_14.prefab_name].transform, "story_v_out_120151", "120151073", "story_v_out_120151.awb")

						arg_295_1:RecordAudio("120151073", var_298_20)
						arg_295_1:RecordAudio("120151073", var_298_20)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_120151", "120151073", "story_v_out_120151.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_120151", "120151073", "story_v_out_120151.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_21 = math.max(var_298_12, arg_295_1.talkMaxDuration)

			if var_298_11 <= arg_295_1.time_ and arg_295_1.time_ < var_298_11 + var_298_21 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_11) / var_298_21

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_11 + var_298_21 and arg_295_1.time_ < var_298_11 + var_298_21 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play120151074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 120151074
		arg_299_1.duration_ = 3.866

		local var_299_0 = {
			zh = 3.866,
			ja = 3.133
		}
		local var_299_1 = manager.audio:GetLocalizationFlag()

		if var_299_0[var_299_1] ~= nil then
			arg_299_1.duration_ = var_299_0[var_299_1]
		end

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play120151075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action452")
			end

			local var_302_1 = arg_299_1.actors_["1071ui_story"]
			local var_302_2 = 0

			if var_302_2 < arg_299_1.time_ and arg_299_1.time_ <= var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1071ui_story == nil then
				arg_299_1.var_.characterEffect1071ui_story = var_302_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_3 = 0.2

			if var_302_2 <= arg_299_1.time_ and arg_299_1.time_ < var_302_2 + var_302_3 then
				local var_302_4 = (arg_299_1.time_ - var_302_2) / var_302_3

				if arg_299_1.var_.characterEffect1071ui_story then
					arg_299_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_2 + var_302_3 and arg_299_1.time_ < var_302_2 + var_302_3 + arg_302_0 and arg_299_1.var_.characterEffect1071ui_story then
				arg_299_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_302_5 = arg_299_1.actors_["1069ui_story"]
			local var_302_6 = 0

			if var_302_6 < arg_299_1.time_ and arg_299_1.time_ <= var_302_6 + arg_302_0 and arg_299_1.var_.characterEffect1069ui_story == nil then
				arg_299_1.var_.characterEffect1069ui_story = var_302_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_7 = 0.2

			if var_302_6 <= arg_299_1.time_ and arg_299_1.time_ < var_302_6 + var_302_7 then
				local var_302_8 = (arg_299_1.time_ - var_302_6) / var_302_7

				if arg_299_1.var_.characterEffect1069ui_story then
					local var_302_9 = Mathf.Lerp(0, 0.5, var_302_8)

					arg_299_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1069ui_story.fillRatio = var_302_9
				end
			end

			if arg_299_1.time_ >= var_302_6 + var_302_7 and arg_299_1.time_ < var_302_6 + var_302_7 + arg_302_0 and arg_299_1.var_.characterEffect1069ui_story then
				local var_302_10 = 0.5

				arg_299_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1069ui_story.fillRatio = var_302_10
			end

			local var_302_11 = 0
			local var_302_12 = 0.35

			if var_302_11 < arg_299_1.time_ and arg_299_1.time_ <= var_302_11 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_13 = arg_299_1:FormatText(StoryNameCfg[384].name)

				arg_299_1.leftNameTxt_.text = var_302_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_14 = arg_299_1:GetWordFromCfg(120151074)
				local var_302_15 = arg_299_1:FormatText(var_302_14.content)

				arg_299_1.text_.text = var_302_15

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_16 = 14
				local var_302_17 = utf8.len(var_302_15)
				local var_302_18 = var_302_16 <= 0 and var_302_12 or var_302_12 * (var_302_17 / var_302_16)

				if var_302_18 > 0 and var_302_12 < var_302_18 then
					arg_299_1.talkMaxDuration = var_302_18

					if var_302_18 + var_302_11 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_18 + var_302_11
					end
				end

				arg_299_1.text_.text = var_302_15
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151074", "story_v_out_120151.awb") ~= 0 then
					local var_302_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151074", "story_v_out_120151.awb") / 1000

					if var_302_19 + var_302_11 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_19 + var_302_11
					end

					if var_302_14.prefab_name ~= "" and arg_299_1.actors_[var_302_14.prefab_name] ~= nil then
						local var_302_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_14.prefab_name].transform, "story_v_out_120151", "120151074", "story_v_out_120151.awb")

						arg_299_1:RecordAudio("120151074", var_302_20)
						arg_299_1:RecordAudio("120151074", var_302_20)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_120151", "120151074", "story_v_out_120151.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_120151", "120151074", "story_v_out_120151.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_21 = math.max(var_302_12, arg_299_1.talkMaxDuration)

			if var_302_11 <= arg_299_1.time_ and arg_299_1.time_ < var_302_11 + var_302_21 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_11) / var_302_21

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_11 + var_302_21 and arg_299_1.time_ < var_302_11 + var_302_21 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play120151075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 120151075
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play120151076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1071ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story == nil then
				arg_303_1.var_.characterEffect1071ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.2

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1071ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1071ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1071ui_story.fillRatio = var_306_5
			end

			local var_306_6 = 0
			local var_306_7 = 0.475

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_8 = arg_303_1:GetWordFromCfg(120151075)
				local var_306_9 = arg_303_1:FormatText(var_306_8.content)

				arg_303_1.text_.text = var_306_9

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_10 = 19
				local var_306_11 = utf8.len(var_306_9)
				local var_306_12 = var_306_10 <= 0 and var_306_7 or var_306_7 * (var_306_11 / var_306_10)

				if var_306_12 > 0 and var_306_7 < var_306_12 then
					arg_303_1.talkMaxDuration = var_306_12

					if var_306_12 + var_306_6 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_12 + var_306_6
					end
				end

				arg_303_1.text_.text = var_306_9
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_13 = math.max(var_306_7, arg_303_1.talkMaxDuration)

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_13 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_6) / var_306_13

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_6 + var_306_13 and arg_303_1.time_ < var_306_6 + var_306_13 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play120151076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 120151076
		arg_307_1.duration_ = 3.366

		local var_307_0 = {
			zh = 3.366,
			ja = 3.033
		}
		local var_307_1 = manager.audio:GetLocalizationFlag()

		if var_307_0[var_307_1] ~= nil then
			arg_307_1.duration_ = var_307_0[var_307_1]
		end

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play120151077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_310_1 = arg_307_1.actors_["1069ui_story"]
			local var_310_2 = 0

			if var_310_2 < arg_307_1.time_ and arg_307_1.time_ <= var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1069ui_story == nil then
				arg_307_1.var_.characterEffect1069ui_story = var_310_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_3 = 0.2

			if var_310_2 <= arg_307_1.time_ and arg_307_1.time_ < var_310_2 + var_310_3 then
				local var_310_4 = (arg_307_1.time_ - var_310_2) / var_310_3

				if arg_307_1.var_.characterEffect1069ui_story then
					arg_307_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_2 + var_310_3 and arg_307_1.time_ < var_310_2 + var_310_3 + arg_310_0 and arg_307_1.var_.characterEffect1069ui_story then
				arg_307_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_310_5 = 0
			local var_310_6 = 0.5

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_7 = arg_307_1:FormatText(StoryNameCfg[378].name)

				arg_307_1.leftNameTxt_.text = var_310_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_8 = arg_307_1:GetWordFromCfg(120151076)
				local var_310_9 = arg_307_1:FormatText(var_310_8.content)

				arg_307_1.text_.text = var_310_9

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_10 = 20
				local var_310_11 = utf8.len(var_310_9)
				local var_310_12 = var_310_10 <= 0 and var_310_6 or var_310_6 * (var_310_11 / var_310_10)

				if var_310_12 > 0 and var_310_6 < var_310_12 then
					arg_307_1.talkMaxDuration = var_310_12

					if var_310_12 + var_310_5 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_12 + var_310_5
					end
				end

				arg_307_1.text_.text = var_310_9
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151076", "story_v_out_120151.awb") ~= 0 then
					local var_310_13 = manager.audio:GetVoiceLength("story_v_out_120151", "120151076", "story_v_out_120151.awb") / 1000

					if var_310_13 + var_310_5 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_13 + var_310_5
					end

					if var_310_8.prefab_name ~= "" and arg_307_1.actors_[var_310_8.prefab_name] ~= nil then
						local var_310_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_8.prefab_name].transform, "story_v_out_120151", "120151076", "story_v_out_120151.awb")

						arg_307_1:RecordAudio("120151076", var_310_14)
						arg_307_1:RecordAudio("120151076", var_310_14)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_120151", "120151076", "story_v_out_120151.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_120151", "120151076", "story_v_out_120151.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_15 = math.max(var_310_6, arg_307_1.talkMaxDuration)

			if var_310_5 <= arg_307_1.time_ and arg_307_1.time_ < var_310_5 + var_310_15 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_5) / var_310_15

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_5 + var_310_15 and arg_307_1.time_ < var_310_5 + var_310_15 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play120151077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 120151077
		arg_311_1.duration_ = 5.6

		local var_311_0 = {
			zh = 3.666,
			ja = 5.6
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
				arg_311_0:Play120151078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1069ui_story"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.characterEffect1069ui_story == nil then
				arg_311_1.var_.characterEffect1069ui_story = var_314_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_2 = 0.2

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.characterEffect1069ui_story then
					local var_314_4 = Mathf.Lerp(0, 0.5, var_314_3)

					arg_311_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1069ui_story.fillRatio = var_314_4
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect1069ui_story then
				local var_314_5 = 0.5

				arg_311_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1069ui_story.fillRatio = var_314_5
			end

			local var_314_6 = 0
			local var_314_7 = 0.5

			if var_314_6 < arg_311_1.time_ and arg_311_1.time_ <= var_314_6 + arg_314_0 then
				local var_314_8 = "play"
				local var_314_9 = "music"

				arg_311_1:AudioAction(var_314_8, var_314_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_314_10 = 0
			local var_314_11 = 0.35

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_12 = arg_311_1:FormatText(StoryNameCfg[36].name)

				arg_311_1.leftNameTxt_.text = var_314_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_13 = arg_311_1:GetWordFromCfg(120151077)
				local var_314_14 = arg_311_1:FormatText(var_314_13.content)

				arg_311_1.text_.text = var_314_14

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_15 = 14
				local var_314_16 = utf8.len(var_314_14)
				local var_314_17 = var_314_15 <= 0 and var_314_11 or var_314_11 * (var_314_16 / var_314_15)

				if var_314_17 > 0 and var_314_11 < var_314_17 then
					arg_311_1.talkMaxDuration = var_314_17

					if var_314_17 + var_314_10 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_17 + var_314_10
					end
				end

				arg_311_1.text_.text = var_314_14
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151077", "story_v_out_120151.awb") ~= 0 then
					local var_314_18 = manager.audio:GetVoiceLength("story_v_out_120151", "120151077", "story_v_out_120151.awb") / 1000

					if var_314_18 + var_314_10 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_18 + var_314_10
					end

					if var_314_13.prefab_name ~= "" and arg_311_1.actors_[var_314_13.prefab_name] ~= nil then
						local var_314_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_13.prefab_name].transform, "story_v_out_120151", "120151077", "story_v_out_120151.awb")

						arg_311_1:RecordAudio("120151077", var_314_19)
						arg_311_1:RecordAudio("120151077", var_314_19)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_120151", "120151077", "story_v_out_120151.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_120151", "120151077", "story_v_out_120151.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_20 = math.max(var_314_11, arg_311_1.talkMaxDuration)

			if var_314_10 <= arg_311_1.time_ and arg_311_1.time_ < var_314_10 + var_314_20 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_10) / var_314_20

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_10 + var_314_20 and arg_311_1.time_ < var_314_10 + var_314_20 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play120151078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 120151078
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play120151079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1071ui_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos1071ui_story = var_318_0.localPosition
			end

			local var_318_2 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2
				local var_318_4 = Vector3.New(0, 100, 0)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1071ui_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, 100, 0)

				local var_318_7 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_7.x, var_318_7.y, var_318_7.z)

				local var_318_8 = var_318_0.localEulerAngles

				var_318_8.z = 0
				var_318_8.x = 0
				var_318_0.localEulerAngles = var_318_8
			end

			local var_318_9 = arg_315_1.actors_["1069ui_story"].transform
			local var_318_10 = 0

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 then
				arg_315_1.var_.moveOldPos1069ui_story = var_318_9.localPosition
			end

			local var_318_11 = 0.001

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_11 then
				local var_318_12 = (arg_315_1.time_ - var_318_10) / var_318_11
				local var_318_13 = Vector3.New(0, 100, 0)

				var_318_9.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1069ui_story, var_318_13, var_318_12)

				local var_318_14 = manager.ui.mainCamera.transform.position - var_318_9.position

				var_318_9.forward = Vector3.New(var_318_14.x, var_318_14.y, var_318_14.z)

				local var_318_15 = var_318_9.localEulerAngles

				var_318_15.z = 0
				var_318_15.x = 0
				var_318_9.localEulerAngles = var_318_15
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 then
				var_318_9.localPosition = Vector3.New(0, 100, 0)

				local var_318_16 = manager.ui.mainCamera.transform.position - var_318_9.position

				var_318_9.forward = Vector3.New(var_318_16.x, var_318_16.y, var_318_16.z)

				local var_318_17 = var_318_9.localEulerAngles

				var_318_17.z = 0
				var_318_17.x = 0
				var_318_9.localEulerAngles = var_318_17
			end

			local var_318_18 = 0
			local var_318_19 = 0.725

			if var_318_18 < arg_315_1.time_ and arg_315_1.time_ <= var_318_18 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_20 = arg_315_1:GetWordFromCfg(120151078)
				local var_318_21 = arg_315_1:FormatText(var_318_20.content)

				arg_315_1.text_.text = var_318_21

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_22 = 29
				local var_318_23 = utf8.len(var_318_21)
				local var_318_24 = var_318_22 <= 0 and var_318_19 or var_318_19 * (var_318_23 / var_318_22)

				if var_318_24 > 0 and var_318_19 < var_318_24 then
					arg_315_1.talkMaxDuration = var_318_24

					if var_318_24 + var_318_18 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_24 + var_318_18
					end
				end

				arg_315_1.text_.text = var_318_21
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_25 = math.max(var_318_19, arg_315_1.talkMaxDuration)

			if var_318_18 <= arg_315_1.time_ and arg_315_1.time_ < var_318_18 + var_318_25 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_18) / var_318_25

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_18 + var_318_25 and arg_315_1.time_ < var_318_18 + var_318_25 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play120151079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 120151079
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play120151080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0
			local var_322_1 = 0.8

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_2 = arg_319_1:GetWordFromCfg(120151079)
				local var_322_3 = arg_319_1:FormatText(var_322_2.content)

				arg_319_1.text_.text = var_322_3

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_4 = 32
				local var_322_5 = utf8.len(var_322_3)
				local var_322_6 = var_322_4 <= 0 and var_322_1 or var_322_1 * (var_322_5 / var_322_4)

				if var_322_6 > 0 and var_322_1 < var_322_6 then
					arg_319_1.talkMaxDuration = var_322_6

					if var_322_6 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_6 + var_322_0
					end
				end

				arg_319_1.text_.text = var_322_3
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_7 = math.max(var_322_1, arg_319_1.talkMaxDuration)

			if var_322_0 <= arg_319_1.time_ and arg_319_1.time_ < var_322_0 + var_322_7 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_0) / var_322_7

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_0 + var_322_7 and arg_319_1.time_ < var_322_0 + var_322_7 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play120151080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 120151080
		arg_323_1.duration_ = 9

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play120151081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = "J04f"

			if arg_323_1.bgs_[var_326_0] == nil then
				local var_326_1 = Object.Instantiate(arg_323_1.paintGo_)

				var_326_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_326_0)
				var_326_1.name = var_326_0
				var_326_1.transform.parent = arg_323_1.stage_.transform
				var_326_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_323_1.bgs_[var_326_0] = var_326_1
			end

			local var_326_2 = 2

			if var_326_2 < arg_323_1.time_ and arg_323_1.time_ <= var_326_2 + arg_326_0 then
				local var_326_3 = manager.ui.mainCamera.transform.localPosition
				local var_326_4 = Vector3.New(0, 0, 10) + Vector3.New(var_326_3.x, var_326_3.y, 0)
				local var_326_5 = arg_323_1.bgs_.J04f

				var_326_5.transform.localPosition = var_326_4
				var_326_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_326_6 = var_326_5:GetComponent("SpriteRenderer")

				if var_326_6 and var_326_6.sprite then
					local var_326_7 = (var_326_5.transform.localPosition - var_326_3).z
					local var_326_8 = manager.ui.mainCameraCom_
					local var_326_9 = 2 * var_326_7 * Mathf.Tan(var_326_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_326_10 = var_326_9 * var_326_8.aspect
					local var_326_11 = var_326_6.sprite.bounds.size.x
					local var_326_12 = var_326_6.sprite.bounds.size.y
					local var_326_13 = var_326_10 / var_326_11
					local var_326_14 = var_326_9 / var_326_12
					local var_326_15 = var_326_14 < var_326_13 and var_326_13 or var_326_14

					var_326_5.transform.localScale = Vector3.New(var_326_15, var_326_15, 0)
				end

				for iter_326_0, iter_326_1 in pairs(arg_323_1.bgs_) do
					if iter_326_0 ~= "J04f" then
						iter_326_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_326_16 = 0

			if var_326_16 < arg_323_1.time_ and arg_323_1.time_ <= var_326_16 + arg_326_0 then
				arg_323_1.mask_.enabled = true
				arg_323_1.mask_.raycastTarget = true

				arg_323_1:SetGaussion(false)
			end

			local var_326_17 = 2

			if var_326_16 <= arg_323_1.time_ and arg_323_1.time_ < var_326_16 + var_326_17 then
				local var_326_18 = (arg_323_1.time_ - var_326_16) / var_326_17
				local var_326_19 = Color.New(0, 0, 0)

				var_326_19.a = Mathf.Lerp(0, 1, var_326_18)
				arg_323_1.mask_.color = var_326_19
			end

			if arg_323_1.time_ >= var_326_16 + var_326_17 and arg_323_1.time_ < var_326_16 + var_326_17 + arg_326_0 then
				local var_326_20 = Color.New(0, 0, 0)

				var_326_20.a = 1
				arg_323_1.mask_.color = var_326_20
			end

			local var_326_21 = 2

			if var_326_21 < arg_323_1.time_ and arg_323_1.time_ <= var_326_21 + arg_326_0 then
				arg_323_1.mask_.enabled = true
				arg_323_1.mask_.raycastTarget = true

				arg_323_1:SetGaussion(false)
			end

			local var_326_22 = 2

			if var_326_21 <= arg_323_1.time_ and arg_323_1.time_ < var_326_21 + var_326_22 then
				local var_326_23 = (arg_323_1.time_ - var_326_21) / var_326_22
				local var_326_24 = Color.New(0, 0, 0)

				var_326_24.a = Mathf.Lerp(1, 0, var_326_23)
				arg_323_1.mask_.color = var_326_24
			end

			if arg_323_1.time_ >= var_326_21 + var_326_22 and arg_323_1.time_ < var_326_21 + var_326_22 + arg_326_0 then
				local var_326_25 = Color.New(0, 0, 0)
				local var_326_26 = 0

				arg_323_1.mask_.enabled = false
				var_326_25.a = var_326_26
				arg_323_1.mask_.color = var_326_25
			end

			local var_326_27 = 0
			local var_326_28 = 0.3

			if var_326_27 < arg_323_1.time_ and arg_323_1.time_ <= var_326_27 + arg_326_0 then
				local var_326_29 = "play"
				local var_326_30 = "music"

				arg_323_1:AudioAction(var_326_29, var_326_30, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_326_31 = 1.56666666666667
			local var_326_32 = 1

			if var_326_31 < arg_323_1.time_ and arg_323_1.time_ <= var_326_31 + arg_326_0 then
				local var_326_33 = "play"
				local var_326_34 = "music"

				arg_323_1:AudioAction(var_326_33, var_326_34, "bgm_activity_2_0_story_jingdu", "bgm_activity_2_0_story_jingdu", "bgm_activity_2_0_story_jingdu.awb")
			end

			if arg_323_1.frameCnt_ <= 1 then
				arg_323_1.dialog_:SetActive(false)
			end

			local var_326_35 = 4
			local var_326_36 = 0.975

			if var_326_35 < arg_323_1.time_ and arg_323_1.time_ <= var_326_35 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0

				arg_323_1.dialog_:SetActive(true)

				local var_326_37 = LeanTween.value(arg_323_1.dialog_, 0, 1, 0.3)

				var_326_37:setOnUpdate(LuaHelper.FloatAction(function(arg_327_0)
					arg_323_1.dialogCg_.alpha = arg_327_0
				end))
				var_326_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_323_1.dialog_)
					var_326_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_323_1.duration_ = arg_323_1.duration_ + 0.3

				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_38 = arg_323_1:GetWordFromCfg(120151080)
				local var_326_39 = arg_323_1:FormatText(var_326_38.content)

				arg_323_1.text_.text = var_326_39

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_40 = 39
				local var_326_41 = utf8.len(var_326_39)
				local var_326_42 = var_326_40 <= 0 and var_326_36 or var_326_36 * (var_326_41 / var_326_40)

				if var_326_42 > 0 and var_326_36 < var_326_42 then
					arg_323_1.talkMaxDuration = var_326_42
					var_326_35 = var_326_35 + 0.3

					if var_326_42 + var_326_35 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_42 + var_326_35
					end
				end

				arg_323_1.text_.text = var_326_39
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_43 = var_326_35 + 0.3
			local var_326_44 = math.max(var_326_36, arg_323_1.talkMaxDuration)

			if var_326_43 <= arg_323_1.time_ and arg_323_1.time_ < var_326_43 + var_326_44 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_43) / var_326_44

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_43 + var_326_44 and arg_323_1.time_ < var_326_43 + var_326_44 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play120151081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 120151081
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play120151082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 0.15

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_2 = arg_329_1:FormatText(StoryNameCfg[7].name)

				arg_329_1.leftNameTxt_.text = var_332_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_3 = arg_329_1:GetWordFromCfg(120151081)
				local var_332_4 = arg_329_1:FormatText(var_332_3.content)

				arg_329_1.text_.text = var_332_4

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_5 = 6
				local var_332_6 = utf8.len(var_332_4)
				local var_332_7 = var_332_5 <= 0 and var_332_1 or var_332_1 * (var_332_6 / var_332_5)

				if var_332_7 > 0 and var_332_1 < var_332_7 then
					arg_329_1.talkMaxDuration = var_332_7

					if var_332_7 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_7 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_4
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_8 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_8 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_8

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_8 and arg_329_1.time_ < var_332_0 + var_332_8 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play120151082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 120151082
		arg_333_1.duration_ = 5.4

		local var_333_0 = {
			zh = 5.4,
			ja = 3.166
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
				arg_333_0:Play120151083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = "1075ui_story"

			if arg_333_1.actors_[var_336_0] == nil then
				local var_336_1 = Object.Instantiate(Asset.Load("Char/" .. var_336_0), arg_333_1.stage_.transform)

				var_336_1.name = var_336_0
				var_336_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_333_1.actors_[var_336_0] = var_336_1

				local var_336_2 = var_336_1:GetComponentInChildren(typeof(CharacterEffect))

				var_336_2.enabled = true

				local var_336_3 = GameObjectTools.GetOrAddComponent(var_336_1, typeof(DynamicBoneHelper))

				if var_336_3 then
					var_336_3:EnableDynamicBone(false)
				end

				arg_333_1:ShowWeapon(var_336_2.transform, false)

				arg_333_1.var_[var_336_0 .. "Animator"] = var_336_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_333_1.var_[var_336_0 .. "Animator"].applyRootMotion = true
				arg_333_1.var_[var_336_0 .. "LipSync"] = var_336_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_336_4 = arg_333_1.actors_["1075ui_story"].transform
			local var_336_5 = 0

			if var_336_5 < arg_333_1.time_ and arg_333_1.time_ <= var_336_5 + arg_336_0 then
				arg_333_1.var_.moveOldPos1075ui_story = var_336_4.localPosition
			end

			local var_336_6 = 0.001

			if var_336_5 <= arg_333_1.time_ and arg_333_1.time_ < var_336_5 + var_336_6 then
				local var_336_7 = (arg_333_1.time_ - var_336_5) / var_336_6
				local var_336_8 = Vector3.New(0, -1.055, -6.16)

				var_336_4.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1075ui_story, var_336_8, var_336_7)

				local var_336_9 = manager.ui.mainCamera.transform.position - var_336_4.position

				var_336_4.forward = Vector3.New(var_336_9.x, var_336_9.y, var_336_9.z)

				local var_336_10 = var_336_4.localEulerAngles

				var_336_10.z = 0
				var_336_10.x = 0
				var_336_4.localEulerAngles = var_336_10
			end

			if arg_333_1.time_ >= var_336_5 + var_336_6 and arg_333_1.time_ < var_336_5 + var_336_6 + arg_336_0 then
				var_336_4.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_336_11 = manager.ui.mainCamera.transform.position - var_336_4.position

				var_336_4.forward = Vector3.New(var_336_11.x, var_336_11.y, var_336_11.z)

				local var_336_12 = var_336_4.localEulerAngles

				var_336_12.z = 0
				var_336_12.x = 0
				var_336_4.localEulerAngles = var_336_12
			end

			local var_336_13 = 0

			if var_336_13 < arg_333_1.time_ and arg_333_1.time_ <= var_336_13 + arg_336_0 then
				arg_333_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 then
				arg_333_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_336_15 = arg_333_1.actors_["1075ui_story"]
			local var_336_16 = 0

			if var_336_16 < arg_333_1.time_ and arg_333_1.time_ <= var_336_16 + arg_336_0 and arg_333_1.var_.characterEffect1075ui_story == nil then
				arg_333_1.var_.characterEffect1075ui_story = var_336_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_17 = 0.2

			if var_336_16 <= arg_333_1.time_ and arg_333_1.time_ < var_336_16 + var_336_17 then
				local var_336_18 = (arg_333_1.time_ - var_336_16) / var_336_17

				if arg_333_1.var_.characterEffect1075ui_story then
					arg_333_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_16 + var_336_17 and arg_333_1.time_ < var_336_16 + var_336_17 + arg_336_0 and arg_333_1.var_.characterEffect1075ui_story then
				arg_333_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_336_19 = 0
			local var_336_20 = 0.325

			if var_336_19 < arg_333_1.time_ and arg_333_1.time_ <= var_336_19 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_21 = arg_333_1:FormatText(StoryNameCfg[381].name)

				arg_333_1.leftNameTxt_.text = var_336_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_22 = arg_333_1:GetWordFromCfg(120151082)
				local var_336_23 = arg_333_1:FormatText(var_336_22.content)

				arg_333_1.text_.text = var_336_23

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_24 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151082", "story_v_out_120151.awb") ~= 0 then
					local var_336_27 = manager.audio:GetVoiceLength("story_v_out_120151", "120151082", "story_v_out_120151.awb") / 1000

					if var_336_27 + var_336_19 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_27 + var_336_19
					end

					if var_336_22.prefab_name ~= "" and arg_333_1.actors_[var_336_22.prefab_name] ~= nil then
						local var_336_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_22.prefab_name].transform, "story_v_out_120151", "120151082", "story_v_out_120151.awb")

						arg_333_1:RecordAudio("120151082", var_336_28)
						arg_333_1:RecordAudio("120151082", var_336_28)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_120151", "120151082", "story_v_out_120151.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_120151", "120151082", "story_v_out_120151.awb")
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
	Play120151083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 120151083
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play120151084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1075ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1075ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(0, 100, 0)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1075ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0, 100, 0)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = 0
			local var_340_10 = 0.8

			if var_340_9 < arg_337_1.time_ and arg_337_1.time_ <= var_340_9 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_11 = arg_337_1:GetWordFromCfg(120151083)
				local var_340_12 = arg_337_1:FormatText(var_340_11.content)

				arg_337_1.text_.text = var_340_12

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_13 = 32
				local var_340_14 = utf8.len(var_340_12)
				local var_340_15 = var_340_13 <= 0 and var_340_10 or var_340_10 * (var_340_14 / var_340_13)

				if var_340_15 > 0 and var_340_10 < var_340_15 then
					arg_337_1.talkMaxDuration = var_340_15

					if var_340_15 + var_340_9 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_15 + var_340_9
					end
				end

				arg_337_1.text_.text = var_340_12
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_16 = math.max(var_340_10, arg_337_1.talkMaxDuration)

			if var_340_9 <= arg_337_1.time_ and arg_337_1.time_ < var_340_9 + var_340_16 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_9) / var_340_16

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_9 + var_340_16 and arg_337_1.time_ < var_340_9 + var_340_16 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play120151084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 120151084
		arg_341_1.duration_ = 3.233

		local var_341_0 = {
			zh = 3.233,
			ja = 3
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
				arg_341_0:Play120151085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = "1184ui_story"

			if arg_341_1.actors_[var_344_0] == nil then
				local var_344_1 = Object.Instantiate(Asset.Load("Char/" .. var_344_0), arg_341_1.stage_.transform)

				var_344_1.name = var_344_0
				var_344_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_341_1.actors_[var_344_0] = var_344_1

				local var_344_2 = var_344_1:GetComponentInChildren(typeof(CharacterEffect))

				var_344_2.enabled = true

				local var_344_3 = GameObjectTools.GetOrAddComponent(var_344_1, typeof(DynamicBoneHelper))

				if var_344_3 then
					var_344_3:EnableDynamicBone(false)
				end

				arg_341_1:ShowWeapon(var_344_2.transform, false)

				arg_341_1.var_[var_344_0 .. "Animator"] = var_344_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_341_1.var_[var_344_0 .. "Animator"].applyRootMotion = true
				arg_341_1.var_[var_344_0 .. "LipSync"] = var_344_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_344_4 = arg_341_1.actors_["1184ui_story"].transform
			local var_344_5 = 0

			if var_344_5 < arg_341_1.time_ and arg_341_1.time_ <= var_344_5 + arg_344_0 then
				arg_341_1.var_.moveOldPos1184ui_story = var_344_4.localPosition
			end

			local var_344_6 = 0.001

			if var_344_5 <= arg_341_1.time_ and arg_341_1.time_ < var_344_5 + var_344_6 then
				local var_344_7 = (arg_341_1.time_ - var_344_5) / var_344_6
				local var_344_8 = Vector3.New(0, -0.97, -6)

				var_344_4.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1184ui_story, var_344_8, var_344_7)

				local var_344_9 = manager.ui.mainCamera.transform.position - var_344_4.position

				var_344_4.forward = Vector3.New(var_344_9.x, var_344_9.y, var_344_9.z)

				local var_344_10 = var_344_4.localEulerAngles

				var_344_10.z = 0
				var_344_10.x = 0
				var_344_4.localEulerAngles = var_344_10
			end

			if arg_341_1.time_ >= var_344_5 + var_344_6 and arg_341_1.time_ < var_344_5 + var_344_6 + arg_344_0 then
				var_344_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_344_11 = manager.ui.mainCamera.transform.position - var_344_4.position

				var_344_4.forward = Vector3.New(var_344_11.x, var_344_11.y, var_344_11.z)

				local var_344_12 = var_344_4.localEulerAngles

				var_344_12.z = 0
				var_344_12.x = 0
				var_344_4.localEulerAngles = var_344_12
			end

			local var_344_13 = 0

			if var_344_13 < arg_341_1.time_ and arg_341_1.time_ <= var_344_13 + arg_344_0 then
				arg_341_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 then
				arg_341_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_344_15 = arg_341_1.actors_["1184ui_story"]
			local var_344_16 = 0

			if var_344_16 < arg_341_1.time_ and arg_341_1.time_ <= var_344_16 + arg_344_0 and arg_341_1.var_.characterEffect1184ui_story == nil then
				arg_341_1.var_.characterEffect1184ui_story = var_344_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_17 = 0.2

			if var_344_16 <= arg_341_1.time_ and arg_341_1.time_ < var_344_16 + var_344_17 then
				local var_344_18 = (arg_341_1.time_ - var_344_16) / var_344_17

				if arg_341_1.var_.characterEffect1184ui_story then
					arg_341_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_16 + var_344_17 and arg_341_1.time_ < var_344_16 + var_344_17 + arg_344_0 and arg_341_1.var_.characterEffect1184ui_story then
				arg_341_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_344_19 = 0
			local var_344_20 = 0.375

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_21 = arg_341_1:FormatText(StoryNameCfg[6].name)

				arg_341_1.leftNameTxt_.text = var_344_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_22 = arg_341_1:GetWordFromCfg(120151084)
				local var_344_23 = arg_341_1:FormatText(var_344_22.content)

				arg_341_1.text_.text = var_344_23

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151084", "story_v_out_120151.awb") ~= 0 then
					local var_344_27 = manager.audio:GetVoiceLength("story_v_out_120151", "120151084", "story_v_out_120151.awb") / 1000

					if var_344_27 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_27 + var_344_19
					end

					if var_344_22.prefab_name ~= "" and arg_341_1.actors_[var_344_22.prefab_name] ~= nil then
						local var_344_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_22.prefab_name].transform, "story_v_out_120151", "120151084", "story_v_out_120151.awb")

						arg_341_1:RecordAudio("120151084", var_344_28)
						arg_341_1:RecordAudio("120151084", var_344_28)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_120151", "120151084", "story_v_out_120151.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_120151", "120151084", "story_v_out_120151.awb")
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
	Play120151085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 120151085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play120151086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1184ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1184ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(0, 100, 0)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1184ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(0, 100, 0)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = 0
			local var_348_10 = 1.025

			if var_348_9 < arg_345_1.time_ and arg_345_1.time_ <= var_348_9 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, false)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_11 = arg_345_1:GetWordFromCfg(120151085)
				local var_348_12 = arg_345_1:FormatText(var_348_11.content)

				arg_345_1.text_.text = var_348_12

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_13 = 41
				local var_348_14 = utf8.len(var_348_12)
				local var_348_15 = var_348_13 <= 0 and var_348_10 or var_348_10 * (var_348_14 / var_348_13)

				if var_348_15 > 0 and var_348_10 < var_348_15 then
					arg_345_1.talkMaxDuration = var_348_15

					if var_348_15 + var_348_9 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_15 + var_348_9
					end
				end

				arg_345_1.text_.text = var_348_12
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_16 = math.max(var_348_10, arg_345_1.talkMaxDuration)

			if var_348_9 <= arg_345_1.time_ and arg_345_1.time_ < var_348_9 + var_348_16 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_9) / var_348_16

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_9 + var_348_16 and arg_345_1.time_ < var_348_9 + var_348_16 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play120151086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 120151086
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play120151087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.675

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, false)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_2 = arg_349_1:GetWordFromCfg(120151086)
				local var_352_3 = arg_349_1:FormatText(var_352_2.content)

				arg_349_1.text_.text = var_352_3

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_4 = 27
				local var_352_5 = utf8.len(var_352_3)
				local var_352_6 = var_352_4 <= 0 and var_352_1 or var_352_1 * (var_352_5 / var_352_4)

				if var_352_6 > 0 and var_352_1 < var_352_6 then
					arg_349_1.talkMaxDuration = var_352_6

					if var_352_6 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_6 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_3
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_7 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_7 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_7

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_7 and arg_349_1.time_ < var_352_0 + var_352_7 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play120151087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 120151087
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play120151088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = "1029ui_story"

			if arg_353_1.actors_[var_356_0] == nil then
				local var_356_1 = Object.Instantiate(Asset.Load("Char/" .. var_356_0), arg_353_1.stage_.transform)

				var_356_1.name = var_356_0
				var_356_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_353_1.actors_[var_356_0] = var_356_1

				local var_356_2 = var_356_1:GetComponentInChildren(typeof(CharacterEffect))

				var_356_2.enabled = true

				local var_356_3 = GameObjectTools.GetOrAddComponent(var_356_1, typeof(DynamicBoneHelper))

				if var_356_3 then
					var_356_3:EnableDynamicBone(false)
				end

				arg_353_1:ShowWeapon(var_356_2.transform, false)

				arg_353_1.var_[var_356_0 .. "Animator"] = var_356_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_353_1.var_[var_356_0 .. "Animator"].applyRootMotion = true
				arg_353_1.var_[var_356_0 .. "LipSync"] = var_356_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_356_4 = arg_353_1.actors_["1029ui_story"].transform
			local var_356_5 = 0

			if var_356_5 < arg_353_1.time_ and arg_353_1.time_ <= var_356_5 + arg_356_0 then
				arg_353_1.var_.moveOldPos1029ui_story = var_356_4.localPosition
			end

			local var_356_6 = 0.001

			if var_356_5 <= arg_353_1.time_ and arg_353_1.time_ < var_356_5 + var_356_6 then
				local var_356_7 = (arg_353_1.time_ - var_356_5) / var_356_6
				local var_356_8 = Vector3.New(0, -1.09, -6.2)

				var_356_4.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1029ui_story, var_356_8, var_356_7)

				local var_356_9 = manager.ui.mainCamera.transform.position - var_356_4.position

				var_356_4.forward = Vector3.New(var_356_9.x, var_356_9.y, var_356_9.z)

				local var_356_10 = var_356_4.localEulerAngles

				var_356_10.z = 0
				var_356_10.x = 0
				var_356_4.localEulerAngles = var_356_10
			end

			if arg_353_1.time_ >= var_356_5 + var_356_6 and arg_353_1.time_ < var_356_5 + var_356_6 + arg_356_0 then
				var_356_4.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_356_11 = manager.ui.mainCamera.transform.position - var_356_4.position

				var_356_4.forward = Vector3.New(var_356_11.x, var_356_11.y, var_356_11.z)

				local var_356_12 = var_356_4.localEulerAngles

				var_356_12.z = 0
				var_356_12.x = 0
				var_356_4.localEulerAngles = var_356_12
			end

			local var_356_13 = 0

			if var_356_13 < arg_353_1.time_ and arg_353_1.time_ <= var_356_13 + arg_356_0 then
				arg_353_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_356_14 = 0

			if var_356_14 < arg_353_1.time_ and arg_353_1.time_ <= var_356_14 + arg_356_0 then
				arg_353_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_356_15 = arg_353_1.actors_["1029ui_story"]
			local var_356_16 = 0

			if var_356_16 < arg_353_1.time_ and arg_353_1.time_ <= var_356_16 + arg_356_0 and arg_353_1.var_.characterEffect1029ui_story == nil then
				arg_353_1.var_.characterEffect1029ui_story = var_356_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_17 = 0.2

			if var_356_16 <= arg_353_1.time_ and arg_353_1.time_ < var_356_16 + var_356_17 then
				local var_356_18 = (arg_353_1.time_ - var_356_16) / var_356_17

				if arg_353_1.var_.characterEffect1029ui_story then
					local var_356_19 = Mathf.Lerp(0, 0.5, var_356_18)

					arg_353_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_353_1.var_.characterEffect1029ui_story.fillRatio = var_356_19
				end
			end

			if arg_353_1.time_ >= var_356_16 + var_356_17 and arg_353_1.time_ < var_356_16 + var_356_17 + arg_356_0 and arg_353_1.var_.characterEffect1029ui_story then
				local var_356_20 = 0.5

				arg_353_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_353_1.var_.characterEffect1029ui_story.fillRatio = var_356_20
			end

			local var_356_21 = 0
			local var_356_22 = 0.15

			if var_356_21 < arg_353_1.time_ and arg_353_1.time_ <= var_356_21 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_23 = arg_353_1:FormatText(StoryNameCfg[7].name)

				arg_353_1.leftNameTxt_.text = var_356_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_24 = arg_353_1:GetWordFromCfg(120151087)
				local var_356_25 = arg_353_1:FormatText(var_356_24.content)

				arg_353_1.text_.text = var_356_25

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_26 = 6
				local var_356_27 = utf8.len(var_356_25)
				local var_356_28 = var_356_26 <= 0 and var_356_22 or var_356_22 * (var_356_27 / var_356_26)

				if var_356_28 > 0 and var_356_22 < var_356_28 then
					arg_353_1.talkMaxDuration = var_356_28

					if var_356_28 + var_356_21 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_28 + var_356_21
					end
				end

				arg_353_1.text_.text = var_356_25
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_29 = math.max(var_356_22, arg_353_1.talkMaxDuration)

			if var_356_21 <= arg_353_1.time_ and arg_353_1.time_ < var_356_21 + var_356_29 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_21) / var_356_29

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_21 + var_356_29 and arg_353_1.time_ < var_356_21 + var_356_29 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play120151088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 120151088
		arg_357_1.duration_ = 3.733

		local var_357_0 = {
			zh = 3.733,
			ja = 3.2
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
				arg_357_0:Play120151089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_360_1 = arg_357_1.actors_["1029ui_story"]
			local var_360_2 = 0

			if var_360_2 < arg_357_1.time_ and arg_357_1.time_ <= var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect1029ui_story == nil then
				arg_357_1.var_.characterEffect1029ui_story = var_360_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_3 = 0.2

			if var_360_2 <= arg_357_1.time_ and arg_357_1.time_ < var_360_2 + var_360_3 then
				local var_360_4 = (arg_357_1.time_ - var_360_2) / var_360_3

				if arg_357_1.var_.characterEffect1029ui_story then
					arg_357_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_2 + var_360_3 and arg_357_1.time_ < var_360_2 + var_360_3 + arg_360_0 and arg_357_1.var_.characterEffect1029ui_story then
				arg_357_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_360_5 = 0
			local var_360_6 = 0.35

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_7 = arg_357_1:FormatText(StoryNameCfg[319].name)

				arg_357_1.leftNameTxt_.text = var_360_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_8 = arg_357_1:GetWordFromCfg(120151088)
				local var_360_9 = arg_357_1:FormatText(var_360_8.content)

				arg_357_1.text_.text = var_360_9

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_10 = 14
				local var_360_11 = utf8.len(var_360_9)
				local var_360_12 = var_360_10 <= 0 and var_360_6 or var_360_6 * (var_360_11 / var_360_10)

				if var_360_12 > 0 and var_360_6 < var_360_12 then
					arg_357_1.talkMaxDuration = var_360_12

					if var_360_12 + var_360_5 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_12 + var_360_5
					end
				end

				arg_357_1.text_.text = var_360_9
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151088", "story_v_out_120151.awb") ~= 0 then
					local var_360_13 = manager.audio:GetVoiceLength("story_v_out_120151", "120151088", "story_v_out_120151.awb") / 1000

					if var_360_13 + var_360_5 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_13 + var_360_5
					end

					if var_360_8.prefab_name ~= "" and arg_357_1.actors_[var_360_8.prefab_name] ~= nil then
						local var_360_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_8.prefab_name].transform, "story_v_out_120151", "120151088", "story_v_out_120151.awb")

						arg_357_1:RecordAudio("120151088", var_360_14)
						arg_357_1:RecordAudio("120151088", var_360_14)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_120151", "120151088", "story_v_out_120151.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_120151", "120151088", "story_v_out_120151.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_15 = math.max(var_360_6, arg_357_1.talkMaxDuration)

			if var_360_5 <= arg_357_1.time_ and arg_357_1.time_ < var_360_5 + var_360_15 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_5) / var_360_15

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_5 + var_360_15 and arg_357_1.time_ < var_360_5 + var_360_15 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play120151089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 120151089
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play120151090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1029ui_story"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos1029ui_story = var_364_0.localPosition
			end

			local var_364_2 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2
				local var_364_4 = Vector3.New(0, 100, 0)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos1029ui_story, var_364_4, var_364_3)

				local var_364_5 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_5.x, var_364_5.y, var_364_5.z)

				local var_364_6 = var_364_0.localEulerAngles

				var_364_6.z = 0
				var_364_6.x = 0
				var_364_0.localEulerAngles = var_364_6
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(0, 100, 0)

				local var_364_7 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_7.x, var_364_7.y, var_364_7.z)

				local var_364_8 = var_364_0.localEulerAngles

				var_364_8.z = 0
				var_364_8.x = 0
				var_364_0.localEulerAngles = var_364_8
			end

			local var_364_9 = 0
			local var_364_10 = 0.725

			if var_364_9 < arg_361_1.time_ and arg_361_1.time_ <= var_364_9 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, false)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_11 = arg_361_1:GetWordFromCfg(120151089)
				local var_364_12 = arg_361_1:FormatText(var_364_11.content)

				arg_361_1.text_.text = var_364_12

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_13 = 29
				local var_364_14 = utf8.len(var_364_12)
				local var_364_15 = var_364_13 <= 0 and var_364_10 or var_364_10 * (var_364_14 / var_364_13)

				if var_364_15 > 0 and var_364_10 < var_364_15 then
					arg_361_1.talkMaxDuration = var_364_15

					if var_364_15 + var_364_9 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_15 + var_364_9
					end
				end

				arg_361_1.text_.text = var_364_12
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_16 = math.max(var_364_10, arg_361_1.talkMaxDuration)

			if var_364_9 <= arg_361_1.time_ and arg_361_1.time_ < var_364_9 + var_364_16 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_9) / var_364_16

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_9 + var_364_16 and arg_361_1.time_ < var_364_9 + var_364_16 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play120151090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 120151090
		arg_365_1.duration_ = 7.633

		local var_365_0 = {
			zh = 7.233,
			ja = 7.633
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
				arg_365_0:Play120151091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1071ui_story"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos1071ui_story = var_368_0.localPosition
			end

			local var_368_2 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2
				local var_368_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1071ui_story, var_368_4, var_368_3)

				local var_368_5 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_5.x, var_368_5.y, var_368_5.z)

				local var_368_6 = var_368_0.localEulerAngles

				var_368_6.z = 0
				var_368_6.x = 0
				var_368_0.localEulerAngles = var_368_6
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_368_7 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_7.x, var_368_7.y, var_368_7.z)

				local var_368_8 = var_368_0.localEulerAngles

				var_368_8.z = 0
				var_368_8.x = 0
				var_368_0.localEulerAngles = var_368_8
			end

			local var_368_9 = 0

			if var_368_9 < arg_365_1.time_ and arg_365_1.time_ <= var_368_9 + arg_368_0 then
				arg_365_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action4_1")
			end

			local var_368_10 = 0

			if var_368_10 < arg_365_1.time_ and arg_365_1.time_ <= var_368_10 + arg_368_0 then
				arg_365_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_368_11 = arg_365_1.actors_["1071ui_story"]
			local var_368_12 = 0

			if var_368_12 < arg_365_1.time_ and arg_365_1.time_ <= var_368_12 + arg_368_0 and arg_365_1.var_.characterEffect1071ui_story == nil then
				arg_365_1.var_.characterEffect1071ui_story = var_368_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_13 = 0.2

			if var_368_12 <= arg_365_1.time_ and arg_365_1.time_ < var_368_12 + var_368_13 then
				local var_368_14 = (arg_365_1.time_ - var_368_12) / var_368_13

				if arg_365_1.var_.characterEffect1071ui_story then
					arg_365_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_12 + var_368_13 and arg_365_1.time_ < var_368_12 + var_368_13 + arg_368_0 and arg_365_1.var_.characterEffect1071ui_story then
				arg_365_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_368_15 = 0
			local var_368_16 = 0.775

			if var_368_15 < arg_365_1.time_ and arg_365_1.time_ <= var_368_15 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_17 = arg_365_1:FormatText(StoryNameCfg[384].name)

				arg_365_1.leftNameTxt_.text = var_368_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_18 = arg_365_1:GetWordFromCfg(120151090)
				local var_368_19 = arg_365_1:FormatText(var_368_18.content)

				arg_365_1.text_.text = var_368_19

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_20 = 31
				local var_368_21 = utf8.len(var_368_19)
				local var_368_22 = var_368_20 <= 0 and var_368_16 or var_368_16 * (var_368_21 / var_368_20)

				if var_368_22 > 0 and var_368_16 < var_368_22 then
					arg_365_1.talkMaxDuration = var_368_22

					if var_368_22 + var_368_15 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_22 + var_368_15
					end
				end

				arg_365_1.text_.text = var_368_19
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151090", "story_v_out_120151.awb") ~= 0 then
					local var_368_23 = manager.audio:GetVoiceLength("story_v_out_120151", "120151090", "story_v_out_120151.awb") / 1000

					if var_368_23 + var_368_15 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_23 + var_368_15
					end

					if var_368_18.prefab_name ~= "" and arg_365_1.actors_[var_368_18.prefab_name] ~= nil then
						local var_368_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_18.prefab_name].transform, "story_v_out_120151", "120151090", "story_v_out_120151.awb")

						arg_365_1:RecordAudio("120151090", var_368_24)
						arg_365_1:RecordAudio("120151090", var_368_24)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_120151", "120151090", "story_v_out_120151.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_120151", "120151090", "story_v_out_120151.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_25 = math.max(var_368_16, arg_365_1.talkMaxDuration)

			if var_368_15 <= arg_365_1.time_ and arg_365_1.time_ < var_368_15 + var_368_25 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_15) / var_368_25

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_15 + var_368_25 and arg_365_1.time_ < var_368_15 + var_368_25 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play120151091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 120151091
		arg_369_1.duration_ = 3.866

		local var_369_0 = {
			zh = 2.7,
			ja = 3.866
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
				arg_369_0:Play120151092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1071ui_story"]
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 and arg_369_1.var_.characterEffect1071ui_story == nil then
				arg_369_1.var_.characterEffect1071ui_story = var_372_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_2 = 0.2

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2

				if arg_369_1.var_.characterEffect1071ui_story then
					local var_372_4 = Mathf.Lerp(0, 0.5, var_372_3)

					arg_369_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_369_1.var_.characterEffect1071ui_story.fillRatio = var_372_4
				end
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 and arg_369_1.var_.characterEffect1071ui_story then
				local var_372_5 = 0.5

				arg_369_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_369_1.var_.characterEffect1071ui_story.fillRatio = var_372_5
			end

			local var_372_6 = arg_369_1.actors_["1069ui_story"].transform
			local var_372_7 = 0

			if var_372_7 < arg_369_1.time_ and arg_369_1.time_ <= var_372_7 + arg_372_0 then
				arg_369_1.var_.moveOldPos1069ui_story = var_372_6.localPosition
			end

			local var_372_8 = 0.001

			if var_372_7 <= arg_369_1.time_ and arg_369_1.time_ < var_372_7 + var_372_8 then
				local var_372_9 = (arg_369_1.time_ - var_372_7) / var_372_8
				local var_372_10 = Vector3.New(0.7, -1, -6)

				var_372_6.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos1069ui_story, var_372_10, var_372_9)

				local var_372_11 = manager.ui.mainCamera.transform.position - var_372_6.position

				var_372_6.forward = Vector3.New(var_372_11.x, var_372_11.y, var_372_11.z)

				local var_372_12 = var_372_6.localEulerAngles

				var_372_12.z = 0
				var_372_12.x = 0
				var_372_6.localEulerAngles = var_372_12
			end

			if arg_369_1.time_ >= var_372_7 + var_372_8 and arg_369_1.time_ < var_372_7 + var_372_8 + arg_372_0 then
				var_372_6.localPosition = Vector3.New(0.7, -1, -6)

				local var_372_13 = manager.ui.mainCamera.transform.position - var_372_6.position

				var_372_6.forward = Vector3.New(var_372_13.x, var_372_13.y, var_372_13.z)

				local var_372_14 = var_372_6.localEulerAngles

				var_372_14.z = 0
				var_372_14.x = 0
				var_372_6.localEulerAngles = var_372_14
			end

			local var_372_15 = 0

			if var_372_15 < arg_369_1.time_ and arg_369_1.time_ <= var_372_15 + arg_372_0 then
				arg_369_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_372_16 = 0

			if var_372_16 < arg_369_1.time_ and arg_369_1.time_ <= var_372_16 + arg_372_0 then
				arg_369_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_372_17 = arg_369_1.actors_["1069ui_story"]
			local var_372_18 = 0

			if var_372_18 < arg_369_1.time_ and arg_369_1.time_ <= var_372_18 + arg_372_0 and arg_369_1.var_.characterEffect1069ui_story == nil then
				arg_369_1.var_.characterEffect1069ui_story = var_372_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_19 = 0.2

			if var_372_18 <= arg_369_1.time_ and arg_369_1.time_ < var_372_18 + var_372_19 then
				local var_372_20 = (arg_369_1.time_ - var_372_18) / var_372_19

				if arg_369_1.var_.characterEffect1069ui_story then
					arg_369_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_18 + var_372_19 and arg_369_1.time_ < var_372_18 + var_372_19 + arg_372_0 and arg_369_1.var_.characterEffect1069ui_story then
				arg_369_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_372_21 = 0
			local var_372_22 = 0.3

			if var_372_21 < arg_369_1.time_ and arg_369_1.time_ <= var_372_21 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_23 = arg_369_1:FormatText(StoryNameCfg[378].name)

				arg_369_1.leftNameTxt_.text = var_372_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_24 = arg_369_1:GetWordFromCfg(120151091)
				local var_372_25 = arg_369_1:FormatText(var_372_24.content)

				arg_369_1.text_.text = var_372_25

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_26 = 12
				local var_372_27 = utf8.len(var_372_25)
				local var_372_28 = var_372_26 <= 0 and var_372_22 or var_372_22 * (var_372_27 / var_372_26)

				if var_372_28 > 0 and var_372_22 < var_372_28 then
					arg_369_1.talkMaxDuration = var_372_28

					if var_372_28 + var_372_21 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_28 + var_372_21
					end
				end

				arg_369_1.text_.text = var_372_25
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151091", "story_v_out_120151.awb") ~= 0 then
					local var_372_29 = manager.audio:GetVoiceLength("story_v_out_120151", "120151091", "story_v_out_120151.awb") / 1000

					if var_372_29 + var_372_21 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_29 + var_372_21
					end

					if var_372_24.prefab_name ~= "" and arg_369_1.actors_[var_372_24.prefab_name] ~= nil then
						local var_372_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_24.prefab_name].transform, "story_v_out_120151", "120151091", "story_v_out_120151.awb")

						arg_369_1:RecordAudio("120151091", var_372_30)
						arg_369_1:RecordAudio("120151091", var_372_30)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_120151", "120151091", "story_v_out_120151.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_120151", "120151091", "story_v_out_120151.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_31 = math.max(var_372_22, arg_369_1.talkMaxDuration)

			if var_372_21 <= arg_369_1.time_ and arg_369_1.time_ < var_372_21 + var_372_31 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_21) / var_372_31

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_21 + var_372_31 and arg_369_1.time_ < var_372_21 + var_372_31 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play120151092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 120151092
		arg_373_1.duration_ = 3

		local var_373_0 = {
			zh = 3,
			ja = 2.733
		}
		local var_373_1 = manager.audio:GetLocalizationFlag()

		if var_373_0[var_373_1] ~= nil then
			arg_373_1.duration_ = var_373_0[var_373_1]
		end

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play120151093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1075ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1075ui_story = var_376_0.localPosition
			end

			local var_376_2 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2
				local var_376_4 = Vector3.New(-0.7, -1.055, -6.16)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1075ui_story, var_376_4, var_376_3)

				local var_376_5 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_5.x, var_376_5.y, var_376_5.z)

				local var_376_6 = var_376_0.localEulerAngles

				var_376_6.z = 0
				var_376_6.x = 0
				var_376_0.localEulerAngles = var_376_6
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_376_7 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_7.x, var_376_7.y, var_376_7.z)

				local var_376_8 = var_376_0.localEulerAngles

				var_376_8.z = 0
				var_376_8.x = 0
				var_376_0.localEulerAngles = var_376_8
			end

			local var_376_9 = 0

			if var_376_9 < arg_373_1.time_ and arg_373_1.time_ <= var_376_9 + arg_376_0 then
				arg_373_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_376_10 = 0

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 then
				arg_373_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_376_11 = arg_373_1.actors_["1075ui_story"]
			local var_376_12 = 0

			if var_376_12 < arg_373_1.time_ and arg_373_1.time_ <= var_376_12 + arg_376_0 and arg_373_1.var_.characterEffect1075ui_story == nil then
				arg_373_1.var_.characterEffect1075ui_story = var_376_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_13 = 0.2

			if var_376_12 <= arg_373_1.time_ and arg_373_1.time_ < var_376_12 + var_376_13 then
				local var_376_14 = (arg_373_1.time_ - var_376_12) / var_376_13

				if arg_373_1.var_.characterEffect1075ui_story then
					arg_373_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_12 + var_376_13 and arg_373_1.time_ < var_376_12 + var_376_13 + arg_376_0 and arg_373_1.var_.characterEffect1075ui_story then
				arg_373_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_376_15 = arg_373_1.actors_["1069ui_story"]
			local var_376_16 = 0

			if var_376_16 < arg_373_1.time_ and arg_373_1.time_ <= var_376_16 + arg_376_0 and arg_373_1.var_.characterEffect1069ui_story == nil then
				arg_373_1.var_.characterEffect1069ui_story = var_376_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_17 = 0.2

			if var_376_16 <= arg_373_1.time_ and arg_373_1.time_ < var_376_16 + var_376_17 then
				local var_376_18 = (arg_373_1.time_ - var_376_16) / var_376_17

				if arg_373_1.var_.characterEffect1069ui_story then
					local var_376_19 = Mathf.Lerp(0, 0.5, var_376_18)

					arg_373_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_373_1.var_.characterEffect1069ui_story.fillRatio = var_376_19
				end
			end

			if arg_373_1.time_ >= var_376_16 + var_376_17 and arg_373_1.time_ < var_376_16 + var_376_17 + arg_376_0 and arg_373_1.var_.characterEffect1069ui_story then
				local var_376_20 = 0.5

				arg_373_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_373_1.var_.characterEffect1069ui_story.fillRatio = var_376_20
			end

			local var_376_21 = arg_373_1.actors_["1071ui_story"].transform
			local var_376_22 = 0

			if var_376_22 < arg_373_1.time_ and arg_373_1.time_ <= var_376_22 + arg_376_0 then
				arg_373_1.var_.moveOldPos1071ui_story = var_376_21.localPosition
			end

			local var_376_23 = 0.001

			if var_376_22 <= arg_373_1.time_ and arg_373_1.time_ < var_376_22 + var_376_23 then
				local var_376_24 = (arg_373_1.time_ - var_376_22) / var_376_23
				local var_376_25 = Vector3.New(0, 100, 0)

				var_376_21.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1071ui_story, var_376_25, var_376_24)

				local var_376_26 = manager.ui.mainCamera.transform.position - var_376_21.position

				var_376_21.forward = Vector3.New(var_376_26.x, var_376_26.y, var_376_26.z)

				local var_376_27 = var_376_21.localEulerAngles

				var_376_27.z = 0
				var_376_27.x = 0
				var_376_21.localEulerAngles = var_376_27
			end

			if arg_373_1.time_ >= var_376_22 + var_376_23 and arg_373_1.time_ < var_376_22 + var_376_23 + arg_376_0 then
				var_376_21.localPosition = Vector3.New(0, 100, 0)

				local var_376_28 = manager.ui.mainCamera.transform.position - var_376_21.position

				var_376_21.forward = Vector3.New(var_376_28.x, var_376_28.y, var_376_28.z)

				local var_376_29 = var_376_21.localEulerAngles

				var_376_29.z = 0
				var_376_29.x = 0
				var_376_21.localEulerAngles = var_376_29
			end

			local var_376_30 = 0
			local var_376_31 = 0.25

			if var_376_30 < arg_373_1.time_ and arg_373_1.time_ <= var_376_30 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_32 = arg_373_1:FormatText(StoryNameCfg[381].name)

				arg_373_1.leftNameTxt_.text = var_376_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_33 = arg_373_1:GetWordFromCfg(120151092)
				local var_376_34 = arg_373_1:FormatText(var_376_33.content)

				arg_373_1.text_.text = var_376_34

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_35 = 10
				local var_376_36 = utf8.len(var_376_34)
				local var_376_37 = var_376_35 <= 0 and var_376_31 or var_376_31 * (var_376_36 / var_376_35)

				if var_376_37 > 0 and var_376_31 < var_376_37 then
					arg_373_1.talkMaxDuration = var_376_37

					if var_376_37 + var_376_30 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_37 + var_376_30
					end
				end

				arg_373_1.text_.text = var_376_34
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151092", "story_v_out_120151.awb") ~= 0 then
					local var_376_38 = manager.audio:GetVoiceLength("story_v_out_120151", "120151092", "story_v_out_120151.awb") / 1000

					if var_376_38 + var_376_30 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_38 + var_376_30
					end

					if var_376_33.prefab_name ~= "" and arg_373_1.actors_[var_376_33.prefab_name] ~= nil then
						local var_376_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_33.prefab_name].transform, "story_v_out_120151", "120151092", "story_v_out_120151.awb")

						arg_373_1:RecordAudio("120151092", var_376_39)
						arg_373_1:RecordAudio("120151092", var_376_39)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_120151", "120151092", "story_v_out_120151.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_120151", "120151092", "story_v_out_120151.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_40 = math.max(var_376_31, arg_373_1.talkMaxDuration)

			if var_376_30 <= arg_373_1.time_ and arg_373_1.time_ < var_376_30 + var_376_40 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_30) / var_376_40

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_30 + var_376_40 and arg_373_1.time_ < var_376_30 + var_376_40 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play120151093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 120151093
		arg_377_1.duration_ = 6.3

		local var_377_0 = {
			zh = 5.266,
			ja = 6.3
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
				arg_377_0:Play120151094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_380_1 = arg_377_1.actors_["1069ui_story"]
			local var_380_2 = 0

			if var_380_2 < arg_377_1.time_ and arg_377_1.time_ <= var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect1069ui_story == nil then
				arg_377_1.var_.characterEffect1069ui_story = var_380_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_3 = 0.2

			if var_380_2 <= arg_377_1.time_ and arg_377_1.time_ < var_380_2 + var_380_3 then
				local var_380_4 = (arg_377_1.time_ - var_380_2) / var_380_3

				if arg_377_1.var_.characterEffect1069ui_story then
					arg_377_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_2 + var_380_3 and arg_377_1.time_ < var_380_2 + var_380_3 + arg_380_0 and arg_377_1.var_.characterEffect1069ui_story then
				arg_377_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_380_5 = arg_377_1.actors_["1075ui_story"]
			local var_380_6 = 0

			if var_380_6 < arg_377_1.time_ and arg_377_1.time_ <= var_380_6 + arg_380_0 and arg_377_1.var_.characterEffect1075ui_story == nil then
				arg_377_1.var_.characterEffect1075ui_story = var_380_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_7 = 0.2

			if var_380_6 <= arg_377_1.time_ and arg_377_1.time_ < var_380_6 + var_380_7 then
				local var_380_8 = (arg_377_1.time_ - var_380_6) / var_380_7

				if arg_377_1.var_.characterEffect1075ui_story then
					local var_380_9 = Mathf.Lerp(0, 0.5, var_380_8)

					arg_377_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1075ui_story.fillRatio = var_380_9
				end
			end

			if arg_377_1.time_ >= var_380_6 + var_380_7 and arg_377_1.time_ < var_380_6 + var_380_7 + arg_380_0 and arg_377_1.var_.characterEffect1075ui_story then
				local var_380_10 = 0.5

				arg_377_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1075ui_story.fillRatio = var_380_10
			end

			local var_380_11 = 0
			local var_380_12 = 0.7

			if var_380_11 < arg_377_1.time_ and arg_377_1.time_ <= var_380_11 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_13 = arg_377_1:FormatText(StoryNameCfg[378].name)

				arg_377_1.leftNameTxt_.text = var_380_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_14 = arg_377_1:GetWordFromCfg(120151093)
				local var_380_15 = arg_377_1:FormatText(var_380_14.content)

				arg_377_1.text_.text = var_380_15

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_16 = 28
				local var_380_17 = utf8.len(var_380_15)
				local var_380_18 = var_380_16 <= 0 and var_380_12 or var_380_12 * (var_380_17 / var_380_16)

				if var_380_18 > 0 and var_380_12 < var_380_18 then
					arg_377_1.talkMaxDuration = var_380_18

					if var_380_18 + var_380_11 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_18 + var_380_11
					end
				end

				arg_377_1.text_.text = var_380_15
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151093", "story_v_out_120151.awb") ~= 0 then
					local var_380_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151093", "story_v_out_120151.awb") / 1000

					if var_380_19 + var_380_11 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_19 + var_380_11
					end

					if var_380_14.prefab_name ~= "" and arg_377_1.actors_[var_380_14.prefab_name] ~= nil then
						local var_380_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_14.prefab_name].transform, "story_v_out_120151", "120151093", "story_v_out_120151.awb")

						arg_377_1:RecordAudio("120151093", var_380_20)
						arg_377_1:RecordAudio("120151093", var_380_20)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_120151", "120151093", "story_v_out_120151.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_120151", "120151093", "story_v_out_120151.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_21 = math.max(var_380_12, arg_377_1.talkMaxDuration)

			if var_380_11 <= arg_377_1.time_ and arg_377_1.time_ < var_380_11 + var_380_21 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_11) / var_380_21

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_11 + var_380_21 and arg_377_1.time_ < var_380_11 + var_380_21 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play120151094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 120151094
		arg_381_1.duration_ = 5.666

		local var_381_0 = {
			zh = 3.5,
			ja = 5.666
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
				arg_381_0:Play120151095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_384_1 = arg_381_1.actors_["1075ui_story"]
			local var_384_2 = 0

			if var_384_2 < arg_381_1.time_ and arg_381_1.time_ <= var_384_2 + arg_384_0 and arg_381_1.var_.characterEffect1075ui_story == nil then
				arg_381_1.var_.characterEffect1075ui_story = var_384_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_3 = 0.2

			if var_384_2 <= arg_381_1.time_ and arg_381_1.time_ < var_384_2 + var_384_3 then
				local var_384_4 = (arg_381_1.time_ - var_384_2) / var_384_3

				if arg_381_1.var_.characterEffect1075ui_story then
					arg_381_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_2 + var_384_3 and arg_381_1.time_ < var_384_2 + var_384_3 + arg_384_0 and arg_381_1.var_.characterEffect1075ui_story then
				arg_381_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_384_5 = 0
			local var_384_6 = 0.55

			if var_384_5 < arg_381_1.time_ and arg_381_1.time_ <= var_384_5 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_7 = arg_381_1:FormatText(StoryNameCfg[381].name)

				arg_381_1.leftNameTxt_.text = var_384_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_8 = arg_381_1:GetWordFromCfg(120151094)
				local var_384_9 = arg_381_1:FormatText(var_384_8.content)

				arg_381_1.text_.text = var_384_9

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_10 = 22
				local var_384_11 = utf8.len(var_384_9)
				local var_384_12 = var_384_10 <= 0 and var_384_6 or var_384_6 * (var_384_11 / var_384_10)

				if var_384_12 > 0 and var_384_6 < var_384_12 then
					arg_381_1.talkMaxDuration = var_384_12

					if var_384_12 + var_384_5 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_12 + var_384_5
					end
				end

				arg_381_1.text_.text = var_384_9
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151094", "story_v_out_120151.awb") ~= 0 then
					local var_384_13 = manager.audio:GetVoiceLength("story_v_out_120151", "120151094", "story_v_out_120151.awb") / 1000

					if var_384_13 + var_384_5 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_13 + var_384_5
					end

					if var_384_8.prefab_name ~= "" and arg_381_1.actors_[var_384_8.prefab_name] ~= nil then
						local var_384_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_8.prefab_name].transform, "story_v_out_120151", "120151094", "story_v_out_120151.awb")

						arg_381_1:RecordAudio("120151094", var_384_14)
						arg_381_1:RecordAudio("120151094", var_384_14)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_120151", "120151094", "story_v_out_120151.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_120151", "120151094", "story_v_out_120151.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_15 = math.max(var_384_6, arg_381_1.talkMaxDuration)

			if var_384_5 <= arg_381_1.time_ and arg_381_1.time_ < var_384_5 + var_384_15 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_5) / var_384_15

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_5 + var_384_15 and arg_381_1.time_ < var_384_5 + var_384_15 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play120151095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 120151095
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play120151096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1075ui_story"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos1075ui_story = var_388_0.localPosition
			end

			local var_388_2 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2
				local var_388_4 = Vector3.New(0, 100, 0)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1075ui_story, var_388_4, var_388_3)

				local var_388_5 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_5.x, var_388_5.y, var_388_5.z)

				local var_388_6 = var_388_0.localEulerAngles

				var_388_6.z = 0
				var_388_6.x = 0
				var_388_0.localEulerAngles = var_388_6
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(0, 100, 0)

				local var_388_7 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_7.x, var_388_7.y, var_388_7.z)

				local var_388_8 = var_388_0.localEulerAngles

				var_388_8.z = 0
				var_388_8.x = 0
				var_388_0.localEulerAngles = var_388_8
			end

			local var_388_9 = arg_385_1.actors_["1069ui_story"].transform
			local var_388_10 = 0

			if var_388_10 < arg_385_1.time_ and arg_385_1.time_ <= var_388_10 + arg_388_0 then
				arg_385_1.var_.moveOldPos1069ui_story = var_388_9.localPosition
			end

			local var_388_11 = 0.001

			if var_388_10 <= arg_385_1.time_ and arg_385_1.time_ < var_388_10 + var_388_11 then
				local var_388_12 = (arg_385_1.time_ - var_388_10) / var_388_11
				local var_388_13 = Vector3.New(0, 100, 0)

				var_388_9.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1069ui_story, var_388_13, var_388_12)

				local var_388_14 = manager.ui.mainCamera.transform.position - var_388_9.position

				var_388_9.forward = Vector3.New(var_388_14.x, var_388_14.y, var_388_14.z)

				local var_388_15 = var_388_9.localEulerAngles

				var_388_15.z = 0
				var_388_15.x = 0
				var_388_9.localEulerAngles = var_388_15
			end

			if arg_385_1.time_ >= var_388_10 + var_388_11 and arg_385_1.time_ < var_388_10 + var_388_11 + arg_388_0 then
				var_388_9.localPosition = Vector3.New(0, 100, 0)

				local var_388_16 = manager.ui.mainCamera.transform.position - var_388_9.position

				var_388_9.forward = Vector3.New(var_388_16.x, var_388_16.y, var_388_16.z)

				local var_388_17 = var_388_9.localEulerAngles

				var_388_17.z = 0
				var_388_17.x = 0
				var_388_9.localEulerAngles = var_388_17
			end

			local var_388_18 = 0
			local var_388_19 = 0.525

			if var_388_18 < arg_385_1.time_ and arg_385_1.time_ <= var_388_18 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_20 = arg_385_1:GetWordFromCfg(120151095)
				local var_388_21 = arg_385_1:FormatText(var_388_20.content)

				arg_385_1.text_.text = var_388_21

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_22 = 21
				local var_388_23 = utf8.len(var_388_21)
				local var_388_24 = var_388_22 <= 0 and var_388_19 or var_388_19 * (var_388_23 / var_388_22)

				if var_388_24 > 0 and var_388_19 < var_388_24 then
					arg_385_1.talkMaxDuration = var_388_24

					if var_388_24 + var_388_18 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_24 + var_388_18
					end
				end

				arg_385_1.text_.text = var_388_21
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_25 = math.max(var_388_19, arg_385_1.talkMaxDuration)

			if var_388_18 <= arg_385_1.time_ and arg_385_1.time_ < var_388_18 + var_388_25 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_18) / var_388_25

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_18 + var_388_25 and arg_385_1.time_ < var_388_18 + var_388_25 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play120151096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 120151096
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play120151097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 0.475

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, false)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_2 = arg_389_1:GetWordFromCfg(120151096)
				local var_392_3 = arg_389_1:FormatText(var_392_2.content)

				arg_389_1.text_.text = var_392_3

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_4 = 19
				local var_392_5 = utf8.len(var_392_3)
				local var_392_6 = var_392_4 <= 0 and var_392_1 or var_392_1 * (var_392_5 / var_392_4)

				if var_392_6 > 0 and var_392_1 < var_392_6 then
					arg_389_1.talkMaxDuration = var_392_6

					if var_392_6 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_6 + var_392_0
					end
				end

				arg_389_1.text_.text = var_392_3
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_7 = math.max(var_392_1, arg_389_1.talkMaxDuration)

			if var_392_0 <= arg_389_1.time_ and arg_389_1.time_ < var_392_0 + var_392_7 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_0) / var_392_7

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_0 + var_392_7 and arg_389_1.time_ < var_392_0 + var_392_7 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play120151097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 120151097
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play120151098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 0.95

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, false)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_2 = arg_393_1:GetWordFromCfg(120151097)
				local var_396_3 = arg_393_1:FormatText(var_396_2.content)

				arg_393_1.text_.text = var_396_3

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_4 = 37
				local var_396_5 = utf8.len(var_396_3)
				local var_396_6 = var_396_4 <= 0 and var_396_1 or var_396_1 * (var_396_5 / var_396_4)

				if var_396_6 > 0 and var_396_1 < var_396_6 then
					arg_393_1.talkMaxDuration = var_396_6

					if var_396_6 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_6 + var_396_0
					end
				end

				arg_393_1.text_.text = var_396_3
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_7 = math.max(var_396_1, arg_393_1.talkMaxDuration)

			if var_396_0 <= arg_393_1.time_ and arg_393_1.time_ < var_396_0 + var_396_7 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_0) / var_396_7

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_0 + var_396_7 and arg_393_1.time_ < var_396_0 + var_396_7 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play120151098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 120151098
		arg_397_1.duration_ = 1.666

		local var_397_0 = {
			zh = 1.666,
			ja = 1.566
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
				arg_397_0:Play120151099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 0.15

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_2 = arg_397_1:FormatText(StoryNameCfg[381].name)

				arg_397_1.leftNameTxt_.text = var_400_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, true)
				arg_397_1.iconController_:SetSelectedState("hero")

				arg_397_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_3 = arg_397_1:GetWordFromCfg(120151098)
				local var_400_4 = arg_397_1:FormatText(var_400_3.content)

				arg_397_1.text_.text = var_400_4

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151098", "story_v_out_120151.awb") ~= 0 then
					local var_400_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151098", "story_v_out_120151.awb") / 1000

					if var_400_8 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_8 + var_400_0
					end

					if var_400_3.prefab_name ~= "" and arg_397_1.actors_[var_400_3.prefab_name] ~= nil then
						local var_400_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_3.prefab_name].transform, "story_v_out_120151", "120151098", "story_v_out_120151.awb")

						arg_397_1:RecordAudio("120151098", var_400_9)
						arg_397_1:RecordAudio("120151098", var_400_9)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_120151", "120151098", "story_v_out_120151.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_120151", "120151098", "story_v_out_120151.awb")
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
	Play120151099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 120151099
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play120151100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 0.975

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

				local var_404_2 = arg_401_1:GetWordFromCfg(120151099)
				local var_404_3 = arg_401_1:FormatText(var_404_2.content)

				arg_401_1.text_.text = var_404_3

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_4 = 39
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
	Play120151100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 120151100
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play120151101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 0.375

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_2 = arg_405_1:FormatText(StoryNameCfg[7].name)

				arg_405_1.leftNameTxt_.text = var_408_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_3 = arg_405_1:GetWordFromCfg(120151100)
				local var_408_4 = arg_405_1:FormatText(var_408_3.content)

				arg_405_1.text_.text = var_408_4

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_5 = 15
				local var_408_6 = utf8.len(var_408_4)
				local var_408_7 = var_408_5 <= 0 and var_408_1 or var_408_1 * (var_408_6 / var_408_5)

				if var_408_7 > 0 and var_408_1 < var_408_7 then
					arg_405_1.talkMaxDuration = var_408_7

					if var_408_7 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_7 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_4
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_8 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_8 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_8

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_8 and arg_405_1.time_ < var_408_0 + var_408_8 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play120151101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 120151101
		arg_409_1.duration_ = 2.466666666666

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play120151102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = "1076ui_story"

			if arg_409_1.actors_[var_412_0] == nil then
				local var_412_1 = Object.Instantiate(Asset.Load("Char/" .. var_412_0), arg_409_1.stage_.transform)

				var_412_1.name = var_412_0
				var_412_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_409_1.actors_[var_412_0] = var_412_1

				local var_412_2 = var_412_1:GetComponentInChildren(typeof(CharacterEffect))

				var_412_2.enabled = true

				local var_412_3 = GameObjectTools.GetOrAddComponent(var_412_1, typeof(DynamicBoneHelper))

				if var_412_3 then
					var_412_3:EnableDynamicBone(false)
				end

				arg_409_1:ShowWeapon(var_412_2.transform, false)

				arg_409_1.var_[var_412_0 .. "Animator"] = var_412_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_409_1.var_[var_412_0 .. "Animator"].applyRootMotion = true
				arg_409_1.var_[var_412_0 .. "LipSync"] = var_412_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_412_4 = arg_409_1.actors_["1076ui_story"].transform
			local var_412_5 = 0

			if var_412_5 < arg_409_1.time_ and arg_409_1.time_ <= var_412_5 + arg_412_0 then
				arg_409_1.var_.moveOldPos1076ui_story = var_412_4.localPosition
			end

			local var_412_6 = 0.001

			if var_412_5 <= arg_409_1.time_ and arg_409_1.time_ < var_412_5 + var_412_6 then
				local var_412_7 = (arg_409_1.time_ - var_412_5) / var_412_6
				local var_412_8 = Vector3.New(0, -1.06, -6.2)

				var_412_4.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1076ui_story, var_412_8, var_412_7)

				local var_412_9 = manager.ui.mainCamera.transform.position - var_412_4.position

				var_412_4.forward = Vector3.New(var_412_9.x, var_412_9.y, var_412_9.z)

				local var_412_10 = var_412_4.localEulerAngles

				var_412_10.z = 0
				var_412_10.x = 0
				var_412_4.localEulerAngles = var_412_10
			end

			if arg_409_1.time_ >= var_412_5 + var_412_6 and arg_409_1.time_ < var_412_5 + var_412_6 + arg_412_0 then
				var_412_4.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_412_11 = manager.ui.mainCamera.transform.position - var_412_4.position

				var_412_4.forward = Vector3.New(var_412_11.x, var_412_11.y, var_412_11.z)

				local var_412_12 = var_412_4.localEulerAngles

				var_412_12.z = 0
				var_412_12.x = 0
				var_412_4.localEulerAngles = var_412_12
			end

			local var_412_13 = 0

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_412_14 = 0

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 then
				arg_409_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_412_15 = arg_409_1.actors_["1076ui_story"]
			local var_412_16 = 0

			if var_412_16 < arg_409_1.time_ and arg_409_1.time_ <= var_412_16 + arg_412_0 and arg_409_1.var_.characterEffect1076ui_story == nil then
				arg_409_1.var_.characterEffect1076ui_story = var_412_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_17 = 0.2

			if var_412_16 <= arg_409_1.time_ and arg_409_1.time_ < var_412_16 + var_412_17 then
				local var_412_18 = (arg_409_1.time_ - var_412_16) / var_412_17

				if arg_409_1.var_.characterEffect1076ui_story then
					arg_409_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_16 + var_412_17 and arg_409_1.time_ < var_412_16 + var_412_17 + arg_412_0 and arg_409_1.var_.characterEffect1076ui_story then
				arg_409_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_412_19 = 0
			local var_412_20 = 0.125

			if var_412_19 < arg_409_1.time_ and arg_409_1.time_ <= var_412_19 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_21 = arg_409_1:FormatText(StoryNameCfg[389].name)

				arg_409_1.leftNameTxt_.text = var_412_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_22 = arg_409_1:GetWordFromCfg(120151101)
				local var_412_23 = arg_409_1:FormatText(var_412_22.content)

				arg_409_1.text_.text = var_412_23

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_24 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151101", "story_v_out_120151.awb") ~= 0 then
					local var_412_27 = manager.audio:GetVoiceLength("story_v_out_120151", "120151101", "story_v_out_120151.awb") / 1000

					if var_412_27 + var_412_19 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_27 + var_412_19
					end

					if var_412_22.prefab_name ~= "" and arg_409_1.actors_[var_412_22.prefab_name] ~= nil then
						local var_412_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_22.prefab_name].transform, "story_v_out_120151", "120151101", "story_v_out_120151.awb")

						arg_409_1:RecordAudio("120151101", var_412_28)
						arg_409_1:RecordAudio("120151101", var_412_28)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_120151", "120151101", "story_v_out_120151.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_120151", "120151101", "story_v_out_120151.awb")
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
	Play120151102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 120151102
		arg_413_1.duration_ = 3.166

		local var_413_0 = {
			zh = 2.233,
			ja = 3.166
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
				arg_413_0:Play120151103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0
			local var_416_1 = 0.225

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_2 = arg_413_1:FormatText(StoryNameCfg[389].name)

				arg_413_1.leftNameTxt_.text = var_416_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_3 = arg_413_1:GetWordFromCfg(120151102)
				local var_416_4 = arg_413_1:FormatText(var_416_3.content)

				arg_413_1.text_.text = var_416_4

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_5 = 9
				local var_416_6 = utf8.len(var_416_4)
				local var_416_7 = var_416_5 <= 0 and var_416_1 or var_416_1 * (var_416_6 / var_416_5)

				if var_416_7 > 0 and var_416_1 < var_416_7 then
					arg_413_1.talkMaxDuration = var_416_7

					if var_416_7 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_7 + var_416_0
					end
				end

				arg_413_1.text_.text = var_416_4
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151102", "story_v_out_120151.awb") ~= 0 then
					local var_416_8 = manager.audio:GetVoiceLength("story_v_out_120151", "120151102", "story_v_out_120151.awb") / 1000

					if var_416_8 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_8 + var_416_0
					end

					if var_416_3.prefab_name ~= "" and arg_413_1.actors_[var_416_3.prefab_name] ~= nil then
						local var_416_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_3.prefab_name].transform, "story_v_out_120151", "120151102", "story_v_out_120151.awb")

						arg_413_1:RecordAudio("120151102", var_416_9)
						arg_413_1:RecordAudio("120151102", var_416_9)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_120151", "120151102", "story_v_out_120151.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_120151", "120151102", "story_v_out_120151.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_10 = math.max(var_416_1, arg_413_1.talkMaxDuration)

			if var_416_0 <= arg_413_1.time_ and arg_413_1.time_ < var_416_0 + var_416_10 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_0) / var_416_10

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_0 + var_416_10 and arg_413_1.time_ < var_416_0 + var_416_10 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play120151103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 120151103
		arg_417_1.duration_ = 7.666

		local var_417_0 = {
			zh = 5.4,
			ja = 7.666
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
				arg_417_0:Play120151104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1076ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect1076ui_story == nil then
				arg_417_1.var_.characterEffect1076ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect1076ui_story then
					local var_420_4 = Mathf.Lerp(0, 0.5, var_420_3)

					arg_417_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1076ui_story.fillRatio = var_420_4
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect1076ui_story then
				local var_420_5 = 0.5

				arg_417_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1076ui_story.fillRatio = var_420_5
			end

			local var_420_6 = arg_417_1.actors_["1076ui_story"].transform
			local var_420_7 = 0

			if var_420_7 < arg_417_1.time_ and arg_417_1.time_ <= var_420_7 + arg_420_0 then
				arg_417_1.var_.moveOldPos1076ui_story = var_420_6.localPosition
			end

			local var_420_8 = 0.001

			if var_420_7 <= arg_417_1.time_ and arg_417_1.time_ < var_420_7 + var_420_8 then
				local var_420_9 = (arg_417_1.time_ - var_420_7) / var_420_8
				local var_420_10 = Vector3.New(-0.7, -1.06, -6.2)

				var_420_6.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1076ui_story, var_420_10, var_420_9)

				local var_420_11 = manager.ui.mainCamera.transform.position - var_420_6.position

				var_420_6.forward = Vector3.New(var_420_11.x, var_420_11.y, var_420_11.z)

				local var_420_12 = var_420_6.localEulerAngles

				var_420_12.z = 0
				var_420_12.x = 0
				var_420_6.localEulerAngles = var_420_12
			end

			if arg_417_1.time_ >= var_420_7 + var_420_8 and arg_417_1.time_ < var_420_7 + var_420_8 + arg_420_0 then
				var_420_6.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_420_13 = manager.ui.mainCamera.transform.position - var_420_6.position

				var_420_6.forward = Vector3.New(var_420_13.x, var_420_13.y, var_420_13.z)

				local var_420_14 = var_420_6.localEulerAngles

				var_420_14.z = 0
				var_420_14.x = 0
				var_420_6.localEulerAngles = var_420_14
			end

			local var_420_15 = arg_417_1.actors_["1075ui_story"].transform
			local var_420_16 = 0

			if var_420_16 < arg_417_1.time_ and arg_417_1.time_ <= var_420_16 + arg_420_0 then
				arg_417_1.var_.moveOldPos1075ui_story = var_420_15.localPosition
			end

			local var_420_17 = 0.001

			if var_420_16 <= arg_417_1.time_ and arg_417_1.time_ < var_420_16 + var_420_17 then
				local var_420_18 = (arg_417_1.time_ - var_420_16) / var_420_17
				local var_420_19 = Vector3.New(0.7, -1.055, -6.16)

				var_420_15.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1075ui_story, var_420_19, var_420_18)

				local var_420_20 = manager.ui.mainCamera.transform.position - var_420_15.position

				var_420_15.forward = Vector3.New(var_420_20.x, var_420_20.y, var_420_20.z)

				local var_420_21 = var_420_15.localEulerAngles

				var_420_21.z = 0
				var_420_21.x = 0
				var_420_15.localEulerAngles = var_420_21
			end

			if arg_417_1.time_ >= var_420_16 + var_420_17 and arg_417_1.time_ < var_420_16 + var_420_17 + arg_420_0 then
				var_420_15.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_420_22 = manager.ui.mainCamera.transform.position - var_420_15.position

				var_420_15.forward = Vector3.New(var_420_22.x, var_420_22.y, var_420_22.z)

				local var_420_23 = var_420_15.localEulerAngles

				var_420_23.z = 0
				var_420_23.x = 0
				var_420_15.localEulerAngles = var_420_23
			end

			local var_420_24 = 0

			if var_420_24 < arg_417_1.time_ and arg_417_1.time_ <= var_420_24 + arg_420_0 then
				arg_417_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_420_25 = 0

			if var_420_25 < arg_417_1.time_ and arg_417_1.time_ <= var_420_25 + arg_420_0 then
				arg_417_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_420_26 = arg_417_1.actors_["1075ui_story"]
			local var_420_27 = 0

			if var_420_27 < arg_417_1.time_ and arg_417_1.time_ <= var_420_27 + arg_420_0 and arg_417_1.var_.characterEffect1075ui_story == nil then
				arg_417_1.var_.characterEffect1075ui_story = var_420_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_28 = 0.2

			if var_420_27 <= arg_417_1.time_ and arg_417_1.time_ < var_420_27 + var_420_28 then
				local var_420_29 = (arg_417_1.time_ - var_420_27) / var_420_28

				if arg_417_1.var_.characterEffect1075ui_story then
					arg_417_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_27 + var_420_28 and arg_417_1.time_ < var_420_27 + var_420_28 + arg_420_0 and arg_417_1.var_.characterEffect1075ui_story then
				arg_417_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_420_30 = 0
			local var_420_31 = 0.6

			if var_420_30 < arg_417_1.time_ and arg_417_1.time_ <= var_420_30 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_32 = arg_417_1:FormatText(StoryNameCfg[381].name)

				arg_417_1.leftNameTxt_.text = var_420_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_33 = arg_417_1:GetWordFromCfg(120151103)
				local var_420_34 = arg_417_1:FormatText(var_420_33.content)

				arg_417_1.text_.text = var_420_34

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_35 = 24
				local var_420_36 = utf8.len(var_420_34)
				local var_420_37 = var_420_35 <= 0 and var_420_31 or var_420_31 * (var_420_36 / var_420_35)

				if var_420_37 > 0 and var_420_31 < var_420_37 then
					arg_417_1.talkMaxDuration = var_420_37

					if var_420_37 + var_420_30 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_37 + var_420_30
					end
				end

				arg_417_1.text_.text = var_420_34
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151103", "story_v_out_120151.awb") ~= 0 then
					local var_420_38 = manager.audio:GetVoiceLength("story_v_out_120151", "120151103", "story_v_out_120151.awb") / 1000

					if var_420_38 + var_420_30 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_38 + var_420_30
					end

					if var_420_33.prefab_name ~= "" and arg_417_1.actors_[var_420_33.prefab_name] ~= nil then
						local var_420_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_33.prefab_name].transform, "story_v_out_120151", "120151103", "story_v_out_120151.awb")

						arg_417_1:RecordAudio("120151103", var_420_39)
						arg_417_1:RecordAudio("120151103", var_420_39)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_120151", "120151103", "story_v_out_120151.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_120151", "120151103", "story_v_out_120151.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_40 = math.max(var_420_31, arg_417_1.talkMaxDuration)

			if var_420_30 <= arg_417_1.time_ and arg_417_1.time_ < var_420_30 + var_420_40 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_30) / var_420_40

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_30 + var_420_40 and arg_417_1.time_ < var_420_30 + var_420_40 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play120151104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 120151104
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play120151105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1075ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect1075ui_story == nil then
				arg_421_1.var_.characterEffect1075ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.2

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect1075ui_story then
					local var_424_4 = Mathf.Lerp(0, 0.5, var_424_3)

					arg_421_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1075ui_story.fillRatio = var_424_4
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect1075ui_story then
				local var_424_5 = 0.5

				arg_421_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1075ui_story.fillRatio = var_424_5
			end

			local var_424_6 = 0
			local var_424_7 = 0.775

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

				local var_424_8 = arg_421_1:GetWordFromCfg(120151104)
				local var_424_9 = arg_421_1:FormatText(var_424_8.content)

				arg_421_1.text_.text = var_424_9

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_10 = 33
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
	Play120151105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 120151105
		arg_425_1.duration_ = 9.966

		local var_425_0 = {
			zh = 6.2,
			ja = 9.966
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
				arg_425_0:Play120151106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1076ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect1076ui_story == nil then
				arg_425_1.var_.characterEffect1076ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.2

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect1076ui_story then
					arg_425_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect1076ui_story then
				arg_425_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_428_4 = 0

			if var_428_4 < arg_425_1.time_ and arg_425_1.time_ <= var_428_4 + arg_428_0 then
				arg_425_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_428_5 = 0

			if var_428_5 < arg_425_1.time_ and arg_425_1.time_ <= var_428_5 + arg_428_0 then
				arg_425_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action2_1")
			end

			local var_428_6 = 0
			local var_428_7 = 0.725

			if var_428_6 < arg_425_1.time_ and arg_425_1.time_ <= var_428_6 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_8 = arg_425_1:FormatText(StoryNameCfg[389].name)

				arg_425_1.leftNameTxt_.text = var_428_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_9 = arg_425_1:GetWordFromCfg(120151105)
				local var_428_10 = arg_425_1:FormatText(var_428_9.content)

				arg_425_1.text_.text = var_428_10

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_11 = 31
				local var_428_12 = utf8.len(var_428_10)
				local var_428_13 = var_428_11 <= 0 and var_428_7 or var_428_7 * (var_428_12 / var_428_11)

				if var_428_13 > 0 and var_428_7 < var_428_13 then
					arg_425_1.talkMaxDuration = var_428_13

					if var_428_13 + var_428_6 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_13 + var_428_6
					end
				end

				arg_425_1.text_.text = var_428_10
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151105", "story_v_out_120151.awb") ~= 0 then
					local var_428_14 = manager.audio:GetVoiceLength("story_v_out_120151", "120151105", "story_v_out_120151.awb") / 1000

					if var_428_14 + var_428_6 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_14 + var_428_6
					end

					if var_428_9.prefab_name ~= "" and arg_425_1.actors_[var_428_9.prefab_name] ~= nil then
						local var_428_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_9.prefab_name].transform, "story_v_out_120151", "120151105", "story_v_out_120151.awb")

						arg_425_1:RecordAudio("120151105", var_428_15)
						arg_425_1:RecordAudio("120151105", var_428_15)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_120151", "120151105", "story_v_out_120151.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_120151", "120151105", "story_v_out_120151.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_16 = math.max(var_428_7, arg_425_1.talkMaxDuration)

			if var_428_6 <= arg_425_1.time_ and arg_425_1.time_ < var_428_6 + var_428_16 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_6) / var_428_16

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_6 + var_428_16 and arg_425_1.time_ < var_428_6 + var_428_16 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play120151106 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 120151106
		arg_429_1.duration_ = 6.5

		local var_429_0 = {
			zh = 6.5,
			ja = 6.166
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
				arg_429_0:Play120151107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1184ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1184ui_story == nil then
				arg_429_1.var_.characterEffect1184ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.2

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1184ui_story then
					arg_429_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1184ui_story then
				arg_429_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_432_4 = arg_429_1.actors_["1184ui_story"].transform
			local var_432_5 = 0

			if var_432_5 < arg_429_1.time_ and arg_429_1.time_ <= var_432_5 + arg_432_0 then
				arg_429_1.var_.moveOldPos1184ui_story = var_432_4.localPosition
			end

			local var_432_6 = 0.001

			if var_432_5 <= arg_429_1.time_ and arg_429_1.time_ < var_432_5 + var_432_6 then
				local var_432_7 = (arg_429_1.time_ - var_432_5) / var_432_6
				local var_432_8 = Vector3.New(0, -0.97, -6)

				var_432_4.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1184ui_story, var_432_8, var_432_7)

				local var_432_9 = manager.ui.mainCamera.transform.position - var_432_4.position

				var_432_4.forward = Vector3.New(var_432_9.x, var_432_9.y, var_432_9.z)

				local var_432_10 = var_432_4.localEulerAngles

				var_432_10.z = 0
				var_432_10.x = 0
				var_432_4.localEulerAngles = var_432_10
			end

			if arg_429_1.time_ >= var_432_5 + var_432_6 and arg_429_1.time_ < var_432_5 + var_432_6 + arg_432_0 then
				var_432_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_432_11 = manager.ui.mainCamera.transform.position - var_432_4.position

				var_432_4.forward = Vector3.New(var_432_11.x, var_432_11.y, var_432_11.z)

				local var_432_12 = var_432_4.localEulerAngles

				var_432_12.z = 0
				var_432_12.x = 0
				var_432_4.localEulerAngles = var_432_12
			end

			local var_432_13 = arg_429_1.actors_["1076ui_story"].transform
			local var_432_14 = 0

			if var_432_14 < arg_429_1.time_ and arg_429_1.time_ <= var_432_14 + arg_432_0 then
				arg_429_1.var_.moveOldPos1076ui_story = var_432_13.localPosition
			end

			local var_432_15 = 0.001

			if var_432_14 <= arg_429_1.time_ and arg_429_1.time_ < var_432_14 + var_432_15 then
				local var_432_16 = (arg_429_1.time_ - var_432_14) / var_432_15
				local var_432_17 = Vector3.New(0, 100, 0)

				var_432_13.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1076ui_story, var_432_17, var_432_16)

				local var_432_18 = manager.ui.mainCamera.transform.position - var_432_13.position

				var_432_13.forward = Vector3.New(var_432_18.x, var_432_18.y, var_432_18.z)

				local var_432_19 = var_432_13.localEulerAngles

				var_432_19.z = 0
				var_432_19.x = 0
				var_432_13.localEulerAngles = var_432_19
			end

			if arg_429_1.time_ >= var_432_14 + var_432_15 and arg_429_1.time_ < var_432_14 + var_432_15 + arg_432_0 then
				var_432_13.localPosition = Vector3.New(0, 100, 0)

				local var_432_20 = manager.ui.mainCamera.transform.position - var_432_13.position

				var_432_13.forward = Vector3.New(var_432_20.x, var_432_20.y, var_432_20.z)

				local var_432_21 = var_432_13.localEulerAngles

				var_432_21.z = 0
				var_432_21.x = 0
				var_432_13.localEulerAngles = var_432_21
			end

			local var_432_22 = 0

			if var_432_22 < arg_429_1.time_ and arg_429_1.time_ <= var_432_22 + arg_432_0 then
				arg_429_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_432_23 = 0

			if var_432_23 < arg_429_1.time_ and arg_429_1.time_ <= var_432_23 + arg_432_0 then
				arg_429_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_432_24 = arg_429_1.actors_["1075ui_story"].transform
			local var_432_25 = 0

			if var_432_25 < arg_429_1.time_ and arg_429_1.time_ <= var_432_25 + arg_432_0 then
				arg_429_1.var_.moveOldPos1075ui_story = var_432_24.localPosition
			end

			local var_432_26 = 0.001

			if var_432_25 <= arg_429_1.time_ and arg_429_1.time_ < var_432_25 + var_432_26 then
				local var_432_27 = (arg_429_1.time_ - var_432_25) / var_432_26
				local var_432_28 = Vector3.New(0, 100, 0)

				var_432_24.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1075ui_story, var_432_28, var_432_27)

				local var_432_29 = manager.ui.mainCamera.transform.position - var_432_24.position

				var_432_24.forward = Vector3.New(var_432_29.x, var_432_29.y, var_432_29.z)

				local var_432_30 = var_432_24.localEulerAngles

				var_432_30.z = 0
				var_432_30.x = 0
				var_432_24.localEulerAngles = var_432_30
			end

			if arg_429_1.time_ >= var_432_25 + var_432_26 and arg_429_1.time_ < var_432_25 + var_432_26 + arg_432_0 then
				var_432_24.localPosition = Vector3.New(0, 100, 0)

				local var_432_31 = manager.ui.mainCamera.transform.position - var_432_24.position

				var_432_24.forward = Vector3.New(var_432_31.x, var_432_31.y, var_432_31.z)

				local var_432_32 = var_432_24.localEulerAngles

				var_432_32.z = 0
				var_432_32.x = 0
				var_432_24.localEulerAngles = var_432_32
			end

			local var_432_33 = 0
			local var_432_34 = 0.625

			if var_432_33 < arg_429_1.time_ and arg_429_1.time_ <= var_432_33 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_35 = arg_429_1:FormatText(StoryNameCfg[6].name)

				arg_429_1.leftNameTxt_.text = var_432_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_36 = arg_429_1:GetWordFromCfg(120151106)
				local var_432_37 = arg_429_1:FormatText(var_432_36.content)

				arg_429_1.text_.text = var_432_37

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_38 = 25
				local var_432_39 = utf8.len(var_432_37)
				local var_432_40 = var_432_38 <= 0 and var_432_34 or var_432_34 * (var_432_39 / var_432_38)

				if var_432_40 > 0 and var_432_34 < var_432_40 then
					arg_429_1.talkMaxDuration = var_432_40

					if var_432_40 + var_432_33 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_40 + var_432_33
					end
				end

				arg_429_1.text_.text = var_432_37
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151106", "story_v_out_120151.awb") ~= 0 then
					local var_432_41 = manager.audio:GetVoiceLength("story_v_out_120151", "120151106", "story_v_out_120151.awb") / 1000

					if var_432_41 + var_432_33 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_41 + var_432_33
					end

					if var_432_36.prefab_name ~= "" and arg_429_1.actors_[var_432_36.prefab_name] ~= nil then
						local var_432_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_36.prefab_name].transform, "story_v_out_120151", "120151106", "story_v_out_120151.awb")

						arg_429_1:RecordAudio("120151106", var_432_42)
						arg_429_1:RecordAudio("120151106", var_432_42)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_120151", "120151106", "story_v_out_120151.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_120151", "120151106", "story_v_out_120151.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_43 = math.max(var_432_34, arg_429_1.talkMaxDuration)

			if var_432_33 <= arg_429_1.time_ and arg_429_1.time_ < var_432_33 + var_432_43 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_33) / var_432_43

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_33 + var_432_43 and arg_429_1.time_ < var_432_33 + var_432_43 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play120151107 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 120151107
		arg_433_1.duration_ = 5

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play120151108(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1184ui_story"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos1184ui_story = var_436_0.localPosition
			end

			local var_436_2 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2
				local var_436_4 = Vector3.New(0, 100, 0)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1184ui_story, var_436_4, var_436_3)

				local var_436_5 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_5.x, var_436_5.y, var_436_5.z)

				local var_436_6 = var_436_0.localEulerAngles

				var_436_6.z = 0
				var_436_6.x = 0
				var_436_0.localEulerAngles = var_436_6
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(0, 100, 0)

				local var_436_7 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_7.x, var_436_7.y, var_436_7.z)

				local var_436_8 = var_436_0.localEulerAngles

				var_436_8.z = 0
				var_436_8.x = 0
				var_436_0.localEulerAngles = var_436_8
			end

			local var_436_9 = 0
			local var_436_10 = 0.8

			if var_436_9 < arg_433_1.time_ and arg_433_1.time_ <= var_436_9 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, false)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_11 = arg_433_1:GetWordFromCfg(120151107)
				local var_436_12 = arg_433_1:FormatText(var_436_11.content)

				arg_433_1.text_.text = var_436_12

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_13 = 32
				local var_436_14 = utf8.len(var_436_12)
				local var_436_15 = var_436_13 <= 0 and var_436_10 or var_436_10 * (var_436_14 / var_436_13)

				if var_436_15 > 0 and var_436_10 < var_436_15 then
					arg_433_1.talkMaxDuration = var_436_15

					if var_436_15 + var_436_9 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_15 + var_436_9
					end
				end

				arg_433_1.text_.text = var_436_12
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)
				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_16 = math.max(var_436_10, arg_433_1.talkMaxDuration)

			if var_436_9 <= arg_433_1.time_ and arg_433_1.time_ < var_436_9 + var_436_16 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_9) / var_436_16

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_9 + var_436_16 and arg_433_1.time_ < var_436_9 + var_436_16 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play120151108 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 120151108
		arg_437_1.duration_ = 5

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play120151109(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 1.35

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, false)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_2 = arg_437_1:GetWordFromCfg(120151108)
				local var_440_3 = arg_437_1:FormatText(var_440_2.content)

				arg_437_1.text_.text = var_440_3

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_4 = 54
				local var_440_5 = utf8.len(var_440_3)
				local var_440_6 = var_440_4 <= 0 and var_440_1 or var_440_1 * (var_440_5 / var_440_4)

				if var_440_6 > 0 and var_440_1 < var_440_6 then
					arg_437_1.talkMaxDuration = var_440_6

					if var_440_6 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_6 + var_440_0
					end
				end

				arg_437_1.text_.text = var_440_3
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_7 = math.max(var_440_1, arg_437_1.talkMaxDuration)

			if var_440_0 <= arg_437_1.time_ and arg_437_1.time_ < var_440_0 + var_440_7 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_0) / var_440_7

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_0 + var_440_7 and arg_437_1.time_ < var_440_0 + var_440_7 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play120151109 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 120151109
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play120151110(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0
			local var_444_1 = 1.2

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

				local var_444_2 = arg_441_1:GetWordFromCfg(120151109)
				local var_444_3 = arg_441_1:FormatText(var_444_2.content)

				arg_441_1.text_.text = var_444_3

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_4 = 48
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
	Play120151110 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 120151110
		arg_445_1.duration_ = 4.433

		local var_445_0 = {
			zh = 4.133,
			ja = 4.433
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
				arg_445_0:Play120151111(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1076ui_story"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos1076ui_story = var_448_0.localPosition
			end

			local var_448_2 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2
				local var_448_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1076ui_story, var_448_4, var_448_3)

				local var_448_5 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_5.x, var_448_5.y, var_448_5.z)

				local var_448_6 = var_448_0.localEulerAngles

				var_448_6.z = 0
				var_448_6.x = 0
				var_448_0.localEulerAngles = var_448_6
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 then
				var_448_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_448_7 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_7.x, var_448_7.y, var_448_7.z)

				local var_448_8 = var_448_0.localEulerAngles

				var_448_8.z = 0
				var_448_8.x = 0
				var_448_0.localEulerAngles = var_448_8
			end

			local var_448_9 = arg_445_1.actors_["1029ui_story"].transform
			local var_448_10 = 0

			if var_448_10 < arg_445_1.time_ and arg_445_1.time_ <= var_448_10 + arg_448_0 then
				arg_445_1.var_.moveOldPos1029ui_story = var_448_9.localPosition
			end

			local var_448_11 = 0.001

			if var_448_10 <= arg_445_1.time_ and arg_445_1.time_ < var_448_10 + var_448_11 then
				local var_448_12 = (arg_445_1.time_ - var_448_10) / var_448_11
				local var_448_13 = Vector3.New(0.7, -1.09, -6.2)

				var_448_9.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1029ui_story, var_448_13, var_448_12)

				local var_448_14 = manager.ui.mainCamera.transform.position - var_448_9.position

				var_448_9.forward = Vector3.New(var_448_14.x, var_448_14.y, var_448_14.z)

				local var_448_15 = var_448_9.localEulerAngles

				var_448_15.z = 0
				var_448_15.x = 0
				var_448_9.localEulerAngles = var_448_15
			end

			if arg_445_1.time_ >= var_448_10 + var_448_11 and arg_445_1.time_ < var_448_10 + var_448_11 + arg_448_0 then
				var_448_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_448_16 = manager.ui.mainCamera.transform.position - var_448_9.position

				var_448_9.forward = Vector3.New(var_448_16.x, var_448_16.y, var_448_16.z)

				local var_448_17 = var_448_9.localEulerAngles

				var_448_17.z = 0
				var_448_17.x = 0
				var_448_9.localEulerAngles = var_448_17
			end

			local var_448_18 = 0

			if var_448_18 < arg_445_1.time_ and arg_445_1.time_ <= var_448_18 + arg_448_0 then
				arg_445_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_448_19 = 0

			if var_448_19 < arg_445_1.time_ and arg_445_1.time_ <= var_448_19 + arg_448_0 then
				arg_445_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_448_20 = arg_445_1.actors_["1029ui_story"]
			local var_448_21 = 0

			if var_448_21 < arg_445_1.time_ and arg_445_1.time_ <= var_448_21 + arg_448_0 and arg_445_1.var_.characterEffect1029ui_story == nil then
				arg_445_1.var_.characterEffect1029ui_story = var_448_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_22 = 0.2

			if var_448_21 <= arg_445_1.time_ and arg_445_1.time_ < var_448_21 + var_448_22 then
				local var_448_23 = (arg_445_1.time_ - var_448_21) / var_448_22

				if arg_445_1.var_.characterEffect1029ui_story then
					arg_445_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_445_1.time_ >= var_448_21 + var_448_22 and arg_445_1.time_ < var_448_21 + var_448_22 + arg_448_0 and arg_445_1.var_.characterEffect1029ui_story then
				arg_445_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_448_24 = arg_445_1.actors_["1076ui_story"]
			local var_448_25 = 0

			if var_448_25 < arg_445_1.time_ and arg_445_1.time_ <= var_448_25 + arg_448_0 and arg_445_1.var_.characterEffect1076ui_story == nil then
				arg_445_1.var_.characterEffect1076ui_story = var_448_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_26 = 0.034

			if var_448_25 <= arg_445_1.time_ and arg_445_1.time_ < var_448_25 + var_448_26 then
				local var_448_27 = (arg_445_1.time_ - var_448_25) / var_448_26

				if arg_445_1.var_.characterEffect1076ui_story then
					local var_448_28 = Mathf.Lerp(0, 0.5, var_448_27)

					arg_445_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_445_1.var_.characterEffect1076ui_story.fillRatio = var_448_28
				end
			end

			if arg_445_1.time_ >= var_448_25 + var_448_26 and arg_445_1.time_ < var_448_25 + var_448_26 + arg_448_0 and arg_445_1.var_.characterEffect1076ui_story then
				local var_448_29 = 0.5

				arg_445_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_445_1.var_.characterEffect1076ui_story.fillRatio = var_448_29
			end

			local var_448_30 = 0

			if var_448_30 < arg_445_1.time_ and arg_445_1.time_ <= var_448_30 + arg_448_0 then
				arg_445_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_448_31 = 0
			local var_448_32 = 0.475

			if var_448_31 < arg_445_1.time_ and arg_445_1.time_ <= var_448_31 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_33 = arg_445_1:FormatText(StoryNameCfg[319].name)

				arg_445_1.leftNameTxt_.text = var_448_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_34 = arg_445_1:GetWordFromCfg(120151110)
				local var_448_35 = arg_445_1:FormatText(var_448_34.content)

				arg_445_1.text_.text = var_448_35

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_36 = 19
				local var_448_37 = utf8.len(var_448_35)
				local var_448_38 = var_448_36 <= 0 and var_448_32 or var_448_32 * (var_448_37 / var_448_36)

				if var_448_38 > 0 and var_448_32 < var_448_38 then
					arg_445_1.talkMaxDuration = var_448_38

					if var_448_38 + var_448_31 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_38 + var_448_31
					end
				end

				arg_445_1.text_.text = var_448_35
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151110", "story_v_out_120151.awb") ~= 0 then
					local var_448_39 = manager.audio:GetVoiceLength("story_v_out_120151", "120151110", "story_v_out_120151.awb") / 1000

					if var_448_39 + var_448_31 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_39 + var_448_31
					end

					if var_448_34.prefab_name ~= "" and arg_445_1.actors_[var_448_34.prefab_name] ~= nil then
						local var_448_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_34.prefab_name].transform, "story_v_out_120151", "120151110", "story_v_out_120151.awb")

						arg_445_1:RecordAudio("120151110", var_448_40)
						arg_445_1:RecordAudio("120151110", var_448_40)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_120151", "120151110", "story_v_out_120151.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_120151", "120151110", "story_v_out_120151.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_41 = math.max(var_448_32, arg_445_1.talkMaxDuration)

			if var_448_31 <= arg_445_1.time_ and arg_445_1.time_ < var_448_31 + var_448_41 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_31) / var_448_41

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_31 + var_448_41 and arg_445_1.time_ < var_448_31 + var_448_41 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play120151111 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 120151111
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play120151112(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["1029ui_story"]
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 and arg_449_1.var_.characterEffect1029ui_story == nil then
				arg_449_1.var_.characterEffect1029ui_story = var_452_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_2 = 0.2

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2

				if arg_449_1.var_.characterEffect1029ui_story then
					local var_452_4 = Mathf.Lerp(0, 0.5, var_452_3)

					arg_449_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_449_1.var_.characterEffect1029ui_story.fillRatio = var_452_4
				end
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 and arg_449_1.var_.characterEffect1029ui_story then
				local var_452_5 = 0.5

				arg_449_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_449_1.var_.characterEffect1029ui_story.fillRatio = var_452_5
			end

			local var_452_6 = 0
			local var_452_7 = 0.175

			if var_452_6 < arg_449_1.time_ and arg_449_1.time_ <= var_452_6 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_8 = arg_449_1:FormatText(StoryNameCfg[7].name)

				arg_449_1.leftNameTxt_.text = var_452_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_9 = arg_449_1:GetWordFromCfg(120151111)
				local var_452_10 = arg_449_1:FormatText(var_452_9.content)

				arg_449_1.text_.text = var_452_10

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_11 = 7
				local var_452_12 = utf8.len(var_452_10)
				local var_452_13 = var_452_11 <= 0 and var_452_7 or var_452_7 * (var_452_12 / var_452_11)

				if var_452_13 > 0 and var_452_7 < var_452_13 then
					arg_449_1.talkMaxDuration = var_452_13

					if var_452_13 + var_452_6 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_13 + var_452_6
					end
				end

				arg_449_1.text_.text = var_452_10
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_14 = math.max(var_452_7, arg_449_1.talkMaxDuration)

			if var_452_6 <= arg_449_1.time_ and arg_449_1.time_ < var_452_6 + var_452_14 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_6) / var_452_14

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_6 + var_452_14 and arg_449_1.time_ < var_452_6 + var_452_14 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play120151112 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 120151112
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play120151113(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = 0
			local var_456_1 = 0.55

			if var_456_0 < arg_453_1.time_ and arg_453_1.time_ <= var_456_0 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, false)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_2 = arg_453_1:GetWordFromCfg(120151112)
				local var_456_3 = arg_453_1:FormatText(var_456_2.content)

				arg_453_1.text_.text = var_456_3

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_4 = 22
				local var_456_5 = utf8.len(var_456_3)
				local var_456_6 = var_456_4 <= 0 and var_456_1 or var_456_1 * (var_456_5 / var_456_4)

				if var_456_6 > 0 and var_456_1 < var_456_6 then
					arg_453_1.talkMaxDuration = var_456_6

					if var_456_6 + var_456_0 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_6 + var_456_0
					end
				end

				arg_453_1.text_.text = var_456_3
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_7 = math.max(var_456_1, arg_453_1.talkMaxDuration)

			if var_456_0 <= arg_453_1.time_ and arg_453_1.time_ < var_456_0 + var_456_7 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_0) / var_456_7

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_0 + var_456_7 and arg_453_1.time_ < var_456_0 + var_456_7 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play120151113 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 120151113
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play120151114(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1029ui_story"].transform
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.var_.moveOldPos1029ui_story = var_460_0.localPosition
			end

			local var_460_2 = 0.001

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2
				local var_460_4 = Vector3.New(0, 100, 0)

				var_460_0.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos1029ui_story, var_460_4, var_460_3)

				local var_460_5 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_5.x, var_460_5.y, var_460_5.z)

				local var_460_6 = var_460_0.localEulerAngles

				var_460_6.z = 0
				var_460_6.x = 0
				var_460_0.localEulerAngles = var_460_6
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 then
				var_460_0.localPosition = Vector3.New(0, 100, 0)

				local var_460_7 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_7.x, var_460_7.y, var_460_7.z)

				local var_460_8 = var_460_0.localEulerAngles

				var_460_8.z = 0
				var_460_8.x = 0
				var_460_0.localEulerAngles = var_460_8
			end

			local var_460_9 = arg_457_1.actors_["1076ui_story"].transform
			local var_460_10 = 0

			if var_460_10 < arg_457_1.time_ and arg_457_1.time_ <= var_460_10 + arg_460_0 then
				arg_457_1.var_.moveOldPos1076ui_story = var_460_9.localPosition
			end

			local var_460_11 = 0.001

			if var_460_10 <= arg_457_1.time_ and arg_457_1.time_ < var_460_10 + var_460_11 then
				local var_460_12 = (arg_457_1.time_ - var_460_10) / var_460_11
				local var_460_13 = Vector3.New(0, 100, 0)

				var_460_9.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos1076ui_story, var_460_13, var_460_12)

				local var_460_14 = manager.ui.mainCamera.transform.position - var_460_9.position

				var_460_9.forward = Vector3.New(var_460_14.x, var_460_14.y, var_460_14.z)

				local var_460_15 = var_460_9.localEulerAngles

				var_460_15.z = 0
				var_460_15.x = 0
				var_460_9.localEulerAngles = var_460_15
			end

			if arg_457_1.time_ >= var_460_10 + var_460_11 and arg_457_1.time_ < var_460_10 + var_460_11 + arg_460_0 then
				var_460_9.localPosition = Vector3.New(0, 100, 0)

				local var_460_16 = manager.ui.mainCamera.transform.position - var_460_9.position

				var_460_9.forward = Vector3.New(var_460_16.x, var_460_16.y, var_460_16.z)

				local var_460_17 = var_460_9.localEulerAngles

				var_460_17.z = 0
				var_460_17.x = 0
				var_460_9.localEulerAngles = var_460_17
			end

			local var_460_18 = 0
			local var_460_19 = 1.075

			if var_460_18 < arg_457_1.time_ and arg_457_1.time_ <= var_460_18 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, false)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_20 = arg_457_1:GetWordFromCfg(120151113)
				local var_460_21 = arg_457_1:FormatText(var_460_20.content)

				arg_457_1.text_.text = var_460_21

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_22 = 43
				local var_460_23 = utf8.len(var_460_21)
				local var_460_24 = var_460_22 <= 0 and var_460_19 or var_460_19 * (var_460_23 / var_460_22)

				if var_460_24 > 0 and var_460_19 < var_460_24 then
					arg_457_1.talkMaxDuration = var_460_24

					if var_460_24 + var_460_18 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_24 + var_460_18
					end
				end

				arg_457_1.text_.text = var_460_21
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_25 = math.max(var_460_19, arg_457_1.talkMaxDuration)

			if var_460_18 <= arg_457_1.time_ and arg_457_1.time_ < var_460_18 + var_460_25 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_18) / var_460_25

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_18 + var_460_25 and arg_457_1.time_ < var_460_18 + var_460_25 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play120151114 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 120151114
		arg_461_1.duration_ = 4

		local var_461_0 = {
			zh = 4,
			ja = 3.8
		}
		local var_461_1 = manager.audio:GetLocalizationFlag()

		if var_461_0[var_461_1] ~= nil then
			arg_461_1.duration_ = var_461_0[var_461_1]
		end

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play120151115(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1076ui_story"].transform
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 then
				arg_461_1.var_.moveOldPos1076ui_story = var_464_0.localPosition
			end

			local var_464_2 = 0.001

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2
				local var_464_4 = Vector3.New(0, -1.06, -6.2)

				var_464_0.localPosition = Vector3.Lerp(arg_461_1.var_.moveOldPos1076ui_story, var_464_4, var_464_3)

				local var_464_5 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_5.x, var_464_5.y, var_464_5.z)

				local var_464_6 = var_464_0.localEulerAngles

				var_464_6.z = 0
				var_464_6.x = 0
				var_464_0.localEulerAngles = var_464_6
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 then
				var_464_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_464_7 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_7.x, var_464_7.y, var_464_7.z)

				local var_464_8 = var_464_0.localEulerAngles

				var_464_8.z = 0
				var_464_8.x = 0
				var_464_0.localEulerAngles = var_464_8
			end

			local var_464_9 = 0

			if var_464_9 < arg_461_1.time_ and arg_461_1.time_ <= var_464_9 + arg_464_0 then
				arg_461_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action6_1")
			end

			local var_464_10 = 0

			if var_464_10 < arg_461_1.time_ and arg_461_1.time_ <= var_464_10 + arg_464_0 then
				arg_461_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_464_11 = arg_461_1.actors_["1076ui_story"]
			local var_464_12 = 0

			if var_464_12 < arg_461_1.time_ and arg_461_1.time_ <= var_464_12 + arg_464_0 and arg_461_1.var_.characterEffect1076ui_story == nil then
				arg_461_1.var_.characterEffect1076ui_story = var_464_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_13 = 0.2

			if var_464_12 <= arg_461_1.time_ and arg_461_1.time_ < var_464_12 + var_464_13 then
				local var_464_14 = (arg_461_1.time_ - var_464_12) / var_464_13

				if arg_461_1.var_.characterEffect1076ui_story then
					arg_461_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_12 + var_464_13 and arg_461_1.time_ < var_464_12 + var_464_13 + arg_464_0 and arg_461_1.var_.characterEffect1076ui_story then
				arg_461_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_464_15 = 0
			local var_464_16 = 0.3

			if var_464_15 < arg_461_1.time_ and arg_461_1.time_ <= var_464_15 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_17 = arg_461_1:FormatText(StoryNameCfg[389].name)

				arg_461_1.leftNameTxt_.text = var_464_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_18 = arg_461_1:GetWordFromCfg(120151114)
				local var_464_19 = arg_461_1:FormatText(var_464_18.content)

				arg_461_1.text_.text = var_464_19

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_20 = 12
				local var_464_21 = utf8.len(var_464_19)
				local var_464_22 = var_464_20 <= 0 and var_464_16 or var_464_16 * (var_464_21 / var_464_20)

				if var_464_22 > 0 and var_464_16 < var_464_22 then
					arg_461_1.talkMaxDuration = var_464_22

					if var_464_22 + var_464_15 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_22 + var_464_15
					end
				end

				arg_461_1.text_.text = var_464_19
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151114", "story_v_out_120151.awb") ~= 0 then
					local var_464_23 = manager.audio:GetVoiceLength("story_v_out_120151", "120151114", "story_v_out_120151.awb") / 1000

					if var_464_23 + var_464_15 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_23 + var_464_15
					end

					if var_464_18.prefab_name ~= "" and arg_461_1.actors_[var_464_18.prefab_name] ~= nil then
						local var_464_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_18.prefab_name].transform, "story_v_out_120151", "120151114", "story_v_out_120151.awb")

						arg_461_1:RecordAudio("120151114", var_464_24)
						arg_461_1:RecordAudio("120151114", var_464_24)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_120151", "120151114", "story_v_out_120151.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_120151", "120151114", "story_v_out_120151.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_25 = math.max(var_464_16, arg_461_1.talkMaxDuration)

			if var_464_15 <= arg_461_1.time_ and arg_461_1.time_ < var_464_15 + var_464_25 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_15) / var_464_25

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_15 + var_464_25 and arg_461_1.time_ < var_464_15 + var_464_25 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play120151115 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 120151115
		arg_465_1.duration_ = 11.533

		local var_465_0 = {
			zh = 5.366,
			ja = 11.533
		}
		local var_465_1 = manager.audio:GetLocalizationFlag()

		if var_465_0[var_465_1] ~= nil then
			arg_465_1.duration_ = var_465_0[var_465_1]
		end

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play120151116(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_468_1 = 0
			local var_468_2 = 0.525

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_3 = arg_465_1:FormatText(StoryNameCfg[389].name)

				arg_465_1.leftNameTxt_.text = var_468_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_4 = arg_465_1:GetWordFromCfg(120151115)
				local var_468_5 = arg_465_1:FormatText(var_468_4.content)

				arg_465_1.text_.text = var_468_5

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_6 = 21
				local var_468_7 = utf8.len(var_468_5)
				local var_468_8 = var_468_6 <= 0 and var_468_2 or var_468_2 * (var_468_7 / var_468_6)

				if var_468_8 > 0 and var_468_2 < var_468_8 then
					arg_465_1.talkMaxDuration = var_468_8

					if var_468_8 + var_468_1 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_8 + var_468_1
					end
				end

				arg_465_1.text_.text = var_468_5
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151115", "story_v_out_120151.awb") ~= 0 then
					local var_468_9 = manager.audio:GetVoiceLength("story_v_out_120151", "120151115", "story_v_out_120151.awb") / 1000

					if var_468_9 + var_468_1 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_9 + var_468_1
					end

					if var_468_4.prefab_name ~= "" and arg_465_1.actors_[var_468_4.prefab_name] ~= nil then
						local var_468_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_4.prefab_name].transform, "story_v_out_120151", "120151115", "story_v_out_120151.awb")

						arg_465_1:RecordAudio("120151115", var_468_10)
						arg_465_1:RecordAudio("120151115", var_468_10)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_120151", "120151115", "story_v_out_120151.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_120151", "120151115", "story_v_out_120151.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_11 = math.max(var_468_2, arg_465_1.talkMaxDuration)

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_11 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_1) / var_468_11

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_1 + var_468_11 and arg_465_1.time_ < var_468_1 + var_468_11 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play120151116 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 120151116
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play120151117(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1076ui_story"].transform
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 then
				arg_469_1.var_.moveOldPos1076ui_story = var_472_0.localPosition
			end

			local var_472_2 = 0.001

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2
				local var_472_4 = Vector3.New(0, 100, 0)

				var_472_0.localPosition = Vector3.Lerp(arg_469_1.var_.moveOldPos1076ui_story, var_472_4, var_472_3)

				local var_472_5 = manager.ui.mainCamera.transform.position - var_472_0.position

				var_472_0.forward = Vector3.New(var_472_5.x, var_472_5.y, var_472_5.z)

				local var_472_6 = var_472_0.localEulerAngles

				var_472_6.z = 0
				var_472_6.x = 0
				var_472_0.localEulerAngles = var_472_6
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 then
				var_472_0.localPosition = Vector3.New(0, 100, 0)

				local var_472_7 = manager.ui.mainCamera.transform.position - var_472_0.position

				var_472_0.forward = Vector3.New(var_472_7.x, var_472_7.y, var_472_7.z)

				local var_472_8 = var_472_0.localEulerAngles

				var_472_8.z = 0
				var_472_8.x = 0
				var_472_0.localEulerAngles = var_472_8
			end

			local var_472_9 = 0
			local var_472_10 = 0.775

			if var_472_9 < arg_469_1.time_ and arg_469_1.time_ <= var_472_9 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, false)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_11 = arg_469_1:GetWordFromCfg(120151116)
				local var_472_12 = arg_469_1:FormatText(var_472_11.content)

				arg_469_1.text_.text = var_472_12

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_13 = 31
				local var_472_14 = utf8.len(var_472_12)
				local var_472_15 = var_472_13 <= 0 and var_472_10 or var_472_10 * (var_472_14 / var_472_13)

				if var_472_15 > 0 and var_472_10 < var_472_15 then
					arg_469_1.talkMaxDuration = var_472_15

					if var_472_15 + var_472_9 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_15 + var_472_9
					end
				end

				arg_469_1.text_.text = var_472_12
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_16 = math.max(var_472_10, arg_469_1.talkMaxDuration)

			if var_472_9 <= arg_469_1.time_ and arg_469_1.time_ < var_472_9 + var_472_16 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_9) / var_472_16

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_9 + var_472_16 and arg_469_1.time_ < var_472_9 + var_472_16 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play120151117 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 120151117
		arg_473_1.duration_ = 7.066

		local var_473_0 = {
			zh = 5.1,
			ja = 7.066
		}
		local var_473_1 = manager.audio:GetLocalizationFlag()

		if var_473_0[var_473_1] ~= nil then
			arg_473_1.duration_ = var_473_0[var_473_1]
		end

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play120151118(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1075ui_story"].transform
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 then
				arg_473_1.var_.moveOldPos1075ui_story = var_476_0.localPosition
			end

			local var_476_2 = 0.001

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2
				local var_476_4 = Vector3.New(0.7, -1.055, -6.16)

				var_476_0.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos1075ui_story, var_476_4, var_476_3)

				local var_476_5 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_5.x, var_476_5.y, var_476_5.z)

				local var_476_6 = var_476_0.localEulerAngles

				var_476_6.z = 0
				var_476_6.x = 0
				var_476_0.localEulerAngles = var_476_6
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 then
				var_476_0.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_476_7 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_7.x, var_476_7.y, var_476_7.z)

				local var_476_8 = var_476_0.localEulerAngles

				var_476_8.z = 0
				var_476_8.x = 0
				var_476_0.localEulerAngles = var_476_8
			end

			local var_476_9 = 0

			if var_476_9 < arg_473_1.time_ and arg_473_1.time_ <= var_476_9 + arg_476_0 then
				arg_473_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_476_10 = 0

			if var_476_10 < arg_473_1.time_ and arg_473_1.time_ <= var_476_10 + arg_476_0 then
				arg_473_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_476_11 = arg_473_1.actors_["1075ui_story"]
			local var_476_12 = 0

			if var_476_12 < arg_473_1.time_ and arg_473_1.time_ <= var_476_12 + arg_476_0 and arg_473_1.var_.characterEffect1075ui_story == nil then
				arg_473_1.var_.characterEffect1075ui_story = var_476_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_13 = 0.2

			if var_476_12 <= arg_473_1.time_ and arg_473_1.time_ < var_476_12 + var_476_13 then
				local var_476_14 = (arg_473_1.time_ - var_476_12) / var_476_13

				if arg_473_1.var_.characterEffect1075ui_story then
					arg_473_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_473_1.time_ >= var_476_12 + var_476_13 and arg_473_1.time_ < var_476_12 + var_476_13 + arg_476_0 and arg_473_1.var_.characterEffect1075ui_story then
				arg_473_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_476_15 = arg_473_1.actors_["1076ui_story"].transform
			local var_476_16 = 0

			if var_476_16 < arg_473_1.time_ and arg_473_1.time_ <= var_476_16 + arg_476_0 then
				arg_473_1.var_.moveOldPos1076ui_story = var_476_15.localPosition
			end

			local var_476_17 = 0.001

			if var_476_16 <= arg_473_1.time_ and arg_473_1.time_ < var_476_16 + var_476_17 then
				local var_476_18 = (arg_473_1.time_ - var_476_16) / var_476_17
				local var_476_19 = Vector3.New(-0.7, -1.06, -6.2)

				var_476_15.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos1076ui_story, var_476_19, var_476_18)

				local var_476_20 = manager.ui.mainCamera.transform.position - var_476_15.position

				var_476_15.forward = Vector3.New(var_476_20.x, var_476_20.y, var_476_20.z)

				local var_476_21 = var_476_15.localEulerAngles

				var_476_21.z = 0
				var_476_21.x = 0
				var_476_15.localEulerAngles = var_476_21
			end

			if arg_473_1.time_ >= var_476_16 + var_476_17 and arg_473_1.time_ < var_476_16 + var_476_17 + arg_476_0 then
				var_476_15.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_476_22 = manager.ui.mainCamera.transform.position - var_476_15.position

				var_476_15.forward = Vector3.New(var_476_22.x, var_476_22.y, var_476_22.z)

				local var_476_23 = var_476_15.localEulerAngles

				var_476_23.z = 0
				var_476_23.x = 0
				var_476_15.localEulerAngles = var_476_23
			end

			local var_476_24 = arg_473_1.actors_["1076ui_story"]
			local var_476_25 = 0

			if var_476_25 < arg_473_1.time_ and arg_473_1.time_ <= var_476_25 + arg_476_0 and arg_473_1.var_.characterEffect1076ui_story == nil then
				arg_473_1.var_.characterEffect1076ui_story = var_476_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_26 = 0.0166666666666667

			if var_476_25 <= arg_473_1.time_ and arg_473_1.time_ < var_476_25 + var_476_26 then
				local var_476_27 = (arg_473_1.time_ - var_476_25) / var_476_26

				if arg_473_1.var_.characterEffect1076ui_story then
					local var_476_28 = Mathf.Lerp(0, 0.5, var_476_27)

					arg_473_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_473_1.var_.characterEffect1076ui_story.fillRatio = var_476_28
				end
			end

			if arg_473_1.time_ >= var_476_25 + var_476_26 and arg_473_1.time_ < var_476_25 + var_476_26 + arg_476_0 and arg_473_1.var_.characterEffect1076ui_story then
				local var_476_29 = 0.5

				arg_473_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_473_1.var_.characterEffect1076ui_story.fillRatio = var_476_29
			end

			local var_476_30 = 0

			if var_476_30 < arg_473_1.time_ and arg_473_1.time_ <= var_476_30 + arg_476_0 then
				arg_473_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_476_31 = 0
			local var_476_32 = 0.6

			if var_476_31 < arg_473_1.time_ and arg_473_1.time_ <= var_476_31 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_33 = arg_473_1:FormatText(StoryNameCfg[381].name)

				arg_473_1.leftNameTxt_.text = var_476_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_34 = arg_473_1:GetWordFromCfg(120151117)
				local var_476_35 = arg_473_1:FormatText(var_476_34.content)

				arg_473_1.text_.text = var_476_35

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_36 = 24
				local var_476_37 = utf8.len(var_476_35)
				local var_476_38 = var_476_36 <= 0 and var_476_32 or var_476_32 * (var_476_37 / var_476_36)

				if var_476_38 > 0 and var_476_32 < var_476_38 then
					arg_473_1.talkMaxDuration = var_476_38

					if var_476_38 + var_476_31 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_38 + var_476_31
					end
				end

				arg_473_1.text_.text = var_476_35
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151117", "story_v_out_120151.awb") ~= 0 then
					local var_476_39 = manager.audio:GetVoiceLength("story_v_out_120151", "120151117", "story_v_out_120151.awb") / 1000

					if var_476_39 + var_476_31 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_39 + var_476_31
					end

					if var_476_34.prefab_name ~= "" and arg_473_1.actors_[var_476_34.prefab_name] ~= nil then
						local var_476_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_34.prefab_name].transform, "story_v_out_120151", "120151117", "story_v_out_120151.awb")

						arg_473_1:RecordAudio("120151117", var_476_40)
						arg_473_1:RecordAudio("120151117", var_476_40)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_120151", "120151117", "story_v_out_120151.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_120151", "120151117", "story_v_out_120151.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_41 = math.max(var_476_32, arg_473_1.talkMaxDuration)

			if var_476_31 <= arg_473_1.time_ and arg_473_1.time_ < var_476_31 + var_476_41 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_31) / var_476_41

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_31 + var_476_41 and arg_473_1.time_ < var_476_31 + var_476_41 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play120151118 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 120151118
		arg_477_1.duration_ = 11.2

		local var_477_0 = {
			zh = 6.8,
			ja = 11.2
		}
		local var_477_1 = manager.audio:GetLocalizationFlag()

		if var_477_0[var_477_1] ~= nil then
			arg_477_1.duration_ = var_477_0[var_477_1]
		end

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play120151119(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1075ui_story"]
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 and arg_477_1.var_.characterEffect1075ui_story == nil then
				arg_477_1.var_.characterEffect1075ui_story = var_480_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_2 = 0.2

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2

				if arg_477_1.var_.characterEffect1075ui_story then
					local var_480_4 = Mathf.Lerp(0, 0.5, var_480_3)

					arg_477_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_477_1.var_.characterEffect1075ui_story.fillRatio = var_480_4
				end
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 and arg_477_1.var_.characterEffect1075ui_story then
				local var_480_5 = 0.5

				arg_477_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_477_1.var_.characterEffect1075ui_story.fillRatio = var_480_5
			end

			local var_480_6 = 0

			if var_480_6 < arg_477_1.time_ and arg_477_1.time_ <= var_480_6 + arg_480_0 then
				arg_477_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_480_7 = 0

			if var_480_7 < arg_477_1.time_ and arg_477_1.time_ <= var_480_7 + arg_480_0 then
				arg_477_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_480_8 = arg_477_1.actors_["1076ui_story"]
			local var_480_9 = 0

			if var_480_9 < arg_477_1.time_ and arg_477_1.time_ <= var_480_9 + arg_480_0 and arg_477_1.var_.characterEffect1076ui_story == nil then
				arg_477_1.var_.characterEffect1076ui_story = var_480_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_10 = 0.2

			if var_480_9 <= arg_477_1.time_ and arg_477_1.time_ < var_480_9 + var_480_10 then
				local var_480_11 = (arg_477_1.time_ - var_480_9) / var_480_10

				if arg_477_1.var_.characterEffect1076ui_story then
					arg_477_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_477_1.time_ >= var_480_9 + var_480_10 and arg_477_1.time_ < var_480_9 + var_480_10 + arg_480_0 and arg_477_1.var_.characterEffect1076ui_story then
				arg_477_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_480_12 = 0
			local var_480_13 = 0.625

			if var_480_12 < arg_477_1.time_ and arg_477_1.time_ <= var_480_12 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_14 = arg_477_1:FormatText(StoryNameCfg[389].name)

				arg_477_1.leftNameTxt_.text = var_480_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_15 = arg_477_1:GetWordFromCfg(120151118)
				local var_480_16 = arg_477_1:FormatText(var_480_15.content)

				arg_477_1.text_.text = var_480_16

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_17 = 25
				local var_480_18 = utf8.len(var_480_16)
				local var_480_19 = var_480_17 <= 0 and var_480_13 or var_480_13 * (var_480_18 / var_480_17)

				if var_480_19 > 0 and var_480_13 < var_480_19 then
					arg_477_1.talkMaxDuration = var_480_19

					if var_480_19 + var_480_12 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_19 + var_480_12
					end
				end

				arg_477_1.text_.text = var_480_16
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151118", "story_v_out_120151.awb") ~= 0 then
					local var_480_20 = manager.audio:GetVoiceLength("story_v_out_120151", "120151118", "story_v_out_120151.awb") / 1000

					if var_480_20 + var_480_12 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_20 + var_480_12
					end

					if var_480_15.prefab_name ~= "" and arg_477_1.actors_[var_480_15.prefab_name] ~= nil then
						local var_480_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_15.prefab_name].transform, "story_v_out_120151", "120151118", "story_v_out_120151.awb")

						arg_477_1:RecordAudio("120151118", var_480_21)
						arg_477_1:RecordAudio("120151118", var_480_21)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_120151", "120151118", "story_v_out_120151.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_120151", "120151118", "story_v_out_120151.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_22 = math.max(var_480_13, arg_477_1.talkMaxDuration)

			if var_480_12 <= arg_477_1.time_ and arg_477_1.time_ < var_480_12 + var_480_22 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_12) / var_480_22

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_12 + var_480_22 and arg_477_1.time_ < var_480_12 + var_480_22 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play120151119 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 120151119
		arg_481_1.duration_ = 4.166

		local var_481_0 = {
			zh = 4.166,
			ja = 2.566
		}
		local var_481_1 = manager.audio:GetLocalizationFlag()

		if var_481_0[var_481_1] ~= nil then
			arg_481_1.duration_ = var_481_0[var_481_1]
		end

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play120151120(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1076ui_story"]
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 and arg_481_1.var_.characterEffect1076ui_story == nil then
				arg_481_1.var_.characterEffect1076ui_story = var_484_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_2 = 0.2

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2

				if arg_481_1.var_.characterEffect1076ui_story then
					local var_484_4 = Mathf.Lerp(0, 0.5, var_484_3)

					arg_481_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_481_1.var_.characterEffect1076ui_story.fillRatio = var_484_4
				end
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 and arg_481_1.var_.characterEffect1076ui_story then
				local var_484_5 = 0.5

				arg_481_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_481_1.var_.characterEffect1076ui_story.fillRatio = var_484_5
			end

			local var_484_6 = arg_481_1.actors_["1075ui_story"]
			local var_484_7 = 0

			if var_484_7 < arg_481_1.time_ and arg_481_1.time_ <= var_484_7 + arg_484_0 and arg_481_1.var_.characterEffect1075ui_story == nil then
				arg_481_1.var_.characterEffect1075ui_story = var_484_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_8 = 0.2

			if var_484_7 <= arg_481_1.time_ and arg_481_1.time_ < var_484_7 + var_484_8 then
				local var_484_9 = (arg_481_1.time_ - var_484_7) / var_484_8

				if arg_481_1.var_.characterEffect1075ui_story then
					arg_481_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_481_1.time_ >= var_484_7 + var_484_8 and arg_481_1.time_ < var_484_7 + var_484_8 + arg_484_0 and arg_481_1.var_.characterEffect1075ui_story then
				arg_481_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_484_10 = 0

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 then
				arg_481_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_484_11 = 0

			if var_484_11 < arg_481_1.time_ and arg_481_1.time_ <= var_484_11 + arg_484_0 then
				arg_481_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_484_12 = 0
			local var_484_13 = 0.2

			if var_484_12 < arg_481_1.time_ and arg_481_1.time_ <= var_484_12 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_14 = arg_481_1:FormatText(StoryNameCfg[381].name)

				arg_481_1.leftNameTxt_.text = var_484_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_15 = arg_481_1:GetWordFromCfg(120151119)
				local var_484_16 = arg_481_1:FormatText(var_484_15.content)

				arg_481_1.text_.text = var_484_16

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_17 = 8
				local var_484_18 = utf8.len(var_484_16)
				local var_484_19 = var_484_17 <= 0 and var_484_13 or var_484_13 * (var_484_18 / var_484_17)

				if var_484_19 > 0 and var_484_13 < var_484_19 then
					arg_481_1.talkMaxDuration = var_484_19

					if var_484_19 + var_484_12 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_19 + var_484_12
					end
				end

				arg_481_1.text_.text = var_484_16
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151119", "story_v_out_120151.awb") ~= 0 then
					local var_484_20 = manager.audio:GetVoiceLength("story_v_out_120151", "120151119", "story_v_out_120151.awb") / 1000

					if var_484_20 + var_484_12 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_20 + var_484_12
					end

					if var_484_15.prefab_name ~= "" and arg_481_1.actors_[var_484_15.prefab_name] ~= nil then
						local var_484_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_15.prefab_name].transform, "story_v_out_120151", "120151119", "story_v_out_120151.awb")

						arg_481_1:RecordAudio("120151119", var_484_21)
						arg_481_1:RecordAudio("120151119", var_484_21)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_120151", "120151119", "story_v_out_120151.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_120151", "120151119", "story_v_out_120151.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_22 = math.max(var_484_13, arg_481_1.talkMaxDuration)

			if var_484_12 <= arg_481_1.time_ and arg_481_1.time_ < var_484_12 + var_484_22 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_12) / var_484_22

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_12 + var_484_22 and arg_481_1.time_ < var_484_12 + var_484_22 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play120151120 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 120151120
		arg_485_1.duration_ = 6.1

		local var_485_0 = {
			zh = 4.166,
			ja = 6.1
		}
		local var_485_1 = manager.audio:GetLocalizationFlag()

		if var_485_0[var_485_1] ~= nil then
			arg_485_1.duration_ = var_485_0[var_485_1]
		end

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play120151121(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_488_1 = arg_485_1.actors_["1075ui_story"]
			local var_488_2 = 0

			if var_488_2 < arg_485_1.time_ and arg_485_1.time_ <= var_488_2 + arg_488_0 and arg_485_1.var_.characterEffect1075ui_story == nil then
				arg_485_1.var_.characterEffect1075ui_story = var_488_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_3 = 0.2

			if var_488_2 <= arg_485_1.time_ and arg_485_1.time_ < var_488_2 + var_488_3 then
				local var_488_4 = (arg_485_1.time_ - var_488_2) / var_488_3

				if arg_485_1.var_.characterEffect1075ui_story then
					local var_488_5 = Mathf.Lerp(0, 0.5, var_488_4)

					arg_485_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_485_1.var_.characterEffect1075ui_story.fillRatio = var_488_5
				end
			end

			if arg_485_1.time_ >= var_488_2 + var_488_3 and arg_485_1.time_ < var_488_2 + var_488_3 + arg_488_0 and arg_485_1.var_.characterEffect1075ui_story then
				local var_488_6 = 0.5

				arg_485_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_485_1.var_.characterEffect1075ui_story.fillRatio = var_488_6
			end

			local var_488_7 = arg_485_1.actors_["1076ui_story"]
			local var_488_8 = 0

			if var_488_8 < arg_485_1.time_ and arg_485_1.time_ <= var_488_8 + arg_488_0 and arg_485_1.var_.characterEffect1076ui_story == nil then
				arg_485_1.var_.characterEffect1076ui_story = var_488_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_9 = 0.2

			if var_488_8 <= arg_485_1.time_ and arg_485_1.time_ < var_488_8 + var_488_9 then
				local var_488_10 = (arg_485_1.time_ - var_488_8) / var_488_9

				if arg_485_1.var_.characterEffect1076ui_story then
					arg_485_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_485_1.time_ >= var_488_8 + var_488_9 and arg_485_1.time_ < var_488_8 + var_488_9 + arg_488_0 and arg_485_1.var_.characterEffect1076ui_story then
				arg_485_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_488_11 = 0
			local var_488_12 = 0.4

			if var_488_11 < arg_485_1.time_ and arg_485_1.time_ <= var_488_11 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_13 = arg_485_1:FormatText(StoryNameCfg[389].name)

				arg_485_1.leftNameTxt_.text = var_488_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_14 = arg_485_1:GetWordFromCfg(120151120)
				local var_488_15 = arg_485_1:FormatText(var_488_14.content)

				arg_485_1.text_.text = var_488_15

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_16 = 16
				local var_488_17 = utf8.len(var_488_15)
				local var_488_18 = var_488_16 <= 0 and var_488_12 or var_488_12 * (var_488_17 / var_488_16)

				if var_488_18 > 0 and var_488_12 < var_488_18 then
					arg_485_1.talkMaxDuration = var_488_18

					if var_488_18 + var_488_11 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_18 + var_488_11
					end
				end

				arg_485_1.text_.text = var_488_15
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151120", "story_v_out_120151.awb") ~= 0 then
					local var_488_19 = manager.audio:GetVoiceLength("story_v_out_120151", "120151120", "story_v_out_120151.awb") / 1000

					if var_488_19 + var_488_11 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_19 + var_488_11
					end

					if var_488_14.prefab_name ~= "" and arg_485_1.actors_[var_488_14.prefab_name] ~= nil then
						local var_488_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_14.prefab_name].transform, "story_v_out_120151", "120151120", "story_v_out_120151.awb")

						arg_485_1:RecordAudio("120151120", var_488_20)
						arg_485_1:RecordAudio("120151120", var_488_20)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_120151", "120151120", "story_v_out_120151.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_120151", "120151120", "story_v_out_120151.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_21 = math.max(var_488_12, arg_485_1.talkMaxDuration)

			if var_488_11 <= arg_485_1.time_ and arg_485_1.time_ < var_488_11 + var_488_21 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_11) / var_488_21

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_11 + var_488_21 and arg_485_1.time_ < var_488_11 + var_488_21 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play120151121 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 120151121
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play120151122(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["1076ui_story"].transform
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 then
				arg_489_1.var_.moveOldPos1076ui_story = var_492_0.localPosition
			end

			local var_492_2 = 0.001

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2
				local var_492_4 = Vector3.New(0, 100, 0)

				var_492_0.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos1076ui_story, var_492_4, var_492_3)

				local var_492_5 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_5.x, var_492_5.y, var_492_5.z)

				local var_492_6 = var_492_0.localEulerAngles

				var_492_6.z = 0
				var_492_6.x = 0
				var_492_0.localEulerAngles = var_492_6
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 then
				var_492_0.localPosition = Vector3.New(0, 100, 0)

				local var_492_7 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_7.x, var_492_7.y, var_492_7.z)

				local var_492_8 = var_492_0.localEulerAngles

				var_492_8.z = 0
				var_492_8.x = 0
				var_492_0.localEulerAngles = var_492_8
			end

			local var_492_9 = arg_489_1.actors_["1075ui_story"].transform
			local var_492_10 = 0

			if var_492_10 < arg_489_1.time_ and arg_489_1.time_ <= var_492_10 + arg_492_0 then
				arg_489_1.var_.moveOldPos1075ui_story = var_492_9.localPosition
			end

			local var_492_11 = 0.001

			if var_492_10 <= arg_489_1.time_ and arg_489_1.time_ < var_492_10 + var_492_11 then
				local var_492_12 = (arg_489_1.time_ - var_492_10) / var_492_11
				local var_492_13 = Vector3.New(0, 100, 0)

				var_492_9.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos1075ui_story, var_492_13, var_492_12)

				local var_492_14 = manager.ui.mainCamera.transform.position - var_492_9.position

				var_492_9.forward = Vector3.New(var_492_14.x, var_492_14.y, var_492_14.z)

				local var_492_15 = var_492_9.localEulerAngles

				var_492_15.z = 0
				var_492_15.x = 0
				var_492_9.localEulerAngles = var_492_15
			end

			if arg_489_1.time_ >= var_492_10 + var_492_11 and arg_489_1.time_ < var_492_10 + var_492_11 + arg_492_0 then
				var_492_9.localPosition = Vector3.New(0, 100, 0)

				local var_492_16 = manager.ui.mainCamera.transform.position - var_492_9.position

				var_492_9.forward = Vector3.New(var_492_16.x, var_492_16.y, var_492_16.z)

				local var_492_17 = var_492_9.localEulerAngles

				var_492_17.z = 0
				var_492_17.x = 0
				var_492_9.localEulerAngles = var_492_17
			end

			local var_492_18 = 0
			local var_492_19 = 0.525

			if var_492_18 < arg_489_1.time_ and arg_489_1.time_ <= var_492_18 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, false)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_20 = arg_489_1:GetWordFromCfg(120151121)
				local var_492_21 = arg_489_1:FormatText(var_492_20.content)

				arg_489_1.text_.text = var_492_21

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_22 = 21
				local var_492_23 = utf8.len(var_492_21)
				local var_492_24 = var_492_22 <= 0 and var_492_19 or var_492_19 * (var_492_23 / var_492_22)

				if var_492_24 > 0 and var_492_19 < var_492_24 then
					arg_489_1.talkMaxDuration = var_492_24

					if var_492_24 + var_492_18 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_24 + var_492_18
					end
				end

				arg_489_1.text_.text = var_492_21
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_25 = math.max(var_492_19, arg_489_1.talkMaxDuration)

			if var_492_18 <= arg_489_1.time_ and arg_489_1.time_ < var_492_18 + var_492_25 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_18) / var_492_25

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_18 + var_492_25 and arg_489_1.time_ < var_492_18 + var_492_25 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play120151122 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 120151122
		arg_493_1.duration_ = 6.366

		local var_493_0 = {
			zh = 6.366,
			ja = 5.633
		}
		local var_493_1 = manager.audio:GetLocalizationFlag()

		if var_493_0[var_493_1] ~= nil then
			arg_493_1.duration_ = var_493_0[var_493_1]
		end

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
			arg_493_1.auto_ = false
		end

		function arg_493_1.playNext_(arg_495_0)
			arg_493_1.onStoryFinished_()
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["1076ui_story"].transform
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 then
				arg_493_1.var_.moveOldPos1076ui_story = var_496_0.localPosition
			end

			local var_496_2 = 0.001

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2
				local var_496_4 = Vector3.New(0, -1.06, -6.2)

				var_496_0.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos1076ui_story, var_496_4, var_496_3)

				local var_496_5 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_5.x, var_496_5.y, var_496_5.z)

				local var_496_6 = var_496_0.localEulerAngles

				var_496_6.z = 0
				var_496_6.x = 0
				var_496_0.localEulerAngles = var_496_6
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 then
				var_496_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_496_7 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_7.x, var_496_7.y, var_496_7.z)

				local var_496_8 = var_496_0.localEulerAngles

				var_496_8.z = 0
				var_496_8.x = 0
				var_496_0.localEulerAngles = var_496_8
			end

			local var_496_9 = 0

			if var_496_9 < arg_493_1.time_ and arg_493_1.time_ <= var_496_9 + arg_496_0 then
				arg_493_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_496_10 = 0

			if var_496_10 < arg_493_1.time_ and arg_493_1.time_ <= var_496_10 + arg_496_0 then
				arg_493_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_496_11 = arg_493_1.actors_["1076ui_story"]
			local var_496_12 = 0

			if var_496_12 < arg_493_1.time_ and arg_493_1.time_ <= var_496_12 + arg_496_0 and arg_493_1.var_.characterEffect1076ui_story == nil then
				arg_493_1.var_.characterEffect1076ui_story = var_496_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_13 = 0.2

			if var_496_12 <= arg_493_1.time_ and arg_493_1.time_ < var_496_12 + var_496_13 then
				local var_496_14 = (arg_493_1.time_ - var_496_12) / var_496_13

				if arg_493_1.var_.characterEffect1076ui_story then
					arg_493_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_493_1.time_ >= var_496_12 + var_496_13 and arg_493_1.time_ < var_496_12 + var_496_13 + arg_496_0 and arg_493_1.var_.characterEffect1076ui_story then
				arg_493_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_496_15 = 0
			local var_496_16 = 0.525

			if var_496_15 < arg_493_1.time_ and arg_493_1.time_ <= var_496_15 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_17 = arg_493_1:FormatText(StoryNameCfg[389].name)

				arg_493_1.leftNameTxt_.text = var_496_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_18 = arg_493_1:GetWordFromCfg(120151122)
				local var_496_19 = arg_493_1:FormatText(var_496_18.content)

				arg_493_1.text_.text = var_496_19

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_20 = 21
				local var_496_21 = utf8.len(var_496_19)
				local var_496_22 = var_496_20 <= 0 and var_496_16 or var_496_16 * (var_496_21 / var_496_20)

				if var_496_22 > 0 and var_496_16 < var_496_22 then
					arg_493_1.talkMaxDuration = var_496_22

					if var_496_22 + var_496_15 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_22 + var_496_15
					end
				end

				arg_493_1.text_.text = var_496_19
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120151", "120151122", "story_v_out_120151.awb") ~= 0 then
					local var_496_23 = manager.audio:GetVoiceLength("story_v_out_120151", "120151122", "story_v_out_120151.awb") / 1000

					if var_496_23 + var_496_15 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_23 + var_496_15
					end

					if var_496_18.prefab_name ~= "" and arg_493_1.actors_[var_496_18.prefab_name] ~= nil then
						local var_496_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_18.prefab_name].transform, "story_v_out_120151", "120151122", "story_v_out_120151.awb")

						arg_493_1:RecordAudio("120151122", var_496_24)
						arg_493_1:RecordAudio("120151122", var_496_24)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_out_120151", "120151122", "story_v_out_120151.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_out_120151", "120151122", "story_v_out_120151.awb")
				end

				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_25 = math.max(var_496_16, arg_493_1.talkMaxDuration)

			if var_496_15 <= arg_493_1.time_ and arg_493_1.time_ < var_496_15 + var_496_25 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_15) / var_496_25

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_15 + var_496_25 and arg_493_1.time_ < var_496_15 + var_496_25 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J13f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST46",
		"Assets/UIResources/UI_AB/TextureConfig/Background/J04f"
	},
	voices = {
		"story_v_out_120151.awb"
	}
}
