return {
	Play106122001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 106122001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play106122002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "C01b"

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
				local var_4_5 = arg_1_1.bgs_.C01b

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
					if iter_4_0 ~= "C01b" then
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
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_27 = 2

			if arg_1_1.time_ >= var_4_26 + var_4_27 and arg_1_1.time_ < var_4_26 + var_4_27 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_28 = 2
			local var_4_29 = 1.225

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_30 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_30:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_31 = arg_1_1:GetWordFromCfg(106122001)
				local var_4_32 = arg_1_1:FormatText(var_4_31.content)

				arg_1_1.text_.text = var_4_32

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_33 = 49
				local var_4_34 = utf8.len(var_4_32)
				local var_4_35 = var_4_33 <= 0 and var_4_29 or var_4_29 * (var_4_34 / var_4_33)

				if var_4_35 > 0 and var_4_29 < var_4_35 then
					arg_1_1.talkMaxDuration = var_4_35
					var_4_28 = var_4_28 + 0.3

					if var_4_35 + var_4_28 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_35 + var_4_28
					end
				end

				arg_1_1.text_.text = var_4_32
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_36 = var_4_28 + 0.3
			local var_4_37 = math.max(var_4_29, arg_1_1.talkMaxDuration)

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_36) / var_4_37

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play106122002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 106122002
		arg_7_1.duration_ = 6.933

		local var_7_0 = {
			ja = 4.333,
			ko = 5.6,
			zh = 4.833,
			en = 6.933
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
				arg_7_0:Play106122003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "4014_tpose"

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

			local var_10_4 = arg_7_1.actors_["4014_tpose"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect4014_tpose == nil then
				arg_7_1.var_.characterEffect4014_tpose = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect4014_tpose then
					arg_7_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect4014_tpose then
				arg_7_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["4014_tpose"].transform
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.var_.moveOldPos4014_tpose = var_10_8.localPosition
			end

			local var_10_10 = 0.001

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10
				local var_10_12 = Vector3.New(0, -1.95, -4.2)

				var_10_8.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos4014_tpose, var_10_12, var_10_11)

				local var_10_13 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_13.x, var_10_13.y, var_10_13.z)

				local var_10_14 = var_10_8.localEulerAngles

				var_10_14.z = 0
				var_10_14.x = 0
				var_10_8.localEulerAngles = var_10_14
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 then
				var_10_8.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_8.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_8.localEulerAngles = var_10_16
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_10_18 = 0
			local var_10_19 = 0.575

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_20 = arg_7_1:FormatText(StoryNameCfg[87].name)

				arg_7_1.leftNameTxt_.text = var_10_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_21 = arg_7_1:GetWordFromCfg(106122002)
				local var_10_22 = arg_7_1:FormatText(var_10_21.content)

				arg_7_1.text_.text = var_10_22

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_23 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122002", "story_v_out_106122.awb") ~= 0 then
					local var_10_26 = manager.audio:GetVoiceLength("story_v_out_106122", "106122002", "story_v_out_106122.awb") / 1000

					if var_10_26 + var_10_18 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_18
					end

					if var_10_21.prefab_name ~= "" and arg_7_1.actors_[var_10_21.prefab_name] ~= nil then
						local var_10_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_21.prefab_name].transform, "story_v_out_106122", "106122002", "story_v_out_106122.awb")

						arg_7_1:RecordAudio("106122002", var_10_27)
						arg_7_1:RecordAudio("106122002", var_10_27)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_106122", "106122002", "story_v_out_106122.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_106122", "106122002", "story_v_out_106122.awb")
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
	Play106122003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 106122003
		arg_11_1.duration_ = 11

		local var_11_0 = {
			ja = 9.733,
			ko = 11,
			zh = 7.3,
			en = 10.066
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
				arg_11_0:Play106122004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.775

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[87].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(106122003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 31
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122003", "story_v_out_106122.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_106122", "106122003", "story_v_out_106122.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_106122", "106122003", "story_v_out_106122.awb")

						arg_11_1:RecordAudio("106122003", var_14_9)
						arg_11_1:RecordAudio("106122003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_106122", "106122003", "story_v_out_106122.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_106122", "106122003", "story_v_out_106122.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play106122004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 106122004
		arg_15_1.duration_ = 5.8

		local var_15_0 = {
			ja = 5.8,
			ko = 5.2,
			zh = 5.133,
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
				arg_15_0:Play106122005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1093ui_story"

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

			local var_18_4 = arg_15_1.actors_["1093ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story == nil then
				arg_15_1.var_.characterEffect1093ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1093ui_story then
					arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1093ui_story then
				arg_15_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["4014_tpose"]
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 and arg_15_1.var_.characterEffect4014_tpose == nil then
				arg_15_1.var_.characterEffect4014_tpose = var_18_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_10 = 0.1

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10

				if arg_15_1.var_.characterEffect4014_tpose then
					local var_18_12 = Mathf.Lerp(0, 0.5, var_18_11)

					arg_15_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_15_1.var_.characterEffect4014_tpose.fillRatio = var_18_12
				end
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect4014_tpose then
				local var_18_13 = 0.5

				arg_15_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_15_1.var_.characterEffect4014_tpose.fillRatio = var_18_13
			end

			local var_18_14 = arg_15_1.actors_["4014_tpose"].transform
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.var_.moveOldPos4014_tpose = var_18_14.localPosition
			end

			local var_18_16 = 0.001

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16
				local var_18_18 = Vector3.New(0, 100, 0)

				var_18_14.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos4014_tpose, var_18_18, var_18_17)

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

			local var_18_23 = arg_15_1.actors_["1093ui_story"].transform
			local var_18_24 = 0

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.var_.moveOldPos1093ui_story = var_18_23.localPosition

				local var_18_25 = "1093ui_story"

				arg_15_1:ShowWeapon(arg_15_1.var_[var_18_25 .. "Animator"].transform, true)
			end

			local var_18_26 = 0.001

			if var_18_24 <= arg_15_1.time_ and arg_15_1.time_ < var_18_24 + var_18_26 then
				local var_18_27 = (arg_15_1.time_ - var_18_24) / var_18_26
				local var_18_28 = Vector3.New(0, -1.11, -5.88)

				var_18_23.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1093ui_story, var_18_28, var_18_27)

				local var_18_29 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_29.x, var_18_29.y, var_18_29.z)

				local var_18_30 = var_18_23.localEulerAngles

				var_18_30.z = 0
				var_18_30.x = 0
				var_18_23.localEulerAngles = var_18_30
			end

			if arg_15_1.time_ >= var_18_24 + var_18_26 and arg_15_1.time_ < var_18_24 + var_18_26 + arg_18_0 then
				var_18_23.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_18_31 = manager.ui.mainCamera.transform.position - var_18_23.position

				var_18_23.forward = Vector3.New(var_18_31.x, var_18_31.y, var_18_31.z)

				local var_18_32 = var_18_23.localEulerAngles

				var_18_32.z = 0
				var_18_32.x = 0
				var_18_23.localEulerAngles = var_18_32
			end

			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action10_2")
			end

			local var_18_34 = 0

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 then
				arg_15_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_35 = 0
			local var_18_36 = 0.45

			if var_18_35 < arg_15_1.time_ and arg_15_1.time_ <= var_18_35 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_37 = arg_15_1:FormatText(StoryNameCfg[73].name)

				arg_15_1.leftNameTxt_.text = var_18_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_38 = arg_15_1:GetWordFromCfg(106122004)
				local var_18_39 = arg_15_1:FormatText(var_18_38.content)

				arg_15_1.text_.text = var_18_39

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_40 = 17
				local var_18_41 = utf8.len(var_18_39)
				local var_18_42 = var_18_40 <= 0 and var_18_36 or var_18_36 * (var_18_41 / var_18_40)

				if var_18_42 > 0 and var_18_36 < var_18_42 then
					arg_15_1.talkMaxDuration = var_18_42

					if var_18_42 + var_18_35 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_35
					end
				end

				arg_15_1.text_.text = var_18_39
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122004", "story_v_out_106122.awb") ~= 0 then
					local var_18_43 = manager.audio:GetVoiceLength("story_v_out_106122", "106122004", "story_v_out_106122.awb") / 1000

					if var_18_43 + var_18_35 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_43 + var_18_35
					end

					if var_18_38.prefab_name ~= "" and arg_15_1.actors_[var_18_38.prefab_name] ~= nil then
						local var_18_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_38.prefab_name].transform, "story_v_out_106122", "106122004", "story_v_out_106122.awb")

						arg_15_1:RecordAudio("106122004", var_18_44)
						arg_15_1:RecordAudio("106122004", var_18_44)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_106122", "106122004", "story_v_out_106122.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_106122", "106122004", "story_v_out_106122.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_45 = math.max(var_18_36, arg_15_1.talkMaxDuration)

			if var_18_35 <= arg_15_1.time_ and arg_15_1.time_ < var_18_35 + var_18_45 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_35) / var_18_45

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_35 + var_18_45 and arg_15_1.time_ < var_18_35 + var_18_45 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play106122005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 106122005
		arg_19_1.duration_ = 4.433

		local var_19_0 = {
			ja = 2.3,
			ko = 1.999999999999,
			zh = 2.866,
			en = 4.433
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
				arg_19_0:Play106122006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["4014_tpose"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect4014_tpose == nil then
				arg_19_1.var_.characterEffect4014_tpose = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect4014_tpose then
					arg_19_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect4014_tpose then
				arg_19_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1093ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story == nil then
				arg_19_1.var_.characterEffect1093ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1093ui_story then
					local var_22_8 = Mathf.Lerp(0, 0.5, var_22_7)

					arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_8
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1093ui_story then
				local var_22_9 = 0.5

				arg_19_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1093ui_story.fillRatio = var_22_9
			end

			local var_22_10 = arg_19_1.actors_["1093ui_story"].transform
			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.var_.moveOldPos1093ui_story = var_22_10.localPosition
			end

			local var_22_12 = 0.001

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_12 then
				local var_22_13 = (arg_19_1.time_ - var_22_11) / var_22_12
				local var_22_14 = Vector3.New(0, 100, 0)

				var_22_10.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1093ui_story, var_22_14, var_22_13)

				local var_22_15 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_15.x, var_22_15.y, var_22_15.z)

				local var_22_16 = var_22_10.localEulerAngles

				var_22_16.z = 0
				var_22_16.x = 0
				var_22_10.localEulerAngles = var_22_16
			end

			if arg_19_1.time_ >= var_22_11 + var_22_12 and arg_19_1.time_ < var_22_11 + var_22_12 + arg_22_0 then
				var_22_10.localPosition = Vector3.New(0, 100, 0)

				local var_22_17 = manager.ui.mainCamera.transform.position - var_22_10.position

				var_22_10.forward = Vector3.New(var_22_17.x, var_22_17.y, var_22_17.z)

				local var_22_18 = var_22_10.localEulerAngles

				var_22_18.z = 0
				var_22_18.x = 0
				var_22_10.localEulerAngles = var_22_18
			end

			local var_22_19 = arg_19_1.actors_["4014_tpose"].transform
			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1.var_.moveOldPos4014_tpose = var_22_19.localPosition
			end

			local var_22_21 = 0.001

			if var_22_20 <= arg_19_1.time_ and arg_19_1.time_ < var_22_20 + var_22_21 then
				local var_22_22 = (arg_19_1.time_ - var_22_20) / var_22_21
				local var_22_23 = Vector3.New(0, -1.95, -4.2)

				var_22_19.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos4014_tpose, var_22_23, var_22_22)

				local var_22_24 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_24.x, var_22_24.y, var_22_24.z)

				local var_22_25 = var_22_19.localEulerAngles

				var_22_25.z = 0
				var_22_25.x = 0
				var_22_19.localEulerAngles = var_22_25
			end

			if arg_19_1.time_ >= var_22_20 + var_22_21 and arg_19_1.time_ < var_22_20 + var_22_21 + arg_22_0 then
				var_22_19.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_22_26 = manager.ui.mainCamera.transform.position - var_22_19.position

				var_22_19.forward = Vector3.New(var_22_26.x, var_22_26.y, var_22_26.z)

				local var_22_27 = var_22_19.localEulerAngles

				var_22_27.z = 0
				var_22_27.x = 0
				var_22_19.localEulerAngles = var_22_27
			end

			local var_22_28 = 0

			if var_22_28 < arg_19_1.time_ and arg_19_1.time_ <= var_22_28 + arg_22_0 then
				arg_19_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_22_29 = 0
			local var_22_30 = 0.225

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_31 = arg_19_1:FormatText(StoryNameCfg[87].name)

				arg_19_1.leftNameTxt_.text = var_22_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_32 = arg_19_1:GetWordFromCfg(106122005)
				local var_22_33 = arg_19_1:FormatText(var_22_32.content)

				arg_19_1.text_.text = var_22_33

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_34 = 9
				local var_22_35 = utf8.len(var_22_33)
				local var_22_36 = var_22_34 <= 0 and var_22_30 or var_22_30 * (var_22_35 / var_22_34)

				if var_22_36 > 0 and var_22_30 < var_22_36 then
					arg_19_1.talkMaxDuration = var_22_36

					if var_22_36 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_29
					end
				end

				arg_19_1.text_.text = var_22_33
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122005", "story_v_out_106122.awb") ~= 0 then
					local var_22_37 = manager.audio:GetVoiceLength("story_v_out_106122", "106122005", "story_v_out_106122.awb") / 1000

					if var_22_37 + var_22_29 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_37 + var_22_29
					end

					if var_22_32.prefab_name ~= "" and arg_19_1.actors_[var_22_32.prefab_name] ~= nil then
						local var_22_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_32.prefab_name].transform, "story_v_out_106122", "106122005", "story_v_out_106122.awb")

						arg_19_1:RecordAudio("106122005", var_22_38)
						arg_19_1:RecordAudio("106122005", var_22_38)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_106122", "106122005", "story_v_out_106122.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_106122", "106122005", "story_v_out_106122.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_39 = math.max(var_22_30, arg_19_1.talkMaxDuration)

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_39 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_29) / var_22_39

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_29 + var_22_39 and arg_19_1.time_ < var_22_29 + var_22_39 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play106122006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 106122006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play106122007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["4014_tpose"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect4014_tpose == nil then
				arg_23_1.var_.characterEffect4014_tpose = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect4014_tpose then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_23_1.var_.characterEffect4014_tpose.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect4014_tpose then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_23_1.var_.characterEffect4014_tpose.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.75

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(106122006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 30
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_7 or var_26_7 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_7 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_13 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_13 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_13

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_13 and arg_23_1.time_ < var_26_6 + var_26_13 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play106122007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 106122007
		arg_27_1.duration_ = 4.366

		local var_27_0 = {
			ja = 4.366,
			ko = 4.366,
			zh = 3.633,
			en = 3.1
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
				arg_27_0:Play106122008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["4014_tpose"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect4014_tpose == nil then
				arg_27_1.var_.characterEffect4014_tpose = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect4014_tpose then
					arg_27_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect4014_tpose then
				arg_27_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["4014_tpose"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos4014_tpose = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(0, -1.95, -4.2)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos4014_tpose, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_30_14 = 0
			local var_30_15 = 0.35

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_16 = arg_27_1:FormatText(StoryNameCfg[87].name)

				arg_27_1.leftNameTxt_.text = var_30_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_17 = arg_27_1:GetWordFromCfg(106122007)
				local var_30_18 = arg_27_1:FormatText(var_30_17.content)

				arg_27_1.text_.text = var_30_18

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_19 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122007", "story_v_out_106122.awb") ~= 0 then
					local var_30_22 = manager.audio:GetVoiceLength("story_v_out_106122", "106122007", "story_v_out_106122.awb") / 1000

					if var_30_22 + var_30_14 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_22 + var_30_14
					end

					if var_30_17.prefab_name ~= "" and arg_27_1.actors_[var_30_17.prefab_name] ~= nil then
						local var_30_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_17.prefab_name].transform, "story_v_out_106122", "106122007", "story_v_out_106122.awb")

						arg_27_1:RecordAudio("106122007", var_30_23)
						arg_27_1:RecordAudio("106122007", var_30_23)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_106122", "106122007", "story_v_out_106122.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_106122", "106122007", "story_v_out_106122.awb")
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
	Play106122008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 106122008
		arg_31_1.duration_ = 3.2

		local var_31_0 = {
			ja = 2.866,
			ko = 1.6,
			zh = 1.9,
			en = 3.2
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
				arg_31_0:Play106122009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1093ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1093ui_story == nil then
				arg_31_1.var_.characterEffect1093ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1093ui_story then
					arg_31_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1093ui_story then
				arg_31_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["4014_tpose"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect4014_tpose == nil then
				arg_31_1.var_.characterEffect4014_tpose = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect4014_tpose then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_31_1.var_.characterEffect4014_tpose.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect4014_tpose then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_31_1.var_.characterEffect4014_tpose.fillRatio = var_34_9
			end

			local var_34_10 = arg_31_1.actors_["4014_tpose"].transform
			local var_34_11 = 0

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.var_.moveOldPos4014_tpose = var_34_10.localPosition

				local var_34_12 = "4014_tpose"

				arg_31_1:ShowWeapon(arg_31_1.var_[var_34_12 .. "Animator"].transform, true)
			end

			local var_34_13 = 0.001

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_13 then
				local var_34_14 = (arg_31_1.time_ - var_34_11) / var_34_13
				local var_34_15 = Vector3.New(0, 100, 0)

				var_34_10.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos4014_tpose, var_34_15, var_34_14)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_10.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_10.localEulerAngles = var_34_17
			end

			if arg_31_1.time_ >= var_34_11 + var_34_13 and arg_31_1.time_ < var_34_11 + var_34_13 + arg_34_0 then
				var_34_10.localPosition = Vector3.New(0, 100, 0)

				local var_34_18 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_18.x, var_34_18.y, var_34_18.z)

				local var_34_19 = var_34_10.localEulerAngles

				var_34_19.z = 0
				var_34_19.x = 0
				var_34_10.localEulerAngles = var_34_19
			end

			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_34_21 = 0
			local var_34_22 = 0.175

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_23 = arg_31_1:FormatText(StoryNameCfg[73].name)

				arg_31_1.leftNameTxt_.text = var_34_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_24 = arg_31_1:GetWordFromCfg(106122008)
				local var_34_25 = arg_31_1:FormatText(var_34_24.content)

				arg_31_1.text_.text = var_34_25

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_26 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122008", "story_v_out_106122.awb") ~= 0 then
					local var_34_29 = manager.audio:GetVoiceLength("story_v_out_106122", "106122008", "story_v_out_106122.awb") / 1000

					if var_34_29 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_21
					end

					if var_34_24.prefab_name ~= "" and arg_31_1.actors_[var_34_24.prefab_name] ~= nil then
						local var_34_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_24.prefab_name].transform, "story_v_out_106122", "106122008", "story_v_out_106122.awb")

						arg_31_1:RecordAudio("106122008", var_34_30)
						arg_31_1:RecordAudio("106122008", var_34_30)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_106122", "106122008", "story_v_out_106122.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_106122", "106122008", "story_v_out_106122.awb")
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
	Play106122009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 106122009
		arg_35_1.duration_ = 4.066

		local var_35_0 = {
			ja = 4.066,
			ko = 2.633,
			zh = 2.866,
			en = 2.9
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
				arg_35_0:Play106122010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["4014_tpose"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect4014_tpose == nil then
				arg_35_1.var_.characterEffect4014_tpose = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect4014_tpose then
					arg_35_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect4014_tpose then
				arg_35_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1093ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story == nil then
				arg_35_1.var_.characterEffect1093ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1093ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1093ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1093ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1093ui_story.fillRatio = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["1093ui_story"].transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.moveOldPos1093ui_story = var_38_10.localPosition

				local var_38_12 = "1093ui_story"

				arg_35_1:ShowWeapon(arg_35_1.var_[var_38_12 .. "Animator"].transform, true)
			end

			local var_38_13 = 0.001

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_13 then
				local var_38_14 = (arg_35_1.time_ - var_38_11) / var_38_13
				local var_38_15 = Vector3.New(0, 100, 0)

				var_38_10.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1093ui_story, var_38_15, var_38_14)

				local var_38_16 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_16.x, var_38_16.y, var_38_16.z)

				local var_38_17 = var_38_10.localEulerAngles

				var_38_17.z = 0
				var_38_17.x = 0
				var_38_10.localEulerAngles = var_38_17
			end

			if arg_35_1.time_ >= var_38_11 + var_38_13 and arg_35_1.time_ < var_38_11 + var_38_13 + arg_38_0 then
				var_38_10.localPosition = Vector3.New(0, 100, 0)

				local var_38_18 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_18.x, var_38_18.y, var_38_18.z)

				local var_38_19 = var_38_10.localEulerAngles

				var_38_19.z = 0
				var_38_19.x = 0
				var_38_10.localEulerAngles = var_38_19
			end

			local var_38_20 = arg_35_1.actors_["4014_tpose"].transform
			local var_38_21 = 0

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.var_.moveOldPos4014_tpose = var_38_20.localPosition
			end

			local var_38_22 = 0.001

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_22 then
				local var_38_23 = (arg_35_1.time_ - var_38_21) / var_38_22
				local var_38_24 = Vector3.New(0, -1.95, -4.2)

				var_38_20.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos4014_tpose, var_38_24, var_38_23)

				local var_38_25 = manager.ui.mainCamera.transform.position - var_38_20.position

				var_38_20.forward = Vector3.New(var_38_25.x, var_38_25.y, var_38_25.z)

				local var_38_26 = var_38_20.localEulerAngles

				var_38_26.z = 0
				var_38_26.x = 0
				var_38_20.localEulerAngles = var_38_26
			end

			if arg_35_1.time_ >= var_38_21 + var_38_22 and arg_35_1.time_ < var_38_21 + var_38_22 + arg_38_0 then
				var_38_20.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_38_27 = manager.ui.mainCamera.transform.position - var_38_20.position

				var_38_20.forward = Vector3.New(var_38_27.x, var_38_27.y, var_38_27.z)

				local var_38_28 = var_38_20.localEulerAngles

				var_38_28.z = 0
				var_38_28.x = 0
				var_38_20.localEulerAngles = var_38_28
			end

			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 then
				arg_35_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_38_30 = 0
			local var_38_31 = 0.3

			if var_38_30 < arg_35_1.time_ and arg_35_1.time_ <= var_38_30 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_32 = arg_35_1:FormatText(StoryNameCfg[87].name)

				arg_35_1.leftNameTxt_.text = var_38_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_33 = arg_35_1:GetWordFromCfg(106122009)
				local var_38_34 = arg_35_1:FormatText(var_38_33.content)

				arg_35_1.text_.text = var_38_34

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_35 = 12
				local var_38_36 = utf8.len(var_38_34)
				local var_38_37 = var_38_35 <= 0 and var_38_31 or var_38_31 * (var_38_36 / var_38_35)

				if var_38_37 > 0 and var_38_31 < var_38_37 then
					arg_35_1.talkMaxDuration = var_38_37

					if var_38_37 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_37 + var_38_30
					end
				end

				arg_35_1.text_.text = var_38_34
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122009", "story_v_out_106122.awb") ~= 0 then
					local var_38_38 = manager.audio:GetVoiceLength("story_v_out_106122", "106122009", "story_v_out_106122.awb") / 1000

					if var_38_38 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_38 + var_38_30
					end

					if var_38_33.prefab_name ~= "" and arg_35_1.actors_[var_38_33.prefab_name] ~= nil then
						local var_38_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_33.prefab_name].transform, "story_v_out_106122", "106122009", "story_v_out_106122.awb")

						arg_35_1:RecordAudio("106122009", var_38_39)
						arg_35_1:RecordAudio("106122009", var_38_39)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_106122", "106122009", "story_v_out_106122.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_106122", "106122009", "story_v_out_106122.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_40 = math.max(var_38_31, arg_35_1.talkMaxDuration)

			if var_38_30 <= arg_35_1.time_ and arg_35_1.time_ < var_38_30 + var_38_40 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_30) / var_38_40

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_30 + var_38_40 and arg_35_1.time_ < var_38_30 + var_38_40 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play106122010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 106122010
		arg_39_1.duration_ = 7

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play106122011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["4014_tpose"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect4014_tpose == nil then
				arg_39_1.var_.characterEffect4014_tpose = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect4014_tpose then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_39_1.var_.characterEffect4014_tpose.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect4014_tpose then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_39_1.var_.characterEffect4014_tpose.fillRatio = var_42_5
			end

			local var_42_6 = arg_39_1.actors_["4014_tpose"].transform
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 then
				arg_39_1.var_.moveOldPos4014_tpose = var_42_6.localPosition
			end

			local var_42_8 = 0.001

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8
				local var_42_10 = Vector3.New(0, 100, 0)

				var_42_6.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos4014_tpose, var_42_10, var_42_9)

				local var_42_11 = manager.ui.mainCamera.transform.position - var_42_6.position

				var_42_6.forward = Vector3.New(var_42_11.x, var_42_11.y, var_42_11.z)

				local var_42_12 = var_42_6.localEulerAngles

				var_42_12.z = 0
				var_42_12.x = 0
				var_42_6.localEulerAngles = var_42_12
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 then
				var_42_6.localPosition = Vector3.New(0, 100, 0)

				local var_42_13 = manager.ui.mainCamera.transform.position - var_42_6.position

				var_42_6.forward = Vector3.New(var_42_13.x, var_42_13.y, var_42_13.z)

				local var_42_14 = var_42_6.localEulerAngles

				var_42_14.z = 0
				var_42_14.x = 0
				var_42_6.localEulerAngles = var_42_14
			end

			local var_42_15 = "STblack"

			if arg_39_1.bgs_[var_42_15] == nil then
				local var_42_16 = Object.Instantiate(arg_39_1.paintGo_)

				var_42_16:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_42_15)
				var_42_16.name = var_42_15
				var_42_16.transform.parent = arg_39_1.stage_.transform
				var_42_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_39_1.bgs_[var_42_15] = var_42_16
			end

			local var_42_17 = 0

			if var_42_17 < arg_39_1.time_ and arg_39_1.time_ <= var_42_17 + arg_42_0 then
				local var_42_18 = manager.ui.mainCamera.transform.localPosition
				local var_42_19 = Vector3.New(0, 0, 10) + Vector3.New(var_42_18.x, var_42_18.y, 0)
				local var_42_20 = arg_39_1.bgs_.STblack

				var_42_20.transform.localPosition = var_42_19
				var_42_20.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_21 = var_42_20:GetComponent("SpriteRenderer")

				if var_42_21 and var_42_21.sprite then
					local var_42_22 = (var_42_20.transform.localPosition - var_42_18).z
					local var_42_23 = manager.ui.mainCameraCom_
					local var_42_24 = 2 * var_42_22 * Mathf.Tan(var_42_23.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_25 = var_42_24 * var_42_23.aspect
					local var_42_26 = var_42_21.sprite.bounds.size.x
					local var_42_27 = var_42_21.sprite.bounds.size.y
					local var_42_28 = var_42_25 / var_42_26
					local var_42_29 = var_42_24 / var_42_27
					local var_42_30 = var_42_29 < var_42_28 and var_42_28 or var_42_29

					var_42_20.transform.localScale = Vector3.New(var_42_30, var_42_30, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "STblack" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_42_31 = 0

			if var_42_31 < arg_39_1.time_ and arg_39_1.time_ <= var_42_31 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_32 = 2

			if var_42_31 <= arg_39_1.time_ and arg_39_1.time_ < var_42_31 + var_42_32 then
				local var_42_33 = (arg_39_1.time_ - var_42_31) / var_42_32
				local var_42_34 = Color.New(0, 0, 0)

				var_42_34.a = Mathf.Lerp(1, 0, var_42_33)
				arg_39_1.mask_.color = var_42_34
			end

			if arg_39_1.time_ >= var_42_31 + var_42_32 and arg_39_1.time_ < var_42_31 + var_42_32 + arg_42_0 then
				local var_42_35 = Color.New(0, 0, 0)
				local var_42_36 = 0

				arg_39_1.mask_.enabled = false
				var_42_35.a = var_42_36
				arg_39_1.mask_.color = var_42_35
			end

			if arg_39_1.frameCnt_ <= 1 then
				arg_39_1.dialog_:SetActive(false)
			end

			local var_42_37 = 2
			local var_42_38 = 0.925

			if var_42_37 < arg_39_1.time_ and arg_39_1.time_ <= var_42_37 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_39 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_39:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_40 = arg_39_1:GetWordFromCfg(106122010)
				local var_42_41 = arg_39_1:FormatText(var_42_40.content)

				arg_39_1.text_.text = var_42_41

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_42 = 38
				local var_42_43 = utf8.len(var_42_41)
				local var_42_44 = var_42_42 <= 0 and var_42_38 or var_42_38 * (var_42_43 / var_42_42)

				if var_42_44 > 0 and var_42_38 < var_42_44 then
					arg_39_1.talkMaxDuration = var_42_44
					var_42_37 = var_42_37 + 0.3

					if var_42_44 + var_42_37 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_44 + var_42_37
					end
				end

				arg_39_1.text_.text = var_42_41
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_45 = var_42_37 + 0.3
			local var_42_46 = math.max(var_42_38, arg_39_1.talkMaxDuration)

			if var_42_45 <= arg_39_1.time_ and arg_39_1.time_ < var_42_45 + var_42_46 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_45) / var_42_46

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_45 + var_42_46 and arg_39_1.time_ < var_42_45 + var_42_46 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play106122011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 106122011
		arg_45_1.duration_ = 3.033

		local var_45_0 = {
			ja = 3.033,
			ko = 2.633,
			zh = 2.833,
			en = 2.833
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
				arg_45_0:Play106122012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1093ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1093ui_story == nil then
				arg_45_1.var_.characterEffect1093ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.1

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1093ui_story then
					arg_45_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1093ui_story then
				arg_45_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_48_4 = manager.ui.mainCamera.transform
			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1.var_.shakeOldPos = var_48_4.localPosition
			end

			local var_48_6 = 0.6

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / 0.066
				local var_48_8, var_48_9 = math.modf(var_48_7)

				var_48_4.localPosition = Vector3.New(var_48_9 * 0.13, var_48_9 * 0.13, var_48_9 * 0.13) + arg_45_1.var_.shakeOldPos
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 then
				var_48_4.localPosition = arg_45_1.var_.shakeOldPos
			end

			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_11 = 0.5

			if var_48_10 <= arg_45_1.time_ and arg_45_1.time_ < var_48_10 + var_48_11 then
				local var_48_12 = (arg_45_1.time_ - var_48_10) / var_48_11
				local var_48_13 = Color.New(1, 1, 1)

				var_48_13.a = Mathf.Lerp(1, 0, var_48_12)
				arg_45_1.mask_.color = var_48_13
			end

			if arg_45_1.time_ >= var_48_10 + var_48_11 and arg_45_1.time_ < var_48_10 + var_48_11 + arg_48_0 then
				local var_48_14 = Color.New(1, 1, 1)
				local var_48_15 = 0

				arg_45_1.mask_.enabled = false
				var_48_14.a = var_48_15
				arg_45_1.mask_.color = var_48_14
			end

			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				arg_45_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_17 = 0.6
			local var_48_18 = 0.25

			if var_48_17 < arg_45_1.time_ and arg_45_1.time_ <= var_48_17 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_19 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_19:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_19:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_19:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_20 = arg_45_1:FormatText(StoryNameCfg[73].name)

				arg_45_1.leftNameTxt_.text = var_48_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, true)
				arg_45_1.iconController_:SetSelectedState("hero")

				arg_45_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_21 = arg_45_1:GetWordFromCfg(106122011)
				local var_48_22 = arg_45_1:FormatText(var_48_21.content)

				arg_45_1.text_.text = var_48_22

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_23 = 10
				local var_48_24 = utf8.len(var_48_22)
				local var_48_25 = var_48_23 <= 0 and var_48_18 or var_48_18 * (var_48_24 / var_48_23)

				if var_48_25 > 0 and var_48_18 < var_48_25 then
					arg_45_1.talkMaxDuration = var_48_25
					var_48_17 = var_48_17 + 0.3

					if var_48_25 + var_48_17 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_25 + var_48_17
					end
				end

				arg_45_1.text_.text = var_48_22
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122011", "story_v_out_106122.awb") ~= 0 then
					local var_48_26 = manager.audio:GetVoiceLength("story_v_out_106122", "106122011", "story_v_out_106122.awb") / 1000

					if var_48_26 + var_48_17 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_26 + var_48_17
					end

					if var_48_21.prefab_name ~= "" and arg_45_1.actors_[var_48_21.prefab_name] ~= nil then
						local var_48_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_21.prefab_name].transform, "story_v_out_106122", "106122011", "story_v_out_106122.awb")

						arg_45_1:RecordAudio("106122011", var_48_27)
						arg_45_1:RecordAudio("106122011", var_48_27)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_106122", "106122011", "story_v_out_106122.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_106122", "106122011", "story_v_out_106122.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_28 = var_48_17 + 0.3
			local var_48_29 = math.max(var_48_18, arg_45_1.talkMaxDuration)

			if var_48_28 <= arg_45_1.time_ and arg_45_1.time_ < var_48_28 + var_48_29 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_28) / var_48_29

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_28 + var_48_29 and arg_45_1.time_ < var_48_28 + var_48_29 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play106122012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 106122012
		arg_51_1.duration_ = 8.566

		local var_51_0 = {
			ja = 7.466,
			ko = 8.566,
			zh = 7,
			en = 7.966
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
				arg_51_0:Play106122013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "S0611"

			if arg_51_1.bgs_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(arg_51_1.paintGo_)

				var_54_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_54_0)
				var_54_1.name = var_54_0
				var_54_1.transform.parent = arg_51_1.stage_.transform
				var_54_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.bgs_[var_54_0] = var_54_1
			end

			local var_54_2 = 0

			if var_54_2 < arg_51_1.time_ and arg_51_1.time_ <= var_54_2 + arg_54_0 then
				local var_54_3 = manager.ui.mainCamera.transform.localPosition
				local var_54_4 = Vector3.New(0, 0, 10) + Vector3.New(var_54_3.x, var_54_3.y, 0)
				local var_54_5 = arg_51_1.bgs_.S0611

				var_54_5.transform.localPosition = var_54_4
				var_54_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_54_6 = var_54_5:GetComponent("SpriteRenderer")

				if var_54_6 and var_54_6.sprite then
					local var_54_7 = (var_54_5.transform.localPosition - var_54_3).z
					local var_54_8 = manager.ui.mainCameraCom_
					local var_54_9 = 2 * var_54_7 * Mathf.Tan(var_54_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_54_10 = var_54_9 * var_54_8.aspect
					local var_54_11 = var_54_6.sprite.bounds.size.x
					local var_54_12 = var_54_6.sprite.bounds.size.y
					local var_54_13 = var_54_10 / var_54_11
					local var_54_14 = var_54_9 / var_54_12
					local var_54_15 = var_54_14 < var_54_13 and var_54_13 or var_54_14

					var_54_5.transform.localScale = Vector3.New(var_54_15, var_54_15, 0)
				end

				for iter_54_0, iter_54_1 in pairs(arg_51_1.bgs_) do
					if iter_54_0 ~= "S0611" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_17 = 2

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Color.New(0, 0, 0)

				var_54_19.a = Mathf.Lerp(1, 0, var_54_18)
				arg_51_1.mask_.color = var_54_19
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				local var_54_20 = Color.New(0, 0, 0)
				local var_54_21 = 0

				arg_51_1.mask_.enabled = false
				var_54_20.a = var_54_21
				arg_51_1.mask_.color = var_54_20
			end

			local var_54_22 = arg_51_1.bgs_.S0611.transform
			local var_54_23 = 0

			if var_54_23 < arg_51_1.time_ and arg_51_1.time_ <= var_54_23 + arg_54_0 then
				arg_51_1.var_.moveOldPosS0611 = var_54_22.localPosition
			end

			local var_54_24 = 0.001

			if var_54_23 <= arg_51_1.time_ and arg_51_1.time_ < var_54_23 + var_54_24 then
				local var_54_25 = (arg_51_1.time_ - var_54_23) / var_54_24
				local var_54_26 = Vector3.New(0, 1, 9)

				var_54_22.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosS0611, var_54_26, var_54_25)
			end

			if arg_51_1.time_ >= var_54_23 + var_54_24 and arg_51_1.time_ < var_54_23 + var_54_24 + arg_54_0 then
				var_54_22.localPosition = Vector3.New(0, 1, 9)
			end

			local var_54_27 = arg_51_1.bgs_.S0611.transform
			local var_54_28 = 0

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1.var_.moveOldPosS0611 = var_54_27.localPosition
			end

			local var_54_29 = 2.466

			if var_54_28 <= arg_51_1.time_ and arg_51_1.time_ < var_54_28 + var_54_29 then
				local var_54_30 = (arg_51_1.time_ - var_54_28) / var_54_29
				local var_54_31 = Vector3.New(0, 1, 10)

				var_54_27.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosS0611, var_54_31, var_54_30)
			end

			if arg_51_1.time_ >= var_54_28 + var_54_29 and arg_51_1.time_ < var_54_28 + var_54_29 + arg_54_0 then
				var_54_27.localPosition = Vector3.New(0, 1, 10)
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_32 = 2
			local var_54_33 = 0.5

			if var_54_32 < arg_51_1.time_ and arg_51_1.time_ <= var_54_32 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_34 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_34:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_35 = arg_51_1:FormatText(StoryNameCfg[87].name)

				arg_51_1.leftNameTxt_.text = var_54_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_36 = arg_51_1:GetWordFromCfg(106122012)
				local var_54_37 = arg_51_1:FormatText(var_54_36.content)

				arg_51_1.text_.text = var_54_37

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_38 = 20
				local var_54_39 = utf8.len(var_54_37)
				local var_54_40 = var_54_38 <= 0 and var_54_33 or var_54_33 * (var_54_39 / var_54_38)

				if var_54_40 > 0 and var_54_33 < var_54_40 then
					arg_51_1.talkMaxDuration = var_54_40
					var_54_32 = var_54_32 + 0.3

					if var_54_40 + var_54_32 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_40 + var_54_32
					end
				end

				arg_51_1.text_.text = var_54_37
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122012", "story_v_out_106122.awb") ~= 0 then
					local var_54_41 = manager.audio:GetVoiceLength("story_v_out_106122", "106122012", "story_v_out_106122.awb") / 1000

					if var_54_41 + var_54_32 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_41 + var_54_32
					end

					if var_54_36.prefab_name ~= "" and arg_51_1.actors_[var_54_36.prefab_name] ~= nil then
						local var_54_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_36.prefab_name].transform, "story_v_out_106122", "106122012", "story_v_out_106122.awb")

						arg_51_1:RecordAudio("106122012", var_54_42)
						arg_51_1:RecordAudio("106122012", var_54_42)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_106122", "106122012", "story_v_out_106122.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_106122", "106122012", "story_v_out_106122.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_43 = var_54_32 + 0.3
			local var_54_44 = math.max(var_54_33, arg_51_1.talkMaxDuration)

			if var_54_43 <= arg_51_1.time_ and arg_51_1.time_ < var_54_43 + var_54_44 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_43) / var_54_44

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_43 + var_54_44 and arg_51_1.time_ < var_54_43 + var_54_44 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play106122013 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 106122013
		arg_57_1.duration_ = 5.833

		local var_57_0 = {
			ja = 3.5,
			ko = 4.5,
			zh = 5.833,
			en = 4.2
		}
		local var_57_1 = manager.audio:GetLocalizationFlag()

		if var_57_0[var_57_1] ~= nil then
			arg_57_1.duration_ = var_57_0[var_57_1]
		end

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play106122014(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.4

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0

				arg_57_1.dialog_:SetActive(true)

				local var_60_2 = LeanTween.value(arg_57_1.dialog_, 0, 1, 0.3)

				var_60_2:setOnUpdate(LuaHelper.FloatAction(function(arg_61_0)
					arg_57_1.dialogCg_.alpha = arg_61_0
				end))
				var_60_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_57_1.dialog_)
					var_60_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_57_1.duration_ = arg_57_1.duration_ + 0.3

				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_3 = arg_57_1:FormatText(StoryNameCfg[73].name)

				arg_57_1.leftNameTxt_.text = var_60_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_4 = arg_57_1:GetWordFromCfg(106122013)
				local var_60_5 = arg_57_1:FormatText(var_60_4.content)

				arg_57_1.text_.text = var_60_5

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_6 = 16
				local var_60_7 = utf8.len(var_60_5)
				local var_60_8 = var_60_6 <= 0 and var_60_1 or var_60_1 * (var_60_7 / var_60_6)

				if var_60_8 > 0 and var_60_1 < var_60_8 then
					arg_57_1.talkMaxDuration = var_60_8
					var_60_0 = var_60_0 + 0.3

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_5
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122013", "story_v_out_106122.awb") ~= 0 then
					local var_60_9 = manager.audio:GetVoiceLength("story_v_out_106122", "106122013", "story_v_out_106122.awb") / 1000

					if var_60_9 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_9 + var_60_0
					end

					if var_60_4.prefab_name ~= "" and arg_57_1.actors_[var_60_4.prefab_name] ~= nil then
						local var_60_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_4.prefab_name].transform, "story_v_out_106122", "106122013", "story_v_out_106122.awb")

						arg_57_1:RecordAudio("106122013", var_60_10)
						arg_57_1:RecordAudio("106122013", var_60_10)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_106122", "106122013", "story_v_out_106122.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_106122", "106122013", "story_v_out_106122.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_11 = var_60_0 + 0.3
			local var_60_12 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_11 <= arg_57_1.time_ and arg_57_1.time_ < var_60_11 + var_60_12 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_11) / var_60_12

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_11 + var_60_12 and arg_57_1.time_ < var_60_11 + var_60_12 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play106122014 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 106122014
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play106122015(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.575

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_2 = arg_63_1:GetWordFromCfg(106122014)
				local var_66_3 = arg_63_1:FormatText(var_66_2.content)

				arg_63_1.text_.text = var_66_3

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_4 = 23
				local var_66_5 = utf8.len(var_66_3)
				local var_66_6 = var_66_4 <= 0 and var_66_1 or var_66_1 * (var_66_5 / var_66_4)

				if var_66_6 > 0 and var_66_1 < var_66_6 then
					arg_63_1.talkMaxDuration = var_66_6

					if var_66_6 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_6 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_3
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_7 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_7 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_7

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_7 and arg_63_1.time_ < var_66_0 + var_66_7 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play106122015 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 106122015
		arg_67_1.duration_ = 12.433

		local var_67_0 = {
			ja = 10.833,
			ko = 8.833,
			zh = 7.466,
			en = 12.433
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
				arg_67_0:Play106122016(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.875

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[87].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(106122015)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122015", "story_v_out_106122.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_106122", "106122015", "story_v_out_106122.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_106122", "106122015", "story_v_out_106122.awb")

						arg_67_1:RecordAudio("106122015", var_70_9)
						arg_67_1:RecordAudio("106122015", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_106122", "106122015", "story_v_out_106122.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_106122", "106122015", "story_v_out_106122.awb")
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
	Play106122016 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 106122016
		arg_71_1.duration_ = 11.833

		local var_71_0 = {
			ja = 11.833,
			ko = 8.733,
			zh = 7.4,
			en = 9.066
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
				arg_71_0:Play106122017(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.9

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[87].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(106122016)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 37
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122016", "story_v_out_106122.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_106122", "106122016", "story_v_out_106122.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_106122", "106122016", "story_v_out_106122.awb")

						arg_71_1:RecordAudio("106122016", var_74_9)
						arg_71_1:RecordAudio("106122016", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_106122", "106122016", "story_v_out_106122.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_106122", "106122016", "story_v_out_106122.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_10 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_10 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_10

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_10 and arg_71_1.time_ < var_74_0 + var_74_10 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play106122017 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 106122017
		arg_75_1.duration_ = 13.433

		local var_75_0 = {
			ja = 13.166,
			ko = 7.933,
			zh = 8.4,
			en = 13.433
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
				arg_75_0:Play106122018(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1093ui_story"]
			local var_78_1 = 4

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1093ui_story == nil then
				arg_75_1.var_.characterEffect1093ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.1

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1093ui_story then
					arg_75_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1093ui_story then
				arg_75_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["4014_tpose"]
			local var_78_5 = 4

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 and arg_75_1.var_.characterEffect4014_tpose == nil then
				arg_75_1.var_.characterEffect4014_tpose = var_78_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_6 = 0.1

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6

				if arg_75_1.var_.characterEffect4014_tpose then
					local var_78_8 = Mathf.Lerp(0, 0.5, var_78_7)

					arg_75_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_75_1.var_.characterEffect4014_tpose.fillRatio = var_78_8
				end
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect4014_tpose then
				local var_78_9 = 0.5

				arg_75_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_75_1.var_.characterEffect4014_tpose.fillRatio = var_78_9
			end

			local var_78_10 = arg_75_1.actors_["4014_tpose"].transform
			local var_78_11 = 4

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1.var_.moveOldPos4014_tpose = var_78_10.localPosition

				local var_78_12 = "4014_tpose"

				arg_75_1:ShowWeapon(arg_75_1.var_[var_78_12 .. "Animator"].transform, true)
			end

			local var_78_13 = 0.001

			if var_78_11 <= arg_75_1.time_ and arg_75_1.time_ < var_78_11 + var_78_13 then
				local var_78_14 = (arg_75_1.time_ - var_78_11) / var_78_13
				local var_78_15 = Vector3.New(0, 100, 0)

				var_78_10.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos4014_tpose, var_78_15, var_78_14)

				local var_78_16 = manager.ui.mainCamera.transform.position - var_78_10.position

				var_78_10.forward = Vector3.New(var_78_16.x, var_78_16.y, var_78_16.z)

				local var_78_17 = var_78_10.localEulerAngles

				var_78_17.z = 0
				var_78_17.x = 0
				var_78_10.localEulerAngles = var_78_17
			end

			if arg_75_1.time_ >= var_78_11 + var_78_13 and arg_75_1.time_ < var_78_11 + var_78_13 + arg_78_0 then
				var_78_10.localPosition = Vector3.New(0, 100, 0)

				local var_78_18 = manager.ui.mainCamera.transform.position - var_78_10.position

				var_78_10.forward = Vector3.New(var_78_18.x, var_78_18.y, var_78_18.z)

				local var_78_19 = var_78_10.localEulerAngles

				var_78_19.z = 0
				var_78_19.x = 0
				var_78_10.localEulerAngles = var_78_19
			end

			local var_78_20 = arg_75_1.actors_["1093ui_story"].transform
			local var_78_21 = 4

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				arg_75_1.var_.moveOldPos1093ui_story = var_78_20.localPosition
			end

			local var_78_22 = 0.001

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_21) / var_78_22
				local var_78_24 = Vector3.New(0, -1.11, -5.88)

				var_78_20.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1093ui_story, var_78_24, var_78_23)

				local var_78_25 = manager.ui.mainCamera.transform.position - var_78_20.position

				var_78_20.forward = Vector3.New(var_78_25.x, var_78_25.y, var_78_25.z)

				local var_78_26 = var_78_20.localEulerAngles

				var_78_26.z = 0
				var_78_26.x = 0
				var_78_20.localEulerAngles = var_78_26
			end

			if arg_75_1.time_ >= var_78_21 + var_78_22 and arg_75_1.time_ < var_78_21 + var_78_22 + arg_78_0 then
				var_78_20.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_78_27 = manager.ui.mainCamera.transform.position - var_78_20.position

				var_78_20.forward = Vector3.New(var_78_27.x, var_78_27.y, var_78_27.z)

				local var_78_28 = var_78_20.localEulerAngles

				var_78_28.z = 0
				var_78_28.x = 0
				var_78_20.localEulerAngles = var_78_28
			end

			local var_78_29 = 4

			if var_78_29 < arg_75_1.time_ and arg_75_1.time_ <= var_78_29 + arg_78_0 then
				arg_75_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action10_2")
			end

			local var_78_30 = 4

			if var_78_30 < arg_75_1.time_ and arg_75_1.time_ <= var_78_30 + arg_78_0 then
				arg_75_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_78_31 = 2

			if var_78_31 < arg_75_1.time_ and arg_75_1.time_ <= var_78_31 + arg_78_0 then
				local var_78_32 = manager.ui.mainCamera.transform.localPosition
				local var_78_33 = Vector3.New(0, 0, 10) + Vector3.New(var_78_32.x, var_78_32.y, 0)
				local var_78_34 = arg_75_1.bgs_.C01b

				var_78_34.transform.localPosition = var_78_33
				var_78_34.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_78_35 = var_78_34:GetComponent("SpriteRenderer")

				if var_78_35 and var_78_35.sprite then
					local var_78_36 = (var_78_34.transform.localPosition - var_78_32).z
					local var_78_37 = manager.ui.mainCameraCom_
					local var_78_38 = 2 * var_78_36 * Mathf.Tan(var_78_37.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_78_39 = var_78_38 * var_78_37.aspect
					local var_78_40 = var_78_35.sprite.bounds.size.x
					local var_78_41 = var_78_35.sprite.bounds.size.y
					local var_78_42 = var_78_39 / var_78_40
					local var_78_43 = var_78_38 / var_78_41
					local var_78_44 = var_78_43 < var_78_42 and var_78_42 or var_78_43

					var_78_34.transform.localScale = Vector3.New(var_78_44, var_78_44, 0)
				end

				for iter_78_0, iter_78_1 in pairs(arg_75_1.bgs_) do
					if iter_78_0 ~= "C01b" then
						iter_78_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_78_45 = 0

			if var_78_45 < arg_75_1.time_ and arg_75_1.time_ <= var_78_45 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_46 = 2

			if var_78_45 <= arg_75_1.time_ and arg_75_1.time_ < var_78_45 + var_78_46 then
				local var_78_47 = (arg_75_1.time_ - var_78_45) / var_78_46
				local var_78_48 = Color.New(0, 0, 0)

				var_78_48.a = Mathf.Lerp(0, 1, var_78_47)
				arg_75_1.mask_.color = var_78_48
			end

			if arg_75_1.time_ >= var_78_45 + var_78_46 and arg_75_1.time_ < var_78_45 + var_78_46 + arg_78_0 then
				local var_78_49 = Color.New(0, 0, 0)

				var_78_49.a = 1
				arg_75_1.mask_.color = var_78_49
			end

			local var_78_50 = 2

			if var_78_50 < arg_75_1.time_ and arg_75_1.time_ <= var_78_50 + arg_78_0 then
				arg_75_1.mask_.enabled = true
				arg_75_1.mask_.raycastTarget = true

				arg_75_1:SetGaussion(false)
			end

			local var_78_51 = 2

			if var_78_50 <= arg_75_1.time_ and arg_75_1.time_ < var_78_50 + var_78_51 then
				local var_78_52 = (arg_75_1.time_ - var_78_50) / var_78_51
				local var_78_53 = Color.New(0, 0, 0)

				var_78_53.a = Mathf.Lerp(1, 0, var_78_52)
				arg_75_1.mask_.color = var_78_53
			end

			if arg_75_1.time_ >= var_78_50 + var_78_51 and arg_75_1.time_ < var_78_50 + var_78_51 + arg_78_0 then
				local var_78_54 = Color.New(0, 0, 0)
				local var_78_55 = 0

				arg_75_1.mask_.enabled = false
				var_78_54.a = var_78_55
				arg_75_1.mask_.color = var_78_54
			end

			if arg_75_1.frameCnt_ <= 1 then
				arg_75_1.dialog_:SetActive(false)
			end

			local var_78_56 = 4
			local var_78_57 = 0.4

			if var_78_56 < arg_75_1.time_ and arg_75_1.time_ <= var_78_56 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				arg_75_1.dialog_:SetActive(true)

				local var_78_58 = LeanTween.value(arg_75_1.dialog_, 0, 1, 0.3)

				var_78_58:setOnUpdate(LuaHelper.FloatAction(function(arg_79_0)
					arg_75_1.dialogCg_.alpha = arg_79_0
				end))
				var_78_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_75_1.dialog_)
					var_78_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_75_1.duration_ = arg_75_1.duration_ + 0.3

				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_59 = arg_75_1:FormatText(StoryNameCfg[73].name)

				arg_75_1.leftNameTxt_.text = var_78_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_60 = arg_75_1:GetWordFromCfg(106122017)
				local var_78_61 = arg_75_1:FormatText(var_78_60.content)

				arg_75_1.text_.text = var_78_61

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_62 = 16
				local var_78_63 = utf8.len(var_78_61)
				local var_78_64 = var_78_62 <= 0 and var_78_57 or var_78_57 * (var_78_63 / var_78_62)

				if var_78_64 > 0 and var_78_57 < var_78_64 then
					arg_75_1.talkMaxDuration = var_78_64
					var_78_56 = var_78_56 + 0.3

					if var_78_64 + var_78_56 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_64 + var_78_56
					end
				end

				arg_75_1.text_.text = var_78_61
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122017", "story_v_out_106122.awb") ~= 0 then
					local var_78_65 = manager.audio:GetVoiceLength("story_v_out_106122", "106122017", "story_v_out_106122.awb") / 1000

					if var_78_65 + var_78_56 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_65 + var_78_56
					end

					if var_78_60.prefab_name ~= "" and arg_75_1.actors_[var_78_60.prefab_name] ~= nil then
						local var_78_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_60.prefab_name].transform, "story_v_out_106122", "106122017", "story_v_out_106122.awb")

						arg_75_1:RecordAudio("106122017", var_78_66)
						arg_75_1:RecordAudio("106122017", var_78_66)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_106122", "106122017", "story_v_out_106122.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_106122", "106122017", "story_v_out_106122.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_67 = var_78_56 + 0.3
			local var_78_68 = math.max(var_78_57, arg_75_1.talkMaxDuration)

			if var_78_67 <= arg_75_1.time_ and arg_75_1.time_ < var_78_67 + var_78_68 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_67) / var_78_68

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_67 + var_78_68 and arg_75_1.time_ < var_78_67 + var_78_68 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play106122018 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 106122018
		arg_81_1.duration_ = 7

		local var_81_0 = {
			ja = 5.6,
			ko = 6,
			zh = 5.4,
			en = 7
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
				arg_81_0:Play106122019(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["4014_tpose"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect4014_tpose == nil then
				arg_81_1.var_.characterEffect4014_tpose = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.1

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect4014_tpose then
					arg_81_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect4014_tpose then
				arg_81_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1093ui_story"].transform
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 then
				arg_81_1.var_.moveOldPos1093ui_story = var_84_4.localPosition
			end

			local var_84_6 = 0.001

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6
				local var_84_8 = Vector3.New(0, 100, 0)

				var_84_4.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1093ui_story, var_84_8, var_84_7)

				local var_84_9 = manager.ui.mainCamera.transform.position - var_84_4.position

				var_84_4.forward = Vector3.New(var_84_9.x, var_84_9.y, var_84_9.z)

				local var_84_10 = var_84_4.localEulerAngles

				var_84_10.z = 0
				var_84_10.x = 0
				var_84_4.localEulerAngles = var_84_10
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 then
				var_84_4.localPosition = Vector3.New(0, 100, 0)

				local var_84_11 = manager.ui.mainCamera.transform.position - var_84_4.position

				var_84_4.forward = Vector3.New(var_84_11.x, var_84_11.y, var_84_11.z)

				local var_84_12 = var_84_4.localEulerAngles

				var_84_12.z = 0
				var_84_12.x = 0
				var_84_4.localEulerAngles = var_84_12
			end

			local var_84_13 = arg_81_1.actors_["4014_tpose"].transform
			local var_84_14 = 0

			if var_84_14 < arg_81_1.time_ and arg_81_1.time_ <= var_84_14 + arg_84_0 then
				arg_81_1.var_.moveOldPos4014_tpose = var_84_13.localPosition
			end

			local var_84_15 = 0.001

			if var_84_14 <= arg_81_1.time_ and arg_81_1.time_ < var_84_14 + var_84_15 then
				local var_84_16 = (arg_81_1.time_ - var_84_14) / var_84_15
				local var_84_17 = Vector3.New(0, -1.95, -4.2)

				var_84_13.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos4014_tpose, var_84_17, var_84_16)

				local var_84_18 = manager.ui.mainCamera.transform.position - var_84_13.position

				var_84_13.forward = Vector3.New(var_84_18.x, var_84_18.y, var_84_18.z)

				local var_84_19 = var_84_13.localEulerAngles

				var_84_19.z = 0
				var_84_19.x = 0
				var_84_13.localEulerAngles = var_84_19
			end

			if arg_81_1.time_ >= var_84_14 + var_84_15 and arg_81_1.time_ < var_84_14 + var_84_15 + arg_84_0 then
				var_84_13.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_84_20 = manager.ui.mainCamera.transform.position - var_84_13.position

				var_84_13.forward = Vector3.New(var_84_20.x, var_84_20.y, var_84_20.z)

				local var_84_21 = var_84_13.localEulerAngles

				var_84_21.z = 0
				var_84_21.x = 0
				var_84_13.localEulerAngles = var_84_21
			end

			local var_84_22 = 0

			if var_84_22 < arg_81_1.time_ and arg_81_1.time_ <= var_84_22 + arg_84_0 then
				arg_81_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_84_23 = 0
			local var_84_24 = 0.55

			if var_84_23 < arg_81_1.time_ and arg_81_1.time_ <= var_84_23 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_25 = arg_81_1:FormatText(StoryNameCfg[87].name)

				arg_81_1.leftNameTxt_.text = var_84_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_26 = arg_81_1:GetWordFromCfg(106122018)
				local var_84_27 = arg_81_1:FormatText(var_84_26.content)

				arg_81_1.text_.text = var_84_27

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_28 = 22
				local var_84_29 = utf8.len(var_84_27)
				local var_84_30 = var_84_28 <= 0 and var_84_24 or var_84_24 * (var_84_29 / var_84_28)

				if var_84_30 > 0 and var_84_24 < var_84_30 then
					arg_81_1.talkMaxDuration = var_84_30

					if var_84_30 + var_84_23 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_30 + var_84_23
					end
				end

				arg_81_1.text_.text = var_84_27
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122018", "story_v_out_106122.awb") ~= 0 then
					local var_84_31 = manager.audio:GetVoiceLength("story_v_out_106122", "106122018", "story_v_out_106122.awb") / 1000

					if var_84_31 + var_84_23 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_31 + var_84_23
					end

					if var_84_26.prefab_name ~= "" and arg_81_1.actors_[var_84_26.prefab_name] ~= nil then
						local var_84_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_26.prefab_name].transform, "story_v_out_106122", "106122018", "story_v_out_106122.awb")

						arg_81_1:RecordAudio("106122018", var_84_32)
						arg_81_1:RecordAudio("106122018", var_84_32)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_106122", "106122018", "story_v_out_106122.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_106122", "106122018", "story_v_out_106122.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_33 = math.max(var_84_24, arg_81_1.talkMaxDuration)

			if var_84_23 <= arg_81_1.time_ and arg_81_1.time_ < var_84_23 + var_84_33 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_23) / var_84_33

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_23 + var_84_33 and arg_81_1.time_ < var_84_23 + var_84_33 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play106122019 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 106122019
		arg_85_1.duration_ = 12.533

		local var_85_0 = {
			ja = 9.8,
			ko = 12.533,
			zh = 10.6,
			en = 10.366
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
				arg_85_0:Play106122020(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1.05

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[87].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(106122019)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122019", "story_v_out_106122.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_106122", "106122019", "story_v_out_106122.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_106122", "106122019", "story_v_out_106122.awb")

						arg_85_1:RecordAudio("106122019", var_88_9)
						arg_85_1:RecordAudio("106122019", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_106122", "106122019", "story_v_out_106122.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_106122", "106122019", "story_v_out_106122.awb")
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
	Play106122020 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 106122020
		arg_89_1.duration_ = 5.7

		local var_89_0 = {
			ja = 5.7,
			ko = 4.8,
			zh = 4.333,
			en = 5.633
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
				arg_89_0:Play106122021(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.475

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[87].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(106122020)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122020", "story_v_out_106122.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_106122", "106122020", "story_v_out_106122.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_106122", "106122020", "story_v_out_106122.awb")

						arg_89_1:RecordAudio("106122020", var_92_9)
						arg_89_1:RecordAudio("106122020", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_106122", "106122020", "story_v_out_106122.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_106122", "106122020", "story_v_out_106122.awb")
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
	Play106122021 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 106122021
		arg_93_1.duration_ = 5.633

		local var_93_0 = {
			ja = 4.366,
			ko = 3.633,
			zh = 2.733,
			en = 5.633
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
				arg_93_0:Play106122022(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1093ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1093ui_story == nil then
				arg_93_1.var_.characterEffect1093ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.1

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1093ui_story then
					arg_93_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1093ui_story then
				arg_93_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_96_4 = arg_93_1.actors_["4014_tpose"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect4014_tpose == nil then
				arg_93_1.var_.characterEffect4014_tpose = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect4014_tpose then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_93_1.var_.characterEffect4014_tpose.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect4014_tpose then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_93_1.var_.characterEffect4014_tpose.fillRatio = var_96_9
			end

			local var_96_10 = arg_93_1.actors_["4014_tpose"].transform
			local var_96_11 = 0

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1.var_.moveOldPos4014_tpose = var_96_10.localPosition
			end

			local var_96_12 = 0.001

			if var_96_11 <= arg_93_1.time_ and arg_93_1.time_ < var_96_11 + var_96_12 then
				local var_96_13 = (arg_93_1.time_ - var_96_11) / var_96_12
				local var_96_14 = Vector3.New(0, 100, 0)

				var_96_10.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos4014_tpose, var_96_14, var_96_13)

				local var_96_15 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_15.x, var_96_15.y, var_96_15.z)

				local var_96_16 = var_96_10.localEulerAngles

				var_96_16.z = 0
				var_96_16.x = 0
				var_96_10.localEulerAngles = var_96_16
			end

			if arg_93_1.time_ >= var_96_11 + var_96_12 and arg_93_1.time_ < var_96_11 + var_96_12 + arg_96_0 then
				var_96_10.localPosition = Vector3.New(0, 100, 0)

				local var_96_17 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_17.x, var_96_17.y, var_96_17.z)

				local var_96_18 = var_96_10.localEulerAngles

				var_96_18.z = 0
				var_96_18.x = 0
				var_96_10.localEulerAngles = var_96_18
			end

			local var_96_19 = arg_93_1.actors_["1093ui_story"].transform
			local var_96_20 = 0

			if var_96_20 < arg_93_1.time_ and arg_93_1.time_ <= var_96_20 + arg_96_0 then
				arg_93_1.var_.moveOldPos1093ui_story = var_96_19.localPosition

				local var_96_21 = "1093ui_story"

				arg_93_1:ShowWeapon(arg_93_1.var_[var_96_21 .. "Animator"].transform, true)
			end

			local var_96_22 = 0.001

			if var_96_20 <= arg_93_1.time_ and arg_93_1.time_ < var_96_20 + var_96_22 then
				local var_96_23 = (arg_93_1.time_ - var_96_20) / var_96_22
				local var_96_24 = Vector3.New(0, -1.11, -5.88)

				var_96_19.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1093ui_story, var_96_24, var_96_23)

				local var_96_25 = manager.ui.mainCamera.transform.position - var_96_19.position

				var_96_19.forward = Vector3.New(var_96_25.x, var_96_25.y, var_96_25.z)

				local var_96_26 = var_96_19.localEulerAngles

				var_96_26.z = 0
				var_96_26.x = 0
				var_96_19.localEulerAngles = var_96_26
			end

			if arg_93_1.time_ >= var_96_20 + var_96_22 and arg_93_1.time_ < var_96_20 + var_96_22 + arg_96_0 then
				var_96_19.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_96_27 = manager.ui.mainCamera.transform.position - var_96_19.position

				var_96_19.forward = Vector3.New(var_96_27.x, var_96_27.y, var_96_27.z)

				local var_96_28 = var_96_19.localEulerAngles

				var_96_28.z = 0
				var_96_28.x = 0
				var_96_19.localEulerAngles = var_96_28
			end

			local var_96_29 = 0

			if var_96_29 < arg_93_1.time_ and arg_93_1.time_ <= var_96_29 + arg_96_0 then
				arg_93_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action10_2")
			end

			local var_96_30 = 0

			if var_96_30 < arg_93_1.time_ and arg_93_1.time_ <= var_96_30 + arg_96_0 then
				arg_93_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_96_31 = 0
			local var_96_32 = 0.35

			if var_96_31 < arg_93_1.time_ and arg_93_1.time_ <= var_96_31 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_33 = arg_93_1:FormatText(StoryNameCfg[73].name)

				arg_93_1.leftNameTxt_.text = var_96_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_34 = arg_93_1:GetWordFromCfg(106122021)
				local var_96_35 = arg_93_1:FormatText(var_96_34.content)

				arg_93_1.text_.text = var_96_35

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_36 = 14
				local var_96_37 = utf8.len(var_96_35)
				local var_96_38 = var_96_36 <= 0 and var_96_32 or var_96_32 * (var_96_37 / var_96_36)

				if var_96_38 > 0 and var_96_32 < var_96_38 then
					arg_93_1.talkMaxDuration = var_96_38

					if var_96_38 + var_96_31 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_38 + var_96_31
					end
				end

				arg_93_1.text_.text = var_96_35
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122021", "story_v_out_106122.awb") ~= 0 then
					local var_96_39 = manager.audio:GetVoiceLength("story_v_out_106122", "106122021", "story_v_out_106122.awb") / 1000

					if var_96_39 + var_96_31 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_39 + var_96_31
					end

					if var_96_34.prefab_name ~= "" and arg_93_1.actors_[var_96_34.prefab_name] ~= nil then
						local var_96_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_34.prefab_name].transform, "story_v_out_106122", "106122021", "story_v_out_106122.awb")

						arg_93_1:RecordAudio("106122021", var_96_40)
						arg_93_1:RecordAudio("106122021", var_96_40)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_106122", "106122021", "story_v_out_106122.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_106122", "106122021", "story_v_out_106122.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_41 = math.max(var_96_32, arg_93_1.talkMaxDuration)

			if var_96_31 <= arg_93_1.time_ and arg_93_1.time_ < var_96_31 + var_96_41 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_31) / var_96_41

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_31 + var_96_41 and arg_93_1.time_ < var_96_31 + var_96_41 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play106122022 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 106122022
		arg_97_1.duration_ = 10.066

		local var_97_0 = {
			ja = 4.033,
			ko = 10.066,
			zh = 7.7,
			en = 9.3
		}
		local var_97_1 = manager.audio:GetLocalizationFlag()

		if var_97_0[var_97_1] ~= nil then
			arg_97_1.duration_ = var_97_0[var_97_1]
		end

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play106122023(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["4014_tpose"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect4014_tpose == nil then
				arg_97_1.var_.characterEffect4014_tpose = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect4014_tpose then
					arg_97_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect4014_tpose then
				arg_97_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["1093ui_story"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect1093ui_story == nil then
				arg_97_1.var_.characterEffect1093ui_story = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.1

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect1093ui_story then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1093ui_story.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect1093ui_story then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1093ui_story.fillRatio = var_100_9
			end

			local var_100_10 = arg_97_1.actors_["1093ui_story"].transform
			local var_100_11 = 0

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.var_.moveOldPos1093ui_story = var_100_10.localPosition

				local var_100_12 = "1093ui_story"

				arg_97_1:ShowWeapon(arg_97_1.var_[var_100_12 .. "Animator"].transform, true)
			end

			local var_100_13 = 0.001

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_13 then
				local var_100_14 = (arg_97_1.time_ - var_100_11) / var_100_13
				local var_100_15 = Vector3.New(0, 100, 0)

				var_100_10.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1093ui_story, var_100_15, var_100_14)

				local var_100_16 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_16.x, var_100_16.y, var_100_16.z)

				local var_100_17 = var_100_10.localEulerAngles

				var_100_17.z = 0
				var_100_17.x = 0
				var_100_10.localEulerAngles = var_100_17
			end

			if arg_97_1.time_ >= var_100_11 + var_100_13 and arg_97_1.time_ < var_100_11 + var_100_13 + arg_100_0 then
				var_100_10.localPosition = Vector3.New(0, 100, 0)

				local var_100_18 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_18.x, var_100_18.y, var_100_18.z)

				local var_100_19 = var_100_10.localEulerAngles

				var_100_19.z = 0
				var_100_19.x = 0
				var_100_10.localEulerAngles = var_100_19
			end

			local var_100_20 = arg_97_1.actors_["4014_tpose"].transform
			local var_100_21 = 0

			if var_100_21 < arg_97_1.time_ and arg_97_1.time_ <= var_100_21 + arg_100_0 then
				arg_97_1.var_.moveOldPos4014_tpose = var_100_20.localPosition
			end

			local var_100_22 = 0.001

			if var_100_21 <= arg_97_1.time_ and arg_97_1.time_ < var_100_21 + var_100_22 then
				local var_100_23 = (arg_97_1.time_ - var_100_21) / var_100_22
				local var_100_24 = Vector3.New(0, -1.95, -4.2)

				var_100_20.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos4014_tpose, var_100_24, var_100_23)

				local var_100_25 = manager.ui.mainCamera.transform.position - var_100_20.position

				var_100_20.forward = Vector3.New(var_100_25.x, var_100_25.y, var_100_25.z)

				local var_100_26 = var_100_20.localEulerAngles

				var_100_26.z = 0
				var_100_26.x = 0
				var_100_20.localEulerAngles = var_100_26
			end

			if arg_97_1.time_ >= var_100_21 + var_100_22 and arg_97_1.time_ < var_100_21 + var_100_22 + arg_100_0 then
				var_100_20.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_100_27 = manager.ui.mainCamera.transform.position - var_100_20.position

				var_100_20.forward = Vector3.New(var_100_27.x, var_100_27.y, var_100_27.z)

				local var_100_28 = var_100_20.localEulerAngles

				var_100_28.z = 0
				var_100_28.x = 0
				var_100_20.localEulerAngles = var_100_28
			end

			local var_100_29 = 0

			if var_100_29 < arg_97_1.time_ and arg_97_1.time_ <= var_100_29 + arg_100_0 then
				arg_97_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_100_30 = 0
			local var_100_31 = 0.725

			if var_100_30 < arg_97_1.time_ and arg_97_1.time_ <= var_100_30 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_32 = arg_97_1:FormatText(StoryNameCfg[87].name)

				arg_97_1.leftNameTxt_.text = var_100_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_33 = arg_97_1:GetWordFromCfg(106122022)
				local var_100_34 = arg_97_1:FormatText(var_100_33.content)

				arg_97_1.text_.text = var_100_34

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_35 = 29
				local var_100_36 = utf8.len(var_100_34)
				local var_100_37 = var_100_35 <= 0 and var_100_31 or var_100_31 * (var_100_36 / var_100_35)

				if var_100_37 > 0 and var_100_31 < var_100_37 then
					arg_97_1.talkMaxDuration = var_100_37

					if var_100_37 + var_100_30 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_37 + var_100_30
					end
				end

				arg_97_1.text_.text = var_100_34
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122022", "story_v_out_106122.awb") ~= 0 then
					local var_100_38 = manager.audio:GetVoiceLength("story_v_out_106122", "106122022", "story_v_out_106122.awb") / 1000

					if var_100_38 + var_100_30 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_38 + var_100_30
					end

					if var_100_33.prefab_name ~= "" and arg_97_1.actors_[var_100_33.prefab_name] ~= nil then
						local var_100_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_33.prefab_name].transform, "story_v_out_106122", "106122022", "story_v_out_106122.awb")

						arg_97_1:RecordAudio("106122022", var_100_39)
						arg_97_1:RecordAudio("106122022", var_100_39)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_106122", "106122022", "story_v_out_106122.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_106122", "106122022", "story_v_out_106122.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_40 = math.max(var_100_31, arg_97_1.talkMaxDuration)

			if var_100_30 <= arg_97_1.time_ and arg_97_1.time_ < var_100_30 + var_100_40 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_30) / var_100_40

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_30 + var_100_40 and arg_97_1.time_ < var_100_30 + var_100_40 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play106122023 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 106122023
		arg_101_1.duration_ = 2.466

		local var_101_0 = {
			ja = 2.466,
			ko = 1.5,
			zh = 1.4,
			en = 1.4
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
				arg_101_0:Play106122024(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["4014_tpose"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect4014_tpose == nil then
				arg_101_1.var_.characterEffect4014_tpose = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect4014_tpose then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_101_1.var_.characterEffect4014_tpose.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect4014_tpose then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_101_1.var_.characterEffect4014_tpose.fillRatio = var_104_5
			end

			local var_104_6 = arg_101_1.actors_["4014_tpose"].transform
			local var_104_7 = 0

			if var_104_7 < arg_101_1.time_ and arg_101_1.time_ <= var_104_7 + arg_104_0 then
				arg_101_1.var_.moveOldPos4014_tpose = var_104_6.localPosition
			end

			local var_104_8 = 0.001

			if var_104_7 <= arg_101_1.time_ and arg_101_1.time_ < var_104_7 + var_104_8 then
				local var_104_9 = (arg_101_1.time_ - var_104_7) / var_104_8
				local var_104_10 = Vector3.New(0, 100, 0)

				var_104_6.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos4014_tpose, var_104_10, var_104_9)

				local var_104_11 = manager.ui.mainCamera.transform.position - var_104_6.position

				var_104_6.forward = Vector3.New(var_104_11.x, var_104_11.y, var_104_11.z)

				local var_104_12 = var_104_6.localEulerAngles

				var_104_12.z = 0
				var_104_12.x = 0
				var_104_6.localEulerAngles = var_104_12
			end

			if arg_101_1.time_ >= var_104_7 + var_104_8 and arg_101_1.time_ < var_104_7 + var_104_8 + arg_104_0 then
				var_104_6.localPosition = Vector3.New(0, 100, 0)

				local var_104_13 = manager.ui.mainCamera.transform.position - var_104_6.position

				var_104_6.forward = Vector3.New(var_104_13.x, var_104_13.y, var_104_13.z)

				local var_104_14 = var_104_6.localEulerAngles

				var_104_14.z = 0
				var_104_14.x = 0
				var_104_6.localEulerAngles = var_104_14
			end

			local var_104_15 = 0
			local var_104_16 = 0.075

			if var_104_15 < arg_101_1.time_ and arg_101_1.time_ <= var_104_15 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_17 = arg_101_1:FormatText(StoryNameCfg[73].name)

				arg_101_1.leftNameTxt_.text = var_104_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_18 = arg_101_1:GetWordFromCfg(106122023)
				local var_104_19 = arg_101_1:FormatText(var_104_18.content)

				arg_101_1.text_.text = var_104_19

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_20 = 3
				local var_104_21 = utf8.len(var_104_19)
				local var_104_22 = var_104_20 <= 0 and var_104_16 or var_104_16 * (var_104_21 / var_104_20)

				if var_104_22 > 0 and var_104_16 < var_104_22 then
					arg_101_1.talkMaxDuration = var_104_22

					if var_104_22 + var_104_15 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_22 + var_104_15
					end
				end

				arg_101_1.text_.text = var_104_19
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122023", "story_v_out_106122.awb") ~= 0 then
					local var_104_23 = manager.audio:GetVoiceLength("story_v_out_106122", "106122023", "story_v_out_106122.awb") / 1000

					if var_104_23 + var_104_15 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_23 + var_104_15
					end

					if var_104_18.prefab_name ~= "" and arg_101_1.actors_[var_104_18.prefab_name] ~= nil then
						local var_104_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_18.prefab_name].transform, "story_v_out_106122", "106122023", "story_v_out_106122.awb")

						arg_101_1:RecordAudio("106122023", var_104_24)
						arg_101_1:RecordAudio("106122023", var_104_24)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_106122", "106122023", "story_v_out_106122.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_106122", "106122023", "story_v_out_106122.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_25 = math.max(var_104_16, arg_101_1.talkMaxDuration)

			if var_104_15 <= arg_101_1.time_ and arg_101_1.time_ < var_104_15 + var_104_25 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_15) / var_104_25

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_15 + var_104_25 and arg_101_1.time_ < var_104_15 + var_104_25 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play106122024 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 106122024
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play106122025(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = manager.ui.mainCamera.transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.shakeOldPos = var_108_0.localPosition
			end

			local var_108_2 = 0.6

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / 0.066
				local var_108_4, var_108_5 = math.modf(var_108_3)

				var_108_0.localPosition = Vector3.New(var_108_5 * 0.13, var_108_5 * 0.13, var_108_5 * 0.13) + arg_105_1.var_.shakeOldPos
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = arg_105_1.var_.shakeOldPos
			end

			local var_108_6 = 0

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_7 = 0.5

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_7 then
				local var_108_8 = (arg_105_1.time_ - var_108_6) / var_108_7
				local var_108_9 = Color.New(1, 1, 1)

				var_108_9.a = Mathf.Lerp(1, 0, var_108_8)
				arg_105_1.mask_.color = var_108_9
			end

			if arg_105_1.time_ >= var_108_6 + var_108_7 and arg_105_1.time_ < var_108_6 + var_108_7 + arg_108_0 then
				local var_108_10 = Color.New(1, 1, 1)
				local var_108_11 = 0

				arg_105_1.mask_.enabled = false
				var_108_10.a = var_108_11
				arg_105_1.mask_.color = var_108_10
			end

			local var_108_12 = 0
			local var_108_13 = 1

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				local var_108_14 = "play"
				local var_108_15 = "effect"

				arg_105_1:AudioAction(var_108_14, var_108_15, "se_story_6", "se_story_6_blast", "")
			end

			local var_108_16 = 0
			local var_108_17 = 0.775

			if var_108_16 < arg_105_1.time_ and arg_105_1.time_ <= var_108_16 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_18 = arg_105_1:GetWordFromCfg(106122024)
				local var_108_19 = arg_105_1:FormatText(var_108_18.content)

				arg_105_1.text_.text = var_108_19

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_20 = 31
				local var_108_21 = utf8.len(var_108_19)
				local var_108_22 = var_108_20 <= 0 and var_108_17 or var_108_17 * (var_108_21 / var_108_20)

				if var_108_22 > 0 and var_108_17 < var_108_22 then
					arg_105_1.talkMaxDuration = var_108_22

					if var_108_22 + var_108_16 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_16
					end
				end

				arg_105_1.text_.text = var_108_19
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_23 = math.max(var_108_17, arg_105_1.talkMaxDuration)

			if var_108_16 <= arg_105_1.time_ and arg_105_1.time_ < var_108_16 + var_108_23 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_16) / var_108_23

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_16 + var_108_23 and arg_105_1.time_ < var_108_16 + var_108_23 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play106122025 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 106122025
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play106122026(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				local var_112_2 = "play"
				local var_112_3 = "effect"

				arg_109_1:AudioAction(var_112_2, var_112_3, "se_story_6", "se_story_6_Impale", "")
			end

			local var_112_4 = 0
			local var_112_5 = 0.725

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_6 = arg_109_1:GetWordFromCfg(106122025)
				local var_112_7 = arg_109_1:FormatText(var_112_6.content)

				arg_109_1.text_.text = var_112_7

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_8 = 29
				local var_112_9 = utf8.len(var_112_7)
				local var_112_10 = var_112_8 <= 0 and var_112_5 or var_112_5 * (var_112_9 / var_112_8)

				if var_112_10 > 0 and var_112_5 < var_112_10 then
					arg_109_1.talkMaxDuration = var_112_10

					if var_112_10 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_10 + var_112_4
					end
				end

				arg_109_1.text_.text = var_112_7
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_11 = math.max(var_112_5, arg_109_1.talkMaxDuration)

			if var_112_4 <= arg_109_1.time_ and arg_109_1.time_ < var_112_4 + var_112_11 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_4) / var_112_11

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_4 + var_112_11 and arg_109_1.time_ < var_112_4 + var_112_11 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play106122026 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 106122026
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play106122027(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				local var_116_2 = "play"
				local var_116_3 = "effect"

				arg_113_1:AudioAction(var_116_2, var_116_3, "se_story_6", "se_story_6_black_fog02", "")
			end

			local var_116_4 = 0
			local var_116_5 = 1.025

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_6 = arg_113_1:GetWordFromCfg(106122026)
				local var_116_7 = arg_113_1:FormatText(var_116_6.content)

				arg_113_1.text_.text = var_116_7

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_8 = 41
				local var_116_9 = utf8.len(var_116_7)
				local var_116_10 = var_116_8 <= 0 and var_116_5 or var_116_5 * (var_116_9 / var_116_8)

				if var_116_10 > 0 and var_116_5 < var_116_10 then
					arg_113_1.talkMaxDuration = var_116_10

					if var_116_10 + var_116_4 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_10 + var_116_4
					end
				end

				arg_113_1.text_.text = var_116_7
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_11 = math.max(var_116_5, arg_113_1.talkMaxDuration)

			if var_116_4 <= arg_113_1.time_ and arg_113_1.time_ < var_116_4 + var_116_11 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_4) / var_116_11

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_4 + var_116_11 and arg_113_1.time_ < var_116_4 + var_116_11 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play106122027 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 106122027
		arg_117_1.duration_ = 5.466

		local var_117_0 = {
			ja = 5.233,
			ko = 3.6,
			zh = 2.966,
			en = 5.466
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
				arg_117_0:Play106122028(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1093ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1093ui_story == nil then
				arg_117_1.var_.characterEffect1093ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.1

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1093ui_story then
					arg_117_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1093ui_story then
				arg_117_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["1093ui_story"].transform
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1.var_.moveOldPos1093ui_story = var_120_4.localPosition
			end

			local var_120_6 = 0.001

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6
				local var_120_8 = Vector3.New(0, -1.11, -5.88)

				var_120_4.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1093ui_story, var_120_8, var_120_7)

				local var_120_9 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_9.x, var_120_9.y, var_120_9.z)

				local var_120_10 = var_120_4.localEulerAngles

				var_120_10.z = 0
				var_120_10.x = 0
				var_120_4.localEulerAngles = var_120_10
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 then
				var_120_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_120_11 = manager.ui.mainCamera.transform.position - var_120_4.position

				var_120_4.forward = Vector3.New(var_120_11.x, var_120_11.y, var_120_11.z)

				local var_120_12 = var_120_4.localEulerAngles

				var_120_12.z = 0
				var_120_12.x = 0
				var_120_4.localEulerAngles = var_120_12
			end

			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action10_2")
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_120_15 = 0
			local var_120_16 = 0.225

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_17 = arg_117_1:FormatText(StoryNameCfg[73].name)

				arg_117_1.leftNameTxt_.text = var_120_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_18 = arg_117_1:GetWordFromCfg(106122027)
				local var_120_19 = arg_117_1:FormatText(var_120_18.content)

				arg_117_1.text_.text = var_120_19

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_20 = 9
				local var_120_21 = utf8.len(var_120_19)
				local var_120_22 = var_120_20 <= 0 and var_120_16 or var_120_16 * (var_120_21 / var_120_20)

				if var_120_22 > 0 and var_120_16 < var_120_22 then
					arg_117_1.talkMaxDuration = var_120_22

					if var_120_22 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_22 + var_120_15
					end
				end

				arg_117_1.text_.text = var_120_19
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122027", "story_v_out_106122.awb") ~= 0 then
					local var_120_23 = manager.audio:GetVoiceLength("story_v_out_106122", "106122027", "story_v_out_106122.awb") / 1000

					if var_120_23 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_23 + var_120_15
					end

					if var_120_18.prefab_name ~= "" and arg_117_1.actors_[var_120_18.prefab_name] ~= nil then
						local var_120_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_18.prefab_name].transform, "story_v_out_106122", "106122027", "story_v_out_106122.awb")

						arg_117_1:RecordAudio("106122027", var_120_24)
						arg_117_1:RecordAudio("106122027", var_120_24)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_106122", "106122027", "story_v_out_106122.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_106122", "106122027", "story_v_out_106122.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_25 = math.max(var_120_16, arg_117_1.talkMaxDuration)

			if var_120_15 <= arg_117_1.time_ and arg_117_1.time_ < var_120_15 + var_120_25 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_15) / var_120_25

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_15 + var_120_25 and arg_117_1.time_ < var_120_15 + var_120_25 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play106122028 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 106122028
		arg_121_1.duration_ = 6.1

		local var_121_0 = {
			ja = 5.566,
			ko = 3.933,
			zh = 5.866,
			en = 6.1
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
				arg_121_0:Play106122029(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = "3004_tpose"

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

			local var_124_4 = arg_121_1.actors_["3004_tpose"]
			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 and arg_121_1.var_.characterEffect3004_tpose == nil then
				arg_121_1.var_.characterEffect3004_tpose = var_124_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_6 = 0.1

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6

				if arg_121_1.var_.characterEffect3004_tpose then
					arg_121_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect3004_tpose then
				arg_121_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_124_8 = arg_121_1.actors_["1093ui_story"]
			local var_124_9 = 0

			if var_124_9 < arg_121_1.time_ and arg_121_1.time_ <= var_124_9 + arg_124_0 and arg_121_1.var_.characterEffect1093ui_story == nil then
				arg_121_1.var_.characterEffect1093ui_story = var_124_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_10 = 0.1

			if var_124_9 <= arg_121_1.time_ and arg_121_1.time_ < var_124_9 + var_124_10 then
				local var_124_11 = (arg_121_1.time_ - var_124_9) / var_124_10

				if arg_121_1.var_.characterEffect1093ui_story then
					local var_124_12 = Mathf.Lerp(0, 0.5, var_124_11)

					arg_121_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1093ui_story.fillRatio = var_124_12
				end
			end

			if arg_121_1.time_ >= var_124_9 + var_124_10 and arg_121_1.time_ < var_124_9 + var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1093ui_story then
				local var_124_13 = 0.5

				arg_121_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1093ui_story.fillRatio = var_124_13
			end

			local var_124_14 = arg_121_1.actors_["1093ui_story"].transform
			local var_124_15 = 0

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.var_.moveOldPos1093ui_story = var_124_14.localPosition
			end

			local var_124_16 = 0.001

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_16 then
				local var_124_17 = (arg_121_1.time_ - var_124_15) / var_124_16
				local var_124_18 = Vector3.New(0, 100, 0)

				var_124_14.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1093ui_story, var_124_18, var_124_17)

				local var_124_19 = manager.ui.mainCamera.transform.position - var_124_14.position

				var_124_14.forward = Vector3.New(var_124_19.x, var_124_19.y, var_124_19.z)

				local var_124_20 = var_124_14.localEulerAngles

				var_124_20.z = 0
				var_124_20.x = 0
				var_124_14.localEulerAngles = var_124_20
			end

			if arg_121_1.time_ >= var_124_15 + var_124_16 and arg_121_1.time_ < var_124_15 + var_124_16 + arg_124_0 then
				var_124_14.localPosition = Vector3.New(0, 100, 0)

				local var_124_21 = manager.ui.mainCamera.transform.position - var_124_14.position

				var_124_14.forward = Vector3.New(var_124_21.x, var_124_21.y, var_124_21.z)

				local var_124_22 = var_124_14.localEulerAngles

				var_124_22.z = 0
				var_124_22.x = 0
				var_124_14.localEulerAngles = var_124_22
			end

			local var_124_23 = 0
			local var_124_24 = 0.4

			if var_124_23 < arg_121_1.time_ and arg_121_1.time_ <= var_124_23 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_25 = arg_121_1:FormatText(StoryNameCfg[82].name)

				arg_121_1.leftNameTxt_.text = var_124_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3004")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_26 = arg_121_1:GetWordFromCfg(106122028)
				local var_124_27 = arg_121_1:FormatText(var_124_26.content)

				arg_121_1.text_.text = var_124_27

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_28 = 16
				local var_124_29 = utf8.len(var_124_27)
				local var_124_30 = var_124_28 <= 0 and var_124_24 or var_124_24 * (var_124_29 / var_124_28)

				if var_124_30 > 0 and var_124_24 < var_124_30 then
					arg_121_1.talkMaxDuration = var_124_30

					if var_124_30 + var_124_23 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_30 + var_124_23
					end
				end

				arg_121_1.text_.text = var_124_27
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122028", "story_v_out_106122.awb") ~= 0 then
					local var_124_31 = manager.audio:GetVoiceLength("story_v_out_106122", "106122028", "story_v_out_106122.awb") / 1000

					if var_124_31 + var_124_23 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_31 + var_124_23
					end

					if var_124_26.prefab_name ~= "" and arg_121_1.actors_[var_124_26.prefab_name] ~= nil then
						local var_124_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_26.prefab_name].transform, "story_v_out_106122", "106122028", "story_v_out_106122.awb")

						arg_121_1:RecordAudio("106122028", var_124_32)
						arg_121_1:RecordAudio("106122028", var_124_32)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_106122", "106122028", "story_v_out_106122.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_106122", "106122028", "story_v_out_106122.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_33 = math.max(var_124_24, arg_121_1.talkMaxDuration)

			if var_124_23 <= arg_121_1.time_ and arg_121_1.time_ < var_124_23 + var_124_33 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_23) / var_124_33

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_23 + var_124_33 and arg_121_1.time_ < var_124_23 + var_124_33 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play106122029 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 106122029
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play106122030(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["3004_tpose"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect3004_tpose == nil then
				arg_125_1.var_.characterEffect3004_tpose = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.1

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect3004_tpose then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_125_1.var_.characterEffect3004_tpose.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect3004_tpose then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_125_1.var_.characterEffect3004_tpose.fillRatio = var_128_5
			end

			local var_128_6 = 0
			local var_128_7 = 0.95

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_8 = arg_125_1:GetWordFromCfg(106122029)
				local var_128_9 = arg_125_1:FormatText(var_128_8.content)

				arg_125_1.text_.text = var_128_9

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_10 = 38
				local var_128_11 = utf8.len(var_128_9)
				local var_128_12 = var_128_10 <= 0 and var_128_7 or var_128_7 * (var_128_11 / var_128_10)

				if var_128_12 > 0 and var_128_7 < var_128_12 then
					arg_125_1.talkMaxDuration = var_128_12

					if var_128_12 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_12 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_9
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_13 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_13 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_13

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_13 and arg_125_1.time_ < var_128_6 + var_128_13 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play106122030 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 106122030
		arg_129_1.duration_ = 10.633

		local var_129_0 = {
			ja = 10.633,
			ko = 7.633,
			zh = 9.3,
			en = 10.333
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
			arg_129_1.auto_ = false
		end

		function arg_129_1.playNext_(arg_131_0)
			arg_129_1.onStoryFinished_()
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["3004_tpose"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect3004_tpose == nil then
				arg_129_1.var_.characterEffect3004_tpose = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.1

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect3004_tpose then
					arg_129_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect3004_tpose then
				arg_129_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_132_4 = arg_129_1.actors_["3004_tpose"].transform
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 then
				arg_129_1.var_.moveOldPos3004_tpose = var_132_4.localPosition
			end

			local var_132_6 = 0.001

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6
				local var_132_8 = Vector3.New(0, -2.22, -3.1)

				var_132_4.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos3004_tpose, var_132_8, var_132_7)

				local var_132_9 = manager.ui.mainCamera.transform.position - var_132_4.position

				var_132_4.forward = Vector3.New(var_132_9.x, var_132_9.y, var_132_9.z)

				local var_132_10 = var_132_4.localEulerAngles

				var_132_10.z = 0
				var_132_10.x = 0
				var_132_4.localEulerAngles = var_132_10
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 then
				var_132_4.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_132_11 = manager.ui.mainCamera.transform.position - var_132_4.position

				var_132_4.forward = Vector3.New(var_132_11.x, var_132_11.y, var_132_11.z)

				local var_132_12 = var_132_4.localEulerAngles

				var_132_12.z = 0
				var_132_12.x = 0
				var_132_4.localEulerAngles = var_132_12
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_132_14 = 0
			local var_132_15 = 0.75

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_16 = arg_129_1:FormatText(StoryNameCfg[82].name)

				arg_129_1.leftNameTxt_.text = var_132_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_17 = arg_129_1:GetWordFromCfg(106122030)
				local var_132_18 = arg_129_1:FormatText(var_132_17.content)

				arg_129_1.text_.text = var_132_18

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_19 = 30
				local var_132_20 = utf8.len(var_132_18)
				local var_132_21 = var_132_19 <= 0 and var_132_15 or var_132_15 * (var_132_20 / var_132_19)

				if var_132_21 > 0 and var_132_15 < var_132_21 then
					arg_129_1.talkMaxDuration = var_132_21

					if var_132_21 + var_132_14 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_21 + var_132_14
					end
				end

				arg_129_1.text_.text = var_132_18
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106122", "106122030", "story_v_out_106122.awb") ~= 0 then
					local var_132_22 = manager.audio:GetVoiceLength("story_v_out_106122", "106122030", "story_v_out_106122.awb") / 1000

					if var_132_22 + var_132_14 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_22 + var_132_14
					end

					if var_132_17.prefab_name ~= "" and arg_129_1.actors_[var_132_17.prefab_name] ~= nil then
						local var_132_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_17.prefab_name].transform, "story_v_out_106122", "106122030", "story_v_out_106122.awb")

						arg_129_1:RecordAudio("106122030", var_132_23)
						arg_129_1:RecordAudio("106122030", var_132_23)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_106122", "106122030", "story_v_out_106122.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_106122", "106122030", "story_v_out_106122.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_24 = math.max(var_132_15, arg_129_1.talkMaxDuration)

			if var_132_14 <= arg_129_1.time_ and arg_129_1.time_ < var_132_14 + var_132_24 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_14) / var_132_24

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_14 + var_132_24 and arg_129_1.time_ < var_132_14 + var_132_24 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C01b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0611"
	},
	voices = {
		"story_v_out_106122.awb"
	}
}
