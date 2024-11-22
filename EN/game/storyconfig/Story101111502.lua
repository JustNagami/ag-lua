return {
	Play111152001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 111152001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play111152002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "D11"

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
				local var_4_5 = arg_1_1.bgs_.D11

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
					if iter_4_0 ~= "D11" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.D11
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueD11 = var_4_20.a
					arg_1_1.var_.alphaMatValueD11 = var_4_19
				end

				arg_1_1.var_.alphaOldValueD11 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueD11, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueD11 then
					local var_4_24 = arg_1_1.var_.alphaMatValueD11
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueD11 then
				local var_4_26 = arg_1_1.var_.alphaMatValueD11
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = 0

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_29 = 2.1

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_30 = 0
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.8

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(111152001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 32
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play111152002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 111152002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play111152003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.2

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

				local var_10_2 = arg_7_1:GetWordFromCfg(111152002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 48
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
	Play111152003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 111152003
		arg_11_1.duration_ = 6

		local var_11_0 = {
			ja = 3.4,
			ko = 5.1,
			zh = 4.566,
			en = 6
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
				arg_11_0:Play111152004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1084ui_story"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("Char/" .. var_14_0), arg_11_1.stage_.transform)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_0] = var_14_1

				local var_14_2 = var_14_1:GetComponentInChildren(typeof(CharacterEffect))

				var_14_2.enabled = true

				local var_14_3 = GameObjectTools.GetOrAddComponent(var_14_1, typeof(DynamicBoneHelper))

				if var_14_3 then
					var_14_3:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_2.transform, false)

				arg_11_1.var_[var_14_0 .. "Animator"] = var_14_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_0 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_0 .. "LipSync"] = var_14_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_4 = arg_11_1.actors_["1084ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1084ui_story = var_14_4.localPosition

				local var_14_6 = "1084ui_story"

				arg_11_1:ShowWeapon(arg_11_1.var_[var_14_6 .. "Animator"].transform, true)
			end

			local var_14_7 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_7 then
				local var_14_8 = (arg_11_1.time_ - var_14_5) / var_14_7
				local var_14_9 = Vector3.New(-0.7, -0.97, -6)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1084ui_story, var_14_9, var_14_8)

				local var_14_10 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_10.x, var_14_10.y, var_14_10.z)

				local var_14_11 = var_14_4.localEulerAngles

				var_14_11.z = 0
				var_14_11.x = 0
				var_14_4.localEulerAngles = var_14_11
			end

			if arg_11_1.time_ >= var_14_5 + var_14_7 and arg_11_1.time_ < var_14_5 + var_14_7 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_14_12 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_12.x, var_14_12.y, var_14_12.z)

				local var_14_13 = var_14_4.localEulerAngles

				var_14_13.z = 0
				var_14_13.x = 0
				var_14_4.localEulerAngles = var_14_13
			end

			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_14_16 = arg_11_1.actors_["1084ui_story"]
			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_18 = 0.2

			if var_14_17 <= arg_11_1.time_ and arg_11_1.time_ < var_14_17 + var_14_18 then
				local var_14_19 = (arg_11_1.time_ - var_14_17) / var_14_18

				if arg_11_1.var_.characterEffect1084ui_story then
					arg_11_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_17 + var_14_18 and arg_11_1.time_ < var_14_17 + var_14_18 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				arg_11_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_14_20 = 0
			local var_14_21 = 0.4

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_22 = arg_11_1:FormatText(StoryNameCfg[6].name)

				arg_11_1.leftNameTxt_.text = var_14_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_23 = arg_11_1:GetWordFromCfg(111152003)
				local var_14_24 = arg_11_1:FormatText(var_14_23.content)

				arg_11_1.text_.text = var_14_24

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_25 = 16
				local var_14_26 = utf8.len(var_14_24)
				local var_14_27 = var_14_25 <= 0 and var_14_21 or var_14_21 * (var_14_26 / var_14_25)

				if var_14_27 > 0 and var_14_21 < var_14_27 then
					arg_11_1.talkMaxDuration = var_14_27

					if var_14_27 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_20
					end
				end

				arg_11_1.text_.text = var_14_24
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152003", "story_v_out_111152.awb") ~= 0 then
					local var_14_28 = manager.audio:GetVoiceLength("story_v_out_111152", "111152003", "story_v_out_111152.awb") / 1000

					if var_14_28 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_20
					end

					if var_14_23.prefab_name ~= "" and arg_11_1.actors_[var_14_23.prefab_name] ~= nil then
						local var_14_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_23.prefab_name].transform, "story_v_out_111152", "111152003", "story_v_out_111152.awb")

						arg_11_1:RecordAudio("111152003", var_14_29)
						arg_11_1:RecordAudio("111152003", var_14_29)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_111152", "111152003", "story_v_out_111152.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_111152", "111152003", "story_v_out_111152.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_30 = math.max(var_14_21, arg_11_1.talkMaxDuration)

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_30 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_20) / var_14_30

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_20 + var_14_30 and arg_11_1.time_ < var_14_20 + var_14_30 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play111152004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 111152004
		arg_15_1.duration_ = 5.533

		local var_15_0 = {
			ja = 5.533,
			ko = 2,
			zh = 3.433,
			en = 3.7
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
				arg_15_0:Play111152005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1048ui_story"

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

			local var_18_4 = arg_15_1.actors_["1048ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1048ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0.7, -0.8, -6.2)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1048ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action8_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_18_15 = arg_15_1.actors_["1048ui_story"]
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 and arg_15_1.var_.characterEffect1048ui_story == nil then
				arg_15_1.var_.characterEffect1048ui_story = var_18_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_17 = 0.2

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17

				if arg_15_1.var_.characterEffect1048ui_story then
					arg_15_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 and arg_15_1.var_.characterEffect1048ui_story then
				arg_15_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_18_19 = arg_15_1.actors_["1084ui_story"]
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_21 = 0.2

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21

				if arg_15_1.var_.characterEffect1084ui_story then
					local var_18_23 = Mathf.Lerp(0, 0.5, var_18_22)

					arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_23
				end
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				local var_18_24 = 0.5

				arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_24
			end

			local var_18_25 = 0
			local var_18_26 = 0.35

			if var_18_25 < arg_15_1.time_ and arg_15_1.time_ <= var_18_25 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_27 = arg_15_1:FormatText(StoryNameCfg[8].name)

				arg_15_1.leftNameTxt_.text = var_18_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_28 = arg_15_1:GetWordFromCfg(111152004)
				local var_18_29 = arg_15_1:FormatText(var_18_28.content)

				arg_15_1.text_.text = var_18_29

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_30 = 14
				local var_18_31 = utf8.len(var_18_29)
				local var_18_32 = var_18_30 <= 0 and var_18_26 or var_18_26 * (var_18_31 / var_18_30)

				if var_18_32 > 0 and var_18_26 < var_18_32 then
					arg_15_1.talkMaxDuration = var_18_32

					if var_18_32 + var_18_25 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_32 + var_18_25
					end
				end

				arg_15_1.text_.text = var_18_29
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152004", "story_v_out_111152.awb") ~= 0 then
					local var_18_33 = manager.audio:GetVoiceLength("story_v_out_111152", "111152004", "story_v_out_111152.awb") / 1000

					if var_18_33 + var_18_25 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_33 + var_18_25
					end

					if var_18_28.prefab_name ~= "" and arg_15_1.actors_[var_18_28.prefab_name] ~= nil then
						local var_18_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_28.prefab_name].transform, "story_v_out_111152", "111152004", "story_v_out_111152.awb")

						arg_15_1:RecordAudio("111152004", var_18_34)
						arg_15_1:RecordAudio("111152004", var_18_34)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_111152", "111152004", "story_v_out_111152.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_111152", "111152004", "story_v_out_111152.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_35 = math.max(var_18_26, arg_15_1.talkMaxDuration)

			if var_18_25 <= arg_15_1.time_ and arg_15_1.time_ < var_18_25 + var_18_35 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_25) / var_18_35

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_25 + var_18_35 and arg_15_1.time_ < var_18_25 + var_18_35 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play111152005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 111152005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play111152006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1048ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1048ui_story == nil then
				arg_19_1.var_.characterEffect1048ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1048ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1048ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1048ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1048ui_story.fillRatio = var_22_5
			end

			local var_22_6 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_6.localPosition
			end

			local var_22_8 = 0.001

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8
				local var_22_10 = Vector3.New(0, 100, 0)

				var_22_6.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_10, var_22_9)

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

			local var_22_15 = arg_19_1.actors_["1048ui_story"].transform
			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.var_.moveOldPos1048ui_story = var_22_15.localPosition
			end

			local var_22_17 = 0.001

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17
				local var_22_19 = Vector3.New(0, 100, 0)

				var_22_15.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1048ui_story, var_22_19, var_22_18)

				local var_22_20 = manager.ui.mainCamera.transform.position - var_22_15.position

				var_22_15.forward = Vector3.New(var_22_20.x, var_22_20.y, var_22_20.z)

				local var_22_21 = var_22_15.localEulerAngles

				var_22_21.z = 0
				var_22_21.x = 0
				var_22_15.localEulerAngles = var_22_21
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				var_22_15.localPosition = Vector3.New(0, 100, 0)

				local var_22_22 = manager.ui.mainCamera.transform.position - var_22_15.position

				var_22_15.forward = Vector3.New(var_22_22.x, var_22_22.y, var_22_22.z)

				local var_22_23 = var_22_15.localEulerAngles

				var_22_23.z = 0
				var_22_23.x = 0
				var_22_15.localEulerAngles = var_22_23
			end

			local var_22_24 = 0
			local var_22_25 = 0.925

			if var_22_24 < arg_19_1.time_ and arg_19_1.time_ <= var_22_24 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_26 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_27 = arg_19_1:GetWordFromCfg(111152005)
				local var_22_28 = arg_19_1:FormatText(var_22_27.content)

				arg_19_1.text_.text = var_22_28

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_29 = 37
				local var_22_30 = utf8.len(var_22_28)
				local var_22_31 = var_22_29 <= 0 and var_22_25 or var_22_25 * (var_22_30 / var_22_29)

				if var_22_31 > 0 and var_22_25 < var_22_31 then
					arg_19_1.talkMaxDuration = var_22_31

					if var_22_31 + var_22_24 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_31 + var_22_24
					end
				end

				arg_19_1.text_.text = var_22_28
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_32 = math.max(var_22_25, arg_19_1.talkMaxDuration)

			if var_22_24 <= arg_19_1.time_ and arg_19_1.time_ < var_22_24 + var_22_32 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_24) / var_22_32

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_24 + var_22_32 and arg_19_1.time_ < var_22_24 + var_22_32 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play111152006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 111152006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play111152007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.05

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_2 = arg_23_1:GetWordFromCfg(111152006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 42
				local var_26_5 = utf8.len(var_26_3)
				local var_26_6 = var_26_4 <= 0 and var_26_1 or var_26_1 * (var_26_5 / var_26_4)

				if var_26_6 > 0 and var_26_1 < var_26_6 then
					arg_23_1.talkMaxDuration = var_26_6

					if var_26_6 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_6 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_3
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_7 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_7 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_7

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_7 and arg_23_1.time_ < var_26_0 + var_26_7 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play111152007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 111152007
		arg_27_1.duration_ = 2.2

		local var_27_0 = {
			ja = 2.2,
			ko = 2.033,
			zh = 1.8,
			en = 2
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
				arg_27_0:Play111152008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = manager.ui.mainCamera.transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.shakeOldPos = var_30_0.localPosition
			end

			local var_30_2 = 0.6

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / 0.066
				local var_30_4, var_30_5 = math.modf(var_30_3)

				var_30_0.localPosition = Vector3.New(var_30_5 * 0.13, var_30_5 * 0.13, var_30_5 * 0.13) + arg_27_1.var_.shakeOldPos
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = arg_27_1.var_.shakeOldPos
			end

			local var_30_6 = 0
			local var_30_7 = 0.2

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[8].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1048")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(111152007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 8
				local var_30_12 = utf8.len(var_30_10)
				local var_30_13 = var_30_11 <= 0 and var_30_7 or var_30_7 * (var_30_12 / var_30_11)

				if var_30_13 > 0 and var_30_7 < var_30_13 then
					arg_27_1.talkMaxDuration = var_30_13

					if var_30_13 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_13 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_10
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152007", "story_v_out_111152.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_111152", "111152007", "story_v_out_111152.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_111152", "111152007", "story_v_out_111152.awb")

						arg_27_1:RecordAudio("111152007", var_30_15)
						arg_27_1:RecordAudio("111152007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_111152", "111152007", "story_v_out_111152.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_111152", "111152007", "story_v_out_111152.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_16 and arg_27_1.time_ < var_30_6 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play111152008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 111152008
		arg_31_1.duration_ = 1.4

		local var_31_0 = {
			ja = 1.066,
			ko = 1.033,
			zh = 0.999999999999,
			en = 1.4
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
				arg_31_0:Play111152009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.05

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(111152008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152008", "story_v_out_111152.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_111152", "111152008", "story_v_out_111152.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_111152", "111152008", "story_v_out_111152.awb")

						arg_31_1:RecordAudio("111152008", var_34_9)
						arg_31_1:RecordAudio("111152008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_111152", "111152008", "story_v_out_111152.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_111152", "111152008", "story_v_out_111152.awb")
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
	Play111152009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 111152009
		arg_35_1.duration_ = 5.966

		local var_35_0 = {
			ja = 2.633,
			ko = 5.733,
			zh = 5.966,
			en = 5.866
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
				arg_35_0:Play111152010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.425

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(111152009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152009", "story_v_out_111152.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_111152", "111152009", "story_v_out_111152.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_111152", "111152009", "story_v_out_111152.awb")

						arg_35_1:RecordAudio("111152009", var_38_9)
						arg_35_1:RecordAudio("111152009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_111152", "111152009", "story_v_out_111152.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_111152", "111152009", "story_v_out_111152.awb")
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
	Play111152010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 111152010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play111152011(arg_39_1)
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
				local var_42_3 = (arg_39_1.time_ - var_42_1) / 0.066
				local var_42_4, var_42_5 = math.modf(var_42_3)

				var_42_0.localPosition = Vector3.New(var_42_5 * 0.13, var_42_5 * 0.13, var_42_5 * 0.13) + arg_39_1.var_.shakeOldPos
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = arg_39_1.var_.shakeOldPos
			end

			local var_42_6 = 0
			local var_42_7 = 0.075

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(111152010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 3
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_14 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_14 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_14

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_14 and arg_39_1.time_ < var_42_6 + var_42_14 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play111152011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 111152011
		arg_43_1.duration_ = 6

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play111152012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.mask_.enabled = true
				arg_43_1.mask_.raycastTarget = false

				arg_43_1:SetGaussion(false)
			end

			local var_46_1 = 1

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_1 then
				local var_46_2 = (arg_43_1.time_ - var_46_0) / var_46_1
				local var_46_3 = Color.New(1, 1, 1)

				var_46_3.a = Mathf.Lerp(1, 0, var_46_2)
				arg_43_1.mask_.color = var_46_3
			end

			if arg_43_1.time_ >= var_46_0 + var_46_1 and arg_43_1.time_ < var_46_0 + var_46_1 + arg_46_0 then
				local var_46_4 = Color.New(1, 1, 1)
				local var_46_5 = 0

				arg_43_1.mask_.enabled = false
				var_46_4.a = var_46_5
				arg_43_1.mask_.color = var_46_4
			end

			local var_46_6 = 0

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.allBtn_.enabled = false
			end

			local var_46_7 = 1

			if arg_43_1.time_ >= var_46_6 + var_46_7 and arg_43_1.time_ < var_46_6 + var_46_7 + arg_46_0 then
				arg_43_1.allBtn_.enabled = true
			end

			local var_46_8 = 0.733333333333333
			local var_46_9 = 1

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 then
				local var_46_10 = "play"
				local var_46_11 = "effect"

				arg_43_1:AudioAction(var_46_10, var_46_11, "se_story_activity_1_1", "se_story_activity_1_1_hel_cannon", "")
			end

			local var_46_12 = 0
			local var_46_13 = 1

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				local var_46_14 = "play"
				local var_46_15 = "music"

				arg_43_1:AudioAction(var_46_14, var_46_15, "", "", "")
			end

			if arg_43_1.frameCnt_ <= 1 then
				arg_43_1.dialog_:SetActive(false)
			end

			local var_46_16 = 1
			local var_46_17 = 1.05

			if var_46_16 < arg_43_1.time_ and arg_43_1.time_ <= var_46_16 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				arg_43_1.dialog_:SetActive(true)

				local var_46_18 = LeanTween.value(arg_43_1.dialog_, 0, 1, 0.3)

				var_46_18:setOnUpdate(LuaHelper.FloatAction(function(arg_47_0)
					arg_43_1.dialogCg_.alpha = arg_47_0
				end))
				var_46_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_43_1.dialog_)
					var_46_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_43_1.duration_ = arg_43_1.duration_ + 0.3

				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_19 = arg_43_1:GetWordFromCfg(111152011)
				local var_46_20 = arg_43_1:FormatText(var_46_19.content)

				arg_43_1.text_.text = var_46_20

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_21 = 42
				local var_46_22 = utf8.len(var_46_20)
				local var_46_23 = var_46_21 <= 0 and var_46_17 or var_46_17 * (var_46_22 / var_46_21)

				if var_46_23 > 0 and var_46_17 < var_46_23 then
					arg_43_1.talkMaxDuration = var_46_23
					var_46_16 = var_46_16 + 0.3

					if var_46_23 + var_46_16 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_23 + var_46_16
					end
				end

				arg_43_1.text_.text = var_46_20
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_24 = var_46_16 + 0.3
			local var_46_25 = math.max(var_46_17, arg_43_1.talkMaxDuration)

			if var_46_24 <= arg_43_1.time_ and arg_43_1.time_ < var_46_24 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_24) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_24 + var_46_25 and arg_43_1.time_ < var_46_24 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play111152012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 111152012
		arg_49_1.duration_ = 3.8

		local var_49_0 = {
			ja = 3.8,
			ko = 2.333,
			zh = 2.266,
			en = 1.866
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
				arg_49_0:Play111152013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 0.2

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_2 = arg_49_1:FormatText(StoryNameCfg[181].name)

				arg_49_1.leftNameTxt_.text = var_52_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, true)
				arg_49_1.iconController_:SetSelectedState("hero")

				arg_49_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1094")

				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_3 = arg_49_1:GetWordFromCfg(111152012)
				local var_52_4 = arg_49_1:FormatText(var_52_3.content)

				arg_49_1.text_.text = var_52_4

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152012", "story_v_out_111152.awb") ~= 0 then
					local var_52_8 = manager.audio:GetVoiceLength("story_v_out_111152", "111152012", "story_v_out_111152.awb") / 1000

					if var_52_8 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_8 + var_52_0
					end

					if var_52_3.prefab_name ~= "" and arg_49_1.actors_[var_52_3.prefab_name] ~= nil then
						local var_52_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_3.prefab_name].transform, "story_v_out_111152", "111152012", "story_v_out_111152.awb")

						arg_49_1:RecordAudio("111152012", var_52_9)
						arg_49_1:RecordAudio("111152012", var_52_9)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_111152", "111152012", "story_v_out_111152.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_111152", "111152012", "story_v_out_111152.awb")
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
	Play111152013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 111152013
		arg_53_1.duration_ = 2

		local var_53_0 = {
			ja = 2,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_53_1 = manager.audio:GetLocalizationFlag()

		if var_53_0[var_53_1] ~= nil then
			arg_53_1.duration_ = var_53_0[var_53_1]
		end

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play111152014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_56_2 = arg_53_1.actors_["1084ui_story"]
			local var_56_3 = 0

			if var_56_3 < arg_53_1.time_ and arg_53_1.time_ <= var_56_3 + arg_56_0 and arg_53_1.var_.characterEffect1084ui_story == nil then
				arg_53_1.var_.characterEffect1084ui_story = var_56_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_4 = 0.2

			if var_56_3 <= arg_53_1.time_ and arg_53_1.time_ < var_56_3 + var_56_4 then
				local var_56_5 = (arg_53_1.time_ - var_56_3) / var_56_4

				if arg_53_1.var_.characterEffect1084ui_story then
					arg_53_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_3 + var_56_4 and arg_53_1.time_ < var_56_3 + var_56_4 + arg_56_0 and arg_53_1.var_.characterEffect1084ui_story then
				arg_53_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_56_6 = arg_53_1.actors_["1084ui_story"].transform
			local var_56_7 = 0

			if var_56_7 < arg_53_1.time_ and arg_53_1.time_ <= var_56_7 + arg_56_0 then
				arg_53_1.var_.moveOldPos1084ui_story = var_56_6.localPosition

				local var_56_8 = "1084ui_story"

				arg_53_1:ShowWeapon(arg_53_1.var_[var_56_8 .. "Animator"].transform, false)
			end

			local var_56_9 = 0.001

			if var_56_7 <= arg_53_1.time_ and arg_53_1.time_ < var_56_7 + var_56_9 then
				local var_56_10 = (arg_53_1.time_ - var_56_7) / var_56_9
				local var_56_11 = Vector3.New(0, -0.97, -6)

				var_56_6.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1084ui_story, var_56_11, var_56_10)

				local var_56_12 = manager.ui.mainCamera.transform.position - var_56_6.position

				var_56_6.forward = Vector3.New(var_56_12.x, var_56_12.y, var_56_12.z)

				local var_56_13 = var_56_6.localEulerAngles

				var_56_13.z = 0
				var_56_13.x = 0
				var_56_6.localEulerAngles = var_56_13
			end

			if arg_53_1.time_ >= var_56_7 + var_56_9 and arg_53_1.time_ < var_56_7 + var_56_9 + arg_56_0 then
				var_56_6.localPosition = Vector3.New(0, -0.97, -6)

				local var_56_14 = manager.ui.mainCamera.transform.position - var_56_6.position

				var_56_6.forward = Vector3.New(var_56_14.x, var_56_14.y, var_56_14.z)

				local var_56_15 = var_56_6.localEulerAngles

				var_56_15.z = 0
				var_56_15.x = 0
				var_56_6.localEulerAngles = var_56_15
			end

			local var_56_16 = 0
			local var_56_17 = 0.1

			if var_56_16 < arg_53_1.time_ and arg_53_1.time_ <= var_56_16 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_18 = arg_53_1:FormatText(StoryNameCfg[6].name)

				arg_53_1.leftNameTxt_.text = var_56_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_19 = arg_53_1:GetWordFromCfg(111152013)
				local var_56_20 = arg_53_1:FormatText(var_56_19.content)

				arg_53_1.text_.text = var_56_20

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_21 = 4
				local var_56_22 = utf8.len(var_56_20)
				local var_56_23 = var_56_21 <= 0 and var_56_17 or var_56_17 * (var_56_22 / var_56_21)

				if var_56_23 > 0 and var_56_17 < var_56_23 then
					arg_53_1.talkMaxDuration = var_56_23

					if var_56_23 + var_56_16 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_16
					end
				end

				arg_53_1.text_.text = var_56_20
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152013", "story_v_out_111152.awb") ~= 0 then
					local var_56_24 = manager.audio:GetVoiceLength("story_v_out_111152", "111152013", "story_v_out_111152.awb") / 1000

					if var_56_24 + var_56_16 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_24 + var_56_16
					end

					if var_56_19.prefab_name ~= "" and arg_53_1.actors_[var_56_19.prefab_name] ~= nil then
						local var_56_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_19.prefab_name].transform, "story_v_out_111152", "111152013", "story_v_out_111152.awb")

						arg_53_1:RecordAudio("111152013", var_56_25)
						arg_53_1:RecordAudio("111152013", var_56_25)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_111152", "111152013", "story_v_out_111152.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_111152", "111152013", "story_v_out_111152.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_26 = math.max(var_56_17, arg_53_1.talkMaxDuration)

			if var_56_16 <= arg_53_1.time_ and arg_53_1.time_ < var_56_16 + var_56_26 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_16) / var_56_26

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_16 + var_56_26 and arg_53_1.time_ < var_56_16 + var_56_26 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play111152014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 111152014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play111152015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1084ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos1084ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0, 100, 0)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1084ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, 100, 0)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = 0
			local var_60_10 = 0.35

			if var_60_9 < arg_57_1.time_ and arg_57_1.time_ <= var_60_9 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_11 = arg_57_1:FormatText(StoryNameCfg[7].name)

				arg_57_1.leftNameTxt_.text = var_60_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_12 = arg_57_1:GetWordFromCfg(111152014)
				local var_60_13 = arg_57_1:FormatText(var_60_12.content)

				arg_57_1.text_.text = var_60_13

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_14 = 14
				local var_60_15 = utf8.len(var_60_13)
				local var_60_16 = var_60_14 <= 0 and var_60_10 or var_60_10 * (var_60_15 / var_60_14)

				if var_60_16 > 0 and var_60_10 < var_60_16 then
					arg_57_1.talkMaxDuration = var_60_16

					if var_60_16 + var_60_9 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_16 + var_60_9
					end
				end

				arg_57_1.text_.text = var_60_13
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_17 = math.max(var_60_10, arg_57_1.talkMaxDuration)

			if var_60_9 <= arg_57_1.time_ and arg_57_1.time_ < var_60_9 + var_60_17 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_9) / var_60_17

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_9 + var_60_17 and arg_57_1.time_ < var_60_9 + var_60_17 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play111152015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 111152015
		arg_61_1.duration_ = 7.166

		local var_61_0 = {
			ja = 7.166,
			ko = 4.633,
			zh = 5.8,
			en = 4
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
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play111152016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "1094ui_story"

			if arg_61_1.actors_[var_64_0] == nil then
				local var_64_1 = Object.Instantiate(Asset.Load("Char/" .. var_64_0), arg_61_1.stage_.transform)

				var_64_1.name = var_64_0
				var_64_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.actors_[var_64_0] = var_64_1

				local var_64_2 = var_64_1:GetComponentInChildren(typeof(CharacterEffect))

				var_64_2.enabled = true

				local var_64_3 = GameObjectTools.GetOrAddComponent(var_64_1, typeof(DynamicBoneHelper))

				if var_64_3 then
					var_64_3:EnableDynamicBone(false)
				end

				arg_61_1:ShowWeapon(var_64_2.transform, false)

				arg_61_1.var_[var_64_0 .. "Animator"] = var_64_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_61_1.var_[var_64_0 .. "Animator"].applyRootMotion = true
				arg_61_1.var_[var_64_0 .. "LipSync"] = var_64_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_64_4 = arg_61_1.actors_["1094ui_story"].transform
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 then
				arg_61_1.var_.moveOldPos1094ui_story = var_64_4.localPosition
			end

			local var_64_6 = 0.001

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6
				local var_64_8 = Vector3.New(0, -0.84, -6.1)

				var_64_4.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1094ui_story, var_64_8, var_64_7)

				local var_64_9 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_9.x, var_64_9.y, var_64_9.z)

				local var_64_10 = var_64_4.localEulerAngles

				var_64_10.z = 0
				var_64_10.x = 0
				var_64_4.localEulerAngles = var_64_10
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 then
				var_64_4.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_64_11 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_11.x, var_64_11.y, var_64_11.z)

				local var_64_12 = var_64_4.localEulerAngles

				var_64_12.z = 0
				var_64_12.x = 0
				var_64_4.localEulerAngles = var_64_12
			end

			local var_64_13 = 0

			if var_64_13 < arg_61_1.time_ and arg_61_1.time_ <= var_64_13 + arg_64_0 then
				arg_61_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 then
				arg_61_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_64_15 = arg_61_1.actors_["1094ui_story"]
			local var_64_16 = 0

			if var_64_16 < arg_61_1.time_ and arg_61_1.time_ <= var_64_16 + arg_64_0 and arg_61_1.var_.characterEffect1094ui_story == nil then
				arg_61_1.var_.characterEffect1094ui_story = var_64_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_17 = 0.2

			if var_64_16 <= arg_61_1.time_ and arg_61_1.time_ < var_64_16 + var_64_17 then
				local var_64_18 = (arg_61_1.time_ - var_64_16) / var_64_17

				if arg_61_1.var_.characterEffect1094ui_story then
					arg_61_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_16 + var_64_17 and arg_61_1.time_ < var_64_16 + var_64_17 + arg_64_0 and arg_61_1.var_.characterEffect1094ui_story then
				arg_61_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_64_19 = 0
			local var_64_20 = 0.475

			if var_64_19 < arg_61_1.time_ and arg_61_1.time_ <= var_64_19 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_21 = arg_61_1:FormatText(StoryNameCfg[181].name)

				arg_61_1.leftNameTxt_.text = var_64_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_22 = arg_61_1:GetWordFromCfg(111152015)
				local var_64_23 = arg_61_1:FormatText(var_64_22.content)

				arg_61_1.text_.text = var_64_23

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_24 = 19
				local var_64_25 = utf8.len(var_64_23)
				local var_64_26 = var_64_24 <= 0 and var_64_20 or var_64_20 * (var_64_25 / var_64_24)

				if var_64_26 > 0 and var_64_20 < var_64_26 then
					arg_61_1.talkMaxDuration = var_64_26

					if var_64_26 + var_64_19 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_26 + var_64_19
					end
				end

				arg_61_1.text_.text = var_64_23
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152015", "story_v_out_111152.awb") ~= 0 then
					local var_64_27 = manager.audio:GetVoiceLength("story_v_out_111152", "111152015", "story_v_out_111152.awb") / 1000

					if var_64_27 + var_64_19 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_27 + var_64_19
					end

					if var_64_22.prefab_name ~= "" and arg_61_1.actors_[var_64_22.prefab_name] ~= nil then
						local var_64_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_22.prefab_name].transform, "story_v_out_111152", "111152015", "story_v_out_111152.awb")

						arg_61_1:RecordAudio("111152015", var_64_28)
						arg_61_1:RecordAudio("111152015", var_64_28)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_111152", "111152015", "story_v_out_111152.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_111152", "111152015", "story_v_out_111152.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_29 = math.max(var_64_20, arg_61_1.talkMaxDuration)

			if var_64_19 <= arg_61_1.time_ and arg_61_1.time_ < var_64_19 + var_64_29 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_19) / var_64_29

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_19 + var_64_29 and arg_61_1.time_ < var_64_19 + var_64_29 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play111152016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 111152016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play111152017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1094ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect1094ui_story == nil then
				arg_65_1.var_.characterEffect1094ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.2

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect1094ui_story then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1094ui_story.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect1094ui_story then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1094ui_story.fillRatio = var_68_5
			end

			local var_68_6 = 0
			local var_68_7 = 0.7

			if var_68_6 < arg_65_1.time_ and arg_65_1.time_ <= var_68_6 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_8 = arg_65_1:FormatText(StoryNameCfg[7].name)

				arg_65_1.leftNameTxt_.text = var_68_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_9 = arg_65_1:GetWordFromCfg(111152016)
				local var_68_10 = arg_65_1:FormatText(var_68_9.content)

				arg_65_1.text_.text = var_68_10

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_11 = 28
				local var_68_12 = utf8.len(var_68_10)
				local var_68_13 = var_68_11 <= 0 and var_68_7 or var_68_7 * (var_68_12 / var_68_11)

				if var_68_13 > 0 and var_68_7 < var_68_13 then
					arg_65_1.talkMaxDuration = var_68_13

					if var_68_13 + var_68_6 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_13 + var_68_6
					end
				end

				arg_65_1.text_.text = var_68_10
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_14 = math.max(var_68_7, arg_65_1.talkMaxDuration)

			if var_68_6 <= arg_65_1.time_ and arg_65_1.time_ < var_68_6 + var_68_14 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_6) / var_68_14

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_6 + var_68_14 and arg_65_1.time_ < var_68_6 + var_68_14 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play111152017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 111152017
		arg_69_1.duration_ = 6.933

		local var_69_0 = {
			ja = 4.7,
			ko = 6.933,
			zh = 5,
			en = 4.166
		}
		local var_69_1 = manager.audio:GetLocalizationFlag()

		if var_69_0[var_69_1] ~= nil then
			arg_69_1.duration_ = var_69_0[var_69_1]
		end

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play111152018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_72_1 = arg_69_1.actors_["1094ui_story"]
			local var_72_2 = 0

			if var_72_2 < arg_69_1.time_ and arg_69_1.time_ <= var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1094ui_story == nil then
				arg_69_1.var_.characterEffect1094ui_story = var_72_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_3 = 0.2

			if var_72_2 <= arg_69_1.time_ and arg_69_1.time_ < var_72_2 + var_72_3 then
				local var_72_4 = (arg_69_1.time_ - var_72_2) / var_72_3

				if arg_69_1.var_.characterEffect1094ui_story then
					arg_69_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_2 + var_72_3 and arg_69_1.time_ < var_72_2 + var_72_3 + arg_72_0 and arg_69_1.var_.characterEffect1094ui_story then
				arg_69_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_72_5 = 0
			local var_72_6 = 0.75

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_7 = arg_69_1:FormatText(StoryNameCfg[181].name)

				arg_69_1.leftNameTxt_.text = var_72_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_8 = arg_69_1:GetWordFromCfg(111152017)
				local var_72_9 = arg_69_1:FormatText(var_72_8.content)

				arg_69_1.text_.text = var_72_9

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_10 = 16
				local var_72_11 = utf8.len(var_72_9)
				local var_72_12 = var_72_10 <= 0 and var_72_6 or var_72_6 * (var_72_11 / var_72_10)

				if var_72_12 > 0 and var_72_6 < var_72_12 then
					arg_69_1.talkMaxDuration = var_72_12

					if var_72_12 + var_72_5 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_12 + var_72_5
					end
				end

				arg_69_1.text_.text = var_72_9
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152017", "story_v_out_111152.awb") ~= 0 then
					local var_72_13 = manager.audio:GetVoiceLength("story_v_out_111152", "111152017", "story_v_out_111152.awb") / 1000

					if var_72_13 + var_72_5 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_13 + var_72_5
					end

					if var_72_8.prefab_name ~= "" and arg_69_1.actors_[var_72_8.prefab_name] ~= nil then
						local var_72_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_8.prefab_name].transform, "story_v_out_111152", "111152017", "story_v_out_111152.awb")

						arg_69_1:RecordAudio("111152017", var_72_14)
						arg_69_1:RecordAudio("111152017", var_72_14)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_111152", "111152017", "story_v_out_111152.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_111152", "111152017", "story_v_out_111152.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_15 = math.max(var_72_6, arg_69_1.talkMaxDuration)

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_15 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_5) / var_72_15

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_5 + var_72_15 and arg_69_1.time_ < var_72_5 + var_72_15 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play111152018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 111152018
		arg_73_1.duration_ = 5.6

		local var_73_0 = {
			ja = 5.6,
			ko = 4.433,
			zh = 4.066,
			en = 5.233
		}
		local var_73_1 = manager.audio:GetLocalizationFlag()

		if var_73_0[var_73_1] ~= nil then
			arg_73_1.duration_ = var_73_0[var_73_1]
		end

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play111152019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "1039ui_story"

			if arg_73_1.actors_[var_76_0] == nil then
				local var_76_1 = Object.Instantiate(Asset.Load("Char/" .. var_76_0), arg_73_1.stage_.transform)

				var_76_1.name = var_76_0
				var_76_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.actors_[var_76_0] = var_76_1

				local var_76_2 = var_76_1:GetComponentInChildren(typeof(CharacterEffect))

				var_76_2.enabled = true

				local var_76_3 = GameObjectTools.GetOrAddComponent(var_76_1, typeof(DynamicBoneHelper))

				if var_76_3 then
					var_76_3:EnableDynamicBone(false)
				end

				arg_73_1:ShowWeapon(var_76_2.transform, false)

				arg_73_1.var_[var_76_0 .. "Animator"] = var_76_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_73_1.var_[var_76_0 .. "Animator"].applyRootMotion = true
				arg_73_1.var_[var_76_0 .. "LipSync"] = var_76_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_76_4 = arg_73_1.actors_["1039ui_story"].transform
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1.var_.moveOldPos1039ui_story = var_76_4.localPosition
			end

			local var_76_6 = 0.001

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6
				local var_76_8 = Vector3.New(0, -1.01, -5.9)

				var_76_4.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1039ui_story, var_76_8, var_76_7)

				local var_76_9 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_9.x, var_76_9.y, var_76_9.z)

				local var_76_10 = var_76_4.localEulerAngles

				var_76_10.z = 0
				var_76_10.x = 0
				var_76_4.localEulerAngles = var_76_10
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 then
				var_76_4.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_76_11 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_11.x, var_76_11.y, var_76_11.z)

				local var_76_12 = var_76_4.localEulerAngles

				var_76_12.z = 0
				var_76_12.x = 0
				var_76_4.localEulerAngles = var_76_12
			end

			local var_76_13 = 0

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 then
				arg_73_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_76_15 = arg_73_1.actors_["1039ui_story"]
			local var_76_16 = 0

			if var_76_16 < arg_73_1.time_ and arg_73_1.time_ <= var_76_16 + arg_76_0 and arg_73_1.var_.characterEffect1039ui_story == nil then
				arg_73_1.var_.characterEffect1039ui_story = var_76_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_17 = 0.2

			if var_76_16 <= arg_73_1.time_ and arg_73_1.time_ < var_76_16 + var_76_17 then
				local var_76_18 = (arg_73_1.time_ - var_76_16) / var_76_17

				if arg_73_1.var_.characterEffect1039ui_story then
					arg_73_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_16 + var_76_17 and arg_73_1.time_ < var_76_16 + var_76_17 + arg_76_0 and arg_73_1.var_.characterEffect1039ui_story then
				arg_73_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_76_19 = arg_73_1.actors_["1094ui_story"].transform
			local var_76_20 = 0

			if var_76_20 < arg_73_1.time_ and arg_73_1.time_ <= var_76_20 + arg_76_0 then
				arg_73_1.var_.moveOldPos1094ui_story = var_76_19.localPosition
			end

			local var_76_21 = 0.001

			if var_76_20 <= arg_73_1.time_ and arg_73_1.time_ < var_76_20 + var_76_21 then
				local var_76_22 = (arg_73_1.time_ - var_76_20) / var_76_21
				local var_76_23 = Vector3.New(0, 100, 0)

				var_76_19.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1094ui_story, var_76_23, var_76_22)

				local var_76_24 = manager.ui.mainCamera.transform.position - var_76_19.position

				var_76_19.forward = Vector3.New(var_76_24.x, var_76_24.y, var_76_24.z)

				local var_76_25 = var_76_19.localEulerAngles

				var_76_25.z = 0
				var_76_25.x = 0
				var_76_19.localEulerAngles = var_76_25
			end

			if arg_73_1.time_ >= var_76_20 + var_76_21 and arg_73_1.time_ < var_76_20 + var_76_21 + arg_76_0 then
				var_76_19.localPosition = Vector3.New(0, 100, 0)

				local var_76_26 = manager.ui.mainCamera.transform.position - var_76_19.position

				var_76_19.forward = Vector3.New(var_76_26.x, var_76_26.y, var_76_26.z)

				local var_76_27 = var_76_19.localEulerAngles

				var_76_27.z = 0
				var_76_27.x = 0
				var_76_19.localEulerAngles = var_76_27
			end

			local var_76_28 = 0
			local var_76_29 = 0.475

			if var_76_28 < arg_73_1.time_ and arg_73_1.time_ <= var_76_28 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_30 = arg_73_1:FormatText(StoryNameCfg[9].name)

				arg_73_1.leftNameTxt_.text = var_76_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_31 = arg_73_1:GetWordFromCfg(111152018)
				local var_76_32 = arg_73_1:FormatText(var_76_31.content)

				arg_73_1.text_.text = var_76_32

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_33 = 19
				local var_76_34 = utf8.len(var_76_32)
				local var_76_35 = var_76_33 <= 0 and var_76_29 or var_76_29 * (var_76_34 / var_76_33)

				if var_76_35 > 0 and var_76_29 < var_76_35 then
					arg_73_1.talkMaxDuration = var_76_35

					if var_76_35 + var_76_28 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_35 + var_76_28
					end
				end

				arg_73_1.text_.text = var_76_32
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152018", "story_v_out_111152.awb") ~= 0 then
					local var_76_36 = manager.audio:GetVoiceLength("story_v_out_111152", "111152018", "story_v_out_111152.awb") / 1000

					if var_76_36 + var_76_28 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_36 + var_76_28
					end

					if var_76_31.prefab_name ~= "" and arg_73_1.actors_[var_76_31.prefab_name] ~= nil then
						local var_76_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_31.prefab_name].transform, "story_v_out_111152", "111152018", "story_v_out_111152.awb")

						arg_73_1:RecordAudio("111152018", var_76_37)
						arg_73_1:RecordAudio("111152018", var_76_37)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_111152", "111152018", "story_v_out_111152.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_111152", "111152018", "story_v_out_111152.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_38 = math.max(var_76_29, arg_73_1.talkMaxDuration)

			if var_76_28 <= arg_73_1.time_ and arg_73_1.time_ < var_76_28 + var_76_38 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_28) / var_76_38

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_28 + var_76_38 and arg_73_1.time_ < var_76_28 + var_76_38 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play111152019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 111152019
		arg_77_1.duration_ = 5.3

		local var_77_0 = {
			ja = 4.766,
			ko = 4.533,
			zh = 5.033,
			en = 5.3
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
				arg_77_0:Play111152020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action435")
			end

			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_80_2 = arg_77_1.actors_["1084ui_story"]
			local var_80_3 = 0

			if var_80_3 < arg_77_1.time_ and arg_77_1.time_ <= var_80_3 + arg_80_0 and arg_77_1.var_.characterEffect1084ui_story == nil then
				arg_77_1.var_.characterEffect1084ui_story = var_80_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_4 = 0.2

			if var_80_3 <= arg_77_1.time_ and arg_77_1.time_ < var_80_3 + var_80_4 then
				local var_80_5 = (arg_77_1.time_ - var_80_3) / var_80_4

				if arg_77_1.var_.characterEffect1084ui_story then
					arg_77_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_3 + var_80_4 and arg_77_1.time_ < var_80_3 + var_80_4 + arg_80_0 and arg_77_1.var_.characterEffect1084ui_story then
				arg_77_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_80_6 = arg_77_1.actors_["1039ui_story"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.characterEffect1039ui_story == nil then
				arg_77_1.var_.characterEffect1039ui_story = var_80_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_8 = 0.2

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.characterEffect1039ui_story then
					local var_80_10 = Mathf.Lerp(0, 0.5, var_80_9)

					arg_77_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1039ui_story.fillRatio = var_80_10
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.characterEffect1039ui_story then
				local var_80_11 = 0.5

				arg_77_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1039ui_story.fillRatio = var_80_11
			end

			local var_80_12 = arg_77_1.actors_["1084ui_story"].transform
			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1.var_.moveOldPos1084ui_story = var_80_12.localPosition
			end

			local var_80_14 = 0.001

			if var_80_13 <= arg_77_1.time_ and arg_77_1.time_ < var_80_13 + var_80_14 then
				local var_80_15 = (arg_77_1.time_ - var_80_13) / var_80_14
				local var_80_16 = Vector3.New(0.7, -0.97, -6)

				var_80_12.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1084ui_story, var_80_16, var_80_15)

				local var_80_17 = manager.ui.mainCamera.transform.position - var_80_12.position

				var_80_12.forward = Vector3.New(var_80_17.x, var_80_17.y, var_80_17.z)

				local var_80_18 = var_80_12.localEulerAngles

				var_80_18.z = 0
				var_80_18.x = 0
				var_80_12.localEulerAngles = var_80_18
			end

			if arg_77_1.time_ >= var_80_13 + var_80_14 and arg_77_1.time_ < var_80_13 + var_80_14 + arg_80_0 then
				var_80_12.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_80_19 = manager.ui.mainCamera.transform.position - var_80_12.position

				var_80_12.forward = Vector3.New(var_80_19.x, var_80_19.y, var_80_19.z)

				local var_80_20 = var_80_12.localEulerAngles

				var_80_20.z = 0
				var_80_20.x = 0
				var_80_12.localEulerAngles = var_80_20
			end

			local var_80_21 = arg_77_1.actors_["1039ui_story"].transform
			local var_80_22 = 0

			if var_80_22 < arg_77_1.time_ and arg_77_1.time_ <= var_80_22 + arg_80_0 then
				arg_77_1.var_.moveOldPos1039ui_story = var_80_21.localPosition
			end

			local var_80_23 = 0.5

			if var_80_22 <= arg_77_1.time_ and arg_77_1.time_ < var_80_22 + var_80_23 then
				local var_80_24 = (arg_77_1.time_ - var_80_22) / var_80_23
				local var_80_25 = Vector3.New(-0.7, -1.01, -5.9)

				var_80_21.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1039ui_story, var_80_25, var_80_24)

				local var_80_26 = manager.ui.mainCamera.transform.position - var_80_21.position

				var_80_21.forward = Vector3.New(var_80_26.x, var_80_26.y, var_80_26.z)

				local var_80_27 = var_80_21.localEulerAngles

				var_80_27.z = 0
				var_80_27.x = 0
				var_80_21.localEulerAngles = var_80_27
			end

			if arg_77_1.time_ >= var_80_22 + var_80_23 and arg_77_1.time_ < var_80_22 + var_80_23 + arg_80_0 then
				var_80_21.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_80_28 = manager.ui.mainCamera.transform.position - var_80_21.position

				var_80_21.forward = Vector3.New(var_80_28.x, var_80_28.y, var_80_28.z)

				local var_80_29 = var_80_21.localEulerAngles

				var_80_29.z = 0
				var_80_29.x = 0
				var_80_21.localEulerAngles = var_80_29
			end

			local var_80_30 = 0
			local var_80_31 = 0.65

			if var_80_30 < arg_77_1.time_ and arg_77_1.time_ <= var_80_30 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_32 = arg_77_1:FormatText(StoryNameCfg[6].name)

				arg_77_1.leftNameTxt_.text = var_80_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_33 = arg_77_1:GetWordFromCfg(111152019)
				local var_80_34 = arg_77_1:FormatText(var_80_33.content)

				arg_77_1.text_.text = var_80_34

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_35 = 26
				local var_80_36 = utf8.len(var_80_34)
				local var_80_37 = var_80_35 <= 0 and var_80_31 or var_80_31 * (var_80_36 / var_80_35)

				if var_80_37 > 0 and var_80_31 < var_80_37 then
					arg_77_1.talkMaxDuration = var_80_37

					if var_80_37 + var_80_30 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_37 + var_80_30
					end
				end

				arg_77_1.text_.text = var_80_34
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152019", "story_v_out_111152.awb") ~= 0 then
					local var_80_38 = manager.audio:GetVoiceLength("story_v_out_111152", "111152019", "story_v_out_111152.awb") / 1000

					if var_80_38 + var_80_30 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_38 + var_80_30
					end

					if var_80_33.prefab_name ~= "" and arg_77_1.actors_[var_80_33.prefab_name] ~= nil then
						local var_80_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_33.prefab_name].transform, "story_v_out_111152", "111152019", "story_v_out_111152.awb")

						arg_77_1:RecordAudio("111152019", var_80_39)
						arg_77_1:RecordAudio("111152019", var_80_39)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_111152", "111152019", "story_v_out_111152.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_111152", "111152019", "story_v_out_111152.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_40 = math.max(var_80_31, arg_77_1.talkMaxDuration)

			if var_80_30 <= arg_77_1.time_ and arg_77_1.time_ < var_80_30 + var_80_40 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_30) / var_80_40

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_30 + var_80_40 and arg_77_1.time_ < var_80_30 + var_80_40 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play111152020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 111152020
		arg_81_1.duration_ = 4.066

		local var_81_0 = {
			ja = 4.066,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_81_0:Play111152021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_84_1 = arg_81_1.actors_["1094ui_story"]
			local var_84_2 = 0

			if var_84_2 < arg_81_1.time_ and arg_81_1.time_ <= var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1094ui_story == nil then
				arg_81_1.var_.characterEffect1094ui_story = var_84_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_3 = 0.2

			if var_84_2 <= arg_81_1.time_ and arg_81_1.time_ < var_84_2 + var_84_3 then
				local var_84_4 = (arg_81_1.time_ - var_84_2) / var_84_3

				if arg_81_1.var_.characterEffect1094ui_story then
					arg_81_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_2 + var_84_3 and arg_81_1.time_ < var_84_2 + var_84_3 + arg_84_0 and arg_81_1.var_.characterEffect1094ui_story then
				arg_81_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_84_5 = arg_81_1.actors_["1084ui_story"].transform
			local var_84_6 = 0

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.var_.moveOldPos1084ui_story = var_84_5.localPosition
			end

			local var_84_7 = 0.001

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_7 then
				local var_84_8 = (arg_81_1.time_ - var_84_6) / var_84_7
				local var_84_9 = Vector3.New(0, 100, 0)

				var_84_5.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1084ui_story, var_84_9, var_84_8)

				local var_84_10 = manager.ui.mainCamera.transform.position - var_84_5.position

				var_84_5.forward = Vector3.New(var_84_10.x, var_84_10.y, var_84_10.z)

				local var_84_11 = var_84_5.localEulerAngles

				var_84_11.z = 0
				var_84_11.x = 0
				var_84_5.localEulerAngles = var_84_11
			end

			if arg_81_1.time_ >= var_84_6 + var_84_7 and arg_81_1.time_ < var_84_6 + var_84_7 + arg_84_0 then
				var_84_5.localPosition = Vector3.New(0, 100, 0)

				local var_84_12 = manager.ui.mainCamera.transform.position - var_84_5.position

				var_84_5.forward = Vector3.New(var_84_12.x, var_84_12.y, var_84_12.z)

				local var_84_13 = var_84_5.localEulerAngles

				var_84_13.z = 0
				var_84_13.x = 0
				var_84_5.localEulerAngles = var_84_13
			end

			local var_84_14 = arg_81_1.actors_["1039ui_story"].transform
			local var_84_15 = 0

			if var_84_15 < arg_81_1.time_ and arg_81_1.time_ <= var_84_15 + arg_84_0 then
				arg_81_1.var_.moveOldPos1039ui_story = var_84_14.localPosition
			end

			local var_84_16 = 0.001

			if var_84_15 <= arg_81_1.time_ and arg_81_1.time_ < var_84_15 + var_84_16 then
				local var_84_17 = (arg_81_1.time_ - var_84_15) / var_84_16
				local var_84_18 = Vector3.New(0, 100, 0)

				var_84_14.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1039ui_story, var_84_18, var_84_17)

				local var_84_19 = manager.ui.mainCamera.transform.position - var_84_14.position

				var_84_14.forward = Vector3.New(var_84_19.x, var_84_19.y, var_84_19.z)

				local var_84_20 = var_84_14.localEulerAngles

				var_84_20.z = 0
				var_84_20.x = 0
				var_84_14.localEulerAngles = var_84_20
			end

			if arg_81_1.time_ >= var_84_15 + var_84_16 and arg_81_1.time_ < var_84_15 + var_84_16 + arg_84_0 then
				var_84_14.localPosition = Vector3.New(0, 100, 0)

				local var_84_21 = manager.ui.mainCamera.transform.position - var_84_14.position

				var_84_14.forward = Vector3.New(var_84_21.x, var_84_21.y, var_84_21.z)

				local var_84_22 = var_84_14.localEulerAngles

				var_84_22.z = 0
				var_84_22.x = 0
				var_84_14.localEulerAngles = var_84_22
			end

			local var_84_23 = 0

			if var_84_23 < arg_81_1.time_ and arg_81_1.time_ <= var_84_23 + arg_84_0 then
				arg_81_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_84_24 = arg_81_1.actors_["1094ui_story"].transform
			local var_84_25 = 0

			if var_84_25 < arg_81_1.time_ and arg_81_1.time_ <= var_84_25 + arg_84_0 then
				arg_81_1.var_.moveOldPos1094ui_story = var_84_24.localPosition
			end

			local var_84_26 = 0.001

			if var_84_25 <= arg_81_1.time_ and arg_81_1.time_ < var_84_25 + var_84_26 then
				local var_84_27 = (arg_81_1.time_ - var_84_25) / var_84_26
				local var_84_28 = Vector3.New(0, -0.84, -6.1)

				var_84_24.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1094ui_story, var_84_28, var_84_27)

				local var_84_29 = manager.ui.mainCamera.transform.position - var_84_24.position

				var_84_24.forward = Vector3.New(var_84_29.x, var_84_29.y, var_84_29.z)

				local var_84_30 = var_84_24.localEulerAngles

				var_84_30.z = 0
				var_84_30.x = 0
				var_84_24.localEulerAngles = var_84_30
			end

			if arg_81_1.time_ >= var_84_25 + var_84_26 and arg_81_1.time_ < var_84_25 + var_84_26 + arg_84_0 then
				var_84_24.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_84_31 = manager.ui.mainCamera.transform.position - var_84_24.position

				var_84_24.forward = Vector3.New(var_84_31.x, var_84_31.y, var_84_31.z)

				local var_84_32 = var_84_24.localEulerAngles

				var_84_32.z = 0
				var_84_32.x = 0
				var_84_24.localEulerAngles = var_84_32
			end

			local var_84_33 = 0
			local var_84_34 = 0.075

			if var_84_33 < arg_81_1.time_ and arg_81_1.time_ <= var_84_33 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_35 = arg_81_1:FormatText(StoryNameCfg[181].name)

				arg_81_1.leftNameTxt_.text = var_84_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_36 = arg_81_1:GetWordFromCfg(111152020)
				local var_84_37 = arg_81_1:FormatText(var_84_36.content)

				arg_81_1.text_.text = var_84_37

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_38 = 3
				local var_84_39 = utf8.len(var_84_37)
				local var_84_40 = var_84_38 <= 0 and var_84_34 or var_84_34 * (var_84_39 / var_84_38)

				if var_84_40 > 0 and var_84_34 < var_84_40 then
					arg_81_1.talkMaxDuration = var_84_40

					if var_84_40 + var_84_33 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_40 + var_84_33
					end
				end

				arg_81_1.text_.text = var_84_37
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152020", "story_v_out_111152.awb") ~= 0 then
					local var_84_41 = manager.audio:GetVoiceLength("story_v_out_111152", "111152020", "story_v_out_111152.awb") / 1000

					if var_84_41 + var_84_33 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_41 + var_84_33
					end

					if var_84_36.prefab_name ~= "" and arg_81_1.actors_[var_84_36.prefab_name] ~= nil then
						local var_84_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_36.prefab_name].transform, "story_v_out_111152", "111152020", "story_v_out_111152.awb")

						arg_81_1:RecordAudio("111152020", var_84_42)
						arg_81_1:RecordAudio("111152020", var_84_42)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_111152", "111152020", "story_v_out_111152.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_111152", "111152020", "story_v_out_111152.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_43 = math.max(var_84_34, arg_81_1.talkMaxDuration)

			if var_84_33 <= arg_81_1.time_ and arg_81_1.time_ < var_84_33 + var_84_43 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_33) / var_84_43

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_33 + var_84_43 and arg_81_1.time_ < var_84_33 + var_84_43 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play111152021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 111152021
		arg_85_1.duration_ = 6.3

		local var_85_0 = {
			ja = 6.3,
			ko = 5.5,
			zh = 4.3,
			en = 3.566
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
				arg_85_0:Play111152022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1094ui_story"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos1094ui_story = var_88_0.localPosition
			end

			local var_88_2 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2
				local var_88_4 = Vector3.New(0, 100, 0)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1094ui_story, var_88_4, var_88_3)

				local var_88_5 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_5.x, var_88_5.y, var_88_5.z)

				local var_88_6 = var_88_0.localEulerAngles

				var_88_6.z = 0
				var_88_6.x = 0
				var_88_0.localEulerAngles = var_88_6
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(0, 100, 0)

				local var_88_7 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_7.x, var_88_7.y, var_88_7.z)

				local var_88_8 = var_88_0.localEulerAngles

				var_88_8.z = 0
				var_88_8.x = 0
				var_88_0.localEulerAngles = var_88_8
			end

			local var_88_9 = arg_85_1.actors_["1048ui_story"].transform
			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 then
				arg_85_1.var_.moveOldPos1048ui_story = var_88_9.localPosition
			end

			local var_88_11 = 0.001

			if var_88_10 <= arg_85_1.time_ and arg_85_1.time_ < var_88_10 + var_88_11 then
				local var_88_12 = (arg_85_1.time_ - var_88_10) / var_88_11
				local var_88_13 = Vector3.New(0, -0.8, -6.2)

				var_88_9.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1048ui_story, var_88_13, var_88_12)

				local var_88_14 = manager.ui.mainCamera.transform.position - var_88_9.position

				var_88_9.forward = Vector3.New(var_88_14.x, var_88_14.y, var_88_14.z)

				local var_88_15 = var_88_9.localEulerAngles

				var_88_15.z = 0
				var_88_15.x = 0
				var_88_9.localEulerAngles = var_88_15
			end

			if arg_85_1.time_ >= var_88_10 + var_88_11 and arg_85_1.time_ < var_88_10 + var_88_11 + arg_88_0 then
				var_88_9.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_88_16 = manager.ui.mainCamera.transform.position - var_88_9.position

				var_88_9.forward = Vector3.New(var_88_16.x, var_88_16.y, var_88_16.z)

				local var_88_17 = var_88_9.localEulerAngles

				var_88_17.z = 0
				var_88_17.x = 0
				var_88_9.localEulerAngles = var_88_17
			end

			local var_88_18 = 0

			if var_88_18 < arg_85_1.time_ and arg_85_1.time_ <= var_88_18 + arg_88_0 then
				arg_85_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_88_19 = 0

			if var_88_19 < arg_85_1.time_ and arg_85_1.time_ <= var_88_19 + arg_88_0 then
				arg_85_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_88_20 = arg_85_1.actors_["1048ui_story"]
			local var_88_21 = 0

			if var_88_21 < arg_85_1.time_ and arg_85_1.time_ <= var_88_21 + arg_88_0 and arg_85_1.var_.characterEffect1048ui_story == nil then
				arg_85_1.var_.characterEffect1048ui_story = var_88_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_22 = 0.2

			if var_88_21 <= arg_85_1.time_ and arg_85_1.time_ < var_88_21 + var_88_22 then
				local var_88_23 = (arg_85_1.time_ - var_88_21) / var_88_22

				if arg_85_1.var_.characterEffect1048ui_story then
					arg_85_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_21 + var_88_22 and arg_85_1.time_ < var_88_21 + var_88_22 + arg_88_0 and arg_85_1.var_.characterEffect1048ui_story then
				arg_85_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_88_24 = arg_85_1.actors_["1094ui_story"]
			local var_88_25 = 0

			if var_88_25 < arg_85_1.time_ and arg_85_1.time_ <= var_88_25 + arg_88_0 and arg_85_1.var_.characterEffect1094ui_story == nil then
				arg_85_1.var_.characterEffect1094ui_story = var_88_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_26 = 0.2

			if var_88_25 <= arg_85_1.time_ and arg_85_1.time_ < var_88_25 + var_88_26 then
				local var_88_27 = (arg_85_1.time_ - var_88_25) / var_88_26

				if arg_85_1.var_.characterEffect1094ui_story then
					local var_88_28 = Mathf.Lerp(0, 0.5, var_88_27)

					arg_85_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1094ui_story.fillRatio = var_88_28
				end
			end

			if arg_85_1.time_ >= var_88_25 + var_88_26 and arg_85_1.time_ < var_88_25 + var_88_26 + arg_88_0 and arg_85_1.var_.characterEffect1094ui_story then
				local var_88_29 = 0.5

				arg_85_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1094ui_story.fillRatio = var_88_29
			end

			local var_88_30 = 0
			local var_88_31 = 0.525

			if var_88_30 < arg_85_1.time_ and arg_85_1.time_ <= var_88_30 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_32 = arg_85_1:FormatText(StoryNameCfg[8].name)

				arg_85_1.leftNameTxt_.text = var_88_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_33 = arg_85_1:GetWordFromCfg(111152021)
				local var_88_34 = arg_85_1:FormatText(var_88_33.content)

				arg_85_1.text_.text = var_88_34

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_35 = 21
				local var_88_36 = utf8.len(var_88_34)
				local var_88_37 = var_88_35 <= 0 and var_88_31 or var_88_31 * (var_88_36 / var_88_35)

				if var_88_37 > 0 and var_88_31 < var_88_37 then
					arg_85_1.talkMaxDuration = var_88_37

					if var_88_37 + var_88_30 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_37 + var_88_30
					end
				end

				arg_85_1.text_.text = var_88_34
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152021", "story_v_out_111152.awb") ~= 0 then
					local var_88_38 = manager.audio:GetVoiceLength("story_v_out_111152", "111152021", "story_v_out_111152.awb") / 1000

					if var_88_38 + var_88_30 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_38 + var_88_30
					end

					if var_88_33.prefab_name ~= "" and arg_85_1.actors_[var_88_33.prefab_name] ~= nil then
						local var_88_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_33.prefab_name].transform, "story_v_out_111152", "111152021", "story_v_out_111152.awb")

						arg_85_1:RecordAudio("111152021", var_88_39)
						arg_85_1:RecordAudio("111152021", var_88_39)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_111152", "111152021", "story_v_out_111152.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_111152", "111152021", "story_v_out_111152.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_40 = math.max(var_88_31, arg_85_1.talkMaxDuration)

			if var_88_30 <= arg_85_1.time_ and arg_85_1.time_ < var_88_30 + var_88_40 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_30) / var_88_40

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_30 + var_88_40 and arg_85_1.time_ < var_88_30 + var_88_40 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play111152022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 111152022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play111152023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1048ui_story"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1048ui_story = var_92_0.localPosition
			end

			local var_92_2 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(0, 100, 0)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1048ui_story, var_92_4, var_92_3)

				local var_92_5 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_5.x, var_92_5.y, var_92_5.z)

				local var_92_6 = var_92_0.localEulerAngles

				var_92_6.z = 0
				var_92_6.x = 0
				var_92_0.localEulerAngles = var_92_6
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, 100, 0)

				local var_92_7 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_7.x, var_92_7.y, var_92_7.z)

				local var_92_8 = var_92_0.localEulerAngles

				var_92_8.z = 0
				var_92_8.x = 0
				var_92_0.localEulerAngles = var_92_8
			end

			local var_92_9 = 0
			local var_92_10 = 0.4

			if var_92_9 < arg_89_1.time_ and arg_89_1.time_ <= var_92_9 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_11 = arg_89_1:FormatText(StoryNameCfg[7].name)

				arg_89_1.leftNameTxt_.text = var_92_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_12 = arg_89_1:GetWordFromCfg(111152022)
				local var_92_13 = arg_89_1:FormatText(var_92_12.content)

				arg_89_1.text_.text = var_92_13

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_14 = 16
				local var_92_15 = utf8.len(var_92_13)
				local var_92_16 = var_92_14 <= 0 and var_92_10 or var_92_10 * (var_92_15 / var_92_14)

				if var_92_16 > 0 and var_92_10 < var_92_16 then
					arg_89_1.talkMaxDuration = var_92_16

					if var_92_16 + var_92_9 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_16 + var_92_9
					end
				end

				arg_89_1.text_.text = var_92_13
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_17 = math.max(var_92_10, arg_89_1.talkMaxDuration)

			if var_92_9 <= arg_89_1.time_ and arg_89_1.time_ < var_92_9 + var_92_17 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_9) / var_92_17

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_9 + var_92_17 and arg_89_1.time_ < var_92_9 + var_92_17 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play111152023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 111152023
		arg_93_1.duration_ = 4.833

		local var_93_0 = {
			ja = 4.833,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play111152024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_96_1 = arg_93_1.actors_["1094ui_story"]
			local var_96_2 = 0

			if var_96_2 < arg_93_1.time_ and arg_93_1.time_ <= var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1094ui_story == nil then
				arg_93_1.var_.characterEffect1094ui_story = var_96_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_3 = 0.2

			if var_96_2 <= arg_93_1.time_ and arg_93_1.time_ < var_96_2 + var_96_3 then
				local var_96_4 = (arg_93_1.time_ - var_96_2) / var_96_3

				if arg_93_1.var_.characterEffect1094ui_story then
					arg_93_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_2 + var_96_3 and arg_93_1.time_ < var_96_2 + var_96_3 + arg_96_0 and arg_93_1.var_.characterEffect1094ui_story then
				arg_93_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_96_5 = arg_93_1.actors_["1094ui_story"].transform
			local var_96_6 = 0

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.var_.moveOldPos1094ui_story = var_96_5.localPosition
			end

			local var_96_7 = 0.001

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_7 then
				local var_96_8 = (arg_93_1.time_ - var_96_6) / var_96_7
				local var_96_9 = Vector3.New(0, -0.84, -6.1)

				var_96_5.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1094ui_story, var_96_9, var_96_8)

				local var_96_10 = manager.ui.mainCamera.transform.position - var_96_5.position

				var_96_5.forward = Vector3.New(var_96_10.x, var_96_10.y, var_96_10.z)

				local var_96_11 = var_96_5.localEulerAngles

				var_96_11.z = 0
				var_96_11.x = 0
				var_96_5.localEulerAngles = var_96_11
			end

			if arg_93_1.time_ >= var_96_6 + var_96_7 and arg_93_1.time_ < var_96_6 + var_96_7 + arg_96_0 then
				var_96_5.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_96_12 = manager.ui.mainCamera.transform.position - var_96_5.position

				var_96_5.forward = Vector3.New(var_96_12.x, var_96_12.y, var_96_12.z)

				local var_96_13 = var_96_5.localEulerAngles

				var_96_13.z = 0
				var_96_13.x = 0
				var_96_5.localEulerAngles = var_96_13
			end

			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_96_15 = 0
			local var_96_16 = 0.05

			if var_96_15 < arg_93_1.time_ and arg_93_1.time_ <= var_96_15 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_17 = arg_93_1:FormatText(StoryNameCfg[181].name)

				arg_93_1.leftNameTxt_.text = var_96_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_18 = arg_93_1:GetWordFromCfg(111152023)
				local var_96_19 = arg_93_1:FormatText(var_96_18.content)

				arg_93_1.text_.text = var_96_19

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_20 = 2
				local var_96_21 = utf8.len(var_96_19)
				local var_96_22 = var_96_20 <= 0 and var_96_16 or var_96_16 * (var_96_21 / var_96_20)

				if var_96_22 > 0 and var_96_16 < var_96_22 then
					arg_93_1.talkMaxDuration = var_96_22

					if var_96_22 + var_96_15 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_22 + var_96_15
					end
				end

				arg_93_1.text_.text = var_96_19
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111152", "111152023", "story_v_out_111152.awb") ~= 0 then
					local var_96_23 = manager.audio:GetVoiceLength("story_v_out_111152", "111152023", "story_v_out_111152.awb") / 1000

					if var_96_23 + var_96_15 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_23 + var_96_15
					end

					if var_96_18.prefab_name ~= "" and arg_93_1.actors_[var_96_18.prefab_name] ~= nil then
						local var_96_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_18.prefab_name].transform, "story_v_out_111152", "111152023", "story_v_out_111152.awb")

						arg_93_1:RecordAudio("111152023", var_96_24)
						arg_93_1:RecordAudio("111152023", var_96_24)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_111152", "111152023", "story_v_out_111152.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_111152", "111152023", "story_v_out_111152.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_25 = math.max(var_96_16, arg_93_1.talkMaxDuration)

			if var_96_15 <= arg_93_1.time_ and arg_93_1.time_ < var_96_15 + var_96_25 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_15) / var_96_25

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_15 + var_96_25 and arg_93_1.time_ < var_96_15 + var_96_25 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play111152024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 111152024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play111152025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1094ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1094ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, 100, 0)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1094ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, 100, 0)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = 0
			local var_100_10 = 0.925

			if var_100_9 < arg_97_1.time_ and arg_97_1.time_ <= var_100_9 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_11 = arg_97_1:GetWordFromCfg(111152024)
				local var_100_12 = arg_97_1:FormatText(var_100_11.content)

				arg_97_1.text_.text = var_100_12

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_13 = 37
				local var_100_14 = utf8.len(var_100_12)
				local var_100_15 = var_100_13 <= 0 and var_100_10 or var_100_10 * (var_100_14 / var_100_13)

				if var_100_15 > 0 and var_100_10 < var_100_15 then
					arg_97_1.talkMaxDuration = var_100_15

					if var_100_15 + var_100_9 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_15 + var_100_9
					end
				end

				arg_97_1.text_.text = var_100_12
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_16 = math.max(var_100_10, arg_97_1.talkMaxDuration)

			if var_100_9 <= arg_97_1.time_ and arg_97_1.time_ < var_100_9 + var_100_16 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_9) / var_100_16

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_9 + var_100_16 and arg_97_1.time_ < var_100_9 + var_100_16 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play111152025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 111152025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
			arg_101_1.auto_ = false
		end

		function arg_101_1.playNext_(arg_103_0)
			arg_101_1.onStoryFinished_()
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 1.05

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

				local var_104_2 = arg_101_1:GetWordFromCfg(111152025)
				local var_104_3 = arg_101_1:FormatText(var_104_2.content)

				arg_101_1.text_.text = var_104_3

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_4 = 42
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/D11"
	},
	voices = {
		"story_v_out_111152.awb"
	}
}
