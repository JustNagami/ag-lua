return {
	Play104092001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104092001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play104092002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1")
			end

			local var_4_4 = "B04c"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = arg_1_1.bgs_.B04c
			local var_4_7 = 0

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				local var_4_8 = var_4_6:GetComponent("SpriteRenderer")

				if var_4_8 then
					var_4_8.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_9 = var_4_8.material
					local var_4_10 = var_4_9:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB04c = var_4_10.a
					arg_1_1.var_.alphaMatValueB04c = var_4_9
				end

				arg_1_1.var_.alphaOldValueB04c = 0
			end

			local var_4_11 = 1.5

			if var_4_7 <= arg_1_1.time_ and arg_1_1.time_ < var_4_7 + var_4_11 then
				local var_4_12 = (arg_1_1.time_ - var_4_7) / var_4_11
				local var_4_13 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB04c, 1, var_4_12)

				if arg_1_1.var_.alphaMatValueB04c then
					local var_4_14 = arg_1_1.var_.alphaMatValueB04c
					local var_4_15 = var_4_14:GetColor("_Color")

					var_4_15.a = var_4_13

					var_4_14:SetColor("_Color", var_4_15)
				end
			end

			if arg_1_1.time_ >= var_4_7 + var_4_11 and arg_1_1.time_ < var_4_7 + var_4_11 + arg_4_0 and arg_1_1.var_.alphaMatValueB04c then
				local var_4_16 = arg_1_1.var_.alphaMatValueB04c
				local var_4_17 = var_4_16:GetColor("_Color")

				var_4_17.a = 1

				var_4_16:SetColor("_Color", var_4_17)
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_19 = manager.ui.mainCamera.transform.localPosition
				local var_4_20 = Vector3.New(0, 0, 10) + Vector3.New(var_4_19.x, var_4_19.y, 0)
				local var_4_21 = arg_1_1.bgs_.B04c

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
					if iter_4_0 ~= "B04c" then
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
			local var_4_35 = 0.675

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

				local var_4_37 = arg_1_1:GetWordFromCfg(104092001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 27
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
	Play104092002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104092002
		arg_7_1.duration_ = 5.366

		local var_7_0 = {
			ja = 5.366,
			ko = 3.933,
			zh = 3.566,
			en = 5.066
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
				arg_7_0:Play104092003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1084ui_story"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("Char/" .. var_10_0), arg_7_1.stage_.transform)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_0] = var_10_1

				local var_10_2 = var_10_1:GetComponentInChildren(typeof(CharacterEffect))

				var_10_2.enabled = true

				local var_10_3 = GameObjectTools.GetOrAddComponent(var_10_1, typeof(DynamicBoneHelper))

				if var_10_3 then
					var_10_3:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_2.transform, false)

				arg_7_1.var_[var_10_0 .. "Animator"] = var_10_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_0 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_0 .. "LipSync"] = var_10_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_4 = arg_7_1.actors_["1084ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_8.localPosition
			end

			local var_10_10 = 0.001

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10
				local var_10_12 = Vector3.New(-0.7, -0.97, -6)

				var_10_8.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_12, var_10_11)

				local var_10_13 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_13.x, var_10_13.y, var_10_13.z)

				local var_10_14 = var_10_8.localEulerAngles

				var_10_14.z = 0
				var_10_14.x = 0
				var_10_8.localEulerAngles = var_10_14
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 then
				var_10_8.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_8.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_8.localEulerAngles = var_10_16
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.5

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(104092002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 20
				local var_10_25 = utf8.len(var_10_23)
				local var_10_26 = var_10_24 <= 0 and var_10_20 or var_10_20 * (var_10_25 / var_10_24)

				if var_10_26 > 0 and var_10_20 < var_10_26 then
					arg_7_1.talkMaxDuration = var_10_26

					if var_10_26 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_19
					end
				end

				arg_7_1.text_.text = var_10_23
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092002", "story_v_out_104092.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_104092", "104092002", "story_v_out_104092.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_104092", "104092002", "story_v_out_104092.awb")

						arg_7_1:RecordAudio("104092002", var_10_28)
						arg_7_1:RecordAudio("104092002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_104092", "104092002", "story_v_out_104092.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_104092", "104092002", "story_v_out_104092.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_29 = math.max(var_10_20, arg_7_1.talkMaxDuration)

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_29 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_19) / var_10_29

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_19 + var_10_29 and arg_7_1.time_ < var_10_19 + var_10_29 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play104092003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104092003
		arg_11_1.duration_ = 7.733

		local var_11_0 = {
			ja = 7,
			ko = 7.733,
			zh = 6.933,
			en = 6.466
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
				arg_11_0:Play104092004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10001_tpose"

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

			local var_14_4 = arg_11_1.actors_["10001_tpose"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect10001_tpose == nil then
				arg_11_1.var_.characterEffect10001_tpose = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect10001_tpose then
					arg_11_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect10001_tpose then
				arg_11_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_14_8 = arg_11_1.actors_["1084ui_story"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect1084ui_story then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["10001_tpose"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos10001_tpose = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0.7, -1.23, -5.8)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10001_tpose, var_14_18, var_14_17)

				local var_14_19 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_19.x, var_14_19.y, var_14_19.z)

				local var_14_20 = var_14_14.localEulerAngles

				var_14_20.z = 0
				var_14_20.x = 0
				var_14_14.localEulerAngles = var_14_20
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 then
				var_14_14.localPosition = Vector3.New(0.7, -1.23, -5.8)

				local var_14_21 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_21.x, var_14_21.y, var_14_21.z)

				local var_14_22 = var_14_14.localEulerAngles

				var_14_22.z = 0
				var_14_22.x = 0
				var_14_14.localEulerAngles = var_14_22
			end

			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 then
				arg_11_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_1")
			end

			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_14_25 = 0
			local var_14_26 = 0.775

			if var_14_25 < arg_11_1.time_ and arg_11_1.time_ <= var_14_25 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_27 = arg_11_1:FormatText(StoryNameCfg[31].name)

				arg_11_1.leftNameTxt_.text = var_14_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_28 = arg_11_1:GetWordFromCfg(104092003)
				local var_14_29 = arg_11_1:FormatText(var_14_28.content)

				arg_11_1.text_.text = var_14_29

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_30 = 30
				local var_14_31 = utf8.len(var_14_29)
				local var_14_32 = var_14_30 <= 0 and var_14_26 or var_14_26 * (var_14_31 / var_14_30)

				if var_14_32 > 0 and var_14_26 < var_14_32 then
					arg_11_1.talkMaxDuration = var_14_32

					if var_14_32 + var_14_25 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_32 + var_14_25
					end
				end

				arg_11_1.text_.text = var_14_29
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092003", "story_v_out_104092.awb") ~= 0 then
					local var_14_33 = manager.audio:GetVoiceLength("story_v_out_104092", "104092003", "story_v_out_104092.awb") / 1000

					if var_14_33 + var_14_25 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_33 + var_14_25
					end

					if var_14_28.prefab_name ~= "" and arg_11_1.actors_[var_14_28.prefab_name] ~= nil then
						local var_14_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_28.prefab_name].transform, "story_v_out_104092", "104092003", "story_v_out_104092.awb")

						arg_11_1:RecordAudio("104092003", var_14_34)
						arg_11_1:RecordAudio("104092003", var_14_34)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104092", "104092003", "story_v_out_104092.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104092", "104092003", "story_v_out_104092.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_35 = math.max(var_14_26, arg_11_1.talkMaxDuration)

			if var_14_25 <= arg_11_1.time_ and arg_11_1.time_ < var_14_25 + var_14_35 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_25) / var_14_35

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_25 + var_14_35 and arg_11_1.time_ < var_14_25 + var_14_35 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play104092004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104092004
		arg_15_1.duration_ = 8.4

		local var_15_0 = {
			ja = 8.4,
			ko = 3.9,
			zh = 5.8,
			en = 5.8
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
				arg_15_0:Play104092005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1019ui_story"

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

			local var_18_4 = arg_15_1.actors_["1019ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story == nil then
				arg_15_1.var_.characterEffect1019ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1019ui_story then
					arg_15_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story then
				arg_15_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["10001_tpose"]
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 and arg_15_1.var_.characterEffect10001_tpose == nil then
				arg_15_1.var_.characterEffect10001_tpose = var_18_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_10 = 0.1

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10

				if arg_15_1.var_.characterEffect10001_tpose then
					local var_18_12 = Mathf.Lerp(0, 0.5, var_18_11)

					arg_15_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_15_1.var_.characterEffect10001_tpose.fillRatio = var_18_12
				end
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect10001_tpose then
				local var_18_13 = 0.5

				arg_15_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_15_1.var_.characterEffect10001_tpose.fillRatio = var_18_13
			end

			local var_18_14 = arg_15_1.actors_["10001_tpose"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos10001_tpose = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0, 100, 0)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10001_tpose, var_18_18, var_18_17)

				local var_18_19 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_19.x, var_18_19.y, var_18_19.z)

				local var_18_20 = var_18_14.localEulerAngles

				var_18_20.z = 0
				var_18_20.x = 0
				var_18_14.localEulerAngles = var_18_20
			end

			if arg_15_1.time_ >= var_18_15 + var_18_16 and arg_15_1.time_ < var_18_15 + var_18_16 + arg_18_0 then
				var_18_14.localPosition = Vector3.New(0, 100, 0)

				local var_18_21 = manager.ui.mainCamera.transform.position - var_18_14.position

				var_18_14.forward = Vector3.New(var_18_21.x, var_18_21.y, var_18_21.z)

				local var_18_22 = var_18_14.localEulerAngles

				var_18_22.z = 0
				var_18_22.x = 0
				var_18_14.localEulerAngles = var_18_22
			end

			local var_18_23 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_23.localPosition
			end

			local var_18_25 = 0.001

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_25 then
				local var_18_26 = (arg_15_1.time_ - var_18_24) / var_18_25
				local var_18_27 = Vector3.New(0, 100, 0)

				var_18_23.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_27, var_18_26)

				local var_18_28 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_28.x, var_18_28.y, var_18_28.z)

				local var_18_29 = var_18_23.localEulerAngles

				var_18_29.z = 0
				var_18_29.x = 0
				var_18_23.localEulerAngles = var_18_29
			end

			if arg_15_1.time_ >= var_18_24 + var_18_25 and arg_15_1.time_ < var_18_24 + var_18_25 + arg_18_0 then
				var_18_23.localPosition = Vector3.New(0, 100, 0)

				local var_18_30 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_30.x, var_18_30.y, var_18_30.z)

				local var_18_31 = var_18_23.localEulerAngles

				var_18_31.z = 0
				var_18_31.x = 0
				var_18_23.localEulerAngles = var_18_31
			end

			local var_18_32 = arg_15_1.actors_["1019ui_story"].transform
			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1.var_.moveOldPos1019ui_story = var_18_32.localPosition
			end

			local var_18_34 = 0.001

			if var_18_33 <= arg_15_1.time_ and arg_15_1.time_ < var_18_33 + var_18_34 then
				local var_18_35 = (arg_15_1.time_ - var_18_33) / var_18_34
				local var_18_36 = Vector3.New(0, -1.08, -5.9)

				var_18_32.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1019ui_story, var_18_36, var_18_35)

				local var_18_37 = manager.ui.mainCamera.transform.position - var_18_32.position

				var_18_32.forward = Vector3.New(var_18_37.x, var_18_37.y, var_18_37.z)

				local var_18_38 = var_18_32.localEulerAngles

				var_18_38.z = 0
				var_18_38.x = 0
				var_18_32.localEulerAngles = var_18_38
			end

			if arg_15_1.time_ >= var_18_33 + var_18_34 and arg_15_1.time_ < var_18_33 + var_18_34 + arg_18_0 then
				var_18_32.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_18_39 = manager.ui.mainCamera.transform.position - var_18_32.position

				var_18_32.forward = Vector3.New(var_18_39.x, var_18_39.y, var_18_39.z)

				local var_18_40 = var_18_32.localEulerAngles

				var_18_40.z = 0
				var_18_40.x = 0
				var_18_32.localEulerAngles = var_18_40
			end

			local var_18_41 = 0

			if var_18_41 < arg_15_1.time_ and arg_15_1.time_ <= var_18_41 + arg_18_0 then
				arg_15_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_18_42 = 0

			if var_18_42 < arg_15_1.time_ and arg_15_1.time_ <= var_18_42 + arg_18_0 then
				arg_15_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_18_43 = 0
			local var_18_44 = 0.45

			if var_18_43 < arg_15_1.time_ and arg_15_1.time_ <= var_18_43 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_45 = arg_15_1:FormatText(StoryNameCfg[13].name)

				arg_15_1.leftNameTxt_.text = var_18_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_46 = arg_15_1:GetWordFromCfg(104092004)
				local var_18_47 = arg_15_1:FormatText(var_18_46.content)

				arg_15_1.text_.text = var_18_47

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_48 = 18
				local var_18_49 = utf8.len(var_18_47)
				local var_18_50 = var_18_48 <= 0 and var_18_44 or var_18_44 * (var_18_49 / var_18_48)

				if var_18_50 > 0 and var_18_44 < var_18_50 then
					arg_15_1.talkMaxDuration = var_18_50

					if var_18_50 + var_18_43 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_50 + var_18_43
					end
				end

				arg_15_1.text_.text = var_18_47
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092004", "story_v_out_104092.awb") ~= 0 then
					local var_18_51 = manager.audio:GetVoiceLength("story_v_out_104092", "104092004", "story_v_out_104092.awb") / 1000

					if var_18_51 + var_18_43 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_51 + var_18_43
					end

					if var_18_46.prefab_name ~= "" and arg_15_1.actors_[var_18_46.prefab_name] ~= nil then
						local var_18_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_46.prefab_name].transform, "story_v_out_104092", "104092004", "story_v_out_104092.awb")

						arg_15_1:RecordAudio("104092004", var_18_52)
						arg_15_1:RecordAudio("104092004", var_18_52)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104092", "104092004", "story_v_out_104092.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104092", "104092004", "story_v_out_104092.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_53 = math.max(var_18_44, arg_15_1.talkMaxDuration)

			if var_18_43 <= arg_15_1.time_ and arg_15_1.time_ < var_18_43 + var_18_53 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_43) / var_18_53

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_43 + var_18_53 and arg_15_1.time_ < var_18_43 + var_18_53 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104092005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104092005
		arg_19_1.duration_ = 4.633

		local var_19_0 = {
			ja = 4.433,
			ko = 3.933,
			zh = 3.666,
			en = 4.633
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
				arg_19_0:Play104092006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1036ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("Char/" .. var_22_0), arg_19_1.stage_.transform)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_0] = var_22_1

				local var_22_2 = var_22_1:GetComponentInChildren(typeof(CharacterEffect))

				var_22_2.enabled = true

				local var_22_3 = GameObjectTools.GetOrAddComponent(var_22_1, typeof(DynamicBoneHelper))

				if var_22_3 then
					var_22_3:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_2.transform, false)

				arg_19_1.var_[var_22_0 .. "Animator"] = var_22_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_4 = arg_19_1.actors_["1036ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1036ui_story == nil then
				arg_19_1.var_.characterEffect1036ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1036ui_story then
					arg_19_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1036ui_story then
				arg_19_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_22_8 = arg_19_1.actors_["1019ui_story"]
			local var_22_9 = 0

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story == nil then
				arg_19_1.var_.characterEffect1019ui_story = var_22_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_10 = 0.1

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_10 then
				local var_22_11 = (arg_19_1.time_ - var_22_9) / var_22_10

				if arg_19_1.var_.characterEffect1019ui_story then
					local var_22_12 = Mathf.Lerp(0, 0.5, var_22_11)

					arg_19_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1019ui_story.fillRatio = var_22_12
				end
			end

			if arg_19_1.time_ >= var_22_9 + var_22_10 and arg_19_1.time_ < var_22_9 + var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story then
				local var_22_13 = 0.5

				arg_19_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1019ui_story.fillRatio = var_22_13
			end

			local var_22_14 = arg_19_1.actors_["1019ui_story"].transform
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.var_.moveOldPos1019ui_story = var_22_14.localPosition
			end

			local var_22_16 = 0.001

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_16 then
				local var_22_17 = (arg_19_1.time_ - var_22_15) / var_22_16
				local var_22_18 = Vector3.New(0, 100, 0)

				var_22_14.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1019ui_story, var_22_18, var_22_17)

				local var_22_19 = manager.ui.mainCamera.transform.position - var_22_14.position

				var_22_14.forward = Vector3.New(var_22_19.x, var_22_19.y, var_22_19.z)

				local var_22_20 = var_22_14.localEulerAngles

				var_22_20.z = 0
				var_22_20.x = 0
				var_22_14.localEulerAngles = var_22_20
			end

			if arg_19_1.time_ >= var_22_15 + var_22_16 and arg_19_1.time_ < var_22_15 + var_22_16 + arg_22_0 then
				var_22_14.localPosition = Vector3.New(0, 100, 0)

				local var_22_21 = manager.ui.mainCamera.transform.position - var_22_14.position

				var_22_14.forward = Vector3.New(var_22_21.x, var_22_21.y, var_22_21.z)

				local var_22_22 = var_22_14.localEulerAngles

				var_22_22.z = 0
				var_22_22.x = 0
				var_22_14.localEulerAngles = var_22_22
			end

			local var_22_23 = arg_19_1.actors_["1036ui_story"].transform
			local var_22_24 = 0

			if var_22_24 < arg_19_1.time_ and arg_19_1.time_ <= var_22_24 + arg_22_0 then
				arg_19_1.var_.moveOldPos1036ui_story = var_22_23.localPosition
			end

			local var_22_25 = 0.001

			if var_22_24 <= arg_19_1.time_ and arg_19_1.time_ < var_22_24 + var_22_25 then
				local var_22_26 = (arg_19_1.time_ - var_22_24) / var_22_25
				local var_22_27 = Vector3.New(0, -1.09, -5.78)

				var_22_23.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1036ui_story, var_22_27, var_22_26)

				local var_22_28 = manager.ui.mainCamera.transform.position - var_22_23.position

				var_22_23.forward = Vector3.New(var_22_28.x, var_22_28.y, var_22_28.z)

				local var_22_29 = var_22_23.localEulerAngles

				var_22_29.z = 0
				var_22_29.x = 0
				var_22_23.localEulerAngles = var_22_29
			end

			if arg_19_1.time_ >= var_22_24 + var_22_25 and arg_19_1.time_ < var_22_24 + var_22_25 + arg_22_0 then
				var_22_23.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_22_30 = manager.ui.mainCamera.transform.position - var_22_23.position

				var_22_23.forward = Vector3.New(var_22_30.x, var_22_30.y, var_22_30.z)

				local var_22_31 = var_22_23.localEulerAngles

				var_22_31.z = 0
				var_22_31.x = 0
				var_22_23.localEulerAngles = var_22_31
			end

			local var_22_32 = 0

			if var_22_32 < arg_19_1.time_ and arg_19_1.time_ <= var_22_32 + arg_22_0 then
				arg_19_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action7_1")
			end

			local var_22_33 = manager.ui.mainCamera.transform
			local var_22_34 = 0

			if var_22_34 < arg_19_1.time_ and arg_19_1.time_ <= var_22_34 + arg_22_0 then
				arg_19_1.var_.shakeOldPos = var_22_33.localPosition
			end

			local var_22_35 = 0.3

			if var_22_34 <= arg_19_1.time_ and arg_19_1.time_ < var_22_34 + var_22_35 then
				local var_22_36 = (arg_19_1.time_ - var_22_34) / 0.099
				local var_22_37, var_22_38 = math.modf(var_22_36)

				var_22_33.localPosition = Vector3.New(var_22_38 * 0.13, var_22_38 * 0.13, var_22_38 * 0.13) + arg_19_1.var_.shakeOldPos
			end

			if arg_19_1.time_ >= var_22_34 + var_22_35 and arg_19_1.time_ < var_22_34 + var_22_35 + arg_22_0 then
				var_22_33.localPosition = arg_19_1.var_.shakeOldPos
			end

			local var_22_39 = 0

			if var_22_39 < arg_19_1.time_ and arg_19_1.time_ <= var_22_39 + arg_22_0 then
				arg_19_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_22_40 = 0
			local var_22_41 = 0.35

			if var_22_40 < arg_19_1.time_ and arg_19_1.time_ <= var_22_40 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_42 = arg_19_1:FormatText(StoryNameCfg[5].name)

				arg_19_1.leftNameTxt_.text = var_22_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_43 = arg_19_1:GetWordFromCfg(104092005)
				local var_22_44 = arg_19_1:FormatText(var_22_43.content)

				arg_19_1.text_.text = var_22_44

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_45 = 14
				local var_22_46 = utf8.len(var_22_44)
				local var_22_47 = var_22_45 <= 0 and var_22_41 or var_22_41 * (var_22_46 / var_22_45)

				if var_22_47 > 0 and var_22_41 < var_22_47 then
					arg_19_1.talkMaxDuration = var_22_47

					if var_22_47 + var_22_40 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_47 + var_22_40
					end
				end

				arg_19_1.text_.text = var_22_44
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092005", "story_v_out_104092.awb") ~= 0 then
					local var_22_48 = manager.audio:GetVoiceLength("story_v_out_104092", "104092005", "story_v_out_104092.awb") / 1000

					if var_22_48 + var_22_40 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_48 + var_22_40
					end

					if var_22_43.prefab_name ~= "" and arg_19_1.actors_[var_22_43.prefab_name] ~= nil then
						local var_22_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_43.prefab_name].transform, "story_v_out_104092", "104092005", "story_v_out_104092.awb")

						arg_19_1:RecordAudio("104092005", var_22_49)
						arg_19_1:RecordAudio("104092005", var_22_49)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104092", "104092005", "story_v_out_104092.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104092", "104092005", "story_v_out_104092.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_50 = math.max(var_22_41, arg_19_1.talkMaxDuration)

			if var_22_40 <= arg_19_1.time_ and arg_19_1.time_ < var_22_40 + var_22_50 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_40) / var_22_50

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_40 + var_22_50 and arg_19_1.time_ < var_22_40 + var_22_50 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104092006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104092006
		arg_23_1.duration_ = 3.633

		local var_23_0 = {
			ja = 3.166,
			ko = 2.666,
			zh = 3.4,
			en = 3.633
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
				arg_23_0:Play104092007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				local var_26_2 = "play"
				local var_26_3 = "effect"

				arg_23_1:AudioAction(var_26_2, var_26_3, "se_story", "se_story_quake", "")
			end

			local var_26_4 = arg_23_1.actors_["1084ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1084ui_story then
					arg_23_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				arg_23_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["1036ui_story"]
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect1036ui_story == nil then
				arg_23_1.var_.characterEffect1036ui_story = var_26_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_10 = 0.1

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10

				if arg_23_1.var_.characterEffect1036ui_story then
					local var_26_12 = Mathf.Lerp(0, 0.5, var_26_11)

					arg_23_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1036ui_story.fillRatio = var_26_12
				end
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1036ui_story then
				local var_26_13 = 0.5

				arg_23_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1036ui_story.fillRatio = var_26_13
			end

			local var_26_14 = arg_23_1.actors_["1036ui_story"].transform
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.var_.moveOldPos1036ui_story = var_26_14.localPosition
			end

			local var_26_16 = 0.001

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16
				local var_26_18 = Vector3.New(0, 100, 0)

				var_26_14.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1036ui_story, var_26_18, var_26_17)

				local var_26_19 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_19.x, var_26_19.y, var_26_19.z)

				local var_26_20 = var_26_14.localEulerAngles

				var_26_20.z = 0
				var_26_20.x = 0
				var_26_14.localEulerAngles = var_26_20
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 then
				var_26_14.localPosition = Vector3.New(0, 100, 0)

				local var_26_21 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_21.x, var_26_21.y, var_26_21.z)

				local var_26_22 = var_26_14.localEulerAngles

				var_26_22.z = 0
				var_26_22.x = 0
				var_26_14.localEulerAngles = var_26_22
			end

			local var_26_23 = arg_23_1.actors_["1084ui_story"].transform
			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.var_.moveOldPos1084ui_story = var_26_23.localPosition
			end

			local var_26_25 = 0.001

			if var_26_24 <= arg_23_1.time_ and arg_23_1.time_ < var_26_24 + var_26_25 then
				local var_26_26 = (arg_23_1.time_ - var_26_24) / var_26_25
				local var_26_27 = Vector3.New(0, -0.97, -6)

				var_26_23.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1084ui_story, var_26_27, var_26_26)

				local var_26_28 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_28.x, var_26_28.y, var_26_28.z)

				local var_26_29 = var_26_23.localEulerAngles

				var_26_29.z = 0
				var_26_29.x = 0
				var_26_23.localEulerAngles = var_26_29
			end

			if arg_23_1.time_ >= var_26_24 + var_26_25 and arg_23_1.time_ < var_26_24 + var_26_25 + arg_26_0 then
				var_26_23.localPosition = Vector3.New(0, -0.97, -6)

				local var_26_30 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_30.x, var_26_30.y, var_26_30.z)

				local var_26_31 = var_26_23.localEulerAngles

				var_26_31.z = 0
				var_26_31.x = 0
				var_26_23.localEulerAngles = var_26_31
			end

			local var_26_32 = 0

			if var_26_32 < arg_23_1.time_ and arg_23_1.time_ <= var_26_32 + arg_26_0 then
				arg_23_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_26_33 = manager.ui.mainCamera.transform
			local var_26_34 = 0

			if var_26_34 < arg_23_1.time_ and arg_23_1.time_ <= var_26_34 + arg_26_0 then
				arg_23_1.var_.shakeOldPos = var_26_33.localPosition
			end

			local var_26_35 = 0.3

			if var_26_34 <= arg_23_1.time_ and arg_23_1.time_ < var_26_34 + var_26_35 then
				local var_26_36 = (arg_23_1.time_ - var_26_34) / 0.099
				local var_26_37, var_26_38 = math.modf(var_26_36)

				var_26_33.localPosition = Vector3.New(var_26_38 * 0.13, var_26_38 * 0.13, var_26_38 * 0.13) + arg_23_1.var_.shakeOldPos
			end

			if arg_23_1.time_ >= var_26_34 + var_26_35 and arg_23_1.time_ < var_26_34 + var_26_35 + arg_26_0 then
				var_26_33.localPosition = arg_23_1.var_.shakeOldPos
			end

			local var_26_39 = 0

			if var_26_39 < arg_23_1.time_ and arg_23_1.time_ <= var_26_39 + arg_26_0 then
				arg_23_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_26_40 = 0
			local var_26_41 = 0.3

			if var_26_40 < arg_23_1.time_ and arg_23_1.time_ <= var_26_40 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_42 = arg_23_1:FormatText(StoryNameCfg[6].name)

				arg_23_1.leftNameTxt_.text = var_26_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_43 = arg_23_1:GetWordFromCfg(104092006)
				local var_26_44 = arg_23_1:FormatText(var_26_43.content)

				arg_23_1.text_.text = var_26_44

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_45 = 12
				local var_26_46 = utf8.len(var_26_44)
				local var_26_47 = var_26_45 <= 0 and var_26_41 or var_26_41 * (var_26_46 / var_26_45)

				if var_26_47 > 0 and var_26_41 < var_26_47 then
					arg_23_1.talkMaxDuration = var_26_47

					if var_26_47 + var_26_40 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_47 + var_26_40
					end
				end

				arg_23_1.text_.text = var_26_44
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092006", "story_v_out_104092.awb") ~= 0 then
					local var_26_48 = manager.audio:GetVoiceLength("story_v_out_104092", "104092006", "story_v_out_104092.awb") / 1000

					if var_26_48 + var_26_40 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_48 + var_26_40
					end

					if var_26_43.prefab_name ~= "" and arg_23_1.actors_[var_26_43.prefab_name] ~= nil then
						local var_26_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_43.prefab_name].transform, "story_v_out_104092", "104092006", "story_v_out_104092.awb")

						arg_23_1:RecordAudio("104092006", var_26_49)
						arg_23_1:RecordAudio("104092006", var_26_49)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_104092", "104092006", "story_v_out_104092.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_104092", "104092006", "story_v_out_104092.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_50 = math.max(var_26_41, arg_23_1.talkMaxDuration)

			if var_26_40 <= arg_23_1.time_ and arg_23_1.time_ < var_26_40 + var_26_50 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_40) / var_26_50

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_40 + var_26_50 and arg_23_1.time_ < var_26_40 + var_26_50 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play104092007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104092007
		arg_27_1.duration_ = 1.999999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play104092008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = manager.ui.mainCamera.transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.shakeOldPosMainCamera = var_30_0.localPosition
			end

			local var_30_2 = 0.600000023841858

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / 0.066
				local var_30_4, var_30_5 = math.modf(var_30_3)

				var_30_0.localPosition = Vector3.New(var_30_5 * 0.13, var_30_5 * 0.13, var_30_5 * 0.13) + arg_27_1.var_.shakeOldPosMainCamera
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = arg_27_1.var_.shakeOldPosMainCamera
			end

			local var_30_6 = 0

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4134")
			end

			local var_30_7 = manager.ui.mainCamera.transform
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 then
				arg_27_1.var_.shakeOldPos = var_30_7.localPosition
			end

			local var_30_9 = 0.3

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / 0.066
				local var_30_11, var_30_12 = math.modf(var_30_10)

				var_30_7.localPosition = Vector3.New(var_30_12 * 0.13, var_30_12 * 0.13, var_30_12 * 0.13) + arg_27_1.var_.shakeOldPos
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 then
				var_30_7.localPosition = arg_27_1.var_.shakeOldPos
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_30_14 = 0
			local var_30_15 = 0.125

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_16 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_17 = arg_27_1:GetWordFromCfg(104092007)
				local var_30_18 = arg_27_1:FormatText(var_30_17.content)

				arg_27_1.text_.text = var_30_18

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_19 = 5
				local var_30_20 = utf8.len(var_30_18)
				local var_30_21 = var_30_19 <= 0 and var_30_15 or var_30_15 * (var_30_20 / var_30_19)

				if var_30_21 > 0 and var_30_15 < var_30_21 then
					arg_27_1.talkMaxDuration = var_30_21

					if var_30_21 + var_30_14 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_14
					end
				end

				arg_27_1.text_.text = var_30_18
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092007", "story_v_out_104092.awb") ~= 0 then
					local var_30_22 = manager.audio:GetVoiceLength("story_v_out_104092", "104092007", "story_v_out_104092.awb") / 1000

					if var_30_22 + var_30_14 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_22 + var_30_14
					end

					if var_30_17.prefab_name ~= "" and arg_27_1.actors_[var_30_17.prefab_name] ~= nil then
						local var_30_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_17.prefab_name].transform, "story_v_out_104092", "104092007", "story_v_out_104092.awb")

						arg_27_1:RecordAudio("104092007", var_30_23)
						arg_27_1:RecordAudio("104092007", var_30_23)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_104092", "104092007", "story_v_out_104092.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_104092", "104092007", "story_v_out_104092.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_24 = math.max(var_30_15, arg_27_1.talkMaxDuration)

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_24 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_14) / var_30_24

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_14 + var_30_24 and arg_27_1.time_ < var_30_14 + var_30_24 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play104092008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104092008
		arg_31_1.duration_ = 2.533

		local var_31_0 = {
			ja = 2.533,
			ko = 1.966,
			zh = 2.1,
			en = 2.3
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
				arg_31_0:Play104092009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1084ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1084ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1084ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1084ui_story.fillRatio = var_34_5
			end

			local var_34_6 = arg_31_1.actors_["1084ui_story"].transform
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 then
				arg_31_1.var_.moveOldPos1084ui_story = var_34_6.localPosition
			end

			local var_34_8 = 0.001

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8
				local var_34_10 = Vector3.New(0, 100, 0)

				var_34_6.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1084ui_story, var_34_10, var_34_9)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_6.position

				var_34_6.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_6.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_6.localEulerAngles = var_34_12
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 then
				var_34_6.localPosition = Vector3.New(0, 100, 0)

				local var_34_13 = manager.ui.mainCamera.transform.position - var_34_6.position

				var_34_6.forward = Vector3.New(var_34_13.x, var_34_13.y, var_34_13.z)

				local var_34_14 = var_34_6.localEulerAngles

				var_34_14.z = 0
				var_34_14.x = 0
				var_34_6.localEulerAngles = var_34_14
			end

			local var_34_15 = 0
			local var_34_16 = 0.225

			if var_34_15 < arg_31_1.time_ and arg_31_1.time_ <= var_34_15 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_17 = arg_31_1:FormatText(StoryNameCfg[13].name)

				arg_31_1.leftNameTxt_.text = var_34_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_18 = arg_31_1:GetWordFromCfg(104092008)
				local var_34_19 = arg_31_1:FormatText(var_34_18.content)

				arg_31_1.text_.text = var_34_19

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_20 = 9
				local var_34_21 = utf8.len(var_34_19)
				local var_34_22 = var_34_20 <= 0 and var_34_16 or var_34_16 * (var_34_21 / var_34_20)

				if var_34_22 > 0 and var_34_16 < var_34_22 then
					arg_31_1.talkMaxDuration = var_34_22

					if var_34_22 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_22 + var_34_15
					end
				end

				arg_31_1.text_.text = var_34_19
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092008", "story_v_out_104092.awb") ~= 0 then
					local var_34_23 = manager.audio:GetVoiceLength("story_v_out_104092", "104092008", "story_v_out_104092.awb") / 1000

					if var_34_23 + var_34_15 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_23 + var_34_15
					end

					if var_34_18.prefab_name ~= "" and arg_31_1.actors_[var_34_18.prefab_name] ~= nil then
						local var_34_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_18.prefab_name].transform, "story_v_out_104092", "104092008", "story_v_out_104092.awb")

						arg_31_1:RecordAudio("104092008", var_34_24)
						arg_31_1:RecordAudio("104092008", var_34_24)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104092", "104092008", "story_v_out_104092.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104092", "104092008", "story_v_out_104092.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_25 = math.max(var_34_16, arg_31_1.talkMaxDuration)

			if var_34_15 <= arg_31_1.time_ and arg_31_1.time_ < var_34_15 + var_34_25 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_15) / var_34_25

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_15 + var_34_25 and arg_31_1.time_ < var_34_15 + var_34_25 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play104092009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104092009
		arg_35_1.duration_ = 3.5

		local var_35_0 = {
			ja = 3.5,
			ko = 3.033,
			zh = 2.866,
			en = 3.1
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
				arg_35_0:Play104092010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = manager.ui.mainCamera.transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.shakeOldPosMainCamera = var_38_0.localPosition
			end

			local var_38_2 = 0.600000023841858

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / 0.066
				local var_38_4, var_38_5 = math.modf(var_38_3)

				var_38_0.localPosition = Vector3.New(var_38_5 * 0.13, var_38_5 * 0.13, var_38_5 * 0.13) + arg_35_1.var_.shakeOldPosMainCamera
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = arg_35_1.var_.shakeOldPosMainCamera
			end

			local var_38_6 = 0
			local var_38_7 = 0.325

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[31].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(104092009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 13
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092009", "story_v_out_104092.awb") ~= 0 then
					local var_38_14 = manager.audio:GetVoiceLength("story_v_out_104092", "104092009", "story_v_out_104092.awb") / 1000

					if var_38_14 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_14 + var_38_6
					end

					if var_38_9.prefab_name ~= "" and arg_35_1.actors_[var_38_9.prefab_name] ~= nil then
						local var_38_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_9.prefab_name].transform, "story_v_out_104092", "104092009", "story_v_out_104092.awb")

						arg_35_1:RecordAudio("104092009", var_38_15)
						arg_35_1:RecordAudio("104092009", var_38_15)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_104092", "104092009", "story_v_out_104092.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_104092", "104092009", "story_v_out_104092.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_16 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_16 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_16

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_16 and arg_35_1.time_ < var_38_6 + var_38_16 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play104092010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104092010
		arg_39_1.duration_ = 11.9

		local var_39_0 = {
			ja = 8.966,
			ko = 6.9,
			zh = 11.9,
			en = 8.533
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
				arg_39_0:Play104092011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1019ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1019ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1019ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, 100, 0)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = 0
			local var_42_10 = 0.75

			if var_42_9 < arg_39_1.time_ and arg_39_1.time_ <= var_42_9 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_11 = arg_39_1:FormatText(StoryNameCfg[63].name)

				arg_39_1.leftNameTxt_.text = var_42_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4012")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_12 = arg_39_1:GetWordFromCfg(104092010)
				local var_42_13 = arg_39_1:FormatText(var_42_12.content)

				arg_39_1.text_.text = var_42_13

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_14 = 30
				local var_42_15 = utf8.len(var_42_13)
				local var_42_16 = var_42_14 <= 0 and var_42_10 or var_42_10 * (var_42_15 / var_42_14)

				if var_42_16 > 0 and var_42_10 < var_42_16 then
					arg_39_1.talkMaxDuration = var_42_16

					if var_42_16 + var_42_9 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_16 + var_42_9
					end
				end

				arg_39_1.text_.text = var_42_13
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092010", "story_v_out_104092.awb") ~= 0 then
					local var_42_17 = manager.audio:GetVoiceLength("story_v_out_104092", "104092010", "story_v_out_104092.awb") / 1000

					if var_42_17 + var_42_9 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_17 + var_42_9
					end

					if var_42_12.prefab_name ~= "" and arg_39_1.actors_[var_42_12.prefab_name] ~= nil then
						local var_42_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_12.prefab_name].transform, "story_v_out_104092", "104092010", "story_v_out_104092.awb")

						arg_39_1:RecordAudio("104092010", var_42_18)
						arg_39_1:RecordAudio("104092010", var_42_18)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_104092", "104092010", "story_v_out_104092.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_104092", "104092010", "story_v_out_104092.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_19 = math.max(var_42_10, arg_39_1.talkMaxDuration)

			if var_42_9 <= arg_39_1.time_ and arg_39_1.time_ < var_42_9 + var_42_19 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_9) / var_42_19

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_9 + var_42_19 and arg_39_1.time_ < var_42_9 + var_42_19 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play104092011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104092011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play104092012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.825

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_2 = arg_43_1:GetWordFromCfg(104092011)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 73
				local var_46_5 = utf8.len(var_46_3)
				local var_46_6 = var_46_4 <= 0 and var_46_1 or var_46_1 * (var_46_5 / var_46_4)

				if var_46_6 > 0 and var_46_1 < var_46_6 then
					arg_43_1.talkMaxDuration = var_46_6

					if var_46_6 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_6 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_3
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_7 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_7 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_7

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_7 and arg_43_1.time_ < var_46_0 + var_46_7 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play104092012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 104092012
		arg_47_1.duration_ = 6.866

		local var_47_0 = {
			ja = 6.866,
			ko = 5.6,
			zh = 5.1,
			en = 5.5
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
				arg_47_0:Play104092013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = manager.ui.mainCamera.transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.shakeOldPosMainCamera = var_50_0.localPosition
			end

			local var_50_2 = 0.600000023841858

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / 0.066
				local var_50_4, var_50_5 = math.modf(var_50_3)

				var_50_0.localPosition = Vector3.New(var_50_5 * 0.13, var_50_5 * 0.13, var_50_5 * 0.13) + arg_47_1.var_.shakeOldPosMainCamera
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = arg_47_1.var_.shakeOldPosMainCamera
			end

			local var_50_6 = 0
			local var_50_7 = 0.575

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[5].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(104092012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 23
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092012", "story_v_out_104092.awb") ~= 0 then
					local var_50_14 = manager.audio:GetVoiceLength("story_v_out_104092", "104092012", "story_v_out_104092.awb") / 1000

					if var_50_14 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_14 + var_50_6
					end

					if var_50_9.prefab_name ~= "" and arg_47_1.actors_[var_50_9.prefab_name] ~= nil then
						local var_50_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_9.prefab_name].transform, "story_v_out_104092", "104092012", "story_v_out_104092.awb")

						arg_47_1:RecordAudio("104092012", var_50_15)
						arg_47_1:RecordAudio("104092012", var_50_15)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_104092", "104092012", "story_v_out_104092.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_104092", "104092012", "story_v_out_104092.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_16 and arg_47_1.time_ < var_50_6 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play104092013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 104092013
		arg_51_1.duration_ = 3.4

		local var_51_0 = {
			ja = 3.4,
			ko = 3,
			zh = 2.6,
			en = 3.1
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
				arg_51_0:Play104092014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = manager.ui.mainCamera.transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.shakeOldPosMainCamera = var_54_0.localPosition
			end

			local var_54_2 = 0.600000023841858

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / 0.066
				local var_54_4, var_54_5 = math.modf(var_54_3)

				var_54_0.localPosition = Vector3.New(var_54_5 * 0.13, var_54_5 * 0.13, var_54_5 * 0.13) + arg_51_1.var_.shakeOldPosMainCamera
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = arg_51_1.var_.shakeOldPosMainCamera
			end

			local var_54_6 = 0
			local var_54_7 = 0.275

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[13].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(104092013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 11
				local var_54_12 = utf8.len(var_54_10)
				local var_54_13 = var_54_11 <= 0 and var_54_7 or var_54_7 * (var_54_12 / var_54_11)

				if var_54_13 > 0 and var_54_7 < var_54_13 then
					arg_51_1.talkMaxDuration = var_54_13

					if var_54_13 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_13 + var_54_6
					end
				end

				arg_51_1.text_.text = var_54_10
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092013", "story_v_out_104092.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_104092", "104092013", "story_v_out_104092.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_104092", "104092013", "story_v_out_104092.awb")

						arg_51_1:RecordAudio("104092013", var_54_15)
						arg_51_1:RecordAudio("104092013", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_104092", "104092013", "story_v_out_104092.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_104092", "104092013", "story_v_out_104092.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_16 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_16 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_16

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_16 and arg_51_1.time_ < var_54_6 + var_54_16 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play104092014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 104092014
		arg_55_1.duration_ = 3.9

		local var_55_0 = {
			ja = 3.9,
			ko = 2.4,
			zh = 3,
			en = 3.1
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
				arg_55_0:Play104092015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.275

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[31].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(104092014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092014", "story_v_out_104092.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092014", "story_v_out_104092.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_104092", "104092014", "story_v_out_104092.awb")

						arg_55_1:RecordAudio("104092014", var_58_9)
						arg_55_1:RecordAudio("104092014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_104092", "104092014", "story_v_out_104092.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_104092", "104092014", "story_v_out_104092.awb")
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
	Play104092015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 104092015
		arg_59_1.duration_ = 20.4

		local var_59_0 = {
			ja = 20.4,
			ko = 9.566,
			zh = 8.866,
			en = 9.1
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
				arg_59_0:Play104092016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.625

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[49].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(104092015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092015", "story_v_out_104092.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092015", "story_v_out_104092.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_104092", "104092015", "story_v_out_104092.awb")

						arg_59_1:RecordAudio("104092015", var_62_9)
						arg_59_1:RecordAudio("104092015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_104092", "104092015", "story_v_out_104092.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_104092", "104092015", "story_v_out_104092.awb")
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
	Play104092016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 104092016
		arg_63_1.duration_ = 1.933

		local var_63_0 = {
			ja = 1.933,
			ko = 1.333,
			zh = 1.766,
			en = 1.366
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
				arg_63_0:Play104092017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.1

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[5].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(104092016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 4
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092016", "story_v_out_104092.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092016", "story_v_out_104092.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_104092", "104092016", "story_v_out_104092.awb")

						arg_63_1:RecordAudio("104092016", var_66_9)
						arg_63_1:RecordAudio("104092016", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_104092", "104092016", "story_v_out_104092.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_104092", "104092016", "story_v_out_104092.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play104092017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 104092017
		arg_67_1.duration_ = 13.2

		local var_67_0 = {
			ja = 13.2,
			ko = 6.4,
			zh = 9.766,
			en = 9.633
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
				arg_67_0:Play104092018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.975

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[49].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(104092017)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092017", "story_v_out_104092.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092017", "story_v_out_104092.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_104092", "104092017", "story_v_out_104092.awb")

						arg_67_1:RecordAudio("104092017", var_70_9)
						arg_67_1:RecordAudio("104092017", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_104092", "104092017", "story_v_out_104092.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_104092", "104092017", "story_v_out_104092.awb")
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
	Play104092018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 104092018
		arg_71_1.duration_ = 11.0333333333333

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
			arg_71_1.auto_ = false
		end

		function arg_71_1.playNext_(arg_73_0)
			arg_71_1.onStoryFinished_()
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.bgs_.B04c
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				local var_74_2 = var_74_0:GetComponent("SpriteRenderer")

				if var_74_2 then
					var_74_2.material = arg_71_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_74_3 = var_74_2.material
					local var_74_4 = var_74_3:GetColor("_Color")

					arg_71_1.var_.alphaOldValueB04c = var_74_4.a
					arg_71_1.var_.alphaMatValueB04c = var_74_3
				end

				arg_71_1.var_.alphaOldValueB04c = 1
			end

			local var_74_5 = 1.5

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_5 then
				local var_74_6 = (arg_71_1.time_ - var_74_1) / var_74_5
				local var_74_7 = Mathf.Lerp(arg_71_1.var_.alphaOldValueB04c, 0, var_74_6)

				if arg_71_1.var_.alphaMatValueB04c then
					local var_74_8 = arg_71_1.var_.alphaMatValueB04c
					local var_74_9 = var_74_8:GetColor("_Color")

					var_74_9.a = var_74_7

					var_74_8:SetColor("_Color", var_74_9)
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_5 and arg_71_1.time_ < var_74_1 + var_74_5 + arg_74_0 and arg_71_1.var_.alphaMatValueB04c then
				local var_74_10 = arg_71_1.var_.alphaMatValueB04c
				local var_74_11 = var_74_10:GetColor("_Color")

				var_74_11.a = 0

				var_74_10:SetColor("_Color", var_74_11)
			end

			local var_74_12 = "S0406"

			if arg_71_1.bgs_[var_74_12] == nil then
				local var_74_13 = Object.Instantiate(arg_71_1.paintGo_)

				var_74_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_74_12)
				var_74_13.name = var_74_12
				var_74_13.transform.parent = arg_71_1.stage_.transform
				var_74_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.bgs_[var_74_12] = var_74_13
			end

			local var_74_14 = arg_71_1.bgs_.S0406
			local var_74_15 = 1.5

			if var_74_15 < arg_71_1.time_ and arg_71_1.time_ <= var_74_15 + arg_74_0 then
				local var_74_16 = var_74_14:GetComponent("SpriteRenderer")

				if var_74_16 then
					var_74_16.material = arg_71_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_74_17 = var_74_16.material
					local var_74_18 = var_74_17:GetColor("_Color")

					arg_71_1.var_.alphaOldValueS0406 = var_74_18.a
					arg_71_1.var_.alphaMatValueS0406 = var_74_17
				end

				arg_71_1.var_.alphaOldValueS0406 = 0
			end

			local var_74_19 = 1.5

			if var_74_15 <= arg_71_1.time_ and arg_71_1.time_ < var_74_15 + var_74_19 then
				local var_74_20 = (arg_71_1.time_ - var_74_15) / var_74_19
				local var_74_21 = Mathf.Lerp(arg_71_1.var_.alphaOldValueS0406, 1, var_74_20)

				if arg_71_1.var_.alphaMatValueS0406 then
					local var_74_22 = arg_71_1.var_.alphaMatValueS0406
					local var_74_23 = var_74_22:GetColor("_Color")

					var_74_23.a = var_74_21

					var_74_22:SetColor("_Color", var_74_23)
				end
			end

			if arg_71_1.time_ >= var_74_15 + var_74_19 and arg_71_1.time_ < var_74_15 + var_74_19 + arg_74_0 and arg_71_1.var_.alphaMatValueS0406 then
				local var_74_24 = arg_71_1.var_.alphaMatValueS0406
				local var_74_25 = var_74_24:GetColor("_Color")

				var_74_25.a = 1

				var_74_24:SetColor("_Color", var_74_25)
			end

			local var_74_26 = arg_71_1.bgs_.B04c.transform
			local var_74_27 = 1.5

			if var_74_27 < arg_71_1.time_ and arg_71_1.time_ <= var_74_27 + arg_74_0 then
				arg_71_1.var_.moveOldPosB04c = var_74_26.localPosition
			end

			local var_74_28 = 0.001

			if var_74_27 <= arg_71_1.time_ and arg_71_1.time_ < var_74_27 + var_74_28 then
				local var_74_29 = (arg_71_1.time_ - var_74_27) / var_74_28
				local var_74_30 = Vector3.New(0, 100, 10)

				var_74_26.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosB04c, var_74_30, var_74_29)
			end

			if arg_71_1.time_ >= var_74_27 + var_74_28 and arg_71_1.time_ < var_74_27 + var_74_28 + arg_74_0 then
				var_74_26.localPosition = Vector3.New(0, 100, 10)
			end

			local var_74_31 = arg_71_1.bgs_.S0406.transform
			local var_74_32 = 5.53333333333333

			if var_74_32 < arg_71_1.time_ and arg_71_1.time_ <= var_74_32 + arg_74_0 then
				arg_71_1.var_.moveOldPosS0406 = var_74_31.localPosition
			end

			local var_74_33 = 0.001

			if var_74_32 <= arg_71_1.time_ and arg_71_1.time_ < var_74_32 + var_74_33 then
				local var_74_34 = (arg_71_1.time_ - var_74_32) / var_74_33
				local var_74_35 = Vector3.New(0, 100, 10)

				var_74_31.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosS0406, var_74_35, var_74_34)
			end

			if arg_71_1.time_ >= var_74_32 + var_74_33 and arg_71_1.time_ < var_74_32 + var_74_33 + arg_74_0 then
				var_74_31.localPosition = Vector3.New(0, 100, 10)
			end

			local var_74_36 = 5.53333333333333

			if var_74_36 < arg_71_1.time_ and arg_71_1.time_ <= var_74_36 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_37 = 0.5

			if var_74_36 <= arg_71_1.time_ and arg_71_1.time_ < var_74_36 + var_74_37 then
				local var_74_38 = (arg_71_1.time_ - var_74_36) / var_74_37
				local var_74_39 = Color.New(1, 1, 1)

				var_74_39.a = Mathf.Lerp(1, 0, var_74_38)
				arg_71_1.mask_.color = var_74_39
			end

			if arg_71_1.time_ >= var_74_36 + var_74_37 and arg_71_1.time_ < var_74_36 + var_74_37 + arg_74_0 then
				local var_74_40 = Color.New(1, 1, 1)
				local var_74_41 = 0

				arg_71_1.mask_.enabled = false
				var_74_40.a = var_74_41
				arg_71_1.mask_.color = var_74_40
			end

			local var_74_42 = 5.03333333333333

			if var_74_42 < arg_71_1.time_ and arg_71_1.time_ <= var_74_42 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_43 = 0.5

			if var_74_42 <= arg_71_1.time_ and arg_71_1.time_ < var_74_42 + var_74_43 then
				local var_74_44 = (arg_71_1.time_ - var_74_42) / var_74_43
				local var_74_45 = Color.New(1, 1, 1)

				var_74_45.a = Mathf.Lerp(0, 1, var_74_44)
				arg_71_1.mask_.color = var_74_45
			end

			if arg_71_1.time_ >= var_74_42 + var_74_43 and arg_71_1.time_ < var_74_42 + var_74_43 + arg_74_0 then
				local var_74_46 = Color.New(1, 1, 1)

				var_74_46.a = 1
				arg_71_1.mask_.color = var_74_46
			end

			local var_74_47 = 1.5

			if var_74_47 < arg_71_1.time_ and arg_71_1.time_ <= var_74_47 + arg_74_0 then
				local var_74_48 = manager.ui.mainCamera.transform.localPosition
				local var_74_49 = Vector3.New(0, 0, 10) + Vector3.New(var_74_48.x, var_74_48.y, 0)
				local var_74_50 = arg_71_1.bgs_.S0406

				var_74_50.transform.localPosition = var_74_49
				var_74_50.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_74_51 = var_74_50:GetComponent("SpriteRenderer")

				if var_74_51 and var_74_51.sprite then
					local var_74_52 = (var_74_50.transform.localPosition - var_74_48).z
					local var_74_53 = manager.ui.mainCameraCom_
					local var_74_54 = 2 * var_74_52 * Mathf.Tan(var_74_53.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_74_55 = var_74_54 * var_74_53.aspect
					local var_74_56 = var_74_51.sprite.bounds.size.x
					local var_74_57 = var_74_51.sprite.bounds.size.y
					local var_74_58 = var_74_55 / var_74_56
					local var_74_59 = var_74_54 / var_74_57
					local var_74_60 = var_74_59 < var_74_58 and var_74_58 or var_74_59

					var_74_50.transform.localScale = Vector3.New(var_74_60, var_74_60, 0)
				end

				for iter_74_0, iter_74_1 in pairs(arg_71_1.bgs_) do
					if iter_74_0 ~= "S0406" then
						iter_74_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_74_61 = manager.ui.mainCamera.transform
			local var_74_62 = 4.6

			if var_74_62 < arg_71_1.time_ and arg_71_1.time_ <= var_74_62 + arg_74_0 then
				arg_71_1.var_.shakeOldPos = var_74_61.localPosition
			end

			local var_74_63 = 0.6

			if var_74_62 <= arg_71_1.time_ and arg_71_1.time_ < var_74_62 + var_74_63 then
				local var_74_64 = (arg_71_1.time_ - var_74_62) / 0.066
				local var_74_65, var_74_66 = math.modf(var_74_64)

				var_74_61.localPosition = Vector3.New(var_74_66 * 0.13, var_74_66 * 0.13, var_74_66 * 0.13) + arg_71_1.var_.shakeOldPos
			end

			if arg_71_1.time_ >= var_74_62 + var_74_63 and arg_71_1.time_ < var_74_62 + var_74_63 + arg_74_0 then
				var_74_61.localPosition = arg_71_1.var_.shakeOldPos
			end

			local var_74_67 = "S0406a"

			if arg_71_1.bgs_[var_74_67] == nil then
				local var_74_68 = Object.Instantiate(arg_71_1.paintGo_)

				var_74_68:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_74_67)
				var_74_68.name = var_74_67
				var_74_68.transform.parent = arg_71_1.stage_.transform
				var_74_68.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.bgs_[var_74_67] = var_74_68
			end

			local var_74_69 = arg_71_1.bgs_.S0406a.transform
			local var_74_70 = 5.53333333333333

			if var_74_70 < arg_71_1.time_ and arg_71_1.time_ <= var_74_70 + arg_74_0 then
				arg_71_1.var_.moveOldPosS0406a = var_74_69.localPosition
			end

			local var_74_71 = 0.001

			if var_74_70 <= arg_71_1.time_ and arg_71_1.time_ < var_74_70 + var_74_71 then
				local var_74_72 = (arg_71_1.time_ - var_74_70) / var_74_71
				local var_74_73 = Vector3.New(0, 1, 9)

				var_74_69.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosS0406a, var_74_73, var_74_72)
			end

			if arg_71_1.time_ >= var_74_70 + var_74_71 and arg_71_1.time_ < var_74_70 + var_74_71 + arg_74_0 then
				var_74_69.localPosition = Vector3.New(0, 1, 9)
			end

			local var_74_74 = arg_71_1.bgs_.S0406.transform
			local var_74_75 = 2.86666666666667

			if var_74_75 < arg_71_1.time_ and arg_71_1.time_ <= var_74_75 + arg_74_0 then
				arg_71_1.var_.moveOldPosS0406 = var_74_74.localPosition
			end

			local var_74_76 = 1.46666666666667

			if var_74_75 <= arg_71_1.time_ and arg_71_1.time_ < var_74_75 + var_74_76 then
				local var_74_77 = (arg_71_1.time_ - var_74_75) / var_74_76
				local var_74_78 = Vector3.New(0, 1, 9)

				var_74_74.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPosS0406, var_74_78, var_74_77)
			end

			if arg_71_1.time_ >= var_74_75 + var_74_76 and arg_71_1.time_ < var_74_75 + var_74_76 + arg_74_0 then
				var_74_74.localPosition = Vector3.New(0, 1, 9)
			end

			local var_74_79 = 0

			if var_74_79 < arg_71_1.time_ and arg_71_1.time_ <= var_74_79 + arg_74_0 then
				arg_71_1.allBtn_.enabled = false
			end

			local var_74_80 = 6.03333333333333

			if arg_71_1.time_ >= var_74_79 + var_74_80 and arg_71_1.time_ < var_74_79 + var_74_80 + arg_74_0 then
				arg_71_1.allBtn_.enabled = true
			end

			if arg_71_1.frameCnt_ <= 1 then
				arg_71_1.dialog_:SetActive(false)
			end

			local var_74_81 = 6.03333333333333
			local var_74_82 = 0.0166666666666663

			if var_74_81 < arg_71_1.time_ and arg_71_1.time_ <= var_74_81 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_83 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_83:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_83:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_83:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_84 = arg_71_1:GetWordFromCfg(104092018)
				local var_74_85 = arg_71_1:FormatText(var_74_84.content)

				arg_71_1.text_.text = var_74_85

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_86 = 2
				local var_74_87 = utf8.len(var_74_85)
				local var_74_88 = var_74_86 <= 0 and var_74_82 or var_74_82 * (var_74_87 / var_74_86)

				if var_74_88 > 0 and var_74_82 < var_74_88 then
					arg_71_1.talkMaxDuration = var_74_88
					var_74_81 = var_74_81 + 0.3

					if var_74_88 + var_74_81 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_88 + var_74_81
					end
				end

				arg_71_1.text_.text = var_74_85
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_89 = var_74_81 + 0.3
			local var_74_90 = math.max(var_74_82, arg_71_1.talkMaxDuration)

			if var_74_89 <= arg_71_1.time_ and arg_71_1.time_ < var_74_89 + var_74_90 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_89) / var_74_90

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_89 + var_74_90 and arg_71_1.time_ < var_74_89 + var_74_90 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B04c",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0406"
	},
	voices = {
		"story_v_out_104092.awb"
	}
}
