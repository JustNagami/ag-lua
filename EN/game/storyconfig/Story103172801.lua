return {
	Play317281001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317281001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317281002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K10f"

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
				local var_4_5 = arg_1_1.bgs_.K10f

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
					if iter_4_0 ~= "K10f" then
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
			local var_4_31 = 1.125

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

				local var_4_33 = arg_1_1:GetWordFromCfg(317281001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 45
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
	Play317281002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317281002
		arg_7_1.duration_ = 5.766

		local var_7_0 = {
			zh = 4.5,
			ja = 5.766
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
				arg_7_0:Play317281003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "2078ui_story"

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

			local var_10_4 = arg_7_1.actors_["2078ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos2078ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.28, -5.6)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos2078ui_story, var_10_8, var_10_7)

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

			local var_10_13 = arg_7_1.actors_["2078ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect2078ui_story == nil then
				arg_7_1.var_.characterEffect2078ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect2078ui_story then
					arg_7_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect2078ui_story then
				arg_7_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.6

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[528].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(317281002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281002", "story_v_out_317281.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_317281", "317281002", "story_v_out_317281.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_317281", "317281002", "story_v_out_317281.awb")

						arg_7_1:RecordAudio("317281002", var_10_28)
						arg_7_1:RecordAudio("317281002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_317281", "317281002", "story_v_out_317281.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_317281", "317281002", "story_v_out_317281.awb")
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
	Play317281003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317281003
		arg_11_1.duration_ = 5.133

		local var_11_0 = {
			zh = 3.466,
			ja = 5.133
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
				arg_11_0:Play317281004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1093ui_story"

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

			local var_14_4 = arg_11_1.actors_["1093ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1093ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(-0.7, -1.11, -5.88)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1093ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(-0.7, -1.11, -5.88)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1093ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story == nil then
				arg_11_1.var_.characterEffect1093ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1093ui_story then
					arg_11_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1093ui_story then
				arg_11_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_19 = "1015ui_story"

			if arg_11_1.actors_[var_14_19] == nil then
				local var_14_20 = Object.Instantiate(Asset.Load("Char/" .. var_14_19), arg_11_1.stage_.transform)

				var_14_20.name = var_14_19
				var_14_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_19] = var_14_20

				local var_14_21 = var_14_20:GetComponentInChildren(typeof(CharacterEffect))

				var_14_21.enabled = true

				local var_14_22 = GameObjectTools.GetOrAddComponent(var_14_20, typeof(DynamicBoneHelper))

				if var_14_22 then
					var_14_22:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_21.transform, false)

				arg_11_1.var_[var_14_19 .. "Animator"] = var_14_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_19 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_19 .. "LipSync"] = var_14_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_23 = arg_11_1.actors_["1015ui_story"].transform
			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.var_.moveOldPos1015ui_story = var_14_23.localPosition
			end

			local var_14_25 = 0.001

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_25 then
				local var_14_26 = (arg_11_1.time_ - var_14_24) / var_14_25
				local var_14_27 = Vector3.New(0.7, -1.15, -6.2)

				var_14_23.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1015ui_story, var_14_27, var_14_26)

				local var_14_28 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_28.x, var_14_28.y, var_14_28.z)

				local var_14_29 = var_14_23.localEulerAngles

				var_14_29.z = 0
				var_14_29.x = 0
				var_14_23.localEulerAngles = var_14_29
			end

			if arg_11_1.time_ >= var_14_24 + var_14_25 and arg_11_1.time_ < var_14_24 + var_14_25 + arg_14_0 then
				var_14_23.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_14_30 = manager.ui.mainCamera.transform.position - var_14_23.position

				var_14_23.forward = Vector3.New(var_14_30.x, var_14_30.y, var_14_30.z)

				local var_14_31 = var_14_23.localEulerAngles

				var_14_31.z = 0
				var_14_31.x = 0
				var_14_23.localEulerAngles = var_14_31
			end

			local var_14_32 = arg_11_1.actors_["1015ui_story"]
			local var_14_33 = 0

			if var_14_33 < arg_11_1.time_ and arg_11_1.time_ <= var_14_33 + arg_14_0 and arg_11_1.var_.characterEffect1015ui_story == nil then
				arg_11_1.var_.characterEffect1015ui_story = var_14_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_34 = 0.200000002980232

			if var_14_33 <= arg_11_1.time_ and arg_11_1.time_ < var_14_33 + var_14_34 then
				local var_14_35 = (arg_11_1.time_ - var_14_33) / var_14_34

				if arg_11_1.var_.characterEffect1015ui_story then
					local var_14_36 = Mathf.Lerp(0, 0.5, var_14_35)

					arg_11_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1015ui_story.fillRatio = var_14_36
				end
			end

			if arg_11_1.time_ >= var_14_33 + var_14_34 and arg_11_1.time_ < var_14_33 + var_14_34 + arg_14_0 and arg_11_1.var_.characterEffect1015ui_story then
				local var_14_37 = 0.5

				arg_11_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1015ui_story.fillRatio = var_14_37
			end

			local var_14_38 = arg_11_1.actors_["2078ui_story"].transform
			local var_14_39 = 0

			if var_14_39 < arg_11_1.time_ and arg_11_1.time_ <= var_14_39 + arg_14_0 then
				arg_11_1.var_.moveOldPos2078ui_story = var_14_38.localPosition
			end

			local var_14_40 = 0.001

			if var_14_39 <= arg_11_1.time_ and arg_11_1.time_ < var_14_39 + var_14_40 then
				local var_14_41 = (arg_11_1.time_ - var_14_39) / var_14_40
				local var_14_42 = Vector3.New(0, 100, 0)

				var_14_38.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2078ui_story, var_14_42, var_14_41)

				local var_14_43 = manager.ui.mainCamera.transform.position - var_14_38.position

				var_14_38.forward = Vector3.New(var_14_43.x, var_14_43.y, var_14_43.z)

				local var_14_44 = var_14_38.localEulerAngles

				var_14_44.z = 0
				var_14_44.x = 0
				var_14_38.localEulerAngles = var_14_44
			end

			if arg_11_1.time_ >= var_14_39 + var_14_40 and arg_11_1.time_ < var_14_39 + var_14_40 + arg_14_0 then
				var_14_38.localPosition = Vector3.New(0, 100, 0)

				local var_14_45 = manager.ui.mainCamera.transform.position - var_14_38.position

				var_14_38.forward = Vector3.New(var_14_45.x, var_14_45.y, var_14_45.z)

				local var_14_46 = var_14_38.localEulerAngles

				var_14_46.z = 0
				var_14_46.x = 0
				var_14_38.localEulerAngles = var_14_46
			end

			local var_14_47 = arg_11_1.actors_["2078ui_story"]
			local var_14_48 = 0

			if var_14_48 < arg_11_1.time_ and arg_11_1.time_ <= var_14_48 + arg_14_0 and arg_11_1.var_.characterEffect2078ui_story == nil then
				arg_11_1.var_.characterEffect2078ui_story = var_14_47:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_49 = 0.200000002980232

			if var_14_48 <= arg_11_1.time_ and arg_11_1.time_ < var_14_48 + var_14_49 then
				local var_14_50 = (arg_11_1.time_ - var_14_48) / var_14_49

				if arg_11_1.var_.characterEffect2078ui_story then
					local var_14_51 = Mathf.Lerp(0, 0.5, var_14_50)

					arg_11_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_11_1.var_.characterEffect2078ui_story.fillRatio = var_14_51
				end
			end

			if arg_11_1.time_ >= var_14_48 + var_14_49 and arg_11_1.time_ < var_14_48 + var_14_49 + arg_14_0 and arg_11_1.var_.characterEffect2078ui_story then
				local var_14_52 = 0.5

				arg_11_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_11_1.var_.characterEffect2078ui_story.fillRatio = var_14_52
			end

			local var_14_53 = 0

			if var_14_53 < arg_11_1.time_ and arg_11_1.time_ <= var_14_53 + arg_14_0 then
				arg_11_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_14_54 = 0
			local var_14_55 = 0.425

			if var_14_54 < arg_11_1.time_ and arg_11_1.time_ <= var_14_54 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_56 = arg_11_1:FormatText(StoryNameCfg[73].name)

				arg_11_1.leftNameTxt_.text = var_14_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_57 = arg_11_1:GetWordFromCfg(317281003)
				local var_14_58 = arg_11_1:FormatText(var_14_57.content)

				arg_11_1.text_.text = var_14_58

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_59 = 17
				local var_14_60 = utf8.len(var_14_58)
				local var_14_61 = var_14_59 <= 0 and var_14_55 or var_14_55 * (var_14_60 / var_14_59)

				if var_14_61 > 0 and var_14_55 < var_14_61 then
					arg_11_1.talkMaxDuration = var_14_61

					if var_14_61 + var_14_54 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_61 + var_14_54
					end
				end

				arg_11_1.text_.text = var_14_58
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281003", "story_v_out_317281.awb") ~= 0 then
					local var_14_62 = manager.audio:GetVoiceLength("story_v_out_317281", "317281003", "story_v_out_317281.awb") / 1000

					if var_14_62 + var_14_54 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_62 + var_14_54
					end

					if var_14_57.prefab_name ~= "" and arg_11_1.actors_[var_14_57.prefab_name] ~= nil then
						local var_14_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_57.prefab_name].transform, "story_v_out_317281", "317281003", "story_v_out_317281.awb")

						arg_11_1:RecordAudio("317281003", var_14_63)
						arg_11_1:RecordAudio("317281003", var_14_63)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_317281", "317281003", "story_v_out_317281.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_317281", "317281003", "story_v_out_317281.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_64 = math.max(var_14_55, arg_11_1.talkMaxDuration)

			if var_14_54 <= arg_11_1.time_ and arg_11_1.time_ < var_14_54 + var_14_64 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_54) / var_14_64

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_54 + var_14_64 and arg_11_1.time_ < var_14_54 + var_14_64 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play317281004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317281004
		arg_15_1.duration_ = 8.8

		local var_15_0 = {
			zh = 3.7,
			ja = 8.8
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
				arg_15_0:Play317281005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1015ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1015ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0.7, -1.15, -6.2)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1015ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1015ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1015ui_story == nil then
				arg_15_1.var_.characterEffect1015ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1015ui_story then
					arg_15_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1015ui_story then
				arg_15_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_15 = arg_15_1.actors_["1093ui_story"]
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story == nil then
				arg_15_1.var_.characterEffect1093ui_story = var_18_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_17 = 0.200000002980232

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17

				if arg_15_1.var_.characterEffect1093ui_story then
					local var_18_19 = Mathf.Lerp(0, 0.5, var_18_18)

					arg_15_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1093ui_story.fillRatio = var_18_19
				end
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story then
				local var_18_20 = 0.5

				arg_15_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1093ui_story.fillRatio = var_18_20
			end

			local var_18_21 = 0
			local var_18_22 = 0.475

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_23 = arg_15_1:FormatText(StoryNameCfg[479].name)

				arg_15_1.leftNameTxt_.text = var_18_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_24 = arg_15_1:GetWordFromCfg(317281004)
				local var_18_25 = arg_15_1:FormatText(var_18_24.content)

				arg_15_1.text_.text = var_18_25

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_26 = 19
				local var_18_27 = utf8.len(var_18_25)
				local var_18_28 = var_18_26 <= 0 and var_18_22 or var_18_22 * (var_18_27 / var_18_26)

				if var_18_28 > 0 and var_18_22 < var_18_28 then
					arg_15_1.talkMaxDuration = var_18_28

					if var_18_28 + var_18_21 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_28 + var_18_21
					end
				end

				arg_15_1.text_.text = var_18_25
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281004", "story_v_out_317281.awb") ~= 0 then
					local var_18_29 = manager.audio:GetVoiceLength("story_v_out_317281", "317281004", "story_v_out_317281.awb") / 1000

					if var_18_29 + var_18_21 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_29 + var_18_21
					end

					if var_18_24.prefab_name ~= "" and arg_15_1.actors_[var_18_24.prefab_name] ~= nil then
						local var_18_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_24.prefab_name].transform, "story_v_out_317281", "317281004", "story_v_out_317281.awb")

						arg_15_1:RecordAudio("317281004", var_18_30)
						arg_15_1:RecordAudio("317281004", var_18_30)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317281", "317281004", "story_v_out_317281.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317281", "317281004", "story_v_out_317281.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_31 = math.max(var_18_22, arg_15_1.talkMaxDuration)

			if var_18_21 <= arg_15_1.time_ and arg_15_1.time_ < var_18_21 + var_18_31 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_21) / var_18_31

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_21 + var_18_31 and arg_15_1.time_ < var_18_21 + var_18_31 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play317281005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317281005
		arg_19_1.duration_ = 2.966

		local var_19_0 = {
			zh = 2.966,
			ja = 1.999999999999
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
				arg_19_0:Play317281006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1093ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1093ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1093ui_story, var_22_4, var_22_3)

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

			local var_22_9 = arg_19_1.actors_["1015ui_story"].transform
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1.var_.moveOldPos1015ui_story = var_22_9.localPosition
			end

			local var_22_11 = 0.001

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11
				local var_22_13 = Vector3.New(0, 100, 0)

				var_22_9.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1015ui_story, var_22_13, var_22_12)

				local var_22_14 = manager.ui.mainCamera.transform.position - var_22_9.position

				var_22_9.forward = Vector3.New(var_22_14.x, var_22_14.y, var_22_14.z)

				local var_22_15 = var_22_9.localEulerAngles

				var_22_15.z = 0
				var_22_15.x = 0
				var_22_9.localEulerAngles = var_22_15
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 then
				var_22_9.localPosition = Vector3.New(0, 100, 0)

				local var_22_16 = manager.ui.mainCamera.transform.position - var_22_9.position

				var_22_9.forward = Vector3.New(var_22_16.x, var_22_16.y, var_22_16.z)

				local var_22_17 = var_22_9.localEulerAngles

				var_22_17.z = 0
				var_22_17.x = 0
				var_22_9.localEulerAngles = var_22_17
			end

			local var_22_18 = arg_19_1.actors_["2078ui_story"].transform
			local var_22_19 = 0

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.var_.moveOldPos2078ui_story = var_22_18.localPosition
			end

			local var_22_20 = 0.001

			if var_22_19 <= arg_19_1.time_ and arg_19_1.time_ < var_22_19 + var_22_20 then
				local var_22_21 = (arg_19_1.time_ - var_22_19) / var_22_20
				local var_22_22 = Vector3.New(0, -1.28, -5.6)

				var_22_18.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos2078ui_story, var_22_22, var_22_21)

				local var_22_23 = manager.ui.mainCamera.transform.position - var_22_18.position

				var_22_18.forward = Vector3.New(var_22_23.x, var_22_23.y, var_22_23.z)

				local var_22_24 = var_22_18.localEulerAngles

				var_22_24.z = 0
				var_22_24.x = 0
				var_22_18.localEulerAngles = var_22_24
			end

			if arg_19_1.time_ >= var_22_19 + var_22_20 and arg_19_1.time_ < var_22_19 + var_22_20 + arg_22_0 then
				var_22_18.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_22_25 = manager.ui.mainCamera.transform.position - var_22_18.position

				var_22_18.forward = Vector3.New(var_22_25.x, var_22_25.y, var_22_25.z)

				local var_22_26 = var_22_18.localEulerAngles

				var_22_26.z = 0
				var_22_26.x = 0
				var_22_18.localEulerAngles = var_22_26
			end

			local var_22_27 = arg_19_1.actors_["2078ui_story"]
			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 and arg_19_1.var_.characterEffect2078ui_story == nil then
				arg_19_1.var_.characterEffect2078ui_story = var_22_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_29 = 0.200000002980232

			if var_22_28 <= arg_19_1.time_ and arg_19_1.time_ < var_22_28 + var_22_29 then
				local var_22_30 = (arg_19_1.time_ - var_22_28) / var_22_29

				if arg_19_1.var_.characterEffect2078ui_story then
					arg_19_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_28 + var_22_29 and arg_19_1.time_ < var_22_28 + var_22_29 + arg_22_0 and arg_19_1.var_.characterEffect2078ui_story then
				arg_19_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_22_31 = 0

			if var_22_31 < arg_19_1.time_ and arg_19_1.time_ <= var_22_31 + arg_22_0 then
				arg_19_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_22_32 = 0
			local var_22_33 = 0.275

			if var_22_32 < arg_19_1.time_ and arg_19_1.time_ <= var_22_32 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_34 = arg_19_1:FormatText(StoryNameCfg[528].name)

				arg_19_1.leftNameTxt_.text = var_22_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_35 = arg_19_1:GetWordFromCfg(317281005)
				local var_22_36 = arg_19_1:FormatText(var_22_35.content)

				arg_19_1.text_.text = var_22_36

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_37 = 11
				local var_22_38 = utf8.len(var_22_36)
				local var_22_39 = var_22_37 <= 0 and var_22_33 or var_22_33 * (var_22_38 / var_22_37)

				if var_22_39 > 0 and var_22_33 < var_22_39 then
					arg_19_1.talkMaxDuration = var_22_39

					if var_22_39 + var_22_32 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_39 + var_22_32
					end
				end

				arg_19_1.text_.text = var_22_36
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281005", "story_v_out_317281.awb") ~= 0 then
					local var_22_40 = manager.audio:GetVoiceLength("story_v_out_317281", "317281005", "story_v_out_317281.awb") / 1000

					if var_22_40 + var_22_32 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_40 + var_22_32
					end

					if var_22_35.prefab_name ~= "" and arg_19_1.actors_[var_22_35.prefab_name] ~= nil then
						local var_22_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_35.prefab_name].transform, "story_v_out_317281", "317281005", "story_v_out_317281.awb")

						arg_19_1:RecordAudio("317281005", var_22_41)
						arg_19_1:RecordAudio("317281005", var_22_41)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_317281", "317281005", "story_v_out_317281.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_317281", "317281005", "story_v_out_317281.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_42 = math.max(var_22_33, arg_19_1.talkMaxDuration)

			if var_22_32 <= arg_19_1.time_ and arg_19_1.time_ < var_22_32 + var_22_42 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_32) / var_22_42

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_32 + var_22_42 and arg_19_1.time_ < var_22_32 + var_22_42 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317281006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317281006
		arg_23_1.duration_ = 7.533

		local var_23_0 = {
			zh = 7.533,
			ja = 7.233
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
				arg_23_0:Play317281007(arg_23_1)
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

			local var_26_15 = arg_23_1.actors_["1015ui_story"].transform
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.var_.moveOldPos1015ui_story = var_26_15.localPosition
			end

			local var_26_17 = 0.001

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Vector3.New(0, -1.15, -6.2)

				var_26_15.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1015ui_story, var_26_19, var_26_18)

				local var_26_20 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_20.x, var_26_20.y, var_26_20.z)

				local var_26_21 = var_26_15.localEulerAngles

				var_26_21.z = 0
				var_26_21.x = 0
				var_26_15.localEulerAngles = var_26_21
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				var_26_15.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_26_22 = manager.ui.mainCamera.transform.position - var_26_15.position

				var_26_15.forward = Vector3.New(var_26_22.x, var_26_22.y, var_26_22.z)

				local var_26_23 = var_26_15.localEulerAngles

				var_26_23.z = 0
				var_26_23.x = 0
				var_26_15.localEulerAngles = var_26_23
			end

			local var_26_24 = arg_23_1.actors_["1015ui_story"]
			local var_26_25 = 0

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 and arg_23_1.var_.characterEffect1015ui_story == nil then
				arg_23_1.var_.characterEffect1015ui_story = var_26_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_26 = 0.200000002980232

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_26 then
				local var_26_27 = (arg_23_1.time_ - var_26_25) / var_26_26

				if arg_23_1.var_.characterEffect1015ui_story then
					arg_23_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_25 + var_26_26 and arg_23_1.time_ < var_26_25 + var_26_26 + arg_26_0 and arg_23_1.var_.characterEffect1015ui_story then
				arg_23_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_26_28 = 0

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				arg_23_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_30 = 0
			local var_26_31 = 0.95

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_32 = arg_23_1:FormatText(StoryNameCfg[479].name)

				arg_23_1.leftNameTxt_.text = var_26_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_33 = arg_23_1:GetWordFromCfg(317281006)
				local var_26_34 = arg_23_1:FormatText(var_26_33.content)

				arg_23_1.text_.text = var_26_34

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_35 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281006", "story_v_out_317281.awb") ~= 0 then
					local var_26_38 = manager.audio:GetVoiceLength("story_v_out_317281", "317281006", "story_v_out_317281.awb") / 1000

					if var_26_38 + var_26_30 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_38 + var_26_30
					end

					if var_26_33.prefab_name ~= "" and arg_23_1.actors_[var_26_33.prefab_name] ~= nil then
						local var_26_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_33.prefab_name].transform, "story_v_out_317281", "317281006", "story_v_out_317281.awb")

						arg_23_1:RecordAudio("317281006", var_26_39)
						arg_23_1:RecordAudio("317281006", var_26_39)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_317281", "317281006", "story_v_out_317281.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_317281", "317281006", "story_v_out_317281.awb")
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
	Play317281007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317281007
		arg_27_1.duration_ = 2.333

		local var_27_0 = {
			zh = 2.333,
			ja = 1.999999999999
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
				arg_27_0:Play317281008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["2078ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos2078ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, -1.28, -5.6)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos2078ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["2078ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect2078ui_story == nil then
				arg_27_1.var_.characterEffect2078ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect2078ui_story then
					arg_27_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect2078ui_story then
				arg_27_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_30_14 = arg_27_1.actors_["1015ui_story"].transform
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.var_.moveOldPos1015ui_story = var_30_14.localPosition
			end

			local var_30_16 = 0.001

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16
				local var_30_18 = Vector3.New(0, 100, 0)

				var_30_14.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1015ui_story, var_30_18, var_30_17)

				local var_30_19 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_19.x, var_30_19.y, var_30_19.z)

				local var_30_20 = var_30_14.localEulerAngles

				var_30_20.z = 0
				var_30_20.x = 0
				var_30_14.localEulerAngles = var_30_20
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 then
				var_30_14.localPosition = Vector3.New(0, 100, 0)

				local var_30_21 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_21.x, var_30_21.y, var_30_21.z)

				local var_30_22 = var_30_14.localEulerAngles

				var_30_22.z = 0
				var_30_22.x = 0
				var_30_14.localEulerAngles = var_30_22
			end

			local var_30_23 = 0
			local var_30_24 = 0.075

			if var_30_23 < arg_27_1.time_ and arg_27_1.time_ <= var_30_23 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_25 = arg_27_1:FormatText(StoryNameCfg[528].name)

				arg_27_1.leftNameTxt_.text = var_30_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_26 = arg_27_1:GetWordFromCfg(317281007)
				local var_30_27 = arg_27_1:FormatText(var_30_26.content)

				arg_27_1.text_.text = var_30_27

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_28 = 3
				local var_30_29 = utf8.len(var_30_27)
				local var_30_30 = var_30_28 <= 0 and var_30_24 or var_30_24 * (var_30_29 / var_30_28)

				if var_30_30 > 0 and var_30_24 < var_30_30 then
					arg_27_1.talkMaxDuration = var_30_30

					if var_30_30 + var_30_23 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_30 + var_30_23
					end
				end

				arg_27_1.text_.text = var_30_27
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281007", "story_v_out_317281.awb") ~= 0 then
					local var_30_31 = manager.audio:GetVoiceLength("story_v_out_317281", "317281007", "story_v_out_317281.awb") / 1000

					if var_30_31 + var_30_23 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_31 + var_30_23
					end

					if var_30_26.prefab_name ~= "" and arg_27_1.actors_[var_30_26.prefab_name] ~= nil then
						local var_30_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_26.prefab_name].transform, "story_v_out_317281", "317281007", "story_v_out_317281.awb")

						arg_27_1:RecordAudio("317281007", var_30_32)
						arg_27_1:RecordAudio("317281007", var_30_32)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_317281", "317281007", "story_v_out_317281.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_317281", "317281007", "story_v_out_317281.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_33 = math.max(var_30_24, arg_27_1.talkMaxDuration)

			if var_30_23 <= arg_27_1.time_ and arg_27_1.time_ < var_30_23 + var_30_33 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_23) / var_30_33

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_23 + var_30_33 and arg_27_1.time_ < var_30_23 + var_30_33 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play317281008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 317281008
		arg_31_1.duration_ = 12.666

		local var_31_0 = {
			zh = 12.666,
			ja = 9.366
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
				arg_31_0:Play317281009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["2078ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos2078ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos2078ui_story, var_34_4, var_34_3)

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

			local var_34_9 = arg_31_1.actors_["1015ui_story"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos1015ui_story = var_34_9.localPosition
			end

			local var_34_11 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11
				local var_34_13 = Vector3.New(0, -1.15, -6.2)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1015ui_story, var_34_13, var_34_12)

				local var_34_14 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_14.x, var_34_14.y, var_34_14.z)

				local var_34_15 = var_34_9.localEulerAngles

				var_34_15.z = 0
				var_34_15.x = 0
				var_34_9.localEulerAngles = var_34_15
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_9.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_9.localEulerAngles = var_34_17
			end

			local var_34_18 = arg_31_1.actors_["1015ui_story"]
			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 and arg_31_1.var_.characterEffect1015ui_story == nil then
				arg_31_1.var_.characterEffect1015ui_story = var_34_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_20 = 0.200000002980232

			if var_34_19 <= arg_31_1.time_ and arg_31_1.time_ < var_34_19 + var_34_20 then
				local var_34_21 = (arg_31_1.time_ - var_34_19) / var_34_20

				if arg_31_1.var_.characterEffect1015ui_story then
					arg_31_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_19 + var_34_20 and arg_31_1.time_ < var_34_19 + var_34_20 + arg_34_0 and arg_31_1.var_.characterEffect1015ui_story then
				arg_31_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_34_22 = 0

			if var_34_22 < arg_31_1.time_ and arg_31_1.time_ <= var_34_22 + arg_34_0 then
				arg_31_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_34_23 = 0

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 then
				arg_31_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_24 = 0
			local var_34_25 = 1.675

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_26 = arg_31_1:FormatText(StoryNameCfg[479].name)

				arg_31_1.leftNameTxt_.text = var_34_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_27 = arg_31_1:GetWordFromCfg(317281008)
				local var_34_28 = arg_31_1:FormatText(var_34_27.content)

				arg_31_1.text_.text = var_34_28

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_29 = 67
				local var_34_30 = utf8.len(var_34_28)
				local var_34_31 = var_34_29 <= 0 and var_34_25 or var_34_25 * (var_34_30 / var_34_29)

				if var_34_31 > 0 and var_34_25 < var_34_31 then
					arg_31_1.talkMaxDuration = var_34_31

					if var_34_31 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_31 + var_34_24
					end
				end

				arg_31_1.text_.text = var_34_28
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281008", "story_v_out_317281.awb") ~= 0 then
					local var_34_32 = manager.audio:GetVoiceLength("story_v_out_317281", "317281008", "story_v_out_317281.awb") / 1000

					if var_34_32 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_32 + var_34_24
					end

					if var_34_27.prefab_name ~= "" and arg_31_1.actors_[var_34_27.prefab_name] ~= nil then
						local var_34_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_27.prefab_name].transform, "story_v_out_317281", "317281008", "story_v_out_317281.awb")

						arg_31_1:RecordAudio("317281008", var_34_33)
						arg_31_1:RecordAudio("317281008", var_34_33)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_317281", "317281008", "story_v_out_317281.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_317281", "317281008", "story_v_out_317281.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_34 = math.max(var_34_25, arg_31_1.talkMaxDuration)

			if var_34_24 <= arg_31_1.time_ and arg_31_1.time_ < var_34_24 + var_34_34 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_24) / var_34_34

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_24 + var_34_34 and arg_31_1.time_ < var_34_24 + var_34_34 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play317281009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317281009
		arg_35_1.duration_ = 6.733

		local var_35_0 = {
			zh = 6.033,
			ja = 6.733
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
				arg_35_0:Play317281010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["2078ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos2078ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, -1.28, -5.6)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos2078ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["2078ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect2078ui_story == nil then
				arg_35_1.var_.characterEffect2078ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect2078ui_story then
					arg_35_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect2078ui_story then
				arg_35_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("2078ui_story", "StoryTimeline/CharAction/story2078/story2078ction/2078action1_1")
			end

			local var_38_14 = arg_35_1.actors_["1015ui_story"].transform
			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.var_.moveOldPos1015ui_story = var_38_14.localPosition
			end

			local var_38_16 = 0.001

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16
				local var_38_18 = Vector3.New(0, 100, 0)

				var_38_14.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1015ui_story, var_38_18, var_38_17)

				local var_38_19 = manager.ui.mainCamera.transform.position - var_38_14.position

				var_38_14.forward = Vector3.New(var_38_19.x, var_38_19.y, var_38_19.z)

				local var_38_20 = var_38_14.localEulerAngles

				var_38_20.z = 0
				var_38_20.x = 0
				var_38_14.localEulerAngles = var_38_20
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 then
				var_38_14.localPosition = Vector3.New(0, 100, 0)

				local var_38_21 = manager.ui.mainCamera.transform.position - var_38_14.position

				var_38_14.forward = Vector3.New(var_38_21.x, var_38_21.y, var_38_21.z)

				local var_38_22 = var_38_14.localEulerAngles

				var_38_22.z = 0
				var_38_22.x = 0
				var_38_14.localEulerAngles = var_38_22
			end

			local var_38_23 = 0
			local var_38_24 = 0.575

			if var_38_23 < arg_35_1.time_ and arg_35_1.time_ <= var_38_23 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_25 = arg_35_1:FormatText(StoryNameCfg[528].name)

				arg_35_1.leftNameTxt_.text = var_38_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_26 = arg_35_1:GetWordFromCfg(317281009)
				local var_38_27 = arg_35_1:FormatText(var_38_26.content)

				arg_35_1.text_.text = var_38_27

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_28 = 23
				local var_38_29 = utf8.len(var_38_27)
				local var_38_30 = var_38_28 <= 0 and var_38_24 or var_38_24 * (var_38_29 / var_38_28)

				if var_38_30 > 0 and var_38_24 < var_38_30 then
					arg_35_1.talkMaxDuration = var_38_30

					if var_38_30 + var_38_23 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_30 + var_38_23
					end
				end

				arg_35_1.text_.text = var_38_27
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281009", "story_v_out_317281.awb") ~= 0 then
					local var_38_31 = manager.audio:GetVoiceLength("story_v_out_317281", "317281009", "story_v_out_317281.awb") / 1000

					if var_38_31 + var_38_23 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_31 + var_38_23
					end

					if var_38_26.prefab_name ~= "" and arg_35_1.actors_[var_38_26.prefab_name] ~= nil then
						local var_38_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_26.prefab_name].transform, "story_v_out_317281", "317281009", "story_v_out_317281.awb")

						arg_35_1:RecordAudio("317281009", var_38_32)
						arg_35_1:RecordAudio("317281009", var_38_32)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_317281", "317281009", "story_v_out_317281.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_317281", "317281009", "story_v_out_317281.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_33 = math.max(var_38_24, arg_35_1.talkMaxDuration)

			if var_38_23 <= arg_35_1.time_ and arg_35_1.time_ < var_38_23 + var_38_33 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_23) / var_38_33

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_23 + var_38_33 and arg_35_1.time_ < var_38_23 + var_38_33 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play317281010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317281010
		arg_39_1.duration_ = 6.3

		local var_39_0 = {
			zh = 6.3,
			ja = 4.233
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
				arg_39_0:Play317281011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["2078ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos2078ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos2078ui_story, var_42_4, var_42_3)

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

			local var_42_9 = arg_39_1.actors_["2078ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect2078ui_story == nil then
				arg_39_1.var_.characterEffect2078ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect2078ui_story then
					local var_42_13 = Mathf.Lerp(0, 0.5, var_42_12)

					arg_39_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_39_1.var_.characterEffect2078ui_story.fillRatio = var_42_13
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect2078ui_story then
				local var_42_14 = 0.5

				arg_39_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_39_1.var_.characterEffect2078ui_story.fillRatio = var_42_14
			end

			local var_42_15 = arg_39_1.actors_["1015ui_story"].transform
			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.var_.moveOldPos1015ui_story = var_42_15.localPosition
			end

			local var_42_17 = 0.001

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / var_42_17
				local var_42_19 = Vector3.New(0, -1.15, -6.2)

				var_42_15.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1015ui_story, var_42_19, var_42_18)

				local var_42_20 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_20.x, var_42_20.y, var_42_20.z)

				local var_42_21 = var_42_15.localEulerAngles

				var_42_21.z = 0
				var_42_21.x = 0
				var_42_15.localEulerAngles = var_42_21
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 then
				var_42_15.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_42_22 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_22.x, var_42_22.y, var_42_22.z)

				local var_42_23 = var_42_15.localEulerAngles

				var_42_23.z = 0
				var_42_23.x = 0
				var_42_15.localEulerAngles = var_42_23
			end

			local var_42_24 = arg_39_1.actors_["1015ui_story"]
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 and arg_39_1.var_.characterEffect1015ui_story == nil then
				arg_39_1.var_.characterEffect1015ui_story = var_42_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_26 = 0.200000002980232

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26

				if arg_39_1.var_.characterEffect1015ui_story then
					arg_39_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 and arg_39_1.var_.characterEffect1015ui_story then
				arg_39_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_42_28 = 0

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_42_29 = 0

			if var_42_29 < arg_39_1.time_ and arg_39_1.time_ <= var_42_29 + arg_42_0 then
				arg_39_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_30 = 0
			local var_42_31 = 0.7

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[479].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(317281010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 28
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281010", "story_v_out_317281.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_317281", "317281010", "story_v_out_317281.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_317281", "317281010", "story_v_out_317281.awb")

						arg_39_1:RecordAudio("317281010", var_42_39)
						arg_39_1:RecordAudio("317281010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_317281", "317281010", "story_v_out_317281.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_317281", "317281010", "story_v_out_317281.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_40 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_40 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_30) / var_42_40

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_30 + var_42_40 and arg_39_1.time_ < var_42_30 + var_42_40 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play317281011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 317281011
		arg_43_1.duration_ = 2.966

		local var_43_0 = {
			zh = 2.833,
			ja = 2.966
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
				arg_43_0:Play317281012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.35

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[479].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(317281011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281011", "story_v_out_317281.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_317281", "317281011", "story_v_out_317281.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_317281", "317281011", "story_v_out_317281.awb")

						arg_43_1:RecordAudio("317281011", var_46_9)
						arg_43_1:RecordAudio("317281011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_317281", "317281011", "story_v_out_317281.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_317281", "317281011", "story_v_out_317281.awb")
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
	Play317281012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 317281012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play317281013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1015ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1015ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, 100, 0)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1015ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, 100, 0)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = 0
			local var_50_10 = 1.05

			if var_50_9 < arg_47_1.time_ and arg_47_1.time_ <= var_50_9 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_11 = arg_47_1:GetWordFromCfg(317281012)
				local var_50_12 = arg_47_1:FormatText(var_50_11.content)

				arg_47_1.text_.text = var_50_12

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_13 = 42
				local var_50_14 = utf8.len(var_50_12)
				local var_50_15 = var_50_13 <= 0 and var_50_10 or var_50_10 * (var_50_14 / var_50_13)

				if var_50_15 > 0 and var_50_10 < var_50_15 then
					arg_47_1.talkMaxDuration = var_50_15

					if var_50_15 + var_50_9 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_15 + var_50_9
					end
				end

				arg_47_1.text_.text = var_50_12
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_10, arg_47_1.talkMaxDuration)

			if var_50_9 <= arg_47_1.time_ and arg_47_1.time_ < var_50_9 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_9) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_9 + var_50_16 and arg_47_1.time_ < var_50_9 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play317281013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317281013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play317281014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.925

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(317281013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 37
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_8 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_8 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_8

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_8 and arg_51_1.time_ < var_54_0 + var_54_8 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play317281014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317281014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play317281015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.375

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[7].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(317281014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 55
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
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_8 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_8 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_8

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_8 and arg_55_1.time_ < var_58_0 + var_58_8 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play317281015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 317281015
		arg_59_1.duration_ = 5.233

		local var_59_0 = {
			zh = 4.533,
			ja = 5.233
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
				arg_59_0:Play317281016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1015ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1015ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0, -1.15, -6.2)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1015ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["1015ui_story"]
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story == nil then
				arg_59_1.var_.characterEffect1015ui_story = var_62_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_11 = 0.200000002980232

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11

				if arg_59_1.var_.characterEffect1015ui_story then
					arg_59_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story then
				arg_59_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_15 = 0
			local var_62_16 = 0.425

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_17 = arg_59_1:FormatText(StoryNameCfg[479].name)

				arg_59_1.leftNameTxt_.text = var_62_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_18 = arg_59_1:GetWordFromCfg(317281015)
				local var_62_19 = arg_59_1:FormatText(var_62_18.content)

				arg_59_1.text_.text = var_62_19

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_20 = 17
				local var_62_21 = utf8.len(var_62_19)
				local var_62_22 = var_62_20 <= 0 and var_62_16 or var_62_16 * (var_62_21 / var_62_20)

				if var_62_22 > 0 and var_62_16 < var_62_22 then
					arg_59_1.talkMaxDuration = var_62_22

					if var_62_22 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_22 + var_62_15
					end
				end

				arg_59_1.text_.text = var_62_19
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281015", "story_v_out_317281.awb") ~= 0 then
					local var_62_23 = manager.audio:GetVoiceLength("story_v_out_317281", "317281015", "story_v_out_317281.awb") / 1000

					if var_62_23 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_23 + var_62_15
					end

					if var_62_18.prefab_name ~= "" and arg_59_1.actors_[var_62_18.prefab_name] ~= nil then
						local var_62_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_18.prefab_name].transform, "story_v_out_317281", "317281015", "story_v_out_317281.awb")

						arg_59_1:RecordAudio("317281015", var_62_24)
						arg_59_1:RecordAudio("317281015", var_62_24)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_317281", "317281015", "story_v_out_317281.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_317281", "317281015", "story_v_out_317281.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_25 = math.max(var_62_16, arg_59_1.talkMaxDuration)

			if var_62_15 <= arg_59_1.time_ and arg_59_1.time_ < var_62_15 + var_62_25 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_15) / var_62_25

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_15 + var_62_25 and arg_59_1.time_ < var_62_15 + var_62_25 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play317281016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317281016
		arg_63_1.duration_ = 4.266

		local var_63_0 = {
			zh = 4.266,
			ja = 1.999999999999
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
				arg_63_0:Play317281017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1015ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1015ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, 100, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1015ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, 100, 0)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["2078ui_story"].transform
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.var_.moveOldPos2078ui_story = var_66_9.localPosition
			end

			local var_66_11 = 0.001

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11
				local var_66_13 = Vector3.New(0.7, -1.28, -5.6)

				var_66_9.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2078ui_story, var_66_13, var_66_12)

				local var_66_14 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_14.x, var_66_14.y, var_66_14.z)

				local var_66_15 = var_66_9.localEulerAngles

				var_66_15.z = 0
				var_66_15.x = 0
				var_66_9.localEulerAngles = var_66_15
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 then
				var_66_9.localPosition = Vector3.New(0.7, -1.28, -5.6)

				local var_66_16 = manager.ui.mainCamera.transform.position - var_66_9.position

				var_66_9.forward = Vector3.New(var_66_16.x, var_66_16.y, var_66_16.z)

				local var_66_17 = var_66_9.localEulerAngles

				var_66_17.z = 0
				var_66_17.x = 0
				var_66_9.localEulerAngles = var_66_17
			end

			local var_66_18 = "2079ui_story"

			if arg_63_1.actors_[var_66_18] == nil then
				local var_66_19 = Object.Instantiate(Asset.Load("Char/" .. var_66_18), arg_63_1.stage_.transform)

				var_66_19.name = var_66_18
				var_66_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.actors_[var_66_18] = var_66_19

				local var_66_20 = var_66_19:GetComponentInChildren(typeof(CharacterEffect))

				var_66_20.enabled = true

				local var_66_21 = GameObjectTools.GetOrAddComponent(var_66_19, typeof(DynamicBoneHelper))

				if var_66_21 then
					var_66_21:EnableDynamicBone(false)
				end

				arg_63_1:ShowWeapon(var_66_20.transform, false)

				arg_63_1.var_[var_66_18 .. "Animator"] = var_66_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_63_1.var_[var_66_18 .. "Animator"].applyRootMotion = true
				arg_63_1.var_[var_66_18 .. "LipSync"] = var_66_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_66_22 = arg_63_1.actors_["2079ui_story"]
			local var_66_23 = 0

			if var_66_23 < arg_63_1.time_ and arg_63_1.time_ <= var_66_23 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story == nil then
				arg_63_1.var_.characterEffect2079ui_story = var_66_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_24 = 0.200000002980232

			if var_66_23 <= arg_63_1.time_ and arg_63_1.time_ < var_66_23 + var_66_24 then
				local var_66_25 = (arg_63_1.time_ - var_66_23) / var_66_24

				if arg_63_1.var_.characterEffect2079ui_story then
					arg_63_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_23 + var_66_24 and arg_63_1.time_ < var_66_23 + var_66_24 + arg_66_0 and arg_63_1.var_.characterEffect2079ui_story then
				arg_63_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_66_26 = 0

			if var_66_26 < arg_63_1.time_ and arg_63_1.time_ <= var_66_26 + arg_66_0 then
				arg_63_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_66_27 = arg_63_1.actors_["2079ui_story"].transform
			local var_66_28 = 0

			if var_66_28 < arg_63_1.time_ and arg_63_1.time_ <= var_66_28 + arg_66_0 then
				arg_63_1.var_.moveOldPos2079ui_story = var_66_27.localPosition
			end

			local var_66_29 = 0.001

			if var_66_28 <= arg_63_1.time_ and arg_63_1.time_ < var_66_28 + var_66_29 then
				local var_66_30 = (arg_63_1.time_ - var_66_28) / var_66_29
				local var_66_31 = Vector3.New(-0.7, -1.28, -5.6)

				var_66_27.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos2079ui_story, var_66_31, var_66_30)

				local var_66_32 = manager.ui.mainCamera.transform.position - var_66_27.position

				var_66_27.forward = Vector3.New(var_66_32.x, var_66_32.y, var_66_32.z)

				local var_66_33 = var_66_27.localEulerAngles

				var_66_33.z = 0
				var_66_33.x = 0
				var_66_27.localEulerAngles = var_66_33
			end

			if arg_63_1.time_ >= var_66_28 + var_66_29 and arg_63_1.time_ < var_66_28 + var_66_29 + arg_66_0 then
				var_66_27.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_66_34 = manager.ui.mainCamera.transform.position - var_66_27.position

				var_66_27.forward = Vector3.New(var_66_34.x, var_66_34.y, var_66_34.z)

				local var_66_35 = var_66_27.localEulerAngles

				var_66_35.z = 0
				var_66_35.x = 0
				var_66_27.localEulerAngles = var_66_35
			end

			local var_66_36 = arg_63_1.actors_["2078ui_story"]
			local var_66_37 = 0

			if var_66_37 < arg_63_1.time_ and arg_63_1.time_ <= var_66_37 + arg_66_0 and arg_63_1.var_.characterEffect2078ui_story == nil then
				arg_63_1.var_.characterEffect2078ui_story = var_66_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_38 = 0.0166666666666667

			if var_66_37 <= arg_63_1.time_ and arg_63_1.time_ < var_66_37 + var_66_38 then
				local var_66_39 = (arg_63_1.time_ - var_66_37) / var_66_38

				if arg_63_1.var_.characterEffect2078ui_story then
					local var_66_40 = Mathf.Lerp(0, 0.5, var_66_39)

					arg_63_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_63_1.var_.characterEffect2078ui_story.fillRatio = var_66_40
				end
			end

			if arg_63_1.time_ >= var_66_37 + var_66_38 and arg_63_1.time_ < var_66_37 + var_66_38 + arg_66_0 and arg_63_1.var_.characterEffect2078ui_story then
				local var_66_41 = 0.5

				arg_63_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_63_1.var_.characterEffect2078ui_story.fillRatio = var_66_41
			end

			local var_66_42 = 0
			local var_66_43 = 0.4

			if var_66_42 < arg_63_1.time_ and arg_63_1.time_ <= var_66_42 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_44 = arg_63_1:FormatText(StoryNameCfg[530].name)

				arg_63_1.leftNameTxt_.text = var_66_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_45 = arg_63_1:GetWordFromCfg(317281016)
				local var_66_46 = arg_63_1:FormatText(var_66_45.content)

				arg_63_1.text_.text = var_66_46

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_47 = 16
				local var_66_48 = utf8.len(var_66_46)
				local var_66_49 = var_66_47 <= 0 and var_66_43 or var_66_43 * (var_66_48 / var_66_47)

				if var_66_49 > 0 and var_66_43 < var_66_49 then
					arg_63_1.talkMaxDuration = var_66_49

					if var_66_49 + var_66_42 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_49 + var_66_42
					end
				end

				arg_63_1.text_.text = var_66_46
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281016", "story_v_out_317281.awb") ~= 0 then
					local var_66_50 = manager.audio:GetVoiceLength("story_v_out_317281", "317281016", "story_v_out_317281.awb") / 1000

					if var_66_50 + var_66_42 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_50 + var_66_42
					end

					if var_66_45.prefab_name ~= "" and arg_63_1.actors_[var_66_45.prefab_name] ~= nil then
						local var_66_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_45.prefab_name].transform, "story_v_out_317281", "317281016", "story_v_out_317281.awb")

						arg_63_1:RecordAudio("317281016", var_66_51)
						arg_63_1:RecordAudio("317281016", var_66_51)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317281", "317281016", "story_v_out_317281.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317281", "317281016", "story_v_out_317281.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_52 = math.max(var_66_43, arg_63_1.talkMaxDuration)

			if var_66_42 <= arg_63_1.time_ and arg_63_1.time_ < var_66_42 + var_66_52 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_42) / var_66_52

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_42 + var_66_52 and arg_63_1.time_ < var_66_42 + var_66_52 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play317281017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317281017
		arg_67_1.duration_ = 4.133

		local var_67_0 = {
			zh = 1.999999999999,
			ja = 4.133
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
				arg_67_0:Play317281018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["2079ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos2079ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(-0.7, -1.28, -5.6)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos2079ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(-0.7, -1.28, -5.6)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["2079ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect2079ui_story == nil then
				arg_67_1.var_.characterEffect2079ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect2079ui_story then
					local var_70_13 = Mathf.Lerp(0, 0.5, var_70_12)

					arg_67_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_67_1.var_.characterEffect2079ui_story.fillRatio = var_70_13
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect2079ui_story then
				local var_70_14 = 0.5

				arg_67_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_67_1.var_.characterEffect2079ui_story.fillRatio = var_70_14
			end

			local var_70_15 = 0

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				arg_67_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_70_16 = arg_67_1.actors_["2078ui_story"]
			local var_70_17 = 0

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 and arg_67_1.var_.characterEffect2078ui_story == nil then
				arg_67_1.var_.characterEffect2078ui_story = var_70_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_18 = 0.200000002980232

			if var_70_17 <= arg_67_1.time_ and arg_67_1.time_ < var_70_17 + var_70_18 then
				local var_70_19 = (arg_67_1.time_ - var_70_17) / var_70_18

				if arg_67_1.var_.characterEffect2078ui_story then
					arg_67_1.var_.characterEffect2078ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_17 + var_70_18 and arg_67_1.time_ < var_70_17 + var_70_18 + arg_70_0 and arg_67_1.var_.characterEffect2078ui_story then
				arg_67_1.var_.characterEffect2078ui_story.fillFlat = false
			end

			local var_70_20 = 0
			local var_70_21 = 0.25

			if var_70_20 < arg_67_1.time_ and arg_67_1.time_ <= var_70_20 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_22 = arg_67_1:FormatText(StoryNameCfg[529].name)

				arg_67_1.leftNameTxt_.text = var_70_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_23 = arg_67_1:GetWordFromCfg(317281017)
				local var_70_24 = arg_67_1:FormatText(var_70_23.content)

				arg_67_1.text_.text = var_70_24

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_25 = 10
				local var_70_26 = utf8.len(var_70_24)
				local var_70_27 = var_70_25 <= 0 and var_70_21 or var_70_21 * (var_70_26 / var_70_25)

				if var_70_27 > 0 and var_70_21 < var_70_27 then
					arg_67_1.talkMaxDuration = var_70_27

					if var_70_27 + var_70_20 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_20
					end
				end

				arg_67_1.text_.text = var_70_24
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281017", "story_v_out_317281.awb") ~= 0 then
					local var_70_28 = manager.audio:GetVoiceLength("story_v_out_317281", "317281017", "story_v_out_317281.awb") / 1000

					if var_70_28 + var_70_20 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_28 + var_70_20
					end

					if var_70_23.prefab_name ~= "" and arg_67_1.actors_[var_70_23.prefab_name] ~= nil then
						local var_70_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_23.prefab_name].transform, "story_v_out_317281", "317281017", "story_v_out_317281.awb")

						arg_67_1:RecordAudio("317281017", var_70_29)
						arg_67_1:RecordAudio("317281017", var_70_29)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_317281", "317281017", "story_v_out_317281.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_317281", "317281017", "story_v_out_317281.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_30 = math.max(var_70_21, arg_67_1.talkMaxDuration)

			if var_70_20 <= arg_67_1.time_ and arg_67_1.time_ < var_70_20 + var_70_30 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_20) / var_70_30

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_20 + var_70_30 and arg_67_1.time_ < var_70_20 + var_70_30 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317281018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317281018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play317281019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["2078ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos2078ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, 100, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos2078ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, 100, 0)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["2078ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect2078ui_story == nil then
				arg_71_1.var_.characterEffect2078ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect2078ui_story then
					local var_74_13 = Mathf.Lerp(0, 0.5, var_74_12)

					arg_71_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_71_1.var_.characterEffect2078ui_story.fillRatio = var_74_13
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect2078ui_story then
				local var_74_14 = 0.5

				arg_71_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_71_1.var_.characterEffect2078ui_story.fillRatio = var_74_14
			end

			local var_74_15 = arg_71_1.actors_["2079ui_story"].transform
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.var_.moveOldPos2079ui_story = var_74_15.localPosition
			end

			local var_74_17 = 0.001

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17
				local var_74_19 = Vector3.New(0, 100, 0)

				var_74_15.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos2079ui_story, var_74_19, var_74_18)

				local var_74_20 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_20.x, var_74_20.y, var_74_20.z)

				local var_74_21 = var_74_15.localEulerAngles

				var_74_21.z = 0
				var_74_21.x = 0
				var_74_15.localEulerAngles = var_74_21
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 then
				var_74_15.localPosition = Vector3.New(0, 100, 0)

				local var_74_22 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_22.x, var_74_22.y, var_74_22.z)

				local var_74_23 = var_74_15.localEulerAngles

				var_74_23.z = 0
				var_74_23.x = 0
				var_74_15.localEulerAngles = var_74_23
			end

			local var_74_24 = arg_71_1.actors_["2079ui_story"]
			local var_74_25 = 0

			if var_74_25 < arg_71_1.time_ and arg_71_1.time_ <= var_74_25 + arg_74_0 and arg_71_1.var_.characterEffect2079ui_story == nil then
				arg_71_1.var_.characterEffect2079ui_story = var_74_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_26 = 0.200000002980232

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_26 then
				local var_74_27 = (arg_71_1.time_ - var_74_25) / var_74_26

				if arg_71_1.var_.characterEffect2079ui_story then
					local var_74_28 = Mathf.Lerp(0, 0.5, var_74_27)

					arg_71_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_71_1.var_.characterEffect2079ui_story.fillRatio = var_74_28
				end
			end

			if arg_71_1.time_ >= var_74_25 + var_74_26 and arg_71_1.time_ < var_74_25 + var_74_26 + arg_74_0 and arg_71_1.var_.characterEffect2079ui_story then
				local var_74_29 = 0.5

				arg_71_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_71_1.var_.characterEffect2079ui_story.fillRatio = var_74_29
			end

			local var_74_30 = 0
			local var_74_31 = 1.1

			if var_74_30 < arg_71_1.time_ and arg_71_1.time_ <= var_74_30 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_32 = arg_71_1:GetWordFromCfg(317281018)
				local var_74_33 = arg_71_1:FormatText(var_74_32.content)

				arg_71_1.text_.text = var_74_33

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_34 = 44
				local var_74_35 = utf8.len(var_74_33)
				local var_74_36 = var_74_34 <= 0 and var_74_31 or var_74_31 * (var_74_35 / var_74_34)

				if var_74_36 > 0 and var_74_31 < var_74_36 then
					arg_71_1.talkMaxDuration = var_74_36

					if var_74_36 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_36 + var_74_30
					end
				end

				arg_71_1.text_.text = var_74_33
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_37 = math.max(var_74_31, arg_71_1.talkMaxDuration)

			if var_74_30 <= arg_71_1.time_ and arg_71_1.time_ < var_74_30 + var_74_37 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_30) / var_74_37

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_30 + var_74_37 and arg_71_1.time_ < var_74_30 + var_74_37 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317281019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 317281019
		arg_75_1.duration_ = 4

		local var_75_0 = {
			zh = 4,
			ja = 3.9
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
				arg_75_0:Play317281020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["2079ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos2079ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, -1.28, -5.6)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos2079ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["2079ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect2079ui_story == nil then
				arg_75_1.var_.characterEffect2079ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect2079ui_story then
					arg_75_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect2079ui_story then
				arg_75_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_78_14 = 0
			local var_78_15 = 0.5

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_16 = arg_75_1:FormatText(StoryNameCfg[530].name)

				arg_75_1.leftNameTxt_.text = var_78_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_17 = arg_75_1:GetWordFromCfg(317281019)
				local var_78_18 = arg_75_1:FormatText(var_78_17.content)

				arg_75_1.text_.text = var_78_18

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_19 = 20
				local var_78_20 = utf8.len(var_78_18)
				local var_78_21 = var_78_19 <= 0 and var_78_15 or var_78_15 * (var_78_20 / var_78_19)

				if var_78_21 > 0 and var_78_15 < var_78_21 then
					arg_75_1.talkMaxDuration = var_78_21

					if var_78_21 + var_78_14 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_21 + var_78_14
					end
				end

				arg_75_1.text_.text = var_78_18
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281019", "story_v_out_317281.awb") ~= 0 then
					local var_78_22 = manager.audio:GetVoiceLength("story_v_out_317281", "317281019", "story_v_out_317281.awb") / 1000

					if var_78_22 + var_78_14 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_22 + var_78_14
					end

					if var_78_17.prefab_name ~= "" and arg_75_1.actors_[var_78_17.prefab_name] ~= nil then
						local var_78_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_17.prefab_name].transform, "story_v_out_317281", "317281019", "story_v_out_317281.awb")

						arg_75_1:RecordAudio("317281019", var_78_23)
						arg_75_1:RecordAudio("317281019", var_78_23)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_317281", "317281019", "story_v_out_317281.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_317281", "317281019", "story_v_out_317281.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_24 = math.max(var_78_15, arg_75_1.talkMaxDuration)

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_24 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_14) / var_78_24

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_14 + var_78_24 and arg_75_1.time_ < var_78_14 + var_78_24 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play317281020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317281020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play317281021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["2079ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos2079ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos2079ui_story, var_82_4, var_82_3)

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

			local var_82_9 = arg_79_1.actors_["2078ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect2078ui_story == nil then
				arg_79_1.var_.characterEffect2078ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect2078ui_story then
					local var_82_13 = Mathf.Lerp(0, 0.5, var_82_12)

					arg_79_1.var_.characterEffect2078ui_story.fillFlat = true
					arg_79_1.var_.characterEffect2078ui_story.fillRatio = var_82_13
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect2078ui_story then
				local var_82_14 = 0.5

				arg_79_1.var_.characterEffect2078ui_story.fillFlat = true
				arg_79_1.var_.characterEffect2078ui_story.fillRatio = var_82_14
			end

			local var_82_15 = 0
			local var_82_16 = 0.975

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_17 = arg_79_1:GetWordFromCfg(317281020)
				local var_82_18 = arg_79_1:FormatText(var_82_17.content)

				arg_79_1.text_.text = var_82_18

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_19 = 39
				local var_82_20 = utf8.len(var_82_18)
				local var_82_21 = var_82_19 <= 0 and var_82_16 or var_82_16 * (var_82_20 / var_82_19)

				if var_82_21 > 0 and var_82_16 < var_82_21 then
					arg_79_1.talkMaxDuration = var_82_21

					if var_82_21 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_18
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_22 and arg_79_1.time_ < var_82_15 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play317281021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 317281021
		arg_83_1.duration_ = 6

		local var_83_0 = {
			zh = 2.733,
			ja = 6
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
				arg_83_0:Play317281022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1093ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1093ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, -1.11, -5.88)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1093ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1093ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story == nil then
				arg_83_1.var_.characterEffect1093ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1093ui_story then
					arg_83_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1093ui_story then
				arg_83_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_86_15 = 0
			local var_86_16 = 0.325

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[73].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(317281021)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 13
				local var_86_21 = utf8.len(var_86_19)
				local var_86_22 = var_86_20 <= 0 and var_86_16 or var_86_16 * (var_86_21 / var_86_20)

				if var_86_22 > 0 and var_86_16 < var_86_22 then
					arg_83_1.talkMaxDuration = var_86_22

					if var_86_22 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_19
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281021", "story_v_out_317281.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_317281", "317281021", "story_v_out_317281.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_317281", "317281021", "story_v_out_317281.awb")

						arg_83_1:RecordAudio("317281021", var_86_24)
						arg_83_1:RecordAudio("317281021", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_317281", "317281021", "story_v_out_317281.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_317281", "317281021", "story_v_out_317281.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_25 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_25 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_25

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_25 and arg_83_1.time_ < var_86_15 + var_86_25 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play317281022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 317281022
		arg_87_1.duration_ = 7.133

		local var_87_0 = {
			zh = 5.766,
			ja = 7.133
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
			arg_87_1.auto_ = false
		end

		function arg_87_1.playNext_(arg_89_0)
			arg_87_1.onStoryFinished_()
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1093ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1093ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1093ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, 100, 0)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1093ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect1093ui_story == nil then
				arg_87_1.var_.characterEffect1093ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect1093ui_story then
					local var_90_13 = Mathf.Lerp(0, 0.5, var_90_12)

					arg_87_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1093ui_story.fillRatio = var_90_13
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect1093ui_story then
				local var_90_14 = 0.5

				arg_87_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1093ui_story.fillRatio = var_90_14
			end

			local var_90_15 = "1199ui_story"

			if arg_87_1.actors_[var_90_15] == nil then
				local var_90_16 = Object.Instantiate(Asset.Load("Char/" .. var_90_15), arg_87_1.stage_.transform)

				var_90_16.name = var_90_15
				var_90_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_87_1.actors_[var_90_15] = var_90_16

				local var_90_17 = var_90_16:GetComponentInChildren(typeof(CharacterEffect))

				var_90_17.enabled = true

				local var_90_18 = GameObjectTools.GetOrAddComponent(var_90_16, typeof(DynamicBoneHelper))

				if var_90_18 then
					var_90_18:EnableDynamicBone(false)
				end

				arg_87_1:ShowWeapon(var_90_17.transform, false)

				arg_87_1.var_[var_90_15 .. "Animator"] = var_90_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_87_1.var_[var_90_15 .. "Animator"].applyRootMotion = true
				arg_87_1.var_[var_90_15 .. "LipSync"] = var_90_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_90_19 = arg_87_1.actors_["1199ui_story"].transform
			local var_90_20 = 0

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.var_.moveOldPos1199ui_story = var_90_19.localPosition
			end

			local var_90_21 = 0.001

			if var_90_20 <= arg_87_1.time_ and arg_87_1.time_ < var_90_20 + var_90_21 then
				local var_90_22 = (arg_87_1.time_ - var_90_20) / var_90_21
				local var_90_23 = Vector3.New(0, -1.08, -5.9)

				var_90_19.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1199ui_story, var_90_23, var_90_22)

				local var_90_24 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_24.x, var_90_24.y, var_90_24.z)

				local var_90_25 = var_90_19.localEulerAngles

				var_90_25.z = 0
				var_90_25.x = 0
				var_90_19.localEulerAngles = var_90_25
			end

			if arg_87_1.time_ >= var_90_20 + var_90_21 and arg_87_1.time_ < var_90_20 + var_90_21 + arg_90_0 then
				var_90_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_90_26 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_26.x, var_90_26.y, var_90_26.z)

				local var_90_27 = var_90_19.localEulerAngles

				var_90_27.z = 0
				var_90_27.x = 0
				var_90_19.localEulerAngles = var_90_27
			end

			local var_90_28 = arg_87_1.actors_["1199ui_story"]
			local var_90_29 = 0

			if var_90_29 < arg_87_1.time_ and arg_87_1.time_ <= var_90_29 + arg_90_0 and arg_87_1.var_.characterEffect1199ui_story == nil then
				arg_87_1.var_.characterEffect1199ui_story = var_90_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_30 = 0.200000002980232

			if var_90_29 <= arg_87_1.time_ and arg_87_1.time_ < var_90_29 + var_90_30 then
				local var_90_31 = (arg_87_1.time_ - var_90_29) / var_90_30

				if arg_87_1.var_.characterEffect1199ui_story then
					arg_87_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_29 + var_90_30 and arg_87_1.time_ < var_90_29 + var_90_30 + arg_90_0 and arg_87_1.var_.characterEffect1199ui_story then
				arg_87_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_90_32 = 0

			if var_90_32 < arg_87_1.time_ and arg_87_1.time_ <= var_90_32 + arg_90_0 then
				arg_87_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_90_33 = 0

			if var_90_33 < arg_87_1.time_ and arg_87_1.time_ <= var_90_33 + arg_90_0 then
				arg_87_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_90_34 = 0
			local var_90_35 = 0.8

			if var_90_34 < arg_87_1.time_ and arg_87_1.time_ <= var_90_34 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_36 = arg_87_1:FormatText(StoryNameCfg[84].name)

				arg_87_1.leftNameTxt_.text = var_90_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_37 = arg_87_1:GetWordFromCfg(317281022)
				local var_90_38 = arg_87_1:FormatText(var_90_37.content)

				arg_87_1.text_.text = var_90_38

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_39 = 34
				local var_90_40 = utf8.len(var_90_38)
				local var_90_41 = var_90_39 <= 0 and var_90_35 or var_90_35 * (var_90_40 / var_90_39)

				if var_90_41 > 0 and var_90_35 < var_90_41 then
					arg_87_1.talkMaxDuration = var_90_41

					if var_90_41 + var_90_34 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_41 + var_90_34
					end
				end

				arg_87_1.text_.text = var_90_38
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317281", "317281022", "story_v_out_317281.awb") ~= 0 then
					local var_90_42 = manager.audio:GetVoiceLength("story_v_out_317281", "317281022", "story_v_out_317281.awb") / 1000

					if var_90_42 + var_90_34 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_42 + var_90_34
					end

					if var_90_37.prefab_name ~= "" and arg_87_1.actors_[var_90_37.prefab_name] ~= nil then
						local var_90_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_37.prefab_name].transform, "story_v_out_317281", "317281022", "story_v_out_317281.awb")

						arg_87_1:RecordAudio("317281022", var_90_43)
						arg_87_1:RecordAudio("317281022", var_90_43)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_317281", "317281022", "story_v_out_317281.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_317281", "317281022", "story_v_out_317281.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_44 = math.max(var_90_35, arg_87_1.talkMaxDuration)

			if var_90_34 <= arg_87_1.time_ and arg_87_1.time_ < var_90_34 + var_90_44 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_34) / var_90_44

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_34 + var_90_44 and arg_87_1.time_ < var_90_34 + var_90_44 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K10f"
	},
	voices = {
		"story_v_out_317281.awb"
	}
}
