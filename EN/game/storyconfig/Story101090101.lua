return {
	Play109011001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 109011001
		arg_1_1.duration_ = 5

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play109011002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_4 = 0
			local var_4_5 = 0.575

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_6 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_6:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_6:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_6:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_7 = arg_1_1:GetWordFromCfg(109011001)
				local var_4_8 = arg_1_1:FormatText(var_4_7.content)

				arg_1_1.text_.text = var_4_8

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_9 = 23
				local var_4_10 = utf8.len(var_4_8)
				local var_4_11 = var_4_9 <= 0 and var_4_5 or var_4_5 * (var_4_10 / var_4_9)

				if var_4_11 > 0 and var_4_5 < var_4_11 then
					arg_1_1.talkMaxDuration = var_4_11
					var_4_4 = var_4_4 + 0.3

					if var_4_11 + var_4_4 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_11 + var_4_4
					end
				end

				arg_1_1.text_.text = var_4_8
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_12 = var_4_4 + 0.3
			local var_4_13 = math.max(var_4_5, arg_1_1.talkMaxDuration)

			if var_4_12 <= arg_1_1.time_ and arg_1_1.time_ < var_4_12 + var_4_13 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_12) / var_4_13

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_12 + var_4_13 and arg_1_1.time_ < var_4_12 + var_4_13 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play109011002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 109011002
		arg_7_1.duration_ = 10.3

		local var_7_0 = {
			ja = 8,
			ko = 9.833,
			zh = 10.266,
			en = 10.3
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
				arg_7_0:Play109011003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "C05b"

			if arg_7_1.bgs_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(arg_7_1.paintGo_)

				var_10_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_10_0)
				var_10_1.name = var_10_0
				var_10_1.transform.parent = arg_7_1.stage_.transform
				var_10_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.bgs_[var_10_0] = var_10_1
			end

			local var_10_2 = 0

			if var_10_2 < arg_7_1.time_ and arg_7_1.time_ <= var_10_2 + arg_10_0 then
				local var_10_3 = manager.ui.mainCamera.transform.localPosition
				local var_10_4 = Vector3.New(0, 0, 10) + Vector3.New(var_10_3.x, var_10_3.y, 0)
				local var_10_5 = arg_7_1.bgs_.C05b

				var_10_5.transform.localPosition = var_10_4
				var_10_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_10_6 = var_10_5:GetComponent("SpriteRenderer")

				if var_10_6 and var_10_6.sprite then
					local var_10_7 = (var_10_5.transform.localPosition - var_10_3).z
					local var_10_8 = manager.ui.mainCameraCom_
					local var_10_9 = 2 * var_10_7 * Mathf.Tan(var_10_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_10_10 = var_10_9 * var_10_8.aspect
					local var_10_11 = var_10_6.sprite.bounds.size.x
					local var_10_12 = var_10_6.sprite.bounds.size.y
					local var_10_13 = var_10_10 / var_10_11
					local var_10_14 = var_10_9 / var_10_12
					local var_10_15 = var_10_14 < var_10_13 and var_10_13 or var_10_14

					var_10_5.transform.localScale = Vector3.New(var_10_15, var_10_15, 0)
				end

				for iter_10_0, iter_10_1 in pairs(arg_7_1.bgs_) do
					if iter_10_0 ~= "C05b" then
						iter_10_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_10_16 = arg_7_1.bgs_.C05b
			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				local var_10_18 = var_10_16:GetComponent("SpriteRenderer")

				if var_10_18 then
					var_10_18.material = arg_7_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_10_19 = var_10_18.material
					local var_10_20 = var_10_19:GetColor("_Color")

					arg_7_1.var_.alphaOldValueC05b = var_10_20.a
					arg_7_1.var_.alphaMatValueC05b = var_10_19
				end

				arg_7_1.var_.alphaOldValueC05b = 0
			end

			local var_10_21 = 1.5

			if var_10_17 <= arg_7_1.time_ and arg_7_1.time_ < var_10_17 + var_10_21 then
				local var_10_22 = (arg_7_1.time_ - var_10_17) / var_10_21
				local var_10_23 = Mathf.Lerp(arg_7_1.var_.alphaOldValueC05b, 1, var_10_22)

				if arg_7_1.var_.alphaMatValueC05b then
					local var_10_24 = arg_7_1.var_.alphaMatValueC05b
					local var_10_25 = var_10_24:GetColor("_Color")

					var_10_25.a = var_10_23

					var_10_24:SetColor("_Color", var_10_25)
				end
			end

			if arg_7_1.time_ >= var_10_17 + var_10_21 and arg_7_1.time_ < var_10_17 + var_10_21 + arg_10_0 and arg_7_1.var_.alphaMatValueC05b then
				local var_10_26 = arg_7_1.var_.alphaMatValueC05b
				local var_10_27 = var_10_26:GetColor("_Color")

				var_10_27.a = 1

				var_10_26:SetColor("_Color", var_10_27)
			end

			local var_10_28 = "1084ui_story"

			if arg_7_1.actors_[var_10_28] == nil then
				local var_10_29 = Object.Instantiate(Asset.Load("Char/" .. var_10_28), arg_7_1.stage_.transform)

				var_10_29.name = var_10_28
				var_10_29.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_28] = var_10_29

				local var_10_30 = var_10_29:GetComponentInChildren(typeof(CharacterEffect))

				var_10_30.enabled = true

				local var_10_31 = GameObjectTools.GetOrAddComponent(var_10_29, typeof(DynamicBoneHelper))

				if var_10_31 then
					var_10_31:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_30.transform, false)

				arg_7_1.var_[var_10_28 .. "Animator"] = var_10_30.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_28 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_28 .. "LipSync"] = var_10_30.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_32 = arg_7_1.actors_["1084ui_story"]
			local var_10_33 = 1.8

			if var_10_33 < arg_7_1.time_ and arg_7_1.time_ <= var_10_33 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_34 = 0.2

			if var_10_33 <= arg_7_1.time_ and arg_7_1.time_ < var_10_33 + var_10_34 then
				local var_10_35 = (arg_7_1.time_ - var_10_33) / var_10_34

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_33 + var_10_34 and arg_7_1.time_ < var_10_33 + var_10_34 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_36 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_37 = 1.8

			if var_10_37 < arg_7_1.time_ and arg_7_1.time_ <= var_10_37 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_36.localPosition
			end

			local var_10_38 = 0.001

			if var_10_37 <= arg_7_1.time_ and arg_7_1.time_ < var_10_37 + var_10_38 then
				local var_10_39 = (arg_7_1.time_ - var_10_37) / var_10_38
				local var_10_40 = Vector3.New(-0.7, -0.97, -6)

				var_10_36.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_40, var_10_39)

				local var_10_41 = manager.ui.mainCamera.transform.position - var_10_36.position

				var_10_36.forward = Vector3.New(var_10_41.x, var_10_41.y, var_10_41.z)

				local var_10_42 = var_10_36.localEulerAngles

				var_10_42.z = 0
				var_10_42.x = 0
				var_10_36.localEulerAngles = var_10_42
			end

			if arg_7_1.time_ >= var_10_37 + var_10_38 and arg_7_1.time_ < var_10_37 + var_10_38 + arg_10_0 then
				var_10_36.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_10_43 = manager.ui.mainCamera.transform.position - var_10_36.position

				var_10_36.forward = Vector3.New(var_10_43.x, var_10_43.y, var_10_43.z)

				local var_10_44 = var_10_36.localEulerAngles

				var_10_44.z = 0
				var_10_44.x = 0
				var_10_36.localEulerAngles = var_10_44
			end

			local var_10_45 = 1.8

			if var_10_45 < arg_7_1.time_ and arg_7_1.time_ <= var_10_45 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_10_46 = 1.8

			if var_10_46 < arg_7_1.time_ and arg_7_1.time_ <= var_10_46 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_10_47 = 0

			if var_10_47 < arg_7_1.time_ and arg_7_1.time_ <= var_10_47 + arg_10_0 then
				arg_7_1.allBtn_.enabled = false
			end

			local var_10_48 = 2

			if arg_7_1.time_ >= var_10_47 + var_10_48 and arg_7_1.time_ < var_10_47 + var_10_48 + arg_10_0 then
				arg_7_1.allBtn_.enabled = true
			end

			local var_10_49 = 2
			local var_10_50 = 0.725

			if var_10_49 < arg_7_1.time_ and arg_7_1.time_ <= var_10_49 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_51 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_52 = arg_7_1:GetWordFromCfg(109011002)
				local var_10_53 = arg_7_1:FormatText(var_10_52.content)

				arg_7_1.text_.text = var_10_53

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_54 = 29
				local var_10_55 = utf8.len(var_10_53)
				local var_10_56 = var_10_54 <= 0 and var_10_50 or var_10_50 * (var_10_55 / var_10_54)

				if var_10_56 > 0 and var_10_50 < var_10_56 then
					arg_7_1.talkMaxDuration = var_10_56

					if var_10_56 + var_10_49 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_56 + var_10_49
					end
				end

				arg_7_1.text_.text = var_10_53
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011002", "story_v_out_109011.awb") ~= 0 then
					local var_10_57 = manager.audio:GetVoiceLength("story_v_out_109011", "109011002", "story_v_out_109011.awb") / 1000

					if var_10_57 + var_10_49 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_57 + var_10_49
					end

					if var_10_52.prefab_name ~= "" and arg_7_1.actors_[var_10_52.prefab_name] ~= nil then
						local var_10_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_52.prefab_name].transform, "story_v_out_109011", "109011002", "story_v_out_109011.awb")

						arg_7_1:RecordAudio("109011002", var_10_58)
						arg_7_1:RecordAudio("109011002", var_10_58)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_109011", "109011002", "story_v_out_109011.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_109011", "109011002", "story_v_out_109011.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_59 = math.max(var_10_50, arg_7_1.talkMaxDuration)

			if var_10_49 <= arg_7_1.time_ and arg_7_1.time_ < var_10_49 + var_10_59 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_49) / var_10_59

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_49 + var_10_59 and arg_7_1.time_ < var_10_49 + var_10_59 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play109011003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 109011003
		arg_11_1.duration_ = 5.6

		local var_11_0 = {
			ja = 3.533,
			ko = 5.033,
			zh = 5.6,
			en = 4.533
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
				arg_11_0:Play109011004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1038ui_story"

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

			local var_14_4 = arg_11_1.actors_["1038ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1038ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0.7, -1.11, -5.9)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1038ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1038ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1038ui_story == nil then
				arg_11_1.var_.characterEffect1038ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.2

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1038ui_story then
					arg_11_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1038ui_story then
				arg_11_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_14_17 = arg_11_1.actors_["1084ui_story"]
			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_19 = 0.2

			if var_14_18 <= arg_11_1.time_ and arg_11_1.time_ < var_14_18 + var_14_19 then
				local var_14_20 = (arg_11_1.time_ - var_14_18) / var_14_19

				if arg_11_1.var_.characterEffect1084ui_story then
					local var_14_21 = Mathf.Lerp(0, 0.5, var_14_20)

					arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_21
				end
			end

			if arg_11_1.time_ >= var_14_18 + var_14_19 and arg_11_1.time_ < var_14_18 + var_14_19 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				local var_14_22 = 0.5

				arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_22
			end

			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 then
				arg_11_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action3_1")
			end

			local var_14_24 = 0

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_14_25 = 0
			local var_14_26 = 0.55

			if var_14_25 < arg_11_1.time_ and arg_11_1.time_ <= var_14_25 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_27 = arg_11_1:FormatText(StoryNameCfg[94].name)

				arg_11_1.leftNameTxt_.text = var_14_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_28 = arg_11_1:GetWordFromCfg(109011003)
				local var_14_29 = arg_11_1:FormatText(var_14_28.content)

				arg_11_1.text_.text = var_14_29

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_30 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011003", "story_v_out_109011.awb") ~= 0 then
					local var_14_33 = manager.audio:GetVoiceLength("story_v_out_109011", "109011003", "story_v_out_109011.awb") / 1000

					if var_14_33 + var_14_25 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_33 + var_14_25
					end

					if var_14_28.prefab_name ~= "" and arg_11_1.actors_[var_14_28.prefab_name] ~= nil then
						local var_14_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_28.prefab_name].transform, "story_v_out_109011", "109011003", "story_v_out_109011.awb")

						arg_11_1:RecordAudio("109011003", var_14_34)
						arg_11_1:RecordAudio("109011003", var_14_34)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_109011", "109011003", "story_v_out_109011.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_109011", "109011003", "story_v_out_109011.awb")
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
	Play109011004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 109011004
		arg_15_1.duration_ = 11.433

		local var_15_0 = {
			ja = 10.166,
			ko = 8.9,
			zh = 8.2,
			en = 11.433
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
				arg_15_0:Play109011005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1038ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1038ui_story == nil then
				arg_15_1.var_.characterEffect1038ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1038ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1038ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1038ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1038ui_story.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["1084ui_story"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_8 = 0.2

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8

				if arg_15_1.var_.characterEffect1084ui_story then
					local var_18_10 = Mathf.Lerp(0, 0.5, var_18_9)

					arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_10
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				local var_18_11 = 0.5

				arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_11
			end

			local var_18_12 = 0
			local var_18_13 = 1

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_14 = arg_15_1:FormatText(StoryNameCfg[10].name)

				arg_15_1.leftNameTxt_.text = var_18_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_15 = arg_15_1:GetWordFromCfg(109011004)
				local var_18_16 = arg_15_1:FormatText(var_18_15.content)

				arg_15_1.text_.text = var_18_16

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_17 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011004", "story_v_out_109011.awb") ~= 0 then
					local var_18_20 = manager.audio:GetVoiceLength("story_v_out_109011", "109011004", "story_v_out_109011.awb") / 1000

					if var_18_20 + var_18_12 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_20 + var_18_12
					end

					if var_18_15.prefab_name ~= "" and arg_15_1.actors_[var_18_15.prefab_name] ~= nil then
						local var_18_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_15.prefab_name].transform, "story_v_out_109011", "109011004", "story_v_out_109011.awb")

						arg_15_1:RecordAudio("109011004", var_18_21)
						arg_15_1:RecordAudio("109011004", var_18_21)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_109011", "109011004", "story_v_out_109011.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_109011", "109011004", "story_v_out_109011.awb")
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
	Play109011005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 109011005
		arg_19_1.duration_ = 4.6

		local var_19_0 = {
			ja = 3.466,
			ko = 2.833,
			zh = 2.866,
			en = 4.6
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
				arg_19_0:Play109011006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_22_1 = 0
			local var_22_2 = 0.25

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_3 = arg_19_1:FormatText(StoryNameCfg[74].name)

				arg_19_1.leftNameTxt_.text = var_22_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_4 = arg_19_1:GetWordFromCfg(109011005)
				local var_22_5 = arg_19_1:FormatText(var_22_4.content)

				arg_19_1.text_.text = var_22_5

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_6 = 10
				local var_22_7 = utf8.len(var_22_5)
				local var_22_8 = var_22_6 <= 0 and var_22_2 or var_22_2 * (var_22_7 / var_22_6)

				if var_22_8 > 0 and var_22_2 < var_22_8 then
					arg_19_1.talkMaxDuration = var_22_8

					if var_22_8 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_1
					end
				end

				arg_19_1.text_.text = var_22_5
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011005", "story_v_out_109011.awb") ~= 0 then
					local var_22_9 = manager.audio:GetVoiceLength("story_v_out_109011", "109011005", "story_v_out_109011.awb") / 1000

					if var_22_9 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_1
					end

					if var_22_4.prefab_name ~= "" and arg_19_1.actors_[var_22_4.prefab_name] ~= nil then
						local var_22_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_4.prefab_name].transform, "story_v_out_109011", "109011005", "story_v_out_109011.awb")

						arg_19_1:RecordAudio("109011005", var_22_10)
						arg_19_1:RecordAudio("109011005", var_22_10)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_109011", "109011005", "story_v_out_109011.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_109011", "109011005", "story_v_out_109011.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_11 = math.max(var_22_2, arg_19_1.talkMaxDuration)

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_11 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_1) / var_22_11

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_1 + var_22_11 and arg_19_1.time_ < var_22_1 + var_22_11 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play109011006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 109011006
		arg_23_1.duration_ = 5.266

		local var_23_0 = {
			ja = 3.1,
			ko = 3.066,
			zh = 3.966,
			en = 5.266
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
				arg_23_0:Play109011007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1038ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1038ui_story == nil then
				arg_23_1.var_.characterEffect1038ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1038ui_story then
					arg_23_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1038ui_story then
				arg_23_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_26_4 = 0

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038actionlink/1038action435")
			end

			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_26_6 = 0
			local var_26_7 = 0.35

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[94].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(109011006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 14
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011006", "story_v_out_109011.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_109011", "109011006", "story_v_out_109011.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_109011", "109011006", "story_v_out_109011.awb")

						arg_23_1:RecordAudio("109011006", var_26_15)
						arg_23_1:RecordAudio("109011006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_109011", "109011006", "story_v_out_109011.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_109011", "109011006", "story_v_out_109011.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_16 and arg_23_1.time_ < var_26_6 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play109011007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 109011007
		arg_27_1.duration_ = 4.866

		local var_27_0 = {
			ja = 4.1,
			ko = 3.433,
			zh = 4.866,
			en = 4.733
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
				arg_27_0:Play109011008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1084ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story == nil then
				arg_27_1.var_.characterEffect1084ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1084ui_story then
					arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1084ui_story then
				arg_27_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["1038ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect1038ui_story == nil then
				arg_27_1.var_.characterEffect1038ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.2

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect1038ui_story then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1038ui_story.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect1038ui_story then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1038ui_story.fillRatio = var_30_9
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_30_12 = 0
			local var_30_13 = 0.625

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_14 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(109011007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011007", "story_v_out_109011.awb") ~= 0 then
					local var_30_20 = manager.audio:GetVoiceLength("story_v_out_109011", "109011007", "story_v_out_109011.awb") / 1000

					if var_30_20 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_12
					end

					if var_30_15.prefab_name ~= "" and arg_27_1.actors_[var_30_15.prefab_name] ~= nil then
						local var_30_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_15.prefab_name].transform, "story_v_out_109011", "109011007", "story_v_out_109011.awb")

						arg_27_1:RecordAudio("109011007", var_30_21)
						arg_27_1:RecordAudio("109011007", var_30_21)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_109011", "109011007", "story_v_out_109011.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_109011", "109011007", "story_v_out_109011.awb")
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
	Play109011008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 109011008
		arg_31_1.duration_ = 6.9

		local var_31_0 = {
			ja = 5.666,
			ko = 6.2,
			zh = 5.566,
			en = 6.9
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
				arg_31_0:Play109011009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_34_1 = 0
			local var_34_2 = 0.725

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_3 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_4 = arg_31_1:GetWordFromCfg(109011008)
				local var_34_5 = arg_31_1:FormatText(var_34_4.content)

				arg_31_1.text_.text = var_34_5

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_6 = 29
				local var_34_7 = utf8.len(var_34_5)
				local var_34_8 = var_34_6 <= 0 and var_34_2 or var_34_2 * (var_34_7 / var_34_6)

				if var_34_8 > 0 and var_34_2 < var_34_8 then
					arg_31_1.talkMaxDuration = var_34_8

					if var_34_8 + var_34_1 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_1
					end
				end

				arg_31_1.text_.text = var_34_5
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011008", "story_v_out_109011.awb") ~= 0 then
					local var_34_9 = manager.audio:GetVoiceLength("story_v_out_109011", "109011008", "story_v_out_109011.awb") / 1000

					if var_34_9 + var_34_1 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_9 + var_34_1
					end

					if var_34_4.prefab_name ~= "" and arg_31_1.actors_[var_34_4.prefab_name] ~= nil then
						local var_34_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_4.prefab_name].transform, "story_v_out_109011", "109011008", "story_v_out_109011.awb")

						arg_31_1:RecordAudio("109011008", var_34_10)
						arg_31_1:RecordAudio("109011008", var_34_10)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_109011", "109011008", "story_v_out_109011.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_109011", "109011008", "story_v_out_109011.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_11 = math.max(var_34_2, arg_31_1.talkMaxDuration)

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_11 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_1) / var_34_11

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_1 + var_34_11 and arg_31_1.time_ < var_34_1 + var_34_11 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play109011009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 109011009
		arg_35_1.duration_ = 6.666

		local var_35_0 = {
			ja = 6.533,
			ko = 4.566,
			zh = 4.466,
			en = 6.666
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
				arg_35_0:Play109011010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1084ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, 100, 0)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1084ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, 100, 0)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = "1099ui_story"

			if arg_35_1.actors_[var_38_9] == nil then
				local var_38_10 = Object.Instantiate(Asset.Load("Char/" .. var_38_9), arg_35_1.stage_.transform)

				var_38_10.name = var_38_9
				var_38_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_9] = var_38_10

				local var_38_11 = var_38_10:GetComponentInChildren(typeof(CharacterEffect))

				var_38_11.enabled = true

				local var_38_12 = GameObjectTools.GetOrAddComponent(var_38_10, typeof(DynamicBoneHelper))

				if var_38_12 then
					var_38_12:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_11.transform, false)

				arg_35_1.var_[var_38_9 .. "Animator"] = var_38_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_9 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_9 .. "LipSync"] = var_38_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_13 = arg_35_1.actors_["1099ui_story"].transform
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1.var_.moveOldPos1099ui_story = var_38_13.localPosition
			end

			local var_38_15 = 0.001

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15
				local var_38_17 = Vector3.New(-0.7, -1.08, -5.9)

				var_38_13.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1099ui_story, var_38_17, var_38_16)

				local var_38_18 = manager.ui.mainCamera.transform.position - var_38_13.position

				var_38_13.forward = Vector3.New(var_38_18.x, var_38_18.y, var_38_18.z)

				local var_38_19 = var_38_13.localEulerAngles

				var_38_19.z = 0
				var_38_19.x = 0
				var_38_13.localEulerAngles = var_38_19
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 then
				var_38_13.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_38_20 = manager.ui.mainCamera.transform.position - var_38_13.position

				var_38_13.forward = Vector3.New(var_38_20.x, var_38_20.y, var_38_20.z)

				local var_38_21 = var_38_13.localEulerAngles

				var_38_21.z = 0
				var_38_21.x = 0
				var_38_13.localEulerAngles = var_38_21
			end

			local var_38_22 = arg_35_1.actors_["1099ui_story"]
			local var_38_23 = 0

			if var_38_23 < arg_35_1.time_ and arg_35_1.time_ <= var_38_23 + arg_38_0 and arg_35_1.var_.characterEffect1099ui_story == nil then
				arg_35_1.var_.characterEffect1099ui_story = var_38_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_24 = 0.2

			if var_38_23 <= arg_35_1.time_ and arg_35_1.time_ < var_38_23 + var_38_24 then
				local var_38_25 = (arg_35_1.time_ - var_38_23) / var_38_24

				if arg_35_1.var_.characterEffect1099ui_story then
					arg_35_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_23 + var_38_24 and arg_35_1.time_ < var_38_23 + var_38_24 + arg_38_0 and arg_35_1.var_.characterEffect1099ui_story then
				arg_35_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_38_26 = 0

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 then
				arg_35_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_1")
			end

			local var_38_27 = 0

			if var_38_27 < arg_35_1.time_ and arg_35_1.time_ <= var_38_27 + arg_38_0 then
				arg_35_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_38_28 = 0
			local var_38_29 = 0.575

			if var_38_28 < arg_35_1.time_ and arg_35_1.time_ <= var_38_28 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_30 = arg_35_1:FormatText(StoryNameCfg[84].name)

				arg_35_1.leftNameTxt_.text = var_38_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_31 = arg_35_1:GetWordFromCfg(109011009)
				local var_38_32 = arg_35_1:FormatText(var_38_31.content)

				arg_35_1.text_.text = var_38_32

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_33 = 22
				local var_38_34 = utf8.len(var_38_32)
				local var_38_35 = var_38_33 <= 0 and var_38_29 or var_38_29 * (var_38_34 / var_38_33)

				if var_38_35 > 0 and var_38_29 < var_38_35 then
					arg_35_1.talkMaxDuration = var_38_35

					if var_38_35 + var_38_28 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_35 + var_38_28
					end
				end

				arg_35_1.text_.text = var_38_32
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011009", "story_v_out_109011.awb") ~= 0 then
					local var_38_36 = manager.audio:GetVoiceLength("story_v_out_109011", "109011009", "story_v_out_109011.awb") / 1000

					if var_38_36 + var_38_28 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_36 + var_38_28
					end

					if var_38_31.prefab_name ~= "" and arg_35_1.actors_[var_38_31.prefab_name] ~= nil then
						local var_38_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_31.prefab_name].transform, "story_v_out_109011", "109011009", "story_v_out_109011.awb")

						arg_35_1:RecordAudio("109011009", var_38_37)
						arg_35_1:RecordAudio("109011009", var_38_37)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_109011", "109011009", "story_v_out_109011.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_109011", "109011009", "story_v_out_109011.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_38 = math.max(var_38_29, arg_35_1.talkMaxDuration)

			if var_38_28 <= arg_35_1.time_ and arg_35_1.time_ < var_38_28 + var_38_38 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_28) / var_38_38

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_28 + var_38_38 and arg_35_1.time_ < var_38_28 + var_38_38 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play109011010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 109011010
		arg_39_1.duration_ = 1.999999999999

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play109011011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1038ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1038ui_story == nil then
				arg_39_1.var_.characterEffect1038ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1038ui_story then
					arg_39_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1038ui_story then
				arg_39_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1099ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1099ui_story == nil then
				arg_39_1.var_.characterEffect1099ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.2

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1099ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1099ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1099ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1099ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_42_11 = 0
			local var_42_12 = 0.2

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_13 = arg_39_1:FormatText(StoryNameCfg[94].name)

				arg_39_1.leftNameTxt_.text = var_42_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_14 = arg_39_1:GetWordFromCfg(109011010)
				local var_42_15 = arg_39_1:FormatText(var_42_14.content)

				arg_39_1.text_.text = var_42_15

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_16 = 8
				local var_42_17 = utf8.len(var_42_15)
				local var_42_18 = var_42_16 <= 0 and var_42_12 or var_42_12 * (var_42_17 / var_42_16)

				if var_42_18 > 0 and var_42_12 < var_42_18 then
					arg_39_1.talkMaxDuration = var_42_18

					if var_42_18 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_11
					end
				end

				arg_39_1.text_.text = var_42_15
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011010", "story_v_out_109011.awb") ~= 0 then
					local var_42_19 = manager.audio:GetVoiceLength("story_v_out_109011", "109011010", "story_v_out_109011.awb") / 1000

					if var_42_19 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_11
					end

					if var_42_14.prefab_name ~= "" and arg_39_1.actors_[var_42_14.prefab_name] ~= nil then
						local var_42_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_14.prefab_name].transform, "story_v_out_109011", "109011010", "story_v_out_109011.awb")

						arg_39_1:RecordAudio("109011010", var_42_20)
						arg_39_1:RecordAudio("109011010", var_42_20)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_109011", "109011010", "story_v_out_109011.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_109011", "109011010", "story_v_out_109011.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_21 = math.max(var_42_12, arg_39_1.talkMaxDuration)

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_21 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_11) / var_42_21

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_11 + var_42_21 and arg_39_1.time_ < var_42_11 + var_42_21 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play109011011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 109011011
		arg_43_1.duration_ = 16.066

		local var_43_0 = {
			ja = 7.966,
			ko = 16.066,
			zh = 12.166,
			en = 12.433
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
				arg_43_0:Play109011012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1038ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1038ui_story == nil then
				arg_43_1.var_.characterEffect1038ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1038ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1038ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1038ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1038ui_story.fillRatio = var_46_5
			end

			local var_46_6 = arg_43_1.actors_["1099ui_story"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect1099ui_story == nil then
				arg_43_1.var_.characterEffect1099ui_story = var_46_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_8 = 0.2

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8

				if arg_43_1.var_.characterEffect1099ui_story then
					arg_43_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 and arg_43_1.var_.characterEffect1099ui_story then
				arg_43_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_2")
			end

			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_46_12 = 0
			local var_46_13 = 1.675

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_14 = arg_43_1:FormatText(StoryNameCfg[84].name)

				arg_43_1.leftNameTxt_.text = var_46_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_15 = arg_43_1:GetWordFromCfg(109011011)
				local var_46_16 = arg_43_1:FormatText(var_46_15.content)

				arg_43_1.text_.text = var_46_16

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_17 = 67
				local var_46_18 = utf8.len(var_46_16)
				local var_46_19 = var_46_17 <= 0 and var_46_13 or var_46_13 * (var_46_18 / var_46_17)

				if var_46_19 > 0 and var_46_13 < var_46_19 then
					arg_43_1.talkMaxDuration = var_46_19

					if var_46_19 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_12
					end
				end

				arg_43_1.text_.text = var_46_16
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011011", "story_v_out_109011.awb") ~= 0 then
					local var_46_20 = manager.audio:GetVoiceLength("story_v_out_109011", "109011011", "story_v_out_109011.awb") / 1000

					if var_46_20 + var_46_12 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_12
					end

					if var_46_15.prefab_name ~= "" and arg_43_1.actors_[var_46_15.prefab_name] ~= nil then
						local var_46_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_15.prefab_name].transform, "story_v_out_109011", "109011011", "story_v_out_109011.awb")

						arg_43_1:RecordAudio("109011011", var_46_21)
						arg_43_1:RecordAudio("109011011", var_46_21)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_109011", "109011011", "story_v_out_109011.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_109011", "109011011", "story_v_out_109011.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_13, arg_43_1.talkMaxDuration)

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_12) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_12 + var_46_22 and arg_43_1.time_ < var_46_12 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play109011012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 109011012
		arg_47_1.duration_ = 6.166

		local var_47_0 = {
			ja = 6.166,
			ko = 4.233,
			zh = 4.166,
			en = 5.066
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
			arg_47_1.auto_ = false
		end

		function arg_47_1.playNext_(arg_49_0)
			arg_47_1.onStoryFinished_()
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_50_1 = 0
			local var_50_2 = 0.65

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_3 = arg_47_1:FormatText(StoryNameCfg[84].name)

				arg_47_1.leftNameTxt_.text = var_50_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_4 = arg_47_1:GetWordFromCfg(109011012)
				local var_50_5 = arg_47_1:FormatText(var_50_4.content)

				arg_47_1.text_.text = var_50_5

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_6 = 26
				local var_50_7 = utf8.len(var_50_5)
				local var_50_8 = var_50_6 <= 0 and var_50_2 or var_50_2 * (var_50_7 / var_50_6)

				if var_50_8 > 0 and var_50_2 < var_50_8 then
					arg_47_1.talkMaxDuration = var_50_8

					if var_50_8 + var_50_1 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_1
					end
				end

				arg_47_1.text_.text = var_50_5
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109011", "109011012", "story_v_out_109011.awb") ~= 0 then
					local var_50_9 = manager.audio:GetVoiceLength("story_v_out_109011", "109011012", "story_v_out_109011.awb") / 1000

					if var_50_9 + var_50_1 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_9 + var_50_1
					end

					if var_50_4.prefab_name ~= "" and arg_47_1.actors_[var_50_4.prefab_name] ~= nil then
						local var_50_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_4.prefab_name].transform, "story_v_out_109011", "109011012", "story_v_out_109011.awb")

						arg_47_1:RecordAudio("109011012", var_50_10)
						arg_47_1:RecordAudio("109011012", var_50_10)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_109011", "109011012", "story_v_out_109011.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_109011", "109011012", "story_v_out_109011.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_11 = math.max(var_50_2, arg_47_1.talkMaxDuration)

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_11 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_1) / var_50_11

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_1 + var_50_11 and arg_47_1.time_ < var_50_1 + var_50_11 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C05b"
	},
	voices = {
		"story_v_out_109011.awb"
	}
}
