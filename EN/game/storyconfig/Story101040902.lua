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

				local var_4_4 = ""
				local var_4_5 = manager.audio:GetAudioName("bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1")

				if var_4_5 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_5 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_5

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_5
					end

					if arg_1_1.bgmTimer then
						arg_1_1.bgmTimer:Stop()

						arg_1_1.bgmTimer = nil
					end

					if arg_1_1.settingData.show_music_name == 1 then
						arg_1_1.musicController:SetSelectedState("show")
						arg_1_1.musicAnimator_:Play("open", 0, 0)

						if arg_1_1.settingData.music_time ~= 0 then
							arg_1_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_1_1.settingData.music_time), function()
								if arg_1_1 == nil or isNil(arg_1_1.bgmTxt_) then
									return
								end

								arg_1_1.musicController:SetSelectedState("hide")
								arg_1_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_4_6 = "B04c"

			if arg_1_1.bgs_[var_4_6] == nil then
				local var_4_7 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_6)
				var_4_7.name = var_4_6
				var_4_7.transform.parent = arg_1_1.stage_.transform
				var_4_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_6] = var_4_7
			end

			local var_4_8 = arg_1_1.bgs_.B04c
			local var_4_9 = 0

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 then
				local var_4_10 = var_4_8:GetComponent("SpriteRenderer")

				if var_4_10 then
					var_4_10.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_11 = var_4_10.material
					local var_4_12 = var_4_11:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB04c = var_4_12.a
					arg_1_1.var_.alphaMatValueB04c = var_4_11
				end

				arg_1_1.var_.alphaOldValueB04c = 0
			end

			local var_4_13 = 1.5

			if var_4_9 <= arg_1_1.time_ and arg_1_1.time_ < var_4_9 + var_4_13 then
				local var_4_14 = (arg_1_1.time_ - var_4_9) / var_4_13
				local var_4_15 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB04c, 1, var_4_14)

				if arg_1_1.var_.alphaMatValueB04c then
					local var_4_16 = arg_1_1.var_.alphaMatValueB04c
					local var_4_17 = var_4_16:GetColor("_Color")

					var_4_17.a = var_4_15

					var_4_16:SetColor("_Color", var_4_17)
				end
			end

			if arg_1_1.time_ >= var_4_9 + var_4_13 and arg_1_1.time_ < var_4_9 + var_4_13 + arg_4_0 and arg_1_1.var_.alphaMatValueB04c then
				local var_4_18 = arg_1_1.var_.alphaMatValueB04c
				local var_4_19 = var_4_18:GetColor("_Color")

				var_4_19.a = 1

				var_4_18:SetColor("_Color", var_4_19)
			end

			local var_4_20 = 0

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				local var_4_21 = manager.ui.mainCamera.transform.localPosition
				local var_4_22 = Vector3.New(0, 0, 10) + Vector3.New(var_4_21.x, var_4_21.y, 0)
				local var_4_23 = arg_1_1.bgs_.B04c

				var_4_23.transform.localPosition = var_4_22
				var_4_23.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_24 = var_4_23:GetComponent("SpriteRenderer")

				if var_4_24 and var_4_24.sprite then
					local var_4_25 = (var_4_23.transform.localPosition - var_4_21).z
					local var_4_26 = manager.ui.mainCameraCom_
					local var_4_27 = 2 * var_4_25 * Mathf.Tan(var_4_26.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_28 = var_4_27 * var_4_26.aspect
					local var_4_29 = var_4_24.sprite.bounds.size.x
					local var_4_30 = var_4_24.sprite.bounds.size.y
					local var_4_31 = var_4_28 / var_4_29
					local var_4_32 = var_4_27 / var_4_30
					local var_4_33 = var_4_32 < var_4_31 and var_4_31 or var_4_32

					var_4_23.transform.localScale = Vector3.New(var_4_33, var_4_33, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B04c" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_34 = 0

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_35 = 2

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_36 = 2
			local var_4_37 = 0.675

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_38 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_38:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_39 = arg_1_1:GetWordFromCfg(104092001)
				local var_4_40 = arg_1_1:FormatText(var_4_39.content)

				arg_1_1.text_.text = var_4_40

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_41 = 27
				local var_4_42 = utf8.len(var_4_40)
				local var_4_43 = var_4_41 <= 0 and var_4_37 or var_4_37 * (var_4_42 / var_4_41)

				if var_4_43 > 0 and var_4_37 < var_4_43 then
					arg_1_1.talkMaxDuration = var_4_43
					var_4_36 = var_4_36 + 0.3

					if var_4_43 + var_4_36 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_43 + var_4_36
					end
				end

				arg_1_1.text_.text = var_4_40
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_44 = var_4_36 + 0.3
			local var_4_45 = math.max(var_4_37, arg_1_1.talkMaxDuration)

			if var_4_44 <= arg_1_1.time_ and arg_1_1.time_ < var_4_44 + var_4_45 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_44) / var_4_45

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_44 + var_4_45 and arg_1_1.time_ < var_4_44 + var_4_45 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play104092002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 104092002
		arg_8_1.duration_ = 5.37

		local var_8_0 = {
			ja = 5.366,
			ko = 3.933,
			zh = 3.566,
			en = 5.066
		}
		local var_8_1 = manager.audio:GetLocalizationFlag()

		if var_8_0[var_8_1] ~= nil then
			arg_8_1.duration_ = var_8_0[var_8_1]
		end

		SetActive(arg_8_1.tipsGo_, false)

		function arg_8_1.onSingleLineFinish_()
			arg_8_1.onSingleLineUpdate_ = nil
			arg_8_1.onSingleLineFinish_ = nil
			arg_8_1.state_ = "waiting"
		end

		function arg_8_1.playNext_(arg_10_0)
			if arg_10_0 == 1 then
				arg_8_0:Play104092003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = "1084ui_story"

			if arg_8_1.actors_[var_11_0] == nil then
				local var_11_1 = Asset.Load("Char/" .. "1084ui_story")

				if not isNil(var_11_1) then
					local var_11_2 = Object.Instantiate(Asset.Load("Char/" .. "1084ui_story"), arg_8_1.stage_.transform)

					var_11_2.name = var_11_0
					var_11_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_8_1.actors_[var_11_0] = var_11_2

					local var_11_3 = var_11_2:GetComponentInChildren(typeof(CharacterEffect))

					var_11_3.enabled = true

					local var_11_4 = GameObjectTools.GetOrAddComponent(var_11_2, typeof(DynamicBoneHelper))

					if var_11_4 then
						var_11_4:EnableDynamicBone(false)
					end

					arg_8_1:ShowWeapon(var_11_3.transform, false)

					arg_8_1.var_[var_11_0 .. "Animator"] = var_11_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_8_1.var_[var_11_0 .. "Animator"].applyRootMotion = true
					arg_8_1.var_[var_11_0 .. "LipSync"] = var_11_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_11_5 = arg_8_1.actors_["1084ui_story"]
			local var_11_6 = 0

			if var_11_6 < arg_8_1.time_ and arg_8_1.time_ <= var_11_6 + arg_11_0 and not isNil(var_11_5) and arg_8_1.var_.characterEffect1084ui_story == nil then
				arg_8_1.var_.characterEffect1084ui_story = var_11_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_11_7 = 0.1

			if var_11_6 <= arg_8_1.time_ and arg_8_1.time_ < var_11_6 + var_11_7 and not isNil(var_11_5) then
				local var_11_8 = (arg_8_1.time_ - var_11_6) / var_11_7

				if arg_8_1.var_.characterEffect1084ui_story and not isNil(var_11_5) then
					arg_8_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_8_1.time_ >= var_11_6 + var_11_7 and arg_8_1.time_ < var_11_6 + var_11_7 + arg_11_0 and not isNil(var_11_5) and arg_8_1.var_.characterEffect1084ui_story then
				arg_8_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_11_9 = arg_8_1.actors_["1084ui_story"].transform
			local var_11_10 = 0

			if var_11_10 < arg_8_1.time_ and arg_8_1.time_ <= var_11_10 + arg_11_0 then
				arg_8_1.var_.moveOldPos1084ui_story = var_11_9.localPosition
			end

			local var_11_11 = 0.001

			if var_11_10 <= arg_8_1.time_ and arg_8_1.time_ < var_11_10 + var_11_11 then
				local var_11_12 = (arg_8_1.time_ - var_11_10) / var_11_11
				local var_11_13 = Vector3.New(-0.7, -0.97, -6)

				var_11_9.localPosition = Vector3.Lerp(arg_8_1.var_.moveOldPos1084ui_story, var_11_13, var_11_12)

				local var_11_14 = manager.ui.mainCamera.transform.position - var_11_9.position

				var_11_9.forward = Vector3.New(var_11_14.x, var_11_14.y, var_11_14.z)

				local var_11_15 = var_11_9.localEulerAngles

				var_11_15.z = 0
				var_11_15.x = 0
				var_11_9.localEulerAngles = var_11_15
			end

			if arg_8_1.time_ >= var_11_10 + var_11_11 and arg_8_1.time_ < var_11_10 + var_11_11 + arg_11_0 then
				var_11_9.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_11_16 = manager.ui.mainCamera.transform.position - var_11_9.position

				var_11_9.forward = Vector3.New(var_11_16.x, var_11_16.y, var_11_16.z)

				local var_11_17 = var_11_9.localEulerAngles

				var_11_17.z = 0
				var_11_17.x = 0
				var_11_9.localEulerAngles = var_11_17
			end

			local var_11_18 = 0

			if var_11_18 < arg_8_1.time_ and arg_8_1.time_ <= var_11_18 + arg_11_0 then
				arg_8_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_11_19 = 0

			if var_11_19 < arg_8_1.time_ and arg_8_1.time_ <= var_11_19 + arg_11_0 then
				arg_8_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_11_20 = "mmr"

			if arg_8_1.actors_[var_11_20] == nil then
				local var_11_21 = Object.Instantiate(arg_8_1.imageGo_, arg_8_1.canvasGo_.transform)

				var_11_21.transform:SetSiblingIndex(1)

				var_11_21.name = var_11_20

				local var_11_22 = var_11_21:GetComponent(typeof(Image))

				var_11_22.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "mmr")

				var_11_22:SetNativeSize()

				var_11_21.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_8_1.actors_[var_11_20] = var_11_21
			end

			local var_11_23 = arg_8_1.actors_.mmr.transform
			local var_11_24 = 0

			if var_11_24 < arg_8_1.time_ and arg_8_1.time_ <= var_11_24 + arg_11_0 then
				arg_8_1.var_.shakeOldPosmmr = var_11_23.localPosition
			end

			local var_11_25 = 2

			if var_11_24 <= arg_8_1.time_ and arg_8_1.time_ < var_11_24 + var_11_25 then
				local var_11_26 = (arg_8_1.time_ - var_11_24) / 0.066
				local var_11_27, var_11_28 = math.modf(var_11_26)

				var_11_23.localPosition = Vector3.New(var_11_28 * 0.13, var_11_28 * 0.13, var_11_28 * 0.13) + arg_8_1.var_.shakeOldPosmmr
			end

			if arg_8_1.time_ >= var_11_24 + var_11_25 and arg_8_1.time_ < var_11_24 + var_11_25 + arg_11_0 then
				var_11_23.localPosition = arg_8_1.var_.shakeOldPosmmr
			end

			local var_11_29 = 0
			local var_11_30 = 0.5

			if var_11_29 < arg_8_1.time_ and arg_8_1.time_ <= var_11_29 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, true)

				local var_11_31 = arg_8_1:FormatText(StoryNameCfg[6].name)

				arg_8_1.leftNameTxt_.text = var_11_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_1.leftNameTxt_.transform)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1.leftNameTxt_.text)
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_32 = arg_8_1:GetWordFromCfg(104092002)
				local var_11_33 = arg_8_1:FormatText(var_11_32.content)

				arg_8_1.text_.text = var_11_33

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_34 = 20
				local var_11_35 = utf8.len(var_11_33)
				local var_11_36 = var_11_34 <= 0 and var_11_30 or var_11_30 * (var_11_35 / var_11_34)

				if var_11_36 > 0 and var_11_30 < var_11_36 then
					arg_8_1.talkMaxDuration = var_11_36

					if var_11_36 + var_11_29 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_36 + var_11_29
					end
				end

				arg_8_1.text_.text = var_11_33
				arg_8_1.typewritter.percent = 0

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092002", "story_v_out_104092.awb") ~= 0 then
					local var_11_37 = manager.audio:GetVoiceLength("story_v_out_104092", "104092002", "story_v_out_104092.awb") / 1000

					if var_11_37 + var_11_29 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_37 + var_11_29
					end

					if var_11_32.prefab_name ~= "" and arg_8_1.actors_[var_11_32.prefab_name] ~= nil then
						local var_11_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_8_1.actors_[var_11_32.prefab_name].transform, "story_v_out_104092", "104092002", "story_v_out_104092.awb")

						arg_8_1:RecordAudio("104092002", var_11_38)
						arg_8_1:RecordAudio("104092002", var_11_38)
					else
						arg_8_1:AudioAction("play", "voice", "story_v_out_104092", "104092002", "story_v_out_104092.awb")
					end

					arg_8_1:RecordHistoryTalkVoice("story_v_out_104092", "104092002", "story_v_out_104092.awb")
				end

				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_39 = math.max(var_11_30, arg_8_1.talkMaxDuration)

			if var_11_29 <= arg_8_1.time_ and arg_8_1.time_ < var_11_29 + var_11_39 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_29) / var_11_39

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_29 + var_11_39 and arg_8_1.time_ < var_11_29 + var_11_39 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play104092003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 104092003
		arg_12_1.duration_ = 7.73

		local var_12_0 = {
			ja = 7,
			ko = 7.733,
			zh = 6.933,
			en = 6.466
		}
		local var_12_1 = manager.audio:GetLocalizationFlag()

		if var_12_0[var_12_1] ~= nil then
			arg_12_1.duration_ = var_12_0[var_12_1]
		end

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play104092004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = "10001_tpose"

			if arg_12_1.actors_[var_15_0] == nil then
				local var_15_1 = Asset.Load("Char/" .. "10001_tpose")

				if not isNil(var_15_1) then
					local var_15_2 = Object.Instantiate(Asset.Load("Char/" .. "10001_tpose"), arg_12_1.stage_.transform)

					var_15_2.name = var_15_0
					var_15_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_12_1.actors_[var_15_0] = var_15_2

					local var_15_3 = var_15_2:GetComponentInChildren(typeof(CharacterEffect))

					var_15_3.enabled = true

					local var_15_4 = GameObjectTools.GetOrAddComponent(var_15_2, typeof(DynamicBoneHelper))

					if var_15_4 then
						var_15_4:EnableDynamicBone(false)
					end

					arg_12_1:ShowWeapon(var_15_3.transform, false)

					arg_12_1.var_[var_15_0 .. "Animator"] = var_15_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_12_1.var_[var_15_0 .. "Animator"].applyRootMotion = true
					arg_12_1.var_[var_15_0 .. "LipSync"] = var_15_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_15_5 = arg_12_1.actors_["10001_tpose"]
			local var_15_6 = 0

			if var_15_6 < arg_12_1.time_ and arg_12_1.time_ <= var_15_6 + arg_15_0 and not isNil(var_15_5) and arg_12_1.var_.characterEffect10001_tpose == nil then
				arg_12_1.var_.characterEffect10001_tpose = var_15_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_7 = 0.1

			if var_15_6 <= arg_12_1.time_ and arg_12_1.time_ < var_15_6 + var_15_7 and not isNil(var_15_5) then
				local var_15_8 = (arg_12_1.time_ - var_15_6) / var_15_7

				if arg_12_1.var_.characterEffect10001_tpose and not isNil(var_15_5) then
					arg_12_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_12_1.time_ >= var_15_6 + var_15_7 and arg_12_1.time_ < var_15_6 + var_15_7 + arg_15_0 and not isNil(var_15_5) and arg_12_1.var_.characterEffect10001_tpose then
				arg_12_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_15_9 = arg_12_1.actors_["1084ui_story"]
			local var_15_10 = 0

			if var_15_10 < arg_12_1.time_ and arg_12_1.time_ <= var_15_10 + arg_15_0 and not isNil(var_15_9) and arg_12_1.var_.characterEffect1084ui_story == nil then
				arg_12_1.var_.characterEffect1084ui_story = var_15_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_11 = 0.1

			if var_15_10 <= arg_12_1.time_ and arg_12_1.time_ < var_15_10 + var_15_11 and not isNil(var_15_9) then
				local var_15_12 = (arg_12_1.time_ - var_15_10) / var_15_11

				if arg_12_1.var_.characterEffect1084ui_story and not isNil(var_15_9) then
					local var_15_13 = Mathf.Lerp(0, 0.5, var_15_12)

					arg_12_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_12_1.var_.characterEffect1084ui_story.fillRatio = var_15_13
				end
			end

			if arg_12_1.time_ >= var_15_10 + var_15_11 and arg_12_1.time_ < var_15_10 + var_15_11 + arg_15_0 and not isNil(var_15_9) and arg_12_1.var_.characterEffect1084ui_story then
				local var_15_14 = 0.5

				arg_12_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_12_1.var_.characterEffect1084ui_story.fillRatio = var_15_14
			end

			local var_15_15 = arg_12_1.actors_["10001_tpose"].transform
			local var_15_16 = 0

			if var_15_16 < arg_12_1.time_ and arg_12_1.time_ <= var_15_16 + arg_15_0 then
				arg_12_1.var_.moveOldPos10001_tpose = var_15_15.localPosition
			end

			local var_15_17 = 0.001

			if var_15_16 <= arg_12_1.time_ and arg_12_1.time_ < var_15_16 + var_15_17 then
				local var_15_18 = (arg_12_1.time_ - var_15_16) / var_15_17
				local var_15_19 = Vector3.New(0.7, -1.23, -5.8)

				var_15_15.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos10001_tpose, var_15_19, var_15_18)

				local var_15_20 = manager.ui.mainCamera.transform.position - var_15_15.position

				var_15_15.forward = Vector3.New(var_15_20.x, var_15_20.y, var_15_20.z)

				local var_15_21 = var_15_15.localEulerAngles

				var_15_21.z = 0
				var_15_21.x = 0
				var_15_15.localEulerAngles = var_15_21
			end

			if arg_12_1.time_ >= var_15_16 + var_15_17 and arg_12_1.time_ < var_15_16 + var_15_17 + arg_15_0 then
				var_15_15.localPosition = Vector3.New(0.7, -1.23, -5.8)

				local var_15_22 = manager.ui.mainCamera.transform.position - var_15_15.position

				var_15_15.forward = Vector3.New(var_15_22.x, var_15_22.y, var_15_22.z)

				local var_15_23 = var_15_15.localEulerAngles

				var_15_23.z = 0
				var_15_23.x = 0
				var_15_15.localEulerAngles = var_15_23
			end

			local var_15_24 = 0

			if var_15_24 < arg_12_1.time_ and arg_12_1.time_ <= var_15_24 + arg_15_0 then
				arg_12_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_1")
			end

			local var_15_25 = 0

			if var_15_25 < arg_12_1.time_ and arg_12_1.time_ <= var_15_25 + arg_15_0 then
				arg_12_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_15_26 = 0
			local var_15_27 = 0.775

			if var_15_26 < arg_12_1.time_ and arg_12_1.time_ <= var_15_26 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, true)

				local var_15_28 = arg_12_1:FormatText(StoryNameCfg[31].name)

				arg_12_1.leftNameTxt_.text = var_15_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_1.leftNameTxt_.transform)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1.leftNameTxt_.text)
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_29 = arg_12_1:GetWordFromCfg(104092003)
				local var_15_30 = arg_12_1:FormatText(var_15_29.content)

				arg_12_1.text_.text = var_15_30

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_31 = 30
				local var_15_32 = utf8.len(var_15_30)
				local var_15_33 = var_15_31 <= 0 and var_15_27 or var_15_27 * (var_15_32 / var_15_31)

				if var_15_33 > 0 and var_15_27 < var_15_33 then
					arg_12_1.talkMaxDuration = var_15_33

					if var_15_33 + var_15_26 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_33 + var_15_26
					end
				end

				arg_12_1.text_.text = var_15_30
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092003", "story_v_out_104092.awb") ~= 0 then
					local var_15_34 = manager.audio:GetVoiceLength("story_v_out_104092", "104092003", "story_v_out_104092.awb") / 1000

					if var_15_34 + var_15_26 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_34 + var_15_26
					end

					if var_15_29.prefab_name ~= "" and arg_12_1.actors_[var_15_29.prefab_name] ~= nil then
						local var_15_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_12_1.actors_[var_15_29.prefab_name].transform, "story_v_out_104092", "104092003", "story_v_out_104092.awb")

						arg_12_1:RecordAudio("104092003", var_15_35)
						arg_12_1:RecordAudio("104092003", var_15_35)
					else
						arg_12_1:AudioAction("play", "voice", "story_v_out_104092", "104092003", "story_v_out_104092.awb")
					end

					arg_12_1:RecordHistoryTalkVoice("story_v_out_104092", "104092003", "story_v_out_104092.awb")
				end

				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_36 = math.max(var_15_27, arg_12_1.talkMaxDuration)

			if var_15_26 <= arg_12_1.time_ and arg_12_1.time_ < var_15_26 + var_15_36 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_26) / var_15_36

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_26 + var_15_36 and arg_12_1.time_ < var_15_26 + var_15_36 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play104092004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 104092004
		arg_16_1.duration_ = 8.4

		local var_16_0 = {
			ja = 8.4,
			ko = 3.9,
			zh = 5.8,
			en = 5.8
		}
		local var_16_1 = manager.audio:GetLocalizationFlag()

		if var_16_0[var_16_1] ~= nil then
			arg_16_1.duration_ = var_16_0[var_16_1]
		end

		SetActive(arg_16_1.tipsGo_, false)

		function arg_16_1.onSingleLineFinish_()
			arg_16_1.onSingleLineUpdate_ = nil
			arg_16_1.onSingleLineFinish_ = nil
			arg_16_1.state_ = "waiting"
		end

		function arg_16_1.playNext_(arg_18_0)
			if arg_18_0 == 1 then
				arg_16_0:Play104092005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = "1019ui_story"

			if arg_16_1.actors_[var_19_0] == nil then
				local var_19_1 = Asset.Load("Char/" .. "1019ui_story")

				if not isNil(var_19_1) then
					local var_19_2 = Object.Instantiate(Asset.Load("Char/" .. "1019ui_story"), arg_16_1.stage_.transform)

					var_19_2.name = var_19_0
					var_19_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_16_1.actors_[var_19_0] = var_19_2

					local var_19_3 = var_19_2:GetComponentInChildren(typeof(CharacterEffect))

					var_19_3.enabled = true

					local var_19_4 = GameObjectTools.GetOrAddComponent(var_19_2, typeof(DynamicBoneHelper))

					if var_19_4 then
						var_19_4:EnableDynamicBone(false)
					end

					arg_16_1:ShowWeapon(var_19_3.transform, false)

					arg_16_1.var_[var_19_0 .. "Animator"] = var_19_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_16_1.var_[var_19_0 .. "Animator"].applyRootMotion = true
					arg_16_1.var_[var_19_0 .. "LipSync"] = var_19_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_19_5 = arg_16_1.actors_["1019ui_story"]
			local var_19_6 = 0

			if var_19_6 < arg_16_1.time_ and arg_16_1.time_ <= var_19_6 + arg_19_0 and not isNil(var_19_5) and arg_16_1.var_.characterEffect1019ui_story == nil then
				arg_16_1.var_.characterEffect1019ui_story = var_19_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_19_7 = 0.1

			if var_19_6 <= arg_16_1.time_ and arg_16_1.time_ < var_19_6 + var_19_7 and not isNil(var_19_5) then
				local var_19_8 = (arg_16_1.time_ - var_19_6) / var_19_7

				if arg_16_1.var_.characterEffect1019ui_story and not isNil(var_19_5) then
					arg_16_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_16_1.time_ >= var_19_6 + var_19_7 and arg_16_1.time_ < var_19_6 + var_19_7 + arg_19_0 and not isNil(var_19_5) and arg_16_1.var_.characterEffect1019ui_story then
				arg_16_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_19_9 = arg_16_1.actors_["10001_tpose"]
			local var_19_10 = 0

			if var_19_10 < arg_16_1.time_ and arg_16_1.time_ <= var_19_10 + arg_19_0 and not isNil(var_19_9) and arg_16_1.var_.characterEffect10001_tpose == nil then
				arg_16_1.var_.characterEffect10001_tpose = var_19_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_19_11 = 0.1

			if var_19_10 <= arg_16_1.time_ and arg_16_1.time_ < var_19_10 + var_19_11 and not isNil(var_19_9) then
				local var_19_12 = (arg_16_1.time_ - var_19_10) / var_19_11

				if arg_16_1.var_.characterEffect10001_tpose and not isNil(var_19_9) then
					local var_19_13 = Mathf.Lerp(0, 0.5, var_19_12)

					arg_16_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_16_1.var_.characterEffect10001_tpose.fillRatio = var_19_13
				end
			end

			if arg_16_1.time_ >= var_19_10 + var_19_11 and arg_16_1.time_ < var_19_10 + var_19_11 + arg_19_0 and not isNil(var_19_9) and arg_16_1.var_.characterEffect10001_tpose then
				local var_19_14 = 0.5

				arg_16_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_16_1.var_.characterEffect10001_tpose.fillRatio = var_19_14
			end

			local var_19_15 = arg_16_1.actors_["10001_tpose"].transform
			local var_19_16 = 0

			if var_19_16 < arg_16_1.time_ and arg_16_1.time_ <= var_19_16 + arg_19_0 then
				arg_16_1.var_.moveOldPos10001_tpose = var_19_15.localPosition
			end

			local var_19_17 = 0.001

			if var_19_16 <= arg_16_1.time_ and arg_16_1.time_ < var_19_16 + var_19_17 then
				local var_19_18 = (arg_16_1.time_ - var_19_16) / var_19_17
				local var_19_19 = Vector3.New(0, 100, 0)

				var_19_15.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos10001_tpose, var_19_19, var_19_18)

				local var_19_20 = manager.ui.mainCamera.transform.position - var_19_15.position

				var_19_15.forward = Vector3.New(var_19_20.x, var_19_20.y, var_19_20.z)

				local var_19_21 = var_19_15.localEulerAngles

				var_19_21.z = 0
				var_19_21.x = 0
				var_19_15.localEulerAngles = var_19_21
			end

			if arg_16_1.time_ >= var_19_16 + var_19_17 and arg_16_1.time_ < var_19_16 + var_19_17 + arg_19_0 then
				var_19_15.localPosition = Vector3.New(0, 100, 0)

				local var_19_22 = manager.ui.mainCamera.transform.position - var_19_15.position

				var_19_15.forward = Vector3.New(var_19_22.x, var_19_22.y, var_19_22.z)

				local var_19_23 = var_19_15.localEulerAngles

				var_19_23.z = 0
				var_19_23.x = 0
				var_19_15.localEulerAngles = var_19_23
			end

			local var_19_24 = arg_16_1.actors_["1084ui_story"].transform
			local var_19_25 = 0

			if var_19_25 < arg_16_1.time_ and arg_16_1.time_ <= var_19_25 + arg_19_0 then
				arg_16_1.var_.moveOldPos1084ui_story = var_19_24.localPosition
			end

			local var_19_26 = 0.001

			if var_19_25 <= arg_16_1.time_ and arg_16_1.time_ < var_19_25 + var_19_26 then
				local var_19_27 = (arg_16_1.time_ - var_19_25) / var_19_26
				local var_19_28 = Vector3.New(0, 100, 0)

				var_19_24.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos1084ui_story, var_19_28, var_19_27)

				local var_19_29 = manager.ui.mainCamera.transform.position - var_19_24.position

				var_19_24.forward = Vector3.New(var_19_29.x, var_19_29.y, var_19_29.z)

				local var_19_30 = var_19_24.localEulerAngles

				var_19_30.z = 0
				var_19_30.x = 0
				var_19_24.localEulerAngles = var_19_30
			end

			if arg_16_1.time_ >= var_19_25 + var_19_26 and arg_16_1.time_ < var_19_25 + var_19_26 + arg_19_0 then
				var_19_24.localPosition = Vector3.New(0, 100, 0)

				local var_19_31 = manager.ui.mainCamera.transform.position - var_19_24.position

				var_19_24.forward = Vector3.New(var_19_31.x, var_19_31.y, var_19_31.z)

				local var_19_32 = var_19_24.localEulerAngles

				var_19_32.z = 0
				var_19_32.x = 0
				var_19_24.localEulerAngles = var_19_32
			end

			local var_19_33 = arg_16_1.actors_["1019ui_story"].transform
			local var_19_34 = 0

			if var_19_34 < arg_16_1.time_ and arg_16_1.time_ <= var_19_34 + arg_19_0 then
				arg_16_1.var_.moveOldPos1019ui_story = var_19_33.localPosition
			end

			local var_19_35 = 0.001

			if var_19_34 <= arg_16_1.time_ and arg_16_1.time_ < var_19_34 + var_19_35 then
				local var_19_36 = (arg_16_1.time_ - var_19_34) / var_19_35
				local var_19_37 = Vector3.New(0, -1.08, -5.9)

				var_19_33.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos1019ui_story, var_19_37, var_19_36)

				local var_19_38 = manager.ui.mainCamera.transform.position - var_19_33.position

				var_19_33.forward = Vector3.New(var_19_38.x, var_19_38.y, var_19_38.z)

				local var_19_39 = var_19_33.localEulerAngles

				var_19_39.z = 0
				var_19_39.x = 0
				var_19_33.localEulerAngles = var_19_39
			end

			if arg_16_1.time_ >= var_19_34 + var_19_35 and arg_16_1.time_ < var_19_34 + var_19_35 + arg_19_0 then
				var_19_33.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_19_40 = manager.ui.mainCamera.transform.position - var_19_33.position

				var_19_33.forward = Vector3.New(var_19_40.x, var_19_40.y, var_19_40.z)

				local var_19_41 = var_19_33.localEulerAngles

				var_19_41.z = 0
				var_19_41.x = 0
				var_19_33.localEulerAngles = var_19_41
			end

			local var_19_42 = 0

			if var_19_42 < arg_16_1.time_ and arg_16_1.time_ <= var_19_42 + arg_19_0 then
				arg_16_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_19_43 = 0

			if var_19_43 < arg_16_1.time_ and arg_16_1.time_ <= var_19_43 + arg_19_0 then
				arg_16_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_19_44 = 0
			local var_19_45 = 0.45

			if var_19_44 < arg_16_1.time_ and arg_16_1.time_ <= var_19_44 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, true)

				local var_19_46 = arg_16_1:FormatText(StoryNameCfg[13].name)

				arg_16_1.leftNameTxt_.text = var_19_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_1.leftNameTxt_.transform)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1.leftNameTxt_.text)
				SetActive(arg_16_1.iconTrs_.gameObject, false)
				arg_16_1.callingController_:SetSelectedState("normal")

				local var_19_47 = arg_16_1:GetWordFromCfg(104092004)
				local var_19_48 = arg_16_1:FormatText(var_19_47.content)

				arg_16_1.text_.text = var_19_48

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_49 = 18
				local var_19_50 = utf8.len(var_19_48)
				local var_19_51 = var_19_49 <= 0 and var_19_45 or var_19_45 * (var_19_50 / var_19_49)

				if var_19_51 > 0 and var_19_45 < var_19_51 then
					arg_16_1.talkMaxDuration = var_19_51

					if var_19_51 + var_19_44 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_51 + var_19_44
					end
				end

				arg_16_1.text_.text = var_19_48
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092004", "story_v_out_104092.awb") ~= 0 then
					local var_19_52 = manager.audio:GetVoiceLength("story_v_out_104092", "104092004", "story_v_out_104092.awb") / 1000

					if var_19_52 + var_19_44 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_52 + var_19_44
					end

					if var_19_47.prefab_name ~= "" and arg_16_1.actors_[var_19_47.prefab_name] ~= nil then
						local var_19_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_16_1.actors_[var_19_47.prefab_name].transform, "story_v_out_104092", "104092004", "story_v_out_104092.awb")

						arg_16_1:RecordAudio("104092004", var_19_53)
						arg_16_1:RecordAudio("104092004", var_19_53)
					else
						arg_16_1:AudioAction("play", "voice", "story_v_out_104092", "104092004", "story_v_out_104092.awb")
					end

					arg_16_1:RecordHistoryTalkVoice("story_v_out_104092", "104092004", "story_v_out_104092.awb")
				end

				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_54 = math.max(var_19_45, arg_16_1.talkMaxDuration)

			if var_19_44 <= arg_16_1.time_ and arg_16_1.time_ < var_19_44 + var_19_54 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_44) / var_19_54

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_44 + var_19_54 and arg_16_1.time_ < var_19_44 + var_19_54 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play104092005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 104092005
		arg_20_1.duration_ = 4.63

		local var_20_0 = {
			ja = 4.433,
			ko = 3.933,
			zh = 3.666,
			en = 4.633
		}
		local var_20_1 = manager.audio:GetLocalizationFlag()

		if var_20_0[var_20_1] ~= nil then
			arg_20_1.duration_ = var_20_0[var_20_1]
		end

		SetActive(arg_20_1.tipsGo_, false)

		function arg_20_1.onSingleLineFinish_()
			arg_20_1.onSingleLineUpdate_ = nil
			arg_20_1.onSingleLineFinish_ = nil
			arg_20_1.state_ = "waiting"
		end

		function arg_20_1.playNext_(arg_22_0)
			if arg_22_0 == 1 then
				arg_20_0:Play104092006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = "1036ui_story"

			if arg_20_1.actors_[var_23_0] == nil then
				local var_23_1 = Asset.Load("Char/" .. "1036ui_story")

				if not isNil(var_23_1) then
					local var_23_2 = Object.Instantiate(Asset.Load("Char/" .. "1036ui_story"), arg_20_1.stage_.transform)

					var_23_2.name = var_23_0
					var_23_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_20_1.actors_[var_23_0] = var_23_2

					local var_23_3 = var_23_2:GetComponentInChildren(typeof(CharacterEffect))

					var_23_3.enabled = true

					local var_23_4 = GameObjectTools.GetOrAddComponent(var_23_2, typeof(DynamicBoneHelper))

					if var_23_4 then
						var_23_4:EnableDynamicBone(false)
					end

					arg_20_1:ShowWeapon(var_23_3.transform, false)

					arg_20_1.var_[var_23_0 .. "Animator"] = var_23_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_20_1.var_[var_23_0 .. "Animator"].applyRootMotion = true
					arg_20_1.var_[var_23_0 .. "LipSync"] = var_23_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_23_5 = arg_20_1.actors_["1036ui_story"]
			local var_23_6 = 0

			if var_23_6 < arg_20_1.time_ and arg_20_1.time_ <= var_23_6 + arg_23_0 and not isNil(var_23_5) and arg_20_1.var_.characterEffect1036ui_story == nil then
				arg_20_1.var_.characterEffect1036ui_story = var_23_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_7 = 0.1

			if var_23_6 <= arg_20_1.time_ and arg_20_1.time_ < var_23_6 + var_23_7 and not isNil(var_23_5) then
				local var_23_8 = (arg_20_1.time_ - var_23_6) / var_23_7

				if arg_20_1.var_.characterEffect1036ui_story and not isNil(var_23_5) then
					arg_20_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_20_1.time_ >= var_23_6 + var_23_7 and arg_20_1.time_ < var_23_6 + var_23_7 + arg_23_0 and not isNil(var_23_5) and arg_20_1.var_.characterEffect1036ui_story then
				arg_20_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_23_9 = arg_20_1.actors_["1019ui_story"]
			local var_23_10 = 0

			if var_23_10 < arg_20_1.time_ and arg_20_1.time_ <= var_23_10 + arg_23_0 and not isNil(var_23_9) and arg_20_1.var_.characterEffect1019ui_story == nil then
				arg_20_1.var_.characterEffect1019ui_story = var_23_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_11 = 0.1

			if var_23_10 <= arg_20_1.time_ and arg_20_1.time_ < var_23_10 + var_23_11 and not isNil(var_23_9) then
				local var_23_12 = (arg_20_1.time_ - var_23_10) / var_23_11

				if arg_20_1.var_.characterEffect1019ui_story and not isNil(var_23_9) then
					local var_23_13 = Mathf.Lerp(0, 0.5, var_23_12)

					arg_20_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_20_1.var_.characterEffect1019ui_story.fillRatio = var_23_13
				end
			end

			if arg_20_1.time_ >= var_23_10 + var_23_11 and arg_20_1.time_ < var_23_10 + var_23_11 + arg_23_0 and not isNil(var_23_9) and arg_20_1.var_.characterEffect1019ui_story then
				local var_23_14 = 0.5

				arg_20_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_20_1.var_.characterEffect1019ui_story.fillRatio = var_23_14
			end

			local var_23_15 = arg_20_1.actors_["1019ui_story"].transform
			local var_23_16 = 0

			if var_23_16 < arg_20_1.time_ and arg_20_1.time_ <= var_23_16 + arg_23_0 then
				arg_20_1.var_.moveOldPos1019ui_story = var_23_15.localPosition
			end

			local var_23_17 = 0.001

			if var_23_16 <= arg_20_1.time_ and arg_20_1.time_ < var_23_16 + var_23_17 then
				local var_23_18 = (arg_20_1.time_ - var_23_16) / var_23_17
				local var_23_19 = Vector3.New(0, 100, 0)

				var_23_15.localPosition = Vector3.Lerp(arg_20_1.var_.moveOldPos1019ui_story, var_23_19, var_23_18)

				local var_23_20 = manager.ui.mainCamera.transform.position - var_23_15.position

				var_23_15.forward = Vector3.New(var_23_20.x, var_23_20.y, var_23_20.z)

				local var_23_21 = var_23_15.localEulerAngles

				var_23_21.z = 0
				var_23_21.x = 0
				var_23_15.localEulerAngles = var_23_21
			end

			if arg_20_1.time_ >= var_23_16 + var_23_17 and arg_20_1.time_ < var_23_16 + var_23_17 + arg_23_0 then
				var_23_15.localPosition = Vector3.New(0, 100, 0)

				local var_23_22 = manager.ui.mainCamera.transform.position - var_23_15.position

				var_23_15.forward = Vector3.New(var_23_22.x, var_23_22.y, var_23_22.z)

				local var_23_23 = var_23_15.localEulerAngles

				var_23_23.z = 0
				var_23_23.x = 0
				var_23_15.localEulerAngles = var_23_23
			end

			local var_23_24 = arg_20_1.actors_["1036ui_story"].transform
			local var_23_25 = 0

			if var_23_25 < arg_20_1.time_ and arg_20_1.time_ <= var_23_25 + arg_23_0 then
				arg_20_1.var_.moveOldPos1036ui_story = var_23_24.localPosition
			end

			local var_23_26 = 0.001

			if var_23_25 <= arg_20_1.time_ and arg_20_1.time_ < var_23_25 + var_23_26 then
				local var_23_27 = (arg_20_1.time_ - var_23_25) / var_23_26
				local var_23_28 = Vector3.New(0, -1.09, -5.78)

				var_23_24.localPosition = Vector3.Lerp(arg_20_1.var_.moveOldPos1036ui_story, var_23_28, var_23_27)

				local var_23_29 = manager.ui.mainCamera.transform.position - var_23_24.position

				var_23_24.forward = Vector3.New(var_23_29.x, var_23_29.y, var_23_29.z)

				local var_23_30 = var_23_24.localEulerAngles

				var_23_30.z = 0
				var_23_30.x = 0
				var_23_24.localEulerAngles = var_23_30
			end

			if arg_20_1.time_ >= var_23_25 + var_23_26 and arg_20_1.time_ < var_23_25 + var_23_26 + arg_23_0 then
				var_23_24.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_23_31 = manager.ui.mainCamera.transform.position - var_23_24.position

				var_23_24.forward = Vector3.New(var_23_31.x, var_23_31.y, var_23_31.z)

				local var_23_32 = var_23_24.localEulerAngles

				var_23_32.z = 0
				var_23_32.x = 0
				var_23_24.localEulerAngles = var_23_32
			end

			local var_23_33 = 0

			if var_23_33 < arg_20_1.time_ and arg_20_1.time_ <= var_23_33 + arg_23_0 then
				arg_20_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action7_1")
			end

			local var_23_34 = manager.ui.mainCamera.transform
			local var_23_35 = 0

			if var_23_35 < arg_20_1.time_ and arg_20_1.time_ <= var_23_35 + arg_23_0 then
				arg_20_1.var_.shakeOldPos = var_23_34.localPosition
			end

			local var_23_36 = 0.3

			if var_23_35 <= arg_20_1.time_ and arg_20_1.time_ < var_23_35 + var_23_36 then
				local var_23_37 = (arg_20_1.time_ - var_23_35) / 0.099
				local var_23_38, var_23_39 = math.modf(var_23_37)

				var_23_34.localPosition = Vector3.New(var_23_39 * 0.13, var_23_39 * 0.13, var_23_39 * 0.13) + arg_20_1.var_.shakeOldPos
			end

			if arg_20_1.time_ >= var_23_35 + var_23_36 and arg_20_1.time_ < var_23_35 + var_23_36 + arg_23_0 then
				var_23_34.localPosition = arg_20_1.var_.shakeOldPos
			end

			local var_23_40 = 0

			if var_23_40 < arg_20_1.time_ and arg_20_1.time_ <= var_23_40 + arg_23_0 then
				arg_20_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_23_41 = 0
			local var_23_42 = 0.35

			if var_23_41 < arg_20_1.time_ and arg_20_1.time_ <= var_23_41 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, true)

				local var_23_43 = arg_20_1:FormatText(StoryNameCfg[5].name)

				arg_20_1.leftNameTxt_.text = var_23_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_1.leftNameTxt_.transform)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1.leftNameTxt_.text)
				SetActive(arg_20_1.iconTrs_.gameObject, false)
				arg_20_1.callingController_:SetSelectedState("normal")

				local var_23_44 = arg_20_1:GetWordFromCfg(104092005)
				local var_23_45 = arg_20_1:FormatText(var_23_44.content)

				arg_20_1.text_.text = var_23_45

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_46 = 14
				local var_23_47 = utf8.len(var_23_45)
				local var_23_48 = var_23_46 <= 0 and var_23_42 or var_23_42 * (var_23_47 / var_23_46)

				if var_23_48 > 0 and var_23_42 < var_23_48 then
					arg_20_1.talkMaxDuration = var_23_48

					if var_23_48 + var_23_41 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_48 + var_23_41
					end
				end

				arg_20_1.text_.text = var_23_45
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092005", "story_v_out_104092.awb") ~= 0 then
					local var_23_49 = manager.audio:GetVoiceLength("story_v_out_104092", "104092005", "story_v_out_104092.awb") / 1000

					if var_23_49 + var_23_41 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_49 + var_23_41
					end

					if var_23_44.prefab_name ~= "" and arg_20_1.actors_[var_23_44.prefab_name] ~= nil then
						local var_23_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_20_1.actors_[var_23_44.prefab_name].transform, "story_v_out_104092", "104092005", "story_v_out_104092.awb")

						arg_20_1:RecordAudio("104092005", var_23_50)
						arg_20_1:RecordAudio("104092005", var_23_50)
					else
						arg_20_1:AudioAction("play", "voice", "story_v_out_104092", "104092005", "story_v_out_104092.awb")
					end

					arg_20_1:RecordHistoryTalkVoice("story_v_out_104092", "104092005", "story_v_out_104092.awb")
				end

				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_51 = math.max(var_23_42, arg_20_1.talkMaxDuration)

			if var_23_41 <= arg_20_1.time_ and arg_20_1.time_ < var_23_41 + var_23_51 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_41) / var_23_51

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_41 + var_23_51 and arg_20_1.time_ < var_23_41 + var_23_51 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play104092006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 104092006
		arg_24_1.duration_ = 3.63

		local var_24_0 = {
			ja = 3.166,
			ko = 2.666,
			zh = 3.4,
			en = 3.633
		}
		local var_24_1 = manager.audio:GetLocalizationFlag()

		if var_24_0[var_24_1] ~= nil then
			arg_24_1.duration_ = var_24_0[var_24_1]
		end

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play104092007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = 0
			local var_27_1 = 1

			if var_27_0 < arg_24_1.time_ and arg_24_1.time_ <= var_27_0 + arg_27_0 then
				local var_27_2 = "play"
				local var_27_3 = "effect"

				arg_24_1:AudioAction(var_27_2, var_27_3, "se_story", "se_story_quake", "")
			end

			local var_27_4 = arg_24_1.actors_["1084ui_story"]
			local var_27_5 = 0

			if var_27_5 < arg_24_1.time_ and arg_24_1.time_ <= var_27_5 + arg_27_0 and not isNil(var_27_4) and arg_24_1.var_.characterEffect1084ui_story == nil then
				arg_24_1.var_.characterEffect1084ui_story = var_27_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_6 = 0.1

			if var_27_5 <= arg_24_1.time_ and arg_24_1.time_ < var_27_5 + var_27_6 and not isNil(var_27_4) then
				local var_27_7 = (arg_24_1.time_ - var_27_5) / var_27_6

				if arg_24_1.var_.characterEffect1084ui_story and not isNil(var_27_4) then
					arg_24_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_24_1.time_ >= var_27_5 + var_27_6 and arg_24_1.time_ < var_27_5 + var_27_6 + arg_27_0 and not isNil(var_27_4) and arg_24_1.var_.characterEffect1084ui_story then
				arg_24_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_27_8 = arg_24_1.actors_["1036ui_story"]
			local var_27_9 = 0

			if var_27_9 < arg_24_1.time_ and arg_24_1.time_ <= var_27_9 + arg_27_0 and not isNil(var_27_8) and arg_24_1.var_.characterEffect1036ui_story == nil then
				arg_24_1.var_.characterEffect1036ui_story = var_27_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_10 = 0.1

			if var_27_9 <= arg_24_1.time_ and arg_24_1.time_ < var_27_9 + var_27_10 and not isNil(var_27_8) then
				local var_27_11 = (arg_24_1.time_ - var_27_9) / var_27_10

				if arg_24_1.var_.characterEffect1036ui_story and not isNil(var_27_8) then
					local var_27_12 = Mathf.Lerp(0, 0.5, var_27_11)

					arg_24_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_24_1.var_.characterEffect1036ui_story.fillRatio = var_27_12
				end
			end

			if arg_24_1.time_ >= var_27_9 + var_27_10 and arg_24_1.time_ < var_27_9 + var_27_10 + arg_27_0 and not isNil(var_27_8) and arg_24_1.var_.characterEffect1036ui_story then
				local var_27_13 = 0.5

				arg_24_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_24_1.var_.characterEffect1036ui_story.fillRatio = var_27_13
			end

			local var_27_14 = arg_24_1.actors_["1036ui_story"].transform
			local var_27_15 = 0

			if var_27_15 < arg_24_1.time_ and arg_24_1.time_ <= var_27_15 + arg_27_0 then
				arg_24_1.var_.moveOldPos1036ui_story = var_27_14.localPosition
			end

			local var_27_16 = 0.001

			if var_27_15 <= arg_24_1.time_ and arg_24_1.time_ < var_27_15 + var_27_16 then
				local var_27_17 = (arg_24_1.time_ - var_27_15) / var_27_16
				local var_27_18 = Vector3.New(0, 100, 0)

				var_27_14.localPosition = Vector3.Lerp(arg_24_1.var_.moveOldPos1036ui_story, var_27_18, var_27_17)

				local var_27_19 = manager.ui.mainCamera.transform.position - var_27_14.position

				var_27_14.forward = Vector3.New(var_27_19.x, var_27_19.y, var_27_19.z)

				local var_27_20 = var_27_14.localEulerAngles

				var_27_20.z = 0
				var_27_20.x = 0
				var_27_14.localEulerAngles = var_27_20
			end

			if arg_24_1.time_ >= var_27_15 + var_27_16 and arg_24_1.time_ < var_27_15 + var_27_16 + arg_27_0 then
				var_27_14.localPosition = Vector3.New(0, 100, 0)

				local var_27_21 = manager.ui.mainCamera.transform.position - var_27_14.position

				var_27_14.forward = Vector3.New(var_27_21.x, var_27_21.y, var_27_21.z)

				local var_27_22 = var_27_14.localEulerAngles

				var_27_22.z = 0
				var_27_22.x = 0
				var_27_14.localEulerAngles = var_27_22
			end

			local var_27_23 = arg_24_1.actors_["1084ui_story"].transform
			local var_27_24 = 0

			if var_27_24 < arg_24_1.time_ and arg_24_1.time_ <= var_27_24 + arg_27_0 then
				arg_24_1.var_.moveOldPos1084ui_story = var_27_23.localPosition
			end

			local var_27_25 = 0.001

			if var_27_24 <= arg_24_1.time_ and arg_24_1.time_ < var_27_24 + var_27_25 then
				local var_27_26 = (arg_24_1.time_ - var_27_24) / var_27_25
				local var_27_27 = Vector3.New(0, -0.97, -6)

				var_27_23.localPosition = Vector3.Lerp(arg_24_1.var_.moveOldPos1084ui_story, var_27_27, var_27_26)

				local var_27_28 = manager.ui.mainCamera.transform.position - var_27_23.position

				var_27_23.forward = Vector3.New(var_27_28.x, var_27_28.y, var_27_28.z)

				local var_27_29 = var_27_23.localEulerAngles

				var_27_29.z = 0
				var_27_29.x = 0
				var_27_23.localEulerAngles = var_27_29
			end

			if arg_24_1.time_ >= var_27_24 + var_27_25 and arg_24_1.time_ < var_27_24 + var_27_25 + arg_27_0 then
				var_27_23.localPosition = Vector3.New(0, -0.97, -6)

				local var_27_30 = manager.ui.mainCamera.transform.position - var_27_23.position

				var_27_23.forward = Vector3.New(var_27_30.x, var_27_30.y, var_27_30.z)

				local var_27_31 = var_27_23.localEulerAngles

				var_27_31.z = 0
				var_27_31.x = 0
				var_27_23.localEulerAngles = var_27_31
			end

			local var_27_32 = 0

			if var_27_32 < arg_24_1.time_ and arg_24_1.time_ <= var_27_32 + arg_27_0 then
				arg_24_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_27_33 = manager.ui.mainCamera.transform
			local var_27_34 = 0

			if var_27_34 < arg_24_1.time_ and arg_24_1.time_ <= var_27_34 + arg_27_0 then
				arg_24_1.var_.shakeOldPos = var_27_33.localPosition
			end

			local var_27_35 = 0.3

			if var_27_34 <= arg_24_1.time_ and arg_24_1.time_ < var_27_34 + var_27_35 then
				local var_27_36 = (arg_24_1.time_ - var_27_34) / 0.099
				local var_27_37, var_27_38 = math.modf(var_27_36)

				var_27_33.localPosition = Vector3.New(var_27_38 * 0.13, var_27_38 * 0.13, var_27_38 * 0.13) + arg_24_1.var_.shakeOldPos
			end

			if arg_24_1.time_ >= var_27_34 + var_27_35 and arg_24_1.time_ < var_27_34 + var_27_35 + arg_27_0 then
				var_27_33.localPosition = arg_24_1.var_.shakeOldPos
			end

			local var_27_39 = 0

			if var_27_39 < arg_24_1.time_ and arg_24_1.time_ <= var_27_39 + arg_27_0 then
				arg_24_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_27_40 = 0
			local var_27_41 = 0.3

			if var_27_40 < arg_24_1.time_ and arg_24_1.time_ <= var_27_40 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0
				arg_24_1.dialogCg_.alpha = 1

				arg_24_1.dialog_:SetActive(true)
				SetActive(arg_24_1.leftNameGo_, true)

				local var_27_42 = arg_24_1:FormatText(StoryNameCfg[6].name)

				arg_24_1.leftNameTxt_.text = var_27_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_1.leftNameTxt_.transform)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1.leftNameTxt_.text)
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_43 = arg_24_1:GetWordFromCfg(104092006)
				local var_27_44 = arg_24_1:FormatText(var_27_43.content)

				arg_24_1.text_.text = var_27_44

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_45 = 12
				local var_27_46 = utf8.len(var_27_44)
				local var_27_47 = var_27_45 <= 0 and var_27_41 or var_27_41 * (var_27_46 / var_27_45)

				if var_27_47 > 0 and var_27_41 < var_27_47 then
					arg_24_1.talkMaxDuration = var_27_47

					if var_27_47 + var_27_40 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_47 + var_27_40
					end
				end

				arg_24_1.text_.text = var_27_44
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092006", "story_v_out_104092.awb") ~= 0 then
					local var_27_48 = manager.audio:GetVoiceLength("story_v_out_104092", "104092006", "story_v_out_104092.awb") / 1000

					if var_27_48 + var_27_40 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_48 + var_27_40
					end

					if var_27_43.prefab_name ~= "" and arg_24_1.actors_[var_27_43.prefab_name] ~= nil then
						local var_27_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_24_1.actors_[var_27_43.prefab_name].transform, "story_v_out_104092", "104092006", "story_v_out_104092.awb")

						arg_24_1:RecordAudio("104092006", var_27_49)
						arg_24_1:RecordAudio("104092006", var_27_49)
					else
						arg_24_1:AudioAction("play", "voice", "story_v_out_104092", "104092006", "story_v_out_104092.awb")
					end

					arg_24_1:RecordHistoryTalkVoice("story_v_out_104092", "104092006", "story_v_out_104092.awb")
				end

				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_50 = math.max(var_27_41, arg_24_1.talkMaxDuration)

			if var_27_40 <= arg_24_1.time_ and arg_24_1.time_ < var_27_40 + var_27_50 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_40) / var_27_50

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_40 + var_27_50 and arg_24_1.time_ < var_27_40 + var_27_50 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play104092007 = function(arg_28_0, arg_28_1)
		arg_28_1.time_ = 0
		arg_28_1.frameCnt_ = 0
		arg_28_1.state_ = "playing"
		arg_28_1.curTalkId_ = 104092007
		arg_28_1.duration_ = 2

		SetActive(arg_28_1.tipsGo_, false)

		function arg_28_1.onSingleLineFinish_()
			arg_28_1.onSingleLineUpdate_ = nil
			arg_28_1.onSingleLineFinish_ = nil
			arg_28_1.state_ = "waiting"
		end

		function arg_28_1.playNext_(arg_30_0)
			if arg_30_0 == 1 then
				arg_28_0:Play104092008(arg_28_1)
			end
		end

		function arg_28_1.onSingleLineUpdate_(arg_31_0)
			local var_31_0 = manager.ui.mainCamera.transform
			local var_31_1 = 0

			if var_31_1 < arg_28_1.time_ and arg_28_1.time_ <= var_31_1 + arg_31_0 then
				arg_28_1.var_.shakeOldPosMainCamera = var_31_0.localPosition
			end

			local var_31_2 = 0.600000023841858

			if var_31_1 <= arg_28_1.time_ and arg_28_1.time_ < var_31_1 + var_31_2 then
				local var_31_3 = (arg_28_1.time_ - var_31_1) / 0.066
				local var_31_4, var_31_5 = math.modf(var_31_3)

				var_31_0.localPosition = Vector3.New(var_31_5 * 0.13, var_31_5 * 0.13, var_31_5 * 0.13) + arg_28_1.var_.shakeOldPosMainCamera
			end

			if arg_28_1.time_ >= var_31_1 + var_31_2 and arg_28_1.time_ < var_31_1 + var_31_2 + arg_31_0 then
				var_31_0.localPosition = arg_28_1.var_.shakeOldPosMainCamera
			end

			local var_31_6 = 0

			if var_31_6 < arg_28_1.time_ and arg_28_1.time_ <= var_31_6 + arg_31_0 then
				arg_28_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4134")
			end

			local var_31_7 = manager.ui.mainCamera.transform
			local var_31_8 = 0

			if var_31_8 < arg_28_1.time_ and arg_28_1.time_ <= var_31_8 + arg_31_0 then
				arg_28_1.var_.shakeOldPos = var_31_7.localPosition
			end

			local var_31_9 = 0.3

			if var_31_8 <= arg_28_1.time_ and arg_28_1.time_ < var_31_8 + var_31_9 then
				local var_31_10 = (arg_28_1.time_ - var_31_8) / 0.066
				local var_31_11, var_31_12 = math.modf(var_31_10)

				var_31_7.localPosition = Vector3.New(var_31_12 * 0.13, var_31_12 * 0.13, var_31_12 * 0.13) + arg_28_1.var_.shakeOldPos
			end

			if arg_28_1.time_ >= var_31_8 + var_31_9 and arg_28_1.time_ < var_31_8 + var_31_9 + arg_31_0 then
				var_31_7.localPosition = arg_28_1.var_.shakeOldPos
			end

			local var_31_13 = 0

			if var_31_13 < arg_28_1.time_ and arg_28_1.time_ <= var_31_13 + arg_31_0 then
				arg_28_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_31_14 = 0
			local var_31_15 = 0.125

			if var_31_14 < arg_28_1.time_ and arg_28_1.time_ <= var_31_14 + arg_31_0 then
				arg_28_1.talkMaxDuration = 0
				arg_28_1.dialogCg_.alpha = 1

				arg_28_1.dialog_:SetActive(true)
				SetActive(arg_28_1.leftNameGo_, true)

				local var_31_16 = arg_28_1:FormatText(StoryNameCfg[6].name)

				arg_28_1.leftNameTxt_.text = var_31_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_28_1.leftNameTxt_.transform)

				arg_28_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_28_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_28_1:RecordName(arg_28_1.leftNameTxt_.text)
				SetActive(arg_28_1.iconTrs_.gameObject, false)
				arg_28_1.callingController_:SetSelectedState("normal")

				local var_31_17 = arg_28_1:GetWordFromCfg(104092007)
				local var_31_18 = arg_28_1:FormatText(var_31_17.content)

				arg_28_1.text_.text = var_31_18

				LuaForUtil.ClearLinePrefixSymbol(arg_28_1.text_)

				local var_31_19 = 5
				local var_31_20 = utf8.len(var_31_18)
				local var_31_21 = var_31_19 <= 0 and var_31_15 or var_31_15 * (var_31_20 / var_31_19)

				if var_31_21 > 0 and var_31_15 < var_31_21 then
					arg_28_1.talkMaxDuration = var_31_21

					if var_31_21 + var_31_14 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_21 + var_31_14
					end
				end

				arg_28_1.text_.text = var_31_18
				arg_28_1.typewritter.percent = 0

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092007", "story_v_out_104092.awb") ~= 0 then
					local var_31_22 = manager.audio:GetVoiceLength("story_v_out_104092", "104092007", "story_v_out_104092.awb") / 1000

					if var_31_22 + var_31_14 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_22 + var_31_14
					end

					if var_31_17.prefab_name ~= "" and arg_28_1.actors_[var_31_17.prefab_name] ~= nil then
						local var_31_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_28_1.actors_[var_31_17.prefab_name].transform, "story_v_out_104092", "104092007", "story_v_out_104092.awb")

						arg_28_1:RecordAudio("104092007", var_31_23)
						arg_28_1:RecordAudio("104092007", var_31_23)
					else
						arg_28_1:AudioAction("play", "voice", "story_v_out_104092", "104092007", "story_v_out_104092.awb")
					end

					arg_28_1:RecordHistoryTalkVoice("story_v_out_104092", "104092007", "story_v_out_104092.awb")
				end

				arg_28_1:RecordContent(arg_28_1.text_.text)
			end

			local var_31_24 = math.max(var_31_15, arg_28_1.talkMaxDuration)

			if var_31_14 <= arg_28_1.time_ and arg_28_1.time_ < var_31_14 + var_31_24 then
				arg_28_1.typewritter.percent = (arg_28_1.time_ - var_31_14) / var_31_24

				arg_28_1.typewritter:SetDirty()
			end

			if arg_28_1.time_ >= var_31_14 + var_31_24 and arg_28_1.time_ < var_31_14 + var_31_24 + arg_31_0 then
				arg_28_1.typewritter.percent = 1

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(true)
			end
		end
	end,
	Play104092008 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 104092008
		arg_32_1.duration_ = 2.53

		local var_32_0 = {
			ja = 2.533,
			ko = 1.966,
			zh = 2.1,
			en = 2.3
		}
		local var_32_1 = manager.audio:GetLocalizationFlag()

		if var_32_0[var_32_1] ~= nil then
			arg_32_1.duration_ = var_32_0[var_32_1]
		end

		SetActive(arg_32_1.tipsGo_, false)

		function arg_32_1.onSingleLineFinish_()
			arg_32_1.onSingleLineUpdate_ = nil
			arg_32_1.onSingleLineFinish_ = nil
			arg_32_1.state_ = "waiting"
		end

		function arg_32_1.playNext_(arg_34_0)
			if arg_34_0 == 1 then
				arg_32_0:Play104092009(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = arg_32_1.actors_["1084ui_story"]
			local var_35_1 = 0

			if var_35_1 < arg_32_1.time_ and arg_32_1.time_ <= var_35_1 + arg_35_0 and not isNil(var_35_0) and arg_32_1.var_.characterEffect1084ui_story == nil then
				arg_32_1.var_.characterEffect1084ui_story = var_35_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_35_2 = 0.1

			if var_35_1 <= arg_32_1.time_ and arg_32_1.time_ < var_35_1 + var_35_2 and not isNil(var_35_0) then
				local var_35_3 = (arg_32_1.time_ - var_35_1) / var_35_2

				if arg_32_1.var_.characterEffect1084ui_story and not isNil(var_35_0) then
					local var_35_4 = Mathf.Lerp(0, 0.5, var_35_3)

					arg_32_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_32_1.var_.characterEffect1084ui_story.fillRatio = var_35_4
				end
			end

			if arg_32_1.time_ >= var_35_1 + var_35_2 and arg_32_1.time_ < var_35_1 + var_35_2 + arg_35_0 and not isNil(var_35_0) and arg_32_1.var_.characterEffect1084ui_story then
				local var_35_5 = 0.5

				arg_32_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_32_1.var_.characterEffect1084ui_story.fillRatio = var_35_5
			end

			local var_35_6 = arg_32_1.actors_["1084ui_story"].transform
			local var_35_7 = 0

			if var_35_7 < arg_32_1.time_ and arg_32_1.time_ <= var_35_7 + arg_35_0 then
				arg_32_1.var_.moveOldPos1084ui_story = var_35_6.localPosition
			end

			local var_35_8 = 0.001

			if var_35_7 <= arg_32_1.time_ and arg_32_1.time_ < var_35_7 + var_35_8 then
				local var_35_9 = (arg_32_1.time_ - var_35_7) / var_35_8
				local var_35_10 = Vector3.New(0, 100, 0)

				var_35_6.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos1084ui_story, var_35_10, var_35_9)

				local var_35_11 = manager.ui.mainCamera.transform.position - var_35_6.position

				var_35_6.forward = Vector3.New(var_35_11.x, var_35_11.y, var_35_11.z)

				local var_35_12 = var_35_6.localEulerAngles

				var_35_12.z = 0
				var_35_12.x = 0
				var_35_6.localEulerAngles = var_35_12
			end

			if arg_32_1.time_ >= var_35_7 + var_35_8 and arg_32_1.time_ < var_35_7 + var_35_8 + arg_35_0 then
				var_35_6.localPosition = Vector3.New(0, 100, 0)

				local var_35_13 = manager.ui.mainCamera.transform.position - var_35_6.position

				var_35_6.forward = Vector3.New(var_35_13.x, var_35_13.y, var_35_13.z)

				local var_35_14 = var_35_6.localEulerAngles

				var_35_14.z = 0
				var_35_14.x = 0
				var_35_6.localEulerAngles = var_35_14
			end

			local var_35_15 = 0
			local var_35_16 = 0.225

			if var_35_15 < arg_32_1.time_ and arg_32_1.time_ <= var_35_15 + arg_35_0 then
				arg_32_1.talkMaxDuration = 0
				arg_32_1.dialogCg_.alpha = 1

				arg_32_1.dialog_:SetActive(true)
				SetActive(arg_32_1.leftNameGo_, true)

				local var_35_17 = arg_32_1:FormatText(StoryNameCfg[13].name)

				arg_32_1.leftNameTxt_.text = var_35_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_32_1.leftNameTxt_.transform)

				arg_32_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_32_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_32_1:RecordName(arg_32_1.leftNameTxt_.text)
				SetActive(arg_32_1.iconTrs_.gameObject, true)
				arg_32_1.iconController_:SetSelectedState("hero")

				arg_32_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_32_1.callingController_:SetSelectedState("normal")

				arg_32_1.keyicon_.color = Color.New(1, 1, 1)
				arg_32_1.icon_.color = Color.New(1, 1, 1)

				local var_35_18 = arg_32_1:GetWordFromCfg(104092008)
				local var_35_19 = arg_32_1:FormatText(var_35_18.content)

				arg_32_1.text_.text = var_35_19

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_20 = 9
				local var_35_21 = utf8.len(var_35_19)
				local var_35_22 = var_35_20 <= 0 and var_35_16 or var_35_16 * (var_35_21 / var_35_20)

				if var_35_22 > 0 and var_35_16 < var_35_22 then
					arg_32_1.talkMaxDuration = var_35_22

					if var_35_22 + var_35_15 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_22 + var_35_15
					end
				end

				arg_32_1.text_.text = var_35_19
				arg_32_1.typewritter.percent = 0

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092008", "story_v_out_104092.awb") ~= 0 then
					local var_35_23 = manager.audio:GetVoiceLength("story_v_out_104092", "104092008", "story_v_out_104092.awb") / 1000

					if var_35_23 + var_35_15 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_23 + var_35_15
					end

					if var_35_18.prefab_name ~= "" and arg_32_1.actors_[var_35_18.prefab_name] ~= nil then
						local var_35_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_32_1.actors_[var_35_18.prefab_name].transform, "story_v_out_104092", "104092008", "story_v_out_104092.awb")

						arg_32_1:RecordAudio("104092008", var_35_24)
						arg_32_1:RecordAudio("104092008", var_35_24)
					else
						arg_32_1:AudioAction("play", "voice", "story_v_out_104092", "104092008", "story_v_out_104092.awb")
					end

					arg_32_1:RecordHistoryTalkVoice("story_v_out_104092", "104092008", "story_v_out_104092.awb")
				end

				arg_32_1:RecordContent(arg_32_1.text_.text)
			end

			local var_35_25 = math.max(var_35_16, arg_32_1.talkMaxDuration)

			if var_35_15 <= arg_32_1.time_ and arg_32_1.time_ < var_35_15 + var_35_25 then
				arg_32_1.typewritter.percent = (arg_32_1.time_ - var_35_15) / var_35_25

				arg_32_1.typewritter:SetDirty()
			end

			if arg_32_1.time_ >= var_35_15 + var_35_25 and arg_32_1.time_ < var_35_15 + var_35_25 + arg_35_0 then
				arg_32_1.typewritter.percent = 1

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(true)
			end
		end
	end,
	Play104092009 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 104092009
		arg_36_1.duration_ = 3.5

		local var_36_0 = {
			ja = 3.5,
			ko = 3.033,
			zh = 2.866,
			en = 3.1
		}
		local var_36_1 = manager.audio:GetLocalizationFlag()

		if var_36_0[var_36_1] ~= nil then
			arg_36_1.duration_ = var_36_0[var_36_1]
		end

		SetActive(arg_36_1.tipsGo_, false)

		function arg_36_1.onSingleLineFinish_()
			arg_36_1.onSingleLineUpdate_ = nil
			arg_36_1.onSingleLineFinish_ = nil
			arg_36_1.state_ = "waiting"
		end

		function arg_36_1.playNext_(arg_38_0)
			if arg_38_0 == 1 then
				arg_36_0:Play104092010(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = manager.ui.mainCamera.transform
			local var_39_1 = 0

			if var_39_1 < arg_36_1.time_ and arg_36_1.time_ <= var_39_1 + arg_39_0 then
				arg_36_1.var_.shakeOldPosMainCamera = var_39_0.localPosition
			end

			local var_39_2 = 0.600000023841858

			if var_39_1 <= arg_36_1.time_ and arg_36_1.time_ < var_39_1 + var_39_2 then
				local var_39_3 = (arg_36_1.time_ - var_39_1) / 0.066
				local var_39_4, var_39_5 = math.modf(var_39_3)

				var_39_0.localPosition = Vector3.New(var_39_5 * 0.13, var_39_5 * 0.13, var_39_5 * 0.13) + arg_36_1.var_.shakeOldPosMainCamera
			end

			if arg_36_1.time_ >= var_39_1 + var_39_2 and arg_36_1.time_ < var_39_1 + var_39_2 + arg_39_0 then
				var_39_0.localPosition = arg_36_1.var_.shakeOldPosMainCamera
			end

			local var_39_6 = 0
			local var_39_7 = 0.325

			if var_39_6 < arg_36_1.time_ and arg_36_1.time_ <= var_39_6 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0
				arg_36_1.dialogCg_.alpha = 1

				arg_36_1.dialog_:SetActive(true)
				SetActive(arg_36_1.leftNameGo_, true)

				local var_39_8 = arg_36_1:FormatText(StoryNameCfg[31].name)

				arg_36_1.leftNameTxt_.text = var_39_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_36_1.leftNameTxt_.transform)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1.leftNameTxt_.text)
				SetActive(arg_36_1.iconTrs_.gameObject, true)
				arg_36_1.iconController_:SetSelectedState("hero")

				arg_36_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_36_1.callingController_:SetSelectedState("normal")

				arg_36_1.keyicon_.color = Color.New(1, 1, 1)
				arg_36_1.icon_.color = Color.New(1, 1, 1)

				local var_39_9 = arg_36_1:GetWordFromCfg(104092009)
				local var_39_10 = arg_36_1:FormatText(var_39_9.content)

				arg_36_1.text_.text = var_39_10

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_11 = 13
				local var_39_12 = utf8.len(var_39_10)
				local var_39_13 = var_39_11 <= 0 and var_39_7 or var_39_7 * (var_39_12 / var_39_11)

				if var_39_13 > 0 and var_39_7 < var_39_13 then
					arg_36_1.talkMaxDuration = var_39_13

					if var_39_13 + var_39_6 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_13 + var_39_6
					end
				end

				arg_36_1.text_.text = var_39_10
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092009", "story_v_out_104092.awb") ~= 0 then
					local var_39_14 = manager.audio:GetVoiceLength("story_v_out_104092", "104092009", "story_v_out_104092.awb") / 1000

					if var_39_14 + var_39_6 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_14 + var_39_6
					end

					if var_39_9.prefab_name ~= "" and arg_36_1.actors_[var_39_9.prefab_name] ~= nil then
						local var_39_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_36_1.actors_[var_39_9.prefab_name].transform, "story_v_out_104092", "104092009", "story_v_out_104092.awb")

						arg_36_1:RecordAudio("104092009", var_39_15)
						arg_36_1:RecordAudio("104092009", var_39_15)
					else
						arg_36_1:AudioAction("play", "voice", "story_v_out_104092", "104092009", "story_v_out_104092.awb")
					end

					arg_36_1:RecordHistoryTalkVoice("story_v_out_104092", "104092009", "story_v_out_104092.awb")
				end

				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_16 = math.max(var_39_7, arg_36_1.talkMaxDuration)

			if var_39_6 <= arg_36_1.time_ and arg_36_1.time_ < var_39_6 + var_39_16 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_6) / var_39_16

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_6 + var_39_16 and arg_36_1.time_ < var_39_6 + var_39_16 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play104092010 = function(arg_40_0, arg_40_1)
		arg_40_1.time_ = 0
		arg_40_1.frameCnt_ = 0
		arg_40_1.state_ = "playing"
		arg_40_1.curTalkId_ = 104092010
		arg_40_1.duration_ = 11.9

		local var_40_0 = {
			ja = 8.966,
			ko = 6.9,
			zh = 11.9,
			en = 8.533
		}
		local var_40_1 = manager.audio:GetLocalizationFlag()

		if var_40_0[var_40_1] ~= nil then
			arg_40_1.duration_ = var_40_0[var_40_1]
		end

		SetActive(arg_40_1.tipsGo_, false)

		function arg_40_1.onSingleLineFinish_()
			arg_40_1.onSingleLineUpdate_ = nil
			arg_40_1.onSingleLineFinish_ = nil
			arg_40_1.state_ = "waiting"
		end

		function arg_40_1.playNext_(arg_42_0)
			if arg_42_0 == 1 then
				arg_40_0:Play104092011(arg_40_1)
			end
		end

		function arg_40_1.onSingleLineUpdate_(arg_43_0)
			local var_43_0 = arg_40_1.actors_["1019ui_story"].transform
			local var_43_1 = 0

			if var_43_1 < arg_40_1.time_ and arg_40_1.time_ <= var_43_1 + arg_43_0 then
				arg_40_1.var_.moveOldPos1019ui_story = var_43_0.localPosition
			end

			local var_43_2 = 0.001

			if var_43_1 <= arg_40_1.time_ and arg_40_1.time_ < var_43_1 + var_43_2 then
				local var_43_3 = (arg_40_1.time_ - var_43_1) / var_43_2
				local var_43_4 = Vector3.New(0, 100, 0)

				var_43_0.localPosition = Vector3.Lerp(arg_40_1.var_.moveOldPos1019ui_story, var_43_4, var_43_3)

				local var_43_5 = manager.ui.mainCamera.transform.position - var_43_0.position

				var_43_0.forward = Vector3.New(var_43_5.x, var_43_5.y, var_43_5.z)

				local var_43_6 = var_43_0.localEulerAngles

				var_43_6.z = 0
				var_43_6.x = 0
				var_43_0.localEulerAngles = var_43_6
			end

			if arg_40_1.time_ >= var_43_1 + var_43_2 and arg_40_1.time_ < var_43_1 + var_43_2 + arg_43_0 then
				var_43_0.localPosition = Vector3.New(0, 100, 0)

				local var_43_7 = manager.ui.mainCamera.transform.position - var_43_0.position

				var_43_0.forward = Vector3.New(var_43_7.x, var_43_7.y, var_43_7.z)

				local var_43_8 = var_43_0.localEulerAngles

				var_43_8.z = 0
				var_43_8.x = 0
				var_43_0.localEulerAngles = var_43_8
			end

			local var_43_9 = 0
			local var_43_10 = 0.75

			if var_43_9 < arg_40_1.time_ and arg_40_1.time_ <= var_43_9 + arg_43_0 then
				arg_40_1.talkMaxDuration = 0
				arg_40_1.dialogCg_.alpha = 1

				arg_40_1.dialog_:SetActive(true)
				SetActive(arg_40_1.leftNameGo_, true)

				local var_43_11 = arg_40_1:FormatText(StoryNameCfg[63].name)

				arg_40_1.leftNameTxt_.text = var_43_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_40_1.leftNameTxt_.transform)

				arg_40_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_40_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_40_1:RecordName(arg_40_1.leftNameTxt_.text)
				SetActive(arg_40_1.iconTrs_.gameObject, true)
				arg_40_1.iconController_:SetSelectedState("hero")

				arg_40_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4012")

				arg_40_1.callingController_:SetSelectedState("normal")

				arg_40_1.keyicon_.color = Color.New(1, 1, 1)
				arg_40_1.icon_.color = Color.New(1, 1, 1)

				local var_43_12 = arg_40_1:GetWordFromCfg(104092010)
				local var_43_13 = arg_40_1:FormatText(var_43_12.content)

				arg_40_1.text_.text = var_43_13

				LuaForUtil.ClearLinePrefixSymbol(arg_40_1.text_)

				local var_43_14 = 30
				local var_43_15 = utf8.len(var_43_13)
				local var_43_16 = var_43_14 <= 0 and var_43_10 or var_43_10 * (var_43_15 / var_43_14)

				if var_43_16 > 0 and var_43_10 < var_43_16 then
					arg_40_1.talkMaxDuration = var_43_16

					if var_43_16 + var_43_9 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_16 + var_43_9
					end
				end

				arg_40_1.text_.text = var_43_13
				arg_40_1.typewritter.percent = 0

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092010", "story_v_out_104092.awb") ~= 0 then
					local var_43_17 = manager.audio:GetVoiceLength("story_v_out_104092", "104092010", "story_v_out_104092.awb") / 1000

					if var_43_17 + var_43_9 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_17 + var_43_9
					end

					if var_43_12.prefab_name ~= "" and arg_40_1.actors_[var_43_12.prefab_name] ~= nil then
						local var_43_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_40_1.actors_[var_43_12.prefab_name].transform, "story_v_out_104092", "104092010", "story_v_out_104092.awb")

						arg_40_1:RecordAudio("104092010", var_43_18)
						arg_40_1:RecordAudio("104092010", var_43_18)
					else
						arg_40_1:AudioAction("play", "voice", "story_v_out_104092", "104092010", "story_v_out_104092.awb")
					end

					arg_40_1:RecordHistoryTalkVoice("story_v_out_104092", "104092010", "story_v_out_104092.awb")
				end

				arg_40_1:RecordContent(arg_40_1.text_.text)
			end

			local var_43_19 = math.max(var_43_10, arg_40_1.talkMaxDuration)

			if var_43_9 <= arg_40_1.time_ and arg_40_1.time_ < var_43_9 + var_43_19 then
				arg_40_1.typewritter.percent = (arg_40_1.time_ - var_43_9) / var_43_19

				arg_40_1.typewritter:SetDirty()
			end

			if arg_40_1.time_ >= var_43_9 + var_43_19 and arg_40_1.time_ < var_43_9 + var_43_19 + arg_43_0 then
				arg_40_1.typewritter.percent = 1

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(true)
			end
		end
	end,
	Play104092011 = function(arg_44_0, arg_44_1)
		arg_44_1.time_ = 0
		arg_44_1.frameCnt_ = 0
		arg_44_1.state_ = "playing"
		arg_44_1.curTalkId_ = 104092011
		arg_44_1.duration_ = 5

		SetActive(arg_44_1.tipsGo_, false)

		function arg_44_1.onSingleLineFinish_()
			arg_44_1.onSingleLineUpdate_ = nil
			arg_44_1.onSingleLineFinish_ = nil
			arg_44_1.state_ = "waiting"
		end

		function arg_44_1.playNext_(arg_46_0)
			if arg_46_0 == 1 then
				arg_44_0:Play104092012(arg_44_1)
			end
		end

		function arg_44_1.onSingleLineUpdate_(arg_47_0)
			local var_47_0 = 0
			local var_47_1 = 1.825

			if var_47_0 < arg_44_1.time_ and arg_44_1.time_ <= var_47_0 + arg_47_0 then
				arg_44_1.talkMaxDuration = 0
				arg_44_1.dialogCg_.alpha = 1

				arg_44_1.dialog_:SetActive(true)
				SetActive(arg_44_1.leftNameGo_, false)

				arg_44_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_44_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_44_1:RecordName(arg_44_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_44_1.iconTrs_.gameObject, false)
				arg_44_1.callingController_:SetSelectedState("normal")

				local var_47_2 = arg_44_1:GetWordFromCfg(104092011)
				local var_47_3 = arg_44_1:FormatText(var_47_2.content)

				arg_44_1.text_.text = var_47_3

				LuaForUtil.ClearLinePrefixSymbol(arg_44_1.text_)

				local var_47_4 = 73
				local var_47_5 = utf8.len(var_47_3)
				local var_47_6 = var_47_4 <= 0 and var_47_1 or var_47_1 * (var_47_5 / var_47_4)

				if var_47_6 > 0 and var_47_1 < var_47_6 then
					arg_44_1.talkMaxDuration = var_47_6

					if var_47_6 + var_47_0 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_6 + var_47_0
					end
				end

				arg_44_1.text_.text = var_47_3
				arg_44_1.typewritter.percent = 0

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(false)
				arg_44_1:RecordContent(arg_44_1.text_.text)
			end

			local var_47_7 = math.max(var_47_1, arg_44_1.talkMaxDuration)

			if var_47_0 <= arg_44_1.time_ and arg_44_1.time_ < var_47_0 + var_47_7 then
				arg_44_1.typewritter.percent = (arg_44_1.time_ - var_47_0) / var_47_7

				arg_44_1.typewritter:SetDirty()
			end

			if arg_44_1.time_ >= var_47_0 + var_47_7 and arg_44_1.time_ < var_47_0 + var_47_7 + arg_47_0 then
				arg_44_1.typewritter.percent = 1

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(true)
			end
		end
	end,
	Play104092012 = function(arg_48_0, arg_48_1)
		arg_48_1.time_ = 0
		arg_48_1.frameCnt_ = 0
		arg_48_1.state_ = "playing"
		arg_48_1.curTalkId_ = 104092012
		arg_48_1.duration_ = 6.87

		local var_48_0 = {
			ja = 6.866,
			ko = 5.6,
			zh = 5.1,
			en = 5.5
		}
		local var_48_1 = manager.audio:GetLocalizationFlag()

		if var_48_0[var_48_1] ~= nil then
			arg_48_1.duration_ = var_48_0[var_48_1]
		end

		SetActive(arg_48_1.tipsGo_, false)

		function arg_48_1.onSingleLineFinish_()
			arg_48_1.onSingleLineUpdate_ = nil
			arg_48_1.onSingleLineFinish_ = nil
			arg_48_1.state_ = "waiting"
		end

		function arg_48_1.playNext_(arg_50_0)
			if arg_50_0 == 1 then
				arg_48_0:Play104092013(arg_48_1)
			end
		end

		function arg_48_1.onSingleLineUpdate_(arg_51_0)
			local var_51_0 = manager.ui.mainCamera.transform
			local var_51_1 = 0

			if var_51_1 < arg_48_1.time_ and arg_48_1.time_ <= var_51_1 + arg_51_0 then
				arg_48_1.var_.shakeOldPosMainCamera = var_51_0.localPosition
			end

			local var_51_2 = 0.600000023841858

			if var_51_1 <= arg_48_1.time_ and arg_48_1.time_ < var_51_1 + var_51_2 then
				local var_51_3 = (arg_48_1.time_ - var_51_1) / 0.066
				local var_51_4, var_51_5 = math.modf(var_51_3)

				var_51_0.localPosition = Vector3.New(var_51_5 * 0.13, var_51_5 * 0.13, var_51_5 * 0.13) + arg_48_1.var_.shakeOldPosMainCamera
			end

			if arg_48_1.time_ >= var_51_1 + var_51_2 and arg_48_1.time_ < var_51_1 + var_51_2 + arg_51_0 then
				var_51_0.localPosition = arg_48_1.var_.shakeOldPosMainCamera
			end

			local var_51_6 = 0
			local var_51_7 = 0.575

			if var_51_6 < arg_48_1.time_ and arg_48_1.time_ <= var_51_6 + arg_51_0 then
				arg_48_1.talkMaxDuration = 0
				arg_48_1.dialogCg_.alpha = 1

				arg_48_1.dialog_:SetActive(true)
				SetActive(arg_48_1.leftNameGo_, true)

				local var_51_8 = arg_48_1:FormatText(StoryNameCfg[5].name)

				arg_48_1.leftNameTxt_.text = var_51_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_48_1.leftNameTxt_.transform)

				arg_48_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_48_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_48_1:RecordName(arg_48_1.leftNameTxt_.text)
				SetActive(arg_48_1.iconTrs_.gameObject, true)
				arg_48_1.iconController_:SetSelectedState("hero")

				arg_48_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_48_1.callingController_:SetSelectedState("normal")

				arg_48_1.keyicon_.color = Color.New(1, 1, 1)
				arg_48_1.icon_.color = Color.New(1, 1, 1)

				local var_51_9 = arg_48_1:GetWordFromCfg(104092012)
				local var_51_10 = arg_48_1:FormatText(var_51_9.content)

				arg_48_1.text_.text = var_51_10

				LuaForUtil.ClearLinePrefixSymbol(arg_48_1.text_)

				local var_51_11 = 23
				local var_51_12 = utf8.len(var_51_10)
				local var_51_13 = var_51_11 <= 0 and var_51_7 or var_51_7 * (var_51_12 / var_51_11)

				if var_51_13 > 0 and var_51_7 < var_51_13 then
					arg_48_1.talkMaxDuration = var_51_13

					if var_51_13 + var_51_6 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_13 + var_51_6
					end
				end

				arg_48_1.text_.text = var_51_10
				arg_48_1.typewritter.percent = 0

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092012", "story_v_out_104092.awb") ~= 0 then
					local var_51_14 = manager.audio:GetVoiceLength("story_v_out_104092", "104092012", "story_v_out_104092.awb") / 1000

					if var_51_14 + var_51_6 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_14 + var_51_6
					end

					if var_51_9.prefab_name ~= "" and arg_48_1.actors_[var_51_9.prefab_name] ~= nil then
						local var_51_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_48_1.actors_[var_51_9.prefab_name].transform, "story_v_out_104092", "104092012", "story_v_out_104092.awb")

						arg_48_1:RecordAudio("104092012", var_51_15)
						arg_48_1:RecordAudio("104092012", var_51_15)
					else
						arg_48_1:AudioAction("play", "voice", "story_v_out_104092", "104092012", "story_v_out_104092.awb")
					end

					arg_48_1:RecordHistoryTalkVoice("story_v_out_104092", "104092012", "story_v_out_104092.awb")
				end

				arg_48_1:RecordContent(arg_48_1.text_.text)
			end

			local var_51_16 = math.max(var_51_7, arg_48_1.talkMaxDuration)

			if var_51_6 <= arg_48_1.time_ and arg_48_1.time_ < var_51_6 + var_51_16 then
				arg_48_1.typewritter.percent = (arg_48_1.time_ - var_51_6) / var_51_16

				arg_48_1.typewritter:SetDirty()
			end

			if arg_48_1.time_ >= var_51_6 + var_51_16 and arg_48_1.time_ < var_51_6 + var_51_16 + arg_51_0 then
				arg_48_1.typewritter.percent = 1

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(true)
			end
		end
	end,
	Play104092013 = function(arg_52_0, arg_52_1)
		arg_52_1.time_ = 0
		arg_52_1.frameCnt_ = 0
		arg_52_1.state_ = "playing"
		arg_52_1.curTalkId_ = 104092013
		arg_52_1.duration_ = 3.4

		local var_52_0 = {
			ja = 3.4,
			ko = 3,
			zh = 2.6,
			en = 3.1
		}
		local var_52_1 = manager.audio:GetLocalizationFlag()

		if var_52_0[var_52_1] ~= nil then
			arg_52_1.duration_ = var_52_0[var_52_1]
		end

		SetActive(arg_52_1.tipsGo_, false)

		function arg_52_1.onSingleLineFinish_()
			arg_52_1.onSingleLineUpdate_ = nil
			arg_52_1.onSingleLineFinish_ = nil
			arg_52_1.state_ = "waiting"
		end

		function arg_52_1.playNext_(arg_54_0)
			if arg_54_0 == 1 then
				arg_52_0:Play104092014(arg_52_1)
			end
		end

		function arg_52_1.onSingleLineUpdate_(arg_55_0)
			local var_55_0 = manager.ui.mainCamera.transform
			local var_55_1 = 0

			if var_55_1 < arg_52_1.time_ and arg_52_1.time_ <= var_55_1 + arg_55_0 then
				arg_52_1.var_.shakeOldPosMainCamera = var_55_0.localPosition
			end

			local var_55_2 = 0.600000023841858

			if var_55_1 <= arg_52_1.time_ and arg_52_1.time_ < var_55_1 + var_55_2 then
				local var_55_3 = (arg_52_1.time_ - var_55_1) / 0.066
				local var_55_4, var_55_5 = math.modf(var_55_3)

				var_55_0.localPosition = Vector3.New(var_55_5 * 0.13, var_55_5 * 0.13, var_55_5 * 0.13) + arg_52_1.var_.shakeOldPosMainCamera
			end

			if arg_52_1.time_ >= var_55_1 + var_55_2 and arg_52_1.time_ < var_55_1 + var_55_2 + arg_55_0 then
				var_55_0.localPosition = arg_52_1.var_.shakeOldPosMainCamera
			end

			local var_55_6 = 0
			local var_55_7 = 0.275

			if var_55_6 < arg_52_1.time_ and arg_52_1.time_ <= var_55_6 + arg_55_0 then
				arg_52_1.talkMaxDuration = 0
				arg_52_1.dialogCg_.alpha = 1

				arg_52_1.dialog_:SetActive(true)
				SetActive(arg_52_1.leftNameGo_, true)

				local var_55_8 = arg_52_1:FormatText(StoryNameCfg[13].name)

				arg_52_1.leftNameTxt_.text = var_55_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_52_1.leftNameTxt_.transform)

				arg_52_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_52_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_52_1:RecordName(arg_52_1.leftNameTxt_.text)
				SetActive(arg_52_1.iconTrs_.gameObject, true)
				arg_52_1.iconController_:SetSelectedState("hero")

				arg_52_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_52_1.callingController_:SetSelectedState("normal")

				arg_52_1.keyicon_.color = Color.New(1, 1, 1)
				arg_52_1.icon_.color = Color.New(1, 1, 1)

				local var_55_9 = arg_52_1:GetWordFromCfg(104092013)
				local var_55_10 = arg_52_1:FormatText(var_55_9.content)

				arg_52_1.text_.text = var_55_10

				LuaForUtil.ClearLinePrefixSymbol(arg_52_1.text_)

				local var_55_11 = 11
				local var_55_12 = utf8.len(var_55_10)
				local var_55_13 = var_55_11 <= 0 and var_55_7 or var_55_7 * (var_55_12 / var_55_11)

				if var_55_13 > 0 and var_55_7 < var_55_13 then
					arg_52_1.talkMaxDuration = var_55_13

					if var_55_13 + var_55_6 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_13 + var_55_6
					end
				end

				arg_52_1.text_.text = var_55_10
				arg_52_1.typewritter.percent = 0

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092013", "story_v_out_104092.awb") ~= 0 then
					local var_55_14 = manager.audio:GetVoiceLength("story_v_out_104092", "104092013", "story_v_out_104092.awb") / 1000

					if var_55_14 + var_55_6 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_14 + var_55_6
					end

					if var_55_9.prefab_name ~= "" and arg_52_1.actors_[var_55_9.prefab_name] ~= nil then
						local var_55_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_52_1.actors_[var_55_9.prefab_name].transform, "story_v_out_104092", "104092013", "story_v_out_104092.awb")

						arg_52_1:RecordAudio("104092013", var_55_15)
						arg_52_1:RecordAudio("104092013", var_55_15)
					else
						arg_52_1:AudioAction("play", "voice", "story_v_out_104092", "104092013", "story_v_out_104092.awb")
					end

					arg_52_1:RecordHistoryTalkVoice("story_v_out_104092", "104092013", "story_v_out_104092.awb")
				end

				arg_52_1:RecordContent(arg_52_1.text_.text)
			end

			local var_55_16 = math.max(var_55_7, arg_52_1.talkMaxDuration)

			if var_55_6 <= arg_52_1.time_ and arg_52_1.time_ < var_55_6 + var_55_16 then
				arg_52_1.typewritter.percent = (arg_52_1.time_ - var_55_6) / var_55_16

				arg_52_1.typewritter:SetDirty()
			end

			if arg_52_1.time_ >= var_55_6 + var_55_16 and arg_52_1.time_ < var_55_6 + var_55_16 + arg_55_0 then
				arg_52_1.typewritter.percent = 1

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(true)
			end
		end
	end,
	Play104092014 = function(arg_56_0, arg_56_1)
		arg_56_1.time_ = 0
		arg_56_1.frameCnt_ = 0
		arg_56_1.state_ = "playing"
		arg_56_1.curTalkId_ = 104092014
		arg_56_1.duration_ = 3.9

		local var_56_0 = {
			ja = 3.9,
			ko = 2.4,
			zh = 3,
			en = 3.1
		}
		local var_56_1 = manager.audio:GetLocalizationFlag()

		if var_56_0[var_56_1] ~= nil then
			arg_56_1.duration_ = var_56_0[var_56_1]
		end

		SetActive(arg_56_1.tipsGo_, false)

		function arg_56_1.onSingleLineFinish_()
			arg_56_1.onSingleLineUpdate_ = nil
			arg_56_1.onSingleLineFinish_ = nil
			arg_56_1.state_ = "waiting"
		end

		function arg_56_1.playNext_(arg_58_0)
			if arg_58_0 == 1 then
				arg_56_0:Play104092015(arg_56_1)
			end
		end

		function arg_56_1.onSingleLineUpdate_(arg_59_0)
			local var_59_0 = 0
			local var_59_1 = 0.275

			if var_59_0 < arg_56_1.time_ and arg_56_1.time_ <= var_59_0 + arg_59_0 then
				arg_56_1.talkMaxDuration = 0
				arg_56_1.dialogCg_.alpha = 1

				arg_56_1.dialog_:SetActive(true)
				SetActive(arg_56_1.leftNameGo_, true)

				local var_59_2 = arg_56_1:FormatText(StoryNameCfg[31].name)

				arg_56_1.leftNameTxt_.text = var_59_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_56_1.leftNameTxt_.transform)

				arg_56_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_56_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_56_1:RecordName(arg_56_1.leftNameTxt_.text)
				SetActive(arg_56_1.iconTrs_.gameObject, true)
				arg_56_1.iconController_:SetSelectedState("hero")

				arg_56_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Noviher")

				arg_56_1.callingController_:SetSelectedState("normal")

				arg_56_1.keyicon_.color = Color.New(1, 1, 1)
				arg_56_1.icon_.color = Color.New(1, 1, 1)

				local var_59_3 = arg_56_1:GetWordFromCfg(104092014)
				local var_59_4 = arg_56_1:FormatText(var_59_3.content)

				arg_56_1.text_.text = var_59_4

				LuaForUtil.ClearLinePrefixSymbol(arg_56_1.text_)

				local var_59_5 = 11
				local var_59_6 = utf8.len(var_59_4)
				local var_59_7 = var_59_5 <= 0 and var_59_1 or var_59_1 * (var_59_6 / var_59_5)

				if var_59_7 > 0 and var_59_1 < var_59_7 then
					arg_56_1.talkMaxDuration = var_59_7

					if var_59_7 + var_59_0 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_7 + var_59_0
					end
				end

				arg_56_1.text_.text = var_59_4
				arg_56_1.typewritter.percent = 0

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092014", "story_v_out_104092.awb") ~= 0 then
					local var_59_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092014", "story_v_out_104092.awb") / 1000

					if var_59_8 + var_59_0 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_8 + var_59_0
					end

					if var_59_3.prefab_name ~= "" and arg_56_1.actors_[var_59_3.prefab_name] ~= nil then
						local var_59_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_56_1.actors_[var_59_3.prefab_name].transform, "story_v_out_104092", "104092014", "story_v_out_104092.awb")

						arg_56_1:RecordAudio("104092014", var_59_9)
						arg_56_1:RecordAudio("104092014", var_59_9)
					else
						arg_56_1:AudioAction("play", "voice", "story_v_out_104092", "104092014", "story_v_out_104092.awb")
					end

					arg_56_1:RecordHistoryTalkVoice("story_v_out_104092", "104092014", "story_v_out_104092.awb")
				end

				arg_56_1:RecordContent(arg_56_1.text_.text)
			end

			local var_59_10 = math.max(var_59_1, arg_56_1.talkMaxDuration)

			if var_59_0 <= arg_56_1.time_ and arg_56_1.time_ < var_59_0 + var_59_10 then
				arg_56_1.typewritter.percent = (arg_56_1.time_ - var_59_0) / var_59_10

				arg_56_1.typewritter:SetDirty()
			end

			if arg_56_1.time_ >= var_59_0 + var_59_10 and arg_56_1.time_ < var_59_0 + var_59_10 + arg_59_0 then
				arg_56_1.typewritter.percent = 1

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(true)
			end
		end
	end,
	Play104092015 = function(arg_60_0, arg_60_1)
		arg_60_1.time_ = 0
		arg_60_1.frameCnt_ = 0
		arg_60_1.state_ = "playing"
		arg_60_1.curTalkId_ = 104092015
		arg_60_1.duration_ = 20.4

		local var_60_0 = {
			ja = 20.4,
			ko = 9.566,
			zh = 8.866,
			en = 9.1
		}
		local var_60_1 = manager.audio:GetLocalizationFlag()

		if var_60_0[var_60_1] ~= nil then
			arg_60_1.duration_ = var_60_0[var_60_1]
		end

		SetActive(arg_60_1.tipsGo_, false)

		function arg_60_1.onSingleLineFinish_()
			arg_60_1.onSingleLineUpdate_ = nil
			arg_60_1.onSingleLineFinish_ = nil
			arg_60_1.state_ = "waiting"
		end

		function arg_60_1.playNext_(arg_62_0)
			if arg_62_0 == 1 then
				arg_60_0:Play104092016(arg_60_1)
			end
		end

		function arg_60_1.onSingleLineUpdate_(arg_63_0)
			local var_63_0 = 0
			local var_63_1 = 0.625

			if var_63_0 < arg_60_1.time_ and arg_60_1.time_ <= var_63_0 + arg_63_0 then
				arg_60_1.talkMaxDuration = 0
				arg_60_1.dialogCg_.alpha = 1

				arg_60_1.dialog_:SetActive(true)
				SetActive(arg_60_1.leftNameGo_, true)

				local var_63_2 = arg_60_1:FormatText(StoryNameCfg[49].name)

				arg_60_1.leftNameTxt_.text = var_63_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_60_1.leftNameTxt_.transform)

				arg_60_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_60_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_60_1:RecordName(arg_60_1.leftNameTxt_.text)
				SetActive(arg_60_1.iconTrs_.gameObject, true)
				arg_60_1.iconController_:SetSelectedState("hero")

				arg_60_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_60_1.callingController_:SetSelectedState("normal")

				arg_60_1.keyicon_.color = Color.New(1, 1, 1)
				arg_60_1.icon_.color = Color.New(1, 1, 1)

				local var_63_3 = arg_60_1:GetWordFromCfg(104092015)
				local var_63_4 = arg_60_1:FormatText(var_63_3.content)

				arg_60_1.text_.text = var_63_4

				LuaForUtil.ClearLinePrefixSymbol(arg_60_1.text_)

				local var_63_5 = 25
				local var_63_6 = utf8.len(var_63_4)
				local var_63_7 = var_63_5 <= 0 and var_63_1 or var_63_1 * (var_63_6 / var_63_5)

				if var_63_7 > 0 and var_63_1 < var_63_7 then
					arg_60_1.talkMaxDuration = var_63_7

					if var_63_7 + var_63_0 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_7 + var_63_0
					end
				end

				arg_60_1.text_.text = var_63_4
				arg_60_1.typewritter.percent = 0

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092015", "story_v_out_104092.awb") ~= 0 then
					local var_63_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092015", "story_v_out_104092.awb") / 1000

					if var_63_8 + var_63_0 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_8 + var_63_0
					end

					if var_63_3.prefab_name ~= "" and arg_60_1.actors_[var_63_3.prefab_name] ~= nil then
						local var_63_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_60_1.actors_[var_63_3.prefab_name].transform, "story_v_out_104092", "104092015", "story_v_out_104092.awb")

						arg_60_1:RecordAudio("104092015", var_63_9)
						arg_60_1:RecordAudio("104092015", var_63_9)
					else
						arg_60_1:AudioAction("play", "voice", "story_v_out_104092", "104092015", "story_v_out_104092.awb")
					end

					arg_60_1:RecordHistoryTalkVoice("story_v_out_104092", "104092015", "story_v_out_104092.awb")
				end

				arg_60_1:RecordContent(arg_60_1.text_.text)
			end

			local var_63_10 = math.max(var_63_1, arg_60_1.talkMaxDuration)

			if var_63_0 <= arg_60_1.time_ and arg_60_1.time_ < var_63_0 + var_63_10 then
				arg_60_1.typewritter.percent = (arg_60_1.time_ - var_63_0) / var_63_10

				arg_60_1.typewritter:SetDirty()
			end

			if arg_60_1.time_ >= var_63_0 + var_63_10 and arg_60_1.time_ < var_63_0 + var_63_10 + arg_63_0 then
				arg_60_1.typewritter.percent = 1

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(true)
			end
		end
	end,
	Play104092016 = function(arg_64_0, arg_64_1)
		arg_64_1.time_ = 0
		arg_64_1.frameCnt_ = 0
		arg_64_1.state_ = "playing"
		arg_64_1.curTalkId_ = 104092016
		arg_64_1.duration_ = 1.93

		local var_64_0 = {
			ja = 1.933,
			ko = 1.333,
			zh = 1.766,
			en = 1.366
		}
		local var_64_1 = manager.audio:GetLocalizationFlag()

		if var_64_0[var_64_1] ~= nil then
			arg_64_1.duration_ = var_64_0[var_64_1]
		end

		SetActive(arg_64_1.tipsGo_, false)

		function arg_64_1.onSingleLineFinish_()
			arg_64_1.onSingleLineUpdate_ = nil
			arg_64_1.onSingleLineFinish_ = nil
			arg_64_1.state_ = "waiting"
		end

		function arg_64_1.playNext_(arg_66_0)
			if arg_66_0 == 1 then
				arg_64_0:Play104092017(arg_64_1)
			end
		end

		function arg_64_1.onSingleLineUpdate_(arg_67_0)
			local var_67_0 = 0
			local var_67_1 = 0.1

			if var_67_0 < arg_64_1.time_ and arg_64_1.time_ <= var_67_0 + arg_67_0 then
				arg_64_1.talkMaxDuration = 0
				arg_64_1.dialogCg_.alpha = 1

				arg_64_1.dialog_:SetActive(true)
				SetActive(arg_64_1.leftNameGo_, true)

				local var_67_2 = arg_64_1:FormatText(StoryNameCfg[5].name)

				arg_64_1.leftNameTxt_.text = var_67_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_64_1.leftNameTxt_.transform)

				arg_64_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_64_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_64_1:RecordName(arg_64_1.leftNameTxt_.text)
				SetActive(arg_64_1.iconTrs_.gameObject, true)
				arg_64_1.iconController_:SetSelectedState("hero")

				arg_64_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1036")

				arg_64_1.callingController_:SetSelectedState("normal")

				arg_64_1.keyicon_.color = Color.New(1, 1, 1)
				arg_64_1.icon_.color = Color.New(1, 1, 1)

				local var_67_3 = arg_64_1:GetWordFromCfg(104092016)
				local var_67_4 = arg_64_1:FormatText(var_67_3.content)

				arg_64_1.text_.text = var_67_4

				LuaForUtil.ClearLinePrefixSymbol(arg_64_1.text_)

				local var_67_5 = 4
				local var_67_6 = utf8.len(var_67_4)
				local var_67_7 = var_67_5 <= 0 and var_67_1 or var_67_1 * (var_67_6 / var_67_5)

				if var_67_7 > 0 and var_67_1 < var_67_7 then
					arg_64_1.talkMaxDuration = var_67_7

					if var_67_7 + var_67_0 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_7 + var_67_0
					end
				end

				arg_64_1.text_.text = var_67_4
				arg_64_1.typewritter.percent = 0

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092016", "story_v_out_104092.awb") ~= 0 then
					local var_67_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092016", "story_v_out_104092.awb") / 1000

					if var_67_8 + var_67_0 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_8 + var_67_0
					end

					if var_67_3.prefab_name ~= "" and arg_64_1.actors_[var_67_3.prefab_name] ~= nil then
						local var_67_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_64_1.actors_[var_67_3.prefab_name].transform, "story_v_out_104092", "104092016", "story_v_out_104092.awb")

						arg_64_1:RecordAudio("104092016", var_67_9)
						arg_64_1:RecordAudio("104092016", var_67_9)
					else
						arg_64_1:AudioAction("play", "voice", "story_v_out_104092", "104092016", "story_v_out_104092.awb")
					end

					arg_64_1:RecordHistoryTalkVoice("story_v_out_104092", "104092016", "story_v_out_104092.awb")
				end

				arg_64_1:RecordContent(arg_64_1.text_.text)
			end

			local var_67_10 = math.max(var_67_1, arg_64_1.talkMaxDuration)

			if var_67_0 <= arg_64_1.time_ and arg_64_1.time_ < var_67_0 + var_67_10 then
				arg_64_1.typewritter.percent = (arg_64_1.time_ - var_67_0) / var_67_10

				arg_64_1.typewritter:SetDirty()
			end

			if arg_64_1.time_ >= var_67_0 + var_67_10 and arg_64_1.time_ < var_67_0 + var_67_10 + arg_67_0 then
				arg_64_1.typewritter.percent = 1

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(true)
			end
		end
	end,
	Play104092017 = function(arg_68_0, arg_68_1)
		arg_68_1.time_ = 0
		arg_68_1.frameCnt_ = 0
		arg_68_1.state_ = "playing"
		arg_68_1.curTalkId_ = 104092017
		arg_68_1.duration_ = 13.2

		local var_68_0 = {
			ja = 13.2,
			ko = 6.4,
			zh = 9.766,
			en = 9.633
		}
		local var_68_1 = manager.audio:GetLocalizationFlag()

		if var_68_0[var_68_1] ~= nil then
			arg_68_1.duration_ = var_68_0[var_68_1]
		end

		SetActive(arg_68_1.tipsGo_, false)

		function arg_68_1.onSingleLineFinish_()
			arg_68_1.onSingleLineUpdate_ = nil
			arg_68_1.onSingleLineFinish_ = nil
			arg_68_1.state_ = "waiting"
		end

		function arg_68_1.playNext_(arg_70_0)
			if arg_70_0 == 1 then
				arg_68_0:Play104092018(arg_68_1)
			end
		end

		function arg_68_1.onSingleLineUpdate_(arg_71_0)
			local var_71_0 = 0
			local var_71_1 = 0.975

			if var_71_0 < arg_68_1.time_ and arg_68_1.time_ <= var_71_0 + arg_71_0 then
				arg_68_1.talkMaxDuration = 0
				arg_68_1.dialogCg_.alpha = 1

				arg_68_1.dialog_:SetActive(true)
				SetActive(arg_68_1.leftNameGo_, true)

				local var_71_2 = arg_68_1:FormatText(StoryNameCfg[49].name)

				arg_68_1.leftNameTxt_.text = var_71_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_68_1.leftNameTxt_.transform)

				arg_68_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_68_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_68_1:RecordName(arg_68_1.leftNameTxt_.text)
				SetActive(arg_68_1.iconTrs_.gameObject, true)
				arg_68_1.iconController_:SetSelectedState("hero")

				arg_68_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_68_1.callingController_:SetSelectedState("normal")

				arg_68_1.keyicon_.color = Color.New(1, 1, 1)
				arg_68_1.icon_.color = Color.New(1, 1, 1)

				local var_71_3 = arg_68_1:GetWordFromCfg(104092017)
				local var_71_4 = arg_68_1:FormatText(var_71_3.content)

				arg_68_1.text_.text = var_71_4

				LuaForUtil.ClearLinePrefixSymbol(arg_68_1.text_)

				local var_71_5 = 34
				local var_71_6 = utf8.len(var_71_4)
				local var_71_7 = var_71_5 <= 0 and var_71_1 or var_71_1 * (var_71_6 / var_71_5)

				if var_71_7 > 0 and var_71_1 < var_71_7 then
					arg_68_1.talkMaxDuration = var_71_7

					if var_71_7 + var_71_0 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_7 + var_71_0
					end
				end

				arg_68_1.text_.text = var_71_4
				arg_68_1.typewritter.percent = 0

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104092", "104092017", "story_v_out_104092.awb") ~= 0 then
					local var_71_8 = manager.audio:GetVoiceLength("story_v_out_104092", "104092017", "story_v_out_104092.awb") / 1000

					if var_71_8 + var_71_0 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_8 + var_71_0
					end

					if var_71_3.prefab_name ~= "" and arg_68_1.actors_[var_71_3.prefab_name] ~= nil then
						local var_71_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_68_1.actors_[var_71_3.prefab_name].transform, "story_v_out_104092", "104092017", "story_v_out_104092.awb")

						arg_68_1:RecordAudio("104092017", var_71_9)
						arg_68_1:RecordAudio("104092017", var_71_9)
					else
						arg_68_1:AudioAction("play", "voice", "story_v_out_104092", "104092017", "story_v_out_104092.awb")
					end

					arg_68_1:RecordHistoryTalkVoice("story_v_out_104092", "104092017", "story_v_out_104092.awb")
				end

				arg_68_1:RecordContent(arg_68_1.text_.text)
			end

			local var_71_10 = math.max(var_71_1, arg_68_1.talkMaxDuration)

			if var_71_0 <= arg_68_1.time_ and arg_68_1.time_ < var_71_0 + var_71_10 then
				arg_68_1.typewritter.percent = (arg_68_1.time_ - var_71_0) / var_71_10

				arg_68_1.typewritter:SetDirty()
			end

			if arg_68_1.time_ >= var_71_0 + var_71_10 and arg_68_1.time_ < var_71_0 + var_71_10 + arg_71_0 then
				arg_68_1.typewritter.percent = 1

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(true)
			end
		end
	end,
	Play104092018 = function(arg_72_0, arg_72_1)
		arg_72_1.time_ = 0
		arg_72_1.frameCnt_ = 0
		arg_72_1.state_ = "playing"
		arg_72_1.curTalkId_ = 104092018
		arg_72_1.duration_ = 11.03

		SetActive(arg_72_1.tipsGo_, false)

		function arg_72_1.onSingleLineFinish_()
			arg_72_1.onSingleLineUpdate_ = nil
			arg_72_1.onSingleLineFinish_ = nil
			arg_72_1.state_ = "waiting"
			arg_72_1.auto_ = false
		end

		function arg_72_1.playNext_(arg_74_0)
			arg_72_1.onStoryFinished_()
		end

		function arg_72_1.onSingleLineUpdate_(arg_75_0)
			local var_75_0 = arg_72_1.bgs_.B04c
			local var_75_1 = 0

			if var_75_1 < arg_72_1.time_ and arg_72_1.time_ <= var_75_1 + arg_75_0 then
				local var_75_2 = var_75_0:GetComponent("SpriteRenderer")

				if var_75_2 then
					var_75_2.material = arg_72_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_75_3 = var_75_2.material
					local var_75_4 = var_75_3:GetColor("_Color")

					arg_72_1.var_.alphaOldValueB04c = var_75_4.a
					arg_72_1.var_.alphaMatValueB04c = var_75_3
				end

				arg_72_1.var_.alphaOldValueB04c = 1
			end

			local var_75_5 = 1.5

			if var_75_1 <= arg_72_1.time_ and arg_72_1.time_ < var_75_1 + var_75_5 then
				local var_75_6 = (arg_72_1.time_ - var_75_1) / var_75_5
				local var_75_7 = Mathf.Lerp(arg_72_1.var_.alphaOldValueB04c, 0, var_75_6)

				if arg_72_1.var_.alphaMatValueB04c then
					local var_75_8 = arg_72_1.var_.alphaMatValueB04c
					local var_75_9 = var_75_8:GetColor("_Color")

					var_75_9.a = var_75_7

					var_75_8:SetColor("_Color", var_75_9)
				end
			end

			if arg_72_1.time_ >= var_75_1 + var_75_5 and arg_72_1.time_ < var_75_1 + var_75_5 + arg_75_0 and arg_72_1.var_.alphaMatValueB04c then
				local var_75_10 = arg_72_1.var_.alphaMatValueB04c
				local var_75_11 = var_75_10:GetColor("_Color")

				var_75_11.a = 0

				var_75_10:SetColor("_Color", var_75_11)
			end

			local var_75_12 = "S0406"

			if arg_72_1.bgs_[var_75_12] == nil then
				local var_75_13 = Object.Instantiate(arg_72_1.paintGo_)

				var_75_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_75_12)
				var_75_13.name = var_75_12
				var_75_13.transform.parent = arg_72_1.stage_.transform
				var_75_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_72_1.bgs_[var_75_12] = var_75_13
			end

			local var_75_14 = arg_72_1.bgs_.S0406
			local var_75_15 = 1.5

			if var_75_15 < arg_72_1.time_ and arg_72_1.time_ <= var_75_15 + arg_75_0 then
				local var_75_16 = var_75_14:GetComponent("SpriteRenderer")

				if var_75_16 then
					var_75_16.material = arg_72_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_75_17 = var_75_16.material
					local var_75_18 = var_75_17:GetColor("_Color")

					arg_72_1.var_.alphaOldValueS0406 = var_75_18.a
					arg_72_1.var_.alphaMatValueS0406 = var_75_17
				end

				arg_72_1.var_.alphaOldValueS0406 = 0
			end

			local var_75_19 = 1.5

			if var_75_15 <= arg_72_1.time_ and arg_72_1.time_ < var_75_15 + var_75_19 then
				local var_75_20 = (arg_72_1.time_ - var_75_15) / var_75_19
				local var_75_21 = Mathf.Lerp(arg_72_1.var_.alphaOldValueS0406, 1, var_75_20)

				if arg_72_1.var_.alphaMatValueS0406 then
					local var_75_22 = arg_72_1.var_.alphaMatValueS0406
					local var_75_23 = var_75_22:GetColor("_Color")

					var_75_23.a = var_75_21

					var_75_22:SetColor("_Color", var_75_23)
				end
			end

			if arg_72_1.time_ >= var_75_15 + var_75_19 and arg_72_1.time_ < var_75_15 + var_75_19 + arg_75_0 and arg_72_1.var_.alphaMatValueS0406 then
				local var_75_24 = arg_72_1.var_.alphaMatValueS0406
				local var_75_25 = var_75_24:GetColor("_Color")

				var_75_25.a = 1

				var_75_24:SetColor("_Color", var_75_25)
			end

			local var_75_26 = arg_72_1.bgs_.B04c.transform
			local var_75_27 = 1.5

			if var_75_27 < arg_72_1.time_ and arg_72_1.time_ <= var_75_27 + arg_75_0 then
				arg_72_1.var_.moveOldPosB04c = var_75_26.localPosition
			end

			local var_75_28 = 0.001

			if var_75_27 <= arg_72_1.time_ and arg_72_1.time_ < var_75_27 + var_75_28 then
				local var_75_29 = (arg_72_1.time_ - var_75_27) / var_75_28
				local var_75_30 = Vector3.New(0, 100, 10)

				var_75_26.localPosition = Vector3.Lerp(arg_72_1.var_.moveOldPosB04c, var_75_30, var_75_29)
			end

			if arg_72_1.time_ >= var_75_27 + var_75_28 and arg_72_1.time_ < var_75_27 + var_75_28 + arg_75_0 then
				var_75_26.localPosition = Vector3.New(0, 100, 10)
			end

			local var_75_31 = arg_72_1.bgs_.S0406.transform
			local var_75_32 = 5.53333333333333

			if var_75_32 < arg_72_1.time_ and arg_72_1.time_ <= var_75_32 + arg_75_0 then
				arg_72_1.var_.moveOldPosS0406 = var_75_31.localPosition
			end

			local var_75_33 = 0.001

			if var_75_32 <= arg_72_1.time_ and arg_72_1.time_ < var_75_32 + var_75_33 then
				local var_75_34 = (arg_72_1.time_ - var_75_32) / var_75_33
				local var_75_35 = Vector3.New(0, 100, 10)

				var_75_31.localPosition = Vector3.Lerp(arg_72_1.var_.moveOldPosS0406, var_75_35, var_75_34)
			end

			if arg_72_1.time_ >= var_75_32 + var_75_33 and arg_72_1.time_ < var_75_32 + var_75_33 + arg_75_0 then
				var_75_31.localPosition = Vector3.New(0, 100, 10)
			end

			local var_75_36 = 5.03333333333333

			if var_75_36 < arg_72_1.time_ and arg_72_1.time_ <= var_75_36 + arg_75_0 then
				arg_72_1.mask_.enabled = true
				arg_72_1.mask_.raycastTarget = true

				arg_72_1:SetGaussion(false)
			end

			local var_75_37 = 0.5

			if var_75_36 <= arg_72_1.time_ and arg_72_1.time_ < var_75_36 + var_75_37 then
				local var_75_38 = (arg_72_1.time_ - var_75_36) / var_75_37
				local var_75_39 = Color.New(1, 1, 1)

				var_75_39.a = Mathf.Lerp(0, 1, var_75_38)
				arg_72_1.mask_.color = var_75_39
			end

			if arg_72_1.time_ >= var_75_36 + var_75_37 and arg_72_1.time_ < var_75_36 + var_75_37 + arg_75_0 then
				local var_75_40 = Color.New(1, 1, 1)

				var_75_40.a = 1
				arg_72_1.mask_.color = var_75_40
			end

			local var_75_41 = 5.53333333333333

			if var_75_41 < arg_72_1.time_ and arg_72_1.time_ <= var_75_41 + arg_75_0 then
				arg_72_1.mask_.enabled = true
				arg_72_1.mask_.raycastTarget = true

				arg_72_1:SetGaussion(false)
			end

			local var_75_42 = 0.5

			if var_75_41 <= arg_72_1.time_ and arg_72_1.time_ < var_75_41 + var_75_42 then
				local var_75_43 = (arg_72_1.time_ - var_75_41) / var_75_42
				local var_75_44 = Color.New(1, 1, 1)

				var_75_44.a = Mathf.Lerp(1, 0, var_75_43)
				arg_72_1.mask_.color = var_75_44
			end

			if arg_72_1.time_ >= var_75_41 + var_75_42 and arg_72_1.time_ < var_75_41 + var_75_42 + arg_75_0 then
				local var_75_45 = Color.New(1, 1, 1)
				local var_75_46 = 0

				arg_72_1.mask_.enabled = false
				var_75_45.a = var_75_46
				arg_72_1.mask_.color = var_75_45
			end

			local var_75_47 = 1.5

			if var_75_47 < arg_72_1.time_ and arg_72_1.time_ <= var_75_47 + arg_75_0 then
				local var_75_48 = manager.ui.mainCamera.transform.localPosition
				local var_75_49 = Vector3.New(0, 0, 10) + Vector3.New(var_75_48.x, var_75_48.y, 0)
				local var_75_50 = arg_72_1.bgs_.S0406

				var_75_50.transform.localPosition = var_75_49
				var_75_50.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_75_51 = var_75_50:GetComponent("SpriteRenderer")

				if var_75_51 and var_75_51.sprite then
					local var_75_52 = (var_75_50.transform.localPosition - var_75_48).z
					local var_75_53 = manager.ui.mainCameraCom_
					local var_75_54 = 2 * var_75_52 * Mathf.Tan(var_75_53.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_75_55 = var_75_54 * var_75_53.aspect
					local var_75_56 = var_75_51.sprite.bounds.size.x
					local var_75_57 = var_75_51.sprite.bounds.size.y
					local var_75_58 = var_75_55 / var_75_56
					local var_75_59 = var_75_54 / var_75_57
					local var_75_60 = var_75_59 < var_75_58 and var_75_58 or var_75_59

					var_75_50.transform.localScale = Vector3.New(var_75_60, var_75_60, 0)
				end

				for iter_75_0, iter_75_1 in pairs(arg_72_1.bgs_) do
					if iter_75_0 ~= "S0406" then
						iter_75_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_75_61 = manager.ui.mainCamera.transform
			local var_75_62 = 4.6

			if var_75_62 < arg_72_1.time_ and arg_72_1.time_ <= var_75_62 + arg_75_0 then
				arg_72_1.var_.shakeOldPos = var_75_61.localPosition
			end

			local var_75_63 = 0.6

			if var_75_62 <= arg_72_1.time_ and arg_72_1.time_ < var_75_62 + var_75_63 then
				local var_75_64 = (arg_72_1.time_ - var_75_62) / 0.066
				local var_75_65, var_75_66 = math.modf(var_75_64)

				var_75_61.localPosition = Vector3.New(var_75_66 * 0.13, var_75_66 * 0.13, var_75_66 * 0.13) + arg_72_1.var_.shakeOldPos
			end

			if arg_72_1.time_ >= var_75_62 + var_75_63 and arg_72_1.time_ < var_75_62 + var_75_63 + arg_75_0 then
				var_75_61.localPosition = arg_72_1.var_.shakeOldPos
			end

			local var_75_67 = "S0406a"

			if arg_72_1.bgs_[var_75_67] == nil then
				local var_75_68 = Object.Instantiate(arg_72_1.paintGo_)

				var_75_68:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_75_67)
				var_75_68.name = var_75_67
				var_75_68.transform.parent = arg_72_1.stage_.transform
				var_75_68.transform.localPosition = Vector3.New(0, 100, 0)
				arg_72_1.bgs_[var_75_67] = var_75_68
			end

			local var_75_69 = arg_72_1.bgs_.S0406a.transform
			local var_75_70 = 5.53333333333333

			if var_75_70 < arg_72_1.time_ and arg_72_1.time_ <= var_75_70 + arg_75_0 then
				arg_72_1.var_.moveOldPosS0406a = var_75_69.localPosition
			end

			local var_75_71 = 0.001

			if var_75_70 <= arg_72_1.time_ and arg_72_1.time_ < var_75_70 + var_75_71 then
				local var_75_72 = (arg_72_1.time_ - var_75_70) / var_75_71
				local var_75_73 = Vector3.New(0, 1, 9)

				var_75_69.localPosition = Vector3.Lerp(arg_72_1.var_.moveOldPosS0406a, var_75_73, var_75_72)
			end

			if arg_72_1.time_ >= var_75_70 + var_75_71 and arg_72_1.time_ < var_75_70 + var_75_71 + arg_75_0 then
				var_75_69.localPosition = Vector3.New(0, 1, 9)
			end

			local var_75_74 = arg_72_1.bgs_.S0406.transform
			local var_75_75 = 2.86666666666667

			if var_75_75 < arg_72_1.time_ and arg_72_1.time_ <= var_75_75 + arg_75_0 then
				arg_72_1.var_.moveOldPosS0406 = var_75_74.localPosition
			end

			local var_75_76 = 1.46666666666667

			if var_75_75 <= arg_72_1.time_ and arg_72_1.time_ < var_75_75 + var_75_76 then
				local var_75_77 = (arg_72_1.time_ - var_75_75) / var_75_76
				local var_75_78 = Vector3.New(0, 1, 9)

				var_75_74.localPosition = Vector3.Lerp(arg_72_1.var_.moveOldPosS0406, var_75_78, var_75_77)
			end

			if arg_72_1.time_ >= var_75_75 + var_75_76 and arg_72_1.time_ < var_75_75 + var_75_76 + arg_75_0 then
				var_75_74.localPosition = Vector3.New(0, 1, 9)
			end

			local var_75_79 = 0

			if var_75_79 < arg_72_1.time_ and arg_72_1.time_ <= var_75_79 + arg_75_0 then
				arg_72_1.allBtn_.enabled = false
			end

			local var_75_80 = 6.03333333333333

			if arg_72_1.time_ >= var_75_79 + var_75_80 and arg_72_1.time_ < var_75_79 + var_75_80 + arg_75_0 then
				arg_72_1.allBtn_.enabled = true
			end

			if arg_72_1.frameCnt_ <= 1 then
				arg_72_1.dialog_:SetActive(false)
			end

			local var_75_81 = 6.03333333333333
			local var_75_82 = 0.0166666666666663

			if var_75_81 < arg_72_1.time_ and arg_72_1.time_ <= var_75_81 + arg_75_0 then
				arg_72_1.talkMaxDuration = 0

				arg_72_1.dialog_:SetActive(true)

				local var_75_83 = LeanTween.value(arg_72_1.dialog_, 0, 1, 0.3)

				var_75_83:setOnUpdate(LuaHelper.FloatAction(function(arg_76_0)
					arg_72_1.dialogCg_.alpha = arg_76_0
				end))
				var_75_83:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_72_1.dialog_)
					var_75_83:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_72_1.duration_ = arg_72_1.duration_ + 0.3

				SetActive(arg_72_1.leftNameGo_, false)

				arg_72_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_72_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_72_1:RecordName(arg_72_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_72_1.iconTrs_.gameObject, false)
				arg_72_1.callingController_:SetSelectedState("normal")

				local var_75_84 = arg_72_1:GetWordFromCfg(104092018)
				local var_75_85 = arg_72_1:FormatText(var_75_84.content)

				arg_72_1.text_.text = var_75_85

				LuaForUtil.ClearLinePrefixSymbol(arg_72_1.text_)

				local var_75_86 = 2
				local var_75_87 = utf8.len(var_75_85)
				local var_75_88 = var_75_86 <= 0 and var_75_82 or var_75_82 * (var_75_87 / var_75_86)

				if var_75_88 > 0 and var_75_82 < var_75_88 then
					arg_72_1.talkMaxDuration = var_75_88
					var_75_81 = var_75_81 + 0.3

					if var_75_88 + var_75_81 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_88 + var_75_81
					end
				end

				arg_72_1.text_.text = var_75_85
				arg_72_1.typewritter.percent = 0

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(false)
				arg_72_1:RecordContent(arg_72_1.text_.text)
			end

			local var_75_89 = var_75_81 + 0.3
			local var_75_90 = math.max(var_75_82, arg_72_1.talkMaxDuration)

			if var_75_89 <= arg_72_1.time_ and arg_72_1.time_ < var_75_89 + var_75_90 then
				arg_72_1.typewritter.percent = (arg_72_1.time_ - var_75_89) / var_75_90

				arg_72_1.typewritter:SetDirty()
			end

			if arg_72_1.time_ >= var_75_89 + var_75_90 and arg_72_1.time_ < var_75_89 + var_75_90 + arg_75_0 then
				arg_72_1.typewritter.percent = 1

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(true)
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
