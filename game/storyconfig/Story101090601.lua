return {
	Play109061001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 109061001
		arg_1_1.duration_ = 11.1

		local var_1_0 = {
			ja = 10.7,
			ko = 11.066,
			zh = 11.1,
			en = 9.9
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
				arg_1_0:Play109061002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "C07_1"

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
				local var_4_5 = arg_1_1.bgs_.C07_1

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
					if iter_4_0 ~= "C07_1" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.C07_1
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueC07_1 = var_4_20.a
					arg_1_1.var_.alphaMatValueC07_1 = var_4_19
				end

				arg_1_1.var_.alphaOldValueC07_1 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueC07_1, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueC07_1 then
					local var_4_24 = arg_1_1.var_.alphaMatValueC07_1
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueC07_1 then
				local var_4_26 = arg_1_1.var_.alphaMatValueC07_1
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = 0
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_32 = 1.5

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_33 = 2

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_34 = "10004ui_story"

			if arg_1_1.actors_[var_4_34] == nil then
				local var_4_35 = Object.Instantiate(Asset.Load("Char/" .. var_4_34), arg_1_1.stage_.transform)

				var_4_35.name = var_4_34
				var_4_35.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_34] = var_4_35

				local var_4_36 = var_4_35:GetComponentInChildren(typeof(CharacterEffect))

				var_4_36.enabled = true

				local var_4_37 = GameObjectTools.GetOrAddComponent(var_4_35, typeof(DynamicBoneHelper))

				if var_4_37 then
					var_4_37:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_36.transform, false)

				arg_1_1.var_[var_4_34 .. "Animator"] = var_4_36.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_34 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_34 .. "LipSync"] = var_4_36.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_38 = arg_1_1.actors_["10004ui_story"]
			local var_4_39 = 1.5

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect10004ui_story == nil then
				arg_1_1.var_.characterEffect10004ui_story = var_4_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_40 = 0.1

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_39) / var_4_40

				if arg_1_1.var_.characterEffect10004ui_story then
					arg_1_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 and arg_1_1.var_.characterEffect10004ui_story then
				arg_1_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_4_42 = arg_1_1.actors_["10004ui_story"].transform
			local var_4_43 = 1.5

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1.var_.moveOldPos10004ui_story = var_4_42.localPosition
			end

			local var_4_44 = 0.001

			if var_4_43 <= arg_1_1.time_ and arg_1_1.time_ < var_4_43 + var_4_44 then
				local var_4_45 = (arg_1_1.time_ - var_4_43) / var_4_44
				local var_4_46 = Vector3.New(-0.7, -1.1, -5.6)

				var_4_42.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10004ui_story, var_4_46, var_4_45)

				local var_4_47 = manager.ui.mainCamera.transform.position - var_4_42.position

				var_4_42.forward = Vector3.New(var_4_47.x, var_4_47.y, var_4_47.z)

				local var_4_48 = var_4_42.localEulerAngles

				var_4_48.z = 0
				var_4_48.x = 0
				var_4_42.localEulerAngles = var_4_48
			end

			if arg_1_1.time_ >= var_4_43 + var_4_44 and arg_1_1.time_ < var_4_43 + var_4_44 + arg_4_0 then
				var_4_42.localPosition = Vector3.New(-0.7, -1.1, -5.6)

				local var_4_49 = manager.ui.mainCamera.transform.position - var_4_42.position

				var_4_42.forward = Vector3.New(var_4_49.x, var_4_49.y, var_4_49.z)

				local var_4_50 = var_4_42.localEulerAngles

				var_4_50.z = 0
				var_4_50.x = 0
				var_4_42.localEulerAngles = var_4_50
			end

			local var_4_51 = "10003ui_story"

			if arg_1_1.actors_[var_4_51] == nil then
				local var_4_52 = Object.Instantiate(Asset.Load("Char/" .. var_4_51), arg_1_1.stage_.transform)

				var_4_52.name = var_4_51
				var_4_52.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_51] = var_4_52

				local var_4_53 = var_4_52:GetComponentInChildren(typeof(CharacterEffect))

				var_4_53.enabled = true

				local var_4_54 = GameObjectTools.GetOrAddComponent(var_4_52, typeof(DynamicBoneHelper))

				if var_4_54 then
					var_4_54:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_53.transform, false)

				arg_1_1.var_[var_4_51 .. "Animator"] = var_4_53.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_51 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_51 .. "LipSync"] = var_4_53.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_55 = arg_1_1.actors_["10003ui_story"].transform
			local var_4_56 = 0

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				arg_1_1.var_.moveOldPos10003ui_story = var_4_55.localPosition
			end

			local var_4_57 = 0.001

			if var_4_56 <= arg_1_1.time_ and arg_1_1.time_ < var_4_56 + var_4_57 then
				local var_4_58 = (arg_1_1.time_ - var_4_56) / var_4_57
				local var_4_59 = Vector3.New(0, 100, 0)

				var_4_55.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10003ui_story, var_4_59, var_4_58)

				local var_4_60 = manager.ui.mainCamera.transform.position - var_4_55.position

				var_4_55.forward = Vector3.New(var_4_60.x, var_4_60.y, var_4_60.z)

				local var_4_61 = var_4_55.localEulerAngles

				var_4_61.z = 0
				var_4_61.x = 0
				var_4_55.localEulerAngles = var_4_61
			end

			if arg_1_1.time_ >= var_4_56 + var_4_57 and arg_1_1.time_ < var_4_56 + var_4_57 + arg_4_0 then
				var_4_55.localPosition = Vector3.New(0, 100, 0)

				local var_4_62 = manager.ui.mainCamera.transform.position - var_4_55.position

				var_4_55.forward = Vector3.New(var_4_62.x, var_4_62.y, var_4_62.z)

				local var_4_63 = var_4_55.localEulerAngles

				var_4_63.z = 0
				var_4_63.x = 0
				var_4_55.localEulerAngles = var_4_63
			end

			local var_4_64 = 0

			if var_4_64 < arg_1_1.time_ and arg_1_1.time_ <= var_4_64 + arg_4_0 then
				arg_1_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/story10003/story10003action/10003action2_1")
			end

			local var_4_65 = 1.5

			if var_4_65 < arg_1_1.time_ and arg_1_1.time_ <= var_4_65 + arg_4_0 then
				arg_1_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action3_1")
			end

			local var_4_66 = 0

			if var_4_66 < arg_1_1.time_ and arg_1_1.time_ <= var_4_66 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_67 = 2

			if arg_1_1.time_ >= var_4_66 + var_4_67 and arg_1_1.time_ < var_4_66 + var_4_67 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_68 = 1.5

			if var_4_68 < arg_1_1.time_ and arg_1_1.time_ <= var_4_68 + arg_4_0 then
				arg_1_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_69 = 2
			local var_4_70 = 0.975

			if var_4_69 < arg_1_1.time_ and arg_1_1.time_ <= var_4_69 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_71 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_71:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_71:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_71:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_72 = arg_1_1:FormatText(StoryNameCfg[80].name)

				arg_1_1.leftNameTxt_.text = var_4_72

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_73 = arg_1_1:GetWordFromCfg(109061001)
				local var_4_74 = arg_1_1:FormatText(var_4_73.content)

				arg_1_1.text_.text = var_4_74

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_75 = 39
				local var_4_76 = utf8.len(var_4_74)
				local var_4_77 = var_4_75 <= 0 and var_4_70 or var_4_70 * (var_4_76 / var_4_75)

				if var_4_77 > 0 and var_4_70 < var_4_77 then
					arg_1_1.talkMaxDuration = var_4_77
					var_4_69 = var_4_69 + 0.3

					if var_4_77 + var_4_69 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_77 + var_4_69
					end
				end

				arg_1_1.text_.text = var_4_74
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061001", "story_v_out_109061.awb") ~= 0 then
					local var_4_78 = manager.audio:GetVoiceLength("story_v_out_109061", "109061001", "story_v_out_109061.awb") / 1000

					if var_4_78 + var_4_69 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_78 + var_4_69
					end

					if var_4_73.prefab_name ~= "" and arg_1_1.actors_[var_4_73.prefab_name] ~= nil then
						local var_4_79 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_73.prefab_name].transform, "story_v_out_109061", "109061001", "story_v_out_109061.awb")

						arg_1_1:RecordAudio("109061001", var_4_79)
						arg_1_1:RecordAudio("109061001", var_4_79)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_109061", "109061001", "story_v_out_109061.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_109061", "109061001", "story_v_out_109061.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_80 = var_4_69 + 0.3
			local var_4_81 = math.max(var_4_70, arg_1_1.talkMaxDuration)

			if var_4_80 <= arg_1_1.time_ and arg_1_1.time_ < var_4_80 + var_4_81 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_80) / var_4_81

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_80 + var_4_81 and arg_1_1.time_ < var_4_80 + var_4_81 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play109061002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 109061002
		arg_7_1.duration_ = 5.033

		local var_7_0 = {
			ja = 5.033,
			ko = 2.8,
			zh = 4.433,
			en = 3.5
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
				arg_7_0:Play109061003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["10004ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect10004ui_story == nil then
				arg_7_1.var_.characterEffect10004ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.1

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect10004ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_7_1.var_.characterEffect10004ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect10004ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_7_1.var_.characterEffect10004ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.425

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[157].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2032")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(109061002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061002", "story_v_out_109061.awb") ~= 0 then
					local var_10_14 = manager.audio:GetVoiceLength("story_v_out_109061", "109061002", "story_v_out_109061.awb") / 1000

					if var_10_14 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_14 + var_10_6
					end

					if var_10_9.prefab_name ~= "" and arg_7_1.actors_[var_10_9.prefab_name] ~= nil then
						local var_10_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_9.prefab_name].transform, "story_v_out_109061", "109061002", "story_v_out_109061.awb")

						arg_7_1:RecordAudio("109061002", var_10_15)
						arg_7_1:RecordAudio("109061002", var_10_15)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_109061", "109061002", "story_v_out_109061.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_109061", "109061002", "story_v_out_109061.awb")
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
	Play109061003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 109061003
		arg_11_1.duration_ = 10.6

		local var_11_0 = {
			ja = 10.6,
			ko = 6.8,
			zh = 6.9,
			en = 7.6
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
				arg_11_0:Play109061004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10003ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos10003ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0.7, -1.05, -5.9)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10003ui_story, var_14_4, var_14_3)

				local var_14_5 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_5.x, var_14_5.y, var_14_5.z)

				local var_14_6 = var_14_0.localEulerAngles

				var_14_6.z = 0
				var_14_6.x = 0
				var_14_0.localEulerAngles = var_14_6
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0.7, -1.05, -5.9)

				local var_14_7 = manager.ui.mainCamera.transform.position - var_14_0.position

				var_14_0.forward = Vector3.New(var_14_7.x, var_14_7.y, var_14_7.z)

				local var_14_8 = var_14_0.localEulerAngles

				var_14_8.z = 0
				var_14_8.x = 0
				var_14_0.localEulerAngles = var_14_8
			end

			local var_14_9 = arg_11_1.actors_["10004ui_story"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect10004ui_story == nil then
				arg_11_1.var_.characterEffect10004ui_story = var_14_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_11 = 0.1

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.characterEffect10004ui_story then
					local var_14_13 = Mathf.Lerp(0, 0.5, var_14_12)

					arg_11_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10004ui_story.fillRatio = var_14_13
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.characterEffect10004ui_story then
				local var_14_14 = 0.5

				arg_11_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10004ui_story.fillRatio = var_14_14
			end

			local var_14_15 = arg_11_1.actors_["10003ui_story"]
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 and arg_11_1.var_.characterEffect10003ui_story == nil then
				arg_11_1.var_.characterEffect10003ui_story = var_14_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_17 = 0.1

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17

				if arg_11_1.var_.characterEffect10003ui_story then
					arg_11_1.var_.characterEffect10003ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 and arg_11_1.var_.characterEffect10003ui_story then
				arg_11_1.var_.characterEffect10003ui_story.fillFlat = false
			end

			local var_14_19 = 0

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/story10003/story10003action/10003action1_1")
			end

			local var_14_20 = 0

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_14_21 = 0
			local var_14_22 = 0.75

			if var_14_21 < arg_11_1.time_ and arg_11_1.time_ <= var_14_21 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_23 = arg_11_1:FormatText(StoryNameCfg[81].name)

				arg_11_1.leftNameTxt_.text = var_14_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_24 = arg_11_1:GetWordFromCfg(109061003)
				local var_14_25 = arg_11_1:FormatText(var_14_24.content)

				arg_11_1.text_.text = var_14_25

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_26 = 30
				local var_14_27 = utf8.len(var_14_25)
				local var_14_28 = var_14_26 <= 0 and var_14_22 or var_14_22 * (var_14_27 / var_14_26)

				if var_14_28 > 0 and var_14_22 < var_14_28 then
					arg_11_1.talkMaxDuration = var_14_28

					if var_14_28 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_21
					end
				end

				arg_11_1.text_.text = var_14_25
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061003", "story_v_out_109061.awb") ~= 0 then
					local var_14_29 = manager.audio:GetVoiceLength("story_v_out_109061", "109061003", "story_v_out_109061.awb") / 1000

					if var_14_29 + var_14_21 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_29 + var_14_21
					end

					if var_14_24.prefab_name ~= "" and arg_11_1.actors_[var_14_24.prefab_name] ~= nil then
						local var_14_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_24.prefab_name].transform, "story_v_out_109061", "109061003", "story_v_out_109061.awb")

						arg_11_1:RecordAudio("109061003", var_14_30)
						arg_11_1:RecordAudio("109061003", var_14_30)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_109061", "109061003", "story_v_out_109061.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_109061", "109061003", "story_v_out_109061.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_31 = math.max(var_14_22, arg_11_1.talkMaxDuration)

			if var_14_21 <= arg_11_1.time_ and arg_11_1.time_ < var_14_21 + var_14_31 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_21) / var_14_31

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_21 + var_14_31 and arg_11_1.time_ < var_14_21 + var_14_31 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play109061004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 109061004
		arg_15_1.duration_ = 8.2

		local var_15_0 = {
			ja = 8.2,
			ko = 5.433,
			zh = 5.833,
			en = 6.833
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
				arg_15_0:Play109061005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_1 = 0
			local var_18_2 = 0.7

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_3 = arg_15_1:FormatText(StoryNameCfg[81].name)

				arg_15_1.leftNameTxt_.text = var_18_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_4 = arg_15_1:GetWordFromCfg(109061004)
				local var_18_5 = arg_15_1:FormatText(var_18_4.content)

				arg_15_1.text_.text = var_18_5

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_6 = 28
				local var_18_7 = utf8.len(var_18_5)
				local var_18_8 = var_18_6 <= 0 and var_18_2 or var_18_2 * (var_18_7 / var_18_6)

				if var_18_8 > 0 and var_18_2 < var_18_8 then
					arg_15_1.talkMaxDuration = var_18_8

					if var_18_8 + var_18_1 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_1
					end
				end

				arg_15_1.text_.text = var_18_5
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061004", "story_v_out_109061.awb") ~= 0 then
					local var_18_9 = manager.audio:GetVoiceLength("story_v_out_109061", "109061004", "story_v_out_109061.awb") / 1000

					if var_18_9 + var_18_1 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_9 + var_18_1
					end

					if var_18_4.prefab_name ~= "" and arg_15_1.actors_[var_18_4.prefab_name] ~= nil then
						local var_18_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_4.prefab_name].transform, "story_v_out_109061", "109061004", "story_v_out_109061.awb")

						arg_15_1:RecordAudio("109061004", var_18_10)
						arg_15_1:RecordAudio("109061004", var_18_10)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_109061", "109061004", "story_v_out_109061.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_109061", "109061004", "story_v_out_109061.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_11 = math.max(var_18_2, arg_15_1.talkMaxDuration)

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_11 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_1) / var_18_11

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_1 + var_18_11 and arg_15_1.time_ < var_18_1 + var_18_11 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play109061005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 109061005
		arg_19_1.duration_ = 13.2

		local var_19_0 = {
			ja = 13.2,
			ko = 9.233,
			zh = 12.033,
			en = 8.6
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
				arg_19_0:Play109061006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10004ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect10004ui_story == nil then
				arg_19_1.var_.characterEffect10004ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect10004ui_story then
					arg_19_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect10004ui_story then
				arg_19_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["10003ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect10003ui_story == nil then
				arg_19_1.var_.characterEffect10003ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect10003ui_story then
					local var_22_8 = Mathf.Lerp(0, 0.5, var_22_7)

					arg_19_1.var_.characterEffect10003ui_story.fillFlat = true
					arg_19_1.var_.characterEffect10003ui_story.fillRatio = var_22_8
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect10003ui_story then
				local var_22_9 = 0.5

				arg_19_1.var_.characterEffect10003ui_story.fillFlat = true
				arg_19_1.var_.characterEffect10003ui_story.fillRatio = var_22_9
			end

			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_22_11 = 0
			local var_22_12 = 0.975

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_13 = arg_19_1:FormatText(StoryNameCfg[80].name)

				arg_19_1.leftNameTxt_.text = var_22_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_14 = arg_19_1:GetWordFromCfg(109061005)
				local var_22_15 = arg_19_1:FormatText(var_22_14.content)

				arg_19_1.text_.text = var_22_15

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_16 = 39
				local var_22_17 = utf8.len(var_22_15)
				local var_22_18 = var_22_16 <= 0 and var_22_12 or var_22_12 * (var_22_17 / var_22_16)

				if var_22_18 > 0 and var_22_12 < var_22_18 then
					arg_19_1.talkMaxDuration = var_22_18

					if var_22_18 + var_22_11 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_18 + var_22_11
					end
				end

				arg_19_1.text_.text = var_22_15
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061005", "story_v_out_109061.awb") ~= 0 then
					local var_22_19 = manager.audio:GetVoiceLength("story_v_out_109061", "109061005", "story_v_out_109061.awb") / 1000

					if var_22_19 + var_22_11 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_11
					end

					if var_22_14.prefab_name ~= "" and arg_19_1.actors_[var_22_14.prefab_name] ~= nil then
						local var_22_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_14.prefab_name].transform, "story_v_out_109061", "109061005", "story_v_out_109061.awb")

						arg_19_1:RecordAudio("109061005", var_22_20)
						arg_19_1:RecordAudio("109061005", var_22_20)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_109061", "109061005", "story_v_out_109061.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_109061", "109061005", "story_v_out_109061.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_21 = math.max(var_22_12, arg_19_1.talkMaxDuration)

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_21 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_11) / var_22_21

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_11 + var_22_21 and arg_19_1.time_ < var_22_11 + var_22_21 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play109061006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 109061006
		arg_23_1.duration_ = 2.5

		local var_23_0 = {
			ja = 2.2,
			ko = 1.999999999999,
			zh = 2.3,
			en = 2.5
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
				arg_23_0:Play109061007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "3004_tpose"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("Char/" .. var_26_0), arg_23_1.stage_.transform)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_0] = var_26_1

				local var_26_2 = var_26_1:GetComponentInChildren(typeof(CharacterEffect))

				var_26_2.enabled = true

				local var_26_3 = GameObjectTools.GetOrAddComponent(var_26_1, typeof(DynamicBoneHelper))

				if var_26_3 then
					var_26_3:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_2.transform, false)

				arg_23_1.var_[var_26_0 .. "Animator"] = var_26_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_0 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_0 .. "LipSync"] = var_26_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_4 = arg_23_1.actors_["3004_tpose"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos3004_tpose = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(0.7, -2.22, -3.1)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos3004_tpose, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(0.7, -2.22, -3.1)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = arg_23_1.actors_["3004_tpose"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.characterEffect3004_tpose == nil then
				arg_23_1.var_.characterEffect3004_tpose = var_26_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_15 = 0.100000001490116

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.characterEffect3004_tpose then
					arg_23_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect3004_tpose then
				arg_23_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_26_17 = arg_23_1.actors_["10004ui_story"]
			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 and arg_23_1.var_.characterEffect10004ui_story == nil then
				arg_23_1.var_.characterEffect10004ui_story = var_26_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_19 = 0.1

			if var_26_18 <= arg_23_1.time_ and arg_23_1.time_ < var_26_18 + var_26_19 then
				local var_26_20 = (arg_23_1.time_ - var_26_18) / var_26_19

				if arg_23_1.var_.characterEffect10004ui_story then
					local var_26_21 = Mathf.Lerp(0, 0.5, var_26_20)

					arg_23_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10004ui_story.fillRatio = var_26_21
				end
			end

			if arg_23_1.time_ >= var_26_18 + var_26_19 and arg_23_1.time_ < var_26_18 + var_26_19 + arg_26_0 and arg_23_1.var_.characterEffect10004ui_story then
				local var_26_22 = 0.5

				arg_23_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10004ui_story.fillRatio = var_26_22
			end

			local var_26_23 = 0

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 then
				arg_23_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_26_24 = arg_23_1.actors_["10003ui_story"].transform
			local var_26_25 = 0

			if var_26_25 < arg_23_1.time_ and arg_23_1.time_ <= var_26_25 + arg_26_0 then
				arg_23_1.var_.moveOldPos10003ui_story = var_26_24.localPosition
			end

			local var_26_26 = 0.001

			if var_26_25 <= arg_23_1.time_ and arg_23_1.time_ < var_26_25 + var_26_26 then
				local var_26_27 = (arg_23_1.time_ - var_26_25) / var_26_26
				local var_26_28 = Vector3.New(0, 100, 0)

				var_26_24.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10003ui_story, var_26_28, var_26_27)

				local var_26_29 = manager.ui.mainCamera.transform.position - var_26_24.position

				var_26_24.forward = Vector3.New(var_26_29.x, var_26_29.y, var_26_29.z)

				local var_26_30 = var_26_24.localEulerAngles

				var_26_30.z = 0
				var_26_30.x = 0
				var_26_24.localEulerAngles = var_26_30
			end

			if arg_23_1.time_ >= var_26_25 + var_26_26 and arg_23_1.time_ < var_26_25 + var_26_26 + arg_26_0 then
				var_26_24.localPosition = Vector3.New(0, 100, 0)

				local var_26_31 = manager.ui.mainCamera.transform.position - var_26_24.position

				var_26_24.forward = Vector3.New(var_26_31.x, var_26_31.y, var_26_31.z)

				local var_26_32 = var_26_24.localEulerAngles

				var_26_32.z = 0
				var_26_32.x = 0
				var_26_24.localEulerAngles = var_26_32
			end

			local var_26_33 = 0
			local var_26_34 = 0.175

			if var_26_33 < arg_23_1.time_ and arg_23_1.time_ <= var_26_33 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_35 = arg_23_1:FormatText(StoryNameCfg[82].name)

				arg_23_1.leftNameTxt_.text = var_26_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_36 = arg_23_1:GetWordFromCfg(109061006)
				local var_26_37 = arg_23_1:FormatText(var_26_36.content)

				arg_23_1.text_.text = var_26_37

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_38 = 7
				local var_26_39 = utf8.len(var_26_37)
				local var_26_40 = var_26_38 <= 0 and var_26_34 or var_26_34 * (var_26_39 / var_26_38)

				if var_26_40 > 0 and var_26_34 < var_26_40 then
					arg_23_1.talkMaxDuration = var_26_40

					if var_26_40 + var_26_33 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_40 + var_26_33
					end
				end

				arg_23_1.text_.text = var_26_37
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061006", "story_v_out_109061.awb") ~= 0 then
					local var_26_41 = manager.audio:GetVoiceLength("story_v_out_109061", "109061006", "story_v_out_109061.awb") / 1000

					if var_26_41 + var_26_33 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_41 + var_26_33
					end

					if var_26_36.prefab_name ~= "" and arg_23_1.actors_[var_26_36.prefab_name] ~= nil then
						local var_26_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_36.prefab_name].transform, "story_v_out_109061", "109061006", "story_v_out_109061.awb")

						arg_23_1:RecordAudio("109061006", var_26_42)
						arg_23_1:RecordAudio("109061006", var_26_42)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_109061", "109061006", "story_v_out_109061.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_109061", "109061006", "story_v_out_109061.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_43 = math.max(var_26_34, arg_23_1.talkMaxDuration)

			if var_26_33 <= arg_23_1.time_ and arg_23_1.time_ < var_26_33 + var_26_43 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_33) / var_26_43

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_33 + var_26_43 and arg_23_1.time_ < var_26_33 + var_26_43 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play109061007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 109061007
		arg_27_1.duration_ = 1.999999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play109061008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["3004_tpose"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect3004_tpose == nil then
				arg_27_1.var_.characterEffect3004_tpose = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.100000001490116

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect3004_tpose then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_27_1.var_.characterEffect3004_tpose.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect3004_tpose then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_27_1.var_.characterEffect3004_tpose.fillRatio = var_30_5
			end

			local var_30_6 = arg_27_1.actors_["10004ui_story"]
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 and arg_27_1.var_.characterEffect10004ui_story == nil then
				arg_27_1.var_.characterEffect10004ui_story = var_30_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_8 = 0.1

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8

				if arg_27_1.var_.characterEffect10004ui_story then
					arg_27_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 and arg_27_1.var_.characterEffect10004ui_story then
				arg_27_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action3_2")
			end

			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_30_12 = 0
			local var_30_13 = 0.1

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_14 = arg_27_1:FormatText(StoryNameCfg[80].name)

				arg_27_1.leftNameTxt_.text = var_30_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_15 = arg_27_1:GetWordFromCfg(109061007)
				local var_30_16 = arg_27_1:FormatText(var_30_15.content)

				arg_27_1.text_.text = var_30_16

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_17 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061007", "story_v_out_109061.awb") ~= 0 then
					local var_30_20 = manager.audio:GetVoiceLength("story_v_out_109061", "109061007", "story_v_out_109061.awb") / 1000

					if var_30_20 + var_30_12 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_20 + var_30_12
					end

					if var_30_15.prefab_name ~= "" and arg_27_1.actors_[var_30_15.prefab_name] ~= nil then
						local var_30_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_15.prefab_name].transform, "story_v_out_109061", "109061007", "story_v_out_109061.awb")

						arg_27_1:RecordAudio("109061007", var_30_21)
						arg_27_1:RecordAudio("109061007", var_30_21)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_109061", "109061007", "story_v_out_109061.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_109061", "109061007", "story_v_out_109061.awb")
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
	Play109061008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 109061008
		arg_31_1.duration_ = 4.566

		local var_31_0 = {
			ja = 2.8,
			ko = 4.566,
			zh = 4.166,
			en = 4
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
				arg_31_0:Play109061009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["3004_tpose"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect3004_tpose == nil then
				arg_31_1.var_.characterEffect3004_tpose = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.100000001490116

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect3004_tpose then
					arg_31_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect3004_tpose then
				arg_31_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["10004ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect10004ui_story == nil then
				arg_31_1.var_.characterEffect10004ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect10004ui_story then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10004ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect10004ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10004ui_story.fillRatio = var_34_9
			end

			local var_34_10 = 0
			local var_34_11 = 0.4

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_12 = arg_31_1:FormatText(StoryNameCfg[82].name)

				arg_31_1.leftNameTxt_.text = var_34_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_13 = arg_31_1:GetWordFromCfg(109061008)
				local var_34_14 = arg_31_1:FormatText(var_34_13.content)

				arg_31_1.text_.text = var_34_14

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_15 = 16
				local var_34_16 = utf8.len(var_34_14)
				local var_34_17 = var_34_15 <= 0 and var_34_11 or var_34_11 * (var_34_16 / var_34_15)

				if var_34_17 > 0 and var_34_11 < var_34_17 then
					arg_31_1.talkMaxDuration = var_34_17

					if var_34_17 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_17 + var_34_10
					end
				end

				arg_31_1.text_.text = var_34_14
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061008", "story_v_out_109061.awb") ~= 0 then
					local var_34_18 = manager.audio:GetVoiceLength("story_v_out_109061", "109061008", "story_v_out_109061.awb") / 1000

					if var_34_18 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_10
					end

					if var_34_13.prefab_name ~= "" and arg_31_1.actors_[var_34_13.prefab_name] ~= nil then
						local var_34_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_13.prefab_name].transform, "story_v_out_109061", "109061008", "story_v_out_109061.awb")

						arg_31_1:RecordAudio("109061008", var_34_19)
						arg_31_1:RecordAudio("109061008", var_34_19)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_109061", "109061008", "story_v_out_109061.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_109061", "109061008", "story_v_out_109061.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_20 = math.max(var_34_11, arg_31_1.talkMaxDuration)

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_20 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_10) / var_34_20

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_10 + var_34_20 and arg_31_1.time_ < var_34_10 + var_34_20 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play109061009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 109061009
		arg_35_1.duration_ = 5.766

		local var_35_0 = {
			ja = 5.766,
			ko = 3.9,
			zh = 4.4,
			en = 3.266
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
				arg_35_0:Play109061010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.45

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[82].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(109061009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061009", "story_v_out_109061.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_109061", "109061009", "story_v_out_109061.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_109061", "109061009", "story_v_out_109061.awb")

						arg_35_1:RecordAudio("109061009", var_38_9)
						arg_35_1:RecordAudio("109061009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_109061", "109061009", "story_v_out_109061.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_109061", "109061009", "story_v_out_109061.awb")
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
	Play109061010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 109061010
		arg_39_1.duration_ = 6.633

		local var_39_0 = {
			ja = 5.133,
			ko = 5.533,
			zh = 6.633,
			en = 4.4
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
				arg_39_0:Play109061011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = manager.ui.mainCamera.transform
			local var_42_1 = 0.5

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.shakeOldPos = var_42_0.localPosition
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / 0.066
				local var_42_4, var_42_5 = math.modf(var_42_3)

				var_42_0.localPosition = Vector3.New(var_42_5 * 0.13, var_42_5 * 0.13, var_42_5 * 0.13) + arg_39_1.var_.shakeOldPos
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = arg_39_1.var_.shakeOldPos
			end

			local var_42_6 = arg_39_1.actors_["3004_tpose"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect3004_tpose == nil then
				arg_39_1.var_.characterEffect3004_tpose = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.100000001490116

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect3004_tpose then
					local var_42_10 = Mathf.Lerp(0, 0.5, var_42_9)

					arg_39_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_39_1.var_.characterEffect3004_tpose.fillRatio = var_42_10
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect3004_tpose then
				local var_42_11 = 0.5

				arg_39_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_39_1.var_.characterEffect3004_tpose.fillRatio = var_42_11
			end

			local var_42_12 = 0
			local var_42_13 = 0.65

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[76].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6065")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(109061010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 26
				local var_42_18 = utf8.len(var_42_16)
				local var_42_19 = var_42_17 <= 0 and var_42_13 or var_42_13 * (var_42_18 / var_42_17)

				if var_42_19 > 0 and var_42_13 < var_42_19 then
					arg_39_1.talkMaxDuration = var_42_19

					if var_42_19 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_12
					end
				end

				arg_39_1.text_.text = var_42_16
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061010", "story_v_out_109061.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_109061", "109061010", "story_v_out_109061.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_109061", "109061010", "story_v_out_109061.awb")

						arg_39_1:RecordAudio("109061010", var_42_21)
						arg_39_1:RecordAudio("109061010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_109061", "109061010", "story_v_out_109061.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_109061", "109061010", "story_v_out_109061.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_13, arg_39_1.talkMaxDuration)

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_12) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_12 + var_42_22 and arg_39_1.time_ < var_42_12 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play109061011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 109061011
		arg_43_1.duration_ = 2.9

		local var_43_0 = {
			ja = 2.866,
			ko = 1.999999999999,
			zh = 2.9,
			en = 2.366
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
				arg_43_0:Play109061012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["3004_tpose"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect3004_tpose == nil then
				arg_43_1.var_.characterEffect3004_tpose = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.100000001490116

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect3004_tpose then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_43_1.var_.characterEffect3004_tpose.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect3004_tpose then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_43_1.var_.characterEffect3004_tpose.fillRatio = var_46_5
			end

			local var_46_6 = arg_43_1.actors_["10004ui_story"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect10004ui_story == nil then
				arg_43_1.var_.characterEffect10004ui_story = var_46_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_8 = 0.1

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8

				if arg_43_1.var_.characterEffect10004ui_story then
					arg_43_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 and arg_43_1.var_.characterEffect10004ui_story then
				arg_43_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_46_11 = 0
			local var_46_12 = 0.175

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_13 = arg_43_1:FormatText(StoryNameCfg[80].name)

				arg_43_1.leftNameTxt_.text = var_46_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_14 = arg_43_1:GetWordFromCfg(109061011)
				local var_46_15 = arg_43_1:FormatText(var_46_14.content)

				arg_43_1.text_.text = var_46_15

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_16 = 7
				local var_46_17 = utf8.len(var_46_15)
				local var_46_18 = var_46_16 <= 0 and var_46_12 or var_46_12 * (var_46_17 / var_46_16)

				if var_46_18 > 0 and var_46_12 < var_46_18 then
					arg_43_1.talkMaxDuration = var_46_18

					if var_46_18 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_18 + var_46_11
					end
				end

				arg_43_1.text_.text = var_46_15
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061011", "story_v_out_109061.awb") ~= 0 then
					local var_46_19 = manager.audio:GetVoiceLength("story_v_out_109061", "109061011", "story_v_out_109061.awb") / 1000

					if var_46_19 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_11
					end

					if var_46_14.prefab_name ~= "" and arg_43_1.actors_[var_46_14.prefab_name] ~= nil then
						local var_46_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_14.prefab_name].transform, "story_v_out_109061", "109061011", "story_v_out_109061.awb")

						arg_43_1:RecordAudio("109061011", var_46_20)
						arg_43_1:RecordAudio("109061011", var_46_20)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_109061", "109061011", "story_v_out_109061.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_109061", "109061011", "story_v_out_109061.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_21 = math.max(var_46_12, arg_43_1.talkMaxDuration)

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_21 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_11) / var_46_21

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_11 + var_46_21 and arg_43_1.time_ < var_46_11 + var_46_21 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play109061012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 109061012
		arg_47_1.duration_ = 8.266

		local var_47_0 = {
			ja = 8.266,
			ko = 7.233,
			zh = 7.366,
			en = 6.766
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
				arg_47_0:Play109061013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["3004_tpose"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect3004_tpose == nil then
				arg_47_1.var_.characterEffect3004_tpose = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect3004_tpose then
					arg_47_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect3004_tpose then
				arg_47_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["10004ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect10004ui_story == nil then
				arg_47_1.var_.characterEffect10004ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.2

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect10004ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_47_1.var_.characterEffect10004ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect10004ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_47_1.var_.characterEffect10004ui_story.fillRatio = var_50_9
			end

			local var_50_10 = 0
			local var_50_11 = 0.775

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_12 = arg_47_1:FormatText(StoryNameCfg[82].name)

				arg_47_1.leftNameTxt_.text = var_50_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_13 = arg_47_1:GetWordFromCfg(109061012)
				local var_50_14 = arg_47_1:FormatText(var_50_13.content)

				arg_47_1.text_.text = var_50_14

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_15 = 31
				local var_50_16 = utf8.len(var_50_14)
				local var_50_17 = var_50_15 <= 0 and var_50_11 or var_50_11 * (var_50_16 / var_50_15)

				if var_50_17 > 0 and var_50_11 < var_50_17 then
					arg_47_1.talkMaxDuration = var_50_17

					if var_50_17 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_17 + var_50_10
					end
				end

				arg_47_1.text_.text = var_50_14
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061012", "story_v_out_109061.awb") ~= 0 then
					local var_50_18 = manager.audio:GetVoiceLength("story_v_out_109061", "109061012", "story_v_out_109061.awb") / 1000

					if var_50_18 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_18 + var_50_10
					end

					if var_50_13.prefab_name ~= "" and arg_47_1.actors_[var_50_13.prefab_name] ~= nil then
						local var_50_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_13.prefab_name].transform, "story_v_out_109061", "109061012", "story_v_out_109061.awb")

						arg_47_1:RecordAudio("109061012", var_50_19)
						arg_47_1:RecordAudio("109061012", var_50_19)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_109061", "109061012", "story_v_out_109061.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_109061", "109061012", "story_v_out_109061.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_20 = math.max(var_50_11, arg_47_1.talkMaxDuration)

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_20 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_10) / var_50_20

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_10 + var_50_20 and arg_47_1.time_ < var_50_10 + var_50_20 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play109061013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 109061013
		arg_51_1.duration_ = 1.8

		local var_51_0 = {
			ja = 1.8,
			ko = 1.2,
			zh = 1.533,
			en = 1.633
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
				arg_51_0:Play109061014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["3004_tpose"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect3004_tpose == nil then
				arg_51_1.var_.characterEffect3004_tpose = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.100000001490116

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect3004_tpose then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_51_1.var_.characterEffect3004_tpose.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect3004_tpose then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_51_1.var_.characterEffect3004_tpose.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.125

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[81].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10003")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(109061013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061013", "story_v_out_109061.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_109061", "109061013", "story_v_out_109061.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_109061", "109061013", "story_v_out_109061.awb")

						arg_51_1:RecordAudio("109061013", var_54_15)
						arg_51_1:RecordAudio("109061013", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_109061", "109061013", "story_v_out_109061.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_109061", "109061013", "story_v_out_109061.awb")
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
	Play109061014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 109061014
		arg_55_1.duration_ = 6.7

		local var_55_0 = {
			ja = 3.966,
			ko = 3.5,
			zh = 3.233,
			en = 6.7
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
				arg_55_0:Play109061015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.3

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[76].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6065")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(109061014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061014", "story_v_out_109061.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_109061", "109061014", "story_v_out_109061.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_109061", "109061014", "story_v_out_109061.awb")

						arg_55_1:RecordAudio("109061014", var_58_9)
						arg_55_1:RecordAudio("109061014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_109061", "109061014", "story_v_out_109061.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_109061", "109061014", "story_v_out_109061.awb")
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
	Play109061015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 109061015
		arg_59_1.duration_ = 5

		local var_59_0 = {
			ja = 4.466,
			ko = 5,
			zh = 4.166,
			en = 4.7
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
				arg_59_0:Play109061016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.45

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[81].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10003")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(109061015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061015", "story_v_out_109061.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_109061", "109061015", "story_v_out_109061.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_109061", "109061015", "story_v_out_109061.awb")

						arg_59_1:RecordAudio("109061015", var_62_9)
						arg_59_1:RecordAudio("109061015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_109061", "109061015", "story_v_out_109061.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_109061", "109061015", "story_v_out_109061.awb")
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
	Play109061016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 109061016
		arg_63_1.duration_ = 6.8

		local var_63_0 = {
			ja = 5.2,
			ko = 4.3,
			zh = 6.366,
			en = 6.8
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
				arg_63_0:Play109061017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.825

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[76].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6065")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(109061016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061016", "story_v_out_109061.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_109061", "109061016", "story_v_out_109061.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_109061", "109061016", "story_v_out_109061.awb")

						arg_63_1:RecordAudio("109061016", var_66_9)
						arg_63_1:RecordAudio("109061016", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_109061", "109061016", "story_v_out_109061.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_109061", "109061016", "story_v_out_109061.awb")
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
	Play109061017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 109061017
		arg_67_1.duration_ = 3.4

		local var_67_0 = {
			ja = 2.833,
			ko = 2.166,
			zh = 3.366,
			en = 3.4
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
				arg_67_0:Play109061018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["3004_tpose"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect3004_tpose == nil then
				arg_67_1.var_.characterEffect3004_tpose = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect3004_tpose then
					arg_67_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect3004_tpose then
				arg_67_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_70_4 = 0
			local var_70_5 = 0.175

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_6 = arg_67_1:FormatText(StoryNameCfg[82].name)

				arg_67_1.leftNameTxt_.text = var_70_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_7 = arg_67_1:GetWordFromCfg(109061017)
				local var_70_8 = arg_67_1:FormatText(var_70_7.content)

				arg_67_1.text_.text = var_70_8

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_9 = 7
				local var_70_10 = utf8.len(var_70_8)
				local var_70_11 = var_70_9 <= 0 and var_70_5 or var_70_5 * (var_70_10 / var_70_9)

				if var_70_11 > 0 and var_70_5 < var_70_11 then
					arg_67_1.talkMaxDuration = var_70_11

					if var_70_11 + var_70_4 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_11 + var_70_4
					end
				end

				arg_67_1.text_.text = var_70_8
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061017", "story_v_out_109061.awb") ~= 0 then
					local var_70_12 = manager.audio:GetVoiceLength("story_v_out_109061", "109061017", "story_v_out_109061.awb") / 1000

					if var_70_12 + var_70_4 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_12 + var_70_4
					end

					if var_70_7.prefab_name ~= "" and arg_67_1.actors_[var_70_7.prefab_name] ~= nil then
						local var_70_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_7.prefab_name].transform, "story_v_out_109061", "109061017", "story_v_out_109061.awb")

						arg_67_1:RecordAudio("109061017", var_70_13)
						arg_67_1:RecordAudio("109061017", var_70_13)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_109061", "109061017", "story_v_out_109061.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_109061", "109061017", "story_v_out_109061.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_14 = math.max(var_70_5, arg_67_1.talkMaxDuration)

			if var_70_4 <= arg_67_1.time_ and arg_67_1.time_ < var_70_4 + var_70_14 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_4) / var_70_14

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_4 + var_70_14 and arg_67_1.time_ < var_70_4 + var_70_14 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play109061018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 109061018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play109061019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.475

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(109061018)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 19
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play109061019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 109061019
		arg_75_1.duration_ = 4.066

		local var_75_0 = {
			ja = 4.066,
			ko = 2.6,
			zh = 2.466,
			en = 3.233
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
				arg_75_0:Play109061020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = manager.ui.mainCamera.transform
			local var_78_1 = 0.1

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.shakeOldPos = var_78_0.localPosition
			end

			local var_78_2 = 0.8

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / 0.099
				local var_78_4, var_78_5 = math.modf(var_78_3)

				var_78_0.localPosition = Vector3.New(var_78_5 * 0.13, var_78_5 * 0.13, var_78_5 * 0.13) + arg_75_1.var_.shakeOldPos
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = arg_75_1.var_.shakeOldPos
			end

			local var_78_6 = 0
			local var_78_7 = 0.2

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_8 = arg_75_1:FormatText(StoryNameCfg[76].name)

				arg_75_1.leftNameTxt_.text = var_78_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6065")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_9 = arg_75_1:GetWordFromCfg(109061019)
				local var_78_10 = arg_75_1:FormatText(var_78_9.content)

				arg_75_1.text_.text = var_78_10

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_11 = 8
				local var_78_12 = utf8.len(var_78_10)
				local var_78_13 = var_78_11 <= 0 and var_78_7 or var_78_7 * (var_78_12 / var_78_11)

				if var_78_13 > 0 and var_78_7 < var_78_13 then
					arg_75_1.talkMaxDuration = var_78_13

					if var_78_13 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_13 + var_78_6
					end
				end

				arg_75_1.text_.text = var_78_10
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061019", "story_v_out_109061.awb") ~= 0 then
					local var_78_14 = manager.audio:GetVoiceLength("story_v_out_109061", "109061019", "story_v_out_109061.awb") / 1000

					if var_78_14 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_14 + var_78_6
					end

					if var_78_9.prefab_name ~= "" and arg_75_1.actors_[var_78_9.prefab_name] ~= nil then
						local var_78_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_9.prefab_name].transform, "story_v_out_109061", "109061019", "story_v_out_109061.awb")

						arg_75_1:RecordAudio("109061019", var_78_15)
						arg_75_1:RecordAudio("109061019", var_78_15)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_109061", "109061019", "story_v_out_109061.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_109061", "109061019", "story_v_out_109061.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_16 = math.max(var_78_7, arg_75_1.talkMaxDuration)

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_16 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_6) / var_78_16

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_6 + var_78_16 and arg_75_1.time_ < var_78_6 + var_78_16 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play109061020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 109061020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play109061021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["3004_tpose"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos3004_tpose = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, 100, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos3004_tpose, var_82_4, var_82_3)

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

			local var_82_9 = arg_79_1.actors_["10004ui_story"].transform
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1.var_.moveOldPos10004ui_story = var_82_9.localPosition
			end

			local var_82_11 = 0.001

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11
				local var_82_13 = Vector3.New(0, 100, 0)

				var_82_9.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10004ui_story, var_82_13, var_82_12)

				local var_82_14 = manager.ui.mainCamera.transform.position - var_82_9.position

				var_82_9.forward = Vector3.New(var_82_14.x, var_82_14.y, var_82_14.z)

				local var_82_15 = var_82_9.localEulerAngles

				var_82_15.z = 0
				var_82_15.x = 0
				var_82_9.localEulerAngles = var_82_15
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 then
				var_82_9.localPosition = Vector3.New(0, 100, 0)

				local var_82_16 = manager.ui.mainCamera.transform.position - var_82_9.position

				var_82_9.forward = Vector3.New(var_82_16.x, var_82_16.y, var_82_16.z)

				local var_82_17 = var_82_9.localEulerAngles

				var_82_17.z = 0
				var_82_17.x = 0
				var_82_9.localEulerAngles = var_82_17
			end

			local var_82_18 = 0
			local var_82_19 = 0.925

			if var_82_18 < arg_79_1.time_ and arg_79_1.time_ <= var_82_18 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				arg_79_1.dialog_:SetActive(true)

				local var_82_20 = LeanTween.value(arg_79_1.dialog_, 0, 1, 0.3)

				var_82_20:setOnUpdate(LuaHelper.FloatAction(function(arg_83_0)
					arg_79_1.dialogCg_.alpha = arg_83_0
				end))
				var_82_20:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_79_1.dialog_)
					var_82_20:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_79_1.duration_ = arg_79_1.duration_ + 0.3

				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_21 = arg_79_1:GetWordFromCfg(109061020)
				local var_82_22 = arg_79_1:FormatText(var_82_21.content)

				arg_79_1.text_.text = var_82_22

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_23 = 37
				local var_82_24 = utf8.len(var_82_22)
				local var_82_25 = var_82_23 <= 0 and var_82_19 or var_82_19 * (var_82_24 / var_82_23)

				if var_82_25 > 0 and var_82_19 < var_82_25 then
					arg_79_1.talkMaxDuration = var_82_25
					var_82_18 = var_82_18 + 0.3

					if var_82_25 + var_82_18 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_25 + var_82_18
					end
				end

				arg_79_1.text_.text = var_82_22
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_26 = var_82_18 + 0.3
			local var_82_27 = math.max(var_82_19, arg_79_1.talkMaxDuration)

			if var_82_26 <= arg_79_1.time_ and arg_79_1.time_ < var_82_26 + var_82_27 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_26) / var_82_27

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_26 + var_82_27 and arg_79_1.time_ < var_82_26 + var_82_27 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play109061021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 109061021
		arg_85_1.duration_ = 2.8

		local var_85_0 = {
			ja = 2.5,
			ko = 2.1,
			zh = 2.8,
			en = 2.466
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
				arg_85_0:Play109061022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = "1084ui_story"

			if arg_85_1.actors_[var_88_0] == nil then
				local var_88_1 = Object.Instantiate(Asset.Load("Char/" .. var_88_0), arg_85_1.stage_.transform)

				var_88_1.name = var_88_0
				var_88_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_85_1.actors_[var_88_0] = var_88_1

				local var_88_2 = var_88_1:GetComponentInChildren(typeof(CharacterEffect))

				var_88_2.enabled = true

				local var_88_3 = GameObjectTools.GetOrAddComponent(var_88_1, typeof(DynamicBoneHelper))

				if var_88_3 then
					var_88_3:EnableDynamicBone(false)
				end

				arg_85_1:ShowWeapon(var_88_2.transform, false)

				arg_85_1.var_[var_88_0 .. "Animator"] = var_88_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_85_1.var_[var_88_0 .. "Animator"].applyRootMotion = true
				arg_85_1.var_[var_88_0 .. "LipSync"] = var_88_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_88_4 = arg_85_1.actors_["1084ui_story"].transform
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 then
				arg_85_1.var_.moveOldPos1084ui_story = var_88_4.localPosition
			end

			local var_88_6 = 0.001

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6
				local var_88_8 = Vector3.New(0, -0.97, -6)

				var_88_4.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1084ui_story, var_88_8, var_88_7)

				local var_88_9 = manager.ui.mainCamera.transform.position - var_88_4.position

				var_88_4.forward = Vector3.New(var_88_9.x, var_88_9.y, var_88_9.z)

				local var_88_10 = var_88_4.localEulerAngles

				var_88_10.z = 0
				var_88_10.x = 0
				var_88_4.localEulerAngles = var_88_10
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 then
				var_88_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_88_11 = manager.ui.mainCamera.transform.position - var_88_4.position

				var_88_4.forward = Vector3.New(var_88_11.x, var_88_11.y, var_88_11.z)

				local var_88_12 = var_88_4.localEulerAngles

				var_88_12.z = 0
				var_88_12.x = 0
				var_88_4.localEulerAngles = var_88_12
			end

			local var_88_13 = arg_85_1.actors_["1084ui_story"]
			local var_88_14 = 0

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story == nil then
				arg_85_1.var_.characterEffect1084ui_story = var_88_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_15 = 0.2

			if var_88_14 <= arg_85_1.time_ and arg_85_1.time_ < var_88_14 + var_88_15 then
				local var_88_16 = (arg_85_1.time_ - var_88_14) / var_88_15

				if arg_85_1.var_.characterEffect1084ui_story then
					arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_14 + var_88_15 and arg_85_1.time_ < var_88_14 + var_88_15 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story then
				arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_88_17 = 0

			if var_88_17 < arg_85_1.time_ and arg_85_1.time_ <= var_88_17 + arg_88_0 then
				arg_85_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_88_18 = 0

			if var_88_18 < arg_85_1.time_ and arg_85_1.time_ <= var_88_18 + arg_88_0 then
				arg_85_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_88_19 = 0
			local var_88_20 = 0.25

			if var_88_19 < arg_85_1.time_ and arg_85_1.time_ <= var_88_19 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_21 = arg_85_1:FormatText(StoryNameCfg[6].name)

				arg_85_1.leftNameTxt_.text = var_88_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_22 = arg_85_1:GetWordFromCfg(109061021)
				local var_88_23 = arg_85_1:FormatText(var_88_22.content)

				arg_85_1.text_.text = var_88_23

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_24 = 10
				local var_88_25 = utf8.len(var_88_23)
				local var_88_26 = var_88_24 <= 0 and var_88_20 or var_88_20 * (var_88_25 / var_88_24)

				if var_88_26 > 0 and var_88_20 < var_88_26 then
					arg_85_1.talkMaxDuration = var_88_26

					if var_88_26 + var_88_19 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_26 + var_88_19
					end
				end

				arg_85_1.text_.text = var_88_23
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061021", "story_v_out_109061.awb") ~= 0 then
					local var_88_27 = manager.audio:GetVoiceLength("story_v_out_109061", "109061021", "story_v_out_109061.awb") / 1000

					if var_88_27 + var_88_19 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_27 + var_88_19
					end

					if var_88_22.prefab_name ~= "" and arg_85_1.actors_[var_88_22.prefab_name] ~= nil then
						local var_88_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_22.prefab_name].transform, "story_v_out_109061", "109061021", "story_v_out_109061.awb")

						arg_85_1:RecordAudio("109061021", var_88_28)
						arg_85_1:RecordAudio("109061021", var_88_28)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_109061", "109061021", "story_v_out_109061.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_109061", "109061021", "story_v_out_109061.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_29 = math.max(var_88_20, arg_85_1.talkMaxDuration)

			if var_88_19 <= arg_85_1.time_ and arg_85_1.time_ < var_88_19 + var_88_29 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_19) / var_88_29

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_19 + var_88_29 and arg_85_1.time_ < var_88_19 + var_88_29 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play109061022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 109061022
		arg_89_1.duration_ = 7.466

		local var_89_0 = {
			ja = 7.466,
			ko = 6.233,
			zh = 6.6,
			en = 6.966
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
				arg_89_0:Play109061023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.4

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[76].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6065")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(109061022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061022", "story_v_out_109061.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_109061", "109061022", "story_v_out_109061.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_109061", "109061022", "story_v_out_109061.awb")

						arg_89_1:RecordAudio("109061022", var_92_9)
						arg_89_1:RecordAudio("109061022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_109061", "109061022", "story_v_out_109061.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_109061", "109061022", "story_v_out_109061.awb")
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
	Play109061023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 109061023
		arg_93_1.duration_ = 9.533

		local var_93_0 = {
			ja = 5.933,
			ko = 6.633,
			zh = 8.3,
			en = 9.533
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
				arg_93_0:Play109061024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1084ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1084ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(0, 100, 0)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1084ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, 100, 0)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = arg_93_1.actors_["3004_tpose"].transform
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 then
				arg_93_1.var_.moveOldPos3004_tpose = var_96_9.localPosition
			end

			local var_96_11 = 0.001

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11
				local var_96_13 = Vector3.New(0, -2.22, -3.1)

				var_96_9.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos3004_tpose, var_96_13, var_96_12)

				local var_96_14 = manager.ui.mainCamera.transform.position - var_96_9.position

				var_96_9.forward = Vector3.New(var_96_14.x, var_96_14.y, var_96_14.z)

				local var_96_15 = var_96_9.localEulerAngles

				var_96_15.z = 0
				var_96_15.x = 0
				var_96_9.localEulerAngles = var_96_15
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 then
				var_96_9.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_96_16 = manager.ui.mainCamera.transform.position - var_96_9.position

				var_96_9.forward = Vector3.New(var_96_16.x, var_96_16.y, var_96_16.z)

				local var_96_17 = var_96_9.localEulerAngles

				var_96_17.z = 0
				var_96_17.x = 0
				var_96_9.localEulerAngles = var_96_17
			end

			local var_96_18 = arg_93_1.actors_["3004_tpose"]
			local var_96_19 = 0

			if var_96_19 < arg_93_1.time_ and arg_93_1.time_ <= var_96_19 + arg_96_0 and arg_93_1.var_.characterEffect3004_tpose == nil then
				arg_93_1.var_.characterEffect3004_tpose = var_96_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_20 = 0.2

			if var_96_19 <= arg_93_1.time_ and arg_93_1.time_ < var_96_19 + var_96_20 then
				local var_96_21 = (arg_93_1.time_ - var_96_19) / var_96_20

				if arg_93_1.var_.characterEffect3004_tpose then
					arg_93_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_19 + var_96_20 and arg_93_1.time_ < var_96_19 + var_96_20 + arg_96_0 and arg_93_1.var_.characterEffect3004_tpose then
				arg_93_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_96_22 = 0

			if var_96_22 < arg_93_1.time_ and arg_93_1.time_ <= var_96_22 + arg_96_0 then
				arg_93_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_96_23 = 0
			local var_96_24 = 0.7

			if var_96_23 < arg_93_1.time_ and arg_93_1.time_ <= var_96_23 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_25 = arg_93_1:FormatText(StoryNameCfg[82].name)

				arg_93_1.leftNameTxt_.text = var_96_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_26 = arg_93_1:GetWordFromCfg(109061023)
				local var_96_27 = arg_93_1:FormatText(var_96_26.content)

				arg_93_1.text_.text = var_96_27

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_28 = 28
				local var_96_29 = utf8.len(var_96_27)
				local var_96_30 = var_96_28 <= 0 and var_96_24 or var_96_24 * (var_96_29 / var_96_28)

				if var_96_30 > 0 and var_96_24 < var_96_30 then
					arg_93_1.talkMaxDuration = var_96_30

					if var_96_30 + var_96_23 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_30 + var_96_23
					end
				end

				arg_93_1.text_.text = var_96_27
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061023", "story_v_out_109061.awb") ~= 0 then
					local var_96_31 = manager.audio:GetVoiceLength("story_v_out_109061", "109061023", "story_v_out_109061.awb") / 1000

					if var_96_31 + var_96_23 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_31 + var_96_23
					end

					if var_96_26.prefab_name ~= "" and arg_93_1.actors_[var_96_26.prefab_name] ~= nil then
						local var_96_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_26.prefab_name].transform, "story_v_out_109061", "109061023", "story_v_out_109061.awb")

						arg_93_1:RecordAudio("109061023", var_96_32)
						arg_93_1:RecordAudio("109061023", var_96_32)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_109061", "109061023", "story_v_out_109061.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_109061", "109061023", "story_v_out_109061.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_33 = math.max(var_96_24, arg_93_1.talkMaxDuration)

			if var_96_23 <= arg_93_1.time_ and arg_93_1.time_ < var_96_23 + var_96_33 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_23) / var_96_33

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_23 + var_96_33 and arg_93_1.time_ < var_96_23 + var_96_33 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play109061024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 109061024
		arg_97_1.duration_ = 4.633

		local var_97_0 = {
			ja = 2.466,
			ko = 2.8,
			zh = 3.7,
			en = 4.633
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
				arg_97_0:Play109061025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["3004_tpose"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos3004_tpose = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, 100, 0)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos3004_tpose, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, 100, 0)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = "1099ui_story"

			if arg_97_1.actors_[var_100_9] == nil then
				local var_100_10 = Object.Instantiate(Asset.Load("Char/" .. var_100_9), arg_97_1.stage_.transform)

				var_100_10.name = var_100_9
				var_100_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.actors_[var_100_9] = var_100_10

				local var_100_11 = var_100_10:GetComponentInChildren(typeof(CharacterEffect))

				var_100_11.enabled = true

				local var_100_12 = GameObjectTools.GetOrAddComponent(var_100_10, typeof(DynamicBoneHelper))

				if var_100_12 then
					var_100_12:EnableDynamicBone(false)
				end

				arg_97_1:ShowWeapon(var_100_11.transform, false)

				arg_97_1.var_[var_100_9 .. "Animator"] = var_100_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_97_1.var_[var_100_9 .. "Animator"].applyRootMotion = true
				arg_97_1.var_[var_100_9 .. "LipSync"] = var_100_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_100_13 = arg_97_1.actors_["1099ui_story"].transform
			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1.var_.moveOldPos1099ui_story = var_100_13.localPosition
			end

			local var_100_15 = 0.001

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15
				local var_100_17 = Vector3.New(0, -1.08, -5.9)

				var_100_13.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1099ui_story, var_100_17, var_100_16)

				local var_100_18 = manager.ui.mainCamera.transform.position - var_100_13.position

				var_100_13.forward = Vector3.New(var_100_18.x, var_100_18.y, var_100_18.z)

				local var_100_19 = var_100_13.localEulerAngles

				var_100_19.z = 0
				var_100_19.x = 0
				var_100_13.localEulerAngles = var_100_19
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 then
				var_100_13.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_100_20 = manager.ui.mainCamera.transform.position - var_100_13.position

				var_100_13.forward = Vector3.New(var_100_20.x, var_100_20.y, var_100_20.z)

				local var_100_21 = var_100_13.localEulerAngles

				var_100_21.z = 0
				var_100_21.x = 0
				var_100_13.localEulerAngles = var_100_21
			end

			local var_100_22 = 0

			if var_100_22 < arg_97_1.time_ and arg_97_1.time_ <= var_100_22 + arg_100_0 then
				arg_97_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_1")
			end

			local var_100_23 = arg_97_1.actors_["1099ui_story"]
			local var_100_24 = 0

			if var_100_24 < arg_97_1.time_ and arg_97_1.time_ <= var_100_24 + arg_100_0 and arg_97_1.var_.characterEffect1099ui_story == nil then
				arg_97_1.var_.characterEffect1099ui_story = var_100_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_25 = 0.2

			if var_100_24 <= arg_97_1.time_ and arg_97_1.time_ < var_100_24 + var_100_25 then
				local var_100_26 = (arg_97_1.time_ - var_100_24) / var_100_25

				if arg_97_1.var_.characterEffect1099ui_story then
					arg_97_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_24 + var_100_25 and arg_97_1.time_ < var_100_24 + var_100_25 + arg_100_0 and arg_97_1.var_.characterEffect1099ui_story then
				arg_97_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_100_27 = 0

			if var_100_27 < arg_97_1.time_ and arg_97_1.time_ <= var_100_27 + arg_100_0 then
				arg_97_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_100_28 = 0
			local var_100_29 = 0.425

			if var_100_28 < arg_97_1.time_ and arg_97_1.time_ <= var_100_28 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_30 = arg_97_1:FormatText(StoryNameCfg[84].name)

				arg_97_1.leftNameTxt_.text = var_100_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_31 = arg_97_1:GetWordFromCfg(109061024)
				local var_100_32 = arg_97_1:FormatText(var_100_31.content)

				arg_97_1.text_.text = var_100_32

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_33 = 17
				local var_100_34 = utf8.len(var_100_32)
				local var_100_35 = var_100_33 <= 0 and var_100_29 or var_100_29 * (var_100_34 / var_100_33)

				if var_100_35 > 0 and var_100_29 < var_100_35 then
					arg_97_1.talkMaxDuration = var_100_35

					if var_100_35 + var_100_28 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_35 + var_100_28
					end
				end

				arg_97_1.text_.text = var_100_32
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061024", "story_v_out_109061.awb") ~= 0 then
					local var_100_36 = manager.audio:GetVoiceLength("story_v_out_109061", "109061024", "story_v_out_109061.awb") / 1000

					if var_100_36 + var_100_28 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_36 + var_100_28
					end

					if var_100_31.prefab_name ~= "" and arg_97_1.actors_[var_100_31.prefab_name] ~= nil then
						local var_100_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_31.prefab_name].transform, "story_v_out_109061", "109061024", "story_v_out_109061.awb")

						arg_97_1:RecordAudio("109061024", var_100_37)
						arg_97_1:RecordAudio("109061024", var_100_37)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_109061", "109061024", "story_v_out_109061.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_109061", "109061024", "story_v_out_109061.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_38 = math.max(var_100_29, arg_97_1.talkMaxDuration)

			if var_100_28 <= arg_97_1.time_ and arg_97_1.time_ < var_100_28 + var_100_38 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_28) / var_100_38

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_28 + var_100_38 and arg_97_1.time_ < var_100_28 + var_100_38 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play109061025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 109061025
		arg_101_1.duration_ = 8.533

		local var_101_0 = {
			ja = 6.8,
			ko = 4.8,
			zh = 8.533,
			en = 7.466
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
				arg_101_0:Play109061026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1099ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1099ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, 100, 0)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1099ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, 100, 0)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["3004_tpose"].transform
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 then
				arg_101_1.var_.moveOldPos3004_tpose = var_104_9.localPosition
			end

			local var_104_11 = 0.001

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11
				local var_104_13 = Vector3.New(0, -2.22, -3.1)

				var_104_9.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos3004_tpose, var_104_13, var_104_12)

				local var_104_14 = manager.ui.mainCamera.transform.position - var_104_9.position

				var_104_9.forward = Vector3.New(var_104_14.x, var_104_14.y, var_104_14.z)

				local var_104_15 = var_104_9.localEulerAngles

				var_104_15.z = 0
				var_104_15.x = 0
				var_104_9.localEulerAngles = var_104_15
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 then
				var_104_9.localPosition = Vector3.New(0, -2.22, -3.1)

				local var_104_16 = manager.ui.mainCamera.transform.position - var_104_9.position

				var_104_9.forward = Vector3.New(var_104_16.x, var_104_16.y, var_104_16.z)

				local var_104_17 = var_104_9.localEulerAngles

				var_104_17.z = 0
				var_104_17.x = 0
				var_104_9.localEulerAngles = var_104_17
			end

			local var_104_18 = arg_101_1.actors_["3004_tpose"]
			local var_104_19 = 0

			if var_104_19 < arg_101_1.time_ and arg_101_1.time_ <= var_104_19 + arg_104_0 and arg_101_1.var_.characterEffect3004_tpose == nil then
				arg_101_1.var_.characterEffect3004_tpose = var_104_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_20 = 0.2

			if var_104_19 <= arg_101_1.time_ and arg_101_1.time_ < var_104_19 + var_104_20 then
				local var_104_21 = (arg_101_1.time_ - var_104_19) / var_104_20

				if arg_101_1.var_.characterEffect3004_tpose then
					arg_101_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_19 + var_104_20 and arg_101_1.time_ < var_104_19 + var_104_20 + arg_104_0 and arg_101_1.var_.characterEffect3004_tpose then
				arg_101_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_104_22 = 0

			if var_104_22 < arg_101_1.time_ and arg_101_1.time_ <= var_104_22 + arg_104_0 then
				arg_101_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_104_23 = 0
			local var_104_24 = 0.925

			if var_104_23 < arg_101_1.time_ and arg_101_1.time_ <= var_104_23 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_25 = arg_101_1:FormatText(StoryNameCfg[82].name)

				arg_101_1.leftNameTxt_.text = var_104_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_26 = arg_101_1:GetWordFromCfg(109061025)
				local var_104_27 = arg_101_1:FormatText(var_104_26.content)

				arg_101_1.text_.text = var_104_27

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_28 = 37
				local var_104_29 = utf8.len(var_104_27)
				local var_104_30 = var_104_28 <= 0 and var_104_24 or var_104_24 * (var_104_29 / var_104_28)

				if var_104_30 > 0 and var_104_24 < var_104_30 then
					arg_101_1.talkMaxDuration = var_104_30

					if var_104_30 + var_104_23 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_30 + var_104_23
					end
				end

				arg_101_1.text_.text = var_104_27
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061025", "story_v_out_109061.awb") ~= 0 then
					local var_104_31 = manager.audio:GetVoiceLength("story_v_out_109061", "109061025", "story_v_out_109061.awb") / 1000

					if var_104_31 + var_104_23 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_31 + var_104_23
					end

					if var_104_26.prefab_name ~= "" and arg_101_1.actors_[var_104_26.prefab_name] ~= nil then
						local var_104_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_26.prefab_name].transform, "story_v_out_109061", "109061025", "story_v_out_109061.awb")

						arg_101_1:RecordAudio("109061025", var_104_32)
						arg_101_1:RecordAudio("109061025", var_104_32)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_109061", "109061025", "story_v_out_109061.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_109061", "109061025", "story_v_out_109061.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_33 = math.max(var_104_24, arg_101_1.talkMaxDuration)

			if var_104_23 <= arg_101_1.time_ and arg_101_1.time_ < var_104_23 + var_104_33 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_23) / var_104_33

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_23 + var_104_33 and arg_101_1.time_ < var_104_23 + var_104_33 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play109061026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 109061026
		arg_105_1.duration_ = 3.5

		local var_105_0 = {
			ja = 3.333,
			ko = 3.1,
			zh = 3,
			en = 3.5
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
				arg_105_0:Play109061027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["3004_tpose"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos3004_tpose = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0, 100, 0)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos3004_tpose, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, 100, 0)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = "1050ui_story"

			if arg_105_1.actors_[var_108_9] == nil then
				local var_108_10 = Object.Instantiate(Asset.Load("Char/" .. var_108_9), arg_105_1.stage_.transform)

				var_108_10.name = var_108_9
				var_108_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_105_1.actors_[var_108_9] = var_108_10

				local var_108_11 = var_108_10:GetComponentInChildren(typeof(CharacterEffect))

				var_108_11.enabled = true

				local var_108_12 = GameObjectTools.GetOrAddComponent(var_108_10, typeof(DynamicBoneHelper))

				if var_108_12 then
					var_108_12:EnableDynamicBone(false)
				end

				arg_105_1:ShowWeapon(var_108_11.transform, false)

				arg_105_1.var_[var_108_9 .. "Animator"] = var_108_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_105_1.var_[var_108_9 .. "Animator"].applyRootMotion = true
				arg_105_1.var_[var_108_9 .. "LipSync"] = var_108_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_108_13 = arg_105_1.actors_["1050ui_story"].transform
			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1.var_.moveOldPos1050ui_story = var_108_13.localPosition

				local var_108_15 = "1050ui_story"

				arg_105_1:ShowWeapon(arg_105_1.var_[var_108_15 .. "Animator"].transform, true)
			end

			local var_108_16 = 0.001

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_16 then
				local var_108_17 = (arg_105_1.time_ - var_108_14) / var_108_16
				local var_108_18 = Vector3.New(-0.7, -1, -6.1)

				var_108_13.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1050ui_story, var_108_18, var_108_17)

				local var_108_19 = manager.ui.mainCamera.transform.position - var_108_13.position

				var_108_13.forward = Vector3.New(var_108_19.x, var_108_19.y, var_108_19.z)

				local var_108_20 = var_108_13.localEulerAngles

				var_108_20.z = 0
				var_108_20.x = 0
				var_108_13.localEulerAngles = var_108_20
			end

			if arg_105_1.time_ >= var_108_14 + var_108_16 and arg_105_1.time_ < var_108_14 + var_108_16 + arg_108_0 then
				var_108_13.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_108_21 = manager.ui.mainCamera.transform.position - var_108_13.position

				var_108_13.forward = Vector3.New(var_108_21.x, var_108_21.y, var_108_21.z)

				local var_108_22 = var_108_13.localEulerAngles

				var_108_22.z = 0
				var_108_22.x = 0
				var_108_13.localEulerAngles = var_108_22
			end

			local var_108_23 = arg_105_1.actors_["1050ui_story"]
			local var_108_24 = 0

			if var_108_24 < arg_105_1.time_ and arg_105_1.time_ <= var_108_24 + arg_108_0 and arg_105_1.var_.characterEffect1050ui_story == nil then
				arg_105_1.var_.characterEffect1050ui_story = var_108_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_25 = 0.2

			if var_108_24 <= arg_105_1.time_ and arg_105_1.time_ < var_108_24 + var_108_25 then
				local var_108_26 = (arg_105_1.time_ - var_108_24) / var_108_25

				if arg_105_1.var_.characterEffect1050ui_story then
					arg_105_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_24 + var_108_25 and arg_105_1.time_ < var_108_24 + var_108_25 + arg_108_0 and arg_105_1.var_.characterEffect1050ui_story then
				arg_105_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_108_27 = 0

			if var_108_27 < arg_105_1.time_ and arg_105_1.time_ <= var_108_27 + arg_108_0 then
				arg_105_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action6_1")
			end

			local var_108_28 = 0

			if var_108_28 < arg_105_1.time_ and arg_105_1.time_ <= var_108_28 + arg_108_0 then
				arg_105_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_108_29 = 0
			local var_108_30 = 0.3

			if var_108_29 < arg_105_1.time_ and arg_105_1.time_ <= var_108_29 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_31 = arg_105_1:FormatText(StoryNameCfg[74].name)

				arg_105_1.leftNameTxt_.text = var_108_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_32 = arg_105_1:GetWordFromCfg(109061026)
				local var_108_33 = arg_105_1:FormatText(var_108_32.content)

				arg_105_1.text_.text = var_108_33

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_34 = 12
				local var_108_35 = utf8.len(var_108_33)
				local var_108_36 = var_108_34 <= 0 and var_108_30 or var_108_30 * (var_108_35 / var_108_34)

				if var_108_36 > 0 and var_108_30 < var_108_36 then
					arg_105_1.talkMaxDuration = var_108_36

					if var_108_36 + var_108_29 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_36 + var_108_29
					end
				end

				arg_105_1.text_.text = var_108_33
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061026", "story_v_out_109061.awb") ~= 0 then
					local var_108_37 = manager.audio:GetVoiceLength("story_v_out_109061", "109061026", "story_v_out_109061.awb") / 1000

					if var_108_37 + var_108_29 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_37 + var_108_29
					end

					if var_108_32.prefab_name ~= "" and arg_105_1.actors_[var_108_32.prefab_name] ~= nil then
						local var_108_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_32.prefab_name].transform, "story_v_out_109061", "109061026", "story_v_out_109061.awb")

						arg_105_1:RecordAudio("109061026", var_108_38)
						arg_105_1:RecordAudio("109061026", var_108_38)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_109061", "109061026", "story_v_out_109061.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_109061", "109061026", "story_v_out_109061.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_39 = math.max(var_108_30, arg_105_1.talkMaxDuration)

			if var_108_29 <= arg_105_1.time_ and arg_105_1.time_ < var_108_29 + var_108_39 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_29) / var_108_39

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_29 + var_108_39 and arg_105_1.time_ < var_108_29 + var_108_39 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play109061027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 109061027
		arg_109_1.duration_ = 5.4

		local var_109_0 = {
			ja = 4.6,
			ko = 5.4,
			zh = 5.3,
			en = 4.8
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
				arg_109_0:Play109061028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1099ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1099ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(0.7, -1.08, -5.9)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1099ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.actors_["1099ui_story"]
			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect1099ui_story == nil then
				arg_109_1.var_.characterEffect1099ui_story = var_112_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_11 = 0.2

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_10) / var_112_11

				if arg_109_1.var_.characterEffect1099ui_story then
					arg_109_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_10 + var_112_11 and arg_109_1.time_ < var_112_10 + var_112_11 + arg_112_0 and arg_109_1.var_.characterEffect1099ui_story then
				arg_109_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_112_13 = arg_109_1.actors_["1050ui_story"]
			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 and arg_109_1.var_.characterEffect1050ui_story == nil then
				arg_109_1.var_.characterEffect1050ui_story = var_112_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_15 = 0.2

			if var_112_14 <= arg_109_1.time_ and arg_109_1.time_ < var_112_14 + var_112_15 then
				local var_112_16 = (arg_109_1.time_ - var_112_14) / var_112_15

				if arg_109_1.var_.characterEffect1050ui_story then
					local var_112_17 = Mathf.Lerp(0, 0.5, var_112_16)

					arg_109_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1050ui_story.fillRatio = var_112_17
				end
			end

			if arg_109_1.time_ >= var_112_14 + var_112_15 and arg_109_1.time_ < var_112_14 + var_112_15 + arg_112_0 and arg_109_1.var_.characterEffect1050ui_story then
				local var_112_18 = 0.5

				arg_109_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1050ui_story.fillRatio = var_112_18
			end

			local var_112_19 = 0

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 then
				arg_109_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_112_20 = 0

			if var_112_20 < arg_109_1.time_ and arg_109_1.time_ <= var_112_20 + arg_112_0 then
				arg_109_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_1")
			end

			local var_112_21 = 0
			local var_112_22 = 0.625

			if var_112_21 < arg_109_1.time_ and arg_109_1.time_ <= var_112_21 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_23 = arg_109_1:FormatText(StoryNameCfg[84].name)

				arg_109_1.leftNameTxt_.text = var_112_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_24 = arg_109_1:GetWordFromCfg(109061027)
				local var_112_25 = arg_109_1:FormatText(var_112_24.content)

				arg_109_1.text_.text = var_112_25

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_26 = 25
				local var_112_27 = utf8.len(var_112_25)
				local var_112_28 = var_112_26 <= 0 and var_112_22 or var_112_22 * (var_112_27 / var_112_26)

				if var_112_28 > 0 and var_112_22 < var_112_28 then
					arg_109_1.talkMaxDuration = var_112_28

					if var_112_28 + var_112_21 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_28 + var_112_21
					end
				end

				arg_109_1.text_.text = var_112_25
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061027", "story_v_out_109061.awb") ~= 0 then
					local var_112_29 = manager.audio:GetVoiceLength("story_v_out_109061", "109061027", "story_v_out_109061.awb") / 1000

					if var_112_29 + var_112_21 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_29 + var_112_21
					end

					if var_112_24.prefab_name ~= "" and arg_109_1.actors_[var_112_24.prefab_name] ~= nil then
						local var_112_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_24.prefab_name].transform, "story_v_out_109061", "109061027", "story_v_out_109061.awb")

						arg_109_1:RecordAudio("109061027", var_112_30)
						arg_109_1:RecordAudio("109061027", var_112_30)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_109061", "109061027", "story_v_out_109061.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_109061", "109061027", "story_v_out_109061.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_31 = math.max(var_112_22, arg_109_1.talkMaxDuration)

			if var_112_21 <= arg_109_1.time_ and arg_109_1.time_ < var_112_21 + var_112_31 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_21) / var_112_31

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_21 + var_112_31 and arg_109_1.time_ < var_112_21 + var_112_31 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play109061028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 109061028
		arg_113_1.duration_ = 6

		local var_113_0 = {
			ja = 4.433,
			ko = 3.2,
			zh = 6,
			en = 3.533
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
				arg_113_0:Play109061029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1099ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1099ui_story == nil then
				arg_113_1.var_.characterEffect1099ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.2

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1099ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1099ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1099ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1099ui_story.fillRatio = var_116_5
			end

			local var_116_6 = 0

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_2")
			end

			local var_116_7 = arg_113_1.actors_["1050ui_story"].transform
			local var_116_8 = 0

			if var_116_8 < arg_113_1.time_ and arg_113_1.time_ <= var_116_8 + arg_116_0 then
				arg_113_1.var_.moveOldPos1050ui_story = var_116_7.localPosition

				local var_116_9 = "1050ui_story"

				arg_113_1:ShowWeapon(arg_113_1.var_[var_116_9 .. "Animator"].transform, true)
			end

			local var_116_10 = 0.001

			if var_116_8 <= arg_113_1.time_ and arg_113_1.time_ < var_116_8 + var_116_10 then
				local var_116_11 = (arg_113_1.time_ - var_116_8) / var_116_10
				local var_116_12 = Vector3.New(0, 100, 0)

				var_116_7.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1050ui_story, var_116_12, var_116_11)

				local var_116_13 = manager.ui.mainCamera.transform.position - var_116_7.position

				var_116_7.forward = Vector3.New(var_116_13.x, var_116_13.y, var_116_13.z)

				local var_116_14 = var_116_7.localEulerAngles

				var_116_14.z = 0
				var_116_14.x = 0
				var_116_7.localEulerAngles = var_116_14
			end

			if arg_113_1.time_ >= var_116_8 + var_116_10 and arg_113_1.time_ < var_116_8 + var_116_10 + arg_116_0 then
				var_116_7.localPosition = Vector3.New(0, 100, 0)

				local var_116_15 = manager.ui.mainCamera.transform.position - var_116_7.position

				var_116_7.forward = Vector3.New(var_116_15.x, var_116_15.y, var_116_15.z)

				local var_116_16 = var_116_7.localEulerAngles

				var_116_16.z = 0
				var_116_16.x = 0
				var_116_7.localEulerAngles = var_116_16
			end

			local var_116_17 = arg_113_1.actors_["1099ui_story"].transform
			local var_116_18 = 0

			if var_116_18 < arg_113_1.time_ and arg_113_1.time_ <= var_116_18 + arg_116_0 then
				arg_113_1.var_.moveOldPos1099ui_story = var_116_17.localPosition
			end

			local var_116_19 = 0.001

			if var_116_18 <= arg_113_1.time_ and arg_113_1.time_ < var_116_18 + var_116_19 then
				local var_116_20 = (arg_113_1.time_ - var_116_18) / var_116_19
				local var_116_21 = Vector3.New(0, 100, 0)

				var_116_17.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1099ui_story, var_116_21, var_116_20)

				local var_116_22 = manager.ui.mainCamera.transform.position - var_116_17.position

				var_116_17.forward = Vector3.New(var_116_22.x, var_116_22.y, var_116_22.z)

				local var_116_23 = var_116_17.localEulerAngles

				var_116_23.z = 0
				var_116_23.x = 0
				var_116_17.localEulerAngles = var_116_23
			end

			if arg_113_1.time_ >= var_116_18 + var_116_19 and arg_113_1.time_ < var_116_18 + var_116_19 + arg_116_0 then
				var_116_17.localPosition = Vector3.New(0, 100, 0)

				local var_116_24 = manager.ui.mainCamera.transform.position - var_116_17.position

				var_116_17.forward = Vector3.New(var_116_24.x, var_116_24.y, var_116_24.z)

				local var_116_25 = var_116_17.localEulerAngles

				var_116_25.z = 0
				var_116_25.x = 0
				var_116_17.localEulerAngles = var_116_25
			end

			local var_116_26 = arg_113_1.actors_["10004ui_story"].transform
			local var_116_27 = 0

			if var_116_27 < arg_113_1.time_ and arg_113_1.time_ <= var_116_27 + arg_116_0 then
				arg_113_1.var_.moveOldPos10004ui_story = var_116_26.localPosition
			end

			local var_116_28 = 0.001

			if var_116_27 <= arg_113_1.time_ and arg_113_1.time_ < var_116_27 + var_116_28 then
				local var_116_29 = (arg_113_1.time_ - var_116_27) / var_116_28
				local var_116_30 = Vector3.New(0, -1.1, -5.6)

				var_116_26.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10004ui_story, var_116_30, var_116_29)

				local var_116_31 = manager.ui.mainCamera.transform.position - var_116_26.position

				var_116_26.forward = Vector3.New(var_116_31.x, var_116_31.y, var_116_31.z)

				local var_116_32 = var_116_26.localEulerAngles

				var_116_32.z = 0
				var_116_32.x = 0
				var_116_26.localEulerAngles = var_116_32
			end

			if arg_113_1.time_ >= var_116_27 + var_116_28 and arg_113_1.time_ < var_116_27 + var_116_28 + arg_116_0 then
				var_116_26.localPosition = Vector3.New(0, -1.1, -5.6)

				local var_116_33 = manager.ui.mainCamera.transform.position - var_116_26.position

				var_116_26.forward = Vector3.New(var_116_33.x, var_116_33.y, var_116_33.z)

				local var_116_34 = var_116_26.localEulerAngles

				var_116_34.z = 0
				var_116_34.x = 0
				var_116_26.localEulerAngles = var_116_34
			end

			local var_116_35 = arg_113_1.actors_["10004ui_story"]
			local var_116_36 = 0

			if var_116_36 < arg_113_1.time_ and arg_113_1.time_ <= var_116_36 + arg_116_0 and arg_113_1.var_.characterEffect10004ui_story == nil then
				arg_113_1.var_.characterEffect10004ui_story = var_116_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_37 = 0.2

			if var_116_36 <= arg_113_1.time_ and arg_113_1.time_ < var_116_36 + var_116_37 then
				local var_116_38 = (arg_113_1.time_ - var_116_36) / var_116_37

				if arg_113_1.var_.characterEffect10004ui_story then
					arg_113_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_36 + var_116_37 and arg_113_1.time_ < var_116_36 + var_116_37 + arg_116_0 and arg_113_1.var_.characterEffect10004ui_story then
				arg_113_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_116_39 = 0

			if var_116_39 < arg_113_1.time_ and arg_113_1.time_ <= var_116_39 + arg_116_0 then
				arg_113_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action4_1")
			end

			local var_116_40 = 0

			if var_116_40 < arg_113_1.time_ and arg_113_1.time_ <= var_116_40 + arg_116_0 then
				arg_113_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_116_41 = 0
			local var_116_42 = 0.45

			if var_116_41 < arg_113_1.time_ and arg_113_1.time_ <= var_116_41 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_43 = arg_113_1:FormatText(StoryNameCfg[80].name)

				arg_113_1.leftNameTxt_.text = var_116_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_44 = arg_113_1:GetWordFromCfg(109061028)
				local var_116_45 = arg_113_1:FormatText(var_116_44.content)

				arg_113_1.text_.text = var_116_45

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_46 = 18
				local var_116_47 = utf8.len(var_116_45)
				local var_116_48 = var_116_46 <= 0 and var_116_42 or var_116_42 * (var_116_47 / var_116_46)

				if var_116_48 > 0 and var_116_42 < var_116_48 then
					arg_113_1.talkMaxDuration = var_116_48

					if var_116_48 + var_116_41 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_48 + var_116_41
					end
				end

				arg_113_1.text_.text = var_116_45
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061028", "story_v_out_109061.awb") ~= 0 then
					local var_116_49 = manager.audio:GetVoiceLength("story_v_out_109061", "109061028", "story_v_out_109061.awb") / 1000

					if var_116_49 + var_116_41 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_49 + var_116_41
					end

					if var_116_44.prefab_name ~= "" and arg_113_1.actors_[var_116_44.prefab_name] ~= nil then
						local var_116_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_44.prefab_name].transform, "story_v_out_109061", "109061028", "story_v_out_109061.awb")

						arg_113_1:RecordAudio("109061028", var_116_50)
						arg_113_1:RecordAudio("109061028", var_116_50)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_109061", "109061028", "story_v_out_109061.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_109061", "109061028", "story_v_out_109061.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_51 = math.max(var_116_42, arg_113_1.talkMaxDuration)

			if var_116_41 <= arg_113_1.time_ and arg_113_1.time_ < var_116_41 + var_116_51 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_41) / var_116_51

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_41 + var_116_51 and arg_113_1.time_ < var_116_41 + var_116_51 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play109061029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 109061029
		arg_117_1.duration_ = 6.1

		local var_117_0 = {
			ja = 6.066,
			ko = 5.6,
			zh = 4.833,
			en = 6.1
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
			arg_117_1.auto_ = false
		end

		function arg_117_1.playNext_(arg_119_0)
			arg_117_1.onStoryFinished_()
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1084ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1084ui_story = var_120_0.localPosition

				local var_120_2 = "1084ui_story"

				arg_117_1:ShowWeapon(arg_117_1.var_[var_120_2 .. "Animator"].transform, true)
			end

			local var_120_3 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_3 then
				local var_120_4 = (arg_117_1.time_ - var_120_1) / var_120_3
				local var_120_5 = Vector3.New(0.7, -0.97, -6)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1084ui_story, var_120_5, var_120_4)

				local var_120_6 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_6.x, var_120_6.y, var_120_6.z)

				local var_120_7 = var_120_0.localEulerAngles

				var_120_7.z = 0
				var_120_7.x = 0
				var_120_0.localEulerAngles = var_120_7
			end

			if arg_117_1.time_ >= var_120_1 + var_120_3 and arg_117_1.time_ < var_120_1 + var_120_3 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_120_8 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_8.x, var_120_8.y, var_120_8.z)

				local var_120_9 = var_120_0.localEulerAngles

				var_120_9.z = 0
				var_120_9.x = 0
				var_120_0.localEulerAngles = var_120_9
			end

			local var_120_10 = arg_117_1.actors_["10004ui_story"].transform
			local var_120_11 = 0

			if var_120_11 < arg_117_1.time_ and arg_117_1.time_ <= var_120_11 + arg_120_0 then
				arg_117_1.var_.moveOldPos10004ui_story = var_120_10.localPosition
			end

			local var_120_12 = 0.001

			if var_120_11 <= arg_117_1.time_ and arg_117_1.time_ < var_120_11 + var_120_12 then
				local var_120_13 = (arg_117_1.time_ - var_120_11) / var_120_12
				local var_120_14 = Vector3.New(0, 100, 0)

				var_120_10.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10004ui_story, var_120_14, var_120_13)

				local var_120_15 = manager.ui.mainCamera.transform.position - var_120_10.position

				var_120_10.forward = Vector3.New(var_120_15.x, var_120_15.y, var_120_15.z)

				local var_120_16 = var_120_10.localEulerAngles

				var_120_16.z = 0
				var_120_16.x = 0
				var_120_10.localEulerAngles = var_120_16
			end

			if arg_117_1.time_ >= var_120_11 + var_120_12 and arg_117_1.time_ < var_120_11 + var_120_12 + arg_120_0 then
				var_120_10.localPosition = Vector3.New(0, 100, 0)

				local var_120_17 = manager.ui.mainCamera.transform.position - var_120_10.position

				var_120_10.forward = Vector3.New(var_120_17.x, var_120_17.y, var_120_17.z)

				local var_120_18 = var_120_10.localEulerAngles

				var_120_18.z = 0
				var_120_18.x = 0
				var_120_10.localEulerAngles = var_120_18
			end

			local var_120_19 = arg_117_1.actors_["1050ui_story"].transform
			local var_120_20 = 0

			if var_120_20 < arg_117_1.time_ and arg_117_1.time_ <= var_120_20 + arg_120_0 then
				arg_117_1.var_.moveOldPos1050ui_story = var_120_19.localPosition

				local var_120_21 = "1050ui_story"

				arg_117_1:ShowWeapon(arg_117_1.var_[var_120_21 .. "Animator"].transform, true)
			end

			local var_120_22 = 0.001

			if var_120_20 <= arg_117_1.time_ and arg_117_1.time_ < var_120_20 + var_120_22 then
				local var_120_23 = (arg_117_1.time_ - var_120_20) / var_120_22
				local var_120_24 = Vector3.New(-0.7, -1, -6.1)

				var_120_19.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1050ui_story, var_120_24, var_120_23)

				local var_120_25 = manager.ui.mainCamera.transform.position - var_120_19.position

				var_120_19.forward = Vector3.New(var_120_25.x, var_120_25.y, var_120_25.z)

				local var_120_26 = var_120_19.localEulerAngles

				var_120_26.z = 0
				var_120_26.x = 0
				var_120_19.localEulerAngles = var_120_26
			end

			if arg_117_1.time_ >= var_120_20 + var_120_22 and arg_117_1.time_ < var_120_20 + var_120_22 + arg_120_0 then
				var_120_19.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_120_27 = manager.ui.mainCamera.transform.position - var_120_19.position

				var_120_19.forward = Vector3.New(var_120_27.x, var_120_27.y, var_120_27.z)

				local var_120_28 = var_120_19.localEulerAngles

				var_120_28.z = 0
				var_120_28.x = 0
				var_120_19.localEulerAngles = var_120_28
			end

			local var_120_29 = arg_117_1.actors_["1084ui_story"]
			local var_120_30 = 0

			if var_120_30 < arg_117_1.time_ and arg_117_1.time_ <= var_120_30 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story == nil then
				arg_117_1.var_.characterEffect1084ui_story = var_120_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_31 = 0.2

			if var_120_30 <= arg_117_1.time_ and arg_117_1.time_ < var_120_30 + var_120_31 then
				local var_120_32 = (arg_117_1.time_ - var_120_30) / var_120_31

				if arg_117_1.var_.characterEffect1084ui_story then
					arg_117_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_30 + var_120_31 and arg_117_1.time_ < var_120_30 + var_120_31 + arg_120_0 and arg_117_1.var_.characterEffect1084ui_story then
				arg_117_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_120_33 = 0

			if var_120_33 < arg_117_1.time_ and arg_117_1.time_ <= var_120_33 + arg_120_0 then
				arg_117_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_120_34 = 0

			if var_120_34 < arg_117_1.time_ and arg_117_1.time_ <= var_120_34 + arg_120_0 then
				arg_117_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_120_35 = 0
			local var_120_36 = 0.525

			if var_120_35 < arg_117_1.time_ and arg_117_1.time_ <= var_120_35 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_37 = arg_117_1:FormatText(StoryNameCfg[6].name)

				arg_117_1.leftNameTxt_.text = var_120_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_38 = arg_117_1:GetWordFromCfg(109061029)
				local var_120_39 = arg_117_1:FormatText(var_120_38.content)

				arg_117_1.text_.text = var_120_39

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_40 = 21
				local var_120_41 = utf8.len(var_120_39)
				local var_120_42 = var_120_40 <= 0 and var_120_36 or var_120_36 * (var_120_41 / var_120_40)

				if var_120_42 > 0 and var_120_36 < var_120_42 then
					arg_117_1.talkMaxDuration = var_120_42

					if var_120_42 + var_120_35 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_42 + var_120_35
					end
				end

				arg_117_1.text_.text = var_120_39
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109061", "109061029", "story_v_out_109061.awb") ~= 0 then
					local var_120_43 = manager.audio:GetVoiceLength("story_v_out_109061", "109061029", "story_v_out_109061.awb") / 1000

					if var_120_43 + var_120_35 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_43 + var_120_35
					end

					if var_120_38.prefab_name ~= "" and arg_117_1.actors_[var_120_38.prefab_name] ~= nil then
						local var_120_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_38.prefab_name].transform, "story_v_out_109061", "109061029", "story_v_out_109061.awb")

						arg_117_1:RecordAudio("109061029", var_120_44)
						arg_117_1:RecordAudio("109061029", var_120_44)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_109061", "109061029", "story_v_out_109061.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_109061", "109061029", "story_v_out_109061.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_45 = math.max(var_120_36, arg_117_1.talkMaxDuration)

			if var_120_35 <= arg_117_1.time_ and arg_117_1.time_ < var_120_35 + var_120_45 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_35) / var_120_45

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_35 + var_120_45 and arg_117_1.time_ < var_120_35 + var_120_45 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C07_1"
	},
	voices = {
		"story_v_out_109061.awb"
	}
}
