return {
	Play317181001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317181001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317181002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST58"

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
				local var_4_5 = arg_1_1.bgs_.ST58

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
					if iter_4_0 ~= "ST58" then
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

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_6_story_sasanami_quiet", "bgm_activity_2_6_story_sasanami_quiet", "bgm_activity_2_6_story_sasanami_quiet")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.575

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

				local var_4_33 = arg_1_1:GetWordFromCfg(317181001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 23
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
	Play317181002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317181002
		arg_7_1.duration_ = 10.4

		local var_7_0 = {
			zh = 7.666,
			ja = 10.4
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
				arg_7_0:Play317181003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1058ui_story"

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

			local var_10_4 = arg_7_1.actors_["1058ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1058ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(-0.7, -0.95, -5.88)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1058ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1058ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1058ui_story == nil then
				arg_7_1.var_.characterEffect1058ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1058ui_story then
					arg_7_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1058ui_story then
				arg_7_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.5

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[92].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(317181002)
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

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181002", "story_v_out_317181.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_317181", "317181002", "story_v_out_317181.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_317181", "317181002", "story_v_out_317181.awb")

						arg_7_1:RecordAudio("317181002", var_10_28)
						arg_7_1:RecordAudio("317181002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_317181", "317181002", "story_v_out_317181.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_317181", "317181002", "story_v_out_317181.awb")
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
	Play317181003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317181003
		arg_11_1.duration_ = 10.9

		local var_11_0 = {
			zh = 4.533,
			ja = 10.9
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
				arg_11_0:Play317181004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1049ui_story"

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

			local var_14_4 = arg_11_1.actors_["1049ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1049ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0.7, -1.2, -6)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1049ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1049ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1049ui_story == nil then
				arg_11_1.var_.characterEffect1049ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1049ui_story then
					arg_11_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1049ui_story then
				arg_11_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_19 = arg_11_1.actors_["1058ui_story"]
			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 and arg_11_1.var_.characterEffect1058ui_story == nil then
				arg_11_1.var_.characterEffect1058ui_story = var_14_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_21 = 0.200000002980232

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_20) / var_14_21

				if arg_11_1.var_.characterEffect1058ui_story then
					local var_14_23 = Mathf.Lerp(0, 0.5, var_14_22)

					arg_11_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1058ui_story.fillRatio = var_14_23
				end
			end

			if arg_11_1.time_ >= var_14_20 + var_14_21 and arg_11_1.time_ < var_14_20 + var_14_21 + arg_14_0 and arg_11_1.var_.characterEffect1058ui_story then
				local var_14_24 = 0.5

				arg_11_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1058ui_story.fillRatio = var_14_24
			end

			local var_14_25 = 0
			local var_14_26 = 0.575

			if var_14_25 < arg_11_1.time_ and arg_11_1.time_ <= var_14_25 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_27 = arg_11_1:FormatText(StoryNameCfg[562].name)

				arg_11_1.leftNameTxt_.text = var_14_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_28 = arg_11_1:GetWordFromCfg(317181003)
				local var_14_29 = arg_11_1:FormatText(var_14_28.content)

				arg_11_1.text_.text = var_14_29

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_30 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181003", "story_v_out_317181.awb") ~= 0 then
					local var_14_33 = manager.audio:GetVoiceLength("story_v_out_317181", "317181003", "story_v_out_317181.awb") / 1000

					if var_14_33 + var_14_25 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_33 + var_14_25
					end

					if var_14_28.prefab_name ~= "" and arg_11_1.actors_[var_14_28.prefab_name] ~= nil then
						local var_14_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_28.prefab_name].transform, "story_v_out_317181", "317181003", "story_v_out_317181.awb")

						arg_11_1:RecordAudio("317181003", var_14_34)
						arg_11_1:RecordAudio("317181003", var_14_34)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_317181", "317181003", "story_v_out_317181.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_317181", "317181003", "story_v_out_317181.awb")
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
	Play317181004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317181004
		arg_15_1.duration_ = 6.266

		local var_15_0 = {
			zh = 6.266,
			ja = 4.433
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
				arg_15_0:Play317181005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1058ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1058ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1058ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["1058ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1058ui_story == nil then
				arg_15_1.var_.characterEffect1058ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1058ui_story then
					arg_15_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1058ui_story then
				arg_15_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action6_1")
			end

			local var_18_14 = 0

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_15 = arg_15_1.actors_["1049ui_story"]
			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 and arg_15_1.var_.characterEffect1049ui_story == nil then
				arg_15_1.var_.characterEffect1049ui_story = var_18_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_17 = 0.200000002980232

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17

				if arg_15_1.var_.characterEffect1049ui_story then
					local var_18_19 = Mathf.Lerp(0, 0.5, var_18_18)

					arg_15_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1049ui_story.fillRatio = var_18_19
				end
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 and arg_15_1.var_.characterEffect1049ui_story then
				local var_18_20 = 0.5

				arg_15_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1049ui_story.fillRatio = var_18_20
			end

			local var_18_21 = 0
			local var_18_22 = 0.75

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_23 = arg_15_1:FormatText(StoryNameCfg[92].name)

				arg_15_1.leftNameTxt_.text = var_18_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_24 = arg_15_1:GetWordFromCfg(317181004)
				local var_18_25 = arg_15_1:FormatText(var_18_24.content)

				arg_15_1.text_.text = var_18_25

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_26 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181004", "story_v_out_317181.awb") ~= 0 then
					local var_18_29 = manager.audio:GetVoiceLength("story_v_out_317181", "317181004", "story_v_out_317181.awb") / 1000

					if var_18_29 + var_18_21 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_29 + var_18_21
					end

					if var_18_24.prefab_name ~= "" and arg_15_1.actors_[var_18_24.prefab_name] ~= nil then
						local var_18_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_24.prefab_name].transform, "story_v_out_317181", "317181004", "story_v_out_317181.awb")

						arg_15_1:RecordAudio("317181004", var_18_30)
						arg_15_1:RecordAudio("317181004", var_18_30)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317181", "317181004", "story_v_out_317181.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317181", "317181004", "story_v_out_317181.awb")
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
	Play317181005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 317181005
		arg_19_1.duration_ = 6.633

		local var_19_0 = {
			zh = 1.999999999999,
			ja = 6.633
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
				arg_19_0:Play317181006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1049ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1049ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0.7, -1.2, -6)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1049ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["1049ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect1049ui_story == nil then
				arg_19_1.var_.characterEffect1049ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect1049ui_story then
					arg_19_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect1049ui_story then
				arg_19_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_14 = arg_19_1.actors_["1058ui_story"]
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect1058ui_story == nil then
				arg_19_1.var_.characterEffect1058ui_story = var_22_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_16 = 0.200000002980232

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_16 then
				local var_22_17 = (arg_19_1.time_ - var_22_15) / var_22_16

				if arg_19_1.var_.characterEffect1058ui_story then
					local var_22_18 = Mathf.Lerp(0, 0.5, var_22_17)

					arg_19_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1058ui_story.fillRatio = var_22_18
				end
			end

			if arg_19_1.time_ >= var_22_15 + var_22_16 and arg_19_1.time_ < var_22_15 + var_22_16 + arg_22_0 and arg_19_1.var_.characterEffect1058ui_story then
				local var_22_19 = 0.5

				arg_19_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1058ui_story.fillRatio = var_22_19
			end

			local var_22_20 = 0
			local var_22_21 = 0.225

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_22 = arg_19_1:FormatText(StoryNameCfg[562].name)

				arg_19_1.leftNameTxt_.text = var_22_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_23 = arg_19_1:GetWordFromCfg(317181005)
				local var_22_24 = arg_19_1:FormatText(var_22_23.content)

				arg_19_1.text_.text = var_22_24

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_25 = 9
				local var_22_26 = utf8.len(var_22_24)
				local var_22_27 = var_22_25 <= 0 and var_22_21 or var_22_21 * (var_22_26 / var_22_25)

				if var_22_27 > 0 and var_22_21 < var_22_27 then
					arg_19_1.talkMaxDuration = var_22_27

					if var_22_27 + var_22_20 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_20
					end
				end

				arg_19_1.text_.text = var_22_24
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181005", "story_v_out_317181.awb") ~= 0 then
					local var_22_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181005", "story_v_out_317181.awb") / 1000

					if var_22_28 + var_22_20 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_28 + var_22_20
					end

					if var_22_23.prefab_name ~= "" and arg_19_1.actors_[var_22_23.prefab_name] ~= nil then
						local var_22_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_23.prefab_name].transform, "story_v_out_317181", "317181005", "story_v_out_317181.awb")

						arg_19_1:RecordAudio("317181005", var_22_29)
						arg_19_1:RecordAudio("317181005", var_22_29)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_317181", "317181005", "story_v_out_317181.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_317181", "317181005", "story_v_out_317181.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_30 = math.max(var_22_21, arg_19_1.talkMaxDuration)

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_30 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_20) / var_22_30

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_20 + var_22_30 and arg_19_1.time_ < var_22_20 + var_22_30 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play317181006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 317181006
		arg_23_1.duration_ = 8.866

		local var_23_0 = {
			zh = 7.733,
			ja = 8.866
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
				arg_23_0:Play317181007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1058ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1058ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1058ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1058ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1058ui_story == nil then
				arg_23_1.var_.characterEffect1058ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1058ui_story then
					arg_23_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1058ui_story then
				arg_23_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_14 = arg_23_1.actors_["1049ui_story"]
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect1049ui_story == nil then
				arg_23_1.var_.characterEffect1049ui_story = var_26_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_16 = 0.200000002980232

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16

				if arg_23_1.var_.characterEffect1049ui_story then
					local var_26_18 = Mathf.Lerp(0, 0.5, var_26_17)

					arg_23_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1049ui_story.fillRatio = var_26_18
				end
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect1049ui_story then
				local var_26_19 = 0.5

				arg_23_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1049ui_story.fillRatio = var_26_19
			end

			local var_26_20 = 0
			local var_26_21 = 0.95

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_22 = arg_23_1:FormatText(StoryNameCfg[92].name)

				arg_23_1.leftNameTxt_.text = var_26_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_23 = arg_23_1:GetWordFromCfg(317181006)
				local var_26_24 = arg_23_1:FormatText(var_26_23.content)

				arg_23_1.text_.text = var_26_24

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_25 = 38
				local var_26_26 = utf8.len(var_26_24)
				local var_26_27 = var_26_25 <= 0 and var_26_21 or var_26_21 * (var_26_26 / var_26_25)

				if var_26_27 > 0 and var_26_21 < var_26_27 then
					arg_23_1.talkMaxDuration = var_26_27

					if var_26_27 + var_26_20 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_20
					end
				end

				arg_23_1.text_.text = var_26_24
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181006", "story_v_out_317181.awb") ~= 0 then
					local var_26_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181006", "story_v_out_317181.awb") / 1000

					if var_26_28 + var_26_20 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_28 + var_26_20
					end

					if var_26_23.prefab_name ~= "" and arg_23_1.actors_[var_26_23.prefab_name] ~= nil then
						local var_26_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_23.prefab_name].transform, "story_v_out_317181", "317181006", "story_v_out_317181.awb")

						arg_23_1:RecordAudio("317181006", var_26_29)
						arg_23_1:RecordAudio("317181006", var_26_29)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_317181", "317181006", "story_v_out_317181.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_317181", "317181006", "story_v_out_317181.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_30 = math.max(var_26_21, arg_23_1.talkMaxDuration)

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_30 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_20) / var_26_30

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_20 + var_26_30 and arg_23_1.time_ < var_26_20 + var_26_30 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play317181007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317181007
		arg_27_1.duration_ = 3.2

		local var_27_0 = {
			zh = 1.999999999999,
			ja = 3.2
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
				arg_27_0:Play317181008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1049ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1049ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0.7, -1.2, -6)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1049ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["1049ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1049ui_story == nil then
				arg_27_1.var_.characterEffect1049ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1049ui_story then
					arg_27_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1049ui_story then
				arg_27_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_14 = arg_27_1.actors_["1058ui_story"]
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 and arg_27_1.var_.characterEffect1058ui_story == nil then
				arg_27_1.var_.characterEffect1058ui_story = var_30_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_16 = 0.200000002980232

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16

				if arg_27_1.var_.characterEffect1058ui_story then
					local var_30_18 = Mathf.Lerp(0, 0.5, var_30_17)

					arg_27_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1058ui_story.fillRatio = var_30_18
				end
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 and arg_27_1.var_.characterEffect1058ui_story then
				local var_30_19 = 0.5

				arg_27_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1058ui_story.fillRatio = var_30_19
			end

			local var_30_20 = 0
			local var_30_21 = 0.1

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_22 = arg_27_1:FormatText(StoryNameCfg[562].name)

				arg_27_1.leftNameTxt_.text = var_30_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_23 = arg_27_1:GetWordFromCfg(317181007)
				local var_30_24 = arg_27_1:FormatText(var_30_23.content)

				arg_27_1.text_.text = var_30_24

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_25 = 4
				local var_30_26 = utf8.len(var_30_24)
				local var_30_27 = var_30_25 <= 0 and var_30_21 or var_30_21 * (var_30_26 / var_30_25)

				if var_30_27 > 0 and var_30_21 < var_30_27 then
					arg_27_1.talkMaxDuration = var_30_27

					if var_30_27 + var_30_20 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_20
					end
				end

				arg_27_1.text_.text = var_30_24
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181007", "story_v_out_317181.awb") ~= 0 then
					local var_30_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181007", "story_v_out_317181.awb") / 1000

					if var_30_28 + var_30_20 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_28 + var_30_20
					end

					if var_30_23.prefab_name ~= "" and arg_27_1.actors_[var_30_23.prefab_name] ~= nil then
						local var_30_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_23.prefab_name].transform, "story_v_out_317181", "317181007", "story_v_out_317181.awb")

						arg_27_1:RecordAudio("317181007", var_30_29)
						arg_27_1:RecordAudio("317181007", var_30_29)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_317181", "317181007", "story_v_out_317181.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_317181", "317181007", "story_v_out_317181.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_30 = math.max(var_30_21, arg_27_1.talkMaxDuration)

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_30 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_20) / var_30_30

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_20 + var_30_30 and arg_27_1.time_ < var_30_20 + var_30_30 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play317181008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 317181008
		arg_31_1.duration_ = 9.333

		local var_31_0 = {
			zh = 3.566,
			ja = 9.333
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
				arg_31_0:Play317181009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1058ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1058ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1058ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1058ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1058ui_story == nil then
				arg_31_1.var_.characterEffect1058ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.200000002980232

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1058ui_story then
					arg_31_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1058ui_story then
				arg_31_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action6_2")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_15 = arg_31_1.actors_["1049ui_story"]
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect1049ui_story == nil then
				arg_31_1.var_.characterEffect1049ui_story = var_34_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_17 = 0.200000002980232

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17

				if arg_31_1.var_.characterEffect1049ui_story then
					local var_34_19 = Mathf.Lerp(0, 0.5, var_34_18)

					arg_31_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1049ui_story.fillRatio = var_34_19
				end
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 and arg_31_1.var_.characterEffect1049ui_story then
				local var_34_20 = 0.5

				arg_31_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1049ui_story.fillRatio = var_34_20
			end

			local var_34_21 = 0
			local var_34_22 = 0.55

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_23 = arg_31_1:FormatText(StoryNameCfg[92].name)

				arg_31_1.leftNameTxt_.text = var_34_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_24 = arg_31_1:GetWordFromCfg(317181008)
				local var_34_25 = arg_31_1:FormatText(var_34_24.content)

				arg_31_1.text_.text = var_34_25

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_26 = 22
				local var_34_27 = utf8.len(var_34_25)
				local var_34_28 = var_34_26 <= 0 and var_34_22 or var_34_22 * (var_34_27 / var_34_26)

				if var_34_28 > 0 and var_34_22 < var_34_28 then
					arg_31_1.talkMaxDuration = var_34_28

					if var_34_28 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_28 + var_34_21
					end
				end

				arg_31_1.text_.text = var_34_25
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181008", "story_v_out_317181.awb") ~= 0 then
					local var_34_29 = manager.audio:GetVoiceLength("story_v_out_317181", "317181008", "story_v_out_317181.awb") / 1000

					if var_34_29 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_21
					end

					if var_34_24.prefab_name ~= "" and arg_31_1.actors_[var_34_24.prefab_name] ~= nil then
						local var_34_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_24.prefab_name].transform, "story_v_out_317181", "317181008", "story_v_out_317181.awb")

						arg_31_1:RecordAudio("317181008", var_34_30)
						arg_31_1:RecordAudio("317181008", var_34_30)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_317181", "317181008", "story_v_out_317181.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_317181", "317181008", "story_v_out_317181.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_31 = math.max(var_34_22, arg_31_1.talkMaxDuration)

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_31 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_21) / var_34_31

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_21 + var_34_31 and arg_31_1.time_ < var_34_21 + var_34_31 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play317181009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 317181009
		arg_35_1.duration_ = 10.166

		local var_35_0 = {
			zh = 7.966,
			ja = 10.166
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
				arg_35_0:Play317181010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1049ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1049ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0.7, -1.2, -6)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1049ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1049ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1049ui_story == nil then
				arg_35_1.var_.characterEffect1049ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1049ui_story then
					arg_35_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1049ui_story then
				arg_35_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_38_14 = arg_35_1.actors_["1058ui_story"]
			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 and arg_35_1.var_.characterEffect1058ui_story == nil then
				arg_35_1.var_.characterEffect1058ui_story = var_38_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_16 = 0.200000002980232

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16

				if arg_35_1.var_.characterEffect1058ui_story then
					local var_38_18 = Mathf.Lerp(0, 0.5, var_38_17)

					arg_35_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1058ui_story.fillRatio = var_38_18
				end
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 and arg_35_1.var_.characterEffect1058ui_story then
				local var_38_19 = 0.5

				arg_35_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1058ui_story.fillRatio = var_38_19
			end

			local var_38_20 = 0
			local var_38_21 = 0.45

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_22 = arg_35_1:FormatText(StoryNameCfg[562].name)

				arg_35_1.leftNameTxt_.text = var_38_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_23 = arg_35_1:GetWordFromCfg(317181009)
				local var_38_24 = arg_35_1:FormatText(var_38_23.content)

				arg_35_1.text_.text = var_38_24

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_25 = 18
				local var_38_26 = utf8.len(var_38_24)
				local var_38_27 = var_38_25 <= 0 and var_38_21 or var_38_21 * (var_38_26 / var_38_25)

				if var_38_27 > 0 and var_38_21 < var_38_27 then
					arg_35_1.talkMaxDuration = var_38_27

					if var_38_27 + var_38_20 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_27 + var_38_20
					end
				end

				arg_35_1.text_.text = var_38_24
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181009", "story_v_out_317181.awb") ~= 0 then
					local var_38_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181009", "story_v_out_317181.awb") / 1000

					if var_38_28 + var_38_20 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_28 + var_38_20
					end

					if var_38_23.prefab_name ~= "" and arg_35_1.actors_[var_38_23.prefab_name] ~= nil then
						local var_38_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_23.prefab_name].transform, "story_v_out_317181", "317181009", "story_v_out_317181.awb")

						arg_35_1:RecordAudio("317181009", var_38_29)
						arg_35_1:RecordAudio("317181009", var_38_29)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_317181", "317181009", "story_v_out_317181.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_317181", "317181009", "story_v_out_317181.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_30 = math.max(var_38_21, arg_35_1.talkMaxDuration)

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_30 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_20) / var_38_30

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_20 + var_38_30 and arg_35_1.time_ < var_38_20 + var_38_30 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play317181010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317181010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play317181011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1049ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1049ui_story == nil then
				arg_39_1.var_.characterEffect1049ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1049ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1049ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1049ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1049ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.625

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_8 = arg_39_1:GetWordFromCfg(317181010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 25
				local var_42_11 = utf8.len(var_42_9)
				local var_42_12 = var_42_10 <= 0 and var_42_7 or var_42_7 * (var_42_11 / var_42_10)

				if var_42_12 > 0 and var_42_7 < var_42_12 then
					arg_39_1.talkMaxDuration = var_42_12

					if var_42_12 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_9
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_13 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_13 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_13

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_13 and arg_39_1.time_ < var_42_6 + var_42_13 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play317181011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 317181011
		arg_43_1.duration_ = 15.033

		local var_43_0 = {
			zh = 15.033,
			ja = 9.3
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
				arg_43_0:Play317181012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1058ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1058ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1058ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1058ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1058ui_story == nil then
				arg_43_1.var_.characterEffect1058ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1058ui_story then
					arg_43_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1058ui_story then
				arg_43_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action2_1")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_15 = 0
			local var_46_16 = 1.725

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_17 = arg_43_1:FormatText(StoryNameCfg[92].name)

				arg_43_1.leftNameTxt_.text = var_46_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_18 = arg_43_1:GetWordFromCfg(317181011)
				local var_46_19 = arg_43_1:FormatText(var_46_18.content)

				arg_43_1.text_.text = var_46_19

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_20 = 69
				local var_46_21 = utf8.len(var_46_19)
				local var_46_22 = var_46_20 <= 0 and var_46_16 or var_46_16 * (var_46_21 / var_46_20)

				if var_46_22 > 0 and var_46_16 < var_46_22 then
					arg_43_1.talkMaxDuration = var_46_22

					if var_46_22 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_22 + var_46_15
					end
				end

				arg_43_1.text_.text = var_46_19
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181011", "story_v_out_317181.awb") ~= 0 then
					local var_46_23 = manager.audio:GetVoiceLength("story_v_out_317181", "317181011", "story_v_out_317181.awb") / 1000

					if var_46_23 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_23 + var_46_15
					end

					if var_46_18.prefab_name ~= "" and arg_43_1.actors_[var_46_18.prefab_name] ~= nil then
						local var_46_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_18.prefab_name].transform, "story_v_out_317181", "317181011", "story_v_out_317181.awb")

						arg_43_1:RecordAudio("317181011", var_46_24)
						arg_43_1:RecordAudio("317181011", var_46_24)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_317181", "317181011", "story_v_out_317181.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_317181", "317181011", "story_v_out_317181.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_16, arg_43_1.talkMaxDuration)

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_15) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_15 + var_46_25 and arg_43_1.time_ < var_46_15 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play317181012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 317181012
		arg_47_1.duration_ = 4.7

		local var_47_0 = {
			zh = 4.7,
			ja = 4.4
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
				arg_47_0:Play317181013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1049ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1049ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0.7, -1.2, -6)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1049ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1049ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1049ui_story == nil then
				arg_47_1.var_.characterEffect1049ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1049ui_story then
					arg_47_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1049ui_story then
				arg_47_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_14 = arg_47_1.actors_["1058ui_story"]
			local var_50_15 = 0

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect1058ui_story == nil then
				arg_47_1.var_.characterEffect1058ui_story = var_50_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_16 = 0.200000002980232

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_16 then
				local var_50_17 = (arg_47_1.time_ - var_50_15) / var_50_16

				if arg_47_1.var_.characterEffect1058ui_story then
					local var_50_18 = Mathf.Lerp(0, 0.5, var_50_17)

					arg_47_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1058ui_story.fillRatio = var_50_18
				end
			end

			if arg_47_1.time_ >= var_50_15 + var_50_16 and arg_47_1.time_ < var_50_15 + var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect1058ui_story then
				local var_50_19 = 0.5

				arg_47_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1058ui_story.fillRatio = var_50_19
			end

			local var_50_20 = 0
			local var_50_21 = 0.6

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_22 = arg_47_1:FormatText(StoryNameCfg[562].name)

				arg_47_1.leftNameTxt_.text = var_50_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_23 = arg_47_1:GetWordFromCfg(317181012)
				local var_50_24 = arg_47_1:FormatText(var_50_23.content)

				arg_47_1.text_.text = var_50_24

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_25 = 24
				local var_50_26 = utf8.len(var_50_24)
				local var_50_27 = var_50_25 <= 0 and var_50_21 or var_50_21 * (var_50_26 / var_50_25)

				if var_50_27 > 0 and var_50_21 < var_50_27 then
					arg_47_1.talkMaxDuration = var_50_27

					if var_50_27 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_20
					end
				end

				arg_47_1.text_.text = var_50_24
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181012", "story_v_out_317181.awb") ~= 0 then
					local var_50_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181012", "story_v_out_317181.awb") / 1000

					if var_50_28 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_20
					end

					if var_50_23.prefab_name ~= "" and arg_47_1.actors_[var_50_23.prefab_name] ~= nil then
						local var_50_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_23.prefab_name].transform, "story_v_out_317181", "317181012", "story_v_out_317181.awb")

						arg_47_1:RecordAudio("317181012", var_50_29)
						arg_47_1:RecordAudio("317181012", var_50_29)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_317181", "317181012", "story_v_out_317181.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_317181", "317181012", "story_v_out_317181.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_30 = math.max(var_50_21, arg_47_1.talkMaxDuration)

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_30 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_20) / var_50_30

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_20 + var_50_30 and arg_47_1.time_ < var_50_20 + var_50_30 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play317181013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317181013
		arg_51_1.duration_ = 5.4

		local var_51_0 = {
			zh = 3.733,
			ja = 5.4
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
				arg_51_0:Play317181014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1058ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1058ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1058ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1058ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1058ui_story == nil then
				arg_51_1.var_.characterEffect1058ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1058ui_story then
					arg_51_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1058ui_story then
				arg_51_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_54_13 = 0

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_54_14 = arg_51_1.actors_["1049ui_story"]
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 and arg_51_1.var_.characterEffect1049ui_story == nil then
				arg_51_1.var_.characterEffect1049ui_story = var_54_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_16 = 0.200000002980232

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_16 then
				local var_54_17 = (arg_51_1.time_ - var_54_15) / var_54_16

				if arg_51_1.var_.characterEffect1049ui_story then
					local var_54_18 = Mathf.Lerp(0, 0.5, var_54_17)

					arg_51_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1049ui_story.fillRatio = var_54_18
				end
			end

			if arg_51_1.time_ >= var_54_15 + var_54_16 and arg_51_1.time_ < var_54_15 + var_54_16 + arg_54_0 and arg_51_1.var_.characterEffect1049ui_story then
				local var_54_19 = 0.5

				arg_51_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1049ui_story.fillRatio = var_54_19
			end

			local var_54_20 = 0
			local var_54_21 = 0.45

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_22 = arg_51_1:FormatText(StoryNameCfg[92].name)

				arg_51_1.leftNameTxt_.text = var_54_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_23 = arg_51_1:GetWordFromCfg(317181013)
				local var_54_24 = arg_51_1:FormatText(var_54_23.content)

				arg_51_1.text_.text = var_54_24

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_25 = 18
				local var_54_26 = utf8.len(var_54_24)
				local var_54_27 = var_54_25 <= 0 and var_54_21 or var_54_21 * (var_54_26 / var_54_25)

				if var_54_27 > 0 and var_54_21 < var_54_27 then
					arg_51_1.talkMaxDuration = var_54_27

					if var_54_27 + var_54_20 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_20
					end
				end

				arg_51_1.text_.text = var_54_24
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181013", "story_v_out_317181.awb") ~= 0 then
					local var_54_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181013", "story_v_out_317181.awb") / 1000

					if var_54_28 + var_54_20 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_20
					end

					if var_54_23.prefab_name ~= "" and arg_51_1.actors_[var_54_23.prefab_name] ~= nil then
						local var_54_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_23.prefab_name].transform, "story_v_out_317181", "317181013", "story_v_out_317181.awb")

						arg_51_1:RecordAudio("317181013", var_54_29)
						arg_51_1:RecordAudio("317181013", var_54_29)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_317181", "317181013", "story_v_out_317181.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_317181", "317181013", "story_v_out_317181.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_30 = math.max(var_54_21, arg_51_1.talkMaxDuration)

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_30 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_20) / var_54_30

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_20 + var_54_30 and arg_51_1.time_ < var_54_20 + var_54_30 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play317181014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 317181014
		arg_55_1.duration_ = 17.2

		local var_55_0 = {
			zh = 12.766,
			ja = 17.2
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
				arg_55_0:Play317181015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1049ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1049ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0.7, -1.2, -6)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1049ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1049ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1049ui_story == nil then
				arg_55_1.var_.characterEffect1049ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1049ui_story then
					arg_55_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1049ui_story then
				arg_55_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_58_14 = arg_55_1.actors_["1058ui_story"]
			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 and arg_55_1.var_.characterEffect1058ui_story == nil then
				arg_55_1.var_.characterEffect1058ui_story = var_58_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_16 = 0.200000002980232

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_16 then
				local var_58_17 = (arg_55_1.time_ - var_58_15) / var_58_16

				if arg_55_1.var_.characterEffect1058ui_story then
					local var_58_18 = Mathf.Lerp(0, 0.5, var_58_17)

					arg_55_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1058ui_story.fillRatio = var_58_18
				end
			end

			if arg_55_1.time_ >= var_58_15 + var_58_16 and arg_55_1.time_ < var_58_15 + var_58_16 + arg_58_0 and arg_55_1.var_.characterEffect1058ui_story then
				local var_58_19 = 0.5

				arg_55_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1058ui_story.fillRatio = var_58_19
			end

			local var_58_20 = 0
			local var_58_21 = 1.125

			if var_58_20 < arg_55_1.time_ and arg_55_1.time_ <= var_58_20 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_22 = arg_55_1:FormatText(StoryNameCfg[562].name)

				arg_55_1.leftNameTxt_.text = var_58_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_23 = arg_55_1:GetWordFromCfg(317181014)
				local var_58_24 = arg_55_1:FormatText(var_58_23.content)

				arg_55_1.text_.text = var_58_24

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_25 = 45
				local var_58_26 = utf8.len(var_58_24)
				local var_58_27 = var_58_25 <= 0 and var_58_21 or var_58_21 * (var_58_26 / var_58_25)

				if var_58_27 > 0 and var_58_21 < var_58_27 then
					arg_55_1.talkMaxDuration = var_58_27

					if var_58_27 + var_58_20 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_27 + var_58_20
					end
				end

				arg_55_1.text_.text = var_58_24
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181014", "story_v_out_317181.awb") ~= 0 then
					local var_58_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181014", "story_v_out_317181.awb") / 1000

					if var_58_28 + var_58_20 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_28 + var_58_20
					end

					if var_58_23.prefab_name ~= "" and arg_55_1.actors_[var_58_23.prefab_name] ~= nil then
						local var_58_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_23.prefab_name].transform, "story_v_out_317181", "317181014", "story_v_out_317181.awb")

						arg_55_1:RecordAudio("317181014", var_58_29)
						arg_55_1:RecordAudio("317181014", var_58_29)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_317181", "317181014", "story_v_out_317181.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_317181", "317181014", "story_v_out_317181.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_30 = math.max(var_58_21, arg_55_1.talkMaxDuration)

			if var_58_20 <= arg_55_1.time_ and arg_55_1.time_ < var_58_20 + var_58_30 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_20) / var_58_30

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_20 + var_58_30 and arg_55_1.time_ < var_58_20 + var_58_30 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play317181015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 317181015
		arg_59_1.duration_ = 9.333

		local var_59_0 = {
			zh = 3.533,
			ja = 9.333
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
				arg_59_0:Play317181016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.5

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[562].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(317181015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181015", "story_v_out_317181.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_317181", "317181015", "story_v_out_317181.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_317181", "317181015", "story_v_out_317181.awb")

						arg_59_1:RecordAudio("317181015", var_62_9)
						arg_59_1:RecordAudio("317181015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_317181", "317181015", "story_v_out_317181.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_317181", "317181015", "story_v_out_317181.awb")
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
	Play317181016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317181016
		arg_63_1.duration_ = 2.9

		local var_63_0 = {
			zh = 1.999999999999,
			ja = 2.9
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
				arg_63_0:Play317181017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1058ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1058ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1058ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1058ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1058ui_story == nil then
				arg_63_1.var_.characterEffect1058ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1058ui_story then
					arg_63_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1058ui_story then
				arg_63_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action2_2")
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_66_15 = arg_63_1.actors_["1049ui_story"]
			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 and arg_63_1.var_.characterEffect1049ui_story == nil then
				arg_63_1.var_.characterEffect1049ui_story = var_66_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_17 = 0.200000002980232

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17

				if arg_63_1.var_.characterEffect1049ui_story then
					local var_66_19 = Mathf.Lerp(0, 0.5, var_66_18)

					arg_63_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1049ui_story.fillRatio = var_66_19
				end
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 and arg_63_1.var_.characterEffect1049ui_story then
				local var_66_20 = 0.5

				arg_63_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1049ui_story.fillRatio = var_66_20
			end

			local var_66_21 = 0
			local var_66_22 = 0.2

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_23 = arg_63_1:FormatText(StoryNameCfg[92].name)

				arg_63_1.leftNameTxt_.text = var_66_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_24 = arg_63_1:GetWordFromCfg(317181016)
				local var_66_25 = arg_63_1:FormatText(var_66_24.content)

				arg_63_1.text_.text = var_66_25

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_26 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181016", "story_v_out_317181.awb") ~= 0 then
					local var_66_29 = manager.audio:GetVoiceLength("story_v_out_317181", "317181016", "story_v_out_317181.awb") / 1000

					if var_66_29 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_29 + var_66_21
					end

					if var_66_24.prefab_name ~= "" and arg_63_1.actors_[var_66_24.prefab_name] ~= nil then
						local var_66_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_24.prefab_name].transform, "story_v_out_317181", "317181016", "story_v_out_317181.awb")

						arg_63_1:RecordAudio("317181016", var_66_30)
						arg_63_1:RecordAudio("317181016", var_66_30)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317181", "317181016", "story_v_out_317181.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317181", "317181016", "story_v_out_317181.awb")
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
	Play317181017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317181017
		arg_67_1.duration_ = 10.9

		local var_67_0 = {
			zh = 6.8,
			ja = 10.9
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
				arg_67_0:Play317181018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1049ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1049ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0.7, -1.2, -6)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1049ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1049ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1049ui_story == nil then
				arg_67_1.var_.characterEffect1049ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1049ui_story then
					arg_67_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1049ui_story then
				arg_67_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_70_13 = arg_67_1.actors_["1058ui_story"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.characterEffect1058ui_story == nil then
				arg_67_1.var_.characterEffect1058ui_story = var_70_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_15 = 0.200000002980232

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.characterEffect1058ui_story then
					local var_70_17 = Mathf.Lerp(0, 0.5, var_70_16)

					arg_67_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1058ui_story.fillRatio = var_70_17
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.characterEffect1058ui_story then
				local var_70_18 = 0.5

				arg_67_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1058ui_story.fillRatio = var_70_18
			end

			local var_70_19 = 0
			local var_70_20 = 0.7

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[562].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(317181017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 28
				local var_70_25 = utf8.len(var_70_23)
				local var_70_26 = var_70_24 <= 0 and var_70_20 or var_70_20 * (var_70_25 / var_70_24)

				if var_70_26 > 0 and var_70_20 < var_70_26 then
					arg_67_1.talkMaxDuration = var_70_26

					if var_70_26 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_26 + var_70_19
					end
				end

				arg_67_1.text_.text = var_70_23
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181017", "story_v_out_317181.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_317181", "317181017", "story_v_out_317181.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_317181", "317181017", "story_v_out_317181.awb")

						arg_67_1:RecordAudio("317181017", var_70_28)
						arg_67_1:RecordAudio("317181017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_317181", "317181017", "story_v_out_317181.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_317181", "317181017", "story_v_out_317181.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_29 = math.max(var_70_20, arg_67_1.talkMaxDuration)

			if var_70_19 <= arg_67_1.time_ and arg_67_1.time_ < var_70_19 + var_70_29 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_19) / var_70_29

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_19 + var_70_29 and arg_67_1.time_ < var_70_19 + var_70_29 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play317181018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317181018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play317181019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1049ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1049ui_story == nil then
				arg_71_1.var_.characterEffect1049ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1049ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1049ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1049ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1049ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.575

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(317181018)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 23
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_7 or var_74_7 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_7 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_13 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_13 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_13

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_13 and arg_71_1.time_ < var_74_6 + var_74_13 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317181019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 317181019
		arg_75_1.duration_ = 10.3

		local var_75_0 = {
			zh = 3.066,
			ja = 10.3
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
				arg_75_0:Play317181020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1058ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1058ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1058ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1058ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1058ui_story == nil then
				arg_75_1.var_.characterEffect1058ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1058ui_story then
					arg_75_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1058ui_story then
				arg_75_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_14 = 0
			local var_78_15 = 0.375

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_16 = arg_75_1:FormatText(StoryNameCfg[92].name)

				arg_75_1.leftNameTxt_.text = var_78_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_17 = arg_75_1:GetWordFromCfg(317181019)
				local var_78_18 = arg_75_1:FormatText(var_78_17.content)

				arg_75_1.text_.text = var_78_18

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_19 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181019", "story_v_out_317181.awb") ~= 0 then
					local var_78_22 = manager.audio:GetVoiceLength("story_v_out_317181", "317181019", "story_v_out_317181.awb") / 1000

					if var_78_22 + var_78_14 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_22 + var_78_14
					end

					if var_78_17.prefab_name ~= "" and arg_75_1.actors_[var_78_17.prefab_name] ~= nil then
						local var_78_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_17.prefab_name].transform, "story_v_out_317181", "317181019", "story_v_out_317181.awb")

						arg_75_1:RecordAudio("317181019", var_78_23)
						arg_75_1:RecordAudio("317181019", var_78_23)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_317181", "317181019", "story_v_out_317181.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_317181", "317181019", "story_v_out_317181.awb")
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
	Play317181020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317181020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play317181021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1058ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1058ui_story == nil then
				arg_79_1.var_.characterEffect1058ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1058ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1058ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1058ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1058ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.35

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_8 = arg_79_1:GetWordFromCfg(317181020)
				local var_82_9 = arg_79_1:FormatText(var_82_8.content)

				arg_79_1.text_.text = var_82_9

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_10 = 14
				local var_82_11 = utf8.len(var_82_9)
				local var_82_12 = var_82_10 <= 0 and var_82_7 or var_82_7 * (var_82_11 / var_82_10)

				if var_82_12 > 0 and var_82_7 < var_82_12 then
					arg_79_1.talkMaxDuration = var_82_12

					if var_82_12 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_12 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_9
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_13 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_13 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_13

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_13 and arg_79_1.time_ < var_82_6 + var_82_13 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play317181021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 317181021
		arg_83_1.duration_ = 12.866

		local var_83_0 = {
			zh = 12.866,
			ja = 12.833
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
				arg_83_0:Play317181022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1058ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1058ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -0.95, -5.88)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1058ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1058ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1058ui_story == nil then
				arg_83_1.var_.characterEffect1058ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1058ui_story then
					arg_83_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1058ui_story then
				arg_83_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_86_14 = 0
			local var_86_15 = 1.55

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_16 = arg_83_1:FormatText(StoryNameCfg[92].name)

				arg_83_1.leftNameTxt_.text = var_86_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_17 = arg_83_1:GetWordFromCfg(317181021)
				local var_86_18 = arg_83_1:FormatText(var_86_17.content)

				arg_83_1.text_.text = var_86_18

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_19 = 62
				local var_86_20 = utf8.len(var_86_18)
				local var_86_21 = var_86_19 <= 0 and var_86_15 or var_86_15 * (var_86_20 / var_86_19)

				if var_86_21 > 0 and var_86_15 < var_86_21 then
					arg_83_1.talkMaxDuration = var_86_21

					if var_86_21 + var_86_14 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_14
					end
				end

				arg_83_1.text_.text = var_86_18
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181021", "story_v_out_317181.awb") ~= 0 then
					local var_86_22 = manager.audio:GetVoiceLength("story_v_out_317181", "317181021", "story_v_out_317181.awb") / 1000

					if var_86_22 + var_86_14 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_14
					end

					if var_86_17.prefab_name ~= "" and arg_83_1.actors_[var_86_17.prefab_name] ~= nil then
						local var_86_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_17.prefab_name].transform, "story_v_out_317181", "317181021", "story_v_out_317181.awb")

						arg_83_1:RecordAudio("317181021", var_86_23)
						arg_83_1:RecordAudio("317181021", var_86_23)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_317181", "317181021", "story_v_out_317181.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_317181", "317181021", "story_v_out_317181.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_24 = math.max(var_86_15, arg_83_1.talkMaxDuration)

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_24 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_14) / var_86_24

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_14 + var_86_24 and arg_83_1.time_ < var_86_14 + var_86_24 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play317181022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 317181022
		arg_87_1.duration_ = 3.133

		local var_87_0 = {
			zh = 1.999999999999,
			ja = 3.133
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
				arg_87_0:Play317181023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1049ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1049ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0.7, -1.2, -6)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1049ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0.7, -1.2, -6)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1049ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect1049ui_story == nil then
				arg_87_1.var_.characterEffect1049ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect1049ui_story then
					arg_87_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect1049ui_story then
				arg_87_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_14 = arg_87_1.actors_["1058ui_story"]
			local var_90_15 = 0

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 and arg_87_1.var_.characterEffect1058ui_story == nil then
				arg_87_1.var_.characterEffect1058ui_story = var_90_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_16 = 0.200000002980232

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_16 then
				local var_90_17 = (arg_87_1.time_ - var_90_15) / var_90_16

				if arg_87_1.var_.characterEffect1058ui_story then
					local var_90_18 = Mathf.Lerp(0, 0.5, var_90_17)

					arg_87_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1058ui_story.fillRatio = var_90_18
				end
			end

			if arg_87_1.time_ >= var_90_15 + var_90_16 and arg_87_1.time_ < var_90_15 + var_90_16 + arg_90_0 and arg_87_1.var_.characterEffect1058ui_story then
				local var_90_19 = 0.5

				arg_87_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1058ui_story.fillRatio = var_90_19
			end

			local var_90_20 = 0
			local var_90_21 = 0.1

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_22 = arg_87_1:FormatText(StoryNameCfg[562].name)

				arg_87_1.leftNameTxt_.text = var_90_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_23 = arg_87_1:GetWordFromCfg(317181022)
				local var_90_24 = arg_87_1:FormatText(var_90_23.content)

				arg_87_1.text_.text = var_90_24

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_25 = 4
				local var_90_26 = utf8.len(var_90_24)
				local var_90_27 = var_90_25 <= 0 and var_90_21 or var_90_21 * (var_90_26 / var_90_25)

				if var_90_27 > 0 and var_90_21 < var_90_27 then
					arg_87_1.talkMaxDuration = var_90_27

					if var_90_27 + var_90_20 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_20
					end
				end

				arg_87_1.text_.text = var_90_24
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181022", "story_v_out_317181.awb") ~= 0 then
					local var_90_28 = manager.audio:GetVoiceLength("story_v_out_317181", "317181022", "story_v_out_317181.awb") / 1000

					if var_90_28 + var_90_20 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_28 + var_90_20
					end

					if var_90_23.prefab_name ~= "" and arg_87_1.actors_[var_90_23.prefab_name] ~= nil then
						local var_90_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_23.prefab_name].transform, "story_v_out_317181", "317181022", "story_v_out_317181.awb")

						arg_87_1:RecordAudio("317181022", var_90_29)
						arg_87_1:RecordAudio("317181022", var_90_29)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_317181", "317181022", "story_v_out_317181.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_317181", "317181022", "story_v_out_317181.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_30 = math.max(var_90_21, arg_87_1.talkMaxDuration)

			if var_90_20 <= arg_87_1.time_ and arg_87_1.time_ < var_90_20 + var_90_30 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_20) / var_90_30

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_20 + var_90_30 and arg_87_1.time_ < var_90_20 + var_90_30 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play317181023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 317181023
		arg_91_1.duration_ = 12.166

		local var_91_0 = {
			zh = 9.1,
			ja = 12.166
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
				arg_91_0:Play317181024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1058ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1058ui_story == nil then
				arg_91_1.var_.characterEffect1058ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1058ui_story then
					arg_91_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1058ui_story then
				arg_91_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["1049ui_story"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect1049ui_story == nil then
				arg_91_1.var_.characterEffect1049ui_story = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.200000002980232

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect1049ui_story then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1049ui_story.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect1049ui_story then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1049ui_story.fillRatio = var_94_9
			end

			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 then
				arg_91_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_11 = 0
			local var_94_12 = 0.875

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_13 = arg_91_1:FormatText(StoryNameCfg[92].name)

				arg_91_1.leftNameTxt_.text = var_94_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_14 = arg_91_1:GetWordFromCfg(317181023)
				local var_94_15 = arg_91_1:FormatText(var_94_14.content)

				arg_91_1.text_.text = var_94_15

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_16 = 35
				local var_94_17 = utf8.len(var_94_15)
				local var_94_18 = var_94_16 <= 0 and var_94_12 or var_94_12 * (var_94_17 / var_94_16)

				if var_94_18 > 0 and var_94_12 < var_94_18 then
					arg_91_1.talkMaxDuration = var_94_18

					if var_94_18 + var_94_11 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_18 + var_94_11
					end
				end

				arg_91_1.text_.text = var_94_15
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181023", "story_v_out_317181.awb") ~= 0 then
					local var_94_19 = manager.audio:GetVoiceLength("story_v_out_317181", "317181023", "story_v_out_317181.awb") / 1000

					if var_94_19 + var_94_11 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_19 + var_94_11
					end

					if var_94_14.prefab_name ~= "" and arg_91_1.actors_[var_94_14.prefab_name] ~= nil then
						local var_94_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_14.prefab_name].transform, "story_v_out_317181", "317181023", "story_v_out_317181.awb")

						arg_91_1:RecordAudio("317181023", var_94_20)
						arg_91_1:RecordAudio("317181023", var_94_20)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_317181", "317181023", "story_v_out_317181.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_317181", "317181023", "story_v_out_317181.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_21 = math.max(var_94_12, arg_91_1.talkMaxDuration)

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_21 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_11) / var_94_21

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_11 + var_94_21 and arg_91_1.time_ < var_94_11 + var_94_21 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play317181024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 317181024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play317181025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1049ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1049ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1049ui_story, var_98_4, var_98_3)

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

			local var_98_9 = arg_95_1.actors_["1058ui_story"].transform
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 then
				arg_95_1.var_.moveOldPos1058ui_story = var_98_9.localPosition
			end

			local var_98_11 = 0.001

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11
				local var_98_13 = Vector3.New(0, 100, 0)

				var_98_9.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1058ui_story, var_98_13, var_98_12)

				local var_98_14 = manager.ui.mainCamera.transform.position - var_98_9.position

				var_98_9.forward = Vector3.New(var_98_14.x, var_98_14.y, var_98_14.z)

				local var_98_15 = var_98_9.localEulerAngles

				var_98_15.z = 0
				var_98_15.x = 0
				var_98_9.localEulerAngles = var_98_15
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 then
				var_98_9.localPosition = Vector3.New(0, 100, 0)

				local var_98_16 = manager.ui.mainCamera.transform.position - var_98_9.position

				var_98_9.forward = Vector3.New(var_98_16.x, var_98_16.y, var_98_16.z)

				local var_98_17 = var_98_9.localEulerAngles

				var_98_17.z = 0
				var_98_17.x = 0
				var_98_9.localEulerAngles = var_98_17
			end

			local var_98_18 = 0
			local var_98_19 = 0.7

			if var_98_18 < arg_95_1.time_ and arg_95_1.time_ <= var_98_18 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_20 = arg_95_1:GetWordFromCfg(317181024)
				local var_98_21 = arg_95_1:FormatText(var_98_20.content)

				arg_95_1.text_.text = var_98_21

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_22 = 28
				local var_98_23 = utf8.len(var_98_21)
				local var_98_24 = var_98_22 <= 0 and var_98_19 or var_98_19 * (var_98_23 / var_98_22)

				if var_98_24 > 0 and var_98_19 < var_98_24 then
					arg_95_1.talkMaxDuration = var_98_24

					if var_98_24 + var_98_18 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_24 + var_98_18
					end
				end

				arg_95_1.text_.text = var_98_21
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_25 = math.max(var_98_19, arg_95_1.talkMaxDuration)

			if var_98_18 <= arg_95_1.time_ and arg_95_1.time_ < var_98_18 + var_98_25 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_18) / var_98_25

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_18 + var_98_25 and arg_95_1.time_ < var_98_18 + var_98_25 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play317181025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 317181025
		arg_99_1.duration_ = 4

		local var_99_0 = {
			zh = 2.066,
			ja = 4
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
				arg_99_0:Play317181026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1049ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1049ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(-0.7, -1.2, -6)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1049ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-0.7, -1.2, -6)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1049ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1049ui_story == nil then
				arg_99_1.var_.characterEffect1049ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1049ui_story then
					arg_99_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1049ui_story then
				arg_99_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = 0
			local var_102_16 = 0.275

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_17 = arg_99_1:FormatText(StoryNameCfg[562].name)

				arg_99_1.leftNameTxt_.text = var_102_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(317181025)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 11
				local var_102_21 = utf8.len(var_102_19)
				local var_102_22 = var_102_20 <= 0 and var_102_16 or var_102_16 * (var_102_21 / var_102_20)

				if var_102_22 > 0 and var_102_16 < var_102_22 then
					arg_99_1.talkMaxDuration = var_102_22

					if var_102_22 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_22 + var_102_15
					end
				end

				arg_99_1.text_.text = var_102_19
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181025", "story_v_out_317181.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_out_317181", "317181025", "story_v_out_317181.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_out_317181", "317181025", "story_v_out_317181.awb")

						arg_99_1:RecordAudio("317181025", var_102_24)
						arg_99_1:RecordAudio("317181025", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_317181", "317181025", "story_v_out_317181.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_317181", "317181025", "story_v_out_317181.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_25 = math.max(var_102_16, arg_99_1.talkMaxDuration)

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_25 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_15) / var_102_25

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_15 + var_102_25 and arg_99_1.time_ < var_102_15 + var_102_25 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play317181026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 317181026
		arg_103_1.duration_ = 7.9

		local var_103_0 = {
			zh = 3.5,
			ja = 7.9
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
				arg_103_0:Play317181027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1058ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1058ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0.7, -0.95, -5.88)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1058ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0.7, -0.95, -5.88)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["1058ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1058ui_story == nil then
				arg_103_1.var_.characterEffect1058ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1058ui_story then
					arg_103_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1058ui_story then
				arg_103_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_15 = arg_103_1.actors_["1049ui_story"]
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 and arg_103_1.var_.characterEffect1049ui_story == nil then
				arg_103_1.var_.characterEffect1049ui_story = var_106_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_17 = 0.200000002980232

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17

				if arg_103_1.var_.characterEffect1049ui_story then
					local var_106_19 = Mathf.Lerp(0, 0.5, var_106_18)

					arg_103_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1049ui_story.fillRatio = var_106_19
				end
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 and arg_103_1.var_.characterEffect1049ui_story then
				local var_106_20 = 0.5

				arg_103_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1049ui_story.fillRatio = var_106_20
			end

			local var_106_21 = 0
			local var_106_22 = 0.35

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_23 = arg_103_1:FormatText(StoryNameCfg[92].name)

				arg_103_1.leftNameTxt_.text = var_106_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_24 = arg_103_1:GetWordFromCfg(317181026)
				local var_106_25 = arg_103_1:FormatText(var_106_24.content)

				arg_103_1.text_.text = var_106_25

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_26 = 14
				local var_106_27 = utf8.len(var_106_25)
				local var_106_28 = var_106_26 <= 0 and var_106_22 or var_106_22 * (var_106_27 / var_106_26)

				if var_106_28 > 0 and var_106_22 < var_106_28 then
					arg_103_1.talkMaxDuration = var_106_28

					if var_106_28 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_28 + var_106_21
					end
				end

				arg_103_1.text_.text = var_106_25
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181026", "story_v_out_317181.awb") ~= 0 then
					local var_106_29 = manager.audio:GetVoiceLength("story_v_out_317181", "317181026", "story_v_out_317181.awb") / 1000

					if var_106_29 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_29 + var_106_21
					end

					if var_106_24.prefab_name ~= "" and arg_103_1.actors_[var_106_24.prefab_name] ~= nil then
						local var_106_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_24.prefab_name].transform, "story_v_out_317181", "317181026", "story_v_out_317181.awb")

						arg_103_1:RecordAudio("317181026", var_106_30)
						arg_103_1:RecordAudio("317181026", var_106_30)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_317181", "317181026", "story_v_out_317181.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_317181", "317181026", "story_v_out_317181.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_31 = math.max(var_106_22, arg_103_1.talkMaxDuration)

			if var_106_21 <= arg_103_1.time_ and arg_103_1.time_ < var_106_21 + var_106_31 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_21) / var_106_31

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_21 + var_106_31 and arg_103_1.time_ < var_106_21 + var_106_31 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play317181027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 317181027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play317181028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1058ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1058ui_story == nil then
				arg_107_1.var_.characterEffect1058ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1058ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1058ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1058ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1058ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.65

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_8 = arg_107_1:GetWordFromCfg(317181027)
				local var_110_9 = arg_107_1:FormatText(var_110_8.content)

				arg_107_1.text_.text = var_110_9

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_10 = 26
				local var_110_11 = utf8.len(var_110_9)
				local var_110_12 = var_110_10 <= 0 and var_110_7 or var_110_7 * (var_110_11 / var_110_10)

				if var_110_12 > 0 and var_110_7 < var_110_12 then
					arg_107_1.talkMaxDuration = var_110_12

					if var_110_12 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_12 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_9
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_13 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_13 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_13

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_13 and arg_107_1.time_ < var_110_6 + var_110_13 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play317181028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 317181028
		arg_111_1.duration_ = 12.966

		local var_111_0 = {
			zh = 9.833,
			ja = 12.966
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
				arg_111_0:Play317181029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = "STblack"

			if arg_111_1.bgs_[var_114_0] == nil then
				local var_114_1 = Object.Instantiate(arg_111_1.paintGo_)

				var_114_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_114_0)
				var_114_1.name = var_114_0
				var_114_1.transform.parent = arg_111_1.stage_.transform
				var_114_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.bgs_[var_114_0] = var_114_1
			end

			local var_114_2 = 0

			if var_114_2 < arg_111_1.time_ and arg_111_1.time_ <= var_114_2 + arg_114_0 then
				local var_114_3 = manager.ui.mainCamera.transform.localPosition
				local var_114_4 = Vector3.New(0, 0, 10) + Vector3.New(var_114_3.x, var_114_3.y, 0)
				local var_114_5 = arg_111_1.bgs_.STblack

				var_114_5.transform.localPosition = var_114_4
				var_114_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_114_6 = var_114_5:GetComponent("SpriteRenderer")

				if var_114_6 and var_114_6.sprite then
					local var_114_7 = (var_114_5.transform.localPosition - var_114_3).z
					local var_114_8 = manager.ui.mainCameraCom_
					local var_114_9 = 2 * var_114_7 * Mathf.Tan(var_114_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_114_10 = var_114_9 * var_114_8.aspect
					local var_114_11 = var_114_6.sprite.bounds.size.x
					local var_114_12 = var_114_6.sprite.bounds.size.y
					local var_114_13 = var_114_10 / var_114_11
					local var_114_14 = var_114_9 / var_114_12
					local var_114_15 = var_114_14 < var_114_13 and var_114_13 or var_114_14

					var_114_5.transform.localScale = Vector3.New(var_114_15, var_114_15, 0)
				end

				for iter_114_0, iter_114_1 in pairs(arg_111_1.bgs_) do
					if iter_114_0 ~= "STblack" then
						iter_114_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 then
				arg_111_1.mask_.enabled = true
				arg_111_1.mask_.raycastTarget = true

				arg_111_1:SetGaussion(false)
			end

			local var_114_17 = 2

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17
				local var_114_19 = Color.New(0, 0, 0)

				var_114_19.a = Mathf.Lerp(1, 0, var_114_18)
				arg_111_1.mask_.color = var_114_19
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 then
				local var_114_20 = Color.New(0, 0, 0)
				local var_114_21 = 0

				arg_111_1.mask_.enabled = false
				var_114_20.a = var_114_21
				arg_111_1.mask_.color = var_114_20
			end

			local var_114_22 = arg_111_1.actors_["1049ui_story"].transform
			local var_114_23 = 0

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1.var_.moveOldPos1049ui_story = var_114_22.localPosition
			end

			local var_114_24 = 0.001

			if var_114_23 <= arg_111_1.time_ and arg_111_1.time_ < var_114_23 + var_114_24 then
				local var_114_25 = (arg_111_1.time_ - var_114_23) / var_114_24
				local var_114_26 = Vector3.New(0, 100, 0)

				var_114_22.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1049ui_story, var_114_26, var_114_25)

				local var_114_27 = manager.ui.mainCamera.transform.position - var_114_22.position

				var_114_22.forward = Vector3.New(var_114_27.x, var_114_27.y, var_114_27.z)

				local var_114_28 = var_114_22.localEulerAngles

				var_114_28.z = 0
				var_114_28.x = 0
				var_114_22.localEulerAngles = var_114_28
			end

			if arg_111_1.time_ >= var_114_23 + var_114_24 and arg_111_1.time_ < var_114_23 + var_114_24 + arg_114_0 then
				var_114_22.localPosition = Vector3.New(0, 100, 0)

				local var_114_29 = manager.ui.mainCamera.transform.position - var_114_22.position

				var_114_22.forward = Vector3.New(var_114_29.x, var_114_29.y, var_114_29.z)

				local var_114_30 = var_114_22.localEulerAngles

				var_114_30.z = 0
				var_114_30.x = 0
				var_114_22.localEulerAngles = var_114_30
			end

			local var_114_31 = arg_111_1.actors_["1058ui_story"].transform
			local var_114_32 = 0

			if var_114_32 < arg_111_1.time_ and arg_111_1.time_ <= var_114_32 + arg_114_0 then
				arg_111_1.var_.moveOldPos1058ui_story = var_114_31.localPosition
			end

			local var_114_33 = 0.001

			if var_114_32 <= arg_111_1.time_ and arg_111_1.time_ < var_114_32 + var_114_33 then
				local var_114_34 = (arg_111_1.time_ - var_114_32) / var_114_33
				local var_114_35 = Vector3.New(0, 100, 0)

				var_114_31.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1058ui_story, var_114_35, var_114_34)

				local var_114_36 = manager.ui.mainCamera.transform.position - var_114_31.position

				var_114_31.forward = Vector3.New(var_114_36.x, var_114_36.y, var_114_36.z)

				local var_114_37 = var_114_31.localEulerAngles

				var_114_37.z = 0
				var_114_37.x = 0
				var_114_31.localEulerAngles = var_114_37
			end

			if arg_111_1.time_ >= var_114_32 + var_114_33 and arg_111_1.time_ < var_114_32 + var_114_33 + arg_114_0 then
				var_114_31.localPosition = Vector3.New(0, 100, 0)

				local var_114_38 = manager.ui.mainCamera.transform.position - var_114_31.position

				var_114_31.forward = Vector3.New(var_114_38.x, var_114_38.y, var_114_38.z)

				local var_114_39 = var_114_31.localEulerAngles

				var_114_39.z = 0
				var_114_39.x = 0
				var_114_31.localEulerAngles = var_114_39
			end

			if arg_111_1.frameCnt_ <= 1 then
				arg_111_1.dialog_:SetActive(false)
			end

			local var_114_40 = 2
			local var_114_41 = 0.75

			if var_114_40 < arg_111_1.time_ and arg_111_1.time_ <= var_114_40 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				arg_111_1.dialog_:SetActive(true)

				local var_114_42 = LeanTween.value(arg_111_1.dialog_, 0, 1, 0.3)

				var_114_42:setOnUpdate(LuaHelper.FloatAction(function(arg_115_0)
					arg_111_1.dialogCg_.alpha = arg_115_0
				end))
				var_114_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_111_1.dialog_)
					var_114_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_111_1.duration_ = arg_111_1.duration_ + 0.3

				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_43 = arg_111_1:FormatText(StoryNameCfg[562].name)

				arg_111_1.leftNameTxt_.text = var_114_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_44 = arg_111_1:GetWordFromCfg(317181028)
				local var_114_45 = arg_111_1:FormatText(var_114_44.content)

				arg_111_1.text_.text = var_114_45

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_46 = 30
				local var_114_47 = utf8.len(var_114_45)
				local var_114_48 = var_114_46 <= 0 and var_114_41 or var_114_41 * (var_114_47 / var_114_46)

				if var_114_48 > 0 and var_114_41 < var_114_48 then
					arg_111_1.talkMaxDuration = var_114_48
					var_114_40 = var_114_40 + 0.3

					if var_114_48 + var_114_40 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_48 + var_114_40
					end
				end

				arg_111_1.text_.text = var_114_45
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181028", "story_v_out_317181.awb") ~= 0 then
					local var_114_49 = manager.audio:GetVoiceLength("story_v_out_317181", "317181028", "story_v_out_317181.awb") / 1000

					if var_114_49 + var_114_40 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_49 + var_114_40
					end

					if var_114_44.prefab_name ~= "" and arg_111_1.actors_[var_114_44.prefab_name] ~= nil then
						local var_114_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_44.prefab_name].transform, "story_v_out_317181", "317181028", "story_v_out_317181.awb")

						arg_111_1:RecordAudio("317181028", var_114_50)
						arg_111_1:RecordAudio("317181028", var_114_50)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_317181", "317181028", "story_v_out_317181.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_317181", "317181028", "story_v_out_317181.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_51 = var_114_40 + 0.3
			local var_114_52 = math.max(var_114_41, arg_111_1.talkMaxDuration)

			if var_114_51 <= arg_111_1.time_ and arg_111_1.time_ < var_114_51 + var_114_52 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_51) / var_114_52

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_51 + var_114_52 and arg_111_1.time_ < var_114_51 + var_114_52 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play317181029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 317181029
		arg_117_1.duration_ = 7

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play317181030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = "YA0202_blur"

			if arg_117_1.bgs_[var_120_0] == nil then
				local var_120_1 = Object.Instantiate(arg_117_1.paintGo_)

				var_120_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_120_0)
				var_120_1.name = var_120_0
				var_120_1.transform.parent = arg_117_1.stage_.transform
				var_120_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_117_1.bgs_[var_120_0] = var_120_1
			end

			local var_120_2 = 0

			if var_120_2 < arg_117_1.time_ and arg_117_1.time_ <= var_120_2 + arg_120_0 then
				local var_120_3 = manager.ui.mainCamera.transform.localPosition
				local var_120_4 = Vector3.New(0, 0, 10) + Vector3.New(var_120_3.x, var_120_3.y, 0)
				local var_120_5 = arg_117_1.bgs_.YA0202_blur

				var_120_5.transform.localPosition = var_120_4
				var_120_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_120_6 = var_120_5:GetComponent("SpriteRenderer")

				if var_120_6 and var_120_6.sprite then
					local var_120_7 = (var_120_5.transform.localPosition - var_120_3).z
					local var_120_8 = manager.ui.mainCameraCom_
					local var_120_9 = 2 * var_120_7 * Mathf.Tan(var_120_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_120_10 = var_120_9 * var_120_8.aspect
					local var_120_11 = var_120_6.sprite.bounds.size.x
					local var_120_12 = var_120_6.sprite.bounds.size.y
					local var_120_13 = var_120_10 / var_120_11
					local var_120_14 = var_120_9 / var_120_12
					local var_120_15 = var_120_14 < var_120_13 and var_120_13 or var_120_14

					var_120_5.transform.localScale = Vector3.New(var_120_15, var_120_15, 0)
				end

				for iter_120_0, iter_120_1 in pairs(arg_117_1.bgs_) do
					if iter_120_0 ~= "YA0202_blur" then
						iter_120_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_120_16 = 0

			if var_120_16 < arg_117_1.time_ and arg_117_1.time_ <= var_120_16 + arg_120_0 then
				arg_117_1.mask_.enabled = true
				arg_117_1.mask_.raycastTarget = true

				arg_117_1:SetGaussion(false)
			end

			local var_120_17 = 2

			if var_120_16 <= arg_117_1.time_ and arg_117_1.time_ < var_120_16 + var_120_17 then
				local var_120_18 = (arg_117_1.time_ - var_120_16) / var_120_17
				local var_120_19 = Color.New(0, 0, 0)

				var_120_19.a = Mathf.Lerp(1, 0, var_120_18)
				arg_117_1.mask_.color = var_120_19
			end

			if arg_117_1.time_ >= var_120_16 + var_120_17 and arg_117_1.time_ < var_120_16 + var_120_17 + arg_120_0 then
				local var_120_20 = Color.New(0, 0, 0)
				local var_120_21 = 0

				arg_117_1.mask_.enabled = false
				var_120_20.a = var_120_21
				arg_117_1.mask_.color = var_120_20
			end

			local var_120_22 = "YA0202"

			if arg_117_1.bgs_[var_120_22] == nil then
				local var_120_23 = Object.Instantiate(arg_117_1.blurPaintGo_)
				local var_120_24 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_120_22)

				var_120_23:GetComponent("SpriteRenderer").sprite = var_120_24
				var_120_23.name = var_120_22
				var_120_23.transform.parent = arg_117_1.stage_.transform
				var_120_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_117_1.bgs_[var_120_22] = var_120_23
			end

			local var_120_25 = 0
			local var_120_26 = arg_117_1.bgs_[var_120_22]

			if var_120_25 < arg_117_1.time_ and arg_117_1.time_ <= var_120_25 + arg_120_0 then
				local var_120_27 = manager.ui.mainCamera.transform.localPosition
				local var_120_28 = Vector3.New(0, 0, 10) + Vector3.New(var_120_27.x, var_120_27.y, 0)

				var_120_26.transform.localPosition = var_120_28
				var_120_26.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_120_29 = var_120_26:GetComponent("SpriteRenderer")

				if var_120_29 and var_120_29.sprite then
					local var_120_30 = (var_120_26.transform.localPosition - var_120_27).z
					local var_120_31 = manager.ui.mainCameraCom_
					local var_120_32 = 2 * var_120_30 * Mathf.Tan(var_120_31.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_120_33 = var_120_32 * var_120_31.aspect
					local var_120_34 = var_120_29.sprite.bounds.size.x
					local var_120_35 = var_120_29.sprite.bounds.size.y
					local var_120_36 = var_120_33 / var_120_34
					local var_120_37 = var_120_32 / var_120_35
					local var_120_38 = var_120_37 < var_120_36 and var_120_36 or var_120_37

					var_120_26.transform.localScale = Vector3.New(var_120_38, var_120_38, 0)
				end
			end

			local var_120_39 = 2.53333333333333

			if var_120_25 <= arg_117_1.time_ and arg_117_1.time_ < var_120_25 + var_120_39 then
				local var_120_40 = (arg_117_1.time_ - var_120_25) / var_120_39
				local var_120_41 = Color.New(1, 1, 1)

				var_120_41.a = Mathf.Lerp(0, 1, var_120_40)

				var_120_26:GetComponent("SpriteRenderer").material:SetColor("_Color", var_120_41)
			end

			if arg_117_1.frameCnt_ <= 1 then
				arg_117_1.dialog_:SetActive(false)
			end

			local var_120_42 = 2
			local var_120_43 = 1.125

			if var_120_42 < arg_117_1.time_ and arg_117_1.time_ <= var_120_42 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0

				arg_117_1.dialog_:SetActive(true)

				local var_120_44 = LeanTween.value(arg_117_1.dialog_, 0, 1, 0.3)

				var_120_44:setOnUpdate(LuaHelper.FloatAction(function(arg_121_0)
					arg_117_1.dialogCg_.alpha = arg_121_0
				end))
				var_120_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_117_1.dialog_)
					var_120_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_117_1.duration_ = arg_117_1.duration_ + 0.3

				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_45 = arg_117_1:GetWordFromCfg(317181029)
				local var_120_46 = arg_117_1:FormatText(var_120_45.content)

				arg_117_1.text_.text = var_120_46

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_47 = 45
				local var_120_48 = utf8.len(var_120_46)
				local var_120_49 = var_120_47 <= 0 and var_120_43 or var_120_43 * (var_120_48 / var_120_47)

				if var_120_49 > 0 and var_120_43 < var_120_49 then
					arg_117_1.talkMaxDuration = var_120_49
					var_120_42 = var_120_42 + 0.3

					if var_120_49 + var_120_42 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_49 + var_120_42
					end
				end

				arg_117_1.text_.text = var_120_46
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_50 = var_120_42 + 0.3
			local var_120_51 = math.max(var_120_43, arg_117_1.talkMaxDuration)

			if var_120_50 <= arg_117_1.time_ and arg_117_1.time_ < var_120_50 + var_120_51 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_50) / var_120_51

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_50 + var_120_51 and arg_117_1.time_ < var_120_50 + var_120_51 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play317181030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 317181030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play317181031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 2

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_2 = arg_123_1:GetWordFromCfg(317181030)
				local var_126_3 = arg_123_1:FormatText(var_126_2.content)

				arg_123_1.text_.text = var_126_3

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_4 = 80
				local var_126_5 = utf8.len(var_126_3)
				local var_126_6 = var_126_4 <= 0 and var_126_1 or var_126_1 * (var_126_5 / var_126_4)

				if var_126_6 > 0 and var_126_1 < var_126_6 then
					arg_123_1.talkMaxDuration = var_126_6

					if var_126_6 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_6 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_3
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_7 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_7 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_7

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_7 and arg_123_1.time_ < var_126_0 + var_126_7 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play317181031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 317181031
		arg_127_1.duration_ = 3.666

		local var_127_0 = {
			zh = 1.566,
			ja = 3.666
		}
		local var_127_1 = manager.audio:GetLocalizationFlag()

		if var_127_0[var_127_1] ~= nil then
			arg_127_1.duration_ = var_127_0[var_127_1]
		end

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play317181032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.15

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[92].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(317181031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 6
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181031", "story_v_out_317181.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_317181", "317181031", "story_v_out_317181.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_317181", "317181031", "story_v_out_317181.awb")

						arg_127_1:RecordAudio("317181031", var_130_9)
						arg_127_1:RecordAudio("317181031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_317181", "317181031", "story_v_out_317181.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_317181", "317181031", "story_v_out_317181.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play317181032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 317181032
		arg_131_1.duration_ = 3.666

		local var_131_0 = {
			zh = 2.566,
			ja = 3.666
		}
		local var_131_1 = manager.audio:GetLocalizationFlag()

		if var_131_0[var_131_1] ~= nil then
			arg_131_1.duration_ = var_131_0[var_131_1]
		end

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play317181033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.2

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[563].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(317181032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 8
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181032", "story_v_out_317181.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_317181", "317181032", "story_v_out_317181.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_317181", "317181032", "story_v_out_317181.awb")

						arg_131_1:RecordAudio("317181032", var_134_9)
						arg_131_1:RecordAudio("317181032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_317181", "317181032", "story_v_out_317181.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_317181", "317181032", "story_v_out_317181.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_10 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_10 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_10

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_10 and arg_131_1.time_ < var_134_0 + var_134_10 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play317181033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 317181033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play317181034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.7

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_2 = arg_135_1:GetWordFromCfg(317181033)
				local var_138_3 = arg_135_1:FormatText(var_138_2.content)

				arg_135_1.text_.text = var_138_3

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_4 = 28
				local var_138_5 = utf8.len(var_138_3)
				local var_138_6 = var_138_4 <= 0 and var_138_1 or var_138_1 * (var_138_5 / var_138_4)

				if var_138_6 > 0 and var_138_1 < var_138_6 then
					arg_135_1.talkMaxDuration = var_138_6

					if var_138_6 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_6 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_3
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_7 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_7 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_7

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_7 and arg_135_1.time_ < var_138_0 + var_138_7 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play317181034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 317181034
		arg_139_1.duration_ = 6.533

		local var_139_0 = {
			zh = 6,
			ja = 6.533
		}
		local var_139_1 = manager.audio:GetLocalizationFlag()

		if var_139_0[var_139_1] ~= nil then
			arg_139_1.duration_ = var_139_0[var_139_1]
		end

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play317181035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.525

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[563].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(317181034)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 21
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181034", "story_v_out_317181.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_317181", "317181034", "story_v_out_317181.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_317181", "317181034", "story_v_out_317181.awb")

						arg_139_1:RecordAudio("317181034", var_142_9)
						arg_139_1:RecordAudio("317181034", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_317181", "317181034", "story_v_out_317181.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_317181", "317181034", "story_v_out_317181.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play317181035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 317181035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play317181036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.6

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(317181035)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 24
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play317181036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 317181036
		arg_147_1.duration_ = 6.666

		local var_147_0 = {
			zh = 4.2,
			ja = 6.666
		}
		local var_147_1 = manager.audio:GetLocalizationFlag()

		if var_147_0[var_147_1] ~= nil then
			arg_147_1.duration_ = var_147_0[var_147_1]
		end

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
			arg_147_1.auto_ = false
		end

		function arg_147_1.playNext_(arg_149_0)
			arg_147_1.onStoryFinished_()
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.35

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[92].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(317181036)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 14
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317181", "317181036", "story_v_out_317181.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_317181", "317181036", "story_v_out_317181.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_317181", "317181036", "story_v_out_317181.awb")

						arg_147_1:RecordAudio("317181036", var_150_9)
						arg_147_1:RecordAudio("317181036", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_317181", "317181036", "story_v_out_317181.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_317181", "317181036", "story_v_out_317181.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST58",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/YA0202_blur"
	},
	voices = {
		"story_v_out_317181.awb"
	}
}
