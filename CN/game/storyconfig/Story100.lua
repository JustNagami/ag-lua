return {
	Play100 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 100
		arg_1_1.duration_ = 7.97

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
			local var_4_0 = "OS0106"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = arg_1_1.bgs_.OS0106.transform
			local var_4_3 = 0

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				arg_1_1.var_.moveOldPosOS0106 = var_4_2.localPosition
			end

			local var_4_4 = 0.001

			if var_4_3 <= arg_1_1.time_ and arg_1_1.time_ < var_4_3 + var_4_4 then
				local var_4_5 = (arg_1_1.time_ - var_4_3) / var_4_4
				local var_4_6 = Vector3.New(0, 0, 0)

				var_4_2.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosOS0106, var_4_6, var_4_5)
			end

			if arg_1_1.time_ >= var_4_3 + var_4_4 and arg_1_1.time_ < var_4_3 + var_4_4 + arg_4_0 then
				var_4_2.localPosition = Vector3.New(0, 0, 0)
			end
		end
	end,
	Play101 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 101
		arg_5_1.duration_ = 15.93

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
			local var_8_0 = "test"

			if not arg_5_1.actionList.test then
				arg_5_1.actionList.test = StoryShakePictureGame.New(arg_5_1)

				arg_5_1.actionList.test:SetData({
					moveHorizontalDistancePerShake = 300,
					path = "TextureConfig/Background/SK0102",
					shakeTimes = 6
				})
			end
		end
	end,
	Play102 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 102
		arg_9_1.duration_ = 2

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play103(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "1148ui_story"

			if arg_9_1.actors_[var_12_0] == nil then
				local var_12_1 = Asset.Load("Char/" .. "1148ui_story")

				if not isNil(var_12_1) then
					local var_12_2 = Object.Instantiate(Asset.Load("Char/" .. "1148ui_story"), arg_9_1.stage_.transform)

					var_12_2.name = var_12_0
					var_12_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_9_1.actors_[var_12_0] = var_12_2

					local var_12_3 = var_12_2:GetComponentInChildren(typeof(CharacterEffect))

					var_12_3.enabled = true

					local var_12_4 = GameObjectTools.GetOrAddComponent(var_12_2, typeof(DynamicBoneHelper))

					if var_12_4 then
						var_12_4:EnableDynamicBone(false)
					end

					arg_9_1:ShowWeapon(var_12_3.transform, false)

					arg_9_1.var_[var_12_0 .. "Animator"] = var_12_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_9_1.var_[var_12_0 .. "Animator"].applyRootMotion = true
					arg_9_1.var_[var_12_0 .. "LipSync"] = var_12_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_12_5 = arg_9_1.actors_["1148ui_story"]
			local var_12_6 = 0

			if var_12_6 < arg_9_1.time_ and arg_9_1.time_ <= var_12_6 + arg_12_0 and not isNil(var_12_5) and arg_9_1.var_.characterEffect1148ui_story == nil then
				arg_9_1.var_.characterEffect1148ui_story = var_12_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_7 = 0.1

			if var_12_6 <= arg_9_1.time_ and arg_9_1.time_ < var_12_6 + var_12_7 and not isNil(var_12_5) then
				local var_12_8 = (arg_9_1.time_ - var_12_6) / var_12_7

				if arg_9_1.var_.characterEffect1148ui_story and not isNil(var_12_5) then
					arg_9_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_6 + var_12_7 and arg_9_1.time_ < var_12_6 + var_12_7 + arg_12_0 and not isNil(var_12_5) and arg_9_1.var_.characterEffect1148ui_story then
				arg_9_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_12_9 = "1084ui_story"

			if arg_9_1.actors_[var_12_9] == nil then
				local var_12_10 = Asset.Load("Char/" .. "1084ui_story")

				if not isNil(var_12_10) then
					local var_12_11 = Object.Instantiate(Asset.Load("Char/" .. "1084ui_story"), arg_9_1.stage_.transform)

					var_12_11.name = var_12_9
					var_12_11.transform.localPosition = Vector3.New(0, 100, 0)
					arg_9_1.actors_[var_12_9] = var_12_11

					local var_12_12 = var_12_11:GetComponentInChildren(typeof(CharacterEffect))

					var_12_12.enabled = true

					local var_12_13 = GameObjectTools.GetOrAddComponent(var_12_11, typeof(DynamicBoneHelper))

					if var_12_13 then
						var_12_13:EnableDynamicBone(false)
					end

					arg_9_1:ShowWeapon(var_12_12.transform, false)

					arg_9_1.var_[var_12_9 .. "Animator"] = var_12_12.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_9_1.var_[var_12_9 .. "Animator"].applyRootMotion = true
					arg_9_1.var_[var_12_9 .. "LipSync"] = var_12_12.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_12_14 = arg_9_1.actors_["1084ui_story"]
			local var_12_15 = 0

			if var_12_15 < arg_9_1.time_ and arg_9_1.time_ <= var_12_15 + arg_12_0 and not isNil(var_12_14) and arg_9_1.var_.characterEffect1084ui_story == nil then
				arg_9_1.var_.characterEffect1084ui_story = var_12_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_16 = 0.1

			if var_12_15 <= arg_9_1.time_ and arg_9_1.time_ < var_12_15 + var_12_16 and not isNil(var_12_14) then
				local var_12_17 = (arg_9_1.time_ - var_12_15) / var_12_16

				if arg_9_1.var_.characterEffect1084ui_story and not isNil(var_12_14) then
					arg_9_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_15 + var_12_16 and arg_9_1.time_ < var_12_15 + var_12_16 + arg_12_0 and not isNil(var_12_14) and arg_9_1.var_.characterEffect1084ui_story then
				arg_9_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_12_18 = "ST03"

			if arg_9_1.bgs_[var_12_18] == nil then
				local var_12_19 = Object.Instantiate(arg_9_1.paintGo_)

				var_12_19:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_12_18)
				var_12_19.name = var_12_18
				var_12_19.transform.parent = arg_9_1.stage_.transform
				var_12_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.bgs_[var_12_18] = var_12_19
			end

			local var_12_20 = 0

			if var_12_20 < arg_9_1.time_ and arg_9_1.time_ <= var_12_20 + arg_12_0 then
				local var_12_21 = manager.ui.mainCamera.transform.localPosition
				local var_12_22 = Vector3.New(0, 0, 10) + Vector3.New(var_12_21.x, var_12_21.y, 0)
				local var_12_23 = arg_9_1.bgs_.ST03

				var_12_23.transform.localPosition = var_12_22
				var_12_23.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_12_24 = var_12_23:GetComponent("SpriteRenderer")

				if var_12_24 and var_12_24.sprite then
					local var_12_25 = (var_12_23.transform.localPosition - var_12_21).z
					local var_12_26 = manager.ui.mainCameraCom_
					local var_12_27 = 2 * var_12_25 * Mathf.Tan(var_12_26.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_12_28 = var_12_27 * var_12_26.aspect
					local var_12_29 = var_12_24.sprite.bounds.size.x
					local var_12_30 = var_12_24.sprite.bounds.size.y
					local var_12_31 = var_12_28 / var_12_29
					local var_12_32 = var_12_27 / var_12_30
					local var_12_33 = var_12_32 < var_12_31 and var_12_31 or var_12_32

					var_12_23.transform.localScale = Vector3.New(var_12_33, var_12_33, 0)
				end

				for iter_12_0, iter_12_1 in pairs(arg_9_1.bgs_) do
					if iter_12_0 ~= "ST03" then
						iter_12_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_12_34 = 0

			if var_12_34 < arg_9_1.time_ and arg_9_1.time_ <= var_12_34 + arg_12_0 then
				arg_9_1.mask_.enabled = true
				arg_9_1.mask_.raycastTarget = false

				arg_9_1:SetGaussion(false)
			end

			local var_12_35 = 0.5

			if var_12_34 <= arg_9_1.time_ and arg_9_1.time_ < var_12_34 + var_12_35 then
				local var_12_36 = (arg_9_1.time_ - var_12_34) / var_12_35
				local var_12_37 = Color.New(1, 1, 1)

				var_12_37.a = Mathf.Lerp(0, 1, var_12_36)
				arg_9_1.mask_.color = var_12_37
			end

			if arg_9_1.time_ >= var_12_34 + var_12_35 and arg_9_1.time_ < var_12_34 + var_12_35 + arg_12_0 then
				local var_12_38 = Color.New(1, 1, 1)

				var_12_38.a = 1
				arg_9_1.mask_.color = var_12_38
			end

			local var_12_39 = 0.5

			if var_12_39 < arg_9_1.time_ and arg_9_1.time_ <= var_12_39 + arg_12_0 then
				arg_9_1.mask_.enabled = true
				arg_9_1.mask_.raycastTarget = false

				arg_9_1:SetGaussion(false)
			end

			local var_12_40 = 0.5

			if var_12_39 <= arg_9_1.time_ and arg_9_1.time_ < var_12_39 + var_12_40 then
				local var_12_41 = (arg_9_1.time_ - var_12_39) / var_12_40
				local var_12_42 = Color.New(1, 1, 1)

				var_12_42.a = Mathf.Lerp(1, 0, var_12_41)
				arg_9_1.mask_.color = var_12_42
			end

			if arg_9_1.time_ >= var_12_39 + var_12_40 and arg_9_1.time_ < var_12_39 + var_12_40 + arg_12_0 then
				local var_12_43 = Color.New(1, 1, 1)
				local var_12_44 = 0

				arg_9_1.mask_.enabled = false
				var_12_43.a = var_12_44
				arg_9_1.mask_.color = var_12_43
			end

			local var_12_45 = manager.ui.mainCamera.transform
			local var_12_46 = 0

			if var_12_46 < arg_9_1.time_ and arg_9_1.time_ <= var_12_46 + arg_12_0 then
				local var_12_47 = arg_9_1.var_.effectxiayu1

				if not var_12_47 then
					var_12_47 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavy"))
					var_12_47.name = "xiayu1"
					arg_9_1.var_.effectxiayu1 = var_12_47
				end

				local var_12_48 = var_12_45:Find("")

				if var_12_48 then
					var_12_47.transform.parent = var_12_48
				else
					var_12_47.transform.parent = var_12_45
				end

				var_12_47.transform.localPosition = Vector3.New(0, 0, 0)
				var_12_47.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_12_49 = manager.ui.mainCamera.transform
			local var_12_50 = 0

			if var_12_50 < arg_9_1.time_ and arg_9_1.time_ <= var_12_50 + arg_12_0 then
				local var_12_51 = arg_9_1.var_.effectxiayu2

				if not var_12_51 then
					var_12_51 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavy_ui"))
					var_12_51.name = "xiayu2"
					arg_9_1.var_.effectxiayu2 = var_12_51
				end

				local var_12_52 = var_12_49:Find("")

				if var_12_52 then
					var_12_51.transform.parent = var_12_52
				else
					var_12_51.transform.parent = var_12_49
				end

				var_12_51.transform.localPosition = Vector3.New(0, 0, 0)
				var_12_51.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_12_53 = manager.ui.mainCameraCom_
				local var_12_54 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_12_53.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_12_55 = var_12_51.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_12_56 = 15
				local var_12_57 = 2 * var_12_56 * Mathf.Tan(var_12_53.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_12_53.aspect
				local var_12_58 = 1
				local var_12_59 = 1.7777777777777777

				if var_12_59 < var_12_53.aspect then
					var_12_58 = var_12_57 / (2 * var_12_56 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_12_59)
				end

				for iter_12_2, iter_12_3 in ipairs(var_12_55) do
					local var_12_60 = iter_12_3.transform.localScale

					iter_12_3.transform.localScale = Vector3.New(var_12_60.x / var_12_54 * var_12_58, var_12_60.y / var_12_54, var_12_60.z)
				end
			end

			local var_12_61 = 0
			local var_12_62 = 0.1

			if var_12_61 < arg_9_1.time_ and arg_9_1.time_ <= var_12_61 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0

				arg_9_1.dialog_:SetActive(true)

				local var_12_63 = LeanTween.value(arg_9_1.dialog_, 0, 1, 0.3)

				var_12_63:setOnUpdate(LuaHelper.FloatAction(function(arg_13_0)
					arg_9_1.dialogCg_.alpha = arg_13_0
				end))
				var_12_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_9_1.dialog_)
					var_12_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_9_1.duration_ = arg_9_1.duration_ + 0.3

				SetActive(arg_9_1.leftNameGo_, false)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_64 = arg_9_1:GetWordFromCfg(100)
				local var_12_65 = arg_9_1:FormatText(var_12_64.content)

				arg_9_1.text_.text = var_12_65

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_66 = 4
				local var_12_67 = utf8.len(var_12_65)
				local var_12_68 = var_12_66 <= 0 and var_12_62 or var_12_62 * (var_12_67 / var_12_66)

				if var_12_68 > 0 and var_12_62 < var_12_68 then
					arg_9_1.talkMaxDuration = var_12_68
					var_12_61 = var_12_61 + 0.3

					if var_12_68 + var_12_61 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_68 + var_12_61
					end
				end

				arg_9_1.text_.text = var_12_65
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)
				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_69 = var_12_61 + 0.3
			local var_12_70 = math.max(var_12_62, arg_9_1.talkMaxDuration)

			if var_12_69 <= arg_9_1.time_ and arg_9_1.time_ < var_12_69 + var_12_70 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_69) / var_12_70

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_69 + var_12_70 and arg_9_1.time_ < var_12_69 + var_12_70 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play103 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103
		arg_15_1.duration_ = 2

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
			local var_18_0 = arg_15_1.actors_["1148ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and not isNil(var_18_0) and arg_15_1.var_.characterEffect1148ui_story == nil then
				arg_15_1.var_.characterEffect1148ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 and not isNil(var_18_0) then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1148ui_story and not isNil(var_18_0) then
					arg_15_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and not isNil(var_18_0) and arg_15_1.var_.characterEffect1148ui_story then
				arg_15_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_18_4 = arg_15_1.actors_["1084ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and not isNil(var_18_4) and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 and not isNil(var_18_4) then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1084ui_story and not isNil(var_18_4) then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and not isNil(var_18_4) and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_8 = "ST03a"

			if arg_15_1.bgs_[var_18_8] == nil then
				local var_18_9 = Object.Instantiate(arg_15_1.paintGo_)

				var_18_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_18_8)
				var_18_9.name = var_18_8
				var_18_9.transform.parent = arg_15_1.stage_.transform
				var_18_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.bgs_[var_18_8] = var_18_9
			end

			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				local var_18_11 = manager.ui.mainCamera.transform.localPosition
				local var_18_12 = Vector3.New(0, 0, 10) + Vector3.New(var_18_11.x, var_18_11.y, 0)
				local var_18_13 = arg_15_1.bgs_.ST03a

				var_18_13.transform.localPosition = var_18_12
				var_18_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_18_14 = var_18_13:GetComponent("SpriteRenderer")

				if var_18_14 and var_18_14.sprite then
					local var_18_15 = (var_18_13.transform.localPosition - var_18_11).z
					local var_18_16 = manager.ui.mainCameraCom_
					local var_18_17 = 2 * var_18_15 * Mathf.Tan(var_18_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_18_18 = var_18_17 * var_18_16.aspect
					local var_18_19 = var_18_14.sprite.bounds.size.x
					local var_18_20 = var_18_14.sprite.bounds.size.y
					local var_18_21 = var_18_18 / var_18_19
					local var_18_22 = var_18_17 / var_18_20
					local var_18_23 = var_18_22 < var_18_21 and var_18_21 or var_18_22

					var_18_13.transform.localScale = Vector3.New(var_18_23, var_18_23, 0)
				end

				for iter_18_0, iter_18_1 in pairs(arg_15_1.bgs_) do
					if iter_18_0 ~= "ST03a" then
						iter_18_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_18_24 = arg_15_1.bgs_.ST03.transform
			local var_18_25 = 0

			if var_18_25 < arg_15_1.time_ and arg_15_1.time_ <= var_18_25 + arg_18_0 then
				arg_15_1.var_.moveOldPosST03 = var_18_24.localPosition
			end

			local var_18_26 = 0.001

			if var_18_25 <= arg_15_1.time_ and arg_15_1.time_ < var_18_25 + var_18_26 then
				local var_18_27 = (arg_15_1.time_ - var_18_25) / var_18_26
				local var_18_28 = Vector3.New(0, -100, 10)

				var_18_24.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPosST03, var_18_28, var_18_27)
			end

			if arg_15_1.time_ >= var_18_25 + var_18_26 and arg_15_1.time_ < var_18_25 + var_18_26 + arg_18_0 then
				var_18_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_18_29 = manager.ui.mainCamera.transform
			local var_18_30 = 0

			if var_18_30 < arg_15_1.time_ and arg_15_1.time_ <= var_18_30 + arg_18_0 then
				local var_18_31 = arg_15_1.var_.effectxiayu2

				if var_18_31 then
					Object.Destroy(var_18_31)

					arg_15_1.var_.effectxiayu2 = nil
				end
			end

			local var_18_32 = manager.ui.mainCamera.transform
			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				local var_18_34 = arg_15_1.var_.effectxiayu1

				if var_18_34 then
					Object.Destroy(var_18_34)

					arg_15_1.var_.effectxiayu1 = nil
				end
			end

			local var_18_35 = manager.ui.mainCamera.transform
			local var_18_36 = 0

			if var_18_36 < arg_15_1.time_ and arg_15_1.time_ <= var_18_36 + arg_18_0 then
				local var_18_37 = arg_15_1.var_.effectxiayu3

				if not var_18_37 then
					var_18_37 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavymax"))
					var_18_37.name = "xiayu3"
					arg_15_1.var_.effectxiayu3 = var_18_37
				end

				local var_18_38 = var_18_35:Find("")

				if var_18_38 then
					var_18_37.transform.parent = var_18_38
				else
					var_18_37.transform.parent = var_18_35
				end

				var_18_37.transform.localPosition = Vector3.New(0, 0, 0)
				var_18_37.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_18_39 = manager.ui.mainCamera.transform
			local var_18_40 = 0

			if var_18_40 < arg_15_1.time_ and arg_15_1.time_ <= var_18_40 + arg_18_0 then
				local var_18_41 = arg_15_1.var_.effectxiayu4

				if not var_18_41 then
					var_18_41 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_heavymax_ui"))
					var_18_41.name = "xiayu4"
					arg_15_1.var_.effectxiayu4 = var_18_41
				end

				local var_18_42 = var_18_39:Find("")

				if var_18_42 then
					var_18_41.transform.parent = var_18_42
				else
					var_18_41.transform.parent = var_18_39
				end

				var_18_41.transform.localPosition = Vector3.New(0, 0, 0)
				var_18_41.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_18_43 = manager.ui.mainCameraCom_
				local var_18_44 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_18_43.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_18_45 = var_18_41.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_18_46 = 15
				local var_18_47 = 2 * var_18_46 * Mathf.Tan(var_18_43.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_18_43.aspect
				local var_18_48 = 1
				local var_18_49 = 1.7777777777777777

				if var_18_49 < var_18_43.aspect then
					var_18_48 = var_18_47 / (2 * var_18_46 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_18_49)
				end

				for iter_18_2, iter_18_3 in ipairs(var_18_45) do
					local var_18_50 = iter_18_3.transform.localScale

					iter_18_3.transform.localScale = Vector3.New(var_18_50.x / var_18_44 * var_18_48, var_18_50.y / var_18_44, var_18_50.z)
				end
			end

			local var_18_51 = 0
			local var_18_52 = 0.1

			if var_18_51 < arg_15_1.time_ and arg_15_1.time_ <= var_18_51 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_53 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_53:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_54 = arg_15_1:GetWordFromCfg(100)
				local var_18_55 = arg_15_1:FormatText(var_18_54.content)

				arg_15_1.text_.text = var_18_55

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_56 = 4
				local var_18_57 = utf8.len(var_18_55)
				local var_18_58 = var_18_56 <= 0 and var_18_52 or var_18_52 * (var_18_57 / var_18_56)

				if var_18_58 > 0 and var_18_52 < var_18_58 then
					arg_15_1.talkMaxDuration = var_18_58
					var_18_51 = var_18_51 + 0.3

					if var_18_58 + var_18_51 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_58 + var_18_51
					end
				end

				arg_15_1.text_.text = var_18_55
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_59 = var_18_51 + 0.3
			local var_18_60 = math.max(var_18_52, arg_15_1.talkMaxDuration)

			if var_18_59 <= arg_15_1.time_ and arg_15_1.time_ < var_18_59 + var_18_60 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_59) / var_18_60

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_59 + var_18_60 and arg_15_1.time_ < var_18_59 + var_18_60 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 104
		arg_21_1.duration_ = 2

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play105(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1148ui_story"]
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 and not isNil(var_24_0) and arg_21_1.var_.characterEffect1148ui_story == nil then
				arg_21_1.var_.characterEffect1148ui_story = var_24_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_2 = 0.1

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 and not isNil(var_24_0) then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2

				if arg_21_1.var_.characterEffect1148ui_story and not isNil(var_24_0) then
					arg_21_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 and not isNil(var_24_0) and arg_21_1.var_.characterEffect1148ui_story then
				arg_21_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_24_4 = arg_21_1.actors_["1084ui_story"]
			local var_24_5 = 0

			if var_24_5 < arg_21_1.time_ and arg_21_1.time_ <= var_24_5 + arg_24_0 and not isNil(var_24_4) and arg_21_1.var_.characterEffect1084ui_story == nil then
				arg_21_1.var_.characterEffect1084ui_story = var_24_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_6 = 0.1

			if var_24_5 <= arg_21_1.time_ and arg_21_1.time_ < var_24_5 + var_24_6 and not isNil(var_24_4) then
				local var_24_7 = (arg_21_1.time_ - var_24_5) / var_24_6

				if arg_21_1.var_.characterEffect1084ui_story and not isNil(var_24_4) then
					arg_21_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_5 + var_24_6 and arg_21_1.time_ < var_24_5 + var_24_6 + arg_24_0 and not isNil(var_24_4) and arg_21_1.var_.characterEffect1084ui_story then
				arg_21_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_24_8 = "ST05"

			if arg_21_1.bgs_[var_24_8] == nil then
				local var_24_9 = Object.Instantiate(arg_21_1.paintGo_)

				var_24_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_24_8)
				var_24_9.name = var_24_8
				var_24_9.transform.parent = arg_21_1.stage_.transform
				var_24_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_21_1.bgs_[var_24_8] = var_24_9
			end

			local var_24_10 = 0

			if var_24_10 < arg_21_1.time_ and arg_21_1.time_ <= var_24_10 + arg_24_0 then
				local var_24_11 = manager.ui.mainCamera.transform.localPosition
				local var_24_12 = Vector3.New(0, 0, 10) + Vector3.New(var_24_11.x, var_24_11.y, 0)
				local var_24_13 = arg_21_1.bgs_.ST05

				var_24_13.transform.localPosition = var_24_12
				var_24_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_24_14 = var_24_13:GetComponent("SpriteRenderer")

				if var_24_14 and var_24_14.sprite then
					local var_24_15 = (var_24_13.transform.localPosition - var_24_11).z
					local var_24_16 = manager.ui.mainCameraCom_
					local var_24_17 = 2 * var_24_15 * Mathf.Tan(var_24_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_24_18 = var_24_17 * var_24_16.aspect
					local var_24_19 = var_24_14.sprite.bounds.size.x
					local var_24_20 = var_24_14.sprite.bounds.size.y
					local var_24_21 = var_24_18 / var_24_19
					local var_24_22 = var_24_17 / var_24_20
					local var_24_23 = var_24_22 < var_24_21 and var_24_21 or var_24_22

					var_24_13.transform.localScale = Vector3.New(var_24_23, var_24_23, 0)
				end

				for iter_24_0, iter_24_1 in pairs(arg_21_1.bgs_) do
					if iter_24_0 ~= "ST05" then
						iter_24_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_24_24 = arg_21_1.bgs_.ST03a.transform
			local var_24_25 = 0

			if var_24_25 < arg_21_1.time_ and arg_21_1.time_ <= var_24_25 + arg_24_0 then
				arg_21_1.var_.moveOldPosST03a = var_24_24.localPosition
			end

			local var_24_26 = 0.001

			if var_24_25 <= arg_21_1.time_ and arg_21_1.time_ < var_24_25 + var_24_26 then
				local var_24_27 = (arg_21_1.time_ - var_24_25) / var_24_26
				local var_24_28 = Vector3.New(0, -100, 10)

				var_24_24.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPosST03a, var_24_28, var_24_27)
			end

			if arg_21_1.time_ >= var_24_25 + var_24_26 and arg_21_1.time_ < var_24_25 + var_24_26 + arg_24_0 then
				var_24_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_24_29 = 0

			if var_24_29 < arg_21_1.time_ and arg_21_1.time_ <= var_24_29 + arg_24_0 then
				arg_21_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action452")
			end

			local var_24_30 = manager.ui.mainCamera.transform
			local var_24_31 = 0

			if var_24_31 < arg_21_1.time_ and arg_21_1.time_ <= var_24_31 + arg_24_0 then
				local var_24_32 = arg_21_1.var_.effectxiayu3

				if var_24_32 then
					Object.Destroy(var_24_32)

					arg_21_1.var_.effectxiayu3 = nil
				end
			end

			local var_24_33 = manager.ui.mainCamera.transform
			local var_24_34 = 0

			if var_24_34 < arg_21_1.time_ and arg_21_1.time_ <= var_24_34 + arg_24_0 then
				local var_24_35 = arg_21_1.var_.effectxiayu4

				if var_24_35 then
					Object.Destroy(var_24_35)

					arg_21_1.var_.effectxiayu4 = nil
				end
			end

			local var_24_36 = manager.ui.mainCamera.transform
			local var_24_37 = 0

			if var_24_37 < arg_21_1.time_ and arg_21_1.time_ <= var_24_37 + arg_24_0 then
				local var_24_38 = arg_21_1.var_.effectxiayu5

				if not var_24_38 then
					var_24_38 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_light"))
					var_24_38.name = "xiayu5"
					arg_21_1.var_.effectxiayu5 = var_24_38
				end

				local var_24_39 = var_24_36:Find("")

				if var_24_39 then
					var_24_38.transform.parent = var_24_39
				else
					var_24_38.transform.parent = var_24_36
				end

				var_24_38.transform.localPosition = Vector3.New(0, 0, 0)
				var_24_38.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_24_40 = manager.ui.mainCamera.transform
			local var_24_41 = 0

			if var_24_41 < arg_21_1.time_ and arg_21_1.time_ <= var_24_41 + arg_24_0 then
				local var_24_42 = arg_21_1.var_.effectxiayu6

				if not var_24_42 then
					var_24_42 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_rain_light_ui"))
					var_24_42.name = "xiayu6"
					arg_21_1.var_.effectxiayu6 = var_24_42
				end

				local var_24_43 = var_24_40:Find("")

				if var_24_43 then
					var_24_42.transform.parent = var_24_43
				else
					var_24_42.transform.parent = var_24_40
				end

				var_24_42.transform.localPosition = Vector3.New(0, 0, 0)
				var_24_42.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_24_44 = manager.ui.mainCameraCom_
				local var_24_45 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_24_44.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_24_46 = var_24_42.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_24_47 = 15
				local var_24_48 = 2 * var_24_47 * Mathf.Tan(var_24_44.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_24_44.aspect
				local var_24_49 = 1
				local var_24_50 = 1.7777777777777777

				if var_24_50 < var_24_44.aspect then
					var_24_49 = var_24_48 / (2 * var_24_47 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_24_50)
				end

				for iter_24_2, iter_24_3 in ipairs(var_24_46) do
					local var_24_51 = iter_24_3.transform.localScale

					iter_24_3.transform.localScale = Vector3.New(var_24_51.x / var_24_45 * var_24_49, var_24_51.y / var_24_45, var_24_51.z)
				end
			end

			local var_24_52 = 0
			local var_24_53 = 0.1

			if var_24_52 < arg_21_1.time_ and arg_21_1.time_ <= var_24_52 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0

				arg_21_1.dialog_:SetActive(true)

				local var_24_54 = LeanTween.value(arg_21_1.dialog_, 0, 1, 0.3)

				var_24_54:setOnUpdate(LuaHelper.FloatAction(function(arg_25_0)
					arg_21_1.dialogCg_.alpha = arg_25_0
				end))
				var_24_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_21_1.dialog_)
					var_24_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_21_1.duration_ = arg_21_1.duration_ + 0.3

				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_55 = arg_21_1:GetWordFromCfg(100)
				local var_24_56 = arg_21_1:FormatText(var_24_55.content)

				arg_21_1.text_.text = var_24_56

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_57 = 4
				local var_24_58 = utf8.len(var_24_56)
				local var_24_59 = var_24_57 <= 0 and var_24_53 or var_24_53 * (var_24_58 / var_24_57)

				if var_24_59 > 0 and var_24_53 < var_24_59 then
					arg_21_1.talkMaxDuration = var_24_59
					var_24_52 = var_24_52 + 0.3

					if var_24_59 + var_24_52 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_59 + var_24_52
					end
				end

				arg_21_1.text_.text = var_24_56
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_60 = var_24_52 + 0.3
			local var_24_61 = math.max(var_24_53, arg_21_1.talkMaxDuration)

			if var_24_60 <= arg_21_1.time_ and arg_21_1.time_ < var_24_60 + var_24_61 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_60) / var_24_61

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_60 + var_24_61 and arg_21_1.time_ < var_24_60 + var_24_61 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play105 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 105
		arg_27_1.duration_ = 7.37

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play106(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1148ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and not isNil(var_30_0) and arg_27_1.var_.characterEffect1148ui_story == nil then
				arg_27_1.var_.characterEffect1148ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 and not isNil(var_30_0) then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1148ui_story and not isNil(var_30_0) then
					arg_27_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and not isNil(var_30_0) and arg_27_1.var_.characterEffect1148ui_story then
				arg_27_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["1084ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and not isNil(var_30_4) and arg_27_1.var_.characterEffect1084ui_story == nil then
				arg_27_1.var_.characterEffect1084ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 and not isNil(var_30_4) then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1084ui_story and not isNil(var_30_4) then
					arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and not isNil(var_30_4) and arg_27_1.var_.characterEffect1084ui_story then
				arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_30_8 = "ST05a"

			if arg_27_1.bgs_[var_30_8] == nil then
				local var_30_9 = Object.Instantiate(arg_27_1.paintGo_)

				var_30_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_30_8)
				var_30_9.name = var_30_8
				var_30_9.transform.parent = arg_27_1.stage_.transform
				var_30_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.bgs_[var_30_8] = var_30_9
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				local var_30_11 = manager.ui.mainCamera.transform.localPosition
				local var_30_12 = Vector3.New(0, 0, 10) + Vector3.New(var_30_11.x, var_30_11.y, 0)
				local var_30_13 = arg_27_1.bgs_.ST05a

				var_30_13.transform.localPosition = var_30_12
				var_30_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_30_14 = var_30_13:GetComponent("SpriteRenderer")

				if var_30_14 and var_30_14.sprite then
					local var_30_15 = (var_30_13.transform.localPosition - var_30_11).z
					local var_30_16 = manager.ui.mainCameraCom_
					local var_30_17 = 2 * var_30_15 * Mathf.Tan(var_30_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_30_18 = var_30_17 * var_30_16.aspect
					local var_30_19 = var_30_14.sprite.bounds.size.x
					local var_30_20 = var_30_14.sprite.bounds.size.y
					local var_30_21 = var_30_18 / var_30_19
					local var_30_22 = var_30_17 / var_30_20
					local var_30_23 = var_30_22 < var_30_21 and var_30_21 or var_30_22

					var_30_13.transform.localScale = Vector3.New(var_30_23, var_30_23, 0)
				end

				for iter_30_0, iter_30_1 in pairs(arg_27_1.bgs_) do
					if iter_30_0 ~= "ST05a" then
						iter_30_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_30_24 = arg_27_1.bgs_.ST05.transform
			local var_30_25 = 0

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 then
				arg_27_1.var_.moveOldPosST05 = var_30_24.localPosition
			end

			local var_30_26 = 0.001

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_26 then
				local var_30_27 = (arg_27_1.time_ - var_30_25) / var_30_26
				local var_30_28 = Vector3.New(0, -100, 10)

				var_30_24.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPosST05, var_30_28, var_30_27)
			end

			if arg_27_1.time_ >= var_30_25 + var_30_26 and arg_27_1.time_ < var_30_25 + var_30_26 + arg_30_0 then
				var_30_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_30_29 = 0

			if var_30_29 < arg_27_1.time_ and arg_27_1.time_ <= var_30_29 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action423")
			end

			local var_30_30 = 0
			local var_30_31 = 0.1

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0

				arg_27_1.dialog_:SetActive(true)

				local var_30_32 = LeanTween.value(arg_27_1.dialog_, 0, 1, 0.3)

				var_30_32:setOnUpdate(LuaHelper.FloatAction(function(arg_31_0)
					arg_27_1.dialogCg_.alpha = arg_31_0
				end))
				var_30_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_27_1.dialog_)
					var_30_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_27_1.duration_ = arg_27_1.duration_ + 0.3

				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_33 = arg_27_1:GetWordFromCfg(100)
				local var_30_34 = arg_27_1:FormatText(var_30_33.content)

				arg_27_1.text_.text = var_30_34

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_35 = 4
				local var_30_36 = utf8.len(var_30_34)
				local var_30_37 = var_30_35 <= 0 and var_30_31 or var_30_31 * (var_30_36 / var_30_35)

				if var_30_37 > 0 and var_30_31 < var_30_37 then
					arg_27_1.talkMaxDuration = var_30_37
					var_30_30 = var_30_30 + 0.3

					if var_30_37 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_37 + var_30_30
					end
				end

				arg_27_1.text_.text = var_30_34
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_38 = var_30_30 + 0.3
			local var_30_39 = math.max(var_30_31, arg_27_1.talkMaxDuration)

			if var_30_38 <= arg_27_1.time_ and arg_27_1.time_ < var_30_38 + var_30_39 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_38) / var_30_39

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_38 + var_30_39 and arg_27_1.time_ < var_30_38 + var_30_39 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play106 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 106
		arg_33_1.duration_ = 2

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play107(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1148ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and not isNil(var_36_0) and arg_33_1.var_.characterEffect1148ui_story == nil then
				arg_33_1.var_.characterEffect1148ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.1

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 and not isNil(var_36_0) then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1148ui_story and not isNil(var_36_0) then
					arg_33_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and not isNil(var_36_0) and arg_33_1.var_.characterEffect1148ui_story then
				arg_33_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_36_4 = 0.100000001490116

			if var_36_4 < arg_33_1.time_ and arg_33_1.time_ <= var_36_4 + arg_36_0 then
				SetActive(arg_33_1.dialog_, true)
				SetActive(arg_33_1.allBtn_.gameObject, true)
				arg_33_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()

				arg_33_1.isInLoopVideo = false
			end

			local var_36_5 = 0.1

			if var_36_4 <= arg_33_1.time_ and arg_33_1.time_ < var_36_4 + var_36_5 then
				-- block empty
			end

			if arg_33_1.time_ >= var_36_4 + var_36_5 and arg_33_1.time_ < var_36_4 + var_36_5 + arg_36_0 then
				-- block empty
			end

			local var_36_6 = arg_33_1.actors_["1084ui_story"]
			local var_36_7 = 0

			if var_36_7 < arg_33_1.time_ and arg_33_1.time_ <= var_36_7 + arg_36_0 and not isNil(var_36_6) and arg_33_1.var_.characterEffect1084ui_story == nil then
				arg_33_1.var_.characterEffect1084ui_story = var_36_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_8 = 0.1

			if var_36_7 <= arg_33_1.time_ and arg_33_1.time_ < var_36_7 + var_36_8 and not isNil(var_36_6) then
				local var_36_9 = (arg_33_1.time_ - var_36_7) / var_36_8

				if arg_33_1.var_.characterEffect1084ui_story and not isNil(var_36_6) then
					arg_33_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_7 + var_36_8 and arg_33_1.time_ < var_36_7 + var_36_8 + arg_36_0 and not isNil(var_36_6) and arg_33_1.var_.characterEffect1084ui_story then
				arg_33_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_36_10 = "ST06"

			if arg_33_1.bgs_[var_36_10] == nil then
				local var_36_11 = Object.Instantiate(arg_33_1.paintGo_)

				var_36_11:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_36_10)
				var_36_11.name = var_36_10
				var_36_11.transform.parent = arg_33_1.stage_.transform
				var_36_11.transform.localPosition = Vector3.New(0, 100, 0)
				arg_33_1.bgs_[var_36_10] = var_36_11
			end

			local var_36_12 = 0

			if var_36_12 < arg_33_1.time_ and arg_33_1.time_ <= var_36_12 + arg_36_0 then
				local var_36_13 = manager.ui.mainCamera.transform.localPosition
				local var_36_14 = Vector3.New(0, 0, 10) + Vector3.New(var_36_13.x, var_36_13.y, 0)
				local var_36_15 = arg_33_1.bgs_.ST06

				var_36_15.transform.localPosition = var_36_14
				var_36_15.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_36_16 = var_36_15:GetComponent("SpriteRenderer")

				if var_36_16 and var_36_16.sprite then
					local var_36_17 = (var_36_15.transform.localPosition - var_36_13).z
					local var_36_18 = manager.ui.mainCameraCom_
					local var_36_19 = 2 * var_36_17 * Mathf.Tan(var_36_18.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_36_20 = var_36_19 * var_36_18.aspect
					local var_36_21 = var_36_16.sprite.bounds.size.x
					local var_36_22 = var_36_16.sprite.bounds.size.y
					local var_36_23 = var_36_20 / var_36_21
					local var_36_24 = var_36_19 / var_36_22
					local var_36_25 = var_36_24 < var_36_23 and var_36_23 or var_36_24

					var_36_15.transform.localScale = Vector3.New(var_36_25, var_36_25, 0)
				end

				for iter_36_0, iter_36_1 in pairs(arg_33_1.bgs_) do
					if iter_36_0 ~= "ST06" then
						iter_36_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_36_26 = arg_33_1.bgs_.ST05a.transform
			local var_36_27 = 0

			if var_36_27 < arg_33_1.time_ and arg_33_1.time_ <= var_36_27 + arg_36_0 then
				arg_33_1.var_.moveOldPosST05a = var_36_26.localPosition
			end

			local var_36_28 = 0.001

			if var_36_27 <= arg_33_1.time_ and arg_33_1.time_ < var_36_27 + var_36_28 then
				local var_36_29 = (arg_33_1.time_ - var_36_27) / var_36_28
				local var_36_30 = Vector3.New(0, -100, 10)

				var_36_26.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPosST05a, var_36_30, var_36_29)
			end

			if arg_33_1.time_ >= var_36_27 + var_36_28 and arg_33_1.time_ < var_36_27 + var_36_28 + arg_36_0 then
				var_36_26.localPosition = Vector3.New(0, -100, 10)
			end

			local var_36_31 = 0

			if var_36_31 < arg_33_1.time_ and arg_33_1.time_ <= var_36_31 + arg_36_0 then
				arg_33_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action423")
			end

			local var_36_32 = 0
			local var_36_33 = 0.1

			if var_36_32 < arg_33_1.time_ and arg_33_1.time_ <= var_36_32 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0

				arg_33_1.dialog_:SetActive(true)

				local var_36_34 = LeanTween.value(arg_33_1.dialog_, 0, 1, 0.3)

				var_36_34:setOnUpdate(LuaHelper.FloatAction(function(arg_37_0)
					arg_33_1.dialogCg_.alpha = arg_37_0
				end))
				var_36_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_33_1.dialog_)
					var_36_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_33_1.duration_ = arg_33_1.duration_ + 0.3

				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_35 = arg_33_1:GetWordFromCfg(100)
				local var_36_36 = arg_33_1:FormatText(var_36_35.content)

				arg_33_1.text_.text = var_36_36

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_37 = 4
				local var_36_38 = utf8.len(var_36_36)
				local var_36_39 = var_36_37 <= 0 and var_36_33 or var_36_33 * (var_36_38 / var_36_37)

				if var_36_39 > 0 and var_36_33 < var_36_39 then
					arg_33_1.talkMaxDuration = var_36_39
					var_36_32 = var_36_32 + 0.3

					if var_36_39 + var_36_32 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_39 + var_36_32
					end
				end

				arg_33_1.text_.text = var_36_36
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_40 = var_36_32 + 0.3
			local var_36_41 = math.max(var_36_33, arg_33_1.talkMaxDuration)

			if var_36_40 <= arg_33_1.time_ and arg_33_1.time_ < var_36_40 + var_36_41 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_40) / var_36_41

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_40 + var_36_41 and arg_33_1.time_ < var_36_40 + var_36_41 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play107 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 107
		arg_39_1.duration_ = 6.8

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play108(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1148ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and not isNil(var_42_0) and arg_39_1.var_.characterEffect1148ui_story == nil then
				arg_39_1.var_.characterEffect1148ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 and not isNil(var_42_0) then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1148ui_story and not isNil(var_42_0) then
					arg_39_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and not isNil(var_42_0) and arg_39_1.var_.characterEffect1148ui_story then
				arg_39_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1084ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and not isNil(var_42_4) and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 and not isNil(var_42_4) then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1084ui_story and not isNil(var_42_4) then
					arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and not isNil(var_42_4) and arg_39_1.var_.characterEffect1084ui_story then
				arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_42_8 = "ST06a"

			if arg_39_1.bgs_[var_42_8] == nil then
				local var_42_9 = Object.Instantiate(arg_39_1.paintGo_)

				var_42_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_42_8)
				var_42_9.name = var_42_8
				var_42_9.transform.parent = arg_39_1.stage_.transform
				var_42_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_39_1.bgs_[var_42_8] = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				local var_42_11 = manager.ui.mainCamera.transform.localPosition
				local var_42_12 = Vector3.New(0, 0, 10) + Vector3.New(var_42_11.x, var_42_11.y, 0)
				local var_42_13 = arg_39_1.bgs_.ST06a

				var_42_13.transform.localPosition = var_42_12
				var_42_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_14 = var_42_13:GetComponent("SpriteRenderer")

				if var_42_14 and var_42_14.sprite then
					local var_42_15 = (var_42_13.transform.localPosition - var_42_11).z
					local var_42_16 = manager.ui.mainCameraCom_
					local var_42_17 = 2 * var_42_15 * Mathf.Tan(var_42_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_18 = var_42_17 * var_42_16.aspect
					local var_42_19 = var_42_14.sprite.bounds.size.x
					local var_42_20 = var_42_14.sprite.bounds.size.y
					local var_42_21 = var_42_18 / var_42_19
					local var_42_22 = var_42_17 / var_42_20
					local var_42_23 = var_42_22 < var_42_21 and var_42_21 or var_42_22

					var_42_13.transform.localScale = Vector3.New(var_42_23, var_42_23, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "ST06a" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_42_24 = arg_39_1.bgs_.ST06.transform
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 then
				arg_39_1.var_.moveOldPosST06 = var_42_24.localPosition
			end

			local var_42_26 = 0.001

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26
				local var_42_28 = Vector3.New(0, -100, 10)

				var_42_24.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPosST06, var_42_28, var_42_27)
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 then
				var_42_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_42_29 = 0

			if var_42_29 < arg_39_1.time_ and arg_39_1.time_ <= var_42_29 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action434")
			end

			local var_42_30 = 0
			local var_42_31 = 0.1

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_32 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_32:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(100)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 4
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37
					var_42_30 = var_42_30 + 0.3

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_38 = var_42_30 + 0.3
			local var_42_39 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_38 <= arg_39_1.time_ and arg_39_1.time_ < var_42_38 + var_42_39 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_38) / var_42_39

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_38 + var_42_39 and arg_39_1.time_ < var_42_38 + var_42_39 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play108 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 108
		arg_45_1.duration_ = 7.05

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play109(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1148ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and not isNil(var_48_0) and arg_45_1.var_.characterEffect1148ui_story == nil then
				arg_45_1.var_.characterEffect1148ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.1

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 and not isNil(var_48_0) then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1148ui_story and not isNil(var_48_0) then
					arg_45_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and not isNil(var_48_0) and arg_45_1.var_.characterEffect1148ui_story then
				arg_45_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_48_4 = arg_45_1.actors_["1084ui_story"]
			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 and not isNil(var_48_4) and arg_45_1.var_.characterEffect1084ui_story == nil then
				arg_45_1.var_.characterEffect1084ui_story = var_48_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_6 = 0.1

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 and not isNil(var_48_4) then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6

				if arg_45_1.var_.characterEffect1084ui_story and not isNil(var_48_4) then
					arg_45_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 and not isNil(var_48_4) and arg_45_1.var_.characterEffect1084ui_story then
				arg_45_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_48_8 = "ST06b"

			if arg_45_1.bgs_[var_48_8] == nil then
				local var_48_9 = Object.Instantiate(arg_45_1.paintGo_)

				var_48_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_48_8)
				var_48_9.name = var_48_8
				var_48_9.transform.parent = arg_45_1.stage_.transform
				var_48_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.bgs_[var_48_8] = var_48_9
			end

			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 then
				local var_48_11 = manager.ui.mainCamera.transform.localPosition
				local var_48_12 = Vector3.New(0, 0, 10) + Vector3.New(var_48_11.x, var_48_11.y, 0)
				local var_48_13 = arg_45_1.bgs_.ST06b

				var_48_13.transform.localPosition = var_48_12
				var_48_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_48_14 = var_48_13:GetComponent("SpriteRenderer")

				if var_48_14 and var_48_14.sprite then
					local var_48_15 = (var_48_13.transform.localPosition - var_48_11).z
					local var_48_16 = manager.ui.mainCameraCom_
					local var_48_17 = 2 * var_48_15 * Mathf.Tan(var_48_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_48_18 = var_48_17 * var_48_16.aspect
					local var_48_19 = var_48_14.sprite.bounds.size.x
					local var_48_20 = var_48_14.sprite.bounds.size.y
					local var_48_21 = var_48_18 / var_48_19
					local var_48_22 = var_48_17 / var_48_20
					local var_48_23 = var_48_22 < var_48_21 and var_48_21 or var_48_22

					var_48_13.transform.localScale = Vector3.New(var_48_23, var_48_23, 0)
				end

				for iter_48_0, iter_48_1 in pairs(arg_45_1.bgs_) do
					if iter_48_0 ~= "ST06b" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_24 = arg_45_1.bgs_.ST06a.transform
			local var_48_25 = 0

			if var_48_25 < arg_45_1.time_ and arg_45_1.time_ <= var_48_25 + arg_48_0 then
				arg_45_1.var_.moveOldPosST06a = var_48_24.localPosition
			end

			local var_48_26 = 0.001

			if var_48_25 <= arg_45_1.time_ and arg_45_1.time_ < var_48_25 + var_48_26 then
				local var_48_27 = (arg_45_1.time_ - var_48_25) / var_48_26
				local var_48_28 = Vector3.New(0, -100, 10)

				var_48_24.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPosST06a, var_48_28, var_48_27)
			end

			if arg_45_1.time_ >= var_48_25 + var_48_26 and arg_45_1.time_ < var_48_25 + var_48_26 + arg_48_0 then
				var_48_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_48_29 = 0

			if var_48_29 < arg_45_1.time_ and arg_45_1.time_ <= var_48_29 + arg_48_0 then
				arg_45_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action434")
			end

			local var_48_30 = 0
			local var_48_31 = 0.1

			if var_48_30 < arg_45_1.time_ and arg_45_1.time_ <= var_48_30 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_32 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_32:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_33 = arg_45_1:GetWordFromCfg(100)
				local var_48_34 = arg_45_1:FormatText(var_48_33.content)

				arg_45_1.text_.text = var_48_34

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_35 = 4
				local var_48_36 = utf8.len(var_48_34)
				local var_48_37 = var_48_35 <= 0 and var_48_31 or var_48_31 * (var_48_36 / var_48_35)

				if var_48_37 > 0 and var_48_31 < var_48_37 then
					arg_45_1.talkMaxDuration = var_48_37
					var_48_30 = var_48_30 + 0.3

					if var_48_37 + var_48_30 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_37 + var_48_30
					end
				end

				arg_45_1.text_.text = var_48_34
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_38 = var_48_30 + 0.3
			local var_48_39 = math.max(var_48_31, arg_45_1.talkMaxDuration)

			if var_48_38 <= arg_45_1.time_ and arg_45_1.time_ < var_48_38 + var_48_39 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_38) / var_48_39

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_38 + var_48_39 and arg_45_1.time_ < var_48_38 + var_48_39 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play109 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 109
		arg_51_1.duration_ = 6.67

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play110(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1148ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and not isNil(var_54_0) and arg_51_1.var_.characterEffect1148ui_story == nil then
				arg_51_1.var_.characterEffect1148ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 and not isNil(var_54_0) then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1148ui_story and not isNil(var_54_0) then
					arg_51_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and not isNil(var_54_0) and arg_51_1.var_.characterEffect1148ui_story then
				arg_51_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["1084ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and not isNil(var_54_4) and arg_51_1.var_.characterEffect1084ui_story == nil then
				arg_51_1.var_.characterEffect1084ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 and not isNil(var_54_4) then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect1084ui_story and not isNil(var_54_4) then
					arg_51_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and not isNil(var_54_4) and arg_51_1.var_.characterEffect1084ui_story then
				arg_51_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_54_8 = arg_51_1.bgs_.ST06b.transform
			local var_54_9 = 0

			if var_54_9 < arg_51_1.time_ and arg_51_1.time_ <= var_54_9 + arg_54_0 then
				arg_51_1.var_.moveOldPosST06b = var_54_8.localPosition
			end

			local var_54_10 = 0.001

			if var_54_9 <= arg_51_1.time_ and arg_51_1.time_ < var_54_9 + var_54_10 then
				local var_54_11 = (arg_51_1.time_ - var_54_9) / var_54_10
				local var_54_12 = Vector3.New(0, -100, 10)

				var_54_8.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosST06b, var_54_12, var_54_11)
			end

			if arg_51_1.time_ >= var_54_9 + var_54_10 and arg_51_1.time_ < var_54_9 + var_54_10 + arg_54_0 then
				var_54_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_54_13 = "ST07a"

			if arg_51_1.bgs_[var_54_13] == nil then
				local var_54_14 = Object.Instantiate(arg_51_1.paintGo_)

				var_54_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_54_13)
				var_54_14.name = var_54_13
				var_54_14.transform.parent = arg_51_1.stage_.transform
				var_54_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.bgs_[var_54_13] = var_54_14
			end

			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				local var_54_16 = manager.ui.mainCamera.transform.localPosition
				local var_54_17 = Vector3.New(0, 0, 10) + Vector3.New(var_54_16.x, var_54_16.y, 0)
				local var_54_18 = arg_51_1.bgs_.ST07a

				var_54_18.transform.localPosition = var_54_17
				var_54_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_54_19 = var_54_18:GetComponent("SpriteRenderer")

				if var_54_19 and var_54_19.sprite then
					local var_54_20 = (var_54_18.transform.localPosition - var_54_16).z
					local var_54_21 = manager.ui.mainCameraCom_
					local var_54_22 = 2 * var_54_20 * Mathf.Tan(var_54_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_54_23 = var_54_22 * var_54_21.aspect
					local var_54_24 = var_54_19.sprite.bounds.size.x
					local var_54_25 = var_54_19.sprite.bounds.size.y
					local var_54_26 = var_54_23 / var_54_24
					local var_54_27 = var_54_22 / var_54_25
					local var_54_28 = var_54_27 < var_54_26 and var_54_26 or var_54_27

					var_54_18.transform.localScale = Vector3.New(var_54_28, var_54_28, 0)
				end

				for iter_54_0, iter_54_1 in pairs(arg_51_1.bgs_) do
					if iter_54_0 ~= "ST07a" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_29 = 0

			if var_54_29 < arg_51_1.time_ and arg_51_1.time_ <= var_54_29 + arg_54_0 then
				arg_51_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action445")
			end

			local var_54_30 = 0
			local var_54_31 = 0.1

			if var_54_30 < arg_51_1.time_ and arg_51_1.time_ <= var_54_30 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_32 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_32:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_33 = arg_51_1:GetWordFromCfg(100)
				local var_54_34 = arg_51_1:FormatText(var_54_33.content)

				arg_51_1.text_.text = var_54_34

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_35 = 4
				local var_54_36 = utf8.len(var_54_34)
				local var_54_37 = var_54_35 <= 0 and var_54_31 or var_54_31 * (var_54_36 / var_54_35)

				if var_54_37 > 0 and var_54_31 < var_54_37 then
					arg_51_1.talkMaxDuration = var_54_37
					var_54_30 = var_54_30 + 0.3

					if var_54_37 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_37 + var_54_30
					end
				end

				arg_51_1.text_.text = var_54_34
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_38 = var_54_30 + 0.3
			local var_54_39 = math.max(var_54_31, arg_51_1.talkMaxDuration)

			if var_54_38 <= arg_51_1.time_ and arg_51_1.time_ < var_54_38 + var_54_39 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_38) / var_54_39

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_38 + var_54_39 and arg_51_1.time_ < var_54_38 + var_54_39 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play110 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 110
		arg_57_1.duration_ = 6.77

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play111(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1148ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and not isNil(var_60_0) and arg_57_1.var_.characterEffect1148ui_story == nil then
				arg_57_1.var_.characterEffect1148ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.1

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 and not isNil(var_60_0) then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1148ui_story and not isNil(var_60_0) then
					arg_57_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and not isNil(var_60_0) and arg_57_1.var_.characterEffect1148ui_story then
				arg_57_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_60_4 = arg_57_1.actors_["1084ui_story"]
			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 and not isNil(var_60_4) and arg_57_1.var_.characterEffect1084ui_story == nil then
				arg_57_1.var_.characterEffect1084ui_story = var_60_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_6 = 0.1

			if var_60_5 <= arg_57_1.time_ and arg_57_1.time_ < var_60_5 + var_60_6 and not isNil(var_60_4) then
				local var_60_7 = (arg_57_1.time_ - var_60_5) / var_60_6

				if arg_57_1.var_.characterEffect1084ui_story and not isNil(var_60_4) then
					arg_57_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_5 + var_60_6 and arg_57_1.time_ < var_60_5 + var_60_6 + arg_60_0 and not isNil(var_60_4) and arg_57_1.var_.characterEffect1084ui_story then
				arg_57_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_60_8 = arg_57_1.bgs_.ST07a.transform
			local var_60_9 = 0

			if var_60_9 < arg_57_1.time_ and arg_57_1.time_ <= var_60_9 + arg_60_0 then
				arg_57_1.var_.moveOldPosST07a = var_60_8.localPosition
			end

			local var_60_10 = 0.001

			if var_60_9 <= arg_57_1.time_ and arg_57_1.time_ < var_60_9 + var_60_10 then
				local var_60_11 = (arg_57_1.time_ - var_60_9) / var_60_10
				local var_60_12 = Vector3.New(0, -100, 10)

				var_60_8.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPosST07a, var_60_12, var_60_11)
			end

			if arg_57_1.time_ >= var_60_9 + var_60_10 and arg_57_1.time_ < var_60_9 + var_60_10 + arg_60_0 then
				var_60_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_60_13 = "ST07b"

			if arg_57_1.bgs_[var_60_13] == nil then
				local var_60_14 = Object.Instantiate(arg_57_1.paintGo_)

				var_60_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_60_13)
				var_60_14.name = var_60_13
				var_60_14.transform.parent = arg_57_1.stage_.transform
				var_60_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_57_1.bgs_[var_60_13] = var_60_14
			end

			local var_60_15 = 0

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				local var_60_16 = manager.ui.mainCamera.transform.localPosition
				local var_60_17 = Vector3.New(0, 0, 10) + Vector3.New(var_60_16.x, var_60_16.y, 0)
				local var_60_18 = arg_57_1.bgs_.ST07b

				var_60_18.transform.localPosition = var_60_17
				var_60_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_60_19 = var_60_18:GetComponent("SpriteRenderer")

				if var_60_19 and var_60_19.sprite then
					local var_60_20 = (var_60_18.transform.localPosition - var_60_16).z
					local var_60_21 = manager.ui.mainCameraCom_
					local var_60_22 = 2 * var_60_20 * Mathf.Tan(var_60_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_60_23 = var_60_22 * var_60_21.aspect
					local var_60_24 = var_60_19.sprite.bounds.size.x
					local var_60_25 = var_60_19.sprite.bounds.size.y
					local var_60_26 = var_60_23 / var_60_24
					local var_60_27 = var_60_22 / var_60_25
					local var_60_28 = var_60_27 < var_60_26 and var_60_26 or var_60_27

					var_60_18.transform.localScale = Vector3.New(var_60_28, var_60_28, 0)
				end

				for iter_60_0, iter_60_1 in pairs(arg_57_1.bgs_) do
					if iter_60_0 ~= "ST07b" then
						iter_60_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_60_29 = 0

			if var_60_29 < arg_57_1.time_ and arg_57_1.time_ <= var_60_29 + arg_60_0 then
				arg_57_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action445")
			end

			local var_60_30 = 0
			local var_60_31 = 0.1

			if var_60_30 < arg_57_1.time_ and arg_57_1.time_ <= var_60_30 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0

				arg_57_1.dialog_:SetActive(true)

				local var_60_32 = LeanTween.value(arg_57_1.dialog_, 0, 1, 0.3)

				var_60_32:setOnUpdate(LuaHelper.FloatAction(function(arg_61_0)
					arg_57_1.dialogCg_.alpha = arg_61_0
				end))
				var_60_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_57_1.dialog_)
					var_60_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_57_1.duration_ = arg_57_1.duration_ + 0.3

				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_33 = arg_57_1:GetWordFromCfg(100)
				local var_60_34 = arg_57_1:FormatText(var_60_33.content)

				arg_57_1.text_.text = var_60_34

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_35 = 4
				local var_60_36 = utf8.len(var_60_34)
				local var_60_37 = var_60_35 <= 0 and var_60_31 or var_60_31 * (var_60_36 / var_60_35)

				if var_60_37 > 0 and var_60_31 < var_60_37 then
					arg_57_1.talkMaxDuration = var_60_37
					var_60_30 = var_60_30 + 0.3

					if var_60_37 + var_60_30 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_37 + var_60_30
					end
				end

				arg_57_1.text_.text = var_60_34
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_38 = var_60_30 + 0.3
			local var_60_39 = math.max(var_60_31, arg_57_1.talkMaxDuration)

			if var_60_38 <= arg_57_1.time_ and arg_57_1.time_ < var_60_38 + var_60_39 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_38) / var_60_39

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_38 + var_60_39 and arg_57_1.time_ < var_60_38 + var_60_39 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play111 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 111
		arg_63_1.duration_ = 7.33

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play112(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1148ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and not isNil(var_66_0) and arg_63_1.var_.characterEffect1148ui_story == nil then
				arg_63_1.var_.characterEffect1148ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 and not isNil(var_66_0) then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1148ui_story and not isNil(var_66_0) then
					arg_63_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and not isNil(var_66_0) and arg_63_1.var_.characterEffect1148ui_story then
				arg_63_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1084ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and not isNil(var_66_4) and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 and not isNil(var_66_4) then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1084ui_story and not isNil(var_66_4) then
					arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and not isNil(var_66_4) and arg_63_1.var_.characterEffect1084ui_story then
				arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_66_8 = arg_63_1.bgs_.ST07b.transform
			local var_66_9 = 0

			if var_66_9 < arg_63_1.time_ and arg_63_1.time_ <= var_66_9 + arg_66_0 then
				arg_63_1.var_.moveOldPosST07b = var_66_8.localPosition
			end

			local var_66_10 = 0.001

			if var_66_9 <= arg_63_1.time_ and arg_63_1.time_ < var_66_9 + var_66_10 then
				local var_66_11 = (arg_63_1.time_ - var_66_9) / var_66_10
				local var_66_12 = Vector3.New(0, -100, 10)

				var_66_8.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPosST07b, var_66_12, var_66_11)
			end

			if arg_63_1.time_ >= var_66_9 + var_66_10 and arg_63_1.time_ < var_66_9 + var_66_10 + arg_66_0 then
				var_66_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_66_13 = "ST08"

			if arg_63_1.bgs_[var_66_13] == nil then
				local var_66_14 = Object.Instantiate(arg_63_1.paintGo_)

				var_66_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_66_13)
				var_66_14.name = var_66_13
				var_66_14.transform.parent = arg_63_1.stage_.transform
				var_66_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.bgs_[var_66_13] = var_66_14
			end

			local var_66_15 = 0

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 then
				local var_66_16 = manager.ui.mainCamera.transform.localPosition
				local var_66_17 = Vector3.New(0, 0, 10) + Vector3.New(var_66_16.x, var_66_16.y, 0)
				local var_66_18 = arg_63_1.bgs_.ST08

				var_66_18.transform.localPosition = var_66_17
				var_66_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_19 = var_66_18:GetComponent("SpriteRenderer")

				if var_66_19 and var_66_19.sprite then
					local var_66_20 = (var_66_18.transform.localPosition - var_66_16).z
					local var_66_21 = manager.ui.mainCameraCom_
					local var_66_22 = 2 * var_66_20 * Mathf.Tan(var_66_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_23 = var_66_22 * var_66_21.aspect
					local var_66_24 = var_66_19.sprite.bounds.size.x
					local var_66_25 = var_66_19.sprite.bounds.size.y
					local var_66_26 = var_66_23 / var_66_24
					local var_66_27 = var_66_22 / var_66_25
					local var_66_28 = var_66_27 < var_66_26 and var_66_26 or var_66_27

					var_66_18.transform.localScale = Vector3.New(var_66_28, var_66_28, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "ST08" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_29 = 0

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action456")
			end

			local var_66_30 = 0
			local var_66_31 = 0.1

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_32 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_32:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_33 = arg_63_1:GetWordFromCfg(100)
				local var_66_34 = arg_63_1:FormatText(var_66_33.content)

				arg_63_1.text_.text = var_66_34

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_35 = 4
				local var_66_36 = utf8.len(var_66_34)
				local var_66_37 = var_66_35 <= 0 and var_66_31 or var_66_31 * (var_66_36 / var_66_35)

				if var_66_37 > 0 and var_66_31 < var_66_37 then
					arg_63_1.talkMaxDuration = var_66_37
					var_66_30 = var_66_30 + 0.3

					if var_66_37 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_37 + var_66_30
					end
				end

				arg_63_1.text_.text = var_66_34
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_38 = var_66_30 + 0.3
			local var_66_39 = math.max(var_66_31, arg_63_1.talkMaxDuration)

			if var_66_38 <= arg_63_1.time_ and arg_63_1.time_ < var_66_38 + var_66_39 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_38) / var_66_39

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_38 + var_66_39 and arg_63_1.time_ < var_66_38 + var_66_39 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play112 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 112
		arg_69_1.duration_ = 6.93

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
			arg_69_1.auto_ = false
		end

		function arg_69_1.playNext_(arg_71_0)
			arg_69_1.onStoryFinished_()
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1148ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and not isNil(var_72_0) and arg_69_1.var_.characterEffect1148ui_story == nil then
				arg_69_1.var_.characterEffect1148ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.1

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 and not isNil(var_72_0) then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1148ui_story and not isNil(var_72_0) then
					arg_69_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and not isNil(var_72_0) and arg_69_1.var_.characterEffect1148ui_story then
				arg_69_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_72_4 = arg_69_1.actors_["1084ui_story"]
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 and not isNil(var_72_4) and arg_69_1.var_.characterEffect1084ui_story == nil then
				arg_69_1.var_.characterEffect1084ui_story = var_72_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_6 = 0.1

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 and not isNil(var_72_4) then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6

				if arg_69_1.var_.characterEffect1084ui_story and not isNil(var_72_4) then
					arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 and not isNil(var_72_4) and arg_69_1.var_.characterEffect1084ui_story then
				arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_72_8 = arg_69_1.bgs_.ST08.transform
			local var_72_9 = 0

			if var_72_9 < arg_69_1.time_ and arg_69_1.time_ <= var_72_9 + arg_72_0 then
				arg_69_1.var_.moveOldPosST08 = var_72_8.localPosition
			end

			local var_72_10 = 0.001

			if var_72_9 <= arg_69_1.time_ and arg_69_1.time_ < var_72_9 + var_72_10 then
				local var_72_11 = (arg_69_1.time_ - var_72_9) / var_72_10
				local var_72_12 = Vector3.New(0, -100, 10)

				var_72_8.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPosST08, var_72_12, var_72_11)
			end

			if arg_69_1.time_ >= var_72_9 + var_72_10 and arg_69_1.time_ < var_72_9 + var_72_10 + arg_72_0 then
				var_72_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_72_13 = "ST12"

			if arg_69_1.bgs_[var_72_13] == nil then
				local var_72_14 = Object.Instantiate(arg_69_1.paintGo_)

				var_72_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_72_13)
				var_72_14.name = var_72_13
				var_72_14.transform.parent = arg_69_1.stage_.transform
				var_72_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.bgs_[var_72_13] = var_72_14
			end

			local var_72_15 = 0

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				local var_72_16 = manager.ui.mainCamera.transform.localPosition
				local var_72_17 = Vector3.New(0, 0, 10) + Vector3.New(var_72_16.x, var_72_16.y, 0)
				local var_72_18 = arg_69_1.bgs_.ST12

				var_72_18.transform.localPosition = var_72_17
				var_72_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_72_19 = var_72_18:GetComponent("SpriteRenderer")

				if var_72_19 and var_72_19.sprite then
					local var_72_20 = (var_72_18.transform.localPosition - var_72_16).z
					local var_72_21 = manager.ui.mainCameraCom_
					local var_72_22 = 2 * var_72_20 * Mathf.Tan(var_72_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_72_23 = var_72_22 * var_72_21.aspect
					local var_72_24 = var_72_19.sprite.bounds.size.x
					local var_72_25 = var_72_19.sprite.bounds.size.y
					local var_72_26 = var_72_23 / var_72_24
					local var_72_27 = var_72_22 / var_72_25
					local var_72_28 = var_72_27 < var_72_26 and var_72_26 or var_72_27

					var_72_18.transform.localScale = Vector3.New(var_72_28, var_72_28, 0)
				end

				for iter_72_0, iter_72_1 in pairs(arg_69_1.bgs_) do
					if iter_72_0 ~= "ST12" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_29 = 0

			if var_72_29 < arg_69_1.time_ and arg_69_1.time_ <= var_72_29 + arg_72_0 then
				arg_69_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action456")
			end

			local var_72_30 = 0
			local var_72_31 = 0.1

			if var_72_30 < arg_69_1.time_ and arg_69_1.time_ <= var_72_30 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_32 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_32:setOnUpdate(LuaHelper.FloatAction(function(arg_73_0)
					arg_69_1.dialogCg_.alpha = arg_73_0
				end))
				var_72_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_33 = arg_69_1:GetWordFromCfg(100)
				local var_72_34 = arg_69_1:FormatText(var_72_33.content)

				arg_69_1.text_.text = var_72_34

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_35 = 4
				local var_72_36 = utf8.len(var_72_34)
				local var_72_37 = var_72_35 <= 0 and var_72_31 or var_72_31 * (var_72_36 / var_72_35)

				if var_72_37 > 0 and var_72_31 < var_72_37 then
					arg_69_1.talkMaxDuration = var_72_37
					var_72_30 = var_72_30 + 0.3

					if var_72_37 + var_72_30 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_37 + var_72_30
					end
				end

				arg_69_1.text_.text = var_72_34
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_38 = var_72_30 + 0.3
			local var_72_39 = math.max(var_72_31, arg_69_1.talkMaxDuration)

			if var_72_38 <= arg_69_1.time_ and arg_69_1.time_ < var_72_38 + var_72_39 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_38) / var_72_39

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_38 + var_72_39 and arg_69_1.time_ < var_72_38 + var_72_39 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
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
