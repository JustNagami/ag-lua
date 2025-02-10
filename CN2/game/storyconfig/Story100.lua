return {
	Play100 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 100
		arg_1_1.duration_ = 10

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
			local var_4_1 = 7.96666666666667
			local var_4_2 = "B13f"

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.timestampController_:SetSelectedState("show")
				arg_1_1.timestampAni_:Play("in")

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
				AnimatorTools.PlayAnimationWithCallback(arg_1_1.timestampAni_, "out", function()
					arg_1_1.timestampController_:SetSelectedState("hide")
				end)
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

			local var_4_23 = 6.23333333333333

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_24 = 1.73333333333333

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

			local var_4_28 = 7.96666666666667

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_29 = 2.03333333333333

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
	Play101 = function(arg_6_0, arg_6_1)
		arg_6_1.time_ = 0
		arg_6_1.frameCnt_ = 0
		arg_6_1.state_ = "playing"
		arg_6_1.curTalkId_ = 101
		arg_6_1.duration_ = 11.27

		SetActive(arg_6_1.tipsGo_, false)

		function arg_6_1.onSingleLineFinish_()
			arg_6_1.onSingleLineUpdate_ = nil
			arg_6_1.onSingleLineFinish_ = nil
			arg_6_1.state_ = "waiting"
		end

		function arg_6_1.playNext_(arg_8_0)
			if arg_8_0 == 1 then
				arg_6_0:Play102(arg_6_1)
			end
		end

		function arg_6_1.onSingleLineUpdate_(arg_9_0)
			local var_9_0 = "1148ui_story"

			if arg_6_1.actors_[var_9_0] == nil then
				local var_9_1 = Asset.Load("Char/" .. "1148ui_story")

				if not isNil(var_9_1) then
					local var_9_2 = Object.Instantiate(Asset.Load("Char/" .. "1148ui_story"), arg_6_1.stage_.transform)

					var_9_2.name = var_9_0
					var_9_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_6_1.actors_[var_9_0] = var_9_2

					local var_9_3 = var_9_2:GetComponentInChildren(typeof(CharacterEffect))

					var_9_3.enabled = true

					local var_9_4 = GameObjectTools.GetOrAddComponent(var_9_2, typeof(DynamicBoneHelper))

					if var_9_4 then
						var_9_4:EnableDynamicBone(false)
					end

					arg_6_1:ShowWeapon(var_9_3.transform, false)

					arg_6_1.var_[var_9_0 .. "Animator"] = var_9_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_6_1.var_[var_9_0 .. "Animator"].applyRootMotion = true
					arg_6_1.var_[var_9_0 .. "LipSync"] = var_9_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_9_5 = arg_6_1.actors_["1148ui_story"]
			local var_9_6 = 0

			if var_9_6 < arg_6_1.time_ and arg_6_1.time_ <= var_9_6 + arg_9_0 and not isNil(var_9_5) and arg_6_1.var_.characterEffect1148ui_story == nil then
				arg_6_1.var_.characterEffect1148ui_story = var_9_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_9_7 = 0.1

			if var_9_6 <= arg_6_1.time_ and arg_6_1.time_ < var_9_6 + var_9_7 and not isNil(var_9_5) then
				local var_9_8 = (arg_6_1.time_ - var_9_6) / var_9_7

				if arg_6_1.var_.characterEffect1148ui_story and not isNil(var_9_5) then
					arg_6_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_6_1.time_ >= var_9_6 + var_9_7 and arg_6_1.time_ < var_9_6 + var_9_7 + arg_9_0 and not isNil(var_9_5) and arg_6_1.var_.characterEffect1148ui_story then
				arg_6_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_9_9 = "1084ui_story"

			if arg_6_1.actors_[var_9_9] == nil then
				local var_9_10 = Asset.Load("Char/" .. "1084ui_story")

				if not isNil(var_9_10) then
					local var_9_11 = Object.Instantiate(Asset.Load("Char/" .. "1084ui_story"), arg_6_1.stage_.transform)

					var_9_11.name = var_9_9
					var_9_11.transform.localPosition = Vector3.New(0, 100, 0)
					arg_6_1.actors_[var_9_9] = var_9_11

					local var_9_12 = var_9_11:GetComponentInChildren(typeof(CharacterEffect))

					var_9_12.enabled = true

					local var_9_13 = GameObjectTools.GetOrAddComponent(var_9_11, typeof(DynamicBoneHelper))

					if var_9_13 then
						var_9_13:EnableDynamicBone(false)
					end

					arg_6_1:ShowWeapon(var_9_12.transform, false)

					arg_6_1.var_[var_9_9 .. "Animator"] = var_9_12.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_6_1.var_[var_9_9 .. "Animator"].applyRootMotion = true
					arg_6_1.var_[var_9_9 .. "LipSync"] = var_9_12.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_9_14 = arg_6_1.actors_["1084ui_story"]
			local var_9_15 = 0

			if var_9_15 < arg_6_1.time_ and arg_6_1.time_ <= var_9_15 + arg_9_0 and not isNil(var_9_14) and arg_6_1.var_.characterEffect1084ui_story == nil then
				arg_6_1.var_.characterEffect1084ui_story = var_9_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_9_16 = 0.1

			if var_9_15 <= arg_6_1.time_ and arg_6_1.time_ < var_9_15 + var_9_16 and not isNil(var_9_14) then
				local var_9_17 = (arg_6_1.time_ - var_9_15) / var_9_16

				if arg_6_1.var_.characterEffect1084ui_story and not isNil(var_9_14) then
					arg_6_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_6_1.time_ >= var_9_15 + var_9_16 and arg_6_1.time_ < var_9_15 + var_9_16 + arg_9_0 and not isNil(var_9_14) and arg_6_1.var_.characterEffect1084ui_story then
				arg_6_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_9_18 = 0

			if var_9_18 < arg_6_1.time_ and arg_6_1.time_ <= var_9_18 + arg_9_0 then
				arg_6_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4139")
			end

			local var_9_19 = manager.ui.mainCamera.transform
			local var_9_20 = 0

			if var_9_20 < arg_6_1.time_ and arg_6_1.time_ <= var_9_20 + arg_9_0 then
				local var_9_21 = arg_6_1.var_.effectMainCamera1048镜头前特效

				if not var_9_21 then
					var_9_21 = Object.Instantiate(Asset.Load("Effect/Hero/1048/fx_1048_ui_001"))
					var_9_21.name = "1048镜头前特效"
					arg_6_1.var_.effectMainCamera1048镜头前特效 = var_9_21
				end

				local var_9_22 = var_9_19:Find("")

				if var_9_22 then
					var_9_21.transform.parent = var_9_22
				else
					var_9_21.transform.parent = var_9_19
				end

				var_9_21.transform.localPosition = Vector3.New(0, 0, 0)
				var_9_21.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_9_23 = "10101ui_story"

			if arg_6_1.actors_[var_9_23] == nil then
				local var_9_24 = Asset.Load("Char/" .. "10101ui_story")

				if not isNil(var_9_24) then
					local var_9_25 = Object.Instantiate(Asset.Load("Char/" .. "10101ui_story"), arg_6_1.stage_.transform)

					var_9_25.name = var_9_23
					var_9_25.transform.localPosition = Vector3.New(0, 100, 0)
					arg_6_1.actors_[var_9_23] = var_9_25

					local var_9_26 = var_9_25:GetComponentInChildren(typeof(CharacterEffect))

					var_9_26.enabled = true

					local var_9_27 = GameObjectTools.GetOrAddComponent(var_9_25, typeof(DynamicBoneHelper))

					if var_9_27 then
						var_9_27:EnableDynamicBone(false)
					end

					arg_6_1:ShowWeapon(var_9_26.transform, false)

					arg_6_1.var_[var_9_23 .. "Animator"] = var_9_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_6_1.var_[var_9_23 .. "Animator"].applyRootMotion = true
					arg_6_1.var_[var_9_23 .. "LipSync"] = var_9_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_9_28 = 0

			if var_9_28 < arg_6_1.time_ and arg_6_1.time_ <= var_9_28 + arg_9_0 then
				arg_6_1:PlayTimeline("10101ui_story", "StoryTimeline/CharAction/public_expression/expr_wuganC", "EmotionTimelineAnimator")
			end

			local var_9_29 = 6.26666666666667
			local var_9_30 = 5
			local var_9_31 = "A00000"

			if var_9_29 < arg_6_1.time_ and arg_6_1.time_ <= var_9_29 + arg_9_0 then
				arg_6_1.timestampController_:SetSelectedState("show")
				arg_6_1.timestampAni_:Play("in")

				arg_6_1.timeTicketbgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_9_31)

				arg_6_1.timestampColorController_:SetSelectedState("cold")

				local var_9_32 = arg_6_1:GetWordFromCfg(100011012)
				local var_9_33 = arg_6_1:FormatText(var_9_32.content)

				arg_6_1.text_timeText_.text = var_9_33

				LuaForUtil.ClearLinePrefixSymbol(arg_6_1.text_timeText_)

				local var_9_34 = arg_6_1:GetWordFromCfg(101)
				local var_9_35 = arg_6_1:FormatText(var_9_34.content)

				arg_6_1.text_siteText_.text = var_9_35

				LuaForUtil.ClearLinePrefixSymbol(arg_6_1.text_siteText_)
			end

			if arg_6_1.time_ >= var_9_29 + var_9_30 and arg_6_1.time_ < var_9_29 + var_9_30 + arg_9_0 then
				AnimatorTools.PlayAnimationWithCallback(arg_6_1.timestampAni_, "out", function()
					arg_6_1.timestampController_:SetSelectedState("hide")
				end)
			end

			local var_9_36 = manager.ui.mainCamera.transform
			local var_9_37 = 0

			if var_9_37 < arg_6_1.time_ and arg_6_1.time_ <= var_9_37 + arg_9_0 then
				local var_9_38 = arg_6_1.var_.effectxueye3

				if not var_9_38 then
					var_9_38 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_blood_in_1"))
					var_9_38.name = "xueye3"
					arg_6_1.var_.effectxueye3 = var_9_38
				end

				local var_9_39 = var_9_36:Find("")

				if var_9_39 then
					var_9_38.transform.parent = var_9_39
				else
					var_9_38.transform.parent = var_9_36
				end

				var_9_38.transform.localPosition = Vector3.New(0, 0, 0)
				var_9_38.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_9_40 = manager.ui.mainCamera.transform
			local var_9_41 = 0

			if var_9_41 < arg_6_1.time_ and arg_6_1.time_ <= var_9_41 + arg_9_0 then
				local var_9_42 = arg_6_1.var_.effectxueye4

				if not var_9_42 then
					var_9_42 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_blood_in_ui_1"))
					var_9_42.name = "xueye4"
					arg_6_1.var_.effectxueye4 = var_9_42
				end

				local var_9_43 = var_9_40:Find("")

				if var_9_43 then
					var_9_42.transform.parent = var_9_43
				else
					var_9_42.transform.parent = var_9_40
				end

				var_9_42.transform.localPosition = Vector3.New(0, 0, 0)
				var_9_42.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_9_44 = manager.ui.mainCameraCom_
				local var_9_45 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_9_44.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_9_46 = var_9_42.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_9_47 = 15
				local var_9_48 = 2 * var_9_47 * Mathf.Tan(var_9_44.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_9_44.aspect
				local var_9_49 = 1
				local var_9_50 = 1.7777777777777777

				if var_9_50 < var_9_44.aspect then
					var_9_49 = var_9_48 / (2 * var_9_47 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_9_50)
				end

				for iter_9_0, iter_9_1 in ipairs(var_9_46) do
					local var_9_51 = iter_9_1.transform.localScale

					iter_9_1.transform.localScale = Vector3.New(var_9_51.x / var_9_45 * var_9_49, var_9_51.y / var_9_45, var_9_51.z)
				end
			end

			local var_9_52 = manager.ui.mainCamera.transform
			local var_9_53 = 0

			if var_9_53 < arg_6_1.time_ and arg_6_1.time_ <= var_9_53 + arg_9_0 then
				local var_9_54 = arg_6_1.var_.effectxueye1

				if var_9_54 then
					Object.Destroy(var_9_54)

					arg_6_1.var_.effectxueye1 = nil
				end
			end

			local var_9_55 = manager.ui.mainCamera.transform
			local var_9_56 = 0

			if var_9_56 < arg_6_1.time_ and arg_6_1.time_ <= var_9_56 + arg_9_0 then
				local var_9_57 = arg_6_1.var_.effectxueye2

				if var_9_57 then
					Object.Destroy(var_9_57)

					arg_6_1.var_.effectxueye2 = nil
				end
			end

			local var_9_58 = 0
			local var_9_59 = 0.1

			if var_9_58 < arg_6_1.time_ and arg_6_1.time_ <= var_9_58 + arg_9_0 then
				arg_6_1.talkMaxDuration = 0

				arg_6_1.dialog_:SetActive(true)

				local var_9_60 = LeanTween.value(arg_6_1.dialog_, 0, 1, 0.3)

				var_9_60:setOnUpdate(LuaHelper.FloatAction(function(arg_11_0)
					arg_6_1.dialogCg_.alpha = arg_11_0
				end))
				var_9_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_6_1.dialog_)
					var_9_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_6_1.duration_ = arg_6_1.duration_ + 0.3

				SetActive(arg_6_1.leftNameGo_, false)

				arg_6_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_6_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_6_1:RecordName(arg_6_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_6_1.iconTrs_.gameObject, false)
				arg_6_1.callingController_:SetSelectedState("normal")

				local var_9_61 = arg_6_1:GetWordFromCfg(100)
				local var_9_62 = arg_6_1:FormatText(var_9_61.content)

				arg_6_1.text_.text = var_9_62

				LuaForUtil.ClearLinePrefixSymbol(arg_6_1.text_)

				local var_9_63 = 4
				local var_9_64 = utf8.len(var_9_62)
				local var_9_65 = var_9_63 <= 0 and var_9_59 or var_9_59 * (var_9_64 / var_9_63)

				if var_9_65 > 0 and var_9_59 < var_9_65 then
					arg_6_1.talkMaxDuration = var_9_65
					var_9_58 = var_9_58 + 0.3

					if var_9_65 + var_9_58 > arg_6_1.duration_ then
						arg_6_1.duration_ = var_9_65 + var_9_58
					end
				end

				arg_6_1.text_.text = var_9_62
				arg_6_1.typewritter.percent = 0

				arg_6_1.typewritter:SetDirty()
				arg_6_1:ShowNextGo(false)
				arg_6_1:RecordContent(arg_6_1.text_.text)
			end

			local var_9_66 = var_9_58 + 0.3
			local var_9_67 = math.max(var_9_59, arg_6_1.talkMaxDuration)

			if var_9_66 <= arg_6_1.time_ and arg_6_1.time_ < var_9_66 + var_9_67 then
				arg_6_1.typewritter.percent = (arg_6_1.time_ - var_9_66) / var_9_67

				arg_6_1.typewritter:SetDirty()
			end

			if arg_6_1.time_ >= var_9_66 + var_9_67 and arg_6_1.time_ < var_9_66 + var_9_67 + arg_9_0 then
				arg_6_1.typewritter.percent = 1

				arg_6_1.typewritter:SetDirty()
				arg_6_1:ShowNextGo(true)
			end
		end
	end,
	Play102 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 102
		arg_13_1.duration_ = 2

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play103(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1148ui_story"]
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 and not isNil(var_16_0) and arg_13_1.var_.characterEffect1148ui_story == nil then
				arg_13_1.var_.characterEffect1148ui_story = var_16_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_2 = 0.1

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 and not isNil(var_16_0) then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2

				if arg_13_1.var_.characterEffect1148ui_story and not isNil(var_16_0) then
					arg_13_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 and not isNil(var_16_0) and arg_13_1.var_.characterEffect1148ui_story then
				arg_13_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_16_4 = arg_13_1.actors_["1084ui_story"]
			local var_16_5 = 0

			if var_16_5 < arg_13_1.time_ and arg_13_1.time_ <= var_16_5 + arg_16_0 and not isNil(var_16_4) and arg_13_1.var_.characterEffect1084ui_story == nil then
				arg_13_1.var_.characterEffect1084ui_story = var_16_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_6 = 0.1

			if var_16_5 <= arg_13_1.time_ and arg_13_1.time_ < var_16_5 + var_16_6 and not isNil(var_16_4) then
				local var_16_7 = (arg_13_1.time_ - var_16_5) / var_16_6

				if arg_13_1.var_.characterEffect1084ui_story and not isNil(var_16_4) then
					arg_13_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_5 + var_16_6 and arg_13_1.time_ < var_16_5 + var_16_6 + arg_16_0 and not isNil(var_16_4) and arg_13_1.var_.characterEffect1084ui_story then
				arg_13_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_16_8 = 0

			if var_16_8 < arg_13_1.time_ and arg_13_1.time_ <= var_16_8 + arg_16_0 then
				local var_16_9 = manager.ui.mainCamera.transform.localPosition
				local var_16_10 = Vector3.New(0, 0, 10) + Vector3.New(var_16_9.x, var_16_9.y, 0)
				local var_16_11 = arg_13_1.bgs_.ST03

				var_16_11.transform.localPosition = var_16_10
				var_16_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_16_12 = var_16_11:GetComponent("SpriteRenderer")

				if var_16_12 and var_16_12.sprite then
					local var_16_13 = (var_16_11.transform.localPosition - var_16_9).z
					local var_16_14 = manager.ui.mainCameraCom_
					local var_16_15 = 2 * var_16_13 * Mathf.Tan(var_16_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_16_16 = var_16_15 * var_16_14.aspect
					local var_16_17 = var_16_12.sprite.bounds.size.x
					local var_16_18 = var_16_12.sprite.bounds.size.y
					local var_16_19 = var_16_16 / var_16_17
					local var_16_20 = var_16_15 / var_16_18
					local var_16_21 = var_16_20 < var_16_19 and var_16_19 or var_16_20

					var_16_11.transform.localScale = Vector3.New(var_16_21, var_16_21, 0)
				end

				for iter_16_0, iter_16_1 in pairs(arg_13_1.bgs_) do
					if iter_16_0 ~= "ST03" then
						iter_16_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_16_22 = 0

			if var_16_22 < arg_13_1.time_ and arg_13_1.time_ <= var_16_22 + arg_16_0 then
				arg_13_1.mask_.enabled = true
				arg_13_1.mask_.raycastTarget = false

				arg_13_1:SetGaussion(false)
			end

			local var_16_23 = 0.5

			if var_16_22 <= arg_13_1.time_ and arg_13_1.time_ < var_16_22 + var_16_23 then
				local var_16_24 = (arg_13_1.time_ - var_16_22) / var_16_23
				local var_16_25 = Color.New(1, 1, 1)

				var_16_25.a = Mathf.Lerp(0, 1, var_16_24)
				arg_13_1.mask_.color = var_16_25
			end

			if arg_13_1.time_ >= var_16_22 + var_16_23 and arg_13_1.time_ < var_16_22 + var_16_23 + arg_16_0 then
				local var_16_26 = Color.New(1, 1, 1)

				var_16_26.a = 1
				arg_13_1.mask_.color = var_16_26
			end

			local var_16_27 = 0.5

			if var_16_27 < arg_13_1.time_ and arg_13_1.time_ <= var_16_27 + arg_16_0 then
				arg_13_1.mask_.enabled = true
				arg_13_1.mask_.raycastTarget = false

				arg_13_1:SetGaussion(false)
			end

			local var_16_28 = 0.5

			if var_16_27 <= arg_13_1.time_ and arg_13_1.time_ < var_16_27 + var_16_28 then
				local var_16_29 = (arg_13_1.time_ - var_16_27) / var_16_28
				local var_16_30 = Color.New(1, 1, 1)

				var_16_30.a = Mathf.Lerp(1, 0, var_16_29)
				arg_13_1.mask_.color = var_16_30
			end

			if arg_13_1.time_ >= var_16_27 + var_16_28 and arg_13_1.time_ < var_16_27 + var_16_28 + arg_16_0 then
				local var_16_31 = Color.New(1, 1, 1)
				local var_16_32 = 0

				arg_13_1.mask_.enabled = false
				var_16_31.a = var_16_32
				arg_13_1.mask_.color = var_16_31
			end

			local var_16_33 = manager.ui.mainCamera.transform
			local var_16_34 = 0

			if var_16_34 < arg_13_1.time_ and arg_13_1.time_ <= var_16_34 + arg_16_0 then
				local var_16_35 = arg_13_1.var_.effectxiayu1

				if not var_16_35 then
					var_16_35 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavy"))
					var_16_35.name = "xiayu1"
					arg_13_1.var_.effectxiayu1 = var_16_35
				end

				local var_16_36 = var_16_33:Find("")

				if var_16_36 then
					var_16_35.transform.parent = var_16_36
				else
					var_16_35.transform.parent = var_16_33
				end

				var_16_35.transform.localPosition = Vector3.New(0, 0, 0)
				var_16_35.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_16_37 = manager.ui.mainCamera.transform
			local var_16_38 = 0

			if var_16_38 < arg_13_1.time_ and arg_13_1.time_ <= var_16_38 + arg_16_0 then
				local var_16_39 = arg_13_1.var_.effectxiayu2

				if not var_16_39 then
					var_16_39 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavy_ui"))
					var_16_39.name = "xiayu2"
					arg_13_1.var_.effectxiayu2 = var_16_39
				end

				local var_16_40 = var_16_37:Find("")

				if var_16_40 then
					var_16_39.transform.parent = var_16_40
				else
					var_16_39.transform.parent = var_16_37
				end

				var_16_39.transform.localPosition = Vector3.New(0, 0, 0)
				var_16_39.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_16_41 = manager.ui.mainCameraCom_
				local var_16_42 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_16_41.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_16_43 = var_16_39.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_16_44 = 15
				local var_16_45 = 2 * var_16_44 * Mathf.Tan(var_16_41.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_16_41.aspect
				local var_16_46 = 1
				local var_16_47 = 1.7777777777777777

				if var_16_47 < var_16_41.aspect then
					var_16_46 = var_16_45 / (2 * var_16_44 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_16_47)
				end

				for iter_16_2, iter_16_3 in ipairs(var_16_43) do
					local var_16_48 = iter_16_3.transform.localScale

					iter_16_3.transform.localScale = Vector3.New(var_16_48.x / var_16_42 * var_16_46, var_16_48.y / var_16_42, var_16_48.z)
				end
			end

			local var_16_49 = 0
			local var_16_50 = 0.1

			if var_16_49 < arg_13_1.time_ and arg_13_1.time_ <= var_16_49 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0

				arg_13_1.dialog_:SetActive(true)

				local var_16_51 = LeanTween.value(arg_13_1.dialog_, 0, 1, 0.3)

				var_16_51:setOnUpdate(LuaHelper.FloatAction(function(arg_17_0)
					arg_13_1.dialogCg_.alpha = arg_17_0
				end))
				var_16_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_13_1.dialog_)
					var_16_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_13_1.duration_ = arg_13_1.duration_ + 0.3

				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_52 = arg_13_1:GetWordFromCfg(100)
				local var_16_53 = arg_13_1:FormatText(var_16_52.content)

				arg_13_1.text_.text = var_16_53

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_54 = 4
				local var_16_55 = utf8.len(var_16_53)
				local var_16_56 = var_16_54 <= 0 and var_16_50 or var_16_50 * (var_16_55 / var_16_54)

				if var_16_56 > 0 and var_16_50 < var_16_56 then
					arg_13_1.talkMaxDuration = var_16_56
					var_16_49 = var_16_49 + 0.3

					if var_16_56 + var_16_49 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_56 + var_16_49
					end
				end

				arg_13_1.text_.text = var_16_53
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_57 = var_16_49 + 0.3
			local var_16_58 = math.max(var_16_50, arg_13_1.talkMaxDuration)

			if var_16_57 <= arg_13_1.time_ and arg_13_1.time_ < var_16_57 + var_16_58 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_57) / var_16_58

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_57 + var_16_58 and arg_13_1.time_ < var_16_57 + var_16_58 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play103 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103
		arg_19_1.duration_ = 2

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play104(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1148ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and not isNil(var_22_0) and arg_19_1.var_.characterEffect1148ui_story == nil then
				arg_19_1.var_.characterEffect1148ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 and not isNil(var_22_0) then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1148ui_story and not isNil(var_22_0) then
					arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and not isNil(var_22_0) and arg_19_1.var_.characterEffect1148ui_story then
				arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1084ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and not isNil(var_22_4) and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 and not isNil(var_22_4) then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1084ui_story and not isNil(var_22_4) then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and not isNil(var_22_4) and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_8 = "ST03a"

			if arg_19_1.bgs_[var_22_8] == nil then
				local var_22_9 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_8)
				var_22_9.name = var_22_8
				var_22_9.transform.parent = arg_19_1.stage_.transform
				var_22_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_8] = var_22_9
			end

			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				local var_22_11 = manager.ui.mainCamera.transform.localPosition
				local var_22_12 = Vector3.New(0, 0, 10) + Vector3.New(var_22_11.x, var_22_11.y, 0)
				local var_22_13 = arg_19_1.bgs_.ST03a

				var_22_13.transform.localPosition = var_22_12
				var_22_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_14 = var_22_13:GetComponent("SpriteRenderer")

				if var_22_14 and var_22_14.sprite then
					local var_22_15 = (var_22_13.transform.localPosition - var_22_11).z
					local var_22_16 = manager.ui.mainCameraCom_
					local var_22_17 = 2 * var_22_15 * Mathf.Tan(var_22_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_18 = var_22_17 * var_22_16.aspect
					local var_22_19 = var_22_14.sprite.bounds.size.x
					local var_22_20 = var_22_14.sprite.bounds.size.y
					local var_22_21 = var_22_18 / var_22_19
					local var_22_22 = var_22_17 / var_22_20
					local var_22_23 = var_22_22 < var_22_21 and var_22_21 or var_22_22

					var_22_13.transform.localScale = Vector3.New(var_22_23, var_22_23, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "ST03a" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_24 = arg_19_1.bgs_.ST03.transform
			local var_22_25 = 0

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1.var_.moveOldPosST03 = var_22_24.localPosition
			end

			local var_22_26 = 0.001

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_26 then
				local var_22_27 = (arg_19_1.time_ - var_22_25) / var_22_26
				local var_22_28 = Vector3.New(0, -100, 10)

				var_22_24.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPosST03, var_22_28, var_22_27)
			end

			if arg_19_1.time_ >= var_22_25 + var_22_26 and arg_19_1.time_ < var_22_25 + var_22_26 + arg_22_0 then
				var_22_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_22_29 = manager.ui.mainCamera.transform
			local var_22_30 = 0

			if var_22_30 < arg_19_1.time_ and arg_19_1.time_ <= var_22_30 + arg_22_0 then
				local var_22_31 = arg_19_1.var_.effectxiayu2

				if var_22_31 then
					Object.Destroy(var_22_31)

					arg_19_1.var_.effectxiayu2 = nil
				end
			end

			local var_22_32 = manager.ui.mainCamera.transform
			local var_22_33 = 0

			if var_22_33 < arg_19_1.time_ and arg_19_1.time_ <= var_22_33 + arg_22_0 then
				local var_22_34 = arg_19_1.var_.effectxiayu1

				if var_22_34 then
					Object.Destroy(var_22_34)

					arg_19_1.var_.effectxiayu1 = nil
				end
			end

			local var_22_35 = manager.ui.mainCamera.transform
			local var_22_36 = 0

			if var_22_36 < arg_19_1.time_ and arg_19_1.time_ <= var_22_36 + arg_22_0 then
				local var_22_37 = arg_19_1.var_.effectxiayu3

				if not var_22_37 then
					var_22_37 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavymax"))
					var_22_37.name = "xiayu3"
					arg_19_1.var_.effectxiayu3 = var_22_37
				end

				local var_22_38 = var_22_35:Find("")

				if var_22_38 then
					var_22_37.transform.parent = var_22_38
				else
					var_22_37.transform.parent = var_22_35
				end

				var_22_37.transform.localPosition = Vector3.New(0, 0, 0)
				var_22_37.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_22_39 = manager.ui.mainCamera.transform
			local var_22_40 = 0

			if var_22_40 < arg_19_1.time_ and arg_19_1.time_ <= var_22_40 + arg_22_0 then
				local var_22_41 = arg_19_1.var_.effectxiayu4

				if not var_22_41 then
					var_22_41 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavymax_ui"))
					var_22_41.name = "xiayu4"
					arg_19_1.var_.effectxiayu4 = var_22_41
				end

				local var_22_42 = var_22_39:Find("")

				if var_22_42 then
					var_22_41.transform.parent = var_22_42
				else
					var_22_41.transform.parent = var_22_39
				end

				var_22_41.transform.localPosition = Vector3.New(0, 0, 0)
				var_22_41.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_22_43 = manager.ui.mainCameraCom_
				local var_22_44 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_22_43.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_22_45 = var_22_41.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_22_46 = 15
				local var_22_47 = 2 * var_22_46 * Mathf.Tan(var_22_43.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_22_43.aspect
				local var_22_48 = 1
				local var_22_49 = 1.7777777777777777

				if var_22_49 < var_22_43.aspect then
					var_22_48 = var_22_47 / (2 * var_22_46 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_22_49)
				end

				for iter_22_2, iter_22_3 in ipairs(var_22_45) do
					local var_22_50 = iter_22_3.transform.localScale

					iter_22_3.transform.localScale = Vector3.New(var_22_50.x / var_22_44 * var_22_48, var_22_50.y / var_22_44, var_22_50.z)
				end
			end

			local var_22_51 = 0
			local var_22_52 = 0.1

			if var_22_51 < arg_19_1.time_ and arg_19_1.time_ <= var_22_51 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_53 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_53:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_54 = arg_19_1:GetWordFromCfg(100)
				local var_22_55 = arg_19_1:FormatText(var_22_54.content)

				arg_19_1.text_.text = var_22_55

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_56 = 4
				local var_22_57 = utf8.len(var_22_55)
				local var_22_58 = var_22_56 <= 0 and var_22_52 or var_22_52 * (var_22_57 / var_22_56)

				if var_22_58 > 0 and var_22_52 < var_22_58 then
					arg_19_1.talkMaxDuration = var_22_58
					var_22_51 = var_22_51 + 0.3

					if var_22_58 + var_22_51 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_58 + var_22_51
					end
				end

				arg_19_1.text_.text = var_22_55
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_59 = var_22_51 + 0.3
			local var_22_60 = math.max(var_22_52, arg_19_1.talkMaxDuration)

			if var_22_59 <= arg_19_1.time_ and arg_19_1.time_ < var_22_59 + var_22_60 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_59) / var_22_60

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_59 + var_22_60 and arg_19_1.time_ < var_22_59 + var_22_60 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 104
		arg_25_1.duration_ = 2

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play105(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1148ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and not isNil(var_28_0) and arg_25_1.var_.characterEffect1148ui_story == nil then
				arg_25_1.var_.characterEffect1148ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.1

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 and not isNil(var_28_0) then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect1148ui_story and not isNil(var_28_0) then
					arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and not isNil(var_28_0) and arg_25_1.var_.characterEffect1148ui_story then
				arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_28_4 = arg_25_1.actors_["1084ui_story"]
			local var_28_5 = 0

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 and not isNil(var_28_4) and arg_25_1.var_.characterEffect1084ui_story == nil then
				arg_25_1.var_.characterEffect1084ui_story = var_28_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_6 = 0.1

			if var_28_5 <= arg_25_1.time_ and arg_25_1.time_ < var_28_5 + var_28_6 and not isNil(var_28_4) then
				local var_28_7 = (arg_25_1.time_ - var_28_5) / var_28_6

				if arg_25_1.var_.characterEffect1084ui_story and not isNil(var_28_4) then
					arg_25_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_5 + var_28_6 and arg_25_1.time_ < var_28_5 + var_28_6 + arg_28_0 and not isNil(var_28_4) and arg_25_1.var_.characterEffect1084ui_story then
				arg_25_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_28_8 = "ST05"

			if arg_25_1.bgs_[var_28_8] == nil then
				local var_28_9 = Object.Instantiate(arg_25_1.paintGo_)

				var_28_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_28_8)
				var_28_9.name = var_28_8
				var_28_9.transform.parent = arg_25_1.stage_.transform
				var_28_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_25_1.bgs_[var_28_8] = var_28_9
			end

			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 then
				local var_28_11 = manager.ui.mainCamera.transform.localPosition
				local var_28_12 = Vector3.New(0, 0, 10) + Vector3.New(var_28_11.x, var_28_11.y, 0)
				local var_28_13 = arg_25_1.bgs_.ST05

				var_28_13.transform.localPosition = var_28_12
				var_28_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_28_14 = var_28_13:GetComponent("SpriteRenderer")

				if var_28_14 and var_28_14.sprite then
					local var_28_15 = (var_28_13.transform.localPosition - var_28_11).z
					local var_28_16 = manager.ui.mainCameraCom_
					local var_28_17 = 2 * var_28_15 * Mathf.Tan(var_28_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_28_18 = var_28_17 * var_28_16.aspect
					local var_28_19 = var_28_14.sprite.bounds.size.x
					local var_28_20 = var_28_14.sprite.bounds.size.y
					local var_28_21 = var_28_18 / var_28_19
					local var_28_22 = var_28_17 / var_28_20
					local var_28_23 = var_28_22 < var_28_21 and var_28_21 or var_28_22

					var_28_13.transform.localScale = Vector3.New(var_28_23, var_28_23, 0)
				end

				for iter_28_0, iter_28_1 in pairs(arg_25_1.bgs_) do
					if iter_28_0 ~= "ST05" then
						iter_28_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_28_24 = arg_25_1.bgs_.ST03a.transform
			local var_28_25 = 0

			if var_28_25 < arg_25_1.time_ and arg_25_1.time_ <= var_28_25 + arg_28_0 then
				arg_25_1.var_.moveOldPosST03a = var_28_24.localPosition
			end

			local var_28_26 = 0.001

			if var_28_25 <= arg_25_1.time_ and arg_25_1.time_ < var_28_25 + var_28_26 then
				local var_28_27 = (arg_25_1.time_ - var_28_25) / var_28_26
				local var_28_28 = Vector3.New(0, -100, 10)

				var_28_24.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPosST03a, var_28_28, var_28_27)
			end

			if arg_25_1.time_ >= var_28_25 + var_28_26 and arg_25_1.time_ < var_28_25 + var_28_26 + arg_28_0 then
				var_28_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_28_29 = 0

			if var_28_29 < arg_25_1.time_ and arg_25_1.time_ <= var_28_29 + arg_28_0 then
				arg_25_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action452")
			end

			local var_28_30 = manager.ui.mainCamera.transform
			local var_28_31 = 0

			if var_28_31 < arg_25_1.time_ and arg_25_1.time_ <= var_28_31 + arg_28_0 then
				local var_28_32 = arg_25_1.var_.effectxiayu3

				if var_28_32 then
					Object.Destroy(var_28_32)

					arg_25_1.var_.effectxiayu3 = nil
				end
			end

			local var_28_33 = manager.ui.mainCamera.transform
			local var_28_34 = 0

			if var_28_34 < arg_25_1.time_ and arg_25_1.time_ <= var_28_34 + arg_28_0 then
				local var_28_35 = arg_25_1.var_.effectxiayu4

				if var_28_35 then
					Object.Destroy(var_28_35)

					arg_25_1.var_.effectxiayu4 = nil
				end
			end

			local var_28_36 = manager.ui.mainCamera.transform
			local var_28_37 = 0

			if var_28_37 < arg_25_1.time_ and arg_25_1.time_ <= var_28_37 + arg_28_0 then
				local var_28_38 = arg_25_1.var_.effectxiayu5

				if not var_28_38 then
					var_28_38 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_light"))
					var_28_38.name = "xiayu5"
					arg_25_1.var_.effectxiayu5 = var_28_38
				end

				local var_28_39 = var_28_36:Find("")

				if var_28_39 then
					var_28_38.transform.parent = var_28_39
				else
					var_28_38.transform.parent = var_28_36
				end

				var_28_38.transform.localPosition = Vector3.New(0, 0, 0)
				var_28_38.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_28_40 = manager.ui.mainCamera.transform
			local var_28_41 = 0

			if var_28_41 < arg_25_1.time_ and arg_25_1.time_ <= var_28_41 + arg_28_0 then
				local var_28_42 = arg_25_1.var_.effectxiayu6

				if not var_28_42 then
					var_28_42 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_light_ui"))
					var_28_42.name = "xiayu6"
					arg_25_1.var_.effectxiayu6 = var_28_42
				end

				local var_28_43 = var_28_40:Find("")

				if var_28_43 then
					var_28_42.transform.parent = var_28_43
				else
					var_28_42.transform.parent = var_28_40
				end

				var_28_42.transform.localPosition = Vector3.New(0, 0, 0)
				var_28_42.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_28_44 = manager.ui.mainCameraCom_
				local var_28_45 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_28_44.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_28_46 = var_28_42.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_28_47 = 15
				local var_28_48 = 2 * var_28_47 * Mathf.Tan(var_28_44.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_28_44.aspect
				local var_28_49 = 1
				local var_28_50 = 1.7777777777777777

				if var_28_50 < var_28_44.aspect then
					var_28_49 = var_28_48 / (2 * var_28_47 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_28_50)
				end

				for iter_28_2, iter_28_3 in ipairs(var_28_46) do
					local var_28_51 = iter_28_3.transform.localScale

					iter_28_3.transform.localScale = Vector3.New(var_28_51.x / var_28_45 * var_28_49, var_28_51.y / var_28_45, var_28_51.z)
				end
			end

			local var_28_52 = 0
			local var_28_53 = 0.1

			if var_28_52 < arg_25_1.time_ and arg_25_1.time_ <= var_28_52 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				arg_25_1.dialog_:SetActive(true)

				local var_28_54 = LeanTween.value(arg_25_1.dialog_, 0, 1, 0.3)

				var_28_54:setOnUpdate(LuaHelper.FloatAction(function(arg_29_0)
					arg_25_1.dialogCg_.alpha = arg_29_0
				end))
				var_28_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_25_1.dialog_)
					var_28_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_25_1.duration_ = arg_25_1.duration_ + 0.3

				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_55 = arg_25_1:GetWordFromCfg(100)
				local var_28_56 = arg_25_1:FormatText(var_28_55.content)

				arg_25_1.text_.text = var_28_56

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_57 = 4
				local var_28_58 = utf8.len(var_28_56)
				local var_28_59 = var_28_57 <= 0 and var_28_53 or var_28_53 * (var_28_58 / var_28_57)

				if var_28_59 > 0 and var_28_53 < var_28_59 then
					arg_25_1.talkMaxDuration = var_28_59
					var_28_52 = var_28_52 + 0.3

					if var_28_59 + var_28_52 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_59 + var_28_52
					end
				end

				arg_25_1.text_.text = var_28_56
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_60 = var_28_52 + 0.3
			local var_28_61 = math.max(var_28_53, arg_25_1.talkMaxDuration)

			if var_28_60 <= arg_25_1.time_ and arg_25_1.time_ < var_28_60 + var_28_61 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_60) / var_28_61

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_60 + var_28_61 and arg_25_1.time_ < var_28_60 + var_28_61 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play105 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 105
		arg_31_1.duration_ = 7.37

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play106(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1148ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and not isNil(var_34_0) and arg_31_1.var_.characterEffect1148ui_story == nil then
				arg_31_1.var_.characterEffect1148ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 and not isNil(var_34_0) then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1148ui_story and not isNil(var_34_0) then
					arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and not isNil(var_34_0) and arg_31_1.var_.characterEffect1148ui_story then
				arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1084ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and not isNil(var_34_4) and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 and not isNil(var_34_4) then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1084ui_story and not isNil(var_34_4) then
					arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and not isNil(var_34_4) and arg_31_1.var_.characterEffect1084ui_story then
				arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_34_8 = "ST05a"

			if arg_31_1.bgs_[var_34_8] == nil then
				local var_34_9 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_8)
				var_34_9.name = var_34_8
				var_34_9.transform.parent = arg_31_1.stage_.transform
				var_34_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_8] = var_34_9
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				local var_34_11 = manager.ui.mainCamera.transform.localPosition
				local var_34_12 = Vector3.New(0, 0, 10) + Vector3.New(var_34_11.x, var_34_11.y, 0)
				local var_34_13 = arg_31_1.bgs_.ST05a

				var_34_13.transform.localPosition = var_34_12
				var_34_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_14 = var_34_13:GetComponent("SpriteRenderer")

				if var_34_14 and var_34_14.sprite then
					local var_34_15 = (var_34_13.transform.localPosition - var_34_11).z
					local var_34_16 = manager.ui.mainCameraCom_
					local var_34_17 = 2 * var_34_15 * Mathf.Tan(var_34_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_18 = var_34_17 * var_34_16.aspect
					local var_34_19 = var_34_14.sprite.bounds.size.x
					local var_34_20 = var_34_14.sprite.bounds.size.y
					local var_34_21 = var_34_18 / var_34_19
					local var_34_22 = var_34_17 / var_34_20
					local var_34_23 = var_34_22 < var_34_21 and var_34_21 or var_34_22

					var_34_13.transform.localScale = Vector3.New(var_34_23, var_34_23, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "ST05a" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_24 = arg_31_1.bgs_.ST05.transform
			local var_34_25 = 0

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.var_.moveOldPosST05 = var_34_24.localPosition
			end

			local var_34_26 = 0.001

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_25) / var_34_26
				local var_34_28 = Vector3.New(0, -100, 10)

				var_34_24.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPosST05, var_34_28, var_34_27)
			end

			if arg_31_1.time_ >= var_34_25 + var_34_26 and arg_31_1.time_ < var_34_25 + var_34_26 + arg_34_0 then
				var_34_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action423")
			end

			local var_34_30 = 0
			local var_34_31 = 0.1

			if var_34_30 < arg_31_1.time_ and arg_31_1.time_ <= var_34_30 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_32 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_32:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_33 = arg_31_1:GetWordFromCfg(100)
				local var_34_34 = arg_31_1:FormatText(var_34_33.content)

				arg_31_1.text_.text = var_34_34

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_35 = 4
				local var_34_36 = utf8.len(var_34_34)
				local var_34_37 = var_34_35 <= 0 and var_34_31 or var_34_31 * (var_34_36 / var_34_35)

				if var_34_37 > 0 and var_34_31 < var_34_37 then
					arg_31_1.talkMaxDuration = var_34_37
					var_34_30 = var_34_30 + 0.3

					if var_34_37 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_30
					end
				end

				arg_31_1.text_.text = var_34_34
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_38 = var_34_30 + 0.3
			local var_34_39 = math.max(var_34_31, arg_31_1.talkMaxDuration)

			if var_34_38 <= arg_31_1.time_ and arg_31_1.time_ < var_34_38 + var_34_39 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_38) / var_34_39

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_38 + var_34_39 and arg_31_1.time_ < var_34_38 + var_34_39 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play106 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 106
		arg_37_1.duration_ = 6.83

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play107(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1148ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect1148ui_story == nil then
				arg_37_1.var_.characterEffect1148ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.1

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 and not isNil(var_40_0) then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1148ui_story and not isNil(var_40_0) then
					arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect1148ui_story then
				arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_40_4 = arg_37_1.actors_["1084ui_story"]
			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 and not isNil(var_40_4) and arg_37_1.var_.characterEffect1084ui_story == nil then
				arg_37_1.var_.characterEffect1084ui_story = var_40_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_6 = 0.1

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_6 and not isNil(var_40_4) then
				local var_40_7 = (arg_37_1.time_ - var_40_5) / var_40_6

				if arg_37_1.var_.characterEffect1084ui_story and not isNil(var_40_4) then
					arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_5 + var_40_6 and arg_37_1.time_ < var_40_5 + var_40_6 + arg_40_0 and not isNil(var_40_4) and arg_37_1.var_.characterEffect1084ui_story then
				arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_40_8 = "ST06"

			if arg_37_1.bgs_[var_40_8] == nil then
				local var_40_9 = Object.Instantiate(arg_37_1.paintGo_)

				var_40_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_40_8)
				var_40_9.name = var_40_8
				var_40_9.transform.parent = arg_37_1.stage_.transform
				var_40_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.bgs_[var_40_8] = var_40_9
			end

			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 then
				local var_40_11 = manager.ui.mainCamera.transform.localPosition
				local var_40_12 = Vector3.New(0, 0, 10) + Vector3.New(var_40_11.x, var_40_11.y, 0)
				local var_40_13 = arg_37_1.bgs_.ST06

				var_40_13.transform.localPosition = var_40_12
				var_40_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_40_14 = var_40_13:GetComponent("SpriteRenderer")

				if var_40_14 and var_40_14.sprite then
					local var_40_15 = (var_40_13.transform.localPosition - var_40_11).z
					local var_40_16 = manager.ui.mainCameraCom_
					local var_40_17 = 2 * var_40_15 * Mathf.Tan(var_40_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_40_18 = var_40_17 * var_40_16.aspect
					local var_40_19 = var_40_14.sprite.bounds.size.x
					local var_40_20 = var_40_14.sprite.bounds.size.y
					local var_40_21 = var_40_18 / var_40_19
					local var_40_22 = var_40_17 / var_40_20
					local var_40_23 = var_40_22 < var_40_21 and var_40_21 or var_40_22

					var_40_13.transform.localScale = Vector3.New(var_40_23, var_40_23, 0)
				end

				for iter_40_0, iter_40_1 in pairs(arg_37_1.bgs_) do
					if iter_40_0 ~= "ST06" then
						iter_40_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_40_24 = arg_37_1.bgs_.ST05a.transform
			local var_40_25 = 0

			if var_40_25 < arg_37_1.time_ and arg_37_1.time_ <= var_40_25 + arg_40_0 then
				arg_37_1.var_.moveOldPosST05a = var_40_24.localPosition
			end

			local var_40_26 = 0.001

			if var_40_25 <= arg_37_1.time_ and arg_37_1.time_ < var_40_25 + var_40_26 then
				local var_40_27 = (arg_37_1.time_ - var_40_25) / var_40_26
				local var_40_28 = Vector3.New(0, -100, 10)

				var_40_24.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPosST05a, var_40_28, var_40_27)
			end

			if arg_37_1.time_ >= var_40_25 + var_40_26 and arg_37_1.time_ < var_40_25 + var_40_26 + arg_40_0 then
				var_40_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_40_29 = 0

			if var_40_29 < arg_37_1.time_ and arg_37_1.time_ <= var_40_29 + arg_40_0 then
				arg_37_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action423")
			end

			local var_40_30 = 0
			local var_40_31 = 0.1

			if var_40_30 < arg_37_1.time_ and arg_37_1.time_ <= var_40_30 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0

				arg_37_1.dialog_:SetActive(true)

				local var_40_32 = LeanTween.value(arg_37_1.dialog_, 0, 1, 0.3)

				var_40_32:setOnUpdate(LuaHelper.FloatAction(function(arg_41_0)
					arg_37_1.dialogCg_.alpha = arg_41_0
				end))
				var_40_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_37_1.dialog_)
					var_40_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_37_1.duration_ = arg_37_1.duration_ + 0.3

				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_33 = arg_37_1:GetWordFromCfg(100)
				local var_40_34 = arg_37_1:FormatText(var_40_33.content)

				arg_37_1.text_.text = var_40_34

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_35 = 4
				local var_40_36 = utf8.len(var_40_34)
				local var_40_37 = var_40_35 <= 0 and var_40_31 or var_40_31 * (var_40_36 / var_40_35)

				if var_40_37 > 0 and var_40_31 < var_40_37 then
					arg_37_1.talkMaxDuration = var_40_37
					var_40_30 = var_40_30 + 0.3

					if var_40_37 + var_40_30 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_37 + var_40_30
					end
				end

				arg_37_1.text_.text = var_40_34
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_38 = var_40_30 + 0.3
			local var_40_39 = math.max(var_40_31, arg_37_1.talkMaxDuration)

			if var_40_38 <= arg_37_1.time_ and arg_37_1.time_ < var_40_38 + var_40_39 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_38) / var_40_39

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_38 + var_40_39 and arg_37_1.time_ < var_40_38 + var_40_39 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play107 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 107
		arg_43_1.duration_ = 6.8

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play108(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1148ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1148ui_story == nil then
				arg_43_1.var_.characterEffect1148ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 and not isNil(var_46_0) then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1148ui_story and not isNil(var_46_0) then
					arg_43_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1148ui_story then
				arg_43_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1084ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and not isNil(var_46_4) and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 and not isNil(var_46_4) then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1084ui_story and not isNil(var_46_4) then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and not isNil(var_46_4) and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_8 = "ST06a"

			if arg_43_1.bgs_[var_46_8] == nil then
				local var_46_9 = Object.Instantiate(arg_43_1.paintGo_)

				var_46_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_46_8)
				var_46_9.name = var_46_8
				var_46_9.transform.parent = arg_43_1.stage_.transform
				var_46_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.bgs_[var_46_8] = var_46_9
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				local var_46_11 = manager.ui.mainCamera.transform.localPosition
				local var_46_12 = Vector3.New(0, 0, 10) + Vector3.New(var_46_11.x, var_46_11.y, 0)
				local var_46_13 = arg_43_1.bgs_.ST06a

				var_46_13.transform.localPosition = var_46_12
				var_46_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_46_14 = var_46_13:GetComponent("SpriteRenderer")

				if var_46_14 and var_46_14.sprite then
					local var_46_15 = (var_46_13.transform.localPosition - var_46_11).z
					local var_46_16 = manager.ui.mainCameraCom_
					local var_46_17 = 2 * var_46_15 * Mathf.Tan(var_46_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_46_18 = var_46_17 * var_46_16.aspect
					local var_46_19 = var_46_14.sprite.bounds.size.x
					local var_46_20 = var_46_14.sprite.bounds.size.y
					local var_46_21 = var_46_18 / var_46_19
					local var_46_22 = var_46_17 / var_46_20
					local var_46_23 = var_46_22 < var_46_21 and var_46_21 or var_46_22

					var_46_13.transform.localScale = Vector3.New(var_46_23, var_46_23, 0)
				end

				for iter_46_0, iter_46_1 in pairs(arg_43_1.bgs_) do
					if iter_46_0 ~= "ST06a" then
						iter_46_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_46_24 = arg_43_1.bgs_.ST06.transform
			local var_46_25 = 0

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 then
				arg_43_1.var_.moveOldPosST06 = var_46_24.localPosition
			end

			local var_46_26 = 0.001

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_26 then
				local var_46_27 = (arg_43_1.time_ - var_46_25) / var_46_26
				local var_46_28 = Vector3.New(0, -100, 10)

				var_46_24.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPosST06, var_46_28, var_46_27)
			end

			if arg_43_1.time_ >= var_46_25 + var_46_26 and arg_43_1.time_ < var_46_25 + var_46_26 + arg_46_0 then
				var_46_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action434")
			end

			local var_46_30 = 0
			local var_46_31 = 0.1

			if var_46_30 < arg_43_1.time_ and arg_43_1.time_ <= var_46_30 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				arg_43_1.dialog_:SetActive(true)

				local var_46_32 = LeanTween.value(arg_43_1.dialog_, 0, 1, 0.3)

				var_46_32:setOnUpdate(LuaHelper.FloatAction(function(arg_47_0)
					arg_43_1.dialogCg_.alpha = arg_47_0
				end))
				var_46_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_43_1.dialog_)
					var_46_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_43_1.duration_ = arg_43_1.duration_ + 0.3

				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_33 = arg_43_1:GetWordFromCfg(100)
				local var_46_34 = arg_43_1:FormatText(var_46_33.content)

				arg_43_1.text_.text = var_46_34

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_35 = 4
				local var_46_36 = utf8.len(var_46_34)
				local var_46_37 = var_46_35 <= 0 and var_46_31 or var_46_31 * (var_46_36 / var_46_35)

				if var_46_37 > 0 and var_46_31 < var_46_37 then
					arg_43_1.talkMaxDuration = var_46_37
					var_46_30 = var_46_30 + 0.3

					if var_46_37 + var_46_30 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_37 + var_46_30
					end
				end

				arg_43_1.text_.text = var_46_34
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_38 = var_46_30 + 0.3
			local var_46_39 = math.max(var_46_31, arg_43_1.talkMaxDuration)

			if var_46_38 <= arg_43_1.time_ and arg_43_1.time_ < var_46_38 + var_46_39 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_38) / var_46_39

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_38 + var_46_39 and arg_43_1.time_ < var_46_38 + var_46_39 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play108 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 108
		arg_49_1.duration_ = 7.05

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play109(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1148ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect1148ui_story == nil then
				arg_49_1.var_.characterEffect1148ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.1

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 and not isNil(var_52_0) then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1148ui_story and not isNil(var_52_0) then
					arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect1148ui_story then
				arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_52_4 = arg_49_1.actors_["1084ui_story"]
			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 and not isNil(var_52_4) and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_6 = 0.1

			if var_52_5 <= arg_49_1.time_ and arg_49_1.time_ < var_52_5 + var_52_6 and not isNil(var_52_4) then
				local var_52_7 = (arg_49_1.time_ - var_52_5) / var_52_6

				if arg_49_1.var_.characterEffect1084ui_story and not isNil(var_52_4) then
					arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_5 + var_52_6 and arg_49_1.time_ < var_52_5 + var_52_6 + arg_52_0 and not isNil(var_52_4) and arg_49_1.var_.characterEffect1084ui_story then
				arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_52_8 = "ST06b"

			if arg_49_1.bgs_[var_52_8] == nil then
				local var_52_9 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_8)
				var_52_9.name = var_52_8
				var_52_9.transform.parent = arg_49_1.stage_.transform
				var_52_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_8] = var_52_9
			end

			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 then
				local var_52_11 = manager.ui.mainCamera.transform.localPosition
				local var_52_12 = Vector3.New(0, 0, 10) + Vector3.New(var_52_11.x, var_52_11.y, 0)
				local var_52_13 = arg_49_1.bgs_.ST06b

				var_52_13.transform.localPosition = var_52_12
				var_52_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_14 = var_52_13:GetComponent("SpriteRenderer")

				if var_52_14 and var_52_14.sprite then
					local var_52_15 = (var_52_13.transform.localPosition - var_52_11).z
					local var_52_16 = manager.ui.mainCameraCom_
					local var_52_17 = 2 * var_52_15 * Mathf.Tan(var_52_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_18 = var_52_17 * var_52_16.aspect
					local var_52_19 = var_52_14.sprite.bounds.size.x
					local var_52_20 = var_52_14.sprite.bounds.size.y
					local var_52_21 = var_52_18 / var_52_19
					local var_52_22 = var_52_17 / var_52_20
					local var_52_23 = var_52_22 < var_52_21 and var_52_21 or var_52_22

					var_52_13.transform.localScale = Vector3.New(var_52_23, var_52_23, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "ST06b" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_24 = arg_49_1.bgs_.ST06a.transform
			local var_52_25 = 0

			if var_52_25 < arg_49_1.time_ and arg_49_1.time_ <= var_52_25 + arg_52_0 then
				arg_49_1.var_.moveOldPosST06a = var_52_24.localPosition
			end

			local var_52_26 = 0.001

			if var_52_25 <= arg_49_1.time_ and arg_49_1.time_ < var_52_25 + var_52_26 then
				local var_52_27 = (arg_49_1.time_ - var_52_25) / var_52_26
				local var_52_28 = Vector3.New(0, -100, 10)

				var_52_24.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPosST06a, var_52_28, var_52_27)
			end

			if arg_49_1.time_ >= var_52_25 + var_52_26 and arg_49_1.time_ < var_52_25 + var_52_26 + arg_52_0 then
				var_52_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_52_29 = 0

			if var_52_29 < arg_49_1.time_ and arg_49_1.time_ <= var_52_29 + arg_52_0 then
				arg_49_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action434")
			end

			local var_52_30 = 0
			local var_52_31 = 0.1

			if var_52_30 < arg_49_1.time_ and arg_49_1.time_ <= var_52_30 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_32 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_32:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_33 = arg_49_1:GetWordFromCfg(100)
				local var_52_34 = arg_49_1:FormatText(var_52_33.content)

				arg_49_1.text_.text = var_52_34

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_35 = 4
				local var_52_36 = utf8.len(var_52_34)
				local var_52_37 = var_52_35 <= 0 and var_52_31 or var_52_31 * (var_52_36 / var_52_35)

				if var_52_37 > 0 and var_52_31 < var_52_37 then
					arg_49_1.talkMaxDuration = var_52_37
					var_52_30 = var_52_30 + 0.3

					if var_52_37 + var_52_30 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_37 + var_52_30
					end
				end

				arg_49_1.text_.text = var_52_34
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_38 = var_52_30 + 0.3
			local var_52_39 = math.max(var_52_31, arg_49_1.talkMaxDuration)

			if var_52_38 <= arg_49_1.time_ and arg_49_1.time_ < var_52_38 + var_52_39 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_38) / var_52_39

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_38 + var_52_39 and arg_49_1.time_ < var_52_38 + var_52_39 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play109 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 109
		arg_55_1.duration_ = 6.67

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play110(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1148ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and not isNil(var_58_0) and arg_55_1.var_.characterEffect1148ui_story == nil then
				arg_55_1.var_.characterEffect1148ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 and not isNil(var_58_0) then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1148ui_story and not isNil(var_58_0) then
					arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and not isNil(var_58_0) and arg_55_1.var_.characterEffect1148ui_story then
				arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1084ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and not isNil(var_58_4) and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 and not isNil(var_58_4) then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1084ui_story and not isNil(var_58_4) then
					arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and not isNil(var_58_4) and arg_55_1.var_.characterEffect1084ui_story then
				arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_58_8 = arg_55_1.bgs_.ST06b.transform
			local var_58_9 = 0

			if var_58_9 < arg_55_1.time_ and arg_55_1.time_ <= var_58_9 + arg_58_0 then
				arg_55_1.var_.moveOldPosST06b = var_58_8.localPosition
			end

			local var_58_10 = 0.001

			if var_58_9 <= arg_55_1.time_ and arg_55_1.time_ < var_58_9 + var_58_10 then
				local var_58_11 = (arg_55_1.time_ - var_58_9) / var_58_10
				local var_58_12 = Vector3.New(0, -100, 10)

				var_58_8.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosST06b, var_58_12, var_58_11)
			end

			if arg_55_1.time_ >= var_58_9 + var_58_10 and arg_55_1.time_ < var_58_9 + var_58_10 + arg_58_0 then
				var_58_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_58_13 = "ST07a"

			if arg_55_1.bgs_[var_58_13] == nil then
				local var_58_14 = Object.Instantiate(arg_55_1.paintGo_)

				var_58_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_58_13)
				var_58_14.name = var_58_13
				var_58_14.transform.parent = arg_55_1.stage_.transform
				var_58_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.bgs_[var_58_13] = var_58_14
			end

			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				local var_58_16 = manager.ui.mainCamera.transform.localPosition
				local var_58_17 = Vector3.New(0, 0, 10) + Vector3.New(var_58_16.x, var_58_16.y, 0)
				local var_58_18 = arg_55_1.bgs_.ST07a

				var_58_18.transform.localPosition = var_58_17
				var_58_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_19 = var_58_18:GetComponent("SpriteRenderer")

				if var_58_19 and var_58_19.sprite then
					local var_58_20 = (var_58_18.transform.localPosition - var_58_16).z
					local var_58_21 = manager.ui.mainCameraCom_
					local var_58_22 = 2 * var_58_20 * Mathf.Tan(var_58_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_23 = var_58_22 * var_58_21.aspect
					local var_58_24 = var_58_19.sprite.bounds.size.x
					local var_58_25 = var_58_19.sprite.bounds.size.y
					local var_58_26 = var_58_23 / var_58_24
					local var_58_27 = var_58_22 / var_58_25
					local var_58_28 = var_58_27 < var_58_26 and var_58_26 or var_58_27

					var_58_18.transform.localScale = Vector3.New(var_58_28, var_58_28, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "ST07a" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_29 = 0

			if var_58_29 < arg_55_1.time_ and arg_55_1.time_ <= var_58_29 + arg_58_0 then
				arg_55_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action445")
			end

			local var_58_30 = 0
			local var_58_31 = 0.1

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_32 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_32:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_33 = arg_55_1:GetWordFromCfg(100)
				local var_58_34 = arg_55_1:FormatText(var_58_33.content)

				arg_55_1.text_.text = var_58_34

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_35 = 4
				local var_58_36 = utf8.len(var_58_34)
				local var_58_37 = var_58_35 <= 0 and var_58_31 or var_58_31 * (var_58_36 / var_58_35)

				if var_58_37 > 0 and var_58_31 < var_58_37 then
					arg_55_1.talkMaxDuration = var_58_37
					var_58_30 = var_58_30 + 0.3

					if var_58_37 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_37 + var_58_30
					end
				end

				arg_55_1.text_.text = var_58_34
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_38 = var_58_30 + 0.3
			local var_58_39 = math.max(var_58_31, arg_55_1.talkMaxDuration)

			if var_58_38 <= arg_55_1.time_ and arg_55_1.time_ < var_58_38 + var_58_39 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_38) / var_58_39

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_38 + var_58_39 and arg_55_1.time_ < var_58_38 + var_58_39 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play110 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 110
		arg_61_1.duration_ = 6.77

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play111(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1148ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect1148ui_story == nil then
				arg_61_1.var_.characterEffect1148ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.1

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 and not isNil(var_64_0) then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1148ui_story and not isNil(var_64_0) then
					arg_61_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect1148ui_story then
				arg_61_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["1084ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and not isNil(var_64_4) and arg_61_1.var_.characterEffect1084ui_story == nil then
				arg_61_1.var_.characterEffect1084ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.1

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 and not isNil(var_64_4) then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect1084ui_story and not isNil(var_64_4) then
					arg_61_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and not isNil(var_64_4) and arg_61_1.var_.characterEffect1084ui_story then
				arg_61_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_64_8 = arg_61_1.bgs_.ST07a.transform
			local var_64_9 = 0

			if var_64_9 < arg_61_1.time_ and arg_61_1.time_ <= var_64_9 + arg_64_0 then
				arg_61_1.var_.moveOldPosST07a = var_64_8.localPosition
			end

			local var_64_10 = 0.001

			if var_64_9 <= arg_61_1.time_ and arg_61_1.time_ < var_64_9 + var_64_10 then
				local var_64_11 = (arg_61_1.time_ - var_64_9) / var_64_10
				local var_64_12 = Vector3.New(0, -100, 10)

				var_64_8.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPosST07a, var_64_12, var_64_11)
			end

			if arg_61_1.time_ >= var_64_9 + var_64_10 and arg_61_1.time_ < var_64_9 + var_64_10 + arg_64_0 then
				var_64_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_64_13 = "ST07b"

			if arg_61_1.bgs_[var_64_13] == nil then
				local var_64_14 = Object.Instantiate(arg_61_1.paintGo_)

				var_64_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_64_13)
				var_64_14.name = var_64_13
				var_64_14.transform.parent = arg_61_1.stage_.transform
				var_64_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.bgs_[var_64_13] = var_64_14
			end

			local var_64_15 = 0

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				local var_64_16 = manager.ui.mainCamera.transform.localPosition
				local var_64_17 = Vector3.New(0, 0, 10) + Vector3.New(var_64_16.x, var_64_16.y, 0)
				local var_64_18 = arg_61_1.bgs_.ST07b

				var_64_18.transform.localPosition = var_64_17
				var_64_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_19 = var_64_18:GetComponent("SpriteRenderer")

				if var_64_19 and var_64_19.sprite then
					local var_64_20 = (var_64_18.transform.localPosition - var_64_16).z
					local var_64_21 = manager.ui.mainCameraCom_
					local var_64_22 = 2 * var_64_20 * Mathf.Tan(var_64_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_23 = var_64_22 * var_64_21.aspect
					local var_64_24 = var_64_19.sprite.bounds.size.x
					local var_64_25 = var_64_19.sprite.bounds.size.y
					local var_64_26 = var_64_23 / var_64_24
					local var_64_27 = var_64_22 / var_64_25
					local var_64_28 = var_64_27 < var_64_26 and var_64_26 or var_64_27

					var_64_18.transform.localScale = Vector3.New(var_64_28, var_64_28, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "ST07b" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_29 = 0

			if var_64_29 < arg_61_1.time_ and arg_61_1.time_ <= var_64_29 + arg_64_0 then
				arg_61_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action445")
			end

			local var_64_30 = 0
			local var_64_31 = 0.1

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_32 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_32:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_33 = arg_61_1:GetWordFromCfg(100)
				local var_64_34 = arg_61_1:FormatText(var_64_33.content)

				arg_61_1.text_.text = var_64_34

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_35 = 4
				local var_64_36 = utf8.len(var_64_34)
				local var_64_37 = var_64_35 <= 0 and var_64_31 or var_64_31 * (var_64_36 / var_64_35)

				if var_64_37 > 0 and var_64_31 < var_64_37 then
					arg_61_1.talkMaxDuration = var_64_37
					var_64_30 = var_64_30 + 0.3

					if var_64_37 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_37 + var_64_30
					end
				end

				arg_61_1.text_.text = var_64_34
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_38 = var_64_30 + 0.3
			local var_64_39 = math.max(var_64_31, arg_61_1.talkMaxDuration)

			if var_64_38 <= arg_61_1.time_ and arg_61_1.time_ < var_64_38 + var_64_39 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_38) / var_64_39

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_38 + var_64_39 and arg_61_1.time_ < var_64_38 + var_64_39 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play111 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 111
		arg_67_1.duration_ = 7.33

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play112(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1148ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1148ui_story == nil then
				arg_67_1.var_.characterEffect1148ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 and not isNil(var_70_0) then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1148ui_story and not isNil(var_70_0) then
					arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1148ui_story then
				arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1084ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and not isNil(var_70_4) and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 and not isNil(var_70_4) then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1084ui_story and not isNil(var_70_4) then
					arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and not isNil(var_70_4) and arg_67_1.var_.characterEffect1084ui_story then
				arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_70_8 = arg_67_1.bgs_.ST07b.transform
			local var_70_9 = 0

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.var_.moveOldPosST07b = var_70_8.localPosition
			end

			local var_70_10 = 0.001

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_10 then
				local var_70_11 = (arg_67_1.time_ - var_70_9) / var_70_10
				local var_70_12 = Vector3.New(0, -100, 10)

				var_70_8.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPosST07b, var_70_12, var_70_11)
			end

			if arg_67_1.time_ >= var_70_9 + var_70_10 and arg_67_1.time_ < var_70_9 + var_70_10 + arg_70_0 then
				var_70_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_70_13 = "ST08"

			if arg_67_1.bgs_[var_70_13] == nil then
				local var_70_14 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_13)
				var_70_14.name = var_70_13
				var_70_14.transform.parent = arg_67_1.stage_.transform
				var_70_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_13] = var_70_14
			end

			local var_70_15 = 0

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				local var_70_16 = manager.ui.mainCamera.transform.localPosition
				local var_70_17 = Vector3.New(0, 0, 10) + Vector3.New(var_70_16.x, var_70_16.y, 0)
				local var_70_18 = arg_67_1.bgs_.ST08

				var_70_18.transform.localPosition = var_70_17
				var_70_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_19 = var_70_18:GetComponent("SpriteRenderer")

				if var_70_19 and var_70_19.sprite then
					local var_70_20 = (var_70_18.transform.localPosition - var_70_16).z
					local var_70_21 = manager.ui.mainCameraCom_
					local var_70_22 = 2 * var_70_20 * Mathf.Tan(var_70_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_23 = var_70_22 * var_70_21.aspect
					local var_70_24 = var_70_19.sprite.bounds.size.x
					local var_70_25 = var_70_19.sprite.bounds.size.y
					local var_70_26 = var_70_23 / var_70_24
					local var_70_27 = var_70_22 / var_70_25
					local var_70_28 = var_70_27 < var_70_26 and var_70_26 or var_70_27

					var_70_18.transform.localScale = Vector3.New(var_70_28, var_70_28, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "ST08" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_29 = 0

			if var_70_29 < arg_67_1.time_ and arg_67_1.time_ <= var_70_29 + arg_70_0 then
				arg_67_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action456")
			end

			local var_70_30 = 0
			local var_70_31 = 0.1

			if var_70_30 < arg_67_1.time_ and arg_67_1.time_ <= var_70_30 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_32 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_32:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_33 = arg_67_1:GetWordFromCfg(100)
				local var_70_34 = arg_67_1:FormatText(var_70_33.content)

				arg_67_1.text_.text = var_70_34

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_35 = 4
				local var_70_36 = utf8.len(var_70_34)
				local var_70_37 = var_70_35 <= 0 and var_70_31 or var_70_31 * (var_70_36 / var_70_35)

				if var_70_37 > 0 and var_70_31 < var_70_37 then
					arg_67_1.talkMaxDuration = var_70_37
					var_70_30 = var_70_30 + 0.3

					if var_70_37 + var_70_30 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_37 + var_70_30
					end
				end

				arg_67_1.text_.text = var_70_34
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_38 = var_70_30 + 0.3
			local var_70_39 = math.max(var_70_31, arg_67_1.talkMaxDuration)

			if var_70_38 <= arg_67_1.time_ and arg_67_1.time_ < var_70_38 + var_70_39 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_38) / var_70_39

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_38 + var_70_39 and arg_67_1.time_ < var_70_38 + var_70_39 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play112 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 112
		arg_73_1.duration_ = 6.93

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
			arg_73_1.auto_ = false
		end

		function arg_73_1.playNext_(arg_75_0)
			arg_73_1.onStoryFinished_()
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1148ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and not isNil(var_76_0) and arg_73_1.var_.characterEffect1148ui_story == nil then
				arg_73_1.var_.characterEffect1148ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 and not isNil(var_76_0) then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1148ui_story and not isNil(var_76_0) then
					arg_73_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and not isNil(var_76_0) and arg_73_1.var_.characterEffect1148ui_story then
				arg_73_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1084ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and not isNil(var_76_4) and arg_73_1.var_.characterEffect1084ui_story == nil then
				arg_73_1.var_.characterEffect1084ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.1

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 and not isNil(var_76_4) then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect1084ui_story and not isNil(var_76_4) then
					arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and not isNil(var_76_4) and arg_73_1.var_.characterEffect1084ui_story then
				arg_73_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_76_8 = arg_73_1.bgs_.ST08.transform
			local var_76_9 = 0

			if var_76_9 < arg_73_1.time_ and arg_73_1.time_ <= var_76_9 + arg_76_0 then
				arg_73_1.var_.moveOldPosST08 = var_76_8.localPosition
			end

			local var_76_10 = 0.001

			if var_76_9 <= arg_73_1.time_ and arg_73_1.time_ < var_76_9 + var_76_10 then
				local var_76_11 = (arg_73_1.time_ - var_76_9) / var_76_10
				local var_76_12 = Vector3.New(0, -100, 10)

				var_76_8.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPosST08, var_76_12, var_76_11)
			end

			if arg_73_1.time_ >= var_76_9 + var_76_10 and arg_73_1.time_ < var_76_9 + var_76_10 + arg_76_0 then
				var_76_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_76_13 = "ST12"

			if arg_73_1.bgs_[var_76_13] == nil then
				local var_76_14 = Object.Instantiate(arg_73_1.paintGo_)

				var_76_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_76_13)
				var_76_14.name = var_76_13
				var_76_14.transform.parent = arg_73_1.stage_.transform
				var_76_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.bgs_[var_76_13] = var_76_14
			end

			local var_76_15 = 0

			if var_76_15 < arg_73_1.time_ and arg_73_1.time_ <= var_76_15 + arg_76_0 then
				local var_76_16 = manager.ui.mainCamera.transform.localPosition
				local var_76_17 = Vector3.New(0, 0, 10) + Vector3.New(var_76_16.x, var_76_16.y, 0)
				local var_76_18 = arg_73_1.bgs_.ST12

				var_76_18.transform.localPosition = var_76_17
				var_76_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_76_19 = var_76_18:GetComponent("SpriteRenderer")

				if var_76_19 and var_76_19.sprite then
					local var_76_20 = (var_76_18.transform.localPosition - var_76_16).z
					local var_76_21 = manager.ui.mainCameraCom_
					local var_76_22 = 2 * var_76_20 * Mathf.Tan(var_76_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_76_23 = var_76_22 * var_76_21.aspect
					local var_76_24 = var_76_19.sprite.bounds.size.x
					local var_76_25 = var_76_19.sprite.bounds.size.y
					local var_76_26 = var_76_23 / var_76_24
					local var_76_27 = var_76_22 / var_76_25
					local var_76_28 = var_76_27 < var_76_26 and var_76_26 or var_76_27

					var_76_18.transform.localScale = Vector3.New(var_76_28, var_76_28, 0)
				end

				for iter_76_0, iter_76_1 in pairs(arg_73_1.bgs_) do
					if iter_76_0 ~= "ST12" then
						iter_76_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_76_29 = 0

			if var_76_29 < arg_73_1.time_ and arg_73_1.time_ <= var_76_29 + arg_76_0 then
				arg_73_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action456")
			end

			local var_76_30 = 0
			local var_76_31 = 0.1

			if var_76_30 < arg_73_1.time_ and arg_73_1.time_ <= var_76_30 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_32 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_32:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_33 = arg_73_1:GetWordFromCfg(100)
				local var_76_34 = arg_73_1:FormatText(var_76_33.content)

				arg_73_1.text_.text = var_76_34

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_35 = 4
				local var_76_36 = utf8.len(var_76_34)
				local var_76_37 = var_76_35 <= 0 and var_76_31 or var_76_31 * (var_76_36 / var_76_35)

				if var_76_37 > 0 and var_76_31 < var_76_37 then
					arg_73_1.talkMaxDuration = var_76_37
					var_76_30 = var_76_30 + 0.3

					if var_76_37 + var_76_30 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_37 + var_76_30
					end
				end

				arg_73_1.text_.text = var_76_34
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_38 = var_76_30 + 0.3
			local var_76_39 = math.max(var_76_31, arg_73_1.talkMaxDuration)

			if var_76_38 <= arg_73_1.time_ and arg_73_1.time_ < var_76_38 + var_76_39 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_38) / var_76_39

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_38 + var_76_39 and arg_73_1.time_ < var_76_38 + var_76_39 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
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
