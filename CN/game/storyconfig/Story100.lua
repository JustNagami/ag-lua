return {
	Play100 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 100
		arg_1_1.duration_ = 11.17

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
			local var_4_0 = 0
			local var_4_1 = 6
			local var_4_2 = "D10_1"

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.timestampController_:SetSelectedState("show")

				arg_1_1.timeTicketbgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_2)

				arg_1_1.timestampColorController_:SetSelectedState("cold")

				local var_4_3 = arg_1_1:GetWordFromCfg(419011)
				local var_4_4 = arg_1_1:FormatText(var_4_3.content)

				arg_1_1.text_timeText_.text = var_4_4

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_timeText_)

				local var_4_5 = arg_1_1:GetWordFromCfg(419094)
				local var_4_6 = arg_1_1:FormatText(var_4_5.content)

				arg_1_1.text_siteText_.text = var_4_6

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_siteText_)
			end

			if arg_1_1.time_ >= var_4_0 + var_4_1 and arg_1_1.time_ < var_4_0 + var_4_1 + arg_4_0 then
				arg_1_1.timestampController_:SetSelectedState("hide")
			end

			local var_4_7 = "ST03"

			if arg_1_1.bgs_[var_4_7] == nil then
				local var_4_8 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_8:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_7)
				var_4_8.name = var_4_7
				var_4_8.transform.parent = arg_1_1.stage_.transform
				var_4_8.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_7] = var_4_8
			end

			local var_4_9 = 0

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 then
				local var_4_10 = manager.ui.mainCamera.transform.localPosition
				local var_4_11 = Vector3.New(0, 0, 10) + Vector3.New(var_4_10.x, var_4_10.y, 0)
				local var_4_12 = arg_1_1.bgs_.ST03

				var_4_12.transform.localPosition = var_4_11
				var_4_12.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_13 = var_4_12:GetComponent("SpriteRenderer")

				if var_4_13 and var_4_13.sprite then
					local var_4_14 = (var_4_12.transform.localPosition - var_4_10).z
					local var_4_15 = manager.ui.mainCameraCom_
					local var_4_16 = 2 * var_4_14 * Mathf.Tan(var_4_15.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_17 = var_4_16 * var_4_15.aspect
					local var_4_18 = var_4_13.sprite.bounds.size.x
					local var_4_19 = var_4_13.sprite.bounds.size.y
					local var_4_20 = var_4_17 / var_4_18
					local var_4_21 = var_4_16 / var_4_19
					local var_4_22 = var_4_21 < var_4_20 and var_4_20 or var_4_21

					var_4_12.transform.localScale = Vector3.New(var_4_22, var_4_22, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "ST03" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_23 = 5.56666666666667

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_24 = 1.46666666666667

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_24 then
				local var_4_25 = (arg_1_1.time_ - var_4_23) / var_4_24
				local var_4_26 = Color.New(0, 0, 0)

				var_4_26.a = Mathf.Lerp(0, 1, var_4_25)
				arg_1_1.mask_.color = var_4_26
			end

			if arg_1_1.time_ >= var_4_23 + var_4_24 and arg_1_1.time_ < var_4_23 + var_4_24 + arg_4_0 then
				local var_4_27 = Color.New(0, 0, 0)

				var_4_27.a = 1
				arg_1_1.mask_.color = var_4_27
			end

			local var_4_28 = 7.03333333333333

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_29 = 1.36666666666667

			if var_4_28 <= arg_1_1.time_ and arg_1_1.time_ < var_4_28 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_28) / var_4_29
				local var_4_31 = Color.New(0, 0, 0)

				var_4_31.a = Mathf.Lerp(1, 0, var_4_30)
				arg_1_1.mask_.color = var_4_31
			end

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				local var_4_32 = Color.New(0, 0, 0)
				local var_4_33 = 0

				arg_1_1.mask_.enabled = false
				var_4_32.a = var_4_33
				arg_1_1.mask_.color = var_4_32
			end
		end
	end,
	Play101 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 101
		arg_5_1.duration_ = 11.27

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play102(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = "1148ui_story"

			if arg_5_1.actors_[var_8_0] == nil then
				local var_8_1 = Asset.Load("Char/" .. "1148ui_story")

				if not isNil(var_8_1) then
					local var_8_2 = Object.Instantiate(Asset.Load("Char/" .. "1148ui_story"), arg_5_1.stage_.transform)

					var_8_2.name = var_8_0
					var_8_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_5_1.actors_[var_8_0] = var_8_2

					local var_8_3 = var_8_2:GetComponentInChildren(typeof(CharacterEffect))

					var_8_3.enabled = true

					local var_8_4 = GameObjectTools.GetOrAddComponent(var_8_2, typeof(DynamicBoneHelper))

					if var_8_4 then
						var_8_4:EnableDynamicBone(false)
					end

					arg_5_1:ShowWeapon(var_8_3.transform, false)

					arg_5_1.var_[var_8_0 .. "Animator"] = var_8_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_5_1.var_[var_8_0 .. "Animator"].applyRootMotion = true
					arg_5_1.var_[var_8_0 .. "LipSync"] = var_8_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_8_5 = arg_5_1.actors_["1148ui_story"]
			local var_8_6 = 0

			if var_8_6 < arg_5_1.time_ and arg_5_1.time_ <= var_8_6 + arg_8_0 and not isNil(var_8_5) and arg_5_1.var_.characterEffect1148ui_story == nil then
				arg_5_1.var_.characterEffect1148ui_story = var_8_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_7 = 0.1

			if var_8_6 <= arg_5_1.time_ and arg_5_1.time_ < var_8_6 + var_8_7 and not isNil(var_8_5) then
				local var_8_8 = (arg_5_1.time_ - var_8_6) / var_8_7

				if arg_5_1.var_.characterEffect1148ui_story and not isNil(var_8_5) then
					arg_5_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_5_1.time_ >= var_8_6 + var_8_7 and arg_5_1.time_ < var_8_6 + var_8_7 + arg_8_0 and not isNil(var_8_5) and arg_5_1.var_.characterEffect1148ui_story then
				arg_5_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_8_9 = "1084ui_story"

			if arg_5_1.actors_[var_8_9] == nil then
				local var_8_10 = Asset.Load("Char/" .. "1084ui_story")

				if not isNil(var_8_10) then
					local var_8_11 = Object.Instantiate(Asset.Load("Char/" .. "1084ui_story"), arg_5_1.stage_.transform)

					var_8_11.name = var_8_9
					var_8_11.transform.localPosition = Vector3.New(0, 100, 0)
					arg_5_1.actors_[var_8_9] = var_8_11

					local var_8_12 = var_8_11:GetComponentInChildren(typeof(CharacterEffect))

					var_8_12.enabled = true

					local var_8_13 = GameObjectTools.GetOrAddComponent(var_8_11, typeof(DynamicBoneHelper))

					if var_8_13 then
						var_8_13:EnableDynamicBone(false)
					end

					arg_5_1:ShowWeapon(var_8_12.transform, false)

					arg_5_1.var_[var_8_9 .. "Animator"] = var_8_12.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_5_1.var_[var_8_9 .. "Animator"].applyRootMotion = true
					arg_5_1.var_[var_8_9 .. "LipSync"] = var_8_12.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_8_14 = arg_5_1.actors_["1084ui_story"]
			local var_8_15 = 0

			if var_8_15 < arg_5_1.time_ and arg_5_1.time_ <= var_8_15 + arg_8_0 and not isNil(var_8_14) and arg_5_1.var_.characterEffect1084ui_story == nil then
				arg_5_1.var_.characterEffect1084ui_story = var_8_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_16 = 0.1

			if var_8_15 <= arg_5_1.time_ and arg_5_1.time_ < var_8_15 + var_8_16 and not isNil(var_8_14) then
				local var_8_17 = (arg_5_1.time_ - var_8_15) / var_8_16

				if arg_5_1.var_.characterEffect1084ui_story and not isNil(var_8_14) then
					arg_5_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_5_1.time_ >= var_8_15 + var_8_16 and arg_5_1.time_ < var_8_15 + var_8_16 + arg_8_0 and not isNil(var_8_14) and arg_5_1.var_.characterEffect1084ui_story then
				arg_5_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_8_18 = 0

			if var_8_18 < arg_5_1.time_ and arg_5_1.time_ <= var_8_18 + arg_8_0 then
				arg_5_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4139")
			end

			local var_8_19 = manager.ui.mainCamera.transform
			local var_8_20 = 0

			if var_8_20 < arg_5_1.time_ and arg_5_1.time_ <= var_8_20 + arg_8_0 then
				local var_8_21 = arg_5_1.var_.effectMainCamera1048镜头前特效

				if not var_8_21 then
					var_8_21 = Object.Instantiate(Asset.Load("Effect/Hero/1048/fx_1048_ui_001"))
					var_8_21.name = "1048镜头前特效"
					arg_5_1.var_.effectMainCamera1048镜头前特效 = var_8_21
				end

				local var_8_22 = var_8_19:Find("")

				if var_8_22 then
					var_8_21.transform.parent = var_8_22
				else
					var_8_21.transform.parent = var_8_19
				end

				var_8_21.transform.localPosition = Vector3.New(0, 0, 0)
				var_8_21.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_8_23 = "10101ui_story"

			if arg_5_1.actors_[var_8_23] == nil then
				local var_8_24 = Asset.Load("Char/" .. "10101ui_story")

				if not isNil(var_8_24) then
					local var_8_25 = Object.Instantiate(Asset.Load("Char/" .. "10101ui_story"), arg_5_1.stage_.transform)

					var_8_25.name = var_8_23
					var_8_25.transform.localPosition = Vector3.New(0, 100, 0)
					arg_5_1.actors_[var_8_23] = var_8_25

					local var_8_26 = var_8_25:GetComponentInChildren(typeof(CharacterEffect))

					var_8_26.enabled = true

					local var_8_27 = GameObjectTools.GetOrAddComponent(var_8_25, typeof(DynamicBoneHelper))

					if var_8_27 then
						var_8_27:EnableDynamicBone(false)
					end

					arg_5_1:ShowWeapon(var_8_26.transform, false)

					arg_5_1.var_[var_8_23 .. "Animator"] = var_8_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_5_1.var_[var_8_23 .. "Animator"].applyRootMotion = true
					arg_5_1.var_[var_8_23 .. "LipSync"] = var_8_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_8_28 = 0

			if var_8_28 < arg_5_1.time_ and arg_5_1.time_ <= var_8_28 + arg_8_0 then
				arg_5_1:PlayTimeline("10101ui_story", "StoryTimeline/CharAction/public_expression/expr_wuganC", "EmotionTimelineAnimator")
			end

			local var_8_29 = 6.26666666666667
			local var_8_30 = 5
			local var_8_31 = "A00000"

			if var_8_29 < arg_5_1.time_ and arg_5_1.time_ <= var_8_29 + arg_8_0 then
				arg_5_1.timestampController_:SetSelectedState("show")
				arg_5_1.timestampAni_:Play("in")

				arg_5_1.timeTicketbgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_8_31)

				arg_5_1.timestampColorController_:SetSelectedState("cold")

				local var_8_32 = arg_5_1:GetWordFromCfg(100011012)
				local var_8_33 = arg_5_1:FormatText(var_8_32.content)

				arg_5_1.text_timeText_.text = var_8_33

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_timeText_)

				local var_8_34 = arg_5_1:GetWordFromCfg(101)
				local var_8_35 = arg_5_1:FormatText(var_8_34.content)

				arg_5_1.text_siteText_.text = var_8_35

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_siteText_)
			end

			if arg_5_1.time_ >= var_8_29 + var_8_30 and arg_5_1.time_ < var_8_29 + var_8_30 + arg_8_0 then
				AnimatorTools.PlayAnimationWithCallback(arg_5_1.timestampAni_, "out", function()
					arg_5_1.timestampController_:SetSelectedState("hide")
				end)
			end

			local var_8_36 = manager.ui.mainCamera.transform
			local var_8_37 = 0

			if var_8_37 < arg_5_1.time_ and arg_5_1.time_ <= var_8_37 + arg_8_0 then
				local var_8_38 = arg_5_1.var_.effectxueye3

				if not var_8_38 then
					var_8_38 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_blood_in_1"))
					var_8_38.name = "xueye3"
					arg_5_1.var_.effectxueye3 = var_8_38
				end

				local var_8_39 = var_8_36:Find("")

				if var_8_39 then
					var_8_38.transform.parent = var_8_39
				else
					var_8_38.transform.parent = var_8_36
				end

				var_8_38.transform.localPosition = Vector3.New(0, 0, 0)
				var_8_38.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_8_40 = manager.ui.mainCamera.transform
			local var_8_41 = 0

			if var_8_41 < arg_5_1.time_ and arg_5_1.time_ <= var_8_41 + arg_8_0 then
				local var_8_42 = arg_5_1.var_.effectxueye4

				if not var_8_42 then
					var_8_42 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_blood_in_ui_1"))
					var_8_42.name = "xueye4"
					arg_5_1.var_.effectxueye4 = var_8_42
				end

				local var_8_43 = var_8_40:Find("")

				if var_8_43 then
					var_8_42.transform.parent = var_8_43
				else
					var_8_42.transform.parent = var_8_40
				end

				var_8_42.transform.localPosition = Vector3.New(0, 0, 0)
				var_8_42.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_8_44 = manager.ui.mainCameraCom_
				local var_8_45 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_8_44.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_8_46 = var_8_42.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_8_47 = 15
				local var_8_48 = 2 * var_8_47 * Mathf.Tan(var_8_44.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_8_44.aspect
				local var_8_49 = 1
				local var_8_50 = 1.7777777777777777

				if var_8_50 < var_8_44.aspect then
					var_8_49 = var_8_48 / (2 * var_8_47 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_8_50)
				end

				for iter_8_0, iter_8_1 in ipairs(var_8_46) do
					local var_8_51 = iter_8_1.transform.localScale

					iter_8_1.transform.localScale = Vector3.New(var_8_51.x / var_8_45 * var_8_49, var_8_51.y / var_8_45, var_8_51.z)
				end
			end

			local var_8_52 = manager.ui.mainCamera.transform
			local var_8_53 = 0

			if var_8_53 < arg_5_1.time_ and arg_5_1.time_ <= var_8_53 + arg_8_0 then
				local var_8_54 = arg_5_1.var_.effectxueye1

				if var_8_54 then
					Object.Destroy(var_8_54)

					arg_5_1.var_.effectxueye1 = nil
				end
			end

			local var_8_55 = manager.ui.mainCamera.transform
			local var_8_56 = 0

			if var_8_56 < arg_5_1.time_ and arg_5_1.time_ <= var_8_56 + arg_8_0 then
				local var_8_57 = arg_5_1.var_.effectxueye2

				if var_8_57 then
					Object.Destroy(var_8_57)

					arg_5_1.var_.effectxueye2 = nil
				end
			end

			local var_8_58 = 0
			local var_8_59 = 0.1

			if var_8_58 < arg_5_1.time_ and arg_5_1.time_ <= var_8_58 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0

				arg_5_1.dialog_:SetActive(true)

				local var_8_60 = LeanTween.value(arg_5_1.dialog_, 0, 1, 0.3)

				var_8_60:setOnUpdate(LuaHelper.FloatAction(function(arg_10_0)
					arg_5_1.dialogCg_.alpha = arg_10_0
				end))
				var_8_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_5_1.dialog_)
					var_8_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_5_1.duration_ = arg_5_1.duration_ + 0.3

				SetActive(arg_5_1.leftNameGo_, false)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_61 = arg_5_1:GetWordFromCfg(100)
				local var_8_62 = arg_5_1:FormatText(var_8_61.content)

				arg_5_1.text_.text = var_8_62

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_63 = 4
				local var_8_64 = utf8.len(var_8_62)
				local var_8_65 = var_8_63 <= 0 and var_8_59 or var_8_59 * (var_8_64 / var_8_63)

				if var_8_65 > 0 and var_8_59 < var_8_65 then
					arg_5_1.talkMaxDuration = var_8_65
					var_8_58 = var_8_58 + 0.3

					if var_8_65 + var_8_58 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_65 + var_8_58
					end
				end

				arg_5_1.text_.text = var_8_62
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)
				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_66 = var_8_58 + 0.3
			local var_8_67 = math.max(var_8_59, arg_5_1.talkMaxDuration)

			if var_8_66 <= arg_5_1.time_ and arg_5_1.time_ < var_8_66 + var_8_67 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_66) / var_8_67

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_66 + var_8_67 and arg_5_1.time_ < var_8_66 + var_8_67 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play102 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 102
		arg_12_1.duration_ = 2

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play103(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = arg_12_1.actors_["1148ui_story"]
			local var_15_1 = 0

			if var_15_1 < arg_12_1.time_ and arg_12_1.time_ <= var_15_1 + arg_15_0 and not isNil(var_15_0) and arg_12_1.var_.characterEffect1148ui_story == nil then
				arg_12_1.var_.characterEffect1148ui_story = var_15_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_2 = 0.1

			if var_15_1 <= arg_12_1.time_ and arg_12_1.time_ < var_15_1 + var_15_2 and not isNil(var_15_0) then
				local var_15_3 = (arg_12_1.time_ - var_15_1) / var_15_2

				if arg_12_1.var_.characterEffect1148ui_story and not isNil(var_15_0) then
					arg_12_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_12_1.time_ >= var_15_1 + var_15_2 and arg_12_1.time_ < var_15_1 + var_15_2 + arg_15_0 and not isNil(var_15_0) and arg_12_1.var_.characterEffect1148ui_story then
				arg_12_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_15_4 = arg_12_1.actors_["1084ui_story"]
			local var_15_5 = 0

			if var_15_5 < arg_12_1.time_ and arg_12_1.time_ <= var_15_5 + arg_15_0 and not isNil(var_15_4) and arg_12_1.var_.characterEffect1084ui_story == nil then
				arg_12_1.var_.characterEffect1084ui_story = var_15_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_6 = 0.1

			if var_15_5 <= arg_12_1.time_ and arg_12_1.time_ < var_15_5 + var_15_6 and not isNil(var_15_4) then
				local var_15_7 = (arg_12_1.time_ - var_15_5) / var_15_6

				if arg_12_1.var_.characterEffect1084ui_story and not isNil(var_15_4) then
					arg_12_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_12_1.time_ >= var_15_5 + var_15_6 and arg_12_1.time_ < var_15_5 + var_15_6 + arg_15_0 and not isNil(var_15_4) and arg_12_1.var_.characterEffect1084ui_story then
				arg_12_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_15_8 = 0

			if var_15_8 < arg_12_1.time_ and arg_12_1.time_ <= var_15_8 + arg_15_0 then
				local var_15_9 = manager.ui.mainCamera.transform.localPosition
				local var_15_10 = Vector3.New(0, 0, 10) + Vector3.New(var_15_9.x, var_15_9.y, 0)
				local var_15_11 = arg_12_1.bgs_.ST03

				var_15_11.transform.localPosition = var_15_10
				var_15_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_15_12 = var_15_11:GetComponent("SpriteRenderer")

				if var_15_12 and var_15_12.sprite then
					local var_15_13 = (var_15_11.transform.localPosition - var_15_9).z
					local var_15_14 = manager.ui.mainCameraCom_
					local var_15_15 = 2 * var_15_13 * Mathf.Tan(var_15_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_15_16 = var_15_15 * var_15_14.aspect
					local var_15_17 = var_15_12.sprite.bounds.size.x
					local var_15_18 = var_15_12.sprite.bounds.size.y
					local var_15_19 = var_15_16 / var_15_17
					local var_15_20 = var_15_15 / var_15_18
					local var_15_21 = var_15_20 < var_15_19 and var_15_19 or var_15_20

					var_15_11.transform.localScale = Vector3.New(var_15_21, var_15_21, 0)
				end

				for iter_15_0, iter_15_1 in pairs(arg_12_1.bgs_) do
					if iter_15_0 ~= "ST03" then
						iter_15_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_15_22 = 0

			if var_15_22 < arg_12_1.time_ and arg_12_1.time_ <= var_15_22 + arg_15_0 then
				arg_12_1.mask_.enabled = true
				arg_12_1.mask_.raycastTarget = false

				arg_12_1:SetGaussion(false)
			end

			local var_15_23 = 0.5

			if var_15_22 <= arg_12_1.time_ and arg_12_1.time_ < var_15_22 + var_15_23 then
				local var_15_24 = (arg_12_1.time_ - var_15_22) / var_15_23
				local var_15_25 = Color.New(1, 1, 1)

				var_15_25.a = Mathf.Lerp(0, 1, var_15_24)
				arg_12_1.mask_.color = var_15_25
			end

			if arg_12_1.time_ >= var_15_22 + var_15_23 and arg_12_1.time_ < var_15_22 + var_15_23 + arg_15_0 then
				local var_15_26 = Color.New(1, 1, 1)

				var_15_26.a = 1
				arg_12_1.mask_.color = var_15_26
			end

			local var_15_27 = 0.5

			if var_15_27 < arg_12_1.time_ and arg_12_1.time_ <= var_15_27 + arg_15_0 then
				arg_12_1.mask_.enabled = true
				arg_12_1.mask_.raycastTarget = false

				arg_12_1:SetGaussion(false)
			end

			local var_15_28 = 0.5

			if var_15_27 <= arg_12_1.time_ and arg_12_1.time_ < var_15_27 + var_15_28 then
				local var_15_29 = (arg_12_1.time_ - var_15_27) / var_15_28
				local var_15_30 = Color.New(1, 1, 1)

				var_15_30.a = Mathf.Lerp(1, 0, var_15_29)
				arg_12_1.mask_.color = var_15_30
			end

			if arg_12_1.time_ >= var_15_27 + var_15_28 and arg_12_1.time_ < var_15_27 + var_15_28 + arg_15_0 then
				local var_15_31 = Color.New(1, 1, 1)
				local var_15_32 = 0

				arg_12_1.mask_.enabled = false
				var_15_31.a = var_15_32
				arg_12_1.mask_.color = var_15_31
			end

			local var_15_33 = manager.ui.mainCamera.transform
			local var_15_34 = 0

			if var_15_34 < arg_12_1.time_ and arg_12_1.time_ <= var_15_34 + arg_15_0 then
				local var_15_35 = arg_12_1.var_.effectxiayu1

				if not var_15_35 then
					var_15_35 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavy"))
					var_15_35.name = "xiayu1"
					arg_12_1.var_.effectxiayu1 = var_15_35
				end

				local var_15_36 = var_15_33:Find("")

				if var_15_36 then
					var_15_35.transform.parent = var_15_36
				else
					var_15_35.transform.parent = var_15_33
				end

				var_15_35.transform.localPosition = Vector3.New(0, 0, 0)
				var_15_35.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_15_37 = manager.ui.mainCamera.transform
			local var_15_38 = 0

			if var_15_38 < arg_12_1.time_ and arg_12_1.time_ <= var_15_38 + arg_15_0 then
				local var_15_39 = arg_12_1.var_.effectxiayu2

				if not var_15_39 then
					var_15_39 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavy_ui"))
					var_15_39.name = "xiayu2"
					arg_12_1.var_.effectxiayu2 = var_15_39
				end

				local var_15_40 = var_15_37:Find("")

				if var_15_40 then
					var_15_39.transform.parent = var_15_40
				else
					var_15_39.transform.parent = var_15_37
				end

				var_15_39.transform.localPosition = Vector3.New(0, 0, 0)
				var_15_39.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_15_41 = manager.ui.mainCameraCom_
				local var_15_42 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_15_41.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_15_43 = var_15_39.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_15_44 = 15
				local var_15_45 = 2 * var_15_44 * Mathf.Tan(var_15_41.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_15_41.aspect
				local var_15_46 = 1
				local var_15_47 = 1.7777777777777777

				if var_15_47 < var_15_41.aspect then
					var_15_46 = var_15_45 / (2 * var_15_44 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_15_47)
				end

				for iter_15_2, iter_15_3 in ipairs(var_15_43) do
					local var_15_48 = iter_15_3.transform.localScale

					iter_15_3.transform.localScale = Vector3.New(var_15_48.x / var_15_42 * var_15_46, var_15_48.y / var_15_42, var_15_48.z)
				end
			end

			local var_15_49 = 0
			local var_15_50 = 0.1

			if var_15_49 < arg_12_1.time_ and arg_12_1.time_ <= var_15_49 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0

				arg_12_1.dialog_:SetActive(true)

				local var_15_51 = LeanTween.value(arg_12_1.dialog_, 0, 1, 0.3)

				var_15_51:setOnUpdate(LuaHelper.FloatAction(function(arg_16_0)
					arg_12_1.dialogCg_.alpha = arg_16_0
				end))
				var_15_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_12_1.dialog_)
					var_15_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_12_1.duration_ = arg_12_1.duration_ + 0.3

				SetActive(arg_12_1.leftNameGo_, false)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_52 = arg_12_1:GetWordFromCfg(100)
				local var_15_53 = arg_12_1:FormatText(var_15_52.content)

				arg_12_1.text_.text = var_15_53

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_54 = 4
				local var_15_55 = utf8.len(var_15_53)
				local var_15_56 = var_15_54 <= 0 and var_15_50 or var_15_50 * (var_15_55 / var_15_54)

				if var_15_56 > 0 and var_15_50 < var_15_56 then
					arg_12_1.talkMaxDuration = var_15_56
					var_15_49 = var_15_49 + 0.3

					if var_15_56 + var_15_49 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_56 + var_15_49
					end
				end

				arg_12_1.text_.text = var_15_53
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)
				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_57 = var_15_49 + 0.3
			local var_15_58 = math.max(var_15_50, arg_12_1.talkMaxDuration)

			if var_15_57 <= arg_12_1.time_ and arg_12_1.time_ < var_15_57 + var_15_58 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_57) / var_15_58

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_57 + var_15_58 and arg_12_1.time_ < var_15_57 + var_15_58 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play103 = function(arg_18_0, arg_18_1)
		arg_18_1.time_ = 0
		arg_18_1.frameCnt_ = 0
		arg_18_1.state_ = "playing"
		arg_18_1.curTalkId_ = 103
		arg_18_1.duration_ = 2

		SetActive(arg_18_1.tipsGo_, false)

		function arg_18_1.onSingleLineFinish_()
			arg_18_1.onSingleLineUpdate_ = nil
			arg_18_1.onSingleLineFinish_ = nil
			arg_18_1.state_ = "waiting"
		end

		function arg_18_1.playNext_(arg_20_0)
			if arg_20_0 == 1 then
				arg_18_0:Play104(arg_18_1)
			end
		end

		function arg_18_1.onSingleLineUpdate_(arg_21_0)
			local var_21_0 = arg_18_1.actors_["1148ui_story"]
			local var_21_1 = 0

			if var_21_1 < arg_18_1.time_ and arg_18_1.time_ <= var_21_1 + arg_21_0 and not isNil(var_21_0) and arg_18_1.var_.characterEffect1148ui_story == nil then
				arg_18_1.var_.characterEffect1148ui_story = var_21_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_21_2 = 0.1

			if var_21_1 <= arg_18_1.time_ and arg_18_1.time_ < var_21_1 + var_21_2 and not isNil(var_21_0) then
				local var_21_3 = (arg_18_1.time_ - var_21_1) / var_21_2

				if arg_18_1.var_.characterEffect1148ui_story and not isNil(var_21_0) then
					arg_18_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_18_1.time_ >= var_21_1 + var_21_2 and arg_18_1.time_ < var_21_1 + var_21_2 + arg_21_0 and not isNil(var_21_0) and arg_18_1.var_.characterEffect1148ui_story then
				arg_18_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_21_4 = arg_18_1.actors_["1084ui_story"]
			local var_21_5 = 0

			if var_21_5 < arg_18_1.time_ and arg_18_1.time_ <= var_21_5 + arg_21_0 and not isNil(var_21_4) and arg_18_1.var_.characterEffect1084ui_story == nil then
				arg_18_1.var_.characterEffect1084ui_story = var_21_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_21_6 = 0.1

			if var_21_5 <= arg_18_1.time_ and arg_18_1.time_ < var_21_5 + var_21_6 and not isNil(var_21_4) then
				local var_21_7 = (arg_18_1.time_ - var_21_5) / var_21_6

				if arg_18_1.var_.characterEffect1084ui_story and not isNil(var_21_4) then
					arg_18_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_18_1.time_ >= var_21_5 + var_21_6 and arg_18_1.time_ < var_21_5 + var_21_6 + arg_21_0 and not isNil(var_21_4) and arg_18_1.var_.characterEffect1084ui_story then
				arg_18_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_21_8 = "ST03a"

			if arg_18_1.bgs_[var_21_8] == nil then
				local var_21_9 = Object.Instantiate(arg_18_1.paintGo_)

				var_21_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_21_8)
				var_21_9.name = var_21_8
				var_21_9.transform.parent = arg_18_1.stage_.transform
				var_21_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_18_1.bgs_[var_21_8] = var_21_9
			end

			local var_21_10 = 0

			if var_21_10 < arg_18_1.time_ and arg_18_1.time_ <= var_21_10 + arg_21_0 then
				local var_21_11 = manager.ui.mainCamera.transform.localPosition
				local var_21_12 = Vector3.New(0, 0, 10) + Vector3.New(var_21_11.x, var_21_11.y, 0)
				local var_21_13 = arg_18_1.bgs_.ST03a

				var_21_13.transform.localPosition = var_21_12
				var_21_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_21_14 = var_21_13:GetComponent("SpriteRenderer")

				if var_21_14 and var_21_14.sprite then
					local var_21_15 = (var_21_13.transform.localPosition - var_21_11).z
					local var_21_16 = manager.ui.mainCameraCom_
					local var_21_17 = 2 * var_21_15 * Mathf.Tan(var_21_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_21_18 = var_21_17 * var_21_16.aspect
					local var_21_19 = var_21_14.sprite.bounds.size.x
					local var_21_20 = var_21_14.sprite.bounds.size.y
					local var_21_21 = var_21_18 / var_21_19
					local var_21_22 = var_21_17 / var_21_20
					local var_21_23 = var_21_22 < var_21_21 and var_21_21 or var_21_22

					var_21_13.transform.localScale = Vector3.New(var_21_23, var_21_23, 0)
				end

				for iter_21_0, iter_21_1 in pairs(arg_18_1.bgs_) do
					if iter_21_0 ~= "ST03a" then
						iter_21_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_21_24 = arg_18_1.bgs_.ST03.transform
			local var_21_25 = 0

			if var_21_25 < arg_18_1.time_ and arg_18_1.time_ <= var_21_25 + arg_21_0 then
				arg_18_1.var_.moveOldPosST03 = var_21_24.localPosition
			end

			local var_21_26 = 0.001

			if var_21_25 <= arg_18_1.time_ and arg_18_1.time_ < var_21_25 + var_21_26 then
				local var_21_27 = (arg_18_1.time_ - var_21_25) / var_21_26
				local var_21_28 = Vector3.New(0, -100, 10)

				var_21_24.localPosition = Vector3.Lerp(arg_18_1.var_.moveOldPosST03, var_21_28, var_21_27)
			end

			if arg_18_1.time_ >= var_21_25 + var_21_26 and arg_18_1.time_ < var_21_25 + var_21_26 + arg_21_0 then
				var_21_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_21_29 = manager.ui.mainCamera.transform
			local var_21_30 = 0

			if var_21_30 < arg_18_1.time_ and arg_18_1.time_ <= var_21_30 + arg_21_0 then
				local var_21_31 = arg_18_1.var_.effectxiayu2

				if var_21_31 then
					Object.Destroy(var_21_31)

					arg_18_1.var_.effectxiayu2 = nil
				end
			end

			local var_21_32 = manager.ui.mainCamera.transform
			local var_21_33 = 0

			if var_21_33 < arg_18_1.time_ and arg_18_1.time_ <= var_21_33 + arg_21_0 then
				local var_21_34 = arg_18_1.var_.effectxiayu1

				if var_21_34 then
					Object.Destroy(var_21_34)

					arg_18_1.var_.effectxiayu1 = nil
				end
			end

			local var_21_35 = manager.ui.mainCamera.transform
			local var_21_36 = 0

			if var_21_36 < arg_18_1.time_ and arg_18_1.time_ <= var_21_36 + arg_21_0 then
				local var_21_37 = arg_18_1.var_.effectxiayu3

				if not var_21_37 then
					var_21_37 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavymax"))
					var_21_37.name = "xiayu3"
					arg_18_1.var_.effectxiayu3 = var_21_37
				end

				local var_21_38 = var_21_35:Find("")

				if var_21_38 then
					var_21_37.transform.parent = var_21_38
				else
					var_21_37.transform.parent = var_21_35
				end

				var_21_37.transform.localPosition = Vector3.New(0, 0, 0)
				var_21_37.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_21_39 = manager.ui.mainCamera.transform
			local var_21_40 = 0

			if var_21_40 < arg_18_1.time_ and arg_18_1.time_ <= var_21_40 + arg_21_0 then
				local var_21_41 = arg_18_1.var_.effectxiayu4

				if not var_21_41 then
					var_21_41 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavymax_ui"))
					var_21_41.name = "xiayu4"
					arg_18_1.var_.effectxiayu4 = var_21_41
				end

				local var_21_42 = var_21_39:Find("")

				if var_21_42 then
					var_21_41.transform.parent = var_21_42
				else
					var_21_41.transform.parent = var_21_39
				end

				var_21_41.transform.localPosition = Vector3.New(0, 0, 0)
				var_21_41.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_21_43 = manager.ui.mainCameraCom_
				local var_21_44 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_21_43.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_21_45 = var_21_41.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_21_46 = 15
				local var_21_47 = 2 * var_21_46 * Mathf.Tan(var_21_43.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_21_43.aspect
				local var_21_48 = 1
				local var_21_49 = 1.7777777777777777

				if var_21_49 < var_21_43.aspect then
					var_21_48 = var_21_47 / (2 * var_21_46 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_21_49)
				end

				for iter_21_2, iter_21_3 in ipairs(var_21_45) do
					local var_21_50 = iter_21_3.transform.localScale

					iter_21_3.transform.localScale = Vector3.New(var_21_50.x / var_21_44 * var_21_48, var_21_50.y / var_21_44, var_21_50.z)
				end
			end

			local var_21_51 = 0
			local var_21_52 = 0.1

			if var_21_51 < arg_18_1.time_ and arg_18_1.time_ <= var_21_51 + arg_21_0 then
				arg_18_1.talkMaxDuration = 0

				arg_18_1.dialog_:SetActive(true)

				local var_21_53 = LeanTween.value(arg_18_1.dialog_, 0, 1, 0.3)

				var_21_53:setOnUpdate(LuaHelper.FloatAction(function(arg_22_0)
					arg_18_1.dialogCg_.alpha = arg_22_0
				end))
				var_21_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_18_1.dialog_)
					var_21_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_18_1.duration_ = arg_18_1.duration_ + 0.3

				SetActive(arg_18_1.leftNameGo_, false)

				arg_18_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_18_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_18_1:RecordName(arg_18_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_18_1.iconTrs_.gameObject, false)
				arg_18_1.callingController_:SetSelectedState("normal")

				local var_21_54 = arg_18_1:GetWordFromCfg(100)
				local var_21_55 = arg_18_1:FormatText(var_21_54.content)

				arg_18_1.text_.text = var_21_55

				LuaForUtil.ClearLinePrefixSymbol(arg_18_1.text_)

				local var_21_56 = 4
				local var_21_57 = utf8.len(var_21_55)
				local var_21_58 = var_21_56 <= 0 and var_21_52 or var_21_52 * (var_21_57 / var_21_56)

				if var_21_58 > 0 and var_21_52 < var_21_58 then
					arg_18_1.talkMaxDuration = var_21_58
					var_21_51 = var_21_51 + 0.3

					if var_21_58 + var_21_51 > arg_18_1.duration_ then
						arg_18_1.duration_ = var_21_58 + var_21_51
					end
				end

				arg_18_1.text_.text = var_21_55
				arg_18_1.typewritter.percent = 0

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(false)
				arg_18_1:RecordContent(arg_18_1.text_.text)
			end

			local var_21_59 = var_21_51 + 0.3
			local var_21_60 = math.max(var_21_52, arg_18_1.talkMaxDuration)

			if var_21_59 <= arg_18_1.time_ and arg_18_1.time_ < var_21_59 + var_21_60 then
				arg_18_1.typewritter.percent = (arg_18_1.time_ - var_21_59) / var_21_60

				arg_18_1.typewritter:SetDirty()
			end

			if arg_18_1.time_ >= var_21_59 + var_21_60 and arg_18_1.time_ < var_21_59 + var_21_60 + arg_21_0 then
				arg_18_1.typewritter.percent = 1

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(true)
			end
		end
	end,
	Play104 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 104
		arg_24_1.duration_ = 2

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play105(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = arg_24_1.actors_["1148ui_story"]
			local var_27_1 = 0

			if var_27_1 < arg_24_1.time_ and arg_24_1.time_ <= var_27_1 + arg_27_0 and not isNil(var_27_0) and arg_24_1.var_.characterEffect1148ui_story == nil then
				arg_24_1.var_.characterEffect1148ui_story = var_27_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_2 = 0.1

			if var_27_1 <= arg_24_1.time_ and arg_24_1.time_ < var_27_1 + var_27_2 and not isNil(var_27_0) then
				local var_27_3 = (arg_24_1.time_ - var_27_1) / var_27_2

				if arg_24_1.var_.characterEffect1148ui_story and not isNil(var_27_0) then
					arg_24_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_24_1.time_ >= var_27_1 + var_27_2 and arg_24_1.time_ < var_27_1 + var_27_2 + arg_27_0 and not isNil(var_27_0) and arg_24_1.var_.characterEffect1148ui_story then
				arg_24_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_27_4 = arg_24_1.actors_["1084ui_story"]
			local var_27_5 = 0

			if var_27_5 < arg_24_1.time_ and arg_24_1.time_ <= var_27_5 + arg_27_0 and not isNil(var_27_4) and arg_24_1.var_.characterEffect1084ui_story == nil then
				arg_24_1.var_.characterEffect1084ui_story = var_27_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_6 = 0.1

			if var_27_5 <= arg_24_1.time_ and arg_24_1.time_ < var_27_5 + var_27_6 and not isNil(var_27_4) then
				local var_27_7 = (arg_24_1.time_ - var_27_5) / var_27_6

				if arg_24_1.var_.characterEffect1084ui_story and not isNil(var_27_4) then
					arg_24_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_24_1.time_ >= var_27_5 + var_27_6 and arg_24_1.time_ < var_27_5 + var_27_6 + arg_27_0 and not isNil(var_27_4) and arg_24_1.var_.characterEffect1084ui_story then
				arg_24_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_27_8 = "ST05"

			if arg_24_1.bgs_[var_27_8] == nil then
				local var_27_9 = Object.Instantiate(arg_24_1.paintGo_)

				var_27_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_27_8)
				var_27_9.name = var_27_8
				var_27_9.transform.parent = arg_24_1.stage_.transform
				var_27_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_24_1.bgs_[var_27_8] = var_27_9
			end

			local var_27_10 = 0

			if var_27_10 < arg_24_1.time_ and arg_24_1.time_ <= var_27_10 + arg_27_0 then
				local var_27_11 = manager.ui.mainCamera.transform.localPosition
				local var_27_12 = Vector3.New(0, 0, 10) + Vector3.New(var_27_11.x, var_27_11.y, 0)
				local var_27_13 = arg_24_1.bgs_.ST05

				var_27_13.transform.localPosition = var_27_12
				var_27_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_27_14 = var_27_13:GetComponent("SpriteRenderer")

				if var_27_14 and var_27_14.sprite then
					local var_27_15 = (var_27_13.transform.localPosition - var_27_11).z
					local var_27_16 = manager.ui.mainCameraCom_
					local var_27_17 = 2 * var_27_15 * Mathf.Tan(var_27_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_27_18 = var_27_17 * var_27_16.aspect
					local var_27_19 = var_27_14.sprite.bounds.size.x
					local var_27_20 = var_27_14.sprite.bounds.size.y
					local var_27_21 = var_27_18 / var_27_19
					local var_27_22 = var_27_17 / var_27_20
					local var_27_23 = var_27_22 < var_27_21 and var_27_21 or var_27_22

					var_27_13.transform.localScale = Vector3.New(var_27_23, var_27_23, 0)
				end

				for iter_27_0, iter_27_1 in pairs(arg_24_1.bgs_) do
					if iter_27_0 ~= "ST05" then
						iter_27_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_27_24 = arg_24_1.bgs_.ST03a.transform
			local var_27_25 = 0

			if var_27_25 < arg_24_1.time_ and arg_24_1.time_ <= var_27_25 + arg_27_0 then
				arg_24_1.var_.moveOldPosST03a = var_27_24.localPosition
			end

			local var_27_26 = 0.001

			if var_27_25 <= arg_24_1.time_ and arg_24_1.time_ < var_27_25 + var_27_26 then
				local var_27_27 = (arg_24_1.time_ - var_27_25) / var_27_26
				local var_27_28 = Vector3.New(0, -100, 10)

				var_27_24.localPosition = Vector3.Lerp(arg_24_1.var_.moveOldPosST03a, var_27_28, var_27_27)
			end

			if arg_24_1.time_ >= var_27_25 + var_27_26 and arg_24_1.time_ < var_27_25 + var_27_26 + arg_27_0 then
				var_27_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_27_29 = 0

			if var_27_29 < arg_24_1.time_ and arg_24_1.time_ <= var_27_29 + arg_27_0 then
				arg_24_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action452")
			end

			local var_27_30 = manager.ui.mainCamera.transform
			local var_27_31 = 0

			if var_27_31 < arg_24_1.time_ and arg_24_1.time_ <= var_27_31 + arg_27_0 then
				local var_27_32 = arg_24_1.var_.effectxiayu3

				if var_27_32 then
					Object.Destroy(var_27_32)

					arg_24_1.var_.effectxiayu3 = nil
				end
			end

			local var_27_33 = manager.ui.mainCamera.transform
			local var_27_34 = 0

			if var_27_34 < arg_24_1.time_ and arg_24_1.time_ <= var_27_34 + arg_27_0 then
				local var_27_35 = arg_24_1.var_.effectxiayu4

				if var_27_35 then
					Object.Destroy(var_27_35)

					arg_24_1.var_.effectxiayu4 = nil
				end
			end

			local var_27_36 = manager.ui.mainCamera.transform
			local var_27_37 = 0

			if var_27_37 < arg_24_1.time_ and arg_24_1.time_ <= var_27_37 + arg_27_0 then
				local var_27_38 = arg_24_1.var_.effectxiayu5

				if not var_27_38 then
					var_27_38 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_light"))
					var_27_38.name = "xiayu5"
					arg_24_1.var_.effectxiayu5 = var_27_38
				end

				local var_27_39 = var_27_36:Find("")

				if var_27_39 then
					var_27_38.transform.parent = var_27_39
				else
					var_27_38.transform.parent = var_27_36
				end

				var_27_38.transform.localPosition = Vector3.New(0, 0, 0)
				var_27_38.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_27_40 = manager.ui.mainCamera.transform
			local var_27_41 = 0

			if var_27_41 < arg_24_1.time_ and arg_24_1.time_ <= var_27_41 + arg_27_0 then
				local var_27_42 = arg_24_1.var_.effectxiayu6

				if not var_27_42 then
					var_27_42 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_light_ui"))
					var_27_42.name = "xiayu6"
					arg_24_1.var_.effectxiayu6 = var_27_42
				end

				local var_27_43 = var_27_40:Find("")

				if var_27_43 then
					var_27_42.transform.parent = var_27_43
				else
					var_27_42.transform.parent = var_27_40
				end

				var_27_42.transform.localPosition = Vector3.New(0, 0, 0)
				var_27_42.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_27_44 = manager.ui.mainCameraCom_
				local var_27_45 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_27_44.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_27_46 = var_27_42.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_27_47 = 15
				local var_27_48 = 2 * var_27_47 * Mathf.Tan(var_27_44.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_27_44.aspect
				local var_27_49 = 1
				local var_27_50 = 1.7777777777777777

				if var_27_50 < var_27_44.aspect then
					var_27_49 = var_27_48 / (2 * var_27_47 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_27_50)
				end

				for iter_27_2, iter_27_3 in ipairs(var_27_46) do
					local var_27_51 = iter_27_3.transform.localScale

					iter_27_3.transform.localScale = Vector3.New(var_27_51.x / var_27_45 * var_27_49, var_27_51.y / var_27_45, var_27_51.z)
				end
			end

			local var_27_52 = 0
			local var_27_53 = 0.1

			if var_27_52 < arg_24_1.time_ and arg_24_1.time_ <= var_27_52 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0

				arg_24_1.dialog_:SetActive(true)

				local var_27_54 = LeanTween.value(arg_24_1.dialog_, 0, 1, 0.3)

				var_27_54:setOnUpdate(LuaHelper.FloatAction(function(arg_28_0)
					arg_24_1.dialogCg_.alpha = arg_28_0
				end))
				var_27_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_24_1.dialog_)
					var_27_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_24_1.duration_ = arg_24_1.duration_ + 0.3

				SetActive(arg_24_1.leftNameGo_, false)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_55 = arg_24_1:GetWordFromCfg(100)
				local var_27_56 = arg_24_1:FormatText(var_27_55.content)

				arg_24_1.text_.text = var_27_56

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_57 = 4
				local var_27_58 = utf8.len(var_27_56)
				local var_27_59 = var_27_57 <= 0 and var_27_53 or var_27_53 * (var_27_58 / var_27_57)

				if var_27_59 > 0 and var_27_53 < var_27_59 then
					arg_24_1.talkMaxDuration = var_27_59
					var_27_52 = var_27_52 + 0.3

					if var_27_59 + var_27_52 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_59 + var_27_52
					end
				end

				arg_24_1.text_.text = var_27_56
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)
				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_60 = var_27_52 + 0.3
			local var_27_61 = math.max(var_27_53, arg_24_1.talkMaxDuration)

			if var_27_60 <= arg_24_1.time_ and arg_24_1.time_ < var_27_60 + var_27_61 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_60) / var_27_61

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_60 + var_27_61 and arg_24_1.time_ < var_27_60 + var_27_61 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play105 = function(arg_30_0, arg_30_1)
		arg_30_1.time_ = 0
		arg_30_1.frameCnt_ = 0
		arg_30_1.state_ = "playing"
		arg_30_1.curTalkId_ = 105
		arg_30_1.duration_ = 7.37

		SetActive(arg_30_1.tipsGo_, false)

		function arg_30_1.onSingleLineFinish_()
			arg_30_1.onSingleLineUpdate_ = nil
			arg_30_1.onSingleLineFinish_ = nil
			arg_30_1.state_ = "waiting"
		end

		function arg_30_1.playNext_(arg_32_0)
			if arg_32_0 == 1 then
				arg_30_0:Play106(arg_30_1)
			end
		end

		function arg_30_1.onSingleLineUpdate_(arg_33_0)
			local var_33_0 = arg_30_1.actors_["1148ui_story"]
			local var_33_1 = 0

			if var_33_1 < arg_30_1.time_ and arg_30_1.time_ <= var_33_1 + arg_33_0 and not isNil(var_33_0) and arg_30_1.var_.characterEffect1148ui_story == nil then
				arg_30_1.var_.characterEffect1148ui_story = var_33_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_33_2 = 0.1

			if var_33_1 <= arg_30_1.time_ and arg_30_1.time_ < var_33_1 + var_33_2 and not isNil(var_33_0) then
				local var_33_3 = (arg_30_1.time_ - var_33_1) / var_33_2

				if arg_30_1.var_.characterEffect1148ui_story and not isNil(var_33_0) then
					arg_30_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_30_1.time_ >= var_33_1 + var_33_2 and arg_30_1.time_ < var_33_1 + var_33_2 + arg_33_0 and not isNil(var_33_0) and arg_30_1.var_.characterEffect1148ui_story then
				arg_30_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_33_4 = arg_30_1.actors_["1084ui_story"]
			local var_33_5 = 0

			if var_33_5 < arg_30_1.time_ and arg_30_1.time_ <= var_33_5 + arg_33_0 and not isNil(var_33_4) and arg_30_1.var_.characterEffect1084ui_story == nil then
				arg_30_1.var_.characterEffect1084ui_story = var_33_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_33_6 = 0.1

			if var_33_5 <= arg_30_1.time_ and arg_30_1.time_ < var_33_5 + var_33_6 and not isNil(var_33_4) then
				local var_33_7 = (arg_30_1.time_ - var_33_5) / var_33_6

				if arg_30_1.var_.characterEffect1084ui_story and not isNil(var_33_4) then
					arg_30_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_30_1.time_ >= var_33_5 + var_33_6 and arg_30_1.time_ < var_33_5 + var_33_6 + arg_33_0 and not isNil(var_33_4) and arg_30_1.var_.characterEffect1084ui_story then
				arg_30_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_33_8 = "ST05a"

			if arg_30_1.bgs_[var_33_8] == nil then
				local var_33_9 = Object.Instantiate(arg_30_1.paintGo_)

				var_33_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_33_8)
				var_33_9.name = var_33_8
				var_33_9.transform.parent = arg_30_1.stage_.transform
				var_33_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_30_1.bgs_[var_33_8] = var_33_9
			end

			local var_33_10 = 0

			if var_33_10 < arg_30_1.time_ and arg_30_1.time_ <= var_33_10 + arg_33_0 then
				local var_33_11 = manager.ui.mainCamera.transform.localPosition
				local var_33_12 = Vector3.New(0, 0, 10) + Vector3.New(var_33_11.x, var_33_11.y, 0)
				local var_33_13 = arg_30_1.bgs_.ST05a

				var_33_13.transform.localPosition = var_33_12
				var_33_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_33_14 = var_33_13:GetComponent("SpriteRenderer")

				if var_33_14 and var_33_14.sprite then
					local var_33_15 = (var_33_13.transform.localPosition - var_33_11).z
					local var_33_16 = manager.ui.mainCameraCom_
					local var_33_17 = 2 * var_33_15 * Mathf.Tan(var_33_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_33_18 = var_33_17 * var_33_16.aspect
					local var_33_19 = var_33_14.sprite.bounds.size.x
					local var_33_20 = var_33_14.sprite.bounds.size.y
					local var_33_21 = var_33_18 / var_33_19
					local var_33_22 = var_33_17 / var_33_20
					local var_33_23 = var_33_22 < var_33_21 and var_33_21 or var_33_22

					var_33_13.transform.localScale = Vector3.New(var_33_23, var_33_23, 0)
				end

				for iter_33_0, iter_33_1 in pairs(arg_30_1.bgs_) do
					if iter_33_0 ~= "ST05a" then
						iter_33_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_33_24 = arg_30_1.bgs_.ST05.transform
			local var_33_25 = 0

			if var_33_25 < arg_30_1.time_ and arg_30_1.time_ <= var_33_25 + arg_33_0 then
				arg_30_1.var_.moveOldPosST05 = var_33_24.localPosition
			end

			local var_33_26 = 0.001

			if var_33_25 <= arg_30_1.time_ and arg_30_1.time_ < var_33_25 + var_33_26 then
				local var_33_27 = (arg_30_1.time_ - var_33_25) / var_33_26
				local var_33_28 = Vector3.New(0, -100, 10)

				var_33_24.localPosition = Vector3.Lerp(arg_30_1.var_.moveOldPosST05, var_33_28, var_33_27)
			end

			if arg_30_1.time_ >= var_33_25 + var_33_26 and arg_30_1.time_ < var_33_25 + var_33_26 + arg_33_0 then
				var_33_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_33_29 = 0

			if var_33_29 < arg_30_1.time_ and arg_30_1.time_ <= var_33_29 + arg_33_0 then
				arg_30_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action423")
			end

			local var_33_30 = 0
			local var_33_31 = 0.1

			if var_33_30 < arg_30_1.time_ and arg_30_1.time_ <= var_33_30 + arg_33_0 then
				arg_30_1.talkMaxDuration = 0

				arg_30_1.dialog_:SetActive(true)

				local var_33_32 = LeanTween.value(arg_30_1.dialog_, 0, 1, 0.3)

				var_33_32:setOnUpdate(LuaHelper.FloatAction(function(arg_34_0)
					arg_30_1.dialogCg_.alpha = arg_34_0
				end))
				var_33_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_30_1.dialog_)
					var_33_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_30_1.duration_ = arg_30_1.duration_ + 0.3

				SetActive(arg_30_1.leftNameGo_, false)

				arg_30_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_30_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_30_1:RecordName(arg_30_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_30_1.iconTrs_.gameObject, false)
				arg_30_1.callingController_:SetSelectedState("normal")

				local var_33_33 = arg_30_1:GetWordFromCfg(100)
				local var_33_34 = arg_30_1:FormatText(var_33_33.content)

				arg_30_1.text_.text = var_33_34

				LuaForUtil.ClearLinePrefixSymbol(arg_30_1.text_)

				local var_33_35 = 4
				local var_33_36 = utf8.len(var_33_34)
				local var_33_37 = var_33_35 <= 0 and var_33_31 or var_33_31 * (var_33_36 / var_33_35)

				if var_33_37 > 0 and var_33_31 < var_33_37 then
					arg_30_1.talkMaxDuration = var_33_37
					var_33_30 = var_33_30 + 0.3

					if var_33_37 + var_33_30 > arg_30_1.duration_ then
						arg_30_1.duration_ = var_33_37 + var_33_30
					end
				end

				arg_30_1.text_.text = var_33_34
				arg_30_1.typewritter.percent = 0

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(false)
				arg_30_1:RecordContent(arg_30_1.text_.text)
			end

			local var_33_38 = var_33_30 + 0.3
			local var_33_39 = math.max(var_33_31, arg_30_1.talkMaxDuration)

			if var_33_38 <= arg_30_1.time_ and arg_30_1.time_ < var_33_38 + var_33_39 then
				arg_30_1.typewritter.percent = (arg_30_1.time_ - var_33_38) / var_33_39

				arg_30_1.typewritter:SetDirty()
			end

			if arg_30_1.time_ >= var_33_38 + var_33_39 and arg_30_1.time_ < var_33_38 + var_33_39 + arg_33_0 then
				arg_30_1.typewritter.percent = 1

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(true)
			end
		end
	end,
	Play106 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 106
		arg_36_1.duration_ = 6.83

		SetActive(arg_36_1.tipsGo_, false)

		function arg_36_1.onSingleLineFinish_()
			arg_36_1.onSingleLineUpdate_ = nil
			arg_36_1.onSingleLineFinish_ = nil
			arg_36_1.state_ = "waiting"
		end

		function arg_36_1.playNext_(arg_38_0)
			if arg_38_0 == 1 then
				arg_36_0:Play107(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = arg_36_1.actors_["1148ui_story"]
			local var_39_1 = 0

			if var_39_1 < arg_36_1.time_ and arg_36_1.time_ <= var_39_1 + arg_39_0 and not isNil(var_39_0) and arg_36_1.var_.characterEffect1148ui_story == nil then
				arg_36_1.var_.characterEffect1148ui_story = var_39_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_2 = 0.1

			if var_39_1 <= arg_36_1.time_ and arg_36_1.time_ < var_39_1 + var_39_2 and not isNil(var_39_0) then
				local var_39_3 = (arg_36_1.time_ - var_39_1) / var_39_2

				if arg_36_1.var_.characterEffect1148ui_story and not isNil(var_39_0) then
					arg_36_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_36_1.time_ >= var_39_1 + var_39_2 and arg_36_1.time_ < var_39_1 + var_39_2 + arg_39_0 and not isNil(var_39_0) and arg_36_1.var_.characterEffect1148ui_story then
				arg_36_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_39_4 = arg_36_1.actors_["1084ui_story"]
			local var_39_5 = 0

			if var_39_5 < arg_36_1.time_ and arg_36_1.time_ <= var_39_5 + arg_39_0 and not isNil(var_39_4) and arg_36_1.var_.characterEffect1084ui_story == nil then
				arg_36_1.var_.characterEffect1084ui_story = var_39_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_6 = 0.1

			if var_39_5 <= arg_36_1.time_ and arg_36_1.time_ < var_39_5 + var_39_6 and not isNil(var_39_4) then
				local var_39_7 = (arg_36_1.time_ - var_39_5) / var_39_6

				if arg_36_1.var_.characterEffect1084ui_story and not isNil(var_39_4) then
					arg_36_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_36_1.time_ >= var_39_5 + var_39_6 and arg_36_1.time_ < var_39_5 + var_39_6 + arg_39_0 and not isNil(var_39_4) and arg_36_1.var_.characterEffect1084ui_story then
				arg_36_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_39_8 = "ST06"

			if arg_36_1.bgs_[var_39_8] == nil then
				local var_39_9 = Object.Instantiate(arg_36_1.paintGo_)

				var_39_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_39_8)
				var_39_9.name = var_39_8
				var_39_9.transform.parent = arg_36_1.stage_.transform
				var_39_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_36_1.bgs_[var_39_8] = var_39_9
			end

			local var_39_10 = 0

			if var_39_10 < arg_36_1.time_ and arg_36_1.time_ <= var_39_10 + arg_39_0 then
				local var_39_11 = manager.ui.mainCamera.transform.localPosition
				local var_39_12 = Vector3.New(0, 0, 10) + Vector3.New(var_39_11.x, var_39_11.y, 0)
				local var_39_13 = arg_36_1.bgs_.ST06

				var_39_13.transform.localPosition = var_39_12
				var_39_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_39_14 = var_39_13:GetComponent("SpriteRenderer")

				if var_39_14 and var_39_14.sprite then
					local var_39_15 = (var_39_13.transform.localPosition - var_39_11).z
					local var_39_16 = manager.ui.mainCameraCom_
					local var_39_17 = 2 * var_39_15 * Mathf.Tan(var_39_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_39_18 = var_39_17 * var_39_16.aspect
					local var_39_19 = var_39_14.sprite.bounds.size.x
					local var_39_20 = var_39_14.sprite.bounds.size.y
					local var_39_21 = var_39_18 / var_39_19
					local var_39_22 = var_39_17 / var_39_20
					local var_39_23 = var_39_22 < var_39_21 and var_39_21 or var_39_22

					var_39_13.transform.localScale = Vector3.New(var_39_23, var_39_23, 0)
				end

				for iter_39_0, iter_39_1 in pairs(arg_36_1.bgs_) do
					if iter_39_0 ~= "ST06" then
						iter_39_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_39_24 = arg_36_1.bgs_.ST05a.transform
			local var_39_25 = 0

			if var_39_25 < arg_36_1.time_ and arg_36_1.time_ <= var_39_25 + arg_39_0 then
				arg_36_1.var_.moveOldPosST05a = var_39_24.localPosition
			end

			local var_39_26 = 0.001

			if var_39_25 <= arg_36_1.time_ and arg_36_1.time_ < var_39_25 + var_39_26 then
				local var_39_27 = (arg_36_1.time_ - var_39_25) / var_39_26
				local var_39_28 = Vector3.New(0, -100, 10)

				var_39_24.localPosition = Vector3.Lerp(arg_36_1.var_.moveOldPosST05a, var_39_28, var_39_27)
			end

			if arg_36_1.time_ >= var_39_25 + var_39_26 and arg_36_1.time_ < var_39_25 + var_39_26 + arg_39_0 then
				var_39_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_39_29 = 0

			if var_39_29 < arg_36_1.time_ and arg_36_1.time_ <= var_39_29 + arg_39_0 then
				arg_36_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action423")
			end

			local var_39_30 = 0
			local var_39_31 = 0.1

			if var_39_30 < arg_36_1.time_ and arg_36_1.time_ <= var_39_30 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0

				arg_36_1.dialog_:SetActive(true)

				local var_39_32 = LeanTween.value(arg_36_1.dialog_, 0, 1, 0.3)

				var_39_32:setOnUpdate(LuaHelper.FloatAction(function(arg_40_0)
					arg_36_1.dialogCg_.alpha = arg_40_0
				end))
				var_39_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_36_1.dialog_)
					var_39_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_36_1.duration_ = arg_36_1.duration_ + 0.3

				SetActive(arg_36_1.leftNameGo_, false)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_33 = arg_36_1:GetWordFromCfg(100)
				local var_39_34 = arg_36_1:FormatText(var_39_33.content)

				arg_36_1.text_.text = var_39_34

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_35 = 4
				local var_39_36 = utf8.len(var_39_34)
				local var_39_37 = var_39_35 <= 0 and var_39_31 or var_39_31 * (var_39_36 / var_39_35)

				if var_39_37 > 0 and var_39_31 < var_39_37 then
					arg_36_1.talkMaxDuration = var_39_37
					var_39_30 = var_39_30 + 0.3

					if var_39_37 + var_39_30 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_37 + var_39_30
					end
				end

				arg_36_1.text_.text = var_39_34
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)
				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_38 = var_39_30 + 0.3
			local var_39_39 = math.max(var_39_31, arg_36_1.talkMaxDuration)

			if var_39_38 <= arg_36_1.time_ and arg_36_1.time_ < var_39_38 + var_39_39 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_38) / var_39_39

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_38 + var_39_39 and arg_36_1.time_ < var_39_38 + var_39_39 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play107 = function(arg_42_0, arg_42_1)
		arg_42_1.time_ = 0
		arg_42_1.frameCnt_ = 0
		arg_42_1.state_ = "playing"
		arg_42_1.curTalkId_ = 107
		arg_42_1.duration_ = 6.8

		SetActive(arg_42_1.tipsGo_, false)

		function arg_42_1.onSingleLineFinish_()
			arg_42_1.onSingleLineUpdate_ = nil
			arg_42_1.onSingleLineFinish_ = nil
			arg_42_1.state_ = "waiting"
		end

		function arg_42_1.playNext_(arg_44_0)
			if arg_44_0 == 1 then
				arg_42_0:Play108(arg_42_1)
			end
		end

		function arg_42_1.onSingleLineUpdate_(arg_45_0)
			local var_45_0 = arg_42_1.actors_["1148ui_story"]
			local var_45_1 = 0

			if var_45_1 < arg_42_1.time_ and arg_42_1.time_ <= var_45_1 + arg_45_0 and not isNil(var_45_0) and arg_42_1.var_.characterEffect1148ui_story == nil then
				arg_42_1.var_.characterEffect1148ui_story = var_45_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_45_2 = 0.1

			if var_45_1 <= arg_42_1.time_ and arg_42_1.time_ < var_45_1 + var_45_2 and not isNil(var_45_0) then
				local var_45_3 = (arg_42_1.time_ - var_45_1) / var_45_2

				if arg_42_1.var_.characterEffect1148ui_story and not isNil(var_45_0) then
					arg_42_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_42_1.time_ >= var_45_1 + var_45_2 and arg_42_1.time_ < var_45_1 + var_45_2 + arg_45_0 and not isNil(var_45_0) and arg_42_1.var_.characterEffect1148ui_story then
				arg_42_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_45_4 = arg_42_1.actors_["1084ui_story"]
			local var_45_5 = 0

			if var_45_5 < arg_42_1.time_ and arg_42_1.time_ <= var_45_5 + arg_45_0 and not isNil(var_45_4) and arg_42_1.var_.characterEffect1084ui_story == nil then
				arg_42_1.var_.characterEffect1084ui_story = var_45_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_45_6 = 0.1

			if var_45_5 <= arg_42_1.time_ and arg_42_1.time_ < var_45_5 + var_45_6 and not isNil(var_45_4) then
				local var_45_7 = (arg_42_1.time_ - var_45_5) / var_45_6

				if arg_42_1.var_.characterEffect1084ui_story and not isNil(var_45_4) then
					arg_42_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_42_1.time_ >= var_45_5 + var_45_6 and arg_42_1.time_ < var_45_5 + var_45_6 + arg_45_0 and not isNil(var_45_4) and arg_42_1.var_.characterEffect1084ui_story then
				arg_42_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_45_8 = "ST06a"

			if arg_42_1.bgs_[var_45_8] == nil then
				local var_45_9 = Object.Instantiate(arg_42_1.paintGo_)

				var_45_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_45_8)
				var_45_9.name = var_45_8
				var_45_9.transform.parent = arg_42_1.stage_.transform
				var_45_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_42_1.bgs_[var_45_8] = var_45_9
			end

			local var_45_10 = 0

			if var_45_10 < arg_42_1.time_ and arg_42_1.time_ <= var_45_10 + arg_45_0 then
				local var_45_11 = manager.ui.mainCamera.transform.localPosition
				local var_45_12 = Vector3.New(0, 0, 10) + Vector3.New(var_45_11.x, var_45_11.y, 0)
				local var_45_13 = arg_42_1.bgs_.ST06a

				var_45_13.transform.localPosition = var_45_12
				var_45_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_45_14 = var_45_13:GetComponent("SpriteRenderer")

				if var_45_14 and var_45_14.sprite then
					local var_45_15 = (var_45_13.transform.localPosition - var_45_11).z
					local var_45_16 = manager.ui.mainCameraCom_
					local var_45_17 = 2 * var_45_15 * Mathf.Tan(var_45_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_45_18 = var_45_17 * var_45_16.aspect
					local var_45_19 = var_45_14.sprite.bounds.size.x
					local var_45_20 = var_45_14.sprite.bounds.size.y
					local var_45_21 = var_45_18 / var_45_19
					local var_45_22 = var_45_17 / var_45_20
					local var_45_23 = var_45_22 < var_45_21 and var_45_21 or var_45_22

					var_45_13.transform.localScale = Vector3.New(var_45_23, var_45_23, 0)
				end

				for iter_45_0, iter_45_1 in pairs(arg_42_1.bgs_) do
					if iter_45_0 ~= "ST06a" then
						iter_45_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_45_24 = arg_42_1.bgs_.ST06.transform
			local var_45_25 = 0

			if var_45_25 < arg_42_1.time_ and arg_42_1.time_ <= var_45_25 + arg_45_0 then
				arg_42_1.var_.moveOldPosST06 = var_45_24.localPosition
			end

			local var_45_26 = 0.001

			if var_45_25 <= arg_42_1.time_ and arg_42_1.time_ < var_45_25 + var_45_26 then
				local var_45_27 = (arg_42_1.time_ - var_45_25) / var_45_26
				local var_45_28 = Vector3.New(0, -100, 10)

				var_45_24.localPosition = Vector3.Lerp(arg_42_1.var_.moveOldPosST06, var_45_28, var_45_27)
			end

			if arg_42_1.time_ >= var_45_25 + var_45_26 and arg_42_1.time_ < var_45_25 + var_45_26 + arg_45_0 then
				var_45_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_45_29 = 0

			if var_45_29 < arg_42_1.time_ and arg_42_1.time_ <= var_45_29 + arg_45_0 then
				arg_42_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action434")
			end

			local var_45_30 = 0
			local var_45_31 = 0.1

			if var_45_30 < arg_42_1.time_ and arg_42_1.time_ <= var_45_30 + arg_45_0 then
				arg_42_1.talkMaxDuration = 0

				arg_42_1.dialog_:SetActive(true)

				local var_45_32 = LeanTween.value(arg_42_1.dialog_, 0, 1, 0.3)

				var_45_32:setOnUpdate(LuaHelper.FloatAction(function(arg_46_0)
					arg_42_1.dialogCg_.alpha = arg_46_0
				end))
				var_45_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_42_1.dialog_)
					var_45_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_42_1.duration_ = arg_42_1.duration_ + 0.3

				SetActive(arg_42_1.leftNameGo_, false)

				arg_42_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_42_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_42_1:RecordName(arg_42_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_42_1.iconTrs_.gameObject, false)
				arg_42_1.callingController_:SetSelectedState("normal")

				local var_45_33 = arg_42_1:GetWordFromCfg(100)
				local var_45_34 = arg_42_1:FormatText(var_45_33.content)

				arg_42_1.text_.text = var_45_34

				LuaForUtil.ClearLinePrefixSymbol(arg_42_1.text_)

				local var_45_35 = 4
				local var_45_36 = utf8.len(var_45_34)
				local var_45_37 = var_45_35 <= 0 and var_45_31 or var_45_31 * (var_45_36 / var_45_35)

				if var_45_37 > 0 and var_45_31 < var_45_37 then
					arg_42_1.talkMaxDuration = var_45_37
					var_45_30 = var_45_30 + 0.3

					if var_45_37 + var_45_30 > arg_42_1.duration_ then
						arg_42_1.duration_ = var_45_37 + var_45_30
					end
				end

				arg_42_1.text_.text = var_45_34
				arg_42_1.typewritter.percent = 0

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(false)
				arg_42_1:RecordContent(arg_42_1.text_.text)
			end

			local var_45_38 = var_45_30 + 0.3
			local var_45_39 = math.max(var_45_31, arg_42_1.talkMaxDuration)

			if var_45_38 <= arg_42_1.time_ and arg_42_1.time_ < var_45_38 + var_45_39 then
				arg_42_1.typewritter.percent = (arg_42_1.time_ - var_45_38) / var_45_39

				arg_42_1.typewritter:SetDirty()
			end

			if arg_42_1.time_ >= var_45_38 + var_45_39 and arg_42_1.time_ < var_45_38 + var_45_39 + arg_45_0 then
				arg_42_1.typewritter.percent = 1

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(true)
			end
		end
	end,
	Play108 = function(arg_48_0, arg_48_1)
		arg_48_1.time_ = 0
		arg_48_1.frameCnt_ = 0
		arg_48_1.state_ = "playing"
		arg_48_1.curTalkId_ = 108
		arg_48_1.duration_ = 7.05

		SetActive(arg_48_1.tipsGo_, false)

		function arg_48_1.onSingleLineFinish_()
			arg_48_1.onSingleLineUpdate_ = nil
			arg_48_1.onSingleLineFinish_ = nil
			arg_48_1.state_ = "waiting"
		end

		function arg_48_1.playNext_(arg_50_0)
			if arg_50_0 == 1 then
				arg_48_0:Play109(arg_48_1)
			end
		end

		function arg_48_1.onSingleLineUpdate_(arg_51_0)
			local var_51_0 = arg_48_1.actors_["1148ui_story"]
			local var_51_1 = 0

			if var_51_1 < arg_48_1.time_ and arg_48_1.time_ <= var_51_1 + arg_51_0 and not isNil(var_51_0) and arg_48_1.var_.characterEffect1148ui_story == nil then
				arg_48_1.var_.characterEffect1148ui_story = var_51_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_51_2 = 0.1

			if var_51_1 <= arg_48_1.time_ and arg_48_1.time_ < var_51_1 + var_51_2 and not isNil(var_51_0) then
				local var_51_3 = (arg_48_1.time_ - var_51_1) / var_51_2

				if arg_48_1.var_.characterEffect1148ui_story and not isNil(var_51_0) then
					arg_48_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_48_1.time_ >= var_51_1 + var_51_2 and arg_48_1.time_ < var_51_1 + var_51_2 + arg_51_0 and not isNil(var_51_0) and arg_48_1.var_.characterEffect1148ui_story then
				arg_48_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_51_4 = arg_48_1.actors_["1084ui_story"]
			local var_51_5 = 0

			if var_51_5 < arg_48_1.time_ and arg_48_1.time_ <= var_51_5 + arg_51_0 and not isNil(var_51_4) and arg_48_1.var_.characterEffect1084ui_story == nil then
				arg_48_1.var_.characterEffect1084ui_story = var_51_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_51_6 = 0.1

			if var_51_5 <= arg_48_1.time_ and arg_48_1.time_ < var_51_5 + var_51_6 and not isNil(var_51_4) then
				local var_51_7 = (arg_48_1.time_ - var_51_5) / var_51_6

				if arg_48_1.var_.characterEffect1084ui_story and not isNil(var_51_4) then
					arg_48_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_48_1.time_ >= var_51_5 + var_51_6 and arg_48_1.time_ < var_51_5 + var_51_6 + arg_51_0 and not isNil(var_51_4) and arg_48_1.var_.characterEffect1084ui_story then
				arg_48_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_51_8 = "ST06b"

			if arg_48_1.bgs_[var_51_8] == nil then
				local var_51_9 = Object.Instantiate(arg_48_1.paintGo_)

				var_51_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_51_8)
				var_51_9.name = var_51_8
				var_51_9.transform.parent = arg_48_1.stage_.transform
				var_51_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_48_1.bgs_[var_51_8] = var_51_9
			end

			local var_51_10 = 0

			if var_51_10 < arg_48_1.time_ and arg_48_1.time_ <= var_51_10 + arg_51_0 then
				local var_51_11 = manager.ui.mainCamera.transform.localPosition
				local var_51_12 = Vector3.New(0, 0, 10) + Vector3.New(var_51_11.x, var_51_11.y, 0)
				local var_51_13 = arg_48_1.bgs_.ST06b

				var_51_13.transform.localPosition = var_51_12
				var_51_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_51_14 = var_51_13:GetComponent("SpriteRenderer")

				if var_51_14 and var_51_14.sprite then
					local var_51_15 = (var_51_13.transform.localPosition - var_51_11).z
					local var_51_16 = manager.ui.mainCameraCom_
					local var_51_17 = 2 * var_51_15 * Mathf.Tan(var_51_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_51_18 = var_51_17 * var_51_16.aspect
					local var_51_19 = var_51_14.sprite.bounds.size.x
					local var_51_20 = var_51_14.sprite.bounds.size.y
					local var_51_21 = var_51_18 / var_51_19
					local var_51_22 = var_51_17 / var_51_20
					local var_51_23 = var_51_22 < var_51_21 and var_51_21 or var_51_22

					var_51_13.transform.localScale = Vector3.New(var_51_23, var_51_23, 0)
				end

				for iter_51_0, iter_51_1 in pairs(arg_48_1.bgs_) do
					if iter_51_0 ~= "ST06b" then
						iter_51_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_51_24 = arg_48_1.bgs_.ST06a.transform
			local var_51_25 = 0

			if var_51_25 < arg_48_1.time_ and arg_48_1.time_ <= var_51_25 + arg_51_0 then
				arg_48_1.var_.moveOldPosST06a = var_51_24.localPosition
			end

			local var_51_26 = 0.001

			if var_51_25 <= arg_48_1.time_ and arg_48_1.time_ < var_51_25 + var_51_26 then
				local var_51_27 = (arg_48_1.time_ - var_51_25) / var_51_26
				local var_51_28 = Vector3.New(0, -100, 10)

				var_51_24.localPosition = Vector3.Lerp(arg_48_1.var_.moveOldPosST06a, var_51_28, var_51_27)
			end

			if arg_48_1.time_ >= var_51_25 + var_51_26 and arg_48_1.time_ < var_51_25 + var_51_26 + arg_51_0 then
				var_51_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_51_29 = 0

			if var_51_29 < arg_48_1.time_ and arg_48_1.time_ <= var_51_29 + arg_51_0 then
				arg_48_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action434")
			end

			local var_51_30 = 0
			local var_51_31 = 0.1

			if var_51_30 < arg_48_1.time_ and arg_48_1.time_ <= var_51_30 + arg_51_0 then
				arg_48_1.talkMaxDuration = 0

				arg_48_1.dialog_:SetActive(true)

				local var_51_32 = LeanTween.value(arg_48_1.dialog_, 0, 1, 0.3)

				var_51_32:setOnUpdate(LuaHelper.FloatAction(function(arg_52_0)
					arg_48_1.dialogCg_.alpha = arg_52_0
				end))
				var_51_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_48_1.dialog_)
					var_51_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_48_1.duration_ = arg_48_1.duration_ + 0.3

				SetActive(arg_48_1.leftNameGo_, false)

				arg_48_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_48_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_48_1:RecordName(arg_48_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_48_1.iconTrs_.gameObject, false)
				arg_48_1.callingController_:SetSelectedState("normal")

				local var_51_33 = arg_48_1:GetWordFromCfg(100)
				local var_51_34 = arg_48_1:FormatText(var_51_33.content)

				arg_48_1.text_.text = var_51_34

				LuaForUtil.ClearLinePrefixSymbol(arg_48_1.text_)

				local var_51_35 = 4
				local var_51_36 = utf8.len(var_51_34)
				local var_51_37 = var_51_35 <= 0 and var_51_31 or var_51_31 * (var_51_36 / var_51_35)

				if var_51_37 > 0 and var_51_31 < var_51_37 then
					arg_48_1.talkMaxDuration = var_51_37
					var_51_30 = var_51_30 + 0.3

					if var_51_37 + var_51_30 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_37 + var_51_30
					end
				end

				arg_48_1.text_.text = var_51_34
				arg_48_1.typewritter.percent = 0

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(false)
				arg_48_1:RecordContent(arg_48_1.text_.text)
			end

			local var_51_38 = var_51_30 + 0.3
			local var_51_39 = math.max(var_51_31, arg_48_1.talkMaxDuration)

			if var_51_38 <= arg_48_1.time_ and arg_48_1.time_ < var_51_38 + var_51_39 then
				arg_48_1.typewritter.percent = (arg_48_1.time_ - var_51_38) / var_51_39

				arg_48_1.typewritter:SetDirty()
			end

			if arg_48_1.time_ >= var_51_38 + var_51_39 and arg_48_1.time_ < var_51_38 + var_51_39 + arg_51_0 then
				arg_48_1.typewritter.percent = 1

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(true)
			end
		end
	end,
	Play109 = function(arg_54_0, arg_54_1)
		arg_54_1.time_ = 0
		arg_54_1.frameCnt_ = 0
		arg_54_1.state_ = "playing"
		arg_54_1.curTalkId_ = 109
		arg_54_1.duration_ = 6.67

		SetActive(arg_54_1.tipsGo_, false)

		function arg_54_1.onSingleLineFinish_()
			arg_54_1.onSingleLineUpdate_ = nil
			arg_54_1.onSingleLineFinish_ = nil
			arg_54_1.state_ = "waiting"
		end

		function arg_54_1.playNext_(arg_56_0)
			if arg_56_0 == 1 then
				arg_54_0:Play110(arg_54_1)
			end
		end

		function arg_54_1.onSingleLineUpdate_(arg_57_0)
			local var_57_0 = arg_54_1.actors_["1148ui_story"]
			local var_57_1 = 0

			if var_57_1 < arg_54_1.time_ and arg_54_1.time_ <= var_57_1 + arg_57_0 and not isNil(var_57_0) and arg_54_1.var_.characterEffect1148ui_story == nil then
				arg_54_1.var_.characterEffect1148ui_story = var_57_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_57_2 = 0.1

			if var_57_1 <= arg_54_1.time_ and arg_54_1.time_ < var_57_1 + var_57_2 and not isNil(var_57_0) then
				local var_57_3 = (arg_54_1.time_ - var_57_1) / var_57_2

				if arg_54_1.var_.characterEffect1148ui_story and not isNil(var_57_0) then
					arg_54_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_54_1.time_ >= var_57_1 + var_57_2 and arg_54_1.time_ < var_57_1 + var_57_2 + arg_57_0 and not isNil(var_57_0) and arg_54_1.var_.characterEffect1148ui_story then
				arg_54_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_57_4 = arg_54_1.actors_["1084ui_story"]
			local var_57_5 = 0

			if var_57_5 < arg_54_1.time_ and arg_54_1.time_ <= var_57_5 + arg_57_0 and not isNil(var_57_4) and arg_54_1.var_.characterEffect1084ui_story == nil then
				arg_54_1.var_.characterEffect1084ui_story = var_57_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_57_6 = 0.1

			if var_57_5 <= arg_54_1.time_ and arg_54_1.time_ < var_57_5 + var_57_6 and not isNil(var_57_4) then
				local var_57_7 = (arg_54_1.time_ - var_57_5) / var_57_6

				if arg_54_1.var_.characterEffect1084ui_story and not isNil(var_57_4) then
					arg_54_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_54_1.time_ >= var_57_5 + var_57_6 and arg_54_1.time_ < var_57_5 + var_57_6 + arg_57_0 and not isNil(var_57_4) and arg_54_1.var_.characterEffect1084ui_story then
				arg_54_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_57_8 = arg_54_1.bgs_.ST06b.transform
			local var_57_9 = 0

			if var_57_9 < arg_54_1.time_ and arg_54_1.time_ <= var_57_9 + arg_57_0 then
				arg_54_1.var_.moveOldPosST06b = var_57_8.localPosition
			end

			local var_57_10 = 0.001

			if var_57_9 <= arg_54_1.time_ and arg_54_1.time_ < var_57_9 + var_57_10 then
				local var_57_11 = (arg_54_1.time_ - var_57_9) / var_57_10
				local var_57_12 = Vector3.New(0, -100, 10)

				var_57_8.localPosition = Vector3.Lerp(arg_54_1.var_.moveOldPosST06b, var_57_12, var_57_11)
			end

			if arg_54_1.time_ >= var_57_9 + var_57_10 and arg_54_1.time_ < var_57_9 + var_57_10 + arg_57_0 then
				var_57_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_57_13 = "ST07a"

			if arg_54_1.bgs_[var_57_13] == nil then
				local var_57_14 = Object.Instantiate(arg_54_1.paintGo_)

				var_57_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_57_13)
				var_57_14.name = var_57_13
				var_57_14.transform.parent = arg_54_1.stage_.transform
				var_57_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_54_1.bgs_[var_57_13] = var_57_14
			end

			local var_57_15 = 0

			if var_57_15 < arg_54_1.time_ and arg_54_1.time_ <= var_57_15 + arg_57_0 then
				local var_57_16 = manager.ui.mainCamera.transform.localPosition
				local var_57_17 = Vector3.New(0, 0, 10) + Vector3.New(var_57_16.x, var_57_16.y, 0)
				local var_57_18 = arg_54_1.bgs_.ST07a

				var_57_18.transform.localPosition = var_57_17
				var_57_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_57_19 = var_57_18:GetComponent("SpriteRenderer")

				if var_57_19 and var_57_19.sprite then
					local var_57_20 = (var_57_18.transform.localPosition - var_57_16).z
					local var_57_21 = manager.ui.mainCameraCom_
					local var_57_22 = 2 * var_57_20 * Mathf.Tan(var_57_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_57_23 = var_57_22 * var_57_21.aspect
					local var_57_24 = var_57_19.sprite.bounds.size.x
					local var_57_25 = var_57_19.sprite.bounds.size.y
					local var_57_26 = var_57_23 / var_57_24
					local var_57_27 = var_57_22 / var_57_25
					local var_57_28 = var_57_27 < var_57_26 and var_57_26 or var_57_27

					var_57_18.transform.localScale = Vector3.New(var_57_28, var_57_28, 0)
				end

				for iter_57_0, iter_57_1 in pairs(arg_54_1.bgs_) do
					if iter_57_0 ~= "ST07a" then
						iter_57_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_57_29 = 0

			if var_57_29 < arg_54_1.time_ and arg_54_1.time_ <= var_57_29 + arg_57_0 then
				arg_54_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action445")
			end

			local var_57_30 = 0
			local var_57_31 = 0.1

			if var_57_30 < arg_54_1.time_ and arg_54_1.time_ <= var_57_30 + arg_57_0 then
				arg_54_1.talkMaxDuration = 0

				arg_54_1.dialog_:SetActive(true)

				local var_57_32 = LeanTween.value(arg_54_1.dialog_, 0, 1, 0.3)

				var_57_32:setOnUpdate(LuaHelper.FloatAction(function(arg_58_0)
					arg_54_1.dialogCg_.alpha = arg_58_0
				end))
				var_57_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_54_1.dialog_)
					var_57_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_54_1.duration_ = arg_54_1.duration_ + 0.3

				SetActive(arg_54_1.leftNameGo_, false)

				arg_54_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_54_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_54_1:RecordName(arg_54_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_54_1.iconTrs_.gameObject, false)
				arg_54_1.callingController_:SetSelectedState("normal")

				local var_57_33 = arg_54_1:GetWordFromCfg(100)
				local var_57_34 = arg_54_1:FormatText(var_57_33.content)

				arg_54_1.text_.text = var_57_34

				LuaForUtil.ClearLinePrefixSymbol(arg_54_1.text_)

				local var_57_35 = 4
				local var_57_36 = utf8.len(var_57_34)
				local var_57_37 = var_57_35 <= 0 and var_57_31 or var_57_31 * (var_57_36 / var_57_35)

				if var_57_37 > 0 and var_57_31 < var_57_37 then
					arg_54_1.talkMaxDuration = var_57_37
					var_57_30 = var_57_30 + 0.3

					if var_57_37 + var_57_30 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_37 + var_57_30
					end
				end

				arg_54_1.text_.text = var_57_34
				arg_54_1.typewritter.percent = 0

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(false)
				arg_54_1:RecordContent(arg_54_1.text_.text)
			end

			local var_57_38 = var_57_30 + 0.3
			local var_57_39 = math.max(var_57_31, arg_54_1.talkMaxDuration)

			if var_57_38 <= arg_54_1.time_ and arg_54_1.time_ < var_57_38 + var_57_39 then
				arg_54_1.typewritter.percent = (arg_54_1.time_ - var_57_38) / var_57_39

				arg_54_1.typewritter:SetDirty()
			end

			if arg_54_1.time_ >= var_57_38 + var_57_39 and arg_54_1.time_ < var_57_38 + var_57_39 + arg_57_0 then
				arg_54_1.typewritter.percent = 1

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(true)
			end
		end
	end,
	Play110 = function(arg_60_0, arg_60_1)
		arg_60_1.time_ = 0
		arg_60_1.frameCnt_ = 0
		arg_60_1.state_ = "playing"
		arg_60_1.curTalkId_ = 110
		arg_60_1.duration_ = 6.77

		SetActive(arg_60_1.tipsGo_, false)

		function arg_60_1.onSingleLineFinish_()
			arg_60_1.onSingleLineUpdate_ = nil
			arg_60_1.onSingleLineFinish_ = nil
			arg_60_1.state_ = "waiting"
		end

		function arg_60_1.playNext_(arg_62_0)
			if arg_62_0 == 1 then
				arg_60_0:Play111(arg_60_1)
			end
		end

		function arg_60_1.onSingleLineUpdate_(arg_63_0)
			local var_63_0 = arg_60_1.actors_["1148ui_story"]
			local var_63_1 = 0

			if var_63_1 < arg_60_1.time_ and arg_60_1.time_ <= var_63_1 + arg_63_0 and not isNil(var_63_0) and arg_60_1.var_.characterEffect1148ui_story == nil then
				arg_60_1.var_.characterEffect1148ui_story = var_63_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_2 = 0.1

			if var_63_1 <= arg_60_1.time_ and arg_60_1.time_ < var_63_1 + var_63_2 and not isNil(var_63_0) then
				local var_63_3 = (arg_60_1.time_ - var_63_1) / var_63_2

				if arg_60_1.var_.characterEffect1148ui_story and not isNil(var_63_0) then
					arg_60_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_60_1.time_ >= var_63_1 + var_63_2 and arg_60_1.time_ < var_63_1 + var_63_2 + arg_63_0 and not isNil(var_63_0) and arg_60_1.var_.characterEffect1148ui_story then
				arg_60_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_63_4 = arg_60_1.actors_["1084ui_story"]
			local var_63_5 = 0

			if var_63_5 < arg_60_1.time_ and arg_60_1.time_ <= var_63_5 + arg_63_0 and not isNil(var_63_4) and arg_60_1.var_.characterEffect1084ui_story == nil then
				arg_60_1.var_.characterEffect1084ui_story = var_63_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_6 = 0.1

			if var_63_5 <= arg_60_1.time_ and arg_60_1.time_ < var_63_5 + var_63_6 and not isNil(var_63_4) then
				local var_63_7 = (arg_60_1.time_ - var_63_5) / var_63_6

				if arg_60_1.var_.characterEffect1084ui_story and not isNil(var_63_4) then
					arg_60_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_60_1.time_ >= var_63_5 + var_63_6 and arg_60_1.time_ < var_63_5 + var_63_6 + arg_63_0 and not isNil(var_63_4) and arg_60_1.var_.characterEffect1084ui_story then
				arg_60_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_63_8 = arg_60_1.bgs_.ST07a.transform
			local var_63_9 = 0

			if var_63_9 < arg_60_1.time_ and arg_60_1.time_ <= var_63_9 + arg_63_0 then
				arg_60_1.var_.moveOldPosST07a = var_63_8.localPosition
			end

			local var_63_10 = 0.001

			if var_63_9 <= arg_60_1.time_ and arg_60_1.time_ < var_63_9 + var_63_10 then
				local var_63_11 = (arg_60_1.time_ - var_63_9) / var_63_10
				local var_63_12 = Vector3.New(0, -100, 10)

				var_63_8.localPosition = Vector3.Lerp(arg_60_1.var_.moveOldPosST07a, var_63_12, var_63_11)
			end

			if arg_60_1.time_ >= var_63_9 + var_63_10 and arg_60_1.time_ < var_63_9 + var_63_10 + arg_63_0 then
				var_63_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_63_13 = "ST07b"

			if arg_60_1.bgs_[var_63_13] == nil then
				local var_63_14 = Object.Instantiate(arg_60_1.paintGo_)

				var_63_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_63_13)
				var_63_14.name = var_63_13
				var_63_14.transform.parent = arg_60_1.stage_.transform
				var_63_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_60_1.bgs_[var_63_13] = var_63_14
			end

			local var_63_15 = 0

			if var_63_15 < arg_60_1.time_ and arg_60_1.time_ <= var_63_15 + arg_63_0 then
				local var_63_16 = manager.ui.mainCamera.transform.localPosition
				local var_63_17 = Vector3.New(0, 0, 10) + Vector3.New(var_63_16.x, var_63_16.y, 0)
				local var_63_18 = arg_60_1.bgs_.ST07b

				var_63_18.transform.localPosition = var_63_17
				var_63_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_63_19 = var_63_18:GetComponent("SpriteRenderer")

				if var_63_19 and var_63_19.sprite then
					local var_63_20 = (var_63_18.transform.localPosition - var_63_16).z
					local var_63_21 = manager.ui.mainCameraCom_
					local var_63_22 = 2 * var_63_20 * Mathf.Tan(var_63_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_63_23 = var_63_22 * var_63_21.aspect
					local var_63_24 = var_63_19.sprite.bounds.size.x
					local var_63_25 = var_63_19.sprite.bounds.size.y
					local var_63_26 = var_63_23 / var_63_24
					local var_63_27 = var_63_22 / var_63_25
					local var_63_28 = var_63_27 < var_63_26 and var_63_26 or var_63_27

					var_63_18.transform.localScale = Vector3.New(var_63_28, var_63_28, 0)
				end

				for iter_63_0, iter_63_1 in pairs(arg_60_1.bgs_) do
					if iter_63_0 ~= "ST07b" then
						iter_63_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_63_29 = 0

			if var_63_29 < arg_60_1.time_ and arg_60_1.time_ <= var_63_29 + arg_63_0 then
				arg_60_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action445")
			end

			local var_63_30 = 0
			local var_63_31 = 0.1

			if var_63_30 < arg_60_1.time_ and arg_60_1.time_ <= var_63_30 + arg_63_0 then
				arg_60_1.talkMaxDuration = 0

				arg_60_1.dialog_:SetActive(true)

				local var_63_32 = LeanTween.value(arg_60_1.dialog_, 0, 1, 0.3)

				var_63_32:setOnUpdate(LuaHelper.FloatAction(function(arg_64_0)
					arg_60_1.dialogCg_.alpha = arg_64_0
				end))
				var_63_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_60_1.dialog_)
					var_63_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_60_1.duration_ = arg_60_1.duration_ + 0.3

				SetActive(arg_60_1.leftNameGo_, false)

				arg_60_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_60_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_60_1:RecordName(arg_60_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_60_1.iconTrs_.gameObject, false)
				arg_60_1.callingController_:SetSelectedState("normal")

				local var_63_33 = arg_60_1:GetWordFromCfg(100)
				local var_63_34 = arg_60_1:FormatText(var_63_33.content)

				arg_60_1.text_.text = var_63_34

				LuaForUtil.ClearLinePrefixSymbol(arg_60_1.text_)

				local var_63_35 = 4
				local var_63_36 = utf8.len(var_63_34)
				local var_63_37 = var_63_35 <= 0 and var_63_31 or var_63_31 * (var_63_36 / var_63_35)

				if var_63_37 > 0 and var_63_31 < var_63_37 then
					arg_60_1.talkMaxDuration = var_63_37
					var_63_30 = var_63_30 + 0.3

					if var_63_37 + var_63_30 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_37 + var_63_30
					end
				end

				arg_60_1.text_.text = var_63_34
				arg_60_1.typewritter.percent = 0

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(false)
				arg_60_1:RecordContent(arg_60_1.text_.text)
			end

			local var_63_38 = var_63_30 + 0.3
			local var_63_39 = math.max(var_63_31, arg_60_1.talkMaxDuration)

			if var_63_38 <= arg_60_1.time_ and arg_60_1.time_ < var_63_38 + var_63_39 then
				arg_60_1.typewritter.percent = (arg_60_1.time_ - var_63_38) / var_63_39

				arg_60_1.typewritter:SetDirty()
			end

			if arg_60_1.time_ >= var_63_38 + var_63_39 and arg_60_1.time_ < var_63_38 + var_63_39 + arg_63_0 then
				arg_60_1.typewritter.percent = 1

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(true)
			end
		end
	end,
	Play111 = function(arg_66_0, arg_66_1)
		arg_66_1.time_ = 0
		arg_66_1.frameCnt_ = 0
		arg_66_1.state_ = "playing"
		arg_66_1.curTalkId_ = 111
		arg_66_1.duration_ = 7.33

		SetActive(arg_66_1.tipsGo_, false)

		function arg_66_1.onSingleLineFinish_()
			arg_66_1.onSingleLineUpdate_ = nil
			arg_66_1.onSingleLineFinish_ = nil
			arg_66_1.state_ = "waiting"
		end

		function arg_66_1.playNext_(arg_68_0)
			if arg_68_0 == 1 then
				arg_66_0:Play112(arg_66_1)
			end
		end

		function arg_66_1.onSingleLineUpdate_(arg_69_0)
			local var_69_0 = arg_66_1.actors_["1148ui_story"]
			local var_69_1 = 0

			if var_69_1 < arg_66_1.time_ and arg_66_1.time_ <= var_69_1 + arg_69_0 and not isNil(var_69_0) and arg_66_1.var_.characterEffect1148ui_story == nil then
				arg_66_1.var_.characterEffect1148ui_story = var_69_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_69_2 = 0.1

			if var_69_1 <= arg_66_1.time_ and arg_66_1.time_ < var_69_1 + var_69_2 and not isNil(var_69_0) then
				local var_69_3 = (arg_66_1.time_ - var_69_1) / var_69_2

				if arg_66_1.var_.characterEffect1148ui_story and not isNil(var_69_0) then
					arg_66_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_66_1.time_ >= var_69_1 + var_69_2 and arg_66_1.time_ < var_69_1 + var_69_2 + arg_69_0 and not isNil(var_69_0) and arg_66_1.var_.characterEffect1148ui_story then
				arg_66_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_69_4 = arg_66_1.actors_["1084ui_story"]
			local var_69_5 = 0

			if var_69_5 < arg_66_1.time_ and arg_66_1.time_ <= var_69_5 + arg_69_0 and not isNil(var_69_4) and arg_66_1.var_.characterEffect1084ui_story == nil then
				arg_66_1.var_.characterEffect1084ui_story = var_69_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_69_6 = 0.1

			if var_69_5 <= arg_66_1.time_ and arg_66_1.time_ < var_69_5 + var_69_6 and not isNil(var_69_4) then
				local var_69_7 = (arg_66_1.time_ - var_69_5) / var_69_6

				if arg_66_1.var_.characterEffect1084ui_story and not isNil(var_69_4) then
					arg_66_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_66_1.time_ >= var_69_5 + var_69_6 and arg_66_1.time_ < var_69_5 + var_69_6 + arg_69_0 and not isNil(var_69_4) and arg_66_1.var_.characterEffect1084ui_story then
				arg_66_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_69_8 = arg_66_1.bgs_.ST07b.transform
			local var_69_9 = 0

			if var_69_9 < arg_66_1.time_ and arg_66_1.time_ <= var_69_9 + arg_69_0 then
				arg_66_1.var_.moveOldPosST07b = var_69_8.localPosition
			end

			local var_69_10 = 0.001

			if var_69_9 <= arg_66_1.time_ and arg_66_1.time_ < var_69_9 + var_69_10 then
				local var_69_11 = (arg_66_1.time_ - var_69_9) / var_69_10
				local var_69_12 = Vector3.New(0, -100, 10)

				var_69_8.localPosition = Vector3.Lerp(arg_66_1.var_.moveOldPosST07b, var_69_12, var_69_11)
			end

			if arg_66_1.time_ >= var_69_9 + var_69_10 and arg_66_1.time_ < var_69_9 + var_69_10 + arg_69_0 then
				var_69_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_69_13 = "ST08"

			if arg_66_1.bgs_[var_69_13] == nil then
				local var_69_14 = Object.Instantiate(arg_66_1.paintGo_)

				var_69_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_69_13)
				var_69_14.name = var_69_13
				var_69_14.transform.parent = arg_66_1.stage_.transform
				var_69_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_66_1.bgs_[var_69_13] = var_69_14
			end

			local var_69_15 = 0

			if var_69_15 < arg_66_1.time_ and arg_66_1.time_ <= var_69_15 + arg_69_0 then
				local var_69_16 = manager.ui.mainCamera.transform.localPosition
				local var_69_17 = Vector3.New(0, 0, 10) + Vector3.New(var_69_16.x, var_69_16.y, 0)
				local var_69_18 = arg_66_1.bgs_.ST08

				var_69_18.transform.localPosition = var_69_17
				var_69_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_69_19 = var_69_18:GetComponent("SpriteRenderer")

				if var_69_19 and var_69_19.sprite then
					local var_69_20 = (var_69_18.transform.localPosition - var_69_16).z
					local var_69_21 = manager.ui.mainCameraCom_
					local var_69_22 = 2 * var_69_20 * Mathf.Tan(var_69_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_69_23 = var_69_22 * var_69_21.aspect
					local var_69_24 = var_69_19.sprite.bounds.size.x
					local var_69_25 = var_69_19.sprite.bounds.size.y
					local var_69_26 = var_69_23 / var_69_24
					local var_69_27 = var_69_22 / var_69_25
					local var_69_28 = var_69_27 < var_69_26 and var_69_26 or var_69_27

					var_69_18.transform.localScale = Vector3.New(var_69_28, var_69_28, 0)
				end

				for iter_69_0, iter_69_1 in pairs(arg_66_1.bgs_) do
					if iter_69_0 ~= "ST08" then
						iter_69_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_69_29 = 0

			if var_69_29 < arg_66_1.time_ and arg_66_1.time_ <= var_69_29 + arg_69_0 then
				arg_66_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action456")
			end

			local var_69_30 = 0
			local var_69_31 = 0.1

			if var_69_30 < arg_66_1.time_ and arg_66_1.time_ <= var_69_30 + arg_69_0 then
				arg_66_1.talkMaxDuration = 0

				arg_66_1.dialog_:SetActive(true)

				local var_69_32 = LeanTween.value(arg_66_1.dialog_, 0, 1, 0.3)

				var_69_32:setOnUpdate(LuaHelper.FloatAction(function(arg_70_0)
					arg_66_1.dialogCg_.alpha = arg_70_0
				end))
				var_69_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_66_1.dialog_)
					var_69_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_66_1.duration_ = arg_66_1.duration_ + 0.3

				SetActive(arg_66_1.leftNameGo_, false)

				arg_66_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_66_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_66_1:RecordName(arg_66_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_66_1.iconTrs_.gameObject, false)
				arg_66_1.callingController_:SetSelectedState("normal")

				local var_69_33 = arg_66_1:GetWordFromCfg(100)
				local var_69_34 = arg_66_1:FormatText(var_69_33.content)

				arg_66_1.text_.text = var_69_34

				LuaForUtil.ClearLinePrefixSymbol(arg_66_1.text_)

				local var_69_35 = 4
				local var_69_36 = utf8.len(var_69_34)
				local var_69_37 = var_69_35 <= 0 and var_69_31 or var_69_31 * (var_69_36 / var_69_35)

				if var_69_37 > 0 and var_69_31 < var_69_37 then
					arg_66_1.talkMaxDuration = var_69_37
					var_69_30 = var_69_30 + 0.3

					if var_69_37 + var_69_30 > arg_66_1.duration_ then
						arg_66_1.duration_ = var_69_37 + var_69_30
					end
				end

				arg_66_1.text_.text = var_69_34
				arg_66_1.typewritter.percent = 0

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(false)
				arg_66_1:RecordContent(arg_66_1.text_.text)
			end

			local var_69_38 = var_69_30 + 0.3
			local var_69_39 = math.max(var_69_31, arg_66_1.talkMaxDuration)

			if var_69_38 <= arg_66_1.time_ and arg_66_1.time_ < var_69_38 + var_69_39 then
				arg_66_1.typewritter.percent = (arg_66_1.time_ - var_69_38) / var_69_39

				arg_66_1.typewritter:SetDirty()
			end

			if arg_66_1.time_ >= var_69_38 + var_69_39 and arg_66_1.time_ < var_69_38 + var_69_39 + arg_69_0 then
				arg_66_1.typewritter.percent = 1

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(true)
			end
		end
	end,
	Play112 = function(arg_72_0, arg_72_1)
		arg_72_1.time_ = 0
		arg_72_1.frameCnt_ = 0
		arg_72_1.state_ = "playing"
		arg_72_1.curTalkId_ = 112
		arg_72_1.duration_ = 6.93

		SetActive(arg_72_1.tipsGo_, false)

		function arg_72_1.onSingleLineFinish_()
			arg_72_1.onSingleLineUpdate_ = nil
			arg_72_1.onSingleLineFinish_ = nil
			arg_72_1.state_ = "waiting"
			arg_72_1.auto_ = false
		end

		function arg_72_1.playNext_(arg_74_0)
			arg_72_1.onStoryFinished_()
		end

		function arg_72_1.onSingleLineUpdate_(arg_75_0)
			local var_75_0 = arg_72_1.actors_["1148ui_story"]
			local var_75_1 = 0

			if var_75_1 < arg_72_1.time_ and arg_72_1.time_ <= var_75_1 + arg_75_0 and not isNil(var_75_0) and arg_72_1.var_.characterEffect1148ui_story == nil then
				arg_72_1.var_.characterEffect1148ui_story = var_75_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_75_2 = 0.1

			if var_75_1 <= arg_72_1.time_ and arg_72_1.time_ < var_75_1 + var_75_2 and not isNil(var_75_0) then
				local var_75_3 = (arg_72_1.time_ - var_75_1) / var_75_2

				if arg_72_1.var_.characterEffect1148ui_story and not isNil(var_75_0) then
					arg_72_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_72_1.time_ >= var_75_1 + var_75_2 and arg_72_1.time_ < var_75_1 + var_75_2 + arg_75_0 and not isNil(var_75_0) and arg_72_1.var_.characterEffect1148ui_story then
				arg_72_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_75_4 = arg_72_1.actors_["1084ui_story"]
			local var_75_5 = 0

			if var_75_5 < arg_72_1.time_ and arg_72_1.time_ <= var_75_5 + arg_75_0 and not isNil(var_75_4) and arg_72_1.var_.characterEffect1084ui_story == nil then
				arg_72_1.var_.characterEffect1084ui_story = var_75_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_75_6 = 0.1

			if var_75_5 <= arg_72_1.time_ and arg_72_1.time_ < var_75_5 + var_75_6 and not isNil(var_75_4) then
				local var_75_7 = (arg_72_1.time_ - var_75_5) / var_75_6

				if arg_72_1.var_.characterEffect1084ui_story and not isNil(var_75_4) then
					arg_72_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_72_1.time_ >= var_75_5 + var_75_6 and arg_72_1.time_ < var_75_5 + var_75_6 + arg_75_0 and not isNil(var_75_4) and arg_72_1.var_.characterEffect1084ui_story then
				arg_72_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_75_8 = arg_72_1.bgs_.ST08.transform
			local var_75_9 = 0

			if var_75_9 < arg_72_1.time_ and arg_72_1.time_ <= var_75_9 + arg_75_0 then
				arg_72_1.var_.moveOldPosST08 = var_75_8.localPosition
			end

			local var_75_10 = 0.001

			if var_75_9 <= arg_72_1.time_ and arg_72_1.time_ < var_75_9 + var_75_10 then
				local var_75_11 = (arg_72_1.time_ - var_75_9) / var_75_10
				local var_75_12 = Vector3.New(0, -100, 10)

				var_75_8.localPosition = Vector3.Lerp(arg_72_1.var_.moveOldPosST08, var_75_12, var_75_11)
			end

			if arg_72_1.time_ >= var_75_9 + var_75_10 and arg_72_1.time_ < var_75_9 + var_75_10 + arg_75_0 then
				var_75_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_75_13 = "ST12"

			if arg_72_1.bgs_[var_75_13] == nil then
				local var_75_14 = Object.Instantiate(arg_72_1.paintGo_)

				var_75_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_75_13)
				var_75_14.name = var_75_13
				var_75_14.transform.parent = arg_72_1.stage_.transform
				var_75_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_72_1.bgs_[var_75_13] = var_75_14
			end

			local var_75_15 = 0

			if var_75_15 < arg_72_1.time_ and arg_72_1.time_ <= var_75_15 + arg_75_0 then
				local var_75_16 = manager.ui.mainCamera.transform.localPosition
				local var_75_17 = Vector3.New(0, 0, 10) + Vector3.New(var_75_16.x, var_75_16.y, 0)
				local var_75_18 = arg_72_1.bgs_.ST12

				var_75_18.transform.localPosition = var_75_17
				var_75_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_75_19 = var_75_18:GetComponent("SpriteRenderer")

				if var_75_19 and var_75_19.sprite then
					local var_75_20 = (var_75_18.transform.localPosition - var_75_16).z
					local var_75_21 = manager.ui.mainCameraCom_
					local var_75_22 = 2 * var_75_20 * Mathf.Tan(var_75_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_75_23 = var_75_22 * var_75_21.aspect
					local var_75_24 = var_75_19.sprite.bounds.size.x
					local var_75_25 = var_75_19.sprite.bounds.size.y
					local var_75_26 = var_75_23 / var_75_24
					local var_75_27 = var_75_22 / var_75_25
					local var_75_28 = var_75_27 < var_75_26 and var_75_26 or var_75_27

					var_75_18.transform.localScale = Vector3.New(var_75_28, var_75_28, 0)
				end

				for iter_75_0, iter_75_1 in pairs(arg_72_1.bgs_) do
					if iter_75_0 ~= "ST12" then
						iter_75_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_75_29 = 0

			if var_75_29 < arg_72_1.time_ and arg_72_1.time_ <= var_75_29 + arg_75_0 then
				arg_72_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action456")
			end

			local var_75_30 = 0
			local var_75_31 = 0.1

			if var_75_30 < arg_72_1.time_ and arg_72_1.time_ <= var_75_30 + arg_75_0 then
				arg_72_1.talkMaxDuration = 0

				arg_72_1.dialog_:SetActive(true)

				local var_75_32 = LeanTween.value(arg_72_1.dialog_, 0, 1, 0.3)

				var_75_32:setOnUpdate(LuaHelper.FloatAction(function(arg_76_0)
					arg_72_1.dialogCg_.alpha = arg_76_0
				end))
				var_75_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_72_1.dialog_)
					var_75_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_72_1.duration_ = arg_72_1.duration_ + 0.3

				SetActive(arg_72_1.leftNameGo_, false)

				arg_72_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_72_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_72_1:RecordName(arg_72_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_72_1.iconTrs_.gameObject, false)
				arg_72_1.callingController_:SetSelectedState("normal")

				local var_75_33 = arg_72_1:GetWordFromCfg(100)
				local var_75_34 = arg_72_1:FormatText(var_75_33.content)

				arg_72_1.text_.text = var_75_34

				LuaForUtil.ClearLinePrefixSymbol(arg_72_1.text_)

				local var_75_35 = 4
				local var_75_36 = utf8.len(var_75_34)
				local var_75_37 = var_75_35 <= 0 and var_75_31 or var_75_31 * (var_75_36 / var_75_35)

				if var_75_37 > 0 and var_75_31 < var_75_37 then
					arg_72_1.talkMaxDuration = var_75_37
					var_75_30 = var_75_30 + 0.3

					if var_75_37 + var_75_30 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_37 + var_75_30
					end
				end

				arg_72_1.text_.text = var_75_34
				arg_72_1.typewritter.percent = 0

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(false)
				arg_72_1:RecordContent(arg_72_1.text_.text)
			end

			local var_75_38 = var_75_30 + 0.3
			local var_75_39 = math.max(var_75_31, arg_72_1.talkMaxDuration)

			if var_75_38 <= arg_72_1.time_ and arg_72_1.time_ < var_75_38 + var_75_39 then
				arg_72_1.typewritter.percent = (arg_72_1.time_ - var_75_38) / var_75_39

				arg_72_1.typewritter:SetDirty()
			end

			if arg_72_1.time_ >= var_75_38 + var_75_39 and arg_72_1.time_ < var_75_38 + var_75_39 + arg_75_0 then
				arg_72_1.typewritter.percent = 1

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST05a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST08",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12"
	},
	voices = {}
}
