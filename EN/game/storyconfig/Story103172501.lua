return {
	Play317251001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317251001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317251002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K11f"

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
				local var_4_5 = arg_1_1.bgs_.K11f

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
					if iter_4_0 ~= "K11f" then
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
			local var_4_23 = 0.6

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.733333333333333
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.825

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

				local var_4_33 = arg_1_1:GetWordFromCfg(317251001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 32
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
	Play317251002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317251002
		arg_7_1.duration_ = 5.833

		local var_7_0 = {
			zh = 5.833,
			ja = 5.1
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
				arg_7_0:Play317251003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "2079ui_story"

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

			local var_10_4 = arg_7_1.actors_["2079ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos2079ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.28, -5.6)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2079ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["2079ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect2079ui_story == nil then
				arg_7_1.var_.characterEffect2079ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect2079ui_story then
					arg_7_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect2079ui_story then
				arg_7_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_10_18 = 0
			local var_10_19 = 0.65

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_20 = arg_7_1:FormatText(StoryNameCfg[530].name)

				arg_7_1.leftNameTxt_.text = var_10_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_21 = arg_7_1:GetWordFromCfg(317251002)
				local var_10_22 = arg_7_1:FormatText(var_10_21.content)

				arg_7_1.text_.text = var_10_22

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_23 = 26
				local var_10_24 = utf8.len(var_10_22)
				local var_10_25 = var_10_23 <= 0 and var_10_19 or var_10_19 * (var_10_24 / var_10_23)

				if var_10_25 > 0 and var_10_19 < var_10_25 then
					arg_7_1.talkMaxDuration = var_10_25

					if var_10_25 + var_10_18 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_25 + var_10_18
					end
				end

				arg_7_1.text_.text = var_10_22
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251002", "story_v_out_317251.awb") ~= 0 then
					local var_10_26 = manager.audio:GetVoiceLength("story_v_out_317251", "317251002", "story_v_out_317251.awb") / 1000

					if var_10_26 + var_10_18 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_18
					end

					if var_10_21.prefab_name ~= "" and arg_7_1.actors_[var_10_21.prefab_name] ~= nil then
						local var_10_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_21.prefab_name].transform, "story_v_out_317251", "317251002", "story_v_out_317251.awb")

						arg_7_1:RecordAudio("317251002", var_10_27)
						arg_7_1:RecordAudio("317251002", var_10_27)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_317251", "317251002", "story_v_out_317251.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_317251", "317251002", "story_v_out_317251.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_28 = math.max(var_10_19, arg_7_1.talkMaxDuration)

			if var_10_18 <= arg_7_1.time_ and arg_7_1.time_ < var_10_18 + var_10_28 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_18) / var_10_28

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_18 + var_10_28 and arg_7_1.time_ < var_10_18 + var_10_28 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play317251003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317251003
		arg_11_1.duration_ = 3.433

		local var_11_0 = {
			zh = 3.433,
			ja = 3.133
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
				arg_11_0:Play317251004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "2078ui_story"

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

			local var_14_4 = arg_11_1.actors_["2078ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos2078ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -1.28, -5.6)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2078ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["2078ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect2078ui_story == nil then
				arg_11_1.var_.characterEffect2078ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect2078ui_story then
					arg_11_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect2078ui_story then
				arg_11_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_19 = arg_11_1.actors_["2079ui_story"].transform
			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.var_.moveOldPos2079ui_story = var_14_19.localPosition
			end

			local var_14_21 = 0.001

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_20) / var_14_21
				local var_14_23 = Vector3.New(0, 100, 0)

				var_14_19.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2079ui_story, var_14_23, var_14_22)

				local var_14_24 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_24.x, var_14_24.y, var_14_24.z)

				local var_14_25 = var_14_19.localEulerAngles

				var_14_25.z = 0
				var_14_25.x = 0
				var_14_19.localEulerAngles = var_14_25
			end

			if arg_11_1.time_ >= var_14_20 + var_14_21 and arg_11_1.time_ < var_14_20 + var_14_21 + arg_14_0 then
				var_14_19.localPosition = Vector3.New(0, 100, 0)

				local var_14_26 = manager.ui.mainCamera.transform.position - var_14_19.position

				var_14_19.forward = Vector3.New(var_14_26.x, var_14_26.y, var_14_26.z)

				local var_14_27 = var_14_19.localEulerAngles

				var_14_27.z = 0
				var_14_27.x = 0
				var_14_19.localEulerAngles = var_14_27
			end

			local var_14_28 = 0
			local var_14_29 = 0.375

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_30 = arg_11_1:FormatText(StoryNameCfg[528].name)

				arg_11_1.leftNameTxt_.text = var_14_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_31 = arg_11_1:GetWordFromCfg(317251003)
				local var_14_32 = arg_11_1:FormatText(var_14_31.content)

				arg_11_1.text_.text = var_14_32

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_33 = 15
				local var_14_34 = utf8.len(var_14_32)
				local var_14_35 = var_14_33 <= 0 and var_14_29 or var_14_29 * (var_14_34 / var_14_33)

				if var_14_35 > 0 and var_14_29 < var_14_35 then
					arg_11_1.talkMaxDuration = var_14_35

					if var_14_35 + var_14_28 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_35 + var_14_28
					end
				end

				arg_11_1.text_.text = var_14_32
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251003", "story_v_out_317251.awb") ~= 0 then
					local var_14_36 = manager.audio:GetVoiceLength("story_v_out_317251", "317251003", "story_v_out_317251.awb") / 1000

					if var_14_36 + var_14_28 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_36 + var_14_28
					end

					if var_14_31.prefab_name ~= "" and arg_11_1.actors_[var_14_31.prefab_name] ~= nil then
						local var_14_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_31.prefab_name].transform, "story_v_out_317251", "317251003", "story_v_out_317251.awb")

						arg_11_1:RecordAudio("317251003", var_14_37)
						arg_11_1:RecordAudio("317251003", var_14_37)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_317251", "317251003", "story_v_out_317251.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_317251", "317251003", "story_v_out_317251.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_38 = math.max(var_14_29, arg_11_1.talkMaxDuration)

			if var_14_28 <= arg_11_1.time_ and arg_11_1.time_ < var_14_28 + var_14_38 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_28) / var_14_38

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_28 + var_14_38 and arg_11_1.time_ < var_14_28 + var_14_38 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play317251004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317251004
		arg_15_1.duration_ = 5.2

		local var_15_0 = {
			zh = 5.2,
			ja = 4.833
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
				arg_15_0:Play317251005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["2079ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos2079ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -1.28, -5.6)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos2079ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["2079ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect2079ui_story == nil then
				arg_15_1.var_.characterEffect2079ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect2079ui_story then
					arg_15_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect2079ui_story then
				arg_15_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_18_14 = arg_15_1.actors_["2078ui_story"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos2078ui_story = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0, 100, 0)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos2078ui_story, var_18_18, var_18_17)

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

			local var_18_23 = 0
			local var_18_24 = 0.475

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_25 = arg_15_1:FormatText(StoryNameCfg[530].name)

				arg_15_1.leftNameTxt_.text = var_18_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_26 = arg_15_1:GetWordFromCfg(317251004)
				local var_18_27 = arg_15_1:FormatText(var_18_26.content)

				arg_15_1.text_.text = var_18_27

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_28 = 19
				local var_18_29 = utf8.len(var_18_27)
				local var_18_30 = var_18_28 <= 0 and var_18_24 or var_18_24 * (var_18_29 / var_18_28)

				if var_18_30 > 0 and var_18_24 < var_18_30 then
					arg_15_1.talkMaxDuration = var_18_30

					if var_18_30 + var_18_23 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_30 + var_18_23
					end
				end

				arg_15_1.text_.text = var_18_27
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251004", "story_v_out_317251.awb") ~= 0 then
					local var_18_31 = manager.audio:GetVoiceLength("story_v_out_317251", "317251004", "story_v_out_317251.awb") / 1000

					if var_18_31 + var_18_23 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_31 + var_18_23
					end

					if var_18_26.prefab_name ~= "" and arg_15_1.actors_[var_18_26.prefab_name] ~= nil then
						local var_18_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_26.prefab_name].transform, "story_v_out_317251", "317251004", "story_v_out_317251.awb")

						arg_15_1:RecordAudio("317251004", var_18_32)
						arg_15_1:RecordAudio("317251004", var_18_32)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317251", "317251004", "story_v_out_317251.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317251", "317251004", "story_v_out_317251.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_33 = math.max(var_18_24, arg_15_1.talkMaxDuration)

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_33 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_23) / var_18_33

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_23 + var_18_33 and arg_15_1.time_ < var_18_23 + var_18_33 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play317251005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317251005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play317251006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["2079ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos2079ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos2079ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, 100, 0)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = 0
			local var_22_10 = 0.75

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_11 = arg_19_1:GetWordFromCfg(317251005)
				local var_22_12 = arg_19_1:FormatText(var_22_11.content)

				arg_19_1.text_.text = var_22_12

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_13 = 30
				local var_22_14 = utf8.len(var_22_12)
				local var_22_15 = var_22_13 <= 0 and var_22_10 or var_22_10 * (var_22_14 / var_22_13)

				if var_22_15 > 0 and var_22_10 < var_22_15 then
					arg_19_1.talkMaxDuration = var_22_15

					if var_22_15 + var_22_9 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_15 + var_22_9
					end
				end

				arg_19_1.text_.text = var_22_12
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_10, arg_19_1.talkMaxDuration)

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_9) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_9 + var_22_16 and arg_19_1.time_ < var_22_9 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317251006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317251006
		arg_23_1.duration_ = 3.066

		local var_23_0 = {
			zh = 2.733,
			ja = 3.066
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
				arg_23_0:Play317251007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["2078ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos2078ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos2078ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, 100, 0)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["2078ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect2078ui_story == nil then
				arg_23_1.var_.characterEffect2078ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect2078ui_story then
					local var_26_13 = Mathf.Lerp(0, 0.5, var_26_12)

					arg_23_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_23_1.var_.characterEffect2078ui_story.fillRatio = var_26_13
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect2078ui_story then
				local var_26_14 = 0.5

				arg_23_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_23_1.var_.characterEffect2078ui_story.fillRatio = var_26_14
			end

			local var_26_15 = arg_23_1.actors_["2079ui_story"].transform
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.var_.moveOldPos2079ui_story = var_26_15.localPosition
			end

			local var_26_17 = 0.001

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Vector3.New(0, -1.28, -5.6)

				var_26_15.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos2079ui_story, var_26_19, var_26_18)

				local var_26_20 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_20.x, var_26_20.y, var_26_20.z)

				local var_26_21 = var_26_15.localEulerAngles

				var_26_21.z = 0
				var_26_21.x = 0
				var_26_15.localEulerAngles = var_26_21
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				var_26_15.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_26_22 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_22.x, var_26_22.y, var_26_22.z)

				local var_26_23 = var_26_15.localEulerAngles

				var_26_23.z = 0
				var_26_23.x = 0
				var_26_15.localEulerAngles = var_26_23
			end

			local var_26_24 = arg_23_1.actors_["2079ui_story"]
			local var_26_25 = 0

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 and arg_23_1.var_.characterEffect2079ui_story == nil then
				arg_23_1.var_.characterEffect2079ui_story = var_26_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_26 = 0.200000002980232

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_26 then
				local var_26_27 = (arg_23_1.time_ - var_26_25) / var_26_26

				if arg_23_1.var_.characterEffect2079ui_story then
					arg_23_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_25 + var_26_26 and arg_23_1.time_ < var_26_25 + var_26_26 + arg_26_0 and arg_23_1.var_.characterEffect2079ui_story then
				arg_23_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_26_28 = 0

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				arg_23_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_30 = 0
			local var_26_31 = 0.3

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_32 = arg_23_1:FormatText(StoryNameCfg[529].name)

				arg_23_1.leftNameTxt_.text = var_26_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_33 = arg_23_1:GetWordFromCfg(317251006)
				local var_26_34 = arg_23_1:FormatText(var_26_33.content)

				arg_23_1.text_.text = var_26_34

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_35 = 12
				local var_26_36 = utf8.len(var_26_34)
				local var_26_37 = var_26_35 <= 0 and var_26_31 or var_26_31 * (var_26_36 / var_26_35)

				if var_26_37 > 0 and var_26_31 < var_26_37 then
					arg_23_1.talkMaxDuration = var_26_37

					if var_26_37 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_37 + var_26_30
					end
				end

				arg_23_1.text_.text = var_26_34
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251006", "story_v_out_317251.awb") ~= 0 then
					local var_26_38 = manager.audio:GetVoiceLength("story_v_out_317251", "317251006", "story_v_out_317251.awb") / 1000

					if var_26_38 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_38 + var_26_30
					end

					if var_26_33.prefab_name ~= "" and arg_23_1.actors_[var_26_33.prefab_name] ~= nil then
						local var_26_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_33.prefab_name].transform, "story_v_out_317251", "317251006", "story_v_out_317251.awb")

						arg_23_1:RecordAudio("317251006", var_26_39)
						arg_23_1:RecordAudio("317251006", var_26_39)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_317251", "317251006", "story_v_out_317251.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_317251", "317251006", "story_v_out_317251.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_40 = math.max(var_26_31, arg_23_1.talkMaxDuration)

			if var_26_30 <= arg_23_1.time_ and arg_23_1.time_ < var_26_30 + var_26_40 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_30) / var_26_40

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_30 + var_26_40 and arg_23_1.time_ < var_26_30 + var_26_40 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play317251007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317251007
		arg_27_1.duration_ = 7.566

		local var_27_0 = {
			zh = 5.466,
			ja = 7.566
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
				arg_27_0:Play317251008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.725

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[529].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(317251007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 29
				local var_30_6 = utf8.len(var_30_4)
				local var_30_7 = var_30_5 <= 0 and var_30_1 or var_30_1 * (var_30_6 / var_30_5)

				if var_30_7 > 0 and var_30_1 < var_30_7 then
					arg_27_1.talkMaxDuration = var_30_7

					if var_30_7 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_7 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_4
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251007", "story_v_out_317251.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251007", "story_v_out_317251.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_317251", "317251007", "story_v_out_317251.awb")

						arg_27_1:RecordAudio("317251007", var_30_9)
						arg_27_1:RecordAudio("317251007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_317251", "317251007", "story_v_out_317251.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_317251", "317251007", "story_v_out_317251.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_10 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_10 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_10

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_10 and arg_27_1.time_ < var_30_0 + var_30_10 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play317251008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 317251008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play317251009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["2079ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos2079ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos2079ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, 100, 0)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = 0
			local var_34_10 = 0.6

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 then
				local var_34_11 = "play"
				local var_34_12 = "music"

				arg_31_1:AudioAction(var_34_11, var_34_12, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_34_13 = 0
			local var_34_14 = 0.775

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_15 = arg_31_1:GetWordFromCfg(317251008)
				local var_34_16 = arg_31_1:FormatText(var_34_15.content)

				arg_31_1.text_.text = var_34_16

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_17 = 31
				local var_34_18 = utf8.len(var_34_16)
				local var_34_19 = var_34_17 <= 0 and var_34_14 or var_34_14 * (var_34_18 / var_34_17)

				if var_34_19 > 0 and var_34_14 < var_34_19 then
					arg_31_1.talkMaxDuration = var_34_19

					if var_34_19 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_13
					end
				end

				arg_31_1.text_.text = var_34_16
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_20 = math.max(var_34_14, arg_31_1.talkMaxDuration)

			if var_34_13 <= arg_31_1.time_ and arg_31_1.time_ < var_34_13 + var_34_20 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_13) / var_34_20

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_13 + var_34_20 and arg_31_1.time_ < var_34_13 + var_34_20 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play317251009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317251009
		arg_35_1.duration_ = 9

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play317251010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "K12f"

			if arg_35_1.bgs_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(arg_35_1.paintGo_)

				var_38_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_38_0)
				var_38_1.name = var_38_0
				var_38_1.transform.parent = arg_35_1.stage_.transform
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.bgs_[var_38_0] = var_38_1
			end

			local var_38_2 = 2

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 then
				local var_38_3 = manager.ui.mainCamera.transform.localPosition
				local var_38_4 = Vector3.New(0, 0, 10) + Vector3.New(var_38_3.x, var_38_3.y, 0)
				local var_38_5 = arg_35_1.bgs_.K12f

				var_38_5.transform.localPosition = var_38_4
				var_38_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_38_6 = var_38_5:GetComponent("SpriteRenderer")

				if var_38_6 and var_38_6.sprite then
					local var_38_7 = (var_38_5.transform.localPosition - var_38_3).z
					local var_38_8 = manager.ui.mainCameraCom_
					local var_38_9 = 2 * var_38_7 * Mathf.Tan(var_38_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_38_10 = var_38_9 * var_38_8.aspect
					local var_38_11 = var_38_6.sprite.bounds.size.x
					local var_38_12 = var_38_6.sprite.bounds.size.y
					local var_38_13 = var_38_10 / var_38_11
					local var_38_14 = var_38_9 / var_38_12
					local var_38_15 = var_38_14 < var_38_13 and var_38_13 or var_38_14

					var_38_5.transform.localScale = Vector3.New(var_38_15, var_38_15, 0)
				end

				for iter_38_0, iter_38_1 in pairs(arg_35_1.bgs_) do
					if iter_38_0 ~= "K12f" then
						iter_38_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_17 = 2

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Color.New(0, 0, 0)

				var_38_19.a = Mathf.Lerp(0, 1, var_38_18)
				arg_35_1.mask_.color = var_38_19
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				local var_38_20 = Color.New(0, 0, 0)

				var_38_20.a = 1
				arg_35_1.mask_.color = var_38_20
			end

			local var_38_21 = 2

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_22 = 2

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22
				local var_38_24 = Color.New(0, 0, 0)

				var_38_24.a = Mathf.Lerp(1, 0, var_38_23)
				arg_35_1.mask_.color = var_38_24
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 then
				local var_38_25 = Color.New(0, 0, 0)
				local var_38_26 = 0

				arg_35_1.mask_.enabled = false
				var_38_25.a = var_38_26
				arg_35_1.mask_.color = var_38_25
			end

			local var_38_27 = 0
			local var_38_28 = 1

			if var_38_27 < arg_35_1.time_ and arg_35_1.time_ <= var_38_27 + arg_38_0 then
				local var_38_29 = "play"
				local var_38_30 = "music"

				arg_35_1:AudioAction(var_38_29, var_38_30, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_38_31 = 3.55
			local var_38_32 = 1

			if var_38_31 < arg_35_1.time_ and arg_35_1.time_ <= var_38_31 + arg_38_0 then
				local var_38_33 = "play"
				local var_38_34 = "music"

				arg_35_1:AudioAction(var_38_33, var_38_34, "bgm_activity_2_6_story_biwuchang", "bgm_activity_2_6_story_biwuchang", "bgm_activity_2_6_story_biwuchang.awb")
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_35 = 4
			local var_38_36 = 0.55

			if var_38_35 < arg_35_1.time_ and arg_35_1.time_ <= var_38_35 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_37 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_37:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_38 = arg_35_1:GetWordFromCfg(317251009)
				local var_38_39 = arg_35_1:FormatText(var_38_38.content)

				arg_35_1.text_.text = var_38_39

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_40 = 22
				local var_38_41 = utf8.len(var_38_39)
				local var_38_42 = var_38_40 <= 0 and var_38_36 or var_38_36 * (var_38_41 / var_38_40)

				if var_38_42 > 0 and var_38_36 < var_38_42 then
					arg_35_1.talkMaxDuration = var_38_42
					var_38_35 = var_38_35 + 0.3

					if var_38_42 + var_38_35 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_42 + var_38_35
					end
				end

				arg_35_1.text_.text = var_38_39
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_43 = var_38_35 + 0.3
			local var_38_44 = math.max(var_38_36, arg_35_1.talkMaxDuration)

			if var_38_43 <= arg_35_1.time_ and arg_35_1.time_ < var_38_43 + var_38_44 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_43) / var_38_44

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_43 + var_38_44 and arg_35_1.time_ < var_38_43 + var_38_44 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play317251010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 317251010
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play317251011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.2

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				local var_44_2 = "play"
				local var_44_3 = "music"

				arg_41_1:AudioAction(var_44_2, var_44_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_44_4 = 0.325
			local var_44_5 = 1

			if var_44_4 < arg_41_1.time_ and arg_41_1.time_ <= var_44_4 + arg_44_0 then
				local var_44_6 = "play"
				local var_44_7 = "music"

				arg_41_1:AudioAction(var_44_6, var_44_7, "bgm_activity_2_6_story_biwuchang", "bgm_activity_2_6_story_biwuchang", "bgm_activity_2_6_story_biwuchang.awb")
			end

			local var_44_8 = 0
			local var_44_9 = 1.325

			if var_44_8 < arg_41_1.time_ and arg_41_1.time_ <= var_44_8 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_10 = arg_41_1:GetWordFromCfg(317251010)
				local var_44_11 = arg_41_1:FormatText(var_44_10.content)

				arg_41_1.text_.text = var_44_11

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_12 = 53
				local var_44_13 = utf8.len(var_44_11)
				local var_44_14 = var_44_12 <= 0 and var_44_9 or var_44_9 * (var_44_13 / var_44_12)

				if var_44_14 > 0 and var_44_9 < var_44_14 then
					arg_41_1.talkMaxDuration = var_44_14

					if var_44_14 + var_44_8 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_14 + var_44_8
					end
				end

				arg_41_1.text_.text = var_44_11
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_15 = math.max(var_44_9, arg_41_1.talkMaxDuration)

			if var_44_8 <= arg_41_1.time_ and arg_41_1.time_ < var_44_8 + var_44_15 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_8) / var_44_15

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_8 + var_44_15 and arg_41_1.time_ < var_44_8 + var_44_15 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play317251011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 317251011
		arg_45_1.duration_ = 1.999999999999

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play317251012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = "1158ui_story"

			if arg_45_1.actors_[var_48_0] == nil then
				local var_48_1 = Object.Instantiate(Asset.Load("Char/" .. var_48_0), arg_45_1.stage_.transform)

				var_48_1.name = var_48_0
				var_48_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.actors_[var_48_0] = var_48_1

				local var_48_2 = var_48_1:GetComponentInChildren(typeof(CharacterEffect))

				var_48_2.enabled = true

				local var_48_3 = GameObjectTools.GetOrAddComponent(var_48_1, typeof(DynamicBoneHelper))

				if var_48_3 then
					var_48_3:EnableDynamicBone(false)
				end

				arg_45_1:ShowWeapon(var_48_2.transform, false)

				arg_45_1.var_[var_48_0 .. "Animator"] = var_48_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_45_1.var_[var_48_0 .. "Animator"].applyRootMotion = true
				arg_45_1.var_[var_48_0 .. "LipSync"] = var_48_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_48_4 = arg_45_1.actors_["1158ui_story"].transform
			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1.var_.moveOldPos1158ui_story = var_48_4.localPosition
			end

			local var_48_6 = 0.001

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6
				local var_48_8 = Vector3.New(0, -0.95, -6)

				var_48_4.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1158ui_story, var_48_8, var_48_7)

				local var_48_9 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_9.x, var_48_9.y, var_48_9.z)

				local var_48_10 = var_48_4.localEulerAngles

				var_48_10.z = 0
				var_48_10.x = 0
				var_48_4.localEulerAngles = var_48_10
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 then
				var_48_4.localPosition = Vector3.New(0, -0.95, -6)

				local var_48_11 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_11.x, var_48_11.y, var_48_11.z)

				local var_48_12 = var_48_4.localEulerAngles

				var_48_12.z = 0
				var_48_12.x = 0
				var_48_4.localEulerAngles = var_48_12
			end

			local var_48_13 = arg_45_1.actors_["1158ui_story"]
			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 and arg_45_1.var_.characterEffect1158ui_story == nil then
				arg_45_1.var_.characterEffect1158ui_story = var_48_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_15 = 0.200000002980232

			if var_48_14 <= arg_45_1.time_ and arg_45_1.time_ < var_48_14 + var_48_15 then
				local var_48_16 = (arg_45_1.time_ - var_48_14) / var_48_15

				if arg_45_1.var_.characterEffect1158ui_story then
					arg_45_1.var_.characterEffect1158ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_14 + var_48_15 and arg_45_1.time_ < var_48_14 + var_48_15 + arg_48_0 and arg_45_1.var_.characterEffect1158ui_story then
				arg_45_1.var_.characterEffect1158ui_story.fillFlat = false
			end

			local var_48_17 = 0

			if var_48_17 < arg_45_1.time_ and arg_45_1.time_ <= var_48_17 + arg_48_0 then
				arg_45_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/story1158/story1158action/1158action1_1")
			end

			local var_48_18 = 0

			if var_48_18 < arg_45_1.time_ and arg_45_1.time_ <= var_48_18 + arg_48_0 then
				arg_45_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_48_19 = 0
			local var_48_20 = 0.175

			if var_48_19 < arg_45_1.time_ and arg_45_1.time_ <= var_48_19 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_21 = arg_45_1:FormatText(StoryNameCfg[92].name)

				arg_45_1.leftNameTxt_.text = var_48_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_22 = arg_45_1:GetWordFromCfg(317251011)
				local var_48_23 = arg_45_1:FormatText(var_48_22.content)

				arg_45_1.text_.text = var_48_23

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_24 = 7
				local var_48_25 = utf8.len(var_48_23)
				local var_48_26 = var_48_24 <= 0 and var_48_20 or var_48_20 * (var_48_25 / var_48_24)

				if var_48_26 > 0 and var_48_20 < var_48_26 then
					arg_45_1.talkMaxDuration = var_48_26

					if var_48_26 + var_48_19 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_26 + var_48_19
					end
				end

				arg_45_1.text_.text = var_48_23
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251011", "story_v_out_317251.awb") ~= 0 then
					local var_48_27 = manager.audio:GetVoiceLength("story_v_out_317251", "317251011", "story_v_out_317251.awb") / 1000

					if var_48_27 + var_48_19 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_27 + var_48_19
					end

					if var_48_22.prefab_name ~= "" and arg_45_1.actors_[var_48_22.prefab_name] ~= nil then
						local var_48_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_22.prefab_name].transform, "story_v_out_317251", "317251011", "story_v_out_317251.awb")

						arg_45_1:RecordAudio("317251011", var_48_28)
						arg_45_1:RecordAudio("317251011", var_48_28)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_317251", "317251011", "story_v_out_317251.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_317251", "317251011", "story_v_out_317251.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_29 = math.max(var_48_20, arg_45_1.talkMaxDuration)

			if var_48_19 <= arg_45_1.time_ and arg_45_1.time_ < var_48_19 + var_48_29 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_19) / var_48_29

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_19 + var_48_29 and arg_45_1.time_ < var_48_19 + var_48_29 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play317251012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 317251012
		arg_49_1.duration_ = 2.866

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play317251013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = "ST58"

			if arg_49_1.bgs_[var_52_0] == nil then
				local var_52_1 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_0)
				var_52_1.name = var_52_0
				var_52_1.transform.parent = arg_49_1.stage_.transform
				var_52_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_0] = var_52_1
			end

			local var_52_2 = 0

			if var_52_2 < arg_49_1.time_ and arg_49_1.time_ <= var_52_2 + arg_52_0 then
				local var_52_3 = manager.ui.mainCamera.transform.localPosition
				local var_52_4 = Vector3.New(0, 0, 10) + Vector3.New(var_52_3.x, var_52_3.y, 0)
				local var_52_5 = arg_49_1.bgs_.ST58

				var_52_5.transform.localPosition = var_52_4
				var_52_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_6 = var_52_5:GetComponent("SpriteRenderer")

				if var_52_6 and var_52_6.sprite then
					local var_52_7 = (var_52_5.transform.localPosition - var_52_3).z
					local var_52_8 = manager.ui.mainCameraCom_
					local var_52_9 = 2 * var_52_7 * Mathf.Tan(var_52_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_10 = var_52_9 * var_52_8.aspect
					local var_52_11 = var_52_6.sprite.bounds.size.x
					local var_52_12 = var_52_6.sprite.bounds.size.y
					local var_52_13 = var_52_10 / var_52_11
					local var_52_14 = var_52_9 / var_52_12
					local var_52_15 = var_52_14 < var_52_13 and var_52_13 or var_52_14

					var_52_5.transform.localScale = Vector3.New(var_52_15, var_52_15, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "ST58" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_16 = arg_49_1.actors_["1158ui_story"].transform
			local var_52_17 = 0

			if var_52_17 < arg_49_1.time_ and arg_49_1.time_ <= var_52_17 + arg_52_0 then
				arg_49_1.var_.moveOldPos1158ui_story = var_52_16.localPosition
			end

			local var_52_18 = 0.001

			if var_52_17 <= arg_49_1.time_ and arg_49_1.time_ < var_52_17 + var_52_18 then
				local var_52_19 = (arg_49_1.time_ - var_52_17) / var_52_18
				local var_52_20 = Vector3.New(0, 100, 0)

				var_52_16.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1158ui_story, var_52_20, var_52_19)

				local var_52_21 = manager.ui.mainCamera.transform.position - var_52_16.position

				var_52_16.forward = Vector3.New(var_52_21.x, var_52_21.y, var_52_21.z)

				local var_52_22 = var_52_16.localEulerAngles

				var_52_22.z = 0
				var_52_22.x = 0
				var_52_16.localEulerAngles = var_52_22
			end

			if arg_49_1.time_ >= var_52_17 + var_52_18 and arg_49_1.time_ < var_52_17 + var_52_18 + arg_52_0 then
				var_52_16.localPosition = Vector3.New(0, 100, 0)

				local var_52_23 = manager.ui.mainCamera.transform.position - var_52_16.position

				var_52_16.forward = Vector3.New(var_52_23.x, var_52_23.y, var_52_23.z)

				local var_52_24 = var_52_16.localEulerAngles

				var_52_24.z = 0
				var_52_24.x = 0
				var_52_16.localEulerAngles = var_52_24
			end

			local var_52_25 = arg_49_1.actors_["1158ui_story"]
			local var_52_26 = 0

			if var_52_26 < arg_49_1.time_ and arg_49_1.time_ <= var_52_26 + arg_52_0 and arg_49_1.var_.characterEffect1158ui_story == nil then
				arg_49_1.var_.characterEffect1158ui_story = var_52_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_27 = 0.200000002980232

			if var_52_26 <= arg_49_1.time_ and arg_49_1.time_ < var_52_26 + var_52_27 then
				local var_52_28 = (arg_49_1.time_ - var_52_26) / var_52_27

				if arg_49_1.var_.characterEffect1158ui_story then
					local var_52_29 = Mathf.Lerp(0, 0.5, var_52_28)

					arg_49_1.var_.characterEffect1158ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1158ui_story.fillRatio = var_52_29
				end
			end

			if arg_49_1.time_ >= var_52_26 + var_52_27 and arg_49_1.time_ < var_52_26 + var_52_27 + arg_52_0 and arg_49_1.var_.characterEffect1158ui_story then
				local var_52_30 = 0.5

				arg_49_1.var_.characterEffect1158ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1158ui_story.fillRatio = var_52_30
			end

			local var_52_31 = "1049ui_story"

			if arg_49_1.actors_[var_52_31] == nil then
				local var_52_32 = Object.Instantiate(Asset.Load("Char/" .. var_52_31), arg_49_1.stage_.transform)

				var_52_32.name = var_52_31
				var_52_32.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.actors_[var_52_31] = var_52_32

				local var_52_33 = var_52_32:GetComponentInChildren(typeof(CharacterEffect))

				var_52_33.enabled = true

				local var_52_34 = GameObjectTools.GetOrAddComponent(var_52_32, typeof(DynamicBoneHelper))

				if var_52_34 then
					var_52_34:EnableDynamicBone(false)
				end

				arg_49_1:ShowWeapon(var_52_33.transform, false)

				arg_49_1.var_[var_52_31 .. "Animator"] = var_52_33.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_49_1.var_[var_52_31 .. "Animator"].applyRootMotion = true
				arg_49_1.var_[var_52_31 .. "LipSync"] = var_52_33.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_52_35 = arg_49_1.actors_["1049ui_story"].transform
			local var_52_36 = 0

			if var_52_36 < arg_49_1.time_ and arg_49_1.time_ <= var_52_36 + arg_52_0 then
				arg_49_1.var_.moveOldPos1049ui_story = var_52_35.localPosition
			end

			local var_52_37 = 0.001

			if var_52_36 <= arg_49_1.time_ and arg_49_1.time_ < var_52_36 + var_52_37 then
				local var_52_38 = (arg_49_1.time_ - var_52_36) / var_52_37
				local var_52_39 = Vector3.New(0, -1.2, -6)

				var_52_35.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1049ui_story, var_52_39, var_52_38)

				local var_52_40 = manager.ui.mainCamera.transform.position - var_52_35.position

				var_52_35.forward = Vector3.New(var_52_40.x, var_52_40.y, var_52_40.z)

				local var_52_41 = var_52_35.localEulerAngles

				var_52_41.z = 0
				var_52_41.x = 0
				var_52_35.localEulerAngles = var_52_41
			end

			if arg_49_1.time_ >= var_52_36 + var_52_37 and arg_49_1.time_ < var_52_36 + var_52_37 + arg_52_0 then
				var_52_35.localPosition = Vector3.New(0, -1.2, -6)

				local var_52_42 = manager.ui.mainCamera.transform.position - var_52_35.position

				var_52_35.forward = Vector3.New(var_52_42.x, var_52_42.y, var_52_42.z)

				local var_52_43 = var_52_35.localEulerAngles

				var_52_43.z = 0
				var_52_43.x = 0
				var_52_35.localEulerAngles = var_52_43
			end

			local var_52_44 = arg_49_1.actors_["1049ui_story"]
			local var_52_45 = 0

			if var_52_45 < arg_49_1.time_ and arg_49_1.time_ <= var_52_45 + arg_52_0 and arg_49_1.var_.characterEffect1049ui_story == nil then
				arg_49_1.var_.characterEffect1049ui_story = var_52_44:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_46 = 0.200000002980232

			if var_52_45 <= arg_49_1.time_ and arg_49_1.time_ < var_52_45 + var_52_46 then
				local var_52_47 = (arg_49_1.time_ - var_52_45) / var_52_46

				if arg_49_1.var_.characterEffect1049ui_story then
					arg_49_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_45 + var_52_46 and arg_49_1.time_ < var_52_45 + var_52_46 + arg_52_0 and arg_49_1.var_.characterEffect1049ui_story then
				arg_49_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_52_48 = 0

			if var_52_48 < arg_49_1.time_ and arg_49_1.time_ <= var_52_48 + arg_52_0 then
				arg_49_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_52_49 = 0

			if var_52_49 < arg_49_1.time_ and arg_49_1.time_ <= var_52_49 + arg_52_0 then
				arg_49_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_52_50 = 0

			if var_52_50 < arg_49_1.time_ and arg_49_1.time_ <= var_52_50 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_51 = 1

			if var_52_50 <= arg_49_1.time_ and arg_49_1.time_ < var_52_50 + var_52_51 then
				local var_52_52 = (arg_49_1.time_ - var_52_50) / var_52_51
				local var_52_53 = Color.New(1, 1, 1)

				var_52_53.a = Mathf.Lerp(1, 0, var_52_52)
				arg_49_1.mask_.color = var_52_53
			end

			if arg_49_1.time_ >= var_52_50 + var_52_51 and arg_49_1.time_ < var_52_50 + var_52_51 + arg_52_0 then
				local var_52_54 = Color.New(1, 1, 1)
				local var_52_55 = 0

				arg_49_1.mask_.enabled = false
				var_52_54.a = var_52_55
				arg_49_1.mask_.color = var_52_54
			end

			local var_52_56 = 0

			if var_52_56 < arg_49_1.time_ and arg_49_1.time_ <= var_52_56 + arg_52_0 then
				arg_49_1.screenFilterGo_:SetActive(true)

				arg_49_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_52_57 = 0.0166666666666667

			if var_52_56 <= arg_49_1.time_ and arg_49_1.time_ < var_52_56 + var_52_57 then
				local var_52_58 = (arg_49_1.time_ - var_52_56) / var_52_57

				arg_49_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_52_58)
			end

			if arg_49_1.time_ >= var_52_56 + var_52_57 and arg_49_1.time_ < var_52_56 + var_52_57 + arg_52_0 then
				arg_49_1.screenFilterEffect_.weight = 1
			end

			if arg_49_1.frameCnt_ <= 1 then
				arg_49_1.dialog_:SetActive(false)
			end

			local var_52_59 = 1
			local var_52_60 = 0.175

			if var_52_59 < arg_49_1.time_ and arg_49_1.time_ <= var_52_59 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_61 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_61:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_62 = arg_49_1:FormatText(StoryNameCfg[562].name)

				arg_49_1.leftNameTxt_.text = var_52_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_63 = arg_49_1:GetWordFromCfg(317251012)
				local var_52_64 = arg_49_1:FormatText(var_52_63.content)

				arg_49_1.text_.text = var_52_64

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_65 = 7
				local var_52_66 = utf8.len(var_52_64)
				local var_52_67 = var_52_65 <= 0 and var_52_60 or var_52_60 * (var_52_66 / var_52_65)

				if var_52_67 > 0 and var_52_60 < var_52_67 then
					arg_49_1.talkMaxDuration = var_52_67
					var_52_59 = var_52_59 + 0.3

					if var_52_67 + var_52_59 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_67 + var_52_59
					end
				end

				arg_49_1.text_.text = var_52_64
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251012", "story_v_out_317251.awb") ~= 0 then
					local var_52_68 = manager.audio:GetVoiceLength("story_v_out_317251", "317251012", "story_v_out_317251.awb") / 1000

					if var_52_68 + var_52_59 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_68 + var_52_59
					end

					if var_52_63.prefab_name ~= "" and arg_49_1.actors_[var_52_63.prefab_name] ~= nil then
						local var_52_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_63.prefab_name].transform, "story_v_out_317251", "317251012", "story_v_out_317251.awb")

						arg_49_1:RecordAudio("317251012", var_52_69)
						arg_49_1:RecordAudio("317251012", var_52_69)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_317251", "317251012", "story_v_out_317251.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_317251", "317251012", "story_v_out_317251.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_70 = var_52_59 + 0.3
			local var_52_71 = math.max(var_52_60, arg_49_1.talkMaxDuration)

			if var_52_70 <= arg_49_1.time_ and arg_49_1.time_ < var_52_70 + var_52_71 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_70) / var_52_71

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_70 + var_52_71 and arg_49_1.time_ < var_52_70 + var_52_71 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play317251013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317251013
		arg_55_1.duration_ = 2.066

		local var_55_0 = {
			zh = 2.066,
			ja = 1.999999999999
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
				arg_55_0:Play317251014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1158ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1158ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, -0.95, -6)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1158ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -0.95, -6)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1158ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1158ui_story == nil then
				arg_55_1.var_.characterEffect1158ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1158ui_story then
					arg_55_1.var_.characterEffect1158ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1158ui_story then
				arg_55_1.var_.characterEffect1158ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/story1158/story1158action/1158action1_1")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_58_15 = arg_55_1.actors_["1049ui_story"].transform
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.var_.moveOldPos1049ui_story = var_58_15.localPosition
			end

			local var_58_17 = 0.001

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Vector3.New(0, 100, 0)

				var_58_15.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1049ui_story, var_58_19, var_58_18)

				local var_58_20 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_20.x, var_58_20.y, var_58_20.z)

				local var_58_21 = var_58_15.localEulerAngles

				var_58_21.z = 0
				var_58_21.x = 0
				var_58_15.localEulerAngles = var_58_21
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 then
				var_58_15.localPosition = Vector3.New(0, 100, 0)

				local var_58_22 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_22.x, var_58_22.y, var_58_22.z)

				local var_58_23 = var_58_15.localEulerAngles

				var_58_23.z = 0
				var_58_23.x = 0
				var_58_15.localEulerAngles = var_58_23
			end

			local var_58_24 = arg_55_1.actors_["1049ui_story"]
			local var_58_25 = 0

			if var_58_25 < arg_55_1.time_ and arg_55_1.time_ <= var_58_25 + arg_58_0 and arg_55_1.var_.characterEffect1049ui_story == nil then
				arg_55_1.var_.characterEffect1049ui_story = var_58_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_26 = 0.200000002980232

			if var_58_25 <= arg_55_1.time_ and arg_55_1.time_ < var_58_25 + var_58_26 then
				local var_58_27 = (arg_55_1.time_ - var_58_25) / var_58_26

				if arg_55_1.var_.characterEffect1049ui_story then
					local var_58_28 = Mathf.Lerp(0, 0.5, var_58_27)

					arg_55_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1049ui_story.fillRatio = var_58_28
				end
			end

			if arg_55_1.time_ >= var_58_25 + var_58_26 and arg_55_1.time_ < var_58_25 + var_58_26 + arg_58_0 and arg_55_1.var_.characterEffect1049ui_story then
				local var_58_29 = 0.5

				arg_55_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1049ui_story.fillRatio = var_58_29
			end

			local var_58_30 = 0

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				local var_58_31 = manager.ui.mainCamera.transform.localPosition
				local var_58_32 = Vector3.New(0, 0, 10) + Vector3.New(var_58_31.x, var_58_31.y, 0)
				local var_58_33 = arg_55_1.bgs_.K12f

				var_58_33.transform.localPosition = var_58_32
				var_58_33.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_34 = var_58_33:GetComponent("SpriteRenderer")

				if var_58_34 and var_58_34.sprite then
					local var_58_35 = (var_58_33.transform.localPosition - var_58_31).z
					local var_58_36 = manager.ui.mainCameraCom_
					local var_58_37 = 2 * var_58_35 * Mathf.Tan(var_58_36.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_38 = var_58_37 * var_58_36.aspect
					local var_58_39 = var_58_34.sprite.bounds.size.x
					local var_58_40 = var_58_34.sprite.bounds.size.y
					local var_58_41 = var_58_38 / var_58_39
					local var_58_42 = var_58_37 / var_58_40
					local var_58_43 = var_58_42 < var_58_41 and var_58_41 or var_58_42

					var_58_33.transform.localScale = Vector3.New(var_58_43, var_58_43, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "K12f" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_44 = 0

			if var_58_44 < arg_55_1.time_ and arg_55_1.time_ <= var_58_44 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_45 = 1

			if var_58_44 <= arg_55_1.time_ and arg_55_1.time_ < var_58_44 + var_58_45 then
				local var_58_46 = (arg_55_1.time_ - var_58_44) / var_58_45
				local var_58_47 = Color.New(1, 1, 1)

				var_58_47.a = Mathf.Lerp(1, 0, var_58_46)
				arg_55_1.mask_.color = var_58_47
			end

			if arg_55_1.time_ >= var_58_44 + var_58_45 and arg_55_1.time_ < var_58_44 + var_58_45 + arg_58_0 then
				local var_58_48 = Color.New(1, 1, 1)
				local var_58_49 = 0

				arg_55_1.mask_.enabled = false
				var_58_48.a = var_58_49
				arg_55_1.mask_.color = var_58_48
			end

			local var_58_50 = 0

			if var_58_50 < arg_55_1.time_ and arg_55_1.time_ <= var_58_50 + arg_58_0 then
				arg_55_1.screenFilterGo_:SetActive(false)
			end

			local var_58_51 = 0.0166666666666667

			if var_58_50 <= arg_55_1.time_ and arg_55_1.time_ < var_58_50 + var_58_51 then
				local var_58_52 = (arg_55_1.time_ - var_58_50) / var_58_51

				arg_55_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_58_52)
			end

			if arg_55_1.time_ >= var_58_50 + var_58_51 and arg_55_1.time_ < var_58_50 + var_58_51 + arg_58_0 then
				arg_55_1.screenFilterEffect_.weight = 0
			end

			local var_58_53 = 0
			local var_58_54 = 0.175

			if var_58_53 < arg_55_1.time_ and arg_55_1.time_ <= var_58_53 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_55 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_55:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_56 = arg_55_1:FormatText(StoryNameCfg[92].name)

				arg_55_1.leftNameTxt_.text = var_58_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_57 = arg_55_1:GetWordFromCfg(317251013)
				local var_58_58 = arg_55_1:FormatText(var_58_57.content)

				arg_55_1.text_.text = var_58_58

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_59 = 7
				local var_58_60 = utf8.len(var_58_58)
				local var_58_61 = var_58_59 <= 0 and var_58_54 or var_58_54 * (var_58_60 / var_58_59)

				if var_58_61 > 0 and var_58_54 < var_58_61 then
					arg_55_1.talkMaxDuration = var_58_61
					var_58_53 = var_58_53 + 0.3

					if var_58_61 + var_58_53 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_61 + var_58_53
					end
				end

				arg_55_1.text_.text = var_58_58
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251013", "story_v_out_317251.awb") ~= 0 then
					local var_58_62 = manager.audio:GetVoiceLength("story_v_out_317251", "317251013", "story_v_out_317251.awb") / 1000

					if var_58_62 + var_58_53 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_62 + var_58_53
					end

					if var_58_57.prefab_name ~= "" and arg_55_1.actors_[var_58_57.prefab_name] ~= nil then
						local var_58_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_57.prefab_name].transform, "story_v_out_317251", "317251013", "story_v_out_317251.awb")

						arg_55_1:RecordAudio("317251013", var_58_63)
						arg_55_1:RecordAudio("317251013", var_58_63)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_317251", "317251013", "story_v_out_317251.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_317251", "317251013", "story_v_out_317251.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_64 = var_58_53 + 0.3
			local var_58_65 = math.max(var_58_54, arg_55_1.talkMaxDuration)

			if var_58_64 <= arg_55_1.time_ and arg_55_1.time_ < var_58_64 + var_58_65 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_64) / var_58_65

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_64 + var_58_65 and arg_55_1.time_ < var_58_64 + var_58_65 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play317251014 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 317251014
		arg_61_1.duration_ = 3.433

		local var_61_0 = {
			zh = 2.866,
			ja = 3.433
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
				arg_61_0:Play317251015(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1158ui_story"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos1158ui_story = var_64_0.localPosition
			end

			local var_64_2 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2
				local var_64_4 = Vector3.New(0, 100, 0)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1158ui_story, var_64_4, var_64_3)

				local var_64_5 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_5.x, var_64_5.y, var_64_5.z)

				local var_64_6 = var_64_0.localEulerAngles

				var_64_6.z = 0
				var_64_6.x = 0
				var_64_0.localEulerAngles = var_64_6
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(0, 100, 0)

				local var_64_7 = manager.ui.mainCamera.transform.position - var_64_0.position

				var_64_0.forward = Vector3.New(var_64_7.x, var_64_7.y, var_64_7.z)

				local var_64_8 = var_64_0.localEulerAngles

				var_64_8.z = 0
				var_64_8.x = 0
				var_64_0.localEulerAngles = var_64_8
			end

			local var_64_9 = arg_61_1.actors_["1158ui_story"]
			local var_64_10 = 0

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 and arg_61_1.var_.characterEffect1158ui_story == nil then
				arg_61_1.var_.characterEffect1158ui_story = var_64_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_11 = 0.200000002980232

			if var_64_10 <= arg_61_1.time_ and arg_61_1.time_ < var_64_10 + var_64_11 then
				local var_64_12 = (arg_61_1.time_ - var_64_10) / var_64_11

				if arg_61_1.var_.characterEffect1158ui_story then
					local var_64_13 = Mathf.Lerp(0, 0.5, var_64_12)

					arg_61_1.var_.characterEffect1158ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1158ui_story.fillRatio = var_64_13
				end
			end

			if arg_61_1.time_ >= var_64_10 + var_64_11 and arg_61_1.time_ < var_64_10 + var_64_11 + arg_64_0 and arg_61_1.var_.characterEffect1158ui_story then
				local var_64_14 = 0.5

				arg_61_1.var_.characterEffect1158ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1158ui_story.fillRatio = var_64_14
			end

			local var_64_15 = arg_61_1.actors_["1049ui_story"].transform
			local var_64_16 = 0

			if var_64_16 < arg_61_1.time_ and arg_61_1.time_ <= var_64_16 + arg_64_0 then
				arg_61_1.var_.moveOldPos1049ui_story = var_64_15.localPosition
			end

			local var_64_17 = 0.001

			if var_64_16 <= arg_61_1.time_ and arg_61_1.time_ < var_64_16 + var_64_17 then
				local var_64_18 = (arg_61_1.time_ - var_64_16) / var_64_17
				local var_64_19 = Vector3.New(0, -1.2, -6)

				var_64_15.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1049ui_story, var_64_19, var_64_18)

				local var_64_20 = manager.ui.mainCamera.transform.position - var_64_15.position

				var_64_15.forward = Vector3.New(var_64_20.x, var_64_20.y, var_64_20.z)

				local var_64_21 = var_64_15.localEulerAngles

				var_64_21.z = 0
				var_64_21.x = 0
				var_64_15.localEulerAngles = var_64_21
			end

			if arg_61_1.time_ >= var_64_16 + var_64_17 and arg_61_1.time_ < var_64_16 + var_64_17 + arg_64_0 then
				var_64_15.localPosition = Vector3.New(0, -1.2, -6)

				local var_64_22 = manager.ui.mainCamera.transform.position - var_64_15.position

				var_64_15.forward = Vector3.New(var_64_22.x, var_64_22.y, var_64_22.z)

				local var_64_23 = var_64_15.localEulerAngles

				var_64_23.z = 0
				var_64_23.x = 0
				var_64_15.localEulerAngles = var_64_23
			end

			local var_64_24 = arg_61_1.actors_["1049ui_story"]
			local var_64_25 = 0

			if var_64_25 < arg_61_1.time_ and arg_61_1.time_ <= var_64_25 + arg_64_0 and arg_61_1.var_.characterEffect1049ui_story == nil then
				arg_61_1.var_.characterEffect1049ui_story = var_64_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_26 = 0.200000002980232

			if var_64_25 <= arg_61_1.time_ and arg_61_1.time_ < var_64_25 + var_64_26 then
				local var_64_27 = (arg_61_1.time_ - var_64_25) / var_64_26

				if arg_61_1.var_.characterEffect1049ui_story then
					arg_61_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_25 + var_64_26 and arg_61_1.time_ < var_64_25 + var_64_26 + arg_64_0 and arg_61_1.var_.characterEffect1049ui_story then
				arg_61_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_64_28 = 0

			if var_64_28 < arg_61_1.time_ and arg_61_1.time_ <= var_64_28 + arg_64_0 then
				arg_61_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_64_29 = 0

			if var_64_29 < arg_61_1.time_ and arg_61_1.time_ <= var_64_29 + arg_64_0 then
				arg_61_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_64_30 = 0

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				local var_64_31 = manager.ui.mainCamera.transform.localPosition
				local var_64_32 = Vector3.New(0, 0, 10) + Vector3.New(var_64_31.x, var_64_31.y, 0)
				local var_64_33 = arg_61_1.bgs_.ST58

				var_64_33.transform.localPosition = var_64_32
				var_64_33.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_34 = var_64_33:GetComponent("SpriteRenderer")

				if var_64_34 and var_64_34.sprite then
					local var_64_35 = (var_64_33.transform.localPosition - var_64_31).z
					local var_64_36 = manager.ui.mainCameraCom_
					local var_64_37 = 2 * var_64_35 * Mathf.Tan(var_64_36.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_38 = var_64_37 * var_64_36.aspect
					local var_64_39 = var_64_34.sprite.bounds.size.x
					local var_64_40 = var_64_34.sprite.bounds.size.y
					local var_64_41 = var_64_38 / var_64_39
					local var_64_42 = var_64_37 / var_64_40
					local var_64_43 = var_64_42 < var_64_41 and var_64_41 or var_64_42

					var_64_33.transform.localScale = Vector3.New(var_64_43, var_64_43, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "ST58" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_44 = 0

			if var_64_44 < arg_61_1.time_ and arg_61_1.time_ <= var_64_44 + arg_64_0 then
				arg_61_1.mask_.enabled = true
				arg_61_1.mask_.raycastTarget = true

				arg_61_1:SetGaussion(false)
			end

			local var_64_45 = 1

			if var_64_44 <= arg_61_1.time_ and arg_61_1.time_ < var_64_44 + var_64_45 then
				local var_64_46 = (arg_61_1.time_ - var_64_44) / var_64_45
				local var_64_47 = Color.New(1, 1, 1)

				var_64_47.a = Mathf.Lerp(1, 0, var_64_46)
				arg_61_1.mask_.color = var_64_47
			end

			if arg_61_1.time_ >= var_64_44 + var_64_45 and arg_61_1.time_ < var_64_44 + var_64_45 + arg_64_0 then
				local var_64_48 = Color.New(1, 1, 1)
				local var_64_49 = 0

				arg_61_1.mask_.enabled = false
				var_64_48.a = var_64_49
				arg_61_1.mask_.color = var_64_48
			end

			local var_64_50 = 0

			if var_64_50 < arg_61_1.time_ and arg_61_1.time_ <= var_64_50 + arg_64_0 then
				arg_61_1.screenFilterGo_:SetActive(true)

				arg_61_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_64_51 = 0.0166666666666667

			if var_64_50 <= arg_61_1.time_ and arg_61_1.time_ < var_64_50 + var_64_51 then
				local var_64_52 = (arg_61_1.time_ - var_64_50) / var_64_51

				arg_61_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_64_52)
			end

			if arg_61_1.time_ >= var_64_50 + var_64_51 and arg_61_1.time_ < var_64_50 + var_64_51 + arg_64_0 then
				arg_61_1.screenFilterEffect_.weight = 1
			end

			if arg_61_1.frameCnt_ <= 1 then
				arg_61_1.dialog_:SetActive(false)
			end

			local var_64_53 = 1
			local var_64_54 = 0.125

			if var_64_53 < arg_61_1.time_ and arg_61_1.time_ <= var_64_53 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_55 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_55:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_56 = arg_61_1:FormatText(StoryNameCfg[562].name)

				arg_61_1.leftNameTxt_.text = var_64_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_57 = arg_61_1:GetWordFromCfg(317251014)
				local var_64_58 = arg_61_1:FormatText(var_64_57.content)

				arg_61_1.text_.text = var_64_58

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_59 = 5
				local var_64_60 = utf8.len(var_64_58)
				local var_64_61 = var_64_59 <= 0 and var_64_54 or var_64_54 * (var_64_60 / var_64_59)

				if var_64_61 > 0 and var_64_54 < var_64_61 then
					arg_61_1.talkMaxDuration = var_64_61
					var_64_53 = var_64_53 + 0.3

					if var_64_61 + var_64_53 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_61 + var_64_53
					end
				end

				arg_61_1.text_.text = var_64_58
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251014", "story_v_out_317251.awb") ~= 0 then
					local var_64_62 = manager.audio:GetVoiceLength("story_v_out_317251", "317251014", "story_v_out_317251.awb") / 1000

					if var_64_62 + var_64_53 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_62 + var_64_53
					end

					if var_64_57.prefab_name ~= "" and arg_61_1.actors_[var_64_57.prefab_name] ~= nil then
						local var_64_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_57.prefab_name].transform, "story_v_out_317251", "317251014", "story_v_out_317251.awb")

						arg_61_1:RecordAudio("317251014", var_64_63)
						arg_61_1:RecordAudio("317251014", var_64_63)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_317251", "317251014", "story_v_out_317251.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_317251", "317251014", "story_v_out_317251.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_64 = var_64_53 + 0.3
			local var_64_65 = math.max(var_64_54, arg_61_1.talkMaxDuration)

			if var_64_64 <= arg_61_1.time_ and arg_61_1.time_ < var_64_64 + var_64_65 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_64) / var_64_65

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_64 + var_64_65 and arg_61_1.time_ < var_64_64 + var_64_65 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play317251015 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317251015
		arg_67_1.duration_ = 3.28266666666667

		local var_67_0 = {
			zh = 3.28266666666667,
			ja = 2.74966666666667
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
				arg_67_0:Play317251016(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1158ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1158ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, -0.95, -6)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1158ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -0.95, -6)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1158ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1158ui_story == nil then
				arg_67_1.var_.characterEffect1158ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1158ui_story then
					arg_67_1.var_.characterEffect1158ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1158ui_story then
				arg_67_1.var_.characterEffect1158ui_story.fillFlat = false
			end

			local var_70_13 = 0

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/story1158/story1158action/1158action1_1")
			end

			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				arg_67_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_70_15 = arg_67_1.actors_["1049ui_story"].transform
			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.var_.moveOldPos1049ui_story = var_70_15.localPosition
			end

			local var_70_17 = 0.001

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Vector3.New(0, 100, 0)

				var_70_15.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1049ui_story, var_70_19, var_70_18)

				local var_70_20 = manager.ui.mainCamera.transform.position - var_70_15.position

				var_70_15.forward = Vector3.New(var_70_20.x, var_70_20.y, var_70_20.z)

				local var_70_21 = var_70_15.localEulerAngles

				var_70_21.z = 0
				var_70_21.x = 0
				var_70_15.localEulerAngles = var_70_21
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				var_70_15.localPosition = Vector3.New(0, 100, 0)

				local var_70_22 = manager.ui.mainCamera.transform.position - var_70_15.position

				var_70_15.forward = Vector3.New(var_70_22.x, var_70_22.y, var_70_22.z)

				local var_70_23 = var_70_15.localEulerAngles

				var_70_23.z = 0
				var_70_23.x = 0
				var_70_15.localEulerAngles = var_70_23
			end

			local var_70_24 = 0

			if var_70_24 < arg_67_1.time_ and arg_67_1.time_ <= var_70_24 + arg_70_0 then
				local var_70_25 = manager.ui.mainCamera.transform.localPosition
				local var_70_26 = Vector3.New(0, 0, 10) + Vector3.New(var_70_25.x, var_70_25.y, 0)
				local var_70_27 = arg_67_1.bgs_.K12f

				var_70_27.transform.localPosition = var_70_26
				var_70_27.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_28 = var_70_27:GetComponent("SpriteRenderer")

				if var_70_28 and var_70_28.sprite then
					local var_70_29 = (var_70_27.transform.localPosition - var_70_25).z
					local var_70_30 = manager.ui.mainCameraCom_
					local var_70_31 = 2 * var_70_29 * Mathf.Tan(var_70_30.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_32 = var_70_31 * var_70_30.aspect
					local var_70_33 = var_70_28.sprite.bounds.size.x
					local var_70_34 = var_70_28.sprite.bounds.size.y
					local var_70_35 = var_70_32 / var_70_33
					local var_70_36 = var_70_31 / var_70_34
					local var_70_37 = var_70_36 < var_70_35 and var_70_35 or var_70_36

					var_70_27.transform.localScale = Vector3.New(var_70_37, var_70_37, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "K12f" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_38 = 0

			if var_70_38 < arg_67_1.time_ and arg_67_1.time_ <= var_70_38 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_39 = 1

			if var_70_38 <= arg_67_1.time_ and arg_67_1.time_ < var_70_38 + var_70_39 then
				local var_70_40 = (arg_67_1.time_ - var_70_38) / var_70_39
				local var_70_41 = Color.New(1, 1, 1)

				var_70_41.a = Mathf.Lerp(1, 0, var_70_40)
				arg_67_1.mask_.color = var_70_41
			end

			if arg_67_1.time_ >= var_70_38 + var_70_39 and arg_67_1.time_ < var_70_38 + var_70_39 + arg_70_0 then
				local var_70_42 = Color.New(1, 1, 1)
				local var_70_43 = 0

				arg_67_1.mask_.enabled = false
				var_70_42.a = var_70_43
				arg_67_1.mask_.color = var_70_42
			end

			local var_70_44 = 0

			if var_70_44 < arg_67_1.time_ and arg_67_1.time_ <= var_70_44 + arg_70_0 then
				arg_67_1.screenFilterGo_:SetActive(false)
			end

			local var_70_45 = 0.0166666666666667

			if var_70_44 <= arg_67_1.time_ and arg_67_1.time_ < var_70_44 + var_70_45 then
				local var_70_46 = (arg_67_1.time_ - var_70_44) / var_70_45

				arg_67_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_70_46)
			end

			if arg_67_1.time_ >= var_70_44 + var_70_45 and arg_67_1.time_ < var_70_44 + var_70_45 + arg_70_0 then
				arg_67_1.screenFilterEffect_.weight = 0
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_47 = 1.01666666666667
			local var_70_48 = 0.175

			if var_70_47 < arg_67_1.time_ and arg_67_1.time_ <= var_70_47 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_49 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_49:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_50 = arg_67_1:FormatText(StoryNameCfg[92].name)

				arg_67_1.leftNameTxt_.text = var_70_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_51 = arg_67_1:GetWordFromCfg(317251015)
				local var_70_52 = arg_67_1:FormatText(var_70_51.content)

				arg_67_1.text_.text = var_70_52

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_53 = 7
				local var_70_54 = utf8.len(var_70_52)
				local var_70_55 = var_70_53 <= 0 and var_70_48 or var_70_48 * (var_70_54 / var_70_53)

				if var_70_55 > 0 and var_70_48 < var_70_55 then
					arg_67_1.talkMaxDuration = var_70_55
					var_70_47 = var_70_47 + 0.3

					if var_70_55 + var_70_47 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_55 + var_70_47
					end
				end

				arg_67_1.text_.text = var_70_52
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251015", "story_v_out_317251.awb") ~= 0 then
					local var_70_56 = manager.audio:GetVoiceLength("story_v_out_317251", "317251015", "story_v_out_317251.awb") / 1000

					if var_70_56 + var_70_47 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_56 + var_70_47
					end

					if var_70_51.prefab_name ~= "" and arg_67_1.actors_[var_70_51.prefab_name] ~= nil then
						local var_70_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_51.prefab_name].transform, "story_v_out_317251", "317251015", "story_v_out_317251.awb")

						arg_67_1:RecordAudio("317251015", var_70_57)
						arg_67_1:RecordAudio("317251015", var_70_57)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_317251", "317251015", "story_v_out_317251.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_317251", "317251015", "story_v_out_317251.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_58 = var_70_47 + 0.3
			local var_70_59 = math.max(var_70_48, arg_67_1.talkMaxDuration)

			if var_70_58 <= arg_67_1.time_ and arg_67_1.time_ < var_70_58 + var_70_59 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_58) / var_70_59

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_58 + var_70_59 and arg_67_1.time_ < var_70_58 + var_70_59 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317251016 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 317251016
		arg_73_1.duration_ = 3.366

		local var_73_0 = {
			zh = 1.999999999999,
			ja = 3.366
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
				arg_73_0:Play317251017(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1158ui_story"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos1158ui_story = var_76_0.localPosition
			end

			local var_76_2 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2
				local var_76_4 = Vector3.New(0, 100, 0)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1158ui_story, var_76_4, var_76_3)

				local var_76_5 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_5.x, var_76_5.y, var_76_5.z)

				local var_76_6 = var_76_0.localEulerAngles

				var_76_6.z = 0
				var_76_6.x = 0
				var_76_0.localEulerAngles = var_76_6
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, 100, 0)

				local var_76_7 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_7.x, var_76_7.y, var_76_7.z)

				local var_76_8 = var_76_0.localEulerAngles

				var_76_8.z = 0
				var_76_8.x = 0
				var_76_0.localEulerAngles = var_76_8
			end

			local var_76_9 = arg_73_1.actors_["1049ui_story"].transform
			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1.var_.moveOldPos1049ui_story = var_76_9.localPosition
			end

			local var_76_11 = 0.001

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_11 then
				local var_76_12 = (arg_73_1.time_ - var_76_10) / var_76_11
				local var_76_13 = Vector3.New(0, -1.2, -6)

				var_76_9.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1049ui_story, var_76_13, var_76_12)

				local var_76_14 = manager.ui.mainCamera.transform.position - var_76_9.position

				var_76_9.forward = Vector3.New(var_76_14.x, var_76_14.y, var_76_14.z)

				local var_76_15 = var_76_9.localEulerAngles

				var_76_15.z = 0
				var_76_15.x = 0
				var_76_9.localEulerAngles = var_76_15
			end

			if arg_73_1.time_ >= var_76_10 + var_76_11 and arg_73_1.time_ < var_76_10 + var_76_11 + arg_76_0 then
				var_76_9.localPosition = Vector3.New(0, -1.2, -6)

				local var_76_16 = manager.ui.mainCamera.transform.position - var_76_9.position

				var_76_9.forward = Vector3.New(var_76_16.x, var_76_16.y, var_76_16.z)

				local var_76_17 = var_76_9.localEulerAngles

				var_76_17.z = 0
				var_76_17.x = 0
				var_76_9.localEulerAngles = var_76_17
			end

			local var_76_18 = arg_73_1.actors_["1049ui_story"]
			local var_76_19 = 0

			if var_76_19 < arg_73_1.time_ and arg_73_1.time_ <= var_76_19 + arg_76_0 and arg_73_1.var_.characterEffect1049ui_story == nil then
				arg_73_1.var_.characterEffect1049ui_story = var_76_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_20 = 0.200000002980232

			if var_76_19 <= arg_73_1.time_ and arg_73_1.time_ < var_76_19 + var_76_20 then
				local var_76_21 = (arg_73_1.time_ - var_76_19) / var_76_20

				if arg_73_1.var_.characterEffect1049ui_story then
					arg_73_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_19 + var_76_20 and arg_73_1.time_ < var_76_19 + var_76_20 + arg_76_0 and arg_73_1.var_.characterEffect1049ui_story then
				arg_73_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_76_22 = 0

			if var_76_22 < arg_73_1.time_ and arg_73_1.time_ <= var_76_22 + arg_76_0 then
				arg_73_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_76_23 = 0

			if var_76_23 < arg_73_1.time_ and arg_73_1.time_ <= var_76_23 + arg_76_0 then
				arg_73_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_76_24 = 0

			if var_76_24 < arg_73_1.time_ and arg_73_1.time_ <= var_76_24 + arg_76_0 then
				local var_76_25 = manager.ui.mainCamera.transform.localPosition
				local var_76_26 = Vector3.New(0, 0, 10) + Vector3.New(var_76_25.x, var_76_25.y, 0)
				local var_76_27 = arg_73_1.bgs_.ST58

				var_76_27.transform.localPosition = var_76_26
				var_76_27.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_76_28 = var_76_27:GetComponent("SpriteRenderer")

				if var_76_28 and var_76_28.sprite then
					local var_76_29 = (var_76_27.transform.localPosition - var_76_25).z
					local var_76_30 = manager.ui.mainCameraCom_
					local var_76_31 = 2 * var_76_29 * Mathf.Tan(var_76_30.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_76_32 = var_76_31 * var_76_30.aspect
					local var_76_33 = var_76_28.sprite.bounds.size.x
					local var_76_34 = var_76_28.sprite.bounds.size.y
					local var_76_35 = var_76_32 / var_76_33
					local var_76_36 = var_76_31 / var_76_34
					local var_76_37 = var_76_36 < var_76_35 and var_76_35 or var_76_36

					var_76_27.transform.localScale = Vector3.New(var_76_37, var_76_37, 0)
				end

				for iter_76_0, iter_76_1 in pairs(arg_73_1.bgs_) do
					if iter_76_0 ~= "ST58" then
						iter_76_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_76_38 = 0

			if var_76_38 < arg_73_1.time_ and arg_73_1.time_ <= var_76_38 + arg_76_0 then
				arg_73_1.mask_.enabled = true
				arg_73_1.mask_.raycastTarget = true

				arg_73_1:SetGaussion(false)
			end

			local var_76_39 = 1

			if var_76_38 <= arg_73_1.time_ and arg_73_1.time_ < var_76_38 + var_76_39 then
				local var_76_40 = (arg_73_1.time_ - var_76_38) / var_76_39
				local var_76_41 = Color.New(1, 1, 1)

				var_76_41.a = Mathf.Lerp(1, 0, var_76_40)
				arg_73_1.mask_.color = var_76_41
			end

			if arg_73_1.time_ >= var_76_38 + var_76_39 and arg_73_1.time_ < var_76_38 + var_76_39 + arg_76_0 then
				local var_76_42 = Color.New(1, 1, 1)
				local var_76_43 = 0

				arg_73_1.mask_.enabled = false
				var_76_42.a = var_76_43
				arg_73_1.mask_.color = var_76_42
			end

			local var_76_44 = 0

			if var_76_44 < arg_73_1.time_ and arg_73_1.time_ <= var_76_44 + arg_76_0 then
				arg_73_1.screenFilterGo_:SetActive(true)

				arg_73_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_76_45 = 0.0166666666666667

			if var_76_44 <= arg_73_1.time_ and arg_73_1.time_ < var_76_44 + var_76_45 then
				local var_76_46 = (arg_73_1.time_ - var_76_44) / var_76_45

				arg_73_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_76_46)
			end

			if arg_73_1.time_ >= var_76_44 + var_76_45 and arg_73_1.time_ < var_76_44 + var_76_45 + arg_76_0 then
				arg_73_1.screenFilterEffect_.weight = 1
			end

			local var_76_47 = 0
			local var_76_48 = 0.1

			if var_76_47 < arg_73_1.time_ and arg_73_1.time_ <= var_76_47 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_49 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_49:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_50 = arg_73_1:FormatText(StoryNameCfg[562].name)

				arg_73_1.leftNameTxt_.text = var_76_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_51 = arg_73_1:GetWordFromCfg(317251016)
				local var_76_52 = arg_73_1:FormatText(var_76_51.content)

				arg_73_1.text_.text = var_76_52

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_53 = 4
				local var_76_54 = utf8.len(var_76_52)
				local var_76_55 = var_76_53 <= 0 and var_76_48 or var_76_48 * (var_76_54 / var_76_53)

				if var_76_55 > 0 and var_76_48 < var_76_55 then
					arg_73_1.talkMaxDuration = var_76_55
					var_76_47 = var_76_47 + 0.3

					if var_76_55 + var_76_47 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_55 + var_76_47
					end
				end

				arg_73_1.text_.text = var_76_52
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251016", "story_v_out_317251.awb") ~= 0 then
					local var_76_56 = manager.audio:GetVoiceLength("story_v_out_317251", "317251016", "story_v_out_317251.awb") / 1000

					if var_76_56 + var_76_47 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_56 + var_76_47
					end

					if var_76_51.prefab_name ~= "" and arg_73_1.actors_[var_76_51.prefab_name] ~= nil then
						local var_76_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_51.prefab_name].transform, "story_v_out_317251", "317251016", "story_v_out_317251.awb")

						arg_73_1:RecordAudio("317251016", var_76_57)
						arg_73_1:RecordAudio("317251016", var_76_57)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_317251", "317251016", "story_v_out_317251.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_317251", "317251016", "story_v_out_317251.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_58 = var_76_47 + 0.3
			local var_76_59 = math.max(var_76_48, arg_73_1.talkMaxDuration)

			if var_76_58 <= arg_73_1.time_ and arg_73_1.time_ < var_76_58 + var_76_59 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_58) / var_76_59

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_58 + var_76_59 and arg_73_1.time_ < var_76_58 + var_76_59 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play317251017 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317251017
		arg_79_1.duration_ = 9

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play317251018(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1049ui_story"].transform
			local var_82_1 = 2

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1049ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1049ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, 100, 0)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = 2.00066666851441

			if var_82_9 < arg_79_1.time_ and arg_79_1.time_ <= var_82_9 + arg_82_0 then
				local var_82_10 = manager.ui.mainCamera.transform.localPosition
				local var_82_11 = Vector3.New(0, 0, 10) + Vector3.New(var_82_10.x, var_82_10.y, 0)
				local var_82_12 = arg_79_1.bgs_.K12f

				var_82_12.transform.localPosition = var_82_11
				var_82_12.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_82_13 = var_82_12:GetComponent("SpriteRenderer")

				if var_82_13 and var_82_13.sprite then
					local var_82_14 = (var_82_12.transform.localPosition - var_82_10).z
					local var_82_15 = manager.ui.mainCameraCom_
					local var_82_16 = 2 * var_82_14 * Mathf.Tan(var_82_15.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_82_17 = var_82_16 * var_82_15.aspect
					local var_82_18 = var_82_13.sprite.bounds.size.x
					local var_82_19 = var_82_13.sprite.bounds.size.y
					local var_82_20 = var_82_17 / var_82_18
					local var_82_21 = var_82_16 / var_82_19
					local var_82_22 = var_82_21 < var_82_20 and var_82_20 or var_82_21

					var_82_12.transform.localScale = Vector3.New(var_82_22, var_82_22, 0)
				end

				for iter_82_0, iter_82_1 in pairs(arg_79_1.bgs_) do
					if iter_82_0 ~= "K12f" then
						iter_82_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_82_23 = 0

			if var_82_23 < arg_79_1.time_ and arg_79_1.time_ <= var_82_23 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = true

				arg_79_1:SetGaussion(false)
			end

			local var_82_24 = 2

			if var_82_23 <= arg_79_1.time_ and arg_79_1.time_ < var_82_23 + var_82_24 then
				local var_82_25 = (arg_79_1.time_ - var_82_23) / var_82_24
				local var_82_26 = Color.New(0, 0, 0)

				var_82_26.a = Mathf.Lerp(0, 1, var_82_25)
				arg_79_1.mask_.color = var_82_26
			end

			if arg_79_1.time_ >= var_82_23 + var_82_24 and arg_79_1.time_ < var_82_23 + var_82_24 + arg_82_0 then
				local var_82_27 = Color.New(0, 0, 0)

				var_82_27.a = 1
				arg_79_1.mask_.color = var_82_27
			end

			local var_82_28 = 2

			if var_82_28 < arg_79_1.time_ and arg_79_1.time_ <= var_82_28 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = true

				arg_79_1:SetGaussion(false)
			end

			local var_82_29 = 2

			if var_82_28 <= arg_79_1.time_ and arg_79_1.time_ < var_82_28 + var_82_29 then
				local var_82_30 = (arg_79_1.time_ - var_82_28) / var_82_29
				local var_82_31 = Color.New(0, 0, 0)

				var_82_31.a = Mathf.Lerp(1, 0, var_82_30)
				arg_79_1.mask_.color = var_82_31
			end

			if arg_79_1.time_ >= var_82_28 + var_82_29 and arg_79_1.time_ < var_82_28 + var_82_29 + arg_82_0 then
				local var_82_32 = Color.New(0, 0, 0)
				local var_82_33 = 0

				arg_79_1.mask_.enabled = false
				var_82_32.a = var_82_33
				arg_79_1.mask_.color = var_82_32
			end

			local var_82_34 = 2

			if var_82_34 < arg_79_1.time_ and arg_79_1.time_ <= var_82_34 + arg_82_0 then
				arg_79_1.screenFilterGo_:SetActive(false)
			end

			local var_82_35 = 0.0166666666666667

			if var_82_34 <= arg_79_1.time_ and arg_79_1.time_ < var_82_34 + var_82_35 then
				local var_82_36 = (arg_79_1.time_ - var_82_34) / var_82_35

				arg_79_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_82_36)
			end

			if arg_79_1.time_ >= var_82_34 + var_82_35 and arg_79_1.time_ < var_82_34 + var_82_35 + arg_82_0 then
				arg_79_1.screenFilterEffect_.weight = 0
			end

			if arg_79_1.frameCnt_ <= 1 then
				arg_79_1.dialog_:SetActive(false)
			end

			local var_82_37 = 4
			local var_82_38 = 0.75

			if var_82_37 < arg_79_1.time_ and arg_79_1.time_ <= var_82_37 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				arg_79_1.dialog_:SetActive(true)

				local var_82_39 = LeanTween.value(arg_79_1.dialog_, 0, 1, 0.3)

				var_82_39:setOnUpdate(LuaHelper.FloatAction(function(arg_83_0)
					arg_79_1.dialogCg_.alpha = arg_83_0
				end))
				var_82_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_79_1.dialog_)
					var_82_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_79_1.duration_ = arg_79_1.duration_ + 0.3

				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_40 = arg_79_1:GetWordFromCfg(317251017)
				local var_82_41 = arg_79_1:FormatText(var_82_40.content)

				arg_79_1.text_.text = var_82_41

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_42 = 30
				local var_82_43 = utf8.len(var_82_41)
				local var_82_44 = var_82_42 <= 0 and var_82_38 or var_82_38 * (var_82_43 / var_82_42)

				if var_82_44 > 0 and var_82_38 < var_82_44 then
					arg_79_1.talkMaxDuration = var_82_44
					var_82_37 = var_82_37 + 0.3

					if var_82_44 + var_82_37 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_44 + var_82_37
					end
				end

				arg_79_1.text_.text = var_82_41
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_45 = var_82_37 + 0.3
			local var_82_46 = math.max(var_82_38, arg_79_1.talkMaxDuration)

			if var_82_45 <= arg_79_1.time_ and arg_79_1.time_ < var_82_45 + var_82_46 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_45) / var_82_46

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_45 + var_82_46 and arg_79_1.time_ < var_82_45 + var_82_46 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play317251018 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 317251018
		arg_85_1.duration_ = 13.766

		local var_85_0 = {
			zh = 12.133,
			ja = 13.766
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
				arg_85_0:Play317251019(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1.1

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[563].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(317251018)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 44
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_1 or var_88_1 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_1 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251018", "story_v_out_317251.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251018", "story_v_out_317251.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_317251", "317251018", "story_v_out_317251.awb")

						arg_85_1:RecordAudio("317251018", var_88_9)
						arg_85_1:RecordAudio("317251018", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_317251", "317251018", "story_v_out_317251.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_317251", "317251018", "story_v_out_317251.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_10 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_10 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_10

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_10 and arg_85_1.time_ < var_88_0 + var_88_10 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play317251019 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 317251019
		arg_89_1.duration_ = 8.2

		local var_89_0 = {
			zh = 8.2,
			ja = 5.866
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
				arg_89_0:Play317251020(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.775

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[563].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(317251019)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 31
				local var_92_6 = utf8.len(var_92_4)
				local var_92_7 = var_92_5 <= 0 and var_92_1 or var_92_1 * (var_92_6 / var_92_5)

				if var_92_7 > 0 and var_92_1 < var_92_7 then
					arg_89_1.talkMaxDuration = var_92_7

					if var_92_7 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_7 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_4
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251019", "story_v_out_317251.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251019", "story_v_out_317251.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_317251", "317251019", "story_v_out_317251.awb")

						arg_89_1:RecordAudio("317251019", var_92_9)
						arg_89_1:RecordAudio("317251019", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_317251", "317251019", "story_v_out_317251.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_317251", "317251019", "story_v_out_317251.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_10 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_10 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_10

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_10 and arg_89_1.time_ < var_92_0 + var_92_10 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play317251020 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 317251020
		arg_93_1.duration_ = 5.433

		local var_93_0 = {
			zh = 5.433,
			ja = 4.666
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
				arg_93_0:Play317251021(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.6

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[563].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(317251020)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 24
				local var_96_6 = utf8.len(var_96_4)
				local var_96_7 = var_96_5 <= 0 and var_96_1 or var_96_1 * (var_96_6 / var_96_5)

				if var_96_7 > 0 and var_96_1 < var_96_7 then
					arg_93_1.talkMaxDuration = var_96_7

					if var_96_7 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_7 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_4
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251020", "story_v_out_317251.awb") ~= 0 then
					local var_96_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251020", "story_v_out_317251.awb") / 1000

					if var_96_8 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_0
					end

					if var_96_3.prefab_name ~= "" and arg_93_1.actors_[var_96_3.prefab_name] ~= nil then
						local var_96_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_3.prefab_name].transform, "story_v_out_317251", "317251020", "story_v_out_317251.awb")

						arg_93_1:RecordAudio("317251020", var_96_9)
						arg_93_1:RecordAudio("317251020", var_96_9)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_317251", "317251020", "story_v_out_317251.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_317251", "317251020", "story_v_out_317251.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_10 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_10 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_10

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_10 and arg_93_1.time_ < var_96_0 + var_96_10 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play317251021 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 317251021
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play317251022(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.875

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_2 = arg_97_1:GetWordFromCfg(317251021)
				local var_100_3 = arg_97_1:FormatText(var_100_2.content)

				arg_97_1.text_.text = var_100_3

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_4 = 35
				local var_100_5 = utf8.len(var_100_3)
				local var_100_6 = var_100_4 <= 0 and var_100_1 or var_100_1 * (var_100_5 / var_100_4)

				if var_100_6 > 0 and var_100_1 < var_100_6 then
					arg_97_1.talkMaxDuration = var_100_6

					if var_100_6 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_6 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_3
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_7 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_7 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_7

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_7 and arg_97_1.time_ < var_100_0 + var_100_7 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play317251022 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 317251022
		arg_101_1.duration_ = 1.333

		local var_101_0 = {
			zh = 1.3,
			ja = 1.333
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
				arg_101_0:Play317251023(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.1

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[93].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(317251022)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 4
				local var_104_6 = utf8.len(var_104_4)
				local var_104_7 = var_104_5 <= 0 and var_104_1 or var_104_1 * (var_104_6 / var_104_5)

				if var_104_7 > 0 and var_104_1 < var_104_7 then
					arg_101_1.talkMaxDuration = var_104_7

					if var_104_7 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_7 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_4
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251022", "story_v_out_317251.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251022", "story_v_out_317251.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_317251", "317251022", "story_v_out_317251.awb")

						arg_101_1:RecordAudio("317251022", var_104_9)
						arg_101_1:RecordAudio("317251022", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_317251", "317251022", "story_v_out_317251.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_317251", "317251022", "story_v_out_317251.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_10 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_10 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_10

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_10 and arg_101_1.time_ < var_104_0 + var_104_10 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play317251023 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 317251023
		arg_105_1.duration_ = 1.8

		local var_105_0 = {
			zh = 1.8,
			ja = 1.666
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
				arg_105_0:Play317251024(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.125

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[563].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(317251023)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 5
				local var_108_6 = utf8.len(var_108_4)
				local var_108_7 = var_108_5 <= 0 and var_108_1 or var_108_1 * (var_108_6 / var_108_5)

				if var_108_7 > 0 and var_108_1 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_4
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251023", "story_v_out_317251.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251023", "story_v_out_317251.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_317251", "317251023", "story_v_out_317251.awb")

						arg_105_1:RecordAudio("317251023", var_108_9)
						arg_105_1:RecordAudio("317251023", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_317251", "317251023", "story_v_out_317251.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_317251", "317251023", "story_v_out_317251.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play317251024 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 317251024
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play317251025(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.55

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_2 = arg_109_1:GetWordFromCfg(317251024)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 22
				local var_112_5 = utf8.len(var_112_3)
				local var_112_6 = var_112_4 <= 0 and var_112_1 or var_112_1 * (var_112_5 / var_112_4)

				if var_112_6 > 0 and var_112_1 < var_112_6 then
					arg_109_1.talkMaxDuration = var_112_6

					if var_112_6 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_6 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_3
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_7 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_7 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_7

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_7 and arg_109_1.time_ < var_112_0 + var_112_7 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play317251025 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 317251025
		arg_113_1.duration_ = 11.833

		local var_113_0 = {
			zh = 8.066,
			ja = 11.833
		}
		local var_113_1 = manager.audio:GetLocalizationFlag()

		if var_113_0[var_113_1] ~= nil then
			arg_113_1.duration_ = var_113_0[var_113_1]
		end

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play317251026(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.95

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[93].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, true)
				arg_113_1.iconController_:SetSelectedState("hero")

				arg_113_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(317251025)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 38
				local var_116_6 = utf8.len(var_116_4)
				local var_116_7 = var_116_5 <= 0 and var_116_1 or var_116_1 * (var_116_6 / var_116_5)

				if var_116_7 > 0 and var_116_1 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_4
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251025", "story_v_out_317251.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251025", "story_v_out_317251.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_317251", "317251025", "story_v_out_317251.awb")

						arg_113_1:RecordAudio("317251025", var_116_9)
						arg_113_1:RecordAudio("317251025", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_317251", "317251025", "story_v_out_317251.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_317251", "317251025", "story_v_out_317251.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_10 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_10 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_10

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_10 and arg_113_1.time_ < var_116_0 + var_116_10 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play317251026 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 317251026
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play317251027(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 2.025

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_2 = arg_117_1:GetWordFromCfg(317251026)
				local var_120_3 = arg_117_1:FormatText(var_120_2.content)

				arg_117_1.text_.text = var_120_3

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_4 = 81
				local var_120_5 = utf8.len(var_120_3)
				local var_120_6 = var_120_4 <= 0 and var_120_1 or var_120_1 * (var_120_5 / var_120_4)

				if var_120_6 > 0 and var_120_1 < var_120_6 then
					arg_117_1.talkMaxDuration = var_120_6

					if var_120_6 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_6 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_3
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_7 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_7 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_7

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_7 and arg_117_1.time_ < var_120_0 + var_120_7 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play317251027 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 317251027
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play317251028(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.9

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_2 = arg_121_1:GetWordFromCfg(317251027)
				local var_124_3 = arg_121_1:FormatText(var_124_2.content)

				arg_121_1.text_.text = var_124_3

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_4 = 36
				local var_124_5 = utf8.len(var_124_3)
				local var_124_6 = var_124_4 <= 0 and var_124_1 or var_124_1 * (var_124_5 / var_124_4)

				if var_124_6 > 0 and var_124_1 < var_124_6 then
					arg_121_1.talkMaxDuration = var_124_6

					if var_124_6 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_6 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_3
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_7 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_7 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_7

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_7 and arg_121_1.time_ < var_124_0 + var_124_7 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play317251028 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 317251028
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play317251029(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 1.075

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_2 = arg_125_1:GetWordFromCfg(317251028)
				local var_128_3 = arg_125_1:FormatText(var_128_2.content)

				arg_125_1.text_.text = var_128_3

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_4 = 43
				local var_128_5 = utf8.len(var_128_3)
				local var_128_6 = var_128_4 <= 0 and var_128_1 or var_128_1 * (var_128_5 / var_128_4)

				if var_128_6 > 0 and var_128_1 < var_128_6 then
					arg_125_1.talkMaxDuration = var_128_6

					if var_128_6 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_6 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_3
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_7 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_7 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_7

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_7 and arg_125_1.time_ < var_128_0 + var_128_7 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play317251029 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 317251029
		arg_129_1.duration_ = 4.866

		local var_129_0 = {
			zh = 3,
			ja = 4.866
		}
		local var_129_1 = manager.audio:GetLocalizationFlag()

		if var_129_0[var_129_1] ~= nil then
			arg_129_1.duration_ = var_129_0[var_129_1]
		end

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play317251030(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1158ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1158ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, -0.95, -6)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1158ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -0.95, -6)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1158ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1158ui_story == nil then
				arg_129_1.var_.characterEffect1158ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1158ui_story then
					arg_129_1.var_.characterEffect1158ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1158ui_story then
				arg_129_1.var_.characterEffect1158ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/story1158/story1158action/1158action1_1")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("1158ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_132_15 = 0
			local var_132_16 = 0.275

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_17 = arg_129_1:FormatText(StoryNameCfg[92].name)

				arg_129_1.leftNameTxt_.text = var_132_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_18 = arg_129_1:GetWordFromCfg(317251029)
				local var_132_19 = arg_129_1:FormatText(var_132_18.content)

				arg_129_1.text_.text = var_132_19

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_20 = 11
				local var_132_21 = utf8.len(var_132_19)
				local var_132_22 = var_132_20 <= 0 and var_132_16 or var_132_16 * (var_132_21 / var_132_20)

				if var_132_22 > 0 and var_132_16 < var_132_22 then
					arg_129_1.talkMaxDuration = var_132_22

					if var_132_22 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_22 + var_132_15
					end
				end

				arg_129_1.text_.text = var_132_19
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251029", "story_v_out_317251.awb") ~= 0 then
					local var_132_23 = manager.audio:GetVoiceLength("story_v_out_317251", "317251029", "story_v_out_317251.awb") / 1000

					if var_132_23 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_23 + var_132_15
					end

					if var_132_18.prefab_name ~= "" and arg_129_1.actors_[var_132_18.prefab_name] ~= nil then
						local var_132_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_18.prefab_name].transform, "story_v_out_317251", "317251029", "story_v_out_317251.awb")

						arg_129_1:RecordAudio("317251029", var_132_24)
						arg_129_1:RecordAudio("317251029", var_132_24)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_317251", "317251029", "story_v_out_317251.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_317251", "317251029", "story_v_out_317251.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_25 = math.max(var_132_16, arg_129_1.talkMaxDuration)

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_25 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_15) / var_132_25

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_15 + var_132_25 and arg_129_1.time_ < var_132_15 + var_132_25 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play317251030 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 317251030
		arg_133_1.duration_ = 8.9

		local var_133_0 = {
			zh = 8.7,
			ja = 8.9
		}
		local var_133_1 = manager.audio:GetLocalizationFlag()

		if var_133_0[var_133_1] ~= nil then
			arg_133_1.duration_ = var_133_0[var_133_1]
		end

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play317251031(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1158ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1158ui_story == nil then
				arg_133_1.var_.characterEffect1158ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1158ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1158ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1158ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1158ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1158ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1158ui_story.fillRatio = var_136_5
			end

			local var_136_6 = arg_133_1.actors_["1158ui_story"].transform
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 then
				arg_133_1.var_.moveOldPos1158ui_story = var_136_6.localPosition
			end

			local var_136_8 = 0.001

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8
				local var_136_10 = Vector3.New(0, 100, 0)

				var_136_6.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1158ui_story, var_136_10, var_136_9)

				local var_136_11 = manager.ui.mainCamera.transform.position - var_136_6.position

				var_136_6.forward = Vector3.New(var_136_11.x, var_136_11.y, var_136_11.z)

				local var_136_12 = var_136_6.localEulerAngles

				var_136_12.z = 0
				var_136_12.x = 0
				var_136_6.localEulerAngles = var_136_12
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 then
				var_136_6.localPosition = Vector3.New(0, 100, 0)

				local var_136_13 = manager.ui.mainCamera.transform.position - var_136_6.position

				var_136_6.forward = Vector3.New(var_136_13.x, var_136_13.y, var_136_13.z)

				local var_136_14 = var_136_6.localEulerAngles

				var_136_14.z = 0
				var_136_14.x = 0
				var_136_6.localEulerAngles = var_136_14
			end

			local var_136_15 = 0
			local var_136_16 = 0.9

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_17 = arg_133_1:FormatText(StoryNameCfg[93].name)

				arg_133_1.leftNameTxt_.text = var_136_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_18 = arg_133_1:GetWordFromCfg(317251030)
				local var_136_19 = arg_133_1:FormatText(var_136_18.content)

				arg_133_1.text_.text = var_136_19

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_20 = 36
				local var_136_21 = utf8.len(var_136_19)
				local var_136_22 = var_136_20 <= 0 and var_136_16 or var_136_16 * (var_136_21 / var_136_20)

				if var_136_22 > 0 and var_136_16 < var_136_22 then
					arg_133_1.talkMaxDuration = var_136_22

					if var_136_22 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_22 + var_136_15
					end
				end

				arg_133_1.text_.text = var_136_19
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251030", "story_v_out_317251.awb") ~= 0 then
					local var_136_23 = manager.audio:GetVoiceLength("story_v_out_317251", "317251030", "story_v_out_317251.awb") / 1000

					if var_136_23 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_23 + var_136_15
					end

					if var_136_18.prefab_name ~= "" and arg_133_1.actors_[var_136_18.prefab_name] ~= nil then
						local var_136_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_18.prefab_name].transform, "story_v_out_317251", "317251030", "story_v_out_317251.awb")

						arg_133_1:RecordAudio("317251030", var_136_24)
						arg_133_1:RecordAudio("317251030", var_136_24)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_317251", "317251030", "story_v_out_317251.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_317251", "317251030", "story_v_out_317251.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_25 = math.max(var_136_16, arg_133_1.talkMaxDuration)

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_25 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_15) / var_136_25

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_15 + var_136_25 and arg_133_1.time_ < var_136_15 + var_136_25 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play317251031 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 317251031
		arg_137_1.duration_ = 8.733

		local var_137_0 = {
			zh = 8.1,
			ja = 8.733
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play317251032(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.9

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[93].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(317251031)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 36
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251031", "story_v_out_317251.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251031", "story_v_out_317251.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_317251", "317251031", "story_v_out_317251.awb")

						arg_137_1:RecordAudio("317251031", var_140_9)
						arg_137_1:RecordAudio("317251031", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_317251", "317251031", "story_v_out_317251.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_317251", "317251031", "story_v_out_317251.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play317251032 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 317251032
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play317251033(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.65

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_2 = arg_141_1:GetWordFromCfg(317251032)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 26
				local var_144_5 = utf8.len(var_144_3)
				local var_144_6 = var_144_4 <= 0 and var_144_1 or var_144_1 * (var_144_5 / var_144_4)

				if var_144_6 > 0 and var_144_1 < var_144_6 then
					arg_141_1.talkMaxDuration = var_144_6

					if var_144_6 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_6 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_3
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_7 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_7 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_7

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_7 and arg_141_1.time_ < var_144_0 + var_144_7 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play317251033 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 317251033
		arg_145_1.duration_ = 8.633

		local var_145_0 = {
			zh = 8.633,
			ja = 6.2
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play317251034(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.975

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[93].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(317251033)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 39
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251033", "story_v_out_317251.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251033", "story_v_out_317251.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_317251", "317251033", "story_v_out_317251.awb")

						arg_145_1:RecordAudio("317251033", var_148_9)
						arg_145_1:RecordAudio("317251033", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_317251", "317251033", "story_v_out_317251.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_317251", "317251033", "story_v_out_317251.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_10 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_10 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_10

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_10 and arg_145_1.time_ < var_148_0 + var_148_10 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play317251034 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 317251034
		arg_149_1.duration_ = 9.5

		local var_149_0 = {
			zh = 5.9,
			ja = 9.5
		}
		local var_149_1 = manager.audio:GetLocalizationFlag()

		if var_149_0[var_149_1] ~= nil then
			arg_149_1.duration_ = var_149_0[var_149_1]
		end

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play317251035(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.575

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[93].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(317251034)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 23
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251034", "story_v_out_317251.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251034", "story_v_out_317251.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_317251", "317251034", "story_v_out_317251.awb")

						arg_149_1:RecordAudio("317251034", var_152_9)
						arg_149_1:RecordAudio("317251034", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_317251", "317251034", "story_v_out_317251.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_317251", "317251034", "story_v_out_317251.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play317251035 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 317251035
		arg_153_1.duration_ = 7.266

		local var_153_0 = {
			zh = 1.666,
			ja = 7.266
		}
		local var_153_1 = manager.audio:GetLocalizationFlag()

		if var_153_0[var_153_1] ~= nil then
			arg_153_1.duration_ = var_153_0[var_153_1]
		end

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play317251036(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.125

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[93].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, true)
				arg_153_1.iconController_:SetSelectedState("hero")

				arg_153_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(317251035)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 5
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317251", "317251035", "story_v_out_317251.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_317251", "317251035", "story_v_out_317251.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_317251", "317251035", "story_v_out_317251.awb")

						arg_153_1:RecordAudio("317251035", var_156_9)
						arg_153_1:RecordAudio("317251035", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_317251", "317251035", "story_v_out_317251.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_317251", "317251035", "story_v_out_317251.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play317251036 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 317251036
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
			arg_157_1.auto_ = false
		end

		function arg_157_1.playNext_(arg_159_0)
			arg_157_1.onStoryFinished_()
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 1.275

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_2 = arg_157_1:GetWordFromCfg(317251036)
				local var_160_3 = arg_157_1:FormatText(var_160_2.content)

				arg_157_1.text_.text = var_160_3

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_4 = 51
				local var_160_5 = utf8.len(var_160_3)
				local var_160_6 = var_160_4 <= 0 and var_160_1 or var_160_1 * (var_160_5 / var_160_4)

				if var_160_6 > 0 and var_160_1 < var_160_6 then
					arg_157_1.talkMaxDuration = var_160_6

					if var_160_6 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_6 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_3
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_7 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_7 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_7

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_7 and arg_157_1.time_ < var_160_0 + var_160_7 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K11f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K12f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST58"
	},
	voices = {
		"story_v_out_317251.awb"
	}
}
