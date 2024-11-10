return {
	Play116011001 = function(arg_1_0, arg_1_1)
		arg_1_1.marker = "Mark1"
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116011001
		arg_1_1.duration_ = 122.966666666666

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			arg_1_1.marker = ""

			if arg_3_0 == 1 then
				arg_1_0:Play116011002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I05f"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 110.9667

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.I05f

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
					if iter_4_0 ~= "I05f" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 110.9667

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
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 110.966666666667
			local var_4_27 = 1.366666666667

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			local var_4_30 = 0

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				SetActive(arg_1_1.dialog_, false)
				SetActive(arg_1_1.allBtn_.gameObject, false)
				arg_1_1.hideBtnsController_:SetSelectedIndex(1)

				arg_1_1.marker = "PlayCantSkipVideo"

				manager.video:Play("SofdecAsset/story/101160101.usm", function(arg_5_0)
					arg_1_1.time_ = var_4_30 + 110.95666666689

					if arg_1_1.state_ == "pause" then
						arg_1_1.state_ = "playing"
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_6_0)
					if arg_6_0 then
						arg_1_1.state_ = "pause"
					else
						arg_1_1.state_ = "playing"
					end
				end, 101160101)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_4_31 = 110.966666666667

			if var_4_30 <= arg_1_1.time_ and arg_1_1.time_ < var_4_30 + var_4_31 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_30 + var_4_31 and arg_1_1.time_ < var_4_30 + var_4_31 + arg_4_0 then
				arg_1_1.marker = ""
			end

			local var_4_32 = 110.9667

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				SetActive(arg_1_1.dialog_, true)
				SetActive(arg_1_1.allBtn_.gameObject, true)
				arg_1_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_4_33 = 0.133334000000005

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				-- block empty
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 112.966699999999
			local var_4_35 = 0.65

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[323].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(116011001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 26
				local var_4_41 = utf8.len(var_4_39)
				local var_4_42 = var_4_40 <= 0 and var_4_35 or var_4_35 * (var_4_41 / var_4_40)

				if var_4_42 > 0 and var_4_35 < var_4_42 then
					arg_1_1.talkMaxDuration = var_4_42
					var_4_34 = var_4_34 + 0.3

					if var_4_42 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_42 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_39
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011001", "story_v_out_116011.awb") ~= 0 then
					local var_4_43 = manager.audio:GetVoiceLength("story_v_out_116011", "116011001", "story_v_out_116011.awb") / 1000

					if var_4_43 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_43 + var_4_34
					end

					if var_4_38.prefab_name ~= "" and arg_1_1.actors_[var_4_38.prefab_name] ~= nil then
						local var_4_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_38.prefab_name].transform, "story_v_out_116011", "116011001", "story_v_out_116011.awb")

						arg_1_1:RecordAudio("116011001", var_4_44)
						arg_1_1:RecordAudio("116011001", var_4_44)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_116011", "116011001", "story_v_out_116011.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_116011", "116011001", "story_v_out_116011.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_45 = var_4_34 + 0.3
			local var_4_46 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_45) / var_4_46

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play116011002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 116011002
		arg_9_1.duration_ = 1.999999999999

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play116011003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "2078ui_story"

			if arg_9_1.actors_[var_12_0] == nil then
				local var_12_1 = Object.Instantiate(Asset.Load("Char/" .. var_12_0), arg_9_1.stage_.transform)

				var_12_1.name = var_12_0
				var_12_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.actors_[var_12_0] = var_12_1

				local var_12_2 = var_12_1:GetComponentInChildren(typeof(CharacterEffect))

				var_12_2.enabled = true

				local var_12_3 = GameObjectTools.GetOrAddComponent(var_12_1, typeof(DynamicBoneHelper))

				if var_12_3 then
					var_12_3:EnableDynamicBone(false)
				end

				arg_9_1:ShowWeapon(var_12_2.transform, false)

				arg_9_1.var_[var_12_0 .. "Animator"] = var_12_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_9_1.var_[var_12_0 .. "Animator"].applyRootMotion = true
				arg_9_1.var_[var_12_0 .. "LipSync"] = var_12_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_12_4 = arg_9_1.actors_["2078ui_story"].transform
			local var_12_5 = 0

			if var_12_5 < arg_9_1.time_ and arg_9_1.time_ <= var_12_5 + arg_12_0 then
				arg_9_1.var_.moveOldPos2078ui_story = var_12_4.localPosition
			end

			local var_12_6 = 0.001

			if var_12_5 <= arg_9_1.time_ and arg_9_1.time_ < var_12_5 + var_12_6 then
				local var_12_7 = (arg_9_1.time_ - var_12_5) / var_12_6
				local var_12_8 = Vector3.New(-0.7, -1.28, -5.6)

				var_12_4.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos2078ui_story, var_12_8, var_12_7)

				local var_12_9 = manager.ui.mainCamera.transform.position - var_12_4.position

				var_12_4.forward = Vector3.New(var_12_9.x, var_12_9.y, var_12_9.z)

				local var_12_10 = var_12_4.localEulerAngles

				var_12_10.z = 0
				var_12_10.x = 0
				var_12_4.localEulerAngles = var_12_10
			end

			if arg_9_1.time_ >= var_12_5 + var_12_6 and arg_9_1.time_ < var_12_5 + var_12_6 + arg_12_0 then
				var_12_4.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_12_11 = manager.ui.mainCamera.transform.position - var_12_4.position

				var_12_4.forward = Vector3.New(var_12_11.x, var_12_11.y, var_12_11.z)

				local var_12_12 = var_12_4.localEulerAngles

				var_12_12.z = 0
				var_12_12.x = 0
				var_12_4.localEulerAngles = var_12_12
			end

			local var_12_13 = 0

			if var_12_13 < arg_9_1.time_ and arg_9_1.time_ <= var_12_13 + arg_12_0 then
				arg_9_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_12_14 = "2079ui_story"

			if arg_9_1.actors_[var_12_14] == nil then
				local var_12_15 = Object.Instantiate(Asset.Load("Char/" .. var_12_14), arg_9_1.stage_.transform)

				var_12_15.name = var_12_14
				var_12_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.actors_[var_12_14] = var_12_15

				local var_12_16 = var_12_15:GetComponentInChildren(typeof(CharacterEffect))

				var_12_16.enabled = true

				local var_12_17 = GameObjectTools.GetOrAddComponent(var_12_15, typeof(DynamicBoneHelper))

				if var_12_17 then
					var_12_17:EnableDynamicBone(false)
				end

				arg_9_1:ShowWeapon(var_12_16.transform, false)

				arg_9_1.var_[var_12_14 .. "Animator"] = var_12_16.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_9_1.var_[var_12_14 .. "Animator"].applyRootMotion = true
				arg_9_1.var_[var_12_14 .. "LipSync"] = var_12_16.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_12_18 = arg_9_1.actors_["2079ui_story"].transform
			local var_12_19 = 0

			if var_12_19 < arg_9_1.time_ and arg_9_1.time_ <= var_12_19 + arg_12_0 then
				arg_9_1.var_.moveOldPos2079ui_story = var_12_18.localPosition
			end

			local var_12_20 = 0.001

			if var_12_19 <= arg_9_1.time_ and arg_9_1.time_ < var_12_19 + var_12_20 then
				local var_12_21 = (arg_9_1.time_ - var_12_19) / var_12_20
				local var_12_22 = Vector3.New(0.7, -1.28, -5.6)

				var_12_18.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos2079ui_story, var_12_22, var_12_21)

				local var_12_23 = manager.ui.mainCamera.transform.position - var_12_18.position

				var_12_18.forward = Vector3.New(var_12_23.x, var_12_23.y, var_12_23.z)

				local var_12_24 = var_12_18.localEulerAngles

				var_12_24.z = 0
				var_12_24.x = 0
				var_12_18.localEulerAngles = var_12_24
			end

			if arg_9_1.time_ >= var_12_19 + var_12_20 and arg_9_1.time_ < var_12_19 + var_12_20 + arg_12_0 then
				var_12_18.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_12_25 = manager.ui.mainCamera.transform.position - var_12_18.position

				var_12_18.forward = Vector3.New(var_12_25.x, var_12_25.y, var_12_25.z)

				local var_12_26 = var_12_18.localEulerAngles

				var_12_26.z = 0
				var_12_26.x = 0
				var_12_18.localEulerAngles = var_12_26
			end

			local var_12_27 = 0

			if var_12_27 < arg_9_1.time_ and arg_9_1.time_ <= var_12_27 + arg_12_0 then
				arg_9_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_12_28 = arg_9_1.actors_["2078ui_story"]
			local var_12_29 = 0

			if var_12_29 < arg_9_1.time_ and arg_9_1.time_ <= var_12_29 + arg_12_0 and arg_9_1.var_.characterEffect2078ui_story == nil then
				arg_9_1.var_.characterEffect2078ui_story = var_12_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_30 = 0.2

			if var_12_29 <= arg_9_1.time_ and arg_9_1.time_ < var_12_29 + var_12_30 then
				local var_12_31 = (arg_9_1.time_ - var_12_29) / var_12_30

				if arg_9_1.var_.characterEffect2078ui_story then
					arg_9_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_29 + var_12_30 and arg_9_1.time_ < var_12_29 + var_12_30 + arg_12_0 and arg_9_1.var_.characterEffect2078ui_story then
				arg_9_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_12_32 = arg_9_1.actors_["2079ui_story"]
			local var_12_33 = 0

			if var_12_33 < arg_9_1.time_ and arg_9_1.time_ <= var_12_33 + arg_12_0 and arg_9_1.var_.characterEffect2079ui_story == nil then
				arg_9_1.var_.characterEffect2079ui_story = var_12_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_34 = 0.2

			if var_12_33 <= arg_9_1.time_ and arg_9_1.time_ < var_12_33 + var_12_34 then
				local var_12_35 = (arg_9_1.time_ - var_12_33) / var_12_34

				if arg_9_1.var_.characterEffect2079ui_story then
					arg_9_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_33 + var_12_34 and arg_9_1.time_ < var_12_33 + var_12_34 + arg_12_0 and arg_9_1.var_.characterEffect2079ui_story then
				arg_9_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_12_36 = 0
			local var_12_37 = 0.075

			if var_12_36 < arg_9_1.time_ and arg_9_1.time_ <= var_12_36 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_38 = arg_9_1:FormatText(StoryNameCfg[325].name)

				arg_9_1.leftNameTxt_.text = var_12_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_39 = arg_9_1:GetWordFromCfg(116011002)
				local var_12_40 = arg_9_1:FormatText(var_12_39.content)

				arg_9_1.text_.text = var_12_40

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_41 = 3
				local var_12_42 = utf8.len(var_12_40)
				local var_12_43 = var_12_41 <= 0 and var_12_37 or var_12_37 * (var_12_42 / var_12_41)

				if var_12_43 > 0 and var_12_37 < var_12_43 then
					arg_9_1.talkMaxDuration = var_12_43

					if var_12_43 + var_12_36 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_43 + var_12_36
					end
				end

				arg_9_1.text_.text = var_12_40
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011002", "story_v_out_116011.awb") ~= 0 then
					local var_12_44 = manager.audio:GetVoiceLength("story_v_out_116011", "116011002", "story_v_out_116011.awb") / 1000

					if var_12_44 + var_12_36 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_44 + var_12_36
					end

					if var_12_39.prefab_name ~= "" and arg_9_1.actors_[var_12_39.prefab_name] ~= nil then
						local var_12_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_39.prefab_name].transform, "story_v_out_116011", "116011002", "story_v_out_116011.awb")

						arg_9_1:RecordAudio("116011002", var_12_45)
						arg_9_1:RecordAudio("116011002", var_12_45)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_116011", "116011002", "story_v_out_116011.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_116011", "116011002", "story_v_out_116011.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_46 = math.max(var_12_37, arg_9_1.talkMaxDuration)

			if var_12_36 <= arg_9_1.time_ and arg_9_1.time_ < var_12_36 + var_12_46 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_36) / var_12_46

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_36 + var_12_46 and arg_9_1.time_ < var_12_36 + var_12_46 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play116011003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 116011003
		arg_13_1.duration_ = 12.833

		local var_13_0 = {
			zh = 6.866,
			ja = 12.833
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
				arg_13_0:Play116011004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["2078ui_story"]
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 and arg_13_1.var_.characterEffect2078ui_story == nil then
				arg_13_1.var_.characterEffect2078ui_story = var_16_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_2 = 0.2

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2

				if arg_13_1.var_.characterEffect2078ui_story then
					local var_16_4 = Mathf.Lerp(0, 0.5, var_16_3)

					arg_13_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_13_1.var_.characterEffect2078ui_story.fillRatio = var_16_4
				end
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 and arg_13_1.var_.characterEffect2078ui_story then
				local var_16_5 = 0.5

				arg_13_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_13_1.var_.characterEffect2078ui_story.fillRatio = var_16_5
			end

			local var_16_6 = arg_13_1.actors_["2079ui_story"]
			local var_16_7 = 0

			if var_16_7 < arg_13_1.time_ and arg_13_1.time_ <= var_16_7 + arg_16_0 and arg_13_1.var_.characterEffect2079ui_story == nil then
				arg_13_1.var_.characterEffect2079ui_story = var_16_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_8 = 0.2

			if var_16_7 <= arg_13_1.time_ and arg_13_1.time_ < var_16_7 + var_16_8 then
				local var_16_9 = (arg_13_1.time_ - var_16_7) / var_16_8

				if arg_13_1.var_.characterEffect2079ui_story then
					local var_16_10 = Mathf.Lerp(0, 0.5, var_16_9)

					arg_13_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_13_1.var_.characterEffect2079ui_story.fillRatio = var_16_10
				end
			end

			if arg_13_1.time_ >= var_16_7 + var_16_8 and arg_13_1.time_ < var_16_7 + var_16_8 + arg_16_0 and arg_13_1.var_.characterEffect2079ui_story then
				local var_16_11 = 0.5

				arg_13_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_13_1.var_.characterEffect2079ui_story.fillRatio = var_16_11
			end

			local var_16_12 = 0
			local var_16_13 = 0.925

			if var_16_12 < arg_13_1.time_ and arg_13_1.time_ <= var_16_12 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_14 = arg_13_1:FormatText(StoryNameCfg[323].name)

				arg_13_1.leftNameTxt_.text = var_16_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, true)
				arg_13_1.iconController_:SetSelectedState("hero")

				arg_13_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_15 = arg_13_1:GetWordFromCfg(116011003)
				local var_16_16 = arg_13_1:FormatText(var_16_15.content)

				arg_13_1.text_.text = var_16_16

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_17 = 37
				local var_16_18 = utf8.len(var_16_16)
				local var_16_19 = var_16_17 <= 0 and var_16_13 or var_16_13 * (var_16_18 / var_16_17)

				if var_16_19 > 0 and var_16_13 < var_16_19 then
					arg_13_1.talkMaxDuration = var_16_19

					if var_16_19 + var_16_12 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_19 + var_16_12
					end
				end

				arg_13_1.text_.text = var_16_16
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011003", "story_v_out_116011.awb") ~= 0 then
					local var_16_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011003", "story_v_out_116011.awb") / 1000

					if var_16_20 + var_16_12 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_20 + var_16_12
					end

					if var_16_15.prefab_name ~= "" and arg_13_1.actors_[var_16_15.prefab_name] ~= nil then
						local var_16_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_15.prefab_name].transform, "story_v_out_116011", "116011003", "story_v_out_116011.awb")

						arg_13_1:RecordAudio("116011003", var_16_21)
						arg_13_1:RecordAudio("116011003", var_16_21)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_116011", "116011003", "story_v_out_116011.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_116011", "116011003", "story_v_out_116011.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_22 = math.max(var_16_13, arg_13_1.talkMaxDuration)

			if var_16_12 <= arg_13_1.time_ and arg_13_1.time_ < var_16_12 + var_16_22 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_12) / var_16_22

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_12 + var_16_22 and arg_13_1.time_ < var_16_12 + var_16_22 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play116011004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 116011004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play116011005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.4

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_2 = arg_17_1:GetWordFromCfg(116011004)
				local var_20_3 = arg_17_1:FormatText(var_20_2.content)

				arg_17_1.text_.text = var_20_3

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_4 = 16
				local var_20_5 = utf8.len(var_20_3)
				local var_20_6 = var_20_4 <= 0 and var_20_1 or var_20_1 * (var_20_5 / var_20_4)

				if var_20_6 > 0 and var_20_1 < var_20_6 then
					arg_17_1.talkMaxDuration = var_20_6

					if var_20_6 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_6 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_3
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_7 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_7 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_7

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_7 and arg_17_1.time_ < var_20_0 + var_20_7 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play116011005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 116011005
		arg_21_1.duration_ = 4.133

		local var_21_0 = {
			zh = 2.833,
			ja = 4.133
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
				arg_21_0:Play116011006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["2078ui_story"]
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 and arg_21_1.var_.characterEffect2078ui_story == nil then
				arg_21_1.var_.characterEffect2078ui_story = var_24_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_2 = 0.2

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2

				if arg_21_1.var_.characterEffect2078ui_story then
					arg_21_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 and arg_21_1.var_.characterEffect2078ui_story then
				arg_21_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_24_4 = 0
			local var_24_5 = 0.45

			if var_24_4 < arg_21_1.time_ and arg_21_1.time_ <= var_24_4 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_6 = arg_21_1:FormatText(StoryNameCfg[320].name)

				arg_21_1.leftNameTxt_.text = var_24_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_7 = arg_21_1:GetWordFromCfg(116011005)
				local var_24_8 = arg_21_1:FormatText(var_24_7.content)

				arg_21_1.text_.text = var_24_8

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_9 = 18
				local var_24_10 = utf8.len(var_24_8)
				local var_24_11 = var_24_9 <= 0 and var_24_5 or var_24_5 * (var_24_10 / var_24_9)

				if var_24_11 > 0 and var_24_5 < var_24_11 then
					arg_21_1.talkMaxDuration = var_24_11

					if var_24_11 + var_24_4 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_11 + var_24_4
					end
				end

				arg_21_1.text_.text = var_24_8
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011005", "story_v_out_116011.awb") ~= 0 then
					local var_24_12 = manager.audio:GetVoiceLength("story_v_out_116011", "116011005", "story_v_out_116011.awb") / 1000

					if var_24_12 + var_24_4 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_12 + var_24_4
					end

					if var_24_7.prefab_name ~= "" and arg_21_1.actors_[var_24_7.prefab_name] ~= nil then
						local var_24_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_7.prefab_name].transform, "story_v_out_116011", "116011005", "story_v_out_116011.awb")

						arg_21_1:RecordAudio("116011005", var_24_13)
						arg_21_1:RecordAudio("116011005", var_24_13)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_116011", "116011005", "story_v_out_116011.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_116011", "116011005", "story_v_out_116011.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_14 = math.max(var_24_5, arg_21_1.talkMaxDuration)

			if var_24_4 <= arg_21_1.time_ and arg_21_1.time_ < var_24_4 + var_24_14 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_4) / var_24_14

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_4 + var_24_14 and arg_21_1.time_ < var_24_4 + var_24_14 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play116011006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 116011006
		arg_25_1.duration_ = 2.5

		local var_25_0 = {
			zh = 1.6,
			ja = 2.5
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
				arg_25_0:Play116011007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["2078ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.characterEffect2078ui_story == nil then
				arg_25_1.var_.characterEffect2078ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.2

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect2078ui_story then
					local var_28_4 = Mathf.Lerp(0, 0.5, var_28_3)

					arg_25_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_25_1.var_.characterEffect2078ui_story.fillRatio = var_28_4
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.characterEffect2078ui_story then
				local var_28_5 = 0.5

				arg_25_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_25_1.var_.characterEffect2078ui_story.fillRatio = var_28_5
			end

			local var_28_6 = arg_25_1.actors_["2079ui_story"]
			local var_28_7 = 0

			if var_28_7 < arg_25_1.time_ and arg_25_1.time_ <= var_28_7 + arg_28_0 and arg_25_1.var_.characterEffect2079ui_story == nil then
				arg_25_1.var_.characterEffect2079ui_story = var_28_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_8 = 0.2

			if var_28_7 <= arg_25_1.time_ and arg_25_1.time_ < var_28_7 + var_28_8 then
				local var_28_9 = (arg_25_1.time_ - var_28_7) / var_28_8

				if arg_25_1.var_.characterEffect2079ui_story then
					arg_25_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_7 + var_28_8 and arg_25_1.time_ < var_28_7 + var_28_8 + arg_28_0 and arg_25_1.var_.characterEffect2079ui_story then
				arg_25_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_28_10 = 0
			local var_28_11 = 0.175

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_12 = arg_25_1:FormatText(StoryNameCfg[321].name)

				arg_25_1.leftNameTxt_.text = var_28_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_13 = arg_25_1:GetWordFromCfg(116011006)
				local var_28_14 = arg_25_1:FormatText(var_28_13.content)

				arg_25_1.text_.text = var_28_14

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_15 = 7
				local var_28_16 = utf8.len(var_28_14)
				local var_28_17 = var_28_15 <= 0 and var_28_11 or var_28_11 * (var_28_16 / var_28_15)

				if var_28_17 > 0 and var_28_11 < var_28_17 then
					arg_25_1.talkMaxDuration = var_28_17

					if var_28_17 + var_28_10 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_17 + var_28_10
					end
				end

				arg_25_1.text_.text = var_28_14
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011006", "story_v_out_116011.awb") ~= 0 then
					local var_28_18 = manager.audio:GetVoiceLength("story_v_out_116011", "116011006", "story_v_out_116011.awb") / 1000

					if var_28_18 + var_28_10 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_18 + var_28_10
					end

					if var_28_13.prefab_name ~= "" and arg_25_1.actors_[var_28_13.prefab_name] ~= nil then
						local var_28_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_13.prefab_name].transform, "story_v_out_116011", "116011006", "story_v_out_116011.awb")

						arg_25_1:RecordAudio("116011006", var_28_19)
						arg_25_1:RecordAudio("116011006", var_28_19)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_116011", "116011006", "story_v_out_116011.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_116011", "116011006", "story_v_out_116011.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_20 = math.max(var_28_11, arg_25_1.talkMaxDuration)

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_20 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_10) / var_28_20

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_10 + var_28_20 and arg_25_1.time_ < var_28_10 + var_28_20 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play116011007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 116011007
		arg_29_1.duration_ = 5.833

		local var_29_0 = {
			zh = 5.833,
			ja = 5.133
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
				arg_29_0:Play116011008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["2078ui_story"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.characterEffect2078ui_story == nil then
				arg_29_1.var_.characterEffect2078ui_story = var_32_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_2 = 0.2

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.characterEffect2078ui_story then
					arg_29_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.characterEffect2078ui_story then
				arg_29_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_32_4 = arg_29_1.actors_["2079ui_story"]
			local var_32_5 = 0

			if var_32_5 < arg_29_1.time_ and arg_29_1.time_ <= var_32_5 + arg_32_0 and arg_29_1.var_.characterEffect2079ui_story == nil then
				arg_29_1.var_.characterEffect2079ui_story = var_32_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_6 = 0.2

			if var_32_5 <= arg_29_1.time_ and arg_29_1.time_ < var_32_5 + var_32_6 then
				local var_32_7 = (arg_29_1.time_ - var_32_5) / var_32_6

				if arg_29_1.var_.characterEffect2079ui_story then
					local var_32_8 = Mathf.Lerp(0, 0.5, var_32_7)

					arg_29_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_29_1.var_.characterEffect2079ui_story.fillRatio = var_32_8
				end
			end

			if arg_29_1.time_ >= var_32_5 + var_32_6 and arg_29_1.time_ < var_32_5 + var_32_6 + arg_32_0 and arg_29_1.var_.characterEffect2079ui_story then
				local var_32_9 = 0.5

				arg_29_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_29_1.var_.characterEffect2079ui_story.fillRatio = var_32_9
			end

			local var_32_10 = 0
			local var_32_11 = 0.975

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_12 = arg_29_1:FormatText(StoryNameCfg[320].name)

				arg_29_1.leftNameTxt_.text = var_32_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_13 = arg_29_1:GetWordFromCfg(116011007)
				local var_32_14 = arg_29_1:FormatText(var_32_13.content)

				arg_29_1.text_.text = var_32_14

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_15 = 39
				local var_32_16 = utf8.len(var_32_14)
				local var_32_17 = var_32_15 <= 0 and var_32_11 or var_32_11 * (var_32_16 / var_32_15)

				if var_32_17 > 0 and var_32_11 < var_32_17 then
					arg_29_1.talkMaxDuration = var_32_17

					if var_32_17 + var_32_10 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_17 + var_32_10
					end
				end

				arg_29_1.text_.text = var_32_14
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011007", "story_v_out_116011.awb") ~= 0 then
					local var_32_18 = manager.audio:GetVoiceLength("story_v_out_116011", "116011007", "story_v_out_116011.awb") / 1000

					if var_32_18 + var_32_10 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_18 + var_32_10
					end

					if var_32_13.prefab_name ~= "" and arg_29_1.actors_[var_32_13.prefab_name] ~= nil then
						local var_32_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_13.prefab_name].transform, "story_v_out_116011", "116011007", "story_v_out_116011.awb")

						arg_29_1:RecordAudio("116011007", var_32_19)
						arg_29_1:RecordAudio("116011007", var_32_19)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_116011", "116011007", "story_v_out_116011.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_116011", "116011007", "story_v_out_116011.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_20 = math.max(var_32_11, arg_29_1.talkMaxDuration)

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_20 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_10) / var_32_20

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_10 + var_32_20 and arg_29_1.time_ < var_32_10 + var_32_20 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play116011008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 116011008
		arg_33_1.duration_ = 5.8

		local var_33_0 = {
			zh = 3.533,
			ja = 5.8
		}
		local var_33_1 = manager.audio:GetLocalizationFlag()

		if var_33_0[var_33_1] ~= nil then
			arg_33_1.duration_ = var_33_0[var_33_1]
		end

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play116011009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["2078ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect2078ui_story == nil then
				arg_33_1.var_.characterEffect2078ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.2

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect2078ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_33_1.var_.characterEffect2078ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect2078ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_33_1.var_.characterEffect2078ui_story.fillRatio = var_36_5
			end

			local var_36_6 = arg_33_1.actors_["2079ui_story"]
			local var_36_7 = 0

			if var_36_7 < arg_33_1.time_ and arg_33_1.time_ <= var_36_7 + arg_36_0 and arg_33_1.var_.characterEffect2079ui_story == nil then
				arg_33_1.var_.characterEffect2079ui_story = var_36_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_8 = 0.2

			if var_36_7 <= arg_33_1.time_ and arg_33_1.time_ < var_36_7 + var_36_8 then
				local var_36_9 = (arg_33_1.time_ - var_36_7) / var_36_8

				if arg_33_1.var_.characterEffect2079ui_story then
					arg_33_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_7 + var_36_8 and arg_33_1.time_ < var_36_7 + var_36_8 + arg_36_0 and arg_33_1.var_.characterEffect2079ui_story then
				arg_33_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_36_10 = 0
			local var_36_11 = 0.325

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_12 = arg_33_1:FormatText(StoryNameCfg[321].name)

				arg_33_1.leftNameTxt_.text = var_36_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_13 = arg_33_1:GetWordFromCfg(116011008)
				local var_36_14 = arg_33_1:FormatText(var_36_13.content)

				arg_33_1.text_.text = var_36_14

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_15 = 13
				local var_36_16 = utf8.len(var_36_14)
				local var_36_17 = var_36_15 <= 0 and var_36_11 or var_36_11 * (var_36_16 / var_36_15)

				if var_36_17 > 0 and var_36_11 < var_36_17 then
					arg_33_1.talkMaxDuration = var_36_17

					if var_36_17 + var_36_10 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_17 + var_36_10
					end
				end

				arg_33_1.text_.text = var_36_14
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011008", "story_v_out_116011.awb") ~= 0 then
					local var_36_18 = manager.audio:GetVoiceLength("story_v_out_116011", "116011008", "story_v_out_116011.awb") / 1000

					if var_36_18 + var_36_10 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_18 + var_36_10
					end

					if var_36_13.prefab_name ~= "" and arg_33_1.actors_[var_36_13.prefab_name] ~= nil then
						local var_36_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_13.prefab_name].transform, "story_v_out_116011", "116011008", "story_v_out_116011.awb")

						arg_33_1:RecordAudio("116011008", var_36_19)
						arg_33_1:RecordAudio("116011008", var_36_19)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_116011", "116011008", "story_v_out_116011.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_116011", "116011008", "story_v_out_116011.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_20 = math.max(var_36_11, arg_33_1.talkMaxDuration)

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_20 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_10) / var_36_20

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_10 + var_36_20 and arg_33_1.time_ < var_36_10 + var_36_20 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play116011009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 116011009
		arg_37_1.duration_ = 8.766

		local var_37_0 = {
			zh = 5.6,
			ja = 8.766
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
				arg_37_0:Play116011010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.65

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[321].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(116011009)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 26
				local var_40_6 = utf8.len(var_40_4)
				local var_40_7 = var_40_5 <= 0 and var_40_1 or var_40_1 * (var_40_6 / var_40_5)

				if var_40_7 > 0 and var_40_1 < var_40_7 then
					arg_37_1.talkMaxDuration = var_40_7

					if var_40_7 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_7 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_4
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011009", "story_v_out_116011.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_out_116011", "116011009", "story_v_out_116011.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_out_116011", "116011009", "story_v_out_116011.awb")

						arg_37_1:RecordAudio("116011009", var_40_9)
						arg_37_1:RecordAudio("116011009", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_116011", "116011009", "story_v_out_116011.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_116011", "116011009", "story_v_out_116011.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_10 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_10 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_10

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_10 and arg_37_1.time_ < var_40_0 + var_40_10 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play116011010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 116011010
		arg_41_1.duration_ = 11.233

		local var_41_0 = {
			zh = 7.166,
			ja = 11.233
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
				arg_41_0:Play116011011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["2079ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect2079ui_story == nil then
				arg_41_1.var_.characterEffect2079ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect2079ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_41_1.var_.characterEffect2079ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect2079ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_41_1.var_.characterEffect2079ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0
			local var_44_7 = 0.95

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_8 = arg_41_1:FormatText(StoryNameCfg[323].name)

				arg_41_1.leftNameTxt_.text = var_44_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_9 = arg_41_1:GetWordFromCfg(116011010)
				local var_44_10 = arg_41_1:FormatText(var_44_9.content)

				arg_41_1.text_.text = var_44_10

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_11 = 38
				local var_44_12 = utf8.len(var_44_10)
				local var_44_13 = var_44_11 <= 0 and var_44_7 or var_44_7 * (var_44_12 / var_44_11)

				if var_44_13 > 0 and var_44_7 < var_44_13 then
					arg_41_1.talkMaxDuration = var_44_13

					if var_44_13 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_13 + var_44_6
					end
				end

				arg_41_1.text_.text = var_44_10
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011010", "story_v_out_116011.awb") ~= 0 then
					local var_44_14 = manager.audio:GetVoiceLength("story_v_out_116011", "116011010", "story_v_out_116011.awb") / 1000

					if var_44_14 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_14 + var_44_6
					end

					if var_44_9.prefab_name ~= "" and arg_41_1.actors_[var_44_9.prefab_name] ~= nil then
						local var_44_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_9.prefab_name].transform, "story_v_out_116011", "116011010", "story_v_out_116011.awb")

						arg_41_1:RecordAudio("116011010", var_44_15)
						arg_41_1:RecordAudio("116011010", var_44_15)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_116011", "116011010", "story_v_out_116011.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_116011", "116011010", "story_v_out_116011.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_16 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_16 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_16

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_16 and arg_41_1.time_ < var_44_6 + var_44_16 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play116011011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 116011011
		arg_45_1.duration_ = 7.133

		local var_45_0 = {
			zh = 7.133,
			ja = 6.6
		}
		local var_45_1 = manager.audio:GetLocalizationFlag()

		if var_45_0[var_45_1] ~= nil then
			arg_45_1.duration_ = var_45_0[var_45_1]
		end

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play116011012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["2078ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect2078ui_story == nil then
				arg_45_1.var_.characterEffect2078ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.2

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect2078ui_story then
					arg_45_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect2078ui_story then
				arg_45_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_48_4 = 0
			local var_48_5 = 1

			if var_48_4 < arg_45_1.time_ and arg_45_1.time_ <= var_48_4 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_6 = arg_45_1:FormatText(StoryNameCfg[320].name)

				arg_45_1.leftNameTxt_.text = var_48_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_7 = arg_45_1:GetWordFromCfg(116011011)
				local var_48_8 = arg_45_1:FormatText(var_48_7.content)

				arg_45_1.text_.text = var_48_8

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_9 = 40
				local var_48_10 = utf8.len(var_48_8)
				local var_48_11 = var_48_9 <= 0 and var_48_5 or var_48_5 * (var_48_10 / var_48_9)

				if var_48_11 > 0 and var_48_5 < var_48_11 then
					arg_45_1.talkMaxDuration = var_48_11

					if var_48_11 + var_48_4 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_11 + var_48_4
					end
				end

				arg_45_1.text_.text = var_48_8
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011011", "story_v_out_116011.awb") ~= 0 then
					local var_48_12 = manager.audio:GetVoiceLength("story_v_out_116011", "116011011", "story_v_out_116011.awb") / 1000

					if var_48_12 + var_48_4 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_12 + var_48_4
					end

					if var_48_7.prefab_name ~= "" and arg_45_1.actors_[var_48_7.prefab_name] ~= nil then
						local var_48_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_7.prefab_name].transform, "story_v_out_116011", "116011011", "story_v_out_116011.awb")

						arg_45_1:RecordAudio("116011011", var_48_13)
						arg_45_1:RecordAudio("116011011", var_48_13)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_116011", "116011011", "story_v_out_116011.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_116011", "116011011", "story_v_out_116011.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_14 = math.max(var_48_5, arg_45_1.talkMaxDuration)

			if var_48_4 <= arg_45_1.time_ and arg_45_1.time_ < var_48_4 + var_48_14 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_4) / var_48_14

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_4 + var_48_14 and arg_45_1.time_ < var_48_4 + var_48_14 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play116011012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 116011012
		arg_49_1.duration_ = 5.833

		local var_49_0 = {
			zh = 4.566,
			ja = 5.833
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
				arg_49_0:Play116011013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["2078ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect2078ui_story == nil then
				arg_49_1.var_.characterEffect2078ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.2

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect2078ui_story then
					local var_52_4 = Mathf.Lerp(0, 0.5, var_52_3)

					arg_49_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_49_1.var_.characterEffect2078ui_story.fillRatio = var_52_4
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect2078ui_story then
				local var_52_5 = 0.5

				arg_49_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_49_1.var_.characterEffect2078ui_story.fillRatio = var_52_5
			end

			local var_52_6 = 0
			local var_52_7 = 0.625

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_8 = arg_49_1:FormatText(StoryNameCfg[322].name)

				arg_49_1.leftNameTxt_.text = var_52_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, true)
				arg_49_1.iconController_:SetSelectedState("hero")

				arg_49_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_9 = arg_49_1:GetWordFromCfg(116011012)
				local var_52_10 = arg_49_1:FormatText(var_52_9.content)

				arg_49_1.text_.text = var_52_10

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_11 = 25
				local var_52_12 = utf8.len(var_52_10)
				local var_52_13 = var_52_11 <= 0 and var_52_7 or var_52_7 * (var_52_12 / var_52_11)

				if var_52_13 > 0 and var_52_7 < var_52_13 then
					arg_49_1.talkMaxDuration = var_52_13

					if var_52_13 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_13 + var_52_6
					end
				end

				arg_49_1.text_.text = var_52_10
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011012", "story_v_out_116011.awb") ~= 0 then
					local var_52_14 = manager.audio:GetVoiceLength("story_v_out_116011", "116011012", "story_v_out_116011.awb") / 1000

					if var_52_14 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_14 + var_52_6
					end

					if var_52_9.prefab_name ~= "" and arg_49_1.actors_[var_52_9.prefab_name] ~= nil then
						local var_52_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_9.prefab_name].transform, "story_v_out_116011", "116011012", "story_v_out_116011.awb")

						arg_49_1:RecordAudio("116011012", var_52_15)
						arg_49_1:RecordAudio("116011012", var_52_15)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_116011", "116011012", "story_v_out_116011.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_116011", "116011012", "story_v_out_116011.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_16 = math.max(var_52_7, arg_49_1.talkMaxDuration)

			if var_52_6 <= arg_49_1.time_ and arg_49_1.time_ < var_52_6 + var_52_16 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_6) / var_52_16

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_6 + var_52_16 and arg_49_1.time_ < var_52_6 + var_52_16 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play116011013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 116011013
		arg_53_1.duration_ = 7.266

		local var_53_0 = {
			zh = 4.366,
			ja = 7.266
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
				arg_53_0:Play116011014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.625

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[323].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, true)
				arg_53_1.iconController_:SetSelectedState("hero")

				arg_53_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(116011013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 25
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011013", "story_v_out_116011.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_116011", "116011013", "story_v_out_116011.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_116011", "116011013", "story_v_out_116011.awb")

						arg_53_1:RecordAudio("116011013", var_56_9)
						arg_53_1:RecordAudio("116011013", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_116011", "116011013", "story_v_out_116011.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_116011", "116011013", "story_v_out_116011.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_10 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_10 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_10

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_10 and arg_53_1.time_ < var_56_0 + var_56_10 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play116011014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 116011014
		arg_57_1.duration_ = 7

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play116011015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.bgs_.I05f
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				local var_60_2 = var_60_0:GetComponent("SpriteRenderer")

				if var_60_2 then
					var_60_2.material = arg_57_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_60_3 = var_60_2.material
					local var_60_4 = var_60_3:GetColor("_Color")

					arg_57_1.var_.alphaOldValueI05f = var_60_4.a
					arg_57_1.var_.alphaMatValueI05f = var_60_3
				end

				arg_57_1.var_.alphaOldValueI05f = 1
			end

			local var_60_5 = 2

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_5 then
				local var_60_6 = (arg_57_1.time_ - var_60_1) / var_60_5
				local var_60_7 = Mathf.Lerp(arg_57_1.var_.alphaOldValueI05f, 0, var_60_6)

				if arg_57_1.var_.alphaMatValueI05f then
					local var_60_8 = arg_57_1.var_.alphaMatValueI05f
					local var_60_9 = var_60_8:GetColor("_Color")

					var_60_9.a = var_60_7

					var_60_8:SetColor("_Color", var_60_9)
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_5 and arg_57_1.time_ < var_60_1 + var_60_5 + arg_60_0 and arg_57_1.var_.alphaMatValueI05f then
				local var_60_10 = arg_57_1.var_.alphaMatValueI05f
				local var_60_11 = var_60_10:GetColor("_Color")

				var_60_11.a = 0

				var_60_10:SetColor("_Color", var_60_11)
			end

			local var_60_12 = 0

			if var_60_12 < arg_57_1.time_ and arg_57_1.time_ <= var_60_12 + arg_60_0 then
				arg_57_1.allBtn_.enabled = false
			end

			local var_60_13 = 2

			if arg_57_1.time_ >= var_60_12 + var_60_13 and arg_57_1.time_ < var_60_12 + var_60_13 + arg_60_0 then
				arg_57_1.allBtn_.enabled = true
			end

			local var_60_14 = 2
			local var_60_15 = 0.6

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 then
				local var_60_16 = "play"
				local var_60_17 = "effect"

				arg_57_1:AudioAction(var_60_16, var_60_17, "se_story_16", "se_story_16_gun_highpass", "")
			end

			local var_60_18 = arg_57_1.actors_["2078ui_story"].transform
			local var_60_19 = 0

			if var_60_19 < arg_57_1.time_ and arg_57_1.time_ <= var_60_19 + arg_60_0 then
				arg_57_1.var_.moveOldPos2078ui_story = var_60_18.localPosition
			end

			local var_60_20 = 0.001

			if var_60_19 <= arg_57_1.time_ and arg_57_1.time_ < var_60_19 + var_60_20 then
				local var_60_21 = (arg_57_1.time_ - var_60_19) / var_60_20
				local var_60_22 = Vector3.New(0, 100, 0)

				var_60_18.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos2078ui_story, var_60_22, var_60_21)

				local var_60_23 = manager.ui.mainCamera.transform.position - var_60_18.position

				var_60_18.forward = Vector3.New(var_60_23.x, var_60_23.y, var_60_23.z)

				local var_60_24 = var_60_18.localEulerAngles

				var_60_24.z = 0
				var_60_24.x = 0
				var_60_18.localEulerAngles = var_60_24
			end

			if arg_57_1.time_ >= var_60_19 + var_60_20 and arg_57_1.time_ < var_60_19 + var_60_20 + arg_60_0 then
				var_60_18.localPosition = Vector3.New(0, 100, 0)

				local var_60_25 = manager.ui.mainCamera.transform.position - var_60_18.position

				var_60_18.forward = Vector3.New(var_60_25.x, var_60_25.y, var_60_25.z)

				local var_60_26 = var_60_18.localEulerAngles

				var_60_26.z = 0
				var_60_26.x = 0
				var_60_18.localEulerAngles = var_60_26
			end

			local var_60_27 = arg_57_1.actors_["2079ui_story"].transform
			local var_60_28 = 0

			if var_60_28 < arg_57_1.time_ and arg_57_1.time_ <= var_60_28 + arg_60_0 then
				arg_57_1.var_.moveOldPos2079ui_story = var_60_27.localPosition
			end

			local var_60_29 = 0.001

			if var_60_28 <= arg_57_1.time_ and arg_57_1.time_ < var_60_28 + var_60_29 then
				local var_60_30 = (arg_57_1.time_ - var_60_28) / var_60_29
				local var_60_31 = Vector3.New(0, 100, 0)

				var_60_27.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos2079ui_story, var_60_31, var_60_30)

				local var_60_32 = manager.ui.mainCamera.transform.position - var_60_27.position

				var_60_27.forward = Vector3.New(var_60_32.x, var_60_32.y, var_60_32.z)

				local var_60_33 = var_60_27.localEulerAngles

				var_60_33.z = 0
				var_60_33.x = 0
				var_60_27.localEulerAngles = var_60_33
			end

			if arg_57_1.time_ >= var_60_28 + var_60_29 and arg_57_1.time_ < var_60_28 + var_60_29 + arg_60_0 then
				var_60_27.localPosition = Vector3.New(0, 100, 0)

				local var_60_34 = manager.ui.mainCamera.transform.position - var_60_27.position

				var_60_27.forward = Vector3.New(var_60_34.x, var_60_34.y, var_60_34.z)

				local var_60_35 = var_60_27.localEulerAngles

				var_60_35.z = 0
				var_60_35.x = 0
				var_60_27.localEulerAngles = var_60_35
			end

			if arg_57_1.frameCnt_ <= 1 then
				arg_57_1.dialog_:SetActive(false)
			end

			local var_60_36 = 2
			local var_60_37 = 0.05

			if var_60_36 < arg_57_1.time_ and arg_57_1.time_ <= var_60_36 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0

				arg_57_1.dialog_:SetActive(true)

				local var_60_38 = LeanTween.value(arg_57_1.dialog_, 0, 1, 0.3)

				var_60_38:setOnUpdate(LuaHelper.FloatAction(function(arg_61_0)
					arg_57_1.dialogCg_.alpha = arg_61_0
				end))
				var_60_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_57_1.dialog_)
					var_60_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_57_1.duration_ = arg_57_1.duration_ + 0.3

				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_39 = arg_57_1:GetWordFromCfg(116011014)
				local var_60_40 = arg_57_1:FormatText(var_60_39.content)

				arg_57_1.text_.text = var_60_40

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_41 = 2
				local var_60_42 = utf8.len(var_60_40)
				local var_60_43 = var_60_41 <= 0 and var_60_37 or var_60_37 * (var_60_42 / var_60_41)

				if var_60_43 > 0 and var_60_37 < var_60_43 then
					arg_57_1.talkMaxDuration = var_60_43
					var_60_36 = var_60_36 + 0.3

					if var_60_43 + var_60_36 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_43 + var_60_36
					end
				end

				arg_57_1.text_.text = var_60_40
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_44 = var_60_36 + 0.3
			local var_60_45 = math.max(var_60_37, arg_57_1.talkMaxDuration)

			if var_60_44 <= arg_57_1.time_ and arg_57_1.time_ < var_60_44 + var_60_45 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_44) / var_60_45

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_44 + var_60_45 and arg_57_1.time_ < var_60_44 + var_60_45 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play116011015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 116011015
		arg_63_1.duration_ = 4.633333333332

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play116011016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.bgs_.I05f
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				local var_66_2 = var_66_0:GetComponent("SpriteRenderer")

				if var_66_2 then
					var_66_2.material = arg_63_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_66_3 = var_66_2.material
					local var_66_4 = var_66_3:GetColor("_Color")

					arg_63_1.var_.alphaOldValueI05f = var_66_4.a
					arg_63_1.var_.alphaMatValueI05f = var_66_3
				end

				arg_63_1.var_.alphaOldValueI05f = 0
			end

			local var_66_5 = 2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_5 then
				local var_66_6 = (arg_63_1.time_ - var_66_1) / var_66_5
				local var_66_7 = Mathf.Lerp(arg_63_1.var_.alphaOldValueI05f, 1, var_66_6)

				if arg_63_1.var_.alphaMatValueI05f then
					local var_66_8 = arg_63_1.var_.alphaMatValueI05f
					local var_66_9 = var_66_8:GetColor("_Color")

					var_66_9.a = var_66_7

					var_66_8:SetColor("_Color", var_66_9)
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_5 and arg_63_1.time_ < var_66_1 + var_66_5 + arg_66_0 and arg_63_1.var_.alphaMatValueI05f then
				local var_66_10 = arg_63_1.var_.alphaMatValueI05f
				local var_66_11 = var_66_10:GetColor("_Color")

				var_66_11.a = 1

				var_66_10:SetColor("_Color", var_66_11)
			end

			local var_66_12 = 0

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.allBtn_.enabled = false
			end

			local var_66_13 = 2

			if arg_63_1.time_ >= var_66_12 + var_66_13 and arg_63_1.time_ < var_66_12 + var_66_13 + arg_66_0 then
				arg_63_1.allBtn_.enabled = true
			end

			local var_66_14 = arg_63_1.actors_["2078ui_story"].transform
			local var_66_15 = 1.8

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 then
				arg_63_1.var_.moveOldPos2078ui_story = var_66_14.localPosition
			end

			local var_66_16 = 0.001

			if var_66_15 <= arg_63_1.time_ and arg_63_1.time_ < var_66_15 + var_66_16 then
				local var_66_17 = (arg_63_1.time_ - var_66_15) / var_66_16
				local var_66_18 = Vector3.New(-0.7, -1.28, -5.6)

				var_66_14.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2078ui_story, var_66_18, var_66_17)

				local var_66_19 = manager.ui.mainCamera.transform.position - var_66_14.position

				var_66_14.forward = Vector3.New(var_66_19.x, var_66_19.y, var_66_19.z)

				local var_66_20 = var_66_14.localEulerAngles

				var_66_20.z = 0
				var_66_20.x = 0
				var_66_14.localEulerAngles = var_66_20
			end

			if arg_63_1.time_ >= var_66_15 + var_66_16 and arg_63_1.time_ < var_66_15 + var_66_16 + arg_66_0 then
				var_66_14.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_66_21 = manager.ui.mainCamera.transform.position - var_66_14.position

				var_66_14.forward = Vector3.New(var_66_21.x, var_66_21.y, var_66_21.z)

				local var_66_22 = var_66_14.localEulerAngles

				var_66_22.z = 0
				var_66_22.x = 0
				var_66_14.localEulerAngles = var_66_22
			end

			local var_66_23 = 1.8

			if var_66_23 < arg_63_1.time_ and arg_63_1.time_ <= var_66_23 + arg_66_0 then
				arg_63_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_66_24 = arg_63_1.actors_["2079ui_story"].transform
			local var_66_25 = 1.8

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 then
				arg_63_1.var_.moveOldPos2079ui_story = var_66_24.localPosition
			end

			local var_66_26 = 0.001

			if var_66_25 <= arg_63_1.time_ and arg_63_1.time_ < var_66_25 + var_66_26 then
				local var_66_27 = (arg_63_1.time_ - var_66_25) / var_66_26
				local var_66_28 = Vector3.New(0.7, -1.28, -5.6)

				var_66_24.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2079ui_story, var_66_28, var_66_27)

				local var_66_29 = manager.ui.mainCamera.transform.position - var_66_24.position

				var_66_24.forward = Vector3.New(var_66_29.x, var_66_29.y, var_66_29.z)

				local var_66_30 = var_66_24.localEulerAngles

				var_66_30.z = 0
				var_66_30.x = 0
				var_66_24.localEulerAngles = var_66_30
			end

			if arg_63_1.time_ >= var_66_25 + var_66_26 and arg_63_1.time_ < var_66_25 + var_66_26 + arg_66_0 then
				var_66_24.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_66_31 = manager.ui.mainCamera.transform.position - var_66_24.position

				var_66_24.forward = Vector3.New(var_66_31.x, var_66_31.y, var_66_31.z)

				local var_66_32 = var_66_24.localEulerAngles

				var_66_32.z = 0
				var_66_32.x = 0
				var_66_24.localEulerAngles = var_66_32
			end

			local var_66_33 = 1.8

			if var_66_33 < arg_63_1.time_ and arg_63_1.time_ <= var_66_33 + arg_66_0 then
				arg_63_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_66_34 = arg_63_1.actors_["2078ui_story"]
			local var_66_35 = 1.8

			if var_66_35 < arg_63_1.time_ and arg_63_1.time_ <= var_66_35 + arg_66_0 and arg_63_1.var_.characterEffect2078ui_story == nil then
				arg_63_1.var_.characterEffect2078ui_story = var_66_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_36 = 0.2

			if var_66_35 <= arg_63_1.time_ and arg_63_1.time_ < var_66_35 + var_66_36 then
				local var_66_37 = (arg_63_1.time_ - var_66_35) / var_66_36

				if arg_63_1.var_.characterEffect2078ui_story then
					local var_66_38 = Mathf.Lerp(0, 0.5, var_66_37)

					arg_63_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_63_1.var_.characterEffect2078ui_story.fillRatio = var_66_38
				end
			end

			if arg_63_1.time_ >= var_66_35 + var_66_36 and arg_63_1.time_ < var_66_35 + var_66_36 + arg_66_0 and arg_63_1.var_.characterEffect2078ui_story then
				local var_66_39 = 0.5

				arg_63_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_63_1.var_.characterEffect2078ui_story.fillRatio = var_66_39
			end

			local var_66_40 = arg_63_1.actors_["2079ui_story"]
			local var_66_41 = 1.8

			if var_66_41 < arg_63_1.time_ and arg_63_1.time_ <= var_66_41 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story == nil then
				arg_63_1.var_.characterEffect2079ui_story = var_66_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_42 = 0.2

			if var_66_41 <= arg_63_1.time_ and arg_63_1.time_ < var_66_41 + var_66_42 then
				local var_66_43 = (arg_63_1.time_ - var_66_41) / var_66_42

				if arg_63_1.var_.characterEffect2079ui_story then
					arg_63_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_41 + var_66_42 and arg_63_1.time_ < var_66_41 + var_66_42 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story then
				arg_63_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_44 = 2
			local var_66_45 = 0.15

			if var_66_44 < arg_63_1.time_ and arg_63_1.time_ <= var_66_44 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_46 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_46:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_47 = arg_63_1:FormatText(StoryNameCfg[321].name)

				arg_63_1.leftNameTxt_.text = var_66_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_48 = arg_63_1:GetWordFromCfg(116011015)
				local var_66_49 = arg_63_1:FormatText(var_66_48.content)

				arg_63_1.text_.text = var_66_49

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_50 = 6
				local var_66_51 = utf8.len(var_66_49)
				local var_66_52 = var_66_50 <= 0 and var_66_45 or var_66_45 * (var_66_51 / var_66_50)

				if var_66_52 > 0 and var_66_45 < var_66_52 then
					arg_63_1.talkMaxDuration = var_66_52
					var_66_44 = var_66_44 + 0.3

					if var_66_52 + var_66_44 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_52 + var_66_44
					end
				end

				arg_63_1.text_.text = var_66_49
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011015", "story_v_out_116011.awb") ~= 0 then
					local var_66_53 = manager.audio:GetVoiceLength("story_v_out_116011", "116011015", "story_v_out_116011.awb") / 1000

					if var_66_53 + var_66_44 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_53 + var_66_44
					end

					if var_66_48.prefab_name ~= "" and arg_63_1.actors_[var_66_48.prefab_name] ~= nil then
						local var_66_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_48.prefab_name].transform, "story_v_out_116011", "116011015", "story_v_out_116011.awb")

						arg_63_1:RecordAudio("116011015", var_66_54)
						arg_63_1:RecordAudio("116011015", var_66_54)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_116011", "116011015", "story_v_out_116011.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_116011", "116011015", "story_v_out_116011.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_55 = var_66_44 + 0.3
			local var_66_56 = math.max(var_66_45, arg_63_1.talkMaxDuration)

			if var_66_55 <= arg_63_1.time_ and arg_63_1.time_ < var_66_55 + var_66_56 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_55) / var_66_56

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_55 + var_66_56 and arg_63_1.time_ < var_66_55 + var_66_56 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play116011016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 116011016
		arg_69_1.duration_ = 5.466

		local var_69_0 = {
			zh = 3.766,
			ja = 5.466
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
				arg_69_0:Play116011017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["2079ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect2079ui_story == nil then
				arg_69_1.var_.characterEffect2079ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.2

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect2079ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_69_1.var_.characterEffect2079ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect2079ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_69_1.var_.characterEffect2079ui_story.fillRatio = var_72_5
			end

			local var_72_6 = arg_69_1.actors_["2078ui_story"]
			local var_72_7 = 0

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 and arg_69_1.var_.characterEffect2078ui_story == nil then
				arg_69_1.var_.characterEffect2078ui_story = var_72_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_8 = 0.2

			if var_72_7 <= arg_69_1.time_ and arg_69_1.time_ < var_72_7 + var_72_8 then
				local var_72_9 = (arg_69_1.time_ - var_72_7) / var_72_8

				if arg_69_1.var_.characterEffect2078ui_story then
					arg_69_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_7 + var_72_8 and arg_69_1.time_ < var_72_7 + var_72_8 + arg_72_0 and arg_69_1.var_.characterEffect2078ui_story then
				arg_69_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_72_10 = 0
			local var_72_11 = 0.475

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_12 = arg_69_1:FormatText(StoryNameCfg[322].name)

				arg_69_1.leftNameTxt_.text = var_72_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_13 = arg_69_1:GetWordFromCfg(116011016)
				local var_72_14 = arg_69_1:FormatText(var_72_13.content)

				arg_69_1.text_.text = var_72_14

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_15 = 19
				local var_72_16 = utf8.len(var_72_14)
				local var_72_17 = var_72_15 <= 0 and var_72_11 or var_72_11 * (var_72_16 / var_72_15)

				if var_72_17 > 0 and var_72_11 < var_72_17 then
					arg_69_1.talkMaxDuration = var_72_17

					if var_72_17 + var_72_10 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_17 + var_72_10
					end
				end

				arg_69_1.text_.text = var_72_14
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011016", "story_v_out_116011.awb") ~= 0 then
					local var_72_18 = manager.audio:GetVoiceLength("story_v_out_116011", "116011016", "story_v_out_116011.awb") / 1000

					if var_72_18 + var_72_10 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_18 + var_72_10
					end

					if var_72_13.prefab_name ~= "" and arg_69_1.actors_[var_72_13.prefab_name] ~= nil then
						local var_72_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_13.prefab_name].transform, "story_v_out_116011", "116011016", "story_v_out_116011.awb")

						arg_69_1:RecordAudio("116011016", var_72_19)
						arg_69_1:RecordAudio("116011016", var_72_19)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_116011", "116011016", "story_v_out_116011.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_116011", "116011016", "story_v_out_116011.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_20 = math.max(var_72_11, arg_69_1.talkMaxDuration)

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_20 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_10) / var_72_20

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_10 + var_72_20 and arg_69_1.time_ < var_72_10 + var_72_20 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play116011017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 116011017
		arg_73_1.duration_ = 9.033

		local var_73_0 = {
			zh = 7.633,
			ja = 9.033
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
				arg_73_0:Play116011018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = manager.ui.mainCamera.transform
			local var_76_1 = 2.9

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.shakeOldPos = var_76_0.localPosition
			end

			local var_76_2 = 0.6

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / 0.066
				local var_76_4, var_76_5 = math.modf(var_76_3)

				var_76_0.localPosition = Vector3.New(var_76_5 * 0.13, var_76_5 * 0.13, var_76_5 * 0.13) + arg_73_1.var_.shakeOldPos
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = arg_73_1.var_.shakeOldPos
			end

			local var_76_6 = 0

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.allBtn_.enabled = false
			end

			local var_76_7 = 3.6

			if arg_73_1.time_ >= var_76_6 + var_76_7 and arg_73_1.time_ < var_76_6 + var_76_7 + arg_76_0 then
				arg_73_1.allBtn_.enabled = true
			end

			local var_76_8 = arg_73_1.actors_["2078ui_story"].transform
			local var_76_9 = 0

			if var_76_9 < arg_73_1.time_ and arg_73_1.time_ <= var_76_9 + arg_76_0 then
				arg_73_1.var_.moveOldPos2078ui_story = var_76_8.localPosition
			end

			local var_76_10 = 0.001

			if var_76_9 <= arg_73_1.time_ and arg_73_1.time_ < var_76_9 + var_76_10 then
				local var_76_11 = (arg_73_1.time_ - var_76_9) / var_76_10
				local var_76_12 = Vector3.New(0, 100, 0)

				var_76_8.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos2078ui_story, var_76_12, var_76_11)

				local var_76_13 = manager.ui.mainCamera.transform.position - var_76_8.position

				var_76_8.forward = Vector3.New(var_76_13.x, var_76_13.y, var_76_13.z)

				local var_76_14 = var_76_8.localEulerAngles

				var_76_14.z = 0
				var_76_14.x = 0
				var_76_8.localEulerAngles = var_76_14
			end

			if arg_73_1.time_ >= var_76_9 + var_76_10 and arg_73_1.time_ < var_76_9 + var_76_10 + arg_76_0 then
				var_76_8.localPosition = Vector3.New(0, 100, 0)

				local var_76_15 = manager.ui.mainCamera.transform.position - var_76_8.position

				var_76_8.forward = Vector3.New(var_76_15.x, var_76_15.y, var_76_15.z)

				local var_76_16 = var_76_8.localEulerAngles

				var_76_16.z = 0
				var_76_16.x = 0
				var_76_8.localEulerAngles = var_76_16
			end

			local var_76_17 = arg_73_1.actors_["2079ui_story"].transform
			local var_76_18 = 0

			if var_76_18 < arg_73_1.time_ and arg_73_1.time_ <= var_76_18 + arg_76_0 then
				arg_73_1.var_.moveOldPos2079ui_story = var_76_17.localPosition
			end

			local var_76_19 = 0.001

			if var_76_18 <= arg_73_1.time_ and arg_73_1.time_ < var_76_18 + var_76_19 then
				local var_76_20 = (arg_73_1.time_ - var_76_18) / var_76_19
				local var_76_21 = Vector3.New(0, 100, 0)

				var_76_17.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos2079ui_story, var_76_21, var_76_20)

				local var_76_22 = manager.ui.mainCamera.transform.position - var_76_17.position

				var_76_17.forward = Vector3.New(var_76_22.x, var_76_22.y, var_76_22.z)

				local var_76_23 = var_76_17.localEulerAngles

				var_76_23.z = 0
				var_76_23.x = 0
				var_76_17.localEulerAngles = var_76_23
			end

			if arg_73_1.time_ >= var_76_18 + var_76_19 and arg_73_1.time_ < var_76_18 + var_76_19 + arg_76_0 then
				var_76_17.localPosition = Vector3.New(0, 100, 0)

				local var_76_24 = manager.ui.mainCamera.transform.position - var_76_17.position

				var_76_17.forward = Vector3.New(var_76_24.x, var_76_24.y, var_76_24.z)

				local var_76_25 = var_76_17.localEulerAngles

				var_76_25.z = 0
				var_76_25.x = 0
				var_76_17.localEulerAngles = var_76_25
			end

			local var_76_26 = 0
			local var_76_27 = 0.475

			if var_76_26 < arg_73_1.time_ and arg_73_1.time_ <= var_76_26 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_28 = arg_73_1:FormatText(StoryNameCfg[323].name)

				arg_73_1.leftNameTxt_.text = var_76_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_29 = arg_73_1:GetWordFromCfg(116011017)
				local var_76_30 = arg_73_1:FormatText(var_76_29.content)

				arg_73_1.text_.text = var_76_30

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_31 = 19
				local var_76_32 = utf8.len(var_76_30)
				local var_76_33 = var_76_31 <= 0 and var_76_27 or var_76_27 * (var_76_32 / var_76_31)

				if var_76_33 > 0 and var_76_27 < var_76_33 then
					arg_73_1.talkMaxDuration = var_76_33

					if var_76_33 + var_76_26 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_33 + var_76_26
					end
				end

				arg_73_1.text_.text = var_76_30
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011017", "story_v_out_116011.awb") ~= 0 then
					local var_76_34 = manager.audio:GetVoiceLength("story_v_out_116011", "116011017", "story_v_out_116011.awb") / 1000

					if var_76_34 + var_76_26 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_34 + var_76_26
					end

					if var_76_29.prefab_name ~= "" and arg_73_1.actors_[var_76_29.prefab_name] ~= nil then
						local var_76_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_29.prefab_name].transform, "story_v_out_116011", "116011017", "story_v_out_116011.awb")

						arg_73_1:RecordAudio("116011017", var_76_35)
						arg_73_1:RecordAudio("116011017", var_76_35)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_116011", "116011017", "story_v_out_116011.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_116011", "116011017", "story_v_out_116011.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_36 = math.max(var_76_27, arg_73_1.talkMaxDuration)

			if var_76_26 <= arg_73_1.time_ and arg_73_1.time_ < var_76_26 + var_76_36 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_26) / var_76_36

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_26 + var_76_36 and arg_73_1.time_ < var_76_26 + var_76_36 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play116011018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 116011018
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play116011019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.1

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				arg_77_1.dialog_:SetActive(true)

				local var_80_2 = LeanTween.value(arg_77_1.dialog_, 0, 1, 0.3)

				var_80_2:setOnUpdate(LuaHelper.FloatAction(function(arg_81_0)
					arg_77_1.dialogCg_.alpha = arg_81_0
				end))
				var_80_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_77_1.dialog_)
					var_80_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_77_1.duration_ = arg_77_1.duration_ + 0.3

				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(116011018)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 16
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7
					var_80_0 = var_80_0 + 0.3

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_8 = var_80_0 + 0.3
			local var_80_9 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_8 <= arg_77_1.time_ and arg_77_1.time_ < var_80_8 + var_80_9 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_8) / var_80_9

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_8 + var_80_9 and arg_77_1.time_ < var_80_8 + var_80_9 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play116011019 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 116011019
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play116011020(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.4

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

				local var_86_2 = arg_83_1:GetWordFromCfg(116011019)
				local var_86_3 = arg_83_1:FormatText(var_86_2.content)

				arg_83_1.text_.text = var_86_3

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_4 = 23
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
	Play116011020 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 116011020
		arg_87_1.duration_ = 9.2

		local var_87_0 = {
			zh = 5.166,
			ja = 9.2
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
				arg_87_0:Play116011021(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["2079ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos2079ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, -1.28, -5.6)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos2079ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = 0

			if var_90_9 < arg_87_1.time_ and arg_87_1.time_ <= var_90_9 + arg_90_0 then
				arg_87_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_90_10 = arg_87_1.actors_["2079ui_story"]
			local var_90_11 = 0

			if var_90_11 < arg_87_1.time_ and arg_87_1.time_ <= var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect2079ui_story == nil then
				arg_87_1.var_.characterEffect2079ui_story = var_90_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_12 = 0.2

			if var_90_11 <= arg_87_1.time_ and arg_87_1.time_ < var_90_11 + var_90_12 then
				local var_90_13 = (arg_87_1.time_ - var_90_11) / var_90_12

				if arg_87_1.var_.characterEffect2079ui_story then
					arg_87_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_11 + var_90_12 and arg_87_1.time_ < var_90_11 + var_90_12 + arg_90_0 and arg_87_1.var_.characterEffect2079ui_story then
				arg_87_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_90_14 = 0
			local var_90_15 = 0.6

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_16 = arg_87_1:FormatText(StoryNameCfg[321].name)

				arg_87_1.leftNameTxt_.text = var_90_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_17 = arg_87_1:GetWordFromCfg(116011020)
				local var_90_18 = arg_87_1:FormatText(var_90_17.content)

				arg_87_1.text_.text = var_90_18

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_19 = 24
				local var_90_20 = utf8.len(var_90_18)
				local var_90_21 = var_90_19 <= 0 and var_90_15 or var_90_15 * (var_90_20 / var_90_19)

				if var_90_21 > 0 and var_90_15 < var_90_21 then
					arg_87_1.talkMaxDuration = var_90_21

					if var_90_21 + var_90_14 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_21 + var_90_14
					end
				end

				arg_87_1.text_.text = var_90_18
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011020", "story_v_out_116011.awb") ~= 0 then
					local var_90_22 = manager.audio:GetVoiceLength("story_v_out_116011", "116011020", "story_v_out_116011.awb") / 1000

					if var_90_22 + var_90_14 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_22 + var_90_14
					end

					if var_90_17.prefab_name ~= "" and arg_87_1.actors_[var_90_17.prefab_name] ~= nil then
						local var_90_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_17.prefab_name].transform, "story_v_out_116011", "116011020", "story_v_out_116011.awb")

						arg_87_1:RecordAudio("116011020", var_90_23)
						arg_87_1:RecordAudio("116011020", var_90_23)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_116011", "116011020", "story_v_out_116011.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_116011", "116011020", "story_v_out_116011.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_24 = math.max(var_90_15, arg_87_1.talkMaxDuration)

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_24 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_14) / var_90_24

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_14 + var_90_24 and arg_87_1.time_ < var_90_14 + var_90_24 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play116011021 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 116011021
		arg_91_1.duration_ = 2.533

		local var_91_0 = {
			zh = 2.133,
			ja = 2.533
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
				arg_91_0:Play116011022(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["2079ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect2079ui_story == nil then
				arg_91_1.var_.characterEffect2079ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect2079ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_91_1.var_.characterEffect2079ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect2079ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_91_1.var_.characterEffect2079ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 0.3

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[320].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(116011021)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 12
				local var_94_12 = utf8.len(var_94_10)
				local var_94_13 = var_94_11 <= 0 and var_94_7 or var_94_7 * (var_94_12 / var_94_11)

				if var_94_13 > 0 and var_94_7 < var_94_13 then
					arg_91_1.talkMaxDuration = var_94_13

					if var_94_13 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_10
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011021", "story_v_out_116011.awb") ~= 0 then
					local var_94_14 = manager.audio:GetVoiceLength("story_v_out_116011", "116011021", "story_v_out_116011.awb") / 1000

					if var_94_14 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_14 + var_94_6
					end

					if var_94_9.prefab_name ~= "" and arg_91_1.actors_[var_94_9.prefab_name] ~= nil then
						local var_94_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_9.prefab_name].transform, "story_v_out_116011", "116011021", "story_v_out_116011.awb")

						arg_91_1:RecordAudio("116011021", var_94_15)
						arg_91_1:RecordAudio("116011021", var_94_15)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_116011", "116011021", "story_v_out_116011.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_116011", "116011021", "story_v_out_116011.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_16 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_16 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_16

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_16 and arg_91_1.time_ < var_94_6 + var_94_16 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play116011022 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 116011022
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play116011023(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["2079ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos2079ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos2079ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, 100, 0)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = 0
			local var_98_10 = 1.025

			if var_98_9 < arg_95_1.time_ and arg_95_1.time_ <= var_98_9 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_11 = arg_95_1:GetWordFromCfg(116011022)
				local var_98_12 = arg_95_1:FormatText(var_98_11.content)

				arg_95_1.text_.text = var_98_12

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_13 = 41
				local var_98_14 = utf8.len(var_98_12)
				local var_98_15 = var_98_13 <= 0 and var_98_10 or var_98_10 * (var_98_14 / var_98_13)

				if var_98_15 > 0 and var_98_10 < var_98_15 then
					arg_95_1.talkMaxDuration = var_98_15

					if var_98_15 + var_98_9 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_15 + var_98_9
					end
				end

				arg_95_1.text_.text = var_98_12
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_10, arg_95_1.talkMaxDuration)

			if var_98_9 <= arg_95_1.time_ and arg_95_1.time_ < var_98_9 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_9) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_9 + var_98_16 and arg_95_1.time_ < var_98_9 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play116011023 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 116011023
		arg_99_1.duration_ = 6.4

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play116011024(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = manager.ui.mainCamera.transform
			local var_102_1 = 1.4

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.shakeOldPos = var_102_0.localPosition
			end

			local var_102_2 = 0.6

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / 0.066
				local var_102_4, var_102_5 = math.modf(var_102_3)

				var_102_0.localPosition = Vector3.New(var_102_5 * 0.13, var_102_5 * 0.13, var_102_5 * 0.13) + arg_99_1.var_.shakeOldPos
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = arg_99_1.var_.shakeOldPos
			end

			local var_102_6 = 1.4

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.allBtn_.enabled = false
			end

			local var_102_7 = 0.6

			if arg_99_1.time_ >= var_102_6 + var_102_7 and arg_99_1.time_ < var_102_6 + var_102_7 + arg_102_0 then
				arg_99_1.allBtn_.enabled = true
			end

			local var_102_8 = arg_99_1.bgs_.I05f
			local var_102_9 = 0

			if var_102_9 < arg_99_1.time_ and arg_99_1.time_ <= var_102_9 + arg_102_0 then
				local var_102_10 = var_102_8:GetComponent("SpriteRenderer")

				if var_102_10 then
					var_102_10.material = arg_99_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_102_11 = var_102_10.material
					local var_102_12 = var_102_11:GetColor("_Color")

					arg_99_1.var_.alphaOldValueI05f = var_102_12.a
					arg_99_1.var_.alphaMatValueI05f = var_102_11
				end

				arg_99_1.var_.alphaOldValueI05f = 1
			end

			local var_102_13 = 2

			if var_102_9 <= arg_99_1.time_ and arg_99_1.time_ < var_102_9 + var_102_13 then
				local var_102_14 = (arg_99_1.time_ - var_102_9) / var_102_13
				local var_102_15 = Mathf.Lerp(arg_99_1.var_.alphaOldValueI05f, 0, var_102_14)

				if arg_99_1.var_.alphaMatValueI05f then
					local var_102_16 = arg_99_1.var_.alphaMatValueI05f
					local var_102_17 = var_102_16:GetColor("_Color")

					var_102_17.a = var_102_15

					var_102_16:SetColor("_Color", var_102_17)
				end
			end

			if arg_99_1.time_ >= var_102_9 + var_102_13 and arg_99_1.time_ < var_102_9 + var_102_13 + arg_102_0 and arg_99_1.var_.alphaMatValueI05f then
				local var_102_18 = arg_99_1.var_.alphaMatValueI05f
				local var_102_19 = var_102_18:GetColor("_Color")

				var_102_19.a = 0

				var_102_18:SetColor("_Color", var_102_19)
			end

			local var_102_20 = 1.4
			local var_102_21 = 1

			if var_102_20 < arg_99_1.time_ and arg_99_1.time_ <= var_102_20 + arg_102_0 then
				local var_102_22 = "play"
				local var_102_23 = "effect"

				arg_99_1:AudioAction(var_102_22, var_102_23, "se_story_16", "se_story_16_gun_highpass", "")
			end

			local var_102_24 = 1.4
			local var_102_25 = 0.1

			if var_102_24 < arg_99_1.time_ and arg_99_1.time_ <= var_102_24 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_26 = arg_99_1:FormatText(StoryNameCfg[324].name)

				arg_99_1.leftNameTxt_.text = var_102_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_27 = arg_99_1:GetWordFromCfg(116011023)
				local var_102_28 = arg_99_1:FormatText(var_102_27.content)

				arg_99_1.text_.text = var_102_28

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_29 = 4
				local var_102_30 = utf8.len(var_102_28)
				local var_102_31 = var_102_29 <= 0 and var_102_25 or var_102_25 * (var_102_30 / var_102_29)

				if var_102_31 > 0 and var_102_25 < var_102_31 then
					arg_99_1.talkMaxDuration = var_102_31

					if var_102_31 + var_102_24 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_31 + var_102_24
					end
				end

				arg_99_1.text_.text = var_102_28
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_32 = math.max(var_102_25, arg_99_1.talkMaxDuration)

			if var_102_24 <= arg_99_1.time_ and arg_99_1.time_ < var_102_24 + var_102_32 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_24) / var_102_32

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_24 + var_102_32 and arg_99_1.time_ < var_102_24 + var_102_32 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play116011024 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 116011024
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play116011025(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.275

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				local var_106_2 = "play"
				local var_106_3 = "effect"

				arg_103_1:AudioAction(var_106_2, var_106_3, "se_story_16", "se_story_16_gun_highpass", "")
			end

			local var_106_4 = 0.275
			local var_106_5 = 0.366666666666667

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				local var_106_6 = "play"
				local var_106_7 = "effect"

				arg_103_1:AudioAction(var_106_6, var_106_7, "se_story_16", "se_story_16_gun_highpass", "")
			end

			local var_106_8 = 0.433333333333333
			local var_106_9 = 0.466666666666667

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 then
				local var_106_10 = "play"
				local var_106_11 = "effect"

				arg_103_1:AudioAction(var_106_10, var_106_11, "se_story_16", "se_story_16_gun_highpass", "")
			end

			local var_106_12 = 0
			local var_106_13 = 0.275

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_14 = arg_103_1:FormatText(StoryNameCfg[324].name)

				arg_103_1.leftNameTxt_.text = var_106_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_15 = arg_103_1:GetWordFromCfg(116011024)
				local var_106_16 = arg_103_1:FormatText(var_106_15.content)

				arg_103_1.text_.text = var_106_16

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_17 = 11
				local var_106_18 = utf8.len(var_106_16)
				local var_106_19 = var_106_17 <= 0 and var_106_13 or var_106_13 * (var_106_18 / var_106_17)

				if var_106_19 > 0 and var_106_13 < var_106_19 then
					arg_103_1.talkMaxDuration = var_106_19

					if var_106_19 + var_106_12 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_12
					end
				end

				arg_103_1.text_.text = var_106_16
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_20 = math.max(var_106_13, arg_103_1.talkMaxDuration)

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_20 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_12) / var_106_20

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_12 + var_106_20 and arg_103_1.time_ < var_106_12 + var_106_20 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play116011025 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 116011025
		arg_107_1.duration_ = 7

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play116011026(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = "ST02"

			if arg_107_1.bgs_[var_110_0] == nil then
				local var_110_1 = Object.Instantiate(arg_107_1.paintGo_)

				var_110_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_110_0)
				var_110_1.name = var_110_0
				var_110_1.transform.parent = arg_107_1.stage_.transform
				var_110_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_107_1.bgs_[var_110_0] = var_110_1
			end

			local var_110_2 = 0

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 then
				local var_110_3 = manager.ui.mainCamera.transform.localPosition
				local var_110_4 = Vector3.New(0, 0, 10) + Vector3.New(var_110_3.x, var_110_3.y, 0)
				local var_110_5 = arg_107_1.bgs_.ST02

				var_110_5.transform.localPosition = var_110_4
				var_110_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_110_6 = var_110_5:GetComponent("SpriteRenderer")

				if var_110_6 and var_110_6.sprite then
					local var_110_7 = (var_110_5.transform.localPosition - var_110_3).z
					local var_110_8 = manager.ui.mainCameraCom_
					local var_110_9 = 2 * var_110_7 * Mathf.Tan(var_110_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_110_10 = var_110_9 * var_110_8.aspect
					local var_110_11 = var_110_6.sprite.bounds.size.x
					local var_110_12 = var_110_6.sprite.bounds.size.y
					local var_110_13 = var_110_10 / var_110_11
					local var_110_14 = var_110_9 / var_110_12
					local var_110_15 = var_110_14 < var_110_13 and var_110_13 or var_110_14

					var_110_5.transform.localScale = Vector3.New(var_110_15, var_110_15, 0)
				end

				for iter_110_0, iter_110_1 in pairs(arg_107_1.bgs_) do
					if iter_110_0 ~= "ST02" then
						iter_110_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_17 = 2

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17
				local var_110_19 = Color.New(0, 0, 0)

				var_110_19.a = Mathf.Lerp(1, 0, var_110_18)
				arg_107_1.mask_.color = var_110_19
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				local var_110_20 = Color.New(0, 0, 0)
				local var_110_21 = 0

				arg_107_1.mask_.enabled = false
				var_110_20.a = var_110_21
				arg_107_1.mask_.color = var_110_20
			end

			local var_110_22 = 0
			local var_110_23 = 1

			if var_110_22 < arg_107_1.time_ and arg_107_1.time_ <= var_110_22 + arg_110_0 then
				local var_110_24 = "play"
				local var_110_25 = "music"

				arg_107_1:AudioAction(var_110_24, var_110_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_110_26 = 1.9
			local var_110_27 = 1

			if var_110_26 < arg_107_1.time_ and arg_107_1.time_ <= var_110_26 + arg_110_0 then
				local var_110_28 = "play"
				local var_110_29 = "music"

				arg_107_1:AudioAction(var_110_28, var_110_29, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			if arg_107_1.frameCnt_ <= 1 then
				arg_107_1.dialog_:SetActive(false)
			end

			local var_110_30 = 2
			local var_110_31 = 0.775

			if var_110_30 < arg_107_1.time_ and arg_107_1.time_ <= var_110_30 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_32 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_32:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_33 = arg_107_1:GetWordFromCfg(116011025)
				local var_110_34 = arg_107_1:FormatText(var_110_33.content)

				arg_107_1.text_.text = var_110_34

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_35 = 31
				local var_110_36 = utf8.len(var_110_34)
				local var_110_37 = var_110_35 <= 0 and var_110_31 or var_110_31 * (var_110_36 / var_110_35)

				if var_110_37 > 0 and var_110_31 < var_110_37 then
					arg_107_1.talkMaxDuration = var_110_37
					var_110_30 = var_110_30 + 0.3

					if var_110_37 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_37 + var_110_30
					end
				end

				arg_107_1.text_.text = var_110_34
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_38 = var_110_30 + 0.3
			local var_110_39 = math.max(var_110_31, arg_107_1.talkMaxDuration)

			if var_110_38 <= arg_107_1.time_ and arg_107_1.time_ < var_110_38 + var_110_39 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_38) / var_110_39

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_38 + var_110_39 and arg_107_1.time_ < var_110_38 + var_110_39 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play116011026 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 116011026
		arg_113_1.duration_ = 9.166

		local var_113_0 = {
			zh = 7.266,
			ja = 9.166
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
				arg_113_0:Play116011027(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = "1048ui_story"

			if arg_113_1.actors_[var_116_0] == nil then
				local var_116_1 = Object.Instantiate(Asset.Load("Char/" .. var_116_0), arg_113_1.stage_.transform)

				var_116_1.name = var_116_0
				var_116_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_113_1.actors_[var_116_0] = var_116_1

				local var_116_2 = var_116_1:GetComponentInChildren(typeof(CharacterEffect))

				var_116_2.enabled = true

				local var_116_3 = GameObjectTools.GetOrAddComponent(var_116_1, typeof(DynamicBoneHelper))

				if var_116_3 then
					var_116_3:EnableDynamicBone(false)
				end

				arg_113_1:ShowWeapon(var_116_2.transform, false)

				arg_113_1.var_[var_116_0 .. "Animator"] = var_116_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_113_1.var_[var_116_0 .. "Animator"].applyRootMotion = true
				arg_113_1.var_[var_116_0 .. "LipSync"] = var_116_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_116_4 = arg_113_1.actors_["1048ui_story"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect1048ui_story == nil then
				arg_113_1.var_.characterEffect1048ui_story = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.034

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect1048ui_story then
					arg_113_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect1048ui_story then
				arg_113_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_116_8 = arg_113_1.actors_["1048ui_story"].transform
			local var_116_9 = 0

			if var_116_9 < arg_113_1.time_ and arg_113_1.time_ <= var_116_9 + arg_116_0 then
				arg_113_1.var_.moveOldPos1048ui_story = var_116_8.localPosition
			end

			local var_116_10 = 0.001

			if var_116_9 <= arg_113_1.time_ and arg_113_1.time_ < var_116_9 + var_116_10 then
				local var_116_11 = (arg_113_1.time_ - var_116_9) / var_116_10
				local var_116_12 = Vector3.New(0.7, -0.8, -6.2)

				var_116_8.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1048ui_story, var_116_12, var_116_11)

				local var_116_13 = manager.ui.mainCamera.transform.position - var_116_8.position

				var_116_8.forward = Vector3.New(var_116_13.x, var_116_13.y, var_116_13.z)

				local var_116_14 = var_116_8.localEulerAngles

				var_116_14.z = 0
				var_116_14.x = 0
				var_116_8.localEulerAngles = var_116_14
			end

			if arg_113_1.time_ >= var_116_9 + var_116_10 and arg_113_1.time_ < var_116_9 + var_116_10 + arg_116_0 then
				var_116_8.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_116_15 = manager.ui.mainCamera.transform.position - var_116_8.position

				var_116_8.forward = Vector3.New(var_116_15.x, var_116_15.y, var_116_15.z)

				local var_116_16 = var_116_8.localEulerAngles

				var_116_16.z = 0
				var_116_16.x = 0
				var_116_8.localEulerAngles = var_116_16
			end

			local var_116_17 = 0

			if var_116_17 < arg_113_1.time_ and arg_113_1.time_ <= var_116_17 + arg_116_0 then
				arg_113_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action7_1")
			end

			local var_116_18 = 0

			if var_116_18 < arg_113_1.time_ and arg_113_1.time_ <= var_116_18 + arg_116_0 then
				arg_113_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_116_19 = 0
			local var_116_20 = 0.55

			if var_116_19 < arg_113_1.time_ and arg_113_1.time_ <= var_116_19 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_21 = arg_113_1:FormatText(StoryNameCfg[8].name)

				arg_113_1.leftNameTxt_.text = var_116_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_22 = arg_113_1:GetWordFromCfg(116011026)
				local var_116_23 = arg_113_1:FormatText(var_116_22.content)

				arg_113_1.text_.text = var_116_23

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_24 = 22
				local var_116_25 = utf8.len(var_116_23)
				local var_116_26 = var_116_24 <= 0 and var_116_20 or var_116_20 * (var_116_25 / var_116_24)

				if var_116_26 > 0 and var_116_20 < var_116_26 then
					arg_113_1.talkMaxDuration = var_116_26

					if var_116_26 + var_116_19 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_26 + var_116_19
					end
				end

				arg_113_1.text_.text = var_116_23
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011026", "story_v_out_116011.awb") ~= 0 then
					local var_116_27 = manager.audio:GetVoiceLength("story_v_out_116011", "116011026", "story_v_out_116011.awb") / 1000

					if var_116_27 + var_116_19 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_27 + var_116_19
					end

					if var_116_22.prefab_name ~= "" and arg_113_1.actors_[var_116_22.prefab_name] ~= nil then
						local var_116_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_22.prefab_name].transform, "story_v_out_116011", "116011026", "story_v_out_116011.awb")

						arg_113_1:RecordAudio("116011026", var_116_28)
						arg_113_1:RecordAudio("116011026", var_116_28)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_116011", "116011026", "story_v_out_116011.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_116011", "116011026", "story_v_out_116011.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_29 = math.max(var_116_20, arg_113_1.talkMaxDuration)

			if var_116_19 <= arg_113_1.time_ and arg_113_1.time_ < var_116_19 + var_116_29 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_19) / var_116_29

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_19 + var_116_29 and arg_113_1.time_ < var_116_19 + var_116_29 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play116011027 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 116011027
		arg_117_1.duration_ = 9.2

		local var_117_0 = {
			zh = 6.266,
			ja = 9.2
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play116011028(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_120_1 = 0
			local var_120_2 = 0.75

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_3 = arg_117_1:FormatText(StoryNameCfg[8].name)

				arg_117_1.leftNameTxt_.text = var_120_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_4 = arg_117_1:GetWordFromCfg(116011027)
				local var_120_5 = arg_117_1:FormatText(var_120_4.content)

				arg_117_1.text_.text = var_120_5

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_6 = 30
				local var_120_7 = utf8.len(var_120_5)
				local var_120_8 = var_120_6 <= 0 and var_120_2 or var_120_2 * (var_120_7 / var_120_6)

				if var_120_8 > 0 and var_120_2 < var_120_8 then
					arg_117_1.talkMaxDuration = var_120_8

					if var_120_8 + var_120_1 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_1
					end
				end

				arg_117_1.text_.text = var_120_5
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011027", "story_v_out_116011.awb") ~= 0 then
					local var_120_9 = manager.audio:GetVoiceLength("story_v_out_116011", "116011027", "story_v_out_116011.awb") / 1000

					if var_120_9 + var_120_1 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_9 + var_120_1
					end

					if var_120_4.prefab_name ~= "" and arg_117_1.actors_[var_120_4.prefab_name] ~= nil then
						local var_120_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_4.prefab_name].transform, "story_v_out_116011", "116011027", "story_v_out_116011.awb")

						arg_117_1:RecordAudio("116011027", var_120_10)
						arg_117_1:RecordAudio("116011027", var_120_10)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_116011", "116011027", "story_v_out_116011.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_116011", "116011027", "story_v_out_116011.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_11 = math.max(var_120_2, arg_117_1.talkMaxDuration)

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_11 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_1) / var_120_11

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_1 + var_120_11 and arg_117_1.time_ < var_120_1 + var_120_11 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play116011028 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 116011028
		arg_121_1.duration_ = 6.266

		local var_121_0 = {
			zh = 6.266,
			ja = 5.133
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play116011029(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = "1039ui_story"

			if arg_121_1.actors_[var_124_0] == nil then
				local var_124_1 = Object.Instantiate(Asset.Load("Char/" .. var_124_0), arg_121_1.stage_.transform)

				var_124_1.name = var_124_0
				var_124_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_121_1.actors_[var_124_0] = var_124_1

				local var_124_2 = var_124_1:GetComponentInChildren(typeof(CharacterEffect))

				var_124_2.enabled = true

				local var_124_3 = GameObjectTools.GetOrAddComponent(var_124_1, typeof(DynamicBoneHelper))

				if var_124_3 then
					var_124_3:EnableDynamicBone(false)
				end

				arg_121_1:ShowWeapon(var_124_2.transform, false)

				arg_121_1.var_[var_124_0 .. "Animator"] = var_124_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_121_1.var_[var_124_0 .. "Animator"].applyRootMotion = true
				arg_121_1.var_[var_124_0 .. "LipSync"] = var_124_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_124_4 = arg_121_1.actors_["1039ui_story"].transform
			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 then
				arg_121_1.var_.moveOldPos1039ui_story = var_124_4.localPosition
			end

			local var_124_6 = 0.001

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6
				local var_124_8 = Vector3.New(-0.7, -1.01, -5.9)

				var_124_4.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1039ui_story, var_124_8, var_124_7)

				local var_124_9 = manager.ui.mainCamera.transform.position - var_124_4.position

				var_124_4.forward = Vector3.New(var_124_9.x, var_124_9.y, var_124_9.z)

				local var_124_10 = var_124_4.localEulerAngles

				var_124_10.z = 0
				var_124_10.x = 0
				var_124_4.localEulerAngles = var_124_10
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 then
				var_124_4.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_124_11 = manager.ui.mainCamera.transform.position - var_124_4.position

				var_124_4.forward = Vector3.New(var_124_11.x, var_124_11.y, var_124_11.z)

				local var_124_12 = var_124_4.localEulerAngles

				var_124_12.z = 0
				var_124_12.x = 0
				var_124_4.localEulerAngles = var_124_12
			end

			local var_124_13 = arg_121_1.actors_["1039ui_story"]
			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 and arg_121_1.var_.characterEffect1039ui_story == nil then
				arg_121_1.var_.characterEffect1039ui_story = var_124_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_15 = 0.034

			if var_124_14 <= arg_121_1.time_ and arg_121_1.time_ < var_124_14 + var_124_15 then
				local var_124_16 = (arg_121_1.time_ - var_124_14) / var_124_15

				if arg_121_1.var_.characterEffect1039ui_story then
					arg_121_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_14 + var_124_15 and arg_121_1.time_ < var_124_14 + var_124_15 + arg_124_0 and arg_121_1.var_.characterEffect1039ui_story then
				arg_121_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_124_17 = 0

			if var_124_17 < arg_121_1.time_ and arg_121_1.time_ <= var_124_17 + arg_124_0 then
				arg_121_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_124_18 = arg_121_1.actors_["1048ui_story"]
			local var_124_19 = 0

			if var_124_19 < arg_121_1.time_ and arg_121_1.time_ <= var_124_19 + arg_124_0 and arg_121_1.var_.characterEffect1048ui_story == nil then
				arg_121_1.var_.characterEffect1048ui_story = var_124_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_20 = 0.2

			if var_124_19 <= arg_121_1.time_ and arg_121_1.time_ < var_124_19 + var_124_20 then
				local var_124_21 = (arg_121_1.time_ - var_124_19) / var_124_20

				if arg_121_1.var_.characterEffect1048ui_story then
					local var_124_22 = Mathf.Lerp(0, 0.5, var_124_21)

					arg_121_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1048ui_story.fillRatio = var_124_22
				end
			end

			if arg_121_1.time_ >= var_124_19 + var_124_20 and arg_121_1.time_ < var_124_19 + var_124_20 + arg_124_0 and arg_121_1.var_.characterEffect1048ui_story then
				local var_124_23 = 0.5

				arg_121_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1048ui_story.fillRatio = var_124_23
			end

			local var_124_24 = 0

			if var_124_24 < arg_121_1.time_ and arg_121_1.time_ <= var_124_24 + arg_124_0 then
				arg_121_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action7_2")
			end

			local var_124_25 = 0

			if var_124_25 < arg_121_1.time_ and arg_121_1.time_ <= var_124_25 + arg_124_0 then
				arg_121_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_124_26 = arg_121_1.actors_["1039ui_story"]
			local var_124_27 = 0

			if var_124_27 < arg_121_1.time_ and arg_121_1.time_ <= var_124_27 + arg_124_0 and arg_121_1.var_.characterEffect1039ui_story == nil then
				arg_121_1.var_.characterEffect1039ui_story = var_124_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_28 = 0.2

			if var_124_27 <= arg_121_1.time_ and arg_121_1.time_ < var_124_27 + var_124_28 then
				local var_124_29 = (arg_121_1.time_ - var_124_27) / var_124_28

				if arg_121_1.var_.characterEffect1039ui_story then
					arg_121_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_27 + var_124_28 and arg_121_1.time_ < var_124_27 + var_124_28 + arg_124_0 and arg_121_1.var_.characterEffect1039ui_story then
				arg_121_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_124_30 = 0
			local var_124_31 = 0.625

			if var_124_30 < arg_121_1.time_ and arg_121_1.time_ <= var_124_30 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_32 = arg_121_1:FormatText(StoryNameCfg[9].name)

				arg_121_1.leftNameTxt_.text = var_124_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_33 = arg_121_1:GetWordFromCfg(116011028)
				local var_124_34 = arg_121_1:FormatText(var_124_33.content)

				arg_121_1.text_.text = var_124_34

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_35 = 25
				local var_124_36 = utf8.len(var_124_34)
				local var_124_37 = var_124_35 <= 0 and var_124_31 or var_124_31 * (var_124_36 / var_124_35)

				if var_124_37 > 0 and var_124_31 < var_124_37 then
					arg_121_1.talkMaxDuration = var_124_37

					if var_124_37 + var_124_30 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_37 + var_124_30
					end
				end

				arg_121_1.text_.text = var_124_34
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011028", "story_v_out_116011.awb") ~= 0 then
					local var_124_38 = manager.audio:GetVoiceLength("story_v_out_116011", "116011028", "story_v_out_116011.awb") / 1000

					if var_124_38 + var_124_30 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_38 + var_124_30
					end

					if var_124_33.prefab_name ~= "" and arg_121_1.actors_[var_124_33.prefab_name] ~= nil then
						local var_124_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_33.prefab_name].transform, "story_v_out_116011", "116011028", "story_v_out_116011.awb")

						arg_121_1:RecordAudio("116011028", var_124_39)
						arg_121_1:RecordAudio("116011028", var_124_39)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_116011", "116011028", "story_v_out_116011.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_116011", "116011028", "story_v_out_116011.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_40 = math.max(var_124_31, arg_121_1.talkMaxDuration)

			if var_124_30 <= arg_121_1.time_ and arg_121_1.time_ < var_124_30 + var_124_40 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_30) / var_124_40

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_30 + var_124_40 and arg_121_1.time_ < var_124_30 + var_124_40 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play116011029 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 116011029
		arg_125_1.duration_ = 9.1

		local var_125_0 = {
			zh = 9.1,
			ja = 8.7
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play116011030(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1048ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1048ui_story == nil then
				arg_125_1.var_.characterEffect1048ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.0166666666666667

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1048ui_story then
					arg_125_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1048ui_story then
				arg_125_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_128_4 = 0

			if var_128_4 < arg_125_1.time_ and arg_125_1.time_ <= var_128_4 + arg_128_0 then
				arg_125_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action4_1")
			end

			local var_128_5 = arg_125_1.actors_["1048ui_story"]
			local var_128_6 = 0

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect1048ui_story == nil then
				arg_125_1.var_.characterEffect1048ui_story = var_128_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_7 = 0.2

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_7 then
				local var_128_8 = (arg_125_1.time_ - var_128_6) / var_128_7

				if arg_125_1.var_.characterEffect1048ui_story then
					arg_125_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_6 + var_128_7 and arg_125_1.time_ < var_128_6 + var_128_7 + arg_128_0 and arg_125_1.var_.characterEffect1048ui_story then
				arg_125_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_128_9 = 0

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 then
				arg_125_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_128_10 = arg_125_1.actors_["1039ui_story"]
			local var_128_11 = 0

			if var_128_11 < arg_125_1.time_ and arg_125_1.time_ <= var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect1039ui_story == nil then
				arg_125_1.var_.characterEffect1039ui_story = var_128_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_12 = 0.2

			if var_128_11 <= arg_125_1.time_ and arg_125_1.time_ < var_128_11 + var_128_12 then
				local var_128_13 = (arg_125_1.time_ - var_128_11) / var_128_12

				if arg_125_1.var_.characterEffect1039ui_story then
					local var_128_14 = Mathf.Lerp(0, 0.5, var_128_13)

					arg_125_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1039ui_story.fillRatio = var_128_14
				end
			end

			if arg_125_1.time_ >= var_128_11 + var_128_12 and arg_125_1.time_ < var_128_11 + var_128_12 + arg_128_0 and arg_125_1.var_.characterEffect1039ui_story then
				local var_128_15 = 0.5

				arg_125_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1039ui_story.fillRatio = var_128_15
			end

			local var_128_16 = 0
			local var_128_17 = 1.2

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_18 = arg_125_1:FormatText(StoryNameCfg[8].name)

				arg_125_1.leftNameTxt_.text = var_128_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_19 = arg_125_1:GetWordFromCfg(116011029)
				local var_128_20 = arg_125_1:FormatText(var_128_19.content)

				arg_125_1.text_.text = var_128_20

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_21 = 48
				local var_128_22 = utf8.len(var_128_20)
				local var_128_23 = var_128_21 <= 0 and var_128_17 or var_128_17 * (var_128_22 / var_128_21)

				if var_128_23 > 0 and var_128_17 < var_128_23 then
					arg_125_1.talkMaxDuration = var_128_23

					if var_128_23 + var_128_16 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_23 + var_128_16
					end
				end

				arg_125_1.text_.text = var_128_20
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011029", "story_v_out_116011.awb") ~= 0 then
					local var_128_24 = manager.audio:GetVoiceLength("story_v_out_116011", "116011029", "story_v_out_116011.awb") / 1000

					if var_128_24 + var_128_16 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_24 + var_128_16
					end

					if var_128_19.prefab_name ~= "" and arg_125_1.actors_[var_128_19.prefab_name] ~= nil then
						local var_128_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_19.prefab_name].transform, "story_v_out_116011", "116011029", "story_v_out_116011.awb")

						arg_125_1:RecordAudio("116011029", var_128_25)
						arg_125_1:RecordAudio("116011029", var_128_25)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_116011", "116011029", "story_v_out_116011.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_116011", "116011029", "story_v_out_116011.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_26 = math.max(var_128_17, arg_125_1.talkMaxDuration)

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_26 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_16) / var_128_26

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_16 + var_128_26 and arg_125_1.time_ < var_128_16 + var_128_26 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play116011030 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 116011030
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play116011031(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_132_1 = arg_129_1.actors_["1048ui_story"]
			local var_132_2 = 0

			if var_132_2 < arg_129_1.time_ and arg_129_1.time_ <= var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1048ui_story == nil then
				arg_129_1.var_.characterEffect1048ui_story = var_132_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_3 = 0.2

			if var_132_2 <= arg_129_1.time_ and arg_129_1.time_ < var_132_2 + var_132_3 then
				local var_132_4 = (arg_129_1.time_ - var_132_2) / var_132_3

				if arg_129_1.var_.characterEffect1048ui_story then
					local var_132_5 = Mathf.Lerp(0, 0.5, var_132_4)

					arg_129_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1048ui_story.fillRatio = var_132_5
				end
			end

			if arg_129_1.time_ >= var_132_2 + var_132_3 and arg_129_1.time_ < var_132_2 + var_132_3 + arg_132_0 and arg_129_1.var_.characterEffect1048ui_story then
				local var_132_6 = 0.5

				arg_129_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1048ui_story.fillRatio = var_132_6
			end

			local var_132_7 = 0
			local var_132_8 = 0.475

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_9 = arg_129_1:GetWordFromCfg(116011030)
				local var_132_10 = arg_129_1:FormatText(var_132_9.content)

				arg_129_1.text_.text = var_132_10

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_11 = 19
				local var_132_12 = utf8.len(var_132_10)
				local var_132_13 = var_132_11 <= 0 and var_132_8 or var_132_8 * (var_132_12 / var_132_11)

				if var_132_13 > 0 and var_132_8 < var_132_13 then
					arg_129_1.talkMaxDuration = var_132_13

					if var_132_13 + var_132_7 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_13 + var_132_7
					end
				end

				arg_129_1.text_.text = var_132_10
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_14 = math.max(var_132_8, arg_129_1.talkMaxDuration)

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_14 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_7) / var_132_14

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_7 + var_132_14 and arg_129_1.time_ < var_132_7 + var_132_14 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play116011031 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 116011031
		arg_133_1.duration_ = 13.1

		local var_133_0 = {
			zh = 7.833,
			ja = 13.1
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
				arg_133_0:Play116011032(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1039ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1039ui_story == nil then
				arg_133_1.var_.characterEffect1039ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.2

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1039ui_story then
					arg_133_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1039ui_story then
				arg_133_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_136_4 = 0

			if var_136_4 < arg_133_1.time_ and arg_133_1.time_ <= var_136_4 + arg_136_0 then
				arg_133_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action456")
			end

			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 then
				arg_133_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_136_6 = 0
			local var_136_7 = 1

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_8 = arg_133_1:FormatText(StoryNameCfg[9].name)

				arg_133_1.leftNameTxt_.text = var_136_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_9 = arg_133_1:GetWordFromCfg(116011031)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 40
				local var_136_12 = utf8.len(var_136_10)
				local var_136_13 = var_136_11 <= 0 and var_136_7 or var_136_7 * (var_136_12 / var_136_11)

				if var_136_13 > 0 and var_136_7 < var_136_13 then
					arg_133_1.talkMaxDuration = var_136_13

					if var_136_13 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_13 + var_136_6
					end
				end

				arg_133_1.text_.text = var_136_10
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011031", "story_v_out_116011.awb") ~= 0 then
					local var_136_14 = manager.audio:GetVoiceLength("story_v_out_116011", "116011031", "story_v_out_116011.awb") / 1000

					if var_136_14 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_14 + var_136_6
					end

					if var_136_9.prefab_name ~= "" and arg_133_1.actors_[var_136_9.prefab_name] ~= nil then
						local var_136_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_9.prefab_name].transform, "story_v_out_116011", "116011031", "story_v_out_116011.awb")

						arg_133_1:RecordAudio("116011031", var_136_15)
						arg_133_1:RecordAudio("116011031", var_136_15)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_116011", "116011031", "story_v_out_116011.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_116011", "116011031", "story_v_out_116011.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_16 = math.max(var_136_7, arg_133_1.talkMaxDuration)

			if var_136_6 <= arg_133_1.time_ and arg_133_1.time_ < var_136_6 + var_136_16 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_6) / var_136_16

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_6 + var_136_16 and arg_133_1.time_ < var_136_6 + var_136_16 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play116011032 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 116011032
		arg_137_1.duration_ = 3.966

		local var_137_0 = {
			zh = 3.966,
			ja = 2.866
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
				arg_137_0:Play116011033(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1039ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1039ui_story == nil then
				arg_137_1.var_.characterEffect1039ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.2

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1039ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1039ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1039ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1039ui_story.fillRatio = var_140_5
			end

			local var_140_6 = arg_137_1.actors_["1048ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect1048ui_story == nil then
				arg_137_1.var_.characterEffect1048ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.2

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect1048ui_story then
					arg_137_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1048ui_story then
				arg_137_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action442")
			end

			local var_140_11 = 0

			if var_140_11 < arg_137_1.time_ and arg_137_1.time_ <= var_140_11 + arg_140_0 then
				arg_137_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_140_12 = 0
			local var_140_13 = 0.325

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_14 = arg_137_1:FormatText(StoryNameCfg[8].name)

				arg_137_1.leftNameTxt_.text = var_140_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(116011032)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 13
				local var_140_18 = utf8.len(var_140_16)
				local var_140_19 = var_140_17 <= 0 and var_140_13 or var_140_13 * (var_140_18 / var_140_17)

				if var_140_19 > 0 and var_140_13 < var_140_19 then
					arg_137_1.talkMaxDuration = var_140_19

					if var_140_19 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_16
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011032", "story_v_out_116011.awb") ~= 0 then
					local var_140_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011032", "story_v_out_116011.awb") / 1000

					if var_140_20 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_12
					end

					if var_140_15.prefab_name ~= "" and arg_137_1.actors_[var_140_15.prefab_name] ~= nil then
						local var_140_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_15.prefab_name].transform, "story_v_out_116011", "116011032", "story_v_out_116011.awb")

						arg_137_1:RecordAudio("116011032", var_140_21)
						arg_137_1:RecordAudio("116011032", var_140_21)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_116011", "116011032", "story_v_out_116011.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_116011", "116011032", "story_v_out_116011.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_22 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_22 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_12) / var_140_22

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_12 + var_140_22 and arg_137_1.time_ < var_140_12 + var_140_22 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play116011033 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 116011033
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play116011034(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action2_2")
			end

			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_144_2 = arg_141_1.actors_["1048ui_story"]
			local var_144_3 = 0

			if var_144_3 < arg_141_1.time_ and arg_141_1.time_ <= var_144_3 + arg_144_0 and arg_141_1.var_.characterEffect1048ui_story == nil then
				arg_141_1.var_.characterEffect1048ui_story = var_144_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_4 = 0.2

			if var_144_3 <= arg_141_1.time_ and arg_141_1.time_ < var_144_3 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_3) / var_144_4

				if arg_141_1.var_.characterEffect1048ui_story then
					local var_144_6 = Mathf.Lerp(0, 0.5, var_144_5)

					arg_141_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1048ui_story.fillRatio = var_144_6
				end
			end

			if arg_141_1.time_ >= var_144_3 + var_144_4 and arg_141_1.time_ < var_144_3 + var_144_4 + arg_144_0 and arg_141_1.var_.characterEffect1048ui_story then
				local var_144_7 = 0.5

				arg_141_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1048ui_story.fillRatio = var_144_7
			end

			local var_144_8 = 0
			local var_144_9 = 0.75

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_10 = arg_141_1:GetWordFromCfg(116011033)
				local var_144_11 = arg_141_1:FormatText(var_144_10.content)

				arg_141_1.text_.text = var_144_11

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_12 = 30
				local var_144_13 = utf8.len(var_144_11)
				local var_144_14 = var_144_12 <= 0 and var_144_9 or var_144_9 * (var_144_13 / var_144_12)

				if var_144_14 > 0 and var_144_9 < var_144_14 then
					arg_141_1.talkMaxDuration = var_144_14

					if var_144_14 + var_144_8 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_14 + var_144_8
					end
				end

				arg_141_1.text_.text = var_144_11
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_15 = math.max(var_144_9, arg_141_1.talkMaxDuration)

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_15 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_8) / var_144_15

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_8 + var_144_15 and arg_141_1.time_ < var_144_8 + var_144_15 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play116011034 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 116011034
		arg_145_1.duration_ = 12.7

		local var_145_0 = {
			zh = 6.8,
			ja = 12.7
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
				arg_145_0:Play116011035(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1039ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1039ui_story == nil then
				arg_145_1.var_.characterEffect1039ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.2

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1039ui_story then
					arg_145_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1039ui_story then
				arg_145_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_148_4 = arg_145_1.actors_["1048ui_story"]
			local var_148_5 = 0

			if var_148_5 < arg_145_1.time_ and arg_145_1.time_ <= var_148_5 + arg_148_0 and arg_145_1.var_.characterEffect1048ui_story == nil then
				arg_145_1.var_.characterEffect1048ui_story = var_148_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_6 = 0.2

			if var_148_5 <= arg_145_1.time_ and arg_145_1.time_ < var_148_5 + var_148_6 then
				local var_148_7 = (arg_145_1.time_ - var_148_5) / var_148_6

				if arg_145_1.var_.characterEffect1048ui_story then
					local var_148_8 = Mathf.Lerp(0, 0.5, var_148_7)

					arg_145_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1048ui_story.fillRatio = var_148_8
				end
			end

			if arg_145_1.time_ >= var_148_5 + var_148_6 and arg_145_1.time_ < var_148_5 + var_148_6 + arg_148_0 and arg_145_1.var_.characterEffect1048ui_story then
				local var_148_9 = 0.5

				arg_145_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1048ui_story.fillRatio = var_148_9
			end

			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 then
				arg_145_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action6_2")
			end

			local var_148_11 = 0

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_148_12 = 0
			local var_148_13 = 0.825

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_14 = arg_145_1:FormatText(StoryNameCfg[9].name)

				arg_145_1.leftNameTxt_.text = var_148_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(116011034)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 33
				local var_148_18 = utf8.len(var_148_16)
				local var_148_19 = var_148_17 <= 0 and var_148_13 or var_148_13 * (var_148_18 / var_148_17)

				if var_148_19 > 0 and var_148_13 < var_148_19 then
					arg_145_1.talkMaxDuration = var_148_19

					if var_148_19 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_12
					end
				end

				arg_145_1.text_.text = var_148_16
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011034", "story_v_out_116011.awb") ~= 0 then
					local var_148_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011034", "story_v_out_116011.awb") / 1000

					if var_148_20 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_12
					end

					if var_148_15.prefab_name ~= "" and arg_145_1.actors_[var_148_15.prefab_name] ~= nil then
						local var_148_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_15.prefab_name].transform, "story_v_out_116011", "116011034", "story_v_out_116011.awb")

						arg_145_1:RecordAudio("116011034", var_148_21)
						arg_145_1:RecordAudio("116011034", var_148_21)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_116011", "116011034", "story_v_out_116011.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_116011", "116011034", "story_v_out_116011.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_22 = math.max(var_148_13, arg_145_1.talkMaxDuration)

			if var_148_12 <= arg_145_1.time_ and arg_145_1.time_ < var_148_12 + var_148_22 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_12) / var_148_22

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_12 + var_148_22 and arg_145_1.time_ < var_148_12 + var_148_22 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play116011035 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 116011035
		arg_149_1.duration_ = 8.7

		local var_149_0 = {
			zh = 1.999999999999,
			ja = 8.7
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
				arg_149_0:Play116011036(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1039ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1039ui_story == nil then
				arg_149_1.var_.characterEffect1039ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.2

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1039ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1039ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1039ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1039ui_story.fillRatio = var_152_5
			end

			local var_152_6 = arg_149_1.actors_["1048ui_story"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 and arg_149_1.var_.characterEffect1048ui_story == nil then
				arg_149_1.var_.characterEffect1048ui_story = var_152_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_8 = 0.2

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_8 then
				local var_152_9 = (arg_149_1.time_ - var_152_7) / var_152_8

				if arg_149_1.var_.characterEffect1048ui_story then
					arg_149_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_8 and arg_149_1.time_ < var_152_7 + var_152_8 + arg_152_0 and arg_149_1.var_.characterEffect1048ui_story then
				arg_149_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 then
				arg_149_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_152_11 = 0
			local var_152_12 = 0.175

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_13 = arg_149_1:FormatText(StoryNameCfg[8].name)

				arg_149_1.leftNameTxt_.text = var_152_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_14 = arg_149_1:GetWordFromCfg(116011035)
				local var_152_15 = arg_149_1:FormatText(var_152_14.content)

				arg_149_1.text_.text = var_152_15

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_16 = 7
				local var_152_17 = utf8.len(var_152_15)
				local var_152_18 = var_152_16 <= 0 and var_152_12 or var_152_12 * (var_152_17 / var_152_16)

				if var_152_18 > 0 and var_152_12 < var_152_18 then
					arg_149_1.talkMaxDuration = var_152_18

					if var_152_18 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_18 + var_152_11
					end
				end

				arg_149_1.text_.text = var_152_15
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011035", "story_v_out_116011.awb") ~= 0 then
					local var_152_19 = manager.audio:GetVoiceLength("story_v_out_116011", "116011035", "story_v_out_116011.awb") / 1000

					if var_152_19 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_11
					end

					if var_152_14.prefab_name ~= "" and arg_149_1.actors_[var_152_14.prefab_name] ~= nil then
						local var_152_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_14.prefab_name].transform, "story_v_out_116011", "116011035", "story_v_out_116011.awb")

						arg_149_1:RecordAudio("116011035", var_152_20)
						arg_149_1:RecordAudio("116011035", var_152_20)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_116011", "116011035", "story_v_out_116011.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_116011", "116011035", "story_v_out_116011.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_21 = math.max(var_152_12, arg_149_1.talkMaxDuration)

			if var_152_11 <= arg_149_1.time_ and arg_149_1.time_ < var_152_11 + var_152_21 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_11) / var_152_21

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_11 + var_152_21 and arg_149_1.time_ < var_152_11 + var_152_21 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play116011036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 116011036
		arg_153_1.duration_ = 7.1

		local var_153_0 = {
			zh = 7.033,
			ja = 7.1
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
				arg_153_0:Play116011037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1039ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1039ui_story == nil then
				arg_153_1.var_.characterEffect1039ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.2

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1039ui_story then
					arg_153_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1039ui_story then
				arg_153_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_156_4 = arg_153_1.actors_["1048ui_story"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect1048ui_story == nil then
				arg_153_1.var_.characterEffect1048ui_story = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.2

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect1048ui_story then
					local var_156_8 = Mathf.Lerp(0, 0.5, var_156_7)

					arg_153_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1048ui_story.fillRatio = var_156_8
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1048ui_story then
				local var_156_9 = 0.5

				arg_153_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1048ui_story.fillRatio = var_156_9
			end

			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_156_11 = 0
			local var_156_12 = 0.85

			if var_156_11 < arg_153_1.time_ and arg_153_1.time_ <= var_156_11 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_13 = arg_153_1:FormatText(StoryNameCfg[9].name)

				arg_153_1.leftNameTxt_.text = var_156_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_14 = arg_153_1:GetWordFromCfg(116011036)
				local var_156_15 = arg_153_1:FormatText(var_156_14.content)

				arg_153_1.text_.text = var_156_15

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_16 = 34
				local var_156_17 = utf8.len(var_156_15)
				local var_156_18 = var_156_16 <= 0 and var_156_12 or var_156_12 * (var_156_17 / var_156_16)

				if var_156_18 > 0 and var_156_12 < var_156_18 then
					arg_153_1.talkMaxDuration = var_156_18

					if var_156_18 + var_156_11 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_18 + var_156_11
					end
				end

				arg_153_1.text_.text = var_156_15
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011036", "story_v_out_116011.awb") ~= 0 then
					local var_156_19 = manager.audio:GetVoiceLength("story_v_out_116011", "116011036", "story_v_out_116011.awb") / 1000

					if var_156_19 + var_156_11 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_19 + var_156_11
					end

					if var_156_14.prefab_name ~= "" and arg_153_1.actors_[var_156_14.prefab_name] ~= nil then
						local var_156_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_14.prefab_name].transform, "story_v_out_116011", "116011036", "story_v_out_116011.awb")

						arg_153_1:RecordAudio("116011036", var_156_20)
						arg_153_1:RecordAudio("116011036", var_156_20)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_116011", "116011036", "story_v_out_116011.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_116011", "116011036", "story_v_out_116011.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_21 = math.max(var_156_12, arg_153_1.talkMaxDuration)

			if var_156_11 <= arg_153_1.time_ and arg_153_1.time_ < var_156_11 + var_156_21 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_11) / var_156_21

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_11 + var_156_21 and arg_153_1.time_ < var_156_11 + var_156_21 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play116011037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 116011037
		arg_157_1.duration_ = 14.433

		local var_157_0 = {
			zh = 7.366,
			ja = 14.433
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play116011038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1039ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1039ui_story == nil then
				arg_157_1.var_.characterEffect1039ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.2

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1039ui_story then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1039ui_story.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1039ui_story then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1039ui_story.fillRatio = var_160_5
			end

			local var_160_6 = arg_157_1.actors_["1048ui_story"]
			local var_160_7 = 0

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 and arg_157_1.var_.characterEffect1048ui_story == nil then
				arg_157_1.var_.characterEffect1048ui_story = var_160_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_8 = 0.2

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_8 then
				local var_160_9 = (arg_157_1.time_ - var_160_7) / var_160_8

				if arg_157_1.var_.characterEffect1048ui_story then
					arg_157_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_7 + var_160_8 and arg_157_1.time_ < var_160_7 + var_160_8 + arg_160_0 and arg_157_1.var_.characterEffect1048ui_story then
				arg_157_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 then
				arg_157_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_160_11 = 0

			if var_160_11 < arg_157_1.time_ and arg_157_1.time_ <= var_160_11 + arg_160_0 then
				arg_157_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_160_12 = 0
			local var_160_13 = 0.975

			if var_160_12 < arg_157_1.time_ and arg_157_1.time_ <= var_160_12 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_14 = arg_157_1:FormatText(StoryNameCfg[8].name)

				arg_157_1.leftNameTxt_.text = var_160_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_15 = arg_157_1:GetWordFromCfg(116011037)
				local var_160_16 = arg_157_1:FormatText(var_160_15.content)

				arg_157_1.text_.text = var_160_16

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_17 = 39
				local var_160_18 = utf8.len(var_160_16)
				local var_160_19 = var_160_17 <= 0 and var_160_13 or var_160_13 * (var_160_18 / var_160_17)

				if var_160_19 > 0 and var_160_13 < var_160_19 then
					arg_157_1.talkMaxDuration = var_160_19

					if var_160_19 + var_160_12 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_19 + var_160_12
					end
				end

				arg_157_1.text_.text = var_160_16
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011037", "story_v_out_116011.awb") ~= 0 then
					local var_160_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011037", "story_v_out_116011.awb") / 1000

					if var_160_20 + var_160_12 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_20 + var_160_12
					end

					if var_160_15.prefab_name ~= "" and arg_157_1.actors_[var_160_15.prefab_name] ~= nil then
						local var_160_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_15.prefab_name].transform, "story_v_out_116011", "116011037", "story_v_out_116011.awb")

						arg_157_1:RecordAudio("116011037", var_160_21)
						arg_157_1:RecordAudio("116011037", var_160_21)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_116011", "116011037", "story_v_out_116011.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_116011", "116011037", "story_v_out_116011.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_22 = math.max(var_160_13, arg_157_1.talkMaxDuration)

			if var_160_12 <= arg_157_1.time_ and arg_157_1.time_ < var_160_12 + var_160_22 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_12) / var_160_22

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_12 + var_160_22 and arg_157_1.time_ < var_160_12 + var_160_22 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play116011038 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 116011038
		arg_161_1.duration_ = 4.733

		local var_161_0 = {
			zh = 2.333,
			ja = 4.733
		}
		local var_161_1 = manager.audio:GetLocalizationFlag()

		if var_161_0[var_161_1] ~= nil then
			arg_161_1.duration_ = var_161_0[var_161_1]
		end

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play116011039(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1048ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1048ui_story == nil then
				arg_161_1.var_.characterEffect1048ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.2

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1048ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1048ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1048ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1048ui_story.fillRatio = var_164_5
			end

			local var_164_6 = arg_161_1.actors_["1039ui_story"]
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 and arg_161_1.var_.characterEffect1039ui_story == nil then
				arg_161_1.var_.characterEffect1039ui_story = var_164_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_8 = 0.2

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_8 then
				local var_164_9 = (arg_161_1.time_ - var_164_7) / var_164_8

				if arg_161_1.var_.characterEffect1039ui_story then
					arg_161_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_7 + var_164_8 and arg_161_1.time_ < var_164_7 + var_164_8 + arg_164_0 and arg_161_1.var_.characterEffect1039ui_story then
				arg_161_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_164_11 = 0

			if var_164_11 < arg_161_1.time_ and arg_161_1.time_ <= var_164_11 + arg_164_0 then
				arg_161_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_164_12 = 0
			local var_164_13 = 0.25

			if var_164_12 < arg_161_1.time_ and arg_161_1.time_ <= var_164_12 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_14 = arg_161_1:FormatText(StoryNameCfg[9].name)

				arg_161_1.leftNameTxt_.text = var_164_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_15 = arg_161_1:GetWordFromCfg(116011038)
				local var_164_16 = arg_161_1:FormatText(var_164_15.content)

				arg_161_1.text_.text = var_164_16

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_17 = 10
				local var_164_18 = utf8.len(var_164_16)
				local var_164_19 = var_164_17 <= 0 and var_164_13 or var_164_13 * (var_164_18 / var_164_17)

				if var_164_19 > 0 and var_164_13 < var_164_19 then
					arg_161_1.talkMaxDuration = var_164_19

					if var_164_19 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_19 + var_164_12
					end
				end

				arg_161_1.text_.text = var_164_16
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011038", "story_v_out_116011.awb") ~= 0 then
					local var_164_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011038", "story_v_out_116011.awb") / 1000

					if var_164_20 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_20 + var_164_12
					end

					if var_164_15.prefab_name ~= "" and arg_161_1.actors_[var_164_15.prefab_name] ~= nil then
						local var_164_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_15.prefab_name].transform, "story_v_out_116011", "116011038", "story_v_out_116011.awb")

						arg_161_1:RecordAudio("116011038", var_164_21)
						arg_161_1:RecordAudio("116011038", var_164_21)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_116011", "116011038", "story_v_out_116011.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_116011", "116011038", "story_v_out_116011.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_22 = math.max(var_164_13, arg_161_1.talkMaxDuration)

			if var_164_12 <= arg_161_1.time_ and arg_161_1.time_ < var_164_12 + var_164_22 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_12) / var_164_22

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_12 + var_164_22 and arg_161_1.time_ < var_164_12 + var_164_22 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play116011039 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 116011039
		arg_165_1.duration_ = 9.933

		local var_165_0 = {
			zh = 8.2,
			ja = 9.933
		}
		local var_165_1 = manager.audio:GetLocalizationFlag()

		if var_165_0[var_165_1] ~= nil then
			arg_165_1.duration_ = var_165_0[var_165_1]
		end

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play116011040(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_2")
			end

			local var_168_2 = 0

			if var_168_2 < arg_165_1.time_ and arg_165_1.time_ <= var_168_2 + arg_168_0 then
				arg_165_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_168_3 = 0
			local var_168_4 = 0.95

			if var_168_3 < arg_165_1.time_ and arg_165_1.time_ <= var_168_3 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_5 = arg_165_1:FormatText(StoryNameCfg[9].name)

				arg_165_1.leftNameTxt_.text = var_168_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_6 = arg_165_1:GetWordFromCfg(116011039)
				local var_168_7 = arg_165_1:FormatText(var_168_6.content)

				arg_165_1.text_.text = var_168_7

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_8 = 38
				local var_168_9 = utf8.len(var_168_7)
				local var_168_10 = var_168_8 <= 0 and var_168_4 or var_168_4 * (var_168_9 / var_168_8)

				if var_168_10 > 0 and var_168_4 < var_168_10 then
					arg_165_1.talkMaxDuration = var_168_10

					if var_168_10 + var_168_3 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_10 + var_168_3
					end
				end

				arg_165_1.text_.text = var_168_7
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011039", "story_v_out_116011.awb") ~= 0 then
					local var_168_11 = manager.audio:GetVoiceLength("story_v_out_116011", "116011039", "story_v_out_116011.awb") / 1000

					if var_168_11 + var_168_3 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_11 + var_168_3
					end

					if var_168_6.prefab_name ~= "" and arg_165_1.actors_[var_168_6.prefab_name] ~= nil then
						local var_168_12 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_6.prefab_name].transform, "story_v_out_116011", "116011039", "story_v_out_116011.awb")

						arg_165_1:RecordAudio("116011039", var_168_12)
						arg_165_1:RecordAudio("116011039", var_168_12)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_116011", "116011039", "story_v_out_116011.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_116011", "116011039", "story_v_out_116011.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_13 = math.max(var_168_4, arg_165_1.talkMaxDuration)

			if var_168_3 <= arg_165_1.time_ and arg_165_1.time_ < var_168_3 + var_168_13 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_3) / var_168_13

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_3 + var_168_13 and arg_165_1.time_ < var_168_3 + var_168_13 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play116011040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 116011040
		arg_169_1.duration_ = 7.266

		local var_169_0 = {
			zh = 7.266,
			ja = 6.2
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play116011041(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1039ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect1039ui_story == nil then
				arg_169_1.var_.characterEffect1039ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.0638109967112541

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1039ui_story then
					arg_169_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect1039ui_story then
				arg_169_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_172_4 = arg_169_1.actors_["1048ui_story"]
			local var_172_5 = 0

			if var_172_5 < arg_169_1.time_ and arg_169_1.time_ <= var_172_5 + arg_172_0 and arg_169_1.var_.characterEffect1048ui_story == nil then
				arg_169_1.var_.characterEffect1048ui_story = var_172_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_6 = 0.0638109967112541

			if var_172_5 <= arg_169_1.time_ and arg_169_1.time_ < var_172_5 + var_172_6 then
				local var_172_7 = (arg_169_1.time_ - var_172_5) / var_172_6

				if arg_169_1.var_.characterEffect1048ui_story then
					local var_172_8 = Mathf.Lerp(0, 0.5, var_172_7)

					arg_169_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1048ui_story.fillRatio = var_172_8
				end
			end

			if arg_169_1.time_ >= var_172_5 + var_172_6 and arg_169_1.time_ < var_172_5 + var_172_6 + arg_172_0 and arg_169_1.var_.characterEffect1048ui_story then
				local var_172_9 = 0.5

				arg_169_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1048ui_story.fillRatio = var_172_9
			end

			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 then
				arg_169_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action454")
			end

			local var_172_11 = 0

			if var_172_11 < arg_169_1.time_ and arg_169_1.time_ <= var_172_11 + arg_172_0 then
				arg_169_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_12 = 0
			local var_172_13 = 0.75

			if var_172_12 < arg_169_1.time_ and arg_169_1.time_ <= var_172_12 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_14 = arg_169_1:FormatText(StoryNameCfg[9].name)

				arg_169_1.leftNameTxt_.text = var_172_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_15 = arg_169_1:GetWordFromCfg(116011040)
				local var_172_16 = arg_169_1:FormatText(var_172_15.content)

				arg_169_1.text_.text = var_172_16

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_17 = 30
				local var_172_18 = utf8.len(var_172_16)
				local var_172_19 = var_172_17 <= 0 and var_172_13 or var_172_13 * (var_172_18 / var_172_17)

				if var_172_19 > 0 and var_172_13 < var_172_19 then
					arg_169_1.talkMaxDuration = var_172_19

					if var_172_19 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_19 + var_172_12
					end
				end

				arg_169_1.text_.text = var_172_16
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011040", "story_v_out_116011.awb") ~= 0 then
					local var_172_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011040", "story_v_out_116011.awb") / 1000

					if var_172_20 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_20 + var_172_12
					end

					if var_172_15.prefab_name ~= "" and arg_169_1.actors_[var_172_15.prefab_name] ~= nil then
						local var_172_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_15.prefab_name].transform, "story_v_out_116011", "116011040", "story_v_out_116011.awb")

						arg_169_1:RecordAudio("116011040", var_172_21)
						arg_169_1:RecordAudio("116011040", var_172_21)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_116011", "116011040", "story_v_out_116011.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_116011", "116011040", "story_v_out_116011.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_22 = math.max(var_172_13, arg_169_1.talkMaxDuration)

			if var_172_12 <= arg_169_1.time_ and arg_169_1.time_ < var_172_12 + var_172_22 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_12) / var_172_22

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_12 + var_172_22 and arg_169_1.time_ < var_172_12 + var_172_22 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play116011041 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 116011041
		arg_173_1.duration_ = 14.3

		local var_173_0 = {
			zh = 10.2,
			ja = 14.3
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play116011042(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1039ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1039ui_story == nil then
				arg_173_1.var_.characterEffect1039ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1039ui_story then
					local var_176_4 = Mathf.Lerp(0, 0.5, var_176_3)

					arg_173_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1039ui_story.fillRatio = var_176_4
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1039ui_story then
				local var_176_5 = 0.5

				arg_173_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1039ui_story.fillRatio = var_176_5
			end

			local var_176_6 = arg_173_1.actors_["1048ui_story"]
			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 and arg_173_1.var_.characterEffect1048ui_story == nil then
				arg_173_1.var_.characterEffect1048ui_story = var_176_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_8 = 0.2

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_8 then
				local var_176_9 = (arg_173_1.time_ - var_176_7) / var_176_8

				if arg_173_1.var_.characterEffect1048ui_story then
					arg_173_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_7 + var_176_8 and arg_173_1.time_ < var_176_7 + var_176_8 + arg_176_0 and arg_173_1.var_.characterEffect1048ui_story then
				arg_173_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 then
				arg_173_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_176_11 = 0

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 then
				arg_173_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_176_12 = 0
			local var_176_13 = 1.475

			if var_176_12 < arg_173_1.time_ and arg_173_1.time_ <= var_176_12 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_14 = arg_173_1:FormatText(StoryNameCfg[8].name)

				arg_173_1.leftNameTxt_.text = var_176_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_15 = arg_173_1:GetWordFromCfg(116011041)
				local var_176_16 = arg_173_1:FormatText(var_176_15.content)

				arg_173_1.text_.text = var_176_16

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_17 = 59
				local var_176_18 = utf8.len(var_176_16)
				local var_176_19 = var_176_17 <= 0 and var_176_13 or var_176_13 * (var_176_18 / var_176_17)

				if var_176_19 > 0 and var_176_13 < var_176_19 then
					arg_173_1.talkMaxDuration = var_176_19

					if var_176_19 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_12
					end
				end

				arg_173_1.text_.text = var_176_16
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011041", "story_v_out_116011.awb") ~= 0 then
					local var_176_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011041", "story_v_out_116011.awb") / 1000

					if var_176_20 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_20 + var_176_12
					end

					if var_176_15.prefab_name ~= "" and arg_173_1.actors_[var_176_15.prefab_name] ~= nil then
						local var_176_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_15.prefab_name].transform, "story_v_out_116011", "116011041", "story_v_out_116011.awb")

						arg_173_1:RecordAudio("116011041", var_176_21)
						arg_173_1:RecordAudio("116011041", var_176_21)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_116011", "116011041", "story_v_out_116011.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_116011", "116011041", "story_v_out_116011.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_22 = math.max(var_176_13, arg_173_1.talkMaxDuration)

			if var_176_12 <= arg_173_1.time_ and arg_173_1.time_ < var_176_12 + var_176_22 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_12) / var_176_22

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_12 + var_176_22 and arg_173_1.time_ < var_176_12 + var_176_22 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play116011042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 116011042
		arg_177_1.duration_ = 4.3

		local var_177_0 = {
			zh = 4.3,
			ja = 3.933
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play116011043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1039ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1039ui_story == nil then
				arg_177_1.var_.characterEffect1039ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1039ui_story then
					arg_177_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1039ui_story then
				arg_177_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_180_4 = arg_177_1.actors_["1048ui_story"]
			local var_180_5 = 0

			if var_180_5 < arg_177_1.time_ and arg_177_1.time_ <= var_180_5 + arg_180_0 and arg_177_1.var_.characterEffect1048ui_story == nil then
				arg_177_1.var_.characterEffect1048ui_story = var_180_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_6 = 0.2

			if var_180_5 <= arg_177_1.time_ and arg_177_1.time_ < var_180_5 + var_180_6 then
				local var_180_7 = (arg_177_1.time_ - var_180_5) / var_180_6

				if arg_177_1.var_.characterEffect1048ui_story then
					local var_180_8 = Mathf.Lerp(0, 0.5, var_180_7)

					arg_177_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1048ui_story.fillRatio = var_180_8
				end
			end

			if arg_177_1.time_ >= var_180_5 + var_180_6 and arg_177_1.time_ < var_180_5 + var_180_6 + arg_180_0 and arg_177_1.var_.characterEffect1048ui_story then
				local var_180_9 = 0.5

				arg_177_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1048ui_story.fillRatio = var_180_9
			end

			local var_180_10 = 0

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 then
				arg_177_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action4_2")
			end

			local var_180_11 = 0

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_180_12 = 0
			local var_180_13 = 0.325

			if var_180_12 < arg_177_1.time_ and arg_177_1.time_ <= var_180_12 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_14 = arg_177_1:FormatText(StoryNameCfg[9].name)

				arg_177_1.leftNameTxt_.text = var_180_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_15 = arg_177_1:GetWordFromCfg(116011042)
				local var_180_16 = arg_177_1:FormatText(var_180_15.content)

				arg_177_1.text_.text = var_180_16

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_17 = 13
				local var_180_18 = utf8.len(var_180_16)
				local var_180_19 = var_180_17 <= 0 and var_180_13 or var_180_13 * (var_180_18 / var_180_17)

				if var_180_19 > 0 and var_180_13 < var_180_19 then
					arg_177_1.talkMaxDuration = var_180_19

					if var_180_19 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_12
					end
				end

				arg_177_1.text_.text = var_180_16
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011042", "story_v_out_116011.awb") ~= 0 then
					local var_180_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011042", "story_v_out_116011.awb") / 1000

					if var_180_20 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_20 + var_180_12
					end

					if var_180_15.prefab_name ~= "" and arg_177_1.actors_[var_180_15.prefab_name] ~= nil then
						local var_180_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_15.prefab_name].transform, "story_v_out_116011", "116011042", "story_v_out_116011.awb")

						arg_177_1:RecordAudio("116011042", var_180_21)
						arg_177_1:RecordAudio("116011042", var_180_21)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_116011", "116011042", "story_v_out_116011.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_116011", "116011042", "story_v_out_116011.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_22 = math.max(var_180_13, arg_177_1.talkMaxDuration)

			if var_180_12 <= arg_177_1.time_ and arg_177_1.time_ < var_180_12 + var_180_22 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_12) / var_180_22

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_12 + var_180_22 and arg_177_1.time_ < var_180_12 + var_180_22 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play116011043 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 116011043
		arg_181_1.duration_ = 17.6

		local var_181_0 = {
			zh = 11.1,
			ja = 17.6
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play116011044(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_184_1 = 0
			local var_184_2 = 1.5

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_3 = arg_181_1:FormatText(StoryNameCfg[9].name)

				arg_181_1.leftNameTxt_.text = var_184_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_4 = arg_181_1:GetWordFromCfg(116011043)
				local var_184_5 = arg_181_1:FormatText(var_184_4.content)

				arg_181_1.text_.text = var_184_5

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_6 = 60
				local var_184_7 = utf8.len(var_184_5)
				local var_184_8 = var_184_6 <= 0 and var_184_2 or var_184_2 * (var_184_7 / var_184_6)

				if var_184_8 > 0 and var_184_2 < var_184_8 then
					arg_181_1.talkMaxDuration = var_184_8

					if var_184_8 + var_184_1 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_1
					end
				end

				arg_181_1.text_.text = var_184_5
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011043", "story_v_out_116011.awb") ~= 0 then
					local var_184_9 = manager.audio:GetVoiceLength("story_v_out_116011", "116011043", "story_v_out_116011.awb") / 1000

					if var_184_9 + var_184_1 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_9 + var_184_1
					end

					if var_184_4.prefab_name ~= "" and arg_181_1.actors_[var_184_4.prefab_name] ~= nil then
						local var_184_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_4.prefab_name].transform, "story_v_out_116011", "116011043", "story_v_out_116011.awb")

						arg_181_1:RecordAudio("116011043", var_184_10)
						arg_181_1:RecordAudio("116011043", var_184_10)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_116011", "116011043", "story_v_out_116011.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_116011", "116011043", "story_v_out_116011.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_11 = math.max(var_184_2, arg_181_1.talkMaxDuration)

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_11 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_1) / var_184_11

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_1 + var_184_11 and arg_181_1.time_ < var_184_1 + var_184_11 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play116011044 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 116011044
		arg_185_1.duration_ = 7.966

		local var_185_0 = {
			zh = 5.766,
			ja = 7.966
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play116011045(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1048ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1048ui_story == nil then
				arg_185_1.var_.characterEffect1048ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.2

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1048ui_story then
					arg_185_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1048ui_story then
				arg_185_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_188_4 = arg_185_1.actors_["1039ui_story"]
			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 and arg_185_1.var_.characterEffect1039ui_story == nil then
				arg_185_1.var_.characterEffect1039ui_story = var_188_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_6 = 0.2

			if var_188_5 <= arg_185_1.time_ and arg_185_1.time_ < var_188_5 + var_188_6 then
				local var_188_7 = (arg_185_1.time_ - var_188_5) / var_188_6

				if arg_185_1.var_.characterEffect1039ui_story then
					local var_188_8 = Mathf.Lerp(0, 0.5, var_188_7)

					arg_185_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1039ui_story.fillRatio = var_188_8
				end
			end

			if arg_185_1.time_ >= var_188_5 + var_188_6 and arg_185_1.time_ < var_188_5 + var_188_6 + arg_188_0 and arg_185_1.var_.characterEffect1039ui_story then
				local var_188_9 = 0.5

				arg_185_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1039ui_story.fillRatio = var_188_9
			end

			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				arg_185_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_188_11 = 0

			if var_188_11 < arg_185_1.time_ and arg_185_1.time_ <= var_188_11 + arg_188_0 then
				arg_185_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action454")
			end

			local var_188_12 = 0
			local var_188_13 = 0.675

			if var_188_12 < arg_185_1.time_ and arg_185_1.time_ <= var_188_12 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_14 = arg_185_1:FormatText(StoryNameCfg[8].name)

				arg_185_1.leftNameTxt_.text = var_188_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_15 = arg_185_1:GetWordFromCfg(116011044)
				local var_188_16 = arg_185_1:FormatText(var_188_15.content)

				arg_185_1.text_.text = var_188_16

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_17 = 27
				local var_188_18 = utf8.len(var_188_16)
				local var_188_19 = var_188_17 <= 0 and var_188_13 or var_188_13 * (var_188_18 / var_188_17)

				if var_188_19 > 0 and var_188_13 < var_188_19 then
					arg_185_1.talkMaxDuration = var_188_19

					if var_188_19 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_19 + var_188_12
					end
				end

				arg_185_1.text_.text = var_188_16
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011044", "story_v_out_116011.awb") ~= 0 then
					local var_188_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011044", "story_v_out_116011.awb") / 1000

					if var_188_20 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_20 + var_188_12
					end

					if var_188_15.prefab_name ~= "" and arg_185_1.actors_[var_188_15.prefab_name] ~= nil then
						local var_188_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_15.prefab_name].transform, "story_v_out_116011", "116011044", "story_v_out_116011.awb")

						arg_185_1:RecordAudio("116011044", var_188_21)
						arg_185_1:RecordAudio("116011044", var_188_21)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_116011", "116011044", "story_v_out_116011.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_116011", "116011044", "story_v_out_116011.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_22 = math.max(var_188_13, arg_185_1.talkMaxDuration)

			if var_188_12 <= arg_185_1.time_ and arg_185_1.time_ < var_188_12 + var_188_22 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_12) / var_188_22

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_12 + var_188_22 and arg_185_1.time_ < var_188_12 + var_188_22 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play116011045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 116011045
		arg_189_1.duration_ = 18.666

		local var_189_0 = {
			zh = 11.033,
			ja = 18.666
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play116011046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1048ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect1048ui_story == nil then
				arg_189_1.var_.characterEffect1048ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.2

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1048ui_story then
					local var_192_4 = Mathf.Lerp(0, 0.5, var_192_3)

					arg_189_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1048ui_story.fillRatio = var_192_4
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect1048ui_story then
				local var_192_5 = 0.5

				arg_189_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1048ui_story.fillRatio = var_192_5
			end

			local var_192_6 = arg_189_1.actors_["1039ui_story"]
			local var_192_7 = 0

			if var_192_7 < arg_189_1.time_ and arg_189_1.time_ <= var_192_7 + arg_192_0 and arg_189_1.var_.characterEffect1039ui_story == nil then
				arg_189_1.var_.characterEffect1039ui_story = var_192_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_8 = 0.2

			if var_192_7 <= arg_189_1.time_ and arg_189_1.time_ < var_192_7 + var_192_8 then
				local var_192_9 = (arg_189_1.time_ - var_192_7) / var_192_8

				if arg_189_1.var_.characterEffect1039ui_story then
					arg_189_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_7 + var_192_8 and arg_189_1.time_ < var_192_7 + var_192_8 + arg_192_0 and arg_189_1.var_.characterEffect1039ui_story then
				arg_189_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 then
				arg_189_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_192_11 = 0

			if var_192_11 < arg_189_1.time_ and arg_189_1.time_ <= var_192_11 + arg_192_0 then
				arg_189_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_192_12 = 0
			local var_192_13 = 1.375

			if var_192_12 < arg_189_1.time_ and arg_189_1.time_ <= var_192_12 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_14 = arg_189_1:FormatText(StoryNameCfg[9].name)

				arg_189_1.leftNameTxt_.text = var_192_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_15 = arg_189_1:GetWordFromCfg(116011045)
				local var_192_16 = arg_189_1:FormatText(var_192_15.content)

				arg_189_1.text_.text = var_192_16

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_17 = 55
				local var_192_18 = utf8.len(var_192_16)
				local var_192_19 = var_192_17 <= 0 and var_192_13 or var_192_13 * (var_192_18 / var_192_17)

				if var_192_19 > 0 and var_192_13 < var_192_19 then
					arg_189_1.talkMaxDuration = var_192_19

					if var_192_19 + var_192_12 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_19 + var_192_12
					end
				end

				arg_189_1.text_.text = var_192_16
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011045", "story_v_out_116011.awb") ~= 0 then
					local var_192_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011045", "story_v_out_116011.awb") / 1000

					if var_192_20 + var_192_12 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_20 + var_192_12
					end

					if var_192_15.prefab_name ~= "" and arg_189_1.actors_[var_192_15.prefab_name] ~= nil then
						local var_192_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_15.prefab_name].transform, "story_v_out_116011", "116011045", "story_v_out_116011.awb")

						arg_189_1:RecordAudio("116011045", var_192_21)
						arg_189_1:RecordAudio("116011045", var_192_21)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_116011", "116011045", "story_v_out_116011.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_116011", "116011045", "story_v_out_116011.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_22 = math.max(var_192_13, arg_189_1.talkMaxDuration)

			if var_192_12 <= arg_189_1.time_ and arg_189_1.time_ < var_192_12 + var_192_22 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_12) / var_192_22

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_12 + var_192_22 and arg_189_1.time_ < var_192_12 + var_192_22 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play116011046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 116011046
		arg_193_1.duration_ = 10.066

		local var_193_0 = {
			zh = 9.6,
			ja = 10.066
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play116011047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1048ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect1048ui_story == nil then
				arg_193_1.var_.characterEffect1048ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.2

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect1048ui_story then
					arg_193_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect1048ui_story then
				arg_193_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_196_4 = arg_193_1.actors_["1039ui_story"]
			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 and arg_193_1.var_.characterEffect1039ui_story == nil then
				arg_193_1.var_.characterEffect1039ui_story = var_196_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_6 = 0.2

			if var_196_5 <= arg_193_1.time_ and arg_193_1.time_ < var_196_5 + var_196_6 then
				local var_196_7 = (arg_193_1.time_ - var_196_5) / var_196_6

				if arg_193_1.var_.characterEffect1039ui_story then
					local var_196_8 = Mathf.Lerp(0, 0.5, var_196_7)

					arg_193_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1039ui_story.fillRatio = var_196_8
				end
			end

			if arg_193_1.time_ >= var_196_5 + var_196_6 and arg_193_1.time_ < var_196_5 + var_196_6 + arg_196_0 and arg_193_1.var_.characterEffect1039ui_story then
				local var_196_9 = 0.5

				arg_193_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1039ui_story.fillRatio = var_196_9
			end

			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 then
				arg_193_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action443")
			end

			local var_196_11 = 0

			if var_196_11 < arg_193_1.time_ and arg_193_1.time_ <= var_196_11 + arg_196_0 then
				arg_193_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_196_12 = 0
			local var_196_13 = 1.1

			if var_196_12 < arg_193_1.time_ and arg_193_1.time_ <= var_196_12 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_14 = arg_193_1:FormatText(StoryNameCfg[8].name)

				arg_193_1.leftNameTxt_.text = var_196_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_15 = arg_193_1:GetWordFromCfg(116011046)
				local var_196_16 = arg_193_1:FormatText(var_196_15.content)

				arg_193_1.text_.text = var_196_16

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_17 = 44
				local var_196_18 = utf8.len(var_196_16)
				local var_196_19 = var_196_17 <= 0 and var_196_13 or var_196_13 * (var_196_18 / var_196_17)

				if var_196_19 > 0 and var_196_13 < var_196_19 then
					arg_193_1.talkMaxDuration = var_196_19

					if var_196_19 + var_196_12 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_19 + var_196_12
					end
				end

				arg_193_1.text_.text = var_196_16
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011046", "story_v_out_116011.awb") ~= 0 then
					local var_196_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011046", "story_v_out_116011.awb") / 1000

					if var_196_20 + var_196_12 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_20 + var_196_12
					end

					if var_196_15.prefab_name ~= "" and arg_193_1.actors_[var_196_15.prefab_name] ~= nil then
						local var_196_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_15.prefab_name].transform, "story_v_out_116011", "116011046", "story_v_out_116011.awb")

						arg_193_1:RecordAudio("116011046", var_196_21)
						arg_193_1:RecordAudio("116011046", var_196_21)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_116011", "116011046", "story_v_out_116011.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_116011", "116011046", "story_v_out_116011.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_22 = math.max(var_196_13, arg_193_1.talkMaxDuration)

			if var_196_12 <= arg_193_1.time_ and arg_193_1.time_ < var_196_12 + var_196_22 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_12) / var_196_22

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_12 + var_196_22 and arg_193_1.time_ < var_196_12 + var_196_22 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play116011047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 116011047
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play116011048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1039ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos1039ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(0, 100, 0)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1039ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, 100, 0)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["1048ui_story"].transform
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 then
				arg_197_1.var_.moveOldPos1048ui_story = var_200_9.localPosition
			end

			local var_200_11 = 0.001

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11
				local var_200_13 = Vector3.New(0, 100, 0)

				var_200_9.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1048ui_story, var_200_13, var_200_12)

				local var_200_14 = manager.ui.mainCamera.transform.position - var_200_9.position

				var_200_9.forward = Vector3.New(var_200_14.x, var_200_14.y, var_200_14.z)

				local var_200_15 = var_200_9.localEulerAngles

				var_200_15.z = 0
				var_200_15.x = 0
				var_200_9.localEulerAngles = var_200_15
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 then
				var_200_9.localPosition = Vector3.New(0, 100, 0)

				local var_200_16 = manager.ui.mainCamera.transform.position - var_200_9.position

				var_200_9.forward = Vector3.New(var_200_16.x, var_200_16.y, var_200_16.z)

				local var_200_17 = var_200_9.localEulerAngles

				var_200_17.z = 0
				var_200_17.x = 0
				var_200_9.localEulerAngles = var_200_17
			end

			local var_200_18 = 0
			local var_200_19 = 0.625

			if var_200_18 < arg_197_1.time_ and arg_197_1.time_ <= var_200_18 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_20 = arg_197_1:GetWordFromCfg(116011047)
				local var_200_21 = arg_197_1:FormatText(var_200_20.content)

				arg_197_1.text_.text = var_200_21

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_22 = 25
				local var_200_23 = utf8.len(var_200_21)
				local var_200_24 = var_200_22 <= 0 and var_200_19 or var_200_19 * (var_200_23 / var_200_22)

				if var_200_24 > 0 and var_200_19 < var_200_24 then
					arg_197_1.talkMaxDuration = var_200_24

					if var_200_24 + var_200_18 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_24 + var_200_18
					end
				end

				arg_197_1.text_.text = var_200_21
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_25 = math.max(var_200_19, arg_197_1.talkMaxDuration)

			if var_200_18 <= arg_197_1.time_ and arg_197_1.time_ < var_200_18 + var_200_25 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_18) / var_200_25

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_18 + var_200_25 and arg_197_1.time_ < var_200_18 + var_200_25 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play116011048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 116011048
		arg_201_1.duration_ = 15.899999999999

		local var_201_0 = {
			zh = 11.065999999999,
			ja = 15.899999999999
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play116011049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = "I05a"

			if arg_201_1.bgs_[var_204_0] == nil then
				local var_204_1 = Object.Instantiate(arg_201_1.paintGo_)

				var_204_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_204_0)
				var_204_1.name = var_204_0
				var_204_1.transform.parent = arg_201_1.stage_.transform
				var_204_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_201_1.bgs_[var_204_0] = var_204_1
			end

			local var_204_2 = 2

			if var_204_2 < arg_201_1.time_ and arg_201_1.time_ <= var_204_2 + arg_204_0 then
				local var_204_3 = manager.ui.mainCamera.transform.localPosition
				local var_204_4 = Vector3.New(0, 0, 10) + Vector3.New(var_204_3.x, var_204_3.y, 0)
				local var_204_5 = arg_201_1.bgs_.I05a

				var_204_5.transform.localPosition = var_204_4
				var_204_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_204_6 = var_204_5:GetComponent("SpriteRenderer")

				if var_204_6 and var_204_6.sprite then
					local var_204_7 = (var_204_5.transform.localPosition - var_204_3).z
					local var_204_8 = manager.ui.mainCameraCom_
					local var_204_9 = 2 * var_204_7 * Mathf.Tan(var_204_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_204_10 = var_204_9 * var_204_8.aspect
					local var_204_11 = var_204_6.sprite.bounds.size.x
					local var_204_12 = var_204_6.sprite.bounds.size.y
					local var_204_13 = var_204_10 / var_204_11
					local var_204_14 = var_204_9 / var_204_12
					local var_204_15 = var_204_14 < var_204_13 and var_204_13 or var_204_14

					var_204_5.transform.localScale = Vector3.New(var_204_15, var_204_15, 0)
				end

				for iter_204_0, iter_204_1 in pairs(arg_201_1.bgs_) do
					if iter_204_0 ~= "I05a" then
						iter_204_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_204_16 = arg_201_1.actors_["1039ui_story"]
			local var_204_17 = 3.8

			if var_204_17 < arg_201_1.time_ and arg_201_1.time_ <= var_204_17 + arg_204_0 and arg_201_1.var_.characterEffect1039ui_story == nil then
				arg_201_1.var_.characterEffect1039ui_story = var_204_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_18 = 0.2

			if var_204_17 <= arg_201_1.time_ and arg_201_1.time_ < var_204_17 + var_204_18 then
				local var_204_19 = (arg_201_1.time_ - var_204_17) / var_204_18

				if arg_201_1.var_.characterEffect1039ui_story then
					local var_204_20 = Mathf.Lerp(0, 0.5, var_204_19)

					arg_201_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1039ui_story.fillRatio = var_204_20
				end
			end

			if arg_201_1.time_ >= var_204_17 + var_204_18 and arg_201_1.time_ < var_204_17 + var_204_18 + arg_204_0 and arg_201_1.var_.characterEffect1039ui_story then
				local var_204_21 = 0.5

				arg_201_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1039ui_story.fillRatio = var_204_21
			end

			local var_204_22 = arg_201_1.actors_["1048ui_story"]
			local var_204_23 = 3.8

			if var_204_23 < arg_201_1.time_ and arg_201_1.time_ <= var_204_23 + arg_204_0 and arg_201_1.var_.characterEffect1048ui_story == nil then
				arg_201_1.var_.characterEffect1048ui_story = var_204_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_24 = 0.2

			if var_204_23 <= arg_201_1.time_ and arg_201_1.time_ < var_204_23 + var_204_24 then
				local var_204_25 = (arg_201_1.time_ - var_204_23) / var_204_24

				if arg_201_1.var_.characterEffect1048ui_story then
					arg_201_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_23 + var_204_24 and arg_201_1.time_ < var_204_23 + var_204_24 + arg_204_0 and arg_201_1.var_.characterEffect1048ui_story then
				arg_201_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_204_26 = arg_201_1.actors_["1039ui_story"].transform
			local var_204_27 = 3.8

			if var_204_27 < arg_201_1.time_ and arg_201_1.time_ <= var_204_27 + arg_204_0 then
				arg_201_1.var_.moveOldPos1039ui_story = var_204_26.localPosition
			end

			local var_204_28 = 0.001

			if var_204_27 <= arg_201_1.time_ and arg_201_1.time_ < var_204_27 + var_204_28 then
				local var_204_29 = (arg_201_1.time_ - var_204_27) / var_204_28
				local var_204_30 = Vector3.New(-0.7, -1.01, -5.9)

				var_204_26.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1039ui_story, var_204_30, var_204_29)

				local var_204_31 = manager.ui.mainCamera.transform.position - var_204_26.position

				var_204_26.forward = Vector3.New(var_204_31.x, var_204_31.y, var_204_31.z)

				local var_204_32 = var_204_26.localEulerAngles

				var_204_32.z = 0
				var_204_32.x = 0
				var_204_26.localEulerAngles = var_204_32
			end

			if arg_201_1.time_ >= var_204_27 + var_204_28 and arg_201_1.time_ < var_204_27 + var_204_28 + arg_204_0 then
				var_204_26.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_204_33 = manager.ui.mainCamera.transform.position - var_204_26.position

				var_204_26.forward = Vector3.New(var_204_33.x, var_204_33.y, var_204_33.z)

				local var_204_34 = var_204_26.localEulerAngles

				var_204_34.z = 0
				var_204_34.x = 0
				var_204_26.localEulerAngles = var_204_34
			end

			local var_204_35 = arg_201_1.actors_["1048ui_story"].transform
			local var_204_36 = 3.8

			if var_204_36 < arg_201_1.time_ and arg_201_1.time_ <= var_204_36 + arg_204_0 then
				arg_201_1.var_.moveOldPos1048ui_story = var_204_35.localPosition
			end

			local var_204_37 = 0.001

			if var_204_36 <= arg_201_1.time_ and arg_201_1.time_ < var_204_36 + var_204_37 then
				local var_204_38 = (arg_201_1.time_ - var_204_36) / var_204_37
				local var_204_39 = Vector3.New(0.7, -0.8, -6.2)

				var_204_35.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1048ui_story, var_204_39, var_204_38)

				local var_204_40 = manager.ui.mainCamera.transform.position - var_204_35.position

				var_204_35.forward = Vector3.New(var_204_40.x, var_204_40.y, var_204_40.z)

				local var_204_41 = var_204_35.localEulerAngles

				var_204_41.z = 0
				var_204_41.x = 0
				var_204_35.localEulerAngles = var_204_41
			end

			if arg_201_1.time_ >= var_204_36 + var_204_37 and arg_201_1.time_ < var_204_36 + var_204_37 + arg_204_0 then
				var_204_35.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_204_42 = manager.ui.mainCamera.transform.position - var_204_35.position

				var_204_35.forward = Vector3.New(var_204_42.x, var_204_42.y, var_204_42.z)

				local var_204_43 = var_204_35.localEulerAngles

				var_204_43.z = 0
				var_204_43.x = 0
				var_204_35.localEulerAngles = var_204_43
			end

			local var_204_44 = 0

			if var_204_44 < arg_201_1.time_ and arg_201_1.time_ <= var_204_44 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_45 = 2

			if var_204_44 <= arg_201_1.time_ and arg_201_1.time_ < var_204_44 + var_204_45 then
				local var_204_46 = (arg_201_1.time_ - var_204_44) / var_204_45
				local var_204_47 = Color.New(0, 0, 0)

				var_204_47.a = Mathf.Lerp(0, 1, var_204_46)
				arg_201_1.mask_.color = var_204_47
			end

			if arg_201_1.time_ >= var_204_44 + var_204_45 and arg_201_1.time_ < var_204_44 + var_204_45 + arg_204_0 then
				local var_204_48 = Color.New(0, 0, 0)

				var_204_48.a = 1
				arg_201_1.mask_.color = var_204_48
			end

			local var_204_49 = 2

			if var_204_49 < arg_201_1.time_ and arg_201_1.time_ <= var_204_49 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_50 = 2

			if var_204_49 <= arg_201_1.time_ and arg_201_1.time_ < var_204_49 + var_204_50 then
				local var_204_51 = (arg_201_1.time_ - var_204_49) / var_204_50
				local var_204_52 = Color.New(0, 0, 0)

				var_204_52.a = Mathf.Lerp(1, 0, var_204_51)
				arg_201_1.mask_.color = var_204_52
			end

			if arg_201_1.time_ >= var_204_49 + var_204_50 and arg_201_1.time_ < var_204_49 + var_204_50 + arg_204_0 then
				local var_204_53 = Color.New(0, 0, 0)
				local var_204_54 = 0

				arg_201_1.mask_.enabled = false
				var_204_53.a = var_204_54
				arg_201_1.mask_.color = var_204_53
			end

			local var_204_55 = 3.8

			if var_204_55 < arg_201_1.time_ and arg_201_1.time_ <= var_204_55 + arg_204_0 then
				arg_201_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action1_1")
			end

			local var_204_56 = 3.8

			if var_204_56 < arg_201_1.time_ and arg_201_1.time_ <= var_204_56 + arg_204_0 then
				arg_201_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action4_1")
			end

			local var_204_57 = 3.8

			if var_204_57 < arg_201_1.time_ and arg_201_1.time_ <= var_204_57 + arg_204_0 then
				arg_201_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			if arg_201_1.frameCnt_ <= 1 then
				arg_201_1.dialog_:SetActive(false)
			end

			local var_204_58 = 3.999999999999
			local var_204_59 = 0.85

			if var_204_58 < arg_201_1.time_ and arg_201_1.time_ <= var_204_58 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0

				arg_201_1.dialog_:SetActive(true)

				local var_204_60 = LeanTween.value(arg_201_1.dialog_, 0, 1, 0.3)

				var_204_60:setOnUpdate(LuaHelper.FloatAction(function(arg_205_0)
					arg_201_1.dialogCg_.alpha = arg_205_0
				end))
				var_204_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_201_1.dialog_)
					var_204_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_201_1.duration_ = arg_201_1.duration_ + 0.3

				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_61 = arg_201_1:FormatText(StoryNameCfg[8].name)

				arg_201_1.leftNameTxt_.text = var_204_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_62 = arg_201_1:GetWordFromCfg(116011048)
				local var_204_63 = arg_201_1:FormatText(var_204_62.content)

				arg_201_1.text_.text = var_204_63

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_64 = 34
				local var_204_65 = utf8.len(var_204_63)
				local var_204_66 = var_204_64 <= 0 and var_204_59 or var_204_59 * (var_204_65 / var_204_64)

				if var_204_66 > 0 and var_204_59 < var_204_66 then
					arg_201_1.talkMaxDuration = var_204_66
					var_204_58 = var_204_58 + 0.3

					if var_204_66 + var_204_58 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_66 + var_204_58
					end
				end

				arg_201_1.text_.text = var_204_63
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011048", "story_v_out_116011.awb") ~= 0 then
					local var_204_67 = manager.audio:GetVoiceLength("story_v_out_116011", "116011048", "story_v_out_116011.awb") / 1000

					if var_204_67 + var_204_58 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_67 + var_204_58
					end

					if var_204_62.prefab_name ~= "" and arg_201_1.actors_[var_204_62.prefab_name] ~= nil then
						local var_204_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_62.prefab_name].transform, "story_v_out_116011", "116011048", "story_v_out_116011.awb")

						arg_201_1:RecordAudio("116011048", var_204_68)
						arg_201_1:RecordAudio("116011048", var_204_68)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_116011", "116011048", "story_v_out_116011.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_116011", "116011048", "story_v_out_116011.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_69 = var_204_58 + 0.3
			local var_204_70 = math.max(var_204_59, arg_201_1.talkMaxDuration)

			if var_204_69 <= arg_201_1.time_ and arg_201_1.time_ < var_204_69 + var_204_70 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_69) / var_204_70

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_69 + var_204_70 and arg_201_1.time_ < var_204_69 + var_204_70 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play116011049 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 116011049
		arg_207_1.duration_ = 17.033

		local var_207_0 = {
			zh = 9.633,
			ja = 17.033
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
				arg_207_0:Play116011050(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action447")
			end

			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_210_2 = 0
			local var_210_3 = 0.975

			if var_210_2 < arg_207_1.time_ and arg_207_1.time_ <= var_210_2 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_4 = arg_207_1:FormatText(StoryNameCfg[8].name)

				arg_207_1.leftNameTxt_.text = var_210_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_5 = arg_207_1:GetWordFromCfg(116011049)
				local var_210_6 = arg_207_1:FormatText(var_210_5.content)

				arg_207_1.text_.text = var_210_6

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_7 = 39
				local var_210_8 = utf8.len(var_210_6)
				local var_210_9 = var_210_7 <= 0 and var_210_3 or var_210_3 * (var_210_8 / var_210_7)

				if var_210_9 > 0 and var_210_3 < var_210_9 then
					arg_207_1.talkMaxDuration = var_210_9

					if var_210_9 + var_210_2 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_9 + var_210_2
					end
				end

				arg_207_1.text_.text = var_210_6
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011049", "story_v_out_116011.awb") ~= 0 then
					local var_210_10 = manager.audio:GetVoiceLength("story_v_out_116011", "116011049", "story_v_out_116011.awb") / 1000

					if var_210_10 + var_210_2 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_10 + var_210_2
					end

					if var_210_5.prefab_name ~= "" and arg_207_1.actors_[var_210_5.prefab_name] ~= nil then
						local var_210_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_5.prefab_name].transform, "story_v_out_116011", "116011049", "story_v_out_116011.awb")

						arg_207_1:RecordAudio("116011049", var_210_11)
						arg_207_1:RecordAudio("116011049", var_210_11)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_116011", "116011049", "story_v_out_116011.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_116011", "116011049", "story_v_out_116011.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_12 = math.max(var_210_3, arg_207_1.talkMaxDuration)

			if var_210_2 <= arg_207_1.time_ and arg_207_1.time_ < var_210_2 + var_210_12 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_2) / var_210_12

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_2 + var_210_12 and arg_207_1.time_ < var_210_2 + var_210_12 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play116011050 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 116011050
		arg_211_1.duration_ = 22.833

		local var_211_0 = {
			zh = 13.866,
			ja = 22.833
		}
		local var_211_1 = manager.audio:GetLocalizationFlag()

		if var_211_0[var_211_1] ~= nil then
			arg_211_1.duration_ = var_211_0[var_211_1]
		end

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play116011051(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1039ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1039ui_story == nil then
				arg_211_1.var_.characterEffect1039ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1039ui_story then
					arg_211_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1039ui_story then
				arg_211_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_214_4 = arg_211_1.actors_["1048ui_story"]
			local var_214_5 = 0

			if var_214_5 < arg_211_1.time_ and arg_211_1.time_ <= var_214_5 + arg_214_0 and arg_211_1.var_.characterEffect1048ui_story == nil then
				arg_211_1.var_.characterEffect1048ui_story = var_214_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_6 = 0.2

			if var_214_5 <= arg_211_1.time_ and arg_211_1.time_ < var_214_5 + var_214_6 then
				local var_214_7 = (arg_211_1.time_ - var_214_5) / var_214_6

				if arg_211_1.var_.characterEffect1048ui_story then
					local var_214_8 = Mathf.Lerp(0, 0.5, var_214_7)

					arg_211_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1048ui_story.fillRatio = var_214_8
				end
			end

			if arg_211_1.time_ >= var_214_5 + var_214_6 and arg_211_1.time_ < var_214_5 + var_214_6 + arg_214_0 and arg_211_1.var_.characterEffect1048ui_story then
				local var_214_9 = 0.5

				arg_211_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1048ui_story.fillRatio = var_214_9
			end

			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_214_11 = 0

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_214_12 = 0
			local var_214_13 = 1.55

			if var_214_12 < arg_211_1.time_ and arg_211_1.time_ <= var_214_12 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_14 = arg_211_1:FormatText(StoryNameCfg[9].name)

				arg_211_1.leftNameTxt_.text = var_214_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_15 = arg_211_1:GetWordFromCfg(116011050)
				local var_214_16 = arg_211_1:FormatText(var_214_15.content)

				arg_211_1.text_.text = var_214_16

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_17 = 62
				local var_214_18 = utf8.len(var_214_16)
				local var_214_19 = var_214_17 <= 0 and var_214_13 or var_214_13 * (var_214_18 / var_214_17)

				if var_214_19 > 0 and var_214_13 < var_214_19 then
					arg_211_1.talkMaxDuration = var_214_19

					if var_214_19 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_12
					end
				end

				arg_211_1.text_.text = var_214_16
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011050", "story_v_out_116011.awb") ~= 0 then
					local var_214_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011050", "story_v_out_116011.awb") / 1000

					if var_214_20 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_20 + var_214_12
					end

					if var_214_15.prefab_name ~= "" and arg_211_1.actors_[var_214_15.prefab_name] ~= nil then
						local var_214_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_15.prefab_name].transform, "story_v_out_116011", "116011050", "story_v_out_116011.awb")

						arg_211_1:RecordAudio("116011050", var_214_21)
						arg_211_1:RecordAudio("116011050", var_214_21)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_116011", "116011050", "story_v_out_116011.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_116011", "116011050", "story_v_out_116011.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_22 = math.max(var_214_13, arg_211_1.talkMaxDuration)

			if var_214_12 <= arg_211_1.time_ and arg_211_1.time_ < var_214_12 + var_214_22 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_12) / var_214_22

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_12 + var_214_22 and arg_211_1.time_ < var_214_12 + var_214_22 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play116011051 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 116011051
		arg_215_1.duration_ = 4.8

		local var_215_0 = {
			zh = 2.466,
			ja = 4.8
		}
		local var_215_1 = manager.audio:GetLocalizationFlag()

		if var_215_0[var_215_1] ~= nil then
			arg_215_1.duration_ = var_215_0[var_215_1]
		end

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play116011052(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1048ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1048ui_story == nil then
				arg_215_1.var_.characterEffect1048ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.2

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1048ui_story then
					arg_215_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1048ui_story then
				arg_215_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_218_4 = arg_215_1.actors_["1039ui_story"]
			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 and arg_215_1.var_.characterEffect1039ui_story == nil then
				arg_215_1.var_.characterEffect1039ui_story = var_218_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_6 = 0.2

			if var_218_5 <= arg_215_1.time_ and arg_215_1.time_ < var_218_5 + var_218_6 then
				local var_218_7 = (arg_215_1.time_ - var_218_5) / var_218_6

				if arg_215_1.var_.characterEffect1039ui_story then
					local var_218_8 = Mathf.Lerp(0, 0.5, var_218_7)

					arg_215_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1039ui_story.fillRatio = var_218_8
				end
			end

			if arg_215_1.time_ >= var_218_5 + var_218_6 and arg_215_1.time_ < var_218_5 + var_218_6 + arg_218_0 and arg_215_1.var_.characterEffect1039ui_story then
				local var_218_9 = 0.5

				arg_215_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1039ui_story.fillRatio = var_218_9
			end

			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 then
				arg_215_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action7_2")
			end

			local var_218_11 = 0

			if var_218_11 < arg_215_1.time_ and arg_215_1.time_ <= var_218_11 + arg_218_0 then
				arg_215_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_218_12 = 0
			local var_218_13 = 0.275

			if var_218_12 < arg_215_1.time_ and arg_215_1.time_ <= var_218_12 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_14 = arg_215_1:FormatText(StoryNameCfg[8].name)

				arg_215_1.leftNameTxt_.text = var_218_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_15 = arg_215_1:GetWordFromCfg(116011051)
				local var_218_16 = arg_215_1:FormatText(var_218_15.content)

				arg_215_1.text_.text = var_218_16

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_17 = 11
				local var_218_18 = utf8.len(var_218_16)
				local var_218_19 = var_218_17 <= 0 and var_218_13 or var_218_13 * (var_218_18 / var_218_17)

				if var_218_19 > 0 and var_218_13 < var_218_19 then
					arg_215_1.talkMaxDuration = var_218_19

					if var_218_19 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_19 + var_218_12
					end
				end

				arg_215_1.text_.text = var_218_16
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011051", "story_v_out_116011.awb") ~= 0 then
					local var_218_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011051", "story_v_out_116011.awb") / 1000

					if var_218_20 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_20 + var_218_12
					end

					if var_218_15.prefab_name ~= "" and arg_215_1.actors_[var_218_15.prefab_name] ~= nil then
						local var_218_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_15.prefab_name].transform, "story_v_out_116011", "116011051", "story_v_out_116011.awb")

						arg_215_1:RecordAudio("116011051", var_218_21)
						arg_215_1:RecordAudio("116011051", var_218_21)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_116011", "116011051", "story_v_out_116011.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_116011", "116011051", "story_v_out_116011.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_22 = math.max(var_218_13, arg_215_1.talkMaxDuration)

			if var_218_12 <= arg_215_1.time_ and arg_215_1.time_ < var_218_12 + var_218_22 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_12) / var_218_22

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_12 + var_218_22 and arg_215_1.time_ < var_218_12 + var_218_22 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play116011052 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 116011052
		arg_219_1.duration_ = 3.9

		local var_219_0 = {
			zh = 2.933,
			ja = 3.9
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play116011053(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1048ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1048ui_story == nil then
				arg_219_1.var_.characterEffect1048ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1048ui_story then
					local var_222_4 = Mathf.Lerp(0, 0.5, var_222_3)

					arg_219_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1048ui_story.fillRatio = var_222_4
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1048ui_story then
				local var_222_5 = 0.5

				arg_219_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1048ui_story.fillRatio = var_222_5
			end

			local var_222_6 = arg_219_1.actors_["1039ui_story"]
			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 and arg_219_1.var_.characterEffect1039ui_story == nil then
				arg_219_1.var_.characterEffect1039ui_story = var_222_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_8 = 0.2

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8

				if arg_219_1.var_.characterEffect1039ui_story then
					arg_219_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 and arg_219_1.var_.characterEffect1039ui_story then
				arg_219_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 then
				arg_219_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_222_11 = 0
			local var_222_12 = 0.2

			if var_222_11 < arg_219_1.time_ and arg_219_1.time_ <= var_222_11 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_13 = arg_219_1:FormatText(StoryNameCfg[9].name)

				arg_219_1.leftNameTxt_.text = var_222_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_14 = arg_219_1:GetWordFromCfg(116011052)
				local var_222_15 = arg_219_1:FormatText(var_222_14.content)

				arg_219_1.text_.text = var_222_15

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_16 = 8
				local var_222_17 = utf8.len(var_222_15)
				local var_222_18 = var_222_16 <= 0 and var_222_12 or var_222_12 * (var_222_17 / var_222_16)

				if var_222_18 > 0 and var_222_12 < var_222_18 then
					arg_219_1.talkMaxDuration = var_222_18

					if var_222_18 + var_222_11 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_18 + var_222_11
					end
				end

				arg_219_1.text_.text = var_222_15
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011052", "story_v_out_116011.awb") ~= 0 then
					local var_222_19 = manager.audio:GetVoiceLength("story_v_out_116011", "116011052", "story_v_out_116011.awb") / 1000

					if var_222_19 + var_222_11 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_11
					end

					if var_222_14.prefab_name ~= "" and arg_219_1.actors_[var_222_14.prefab_name] ~= nil then
						local var_222_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_14.prefab_name].transform, "story_v_out_116011", "116011052", "story_v_out_116011.awb")

						arg_219_1:RecordAudio("116011052", var_222_20)
						arg_219_1:RecordAudio("116011052", var_222_20)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_116011", "116011052", "story_v_out_116011.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_116011", "116011052", "story_v_out_116011.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_21 = math.max(var_222_12, arg_219_1.talkMaxDuration)

			if var_222_11 <= arg_219_1.time_ and arg_219_1.time_ < var_222_11 + var_222_21 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_11) / var_222_21

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_11 + var_222_21 and arg_219_1.time_ < var_222_11 + var_222_21 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play116011053 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 116011053
		arg_223_1.duration_ = 14.133

		local var_223_0 = {
			zh = 11.8,
			ja = 14.133
		}
		local var_223_1 = manager.audio:GetLocalizationFlag()

		if var_223_0[var_223_1] ~= nil then
			arg_223_1.duration_ = var_223_0[var_223_1]
		end

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play116011054(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1048ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1048ui_story == nil then
				arg_223_1.var_.characterEffect1048ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.2

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1048ui_story then
					arg_223_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1048ui_story then
				arg_223_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_226_4 = arg_223_1.actors_["1039ui_story"]
			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 and arg_223_1.var_.characterEffect1039ui_story == nil then
				arg_223_1.var_.characterEffect1039ui_story = var_226_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_6 = 0.2

			if var_226_5 <= arg_223_1.time_ and arg_223_1.time_ < var_226_5 + var_226_6 then
				local var_226_7 = (arg_223_1.time_ - var_226_5) / var_226_6

				if arg_223_1.var_.characterEffect1039ui_story then
					local var_226_8 = Mathf.Lerp(0, 0.5, var_226_7)

					arg_223_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1039ui_story.fillRatio = var_226_8
				end
			end

			if arg_223_1.time_ >= var_226_5 + var_226_6 and arg_223_1.time_ < var_226_5 + var_226_6 + arg_226_0 and arg_223_1.var_.characterEffect1039ui_story then
				local var_226_9 = 0.5

				arg_223_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1039ui_story.fillRatio = var_226_9
			end

			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action2_1")
			end

			local var_226_11 = 0

			if var_226_11 < arg_223_1.time_ and arg_223_1.time_ <= var_226_11 + arg_226_0 then
				arg_223_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_226_12 = 0
			local var_226_13 = 1.125

			if var_226_12 < arg_223_1.time_ and arg_223_1.time_ <= var_226_12 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_14 = arg_223_1:FormatText(StoryNameCfg[8].name)

				arg_223_1.leftNameTxt_.text = var_226_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_15 = arg_223_1:GetWordFromCfg(116011053)
				local var_226_16 = arg_223_1:FormatText(var_226_15.content)

				arg_223_1.text_.text = var_226_16

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_17 = 45
				local var_226_18 = utf8.len(var_226_16)
				local var_226_19 = var_226_17 <= 0 and var_226_13 or var_226_13 * (var_226_18 / var_226_17)

				if var_226_19 > 0 and var_226_13 < var_226_19 then
					arg_223_1.talkMaxDuration = var_226_19

					if var_226_19 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_19 + var_226_12
					end
				end

				arg_223_1.text_.text = var_226_16
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011053", "story_v_out_116011.awb") ~= 0 then
					local var_226_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011053", "story_v_out_116011.awb") / 1000

					if var_226_20 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_20 + var_226_12
					end

					if var_226_15.prefab_name ~= "" and arg_223_1.actors_[var_226_15.prefab_name] ~= nil then
						local var_226_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_15.prefab_name].transform, "story_v_out_116011", "116011053", "story_v_out_116011.awb")

						arg_223_1:RecordAudio("116011053", var_226_21)
						arg_223_1:RecordAudio("116011053", var_226_21)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_116011", "116011053", "story_v_out_116011.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_116011", "116011053", "story_v_out_116011.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_22 = math.max(var_226_13, arg_223_1.talkMaxDuration)

			if var_226_12 <= arg_223_1.time_ and arg_223_1.time_ < var_226_12 + var_226_22 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_12) / var_226_22

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_12 + var_226_22 and arg_223_1.time_ < var_226_12 + var_226_22 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play116011054 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 116011054
		arg_227_1.duration_ = 5.866

		local var_227_0 = {
			zh = 2.466,
			ja = 5.866
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
				arg_227_0:Play116011055(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1039ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1039ui_story == nil then
				arg_227_1.var_.characterEffect1039ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1039ui_story then
					arg_227_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1039ui_story then
				arg_227_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_230_4 = arg_227_1.actors_["1048ui_story"]
			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 and arg_227_1.var_.characterEffect1048ui_story == nil then
				arg_227_1.var_.characterEffect1048ui_story = var_230_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_6 = 0.2

			if var_230_5 <= arg_227_1.time_ and arg_227_1.time_ < var_230_5 + var_230_6 then
				local var_230_7 = (arg_227_1.time_ - var_230_5) / var_230_6

				if arg_227_1.var_.characterEffect1048ui_story then
					local var_230_8 = Mathf.Lerp(0, 0.5, var_230_7)

					arg_227_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1048ui_story.fillRatio = var_230_8
				end
			end

			if arg_227_1.time_ >= var_230_5 + var_230_6 and arg_227_1.time_ < var_230_5 + var_230_6 + arg_230_0 and arg_227_1.var_.characterEffect1048ui_story then
				local var_230_9 = 0.5

				arg_227_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1048ui_story.fillRatio = var_230_9
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action454")
			end

			local var_230_11 = 0

			if var_230_11 < arg_227_1.time_ and arg_227_1.time_ <= var_230_11 + arg_230_0 then
				arg_227_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_230_12 = 0
			local var_230_13 = 0.225

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_14 = arg_227_1:FormatText(StoryNameCfg[9].name)

				arg_227_1.leftNameTxt_.text = var_230_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(116011054)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 9
				local var_230_18 = utf8.len(var_230_16)
				local var_230_19 = var_230_17 <= 0 and var_230_13 or var_230_13 * (var_230_18 / var_230_17)

				if var_230_19 > 0 and var_230_13 < var_230_19 then
					arg_227_1.talkMaxDuration = var_230_19

					if var_230_19 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_12
					end
				end

				arg_227_1.text_.text = var_230_16
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011054", "story_v_out_116011.awb") ~= 0 then
					local var_230_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011054", "story_v_out_116011.awb") / 1000

					if var_230_20 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_12
					end

					if var_230_15.prefab_name ~= "" and arg_227_1.actors_[var_230_15.prefab_name] ~= nil then
						local var_230_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_15.prefab_name].transform, "story_v_out_116011", "116011054", "story_v_out_116011.awb")

						arg_227_1:RecordAudio("116011054", var_230_21)
						arg_227_1:RecordAudio("116011054", var_230_21)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_116011", "116011054", "story_v_out_116011.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_116011", "116011054", "story_v_out_116011.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_22 = math.max(var_230_13, arg_227_1.talkMaxDuration)

			if var_230_12 <= arg_227_1.time_ and arg_227_1.time_ < var_230_12 + var_230_22 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_12) / var_230_22

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_12 + var_230_22 and arg_227_1.time_ < var_230_12 + var_230_22 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play116011055 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 116011055
		arg_231_1.duration_ = 12.766

		local var_231_0 = {
			zh = 5.4,
			ja = 12.766
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
				arg_231_0:Play116011056(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1048ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1048ui_story == nil then
				arg_231_1.var_.characterEffect1048ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1048ui_story then
					arg_231_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1048ui_story then
				arg_231_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_234_4 = arg_231_1.actors_["1039ui_story"]
			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 and arg_231_1.var_.characterEffect1039ui_story == nil then
				arg_231_1.var_.characterEffect1039ui_story = var_234_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_6 = 0.2

			if var_234_5 <= arg_231_1.time_ and arg_231_1.time_ < var_234_5 + var_234_6 then
				local var_234_7 = (arg_231_1.time_ - var_234_5) / var_234_6

				if arg_231_1.var_.characterEffect1039ui_story then
					local var_234_8 = Mathf.Lerp(0, 0.5, var_234_7)

					arg_231_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1039ui_story.fillRatio = var_234_8
				end
			end

			if arg_231_1.time_ >= var_234_5 + var_234_6 and arg_231_1.time_ < var_234_5 + var_234_6 + arg_234_0 and arg_231_1.var_.characterEffect1039ui_story then
				local var_234_9 = 0.5

				arg_231_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1039ui_story.fillRatio = var_234_9
			end

			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action429")
			end

			local var_234_11 = 0

			if var_234_11 < arg_231_1.time_ and arg_231_1.time_ <= var_234_11 + arg_234_0 then
				arg_231_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_234_12 = 0
			local var_234_13 = 0.575

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[8].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(116011055)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 23
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_13 or var_234_13 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_13 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19

					if var_234_19 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_12
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011055", "story_v_out_116011.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011055", "story_v_out_116011.awb") / 1000

					if var_234_20 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_12
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_out_116011", "116011055", "story_v_out_116011.awb")

						arg_231_1:RecordAudio("116011055", var_234_21)
						arg_231_1:RecordAudio("116011055", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_116011", "116011055", "story_v_out_116011.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_116011", "116011055", "story_v_out_116011.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_22 = math.max(var_234_13, arg_231_1.talkMaxDuration)

			if var_234_12 <= arg_231_1.time_ and arg_231_1.time_ < var_234_12 + var_234_22 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_12) / var_234_22

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_12 + var_234_22 and arg_231_1.time_ < var_234_12 + var_234_22 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play116011056 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 116011056
		arg_235_1.duration_ = 5.2

		local var_235_0 = {
			zh = 3.933,
			ja = 5.2
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
				arg_235_0:Play116011057(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1048ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1048ui_story == nil then
				arg_235_1.var_.characterEffect1048ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.2

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1048ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1048ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1048ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1048ui_story.fillRatio = var_238_5
			end

			local var_238_6 = arg_235_1.actors_["1039ui_story"]
			local var_238_7 = 0

			if var_238_7 < arg_235_1.time_ and arg_235_1.time_ <= var_238_7 + arg_238_0 and arg_235_1.var_.characterEffect1039ui_story == nil then
				arg_235_1.var_.characterEffect1039ui_story = var_238_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_8 = 0.2

			if var_238_7 <= arg_235_1.time_ and arg_235_1.time_ < var_238_7 + var_238_8 then
				local var_238_9 = (arg_235_1.time_ - var_238_7) / var_238_8

				if arg_235_1.var_.characterEffect1039ui_story then
					arg_235_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_7 + var_238_8 and arg_235_1.time_ < var_238_7 + var_238_8 + arg_238_0 and arg_235_1.var_.characterEffect1039ui_story then
				arg_235_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 then
				arg_235_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_238_11 = 0

			if var_238_11 < arg_235_1.time_ and arg_235_1.time_ <= var_238_11 + arg_238_0 then
				arg_235_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action446")
			end

			local var_238_12 = 0
			local var_238_13 = 0.45

			if var_238_12 < arg_235_1.time_ and arg_235_1.time_ <= var_238_12 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_14 = arg_235_1:FormatText(StoryNameCfg[9].name)

				arg_235_1.leftNameTxt_.text = var_238_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_15 = arg_235_1:GetWordFromCfg(116011056)
				local var_238_16 = arg_235_1:FormatText(var_238_15.content)

				arg_235_1.text_.text = var_238_16

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_17 = 18
				local var_238_18 = utf8.len(var_238_16)
				local var_238_19 = var_238_17 <= 0 and var_238_13 or var_238_13 * (var_238_18 / var_238_17)

				if var_238_19 > 0 and var_238_13 < var_238_19 then
					arg_235_1.talkMaxDuration = var_238_19

					if var_238_19 + var_238_12 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_19 + var_238_12
					end
				end

				arg_235_1.text_.text = var_238_16
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011056", "story_v_out_116011.awb") ~= 0 then
					local var_238_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011056", "story_v_out_116011.awb") / 1000

					if var_238_20 + var_238_12 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_20 + var_238_12
					end

					if var_238_15.prefab_name ~= "" and arg_235_1.actors_[var_238_15.prefab_name] ~= nil then
						local var_238_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_15.prefab_name].transform, "story_v_out_116011", "116011056", "story_v_out_116011.awb")

						arg_235_1:RecordAudio("116011056", var_238_21)
						arg_235_1:RecordAudio("116011056", var_238_21)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_116011", "116011056", "story_v_out_116011.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_116011", "116011056", "story_v_out_116011.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_22 = math.max(var_238_13, arg_235_1.talkMaxDuration)

			if var_238_12 <= arg_235_1.time_ and arg_235_1.time_ < var_238_12 + var_238_22 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_12) / var_238_22

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_12 + var_238_22 and arg_235_1.time_ < var_238_12 + var_238_22 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play116011057 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 116011057
		arg_239_1.duration_ = 8.999999999999

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play116011058(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 2

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				local var_242_1 = manager.ui.mainCamera.transform.localPosition
				local var_242_2 = Vector3.New(0, 0, 10) + Vector3.New(var_242_1.x, var_242_1.y, 0)
				local var_242_3 = arg_239_1.bgs_.I05f

				var_242_3.transform.localPosition = var_242_2
				var_242_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_242_4 = var_242_3:GetComponent("SpriteRenderer")

				if var_242_4 and var_242_4.sprite then
					local var_242_5 = (var_242_3.transform.localPosition - var_242_1).z
					local var_242_6 = manager.ui.mainCameraCom_
					local var_242_7 = 2 * var_242_5 * Mathf.Tan(var_242_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_242_8 = var_242_7 * var_242_6.aspect
					local var_242_9 = var_242_4.sprite.bounds.size.x
					local var_242_10 = var_242_4.sprite.bounds.size.y
					local var_242_11 = var_242_8 / var_242_9
					local var_242_12 = var_242_7 / var_242_10
					local var_242_13 = var_242_12 < var_242_11 and var_242_11 or var_242_12

					var_242_3.transform.localScale = Vector3.New(var_242_13, var_242_13, 0)
				end

				for iter_242_0, iter_242_1 in pairs(arg_239_1.bgs_) do
					if iter_242_0 ~= "I05f" then
						iter_242_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1.mask_.enabled = true
				arg_239_1.mask_.raycastTarget = true

				arg_239_1:SetGaussion(false)
			end

			local var_242_15 = 2

			if var_242_14 <= arg_239_1.time_ and arg_239_1.time_ < var_242_14 + var_242_15 then
				local var_242_16 = (arg_239_1.time_ - var_242_14) / var_242_15
				local var_242_17 = Color.New(0, 0, 0)

				var_242_17.a = Mathf.Lerp(0, 1, var_242_16)
				arg_239_1.mask_.color = var_242_17
			end

			if arg_239_1.time_ >= var_242_14 + var_242_15 and arg_239_1.time_ < var_242_14 + var_242_15 + arg_242_0 then
				local var_242_18 = Color.New(0, 0, 0)

				var_242_18.a = 1
				arg_239_1.mask_.color = var_242_18
			end

			local var_242_19 = 2

			if var_242_19 < arg_239_1.time_ and arg_239_1.time_ <= var_242_19 + arg_242_0 then
				arg_239_1.mask_.enabled = true
				arg_239_1.mask_.raycastTarget = true

				arg_239_1:SetGaussion(false)
			end

			local var_242_20 = 2

			if var_242_19 <= arg_239_1.time_ and arg_239_1.time_ < var_242_19 + var_242_20 then
				local var_242_21 = (arg_239_1.time_ - var_242_19) / var_242_20
				local var_242_22 = Color.New(0, 0, 0)

				var_242_22.a = Mathf.Lerp(1, 0, var_242_21)
				arg_239_1.mask_.color = var_242_22
			end

			if arg_239_1.time_ >= var_242_19 + var_242_20 and arg_239_1.time_ < var_242_19 + var_242_20 + arg_242_0 then
				local var_242_23 = Color.New(0, 0, 0)
				local var_242_24 = 0

				arg_239_1.mask_.enabled = false
				var_242_23.a = var_242_24
				arg_239_1.mask_.color = var_242_23
			end

			local var_242_25 = arg_239_1.actors_["1048ui_story"].transform
			local var_242_26 = 1.966

			if var_242_26 < arg_239_1.time_ and arg_239_1.time_ <= var_242_26 + arg_242_0 then
				arg_239_1.var_.moveOldPos1048ui_story = var_242_25.localPosition
			end

			local var_242_27 = 0.001

			if var_242_26 <= arg_239_1.time_ and arg_239_1.time_ < var_242_26 + var_242_27 then
				local var_242_28 = (arg_239_1.time_ - var_242_26) / var_242_27
				local var_242_29 = Vector3.New(0, 100, 0)

				var_242_25.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1048ui_story, var_242_29, var_242_28)

				local var_242_30 = manager.ui.mainCamera.transform.position - var_242_25.position

				var_242_25.forward = Vector3.New(var_242_30.x, var_242_30.y, var_242_30.z)

				local var_242_31 = var_242_25.localEulerAngles

				var_242_31.z = 0
				var_242_31.x = 0
				var_242_25.localEulerAngles = var_242_31
			end

			if arg_239_1.time_ >= var_242_26 + var_242_27 and arg_239_1.time_ < var_242_26 + var_242_27 + arg_242_0 then
				var_242_25.localPosition = Vector3.New(0, 100, 0)

				local var_242_32 = manager.ui.mainCamera.transform.position - var_242_25.position

				var_242_25.forward = Vector3.New(var_242_32.x, var_242_32.y, var_242_32.z)

				local var_242_33 = var_242_25.localEulerAngles

				var_242_33.z = 0
				var_242_33.x = 0
				var_242_25.localEulerAngles = var_242_33
			end

			local var_242_34 = arg_239_1.actors_["1039ui_story"].transform
			local var_242_35 = 1.966

			if var_242_35 < arg_239_1.time_ and arg_239_1.time_ <= var_242_35 + arg_242_0 then
				arg_239_1.var_.moveOldPos1039ui_story = var_242_34.localPosition
			end

			local var_242_36 = 0.001

			if var_242_35 <= arg_239_1.time_ and arg_239_1.time_ < var_242_35 + var_242_36 then
				local var_242_37 = (arg_239_1.time_ - var_242_35) / var_242_36
				local var_242_38 = Vector3.New(0, 100, 0)

				var_242_34.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1039ui_story, var_242_38, var_242_37)

				local var_242_39 = manager.ui.mainCamera.transform.position - var_242_34.position

				var_242_34.forward = Vector3.New(var_242_39.x, var_242_39.y, var_242_39.z)

				local var_242_40 = var_242_34.localEulerAngles

				var_242_40.z = 0
				var_242_40.x = 0
				var_242_34.localEulerAngles = var_242_40
			end

			if arg_239_1.time_ >= var_242_35 + var_242_36 and arg_239_1.time_ < var_242_35 + var_242_36 + arg_242_0 then
				var_242_34.localPosition = Vector3.New(0, 100, 0)

				local var_242_41 = manager.ui.mainCamera.transform.position - var_242_34.position

				var_242_34.forward = Vector3.New(var_242_41.x, var_242_41.y, var_242_41.z)

				local var_242_42 = var_242_34.localEulerAngles

				var_242_42.z = 0
				var_242_42.x = 0
				var_242_34.localEulerAngles = var_242_42
			end

			local var_242_43 = arg_239_1.bgs_.I05f
			local var_242_44 = 2

			if var_242_44 < arg_239_1.time_ and arg_239_1.time_ <= var_242_44 + arg_242_0 then
				local var_242_45 = var_242_43:GetComponent("SpriteRenderer")

				if var_242_45 then
					var_242_45.material = arg_239_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_242_46 = var_242_45.material
					local var_242_47 = var_242_46:GetColor("_Color")

					arg_239_1.var_.alphaOldValueI05f = var_242_47.a
					arg_239_1.var_.alphaMatValueI05f = var_242_46
				end

				arg_239_1.var_.alphaOldValueI05f = 0
			end

			local var_242_48 = 0.0166666666666667

			if var_242_44 <= arg_239_1.time_ and arg_239_1.time_ < var_242_44 + var_242_48 then
				local var_242_49 = (arg_239_1.time_ - var_242_44) / var_242_48
				local var_242_50 = Mathf.Lerp(arg_239_1.var_.alphaOldValueI05f, 1, var_242_49)

				if arg_239_1.var_.alphaMatValueI05f then
					local var_242_51 = arg_239_1.var_.alphaMatValueI05f
					local var_242_52 = var_242_51:GetColor("_Color")

					var_242_52.a = var_242_50

					var_242_51:SetColor("_Color", var_242_52)
				end
			end

			if arg_239_1.time_ >= var_242_44 + var_242_48 and arg_239_1.time_ < var_242_44 + var_242_48 + arg_242_0 and arg_239_1.var_.alphaMatValueI05f then
				local var_242_53 = arg_239_1.var_.alphaMatValueI05f
				local var_242_54 = var_242_53:GetColor("_Color")

				var_242_54.a = 1

				var_242_53:SetColor("_Color", var_242_54)
			end

			if arg_239_1.frameCnt_ <= 1 then
				arg_239_1.dialog_:SetActive(false)
			end

			local var_242_55 = 3.999999999999
			local var_242_56 = 0.55

			if var_242_55 < arg_239_1.time_ and arg_239_1.time_ <= var_242_55 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				arg_239_1.dialog_:SetActive(true)

				local var_242_57 = LeanTween.value(arg_239_1.dialog_, 0, 1, 0.3)

				var_242_57:setOnUpdate(LuaHelper.FloatAction(function(arg_243_0)
					arg_239_1.dialogCg_.alpha = arg_243_0
				end))
				var_242_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_239_1.dialog_)
					var_242_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_239_1.duration_ = arg_239_1.duration_ + 0.3

				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_58 = arg_239_1:GetWordFromCfg(116011057)
				local var_242_59 = arg_239_1:FormatText(var_242_58.content)

				arg_239_1.text_.text = var_242_59

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_60 = 22
				local var_242_61 = utf8.len(var_242_59)
				local var_242_62 = var_242_60 <= 0 and var_242_56 or var_242_56 * (var_242_61 / var_242_60)

				if var_242_62 > 0 and var_242_56 < var_242_62 then
					arg_239_1.talkMaxDuration = var_242_62
					var_242_55 = var_242_55 + 0.3

					if var_242_62 + var_242_55 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_62 + var_242_55
					end
				end

				arg_239_1.text_.text = var_242_59
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_63 = var_242_55 + 0.3
			local var_242_64 = math.max(var_242_56, arg_239_1.talkMaxDuration)

			if var_242_63 <= arg_239_1.time_ and arg_239_1.time_ < var_242_63 + var_242_64 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_63) / var_242_64

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_63 + var_242_64 and arg_239_1.time_ < var_242_63 + var_242_64 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play116011058 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 116011058
		arg_245_1.duration_ = 4.633

		local var_245_0 = {
			zh = 4.466,
			ja = 4.633
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play116011059(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1048ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1048ui_story == nil then
				arg_245_1.var_.characterEffect1048ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.0166666666666667

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1048ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1048ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1048ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1048ui_story.fillRatio = var_248_5
			end

			local var_248_6 = arg_245_1.actors_["1039ui_story"]
			local var_248_7 = 0

			if var_248_7 < arg_245_1.time_ and arg_245_1.time_ <= var_248_7 + arg_248_0 and arg_245_1.var_.characterEffect1039ui_story == nil then
				arg_245_1.var_.characterEffect1039ui_story = var_248_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_8 = 0.0166666666666667

			if var_248_7 <= arg_245_1.time_ and arg_245_1.time_ < var_248_7 + var_248_8 then
				local var_248_9 = (arg_245_1.time_ - var_248_7) / var_248_8

				if arg_245_1.var_.characterEffect1039ui_story then
					arg_245_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_7 + var_248_8 and arg_245_1.time_ < var_248_7 + var_248_8 + arg_248_0 and arg_245_1.var_.characterEffect1039ui_story then
				arg_245_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_248_10 = arg_245_1.actors_["1039ui_story"].transform
			local var_248_11 = 0

			if var_248_11 < arg_245_1.time_ and arg_245_1.time_ <= var_248_11 + arg_248_0 then
				arg_245_1.var_.moveOldPos1039ui_story = var_248_10.localPosition
			end

			local var_248_12 = 0.001

			if var_248_11 <= arg_245_1.time_ and arg_245_1.time_ < var_248_11 + var_248_12 then
				local var_248_13 = (arg_245_1.time_ - var_248_11) / var_248_12
				local var_248_14 = Vector3.New(-0.7, -1.01, -5.9)

				var_248_10.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1039ui_story, var_248_14, var_248_13)

				local var_248_15 = manager.ui.mainCamera.transform.position - var_248_10.position

				var_248_10.forward = Vector3.New(var_248_15.x, var_248_15.y, var_248_15.z)

				local var_248_16 = var_248_10.localEulerAngles

				var_248_16.z = 0
				var_248_16.x = 0
				var_248_10.localEulerAngles = var_248_16
			end

			if arg_245_1.time_ >= var_248_11 + var_248_12 and arg_245_1.time_ < var_248_11 + var_248_12 + arg_248_0 then
				var_248_10.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_248_17 = manager.ui.mainCamera.transform.position - var_248_10.position

				var_248_10.forward = Vector3.New(var_248_17.x, var_248_17.y, var_248_17.z)

				local var_248_18 = var_248_10.localEulerAngles

				var_248_18.z = 0
				var_248_18.x = 0
				var_248_10.localEulerAngles = var_248_18
			end

			local var_248_19 = arg_245_1.actors_["1048ui_story"].transform
			local var_248_20 = 0

			if var_248_20 < arg_245_1.time_ and arg_245_1.time_ <= var_248_20 + arg_248_0 then
				arg_245_1.var_.moveOldPos1048ui_story = var_248_19.localPosition
			end

			local var_248_21 = 0.001

			if var_248_20 <= arg_245_1.time_ and arg_245_1.time_ < var_248_20 + var_248_21 then
				local var_248_22 = (arg_245_1.time_ - var_248_20) / var_248_21
				local var_248_23 = Vector3.New(0.7, -0.8, -6.2)

				var_248_19.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1048ui_story, var_248_23, var_248_22)

				local var_248_24 = manager.ui.mainCamera.transform.position - var_248_19.position

				var_248_19.forward = Vector3.New(var_248_24.x, var_248_24.y, var_248_24.z)

				local var_248_25 = var_248_19.localEulerAngles

				var_248_25.z = 0
				var_248_25.x = 0
				var_248_19.localEulerAngles = var_248_25
			end

			if arg_245_1.time_ >= var_248_20 + var_248_21 and arg_245_1.time_ < var_248_20 + var_248_21 + arg_248_0 then
				var_248_19.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_248_26 = manager.ui.mainCamera.transform.position - var_248_19.position

				var_248_19.forward = Vector3.New(var_248_26.x, var_248_26.y, var_248_26.z)

				local var_248_27 = var_248_19.localEulerAngles

				var_248_27.z = 0
				var_248_27.x = 0
				var_248_19.localEulerAngles = var_248_27
			end

			local var_248_28 = 0

			if var_248_28 < arg_245_1.time_ and arg_245_1.time_ <= var_248_28 + arg_248_0 then
				arg_245_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action6_1")
			end

			local var_248_29 = 0

			if var_248_29 < arg_245_1.time_ and arg_245_1.time_ <= var_248_29 + arg_248_0 then
				arg_245_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_248_30 = 0

			if var_248_30 < arg_245_1.time_ and arg_245_1.time_ <= var_248_30 + arg_248_0 then
				arg_245_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action1_1")
			end

			local var_248_31 = 0

			if var_248_31 < arg_245_1.time_ and arg_245_1.time_ <= var_248_31 + arg_248_0 then
				arg_245_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_248_32 = 0
			local var_248_33 = 0.6

			if var_248_32 < arg_245_1.time_ and arg_245_1.time_ <= var_248_32 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_34 = arg_245_1:FormatText(StoryNameCfg[9].name)

				arg_245_1.leftNameTxt_.text = var_248_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_35 = arg_245_1:GetWordFromCfg(116011058)
				local var_248_36 = arg_245_1:FormatText(var_248_35.content)

				arg_245_1.text_.text = var_248_36

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_37 = 24
				local var_248_38 = utf8.len(var_248_36)
				local var_248_39 = var_248_37 <= 0 and var_248_33 or var_248_33 * (var_248_38 / var_248_37)

				if var_248_39 > 0 and var_248_33 < var_248_39 then
					arg_245_1.talkMaxDuration = var_248_39

					if var_248_39 + var_248_32 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_39 + var_248_32
					end
				end

				arg_245_1.text_.text = var_248_36
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011058", "story_v_out_116011.awb") ~= 0 then
					local var_248_40 = manager.audio:GetVoiceLength("story_v_out_116011", "116011058", "story_v_out_116011.awb") / 1000

					if var_248_40 + var_248_32 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_40 + var_248_32
					end

					if var_248_35.prefab_name ~= "" and arg_245_1.actors_[var_248_35.prefab_name] ~= nil then
						local var_248_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_35.prefab_name].transform, "story_v_out_116011", "116011058", "story_v_out_116011.awb")

						arg_245_1:RecordAudio("116011058", var_248_41)
						arg_245_1:RecordAudio("116011058", var_248_41)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_116011", "116011058", "story_v_out_116011.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_116011", "116011058", "story_v_out_116011.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_42 = math.max(var_248_33, arg_245_1.talkMaxDuration)

			if var_248_32 <= arg_245_1.time_ and arg_245_1.time_ < var_248_32 + var_248_42 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_32) / var_248_42

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_32 + var_248_42 and arg_245_1.time_ < var_248_32 + var_248_42 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play116011059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 116011059
		arg_249_1.duration_ = 7.466

		local var_249_0 = {
			zh = 7.166,
			ja = 7.466
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play116011060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1039ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1039ui_story == nil then
				arg_249_1.var_.characterEffect1039ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1039ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1039ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1039ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1039ui_story.fillRatio = var_252_5
			end

			local var_252_6 = arg_249_1.actors_["1048ui_story"]
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 and arg_249_1.var_.characterEffect1048ui_story == nil then
				arg_249_1.var_.characterEffect1048ui_story = var_252_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_8 = 0.2

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_8 then
				local var_252_9 = (arg_249_1.time_ - var_252_7) / var_252_8

				if arg_249_1.var_.characterEffect1048ui_story then
					arg_249_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_7 + var_252_8 and arg_249_1.time_ < var_252_7 + var_252_8 + arg_252_0 and arg_249_1.var_.characterEffect1048ui_story then
				arg_249_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 then
				arg_249_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action9_1")
			end

			local var_252_11 = 0

			if var_252_11 < arg_249_1.time_ and arg_249_1.time_ <= var_252_11 + arg_252_0 then
				arg_249_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_252_12 = 0
			local var_252_13 = 0.775

			if var_252_12 < arg_249_1.time_ and arg_249_1.time_ <= var_252_12 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_14 = arg_249_1:FormatText(StoryNameCfg[8].name)

				arg_249_1.leftNameTxt_.text = var_252_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_15 = arg_249_1:GetWordFromCfg(116011059)
				local var_252_16 = arg_249_1:FormatText(var_252_15.content)

				arg_249_1.text_.text = var_252_16

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_17 = 31
				local var_252_18 = utf8.len(var_252_16)
				local var_252_19 = var_252_17 <= 0 and var_252_13 or var_252_13 * (var_252_18 / var_252_17)

				if var_252_19 > 0 and var_252_13 < var_252_19 then
					arg_249_1.talkMaxDuration = var_252_19

					if var_252_19 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_19 + var_252_12
					end
				end

				arg_249_1.text_.text = var_252_16
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011059", "story_v_out_116011.awb") ~= 0 then
					local var_252_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011059", "story_v_out_116011.awb") / 1000

					if var_252_20 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_20 + var_252_12
					end

					if var_252_15.prefab_name ~= "" and arg_249_1.actors_[var_252_15.prefab_name] ~= nil then
						local var_252_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_15.prefab_name].transform, "story_v_out_116011", "116011059", "story_v_out_116011.awb")

						arg_249_1:RecordAudio("116011059", var_252_21)
						arg_249_1:RecordAudio("116011059", var_252_21)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_116011", "116011059", "story_v_out_116011.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_116011", "116011059", "story_v_out_116011.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_22 = math.max(var_252_13, arg_249_1.talkMaxDuration)

			if var_252_12 <= arg_249_1.time_ and arg_249_1.time_ < var_252_12 + var_252_22 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_12) / var_252_22

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_12 + var_252_22 and arg_249_1.time_ < var_252_12 + var_252_22 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play116011060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 116011060
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play116011061(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1039ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1039ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(0, 100, 0)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1039ui_story, var_256_4, var_256_3)

				local var_256_5 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_5.x, var_256_5.y, var_256_5.z)

				local var_256_6 = var_256_0.localEulerAngles

				var_256_6.z = 0
				var_256_6.x = 0
				var_256_0.localEulerAngles = var_256_6
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(0, 100, 0)

				local var_256_7 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_7.x, var_256_7.y, var_256_7.z)

				local var_256_8 = var_256_0.localEulerAngles

				var_256_8.z = 0
				var_256_8.x = 0
				var_256_0.localEulerAngles = var_256_8
			end

			local var_256_9 = arg_253_1.actors_["1048ui_story"].transform
			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 then
				arg_253_1.var_.moveOldPos1048ui_story = var_256_9.localPosition
			end

			local var_256_11 = 0.001

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 then
				local var_256_12 = (arg_253_1.time_ - var_256_10) / var_256_11
				local var_256_13 = Vector3.New(0, 100, 0)

				var_256_9.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1048ui_story, var_256_13, var_256_12)

				local var_256_14 = manager.ui.mainCamera.transform.position - var_256_9.position

				var_256_9.forward = Vector3.New(var_256_14.x, var_256_14.y, var_256_14.z)

				local var_256_15 = var_256_9.localEulerAngles

				var_256_15.z = 0
				var_256_15.x = 0
				var_256_9.localEulerAngles = var_256_15
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 then
				var_256_9.localPosition = Vector3.New(0, 100, 0)

				local var_256_16 = manager.ui.mainCamera.transform.position - var_256_9.position

				var_256_9.forward = Vector3.New(var_256_16.x, var_256_16.y, var_256_16.z)

				local var_256_17 = var_256_9.localEulerAngles

				var_256_17.z = 0
				var_256_17.x = 0
				var_256_9.localEulerAngles = var_256_17
			end

			local var_256_18 = 0
			local var_256_19 = 0.325

			if var_256_18 < arg_253_1.time_ and arg_253_1.time_ <= var_256_18 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_20 = arg_253_1:GetWordFromCfg(116011060)
				local var_256_21 = arg_253_1:FormatText(var_256_20.content)

				arg_253_1.text_.text = var_256_21

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_22 = 13
				local var_256_23 = utf8.len(var_256_21)
				local var_256_24 = var_256_22 <= 0 and var_256_19 or var_256_19 * (var_256_23 / var_256_22)

				if var_256_24 > 0 and var_256_19 < var_256_24 then
					arg_253_1.talkMaxDuration = var_256_24

					if var_256_24 + var_256_18 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_24 + var_256_18
					end
				end

				arg_253_1.text_.text = var_256_21
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_25 = math.max(var_256_19, arg_253_1.talkMaxDuration)

			if var_256_18 <= arg_253_1.time_ and arg_253_1.time_ < var_256_18 + var_256_25 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_18) / var_256_25

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_18 + var_256_25 and arg_253_1.time_ < var_256_18 + var_256_25 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play116011061 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 116011061
		arg_257_1.duration_ = 6.4

		local var_257_0 = {
			zh = 4.866,
			ja = 6.4
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play116011062(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1039ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1039ui_story == nil then
				arg_257_1.var_.characterEffect1039ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.2

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1039ui_story then
					arg_257_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1039ui_story then
				arg_257_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_260_4 = 0

			if var_260_4 < arg_257_1.time_ and arg_257_1.time_ <= var_260_4 + arg_260_0 then
				arg_257_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_260_5 = arg_257_1.actors_["1039ui_story"].transform
			local var_260_6 = 0

			if var_260_6 < arg_257_1.time_ and arg_257_1.time_ <= var_260_6 + arg_260_0 then
				arg_257_1.var_.moveOldPos1039ui_story = var_260_5.localPosition
			end

			local var_260_7 = 0.001

			if var_260_6 <= arg_257_1.time_ and arg_257_1.time_ < var_260_6 + var_260_7 then
				local var_260_8 = (arg_257_1.time_ - var_260_6) / var_260_7
				local var_260_9 = Vector3.New(0, -1.01, -5.9)

				var_260_5.localPosition = Vector3.Lerp(arg_257_1.var_.moveOldPos1039ui_story, var_260_9, var_260_8)

				local var_260_10 = manager.ui.mainCamera.transform.position - var_260_5.position

				var_260_5.forward = Vector3.New(var_260_10.x, var_260_10.y, var_260_10.z)

				local var_260_11 = var_260_5.localEulerAngles

				var_260_11.z = 0
				var_260_11.x = 0
				var_260_5.localEulerAngles = var_260_11
			end

			if arg_257_1.time_ >= var_260_6 + var_260_7 and arg_257_1.time_ < var_260_6 + var_260_7 + arg_260_0 then
				var_260_5.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_260_12 = manager.ui.mainCamera.transform.position - var_260_5.position

				var_260_5.forward = Vector3.New(var_260_12.x, var_260_12.y, var_260_12.z)

				local var_260_13 = var_260_5.localEulerAngles

				var_260_13.z = 0
				var_260_13.x = 0
				var_260_5.localEulerAngles = var_260_13
			end

			local var_260_14 = 0

			if var_260_14 < arg_257_1.time_ and arg_257_1.time_ <= var_260_14 + arg_260_0 then
				arg_257_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_260_15 = 0
			local var_260_16 = 0.55

			if var_260_15 < arg_257_1.time_ and arg_257_1.time_ <= var_260_15 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_17 = arg_257_1:FormatText(StoryNameCfg[9].name)

				arg_257_1.leftNameTxt_.text = var_260_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_18 = arg_257_1:GetWordFromCfg(116011061)
				local var_260_19 = arg_257_1:FormatText(var_260_18.content)

				arg_257_1.text_.text = var_260_19

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_20 = 22
				local var_260_21 = utf8.len(var_260_19)
				local var_260_22 = var_260_20 <= 0 and var_260_16 or var_260_16 * (var_260_21 / var_260_20)

				if var_260_22 > 0 and var_260_16 < var_260_22 then
					arg_257_1.talkMaxDuration = var_260_22

					if var_260_22 + var_260_15 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_22 + var_260_15
					end
				end

				arg_257_1.text_.text = var_260_19
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011061", "story_v_out_116011.awb") ~= 0 then
					local var_260_23 = manager.audio:GetVoiceLength("story_v_out_116011", "116011061", "story_v_out_116011.awb") / 1000

					if var_260_23 + var_260_15 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_23 + var_260_15
					end

					if var_260_18.prefab_name ~= "" and arg_257_1.actors_[var_260_18.prefab_name] ~= nil then
						local var_260_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_18.prefab_name].transform, "story_v_out_116011", "116011061", "story_v_out_116011.awb")

						arg_257_1:RecordAudio("116011061", var_260_24)
						arg_257_1:RecordAudio("116011061", var_260_24)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_116011", "116011061", "story_v_out_116011.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_116011", "116011061", "story_v_out_116011.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_25 = math.max(var_260_16, arg_257_1.talkMaxDuration)

			if var_260_15 <= arg_257_1.time_ and arg_257_1.time_ < var_260_15 + var_260_25 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_15) / var_260_25

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_15 + var_260_25 and arg_257_1.time_ < var_260_15 + var_260_25 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play116011062 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 116011062
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play116011063(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1039ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos1039ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0, 100, 0)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1039ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, 100, 0)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = 0
			local var_264_10 = 1

			if var_264_9 < arg_261_1.time_ and arg_261_1.time_ <= var_264_9 + arg_264_0 then
				local var_264_11 = "play"
				local var_264_12 = "effect"

				arg_261_1:AudioAction(var_264_11, var_264_12, "se_story_16", "se_story_16_leaves", "")
			end

			local var_264_13 = 0
			local var_264_14 = 0.133333333333333

			if var_264_13 < arg_261_1.time_ and arg_261_1.time_ <= var_264_13 + arg_264_0 then
				local var_264_15 = "play"
				local var_264_16 = "music"

				arg_261_1:AudioAction(var_264_15, var_264_16, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_264_17 = 0.2
			local var_264_18 = 0.8

			if var_264_17 < arg_261_1.time_ and arg_261_1.time_ <= var_264_17 + arg_264_0 then
				local var_264_19 = "play"
				local var_264_20 = "music"

				arg_261_1:AudioAction(var_264_19, var_264_20, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			local var_264_21 = 0
			local var_264_22 = 0.75

			if var_264_21 < arg_261_1.time_ and arg_261_1.time_ <= var_264_21 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_23 = arg_261_1:GetWordFromCfg(116011062)
				local var_264_24 = arg_261_1:FormatText(var_264_23.content)

				arg_261_1.text_.text = var_264_24

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_25 = 30
				local var_264_26 = utf8.len(var_264_24)
				local var_264_27 = var_264_25 <= 0 and var_264_22 or var_264_22 * (var_264_26 / var_264_25)

				if var_264_27 > 0 and var_264_22 < var_264_27 then
					arg_261_1.talkMaxDuration = var_264_27

					if var_264_27 + var_264_21 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_27 + var_264_21
					end
				end

				arg_261_1.text_.text = var_264_24
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_28 = math.max(var_264_22, arg_261_1.talkMaxDuration)

			if var_264_21 <= arg_261_1.time_ and arg_261_1.time_ < var_264_21 + var_264_28 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_21) / var_264_28

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_21 + var_264_28 and arg_261_1.time_ < var_264_21 + var_264_28 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play116011063 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 116011063
		arg_265_1.duration_ = 2.899999999999

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play116011064(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_268_1 = arg_265_1.actors_["1039ui_story"].transform
			local var_268_2 = 0

			if var_268_2 < arg_265_1.time_ and arg_265_1.time_ <= var_268_2 + arg_268_0 then
				arg_265_1.var_.moveOldPos1039ui_story = var_268_1.localPosition
			end

			local var_268_3 = 0.001

			if var_268_2 <= arg_265_1.time_ and arg_265_1.time_ < var_268_2 + var_268_3 then
				local var_268_4 = (arg_265_1.time_ - var_268_2) / var_268_3
				local var_268_5 = Vector3.New(-0.7, -1.01, -5.9)

				var_268_1.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1039ui_story, var_268_5, var_268_4)

				local var_268_6 = manager.ui.mainCamera.transform.position - var_268_1.position

				var_268_1.forward = Vector3.New(var_268_6.x, var_268_6.y, var_268_6.z)

				local var_268_7 = var_268_1.localEulerAngles

				var_268_7.z = 0
				var_268_7.x = 0
				var_268_1.localEulerAngles = var_268_7
			end

			if arg_265_1.time_ >= var_268_2 + var_268_3 and arg_265_1.time_ < var_268_2 + var_268_3 + arg_268_0 then
				var_268_1.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_268_8 = manager.ui.mainCamera.transform.position - var_268_1.position

				var_268_1.forward = Vector3.New(var_268_8.x, var_268_8.y, var_268_8.z)

				local var_268_9 = var_268_1.localEulerAngles

				var_268_9.z = 0
				var_268_9.x = 0
				var_268_1.localEulerAngles = var_268_9
			end

			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 then
				arg_265_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action2_1")
			end

			local var_268_11 = arg_265_1.actors_["1039ui_story"]
			local var_268_12 = 0

			if var_268_12 < arg_265_1.time_ and arg_265_1.time_ <= var_268_12 + arg_268_0 and arg_265_1.var_.characterEffect1039ui_story == nil then
				arg_265_1.var_.characterEffect1039ui_story = var_268_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_13 = 0.2

			if var_268_12 <= arg_265_1.time_ and arg_265_1.time_ < var_268_12 + var_268_13 then
				local var_268_14 = (arg_265_1.time_ - var_268_12) / var_268_13

				if arg_265_1.var_.characterEffect1039ui_story then
					arg_265_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_12 + var_268_13 and arg_265_1.time_ < var_268_12 + var_268_13 + arg_268_0 and arg_265_1.var_.characterEffect1039ui_story then
				arg_265_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_268_15 = 0
			local var_268_16 = 1

			if var_268_15 < arg_265_1.time_ and arg_265_1.time_ <= var_268_15 + arg_268_0 then
				local var_268_17 = "play"
				local var_268_18 = "music"

				arg_265_1:AudioAction(var_268_17, var_268_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_268_19 = 1.9
			local var_268_20 = 1

			if var_268_19 < arg_265_1.time_ and arg_265_1.time_ <= var_268_19 + arg_268_0 then
				local var_268_21 = "play"
				local var_268_22 = "music"

				arg_265_1:AudioAction(var_268_21, var_268_22, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			local var_268_23 = 0
			local var_268_24 = 0.1

			if var_268_23 < arg_265_1.time_ and arg_265_1.time_ <= var_268_23 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_25 = arg_265_1:FormatText(StoryNameCfg[9].name)

				arg_265_1.leftNameTxt_.text = var_268_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_26 = arg_265_1:GetWordFromCfg(116011063)
				local var_268_27 = arg_265_1:FormatText(var_268_26.content)

				arg_265_1.text_.text = var_268_27

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_28 = 4
				local var_268_29 = utf8.len(var_268_27)
				local var_268_30 = var_268_28 <= 0 and var_268_24 or var_268_24 * (var_268_29 / var_268_28)

				if var_268_30 > 0 and var_268_24 < var_268_30 then
					arg_265_1.talkMaxDuration = var_268_30

					if var_268_30 + var_268_23 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_30 + var_268_23
					end
				end

				arg_265_1.text_.text = var_268_27
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011063", "story_v_out_116011.awb") ~= 0 then
					local var_268_31 = manager.audio:GetVoiceLength("story_v_out_116011", "116011063", "story_v_out_116011.awb") / 1000

					if var_268_31 + var_268_23 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_31 + var_268_23
					end

					if var_268_26.prefab_name ~= "" and arg_265_1.actors_[var_268_26.prefab_name] ~= nil then
						local var_268_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_26.prefab_name].transform, "story_v_out_116011", "116011063", "story_v_out_116011.awb")

						arg_265_1:RecordAudio("116011063", var_268_32)
						arg_265_1:RecordAudio("116011063", var_268_32)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_116011", "116011063", "story_v_out_116011.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_116011", "116011063", "story_v_out_116011.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_33 = math.max(var_268_24, arg_265_1.talkMaxDuration)

			if var_268_23 <= arg_265_1.time_ and arg_265_1.time_ < var_268_23 + var_268_33 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_23) / var_268_33

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_23 + var_268_33 and arg_265_1.time_ < var_268_23 + var_268_33 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play116011064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 116011064
		arg_269_1.duration_ = 1.999999999999

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play116011065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1048ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1048ui_story == nil then
				arg_269_1.var_.characterEffect1048ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1048ui_story then
					arg_269_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1048ui_story then
				arg_269_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_272_4 = arg_269_1.actors_["1039ui_story"]
			local var_272_5 = 0

			if var_272_5 < arg_269_1.time_ and arg_269_1.time_ <= var_272_5 + arg_272_0 and arg_269_1.var_.characterEffect1039ui_story == nil then
				arg_269_1.var_.characterEffect1039ui_story = var_272_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_6 = 0.2

			if var_272_5 <= arg_269_1.time_ and arg_269_1.time_ < var_272_5 + var_272_6 then
				local var_272_7 = (arg_269_1.time_ - var_272_5) / var_272_6

				if arg_269_1.var_.characterEffect1039ui_story then
					local var_272_8 = Mathf.Lerp(0, 0.5, var_272_7)

					arg_269_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1039ui_story.fillRatio = var_272_8
				end
			end

			if arg_269_1.time_ >= var_272_5 + var_272_6 and arg_269_1.time_ < var_272_5 + var_272_6 + arg_272_0 and arg_269_1.var_.characterEffect1039ui_story then
				local var_272_9 = 0.5

				arg_269_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1039ui_story.fillRatio = var_272_9
			end

			local var_272_10 = 0

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 then
				arg_269_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_272_11 = arg_269_1.actors_["1048ui_story"].transform
			local var_272_12 = 0

			if var_272_12 < arg_269_1.time_ and arg_269_1.time_ <= var_272_12 + arg_272_0 then
				arg_269_1.var_.moveOldPos1048ui_story = var_272_11.localPosition
			end

			local var_272_13 = 0.001

			if var_272_12 <= arg_269_1.time_ and arg_269_1.time_ < var_272_12 + var_272_13 then
				local var_272_14 = (arg_269_1.time_ - var_272_12) / var_272_13
				local var_272_15 = Vector3.New(0.7, -0.8, -6.2)

				var_272_11.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1048ui_story, var_272_15, var_272_14)

				local var_272_16 = manager.ui.mainCamera.transform.position - var_272_11.position

				var_272_11.forward = Vector3.New(var_272_16.x, var_272_16.y, var_272_16.z)

				local var_272_17 = var_272_11.localEulerAngles

				var_272_17.z = 0
				var_272_17.x = 0
				var_272_11.localEulerAngles = var_272_17
			end

			if arg_269_1.time_ >= var_272_12 + var_272_13 and arg_269_1.time_ < var_272_12 + var_272_13 + arg_272_0 then
				var_272_11.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_272_18 = manager.ui.mainCamera.transform.position - var_272_11.position

				var_272_11.forward = Vector3.New(var_272_18.x, var_272_18.y, var_272_18.z)

				local var_272_19 = var_272_11.localEulerAngles

				var_272_19.z = 0
				var_272_19.x = 0
				var_272_11.localEulerAngles = var_272_19
			end

			local var_272_20 = 0

			if var_272_20 < arg_269_1.time_ and arg_269_1.time_ <= var_272_20 + arg_272_0 then
				arg_269_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action1_1")
			end

			local var_272_21 = 0
			local var_272_22 = 0.1

			if var_272_21 < arg_269_1.time_ and arg_269_1.time_ <= var_272_21 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_23 = arg_269_1:FormatText(StoryNameCfg[8].name)

				arg_269_1.leftNameTxt_.text = var_272_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_24 = arg_269_1:GetWordFromCfg(116011064)
				local var_272_25 = arg_269_1:FormatText(var_272_24.content)

				arg_269_1.text_.text = var_272_25

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_26 = 4
				local var_272_27 = utf8.len(var_272_25)
				local var_272_28 = var_272_26 <= 0 and var_272_22 or var_272_22 * (var_272_27 / var_272_26)

				if var_272_28 > 0 and var_272_22 < var_272_28 then
					arg_269_1.talkMaxDuration = var_272_28

					if var_272_28 + var_272_21 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_28 + var_272_21
					end
				end

				arg_269_1.text_.text = var_272_25
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011064", "story_v_out_116011.awb") ~= 0 then
					local var_272_29 = manager.audio:GetVoiceLength("story_v_out_116011", "116011064", "story_v_out_116011.awb") / 1000

					if var_272_29 + var_272_21 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_29 + var_272_21
					end

					if var_272_24.prefab_name ~= "" and arg_269_1.actors_[var_272_24.prefab_name] ~= nil then
						local var_272_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_24.prefab_name].transform, "story_v_out_116011", "116011064", "story_v_out_116011.awb")

						arg_269_1:RecordAudio("116011064", var_272_30)
						arg_269_1:RecordAudio("116011064", var_272_30)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_116011", "116011064", "story_v_out_116011.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_116011", "116011064", "story_v_out_116011.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_31 = math.max(var_272_22, arg_269_1.talkMaxDuration)

			if var_272_21 <= arg_269_1.time_ and arg_269_1.time_ < var_272_21 + var_272_31 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_21) / var_272_31

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_21 + var_272_31 and arg_269_1.time_ < var_272_21 + var_272_31 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play116011065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 116011065
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play116011066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1039ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1039ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(0, 100, 0)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1039ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(0, 100, 0)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["1048ui_story"].transform
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 then
				arg_273_1.var_.moveOldPos1048ui_story = var_276_9.localPosition
			end

			local var_276_11 = 0.001

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11
				local var_276_13 = Vector3.New(0, 100, 0)

				var_276_9.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1048ui_story, var_276_13, var_276_12)

				local var_276_14 = manager.ui.mainCamera.transform.position - var_276_9.position

				var_276_9.forward = Vector3.New(var_276_14.x, var_276_14.y, var_276_14.z)

				local var_276_15 = var_276_9.localEulerAngles

				var_276_15.z = 0
				var_276_15.x = 0
				var_276_9.localEulerAngles = var_276_15
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 then
				var_276_9.localPosition = Vector3.New(0, 100, 0)

				local var_276_16 = manager.ui.mainCamera.transform.position - var_276_9.position

				var_276_9.forward = Vector3.New(var_276_16.x, var_276_16.y, var_276_16.z)

				local var_276_17 = var_276_9.localEulerAngles

				var_276_17.z = 0
				var_276_17.x = 0
				var_276_9.localEulerAngles = var_276_17
			end

			local var_276_18 = 0
			local var_276_19 = 1.625

			if var_276_18 < arg_273_1.time_ and arg_273_1.time_ <= var_276_18 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_20 = arg_273_1:GetWordFromCfg(116011065)
				local var_276_21 = arg_273_1:FormatText(var_276_20.content)

				arg_273_1.text_.text = var_276_21

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_22 = 65
				local var_276_23 = utf8.len(var_276_21)
				local var_276_24 = var_276_22 <= 0 and var_276_19 or var_276_19 * (var_276_23 / var_276_22)

				if var_276_24 > 0 and var_276_19 < var_276_24 then
					arg_273_1.talkMaxDuration = var_276_24

					if var_276_24 + var_276_18 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_24 + var_276_18
					end
				end

				arg_273_1.text_.text = var_276_21
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_25 = math.max(var_276_19, arg_273_1.talkMaxDuration)

			if var_276_18 <= arg_273_1.time_ and arg_273_1.time_ < var_276_18 + var_276_25 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_18) / var_276_25

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_18 + var_276_25 and arg_273_1.time_ < var_276_18 + var_276_25 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play116011066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 116011066
		arg_277_1.duration_ = 5.5

		local var_277_0 = {
			zh = 4.733,
			ja = 5.5
		}
		local var_277_1 = manager.audio:GetLocalizationFlag()

		if var_277_0[var_277_1] ~= nil then
			arg_277_1.duration_ = var_277_0[var_277_1]
		end

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play116011067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1039ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1039ui_story == nil then
				arg_277_1.var_.characterEffect1039ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.2

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1039ui_story then
					arg_277_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1039ui_story then
				arg_277_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_280_4 = arg_277_1.actors_["1048ui_story"]
			local var_280_5 = 0

			if var_280_5 < arg_277_1.time_ and arg_277_1.time_ <= var_280_5 + arg_280_0 and arg_277_1.var_.characterEffect1048ui_story == nil then
				arg_277_1.var_.characterEffect1048ui_story = var_280_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_6 = 0.2

			if var_280_5 <= arg_277_1.time_ and arg_277_1.time_ < var_280_5 + var_280_6 then
				local var_280_7 = (arg_277_1.time_ - var_280_5) / var_280_6

				if arg_277_1.var_.characterEffect1048ui_story then
					local var_280_8 = Mathf.Lerp(0, 0.5, var_280_7)

					arg_277_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1048ui_story.fillRatio = var_280_8
				end
			end

			if arg_277_1.time_ >= var_280_5 + var_280_6 and arg_277_1.time_ < var_280_5 + var_280_6 + arg_280_0 and arg_277_1.var_.characterEffect1048ui_story then
				local var_280_9 = 0.5

				arg_277_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1048ui_story.fillRatio = var_280_9
			end

			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 then
				arg_277_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_280_11 = arg_277_1.actors_["1048ui_story"].transform
			local var_280_12 = 0

			if var_280_12 < arg_277_1.time_ and arg_277_1.time_ <= var_280_12 + arg_280_0 then
				arg_277_1.var_.moveOldPos1048ui_story = var_280_11.localPosition
			end

			local var_280_13 = 0.001

			if var_280_12 <= arg_277_1.time_ and arg_277_1.time_ < var_280_12 + var_280_13 then
				local var_280_14 = (arg_277_1.time_ - var_280_12) / var_280_13
				local var_280_15 = Vector3.New(0.7, -0.8, -6.2)

				var_280_11.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1048ui_story, var_280_15, var_280_14)

				local var_280_16 = manager.ui.mainCamera.transform.position - var_280_11.position

				var_280_11.forward = Vector3.New(var_280_16.x, var_280_16.y, var_280_16.z)

				local var_280_17 = var_280_11.localEulerAngles

				var_280_17.z = 0
				var_280_17.x = 0
				var_280_11.localEulerAngles = var_280_17
			end

			if arg_277_1.time_ >= var_280_12 + var_280_13 and arg_277_1.time_ < var_280_12 + var_280_13 + arg_280_0 then
				var_280_11.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_280_18 = manager.ui.mainCamera.transform.position - var_280_11.position

				var_280_11.forward = Vector3.New(var_280_18.x, var_280_18.y, var_280_18.z)

				local var_280_19 = var_280_11.localEulerAngles

				var_280_19.z = 0
				var_280_19.x = 0
				var_280_11.localEulerAngles = var_280_19
			end

			local var_280_20 = arg_277_1.actors_["1039ui_story"].transform
			local var_280_21 = 0

			if var_280_21 < arg_277_1.time_ and arg_277_1.time_ <= var_280_21 + arg_280_0 then
				arg_277_1.var_.moveOldPos1039ui_story = var_280_20.localPosition
			end

			local var_280_22 = 0.001

			if var_280_21 <= arg_277_1.time_ and arg_277_1.time_ < var_280_21 + var_280_22 then
				local var_280_23 = (arg_277_1.time_ - var_280_21) / var_280_22
				local var_280_24 = Vector3.New(-0.7, -1.01, -5.9)

				var_280_20.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1039ui_story, var_280_24, var_280_23)

				local var_280_25 = manager.ui.mainCamera.transform.position - var_280_20.position

				var_280_20.forward = Vector3.New(var_280_25.x, var_280_25.y, var_280_25.z)

				local var_280_26 = var_280_20.localEulerAngles

				var_280_26.z = 0
				var_280_26.x = 0
				var_280_20.localEulerAngles = var_280_26
			end

			if arg_277_1.time_ >= var_280_21 + var_280_22 and arg_277_1.time_ < var_280_21 + var_280_22 + arg_280_0 then
				var_280_20.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_280_27 = manager.ui.mainCamera.transform.position - var_280_20.position

				var_280_20.forward = Vector3.New(var_280_27.x, var_280_27.y, var_280_27.z)

				local var_280_28 = var_280_20.localEulerAngles

				var_280_28.z = 0
				var_280_28.x = 0
				var_280_20.localEulerAngles = var_280_28
			end

			local var_280_29 = 0

			if var_280_29 < arg_277_1.time_ and arg_277_1.time_ <= var_280_29 + arg_280_0 then
				arg_277_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_280_30 = 0
			local var_280_31 = 0.5

			if var_280_30 < arg_277_1.time_ and arg_277_1.time_ <= var_280_30 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_32 = arg_277_1:FormatText(StoryNameCfg[9].name)

				arg_277_1.leftNameTxt_.text = var_280_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_33 = arg_277_1:GetWordFromCfg(116011066)
				local var_280_34 = arg_277_1:FormatText(var_280_33.content)

				arg_277_1.text_.text = var_280_34

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_35 = 20
				local var_280_36 = utf8.len(var_280_34)
				local var_280_37 = var_280_35 <= 0 and var_280_31 or var_280_31 * (var_280_36 / var_280_35)

				if var_280_37 > 0 and var_280_31 < var_280_37 then
					arg_277_1.talkMaxDuration = var_280_37

					if var_280_37 + var_280_30 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_37 + var_280_30
					end
				end

				arg_277_1.text_.text = var_280_34
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011066", "story_v_out_116011.awb") ~= 0 then
					local var_280_38 = manager.audio:GetVoiceLength("story_v_out_116011", "116011066", "story_v_out_116011.awb") / 1000

					if var_280_38 + var_280_30 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_38 + var_280_30
					end

					if var_280_33.prefab_name ~= "" and arg_277_1.actors_[var_280_33.prefab_name] ~= nil then
						local var_280_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_33.prefab_name].transform, "story_v_out_116011", "116011066", "story_v_out_116011.awb")

						arg_277_1:RecordAudio("116011066", var_280_39)
						arg_277_1:RecordAudio("116011066", var_280_39)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_116011", "116011066", "story_v_out_116011.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_116011", "116011066", "story_v_out_116011.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_40 = math.max(var_280_31, arg_277_1.talkMaxDuration)

			if var_280_30 <= arg_277_1.time_ and arg_277_1.time_ < var_280_30 + var_280_40 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_30) / var_280_40

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_30 + var_280_40 and arg_277_1.time_ < var_280_30 + var_280_40 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play116011067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 116011067
		arg_281_1.duration_ = 6

		local var_281_0 = {
			zh = 2.5,
			ja = 6
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play116011068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1048ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1048ui_story == nil then
				arg_281_1.var_.characterEffect1048ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.2

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1048ui_story then
					arg_281_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1048ui_story then
				arg_281_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_284_4 = arg_281_1.actors_["1039ui_story"]
			local var_284_5 = 0

			if var_284_5 < arg_281_1.time_ and arg_281_1.time_ <= var_284_5 + arg_284_0 and arg_281_1.var_.characterEffect1039ui_story == nil then
				arg_281_1.var_.characterEffect1039ui_story = var_284_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_6 = 0.2

			if var_284_5 <= arg_281_1.time_ and arg_281_1.time_ < var_284_5 + var_284_6 then
				local var_284_7 = (arg_281_1.time_ - var_284_5) / var_284_6

				if arg_281_1.var_.characterEffect1039ui_story then
					local var_284_8 = Mathf.Lerp(0, 0.5, var_284_7)

					arg_281_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1039ui_story.fillRatio = var_284_8
				end
			end

			if arg_281_1.time_ >= var_284_5 + var_284_6 and arg_281_1.time_ < var_284_5 + var_284_6 + arg_284_0 and arg_281_1.var_.characterEffect1039ui_story then
				local var_284_9 = 0.5

				arg_281_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1039ui_story.fillRatio = var_284_9
			end

			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 then
				arg_281_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action4_1")
			end

			local var_284_11 = 0

			if var_284_11 < arg_281_1.time_ and arg_281_1.time_ <= var_284_11 + arg_284_0 then
				arg_281_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_284_12 = 0
			local var_284_13 = 0.3

			if var_284_12 < arg_281_1.time_ and arg_281_1.time_ <= var_284_12 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_14 = arg_281_1:FormatText(StoryNameCfg[8].name)

				arg_281_1.leftNameTxt_.text = var_284_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_15 = arg_281_1:GetWordFromCfg(116011067)
				local var_284_16 = arg_281_1:FormatText(var_284_15.content)

				arg_281_1.text_.text = var_284_16

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_17 = 12
				local var_284_18 = utf8.len(var_284_16)
				local var_284_19 = var_284_17 <= 0 and var_284_13 or var_284_13 * (var_284_18 / var_284_17)

				if var_284_19 > 0 and var_284_13 < var_284_19 then
					arg_281_1.talkMaxDuration = var_284_19

					if var_284_19 + var_284_12 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_19 + var_284_12
					end
				end

				arg_281_1.text_.text = var_284_16
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011067", "story_v_out_116011.awb") ~= 0 then
					local var_284_20 = manager.audio:GetVoiceLength("story_v_out_116011", "116011067", "story_v_out_116011.awb") / 1000

					if var_284_20 + var_284_12 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_20 + var_284_12
					end

					if var_284_15.prefab_name ~= "" and arg_281_1.actors_[var_284_15.prefab_name] ~= nil then
						local var_284_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_15.prefab_name].transform, "story_v_out_116011", "116011067", "story_v_out_116011.awb")

						arg_281_1:RecordAudio("116011067", var_284_21)
						arg_281_1:RecordAudio("116011067", var_284_21)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_116011", "116011067", "story_v_out_116011.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_116011", "116011067", "story_v_out_116011.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_22 = math.max(var_284_13, arg_281_1.talkMaxDuration)

			if var_284_12 <= arg_281_1.time_ and arg_281_1.time_ < var_284_12 + var_284_22 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_12) / var_284_22

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_12 + var_284_22 and arg_281_1.time_ < var_284_12 + var_284_22 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play116011068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 116011068
		arg_285_1.duration_ = 7

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play116011069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1039ui_story"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos1039ui_story = var_288_0.localPosition
			end

			local var_288_2 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2
				local var_288_4 = Vector3.New(0, 100, 0)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1039ui_story, var_288_4, var_288_3)

				local var_288_5 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_5.x, var_288_5.y, var_288_5.z)

				local var_288_6 = var_288_0.localEulerAngles

				var_288_6.z = 0
				var_288_6.x = 0
				var_288_0.localEulerAngles = var_288_6
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(0, 100, 0)

				local var_288_7 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_7.x, var_288_7.y, var_288_7.z)

				local var_288_8 = var_288_0.localEulerAngles

				var_288_8.z = 0
				var_288_8.x = 0
				var_288_0.localEulerAngles = var_288_8
			end

			local var_288_9 = arg_285_1.actors_["1048ui_story"].transform
			local var_288_10 = 0

			if var_288_10 < arg_285_1.time_ and arg_285_1.time_ <= var_288_10 + arg_288_0 then
				arg_285_1.var_.moveOldPos1048ui_story = var_288_9.localPosition
			end

			local var_288_11 = 0.001

			if var_288_10 <= arg_285_1.time_ and arg_285_1.time_ < var_288_10 + var_288_11 then
				local var_288_12 = (arg_285_1.time_ - var_288_10) / var_288_11
				local var_288_13 = Vector3.New(0, 100, 0)

				var_288_9.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1048ui_story, var_288_13, var_288_12)

				local var_288_14 = manager.ui.mainCamera.transform.position - var_288_9.position

				var_288_9.forward = Vector3.New(var_288_14.x, var_288_14.y, var_288_14.z)

				local var_288_15 = var_288_9.localEulerAngles

				var_288_15.z = 0
				var_288_15.x = 0
				var_288_9.localEulerAngles = var_288_15
			end

			if arg_285_1.time_ >= var_288_10 + var_288_11 and arg_285_1.time_ < var_288_10 + var_288_11 + arg_288_0 then
				var_288_9.localPosition = Vector3.New(0, 100, 0)

				local var_288_16 = manager.ui.mainCamera.transform.position - var_288_9.position

				var_288_9.forward = Vector3.New(var_288_16.x, var_288_16.y, var_288_16.z)

				local var_288_17 = var_288_9.localEulerAngles

				var_288_17.z = 0
				var_288_17.x = 0
				var_288_9.localEulerAngles = var_288_17
			end

			local var_288_18 = manager.ui.mainCamera.transform
			local var_288_19 = 1

			if var_288_19 < arg_285_1.time_ and arg_285_1.time_ <= var_288_19 + arg_288_0 then
				arg_285_1.var_.shakeOldPos = var_288_18.localPosition
			end

			local var_288_20 = 1

			if var_288_19 <= arg_285_1.time_ and arg_285_1.time_ < var_288_19 + var_288_20 then
				local var_288_21 = (arg_285_1.time_ - var_288_19) / 0.066
				local var_288_22, var_288_23 = math.modf(var_288_21)

				var_288_18.localPosition = Vector3.New(var_288_23 * 0.13, var_288_23 * 0.13, var_288_23 * 0.13) + arg_285_1.var_.shakeOldPos
			end

			if arg_285_1.time_ >= var_288_19 + var_288_20 and arg_285_1.time_ < var_288_19 + var_288_20 + arg_288_0 then
				var_288_18.localPosition = arg_285_1.var_.shakeOldPos
			end

			local var_288_24 = 1

			if var_288_24 < arg_285_1.time_ and arg_285_1.time_ <= var_288_24 + arg_288_0 then
				arg_285_1.allBtn_.enabled = false
			end

			local var_288_25 = 1

			if arg_285_1.time_ >= var_288_24 + var_288_25 and arg_285_1.time_ < var_288_24 + var_288_25 + arg_288_0 then
				arg_285_1.allBtn_.enabled = true
			end

			local var_288_26 = 1
			local var_288_27 = 1

			if var_288_26 < arg_285_1.time_ and arg_285_1.time_ <= var_288_26 + arg_288_0 then
				local var_288_28 = "play"
				local var_288_29 = "effect"

				arg_285_1:AudioAction(var_288_28, var_288_29, "se_story_16", "se_story_16_loud", "")
			end

			local var_288_30 = 0.5

			if var_288_30 < arg_285_1.time_ and arg_285_1.time_ <= var_288_30 + arg_288_0 then
				arg_285_1.mask_.enabled = true
				arg_285_1.mask_.raycastTarget = true

				arg_285_1:SetGaussion(false)
			end

			local var_288_31 = 1

			if var_288_30 <= arg_285_1.time_ and arg_285_1.time_ < var_288_30 + var_288_31 then
				local var_288_32 = (arg_285_1.time_ - var_288_30) / var_288_31
				local var_288_33 = Color.New(1, 1, 1)

				var_288_33.a = Mathf.Lerp(1, 0, var_288_32)
				arg_285_1.mask_.color = var_288_33
			end

			if arg_285_1.time_ >= var_288_30 + var_288_31 and arg_285_1.time_ < var_288_30 + var_288_31 + arg_288_0 then
				local var_288_34 = Color.New(1, 1, 1)
				local var_288_35 = 0

				arg_285_1.mask_.enabled = false
				var_288_34.a = var_288_35
				arg_285_1.mask_.color = var_288_34
			end

			if arg_285_1.frameCnt_ <= 1 then
				arg_285_1.dialog_:SetActive(false)
			end

			local var_288_36 = 2
			local var_288_37 = 0.575

			if var_288_36 < arg_285_1.time_ and arg_285_1.time_ <= var_288_36 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0

				arg_285_1.dialog_:SetActive(true)

				local var_288_38 = LeanTween.value(arg_285_1.dialog_, 0, 1, 0.3)

				var_288_38:setOnUpdate(LuaHelper.FloatAction(function(arg_289_0)
					arg_285_1.dialogCg_.alpha = arg_289_0
				end))
				var_288_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_285_1.dialog_)
					var_288_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_285_1.duration_ = arg_285_1.duration_ + 0.3

				SetActive(arg_285_1.leftNameGo_, false)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_39 = arg_285_1:GetWordFromCfg(116011068)
				local var_288_40 = arg_285_1:FormatText(var_288_39.content)

				arg_285_1.text_.text = var_288_40

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_41 = 23
				local var_288_42 = utf8.len(var_288_40)
				local var_288_43 = var_288_41 <= 0 and var_288_37 or var_288_37 * (var_288_42 / var_288_41)

				if var_288_43 > 0 and var_288_37 < var_288_43 then
					arg_285_1.talkMaxDuration = var_288_43
					var_288_36 = var_288_36 + 0.3

					if var_288_43 + var_288_36 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_43 + var_288_36
					end
				end

				arg_285_1.text_.text = var_288_40
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_44 = var_288_36 + 0.3
			local var_288_45 = math.max(var_288_37, arg_285_1.talkMaxDuration)

			if var_288_44 <= arg_285_1.time_ and arg_285_1.time_ < var_288_44 + var_288_45 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_44) / var_288_45

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_44 + var_288_45 and arg_285_1.time_ < var_288_44 + var_288_45 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play116011069 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 116011069
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play116011070(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.95

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_2 = arg_291_1:GetWordFromCfg(116011069)
				local var_294_3 = arg_291_1:FormatText(var_294_2.content)

				arg_291_1.text_.text = var_294_3

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_4 = 38
				local var_294_5 = utf8.len(var_294_3)
				local var_294_6 = var_294_4 <= 0 and var_294_1 or var_294_1 * (var_294_5 / var_294_4)

				if var_294_6 > 0 and var_294_1 < var_294_6 then
					arg_291_1.talkMaxDuration = var_294_6

					if var_294_6 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_6 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_3
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_7 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_7 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_7

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_7 and arg_291_1.time_ < var_294_0 + var_294_7 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play116011070 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 116011070
		arg_295_1.duration_ = 1.533

		local var_295_0 = {
			zh = 1.533,
			ja = 1.5
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
				arg_295_0:Play116011071(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 0.175

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				local var_298_2 = "play"
				local var_298_3 = "music"

				arg_295_1:AudioAction(var_298_2, var_298_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_298_4 = 0.266666666666667
			local var_298_5 = 0.733333333333333

			if var_298_4 < arg_295_1.time_ and arg_295_1.time_ <= var_298_4 + arg_298_0 then
				local var_298_6 = "play"
				local var_298_7 = "music"

				arg_295_1:AudioAction(var_298_6, var_298_7, "bgm_story_v0_battleground", "bgm_story_v0_battleground", "bgm_story_v0_battleground.awb")
			end

			local var_298_8 = 0
			local var_298_9 = 0.175

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_10 = arg_295_1:FormatText(StoryNameCfg[9].name)

				arg_295_1.leftNameTxt_.text = var_298_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, true)
				arg_295_1.iconController_:SetSelectedState("hero")

				arg_295_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_11 = arg_295_1:GetWordFromCfg(116011070)
				local var_298_12 = arg_295_1:FormatText(var_298_11.content)

				arg_295_1.text_.text = var_298_12

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_13 = 7
				local var_298_14 = utf8.len(var_298_12)
				local var_298_15 = var_298_13 <= 0 and var_298_9 or var_298_9 * (var_298_14 / var_298_13)

				if var_298_15 > 0 and var_298_9 < var_298_15 then
					arg_295_1.talkMaxDuration = var_298_15

					if var_298_15 + var_298_8 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_15 + var_298_8
					end
				end

				arg_295_1.text_.text = var_298_12
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011070", "story_v_out_116011.awb") ~= 0 then
					local var_298_16 = manager.audio:GetVoiceLength("story_v_out_116011", "116011070", "story_v_out_116011.awb") / 1000

					if var_298_16 + var_298_8 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_16 + var_298_8
					end

					if var_298_11.prefab_name ~= "" and arg_295_1.actors_[var_298_11.prefab_name] ~= nil then
						local var_298_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_11.prefab_name].transform, "story_v_out_116011", "116011070", "story_v_out_116011.awb")

						arg_295_1:RecordAudio("116011070", var_298_17)
						arg_295_1:RecordAudio("116011070", var_298_17)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_116011", "116011070", "story_v_out_116011.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_116011", "116011070", "story_v_out_116011.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_18 = math.max(var_298_9, arg_295_1.talkMaxDuration)

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_18 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_8) / var_298_18

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_8 + var_298_18 and arg_295_1.time_ < var_298_8 + var_298_18 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play116011071 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 116011071
		arg_299_1.duration_ = 1.2

		local var_299_0 = {
			zh = 1.033,
			ja = 1.2
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
				arg_299_0:Play116011072(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.05

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[8].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, true)
				arg_299_1.iconController_:SetSelectedState("hero")

				arg_299_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1048")

				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(116011071)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 2
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_1 or var_302_1 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_1 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011071", "story_v_out_116011.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_116011", "116011071", "story_v_out_116011.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_116011", "116011071", "story_v_out_116011.awb")

						arg_299_1:RecordAudio("116011071", var_302_9)
						arg_299_1:RecordAudio("116011071", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_116011", "116011071", "story_v_out_116011.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_116011", "116011071", "story_v_out_116011.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_10 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_10 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_10

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_10 and arg_299_1.time_ < var_302_0 + var_302_10 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play116011072 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 116011072
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play116011073(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 1.4

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_2 = arg_303_1:GetWordFromCfg(116011072)
				local var_306_3 = arg_303_1:FormatText(var_306_2.content)

				arg_303_1.text_.text = var_306_3

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_4 = 56
				local var_306_5 = utf8.len(var_306_3)
				local var_306_6 = var_306_4 <= 0 and var_306_1 or var_306_1 * (var_306_5 / var_306_4)

				if var_306_6 > 0 and var_306_1 < var_306_6 then
					arg_303_1.talkMaxDuration = var_306_6

					if var_306_6 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_6 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_3
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_7 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_7 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_7

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_7 and arg_303_1.time_ < var_306_0 + var_306_7 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play116011073 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 116011073
		arg_307_1.duration_ = 5.999999999999

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play116011074(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = manager.ui.mainCamera.transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.shakeOldPos = var_310_0.localPosition
			end

			local var_310_2 = 1

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / 0.066
				local var_310_4, var_310_5 = math.modf(var_310_3)

				var_310_0.localPosition = Vector3.New(var_310_5 * 0.13, var_310_5 * 0.13, var_310_5 * 0.13) + arg_307_1.var_.shakeOldPos
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = arg_307_1.var_.shakeOldPos
			end

			local var_310_6 = 0

			if var_310_6 < arg_307_1.time_ and arg_307_1.time_ <= var_310_6 + arg_310_0 then
				arg_307_1.allBtn_.enabled = false
			end

			local var_310_7 = 1

			if arg_307_1.time_ >= var_310_6 + var_310_7 and arg_307_1.time_ < var_310_6 + var_310_7 + arg_310_0 then
				arg_307_1.allBtn_.enabled = true
			end

			local var_310_8 = 0
			local var_310_9 = 1

			if var_310_8 < arg_307_1.time_ and arg_307_1.time_ <= var_310_8 + arg_310_0 then
				local var_310_10 = "play"
				local var_310_11 = "effect"

				arg_307_1:AudioAction(var_310_10, var_310_11, "se_story_16", "se_story_16_fall", "")
			end

			if arg_307_1.frameCnt_ <= 1 then
				arg_307_1.dialog_:SetActive(false)
			end

			local var_310_12 = 0.999999999999
			local var_310_13 = 0.85

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0

				arg_307_1.dialog_:SetActive(true)

				local var_310_14 = LeanTween.value(arg_307_1.dialog_, 0, 1, 0.3)

				var_310_14:setOnUpdate(LuaHelper.FloatAction(function(arg_311_0)
					arg_307_1.dialogCg_.alpha = arg_311_0
				end))
				var_310_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_307_1.dialog_)
					var_310_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_307_1.duration_ = arg_307_1.duration_ + 0.3

				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(116011073)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 34
				local var_310_18 = utf8.len(var_310_16)
				local var_310_19 = var_310_17 <= 0 and var_310_13 or var_310_13 * (var_310_18 / var_310_17)

				if var_310_19 > 0 and var_310_13 < var_310_19 then
					arg_307_1.talkMaxDuration = var_310_19
					var_310_12 = var_310_12 + 0.3

					if var_310_19 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_19 + var_310_12
					end
				end

				arg_307_1.text_.text = var_310_16
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_20 = var_310_12 + 0.3
			local var_310_21 = math.max(var_310_13, arg_307_1.talkMaxDuration)

			if var_310_20 <= arg_307_1.time_ and arg_307_1.time_ < var_310_20 + var_310_21 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_20) / var_310_21

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_20 + var_310_21 and arg_307_1.time_ < var_310_20 + var_310_21 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play116011074 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 116011074
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play116011075(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.3

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_2 = arg_313_1:GetWordFromCfg(116011074)
				local var_316_3 = arg_313_1:FormatText(var_316_2.content)

				arg_313_1.text_.text = var_316_3

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_4 = 12
				local var_316_5 = utf8.len(var_316_3)
				local var_316_6 = var_316_4 <= 0 and var_316_1 or var_316_1 * (var_316_5 / var_316_4)

				if var_316_6 > 0 and var_316_1 < var_316_6 then
					arg_313_1.talkMaxDuration = var_316_6

					if var_316_6 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_6 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_3
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_7 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_7 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_7

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_7 and arg_313_1.time_ < var_316_0 + var_316_7 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play116011075 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 116011075
		arg_317_1.duration_ = 1.9

		local var_317_0 = {
			zh = 1.3,
			ja = 1.9
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play116011076(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 0.175

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_2 = arg_317_1:FormatText(StoryNameCfg[9].name)

				arg_317_1.leftNameTxt_.text = var_320_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, true)
				arg_317_1.iconController_:SetSelectedState("hero")

				arg_317_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039_split_4")

				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_3 = arg_317_1:GetWordFromCfg(116011075)
				local var_320_4 = arg_317_1:FormatText(var_320_3.content)

				arg_317_1.text_.text = var_320_4

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_5 = 7
				local var_320_6 = utf8.len(var_320_4)
				local var_320_7 = var_320_5 <= 0 and var_320_1 or var_320_1 * (var_320_6 / var_320_5)

				if var_320_7 > 0 and var_320_1 < var_320_7 then
					arg_317_1.talkMaxDuration = var_320_7

					if var_320_7 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_7 + var_320_0
					end
				end

				arg_317_1.text_.text = var_320_4
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011075", "story_v_out_116011.awb") ~= 0 then
					local var_320_8 = manager.audio:GetVoiceLength("story_v_out_116011", "116011075", "story_v_out_116011.awb") / 1000

					if var_320_8 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_8 + var_320_0
					end

					if var_320_3.prefab_name ~= "" and arg_317_1.actors_[var_320_3.prefab_name] ~= nil then
						local var_320_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_3.prefab_name].transform, "story_v_out_116011", "116011075", "story_v_out_116011.awb")

						arg_317_1:RecordAudio("116011075", var_320_9)
						arg_317_1:RecordAudio("116011075", var_320_9)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_116011", "116011075", "story_v_out_116011.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_116011", "116011075", "story_v_out_116011.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_10 = math.max(var_320_1, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_10 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_0) / var_320_10

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_10 and arg_317_1.time_ < var_320_0 + var_320_10 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play116011076 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 116011076
		arg_321_1.duration_ = 1

		local var_321_0 = {
			zh = 1,
			ja = 0.999999999999
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play116011077(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1039ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1039ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(0, 100, 0)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1039ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, 100, 0)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = manager.ui.mainCamera.transform
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 then
				arg_321_1.var_.shakeOldPos = var_324_9.localPosition
			end

			local var_324_11 = 0.6

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / 0.066
				local var_324_13, var_324_14 = math.modf(var_324_12)

				var_324_9.localPosition = Vector3.New(var_324_14 * 0.13, var_324_14 * 0.13, var_324_14 * 0.13) + arg_321_1.var_.shakeOldPos
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 then
				var_324_9.localPosition = arg_321_1.var_.shakeOldPos
			end

			local var_324_15 = 0

			if var_324_15 < arg_321_1.time_ and arg_321_1.time_ <= var_324_15 + arg_324_0 then
				arg_321_1.allBtn_.enabled = false
			end

			local var_324_16 = 0.6

			if arg_321_1.time_ >= var_324_15 + var_324_16 and arg_321_1.time_ < var_324_15 + var_324_16 + arg_324_0 then
				arg_321_1.allBtn_.enabled = true
			end

			local var_324_17 = 0
			local var_324_18 = 1

			if var_324_17 < arg_321_1.time_ and arg_321_1.time_ <= var_324_17 + arg_324_0 then
				local var_324_19 = "play"
				local var_324_20 = "effect"

				arg_321_1:AudioAction(var_324_19, var_324_20, "se_story_activity_1_5_3", "se_story_activity_1_5_3_magic", "")
			end

			local var_324_21 = 0
			local var_324_22 = 0.125

			if var_324_21 < arg_321_1.time_ and arg_321_1.time_ <= var_324_21 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_23 = arg_321_1:FormatText(StoryNameCfg[9].name)

				arg_321_1.leftNameTxt_.text = var_324_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, true)
				arg_321_1.iconController_:SetSelectedState("hero")

				arg_321_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039_split_4_1")

				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_24 = arg_321_1:GetWordFromCfg(116011076)
				local var_324_25 = arg_321_1:FormatText(var_324_24.content)

				arg_321_1.text_.text = var_324_25

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_26 = 5
				local var_324_27 = utf8.len(var_324_25)
				local var_324_28 = var_324_26 <= 0 and var_324_22 or var_324_22 * (var_324_27 / var_324_26)

				if var_324_28 > 0 and var_324_22 < var_324_28 then
					arg_321_1.talkMaxDuration = var_324_28

					if var_324_28 + var_324_21 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_28 + var_324_21
					end
				end

				arg_321_1.text_.text = var_324_25
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011076", "story_v_out_116011.awb") ~= 0 then
					local var_324_29 = manager.audio:GetVoiceLength("story_v_out_116011", "116011076", "story_v_out_116011.awb") / 1000

					if var_324_29 + var_324_21 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_29 + var_324_21
					end

					if var_324_24.prefab_name ~= "" and arg_321_1.actors_[var_324_24.prefab_name] ~= nil then
						local var_324_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_24.prefab_name].transform, "story_v_out_116011", "116011076", "story_v_out_116011.awb")

						arg_321_1:RecordAudio("116011076", var_324_30)
						arg_321_1:RecordAudio("116011076", var_324_30)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_116011", "116011076", "story_v_out_116011.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_116011", "116011076", "story_v_out_116011.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_31 = math.max(var_324_22, arg_321_1.talkMaxDuration)

			if var_324_21 <= arg_321_1.time_ and arg_321_1.time_ < var_324_21 + var_324_31 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_21) / var_324_31

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_21 + var_324_31 and arg_321_1.time_ < var_324_21 + var_324_31 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play116011077 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 116011077
		arg_325_1.duration_ = 6.5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play116011078(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.mask_.enabled = true
				arg_325_1.mask_.raycastTarget = true

				arg_325_1:SetGaussion(false)
			end

			local var_328_1 = 1.5

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_1 then
				local var_328_2 = (arg_325_1.time_ - var_328_0) / var_328_1
				local var_328_3 = Color.New(1, 1, 1)

				var_328_3.a = Mathf.Lerp(1, 0, var_328_2)
				arg_325_1.mask_.color = var_328_3
			end

			if arg_325_1.time_ >= var_328_0 + var_328_1 and arg_325_1.time_ < var_328_0 + var_328_1 + arg_328_0 then
				local var_328_4 = Color.New(1, 1, 1)
				local var_328_5 = 0

				arg_325_1.mask_.enabled = false
				var_328_4.a = var_328_5
				arg_325_1.mask_.color = var_328_4
			end

			if arg_325_1.frameCnt_ <= 1 then
				arg_325_1.dialog_:SetActive(false)
			end

			local var_328_6 = 1.5
			local var_328_7 = 1.05

			if var_328_6 < arg_325_1.time_ and arg_325_1.time_ <= var_328_6 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0

				arg_325_1.dialog_:SetActive(true)

				local var_328_8 = LeanTween.value(arg_325_1.dialog_, 0, 1, 0.3)

				var_328_8:setOnUpdate(LuaHelper.FloatAction(function(arg_329_0)
					arg_325_1.dialogCg_.alpha = arg_329_0
				end))
				var_328_8:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_325_1.dialog_)
					var_328_8:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_325_1.duration_ = arg_325_1.duration_ + 0.3

				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_9 = arg_325_1:GetWordFromCfg(116011077)
				local var_328_10 = arg_325_1:FormatText(var_328_9.content)

				arg_325_1.text_.text = var_328_10

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_11 = 42
				local var_328_12 = utf8.len(var_328_10)
				local var_328_13 = var_328_11 <= 0 and var_328_7 or var_328_7 * (var_328_12 / var_328_11)

				if var_328_13 > 0 and var_328_7 < var_328_13 then
					arg_325_1.talkMaxDuration = var_328_13
					var_328_6 = var_328_6 + 0.3

					if var_328_13 + var_328_6 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_13 + var_328_6
					end
				end

				arg_325_1.text_.text = var_328_10
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_14 = var_328_6 + 0.3
			local var_328_15 = math.max(var_328_7, arg_325_1.talkMaxDuration)

			if var_328_14 <= arg_325_1.time_ and arg_325_1.time_ < var_328_14 + var_328_15 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_14) / var_328_15

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_14 + var_328_15 and arg_325_1.time_ < var_328_14 + var_328_15 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play116011078 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 116011078
		arg_331_1.duration_ = 1.999999999999

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play116011079(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1048ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1048ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(0, -0.8, -6.2)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1048ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = 0

			if var_334_9 < arg_331_1.time_ and arg_331_1.time_ <= var_334_9 + arg_334_0 then
				arg_331_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action8_2")
			end

			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 then
				arg_331_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_334_11 = arg_331_1.actors_["1048ui_story"]
			local var_334_12 = 0

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 and arg_331_1.var_.characterEffect1048ui_story == nil then
				arg_331_1.var_.characterEffect1048ui_story = var_334_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_13 = 0.2

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_13 then
				local var_334_14 = (arg_331_1.time_ - var_334_12) / var_334_13

				if arg_331_1.var_.characterEffect1048ui_story then
					arg_331_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_12 + var_334_13 and arg_331_1.time_ < var_334_12 + var_334_13 + arg_334_0 and arg_331_1.var_.characterEffect1048ui_story then
				arg_331_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_334_15 = 0
			local var_334_16 = 0.2

			if var_334_15 < arg_331_1.time_ and arg_331_1.time_ <= var_334_15 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_17 = arg_331_1:FormatText(StoryNameCfg[8].name)

				arg_331_1.leftNameTxt_.text = var_334_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_18 = arg_331_1:GetWordFromCfg(116011078)
				local var_334_19 = arg_331_1:FormatText(var_334_18.content)

				arg_331_1.text_.text = var_334_19

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_20 = 8
				local var_334_21 = utf8.len(var_334_19)
				local var_334_22 = var_334_20 <= 0 and var_334_16 or var_334_16 * (var_334_21 / var_334_20)

				if var_334_22 > 0 and var_334_16 < var_334_22 then
					arg_331_1.talkMaxDuration = var_334_22

					if var_334_22 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_22 + var_334_15
					end
				end

				arg_331_1.text_.text = var_334_19
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011078", "story_v_out_116011.awb") ~= 0 then
					local var_334_23 = manager.audio:GetVoiceLength("story_v_out_116011", "116011078", "story_v_out_116011.awb") / 1000

					if var_334_23 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_23 + var_334_15
					end

					if var_334_18.prefab_name ~= "" and arg_331_1.actors_[var_334_18.prefab_name] ~= nil then
						local var_334_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_18.prefab_name].transform, "story_v_out_116011", "116011078", "story_v_out_116011.awb")

						arg_331_1:RecordAudio("116011078", var_334_24)
						arg_331_1:RecordAudio("116011078", var_334_24)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_116011", "116011078", "story_v_out_116011.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_116011", "116011078", "story_v_out_116011.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_25 = math.max(var_334_16, arg_331_1.talkMaxDuration)

			if var_334_15 <= arg_331_1.time_ and arg_331_1.time_ < var_334_15 + var_334_25 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_15) / var_334_25

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_15 + var_334_25 and arg_331_1.time_ < var_334_15 + var_334_25 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play116011079 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 116011079
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play116011080(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1048ui_story"].transform
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				arg_335_1.var_.moveOldPos1048ui_story = var_338_0.localPosition
			end

			local var_338_2 = 0.001

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2
				local var_338_4 = Vector3.New(0, 100, 0)

				var_338_0.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1048ui_story, var_338_4, var_338_3)

				local var_338_5 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_5.x, var_338_5.y, var_338_5.z)

				local var_338_6 = var_338_0.localEulerAngles

				var_338_6.z = 0
				var_338_6.x = 0
				var_338_0.localEulerAngles = var_338_6
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 then
				var_338_0.localPosition = Vector3.New(0, 100, 0)

				local var_338_7 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_7.x, var_338_7.y, var_338_7.z)

				local var_338_8 = var_338_0.localEulerAngles

				var_338_8.z = 0
				var_338_8.x = 0
				var_338_0.localEulerAngles = var_338_8
			end

			local var_338_9 = 0
			local var_338_10 = 0.775

			if var_338_9 < arg_335_1.time_ and arg_335_1.time_ <= var_338_9 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_11 = arg_335_1:GetWordFromCfg(116011079)
				local var_338_12 = arg_335_1:FormatText(var_338_11.content)

				arg_335_1.text_.text = var_338_12

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_13 = 31
				local var_338_14 = utf8.len(var_338_12)
				local var_338_15 = var_338_13 <= 0 and var_338_10 or var_338_10 * (var_338_14 / var_338_13)

				if var_338_15 > 0 and var_338_10 < var_338_15 then
					arg_335_1.talkMaxDuration = var_338_15

					if var_338_15 + var_338_9 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_15 + var_338_9
					end
				end

				arg_335_1.text_.text = var_338_12
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_16 = math.max(var_338_10, arg_335_1.talkMaxDuration)

			if var_338_9 <= arg_335_1.time_ and arg_335_1.time_ < var_338_9 + var_338_16 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_9) / var_338_16

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_9 + var_338_16 and arg_335_1.time_ < var_338_9 + var_338_16 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play116011080 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 116011080
		arg_339_1.duration_ = 2.133

		local var_339_0 = {
			zh = 1.999999999999,
			ja = 2.133
		}
		local var_339_1 = manager.audio:GetLocalizationFlag()

		if var_339_0[var_339_1] ~= nil then
			arg_339_1.duration_ = var_339_0[var_339_1]
		end

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play116011081(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1039ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect1039ui_story == nil then
				arg_339_1.var_.characterEffect1039ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.2

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect1039ui_story then
					arg_339_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect1039ui_story then
				arg_339_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_342_4 = arg_339_1.actors_["1039ui_story"].transform
			local var_342_5 = 0

			if var_342_5 < arg_339_1.time_ and arg_339_1.time_ <= var_342_5 + arg_342_0 then
				arg_339_1.var_.moveOldPos1039ui_story = var_342_4.localPosition
			end

			local var_342_6 = 0.001

			if var_342_5 <= arg_339_1.time_ and arg_339_1.time_ < var_342_5 + var_342_6 then
				local var_342_7 = (arg_339_1.time_ - var_342_5) / var_342_6
				local var_342_8 = Vector3.New(0, -1.01, -5.9)

				var_342_4.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1039ui_story, var_342_8, var_342_7)

				local var_342_9 = manager.ui.mainCamera.transform.position - var_342_4.position

				var_342_4.forward = Vector3.New(var_342_9.x, var_342_9.y, var_342_9.z)

				local var_342_10 = var_342_4.localEulerAngles

				var_342_10.z = 0
				var_342_10.x = 0
				var_342_4.localEulerAngles = var_342_10
			end

			if arg_339_1.time_ >= var_342_5 + var_342_6 and arg_339_1.time_ < var_342_5 + var_342_6 + arg_342_0 then
				var_342_4.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_342_11 = manager.ui.mainCamera.transform.position - var_342_4.position

				var_342_4.forward = Vector3.New(var_342_11.x, var_342_11.y, var_342_11.z)

				local var_342_12 = var_342_4.localEulerAngles

				var_342_12.z = 0
				var_342_12.x = 0
				var_342_4.localEulerAngles = var_342_12
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_342_15 = 0
			local var_342_16 = 0.1

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[9].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(116011080)
				local var_342_19 = arg_339_1:FormatText(var_342_18.content)

				arg_339_1.text_.text = var_342_19

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_20 = 4
				local var_342_21 = utf8.len(var_342_19)
				local var_342_22 = var_342_20 <= 0 and var_342_16 or var_342_16 * (var_342_21 / var_342_20)

				if var_342_22 > 0 and var_342_16 < var_342_22 then
					arg_339_1.talkMaxDuration = var_342_22

					if var_342_22 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_22 + var_342_15
					end
				end

				arg_339_1.text_.text = var_342_19
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011080", "story_v_out_116011.awb") ~= 0 then
					local var_342_23 = manager.audio:GetVoiceLength("story_v_out_116011", "116011080", "story_v_out_116011.awb") / 1000

					if var_342_23 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_23 + var_342_15
					end

					if var_342_18.prefab_name ~= "" and arg_339_1.actors_[var_342_18.prefab_name] ~= nil then
						local var_342_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_18.prefab_name].transform, "story_v_out_116011", "116011080", "story_v_out_116011.awb")

						arg_339_1:RecordAudio("116011080", var_342_24)
						arg_339_1:RecordAudio("116011080", var_342_24)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_116011", "116011080", "story_v_out_116011.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_116011", "116011080", "story_v_out_116011.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_25 = math.max(var_342_16, arg_339_1.talkMaxDuration)

			if var_342_15 <= arg_339_1.time_ and arg_339_1.time_ < var_342_15 + var_342_25 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_15) / var_342_25

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_15 + var_342_25 and arg_339_1.time_ < var_342_15 + var_342_25 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play116011081 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 116011081
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play116011082(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1039ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos1039ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(0, 100, 0)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1039ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(0, 100, 0)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = 0
			local var_346_10 = 0.575

			if var_346_9 < arg_343_1.time_ and arg_343_1.time_ <= var_346_9 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_11 = arg_343_1:GetWordFromCfg(116011081)
				local var_346_12 = arg_343_1:FormatText(var_346_11.content)

				arg_343_1.text_.text = var_346_12

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_13 = 23
				local var_346_14 = utf8.len(var_346_12)
				local var_346_15 = var_346_13 <= 0 and var_346_10 or var_346_10 * (var_346_14 / var_346_13)

				if var_346_15 > 0 and var_346_10 < var_346_15 then
					arg_343_1.talkMaxDuration = var_346_15

					if var_346_15 + var_346_9 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_15 + var_346_9
					end
				end

				arg_343_1.text_.text = var_346_12
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_16 = math.max(var_346_10, arg_343_1.talkMaxDuration)

			if var_346_9 <= arg_343_1.time_ and arg_343_1.time_ < var_346_9 + var_346_16 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_9) / var_346_16

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_9 + var_346_16 and arg_343_1.time_ < var_346_9 + var_346_16 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play116011082 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 116011082
		arg_347_1.duration_ = 3.2

		local var_347_0 = {
			zh = 1.999999999999,
			ja = 3.2
		}
		local var_347_1 = manager.audio:GetLocalizationFlag()

		if var_347_0[var_347_1] ~= nil then
			arg_347_1.duration_ = var_347_0[var_347_1]
		end

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play116011083(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1039ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos1039ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(0, -1.01, -5.9)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1039ui_story, var_350_4, var_350_3)

				local var_350_5 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_5.x, var_350_5.y, var_350_5.z)

				local var_350_6 = var_350_0.localEulerAngles

				var_350_6.z = 0
				var_350_6.x = 0
				var_350_0.localEulerAngles = var_350_6
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_350_7 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_7.x, var_350_7.y, var_350_7.z)

				local var_350_8 = var_350_0.localEulerAngles

				var_350_8.z = 0
				var_350_8.x = 0
				var_350_0.localEulerAngles = var_350_8
			end

			local var_350_9 = 0

			if var_350_9 < arg_347_1.time_ and arg_347_1.time_ <= var_350_9 + arg_350_0 then
				arg_347_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_350_10 = arg_347_1.actors_["1039ui_story"]
			local var_350_11 = 0

			if var_350_11 < arg_347_1.time_ and arg_347_1.time_ <= var_350_11 + arg_350_0 and arg_347_1.var_.characterEffect1039ui_story == nil then
				arg_347_1.var_.characterEffect1039ui_story = var_350_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_12 = 0.2

			if var_350_11 <= arg_347_1.time_ and arg_347_1.time_ < var_350_11 + var_350_12 then
				local var_350_13 = (arg_347_1.time_ - var_350_11) / var_350_12

				if arg_347_1.var_.characterEffect1039ui_story then
					arg_347_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_11 + var_350_12 and arg_347_1.time_ < var_350_11 + var_350_12 + arg_350_0 and arg_347_1.var_.characterEffect1039ui_story then
				arg_347_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_350_14 = 0
			local var_350_15 = 0.275

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_16 = arg_347_1:FormatText(StoryNameCfg[9].name)

				arg_347_1.leftNameTxt_.text = var_350_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_17 = arg_347_1:GetWordFromCfg(116011082)
				local var_350_18 = arg_347_1:FormatText(var_350_17.content)

				arg_347_1.text_.text = var_350_18

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_19 = 11
				local var_350_20 = utf8.len(var_350_18)
				local var_350_21 = var_350_19 <= 0 and var_350_15 or var_350_15 * (var_350_20 / var_350_19)

				if var_350_21 > 0 and var_350_15 < var_350_21 then
					arg_347_1.talkMaxDuration = var_350_21

					if var_350_21 + var_350_14 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_21 + var_350_14
					end
				end

				arg_347_1.text_.text = var_350_18
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011082", "story_v_out_116011.awb") ~= 0 then
					local var_350_22 = manager.audio:GetVoiceLength("story_v_out_116011", "116011082", "story_v_out_116011.awb") / 1000

					if var_350_22 + var_350_14 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_22 + var_350_14
					end

					if var_350_17.prefab_name ~= "" and arg_347_1.actors_[var_350_17.prefab_name] ~= nil then
						local var_350_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_17.prefab_name].transform, "story_v_out_116011", "116011082", "story_v_out_116011.awb")

						arg_347_1:RecordAudio("116011082", var_350_23)
						arg_347_1:RecordAudio("116011082", var_350_23)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_116011", "116011082", "story_v_out_116011.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_116011", "116011082", "story_v_out_116011.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_24 = math.max(var_350_15, arg_347_1.talkMaxDuration)

			if var_350_14 <= arg_347_1.time_ and arg_347_1.time_ < var_350_14 + var_350_24 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_14) / var_350_24

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_14 + var_350_24 and arg_347_1.time_ < var_350_14 + var_350_24 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play116011083 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 116011083
		arg_351_1.duration_ = 5

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play116011084(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1039ui_story"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1039ui_story = var_354_0.localPosition
			end

			local var_354_2 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(0, 100, 0)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1039ui_story, var_354_4, var_354_3)

				local var_354_5 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_5.x, var_354_5.y, var_354_5.z)

				local var_354_6 = var_354_0.localEulerAngles

				var_354_6.z = 0
				var_354_6.x = 0
				var_354_0.localEulerAngles = var_354_6
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0, 100, 0)

				local var_354_7 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_7.x, var_354_7.y, var_354_7.z)

				local var_354_8 = var_354_0.localEulerAngles

				var_354_8.z = 0
				var_354_8.x = 0
				var_354_0.localEulerAngles = var_354_8
			end

			local var_354_9 = 0
			local var_354_10 = 0.775

			if var_354_9 < arg_351_1.time_ and arg_351_1.time_ <= var_354_9 + arg_354_0 then
				local var_354_11 = "play"
				local var_354_12 = "effect"

				arg_351_1:AudioAction(var_354_11, var_354_12, "se_story_16", "se_story_16_skill01", "")
			end

			local var_354_13 = 0.3
			local var_354_14 = 0.7

			if var_354_13 < arg_351_1.time_ and arg_351_1.time_ <= var_354_13 + arg_354_0 then
				local var_354_15 = "play"
				local var_354_16 = "effect"

				arg_351_1:AudioAction(var_354_15, var_354_16, "se_story_16", "se_story_16_skill_loop", "")
			end

			local var_354_17 = 0
			local var_354_18 = 0.775

			if var_354_17 < arg_351_1.time_ and arg_351_1.time_ <= var_354_17 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_19 = arg_351_1:GetWordFromCfg(116011083)
				local var_354_20 = arg_351_1:FormatText(var_354_19.content)

				arg_351_1.text_.text = var_354_20

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_21 = 31
				local var_354_22 = utf8.len(var_354_20)
				local var_354_23 = var_354_21 <= 0 and var_354_18 or var_354_18 * (var_354_22 / var_354_21)

				if var_354_23 > 0 and var_354_18 < var_354_23 then
					arg_351_1.talkMaxDuration = var_354_23

					if var_354_23 + var_354_17 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_23 + var_354_17
					end
				end

				arg_351_1.text_.text = var_354_20
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_24 = math.max(var_354_18, arg_351_1.talkMaxDuration)

			if var_354_17 <= arg_351_1.time_ and arg_351_1.time_ < var_354_17 + var_354_24 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_17) / var_354_24

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_17 + var_354_24 and arg_351_1.time_ < var_354_17 + var_354_24 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play116011084 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 116011084
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play116011085(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = manager.ui.mainCamera.transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.shakeOldPos = var_358_0.localPosition
			end

			local var_358_2 = 0.6

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / 0.066
				local var_358_4, var_358_5 = math.modf(var_358_3)

				var_358_0.localPosition = Vector3.New(var_358_5 * 0.13, var_358_5 * 0.13, var_358_5 * 0.13) + arg_355_1.var_.shakeOldPos
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 then
				var_358_0.localPosition = arg_355_1.var_.shakeOldPos
			end

			local var_358_6 = 0
			local var_358_7 = 0.733333333333333

			if var_358_6 < arg_355_1.time_ and arg_355_1.time_ <= var_358_6 + arg_358_0 then
				local var_358_8 = "stop"
				local var_358_9 = "music"

				arg_355_1:AudioAction(var_358_8, var_358_9, "se_story_16", "se_story_16_skill_loop", "")
			end

			local var_358_10 = 0
			local var_358_11 = 1.05

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				local var_358_12 = "play"
				local var_358_13 = "effect"

				arg_355_1:AudioAction(var_358_12, var_358_13, "se_story_16", "se_story_16_skill02", "")
			end

			local var_358_14 = 0

			if var_358_14 < arg_355_1.time_ and arg_355_1.time_ <= var_358_14 + arg_358_0 then
				arg_355_1.allBtn_.enabled = false
			end

			local var_358_15 = 0.6

			if arg_355_1.time_ >= var_358_14 + var_358_15 and arg_355_1.time_ < var_358_14 + var_358_15 + arg_358_0 then
				arg_355_1.allBtn_.enabled = true
			end

			local var_358_16 = 0
			local var_358_17 = 1.05

			if var_358_16 < arg_355_1.time_ and arg_355_1.time_ <= var_358_16 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_18 = arg_355_1:GetWordFromCfg(116011084)
				local var_358_19 = arg_355_1:FormatText(var_358_18.content)

				arg_355_1.text_.text = var_358_19

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_20 = 42
				local var_358_21 = utf8.len(var_358_19)
				local var_358_22 = var_358_20 <= 0 and var_358_17 or var_358_17 * (var_358_21 / var_358_20)

				if var_358_22 > 0 and var_358_17 < var_358_22 then
					arg_355_1.talkMaxDuration = var_358_22

					if var_358_22 + var_358_16 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_22 + var_358_16
					end
				end

				arg_355_1.text_.text = var_358_19
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_23 = math.max(var_358_17, arg_355_1.talkMaxDuration)

			if var_358_16 <= arg_355_1.time_ and arg_355_1.time_ < var_358_16 + var_358_23 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_16) / var_358_23

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_16 + var_358_23 and arg_355_1.time_ < var_358_16 + var_358_23 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play116011085 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 116011085
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play116011086(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 1.775

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, false)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_2 = arg_359_1:GetWordFromCfg(116011085)
				local var_362_3 = arg_359_1:FormatText(var_362_2.content)

				arg_359_1.text_.text = var_362_3

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_4 = 71
				local var_362_5 = utf8.len(var_362_3)
				local var_362_6 = var_362_4 <= 0 and var_362_1 or var_362_1 * (var_362_5 / var_362_4)

				if var_362_6 > 0 and var_362_1 < var_362_6 then
					arg_359_1.talkMaxDuration = var_362_6

					if var_362_6 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_6 + var_362_0
					end
				end

				arg_359_1.text_.text = var_362_3
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_7 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_7 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_7

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_7 and arg_359_1.time_ < var_362_0 + var_362_7 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play116011086 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 116011086
		arg_363_1.duration_ = 1.999999999999

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play116011087(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1039ui_story"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1039ui_story = var_366_0.localPosition
			end

			local var_366_2 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2
				local var_366_4 = Vector3.New(0, -1.01, -5.9)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1039ui_story, var_366_4, var_366_3)

				local var_366_5 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_5.x, var_366_5.y, var_366_5.z)

				local var_366_6 = var_366_0.localEulerAngles

				var_366_6.z = 0
				var_366_6.x = 0
				var_366_0.localEulerAngles = var_366_6
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_366_7 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_7.x, var_366_7.y, var_366_7.z)

				local var_366_8 = var_366_0.localEulerAngles

				var_366_8.z = 0
				var_366_8.x = 0
				var_366_0.localEulerAngles = var_366_8
			end

			local var_366_9 = 0

			if var_366_9 < arg_363_1.time_ and arg_363_1.time_ <= var_366_9 + arg_366_0 then
				arg_363_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_366_10 = 0

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_366_11 = 0
			local var_366_12 = 0.125

			if var_366_11 < arg_363_1.time_ and arg_363_1.time_ <= var_366_11 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_13 = arg_363_1:FormatText(StoryNameCfg[9].name)

				arg_363_1.leftNameTxt_.text = var_366_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_14 = arg_363_1:GetWordFromCfg(116011086)
				local var_366_15 = arg_363_1:FormatText(var_366_14.content)

				arg_363_1.text_.text = var_366_15

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_16 = 7
				local var_366_17 = utf8.len(var_366_15)
				local var_366_18 = var_366_16 <= 0 and var_366_12 or var_366_12 * (var_366_17 / var_366_16)

				if var_366_18 > 0 and var_366_12 < var_366_18 then
					arg_363_1.talkMaxDuration = var_366_18

					if var_366_18 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_11
					end
				end

				arg_363_1.text_.text = var_366_15
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011086", "story_v_out_116011.awb") ~= 0 then
					local var_366_19 = manager.audio:GetVoiceLength("story_v_out_116011", "116011086", "story_v_out_116011.awb") / 1000

					if var_366_19 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_19 + var_366_11
					end

					if var_366_14.prefab_name ~= "" and arg_363_1.actors_[var_366_14.prefab_name] ~= nil then
						local var_366_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_14.prefab_name].transform, "story_v_out_116011", "116011086", "story_v_out_116011.awb")

						arg_363_1:RecordAudio("116011086", var_366_20)
						arg_363_1:RecordAudio("116011086", var_366_20)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_116011", "116011086", "story_v_out_116011.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_116011", "116011086", "story_v_out_116011.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_21 = math.max(var_366_12, arg_363_1.talkMaxDuration)

			if var_366_11 <= arg_363_1.time_ and arg_363_1.time_ < var_366_11 + var_366_21 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_11) / var_366_21

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_11 + var_366_21 and arg_363_1.time_ < var_366_11 + var_366_21 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play116011087 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 116011087
		arg_367_1.duration_ = 4.333

		local var_367_0 = {
			zh = 4.333,
			ja = 3.833
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play116011088(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_370_1 = 0
			local var_370_2 = 0.475

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_3 = arg_367_1:FormatText(StoryNameCfg[9].name)

				arg_367_1.leftNameTxt_.text = var_370_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_4 = arg_367_1:GetWordFromCfg(116011087)
				local var_370_5 = arg_367_1:FormatText(var_370_4.content)

				arg_367_1.text_.text = var_370_5

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_6 = 21
				local var_370_7 = utf8.len(var_370_5)
				local var_370_8 = var_370_6 <= 0 and var_370_2 or var_370_2 * (var_370_7 / var_370_6)

				if var_370_8 > 0 and var_370_2 < var_370_8 then
					arg_367_1.talkMaxDuration = var_370_8

					if var_370_8 + var_370_1 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_8 + var_370_1
					end
				end

				arg_367_1.text_.text = var_370_5
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011087", "story_v_out_116011.awb") ~= 0 then
					local var_370_9 = manager.audio:GetVoiceLength("story_v_out_116011", "116011087", "story_v_out_116011.awb") / 1000

					if var_370_9 + var_370_1 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_9 + var_370_1
					end

					if var_370_4.prefab_name ~= "" and arg_367_1.actors_[var_370_4.prefab_name] ~= nil then
						local var_370_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_4.prefab_name].transform, "story_v_out_116011", "116011087", "story_v_out_116011.awb")

						arg_367_1:RecordAudio("116011087", var_370_10)
						arg_367_1:RecordAudio("116011087", var_370_10)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_116011", "116011087", "story_v_out_116011.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_116011", "116011087", "story_v_out_116011.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_11 = math.max(var_370_2, arg_367_1.talkMaxDuration)

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_11 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_1) / var_370_11

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_1 + var_370_11 and arg_367_1.time_ < var_370_1 + var_370_11 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play116011088 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 116011088
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play116011089(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1039ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1039ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0, 100, 0)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1039ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0, 100, 0)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = 0
			local var_374_10 = 1.375

			if var_374_9 < arg_371_1.time_ and arg_371_1.time_ <= var_374_9 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_11 = arg_371_1:GetWordFromCfg(116011088)
				local var_374_12 = arg_371_1:FormatText(var_374_11.content)

				arg_371_1.text_.text = var_374_12

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_13 = 55
				local var_374_14 = utf8.len(var_374_12)
				local var_374_15 = var_374_13 <= 0 and var_374_10 or var_374_10 * (var_374_14 / var_374_13)

				if var_374_15 > 0 and var_374_10 < var_374_15 then
					arg_371_1.talkMaxDuration = var_374_15

					if var_374_15 + var_374_9 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_15 + var_374_9
					end
				end

				arg_371_1.text_.text = var_374_12
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_16 = math.max(var_374_10, arg_371_1.talkMaxDuration)

			if var_374_9 <= arg_371_1.time_ and arg_371_1.time_ < var_374_9 + var_374_16 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_9) / var_374_16

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_9 + var_374_16 and arg_371_1.time_ < var_374_9 + var_374_16 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play116011089 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 116011089
		arg_375_1.duration_ = 4.4

		local var_375_0 = {
			zh = 3.633,
			ja = 4.4
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play116011090(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0
			local var_378_1 = 0.35

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_2 = arg_375_1:FormatText(StoryNameCfg[9].name)

				arg_375_1.leftNameTxt_.text = var_378_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, true)
				arg_375_1.iconController_:SetSelectedState("hero")

				arg_375_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039_split_4_1")

				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_3 = arg_375_1:GetWordFromCfg(116011089)
				local var_378_4 = arg_375_1:FormatText(var_378_3.content)

				arg_375_1.text_.text = var_378_4

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_5 = 14
				local var_378_6 = utf8.len(var_378_4)
				local var_378_7 = var_378_5 <= 0 and var_378_1 or var_378_1 * (var_378_6 / var_378_5)

				if var_378_7 > 0 and var_378_1 < var_378_7 then
					arg_375_1.talkMaxDuration = var_378_7

					if var_378_7 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_7 + var_378_0
					end
				end

				arg_375_1.text_.text = var_378_4
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011089", "story_v_out_116011.awb") ~= 0 then
					local var_378_8 = manager.audio:GetVoiceLength("story_v_out_116011", "116011089", "story_v_out_116011.awb") / 1000

					if var_378_8 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_8 + var_378_0
					end

					if var_378_3.prefab_name ~= "" and arg_375_1.actors_[var_378_3.prefab_name] ~= nil then
						local var_378_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_3.prefab_name].transform, "story_v_out_116011", "116011089", "story_v_out_116011.awb")

						arg_375_1:RecordAudio("116011089", var_378_9)
						arg_375_1:RecordAudio("116011089", var_378_9)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_116011", "116011089", "story_v_out_116011.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_116011", "116011089", "story_v_out_116011.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_10 = math.max(var_378_1, arg_375_1.talkMaxDuration)

			if var_378_0 <= arg_375_1.time_ and arg_375_1.time_ < var_378_0 + var_378_10 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_0) / var_378_10

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_0 + var_378_10 and arg_375_1.time_ < var_378_0 + var_378_10 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play116011090 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 116011090
		arg_379_1.duration_ = 3.833

		local var_379_0 = {
			zh = 2.466,
			ja = 3.833
		}
		local var_379_1 = manager.audio:GetLocalizationFlag()

		if var_379_0[var_379_1] ~= nil then
			arg_379_1.duration_ = var_379_0[var_379_1]
		end

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play116011091(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0
			local var_382_1 = 0.15

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_2 = arg_379_1:FormatText(StoryNameCfg[8].name)

				arg_379_1.leftNameTxt_.text = var_382_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, true)
				arg_379_1.iconController_:SetSelectedState("hero")

				arg_379_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1048")

				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_3 = arg_379_1:GetWordFromCfg(116011090)
				local var_382_4 = arg_379_1:FormatText(var_382_3.content)

				arg_379_1.text_.text = var_382_4

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_5 = 6
				local var_382_6 = utf8.len(var_382_4)
				local var_382_7 = var_382_5 <= 0 and var_382_1 or var_382_1 * (var_382_6 / var_382_5)

				if var_382_7 > 0 and var_382_1 < var_382_7 then
					arg_379_1.talkMaxDuration = var_382_7

					if var_382_7 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_7 + var_382_0
					end
				end

				arg_379_1.text_.text = var_382_4
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011090", "story_v_out_116011.awb") ~= 0 then
					local var_382_8 = manager.audio:GetVoiceLength("story_v_out_116011", "116011090", "story_v_out_116011.awb") / 1000

					if var_382_8 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_8 + var_382_0
					end

					if var_382_3.prefab_name ~= "" and arg_379_1.actors_[var_382_3.prefab_name] ~= nil then
						local var_382_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_3.prefab_name].transform, "story_v_out_116011", "116011090", "story_v_out_116011.awb")

						arg_379_1:RecordAudio("116011090", var_382_9)
						arg_379_1:RecordAudio("116011090", var_382_9)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_116011", "116011090", "story_v_out_116011.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_116011", "116011090", "story_v_out_116011.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_10 = math.max(var_382_1, arg_379_1.talkMaxDuration)

			if var_382_0 <= arg_379_1.time_ and arg_379_1.time_ < var_382_0 + var_382_10 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_0) / var_382_10

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_0 + var_382_10 and arg_379_1.time_ < var_382_0 + var_382_10 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play116011091 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 116011091
		arg_383_1.duration_ = 5.3

		local var_383_0 = {
			zh = 3.4,
			ja = 5.3
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
			arg_383_1.auto_ = false
		end

		function arg_383_1.playNext_(arg_385_0)
			arg_383_1.onStoryFinished_()
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 0.833333333333333

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_2 = arg_383_1:FormatText(StoryNameCfg[9].name)

				arg_383_1.leftNameTxt_.text = var_386_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, true)
				arg_383_1.iconController_:SetSelectedState("hero")

				arg_383_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039_split_4_1")

				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_3 = arg_383_1:GetWordFromCfg(116011091)
				local var_386_4 = arg_383_1:FormatText(var_386_3.content)

				arg_383_1.text_.text = var_386_4

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_5 = 10
				local var_386_6 = utf8.len(var_386_4)
				local var_386_7 = var_386_5 <= 0 and var_386_1 or var_386_1 * (var_386_6 / var_386_5)

				if var_386_7 > 0 and var_386_1 < var_386_7 then
					arg_383_1.talkMaxDuration = var_386_7

					if var_386_7 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_7 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_4
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116011", "116011091", "story_v_out_116011.awb") ~= 0 then
					local var_386_8 = manager.audio:GetVoiceLength("story_v_out_116011", "116011091", "story_v_out_116011.awb") / 1000

					if var_386_8 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_8 + var_386_0
					end

					if var_386_3.prefab_name ~= "" and arg_383_1.actors_[var_386_3.prefab_name] ~= nil then
						local var_386_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_3.prefab_name].transform, "story_v_out_116011", "116011091", "story_v_out_116011.awb")

						arg_383_1:RecordAudio("116011091", var_386_9)
						arg_383_1:RecordAudio("116011091", var_386_9)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_116011", "116011091", "story_v_out_116011.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_116011", "116011091", "story_v_out_116011.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_10 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_10 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_10

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_10 and arg_383_1.time_ < var_386_0 + var_386_10 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05f",
		"SofdecAsset/story/101160101.usm",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05a"
	},
	voices = {
		"story_v_out_116011.awb"
	},
	skipMarkers = {
		116011001
	}
}
