return {
	Play104042001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104042001
		arg_1_1.duration_ = 4.666

		local var_1_0 = {
			ja = 4.566,
			ko = 4.066,
			zh = 4.166,
			en = 4.666
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play104042002(arg_1_1)
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

			local var_4_4 = "1084ui_story"

			if arg_1_1.actors_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(Asset.Load("Char/" .. var_4_4), arg_1_1.stage_.transform)

				var_4_5.name = var_4_4
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_4] = var_4_5

				local var_4_6 = var_4_5:GetComponentInChildren(typeof(CharacterEffect))

				var_4_6.enabled = true

				local var_4_7 = GameObjectTools.GetOrAddComponent(var_4_5, typeof(DynamicBoneHelper))

				if var_4_7 then
					var_4_7:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_6.transform, false)

				arg_1_1.var_[var_4_4 .. "Animator"] = var_4_6.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_4 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_4 .. "LipSync"] = var_4_6.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_8 = arg_1_1.actors_["1084ui_story"]
			local var_4_9 = 2

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_10 = 0.1

			if var_4_9 <= arg_1_1.time_ and arg_1_1.time_ < var_4_9 + var_4_10 then
				local var_4_11 = (arg_1_1.time_ - var_4_9) / var_4_10

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_9 + var_4_10 and arg_1_1.time_ < var_4_9 + var_4_10 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_12 = "S0403"

			if arg_1_1.bgs_[var_4_12] == nil then
				local var_4_13 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_12)
				var_4_13.name = var_4_12
				var_4_13.transform.parent = arg_1_1.stage_.transform
				var_4_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_12] = var_4_13
			end

			local var_4_14 = arg_1_1.bgs_.S0403
			local var_4_15 = 0

			if var_4_15 < arg_1_1.time_ and arg_1_1.time_ <= var_4_15 + arg_4_0 then
				local var_4_16 = var_4_14:GetComponent("SpriteRenderer")

				if var_4_16 then
					var_4_16.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_17 = var_4_16.material
					local var_4_18 = var_4_17:GetColor("_Color")

					arg_1_1.var_.alphaOldValueS0403 = var_4_18.a
					arg_1_1.var_.alphaMatValueS0403 = var_4_17
				end

				arg_1_1.var_.alphaOldValueS0403 = 0
			end

			local var_4_19 = 1.5

			if var_4_15 <= arg_1_1.time_ and arg_1_1.time_ < var_4_15 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_15) / var_4_19
				local var_4_21 = Mathf.Lerp(arg_1_1.var_.alphaOldValueS0403, 1, var_4_20)

				if arg_1_1.var_.alphaMatValueS0403 then
					local var_4_22 = arg_1_1.var_.alphaMatValueS0403
					local var_4_23 = var_4_22:GetColor("_Color")

					var_4_23.a = var_4_21

					var_4_22:SetColor("_Color", var_4_23)
				end
			end

			if arg_1_1.time_ >= var_4_15 + var_4_19 and arg_1_1.time_ < var_4_15 + var_4_19 + arg_4_0 and arg_1_1.var_.alphaMatValueS0403 then
				local var_4_24 = arg_1_1.var_.alphaMatValueS0403
				local var_4_25 = var_4_24:GetColor("_Color")

				var_4_25.a = 1

				var_4_24:SetColor("_Color", var_4_25)
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_27 = manager.ui.mainCamera.transform.localPosition
				local var_4_28 = Vector3.New(0, 0, 10) + Vector3.New(var_4_27.x, var_4_27.y, 0)
				local var_4_29 = arg_1_1.bgs_.S0403

				var_4_29.transform.localPosition = var_4_28
				var_4_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_30 = var_4_29:GetComponent("SpriteRenderer")

				if var_4_30 and var_4_30.sprite then
					local var_4_31 = (var_4_29.transform.localPosition - var_4_27).z
					local var_4_32 = manager.ui.mainCameraCom_
					local var_4_33 = 2 * var_4_31 * Mathf.Tan(var_4_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_34 = var_4_33 * var_4_32.aspect
					local var_4_35 = var_4_30.sprite.bounds.size.x
					local var_4_36 = var_4_30.sprite.bounds.size.y
					local var_4_37 = var_4_34 / var_4_35
					local var_4_38 = var_4_33 / var_4_36
					local var_4_39 = var_4_38 < var_4_37 and var_4_37 or var_4_38

					var_4_29.transform.localScale = Vector3.New(var_4_39, var_4_39, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "S0403" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_40 = 0

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_41 = 2

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_42 = 2
			local var_4_43 = 0.175

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_44 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_44:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_45 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_46 = arg_1_1:GetWordFromCfg(104042001)
				local var_4_47 = arg_1_1:FormatText(var_4_46.content)

				arg_1_1.text_.text = var_4_47

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_48 = 7
				local var_4_49 = utf8.len(var_4_47)
				local var_4_50 = var_4_48 <= 0 and var_4_43 or var_4_43 * (var_4_49 / var_4_48)

				if var_4_50 > 0 and var_4_43 < var_4_50 then
					arg_1_1.talkMaxDuration = var_4_50
					var_4_42 = var_4_42 + 0.3

					if var_4_50 + var_4_42 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_50 + var_4_42
					end
				end

				arg_1_1.text_.text = var_4_47
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042001", "story_v_out_104042.awb") ~= 0 then
					local var_4_51 = manager.audio:GetVoiceLength("story_v_out_104042", "104042001", "story_v_out_104042.awb") / 1000

					if var_4_51 + var_4_42 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_51 + var_4_42
					end

					if var_4_46.prefab_name ~= "" and arg_1_1.actors_[var_4_46.prefab_name] ~= nil then
						local var_4_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_46.prefab_name].transform, "story_v_out_104042", "104042001", "story_v_out_104042.awb")

						arg_1_1:RecordAudio("104042001", var_4_52)
						arg_1_1:RecordAudio("104042001", var_4_52)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_104042", "104042001", "story_v_out_104042.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_104042", "104042001", "story_v_out_104042.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_53 = var_4_42 + 0.3
			local var_4_54 = math.max(var_4_43, arg_1_1.talkMaxDuration)

			if var_4_53 <= arg_1_1.time_ and arg_1_1.time_ < var_4_53 + var_4_54 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_53) / var_4_54

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_53 + var_4_54 and arg_1_1.time_ < var_4_53 + var_4_54 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play104042002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104042002
		arg_7_1.duration_ = 4.633

		local var_7_0 = {
			ja = 3.733,
			ko = 4.633,
			zh = 4.1,
			en = 3.7
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
				arg_7_0:Play104042003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1084ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.1

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1084ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1084ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.225

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[36].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(104042002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 9
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042002", "story_v_out_104042.awb") ~= 0 then
					local var_10_14 = manager.audio:GetVoiceLength("story_v_out_104042", "104042002", "story_v_out_104042.awb") / 1000

					if var_10_14 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_14 + var_10_6
					end

					if var_10_9.prefab_name ~= "" and arg_7_1.actors_[var_10_9.prefab_name] ~= nil then
						local var_10_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_9.prefab_name].transform, "story_v_out_104042", "104042002", "story_v_out_104042.awb")

						arg_7_1:RecordAudio("104042002", var_10_15)
						arg_7_1:RecordAudio("104042002", var_10_15)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_104042", "104042002", "story_v_out_104042.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_104042", "104042002", "story_v_out_104042.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_16 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_16 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_16

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_16 and arg_7_1.time_ < var_10_6 + var_10_16 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play104042003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104042003
		arg_11_1.duration_ = 1.833

		local var_11_0 = {
			ja = 1.833,
			ko = 1.2,
			zh = 1,
			en = 1.233
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
				arg_11_0:Play104042004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1019ui_story"

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

			local var_14_4 = arg_11_1.actors_["1019ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect1019ui_story == nil then
				arg_11_1.var_.characterEffect1019ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.1

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect1019ui_story then
					arg_11_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect1019ui_story then
				arg_11_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_14_8 = 0
			local var_14_9 = 0.1

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_10 = arg_11_1:FormatText(StoryNameCfg[13].name)

				arg_11_1.leftNameTxt_.text = var_14_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_11 = arg_11_1:GetWordFromCfg(104042003)
				local var_14_12 = arg_11_1:FormatText(var_14_11.content)

				arg_11_1.text_.text = var_14_12

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_13 = 4
				local var_14_14 = utf8.len(var_14_12)
				local var_14_15 = var_14_13 <= 0 and var_14_9 or var_14_9 * (var_14_14 / var_14_13)

				if var_14_15 > 0 and var_14_9 < var_14_15 then
					arg_11_1.talkMaxDuration = var_14_15

					if var_14_15 + var_14_8 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_15 + var_14_8
					end
				end

				arg_11_1.text_.text = var_14_12
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042003", "story_v_out_104042.awb") ~= 0 then
					local var_14_16 = manager.audio:GetVoiceLength("story_v_out_104042", "104042003", "story_v_out_104042.awb") / 1000

					if var_14_16 + var_14_8 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_16 + var_14_8
					end

					if var_14_11.prefab_name ~= "" and arg_11_1.actors_[var_14_11.prefab_name] ~= nil then
						local var_14_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_11.prefab_name].transform, "story_v_out_104042", "104042003", "story_v_out_104042.awb")

						arg_11_1:RecordAudio("104042003", var_14_17)
						arg_11_1:RecordAudio("104042003", var_14_17)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104042", "104042003", "story_v_out_104042.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104042", "104042003", "story_v_out_104042.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_18 = math.max(var_14_9, arg_11_1.talkMaxDuration)

			if var_14_8 <= arg_11_1.time_ and arg_11_1.time_ < var_14_8 + var_14_18 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_8) / var_14_18

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_8 + var_14_18 and arg_11_1.time_ < var_14_8 + var_14_18 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play104042004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104042004
		arg_15_1.duration_ = 4.933

		local var_15_0 = {
			ja = 4.466,
			ko = 3.466,
			zh = 4.1,
			en = 4.933
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
				arg_15_0:Play104042005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1019ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story == nil then
				arg_15_1.var_.characterEffect1019ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1019ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1019ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1019ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1019ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.475

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(104042004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 19
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042004", "story_v_out_104042.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_104042", "104042004", "story_v_out_104042.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_104042", "104042004", "story_v_out_104042.awb")

						arg_15_1:RecordAudio("104042004", var_18_15)
						arg_15_1:RecordAudio("104042004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104042", "104042004", "story_v_out_104042.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104042", "104042004", "story_v_out_104042.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_16 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_16 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_16

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_16 and arg_15_1.time_ < var_18_6 + var_18_16 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104042005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104042005
		arg_19_1.duration_ = 4.633

		local var_19_0 = {
			ja = 2.233,
			ko = 3.1,
			zh = 3.233,
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
				arg_19_0:Play104042006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.425

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(104042005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042005", "story_v_out_104042.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_104042", "104042005", "story_v_out_104042.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_104042", "104042005", "story_v_out_104042.awb")

						arg_19_1:RecordAudio("104042005", var_22_9)
						arg_19_1:RecordAudio("104042005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104042", "104042005", "story_v_out_104042.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104042", "104042005", "story_v_out_104042.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play104042006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104042006
		arg_23_1.duration_ = 3.866

		local var_23_0 = {
			ja = 3.866,
			ko = 3.666,
			zh = 2.966,
			en = 3.333
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
				arg_23_0:Play104042007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.2

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[31].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(104042006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 7
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042006", "story_v_out_104042.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_104042", "104042006", "story_v_out_104042.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_104042", "104042006", "story_v_out_104042.awb")

						arg_23_1:RecordAudio("104042006", var_26_9)
						arg_23_1:RecordAudio("104042006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_104042", "104042006", "story_v_out_104042.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_104042", "104042006", "story_v_out_104042.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_10 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_10 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_10

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_10 and arg_23_1.time_ < var_26_0 + var_26_10 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play104042007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104042007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play104042008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.775

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(104042007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 31
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play104042008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104042008
		arg_31_1.duration_ = 3.166

		local var_31_0 = {
			ja = 2.2,
			ko = 2.533,
			zh = 2.233,
			en = 3.166
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
				arg_31_0:Play104042009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.225

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[37].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(104042008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042008", "story_v_out_104042.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_104042", "104042008", "story_v_out_104042.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_104042", "104042008", "story_v_out_104042.awb")

						arg_31_1:RecordAudio("104042008", var_34_9)
						arg_31_1:RecordAudio("104042008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104042", "104042008", "story_v_out_104042.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104042", "104042008", "story_v_out_104042.awb")
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
	Play104042009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104042009
		arg_35_1.duration_ = 2.733

		local var_35_0 = {
			ja = 2.3,
			ko = 2.733,
			zh = 2.6,
			en = 2.566
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
				arg_35_0:Play104042010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.25

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

				local var_38_3 = arg_35_1:GetWordFromCfg(104042009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042009", "story_v_out_104042.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_104042", "104042009", "story_v_out_104042.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_104042", "104042009", "story_v_out_104042.awb")

						arg_35_1:RecordAudio("104042009", var_38_9)
						arg_35_1:RecordAudio("104042009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_104042", "104042009", "story_v_out_104042.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_104042", "104042009", "story_v_out_104042.awb")
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
	Play104042010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104042010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play104042011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				local var_42_2 = "play"
				local var_42_3 = "effect"

				arg_39_1:AudioAction(var_42_2, var_42_3, "se_story_4", "se_story_4_cutchain", "")
			end

			local var_42_4 = 0
			local var_42_5 = 0.575

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_6 = arg_39_1:GetWordFromCfg(104042010)
				local var_42_7 = arg_39_1:FormatText(var_42_6.content)

				arg_39_1.text_.text = var_42_7

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_8 = 23
				local var_42_9 = utf8.len(var_42_7)
				local var_42_10 = var_42_8 <= 0 and var_42_5 or var_42_5 * (var_42_9 / var_42_8)

				if var_42_10 > 0 and var_42_5 < var_42_10 then
					arg_39_1.talkMaxDuration = var_42_10

					if var_42_10 + var_42_4 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_10 + var_42_4
					end
				end

				arg_39_1.text_.text = var_42_7
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_11 = math.max(var_42_5, arg_39_1.talkMaxDuration)

			if var_42_4 <= arg_39_1.time_ and arg_39_1.time_ < var_42_4 + var_42_11 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_4) / var_42_11

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_4 + var_42_11 and arg_39_1.time_ < var_42_4 + var_42_11 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play104042011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104042011
		arg_43_1.duration_ = 3.733

		local var_43_0 = {
			ja = 3.566,
			ko = 3.733,
			zh = 3.666,
			en = 3.3
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
				arg_43_0:Play104042012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"]
			local var_46_1 = 2

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1084ui_story then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.bgs_.S0403
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 then
				local var_46_6 = var_46_4:GetComponent("SpriteRenderer")

				if var_46_6 then
					var_46_6.material = arg_43_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_46_7 = var_46_6.material
					local var_46_8 = var_46_7:GetColor("_Color")

					arg_43_1.var_.alphaOldValueS0403 = var_46_8.a
					arg_43_1.var_.alphaMatValueS0403 = var_46_7
				end

				arg_43_1.var_.alphaOldValueS0403 = 1
			end

			local var_46_9 = 1.5

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_5) / var_46_9
				local var_46_11 = Mathf.Lerp(arg_43_1.var_.alphaOldValueS0403, 0, var_46_10)

				if arg_43_1.var_.alphaMatValueS0403 then
					local var_46_12 = arg_43_1.var_.alphaMatValueS0403
					local var_46_13 = var_46_12:GetColor("_Color")

					var_46_13.a = var_46_11

					var_46_12:SetColor("_Color", var_46_13)
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_9 and arg_43_1.time_ < var_46_5 + var_46_9 + arg_46_0 and arg_43_1.var_.alphaMatValueS0403 then
				local var_46_14 = arg_43_1.var_.alphaMatValueS0403
				local var_46_15 = var_46_14:GetColor("_Color")

				var_46_15.a = 0

				var_46_14:SetColor("_Color", var_46_15)
			end

			local var_46_16 = arg_43_1.bgs_.S0403.transform
			local var_46_17 = 1.5

			if var_46_17 < arg_43_1.time_ and arg_43_1.time_ <= var_46_17 + arg_46_0 then
				arg_43_1.var_.moveOldPosS0403 = var_46_16.localPosition
			end

			local var_46_18 = 0.001

			if var_46_17 <= arg_43_1.time_ and arg_43_1.time_ < var_46_17 + var_46_18 then
				local var_46_19 = (arg_43_1.time_ - var_46_17) / var_46_18
				local var_46_20 = Vector3.New(0, -100, 10)

				var_46_16.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPosS0403, var_46_20, var_46_19)
			end

			if arg_43_1.time_ >= var_46_17 + var_46_18 and arg_43_1.time_ < var_46_17 + var_46_18 + arg_46_0 then
				var_46_16.localPosition = Vector3.New(0, -100, 10)
			end

			local var_46_21 = "B04b"

			if arg_43_1.bgs_[var_46_21] == nil then
				local var_46_22 = Object.Instantiate(arg_43_1.paintGo_)

				var_46_22:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_46_21)
				var_46_22.name = var_46_21
				var_46_22.transform.parent = arg_43_1.stage_.transform
				var_46_22.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.bgs_[var_46_21] = var_46_22
			end

			local var_46_23 = arg_43_1.bgs_.B04b
			local var_46_24 = 1.5

			if var_46_24 < arg_43_1.time_ and arg_43_1.time_ <= var_46_24 + arg_46_0 then
				local var_46_25 = var_46_23:GetComponent("SpriteRenderer")

				if var_46_25 then
					var_46_25.material = arg_43_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_46_26 = var_46_25.material
					local var_46_27 = var_46_26:GetColor("_Color")

					arg_43_1.var_.alphaOldValueB04b = var_46_27.a
					arg_43_1.var_.alphaMatValueB04b = var_46_26
				end

				arg_43_1.var_.alphaOldValueB04b = 0
			end

			local var_46_28 = 1.5

			if var_46_24 <= arg_43_1.time_ and arg_43_1.time_ < var_46_24 + var_46_28 then
				local var_46_29 = (arg_43_1.time_ - var_46_24) / var_46_28
				local var_46_30 = Mathf.Lerp(arg_43_1.var_.alphaOldValueB04b, 1, var_46_29)

				if arg_43_1.var_.alphaMatValueB04b then
					local var_46_31 = arg_43_1.var_.alphaMatValueB04b
					local var_46_32 = var_46_31:GetColor("_Color")

					var_46_32.a = var_46_30

					var_46_31:SetColor("_Color", var_46_32)
				end
			end

			if arg_43_1.time_ >= var_46_24 + var_46_28 and arg_43_1.time_ < var_46_24 + var_46_28 + arg_46_0 and arg_43_1.var_.alphaMatValueB04b then
				local var_46_33 = arg_43_1.var_.alphaMatValueB04b
				local var_46_34 = var_46_33:GetColor("_Color")

				var_46_34.a = 1

				var_46_33:SetColor("_Color", var_46_34)
			end

			local var_46_35 = 1.5

			if var_46_35 < arg_43_1.time_ and arg_43_1.time_ <= var_46_35 + arg_46_0 then
				local var_46_36 = manager.ui.mainCamera.transform.localPosition
				local var_46_37 = Vector3.New(0, 0, 10) + Vector3.New(var_46_36.x, var_46_36.y, 0)
				local var_46_38 = arg_43_1.bgs_.B04b

				var_46_38.transform.localPosition = var_46_37
				var_46_38.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_46_39 = var_46_38:GetComponent("SpriteRenderer")

				if var_46_39 and var_46_39.sprite then
					local var_46_40 = (var_46_38.transform.localPosition - var_46_36).z
					local var_46_41 = manager.ui.mainCameraCom_
					local var_46_42 = 2 * var_46_40 * Mathf.Tan(var_46_41.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_46_43 = var_46_42 * var_46_41.aspect
					local var_46_44 = var_46_39.sprite.bounds.size.x
					local var_46_45 = var_46_39.sprite.bounds.size.y
					local var_46_46 = var_46_43 / var_46_44
					local var_46_47 = var_46_42 / var_46_45
					local var_46_48 = var_46_47 < var_46_46 and var_46_46 or var_46_47

					var_46_38.transform.localScale = Vector3.New(var_46_48, var_46_48, 0)
				end

				for iter_46_0, iter_46_1 in pairs(arg_43_1.bgs_) do
					if iter_46_0 ~= "B04b" then
						iter_46_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_46_49 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_50 = 1.79999995231628

			if var_46_50 < arg_43_1.time_ and arg_43_1.time_ <= var_46_50 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_49.localPosition
			end

			local var_46_51 = 0.001

			if var_46_50 <= arg_43_1.time_ and arg_43_1.time_ < var_46_50 + var_46_51 then
				local var_46_52 = (arg_43_1.time_ - var_46_50) / var_46_51
				local var_46_53 = Vector3.New(-0.7, -0.97, -6)

				var_46_49.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_53, var_46_52)

				local var_46_54 = manager.ui.mainCamera.transform.position - var_46_49.position

				var_46_49.forward = Vector3.New(var_46_54.x, var_46_54.y, var_46_54.z)

				local var_46_55 = var_46_49.localEulerAngles

				var_46_55.z = 0
				var_46_55.x = 0
				var_46_49.localEulerAngles = var_46_55
			end

			if arg_43_1.time_ >= var_46_50 + var_46_51 and arg_43_1.time_ < var_46_50 + var_46_51 + arg_46_0 then
				var_46_49.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_46_56 = manager.ui.mainCamera.transform.position - var_46_49.position

				var_46_49.forward = Vector3.New(var_46_56.x, var_46_56.y, var_46_56.z)

				local var_46_57 = var_46_49.localEulerAngles

				var_46_57.z = 0
				var_46_57.x = 0
				var_46_49.localEulerAngles = var_46_57
			end

			local var_46_58 = 0

			if var_46_58 < arg_43_1.time_ and arg_43_1.time_ <= var_46_58 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_46_59 = 0

			if var_46_59 < arg_43_1.time_ and arg_43_1.time_ <= var_46_59 + arg_46_0 then
				arg_43_1.allBtn_.enabled = false
			end

			local var_46_60 = 2

			if arg_43_1.time_ >= var_46_59 + var_46_60 and arg_43_1.time_ < var_46_59 + var_46_60 + arg_46_0 then
				arg_43_1.allBtn_.enabled = true
			end

			local var_46_61 = 0

			if var_46_61 < arg_43_1.time_ and arg_43_1.time_ <= var_46_61 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_43_1.frameCnt_ <= 1 then
				arg_43_1.dialog_:SetActive(false)
			end

			local var_46_62 = 2
			local var_46_63 = 0.175

			if var_46_62 < arg_43_1.time_ and arg_43_1.time_ <= var_46_62 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				arg_43_1.dialog_:SetActive(true)

				local var_46_64 = LeanTween.value(arg_43_1.dialog_, 0, 1, 0.3)

				var_46_64:setOnUpdate(LuaHelper.FloatAction(function(arg_47_0)
					arg_43_1.dialogCg_.alpha = arg_47_0
				end))
				var_46_64:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_43_1.dialog_)
					var_46_64:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_43_1.duration_ = arg_43_1.duration_ + 0.3

				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_65 = arg_43_1:FormatText(StoryNameCfg[6].name)

				arg_43_1.leftNameTxt_.text = var_46_65

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_66 = arg_43_1:GetWordFromCfg(104042011)
				local var_46_67 = arg_43_1:FormatText(var_46_66.content)

				arg_43_1.text_.text = var_46_67

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_68 = 7
				local var_46_69 = utf8.len(var_46_67)
				local var_46_70 = var_46_68 <= 0 and var_46_63 or var_46_63 * (var_46_69 / var_46_68)

				if var_46_70 > 0 and var_46_63 < var_46_70 then
					arg_43_1.talkMaxDuration = var_46_70
					var_46_62 = var_46_62 + 0.3

					if var_46_70 + var_46_62 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_70 + var_46_62
					end
				end

				arg_43_1.text_.text = var_46_67
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042011", "story_v_out_104042.awb") ~= 0 then
					local var_46_71 = manager.audio:GetVoiceLength("story_v_out_104042", "104042011", "story_v_out_104042.awb") / 1000

					if var_46_71 + var_46_62 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_71 + var_46_62
					end

					if var_46_66.prefab_name ~= "" and arg_43_1.actors_[var_46_66.prefab_name] ~= nil then
						local var_46_72 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_66.prefab_name].transform, "story_v_out_104042", "104042011", "story_v_out_104042.awb")

						arg_43_1:RecordAudio("104042011", var_46_72)
						arg_43_1:RecordAudio("104042011", var_46_72)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_104042", "104042011", "story_v_out_104042.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_104042", "104042011", "story_v_out_104042.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_73 = var_46_62 + 0.3
			local var_46_74 = math.max(var_46_63, arg_43_1.talkMaxDuration)

			if var_46_73 <= arg_43_1.time_ and arg_43_1.time_ < var_46_73 + var_46_74 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_73) / var_46_74

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_73 + var_46_74 and arg_43_1.time_ < var_46_73 + var_46_74 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play104042012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 104042012
		arg_49_1.duration_ = 11.733

		local var_49_0 = {
			ja = 6.1,
			ko = 9.5,
			zh = 11.733,
			en = 7.366
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
				arg_49_0:Play104042013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = "10001_tpose"

			if arg_49_1.actors_[var_52_0] == nil then
				local var_52_1 = Object.Instantiate(Asset.Load("Char/" .. var_52_0), arg_49_1.stage_.transform)

				var_52_1.name = var_52_0
				var_52_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.actors_[var_52_0] = var_52_1

				local var_52_2 = var_52_1:GetComponentInChildren(typeof(CharacterEffect))

				var_52_2.enabled = true

				local var_52_3 = GameObjectTools.GetOrAddComponent(var_52_1, typeof(DynamicBoneHelper))

				if var_52_3 then
					var_52_3:EnableDynamicBone(false)
				end

				arg_49_1:ShowWeapon(var_52_2.transform, false)

				arg_49_1.var_[var_52_0 .. "Animator"] = var_52_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_49_1.var_[var_52_0 .. "Animator"].applyRootMotion = true
				arg_49_1.var_[var_52_0 .. "LipSync"] = var_52_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_52_4 = arg_49_1.actors_["10001_tpose"]
			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 and arg_49_1.var_.characterEffect10001_tpose == nil then
				arg_49_1.var_.characterEffect10001_tpose = var_52_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_6 = 0.1

			if var_52_5 <= arg_49_1.time_ and arg_49_1.time_ < var_52_5 + var_52_6 then
				local var_52_7 = (arg_49_1.time_ - var_52_5) / var_52_6

				if arg_49_1.var_.characterEffect10001_tpose then
					arg_49_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_5 + var_52_6 and arg_49_1.time_ < var_52_5 + var_52_6 + arg_52_0 and arg_49_1.var_.characterEffect10001_tpose then
				arg_49_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_52_8 = arg_49_1.actors_["1084ui_story"]
			local var_52_9 = 0

			if var_52_9 < arg_49_1.time_ and arg_49_1.time_ <= var_52_9 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_10 = 0.1

			if var_52_9 <= arg_49_1.time_ and arg_49_1.time_ < var_52_9 + var_52_10 then
				local var_52_11 = (arg_49_1.time_ - var_52_9) / var_52_10

				if arg_49_1.var_.characterEffect1084ui_story then
					local var_52_12 = Mathf.Lerp(0, 0.5, var_52_11)

					arg_49_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1084ui_story.fillRatio = var_52_12
				end
			end

			if arg_49_1.time_ >= var_52_9 + var_52_10 and arg_49_1.time_ < var_52_9 + var_52_10 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story then
				local var_52_13 = 0.5

				arg_49_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1084ui_story.fillRatio = var_52_13
			end

			local var_52_14 = arg_49_1.actors_["10001_tpose"].transform
			local var_52_15 = 0

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.var_.moveOldPos10001_tpose = var_52_14.localPosition
			end

			local var_52_16 = 0.001

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_16 then
				local var_52_17 = (arg_49_1.time_ - var_52_15) / var_52_16
				local var_52_18 = Vector3.New(0.7, -1.23, -5.8)

				var_52_14.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10001_tpose, var_52_18, var_52_17)

				local var_52_19 = manager.ui.mainCamera.transform.position - var_52_14.position

				var_52_14.forward = Vector3.New(var_52_19.x, var_52_19.y, var_52_19.z)

				local var_52_20 = var_52_14.localEulerAngles

				var_52_20.z = 0
				var_52_20.x = 0
				var_52_14.localEulerAngles = var_52_20
			end

			if arg_49_1.time_ >= var_52_15 + var_52_16 and arg_49_1.time_ < var_52_15 + var_52_16 + arg_52_0 then
				var_52_14.localPosition = Vector3.New(0.7, -1.23, -5.8)

				local var_52_21 = manager.ui.mainCamera.transform.position - var_52_14.position

				var_52_14.forward = Vector3.New(var_52_21.x, var_52_21.y, var_52_21.z)

				local var_52_22 = var_52_14.localEulerAngles

				var_52_22.z = 0
				var_52_22.x = 0
				var_52_14.localEulerAngles = var_52_22
			end

			local var_52_23 = 0

			if var_52_23 < arg_49_1.time_ and arg_49_1.time_ <= var_52_23 + arg_52_0 then
				arg_49_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_1")
			end

			local var_52_24 = 0

			if var_52_24 < arg_49_1.time_ and arg_49_1.time_ <= var_52_24 + arg_52_0 then
				arg_49_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_52_25 = 0
			local var_52_26 = 0.6

			if var_52_25 < arg_49_1.time_ and arg_49_1.time_ <= var_52_25 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_27 = arg_49_1:FormatText(StoryNameCfg[31].name)

				arg_49_1.leftNameTxt_.text = var_52_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_28 = arg_49_1:GetWordFromCfg(104042012)
				local var_52_29 = arg_49_1:FormatText(var_52_28.content)

				arg_49_1.text_.text = var_52_29

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_30 = 23
				local var_52_31 = utf8.len(var_52_29)
				local var_52_32 = var_52_30 <= 0 and var_52_26 or var_52_26 * (var_52_31 / var_52_30)

				if var_52_32 > 0 and var_52_26 < var_52_32 then
					arg_49_1.talkMaxDuration = var_52_32

					if var_52_32 + var_52_25 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_32 + var_52_25
					end
				end

				arg_49_1.text_.text = var_52_29
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042012", "story_v_out_104042.awb") ~= 0 then
					local var_52_33 = manager.audio:GetVoiceLength("story_v_out_104042", "104042012", "story_v_out_104042.awb") / 1000

					if var_52_33 + var_52_25 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_33 + var_52_25
					end

					if var_52_28.prefab_name ~= "" and arg_49_1.actors_[var_52_28.prefab_name] ~= nil then
						local var_52_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_28.prefab_name].transform, "story_v_out_104042", "104042012", "story_v_out_104042.awb")

						arg_49_1:RecordAudio("104042012", var_52_34)
						arg_49_1:RecordAudio("104042012", var_52_34)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_104042", "104042012", "story_v_out_104042.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_104042", "104042012", "story_v_out_104042.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_35 = math.max(var_52_26, arg_49_1.talkMaxDuration)

			if var_52_25 <= arg_49_1.time_ and arg_49_1.time_ < var_52_25 + var_52_35 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_25) / var_52_35

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_25 + var_52_35 and arg_49_1.time_ < var_52_25 + var_52_35 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play104042013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 104042013
		arg_53_1.duration_ = 5.1

		local var_53_0 = {
			ja = 4.033,
			ko = 3.833,
			zh = 5.1,
			en = 2.7
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
				arg_53_0:Play104042014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_2")
			end

			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_56_2 = 0
			local var_56_3 = 0.325

			if var_56_2 < arg_53_1.time_ and arg_53_1.time_ <= var_56_2 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_4 = arg_53_1:FormatText(StoryNameCfg[31].name)

				arg_53_1.leftNameTxt_.text = var_56_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_5 = arg_53_1:GetWordFromCfg(104042013)
				local var_56_6 = arg_53_1:FormatText(var_56_5.content)

				arg_53_1.text_.text = var_56_6

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_7 = 11
				local var_56_8 = utf8.len(var_56_6)
				local var_56_9 = var_56_7 <= 0 and var_56_3 or var_56_3 * (var_56_8 / var_56_7)

				if var_56_9 > 0 and var_56_3 < var_56_9 then
					arg_53_1.talkMaxDuration = var_56_9

					if var_56_9 + var_56_2 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_9 + var_56_2
					end
				end

				arg_53_1.text_.text = var_56_6
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042013", "story_v_out_104042.awb") ~= 0 then
					local var_56_10 = manager.audio:GetVoiceLength("story_v_out_104042", "104042013", "story_v_out_104042.awb") / 1000

					if var_56_10 + var_56_2 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_10 + var_56_2
					end

					if var_56_5.prefab_name ~= "" and arg_53_1.actors_[var_56_5.prefab_name] ~= nil then
						local var_56_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_5.prefab_name].transform, "story_v_out_104042", "104042013", "story_v_out_104042.awb")

						arg_53_1:RecordAudio("104042013", var_56_11)
						arg_53_1:RecordAudio("104042013", var_56_11)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_104042", "104042013", "story_v_out_104042.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_104042", "104042013", "story_v_out_104042.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_12 = math.max(var_56_3, arg_53_1.talkMaxDuration)

			if var_56_2 <= arg_53_1.time_ and arg_53_1.time_ < var_56_2 + var_56_12 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_2) / var_56_12

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_2 + var_56_12 and arg_53_1.time_ < var_56_2 + var_56_12 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play104042014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 104042014
		arg_57_1.duration_ = 2.666

		local var_57_0 = {
			ja = 2.666,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_57_0:Play104042015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = "1036ui_story"

			if arg_57_1.actors_[var_60_0] == nil then
				local var_60_1 = Object.Instantiate(Asset.Load("Char/" .. var_60_0), arg_57_1.stage_.transform)

				var_60_1.name = var_60_0
				var_60_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_57_1.actors_[var_60_0] = var_60_1

				local var_60_2 = var_60_1:GetComponentInChildren(typeof(CharacterEffect))

				var_60_2.enabled = true

				local var_60_3 = GameObjectTools.GetOrAddComponent(var_60_1, typeof(DynamicBoneHelper))

				if var_60_3 then
					var_60_3:EnableDynamicBone(false)
				end

				arg_57_1:ShowWeapon(var_60_2.transform, false)

				arg_57_1.var_[var_60_0 .. "Animator"] = var_60_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_57_1.var_[var_60_0 .. "Animator"].applyRootMotion = true
				arg_57_1.var_[var_60_0 .. "LipSync"] = var_60_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_60_4 = arg_57_1.actors_["1036ui_story"]
			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 and arg_57_1.var_.characterEffect1036ui_story == nil then
				arg_57_1.var_.characterEffect1036ui_story = var_60_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_6 = 0.1

			if var_60_5 <= arg_57_1.time_ and arg_57_1.time_ < var_60_5 + var_60_6 then
				local var_60_7 = (arg_57_1.time_ - var_60_5) / var_60_6

				if arg_57_1.var_.characterEffect1036ui_story then
					arg_57_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_5 + var_60_6 and arg_57_1.time_ < var_60_5 + var_60_6 + arg_60_0 and arg_57_1.var_.characterEffect1036ui_story then
				arg_57_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_60_8 = arg_57_1.actors_["10001_tpose"]
			local var_60_9 = 0

			if var_60_9 < arg_57_1.time_ and arg_57_1.time_ <= var_60_9 + arg_60_0 and arg_57_1.var_.characterEffect10001_tpose == nil then
				arg_57_1.var_.characterEffect10001_tpose = var_60_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_10 = 0.1

			if var_60_9 <= arg_57_1.time_ and arg_57_1.time_ < var_60_9 + var_60_10 then
				local var_60_11 = (arg_57_1.time_ - var_60_9) / var_60_10

				if arg_57_1.var_.characterEffect10001_tpose then
					local var_60_12 = Mathf.Lerp(0, 0.5, var_60_11)

					arg_57_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_57_1.var_.characterEffect10001_tpose.fillRatio = var_60_12
				end
			end

			if arg_57_1.time_ >= var_60_9 + var_60_10 and arg_57_1.time_ < var_60_9 + var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect10001_tpose then
				local var_60_13 = 0.5

				arg_57_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_57_1.var_.characterEffect10001_tpose.fillRatio = var_60_13
			end

			local var_60_14 = arg_57_1.actors_["1084ui_story"].transform
			local var_60_15 = 0

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				arg_57_1.var_.moveOldPos1084ui_story = var_60_14.localPosition
			end

			local var_60_16 = 0.001

			if var_60_15 <= arg_57_1.time_ and arg_57_1.time_ < var_60_15 + var_60_16 then
				local var_60_17 = (arg_57_1.time_ - var_60_15) / var_60_16
				local var_60_18 = Vector3.New(0, 100, 0)

				var_60_14.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1084ui_story, var_60_18, var_60_17)

				local var_60_19 = manager.ui.mainCamera.transform.position - var_60_14.position

				var_60_14.forward = Vector3.New(var_60_19.x, var_60_19.y, var_60_19.z)

				local var_60_20 = var_60_14.localEulerAngles

				var_60_20.z = 0
				var_60_20.x = 0
				var_60_14.localEulerAngles = var_60_20
			end

			if arg_57_1.time_ >= var_60_15 + var_60_16 and arg_57_1.time_ < var_60_15 + var_60_16 + arg_60_0 then
				var_60_14.localPosition = Vector3.New(0, 100, 0)

				local var_60_21 = manager.ui.mainCamera.transform.position - var_60_14.position

				var_60_14.forward = Vector3.New(var_60_21.x, var_60_21.y, var_60_21.z)

				local var_60_22 = var_60_14.localEulerAngles

				var_60_22.z = 0
				var_60_22.x = 0
				var_60_14.localEulerAngles = var_60_22
			end

			local var_60_23 = arg_57_1.actors_["1036ui_story"].transform
			local var_60_24 = 0

			if var_60_24 < arg_57_1.time_ and arg_57_1.time_ <= var_60_24 + arg_60_0 then
				arg_57_1.var_.moveOldPos1036ui_story = var_60_23.localPosition
			end

			local var_60_25 = 0.001

			if var_60_24 <= arg_57_1.time_ and arg_57_1.time_ < var_60_24 + var_60_25 then
				local var_60_26 = (arg_57_1.time_ - var_60_24) / var_60_25
				local var_60_27 = Vector3.New(-0.7, -1.09, -5.78)

				var_60_23.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1036ui_story, var_60_27, var_60_26)

				local var_60_28 = manager.ui.mainCamera.transform.position - var_60_23.position

				var_60_23.forward = Vector3.New(var_60_28.x, var_60_28.y, var_60_28.z)

				local var_60_29 = var_60_23.localEulerAngles

				var_60_29.z = 0
				var_60_29.x = 0
				var_60_23.localEulerAngles = var_60_29
			end

			if arg_57_1.time_ >= var_60_24 + var_60_25 and arg_57_1.time_ < var_60_24 + var_60_25 + arg_60_0 then
				var_60_23.localPosition = Vector3.New(-0.7, -1.09, -5.78)

				local var_60_30 = manager.ui.mainCamera.transform.position - var_60_23.position

				var_60_23.forward = Vector3.New(var_60_30.x, var_60_30.y, var_60_30.z)

				local var_60_31 = var_60_23.localEulerAngles

				var_60_31.z = 0
				var_60_31.x = 0
				var_60_23.localEulerAngles = var_60_31
			end

			local var_60_32 = 0

			if var_60_32 < arg_57_1.time_ and arg_57_1.time_ <= var_60_32 + arg_60_0 then
				arg_57_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action4_1")
			end

			local var_60_33 = 0

			if var_60_33 < arg_57_1.time_ and arg_57_1.time_ <= var_60_33 + arg_60_0 then
				arg_57_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_60_34 = 0
			local var_60_35 = 0.225

			if var_60_34 < arg_57_1.time_ and arg_57_1.time_ <= var_60_34 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_36 = arg_57_1:FormatText(StoryNameCfg[5].name)

				arg_57_1.leftNameTxt_.text = var_60_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_37 = arg_57_1:GetWordFromCfg(104042014)
				local var_60_38 = arg_57_1:FormatText(var_60_37.content)

				arg_57_1.text_.text = var_60_38

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_39 = 9
				local var_60_40 = utf8.len(var_60_38)
				local var_60_41 = var_60_39 <= 0 and var_60_35 or var_60_35 * (var_60_40 / var_60_39)

				if var_60_41 > 0 and var_60_35 < var_60_41 then
					arg_57_1.talkMaxDuration = var_60_41

					if var_60_41 + var_60_34 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_41 + var_60_34
					end
				end

				arg_57_1.text_.text = var_60_38
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042014", "story_v_out_104042.awb") ~= 0 then
					local var_60_42 = manager.audio:GetVoiceLength("story_v_out_104042", "104042014", "story_v_out_104042.awb") / 1000

					if var_60_42 + var_60_34 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_42 + var_60_34
					end

					if var_60_37.prefab_name ~= "" and arg_57_1.actors_[var_60_37.prefab_name] ~= nil then
						local var_60_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_37.prefab_name].transform, "story_v_out_104042", "104042014", "story_v_out_104042.awb")

						arg_57_1:RecordAudio("104042014", var_60_43)
						arg_57_1:RecordAudio("104042014", var_60_43)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_104042", "104042014", "story_v_out_104042.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_104042", "104042014", "story_v_out_104042.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_44 = math.max(var_60_35, arg_57_1.talkMaxDuration)

			if var_60_34 <= arg_57_1.time_ and arg_57_1.time_ < var_60_34 + var_60_44 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_34) / var_60_44

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_34 + var_60_44 and arg_57_1.time_ < var_60_34 + var_60_44 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play104042015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 104042015
		arg_61_1.duration_ = 3.933

		local var_61_0 = {
			ja = 3.933,
			ko = 2.933,
			zh = 2.533,
			en = 2.766
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
				arg_61_0:Play104042016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1019ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect1019ui_story == nil then
				arg_61_1.var_.characterEffect1019ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.1

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1019ui_story then
					arg_61_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect1019ui_story then
				arg_61_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["1036ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect1036ui_story == nil then
				arg_61_1.var_.characterEffect1036ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.1

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect1036ui_story then
					local var_64_8 = Mathf.Lerp(0, 0.5, var_64_7)

					arg_61_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1036ui_story.fillRatio = var_64_8
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect1036ui_story then
				local var_64_9 = 0.5

				arg_61_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1036ui_story.fillRatio = var_64_9
			end

			local var_64_10 = arg_61_1.actors_["1036ui_story"].transform
			local var_64_11 = 0

			if var_64_11 < arg_61_1.time_ and arg_61_1.time_ <= var_64_11 + arg_64_0 then
				arg_61_1.var_.moveOldPos1036ui_story = var_64_10.localPosition
			end

			local var_64_12 = 0.001

			if var_64_11 <= arg_61_1.time_ and arg_61_1.time_ < var_64_11 + var_64_12 then
				local var_64_13 = (arg_61_1.time_ - var_64_11) / var_64_12
				local var_64_14 = Vector3.New(0, 100, 0)

				var_64_10.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1036ui_story, var_64_14, var_64_13)

				local var_64_15 = manager.ui.mainCamera.transform.position - var_64_10.position

				var_64_10.forward = Vector3.New(var_64_15.x, var_64_15.y, var_64_15.z)

				local var_64_16 = var_64_10.localEulerAngles

				var_64_16.z = 0
				var_64_16.x = 0
				var_64_10.localEulerAngles = var_64_16
			end

			if arg_61_1.time_ >= var_64_11 + var_64_12 and arg_61_1.time_ < var_64_11 + var_64_12 + arg_64_0 then
				var_64_10.localPosition = Vector3.New(0, 100, 0)

				local var_64_17 = manager.ui.mainCamera.transform.position - var_64_10.position

				var_64_10.forward = Vector3.New(var_64_17.x, var_64_17.y, var_64_17.z)

				local var_64_18 = var_64_10.localEulerAngles

				var_64_18.z = 0
				var_64_18.x = 0
				var_64_10.localEulerAngles = var_64_18
			end

			local var_64_19 = arg_61_1.actors_["1019ui_story"].transform
			local var_64_20 = 0

			if var_64_20 < arg_61_1.time_ and arg_61_1.time_ <= var_64_20 + arg_64_0 then
				arg_61_1.var_.moveOldPos1019ui_story = var_64_19.localPosition
			end

			local var_64_21 = 0.001

			if var_64_20 <= arg_61_1.time_ and arg_61_1.time_ < var_64_20 + var_64_21 then
				local var_64_22 = (arg_61_1.time_ - var_64_20) / var_64_21
				local var_64_23 = Vector3.New(-0.7, -1.08, -5.9)

				var_64_19.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1019ui_story, var_64_23, var_64_22)

				local var_64_24 = manager.ui.mainCamera.transform.position - var_64_19.position

				var_64_19.forward = Vector3.New(var_64_24.x, var_64_24.y, var_64_24.z)

				local var_64_25 = var_64_19.localEulerAngles

				var_64_25.z = 0
				var_64_25.x = 0
				var_64_19.localEulerAngles = var_64_25
			end

			if arg_61_1.time_ >= var_64_20 + var_64_21 and arg_61_1.time_ < var_64_20 + var_64_21 + arg_64_0 then
				var_64_19.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_64_26 = manager.ui.mainCamera.transform.position - var_64_19.position

				var_64_19.forward = Vector3.New(var_64_26.x, var_64_26.y, var_64_26.z)

				local var_64_27 = var_64_19.localEulerAngles

				var_64_27.z = 0
				var_64_27.x = 0
				var_64_19.localEulerAngles = var_64_27
			end

			local var_64_28 = 0

			if var_64_28 < arg_61_1.time_ and arg_61_1.time_ <= var_64_28 + arg_64_0 then
				arg_61_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_64_29 = 0

			if var_64_29 < arg_61_1.time_ and arg_61_1.time_ <= var_64_29 + arg_64_0 then
				arg_61_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_64_30 = 0
			local var_64_31 = 0.325

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_32 = arg_61_1:FormatText(StoryNameCfg[13].name)

				arg_61_1.leftNameTxt_.text = var_64_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_33 = arg_61_1:GetWordFromCfg(104042015)
				local var_64_34 = arg_61_1:FormatText(var_64_33.content)

				arg_61_1.text_.text = var_64_34

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_35 = 13
				local var_64_36 = utf8.len(var_64_34)
				local var_64_37 = var_64_35 <= 0 and var_64_31 or var_64_31 * (var_64_36 / var_64_35)

				if var_64_37 > 0 and var_64_31 < var_64_37 then
					arg_61_1.talkMaxDuration = var_64_37

					if var_64_37 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_37 + var_64_30
					end
				end

				arg_61_1.text_.text = var_64_34
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042015", "story_v_out_104042.awb") ~= 0 then
					local var_64_38 = manager.audio:GetVoiceLength("story_v_out_104042", "104042015", "story_v_out_104042.awb") / 1000

					if var_64_38 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_38 + var_64_30
					end

					if var_64_33.prefab_name ~= "" and arg_61_1.actors_[var_64_33.prefab_name] ~= nil then
						local var_64_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_33.prefab_name].transform, "story_v_out_104042", "104042015", "story_v_out_104042.awb")

						arg_61_1:RecordAudio("104042015", var_64_39)
						arg_61_1:RecordAudio("104042015", var_64_39)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_104042", "104042015", "story_v_out_104042.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_104042", "104042015", "story_v_out_104042.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_40 = math.max(var_64_31, arg_61_1.talkMaxDuration)

			if var_64_30 <= arg_61_1.time_ and arg_61_1.time_ < var_64_30 + var_64_40 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_30) / var_64_40

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_30 + var_64_40 and arg_61_1.time_ < var_64_30 + var_64_40 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play104042016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 104042016
		arg_65_1.duration_ = 5.666

		local var_65_0 = {
			ja = 3.866,
			ko = 3.633,
			zh = 5.666,
			en = 4.2
		}
		local var_65_1 = manager.audio:GetLocalizationFlag()

		if var_65_0[var_65_1] ~= nil then
			arg_65_1.duration_ = var_65_0[var_65_1]
		end

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play104042017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10001_tpose"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect10001_tpose == nil then
				arg_65_1.var_.characterEffect10001_tpose = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.1

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect10001_tpose then
					arg_65_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect10001_tpose then
				arg_65_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_68_4 = arg_65_1.actors_["1019ui_story"]
			local var_68_5 = 0

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 and arg_65_1.var_.characterEffect1019ui_story == nil then
				arg_65_1.var_.characterEffect1019ui_story = var_68_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_6 = 0.1

			if var_68_5 <= arg_65_1.time_ and arg_65_1.time_ < var_68_5 + var_68_6 then
				local var_68_7 = (arg_65_1.time_ - var_68_5) / var_68_6

				if arg_65_1.var_.characterEffect1019ui_story then
					local var_68_8 = Mathf.Lerp(0, 0.5, var_68_7)

					arg_65_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1019ui_story.fillRatio = var_68_8
				end
			end

			if arg_65_1.time_ >= var_68_5 + var_68_6 and arg_65_1.time_ < var_68_5 + var_68_6 + arg_68_0 and arg_65_1.var_.characterEffect1019ui_story then
				local var_68_9 = 0.5

				arg_65_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1019ui_story.fillRatio = var_68_9
			end

			local var_68_10 = 0

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 then
				arg_65_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_1")
			end

			local var_68_11 = 0

			if var_68_11 < arg_65_1.time_ and arg_65_1.time_ <= var_68_11 + arg_68_0 then
				arg_65_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_68_12 = 0
			local var_68_13 = 0.4

			if var_68_12 < arg_65_1.time_ and arg_65_1.time_ <= var_68_12 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_14 = arg_65_1:FormatText(StoryNameCfg[31].name)

				arg_65_1.leftNameTxt_.text = var_68_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_15 = arg_65_1:GetWordFromCfg(104042016)
				local var_68_16 = arg_65_1:FormatText(var_68_15.content)

				arg_65_1.text_.text = var_68_16

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_17 = 16
				local var_68_18 = utf8.len(var_68_16)
				local var_68_19 = var_68_17 <= 0 and var_68_13 or var_68_13 * (var_68_18 / var_68_17)

				if var_68_19 > 0 and var_68_13 < var_68_19 then
					arg_65_1.talkMaxDuration = var_68_19

					if var_68_19 + var_68_12 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_19 + var_68_12
					end
				end

				arg_65_1.text_.text = var_68_16
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042016", "story_v_out_104042.awb") ~= 0 then
					local var_68_20 = manager.audio:GetVoiceLength("story_v_out_104042", "104042016", "story_v_out_104042.awb") / 1000

					if var_68_20 + var_68_12 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_20 + var_68_12
					end

					if var_68_15.prefab_name ~= "" and arg_65_1.actors_[var_68_15.prefab_name] ~= nil then
						local var_68_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_15.prefab_name].transform, "story_v_out_104042", "104042016", "story_v_out_104042.awb")

						arg_65_1:RecordAudio("104042016", var_68_21)
						arg_65_1:RecordAudio("104042016", var_68_21)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_104042", "104042016", "story_v_out_104042.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_104042", "104042016", "story_v_out_104042.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_22 = math.max(var_68_13, arg_65_1.talkMaxDuration)

			if var_68_12 <= arg_65_1.time_ and arg_65_1.time_ < var_68_12 + var_68_22 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_12) / var_68_22

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_12 + var_68_22 and arg_65_1.time_ < var_68_12 + var_68_22 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play104042017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 104042017
		arg_69_1.duration_ = 2.366

		local var_69_0 = {
			ja = 2.366,
			ko = 1.633,
			zh = 2,
			en = 1.9
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
				arg_69_0:Play104042018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["10001_tpose"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect10001_tpose == nil then
				arg_69_1.var_.characterEffect10001_tpose = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.1

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect10001_tpose then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_69_1.var_.characterEffect10001_tpose.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect10001_tpose then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_69_1.var_.characterEffect10001_tpose.fillRatio = var_72_5
			end

			local var_72_6 = 0
			local var_72_7 = 0.2

			if var_72_6 < arg_69_1.time_ and arg_69_1.time_ <= var_72_6 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_8 = arg_69_1:FormatText(StoryNameCfg[5].name)

				arg_69_1.leftNameTxt_.text = var_72_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_9 = arg_69_1:GetWordFromCfg(104042017)
				local var_72_10 = arg_69_1:FormatText(var_72_9.content)

				arg_69_1.text_.text = var_72_10

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_11 = 8
				local var_72_12 = utf8.len(var_72_10)
				local var_72_13 = var_72_11 <= 0 and var_72_7 or var_72_7 * (var_72_12 / var_72_11)

				if var_72_13 > 0 and var_72_7 < var_72_13 then
					arg_69_1.talkMaxDuration = var_72_13

					if var_72_13 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_13 + var_72_6
					end
				end

				arg_69_1.text_.text = var_72_10
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042017", "story_v_out_104042.awb") ~= 0 then
					local var_72_14 = manager.audio:GetVoiceLength("story_v_out_104042", "104042017", "story_v_out_104042.awb") / 1000

					if var_72_14 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_14 + var_72_6
					end

					if var_72_9.prefab_name ~= "" and arg_69_1.actors_[var_72_9.prefab_name] ~= nil then
						local var_72_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_9.prefab_name].transform, "story_v_out_104042", "104042017", "story_v_out_104042.awb")

						arg_69_1:RecordAudio("104042017", var_72_15)
						arg_69_1:RecordAudio("104042017", var_72_15)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_104042", "104042017", "story_v_out_104042.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_104042", "104042017", "story_v_out_104042.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_16 = math.max(var_72_7, arg_69_1.talkMaxDuration)

			if var_72_6 <= arg_69_1.time_ and arg_69_1.time_ < var_72_6 + var_72_16 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_6) / var_72_16

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_6 + var_72_16 and arg_69_1.time_ < var_72_6 + var_72_16 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play104042018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 104042018
		arg_73_1.duration_ = 7.166

		local var_73_0 = {
			ja = 4.7,
			ko = 5.766,
			zh = 7.166,
			en = 5.5
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
				arg_73_0:Play104042019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10001_tpose"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect10001_tpose == nil then
				arg_73_1.var_.characterEffect10001_tpose = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect10001_tpose then
					arg_73_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect10001_tpose then
				arg_73_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_76_4 = 0

			if var_76_4 < arg_73_1.time_ and arg_73_1.time_ <= var_76_4 + arg_76_0 then
				arg_73_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action445")
			end

			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_76_6 = 0
			local var_76_7 = 0.75

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_8 = arg_73_1:FormatText(StoryNameCfg[31].name)

				arg_73_1.leftNameTxt_.text = var_76_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_9 = arg_73_1:GetWordFromCfg(104042018)
				local var_76_10 = arg_73_1:FormatText(var_76_9.content)

				arg_73_1.text_.text = var_76_10

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_11 = 30
				local var_76_12 = utf8.len(var_76_10)
				local var_76_13 = var_76_11 <= 0 and var_76_7 or var_76_7 * (var_76_12 / var_76_11)

				if var_76_13 > 0 and var_76_7 < var_76_13 then
					arg_73_1.talkMaxDuration = var_76_13

					if var_76_13 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_13 + var_76_6
					end
				end

				arg_73_1.text_.text = var_76_10
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042018", "story_v_out_104042.awb") ~= 0 then
					local var_76_14 = manager.audio:GetVoiceLength("story_v_out_104042", "104042018", "story_v_out_104042.awb") / 1000

					if var_76_14 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_14 + var_76_6
					end

					if var_76_9.prefab_name ~= "" and arg_73_1.actors_[var_76_9.prefab_name] ~= nil then
						local var_76_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_9.prefab_name].transform, "story_v_out_104042", "104042018", "story_v_out_104042.awb")

						arg_73_1:RecordAudio("104042018", var_76_15)
						arg_73_1:RecordAudio("104042018", var_76_15)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_104042", "104042018", "story_v_out_104042.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_104042", "104042018", "story_v_out_104042.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_16 = math.max(var_76_7, arg_73_1.talkMaxDuration)

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_16 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_6) / var_76_16

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_6 + var_76_16 and arg_73_1.time_ < var_76_6 + var_76_16 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play104042019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 104042019
		arg_77_1.duration_ = 6.466

		local var_77_0 = {
			ja = 6.466,
			ko = 3.8,
			zh = 4.166,
			en = 4.166
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
				arg_77_0:Play104042020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1019ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1019ui_story == nil then
				arg_77_1.var_.characterEffect1019ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.1

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1019ui_story then
					arg_77_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1019ui_story then
				arg_77_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_80_4 = arg_77_1.actors_["10001_tpose"]
			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 and arg_77_1.var_.characterEffect10001_tpose == nil then
				arg_77_1.var_.characterEffect10001_tpose = var_80_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_6 = 0.1

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_6 then
				local var_80_7 = (arg_77_1.time_ - var_80_5) / var_80_6

				if arg_77_1.var_.characterEffect10001_tpose then
					local var_80_8 = Mathf.Lerp(0, 0.5, var_80_7)

					arg_77_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_77_1.var_.characterEffect10001_tpose.fillRatio = var_80_8
				end
			end

			if arg_77_1.time_ >= var_80_5 + var_80_6 and arg_77_1.time_ < var_80_5 + var_80_6 + arg_80_0 and arg_77_1.var_.characterEffect10001_tpose then
				local var_80_9 = 0.5

				arg_77_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_77_1.var_.characterEffect10001_tpose.fillRatio = var_80_9
			end

			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_80_11 = 0

			if var_80_11 < arg_77_1.time_ and arg_77_1.time_ <= var_80_11 + arg_80_0 then
				arg_77_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_80_12 = 0
			local var_80_13 = 0.625

			if var_80_12 < arg_77_1.time_ and arg_77_1.time_ <= var_80_12 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_14 = arg_77_1:FormatText(StoryNameCfg[13].name)

				arg_77_1.leftNameTxt_.text = var_80_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_15 = arg_77_1:GetWordFromCfg(104042019)
				local var_80_16 = arg_77_1:FormatText(var_80_15.content)

				arg_77_1.text_.text = var_80_16

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_17 = 25
				local var_80_18 = utf8.len(var_80_16)
				local var_80_19 = var_80_17 <= 0 and var_80_13 or var_80_13 * (var_80_18 / var_80_17)

				if var_80_19 > 0 and var_80_13 < var_80_19 then
					arg_77_1.talkMaxDuration = var_80_19

					if var_80_19 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_19 + var_80_12
					end
				end

				arg_77_1.text_.text = var_80_16
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042019", "story_v_out_104042.awb") ~= 0 then
					local var_80_20 = manager.audio:GetVoiceLength("story_v_out_104042", "104042019", "story_v_out_104042.awb") / 1000

					if var_80_20 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_20 + var_80_12
					end

					if var_80_15.prefab_name ~= "" and arg_77_1.actors_[var_80_15.prefab_name] ~= nil then
						local var_80_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_15.prefab_name].transform, "story_v_out_104042", "104042019", "story_v_out_104042.awb")

						arg_77_1:RecordAudio("104042019", var_80_21)
						arg_77_1:RecordAudio("104042019", var_80_21)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_104042", "104042019", "story_v_out_104042.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_104042", "104042019", "story_v_out_104042.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_22 = math.max(var_80_13, arg_77_1.talkMaxDuration)

			if var_80_12 <= arg_77_1.time_ and arg_77_1.time_ < var_80_12 + var_80_22 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_12) / var_80_22

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_12 + var_80_22 and arg_77_1.time_ < var_80_12 + var_80_22 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play104042020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 104042020
		arg_81_1.duration_ = 5.066

		local var_81_0 = {
			ja = 5.066,
			ko = 2.733,
			zh = 3.7,
			en = 2.4
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
				arg_81_0:Play104042021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10001_tpose"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect10001_tpose == nil then
				arg_81_1.var_.characterEffect10001_tpose = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.1

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect10001_tpose then
					arg_81_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect10001_tpose then
				arg_81_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1019ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1019ui_story == nil then
				arg_81_1.var_.characterEffect1019ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.1

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1019ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1019ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1019ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1019ui_story.fillRatio = var_84_9
			end

			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action5_2")
			end

			local var_84_11 = 0

			if var_84_11 < arg_81_1.time_ and arg_81_1.time_ <= var_84_11 + arg_84_0 then
				arg_81_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_84_12 = 0
			local var_84_13 = 0.25

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_14 = arg_81_1:FormatText(StoryNameCfg[31].name)

				arg_81_1.leftNameTxt_.text = var_84_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_15 = arg_81_1:GetWordFromCfg(104042020)
				local var_84_16 = arg_81_1:FormatText(var_84_15.content)

				arg_81_1.text_.text = var_84_16

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_17 = 10
				local var_84_18 = utf8.len(var_84_16)
				local var_84_19 = var_84_17 <= 0 and var_84_13 or var_84_13 * (var_84_18 / var_84_17)

				if var_84_19 > 0 and var_84_13 < var_84_19 then
					arg_81_1.talkMaxDuration = var_84_19

					if var_84_19 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_19 + var_84_12
					end
				end

				arg_81_1.text_.text = var_84_16
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042020", "story_v_out_104042.awb") ~= 0 then
					local var_84_20 = manager.audio:GetVoiceLength("story_v_out_104042", "104042020", "story_v_out_104042.awb") / 1000

					if var_84_20 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_12
					end

					if var_84_15.prefab_name ~= "" and arg_81_1.actors_[var_84_15.prefab_name] ~= nil then
						local var_84_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_15.prefab_name].transform, "story_v_out_104042", "104042020", "story_v_out_104042.awb")

						arg_81_1:RecordAudio("104042020", var_84_21)
						arg_81_1:RecordAudio("104042020", var_84_21)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_104042", "104042020", "story_v_out_104042.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_104042", "104042020", "story_v_out_104042.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_22 = math.max(var_84_13, arg_81_1.talkMaxDuration)

			if var_84_12 <= arg_81_1.time_ and arg_81_1.time_ < var_84_12 + var_84_22 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_12) / var_84_22

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_12 + var_84_22 and arg_81_1.time_ < var_84_12 + var_84_22 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play104042021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 104042021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play104042022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10001_tpose"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect10001_tpose == nil then
				arg_85_1.var_.characterEffect10001_tpose = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.1

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect10001_tpose then
					local var_88_4 = Mathf.Lerp(0, 0.5, var_88_3)

					arg_85_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_85_1.var_.characterEffect10001_tpose.fillRatio = var_88_4
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect10001_tpose then
				local var_88_5 = 0.5

				arg_85_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_85_1.var_.characterEffect10001_tpose.fillRatio = var_88_5
			end

			local var_88_6 = arg_85_1.actors_["10001_tpose"].transform
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 then
				arg_85_1.var_.moveOldPos10001_tpose = var_88_6.localPosition
			end

			local var_88_8 = 0.001

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8
				local var_88_10 = Vector3.New(0, 100, 0)

				var_88_6.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10001_tpose, var_88_10, var_88_9)

				local var_88_11 = manager.ui.mainCamera.transform.position - var_88_6.position

				var_88_6.forward = Vector3.New(var_88_11.x, var_88_11.y, var_88_11.z)

				local var_88_12 = var_88_6.localEulerAngles

				var_88_12.z = 0
				var_88_12.x = 0
				var_88_6.localEulerAngles = var_88_12
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 then
				var_88_6.localPosition = Vector3.New(0, 100, 0)

				local var_88_13 = manager.ui.mainCamera.transform.position - var_88_6.position

				var_88_6.forward = Vector3.New(var_88_13.x, var_88_13.y, var_88_13.z)

				local var_88_14 = var_88_6.localEulerAngles

				var_88_14.z = 0
				var_88_14.x = 0
				var_88_6.localEulerAngles = var_88_14
			end

			local var_88_15 = arg_85_1.actors_["1019ui_story"].transform
			local var_88_16 = 0

			if var_88_16 < arg_85_1.time_ and arg_85_1.time_ <= var_88_16 + arg_88_0 then
				arg_85_1.var_.moveOldPos1019ui_story = var_88_15.localPosition
			end

			local var_88_17 = 0.001

			if var_88_16 <= arg_85_1.time_ and arg_85_1.time_ < var_88_16 + var_88_17 then
				local var_88_18 = (arg_85_1.time_ - var_88_16) / var_88_17
				local var_88_19 = Vector3.New(0, 100, 0)

				var_88_15.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1019ui_story, var_88_19, var_88_18)

				local var_88_20 = manager.ui.mainCamera.transform.position - var_88_15.position

				var_88_15.forward = Vector3.New(var_88_20.x, var_88_20.y, var_88_20.z)

				local var_88_21 = var_88_15.localEulerAngles

				var_88_21.z = 0
				var_88_21.x = 0
				var_88_15.localEulerAngles = var_88_21
			end

			if arg_85_1.time_ >= var_88_16 + var_88_17 and arg_85_1.time_ < var_88_16 + var_88_17 + arg_88_0 then
				var_88_15.localPosition = Vector3.New(0, 100, 0)

				local var_88_22 = manager.ui.mainCamera.transform.position - var_88_15.position

				var_88_15.forward = Vector3.New(var_88_22.x, var_88_22.y, var_88_22.z)

				local var_88_23 = var_88_15.localEulerAngles

				var_88_23.z = 0
				var_88_23.x = 0
				var_88_15.localEulerAngles = var_88_23
			end

			local var_88_24 = 0
			local var_88_25 = 1.05

			if var_88_24 < arg_85_1.time_ and arg_85_1.time_ <= var_88_24 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_26 = arg_85_1:GetWordFromCfg(104042021)
				local var_88_27 = arg_85_1:FormatText(var_88_26.content)

				arg_85_1.text_.text = var_88_27

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_28 = 42
				local var_88_29 = utf8.len(var_88_27)
				local var_88_30 = var_88_28 <= 0 and var_88_25 or var_88_25 * (var_88_29 / var_88_28)

				if var_88_30 > 0 and var_88_25 < var_88_30 then
					arg_85_1.talkMaxDuration = var_88_30

					if var_88_30 + var_88_24 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_30 + var_88_24
					end
				end

				arg_85_1.text_.text = var_88_27
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_31 = math.max(var_88_25, arg_85_1.talkMaxDuration)

			if var_88_24 <= arg_85_1.time_ and arg_85_1.time_ < var_88_24 + var_88_31 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_24) / var_88_31

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_24 + var_88_31 and arg_85_1.time_ < var_88_24 + var_88_31 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play104042022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 104042022
		arg_89_1.duration_ = 8.4

		local var_89_0 = {
			ja = 8.4,
			ko = 6.833,
			zh = 5.4,
			en = 6.3
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
				arg_89_0:Play104042023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1036ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1036ui_story == nil then
				arg_89_1.var_.characterEffect1036ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.1

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1036ui_story then
					arg_89_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1036ui_story then
				arg_89_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_92_4 = 0

			if var_92_4 < arg_89_1.time_ and arg_89_1.time_ <= var_92_4 + arg_92_0 then
				arg_89_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_92_5 = arg_89_1.actors_["1036ui_story"].transform
			local var_92_6 = 0

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.var_.moveOldPos1036ui_story = var_92_5.localPosition
			end

			local var_92_7 = 0.001

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_7 then
				local var_92_8 = (arg_89_1.time_ - var_92_6) / var_92_7
				local var_92_9 = Vector3.New(-0.7, -1.09, -5.78)

				var_92_5.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1036ui_story, var_92_9, var_92_8)

				local var_92_10 = manager.ui.mainCamera.transform.position - var_92_5.position

				var_92_5.forward = Vector3.New(var_92_10.x, var_92_10.y, var_92_10.z)

				local var_92_11 = var_92_5.localEulerAngles

				var_92_11.z = 0
				var_92_11.x = 0
				var_92_5.localEulerAngles = var_92_11
			end

			if arg_89_1.time_ >= var_92_6 + var_92_7 and arg_89_1.time_ < var_92_6 + var_92_7 + arg_92_0 then
				var_92_5.localPosition = Vector3.New(-0.7, -1.09, -5.78)

				local var_92_12 = manager.ui.mainCamera.transform.position - var_92_5.position

				var_92_5.forward = Vector3.New(var_92_12.x, var_92_12.y, var_92_12.z)

				local var_92_13 = var_92_5.localEulerAngles

				var_92_13.z = 0
				var_92_13.x = 0
				var_92_5.localEulerAngles = var_92_13
			end

			local var_92_14 = 0

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 then
				arg_89_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_92_15 = 0
			local var_92_16 = 0.825

			if var_92_15 < arg_89_1.time_ and arg_89_1.time_ <= var_92_15 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_17 = arg_89_1:FormatText(StoryNameCfg[5].name)

				arg_89_1.leftNameTxt_.text = var_92_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_18 = arg_89_1:GetWordFromCfg(104042022)
				local var_92_19 = arg_89_1:FormatText(var_92_18.content)

				arg_89_1.text_.text = var_92_19

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_20 = 32
				local var_92_21 = utf8.len(var_92_19)
				local var_92_22 = var_92_20 <= 0 and var_92_16 or var_92_16 * (var_92_21 / var_92_20)

				if var_92_22 > 0 and var_92_16 < var_92_22 then
					arg_89_1.talkMaxDuration = var_92_22

					if var_92_22 + var_92_15 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_22 + var_92_15
					end
				end

				arg_89_1.text_.text = var_92_19
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042022", "story_v_out_104042.awb") ~= 0 then
					local var_92_23 = manager.audio:GetVoiceLength("story_v_out_104042", "104042022", "story_v_out_104042.awb") / 1000

					if var_92_23 + var_92_15 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_23 + var_92_15
					end

					if var_92_18.prefab_name ~= "" and arg_89_1.actors_[var_92_18.prefab_name] ~= nil then
						local var_92_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_18.prefab_name].transform, "story_v_out_104042", "104042022", "story_v_out_104042.awb")

						arg_89_1:RecordAudio("104042022", var_92_24)
						arg_89_1:RecordAudio("104042022", var_92_24)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_104042", "104042022", "story_v_out_104042.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_104042", "104042022", "story_v_out_104042.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_25 = math.max(var_92_16, arg_89_1.talkMaxDuration)

			if var_92_15 <= arg_89_1.time_ and arg_89_1.time_ < var_92_15 + var_92_25 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_15) / var_92_25

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_15 + var_92_25 and arg_89_1.time_ < var_92_15 + var_92_25 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play104042023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 104042023
		arg_93_1.duration_ = 10.933

		local var_93_0 = {
			ja = 10.933,
			ko = 7.7,
			zh = 7.7,
			en = 6.3
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
				arg_93_0:Play104042024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["10001_tpose"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect10001_tpose == nil then
				arg_93_1.var_.characterEffect10001_tpose = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.1

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect10001_tpose then
					arg_93_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect10001_tpose then
				arg_93_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_96_4 = arg_93_1.actors_["1036ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect1036ui_story == nil then
				arg_93_1.var_.characterEffect1036ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect1036ui_story then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1036ui_story.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect1036ui_story then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1036ui_story.fillRatio = var_96_9
			end

			local var_96_10 = arg_93_1.actors_["10001_tpose"].transform
			local var_96_11 = 0

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1.var_.moveOldPos10001_tpose = var_96_10.localPosition
			end

			local var_96_12 = 0.001

			if var_96_11 <= arg_93_1.time_ and arg_93_1.time_ < var_96_11 + var_96_12 then
				local var_96_13 = (arg_93_1.time_ - var_96_11) / var_96_12
				local var_96_14 = Vector3.New(0.7, -1.23, -5.8)

				var_96_10.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10001_tpose, var_96_14, var_96_13)

				local var_96_15 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_15.x, var_96_15.y, var_96_15.z)

				local var_96_16 = var_96_10.localEulerAngles

				var_96_16.z = 0
				var_96_16.x = 0
				var_96_10.localEulerAngles = var_96_16
			end

			if arg_93_1.time_ >= var_96_11 + var_96_12 and arg_93_1.time_ < var_96_11 + var_96_12 + arg_96_0 then
				var_96_10.localPosition = Vector3.New(0.7, -1.23, -5.8)

				local var_96_17 = manager.ui.mainCamera.transform.position - var_96_10.position

				var_96_10.forward = Vector3.New(var_96_17.x, var_96_17.y, var_96_17.z)

				local var_96_18 = var_96_10.localEulerAngles

				var_96_18.z = 0
				var_96_18.x = 0
				var_96_10.localEulerAngles = var_96_18
			end

			local var_96_19 = 0

			if var_96_19 < arg_93_1.time_ and arg_93_1.time_ <= var_96_19 + arg_96_0 then
				arg_93_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action2_1")
			end

			local var_96_20 = 0

			if var_96_20 < arg_93_1.time_ and arg_93_1.time_ <= var_96_20 + arg_96_0 then
				arg_93_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_96_21 = 0
			local var_96_22 = 0.925

			if var_96_21 < arg_93_1.time_ and arg_93_1.time_ <= var_96_21 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_23 = arg_93_1:FormatText(StoryNameCfg[31].name)

				arg_93_1.leftNameTxt_.text = var_96_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_24 = arg_93_1:GetWordFromCfg(104042023)
				local var_96_25 = arg_93_1:FormatText(var_96_24.content)

				arg_93_1.text_.text = var_96_25

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_26 = 36
				local var_96_27 = utf8.len(var_96_25)
				local var_96_28 = var_96_26 <= 0 and var_96_22 or var_96_22 * (var_96_27 / var_96_26)

				if var_96_28 > 0 and var_96_22 < var_96_28 then
					arg_93_1.talkMaxDuration = var_96_28

					if var_96_28 + var_96_21 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_28 + var_96_21
					end
				end

				arg_93_1.text_.text = var_96_25
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042023", "story_v_out_104042.awb") ~= 0 then
					local var_96_29 = manager.audio:GetVoiceLength("story_v_out_104042", "104042023", "story_v_out_104042.awb") / 1000

					if var_96_29 + var_96_21 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_29 + var_96_21
					end

					if var_96_24.prefab_name ~= "" and arg_93_1.actors_[var_96_24.prefab_name] ~= nil then
						local var_96_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_24.prefab_name].transform, "story_v_out_104042", "104042023", "story_v_out_104042.awb")

						arg_93_1:RecordAudio("104042023", var_96_30)
						arg_93_1:RecordAudio("104042023", var_96_30)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_104042", "104042023", "story_v_out_104042.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_104042", "104042023", "story_v_out_104042.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_31 = math.max(var_96_22, arg_93_1.talkMaxDuration)

			if var_96_21 <= arg_93_1.time_ and arg_93_1.time_ < var_96_21 + var_96_31 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_21) / var_96_31

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_21 + var_96_31 and arg_93_1.time_ < var_96_21 + var_96_31 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play104042024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 104042024
		arg_97_1.duration_ = 3.2

		local var_97_0 = {
			ja = 3.2,
			ko = 2.566,
			zh = 2.433,
			en = 2
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
				arg_97_0:Play104042025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1019ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story == nil then
				arg_97_1.var_.characterEffect1019ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1019ui_story then
					arg_97_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story then
				arg_97_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_100_4 = arg_97_1.actors_["10001_tpose"]
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 and arg_97_1.var_.characterEffect10001_tpose == nil then
				arg_97_1.var_.characterEffect10001_tpose = var_100_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_6 = 0.1

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6

				if arg_97_1.var_.characterEffect10001_tpose then
					local var_100_8 = Mathf.Lerp(0, 0.5, var_100_7)

					arg_97_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_97_1.var_.characterEffect10001_tpose.fillRatio = var_100_8
				end
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect10001_tpose then
				local var_100_9 = 0.5

				arg_97_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_97_1.var_.characterEffect10001_tpose.fillRatio = var_100_9
			end

			local var_100_10 = arg_97_1.actors_["1036ui_story"].transform
			local var_100_11 = 0

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.var_.moveOldPos1036ui_story = var_100_10.localPosition
			end

			local var_100_12 = 0.001

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_12 then
				local var_100_13 = (arg_97_1.time_ - var_100_11) / var_100_12
				local var_100_14 = Vector3.New(0, 100, 0)

				var_100_10.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1036ui_story, var_100_14, var_100_13)

				local var_100_15 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_15.x, var_100_15.y, var_100_15.z)

				local var_100_16 = var_100_10.localEulerAngles

				var_100_16.z = 0
				var_100_16.x = 0
				var_100_10.localEulerAngles = var_100_16
			end

			if arg_97_1.time_ >= var_100_11 + var_100_12 and arg_97_1.time_ < var_100_11 + var_100_12 + arg_100_0 then
				var_100_10.localPosition = Vector3.New(0, 100, 0)

				local var_100_17 = manager.ui.mainCamera.transform.position - var_100_10.position

				var_100_10.forward = Vector3.New(var_100_17.x, var_100_17.y, var_100_17.z)

				local var_100_18 = var_100_10.localEulerAngles

				var_100_18.z = 0
				var_100_18.x = 0
				var_100_10.localEulerAngles = var_100_18
			end

			local var_100_19 = arg_97_1.actors_["1019ui_story"].transform
			local var_100_20 = 0

			if var_100_20 < arg_97_1.time_ and arg_97_1.time_ <= var_100_20 + arg_100_0 then
				arg_97_1.var_.moveOldPos1019ui_story = var_100_19.localPosition
			end

			local var_100_21 = 0.001

			if var_100_20 <= arg_97_1.time_ and arg_97_1.time_ < var_100_20 + var_100_21 then
				local var_100_22 = (arg_97_1.time_ - var_100_20) / var_100_21
				local var_100_23 = Vector3.New(-0.7, -1.08, -5.9)

				var_100_19.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1019ui_story, var_100_23, var_100_22)

				local var_100_24 = manager.ui.mainCamera.transform.position - var_100_19.position

				var_100_19.forward = Vector3.New(var_100_24.x, var_100_24.y, var_100_24.z)

				local var_100_25 = var_100_19.localEulerAngles

				var_100_25.z = 0
				var_100_25.x = 0
				var_100_19.localEulerAngles = var_100_25
			end

			if arg_97_1.time_ >= var_100_20 + var_100_21 and arg_97_1.time_ < var_100_20 + var_100_21 + arg_100_0 then
				var_100_19.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_100_26 = manager.ui.mainCamera.transform.position - var_100_19.position

				var_100_19.forward = Vector3.New(var_100_26.x, var_100_26.y, var_100_26.z)

				local var_100_27 = var_100_19.localEulerAngles

				var_100_27.z = 0
				var_100_27.x = 0
				var_100_19.localEulerAngles = var_100_27
			end

			local var_100_28 = 0

			if var_100_28 < arg_97_1.time_ and arg_97_1.time_ <= var_100_28 + arg_100_0 then
				arg_97_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_100_29 = 0

			if var_100_29 < arg_97_1.time_ and arg_97_1.time_ <= var_100_29 + arg_100_0 then
				arg_97_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_100_30 = 0
			local var_100_31 = 0.325

			if var_100_30 < arg_97_1.time_ and arg_97_1.time_ <= var_100_30 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_32 = arg_97_1:FormatText(StoryNameCfg[13].name)

				arg_97_1.leftNameTxt_.text = var_100_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_33 = arg_97_1:GetWordFromCfg(104042024)
				local var_100_34 = arg_97_1:FormatText(var_100_33.content)

				arg_97_1.text_.text = var_100_34

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_35 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042024", "story_v_out_104042.awb") ~= 0 then
					local var_100_38 = manager.audio:GetVoiceLength("story_v_out_104042", "104042024", "story_v_out_104042.awb") / 1000

					if var_100_38 + var_100_30 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_38 + var_100_30
					end

					if var_100_33.prefab_name ~= "" and arg_97_1.actors_[var_100_33.prefab_name] ~= nil then
						local var_100_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_33.prefab_name].transform, "story_v_out_104042", "104042024", "story_v_out_104042.awb")

						arg_97_1:RecordAudio("104042024", var_100_39)
						arg_97_1:RecordAudio("104042024", var_100_39)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_104042", "104042024", "story_v_out_104042.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_104042", "104042024", "story_v_out_104042.awb")
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
	Play104042025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 104042025
		arg_101_1.duration_ = 12.866

		local var_101_0 = {
			ja = 12.866,
			ko = 10.933,
			zh = 9.4,
			en = 10.1
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
				arg_101_0:Play104042026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10001_tpose"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect10001_tpose == nil then
				arg_101_1.var_.characterEffect10001_tpose = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect10001_tpose then
					arg_101_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect10001_tpose then
				arg_101_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_104_4 = arg_101_1.actors_["1019ui_story"]
			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 and arg_101_1.var_.characterEffect1019ui_story == nil then
				arg_101_1.var_.characterEffect1019ui_story = var_104_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_6 = 0.1

			if var_104_5 <= arg_101_1.time_ and arg_101_1.time_ < var_104_5 + var_104_6 then
				local var_104_7 = (arg_101_1.time_ - var_104_5) / var_104_6

				if arg_101_1.var_.characterEffect1019ui_story then
					local var_104_8 = Mathf.Lerp(0, 0.5, var_104_7)

					arg_101_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1019ui_story.fillRatio = var_104_8
				end
			end

			if arg_101_1.time_ >= var_104_5 + var_104_6 and arg_101_1.time_ < var_104_5 + var_104_6 + arg_104_0 and arg_101_1.var_.characterEffect1019ui_story then
				local var_104_9 = 0.5

				arg_101_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1019ui_story.fillRatio = var_104_9
			end

			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 then
				arg_101_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action425")
			end

			local var_104_11 = 0

			if var_104_11 < arg_101_1.time_ and arg_101_1.time_ <= var_104_11 + arg_104_0 then
				arg_101_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_104_12 = 0
			local var_104_13 = 1.2

			if var_104_12 < arg_101_1.time_ and arg_101_1.time_ <= var_104_12 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_14 = arg_101_1:FormatText(StoryNameCfg[31].name)

				arg_101_1.leftNameTxt_.text = var_104_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_15 = arg_101_1:GetWordFromCfg(104042025)
				local var_104_16 = arg_101_1:FormatText(var_104_15.content)

				arg_101_1.text_.text = var_104_16

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_17 = 48
				local var_104_18 = utf8.len(var_104_16)
				local var_104_19 = var_104_17 <= 0 and var_104_13 or var_104_13 * (var_104_18 / var_104_17)

				if var_104_19 > 0 and var_104_13 < var_104_19 then
					arg_101_1.talkMaxDuration = var_104_19

					if var_104_19 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_19 + var_104_12
					end
				end

				arg_101_1.text_.text = var_104_16
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042025", "story_v_out_104042.awb") ~= 0 then
					local var_104_20 = manager.audio:GetVoiceLength("story_v_out_104042", "104042025", "story_v_out_104042.awb") / 1000

					if var_104_20 + var_104_12 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_20 + var_104_12
					end

					if var_104_15.prefab_name ~= "" and arg_101_1.actors_[var_104_15.prefab_name] ~= nil then
						local var_104_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_15.prefab_name].transform, "story_v_out_104042", "104042025", "story_v_out_104042.awb")

						arg_101_1:RecordAudio("104042025", var_104_21)
						arg_101_1:RecordAudio("104042025", var_104_21)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_104042", "104042025", "story_v_out_104042.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_104042", "104042025", "story_v_out_104042.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_22 = math.max(var_104_13, arg_101_1.talkMaxDuration)

			if var_104_12 <= arg_101_1.time_ and arg_101_1.time_ < var_104_12 + var_104_22 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_12) / var_104_22

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_12 + var_104_22 and arg_101_1.time_ < var_104_12 + var_104_22 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play104042026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 104042026
		arg_105_1.duration_ = 4.533

		local var_105_0 = {
			ja = 4.533,
			ko = 4.066,
			zh = 3.8,
			en = 2.9
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
				arg_105_0:Play104042027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action453")
			end

			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_108_2 = 0
			local var_108_3 = 0.5

			if var_108_2 < arg_105_1.time_ and arg_105_1.time_ <= var_108_2 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_4 = arg_105_1:FormatText(StoryNameCfg[31].name)

				arg_105_1.leftNameTxt_.text = var_108_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_5 = arg_105_1:GetWordFromCfg(104042026)
				local var_108_6 = arg_105_1:FormatText(var_108_5.content)

				arg_105_1.text_.text = var_108_6

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_7 = 20
				local var_108_8 = utf8.len(var_108_6)
				local var_108_9 = var_108_7 <= 0 and var_108_3 or var_108_3 * (var_108_8 / var_108_7)

				if var_108_9 > 0 and var_108_3 < var_108_9 then
					arg_105_1.talkMaxDuration = var_108_9

					if var_108_9 + var_108_2 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_9 + var_108_2
					end
				end

				arg_105_1.text_.text = var_108_6
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042026", "story_v_out_104042.awb") ~= 0 then
					local var_108_10 = manager.audio:GetVoiceLength("story_v_out_104042", "104042026", "story_v_out_104042.awb") / 1000

					if var_108_10 + var_108_2 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_10 + var_108_2
					end

					if var_108_5.prefab_name ~= "" and arg_105_1.actors_[var_108_5.prefab_name] ~= nil then
						local var_108_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_5.prefab_name].transform, "story_v_out_104042", "104042026", "story_v_out_104042.awb")

						arg_105_1:RecordAudio("104042026", var_108_11)
						arg_105_1:RecordAudio("104042026", var_108_11)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_104042", "104042026", "story_v_out_104042.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_104042", "104042026", "story_v_out_104042.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_12 = math.max(var_108_3, arg_105_1.talkMaxDuration)

			if var_108_2 <= arg_105_1.time_ and arg_105_1.time_ < var_108_2 + var_108_12 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_2) / var_108_12

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_2 + var_108_12 and arg_105_1.time_ < var_108_2 + var_108_12 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play104042027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 104042027
		arg_109_1.duration_ = 8.266

		local var_109_0 = {
			ja = 8.266,
			ko = 5.3,
			zh = 5.1,
			en = 6.766
		}
		local var_109_1 = manager.audio:GetLocalizationFlag()

		if var_109_0[var_109_1] ~= nil then
			arg_109_1.duration_ = var_109_0[var_109_1]
		end

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play104042028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1019ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1019ui_story == nil then
				arg_109_1.var_.characterEffect1019ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.1

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1019ui_story then
					arg_109_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1019ui_story then
				arg_109_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_112_4 = arg_109_1.actors_["10001_tpose"]
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 and arg_109_1.var_.characterEffect10001_tpose == nil then
				arg_109_1.var_.characterEffect10001_tpose = var_112_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_6 = 0.1

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6

				if arg_109_1.var_.characterEffect10001_tpose then
					local var_112_8 = Mathf.Lerp(0, 0.5, var_112_7)

					arg_109_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_109_1.var_.characterEffect10001_tpose.fillRatio = var_112_8
				end
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 and arg_109_1.var_.characterEffect10001_tpose then
				local var_112_9 = 0.5

				arg_109_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_109_1.var_.characterEffect10001_tpose.fillRatio = var_112_9
			end

			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 then
				arg_109_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_112_11 = 0

			if var_112_11 < arg_109_1.time_ and arg_109_1.time_ <= var_112_11 + arg_112_0 then
				arg_109_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_112_12 = 0
			local var_112_13 = 0.675

			if var_112_12 < arg_109_1.time_ and arg_109_1.time_ <= var_112_12 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_14 = arg_109_1:FormatText(StoryNameCfg[13].name)

				arg_109_1.leftNameTxt_.text = var_112_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_15 = arg_109_1:GetWordFromCfg(104042027)
				local var_112_16 = arg_109_1:FormatText(var_112_15.content)

				arg_109_1.text_.text = var_112_16

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_17 = 27
				local var_112_18 = utf8.len(var_112_16)
				local var_112_19 = var_112_17 <= 0 and var_112_13 or var_112_13 * (var_112_18 / var_112_17)

				if var_112_19 > 0 and var_112_13 < var_112_19 then
					arg_109_1.talkMaxDuration = var_112_19

					if var_112_19 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_19 + var_112_12
					end
				end

				arg_109_1.text_.text = var_112_16
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042027", "story_v_out_104042.awb") ~= 0 then
					local var_112_20 = manager.audio:GetVoiceLength("story_v_out_104042", "104042027", "story_v_out_104042.awb") / 1000

					if var_112_20 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_20 + var_112_12
					end

					if var_112_15.prefab_name ~= "" and arg_109_1.actors_[var_112_15.prefab_name] ~= nil then
						local var_112_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_15.prefab_name].transform, "story_v_out_104042", "104042027", "story_v_out_104042.awb")

						arg_109_1:RecordAudio("104042027", var_112_21)
						arg_109_1:RecordAudio("104042027", var_112_21)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_104042", "104042027", "story_v_out_104042.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_104042", "104042027", "story_v_out_104042.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_22 = math.max(var_112_13, arg_109_1.talkMaxDuration)

			if var_112_12 <= arg_109_1.time_ and arg_109_1.time_ < var_112_12 + var_112_22 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_12) / var_112_22

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_12 + var_112_22 and arg_109_1.time_ < var_112_12 + var_112_22 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play104042028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 104042028
		arg_113_1.duration_ = 1.999999999999

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play104042029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10001_tpose"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect10001_tpose == nil then
				arg_113_1.var_.characterEffect10001_tpose = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.1

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect10001_tpose then
					arg_113_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect10001_tpose then
				arg_113_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_116_4 = arg_113_1.actors_["1019ui_story"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect1019ui_story == nil then
				arg_113_1.var_.characterEffect1019ui_story = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.1

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect1019ui_story then
					local var_116_8 = Mathf.Lerp(0, 0.5, var_116_7)

					arg_113_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1019ui_story.fillRatio = var_116_8
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect1019ui_story then
				local var_116_9 = 0.5

				arg_113_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1019ui_story.fillRatio = var_116_9
			end

			local var_116_10 = 0

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 then
				arg_113_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action435")
			end

			local var_116_11 = 0

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 then
				arg_113_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_116_12 = 0
			local var_116_13 = 0.15

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[31].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(104042028)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 6
				local var_116_18 = utf8.len(var_116_16)
				local var_116_19 = var_116_17 <= 0 and var_116_13 or var_116_13 * (var_116_18 / var_116_17)

				if var_116_19 > 0 and var_116_13 < var_116_19 then
					arg_113_1.talkMaxDuration = var_116_19

					if var_116_19 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_19 + var_116_12
					end
				end

				arg_113_1.text_.text = var_116_16
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042028", "story_v_out_104042.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_104042", "104042028", "story_v_out_104042.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_104042", "104042028", "story_v_out_104042.awb")

						arg_113_1:RecordAudio("104042028", var_116_21)
						arg_113_1:RecordAudio("104042028", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_104042", "104042028", "story_v_out_104042.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_104042", "104042028", "story_v_out_104042.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_22 = math.max(var_116_13, arg_113_1.talkMaxDuration)

			if var_116_12 <= arg_113_1.time_ and arg_113_1.time_ < var_116_12 + var_116_22 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_12) / var_116_22

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_12 + var_116_22 and arg_113_1.time_ < var_116_12 + var_116_22 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play104042029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 104042029
		arg_117_1.duration_ = 5.533

		local var_117_0 = {
			ja = 5.533,
			ko = 3.933,
			zh = 3.366,
			en = 2.3
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
				arg_117_0:Play104042030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1019ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story == nil then
				arg_117_1.var_.characterEffect1019ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.1

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1019ui_story then
					arg_117_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1019ui_story then
				arg_117_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["10001_tpose"]
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 and arg_117_1.var_.characterEffect10001_tpose == nil then
				arg_117_1.var_.characterEffect10001_tpose = var_120_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_6 = 0.1

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6

				if arg_117_1.var_.characterEffect10001_tpose then
					local var_120_8 = Mathf.Lerp(0, 0.5, var_120_7)

					arg_117_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_117_1.var_.characterEffect10001_tpose.fillRatio = var_120_8
				end
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 and arg_117_1.var_.characterEffect10001_tpose then
				local var_120_9 = 0.5

				arg_117_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_117_1.var_.characterEffect10001_tpose.fillRatio = var_120_9
			end

			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_11 = 0
			local var_120_12 = 0.4

			if var_120_11 < arg_117_1.time_ and arg_117_1.time_ <= var_120_11 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_13 = arg_117_1:FormatText(StoryNameCfg[13].name)

				arg_117_1.leftNameTxt_.text = var_120_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_14 = arg_117_1:GetWordFromCfg(104042029)
				local var_120_15 = arg_117_1:FormatText(var_120_14.content)

				arg_117_1.text_.text = var_120_15

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_16 = 16
				local var_120_17 = utf8.len(var_120_15)
				local var_120_18 = var_120_16 <= 0 and var_120_12 or var_120_12 * (var_120_17 / var_120_16)

				if var_120_18 > 0 and var_120_12 < var_120_18 then
					arg_117_1.talkMaxDuration = var_120_18

					if var_120_18 + var_120_11 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_18 + var_120_11
					end
				end

				arg_117_1.text_.text = var_120_15
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042029", "story_v_out_104042.awb") ~= 0 then
					local var_120_19 = manager.audio:GetVoiceLength("story_v_out_104042", "104042029", "story_v_out_104042.awb") / 1000

					if var_120_19 + var_120_11 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_19 + var_120_11
					end

					if var_120_14.prefab_name ~= "" and arg_117_1.actors_[var_120_14.prefab_name] ~= nil then
						local var_120_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_14.prefab_name].transform, "story_v_out_104042", "104042029", "story_v_out_104042.awb")

						arg_117_1:RecordAudio("104042029", var_120_20)
						arg_117_1:RecordAudio("104042029", var_120_20)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_104042", "104042029", "story_v_out_104042.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_104042", "104042029", "story_v_out_104042.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_21 = math.max(var_120_12, arg_117_1.talkMaxDuration)

			if var_120_11 <= arg_117_1.time_ and arg_117_1.time_ < var_120_11 + var_120_21 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_11) / var_120_21

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_11 + var_120_21 and arg_117_1.time_ < var_120_11 + var_120_21 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play104042030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 104042030
		arg_121_1.duration_ = 5.8

		local var_121_0 = {
			ja = 5.266,
			ko = 5.8,
			zh = 5.3,
			en = 3.5
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
				arg_121_0:Play104042031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10001_tpose"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect10001_tpose == nil then
				arg_121_1.var_.characterEffect10001_tpose = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.1

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect10001_tpose then
					arg_121_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect10001_tpose then
				arg_121_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_124_4 = arg_121_1.actors_["1019ui_story"]
			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 and arg_121_1.var_.characterEffect1019ui_story == nil then
				arg_121_1.var_.characterEffect1019ui_story = var_124_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_6 = 0.1

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6

				if arg_121_1.var_.characterEffect1019ui_story then
					local var_124_8 = Mathf.Lerp(0, 0.5, var_124_7)

					arg_121_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1019ui_story.fillRatio = var_124_8
				end
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect1019ui_story then
				local var_124_9 = 0.5

				arg_121_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1019ui_story.fillRatio = var_124_9
			end

			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 then
				arg_121_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action453")
			end

			local var_124_11 = 0

			if var_124_11 < arg_121_1.time_ and arg_121_1.time_ <= var_124_11 + arg_124_0 then
				arg_121_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_124_12 = 0
			local var_124_13 = 0.45

			if var_124_12 < arg_121_1.time_ and arg_121_1.time_ <= var_124_12 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_14 = arg_121_1:FormatText(StoryNameCfg[31].name)

				arg_121_1.leftNameTxt_.text = var_124_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_15 = arg_121_1:GetWordFromCfg(104042030)
				local var_124_16 = arg_121_1:FormatText(var_124_15.content)

				arg_121_1.text_.text = var_124_16

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_17 = 18
				local var_124_18 = utf8.len(var_124_16)
				local var_124_19 = var_124_17 <= 0 and var_124_13 or var_124_13 * (var_124_18 / var_124_17)

				if var_124_19 > 0 and var_124_13 < var_124_19 then
					arg_121_1.talkMaxDuration = var_124_19

					if var_124_19 + var_124_12 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_19 + var_124_12
					end
				end

				arg_121_1.text_.text = var_124_16
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042030", "story_v_out_104042.awb") ~= 0 then
					local var_124_20 = manager.audio:GetVoiceLength("story_v_out_104042", "104042030", "story_v_out_104042.awb") / 1000

					if var_124_20 + var_124_12 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_20 + var_124_12
					end

					if var_124_15.prefab_name ~= "" and arg_121_1.actors_[var_124_15.prefab_name] ~= nil then
						local var_124_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_15.prefab_name].transform, "story_v_out_104042", "104042030", "story_v_out_104042.awb")

						arg_121_1:RecordAudio("104042030", var_124_21)
						arg_121_1:RecordAudio("104042030", var_124_21)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_104042", "104042030", "story_v_out_104042.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_104042", "104042030", "story_v_out_104042.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_22 = math.max(var_124_13, arg_121_1.talkMaxDuration)

			if var_124_12 <= arg_121_1.time_ and arg_121_1.time_ < var_124_12 + var_124_22 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_12) / var_124_22

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_12 + var_124_22 and arg_121_1.time_ < var_124_12 + var_124_22 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play104042031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 104042031
		arg_125_1.duration_ = 6.2

		local var_125_0 = {
			ja = 6.2,
			ko = 4.2,
			zh = 2.833,
			en = 3.566
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
				arg_125_0:Play104042032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1036ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1036ui_story == nil then
				arg_125_1.var_.characterEffect1036ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.1

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1036ui_story then
					arg_125_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1036ui_story then
				arg_125_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["10001_tpose"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect10001_tpose == nil then
				arg_125_1.var_.characterEffect10001_tpose = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.1

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect10001_tpose then
					local var_128_8 = Mathf.Lerp(0, 0.5, var_128_7)

					arg_125_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_125_1.var_.characterEffect10001_tpose.fillRatio = var_128_8
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect10001_tpose then
				local var_128_9 = 0.5

				arg_125_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_125_1.var_.characterEffect10001_tpose.fillRatio = var_128_9
			end

			local var_128_10 = arg_125_1.actors_["10001_tpose"].transform
			local var_128_11 = 0

			if var_128_11 < arg_125_1.time_ and arg_125_1.time_ <= var_128_11 + arg_128_0 then
				arg_125_1.var_.moveOldPos10001_tpose = var_128_10.localPosition
			end

			local var_128_12 = 0.001

			if var_128_11 <= arg_125_1.time_ and arg_125_1.time_ < var_128_11 + var_128_12 then
				local var_128_13 = (arg_125_1.time_ - var_128_11) / var_128_12
				local var_128_14 = Vector3.New(0, 100, 0)

				var_128_10.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10001_tpose, var_128_14, var_128_13)

				local var_128_15 = manager.ui.mainCamera.transform.position - var_128_10.position

				var_128_10.forward = Vector3.New(var_128_15.x, var_128_15.y, var_128_15.z)

				local var_128_16 = var_128_10.localEulerAngles

				var_128_16.z = 0
				var_128_16.x = 0
				var_128_10.localEulerAngles = var_128_16
			end

			if arg_125_1.time_ >= var_128_11 + var_128_12 and arg_125_1.time_ < var_128_11 + var_128_12 + arg_128_0 then
				var_128_10.localPosition = Vector3.New(0, 100, 0)

				local var_128_17 = manager.ui.mainCamera.transform.position - var_128_10.position

				var_128_10.forward = Vector3.New(var_128_17.x, var_128_17.y, var_128_17.z)

				local var_128_18 = var_128_10.localEulerAngles

				var_128_18.z = 0
				var_128_18.x = 0
				var_128_10.localEulerAngles = var_128_18
			end

			local var_128_19 = 0

			if var_128_19 < arg_125_1.time_ and arg_125_1.time_ <= var_128_19 + arg_128_0 then
				arg_125_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_128_20 = arg_125_1.actors_["1036ui_story"].transform
			local var_128_21 = 0

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 then
				arg_125_1.var_.moveOldPos1036ui_story = var_128_20.localPosition
			end

			local var_128_22 = 0.001

			if var_128_21 <= arg_125_1.time_ and arg_125_1.time_ < var_128_21 + var_128_22 then
				local var_128_23 = (arg_125_1.time_ - var_128_21) / var_128_22
				local var_128_24 = Vector3.New(0.7, -1.09, -5.78)

				var_128_20.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1036ui_story, var_128_24, var_128_23)

				local var_128_25 = manager.ui.mainCamera.transform.position - var_128_20.position

				var_128_20.forward = Vector3.New(var_128_25.x, var_128_25.y, var_128_25.z)

				local var_128_26 = var_128_20.localEulerAngles

				var_128_26.z = 0
				var_128_26.x = 0
				var_128_20.localEulerAngles = var_128_26
			end

			if arg_125_1.time_ >= var_128_21 + var_128_22 and arg_125_1.time_ < var_128_21 + var_128_22 + arg_128_0 then
				var_128_20.localPosition = Vector3.New(0.7, -1.09, -5.78)

				local var_128_27 = manager.ui.mainCamera.transform.position - var_128_20.position

				var_128_20.forward = Vector3.New(var_128_27.x, var_128_27.y, var_128_27.z)

				local var_128_28 = var_128_20.localEulerAngles

				var_128_28.z = 0
				var_128_28.x = 0
				var_128_20.localEulerAngles = var_128_28
			end

			local var_128_29 = 0

			if var_128_29 < arg_125_1.time_ and arg_125_1.time_ <= var_128_29 + arg_128_0 then
				arg_125_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_128_30 = 0
			local var_128_31 = 0.35

			if var_128_30 < arg_125_1.time_ and arg_125_1.time_ <= var_128_30 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_32 = arg_125_1:FormatText(StoryNameCfg[5].name)

				arg_125_1.leftNameTxt_.text = var_128_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_33 = arg_125_1:GetWordFromCfg(104042031)
				local var_128_34 = arg_125_1:FormatText(var_128_33.content)

				arg_125_1.text_.text = var_128_34

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_35 = 14
				local var_128_36 = utf8.len(var_128_34)
				local var_128_37 = var_128_35 <= 0 and var_128_31 or var_128_31 * (var_128_36 / var_128_35)

				if var_128_37 > 0 and var_128_31 < var_128_37 then
					arg_125_1.talkMaxDuration = var_128_37

					if var_128_37 + var_128_30 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_37 + var_128_30
					end
				end

				arg_125_1.text_.text = var_128_34
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042031", "story_v_out_104042.awb") ~= 0 then
					local var_128_38 = manager.audio:GetVoiceLength("story_v_out_104042", "104042031", "story_v_out_104042.awb") / 1000

					if var_128_38 + var_128_30 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_38 + var_128_30
					end

					if var_128_33.prefab_name ~= "" and arg_125_1.actors_[var_128_33.prefab_name] ~= nil then
						local var_128_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_33.prefab_name].transform, "story_v_out_104042", "104042031", "story_v_out_104042.awb")

						arg_125_1:RecordAudio("104042031", var_128_39)
						arg_125_1:RecordAudio("104042031", var_128_39)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_104042", "104042031", "story_v_out_104042.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_104042", "104042031", "story_v_out_104042.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_40 = math.max(var_128_31, arg_125_1.talkMaxDuration)

			if var_128_30 <= arg_125_1.time_ and arg_125_1.time_ < var_128_30 + var_128_40 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_30) / var_128_40

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_30 + var_128_40 and arg_125_1.time_ < var_128_30 + var_128_40 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play104042032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 104042032
		arg_129_1.duration_ = 11.766

		local var_129_0 = {
			ja = 11.766,
			ko = 8.566,
			zh = 9.133,
			en = 9.133
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
				arg_129_0:Play104042033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1019ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1019ui_story == nil then
				arg_129_1.var_.characterEffect1019ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.1

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1019ui_story then
					arg_129_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1019ui_story then
				arg_129_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_132_4 = arg_129_1.actors_["1036ui_story"]
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 and arg_129_1.var_.characterEffect1036ui_story == nil then
				arg_129_1.var_.characterEffect1036ui_story = var_132_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_6 = 0.1

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6

				if arg_129_1.var_.characterEffect1036ui_story then
					local var_132_8 = Mathf.Lerp(0, 0.5, var_132_7)

					arg_129_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1036ui_story.fillRatio = var_132_8
				end
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 and arg_129_1.var_.characterEffect1036ui_story then
				local var_132_9 = 0.5

				arg_129_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1036ui_story.fillRatio = var_132_9
			end

			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_132_11 = 0
			local var_132_12 = 1.075

			if var_132_11 < arg_129_1.time_ and arg_129_1.time_ <= var_132_11 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_13 = arg_129_1:FormatText(StoryNameCfg[13].name)

				arg_129_1.leftNameTxt_.text = var_132_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_14 = arg_129_1:GetWordFromCfg(104042032)
				local var_132_15 = arg_129_1:FormatText(var_132_14.content)

				arg_129_1.text_.text = var_132_15

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_16 = 43
				local var_132_17 = utf8.len(var_132_15)
				local var_132_18 = var_132_16 <= 0 and var_132_12 or var_132_12 * (var_132_17 / var_132_16)

				if var_132_18 > 0 and var_132_12 < var_132_18 then
					arg_129_1.talkMaxDuration = var_132_18

					if var_132_18 + var_132_11 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_18 + var_132_11
					end
				end

				arg_129_1.text_.text = var_132_15
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042032", "story_v_out_104042.awb") ~= 0 then
					local var_132_19 = manager.audio:GetVoiceLength("story_v_out_104042", "104042032", "story_v_out_104042.awb") / 1000

					if var_132_19 + var_132_11 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_19 + var_132_11
					end

					if var_132_14.prefab_name ~= "" and arg_129_1.actors_[var_132_14.prefab_name] ~= nil then
						local var_132_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_14.prefab_name].transform, "story_v_out_104042", "104042032", "story_v_out_104042.awb")

						arg_129_1:RecordAudio("104042032", var_132_20)
						arg_129_1:RecordAudio("104042032", var_132_20)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_104042", "104042032", "story_v_out_104042.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_104042", "104042032", "story_v_out_104042.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_21 = math.max(var_132_12, arg_129_1.talkMaxDuration)

			if var_132_11 <= arg_129_1.time_ and arg_129_1.time_ < var_132_11 + var_132_21 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_11) / var_132_21

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_11 + var_132_21 and arg_129_1.time_ < var_132_11 + var_132_21 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play104042033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 104042033
		arg_133_1.duration_ = 4.266

		local var_133_0 = {
			ja = 4.266,
			ko = 2.6,
			zh = 4.266,
			en = 2.933
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
				arg_133_0:Play104042034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_136_1 = 0
			local var_136_2 = 0.55

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_3 = arg_133_1:FormatText(StoryNameCfg[13].name)

				arg_133_1.leftNameTxt_.text = var_136_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_4 = arg_133_1:GetWordFromCfg(104042033)
				local var_136_5 = arg_133_1:FormatText(var_136_4.content)

				arg_133_1.text_.text = var_136_5

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_6 = 22
				local var_136_7 = utf8.len(var_136_5)
				local var_136_8 = var_136_6 <= 0 and var_136_2 or var_136_2 * (var_136_7 / var_136_6)

				if var_136_8 > 0 and var_136_2 < var_136_8 then
					arg_133_1.talkMaxDuration = var_136_8

					if var_136_8 + var_136_1 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_1
					end
				end

				arg_133_1.text_.text = var_136_5
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042033", "story_v_out_104042.awb") ~= 0 then
					local var_136_9 = manager.audio:GetVoiceLength("story_v_out_104042", "104042033", "story_v_out_104042.awb") / 1000

					if var_136_9 + var_136_1 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_9 + var_136_1
					end

					if var_136_4.prefab_name ~= "" and arg_133_1.actors_[var_136_4.prefab_name] ~= nil then
						local var_136_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_4.prefab_name].transform, "story_v_out_104042", "104042033", "story_v_out_104042.awb")

						arg_133_1:RecordAudio("104042033", var_136_10)
						arg_133_1:RecordAudio("104042033", var_136_10)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_104042", "104042033", "story_v_out_104042.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_104042", "104042033", "story_v_out_104042.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_11 = math.max(var_136_2, arg_133_1.talkMaxDuration)

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_11 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_1) / var_136_11

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_1 + var_136_11 and arg_133_1.time_ < var_136_1 + var_136_11 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play104042034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 104042034
		arg_137_1.duration_ = 8.133

		local var_137_0 = {
			ja = 8.1,
			ko = 7.333,
			zh = 7.8,
			en = 8.133
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
				arg_137_0:Play104042035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10001_tpose"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect10001_tpose == nil then
				arg_137_1.var_.characterEffect10001_tpose = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.1

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect10001_tpose then
					arg_137_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect10001_tpose then
				arg_137_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_140_4 = arg_137_1.actors_["1019ui_story"]
			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 and arg_137_1.var_.characterEffect1019ui_story == nil then
				arg_137_1.var_.characterEffect1019ui_story = var_140_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_6 = 0.1

			if var_140_5 <= arg_137_1.time_ and arg_137_1.time_ < var_140_5 + var_140_6 then
				local var_140_7 = (arg_137_1.time_ - var_140_5) / var_140_6

				if arg_137_1.var_.characterEffect1019ui_story then
					local var_140_8 = Mathf.Lerp(0, 0.5, var_140_7)

					arg_137_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1019ui_story.fillRatio = var_140_8
				end
			end

			if arg_137_1.time_ >= var_140_5 + var_140_6 and arg_137_1.time_ < var_140_5 + var_140_6 + arg_140_0 and arg_137_1.var_.characterEffect1019ui_story then
				local var_140_9 = 0.5

				arg_137_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1019ui_story.fillRatio = var_140_9
			end

			local var_140_10 = arg_137_1.actors_["1019ui_story"].transform
			local var_140_11 = 0

			if var_140_11 < arg_137_1.time_ and arg_137_1.time_ <= var_140_11 + arg_140_0 then
				arg_137_1.var_.moveOldPos1019ui_story = var_140_10.localPosition
			end

			local var_140_12 = 0.001

			if var_140_11 <= arg_137_1.time_ and arg_137_1.time_ < var_140_11 + var_140_12 then
				local var_140_13 = (arg_137_1.time_ - var_140_11) / var_140_12
				local var_140_14 = Vector3.New(0, 100, 0)

				var_140_10.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1019ui_story, var_140_14, var_140_13)

				local var_140_15 = manager.ui.mainCamera.transform.position - var_140_10.position

				var_140_10.forward = Vector3.New(var_140_15.x, var_140_15.y, var_140_15.z)

				local var_140_16 = var_140_10.localEulerAngles

				var_140_16.z = 0
				var_140_16.x = 0
				var_140_10.localEulerAngles = var_140_16
			end

			if arg_137_1.time_ >= var_140_11 + var_140_12 and arg_137_1.time_ < var_140_11 + var_140_12 + arg_140_0 then
				var_140_10.localPosition = Vector3.New(0, 100, 0)

				local var_140_17 = manager.ui.mainCamera.transform.position - var_140_10.position

				var_140_10.forward = Vector3.New(var_140_17.x, var_140_17.y, var_140_17.z)

				local var_140_18 = var_140_10.localEulerAngles

				var_140_18.z = 0
				var_140_18.x = 0
				var_140_10.localEulerAngles = var_140_18
			end

			local var_140_19 = arg_137_1.actors_["1036ui_story"].transform
			local var_140_20 = 0

			if var_140_20 < arg_137_1.time_ and arg_137_1.time_ <= var_140_20 + arg_140_0 then
				arg_137_1.var_.moveOldPos1036ui_story = var_140_19.localPosition
			end

			local var_140_21 = 0.001

			if var_140_20 <= arg_137_1.time_ and arg_137_1.time_ < var_140_20 + var_140_21 then
				local var_140_22 = (arg_137_1.time_ - var_140_20) / var_140_21
				local var_140_23 = Vector3.New(0, 100, 0)

				var_140_19.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1036ui_story, var_140_23, var_140_22)

				local var_140_24 = manager.ui.mainCamera.transform.position - var_140_19.position

				var_140_19.forward = Vector3.New(var_140_24.x, var_140_24.y, var_140_24.z)

				local var_140_25 = var_140_19.localEulerAngles

				var_140_25.z = 0
				var_140_25.x = 0
				var_140_19.localEulerAngles = var_140_25
			end

			if arg_137_1.time_ >= var_140_20 + var_140_21 and arg_137_1.time_ < var_140_20 + var_140_21 + arg_140_0 then
				var_140_19.localPosition = Vector3.New(0, 100, 0)

				local var_140_26 = manager.ui.mainCamera.transform.position - var_140_19.position

				var_140_19.forward = Vector3.New(var_140_26.x, var_140_26.y, var_140_26.z)

				local var_140_27 = var_140_19.localEulerAngles

				var_140_27.z = 0
				var_140_27.x = 0
				var_140_19.localEulerAngles = var_140_27
			end

			local var_140_28 = arg_137_1.actors_["10001_tpose"].transform
			local var_140_29 = 0

			if var_140_29 < arg_137_1.time_ and arg_137_1.time_ <= var_140_29 + arg_140_0 then
				arg_137_1.var_.moveOldPos10001_tpose = var_140_28.localPosition
			end

			local var_140_30 = 0.001

			if var_140_29 <= arg_137_1.time_ and arg_137_1.time_ < var_140_29 + var_140_30 then
				local var_140_31 = (arg_137_1.time_ - var_140_29) / var_140_30
				local var_140_32 = Vector3.New(0, -1.23, -5.8)

				var_140_28.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10001_tpose, var_140_32, var_140_31)

				local var_140_33 = manager.ui.mainCamera.transform.position - var_140_28.position

				var_140_28.forward = Vector3.New(var_140_33.x, var_140_33.y, var_140_33.z)

				local var_140_34 = var_140_28.localEulerAngles

				var_140_34.z = 0
				var_140_34.x = 0
				var_140_28.localEulerAngles = var_140_34
			end

			if arg_137_1.time_ >= var_140_29 + var_140_30 and arg_137_1.time_ < var_140_29 + var_140_30 + arg_140_0 then
				var_140_28.localPosition = Vector3.New(0, -1.23, -5.8)

				local var_140_35 = manager.ui.mainCamera.transform.position - var_140_28.position

				var_140_28.forward = Vector3.New(var_140_35.x, var_140_35.y, var_140_35.z)

				local var_140_36 = var_140_28.localEulerAngles

				var_140_36.z = 0
				var_140_36.x = 0
				var_140_28.localEulerAngles = var_140_36
			end

			local var_140_37 = 0

			if var_140_37 < arg_137_1.time_ and arg_137_1.time_ <= var_140_37 + arg_140_0 then
				arg_137_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_1")
			end

			local var_140_38 = 0

			if var_140_38 < arg_137_1.time_ and arg_137_1.time_ <= var_140_38 + arg_140_0 then
				arg_137_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_39 = 0
			local var_140_40 = 0.925

			if var_140_39 < arg_137_1.time_ and arg_137_1.time_ <= var_140_39 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_41 = arg_137_1:FormatText(StoryNameCfg[31].name)

				arg_137_1.leftNameTxt_.text = var_140_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_42 = arg_137_1:GetWordFromCfg(104042034)
				local var_140_43 = arg_137_1:FormatText(var_140_42.content)

				arg_137_1.text_.text = var_140_43

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_44 = 37
				local var_140_45 = utf8.len(var_140_43)
				local var_140_46 = var_140_44 <= 0 and var_140_40 or var_140_40 * (var_140_45 / var_140_44)

				if var_140_46 > 0 and var_140_40 < var_140_46 then
					arg_137_1.talkMaxDuration = var_140_46

					if var_140_46 + var_140_39 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_46 + var_140_39
					end
				end

				arg_137_1.text_.text = var_140_43
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042034", "story_v_out_104042.awb") ~= 0 then
					local var_140_47 = manager.audio:GetVoiceLength("story_v_out_104042", "104042034", "story_v_out_104042.awb") / 1000

					if var_140_47 + var_140_39 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_47 + var_140_39
					end

					if var_140_42.prefab_name ~= "" and arg_137_1.actors_[var_140_42.prefab_name] ~= nil then
						local var_140_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_42.prefab_name].transform, "story_v_out_104042", "104042034", "story_v_out_104042.awb")

						arg_137_1:RecordAudio("104042034", var_140_48)
						arg_137_1:RecordAudio("104042034", var_140_48)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_104042", "104042034", "story_v_out_104042.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_104042", "104042034", "story_v_out_104042.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_49 = math.max(var_140_40, arg_137_1.talkMaxDuration)

			if var_140_39 <= arg_137_1.time_ and arg_137_1.time_ < var_140_39 + var_140_49 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_39) / var_140_49

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_39 + var_140_49 and arg_137_1.time_ < var_140_39 + var_140_49 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play104042035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 104042035
		arg_141_1.duration_ = 2.633

		local var_141_0 = {
			ja = 2.633,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_141_1 = manager.audio:GetLocalizationFlag()

		if var_141_0[var_141_1] ~= nil then
			arg_141_1.duration_ = var_141_0[var_141_1]
		end

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play104042036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1019ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1019ui_story == nil then
				arg_141_1.var_.characterEffect1019ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.1

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1019ui_story then
					arg_141_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1019ui_story then
				arg_141_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_144_4 = arg_141_1.actors_["10001_tpose"]
			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 and arg_141_1.var_.characterEffect10001_tpose == nil then
				arg_141_1.var_.characterEffect10001_tpose = var_144_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_6 = 0.1

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_6 then
				local var_144_7 = (arg_141_1.time_ - var_144_5) / var_144_6

				if arg_141_1.var_.characterEffect10001_tpose then
					local var_144_8 = Mathf.Lerp(0, 0.5, var_144_7)

					arg_141_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_141_1.var_.characterEffect10001_tpose.fillRatio = var_144_8
				end
			end

			if arg_141_1.time_ >= var_144_5 + var_144_6 and arg_141_1.time_ < var_144_5 + var_144_6 + arg_144_0 and arg_141_1.var_.characterEffect10001_tpose then
				local var_144_9 = 0.5

				arg_141_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_141_1.var_.characterEffect10001_tpose.fillRatio = var_144_9
			end

			local var_144_10 = arg_141_1.actors_["10001_tpose"].transform
			local var_144_11 = 0

			if var_144_11 < arg_141_1.time_ and arg_141_1.time_ <= var_144_11 + arg_144_0 then
				arg_141_1.var_.moveOldPos10001_tpose = var_144_10.localPosition
			end

			local var_144_12 = 0.001

			if var_144_11 <= arg_141_1.time_ and arg_141_1.time_ < var_144_11 + var_144_12 then
				local var_144_13 = (arg_141_1.time_ - var_144_11) / var_144_12
				local var_144_14 = Vector3.New(0, 100, 0)

				var_144_10.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10001_tpose, var_144_14, var_144_13)

				local var_144_15 = manager.ui.mainCamera.transform.position - var_144_10.position

				var_144_10.forward = Vector3.New(var_144_15.x, var_144_15.y, var_144_15.z)

				local var_144_16 = var_144_10.localEulerAngles

				var_144_16.z = 0
				var_144_16.x = 0
				var_144_10.localEulerAngles = var_144_16
			end

			if arg_141_1.time_ >= var_144_11 + var_144_12 and arg_141_1.time_ < var_144_11 + var_144_12 + arg_144_0 then
				var_144_10.localPosition = Vector3.New(0, 100, 0)

				local var_144_17 = manager.ui.mainCamera.transform.position - var_144_10.position

				var_144_10.forward = Vector3.New(var_144_17.x, var_144_17.y, var_144_17.z)

				local var_144_18 = var_144_10.localEulerAngles

				var_144_18.z = 0
				var_144_18.x = 0
				var_144_10.localEulerAngles = var_144_18
			end

			local var_144_19 = arg_141_1.actors_["1019ui_story"].transform
			local var_144_20 = 0

			if var_144_20 < arg_141_1.time_ and arg_141_1.time_ <= var_144_20 + arg_144_0 then
				arg_141_1.var_.moveOldPos1019ui_story = var_144_19.localPosition
			end

			local var_144_21 = 0.001

			if var_144_20 <= arg_141_1.time_ and arg_141_1.time_ < var_144_20 + var_144_21 then
				local var_144_22 = (arg_141_1.time_ - var_144_20) / var_144_21
				local var_144_23 = Vector3.New(-0.7, -1.08, -5.9)

				var_144_19.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1019ui_story, var_144_23, var_144_22)

				local var_144_24 = manager.ui.mainCamera.transform.position - var_144_19.position

				var_144_19.forward = Vector3.New(var_144_24.x, var_144_24.y, var_144_24.z)

				local var_144_25 = var_144_19.localEulerAngles

				var_144_25.z = 0
				var_144_25.x = 0
				var_144_19.localEulerAngles = var_144_25
			end

			if arg_141_1.time_ >= var_144_20 + var_144_21 and arg_141_1.time_ < var_144_20 + var_144_21 + arg_144_0 then
				var_144_19.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_144_26 = manager.ui.mainCamera.transform.position - var_144_19.position

				var_144_19.forward = Vector3.New(var_144_26.x, var_144_26.y, var_144_26.z)

				local var_144_27 = var_144_19.localEulerAngles

				var_144_27.z = 0
				var_144_27.x = 0
				var_144_19.localEulerAngles = var_144_27
			end

			local var_144_28 = 0

			if var_144_28 < arg_141_1.time_ and arg_141_1.time_ <= var_144_28 + arg_144_0 then
				arg_141_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_144_29 = 0

			if var_144_29 < arg_141_1.time_ and arg_141_1.time_ <= var_144_29 + arg_144_0 then
				arg_141_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_144_30 = 0
			local var_144_31 = 0.125

			if var_144_30 < arg_141_1.time_ and arg_141_1.time_ <= var_144_30 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_32 = arg_141_1:FormatText(StoryNameCfg[13].name)

				arg_141_1.leftNameTxt_.text = var_144_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_33 = arg_141_1:GetWordFromCfg(104042035)
				local var_144_34 = arg_141_1:FormatText(var_144_33.content)

				arg_141_1.text_.text = var_144_34

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_35 = 5
				local var_144_36 = utf8.len(var_144_34)
				local var_144_37 = var_144_35 <= 0 and var_144_31 or var_144_31 * (var_144_36 / var_144_35)

				if var_144_37 > 0 and var_144_31 < var_144_37 then
					arg_141_1.talkMaxDuration = var_144_37

					if var_144_37 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_37 + var_144_30
					end
				end

				arg_141_1.text_.text = var_144_34
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042035", "story_v_out_104042.awb") ~= 0 then
					local var_144_38 = manager.audio:GetVoiceLength("story_v_out_104042", "104042035", "story_v_out_104042.awb") / 1000

					if var_144_38 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_38 + var_144_30
					end

					if var_144_33.prefab_name ~= "" and arg_141_1.actors_[var_144_33.prefab_name] ~= nil then
						local var_144_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_33.prefab_name].transform, "story_v_out_104042", "104042035", "story_v_out_104042.awb")

						arg_141_1:RecordAudio("104042035", var_144_39)
						arg_141_1:RecordAudio("104042035", var_144_39)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_104042", "104042035", "story_v_out_104042.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_104042", "104042035", "story_v_out_104042.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_40 = math.max(var_144_31, arg_141_1.talkMaxDuration)

			if var_144_30 <= arg_141_1.time_ and arg_141_1.time_ < var_144_30 + var_144_40 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_30) / var_144_40

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_30 + var_144_40 and arg_141_1.time_ < var_144_30 + var_144_40 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play104042036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 104042036
		arg_145_1.duration_ = 5.433

		local var_145_0 = {
			ja = 5.433,
			ko = 4.366,
			zh = 4.4,
			en = 4.233
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
				arg_145_0:Play104042037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1084ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story == nil then
				arg_145_1.var_.characterEffect1084ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.1

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1084ui_story then
					arg_145_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story then
				arg_145_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_148_4 = arg_145_1.actors_["1019ui_story"]
			local var_148_5 = 0

			if var_148_5 < arg_145_1.time_ and arg_145_1.time_ <= var_148_5 + arg_148_0 and arg_145_1.var_.characterEffect1019ui_story == nil then
				arg_145_1.var_.characterEffect1019ui_story = var_148_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_6 = 0.1

			if var_148_5 <= arg_145_1.time_ and arg_145_1.time_ < var_148_5 + var_148_6 then
				local var_148_7 = (arg_145_1.time_ - var_148_5) / var_148_6

				if arg_145_1.var_.characterEffect1019ui_story then
					local var_148_8 = Mathf.Lerp(0, 0.5, var_148_7)

					arg_145_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1019ui_story.fillRatio = var_148_8
				end
			end

			if arg_145_1.time_ >= var_148_5 + var_148_6 and arg_145_1.time_ < var_148_5 + var_148_6 + arg_148_0 and arg_145_1.var_.characterEffect1019ui_story then
				local var_148_9 = 0.5

				arg_145_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1019ui_story.fillRatio = var_148_9
			end

			local var_148_10 = arg_145_1.actors_["1084ui_story"].transform
			local var_148_11 = 0

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1.var_.moveOldPos1084ui_story = var_148_10.localPosition
			end

			local var_148_12 = 0.001

			if var_148_11 <= arg_145_1.time_ and arg_145_1.time_ < var_148_11 + var_148_12 then
				local var_148_13 = (arg_145_1.time_ - var_148_11) / var_148_12
				local var_148_14 = Vector3.New(0.7, -0.97, -6)

				var_148_10.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1084ui_story, var_148_14, var_148_13)

				local var_148_15 = manager.ui.mainCamera.transform.position - var_148_10.position

				var_148_10.forward = Vector3.New(var_148_15.x, var_148_15.y, var_148_15.z)

				local var_148_16 = var_148_10.localEulerAngles

				var_148_16.z = 0
				var_148_16.x = 0
				var_148_10.localEulerAngles = var_148_16
			end

			if arg_145_1.time_ >= var_148_11 + var_148_12 and arg_145_1.time_ < var_148_11 + var_148_12 + arg_148_0 then
				var_148_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_148_17 = manager.ui.mainCamera.transform.position - var_148_10.position

				var_148_10.forward = Vector3.New(var_148_17.x, var_148_17.y, var_148_17.z)

				local var_148_18 = var_148_10.localEulerAngles

				var_148_18.z = 0
				var_148_18.x = 0
				var_148_10.localEulerAngles = var_148_18
			end

			local var_148_19 = 0

			if var_148_19 < arg_145_1.time_ and arg_145_1.time_ <= var_148_19 + arg_148_0 then
				arg_145_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_148_20 = 0

			if var_148_20 < arg_145_1.time_ and arg_145_1.time_ <= var_148_20 + arg_148_0 then
				arg_145_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_148_21 = 0
			local var_148_22 = 0.475

			if var_148_21 < arg_145_1.time_ and arg_145_1.time_ <= var_148_21 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_23 = arg_145_1:FormatText(StoryNameCfg[6].name)

				arg_145_1.leftNameTxt_.text = var_148_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_24 = arg_145_1:GetWordFromCfg(104042036)
				local var_148_25 = arg_145_1:FormatText(var_148_24.content)

				arg_145_1.text_.text = var_148_25

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_26 = 19
				local var_148_27 = utf8.len(var_148_25)
				local var_148_28 = var_148_26 <= 0 and var_148_22 or var_148_22 * (var_148_27 / var_148_26)

				if var_148_28 > 0 and var_148_22 < var_148_28 then
					arg_145_1.talkMaxDuration = var_148_28

					if var_148_28 + var_148_21 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_28 + var_148_21
					end
				end

				arg_145_1.text_.text = var_148_25
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042036", "story_v_out_104042.awb") ~= 0 then
					local var_148_29 = manager.audio:GetVoiceLength("story_v_out_104042", "104042036", "story_v_out_104042.awb") / 1000

					if var_148_29 + var_148_21 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_29 + var_148_21
					end

					if var_148_24.prefab_name ~= "" and arg_145_1.actors_[var_148_24.prefab_name] ~= nil then
						local var_148_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_24.prefab_name].transform, "story_v_out_104042", "104042036", "story_v_out_104042.awb")

						arg_145_1:RecordAudio("104042036", var_148_30)
						arg_145_1:RecordAudio("104042036", var_148_30)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_104042", "104042036", "story_v_out_104042.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_104042", "104042036", "story_v_out_104042.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_31 = math.max(var_148_22, arg_145_1.talkMaxDuration)

			if var_148_21 <= arg_145_1.time_ and arg_145_1.time_ < var_148_21 + var_148_31 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_21) / var_148_31

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_21 + var_148_31 and arg_145_1.time_ < var_148_21 + var_148_31 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play104042037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 104042037
		arg_149_1.duration_ = 4.4

		local var_149_0 = {
			ja = 4.4,
			ko = 3.033,
			zh = 3.8,
			en = 3.866
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
				arg_149_0:Play104042038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10001_tpose"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect10001_tpose == nil then
				arg_149_1.var_.characterEffect10001_tpose = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.1

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect10001_tpose then
					arg_149_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect10001_tpose then
				arg_149_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_152_4 = arg_149_1.actors_["1084ui_story"]
			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story == nil then
				arg_149_1.var_.characterEffect1084ui_story = var_152_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_6 = 0.1

			if var_152_5 <= arg_149_1.time_ and arg_149_1.time_ < var_152_5 + var_152_6 then
				local var_152_7 = (arg_149_1.time_ - var_152_5) / var_152_6

				if arg_149_1.var_.characterEffect1084ui_story then
					local var_152_8 = Mathf.Lerp(0, 0.5, var_152_7)

					arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_8
				end
			end

			if arg_149_1.time_ >= var_152_5 + var_152_6 and arg_149_1.time_ < var_152_5 + var_152_6 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story then
				local var_152_9 = 0.5

				arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_9
			end

			local var_152_10 = arg_149_1.actors_["1084ui_story"].transform
			local var_152_11 = 0

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1.var_.moveOldPos1084ui_story = var_152_10.localPosition
			end

			local var_152_12 = 0.001

			if var_152_11 <= arg_149_1.time_ and arg_149_1.time_ < var_152_11 + var_152_12 then
				local var_152_13 = (arg_149_1.time_ - var_152_11) / var_152_12
				local var_152_14 = Vector3.New(0, 100, 0)

				var_152_10.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1084ui_story, var_152_14, var_152_13)

				local var_152_15 = manager.ui.mainCamera.transform.position - var_152_10.position

				var_152_10.forward = Vector3.New(var_152_15.x, var_152_15.y, var_152_15.z)

				local var_152_16 = var_152_10.localEulerAngles

				var_152_16.z = 0
				var_152_16.x = 0
				var_152_10.localEulerAngles = var_152_16
			end

			if arg_149_1.time_ >= var_152_11 + var_152_12 and arg_149_1.time_ < var_152_11 + var_152_12 + arg_152_0 then
				var_152_10.localPosition = Vector3.New(0, 100, 0)

				local var_152_17 = manager.ui.mainCamera.transform.position - var_152_10.position

				var_152_10.forward = Vector3.New(var_152_17.x, var_152_17.y, var_152_17.z)

				local var_152_18 = var_152_10.localEulerAngles

				var_152_18.z = 0
				var_152_18.x = 0
				var_152_10.localEulerAngles = var_152_18
			end

			local var_152_19 = arg_149_1.actors_["1019ui_story"].transform
			local var_152_20 = 0

			if var_152_20 < arg_149_1.time_ and arg_149_1.time_ <= var_152_20 + arg_152_0 then
				arg_149_1.var_.moveOldPos1019ui_story = var_152_19.localPosition
			end

			local var_152_21 = 0.001

			if var_152_20 <= arg_149_1.time_ and arg_149_1.time_ < var_152_20 + var_152_21 then
				local var_152_22 = (arg_149_1.time_ - var_152_20) / var_152_21
				local var_152_23 = Vector3.New(0, 100, 0)

				var_152_19.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1019ui_story, var_152_23, var_152_22)

				local var_152_24 = manager.ui.mainCamera.transform.position - var_152_19.position

				var_152_19.forward = Vector3.New(var_152_24.x, var_152_24.y, var_152_24.z)

				local var_152_25 = var_152_19.localEulerAngles

				var_152_25.z = 0
				var_152_25.x = 0
				var_152_19.localEulerAngles = var_152_25
			end

			if arg_149_1.time_ >= var_152_20 + var_152_21 and arg_149_1.time_ < var_152_20 + var_152_21 + arg_152_0 then
				var_152_19.localPosition = Vector3.New(0, 100, 0)

				local var_152_26 = manager.ui.mainCamera.transform.position - var_152_19.position

				var_152_19.forward = Vector3.New(var_152_26.x, var_152_26.y, var_152_26.z)

				local var_152_27 = var_152_19.localEulerAngles

				var_152_27.z = 0
				var_152_27.x = 0
				var_152_19.localEulerAngles = var_152_27
			end

			local var_152_28 = arg_149_1.actors_["10001_tpose"].transform
			local var_152_29 = 0

			if var_152_29 < arg_149_1.time_ and arg_149_1.time_ <= var_152_29 + arg_152_0 then
				arg_149_1.var_.moveOldPos10001_tpose = var_152_28.localPosition
			end

			local var_152_30 = 0.001

			if var_152_29 <= arg_149_1.time_ and arg_149_1.time_ < var_152_29 + var_152_30 then
				local var_152_31 = (arg_149_1.time_ - var_152_29) / var_152_30
				local var_152_32 = Vector3.New(0, -1.23, -5.8)

				var_152_28.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10001_tpose, var_152_32, var_152_31)

				local var_152_33 = manager.ui.mainCamera.transform.position - var_152_28.position

				var_152_28.forward = Vector3.New(var_152_33.x, var_152_33.y, var_152_33.z)

				local var_152_34 = var_152_28.localEulerAngles

				var_152_34.z = 0
				var_152_34.x = 0
				var_152_28.localEulerAngles = var_152_34
			end

			if arg_149_1.time_ >= var_152_29 + var_152_30 and arg_149_1.time_ < var_152_29 + var_152_30 + arg_152_0 then
				var_152_28.localPosition = Vector3.New(0, -1.23, -5.8)

				local var_152_35 = manager.ui.mainCamera.transform.position - var_152_28.position

				var_152_28.forward = Vector3.New(var_152_35.x, var_152_35.y, var_152_35.z)

				local var_152_36 = var_152_28.localEulerAngles

				var_152_36.z = 0
				var_152_36.x = 0
				var_152_28.localEulerAngles = var_152_36
			end

			local var_152_37 = 0

			if var_152_37 < arg_149_1.time_ and arg_149_1.time_ <= var_152_37 + arg_152_0 then
				arg_149_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action3_1")
			end

			local var_152_38 = 0

			if var_152_38 < arg_149_1.time_ and arg_149_1.time_ <= var_152_38 + arg_152_0 then
				arg_149_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_152_39 = 0
			local var_152_40 = 0.35

			if var_152_39 < arg_149_1.time_ and arg_149_1.time_ <= var_152_39 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_41 = arg_149_1:FormatText(StoryNameCfg[31].name)

				arg_149_1.leftNameTxt_.text = var_152_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_42 = arg_149_1:GetWordFromCfg(104042037)
				local var_152_43 = arg_149_1:FormatText(var_152_42.content)

				arg_149_1.text_.text = var_152_43

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_44 = 14
				local var_152_45 = utf8.len(var_152_43)
				local var_152_46 = var_152_44 <= 0 and var_152_40 or var_152_40 * (var_152_45 / var_152_44)

				if var_152_46 > 0 and var_152_40 < var_152_46 then
					arg_149_1.talkMaxDuration = var_152_46

					if var_152_46 + var_152_39 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_46 + var_152_39
					end
				end

				arg_149_1.text_.text = var_152_43
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042037", "story_v_out_104042.awb") ~= 0 then
					local var_152_47 = manager.audio:GetVoiceLength("story_v_out_104042", "104042037", "story_v_out_104042.awb") / 1000

					if var_152_47 + var_152_39 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_47 + var_152_39
					end

					if var_152_42.prefab_name ~= "" and arg_149_1.actors_[var_152_42.prefab_name] ~= nil then
						local var_152_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_42.prefab_name].transform, "story_v_out_104042", "104042037", "story_v_out_104042.awb")

						arg_149_1:RecordAudio("104042037", var_152_48)
						arg_149_1:RecordAudio("104042037", var_152_48)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_104042", "104042037", "story_v_out_104042.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_104042", "104042037", "story_v_out_104042.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_49 = math.max(var_152_40, arg_149_1.talkMaxDuration)

			if var_152_39 <= arg_149_1.time_ and arg_149_1.time_ < var_152_39 + var_152_49 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_39) / var_152_49

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_39 + var_152_49 and arg_149_1.time_ < var_152_39 + var_152_49 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play104042038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 104042038
		arg_153_1.duration_ = 7.966

		local var_153_0 = {
			ja = 7.966,
			ko = 3.3,
			zh = 4.033,
			en = 4.766
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
				arg_153_0:Play104042039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = "1011ui_story"

			if arg_153_1.actors_[var_156_0] == nil then
				local var_156_1 = Object.Instantiate(Asset.Load("Char/" .. var_156_0), arg_153_1.stage_.transform)

				var_156_1.name = var_156_0
				var_156_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_153_1.actors_[var_156_0] = var_156_1

				local var_156_2 = var_156_1:GetComponentInChildren(typeof(CharacterEffect))

				var_156_2.enabled = true

				local var_156_3 = GameObjectTools.GetOrAddComponent(var_156_1, typeof(DynamicBoneHelper))

				if var_156_3 then
					var_156_3:EnableDynamicBone(false)
				end

				arg_153_1:ShowWeapon(var_156_2.transform, false)

				arg_153_1.var_[var_156_0 .. "Animator"] = var_156_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_153_1.var_[var_156_0 .. "Animator"].applyRootMotion = true
				arg_153_1.var_[var_156_0 .. "LipSync"] = var_156_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_156_4 = arg_153_1.actors_["1011ui_story"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect1011ui_story == nil then
				arg_153_1.var_.characterEffect1011ui_story = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.1

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect1011ui_story then
					arg_153_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1011ui_story then
				arg_153_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_156_8 = arg_153_1.actors_["10001_tpose"]
			local var_156_9 = 0

			if var_156_9 < arg_153_1.time_ and arg_153_1.time_ <= var_156_9 + arg_156_0 and arg_153_1.var_.characterEffect10001_tpose == nil then
				arg_153_1.var_.characterEffect10001_tpose = var_156_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_10 = 0.1

			if var_156_9 <= arg_153_1.time_ and arg_153_1.time_ < var_156_9 + var_156_10 then
				local var_156_11 = (arg_153_1.time_ - var_156_9) / var_156_10

				if arg_153_1.var_.characterEffect10001_tpose then
					local var_156_12 = Mathf.Lerp(0, 0.5, var_156_11)

					arg_153_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_153_1.var_.characterEffect10001_tpose.fillRatio = var_156_12
				end
			end

			if arg_153_1.time_ >= var_156_9 + var_156_10 and arg_153_1.time_ < var_156_9 + var_156_10 + arg_156_0 and arg_153_1.var_.characterEffect10001_tpose then
				local var_156_13 = 0.5

				arg_153_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_153_1.var_.characterEffect10001_tpose.fillRatio = var_156_13
			end

			local var_156_14 = arg_153_1.actors_["10001_tpose"].transform
			local var_156_15 = 0

			if var_156_15 < arg_153_1.time_ and arg_153_1.time_ <= var_156_15 + arg_156_0 then
				arg_153_1.var_.moveOldPos10001_tpose = var_156_14.localPosition
			end

			local var_156_16 = 0.001

			if var_156_15 <= arg_153_1.time_ and arg_153_1.time_ < var_156_15 + var_156_16 then
				local var_156_17 = (arg_153_1.time_ - var_156_15) / var_156_16
				local var_156_18 = Vector3.New(0, 100, 0)

				var_156_14.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos10001_tpose, var_156_18, var_156_17)

				local var_156_19 = manager.ui.mainCamera.transform.position - var_156_14.position

				var_156_14.forward = Vector3.New(var_156_19.x, var_156_19.y, var_156_19.z)

				local var_156_20 = var_156_14.localEulerAngles

				var_156_20.z = 0
				var_156_20.x = 0
				var_156_14.localEulerAngles = var_156_20
			end

			if arg_153_1.time_ >= var_156_15 + var_156_16 and arg_153_1.time_ < var_156_15 + var_156_16 + arg_156_0 then
				var_156_14.localPosition = Vector3.New(0, 100, 0)

				local var_156_21 = manager.ui.mainCamera.transform.position - var_156_14.position

				var_156_14.forward = Vector3.New(var_156_21.x, var_156_21.y, var_156_21.z)

				local var_156_22 = var_156_14.localEulerAngles

				var_156_22.z = 0
				var_156_22.x = 0
				var_156_14.localEulerAngles = var_156_22
			end

			local var_156_23 = arg_153_1.actors_["1011ui_story"].transform
			local var_156_24 = 0

			if var_156_24 < arg_153_1.time_ and arg_153_1.time_ <= var_156_24 + arg_156_0 then
				arg_153_1.var_.moveOldPos1011ui_story = var_156_23.localPosition
			end

			local var_156_25 = 0.001

			if var_156_24 <= arg_153_1.time_ and arg_153_1.time_ < var_156_24 + var_156_25 then
				local var_156_26 = (arg_153_1.time_ - var_156_24) / var_156_25
				local var_156_27 = Vector3.New(-0.7, -0.71, -6)

				var_156_23.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1011ui_story, var_156_27, var_156_26)

				local var_156_28 = manager.ui.mainCamera.transform.position - var_156_23.position

				var_156_23.forward = Vector3.New(var_156_28.x, var_156_28.y, var_156_28.z)

				local var_156_29 = var_156_23.localEulerAngles

				var_156_29.z = 0
				var_156_29.x = 0
				var_156_23.localEulerAngles = var_156_29
			end

			if arg_153_1.time_ >= var_156_24 + var_156_25 and arg_153_1.time_ < var_156_24 + var_156_25 + arg_156_0 then
				var_156_23.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_156_30 = manager.ui.mainCamera.transform.position - var_156_23.position

				var_156_23.forward = Vector3.New(var_156_30.x, var_156_30.y, var_156_30.z)

				local var_156_31 = var_156_23.localEulerAngles

				var_156_31.z = 0
				var_156_31.x = 0
				var_156_23.localEulerAngles = var_156_31
			end

			local var_156_32 = 0

			if var_156_32 < arg_153_1.time_ and arg_153_1.time_ <= var_156_32 + arg_156_0 then
				arg_153_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_156_33 = 0

			if var_156_33 < arg_153_1.time_ and arg_153_1.time_ <= var_156_33 + arg_156_0 then
				arg_153_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_156_34 = 0
			local var_156_35 = 0.4

			if var_156_34 < arg_153_1.time_ and arg_153_1.time_ <= var_156_34 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_36 = arg_153_1:FormatText(StoryNameCfg[37].name)

				arg_153_1.leftNameTxt_.text = var_156_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_37 = arg_153_1:GetWordFromCfg(104042038)
				local var_156_38 = arg_153_1:FormatText(var_156_37.content)

				arg_153_1.text_.text = var_156_38

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_39 = 16
				local var_156_40 = utf8.len(var_156_38)
				local var_156_41 = var_156_39 <= 0 and var_156_35 or var_156_35 * (var_156_40 / var_156_39)

				if var_156_41 > 0 and var_156_35 < var_156_41 then
					arg_153_1.talkMaxDuration = var_156_41

					if var_156_41 + var_156_34 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_41 + var_156_34
					end
				end

				arg_153_1.text_.text = var_156_38
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042038", "story_v_out_104042.awb") ~= 0 then
					local var_156_42 = manager.audio:GetVoiceLength("story_v_out_104042", "104042038", "story_v_out_104042.awb") / 1000

					if var_156_42 + var_156_34 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_42 + var_156_34
					end

					if var_156_37.prefab_name ~= "" and arg_153_1.actors_[var_156_37.prefab_name] ~= nil then
						local var_156_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_37.prefab_name].transform, "story_v_out_104042", "104042038", "story_v_out_104042.awb")

						arg_153_1:RecordAudio("104042038", var_156_43)
						arg_153_1:RecordAudio("104042038", var_156_43)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_104042", "104042038", "story_v_out_104042.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_104042", "104042038", "story_v_out_104042.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_44 = math.max(var_156_35, arg_153_1.talkMaxDuration)

			if var_156_34 <= arg_153_1.time_ and arg_153_1.time_ < var_156_34 + var_156_44 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_34) / var_156_44

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_34 + var_156_44 and arg_153_1.time_ < var_156_34 + var_156_44 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play104042039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 104042039
		arg_157_1.duration_ = 5.966

		local var_157_0 = {
			ja = 5.966,
			ko = 3.866,
			zh = 4.4,
			en = 4.666
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
				arg_157_0:Play104042040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1084ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1084ui_story == nil then
				arg_157_1.var_.characterEffect1084ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.1

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1084ui_story then
					arg_157_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1084ui_story then
				arg_157_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_160_4 = arg_157_1.actors_["1011ui_story"]
			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 and arg_157_1.var_.characterEffect1011ui_story == nil then
				arg_157_1.var_.characterEffect1011ui_story = var_160_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_6 = 0.1

			if var_160_5 <= arg_157_1.time_ and arg_157_1.time_ < var_160_5 + var_160_6 then
				local var_160_7 = (arg_157_1.time_ - var_160_5) / var_160_6

				if arg_157_1.var_.characterEffect1011ui_story then
					local var_160_8 = Mathf.Lerp(0, 0.5, var_160_7)

					arg_157_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1011ui_story.fillRatio = var_160_8
				end
			end

			if arg_157_1.time_ >= var_160_5 + var_160_6 and arg_157_1.time_ < var_160_5 + var_160_6 + arg_160_0 and arg_157_1.var_.characterEffect1011ui_story then
				local var_160_9 = 0.5

				arg_157_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1011ui_story.fillRatio = var_160_9
			end

			local var_160_10 = arg_157_1.actors_["1084ui_story"].transform
			local var_160_11 = 0

			if var_160_11 < arg_157_1.time_ and arg_157_1.time_ <= var_160_11 + arg_160_0 then
				arg_157_1.var_.moveOldPos1084ui_story = var_160_10.localPosition
			end

			local var_160_12 = 0.001

			if var_160_11 <= arg_157_1.time_ and arg_157_1.time_ < var_160_11 + var_160_12 then
				local var_160_13 = (arg_157_1.time_ - var_160_11) / var_160_12
				local var_160_14 = Vector3.New(0.7, -0.97, -6)

				var_160_10.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1084ui_story, var_160_14, var_160_13)

				local var_160_15 = manager.ui.mainCamera.transform.position - var_160_10.position

				var_160_10.forward = Vector3.New(var_160_15.x, var_160_15.y, var_160_15.z)

				local var_160_16 = var_160_10.localEulerAngles

				var_160_16.z = 0
				var_160_16.x = 0
				var_160_10.localEulerAngles = var_160_16
			end

			if arg_157_1.time_ >= var_160_11 + var_160_12 and arg_157_1.time_ < var_160_11 + var_160_12 + arg_160_0 then
				var_160_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_160_17 = manager.ui.mainCamera.transform.position - var_160_10.position

				var_160_10.forward = Vector3.New(var_160_17.x, var_160_17.y, var_160_17.z)

				local var_160_18 = var_160_10.localEulerAngles

				var_160_18.z = 0
				var_160_18.x = 0
				var_160_10.localEulerAngles = var_160_18
			end

			local var_160_19 = 0

			if var_160_19 < arg_157_1.time_ and arg_157_1.time_ <= var_160_19 + arg_160_0 then
				arg_157_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_160_20 = 0

			if var_160_20 < arg_157_1.time_ and arg_157_1.time_ <= var_160_20 + arg_160_0 then
				arg_157_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_160_21 = 0
			local var_160_22 = 0.575

			if var_160_21 < arg_157_1.time_ and arg_157_1.time_ <= var_160_21 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_23 = arg_157_1:FormatText(StoryNameCfg[6].name)

				arg_157_1.leftNameTxt_.text = var_160_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_24 = arg_157_1:GetWordFromCfg(104042039)
				local var_160_25 = arg_157_1:FormatText(var_160_24.content)

				arg_157_1.text_.text = var_160_25

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_26 = 23
				local var_160_27 = utf8.len(var_160_25)
				local var_160_28 = var_160_26 <= 0 and var_160_22 or var_160_22 * (var_160_27 / var_160_26)

				if var_160_28 > 0 and var_160_22 < var_160_28 then
					arg_157_1.talkMaxDuration = var_160_28

					if var_160_28 + var_160_21 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_28 + var_160_21
					end
				end

				arg_157_1.text_.text = var_160_25
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042039", "story_v_out_104042.awb") ~= 0 then
					local var_160_29 = manager.audio:GetVoiceLength("story_v_out_104042", "104042039", "story_v_out_104042.awb") / 1000

					if var_160_29 + var_160_21 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_29 + var_160_21
					end

					if var_160_24.prefab_name ~= "" and arg_157_1.actors_[var_160_24.prefab_name] ~= nil then
						local var_160_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_24.prefab_name].transform, "story_v_out_104042", "104042039", "story_v_out_104042.awb")

						arg_157_1:RecordAudio("104042039", var_160_30)
						arg_157_1:RecordAudio("104042039", var_160_30)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_104042", "104042039", "story_v_out_104042.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_104042", "104042039", "story_v_out_104042.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_31 = math.max(var_160_22, arg_157_1.talkMaxDuration)

			if var_160_21 <= arg_157_1.time_ and arg_157_1.time_ < var_160_21 + var_160_31 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_21) / var_160_31

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_21 + var_160_31 and arg_157_1.time_ < var_160_21 + var_160_31 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play104042040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 104042040
		arg_161_1.duration_ = 11.233

		local var_161_0 = {
			ja = 11.233,
			ko = 5.666,
			zh = 7.233,
			en = 5.7
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
			arg_161_1.auto_ = false
		end

		function arg_161_1.playNext_(arg_163_0)
			arg_161_1.onStoryFinished_()
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1011ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1011ui_story == nil then
				arg_161_1.var_.characterEffect1011ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.1

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1011ui_story then
					arg_161_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1011ui_story then
				arg_161_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_164_4 = arg_161_1.actors_["1084ui_story"]
			local var_164_5 = 0

			if var_164_5 < arg_161_1.time_ and arg_161_1.time_ <= var_164_5 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story == nil then
				arg_161_1.var_.characterEffect1084ui_story = var_164_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_6 = 0.1

			if var_164_5 <= arg_161_1.time_ and arg_161_1.time_ < var_164_5 + var_164_6 then
				local var_164_7 = (arg_161_1.time_ - var_164_5) / var_164_6

				if arg_161_1.var_.characterEffect1084ui_story then
					local var_164_8 = Mathf.Lerp(0, 0.5, var_164_7)

					arg_161_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1084ui_story.fillRatio = var_164_8
				end
			end

			if arg_161_1.time_ >= var_164_5 + var_164_6 and arg_161_1.time_ < var_164_5 + var_164_6 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story then
				local var_164_9 = 0.5

				arg_161_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1084ui_story.fillRatio = var_164_9
			end

			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_164_11 = 0
			local var_164_12 = 0.55

			if var_164_11 < arg_161_1.time_ and arg_161_1.time_ <= var_164_11 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_13 = arg_161_1:FormatText(StoryNameCfg[37].name)

				arg_161_1.leftNameTxt_.text = var_164_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_14 = arg_161_1:GetWordFromCfg(104042040)
				local var_164_15 = arg_161_1:FormatText(var_164_14.content)

				arg_161_1.text_.text = var_164_15

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_16 = 22
				local var_164_17 = utf8.len(var_164_15)
				local var_164_18 = var_164_16 <= 0 and var_164_12 or var_164_12 * (var_164_17 / var_164_16)

				if var_164_18 > 0 and var_164_12 < var_164_18 then
					arg_161_1.talkMaxDuration = var_164_18

					if var_164_18 + var_164_11 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_18 + var_164_11
					end
				end

				arg_161_1.text_.text = var_164_15
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104042", "104042040", "story_v_out_104042.awb") ~= 0 then
					local var_164_19 = manager.audio:GetVoiceLength("story_v_out_104042", "104042040", "story_v_out_104042.awb") / 1000

					if var_164_19 + var_164_11 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_19 + var_164_11
					end

					if var_164_14.prefab_name ~= "" and arg_161_1.actors_[var_164_14.prefab_name] ~= nil then
						local var_164_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_14.prefab_name].transform, "story_v_out_104042", "104042040", "story_v_out_104042.awb")

						arg_161_1:RecordAudio("104042040", var_164_20)
						arg_161_1:RecordAudio("104042040", var_164_20)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_104042", "104042040", "story_v_out_104042.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_104042", "104042040", "story_v_out_104042.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_21 = math.max(var_164_12, arg_161_1.talkMaxDuration)

			if var_164_11 <= arg_161_1.time_ and arg_161_1.time_ < var_164_11 + var_164_21 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_11) / var_164_21

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_11 + var_164_21 and arg_161_1.time_ < var_164_11 + var_164_21 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0403",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B04b"
	},
	voices = {
		"story_v_out_104042.awb"
	}
}
