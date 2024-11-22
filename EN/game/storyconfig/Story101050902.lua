return {
	Play105092001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 105092001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play105092002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "effect"

				arg_1_1:AudioAction(var_4_2, var_4_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_4 = "B03f"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = arg_1_1.bgs_.B03f
			local var_4_7 = 0

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				local var_4_8 = var_4_6:GetComponent("SpriteRenderer")

				if var_4_8 then
					var_4_8.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_9 = var_4_8.material
					local var_4_10 = var_4_9:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB03f = var_4_10.a
					arg_1_1.var_.alphaMatValueB03f = var_4_9
				end

				arg_1_1.var_.alphaOldValueB03f = 0
			end

			local var_4_11 = 1.5

			if var_4_7 <= arg_1_1.time_ and arg_1_1.time_ < var_4_7 + var_4_11 then
				local var_4_12 = (arg_1_1.time_ - var_4_7) / var_4_11
				local var_4_13 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB03f, 1, var_4_12)

				if arg_1_1.var_.alphaMatValueB03f then
					local var_4_14 = arg_1_1.var_.alphaMatValueB03f
					local var_4_15 = var_4_14:GetColor("_Color")

					var_4_15.a = var_4_13

					var_4_14:SetColor("_Color", var_4_15)
				end
			end

			if arg_1_1.time_ >= var_4_7 + var_4_11 and arg_1_1.time_ < var_4_7 + var_4_11 + arg_4_0 and arg_1_1.var_.alphaMatValueB03f then
				local var_4_16 = arg_1_1.var_.alphaMatValueB03f
				local var_4_17 = var_4_16:GetColor("_Color")

				var_4_17.a = 1

				var_4_16:SetColor("_Color", var_4_17)
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_19 = manager.ui.mainCamera.transform.localPosition
				local var_4_20 = Vector3.New(0, 0, 10) + Vector3.New(var_4_19.x, var_4_19.y, 0)
				local var_4_21 = arg_1_1.bgs_.B03f

				var_4_21.transform.localPosition = var_4_20
				var_4_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_22 = var_4_21:GetComponent("SpriteRenderer")

				if var_4_22 and var_4_22.sprite then
					local var_4_23 = (var_4_21.transform.localPosition - var_4_19).z
					local var_4_24 = manager.ui.mainCameraCom_
					local var_4_25 = 2 * var_4_23 * Mathf.Tan(var_4_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_26 = var_4_25 * var_4_24.aspect
					local var_4_27 = var_4_22.sprite.bounds.size.x
					local var_4_28 = var_4_22.sprite.bounds.size.y
					local var_4_29 = var_4_26 / var_4_27
					local var_4_30 = var_4_25 / var_4_28
					local var_4_31 = var_4_30 < var_4_29 and var_4_29 or var_4_30

					var_4_21.transform.localScale = Vector3.New(var_4_31, var_4_31, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B03f" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_33 = 2

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.275

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

				local var_4_37 = arg_1_1:GetWordFromCfg(105092001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 11
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
	Play105092002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 105092002
		arg_7_1.duration_ = 2.4

		local var_7_0 = {
			ja = 2.1,
			ko = 2.066,
			zh = 1.999999999999,
			en = 2.4
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
				arg_7_0:Play105092003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "music"

				arg_7_1:AudioAction(var_10_2, var_10_3, "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin")
			end

			local var_10_4 = "1013ui_story"

			if arg_7_1.actors_[var_10_4] == nil then
				local var_10_5 = Object.Instantiate(Asset.Load("Char/" .. var_10_4), arg_7_1.stage_.transform)

				var_10_5.name = var_10_4
				var_10_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_4] = var_10_5

				local var_10_6 = var_10_5:GetComponentInChildren(typeof(CharacterEffect))

				var_10_6.enabled = true

				local var_10_7 = GameObjectTools.GetOrAddComponent(var_10_5, typeof(DynamicBoneHelper))

				if var_10_7 then
					var_10_7:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_6.transform, false)

				arg_7_1.var_[var_10_4 .. "Animator"] = var_10_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_4 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_4 .. "LipSync"] = var_10_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_8 = arg_7_1.actors_["1013ui_story"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect1013ui_story == nil then
				arg_7_1.var_.characterEffect1013ui_story = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect1013ui_story then
					arg_7_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect1013ui_story then
				arg_7_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_10_12 = arg_7_1.actors_["1013ui_story"].transform
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1.var_.moveOldPos1013ui_story = var_10_12.localPosition
			end

			local var_10_14 = 0.001

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14
				local var_10_16 = Vector3.New(-0.7, -0.66, -6.15)

				var_10_12.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1013ui_story, var_10_16, var_10_15)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_12.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_12.localEulerAngles = var_10_18
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 then
				var_10_12.localPosition = Vector3.New(-0.7, -0.66, -6.15)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_12.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_12.localEulerAngles = var_10_20
			end

			local var_10_21 = 0

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 then
				arg_7_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action1_1")
			end

			local var_10_22 = 0

			if var_10_22 < arg_7_1.time_ and arg_7_1.time_ <= var_10_22 + arg_10_0 then
				arg_7_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_10_23 = 0
			local var_10_24 = 0.2

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_25 = arg_7_1:FormatText(StoryNameCfg[35].name)

				arg_7_1.leftNameTxt_.text = var_10_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_26 = arg_7_1:GetWordFromCfg(105092002)
				local var_10_27 = arg_7_1:FormatText(var_10_26.content)

				arg_7_1.text_.text = var_10_27

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_28 = 8
				local var_10_29 = utf8.len(var_10_27)
				local var_10_30 = var_10_28 <= 0 and var_10_24 or var_10_24 * (var_10_29 / var_10_28)

				if var_10_30 > 0 and var_10_24 < var_10_30 then
					arg_7_1.talkMaxDuration = var_10_30

					if var_10_30 + var_10_23 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_30 + var_10_23
					end
				end

				arg_7_1.text_.text = var_10_27
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092002", "story_v_out_105092.awb") ~= 0 then
					local var_10_31 = manager.audio:GetVoiceLength("story_v_out_105092", "105092002", "story_v_out_105092.awb") / 1000

					if var_10_31 + var_10_23 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_31 + var_10_23
					end

					if var_10_26.prefab_name ~= "" and arg_7_1.actors_[var_10_26.prefab_name] ~= nil then
						local var_10_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_26.prefab_name].transform, "story_v_out_105092", "105092002", "story_v_out_105092.awb")

						arg_7_1:RecordAudio("105092002", var_10_32)
						arg_7_1:RecordAudio("105092002", var_10_32)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_105092", "105092002", "story_v_out_105092.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_105092", "105092002", "story_v_out_105092.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_33 = math.max(var_10_24, arg_7_1.talkMaxDuration)

			if var_10_23 <= arg_7_1.time_ and arg_7_1.time_ < var_10_23 + var_10_33 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_23) / var_10_33

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_23 + var_10_33 and arg_7_1.time_ < var_10_23 + var_10_33 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play105092003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 105092003
		arg_11_1.duration_ = 4.333

		local var_11_0 = {
			ja = 2.6,
			ko = 3.166,
			zh = 2.8,
			en = 4.333
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
				arg_11_0:Play105092004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10002_tpose"

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

			local var_14_4 = arg_11_1.actors_["10002_tpose"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect10002_tpose == nil then
				arg_11_1.var_.characterEffect10002_tpose = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect10002_tpose then
					arg_11_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect10002_tpose then
				arg_11_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_14_8 = arg_11_1.actors_["1013ui_story"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect1013ui_story == nil then
				arg_11_1.var_.characterEffect1013ui_story = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect1013ui_story then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1013ui_story.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect1013ui_story then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1013ui_story.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["10002_tpose"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos10002_tpose = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0.7, -1.2, -5.8)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10002_tpose, var_14_18, var_14_17)

				local var_14_19 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_19.x, var_14_19.y, var_14_19.z)

				local var_14_20 = var_14_14.localEulerAngles

				var_14_20.z = 0
				var_14_20.x = 0
				var_14_14.localEulerAngles = var_14_20
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 then
				var_14_14.localPosition = Vector3.New(0.7, -1.2, -5.8)

				local var_14_21 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_21.x, var_14_21.y, var_14_21.z)

				local var_14_22 = var_14_14.localEulerAngles

				var_14_22.z = 0
				var_14_22.x = 0
				var_14_14.localEulerAngles = var_14_22
			end

			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 then
				arg_11_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action5_2")
			end

			local var_14_24 = 0
			local var_14_25 = 0.275

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_26 = arg_11_1:FormatText(StoryNameCfg[39].name)

				arg_11_1.leftNameTxt_.text = var_14_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_27 = arg_11_1:GetWordFromCfg(105092003)
				local var_14_28 = arg_11_1:FormatText(var_14_27.content)

				arg_11_1.text_.text = var_14_28

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_29 = 11
				local var_14_30 = utf8.len(var_14_28)
				local var_14_31 = var_14_29 <= 0 and var_14_25 or var_14_25 * (var_14_30 / var_14_29)

				if var_14_31 > 0 and var_14_25 < var_14_31 then
					arg_11_1.talkMaxDuration = var_14_31

					if var_14_31 + var_14_24 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_31 + var_14_24
					end
				end

				arg_11_1.text_.text = var_14_28
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092003", "story_v_out_105092.awb") ~= 0 then
					local var_14_32 = manager.audio:GetVoiceLength("story_v_out_105092", "105092003", "story_v_out_105092.awb") / 1000

					if var_14_32 + var_14_24 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_32 + var_14_24
					end

					if var_14_27.prefab_name ~= "" and arg_11_1.actors_[var_14_27.prefab_name] ~= nil then
						local var_14_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_27.prefab_name].transform, "story_v_out_105092", "105092003", "story_v_out_105092.awb")

						arg_11_1:RecordAudio("105092003", var_14_33)
						arg_11_1:RecordAudio("105092003", var_14_33)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_105092", "105092003", "story_v_out_105092.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_105092", "105092003", "story_v_out_105092.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_34 = math.max(var_14_25, arg_11_1.talkMaxDuration)

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_34 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_24) / var_14_34

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_24 + var_14_34 and arg_11_1.time_ < var_14_24 + var_14_34 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play105092004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 105092004
		arg_15_1.duration_ = 5.1

		local var_15_0 = {
			ja = 4.5,
			ko = 3.766,
			zh = 4.966,
			en = 5.1
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
				arg_15_0:Play105092005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1013ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1013ui_story == nil then
				arg_15_1.var_.characterEffect1013ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1013ui_story then
					arg_15_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1013ui_story then
				arg_15_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_18_4 = arg_15_1.actors_["10002_tpose"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect10002_tpose == nil then
				arg_15_1.var_.characterEffect10002_tpose = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect10002_tpose then
					local var_18_8 = Mathf.Lerp(0, 0.5, var_18_7)

					arg_15_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_15_1.var_.characterEffect10002_tpose.fillRatio = var_18_8
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect10002_tpose then
				local var_18_9 = 0.5

				arg_15_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_15_1.var_.characterEffect10002_tpose.fillRatio = var_18_9
			end

			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action10_1")
			end

			local var_18_11 = 0

			if var_18_11 < arg_15_1.time_ and arg_15_1.time_ <= var_18_11 + arg_18_0 then
				arg_15_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_18_12 = 0
			local var_18_13 = 0.525

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_14 = arg_15_1:FormatText(StoryNameCfg[35].name)

				arg_15_1.leftNameTxt_.text = var_18_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_15 = arg_15_1:GetWordFromCfg(105092004)
				local var_18_16 = arg_15_1:FormatText(var_18_15.content)

				arg_15_1.text_.text = var_18_16

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_17 = 21
				local var_18_18 = utf8.len(var_18_16)
				local var_18_19 = var_18_17 <= 0 and var_18_13 or var_18_13 * (var_18_18 / var_18_17)

				if var_18_19 > 0 and var_18_13 < var_18_19 then
					arg_15_1.talkMaxDuration = var_18_19

					if var_18_19 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_19 + var_18_12
					end
				end

				arg_15_1.text_.text = var_18_16
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092004", "story_v_out_105092.awb") ~= 0 then
					local var_18_20 = manager.audio:GetVoiceLength("story_v_out_105092", "105092004", "story_v_out_105092.awb") / 1000

					if var_18_20 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_12
					end

					if var_18_15.prefab_name ~= "" and arg_15_1.actors_[var_18_15.prefab_name] ~= nil then
						local var_18_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_15.prefab_name].transform, "story_v_out_105092", "105092004", "story_v_out_105092.awb")

						arg_15_1:RecordAudio("105092004", var_18_21)
						arg_15_1:RecordAudio("105092004", var_18_21)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_105092", "105092004", "story_v_out_105092.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_105092", "105092004", "story_v_out_105092.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_13, arg_15_1.talkMaxDuration)

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_12) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_12 + var_18_22 and arg_15_1.time_ < var_18_12 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play105092005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 105092005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play105092006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1013ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1013ui_story == nil then
				arg_19_1.var_.characterEffect1013ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1013ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1013ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1013ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1013ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.95

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_8 = arg_19_1:GetWordFromCfg(105092005)
				local var_22_9 = arg_19_1:FormatText(var_22_8.content)

				arg_19_1.text_.text = var_22_9

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_10 = 38
				local var_22_11 = utf8.len(var_22_9)
				local var_22_12 = var_22_10 <= 0 and var_22_7 or var_22_7 * (var_22_11 / var_22_10)

				if var_22_12 > 0 and var_22_7 < var_22_12 then
					arg_19_1.talkMaxDuration = var_22_12

					if var_22_12 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_6
					end
				end

				arg_19_1.text_.text = var_22_9
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_13 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_13 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_13

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_13 and arg_19_1.time_ < var_22_6 + var_22_13 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play105092006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 105092006
		arg_23_1.duration_ = 2.9

		local var_23_0 = {
			ja = 2.9,
			ko = 1.966,
			zh = 1.366,
			en = 1.366
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
				arg_23_0:Play105092007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10002_tpose"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect10002_tpose == nil then
				arg_23_1.var_.characterEffect10002_tpose = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect10002_tpose then
					arg_23_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10002_tpose then
				arg_23_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_26_4 = 0
			local var_26_5 = 0.125

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_6 = arg_23_1:FormatText(StoryNameCfg[39].name)

				arg_23_1.leftNameTxt_.text = var_26_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_7 = arg_23_1:GetWordFromCfg(105092006)
				local var_26_8 = arg_23_1:FormatText(var_26_7.content)

				arg_23_1.text_.text = var_26_8

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_9 = 5
				local var_26_10 = utf8.len(var_26_8)
				local var_26_11 = var_26_9 <= 0 and var_26_5 or var_26_5 * (var_26_10 / var_26_9)

				if var_26_11 > 0 and var_26_5 < var_26_11 then
					arg_23_1.talkMaxDuration = var_26_11

					if var_26_11 + var_26_4 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_11 + var_26_4
					end
				end

				arg_23_1.text_.text = var_26_8
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092006", "story_v_out_105092.awb") ~= 0 then
					local var_26_12 = manager.audio:GetVoiceLength("story_v_out_105092", "105092006", "story_v_out_105092.awb") / 1000

					if var_26_12 + var_26_4 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_4
					end

					if var_26_7.prefab_name ~= "" and arg_23_1.actors_[var_26_7.prefab_name] ~= nil then
						local var_26_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_7.prefab_name].transform, "story_v_out_105092", "105092006", "story_v_out_105092.awb")

						arg_23_1:RecordAudio("105092006", var_26_13)
						arg_23_1:RecordAudio("105092006", var_26_13)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_105092", "105092006", "story_v_out_105092.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_105092", "105092006", "story_v_out_105092.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_14 = math.max(var_26_5, arg_23_1.talkMaxDuration)

			if var_26_4 <= arg_23_1.time_ and arg_23_1.time_ < var_26_4 + var_26_14 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_4) / var_26_14

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_4 + var_26_14 and arg_23_1.time_ < var_26_4 + var_26_14 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play105092007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 105092007
		arg_27_1.duration_ = 8.9

		local var_27_0 = {
			ja = 8.9,
			ko = 4.8,
			zh = 5.5,
			en = 5.133
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
				arg_27_0:Play105092008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1013ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1013ui_story == nil then
				arg_27_1.var_.characterEffect1013ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1013ui_story then
					arg_27_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1013ui_story then
				arg_27_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["10002_tpose"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect10002_tpose == nil then
				arg_27_1.var_.characterEffect10002_tpose = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect10002_tpose then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_27_1.var_.characterEffect10002_tpose.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect10002_tpose then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_27_1.var_.characterEffect10002_tpose.fillRatio = var_30_9
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action41011")
			end

			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_30_12 = 0
			local var_30_13 = 0.525

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_14 = arg_27_1:FormatText(StoryNameCfg[35].name)

				arg_27_1.leftNameTxt_.text = var_30_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(105092007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 21
				local var_30_18 = utf8.len(var_30_16)
				local var_30_19 = var_30_17 <= 0 and var_30_13 or var_30_13 * (var_30_18 / var_30_17)

				if var_30_19 > 0 and var_30_13 < var_30_19 then
					arg_27_1.talkMaxDuration = var_30_19

					if var_30_19 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_12
					end
				end

				arg_27_1.text_.text = var_30_16
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092007", "story_v_out_105092.awb") ~= 0 then
					local var_30_20 = manager.audio:GetVoiceLength("story_v_out_105092", "105092007", "story_v_out_105092.awb") / 1000

					if var_30_20 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_12
					end

					if var_30_15.prefab_name ~= "" and arg_27_1.actors_[var_30_15.prefab_name] ~= nil then
						local var_30_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_15.prefab_name].transform, "story_v_out_105092", "105092007", "story_v_out_105092.awb")

						arg_27_1:RecordAudio("105092007", var_30_21)
						arg_27_1:RecordAudio("105092007", var_30_21)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_105092", "105092007", "story_v_out_105092.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_105092", "105092007", "story_v_out_105092.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_22 = math.max(var_30_13, arg_27_1.talkMaxDuration)

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_22 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_12) / var_30_22

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_12 + var_30_22 and arg_27_1.time_ < var_30_12 + var_30_22 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play105092008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 105092008
		arg_31_1.duration_ = 6.9

		local var_31_0 = {
			ja = 6.8,
			ko = 6.9,
			zh = 6.133,
			en = 3.833
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
				arg_31_0:Play105092009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10002_tpose"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10002_tpose == nil then
				arg_31_1.var_.characterEffect10002_tpose = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10002_tpose then
					arg_31_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10002_tpose then
				arg_31_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1013ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect1013ui_story == nil then
				arg_31_1.var_.characterEffect1013ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1013ui_story then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1013ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect1013ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1013ui_story.fillRatio = var_34_9
			end

			local var_34_10 = 0
			local var_34_11 = 0.525

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_12 = arg_31_1:FormatText(StoryNameCfg[39].name)

				arg_31_1.leftNameTxt_.text = var_34_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_13 = arg_31_1:GetWordFromCfg(105092008)
				local var_34_14 = arg_31_1:FormatText(var_34_13.content)

				arg_31_1.text_.text = var_34_14

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_15 = 20
				local var_34_16 = utf8.len(var_34_14)
				local var_34_17 = var_34_15 <= 0 and var_34_11 or var_34_11 * (var_34_16 / var_34_15)

				if var_34_17 > 0 and var_34_11 < var_34_17 then
					arg_31_1.talkMaxDuration = var_34_17

					if var_34_17 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_17 + var_34_10
					end
				end

				arg_31_1.text_.text = var_34_14
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092008", "story_v_out_105092.awb") ~= 0 then
					local var_34_18 = manager.audio:GetVoiceLength("story_v_out_105092", "105092008", "story_v_out_105092.awb") / 1000

					if var_34_18 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_10
					end

					if var_34_13.prefab_name ~= "" and arg_31_1.actors_[var_34_13.prefab_name] ~= nil then
						local var_34_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_13.prefab_name].transform, "story_v_out_105092", "105092008", "story_v_out_105092.awb")

						arg_31_1:RecordAudio("105092008", var_34_19)
						arg_31_1:RecordAudio("105092008", var_34_19)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_105092", "105092008", "story_v_out_105092.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_105092", "105092008", "story_v_out_105092.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_20 = math.max(var_34_11, arg_31_1.talkMaxDuration)

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_20 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_10) / var_34_20

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_10 + var_34_20 and arg_31_1.time_ < var_34_10 + var_34_20 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play105092009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 105092009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play105092010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10002_tpose"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect10002_tpose == nil then
				arg_35_1.var_.characterEffect10002_tpose = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect10002_tpose then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_35_1.var_.characterEffect10002_tpose.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect10002_tpose then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_35_1.var_.characterEffect10002_tpose.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["10002_tpose"].transform
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.var_.moveOldPos10002_tpose = var_38_6.localPosition
			end

			local var_38_8 = 0.001

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8
				local var_38_10 = Vector3.New(0, 100, 0)

				var_38_6.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10002_tpose, var_38_10, var_38_9)

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

			local var_38_15 = arg_35_1.actors_["1013ui_story"].transform
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.var_.moveOldPos1013ui_story = var_38_15.localPosition
			end

			local var_38_17 = 0.001

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Vector3.New(0, 100, 0)

				var_38_15.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1013ui_story, var_38_19, var_38_18)

				local var_38_20 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_20.x, var_38_20.y, var_38_20.z)

				local var_38_21 = var_38_15.localEulerAngles

				var_38_21.z = 0
				var_38_21.x = 0
				var_38_15.localEulerAngles = var_38_21
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				var_38_15.localPosition = Vector3.New(0, 100, 0)

				local var_38_22 = manager.ui.mainCamera.transform.position - var_38_15.position

				var_38_15.forward = Vector3.New(var_38_22.x, var_38_22.y, var_38_22.z)

				local var_38_23 = var_38_15.localEulerAngles

				var_38_23.z = 0
				var_38_23.x = 0
				var_38_15.localEulerAngles = var_38_23
			end

			local var_38_24 = 0
			local var_38_25 = 0.725

			if var_38_24 < arg_35_1.time_ and arg_35_1.time_ <= var_38_24 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_26 = arg_35_1:GetWordFromCfg(105092009)
				local var_38_27 = arg_35_1:FormatText(var_38_26.content)

				arg_35_1.text_.text = var_38_27

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_28 = 37
				local var_38_29 = utf8.len(var_38_27)
				local var_38_30 = var_38_28 <= 0 and var_38_25 or var_38_25 * (var_38_29 / var_38_28)

				if var_38_30 > 0 and var_38_25 < var_38_30 then
					arg_35_1.talkMaxDuration = var_38_30

					if var_38_30 + var_38_24 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_30 + var_38_24
					end
				end

				arg_35_1.text_.text = var_38_27
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_31 = math.max(var_38_25, arg_35_1.talkMaxDuration)

			if var_38_24 <= arg_35_1.time_ and arg_35_1.time_ < var_38_24 + var_38_31 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_24) / var_38_31

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_24 + var_38_31 and arg_35_1.time_ < var_38_24 + var_38_31 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play105092010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 105092010
		arg_39_1.duration_ = 7.066

		local var_39_0 = {
			ja = 7.066,
			ko = 3.7,
			zh = 6.233,
			en = 6.533
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
				arg_39_0:Play105092011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10002_tpose"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10002_tpose == nil then
				arg_39_1.var_.characterEffect10002_tpose = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10002_tpose then
					arg_39_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10002_tpose then
				arg_39_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["10002_tpose"].transform
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1.var_.moveOldPos10002_tpose = var_42_4.localPosition
			end

			local var_42_6 = 0.001

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6
				local var_42_8 = Vector3.New(0, -1.2, -5.8)

				var_42_4.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10002_tpose, var_42_8, var_42_7)

				local var_42_9 = manager.ui.mainCamera.transform.position - var_42_4.position

				var_42_4.forward = Vector3.New(var_42_9.x, var_42_9.y, var_42_9.z)

				local var_42_10 = var_42_4.localEulerAngles

				var_42_10.z = 0
				var_42_10.x = 0
				var_42_4.localEulerAngles = var_42_10
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 then
				var_42_4.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_42_11 = manager.ui.mainCamera.transform.position - var_42_4.position

				var_42_4.forward = Vector3.New(var_42_11.x, var_42_11.y, var_42_11.z)

				local var_42_12 = var_42_4.localEulerAngles

				var_42_12.z = 0
				var_42_12.x = 0
				var_42_4.localEulerAngles = var_42_12
			end

			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action5_2")
			end

			local var_42_14 = 0
			local var_42_15 = 0.4

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_16 = arg_39_1:FormatText(StoryNameCfg[39].name)

				arg_39_1.leftNameTxt_.text = var_42_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_17 = arg_39_1:GetWordFromCfg(105092010)
				local var_42_18 = arg_39_1:FormatText(var_42_17.content)

				arg_39_1.text_.text = var_42_18

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_19 = 16
				local var_42_20 = utf8.len(var_42_18)
				local var_42_21 = var_42_19 <= 0 and var_42_15 or var_42_15 * (var_42_20 / var_42_19)

				if var_42_21 > 0 and var_42_15 < var_42_21 then
					arg_39_1.talkMaxDuration = var_42_21

					if var_42_21 + var_42_14 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_21 + var_42_14
					end
				end

				arg_39_1.text_.text = var_42_18
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092010", "story_v_out_105092.awb") ~= 0 then
					local var_42_22 = manager.audio:GetVoiceLength("story_v_out_105092", "105092010", "story_v_out_105092.awb") / 1000

					if var_42_22 + var_42_14 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_22 + var_42_14
					end

					if var_42_17.prefab_name ~= "" and arg_39_1.actors_[var_42_17.prefab_name] ~= nil then
						local var_42_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_17.prefab_name].transform, "story_v_out_105092", "105092010", "story_v_out_105092.awb")

						arg_39_1:RecordAudio("105092010", var_42_23)
						arg_39_1:RecordAudio("105092010", var_42_23)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_105092", "105092010", "story_v_out_105092.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_105092", "105092010", "story_v_out_105092.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_24 = math.max(var_42_15, arg_39_1.talkMaxDuration)

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_24 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_14) / var_42_24

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_14 + var_42_24 and arg_39_1.time_ < var_42_14 + var_42_24 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play105092011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 105092011
		arg_43_1.duration_ = 15.6

		local var_43_0 = {
			ja = 8.3,
			ko = 11,
			zh = 15.6,
			en = 12.2
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
				arg_43_0:Play105092012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.05

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[39].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(105092011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 42
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092011", "story_v_out_105092.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_105092", "105092011", "story_v_out_105092.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_105092", "105092011", "story_v_out_105092.awb")

						arg_43_1:RecordAudio("105092011", var_46_9)
						arg_43_1:RecordAudio("105092011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_105092", "105092011", "story_v_out_105092.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_105092", "105092011", "story_v_out_105092.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_10 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_10 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_10

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_10 and arg_43_1.time_ < var_46_0 + var_46_10 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play105092012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 105092012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play105092013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10002_tpose"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10002_tpose == nil then
				arg_47_1.var_.characterEffect10002_tpose = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10002_tpose then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_47_1.var_.characterEffect10002_tpose.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10002_tpose then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_47_1.var_.characterEffect10002_tpose.fillRatio = var_50_5
			end

			local var_50_6 = arg_47_1.actors_["10002_tpose"].transform
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 then
				arg_47_1.var_.moveOldPos10002_tpose = var_50_6.localPosition
			end

			local var_50_8 = 0.001

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8
				local var_50_10 = Vector3.New(0, 100, 0)

				var_50_6.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10002_tpose, var_50_10, var_50_9)

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
			local var_50_16 = 0.525

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

				local var_50_17 = arg_47_1:GetWordFromCfg(105092012)
				local var_50_18 = arg_47_1:FormatText(var_50_17.content)

				arg_47_1.text_.text = var_50_18

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_19 = 21
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
	Play105092013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 105092013
		arg_51_1.duration_ = 11.4

		local var_51_0 = {
			ja = 11.4,
			ko = 6.866,
			zh = 7.066,
			en = 7.1
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
				arg_51_0:Play105092014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10002_tpose"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect10002_tpose == nil then
				arg_51_1.var_.characterEffect10002_tpose = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect10002_tpose then
					arg_51_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect10002_tpose then
				arg_51_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_54_4 = 0
			local var_54_5 = 0.575

			if var_54_4 < arg_51_1.time_ and arg_51_1.time_ <= var_54_4 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_6 = arg_51_1:FormatText(StoryNameCfg[39].name)

				arg_51_1.leftNameTxt_.text = var_54_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Jolin")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_7 = arg_51_1:GetWordFromCfg(105092013)
				local var_54_8 = arg_51_1:FormatText(var_54_7.content)

				arg_51_1.text_.text = var_54_8

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_9 = 23
				local var_54_10 = utf8.len(var_54_8)
				local var_54_11 = var_54_9 <= 0 and var_54_5 or var_54_5 * (var_54_10 / var_54_9)

				if var_54_11 > 0 and var_54_5 < var_54_11 then
					arg_51_1.talkMaxDuration = var_54_11

					if var_54_11 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_11 + var_54_4
					end
				end

				arg_51_1.text_.text = var_54_8
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092013", "story_v_out_105092.awb") ~= 0 then
					local var_54_12 = manager.audio:GetVoiceLength("story_v_out_105092", "105092013", "story_v_out_105092.awb") / 1000

					if var_54_12 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_4
					end

					if var_54_7.prefab_name ~= "" and arg_51_1.actors_[var_54_7.prefab_name] ~= nil then
						local var_54_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_7.prefab_name].transform, "story_v_out_105092", "105092013", "story_v_out_105092.awb")

						arg_51_1:RecordAudio("105092013", var_54_13)
						arg_51_1:RecordAudio("105092013", var_54_13)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_105092", "105092013", "story_v_out_105092.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_105092", "105092013", "story_v_out_105092.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_14 = math.max(var_54_5, arg_51_1.talkMaxDuration)

			if var_54_4 <= arg_51_1.time_ and arg_51_1.time_ < var_54_4 + var_54_14 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_4) / var_54_14

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_4 + var_54_14 and arg_51_1.time_ < var_54_4 + var_54_14 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play105092014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 105092014
		arg_55_1.duration_ = 1.433

		local var_55_0 = {
			ja = 0.866,
			ko = 1.233,
			zh = 1.366,
			en = 1.433
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
			arg_55_1.auto_ = false
		end

		function arg_55_1.playNext_(arg_57_0)
			arg_55_1.onStoryFinished_()
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.1

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[39].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Jolin")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(105092014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 4
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105092", "105092014", "story_v_out_105092.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_105092", "105092014", "story_v_out_105092.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_105092", "105092014", "story_v_out_105092.awb")

						arg_55_1:RecordAudio("105092014", var_58_9)
						arg_55_1:RecordAudio("105092014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_105092", "105092014", "story_v_out_105092.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_105092", "105092014", "story_v_out_105092.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B03f"
	},
	voices = {
		"story_v_out_105092.awb"
	}
}
