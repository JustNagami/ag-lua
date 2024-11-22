return {
	Play101111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 101111001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play101111002(arg_1_1)
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

			local var_4_4 = "B02d"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = arg_1_1.bgs_.B02d
			local var_4_7 = 0

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				local var_4_8 = var_4_6:GetComponent("SpriteRenderer")

				if var_4_8 then
					var_4_8.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_9 = var_4_8.material
					local var_4_10 = var_4_9:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB02d = var_4_10.a
					arg_1_1.var_.alphaMatValueB02d = var_4_9
				end

				arg_1_1.var_.alphaOldValueB02d = 0
			end

			local var_4_11 = 1.5

			if var_4_7 <= arg_1_1.time_ and arg_1_1.time_ < var_4_7 + var_4_11 then
				local var_4_12 = (arg_1_1.time_ - var_4_7) / var_4_11
				local var_4_13 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB02d, 1, var_4_12)

				if arg_1_1.var_.alphaMatValueB02d then
					local var_4_14 = arg_1_1.var_.alphaMatValueB02d
					local var_4_15 = var_4_14:GetColor("_Color")

					var_4_15.a = var_4_13

					var_4_14:SetColor("_Color", var_4_15)
				end
			end

			if arg_1_1.time_ >= var_4_7 + var_4_11 and arg_1_1.time_ < var_4_7 + var_4_11 + arg_4_0 and arg_1_1.var_.alphaMatValueB02d then
				local var_4_16 = arg_1_1.var_.alphaMatValueB02d
				local var_4_17 = var_4_16:GetColor("_Color")

				var_4_17.a = 1

				var_4_16:SetColor("_Color", var_4_17)
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_19 = manager.ui.mainCamera.transform.localPosition
				local var_4_20 = Vector3.New(0, 0, 10) + Vector3.New(var_4_19.x, var_4_19.y, 0)
				local var_4_21 = arg_1_1.bgs_.B02d

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
					if iter_4_0 ~= "B02d" then
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
			local var_4_35 = 0.5

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

				local var_4_37 = arg_1_1:GetWordFromCfg(101111001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 20
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
	Play101111002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101111002
		arg_7_1.duration_ = 5.433

		local var_7_0 = {
			ja = 5.433,
			ko = 3.566,
			zh = 4.366,
			en = 4.7
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
				arg_7_0:Play101111003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "effect"

				arg_7_1:AudioAction(var_10_2, var_10_3, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_10_4 = "1019ui_story"

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

			local var_10_8 = arg_7_1.actors_["1019ui_story"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story == nil then
				arg_7_1.var_.characterEffect1019ui_story = var_10_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_10 = 0.1

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.characterEffect1019ui_story then
					arg_7_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story then
				arg_7_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_10_12 = arg_7_1.actors_["1019ui_story"].transform
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1.var_.moveOldPos1019ui_story = var_10_12.localPosition
			end

			local var_10_14 = 0.001

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14
				local var_10_16 = Vector3.New(-0.7, -1.08, -5.9)

				var_10_12.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1019ui_story, var_10_16, var_10_15)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_12.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_12.localEulerAngles = var_10_18
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 then
				var_10_12.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_12.position

				var_10_12.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_12.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_12.localEulerAngles = var_10_20
			end

			local var_10_21 = 0

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 then
				arg_7_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_10_22 = 0

			if var_10_22 < arg_7_1.time_ and arg_7_1.time_ <= var_10_22 + arg_10_0 then
				arg_7_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_10_23 = 0
			local var_10_24 = 0.575

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_25 = arg_7_1:FormatText(StoryNameCfg[13].name)

				arg_7_1.leftNameTxt_.text = var_10_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_26 = arg_7_1:GetWordFromCfg(101111002)
				local var_10_27 = arg_7_1:FormatText(var_10_26.content)

				arg_7_1.text_.text = var_10_27

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_28 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111002", "story_v_out_101111.awb") ~= 0 then
					local var_10_31 = manager.audio:GetVoiceLength("story_v_out_101111", "101111002", "story_v_out_101111.awb") / 1000

					if var_10_31 + var_10_23 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_31 + var_10_23
					end

					if var_10_26.prefab_name ~= "" and arg_7_1.actors_[var_10_26.prefab_name] ~= nil then
						local var_10_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_26.prefab_name].transform, "story_v_out_101111", "101111002", "story_v_out_101111.awb")

						arg_7_1:RecordAudio("101111002", var_10_32)
						arg_7_1:RecordAudio("101111002", var_10_32)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_101111", "101111002", "story_v_out_101111.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_101111", "101111002", "story_v_out_101111.awb")
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
	Play101111003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 101111003
		arg_11_1.duration_ = 7.3

		local var_11_0 = {
			ja = 5.133,
			ko = 4.633,
			zh = 5.966,
			en = 7.3
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
				arg_11_0:Play101111004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1011ui_story"

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

			local var_14_4 = arg_11_1.actors_["1011ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story == nil then
				arg_11_1.var_.characterEffect1011ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect1011ui_story then
					arg_11_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect1011ui_story then
				arg_11_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_14_8 = arg_11_1.actors_["1019ui_story"]
			local var_14_9 = 0

			if var_14_9 < arg_11_1.time_ and arg_11_1.time_ <= var_14_9 + arg_14_0 and arg_11_1.var_.characterEffect1019ui_story == nil then
				arg_11_1.var_.characterEffect1019ui_story = var_14_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_10 = 0.1

			if var_14_9 <= arg_11_1.time_ and arg_11_1.time_ < var_14_9 + var_14_10 then
				local var_14_11 = (arg_11_1.time_ - var_14_9) / var_14_10

				if arg_11_1.var_.characterEffect1019ui_story then
					local var_14_12 = Mathf.Lerp(0, 0.5, var_14_11)

					arg_11_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1019ui_story.fillRatio = var_14_12
				end
			end

			if arg_11_1.time_ >= var_14_9 + var_14_10 and arg_11_1.time_ < var_14_9 + var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect1019ui_story then
				local var_14_13 = 0.5

				arg_11_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1019ui_story.fillRatio = var_14_13
			end

			local var_14_14 = arg_11_1.actors_["1011ui_story"].transform
			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1.var_.moveOldPos1011ui_story = var_14_14.localPosition
			end

			local var_14_16 = 0.001

			if var_14_15 <= arg_11_1.time_ and arg_11_1.time_ < var_14_15 + var_14_16 then
				local var_14_17 = (arg_11_1.time_ - var_14_15) / var_14_16
				local var_14_18 = Vector3.New(0.7, -0.71, -6)

				var_14_14.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1011ui_story, var_14_18, var_14_17)

				local var_14_19 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_19.x, var_14_19.y, var_14_19.z)

				local var_14_20 = var_14_14.localEulerAngles

				var_14_20.z = 0
				var_14_20.x = 0
				var_14_14.localEulerAngles = var_14_20
			end

			if arg_11_1.time_ >= var_14_15 + var_14_16 and arg_11_1.time_ < var_14_15 + var_14_16 + arg_14_0 then
				var_14_14.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_14_21 = manager.ui.mainCamera.transform.position - var_14_14.position

				var_14_14.forward = Vector3.New(var_14_21.x, var_14_21.y, var_14_21.z)

				local var_14_22 = var_14_14.localEulerAngles

				var_14_22.z = 0
				var_14_22.x = 0
				var_14_14.localEulerAngles = var_14_22
			end

			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_14_25 = 0
			local var_14_26 = 0.625

			if var_14_25 < arg_11_1.time_ and arg_11_1.time_ <= var_14_25 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_27 = arg_11_1:FormatText(StoryNameCfg[37].name)

				arg_11_1.leftNameTxt_.text = var_14_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_28 = arg_11_1:GetWordFromCfg(101111003)
				local var_14_29 = arg_11_1:FormatText(var_14_28.content)

				arg_11_1.text_.text = var_14_29

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_30 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111003", "story_v_out_101111.awb") ~= 0 then
					local var_14_33 = manager.audio:GetVoiceLength("story_v_out_101111", "101111003", "story_v_out_101111.awb") / 1000

					if var_14_33 + var_14_25 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_33 + var_14_25
					end

					if var_14_28.prefab_name ~= "" and arg_11_1.actors_[var_14_28.prefab_name] ~= nil then
						local var_14_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_28.prefab_name].transform, "story_v_out_101111", "101111003", "story_v_out_101111.awb")

						arg_11_1:RecordAudio("101111003", var_14_34)
						arg_11_1:RecordAudio("101111003", var_14_34)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_101111", "101111003", "story_v_out_101111.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_101111", "101111003", "story_v_out_101111.awb")
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
	Play101111004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 101111004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play101111005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1011ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story == nil then
				arg_15_1.var_.characterEffect1011ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1011ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1011ui_story.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["1011ui_story"].transform
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 then
				arg_15_1.var_.moveOldPos1011ui_story = var_18_6.localPosition
			end

			local var_18_8 = 0.001

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8
				local var_18_10 = Vector3.New(0, 100, 0)

				var_18_6.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1011ui_story, var_18_10, var_18_9)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_6.position

				var_18_6.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_6.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_6.localEulerAngles = var_18_12
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 then
				var_18_6.localPosition = Vector3.New(0, 100, 0)

				local var_18_13 = manager.ui.mainCamera.transform.position - var_18_6.position

				var_18_6.forward = Vector3.New(var_18_13.x, var_18_13.y, var_18_13.z)

				local var_18_14 = var_18_6.localEulerAngles

				var_18_14.z = 0
				var_18_14.x = 0
				var_18_6.localEulerAngles = var_18_14
			end

			local var_18_15 = arg_15_1.actors_["1019ui_story"].transform
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.var_.moveOldPos1019ui_story = var_18_15.localPosition
			end

			local var_18_17 = 0.001

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17
				local var_18_19 = Vector3.New(0, 100, 0)

				var_18_15.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1019ui_story, var_18_19, var_18_18)

				local var_18_20 = manager.ui.mainCamera.transform.position - var_18_15.position

				var_18_15.forward = Vector3.New(var_18_20.x, var_18_20.y, var_18_20.z)

				local var_18_21 = var_18_15.localEulerAngles

				var_18_21.z = 0
				var_18_21.x = 0
				var_18_15.localEulerAngles = var_18_21
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 then
				var_18_15.localPosition = Vector3.New(0, 100, 0)

				local var_18_22 = manager.ui.mainCamera.transform.position - var_18_15.position

				var_18_15.forward = Vector3.New(var_18_22.x, var_18_22.y, var_18_22.z)

				local var_18_23 = var_18_15.localEulerAngles

				var_18_23.z = 0
				var_18_23.x = 0
				var_18_15.localEulerAngles = var_18_23
			end

			local var_18_24 = 0
			local var_18_25 = 1.25

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_26 = arg_15_1:GetWordFromCfg(101111004)
				local var_18_27 = arg_15_1:FormatText(var_18_26.content)

				arg_15_1.text_.text = var_18_27

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_28 = 50
				local var_18_29 = utf8.len(var_18_27)
				local var_18_30 = var_18_28 <= 0 and var_18_25 or var_18_25 * (var_18_29 / var_18_28)

				if var_18_30 > 0 and var_18_25 < var_18_30 then
					arg_15_1.talkMaxDuration = var_18_30

					if var_18_30 + var_18_24 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_30 + var_18_24
					end
				end

				arg_15_1.text_.text = var_18_27
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_31 = math.max(var_18_25, arg_15_1.talkMaxDuration)

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_31 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_24) / var_18_31

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_24 + var_18_31 and arg_15_1.time_ < var_18_24 + var_18_31 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play101111005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 101111005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play101111006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.25

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(101111005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 10
				local var_22_6 = utf8.len(var_22_4)
				local var_22_7 = var_22_5 <= 0 and var_22_1 or var_22_1 * (var_22_6 / var_22_5)

				if var_22_7 > 0 and var_22_1 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_4
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_8 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_8 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_8

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_8 and arg_19_1.time_ < var_22_0 + var_22_8 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play101111006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 101111006
		arg_23_1.duration_ = 6

		local var_23_0 = {
			ja = 4.7,
			ko = 6,
			zh = 4.7,
			en = 4.966
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
				arg_23_0:Play101111007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1019ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story == nil then
				arg_23_1.var_.characterEffect1019ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1019ui_story then
					arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_26_5 = arg_23_1.actors_["1019ui_story"].transform
			local var_26_6 = 0

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.var_.moveOldPos1019ui_story = var_26_5.localPosition
			end

			local var_26_7 = 0.001

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_7 then
				local var_26_8 = (arg_23_1.time_ - var_26_6) / var_26_7
				local var_26_9 = Vector3.New(0, -1.08, -5.9)

				var_26_5.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1019ui_story, var_26_9, var_26_8)

				local var_26_10 = manager.ui.mainCamera.transform.position - var_26_5.position

				var_26_5.forward = Vector3.New(var_26_10.x, var_26_10.y, var_26_10.z)

				local var_26_11 = var_26_5.localEulerAngles

				var_26_11.z = 0
				var_26_11.x = 0
				var_26_5.localEulerAngles = var_26_11
			end

			if arg_23_1.time_ >= var_26_6 + var_26_7 and arg_23_1.time_ < var_26_6 + var_26_7 + arg_26_0 then
				var_26_5.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_26_12 = manager.ui.mainCamera.transform.position - var_26_5.position

				var_26_5.forward = Vector3.New(var_26_12.x, var_26_12.y, var_26_12.z)

				local var_26_13 = var_26_5.localEulerAngles

				var_26_13.z = 0
				var_26_13.x = 0
				var_26_5.localEulerAngles = var_26_13
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_15 = 0
			local var_26_16 = 0.525

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_17 = arg_23_1:FormatText(StoryNameCfg[13].name)

				arg_23_1.leftNameTxt_.text = var_26_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_18 = arg_23_1:GetWordFromCfg(101111006)
				local var_26_19 = arg_23_1:FormatText(var_26_18.content)

				arg_23_1.text_.text = var_26_19

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_20 = 21
				local var_26_21 = utf8.len(var_26_19)
				local var_26_22 = var_26_20 <= 0 and var_26_16 or var_26_16 * (var_26_21 / var_26_20)

				if var_26_22 > 0 and var_26_16 < var_26_22 then
					arg_23_1.talkMaxDuration = var_26_22

					if var_26_22 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_22 + var_26_15
					end
				end

				arg_23_1.text_.text = var_26_19
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111006", "story_v_out_101111.awb") ~= 0 then
					local var_26_23 = manager.audio:GetVoiceLength("story_v_out_101111", "101111006", "story_v_out_101111.awb") / 1000

					if var_26_23 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_15
					end

					if var_26_18.prefab_name ~= "" and arg_23_1.actors_[var_26_18.prefab_name] ~= nil then
						local var_26_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_18.prefab_name].transform, "story_v_out_101111", "101111006", "story_v_out_101111.awb")

						arg_23_1:RecordAudio("101111006", var_26_24)
						arg_23_1:RecordAudio("101111006", var_26_24)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_101111", "101111006", "story_v_out_101111.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_101111", "101111006", "story_v_out_101111.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_25 = math.max(var_26_16, arg_23_1.talkMaxDuration)

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_25 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_15) / var_26_25

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_15 + var_26_25 and arg_23_1.time_ < var_26_15 + var_26_25 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play101111007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 101111007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play101111008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1019ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1019ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.725

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(101111007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 29
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play101111008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 101111008
		arg_31_1.duration_ = 4.733

		local var_31_0 = {
			ja = 2.233,
			ko = 2.8,
			zh = 3.433,
			en = 4.733
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
				arg_31_0:Play101111009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1019ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story == nil then
				arg_31_1.var_.characterEffect1019ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1019ui_story then
					arg_31_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story then
				arg_31_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_34_4 = 0

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_2")
			end

			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_34_6 = 0
			local var_34_7 = 0.4

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[13].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(101111008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 16
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_7 or var_34_7 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_7 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111008", "story_v_out_101111.awb") ~= 0 then
					local var_34_14 = manager.audio:GetVoiceLength("story_v_out_101111", "101111008", "story_v_out_101111.awb") / 1000

					if var_34_14 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_14 + var_34_6
					end

					if var_34_9.prefab_name ~= "" and arg_31_1.actors_[var_34_9.prefab_name] ~= nil then
						local var_34_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_9.prefab_name].transform, "story_v_out_101111", "101111008", "story_v_out_101111.awb")

						arg_31_1:RecordAudio("101111008", var_34_15)
						arg_31_1:RecordAudio("101111008", var_34_15)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_101111", "101111008", "story_v_out_101111.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_101111", "101111008", "story_v_out_101111.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_16 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_16 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_16

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_16 and arg_31_1.time_ < var_34_6 + var_34_16 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play101111009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 101111009
		arg_35_1.duration_ = 9.2

		local var_35_0 = {
			ja = 9.2,
			ko = 4.966,
			zh = 5.366,
			en = 7.466
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
				arg_35_0:Play101111010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "2020_tpose"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("Char/" .. var_38_0), arg_35_1.stage_.transform)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_0] = var_38_1

				local var_38_2 = var_38_1:GetComponentInChildren(typeof(CharacterEffect))

				var_38_2.enabled = true

				local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_1, typeof(DynamicBoneHelper))

				if var_38_3 then
					var_38_3:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_2.transform, false)

				arg_35_1.var_[var_38_0 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_0 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_0 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_4 = arg_35_1.actors_["2020_tpose"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose == nil then
				arg_35_1.var_.characterEffect2020_tpose = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect2020_tpose then
					arg_35_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect2020_tpose then
				arg_35_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_38_8 = arg_35_1.actors_["1019ui_story"].transform
			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 then
				arg_35_1.var_.moveOldPos1019ui_story = var_38_8.localPosition
			end

			local var_38_10 = 0.001

			if var_38_9 <= arg_35_1.time_ and arg_35_1.time_ < var_38_9 + var_38_10 then
				local var_38_11 = (arg_35_1.time_ - var_38_9) / var_38_10
				local var_38_12 = Vector3.New(0, 100, 0)

				var_38_8.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1019ui_story, var_38_12, var_38_11)

				local var_38_13 = manager.ui.mainCamera.transform.position - var_38_8.position

				var_38_8.forward = Vector3.New(var_38_13.x, var_38_13.y, var_38_13.z)

				local var_38_14 = var_38_8.localEulerAngles

				var_38_14.z = 0
				var_38_14.x = 0
				var_38_8.localEulerAngles = var_38_14
			end

			if arg_35_1.time_ >= var_38_9 + var_38_10 and arg_35_1.time_ < var_38_9 + var_38_10 + arg_38_0 then
				var_38_8.localPosition = Vector3.New(0, 100, 0)

				local var_38_15 = manager.ui.mainCamera.transform.position - var_38_8.position

				var_38_8.forward = Vector3.New(var_38_15.x, var_38_15.y, var_38_15.z)

				local var_38_16 = var_38_8.localEulerAngles

				var_38_16.z = 0
				var_38_16.x = 0
				var_38_8.localEulerAngles = var_38_16
			end

			local var_38_17 = arg_35_1.actors_["2020_tpose"].transform
			local var_38_18 = 0

			if var_38_18 < arg_35_1.time_ and arg_35_1.time_ <= var_38_18 + arg_38_0 then
				arg_35_1.var_.moveOldPos2020_tpose = var_38_17.localPosition
			end

			local var_38_19 = 0.001

			if var_38_18 <= arg_35_1.time_ and arg_35_1.time_ < var_38_18 + var_38_19 then
				local var_38_20 = (arg_35_1.time_ - var_38_18) / var_38_19
				local var_38_21 = Vector3.New(-0.7, -1.2, -4.1)

				var_38_17.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos2020_tpose, var_38_21, var_38_20)

				local var_38_22 = manager.ui.mainCamera.transform.position - var_38_17.position

				var_38_17.forward = Vector3.New(var_38_22.x, var_38_22.y, var_38_22.z)

				local var_38_23 = var_38_17.localEulerAngles

				var_38_23.z = 0
				var_38_23.x = 0
				var_38_17.localEulerAngles = var_38_23
			end

			if arg_35_1.time_ >= var_38_18 + var_38_19 and arg_35_1.time_ < var_38_18 + var_38_19 + arg_38_0 then
				var_38_17.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_17.position

				var_38_17.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_17.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_17.localEulerAngles = var_38_25
			end

			local var_38_26 = 0

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 then
				arg_35_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_38_27 = 0
			local var_38_28 = 0.75

			if var_38_27 < arg_35_1.time_ and arg_35_1.time_ <= var_38_27 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_29 = arg_35_1:FormatText(StoryNameCfg[19].name)

				arg_35_1.leftNameTxt_.text = var_38_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_30 = arg_35_1:GetWordFromCfg(101111009)
				local var_38_31 = arg_35_1:FormatText(var_38_30.content)

				arg_35_1.text_.text = var_38_31

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_32 = 30
				local var_38_33 = utf8.len(var_38_31)
				local var_38_34 = var_38_32 <= 0 and var_38_28 or var_38_28 * (var_38_33 / var_38_32)

				if var_38_34 > 0 and var_38_28 < var_38_34 then
					arg_35_1.talkMaxDuration = var_38_34

					if var_38_34 + var_38_27 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_34 + var_38_27
					end
				end

				arg_35_1.text_.text = var_38_31
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111009", "story_v_out_101111.awb") ~= 0 then
					local var_38_35 = manager.audio:GetVoiceLength("story_v_out_101111", "101111009", "story_v_out_101111.awb") / 1000

					if var_38_35 + var_38_27 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_35 + var_38_27
					end

					if var_38_30.prefab_name ~= "" and arg_35_1.actors_[var_38_30.prefab_name] ~= nil then
						local var_38_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_30.prefab_name].transform, "story_v_out_101111", "101111009", "story_v_out_101111.awb")

						arg_35_1:RecordAudio("101111009", var_38_36)
						arg_35_1:RecordAudio("101111009", var_38_36)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_101111", "101111009", "story_v_out_101111.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_101111", "101111009", "story_v_out_101111.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_37 = math.max(var_38_28, arg_35_1.talkMaxDuration)

			if var_38_27 <= arg_35_1.time_ and arg_35_1.time_ < var_38_27 + var_38_37 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_27) / var_38_37

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_27 + var_38_37 and arg_35_1.time_ < var_38_27 + var_38_37 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play101111010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 101111010
		arg_39_1.duration_ = 9.766

		local var_39_0 = {
			ja = 9.766,
			ko = 9.5,
			zh = 8.066,
			en = 6.8
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
				arg_39_0:Play101111011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[19].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(101111010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 40
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_1 or var_42_1 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_1 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111010", "story_v_out_101111.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_101111", "101111010", "story_v_out_101111.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_101111", "101111010", "story_v_out_101111.awb")

						arg_39_1:RecordAudio("101111010", var_42_9)
						arg_39_1:RecordAudio("101111010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_101111", "101111010", "story_v_out_101111.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_101111", "101111010", "story_v_out_101111.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_10 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_10 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_10

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_10 and arg_39_1.time_ < var_42_0 + var_42_10 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play101111011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 101111011
		arg_43_1.duration_ = 12.9

		local var_43_0 = {
			ja = 12.9,
			ko = 10.2,
			zh = 6.866,
			en = 9.166
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
				arg_43_0:Play101111012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = "2030_tpose"

			if arg_43_1.actors_[var_46_0] == nil then
				local var_46_1 = Object.Instantiate(Asset.Load("Char/" .. var_46_0), arg_43_1.stage_.transform)

				var_46_1.name = var_46_0
				var_46_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.actors_[var_46_0] = var_46_1

				local var_46_2 = var_46_1:GetComponentInChildren(typeof(CharacterEffect))

				var_46_2.enabled = true

				local var_46_3 = GameObjectTools.GetOrAddComponent(var_46_1, typeof(DynamicBoneHelper))

				if var_46_3 then
					var_46_3:EnableDynamicBone(false)
				end

				arg_43_1:ShowWeapon(var_46_2.transform, false)

				arg_43_1.var_[var_46_0 .. "Animator"] = var_46_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_43_1.var_[var_46_0 .. "Animator"].applyRootMotion = true
				arg_43_1.var_[var_46_0 .. "LipSync"] = var_46_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_46_4 = arg_43_1.actors_["2030_tpose"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect2030_tpose == nil then
				arg_43_1.var_.characterEffect2030_tpose = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect2030_tpose then
					arg_43_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect2030_tpose then
				arg_43_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_46_8 = arg_43_1.actors_["2020_tpose"]
			local var_46_9 = 0

			if var_46_9 < arg_43_1.time_ and arg_43_1.time_ <= var_46_9 + arg_46_0 and arg_43_1.var_.characterEffect2020_tpose == nil then
				arg_43_1.var_.characterEffect2020_tpose = var_46_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_10 = 0.1

			if var_46_9 <= arg_43_1.time_ and arg_43_1.time_ < var_46_9 + var_46_10 then
				local var_46_11 = (arg_43_1.time_ - var_46_9) / var_46_10

				if arg_43_1.var_.characterEffect2020_tpose then
					local var_46_12 = Mathf.Lerp(0, 0.5, var_46_11)

					arg_43_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_43_1.var_.characterEffect2020_tpose.fillRatio = var_46_12
				end
			end

			if arg_43_1.time_ >= var_46_9 + var_46_10 and arg_43_1.time_ < var_46_9 + var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect2020_tpose then
				local var_46_13 = 0.5

				arg_43_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_43_1.var_.characterEffect2020_tpose.fillRatio = var_46_13
			end

			local var_46_14 = arg_43_1.actors_["2030_tpose"].transform
			local var_46_15 = 0

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.var_.moveOldPos2030_tpose = var_46_14.localPosition
			end

			local var_46_16 = 0.001

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_16 then
				local var_46_17 = (arg_43_1.time_ - var_46_15) / var_46_16
				local var_46_18 = Vector3.New(0.7, -1.2, -4.2)

				var_46_14.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos2030_tpose, var_46_18, var_46_17)

				local var_46_19 = manager.ui.mainCamera.transform.position - var_46_14.position

				var_46_14.forward = Vector3.New(var_46_19.x, var_46_19.y, var_46_19.z)

				local var_46_20 = var_46_14.localEulerAngles

				var_46_20.z = 0
				var_46_20.x = 0
				var_46_14.localEulerAngles = var_46_20
			end

			if arg_43_1.time_ >= var_46_15 + var_46_16 and arg_43_1.time_ < var_46_15 + var_46_16 + arg_46_0 then
				var_46_14.localPosition = Vector3.New(0.7, -1.2, -4.2)

				local var_46_21 = manager.ui.mainCamera.transform.position - var_46_14.position

				var_46_14.forward = Vector3.New(var_46_21.x, var_46_21.y, var_46_21.z)

				local var_46_22 = var_46_14.localEulerAngles

				var_46_22.z = 0
				var_46_22.x = 0
				var_46_14.localEulerAngles = var_46_22
			end

			local var_46_23 = 0

			if var_46_23 < arg_43_1.time_ and arg_43_1.time_ <= var_46_23 + arg_46_0 then
				arg_43_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_46_24 = 0
			local var_46_25 = 0.925

			if var_46_24 < arg_43_1.time_ and arg_43_1.time_ <= var_46_24 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_26 = arg_43_1:FormatText(StoryNameCfg[33].name)

				arg_43_1.leftNameTxt_.text = var_46_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_27 = arg_43_1:GetWordFromCfg(101111011)
				local var_46_28 = arg_43_1:FormatText(var_46_27.content)

				arg_43_1.text_.text = var_46_28

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_29 = 36
				local var_46_30 = utf8.len(var_46_28)
				local var_46_31 = var_46_29 <= 0 and var_46_25 or var_46_25 * (var_46_30 / var_46_29)

				if var_46_31 > 0 and var_46_25 < var_46_31 then
					arg_43_1.talkMaxDuration = var_46_31

					if var_46_31 + var_46_24 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_31 + var_46_24
					end
				end

				arg_43_1.text_.text = var_46_28
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111011", "story_v_out_101111.awb") ~= 0 then
					local var_46_32 = manager.audio:GetVoiceLength("story_v_out_101111", "101111011", "story_v_out_101111.awb") / 1000

					if var_46_32 + var_46_24 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_32 + var_46_24
					end

					if var_46_27.prefab_name ~= "" and arg_43_1.actors_[var_46_27.prefab_name] ~= nil then
						local var_46_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_27.prefab_name].transform, "story_v_out_101111", "101111011", "story_v_out_101111.awb")

						arg_43_1:RecordAudio("101111011", var_46_33)
						arg_43_1:RecordAudio("101111011", var_46_33)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_101111", "101111011", "story_v_out_101111.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_101111", "101111011", "story_v_out_101111.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_34 = math.max(var_46_25, arg_43_1.talkMaxDuration)

			if var_46_24 <= arg_43_1.time_ and arg_43_1.time_ < var_46_24 + var_46_34 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_24) / var_46_34

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_24 + var_46_34 and arg_43_1.time_ < var_46_24 + var_46_34 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play101111012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 101111012
		arg_47_1.duration_ = 10.166

		local var_47_0 = {
			ja = 10.166,
			ko = 8.2,
			zh = 9.633,
			en = 10
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
				arg_47_0:Play101111013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.975

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[33].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(101111012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 39
				local var_50_6 = utf8.len(var_50_4)
				local var_50_7 = var_50_5 <= 0 and var_50_1 or var_50_1 * (var_50_6 / var_50_5)

				if var_50_7 > 0 and var_50_1 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_4
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111012", "story_v_out_101111.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_101111", "101111012", "story_v_out_101111.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_101111", "101111012", "story_v_out_101111.awb")

						arg_47_1:RecordAudio("101111012", var_50_9)
						arg_47_1:RecordAudio("101111012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_101111", "101111012", "story_v_out_101111.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_101111", "101111012", "story_v_out_101111.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_10 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_10 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_10

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_10 and arg_47_1.time_ < var_50_0 + var_50_10 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play101111013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 101111013
		arg_51_1.duration_ = 6.833

		local var_51_0 = {
			ja = 6.833,
			ko = 6.366,
			zh = 5.866,
			en = 6.666
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
				arg_51_0:Play101111014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["2020_tpose"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect2020_tpose == nil then
				arg_51_1.var_.characterEffect2020_tpose = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect2020_tpose then
					arg_51_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect2020_tpose then
				arg_51_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["2030_tpose"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect2030_tpose == nil then
				arg_51_1.var_.characterEffect2030_tpose = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect2030_tpose then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_51_1.var_.characterEffect2030_tpose.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect2030_tpose then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_51_1.var_.characterEffect2030_tpose.fillRatio = var_54_9
			end

			local var_54_10 = 0
			local var_54_11 = 0.85

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[19].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(101111013)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 34
				local var_54_16 = utf8.len(var_54_14)
				local var_54_17 = var_54_15 <= 0 and var_54_11 or var_54_11 * (var_54_16 / var_54_15)

				if var_54_17 > 0 and var_54_11 < var_54_17 then
					arg_51_1.talkMaxDuration = var_54_17

					if var_54_17 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_10
					end
				end

				arg_51_1.text_.text = var_54_14
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111013", "story_v_out_101111.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_101111", "101111013", "story_v_out_101111.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_101111", "101111013", "story_v_out_101111.awb")

						arg_51_1:RecordAudio("101111013", var_54_19)
						arg_51_1:RecordAudio("101111013", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_101111", "101111013", "story_v_out_101111.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_101111", "101111013", "story_v_out_101111.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_11, arg_51_1.talkMaxDuration)

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_10) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_10 + var_54_20 and arg_51_1.time_ < var_54_10 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play101111014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 101111014
		arg_55_1.duration_ = 8.8

		local var_55_0 = {
			ja = 8.8,
			ko = 6.366,
			zh = 6.133,
			en = 4.9
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
				arg_55_0:Play101111015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["2030_tpose"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect2030_tpose == nil then
				arg_55_1.var_.characterEffect2030_tpose = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect2030_tpose then
					arg_55_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect2030_tpose then
				arg_55_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["2020_tpose"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect2020_tpose == nil then
				arg_55_1.var_.characterEffect2020_tpose = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect2020_tpose then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_55_1.var_.characterEffect2020_tpose.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect2020_tpose then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_55_1.var_.characterEffect2020_tpose.fillRatio = var_58_9
			end

			local var_58_10 = 0
			local var_58_11 = 0.65

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_12 = arg_55_1:FormatText(StoryNameCfg[33].name)

				arg_55_1.leftNameTxt_.text = var_58_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_13 = arg_55_1:GetWordFromCfg(101111014)
				local var_58_14 = arg_55_1:FormatText(var_58_13.content)

				arg_55_1.text_.text = var_58_14

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_15 = 26
				local var_58_16 = utf8.len(var_58_14)
				local var_58_17 = var_58_15 <= 0 and var_58_11 or var_58_11 * (var_58_16 / var_58_15)

				if var_58_17 > 0 and var_58_11 < var_58_17 then
					arg_55_1.talkMaxDuration = var_58_17

					if var_58_17 + var_58_10 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_17 + var_58_10
					end
				end

				arg_55_1.text_.text = var_58_14
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111014", "story_v_out_101111.awb") ~= 0 then
					local var_58_18 = manager.audio:GetVoiceLength("story_v_out_101111", "101111014", "story_v_out_101111.awb") / 1000

					if var_58_18 + var_58_10 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_18 + var_58_10
					end

					if var_58_13.prefab_name ~= "" and arg_55_1.actors_[var_58_13.prefab_name] ~= nil then
						local var_58_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_13.prefab_name].transform, "story_v_out_101111", "101111014", "story_v_out_101111.awb")

						arg_55_1:RecordAudio("101111014", var_58_19)
						arg_55_1:RecordAudio("101111014", var_58_19)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_101111", "101111014", "story_v_out_101111.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_101111", "101111014", "story_v_out_101111.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_20 = math.max(var_58_11, arg_55_1.talkMaxDuration)

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_20 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_10) / var_58_20

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_10 + var_58_20 and arg_55_1.time_ < var_58_10 + var_58_20 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play101111015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 101111015
		arg_59_1.duration_ = 3.933

		local var_59_0 = {
			ja = 3.933,
			ko = 3.133,
			zh = 2.366,
			en = 1.999999999999
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
				arg_59_0:Play101111016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "1084ui_story"

			if arg_59_1.actors_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(Asset.Load("Char/" .. var_62_0), arg_59_1.stage_.transform)

				var_62_1.name = var_62_0
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.actors_[var_62_0] = var_62_1

				local var_62_2 = var_62_1:GetComponentInChildren(typeof(CharacterEffect))

				var_62_2.enabled = true

				local var_62_3 = GameObjectTools.GetOrAddComponent(var_62_1, typeof(DynamicBoneHelper))

				if var_62_3 then
					var_62_3:EnableDynamicBone(false)
				end

				arg_59_1:ShowWeapon(var_62_2.transform, false)

				arg_59_1.var_[var_62_0 .. "Animator"] = var_62_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_59_1.var_[var_62_0 .. "Animator"].applyRootMotion = true
				arg_59_1.var_[var_62_0 .. "LipSync"] = var_62_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_62_4 = arg_59_1.actors_["1084ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story == nil then
				arg_59_1.var_.characterEffect1084ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1084ui_story then
					arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story then
				arg_59_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_62_8 = arg_59_1.actors_["2030_tpose"].transform
			local var_62_9 = 0

			if var_62_9 < arg_59_1.time_ and arg_59_1.time_ <= var_62_9 + arg_62_0 then
				arg_59_1.var_.moveOldPos2030_tpose = var_62_8.localPosition
			end

			local var_62_10 = 0.001

			if var_62_9 <= arg_59_1.time_ and arg_59_1.time_ < var_62_9 + var_62_10 then
				local var_62_11 = (arg_59_1.time_ - var_62_9) / var_62_10
				local var_62_12 = Vector3.New(0, 100, 0)

				var_62_8.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos2030_tpose, var_62_12, var_62_11)

				local var_62_13 = manager.ui.mainCamera.transform.position - var_62_8.position

				var_62_8.forward = Vector3.New(var_62_13.x, var_62_13.y, var_62_13.z)

				local var_62_14 = var_62_8.localEulerAngles

				var_62_14.z = 0
				var_62_14.x = 0
				var_62_8.localEulerAngles = var_62_14
			end

			if arg_59_1.time_ >= var_62_9 + var_62_10 and arg_59_1.time_ < var_62_9 + var_62_10 + arg_62_0 then
				var_62_8.localPosition = Vector3.New(0, 100, 0)

				local var_62_15 = manager.ui.mainCamera.transform.position - var_62_8.position

				var_62_8.forward = Vector3.New(var_62_15.x, var_62_15.y, var_62_15.z)

				local var_62_16 = var_62_8.localEulerAngles

				var_62_16.z = 0
				var_62_16.x = 0
				var_62_8.localEulerAngles = var_62_16
			end

			local var_62_17 = arg_59_1.actors_["2020_tpose"].transform
			local var_62_18 = 0

			if var_62_18 < arg_59_1.time_ and arg_59_1.time_ <= var_62_18 + arg_62_0 then
				arg_59_1.var_.moveOldPos2020_tpose = var_62_17.localPosition
			end

			local var_62_19 = 0.001

			if var_62_18 <= arg_59_1.time_ and arg_59_1.time_ < var_62_18 + var_62_19 then
				local var_62_20 = (arg_59_1.time_ - var_62_18) / var_62_19
				local var_62_21 = Vector3.New(0, 100, 0)

				var_62_17.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos2020_tpose, var_62_21, var_62_20)

				local var_62_22 = manager.ui.mainCamera.transform.position - var_62_17.position

				var_62_17.forward = Vector3.New(var_62_22.x, var_62_22.y, var_62_22.z)

				local var_62_23 = var_62_17.localEulerAngles

				var_62_23.z = 0
				var_62_23.x = 0
				var_62_17.localEulerAngles = var_62_23
			end

			if arg_59_1.time_ >= var_62_18 + var_62_19 and arg_59_1.time_ < var_62_18 + var_62_19 + arg_62_0 then
				var_62_17.localPosition = Vector3.New(0, 100, 0)

				local var_62_24 = manager.ui.mainCamera.transform.position - var_62_17.position

				var_62_17.forward = Vector3.New(var_62_24.x, var_62_24.y, var_62_24.z)

				local var_62_25 = var_62_17.localEulerAngles

				var_62_25.z = 0
				var_62_25.x = 0
				var_62_17.localEulerAngles = var_62_25
			end

			local var_62_26 = arg_59_1.actors_["1084ui_story"].transform
			local var_62_27 = 0

			if var_62_27 < arg_59_1.time_ and arg_59_1.time_ <= var_62_27 + arg_62_0 then
				arg_59_1.var_.moveOldPos1084ui_story = var_62_26.localPosition
			end

			local var_62_28 = 0.001

			if var_62_27 <= arg_59_1.time_ and arg_59_1.time_ < var_62_27 + var_62_28 then
				local var_62_29 = (arg_59_1.time_ - var_62_27) / var_62_28
				local var_62_30 = Vector3.New(-0.7, -0.97, -6)

				var_62_26.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1084ui_story, var_62_30, var_62_29)

				local var_62_31 = manager.ui.mainCamera.transform.position - var_62_26.position

				var_62_26.forward = Vector3.New(var_62_31.x, var_62_31.y, var_62_31.z)

				local var_62_32 = var_62_26.localEulerAngles

				var_62_32.z = 0
				var_62_32.x = 0
				var_62_26.localEulerAngles = var_62_32
			end

			if arg_59_1.time_ >= var_62_27 + var_62_28 and arg_59_1.time_ < var_62_27 + var_62_28 + arg_62_0 then
				var_62_26.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_62_33 = manager.ui.mainCamera.transform.position - var_62_26.position

				var_62_26.forward = Vector3.New(var_62_33.x, var_62_33.y, var_62_33.z)

				local var_62_34 = var_62_26.localEulerAngles

				var_62_34.z = 0
				var_62_34.x = 0
				var_62_26.localEulerAngles = var_62_34
			end

			local var_62_35 = 0

			if var_62_35 < arg_59_1.time_ and arg_59_1.time_ <= var_62_35 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_62_36 = 0

			if var_62_36 < arg_59_1.time_ and arg_59_1.time_ <= var_62_36 + arg_62_0 then
				arg_59_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_37 = 0
			local var_62_38 = 0.275

			if var_62_37 < arg_59_1.time_ and arg_59_1.time_ <= var_62_37 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_39 = arg_59_1:FormatText(StoryNameCfg[6].name)

				arg_59_1.leftNameTxt_.text = var_62_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_40 = arg_59_1:GetWordFromCfg(101111015)
				local var_62_41 = arg_59_1:FormatText(var_62_40.content)

				arg_59_1.text_.text = var_62_41

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_42 = 11
				local var_62_43 = utf8.len(var_62_41)
				local var_62_44 = var_62_42 <= 0 and var_62_38 or var_62_38 * (var_62_43 / var_62_42)

				if var_62_44 > 0 and var_62_38 < var_62_44 then
					arg_59_1.talkMaxDuration = var_62_44

					if var_62_44 + var_62_37 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_44 + var_62_37
					end
				end

				arg_59_1.text_.text = var_62_41
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111015", "story_v_out_101111.awb") ~= 0 then
					local var_62_45 = manager.audio:GetVoiceLength("story_v_out_101111", "101111015", "story_v_out_101111.awb") / 1000

					if var_62_45 + var_62_37 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_45 + var_62_37
					end

					if var_62_40.prefab_name ~= "" and arg_59_1.actors_[var_62_40.prefab_name] ~= nil then
						local var_62_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_40.prefab_name].transform, "story_v_out_101111", "101111015", "story_v_out_101111.awb")

						arg_59_1:RecordAudio("101111015", var_62_46)
						arg_59_1:RecordAudio("101111015", var_62_46)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_101111", "101111015", "story_v_out_101111.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_101111", "101111015", "story_v_out_101111.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_47 = math.max(var_62_38, arg_59_1.talkMaxDuration)

			if var_62_37 <= arg_59_1.time_ and arg_59_1.time_ < var_62_37 + var_62_47 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_37) / var_62_47

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_37 + var_62_47 and arg_59_1.time_ < var_62_37 + var_62_47 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play101111016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 101111016
		arg_63_1.duration_ = 2.8

		local var_63_0 = {
			ja = 2.8,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_63_0:Play101111017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1019ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1019ui_story == nil then
				arg_63_1.var_.characterEffect1019ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1019ui_story then
					arg_63_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1019ui_story then
				arg_63_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1084ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1084ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1084ui_story.fillRatio = var_66_9
			end

			local var_66_10 = arg_63_1.actors_["1019ui_story"].transform
			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.var_.moveOldPos1019ui_story = var_66_10.localPosition
			end

			local var_66_12 = 0.001

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_12 then
				local var_66_13 = (arg_63_1.time_ - var_66_11) / var_66_12
				local var_66_14 = Vector3.New(0.7, -1.08, -5.9)

				var_66_10.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1019ui_story, var_66_14, var_66_13)

				local var_66_15 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_15.x, var_66_15.y, var_66_15.z)

				local var_66_16 = var_66_10.localEulerAngles

				var_66_16.z = 0
				var_66_16.x = 0
				var_66_10.localEulerAngles = var_66_16
			end

			if arg_63_1.time_ >= var_66_11 + var_66_12 and arg_63_1.time_ < var_66_11 + var_66_12 + arg_66_0 then
				var_66_10.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_66_17 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_17.x, var_66_17.y, var_66_17.z)

				local var_66_18 = var_66_10.localEulerAngles

				var_66_18.z = 0
				var_66_18.x = 0
				var_66_10.localEulerAngles = var_66_18
			end

			local var_66_19 = 0

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action4_1")
			end

			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_66_21 = 0
			local var_66_22 = 0.15

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_23 = arg_63_1:FormatText(StoryNameCfg[13].name)

				arg_63_1.leftNameTxt_.text = var_66_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_24 = arg_63_1:GetWordFromCfg(101111016)
				local var_66_25 = arg_63_1:FormatText(var_66_24.content)

				arg_63_1.text_.text = var_66_25

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_26 = 5
				local var_66_27 = utf8.len(var_66_25)
				local var_66_28 = var_66_26 <= 0 and var_66_22 or var_66_22 * (var_66_27 / var_66_26)

				if var_66_28 > 0 and var_66_22 < var_66_28 then
					arg_63_1.talkMaxDuration = var_66_28

					if var_66_28 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_28 + var_66_21
					end
				end

				arg_63_1.text_.text = var_66_25
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111016", "story_v_out_101111.awb") ~= 0 then
					local var_66_29 = manager.audio:GetVoiceLength("story_v_out_101111", "101111016", "story_v_out_101111.awb") / 1000

					if var_66_29 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_29 + var_66_21
					end

					if var_66_24.prefab_name ~= "" and arg_63_1.actors_[var_66_24.prefab_name] ~= nil then
						local var_66_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_24.prefab_name].transform, "story_v_out_101111", "101111016", "story_v_out_101111.awb")

						arg_63_1:RecordAudio("101111016", var_66_30)
						arg_63_1:RecordAudio("101111016", var_66_30)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_101111", "101111016", "story_v_out_101111.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_101111", "101111016", "story_v_out_101111.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_31 = math.max(var_66_22, arg_63_1.talkMaxDuration)

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_31 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_21) / var_66_31

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_21 + var_66_31 and arg_63_1.time_ < var_66_21 + var_66_31 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play101111017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 101111017
		arg_67_1.duration_ = 8.4

		local var_67_0 = {
			ja = 8.4,
			ko = 4.4,
			zh = 3.9,
			en = 5.3
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
				arg_67_0:Play101111018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["2020_tpose"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect2020_tpose == nil then
				arg_67_1.var_.characterEffect2020_tpose = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect2020_tpose then
					arg_67_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect2020_tpose then
				arg_67_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1019ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect1019ui_story == nil then
				arg_67_1.var_.characterEffect1019ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1019ui_story then
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1019ui_story.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1019ui_story then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1019ui_story.fillRatio = var_70_9
			end

			local var_70_10 = arg_67_1.actors_["1084ui_story"].transform
			local var_70_11 = 0

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1.var_.moveOldPos1084ui_story = var_70_10.localPosition
			end

			local var_70_12 = 0.001

			if var_70_11 <= arg_67_1.time_ and arg_67_1.time_ < var_70_11 + var_70_12 then
				local var_70_13 = (arg_67_1.time_ - var_70_11) / var_70_12
				local var_70_14 = Vector3.New(0, 100, 0)

				var_70_10.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1084ui_story, var_70_14, var_70_13)

				local var_70_15 = manager.ui.mainCamera.transform.position - var_70_10.position

				var_70_10.forward = Vector3.New(var_70_15.x, var_70_15.y, var_70_15.z)

				local var_70_16 = var_70_10.localEulerAngles

				var_70_16.z = 0
				var_70_16.x = 0
				var_70_10.localEulerAngles = var_70_16
			end

			if arg_67_1.time_ >= var_70_11 + var_70_12 and arg_67_1.time_ < var_70_11 + var_70_12 + arg_70_0 then
				var_70_10.localPosition = Vector3.New(0, 100, 0)

				local var_70_17 = manager.ui.mainCamera.transform.position - var_70_10.position

				var_70_10.forward = Vector3.New(var_70_17.x, var_70_17.y, var_70_17.z)

				local var_70_18 = var_70_10.localEulerAngles

				var_70_18.z = 0
				var_70_18.x = 0
				var_70_10.localEulerAngles = var_70_18
			end

			local var_70_19 = arg_67_1.actors_["1019ui_story"].transform
			local var_70_20 = 0

			if var_70_20 < arg_67_1.time_ and arg_67_1.time_ <= var_70_20 + arg_70_0 then
				arg_67_1.var_.moveOldPos1019ui_story = var_70_19.localPosition
			end

			local var_70_21 = 0.001

			if var_70_20 <= arg_67_1.time_ and arg_67_1.time_ < var_70_20 + var_70_21 then
				local var_70_22 = (arg_67_1.time_ - var_70_20) / var_70_21
				local var_70_23 = Vector3.New(0, 100, 0)

				var_70_19.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1019ui_story, var_70_23, var_70_22)

				local var_70_24 = manager.ui.mainCamera.transform.position - var_70_19.position

				var_70_19.forward = Vector3.New(var_70_24.x, var_70_24.y, var_70_24.z)

				local var_70_25 = var_70_19.localEulerAngles

				var_70_25.z = 0
				var_70_25.x = 0
				var_70_19.localEulerAngles = var_70_25
			end

			if arg_67_1.time_ >= var_70_20 + var_70_21 and arg_67_1.time_ < var_70_20 + var_70_21 + arg_70_0 then
				var_70_19.localPosition = Vector3.New(0, 100, 0)

				local var_70_26 = manager.ui.mainCamera.transform.position - var_70_19.position

				var_70_19.forward = Vector3.New(var_70_26.x, var_70_26.y, var_70_26.z)

				local var_70_27 = var_70_19.localEulerAngles

				var_70_27.z = 0
				var_70_27.x = 0
				var_70_19.localEulerAngles = var_70_27
			end

			local var_70_28 = arg_67_1.actors_["2020_tpose"].transform
			local var_70_29 = 0

			if var_70_29 < arg_67_1.time_ and arg_67_1.time_ <= var_70_29 + arg_70_0 then
				arg_67_1.var_.moveOldPos2020_tpose = var_70_28.localPosition
			end

			local var_70_30 = 0.001

			if var_70_29 <= arg_67_1.time_ and arg_67_1.time_ < var_70_29 + var_70_30 then
				local var_70_31 = (arg_67_1.time_ - var_70_29) / var_70_30
				local var_70_32 = Vector3.New(-0.7, -1.2, -4.1)

				var_70_28.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos2020_tpose, var_70_32, var_70_31)

				local var_70_33 = manager.ui.mainCamera.transform.position - var_70_28.position

				var_70_28.forward = Vector3.New(var_70_33.x, var_70_33.y, var_70_33.z)

				local var_70_34 = var_70_28.localEulerAngles

				var_70_34.z = 0
				var_70_34.x = 0
				var_70_28.localEulerAngles = var_70_34
			end

			if arg_67_1.time_ >= var_70_29 + var_70_30 and arg_67_1.time_ < var_70_29 + var_70_30 + arg_70_0 then
				var_70_28.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_70_35 = manager.ui.mainCamera.transform.position - var_70_28.position

				var_70_28.forward = Vector3.New(var_70_35.x, var_70_35.y, var_70_35.z)

				local var_70_36 = var_70_28.localEulerAngles

				var_70_36.z = 0
				var_70_36.x = 0
				var_70_28.localEulerAngles = var_70_36
			end

			local var_70_37 = 0

			if var_70_37 < arg_67_1.time_ and arg_67_1.time_ <= var_70_37 + arg_70_0 then
				arg_67_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_70_38 = 0
			local var_70_39 = 0.5

			if var_70_38 < arg_67_1.time_ and arg_67_1.time_ <= var_70_38 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_40 = arg_67_1:FormatText(StoryNameCfg[19].name)

				arg_67_1.leftNameTxt_.text = var_70_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_41 = arg_67_1:GetWordFromCfg(101111017)
				local var_70_42 = arg_67_1:FormatText(var_70_41.content)

				arg_67_1.text_.text = var_70_42

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_43 = 20
				local var_70_44 = utf8.len(var_70_42)
				local var_70_45 = var_70_43 <= 0 and var_70_39 or var_70_39 * (var_70_44 / var_70_43)

				if var_70_45 > 0 and var_70_39 < var_70_45 then
					arg_67_1.talkMaxDuration = var_70_45

					if var_70_45 + var_70_38 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_45 + var_70_38
					end
				end

				arg_67_1.text_.text = var_70_42
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111017", "story_v_out_101111.awb") ~= 0 then
					local var_70_46 = manager.audio:GetVoiceLength("story_v_out_101111", "101111017", "story_v_out_101111.awb") / 1000

					if var_70_46 + var_70_38 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_46 + var_70_38
					end

					if var_70_41.prefab_name ~= "" and arg_67_1.actors_[var_70_41.prefab_name] ~= nil then
						local var_70_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_41.prefab_name].transform, "story_v_out_101111", "101111017", "story_v_out_101111.awb")

						arg_67_1:RecordAudio("101111017", var_70_47)
						arg_67_1:RecordAudio("101111017", var_70_47)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_101111", "101111017", "story_v_out_101111.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_101111", "101111017", "story_v_out_101111.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_48 = math.max(var_70_39, arg_67_1.talkMaxDuration)

			if var_70_38 <= arg_67_1.time_ and arg_67_1.time_ < var_70_38 + var_70_48 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_38) / var_70_48

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_38 + var_70_48 and arg_67_1.time_ < var_70_38 + var_70_48 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play101111018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 101111018
		arg_71_1.duration_ = 6.733

		local var_71_0 = {
			ja = 6.733,
			ko = 5.1,
			zh = 3.633,
			en = 6.066
		}
		local var_71_1 = manager.audio:GetLocalizationFlag()

		if var_71_0[var_71_1] ~= nil then
			arg_71_1.duration_ = var_71_0[var_71_1]
		end

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play101111019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["2030_tpose"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect2030_tpose == nil then
				arg_71_1.var_.characterEffect2030_tpose = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.1

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect2030_tpose then
					arg_71_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect2030_tpose then
				arg_71_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_74_4 = arg_71_1.actors_["2020_tpose"]
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 and arg_71_1.var_.characterEffect2020_tpose == nil then
				arg_71_1.var_.characterEffect2020_tpose = var_74_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_6 = 0.1

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6

				if arg_71_1.var_.characterEffect2020_tpose then
					local var_74_8 = Mathf.Lerp(0, 0.5, var_74_7)

					arg_71_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_71_1.var_.characterEffect2020_tpose.fillRatio = var_74_8
				end
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 and arg_71_1.var_.characterEffect2020_tpose then
				local var_74_9 = 0.5

				arg_71_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_71_1.var_.characterEffect2020_tpose.fillRatio = var_74_9
			end

			local var_74_10 = arg_71_1.actors_["2030_tpose"].transform
			local var_74_11 = 0

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1.var_.moveOldPos2030_tpose = var_74_10.localPosition
			end

			local var_74_12 = 0.001

			if var_74_11 <= arg_71_1.time_ and arg_71_1.time_ < var_74_11 + var_74_12 then
				local var_74_13 = (arg_71_1.time_ - var_74_11) / var_74_12
				local var_74_14 = Vector3.New(0.7, -1.2, -4.2)

				var_74_10.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos2030_tpose, var_74_14, var_74_13)

				local var_74_15 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_15.x, var_74_15.y, var_74_15.z)

				local var_74_16 = var_74_10.localEulerAngles

				var_74_16.z = 0
				var_74_16.x = 0
				var_74_10.localEulerAngles = var_74_16
			end

			if arg_71_1.time_ >= var_74_11 + var_74_12 and arg_71_1.time_ < var_74_11 + var_74_12 + arg_74_0 then
				var_74_10.localPosition = Vector3.New(0.7, -1.2, -4.2)

				local var_74_17 = manager.ui.mainCamera.transform.position - var_74_10.position

				var_74_10.forward = Vector3.New(var_74_17.x, var_74_17.y, var_74_17.z)

				local var_74_18 = var_74_10.localEulerAngles

				var_74_18.z = 0
				var_74_18.x = 0
				var_74_10.localEulerAngles = var_74_18
			end

			local var_74_19 = 0

			if var_74_19 < arg_71_1.time_ and arg_71_1.time_ <= var_74_19 + arg_74_0 then
				arg_71_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_74_20 = 0
			local var_74_21 = 0.475

			if var_74_20 < arg_71_1.time_ and arg_71_1.time_ <= var_74_20 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_22 = arg_71_1:FormatText(StoryNameCfg[33].name)

				arg_71_1.leftNameTxt_.text = var_74_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_23 = arg_71_1:GetWordFromCfg(101111018)
				local var_74_24 = arg_71_1:FormatText(var_74_23.content)

				arg_71_1.text_.text = var_74_24

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_25 = 19
				local var_74_26 = utf8.len(var_74_24)
				local var_74_27 = var_74_25 <= 0 and var_74_21 or var_74_21 * (var_74_26 / var_74_25)

				if var_74_27 > 0 and var_74_21 < var_74_27 then
					arg_71_1.talkMaxDuration = var_74_27

					if var_74_27 + var_74_20 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_27 + var_74_20
					end
				end

				arg_71_1.text_.text = var_74_24
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111018", "story_v_out_101111.awb") ~= 0 then
					local var_74_28 = manager.audio:GetVoiceLength("story_v_out_101111", "101111018", "story_v_out_101111.awb") / 1000

					if var_74_28 + var_74_20 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_28 + var_74_20
					end

					if var_74_23.prefab_name ~= "" and arg_71_1.actors_[var_74_23.prefab_name] ~= nil then
						local var_74_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_23.prefab_name].transform, "story_v_out_101111", "101111018", "story_v_out_101111.awb")

						arg_71_1:RecordAudio("101111018", var_74_29)
						arg_71_1:RecordAudio("101111018", var_74_29)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_101111", "101111018", "story_v_out_101111.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_101111", "101111018", "story_v_out_101111.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_30 = math.max(var_74_21, arg_71_1.talkMaxDuration)

			if var_74_20 <= arg_71_1.time_ and arg_71_1.time_ < var_74_20 + var_74_30 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_20) / var_74_30

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_20 + var_74_30 and arg_71_1.time_ < var_74_20 + var_74_30 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play101111019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 101111019
		arg_75_1.duration_ = 5.933

		local var_75_0 = {
			ja = 5.933,
			ko = 3.766,
			zh = 3.966,
			en = 3.4
		}
		local var_75_1 = manager.audio:GetLocalizationFlag()

		if var_75_0[var_75_1] ~= nil then
			arg_75_1.duration_ = var_75_0[var_75_1]
		end

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play101111020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["2020_tpose"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect2020_tpose == nil then
				arg_75_1.var_.characterEffect2020_tpose = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect2020_tpose then
					arg_75_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect2020_tpose then
				arg_75_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["2030_tpose"]
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 and arg_75_1.var_.characterEffect2030_tpose == nil then
				arg_75_1.var_.characterEffect2030_tpose = var_78_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_6 = 0.1

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6

				if arg_75_1.var_.characterEffect2030_tpose then
					local var_78_8 = Mathf.Lerp(0, 0.5, var_78_7)

					arg_75_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_75_1.var_.characterEffect2030_tpose.fillRatio = var_78_8
				end
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect2030_tpose then
				local var_78_9 = 0.5

				arg_75_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_75_1.var_.characterEffect2030_tpose.fillRatio = var_78_9
			end

			local var_78_10 = 0
			local var_78_11 = 0.35

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_12 = arg_75_1:FormatText(StoryNameCfg[19].name)

				arg_75_1.leftNameTxt_.text = var_78_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_13 = arg_75_1:GetWordFromCfg(101111019)
				local var_78_14 = arg_75_1:FormatText(var_78_13.content)

				arg_75_1.text_.text = var_78_14

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_15 = 14
				local var_78_16 = utf8.len(var_78_14)
				local var_78_17 = var_78_15 <= 0 and var_78_11 or var_78_11 * (var_78_16 / var_78_15)

				if var_78_17 > 0 and var_78_11 < var_78_17 then
					arg_75_1.talkMaxDuration = var_78_17

					if var_78_17 + var_78_10 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_17 + var_78_10
					end
				end

				arg_75_1.text_.text = var_78_14
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111019", "story_v_out_101111.awb") ~= 0 then
					local var_78_18 = manager.audio:GetVoiceLength("story_v_out_101111", "101111019", "story_v_out_101111.awb") / 1000

					if var_78_18 + var_78_10 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_18 + var_78_10
					end

					if var_78_13.prefab_name ~= "" and arg_75_1.actors_[var_78_13.prefab_name] ~= nil then
						local var_78_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_13.prefab_name].transform, "story_v_out_101111", "101111019", "story_v_out_101111.awb")

						arg_75_1:RecordAudio("101111019", var_78_19)
						arg_75_1:RecordAudio("101111019", var_78_19)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_101111", "101111019", "story_v_out_101111.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_101111", "101111019", "story_v_out_101111.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_20 = math.max(var_78_11, arg_75_1.talkMaxDuration)

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_20 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_10) / var_78_20

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_10 + var_78_20 and arg_75_1.time_ < var_78_10 + var_78_20 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play101111020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 101111020
		arg_79_1.duration_ = 2.566

		local var_79_0 = {
			ja = 2.2,
			ko = 2.2,
			zh = 1.999999999999,
			en = 2.566
		}
		local var_79_1 = manager.audio:GetLocalizationFlag()

		if var_79_0[var_79_1] ~= nil then
			arg_79_1.duration_ = var_79_0[var_79_1]
		end

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play101111021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["2020_tpose"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect2020_tpose == nil then
				arg_79_1.var_.characterEffect2020_tpose = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.1

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect2020_tpose then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_79_1.var_.characterEffect2020_tpose.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect2020_tpose then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_79_1.var_.characterEffect2020_tpose.fillRatio = var_82_9
			end

			local var_82_10 = arg_79_1.actors_["2030_tpose"].transform
			local var_82_11 = 0

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1.var_.moveOldPos2030_tpose = var_82_10.localPosition
			end

			local var_82_12 = 0.001

			if var_82_11 <= arg_79_1.time_ and arg_79_1.time_ < var_82_11 + var_82_12 then
				local var_82_13 = (arg_79_1.time_ - var_82_11) / var_82_12
				local var_82_14 = Vector3.New(0, 100, 0)

				var_82_10.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos2030_tpose, var_82_14, var_82_13)

				local var_82_15 = manager.ui.mainCamera.transform.position - var_82_10.position

				var_82_10.forward = Vector3.New(var_82_15.x, var_82_15.y, var_82_15.z)

				local var_82_16 = var_82_10.localEulerAngles

				var_82_16.z = 0
				var_82_16.x = 0
				var_82_10.localEulerAngles = var_82_16
			end

			if arg_79_1.time_ >= var_82_11 + var_82_12 and arg_79_1.time_ < var_82_11 + var_82_12 + arg_82_0 then
				var_82_10.localPosition = Vector3.New(0, 100, 0)

				local var_82_17 = manager.ui.mainCamera.transform.position - var_82_10.position

				var_82_10.forward = Vector3.New(var_82_17.x, var_82_17.y, var_82_17.z)

				local var_82_18 = var_82_10.localEulerAngles

				var_82_18.z = 0
				var_82_18.x = 0
				var_82_10.localEulerAngles = var_82_18
			end

			local var_82_19 = arg_79_1.actors_["2020_tpose"].transform
			local var_82_20 = 0

			if var_82_20 < arg_79_1.time_ and arg_79_1.time_ <= var_82_20 + arg_82_0 then
				arg_79_1.var_.moveOldPos2020_tpose = var_82_19.localPosition
			end

			local var_82_21 = 0.001

			if var_82_20 <= arg_79_1.time_ and arg_79_1.time_ < var_82_20 + var_82_21 then
				local var_82_22 = (arg_79_1.time_ - var_82_20) / var_82_21
				local var_82_23 = Vector3.New(0, 100, 0)

				var_82_19.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos2020_tpose, var_82_23, var_82_22)

				local var_82_24 = manager.ui.mainCamera.transform.position - var_82_19.position

				var_82_19.forward = Vector3.New(var_82_24.x, var_82_24.y, var_82_24.z)

				local var_82_25 = var_82_19.localEulerAngles

				var_82_25.z = 0
				var_82_25.x = 0
				var_82_19.localEulerAngles = var_82_25
			end

			if arg_79_1.time_ >= var_82_20 + var_82_21 and arg_79_1.time_ < var_82_20 + var_82_21 + arg_82_0 then
				var_82_19.localPosition = Vector3.New(0, 100, 0)

				local var_82_26 = manager.ui.mainCamera.transform.position - var_82_19.position

				var_82_19.forward = Vector3.New(var_82_26.x, var_82_26.y, var_82_26.z)

				local var_82_27 = var_82_19.localEulerAngles

				var_82_27.z = 0
				var_82_27.x = 0
				var_82_19.localEulerAngles = var_82_27
			end

			local var_82_28 = arg_79_1.actors_["1084ui_story"].transform
			local var_82_29 = 0

			if var_82_29 < arg_79_1.time_ and arg_79_1.time_ <= var_82_29 + arg_82_0 then
				arg_79_1.var_.moveOldPos1084ui_story = var_82_28.localPosition
			end

			local var_82_30 = 0.001

			if var_82_29 <= arg_79_1.time_ and arg_79_1.time_ < var_82_29 + var_82_30 then
				local var_82_31 = (arg_79_1.time_ - var_82_29) / var_82_30
				local var_82_32 = Vector3.New(0, -0.97, -6)

				var_82_28.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1084ui_story, var_82_32, var_82_31)

				local var_82_33 = manager.ui.mainCamera.transform.position - var_82_28.position

				var_82_28.forward = Vector3.New(var_82_33.x, var_82_33.y, var_82_33.z)

				local var_82_34 = var_82_28.localEulerAngles

				var_82_34.z = 0
				var_82_34.x = 0
				var_82_28.localEulerAngles = var_82_34
			end

			if arg_79_1.time_ >= var_82_29 + var_82_30 and arg_79_1.time_ < var_82_29 + var_82_30 + arg_82_0 then
				var_82_28.localPosition = Vector3.New(0, -0.97, -6)

				local var_82_35 = manager.ui.mainCamera.transform.position - var_82_28.position

				var_82_28.forward = Vector3.New(var_82_35.x, var_82_35.y, var_82_35.z)

				local var_82_36 = var_82_28.localEulerAngles

				var_82_36.z = 0
				var_82_36.x = 0
				var_82_28.localEulerAngles = var_82_36
			end

			local var_82_37 = 0

			if var_82_37 < arg_79_1.time_ and arg_79_1.time_ <= var_82_37 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_82_38 = 0

			if var_82_38 < arg_79_1.time_ and arg_79_1.time_ <= var_82_38 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_82_39 = 0
			local var_82_40 = 0.175

			if var_82_39 < arg_79_1.time_ and arg_79_1.time_ <= var_82_39 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_41 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_42 = arg_79_1:GetWordFromCfg(101111020)
				local var_82_43 = arg_79_1:FormatText(var_82_42.content)

				arg_79_1.text_.text = var_82_43

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_44 = 7
				local var_82_45 = utf8.len(var_82_43)
				local var_82_46 = var_82_44 <= 0 and var_82_40 or var_82_40 * (var_82_45 / var_82_44)

				if var_82_46 > 0 and var_82_40 < var_82_46 then
					arg_79_1.talkMaxDuration = var_82_46

					if var_82_46 + var_82_39 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_46 + var_82_39
					end
				end

				arg_79_1.text_.text = var_82_43
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111020", "story_v_out_101111.awb") ~= 0 then
					local var_82_47 = manager.audio:GetVoiceLength("story_v_out_101111", "101111020", "story_v_out_101111.awb") / 1000

					if var_82_47 + var_82_39 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_47 + var_82_39
					end

					if var_82_42.prefab_name ~= "" and arg_79_1.actors_[var_82_42.prefab_name] ~= nil then
						local var_82_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_42.prefab_name].transform, "story_v_out_101111", "101111020", "story_v_out_101111.awb")

						arg_79_1:RecordAudio("101111020", var_82_48)
						arg_79_1:RecordAudio("101111020", var_82_48)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_101111", "101111020", "story_v_out_101111.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_101111", "101111020", "story_v_out_101111.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_49 = math.max(var_82_40, arg_79_1.talkMaxDuration)

			if var_82_39 <= arg_79_1.time_ and arg_79_1.time_ < var_82_39 + var_82_49 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_39) / var_82_49

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_39 + var_82_49 and arg_79_1.time_ < var_82_39 + var_82_49 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play101111021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 101111021
		arg_83_1.duration_ = 5.1

		local var_83_0 = {
			ja = 5.1,
			ko = 1.999999999999,
			zh = 2.733,
			en = 2.666
		}
		local var_83_1 = manager.audio:GetLocalizationFlag()

		if var_83_0[var_83_1] ~= nil then
			arg_83_1.duration_ = var_83_0[var_83_1]
		end

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play101111022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_2")
			end

			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_86_2 = 0

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_86_3 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_4 = 0

			if var_86_4 < arg_83_1.time_ and arg_83_1.time_ <= var_86_4 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_3.localPosition
			end

			local var_86_5 = 0.001

			if var_86_4 <= arg_83_1.time_ and arg_83_1.time_ < var_86_4 + var_86_5 then
				local var_86_6 = (arg_83_1.time_ - var_86_4) / var_86_5
				local var_86_7 = Vector3.New(-0.7, -0.97, -6)

				var_86_3.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_7, var_86_6)

				local var_86_8 = manager.ui.mainCamera.transform.position - var_86_3.position

				var_86_3.forward = Vector3.New(var_86_8.x, var_86_8.y, var_86_8.z)

				local var_86_9 = var_86_3.localEulerAngles

				var_86_9.z = 0
				var_86_9.x = 0
				var_86_3.localEulerAngles = var_86_9
			end

			if arg_83_1.time_ >= var_86_4 + var_86_5 and arg_83_1.time_ < var_86_4 + var_86_5 + arg_86_0 then
				var_86_3.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_86_10 = manager.ui.mainCamera.transform.position - var_86_3.position

				var_86_3.forward = Vector3.New(var_86_10.x, var_86_10.y, var_86_10.z)

				local var_86_11 = var_86_3.localEulerAngles

				var_86_11.z = 0
				var_86_11.x = 0
				var_86_3.localEulerAngles = var_86_11
			end

			local var_86_12 = arg_83_1.actors_["1019ui_story"].transform
			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1.var_.moveOldPos1019ui_story = var_86_12.localPosition
			end

			local var_86_14 = 0.001

			if var_86_13 <= arg_83_1.time_ and arg_83_1.time_ < var_86_13 + var_86_14 then
				local var_86_15 = (arg_83_1.time_ - var_86_13) / var_86_14
				local var_86_16 = Vector3.New(0, -1.08, -5.9)

				var_86_12.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1019ui_story, var_86_16, var_86_15)

				local var_86_17 = manager.ui.mainCamera.transform.position - var_86_12.position

				var_86_12.forward = Vector3.New(var_86_17.x, var_86_17.y, var_86_17.z)

				local var_86_18 = var_86_12.localEulerAngles

				var_86_18.z = 0
				var_86_18.x = 0
				var_86_12.localEulerAngles = var_86_18
			end

			if arg_83_1.time_ >= var_86_13 + var_86_14 and arg_83_1.time_ < var_86_13 + var_86_14 + arg_86_0 then
				var_86_12.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_86_19 = manager.ui.mainCamera.transform.position - var_86_12.position

				var_86_12.forward = Vector3.New(var_86_19.x, var_86_19.y, var_86_19.z)

				local var_86_20 = var_86_12.localEulerAngles

				var_86_20.z = 0
				var_86_20.x = 0
				var_86_12.localEulerAngles = var_86_20
			end

			local var_86_21 = arg_83_1.actors_["1011ui_story"].transform
			local var_86_22 = 0

			if var_86_22 < arg_83_1.time_ and arg_83_1.time_ <= var_86_22 + arg_86_0 then
				arg_83_1.var_.moveOldPos1011ui_story = var_86_21.localPosition
			end

			local var_86_23 = 0.001

			if var_86_22 <= arg_83_1.time_ and arg_83_1.time_ < var_86_22 + var_86_23 then
				local var_86_24 = (arg_83_1.time_ - var_86_22) / var_86_23
				local var_86_25 = Vector3.New(0.7, -0.71, -6)

				var_86_21.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1011ui_story, var_86_25, var_86_24)

				local var_86_26 = manager.ui.mainCamera.transform.position - var_86_21.position

				var_86_21.forward = Vector3.New(var_86_26.x, var_86_26.y, var_86_26.z)

				local var_86_27 = var_86_21.localEulerAngles

				var_86_27.z = 0
				var_86_27.x = 0
				var_86_21.localEulerAngles = var_86_27
			end

			if arg_83_1.time_ >= var_86_22 + var_86_23 and arg_83_1.time_ < var_86_22 + var_86_23 + arg_86_0 then
				var_86_21.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_86_28 = manager.ui.mainCamera.transform.position - var_86_21.position

				var_86_21.forward = Vector3.New(var_86_28.x, var_86_28.y, var_86_28.z)

				local var_86_29 = var_86_21.localEulerAngles

				var_86_29.z = 0
				var_86_29.x = 0
				var_86_21.localEulerAngles = var_86_29
			end

			local var_86_30 = 0
			local var_86_31 = 0.275

			if var_86_30 < arg_83_1.time_ and arg_83_1.time_ <= var_86_30 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_32 = arg_83_1:FormatText(StoryNameCfg[19].name)

				arg_83_1.leftNameTxt_.text = var_86_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_33 = arg_83_1:GetWordFromCfg(101111021)
				local var_86_34 = arg_83_1:FormatText(var_86_33.content)

				arg_83_1.text_.text = var_86_34

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_35 = 11
				local var_86_36 = utf8.len(var_86_34)
				local var_86_37 = var_86_35 <= 0 and var_86_31 or var_86_31 * (var_86_36 / var_86_35)

				if var_86_37 > 0 and var_86_31 < var_86_37 then
					arg_83_1.talkMaxDuration = var_86_37

					if var_86_37 + var_86_30 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_37 + var_86_30
					end
				end

				arg_83_1.text_.text = var_86_34
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111021", "story_v_out_101111.awb") ~= 0 then
					local var_86_38 = manager.audio:GetVoiceLength("story_v_out_101111", "101111021", "story_v_out_101111.awb") / 1000

					if var_86_38 + var_86_30 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_38 + var_86_30
					end

					if var_86_33.prefab_name ~= "" and arg_83_1.actors_[var_86_33.prefab_name] ~= nil then
						local var_86_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_33.prefab_name].transform, "story_v_out_101111", "101111021", "story_v_out_101111.awb")

						arg_83_1:RecordAudio("101111021", var_86_39)
						arg_83_1:RecordAudio("101111021", var_86_39)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_101111", "101111021", "story_v_out_101111.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_101111", "101111021", "story_v_out_101111.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_40 = math.max(var_86_31, arg_83_1.talkMaxDuration)

			if var_86_30 <= arg_83_1.time_ and arg_83_1.time_ < var_86_30 + var_86_40 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_30) / var_86_40

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_30 + var_86_40 and arg_83_1.time_ < var_86_30 + var_86_40 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play101111022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 101111022
		arg_87_1.duration_ = 9.033

		local var_87_0 = {
			ja = 9.033,
			ko = 8.966,
			zh = 7.133,
			en = 7.933
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
				arg_87_0:Play101111023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1019ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1019ui_story == nil then
				arg_87_1.var_.characterEffect1019ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.1

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1019ui_story then
					arg_87_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1019ui_story then
				arg_87_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["1011ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect1011ui_story == nil then
				arg_87_1.var_.characterEffect1011ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.1

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect1011ui_story then
					arg_87_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect1011ui_story then
				arg_87_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_90_8 = arg_87_1.actors_["1019ui_story"].transform
			local var_90_9 = 0

			if var_90_9 < arg_87_1.time_ and arg_87_1.time_ <= var_90_9 + arg_90_0 then
				arg_87_1.var_.moveOldPos1019ui_story = var_90_8.localPosition
			end

			local var_90_10 = 0.001

			if var_90_9 <= arg_87_1.time_ and arg_87_1.time_ < var_90_9 + var_90_10 then
				local var_90_11 = (arg_87_1.time_ - var_90_9) / var_90_10
				local var_90_12 = Vector3.New(0, -1.08, -5.9)

				var_90_8.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1019ui_story, var_90_12, var_90_11)

				local var_90_13 = manager.ui.mainCamera.transform.position - var_90_8.position

				var_90_8.forward = Vector3.New(var_90_13.x, var_90_13.y, var_90_13.z)

				local var_90_14 = var_90_8.localEulerAngles

				var_90_14.z = 0
				var_90_14.x = 0
				var_90_8.localEulerAngles = var_90_14
			end

			if arg_87_1.time_ >= var_90_9 + var_90_10 and arg_87_1.time_ < var_90_9 + var_90_10 + arg_90_0 then
				var_90_8.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_90_15 = manager.ui.mainCamera.transform.position - var_90_8.position

				var_90_8.forward = Vector3.New(var_90_15.x, var_90_15.y, var_90_15.z)

				local var_90_16 = var_90_8.localEulerAngles

				var_90_16.z = 0
				var_90_16.x = 0
				var_90_8.localEulerAngles = var_90_16
			end

			local var_90_17 = 0

			if var_90_17 < arg_87_1.time_ and arg_87_1.time_ <= var_90_17 + arg_90_0 then
				arg_87_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_90_18 = arg_87_1.actors_["1011ui_story"].transform
			local var_90_19 = 0

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.var_.moveOldPos1011ui_story = var_90_18.localPosition
			end

			local var_90_20 = 0.001

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_20 then
				local var_90_21 = (arg_87_1.time_ - var_90_19) / var_90_20
				local var_90_22 = Vector3.New(0.7, -0.71, -6)

				var_90_18.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1011ui_story, var_90_22, var_90_21)

				local var_90_23 = manager.ui.mainCamera.transform.position - var_90_18.position

				var_90_18.forward = Vector3.New(var_90_23.x, var_90_23.y, var_90_23.z)

				local var_90_24 = var_90_18.localEulerAngles

				var_90_24.z = 0
				var_90_24.x = 0
				var_90_18.localEulerAngles = var_90_24
			end

			if arg_87_1.time_ >= var_90_19 + var_90_20 and arg_87_1.time_ < var_90_19 + var_90_20 + arg_90_0 then
				var_90_18.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_90_25 = manager.ui.mainCamera.transform.position - var_90_18.position

				var_90_18.forward = Vector3.New(var_90_25.x, var_90_25.y, var_90_25.z)

				local var_90_26 = var_90_18.localEulerAngles

				var_90_26.z = 0
				var_90_26.x = 0
				var_90_18.localEulerAngles = var_90_26
			end

			local var_90_27 = 0

			if var_90_27 < arg_87_1.time_ and arg_87_1.time_ <= var_90_27 + arg_90_0 then
				arg_87_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_90_28 = 0

			if var_90_28 < arg_87_1.time_ and arg_87_1.time_ <= var_90_28 + arg_90_0 then
				arg_87_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_90_29 = 0
			local var_90_30 = 0.775

			if var_90_29 < arg_87_1.time_ and arg_87_1.time_ <= var_90_29 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_31 = arg_87_1:FormatText(StoryNameCfg[33].name)

				arg_87_1.leftNameTxt_.text = var_90_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20302")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_32 = arg_87_1:GetWordFromCfg(101111022)
				local var_90_33 = arg_87_1:FormatText(var_90_32.content)

				arg_87_1.text_.text = var_90_33

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_34 = 29
				local var_90_35 = utf8.len(var_90_33)
				local var_90_36 = var_90_34 <= 0 and var_90_30 or var_90_30 * (var_90_35 / var_90_34)

				if var_90_36 > 0 and var_90_30 < var_90_36 then
					arg_87_1.talkMaxDuration = var_90_36

					if var_90_36 + var_90_29 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_36 + var_90_29
					end
				end

				arg_87_1.text_.text = var_90_33
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111022", "story_v_out_101111.awb") ~= 0 then
					local var_90_37 = manager.audio:GetVoiceLength("story_v_out_101111", "101111022", "story_v_out_101111.awb") / 1000

					if var_90_37 + var_90_29 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_37 + var_90_29
					end

					if var_90_32.prefab_name ~= "" and arg_87_1.actors_[var_90_32.prefab_name] ~= nil then
						local var_90_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_32.prefab_name].transform, "story_v_out_101111", "101111022", "story_v_out_101111.awb")

						arg_87_1:RecordAudio("101111022", var_90_38)
						arg_87_1:RecordAudio("101111022", var_90_38)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_101111", "101111022", "story_v_out_101111.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_101111", "101111022", "story_v_out_101111.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_39 = math.max(var_90_30, arg_87_1.talkMaxDuration)

			if var_90_29 <= arg_87_1.time_ and arg_87_1.time_ < var_90_29 + var_90_39 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_29) / var_90_39

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_29 + var_90_39 and arg_87_1.time_ < var_90_29 + var_90_39 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play101111023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 101111023
		arg_91_1.duration_ = 10.266

		local var_91_0 = {
			ja = 10.266,
			ko = 8.7,
			zh = 6.433,
			en = 8.066
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
				arg_91_0:Play101111024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1084ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.1

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1084ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1084ui_story.fillRatio = var_94_5
			end

			local var_94_6 = arg_91_1.actors_["1019ui_story"]
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 and arg_91_1.var_.characterEffect1019ui_story == nil then
				arg_91_1.var_.characterEffect1019ui_story = var_94_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_8 = 0.1

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_7) / var_94_8

				if arg_91_1.var_.characterEffect1019ui_story then
					local var_94_10 = Mathf.Lerp(0, 0.5, var_94_9)

					arg_91_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1019ui_story.fillRatio = var_94_10
				end
			end

			if arg_91_1.time_ >= var_94_7 + var_94_8 and arg_91_1.time_ < var_94_7 + var_94_8 + arg_94_0 and arg_91_1.var_.characterEffect1019ui_story then
				local var_94_11 = 0.5

				arg_91_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1019ui_story.fillRatio = var_94_11
			end

			local var_94_12 = arg_91_1.actors_["1019ui_story"].transform
			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1.var_.moveOldPos1019ui_story = var_94_12.localPosition
			end

			local var_94_14 = 0.001

			if var_94_13 <= arg_91_1.time_ and arg_91_1.time_ < var_94_13 + var_94_14 then
				local var_94_15 = (arg_91_1.time_ - var_94_13) / var_94_14
				local var_94_16 = Vector3.New(0, 100, 0)

				var_94_12.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1019ui_story, var_94_16, var_94_15)

				local var_94_17 = manager.ui.mainCamera.transform.position - var_94_12.position

				var_94_12.forward = Vector3.New(var_94_17.x, var_94_17.y, var_94_17.z)

				local var_94_18 = var_94_12.localEulerAngles

				var_94_18.z = 0
				var_94_18.x = 0
				var_94_12.localEulerAngles = var_94_18
			end

			if arg_91_1.time_ >= var_94_13 + var_94_14 and arg_91_1.time_ < var_94_13 + var_94_14 + arg_94_0 then
				var_94_12.localPosition = Vector3.New(0, 100, 0)

				local var_94_19 = manager.ui.mainCamera.transform.position - var_94_12.position

				var_94_12.forward = Vector3.New(var_94_19.x, var_94_19.y, var_94_19.z)

				local var_94_20 = var_94_12.localEulerAngles

				var_94_20.z = 0
				var_94_20.x = 0
				var_94_12.localEulerAngles = var_94_20
			end

			local var_94_21 = arg_91_1.actors_["1084ui_story"].transform
			local var_94_22 = 0

			if var_94_22 < arg_91_1.time_ and arg_91_1.time_ <= var_94_22 + arg_94_0 then
				arg_91_1.var_.moveOldPos1084ui_story = var_94_21.localPosition
			end

			local var_94_23 = 0.001

			if var_94_22 <= arg_91_1.time_ and arg_91_1.time_ < var_94_22 + var_94_23 then
				local var_94_24 = (arg_91_1.time_ - var_94_22) / var_94_23
				local var_94_25 = Vector3.New(0, 100, 0)

				var_94_21.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1084ui_story, var_94_25, var_94_24)

				local var_94_26 = manager.ui.mainCamera.transform.position - var_94_21.position

				var_94_21.forward = Vector3.New(var_94_26.x, var_94_26.y, var_94_26.z)

				local var_94_27 = var_94_21.localEulerAngles

				var_94_27.z = 0
				var_94_27.x = 0
				var_94_21.localEulerAngles = var_94_27
			end

			if arg_91_1.time_ >= var_94_22 + var_94_23 and arg_91_1.time_ < var_94_22 + var_94_23 + arg_94_0 then
				var_94_21.localPosition = Vector3.New(0, 100, 0)

				local var_94_28 = manager.ui.mainCamera.transform.position - var_94_21.position

				var_94_21.forward = Vector3.New(var_94_28.x, var_94_28.y, var_94_28.z)

				local var_94_29 = var_94_21.localEulerAngles

				var_94_29.z = 0
				var_94_29.x = 0
				var_94_21.localEulerAngles = var_94_29
			end

			local var_94_30 = arg_91_1.actors_["1011ui_story"].transform
			local var_94_31 = 0

			if var_94_31 < arg_91_1.time_ and arg_91_1.time_ <= var_94_31 + arg_94_0 then
				arg_91_1.var_.moveOldPos1011ui_story = var_94_30.localPosition
			end

			local var_94_32 = 0.001

			if var_94_31 <= arg_91_1.time_ and arg_91_1.time_ < var_94_31 + var_94_32 then
				local var_94_33 = (arg_91_1.time_ - var_94_31) / var_94_32
				local var_94_34 = Vector3.New(0, -0.71, -6)

				var_94_30.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1011ui_story, var_94_34, var_94_33)

				local var_94_35 = manager.ui.mainCamera.transform.position - var_94_30.position

				var_94_30.forward = Vector3.New(var_94_35.x, var_94_35.y, var_94_35.z)

				local var_94_36 = var_94_30.localEulerAngles

				var_94_36.z = 0
				var_94_36.x = 0
				var_94_30.localEulerAngles = var_94_36
			end

			if arg_91_1.time_ >= var_94_31 + var_94_32 and arg_91_1.time_ < var_94_31 + var_94_32 + arg_94_0 then
				var_94_30.localPosition = Vector3.New(0, -0.71, -6)

				local var_94_37 = manager.ui.mainCamera.transform.position - var_94_30.position

				var_94_30.forward = Vector3.New(var_94_37.x, var_94_37.y, var_94_37.z)

				local var_94_38 = var_94_30.localEulerAngles

				var_94_38.z = 0
				var_94_38.x = 0
				var_94_30.localEulerAngles = var_94_38
			end

			local var_94_39 = 0

			if var_94_39 < arg_91_1.time_ and arg_91_1.time_ <= var_94_39 + arg_94_0 then
				arg_91_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_94_40 = 0
			local var_94_41 = 0.75

			if var_94_40 < arg_91_1.time_ and arg_91_1.time_ <= var_94_40 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_42 = arg_91_1:FormatText(StoryNameCfg[37].name)

				arg_91_1.leftNameTxt_.text = var_94_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_43 = arg_91_1:GetWordFromCfg(101111023)
				local var_94_44 = arg_91_1:FormatText(var_94_43.content)

				arg_91_1.text_.text = var_94_44

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_45 = 28
				local var_94_46 = utf8.len(var_94_44)
				local var_94_47 = var_94_45 <= 0 and var_94_41 or var_94_41 * (var_94_46 / var_94_45)

				if var_94_47 > 0 and var_94_41 < var_94_47 then
					arg_91_1.talkMaxDuration = var_94_47

					if var_94_47 + var_94_40 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_47 + var_94_40
					end
				end

				arg_91_1.text_.text = var_94_44
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111023", "story_v_out_101111.awb") ~= 0 then
					local var_94_48 = manager.audio:GetVoiceLength("story_v_out_101111", "101111023", "story_v_out_101111.awb") / 1000

					if var_94_48 + var_94_40 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_48 + var_94_40
					end

					if var_94_43.prefab_name ~= "" and arg_91_1.actors_[var_94_43.prefab_name] ~= nil then
						local var_94_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_43.prefab_name].transform, "story_v_out_101111", "101111023", "story_v_out_101111.awb")

						arg_91_1:RecordAudio("101111023", var_94_49)
						arg_91_1:RecordAudio("101111023", var_94_49)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_101111", "101111023", "story_v_out_101111.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_101111", "101111023", "story_v_out_101111.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_50 = math.max(var_94_41, arg_91_1.talkMaxDuration)

			if var_94_40 <= arg_91_1.time_ and arg_91_1.time_ < var_94_40 + var_94_50 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_40) / var_94_50

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_40 + var_94_50 and arg_91_1.time_ < var_94_40 + var_94_50 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play101111024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 101111024
		arg_95_1.duration_ = 7.4

		local var_95_0 = {
			ja = 7.4,
			ko = 3.466,
			zh = 4.7,
			en = 4.833
		}
		local var_95_1 = manager.audio:GetLocalizationFlag()

		if var_95_0[var_95_1] ~= nil then
			arg_95_1.duration_ = var_95_0[var_95_1]
		end

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play101111025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1011ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1011ui_story == nil then
				arg_95_1.var_.characterEffect1011ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.1

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1011ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1011ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1011ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1011ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.575

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[19].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(101111024)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 21
				local var_98_12 = utf8.len(var_98_10)
				local var_98_13 = var_98_11 <= 0 and var_98_7 or var_98_7 * (var_98_12 / var_98_11)

				if var_98_13 > 0 and var_98_7 < var_98_13 then
					arg_95_1.talkMaxDuration = var_98_13

					if var_98_13 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_13 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_10
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111024", "story_v_out_101111.awb") ~= 0 then
					local var_98_14 = manager.audio:GetVoiceLength("story_v_out_101111", "101111024", "story_v_out_101111.awb") / 1000

					if var_98_14 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_14 + var_98_6
					end

					if var_98_9.prefab_name ~= "" and arg_95_1.actors_[var_98_9.prefab_name] ~= nil then
						local var_98_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_9.prefab_name].transform, "story_v_out_101111", "101111024", "story_v_out_101111.awb")

						arg_95_1:RecordAudio("101111024", var_98_15)
						arg_95_1:RecordAudio("101111024", var_98_15)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_101111", "101111024", "story_v_out_101111.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_101111", "101111024", "story_v_out_101111.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_16 and arg_95_1.time_ < var_98_6 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play101111025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 101111025
		arg_99_1.duration_ = 8.066

		local var_99_0 = {
			ja = 7.866,
			ko = 5.6,
			zh = 8.066,
			en = 6.4
		}
		local var_99_1 = manager.audio:GetLocalizationFlag()

		if var_99_0[var_99_1] ~= nil then
			arg_99_1.duration_ = var_99_0[var_99_1]
		end

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play101111026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.775

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[19].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(101111025)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 30
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111025", "story_v_out_101111.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_101111", "101111025", "story_v_out_101111.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_101111", "101111025", "story_v_out_101111.awb")

						arg_99_1:RecordAudio("101111025", var_102_9)
						arg_99_1:RecordAudio("101111025", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_101111", "101111025", "story_v_out_101111.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_101111", "101111025", "story_v_out_101111.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play101111026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 101111026
		arg_103_1.duration_ = 3.6

		local var_103_0 = {
			ja = 3.6,
			ko = 2.033,
			zh = 2.5,
			en = 2.533
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
				arg_103_0:Play101111027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1011ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1011ui_story == nil then
				arg_103_1.var_.characterEffect1011ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.1

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1011ui_story then
					arg_103_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1011ui_story then
				arg_103_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_106_4 = 0

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				arg_103_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action426")
			end

			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_106_6 = 0
			local var_106_7 = 0.175

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[37].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(101111026)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 7
				local var_106_12 = utf8.len(var_106_10)
				local var_106_13 = var_106_11 <= 0 and var_106_7 or var_106_7 * (var_106_12 / var_106_11)

				if var_106_13 > 0 and var_106_7 < var_106_13 then
					arg_103_1.talkMaxDuration = var_106_13

					if var_106_13 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_13 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_10
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111026", "story_v_out_101111.awb") ~= 0 then
					local var_106_14 = manager.audio:GetVoiceLength("story_v_out_101111", "101111026", "story_v_out_101111.awb") / 1000

					if var_106_14 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_14 + var_106_6
					end

					if var_106_9.prefab_name ~= "" and arg_103_1.actors_[var_106_9.prefab_name] ~= nil then
						local var_106_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_9.prefab_name].transform, "story_v_out_101111", "101111026", "story_v_out_101111.awb")

						arg_103_1:RecordAudio("101111026", var_106_15)
						arg_103_1:RecordAudio("101111026", var_106_15)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_101111", "101111026", "story_v_out_101111.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_101111", "101111026", "story_v_out_101111.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_16 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_16 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_16

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_16 and arg_103_1.time_ < var_106_6 + var_106_16 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play101111027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 101111027
		arg_107_1.duration_ = 3.9

		local var_107_0 = {
			ja = 3.166,
			ko = 2.933,
			zh = 3.9,
			en = 2.6
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
				arg_107_0:Play101111028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				local var_110_2 = "play"
				local var_110_3 = "effect"

				arg_107_1:AudioAction(var_110_2, var_110_3, "se_story_1", "se_story_1_gun_load", "")
			end

			local var_110_4 = arg_107_1.actors_["1011ui_story"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect1011ui_story == nil then
				arg_107_1.var_.characterEffect1011ui_story = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.1

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect1011ui_story then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1011ui_story.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect1011ui_story then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1011ui_story.fillRatio = var_110_9
			end

			local var_110_10 = 0
			local var_110_11 = 0.45

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_12 = arg_107_1:FormatText(StoryNameCfg[19].name)

				arg_107_1.leftNameTxt_.text = var_110_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20301")

				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_13 = arg_107_1:GetWordFromCfg(101111027)
				local var_110_14 = arg_107_1:FormatText(var_110_13.content)

				arg_107_1.text_.text = var_110_14

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_15 = 16
				local var_110_16 = utf8.len(var_110_14)
				local var_110_17 = var_110_15 <= 0 and var_110_11 or var_110_11 * (var_110_16 / var_110_15)

				if var_110_17 > 0 and var_110_11 < var_110_17 then
					arg_107_1.talkMaxDuration = var_110_17

					if var_110_17 + var_110_10 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_17 + var_110_10
					end
				end

				arg_107_1.text_.text = var_110_14
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111027", "story_v_out_101111.awb") ~= 0 then
					local var_110_18 = manager.audio:GetVoiceLength("story_v_out_101111", "101111027", "story_v_out_101111.awb") / 1000

					if var_110_18 + var_110_10 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_18 + var_110_10
					end

					if var_110_13.prefab_name ~= "" and arg_107_1.actors_[var_110_13.prefab_name] ~= nil then
						local var_110_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_13.prefab_name].transform, "story_v_out_101111", "101111027", "story_v_out_101111.awb")

						arg_107_1:RecordAudio("101111027", var_110_19)
						arg_107_1:RecordAudio("101111027", var_110_19)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_101111", "101111027", "story_v_out_101111.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_101111", "101111027", "story_v_out_101111.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_20 = math.max(var_110_11, arg_107_1.talkMaxDuration)

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_20 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_10) / var_110_20

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_10 + var_110_20 and arg_107_1.time_ < var_110_10 + var_110_20 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play101111028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 101111028
		arg_111_1.duration_ = 2.766

		local var_111_0 = {
			ja = 2.766,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_111_0:Play101111029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_114_1 = 0
			local var_114_2 = 0.125

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_3 = arg_111_1:FormatText(StoryNameCfg[33].name)

				arg_111_1.leftNameTxt_.text = var_114_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_20302")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_4 = arg_111_1:GetWordFromCfg(101111028)
				local var_114_5 = arg_111_1:FormatText(var_114_4.content)

				arg_111_1.text_.text = var_114_5

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_6 = 5
				local var_114_7 = utf8.len(var_114_5)
				local var_114_8 = var_114_6 <= 0 and var_114_2 or var_114_2 * (var_114_7 / var_114_6)

				if var_114_8 > 0 and var_114_2 < var_114_8 then
					arg_111_1.talkMaxDuration = var_114_8

					if var_114_8 + var_114_1 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_1
					end
				end

				arg_111_1.text_.text = var_114_5
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111028", "story_v_out_101111.awb") ~= 0 then
					local var_114_9 = manager.audio:GetVoiceLength("story_v_out_101111", "101111028", "story_v_out_101111.awb") / 1000

					if var_114_9 + var_114_1 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_9 + var_114_1
					end

					if var_114_4.prefab_name ~= "" and arg_111_1.actors_[var_114_4.prefab_name] ~= nil then
						local var_114_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_4.prefab_name].transform, "story_v_out_101111", "101111028", "story_v_out_101111.awb")

						arg_111_1:RecordAudio("101111028", var_114_10)
						arg_111_1:RecordAudio("101111028", var_114_10)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_101111", "101111028", "story_v_out_101111.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_101111", "101111028", "story_v_out_101111.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_11 = math.max(var_114_2, arg_111_1.talkMaxDuration)

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_11 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_1) / var_114_11

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_1 + var_114_11 and arg_111_1.time_ < var_114_1 + var_114_11 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play101111029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 101111029
		arg_115_1.duration_ = 9.4

		local var_115_0 = {
			ja = 9.4,
			ko = 3.866,
			zh = 3.4,
			en = 2.9
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
				arg_115_0:Play101111030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1019ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1019ui_story == nil then
				arg_115_1.var_.characterEffect1019ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.1

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1019ui_story then
					arg_115_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1019ui_story then
				arg_115_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_118_4 = arg_115_1.actors_["1011ui_story"].transform
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 then
				arg_115_1.var_.moveOldPos1011ui_story = var_118_4.localPosition
			end

			local var_118_6 = 0.001

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6
				local var_118_8 = Vector3.New(0.7, -0.71, -6)

				var_118_4.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1011ui_story, var_118_8, var_118_7)

				local var_118_9 = manager.ui.mainCamera.transform.position - var_118_4.position

				var_118_4.forward = Vector3.New(var_118_9.x, var_118_9.y, var_118_9.z)

				local var_118_10 = var_118_4.localEulerAngles

				var_118_10.z = 0
				var_118_10.x = 0
				var_118_4.localEulerAngles = var_118_10
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 then
				var_118_4.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_118_11 = manager.ui.mainCamera.transform.position - var_118_4.position

				var_118_4.forward = Vector3.New(var_118_11.x, var_118_11.y, var_118_11.z)

				local var_118_12 = var_118_4.localEulerAngles

				var_118_12.z = 0
				var_118_12.x = 0
				var_118_4.localEulerAngles = var_118_12
			end

			local var_118_13 = arg_115_1.actors_["1019ui_story"].transform
			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				arg_115_1.var_.moveOldPos1019ui_story = var_118_13.localPosition
			end

			local var_118_15 = 0.001

			if var_118_14 <= arg_115_1.time_ and arg_115_1.time_ < var_118_14 + var_118_15 then
				local var_118_16 = (arg_115_1.time_ - var_118_14) / var_118_15
				local var_118_17 = Vector3.New(-0.7, -1.08, -5.9)

				var_118_13.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1019ui_story, var_118_17, var_118_16)

				local var_118_18 = manager.ui.mainCamera.transform.position - var_118_13.position

				var_118_13.forward = Vector3.New(var_118_18.x, var_118_18.y, var_118_18.z)

				local var_118_19 = var_118_13.localEulerAngles

				var_118_19.z = 0
				var_118_19.x = 0
				var_118_13.localEulerAngles = var_118_19
			end

			if arg_115_1.time_ >= var_118_14 + var_118_15 and arg_115_1.time_ < var_118_14 + var_118_15 + arg_118_0 then
				var_118_13.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_118_20 = manager.ui.mainCamera.transform.position - var_118_13.position

				var_118_13.forward = Vector3.New(var_118_20.x, var_118_20.y, var_118_20.z)

				local var_118_21 = var_118_13.localEulerAngles

				var_118_21.z = 0
				var_118_21.x = 0
				var_118_13.localEulerAngles = var_118_21
			end

			local var_118_22 = 0

			if var_118_22 < arg_115_1.time_ and arg_115_1.time_ <= var_118_22 + arg_118_0 then
				arg_115_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_118_23 = 0
			local var_118_24 = 0.45

			if var_118_23 < arg_115_1.time_ and arg_115_1.time_ <= var_118_23 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_25 = arg_115_1:FormatText(StoryNameCfg[13].name)

				arg_115_1.leftNameTxt_.text = var_118_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_26 = arg_115_1:GetWordFromCfg(101111029)
				local var_118_27 = arg_115_1:FormatText(var_118_26.content)

				arg_115_1.text_.text = var_118_27

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_28 = 16
				local var_118_29 = utf8.len(var_118_27)
				local var_118_30 = var_118_28 <= 0 and var_118_24 or var_118_24 * (var_118_29 / var_118_28)

				if var_118_30 > 0 and var_118_24 < var_118_30 then
					arg_115_1.talkMaxDuration = var_118_30

					if var_118_30 + var_118_23 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_30 + var_118_23
					end
				end

				arg_115_1.text_.text = var_118_27
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111029", "story_v_out_101111.awb") ~= 0 then
					local var_118_31 = manager.audio:GetVoiceLength("story_v_out_101111", "101111029", "story_v_out_101111.awb") / 1000

					if var_118_31 + var_118_23 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_31 + var_118_23
					end

					if var_118_26.prefab_name ~= "" and arg_115_1.actors_[var_118_26.prefab_name] ~= nil then
						local var_118_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_26.prefab_name].transform, "story_v_out_101111", "101111029", "story_v_out_101111.awb")

						arg_115_1:RecordAudio("101111029", var_118_32)
						arg_115_1:RecordAudio("101111029", var_118_32)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_101111", "101111029", "story_v_out_101111.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_101111", "101111029", "story_v_out_101111.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_33 = math.max(var_118_24, arg_115_1.talkMaxDuration)

			if var_118_23 <= arg_115_1.time_ and arg_115_1.time_ < var_118_23 + var_118_33 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_23) / var_118_33

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_23 + var_118_33 and arg_115_1.time_ < var_118_23 + var_118_33 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play101111030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 101111030
		arg_119_1.duration_ = 9

		local var_119_0 = {
			ja = 9,
			ko = 6.6,
			zh = 6.5,
			en = 5.466
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
			arg_119_1.auto_ = false
		end

		function arg_119_1.playNext_(arg_121_0)
			arg_119_1.onStoryFinished_()
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action454")
			end

			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_122_2 = 0
			local var_122_3 = 0.825

			if var_122_2 < arg_119_1.time_ and arg_119_1.time_ <= var_122_2 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_4 = arg_119_1:FormatText(StoryNameCfg[13].name)

				arg_119_1.leftNameTxt_.text = var_122_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_5 = arg_119_1:GetWordFromCfg(101111030)
				local var_122_6 = arg_119_1:FormatText(var_122_5.content)

				arg_119_1.text_.text = var_122_6

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_7 = 33
				local var_122_8 = utf8.len(var_122_6)
				local var_122_9 = var_122_7 <= 0 and var_122_3 or var_122_3 * (var_122_8 / var_122_7)

				if var_122_9 > 0 and var_122_3 < var_122_9 then
					arg_119_1.talkMaxDuration = var_122_9

					if var_122_9 + var_122_2 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_9 + var_122_2
					end
				end

				arg_119_1.text_.text = var_122_6
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_101111", "101111030", "story_v_out_101111.awb") ~= 0 then
					local var_122_10 = manager.audio:GetVoiceLength("story_v_out_101111", "101111030", "story_v_out_101111.awb") / 1000

					if var_122_10 + var_122_2 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_10 + var_122_2
					end

					if var_122_5.prefab_name ~= "" and arg_119_1.actors_[var_122_5.prefab_name] ~= nil then
						local var_122_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_5.prefab_name].transform, "story_v_out_101111", "101111030", "story_v_out_101111.awb")

						arg_119_1:RecordAudio("101111030", var_122_11)
						arg_119_1:RecordAudio("101111030", var_122_11)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_101111", "101111030", "story_v_out_101111.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_101111", "101111030", "story_v_out_101111.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_12 = math.max(var_122_3, arg_119_1.talkMaxDuration)

			if var_122_2 <= arg_119_1.time_ and arg_119_1.time_ < var_122_2 + var_122_12 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_2) / var_122_12

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_2 + var_122_12 and arg_119_1.time_ < var_122_2 + var_122_12 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B02d"
	},
	voices = {
		"story_v_out_101111.awb"
	}
}
