return {
	Play109081001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 109081001
		arg_1_1.duration_ = 5.3

		local var_1_0 = {
			ja = 3.799999999999,
			ko = 4.7,
			zh = 5.3,
			en = 3.966
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
				arg_1_0:Play109081002(arg_1_1)
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

			local var_4_28 = "3004_tpose"

			if arg_1_1.actors_[var_4_28] == nil then
				local var_4_29 = Object.Instantiate(Asset.Load("Char/" .. var_4_28), arg_1_1.stage_.transform)

				var_4_29.name = var_4_28
				var_4_29.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_28] = var_4_29

				local var_4_30 = var_4_29:GetComponentInChildren(typeof(CharacterEffect))

				var_4_30.enabled = true

				local var_4_31 = GameObjectTools.GetOrAddComponent(var_4_29, typeof(DynamicBoneHelper))

				if var_4_31 then
					var_4_31:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_30.transform, false)

				arg_1_1.var_[var_4_28 .. "Animator"] = var_4_30.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_28 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_28 .. "LipSync"] = var_4_30.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_32 = arg_1_1.actors_["3004_tpose"].transform
			local var_4_33 = 1.8

			if var_4_33 < arg_1_1.time_ and arg_1_1.time_ <= var_4_33 + arg_4_0 then
				arg_1_1.var_.moveOldPos3004_tpose = var_4_32.localPosition
			end

			local var_4_34 = 0.001

			if var_4_33 <= arg_1_1.time_ and arg_1_1.time_ < var_4_33 + var_4_34 then
				local var_4_35 = (arg_1_1.time_ - var_4_33) / var_4_34
				local var_4_36 = Vector3.New(-0.7, -2.22, -3.1)

				var_4_32.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos3004_tpose, var_4_36, var_4_35)

				local var_4_37 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_37.x, var_4_37.y, var_4_37.z)

				local var_4_38 = var_4_32.localEulerAngles

				var_4_38.z = 0
				var_4_38.x = 0
				var_4_32.localEulerAngles = var_4_38
			end

			if arg_1_1.time_ >= var_4_33 + var_4_34 and arg_1_1.time_ < var_4_33 + var_4_34 + arg_4_0 then
				var_4_32.localPosition = Vector3.New(-0.7, -2.22, -3.1)

				local var_4_39 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_39.x, var_4_39.y, var_4_39.z)

				local var_4_40 = var_4_32.localEulerAngles

				var_4_40.z = 0
				var_4_40.x = 0
				var_4_32.localEulerAngles = var_4_40
			end

			local var_4_41 = arg_1_1.actors_["3004_tpose"]
			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 and arg_1_1.var_.characterEffect3004_tpose == nil then
				arg_1_1.var_.characterEffect3004_tpose = var_4_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_43 = 0.2

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_42) / var_4_43

				if arg_1_1.var_.characterEffect3004_tpose then
					arg_1_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 and arg_1_1.var_.characterEffect3004_tpose then
				arg_1_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_4_45 = 1.8

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				arg_1_1:PlayTimeline("3004_tpose", "StoryTimeline/CharAction/story3004/story3004action/3004action1_1")
			end

			local var_4_46 = 0
			local var_4_47 = 1

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				local var_4_48 = "play"
				local var_4_49 = "music"

				arg_1_1:AudioAction(var_4_48, var_4_49, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_4_50 = 0

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_51 = 2

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_52 = 2
			local var_4_53 = 0.175

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_54 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_54:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_55 = arg_1_1:FormatText(StoryNameCfg[82].name)

				arg_1_1.leftNameTxt_.text = var_4_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_56 = arg_1_1:GetWordFromCfg(109081001)
				local var_4_57 = arg_1_1:FormatText(var_4_56.content)

				arg_1_1.text_.text = var_4_57

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_58 = 7
				local var_4_59 = utf8.len(var_4_57)
				local var_4_60 = var_4_58 <= 0 and var_4_53 or var_4_53 * (var_4_59 / var_4_58)

				if var_4_60 > 0 and var_4_53 < var_4_60 then
					arg_1_1.talkMaxDuration = var_4_60
					var_4_52 = var_4_52 + 0.3

					if var_4_60 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_52
					end
				end

				arg_1_1.text_.text = var_4_57
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081001", "story_v_out_109081.awb") ~= 0 then
					local var_4_61 = manager.audio:GetVoiceLength("story_v_out_109081", "109081001", "story_v_out_109081.awb") / 1000

					if var_4_61 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_52
					end

					if var_4_56.prefab_name ~= "" and arg_1_1.actors_[var_4_56.prefab_name] ~= nil then
						local var_4_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_56.prefab_name].transform, "story_v_out_109081", "109081001", "story_v_out_109081.awb")

						arg_1_1:RecordAudio("109081001", var_4_62)
						arg_1_1:RecordAudio("109081001", var_4_62)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_109081", "109081001", "story_v_out_109081.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_109081", "109081001", "story_v_out_109081.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_63 = var_4_52 + 0.3
			local var_4_64 = math.max(var_4_53, arg_1_1.talkMaxDuration)

			if var_4_63 <= arg_1_1.time_ and arg_1_1.time_ < var_4_63 + var_4_64 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_63) / var_4_64

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_63 + var_4_64 and arg_1_1.time_ < var_4_63 + var_4_64 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play109081002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 109081002
		arg_7_1.duration_ = 1.999999999999

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play109081003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["3004_tpose"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect3004_tpose == nil then
				arg_7_1.var_.characterEffect3004_tpose = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.2

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect3004_tpose then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect3004_tpose.fillFlat = true
					arg_7_1.var_.characterEffect3004_tpose.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect3004_tpose then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect3004_tpose.fillFlat = true
				arg_7_1.var_.characterEffect3004_tpose.fillRatio = var_10_5
			end

			local var_10_6 = "10004ui_story"

			if arg_7_1.actors_[var_10_6] == nil then
				local var_10_7 = Object.Instantiate(Asset.Load("Char/" .. var_10_6), arg_7_1.stage_.transform)

				var_10_7.name = var_10_6
				var_10_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_6] = var_10_7

				local var_10_8 = var_10_7:GetComponentInChildren(typeof(CharacterEffect))

				var_10_8.enabled = true

				local var_10_9 = GameObjectTools.GetOrAddComponent(var_10_7, typeof(DynamicBoneHelper))

				if var_10_9 then
					var_10_9:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_8.transform, false)

				arg_7_1.var_[var_10_6 .. "Animator"] = var_10_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_6 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_6 .. "LipSync"] = var_10_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_10 = arg_7_1.actors_["10004ui_story"]
			local var_10_11 = 0

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 and arg_7_1.var_.characterEffect10004ui_story == nil then
				arg_7_1.var_.characterEffect10004ui_story = var_10_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_12 = 0.2

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_11) / var_10_12

				if arg_7_1.var_.characterEffect10004ui_story then
					arg_7_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_11 + var_10_12 and arg_7_1.time_ < var_10_11 + var_10_12 + arg_10_0 and arg_7_1.var_.characterEffect10004ui_story then
				arg_7_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_10_14 = arg_7_1.actors_["10004ui_story"].transform
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				arg_7_1.var_.moveOldPos10004ui_story = var_10_14.localPosition
			end

			local var_10_16 = 0.001

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_16 then
				local var_10_17 = (arg_7_1.time_ - var_10_15) / var_10_16
				local var_10_18 = Vector3.New(0.7, -1.1, -5.6)

				var_10_14.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10004ui_story, var_10_18, var_10_17)

				local var_10_19 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_19.x, var_10_19.y, var_10_19.z)

				local var_10_20 = var_10_14.localEulerAngles

				var_10_20.z = 0
				var_10_20.x = 0
				var_10_14.localEulerAngles = var_10_20
			end

			if arg_7_1.time_ >= var_10_15 + var_10_16 and arg_7_1.time_ < var_10_15 + var_10_16 + arg_10_0 then
				var_10_14.localPosition = Vector3.New(0.7, -1.1, -5.6)

				local var_10_21 = manager.ui.mainCamera.transform.position - var_10_14.position

				var_10_14.forward = Vector3.New(var_10_21.x, var_10_21.y, var_10_21.z)

				local var_10_22 = var_10_14.localEulerAngles

				var_10_22.z = 0
				var_10_22.x = 0
				var_10_14.localEulerAngles = var_10_22
			end

			local var_10_23 = 0

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				arg_7_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action1_1")
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_10_25 = 0
			local var_10_26 = 0.075

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[80].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(109081002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 3
				local var_10_31 = utf8.len(var_10_29)
				local var_10_32 = var_10_30 <= 0 and var_10_26 or var_10_26 * (var_10_31 / var_10_30)

				if var_10_32 > 0 and var_10_26 < var_10_32 then
					arg_7_1.talkMaxDuration = var_10_32

					if var_10_32 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_32 + var_10_25
					end
				end

				arg_7_1.text_.text = var_10_29
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081002", "story_v_out_109081.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_109081", "109081002", "story_v_out_109081.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_109081", "109081002", "story_v_out_109081.awb")

						arg_7_1:RecordAudio("109081002", var_10_34)
						arg_7_1:RecordAudio("109081002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_109081", "109081002", "story_v_out_109081.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_109081", "109081002", "story_v_out_109081.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_35 = math.max(var_10_26, arg_7_1.talkMaxDuration)

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_35 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_25) / var_10_35

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_25 + var_10_35 and arg_7_1.time_ < var_10_25 + var_10_35 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play109081003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 109081003
		arg_11_1.duration_ = 8.466

		local var_11_0 = {
			ja = 4.133,
			ko = 4.066,
			zh = 8.466,
			en = 3.933
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
				arg_11_0:Play109081004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["3004_tpose"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect3004_tpose == nil then
				arg_11_1.var_.characterEffect3004_tpose = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect3004_tpose then
					arg_11_1.var_.characterEffect3004_tpose.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect3004_tpose then
				arg_11_1.var_.characterEffect3004_tpose.fillFlat = false
			end

			local var_14_4 = arg_11_1.actors_["10004ui_story"]
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 and arg_11_1.var_.characterEffect10004ui_story == nil then
				arg_11_1.var_.characterEffect10004ui_story = var_14_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_6 = 0.2

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6

				if arg_11_1.var_.characterEffect10004ui_story then
					local var_14_8 = Mathf.Lerp(0, 0.5, var_14_7)

					arg_11_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10004ui_story.fillRatio = var_14_8
				end
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 and arg_11_1.var_.characterEffect10004ui_story then
				local var_14_9 = 0.5

				arg_11_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10004ui_story.fillRatio = var_14_9
			end

			local var_14_10 = 0
			local var_14_11 = 0.35

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_12 = arg_11_1:FormatText(StoryNameCfg[82].name)

				arg_11_1.leftNameTxt_.text = var_14_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_13 = arg_11_1:GetWordFromCfg(109081003)
				local var_14_14 = arg_11_1:FormatText(var_14_13.content)

				arg_11_1.text_.text = var_14_14

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_15 = 14
				local var_14_16 = utf8.len(var_14_14)
				local var_14_17 = var_14_15 <= 0 and var_14_11 or var_14_11 * (var_14_16 / var_14_15)

				if var_14_17 > 0 and var_14_11 < var_14_17 then
					arg_11_1.talkMaxDuration = var_14_17

					if var_14_17 + var_14_10 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_17 + var_14_10
					end
				end

				arg_11_1.text_.text = var_14_14
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081003", "story_v_out_109081.awb") ~= 0 then
					local var_14_18 = manager.audio:GetVoiceLength("story_v_out_109081", "109081003", "story_v_out_109081.awb") / 1000

					if var_14_18 + var_14_10 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_18 + var_14_10
					end

					if var_14_13.prefab_name ~= "" and arg_11_1.actors_[var_14_13.prefab_name] ~= nil then
						local var_14_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_13.prefab_name].transform, "story_v_out_109081", "109081003", "story_v_out_109081.awb")

						arg_11_1:RecordAudio("109081003", var_14_19)
						arg_11_1:RecordAudio("109081003", var_14_19)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_109081", "109081003", "story_v_out_109081.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_109081", "109081003", "story_v_out_109081.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_20 = math.max(var_14_11, arg_11_1.talkMaxDuration)

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_20 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_10) / var_14_20

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_10 + var_14_20 and arg_11_1.time_ < var_14_10 + var_14_20 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play109081004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 109081004
		arg_15_1.duration_ = 6.133

		local var_15_0 = {
			ja = 5.933,
			ko = 6.133,
			zh = 5.533,
			en = 5.733
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
				arg_15_0:Play109081005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["3004_tpose"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos3004_tpose = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos3004_tpose, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, 100, 0)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = arg_15_1.actors_["10004ui_story"].transform
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1.var_.moveOldPos10004ui_story = var_18_9.localPosition
			end

			local var_18_11 = 0.001

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11
				local var_18_13 = Vector3.New(0, 100, 0)

				var_18_9.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10004ui_story, var_18_13, var_18_12)

				local var_18_14 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_14.x, var_18_14.y, var_18_14.z)

				local var_18_15 = var_18_9.localEulerAngles

				var_18_15.z = 0
				var_18_15.x = 0
				var_18_9.localEulerAngles = var_18_15
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 then
				var_18_9.localPosition = Vector3.New(0, 100, 0)

				local var_18_16 = manager.ui.mainCamera.transform.position - var_18_9.position

				var_18_9.forward = Vector3.New(var_18_16.x, var_18_16.y, var_18_16.z)

				local var_18_17 = var_18_9.localEulerAngles

				var_18_17.z = 0
				var_18_17.x = 0
				var_18_9.localEulerAngles = var_18_17
			end

			local var_18_18 = "1099ui_story"

			if arg_15_1.actors_[var_18_18] == nil then
				local var_18_19 = Object.Instantiate(Asset.Load("Char/" .. var_18_18), arg_15_1.stage_.transform)

				var_18_19.name = var_18_18
				var_18_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_18] = var_18_19

				local var_18_20 = var_18_19:GetComponentInChildren(typeof(CharacterEffect))

				var_18_20.enabled = true

				local var_18_21 = GameObjectTools.GetOrAddComponent(var_18_19, typeof(DynamicBoneHelper))

				if var_18_21 then
					var_18_21:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_20.transform, false)

				arg_15_1.var_[var_18_18 .. "Animator"] = var_18_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_18 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_18 .. "LipSync"] = var_18_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_22 = arg_15_1.actors_["1099ui_story"].transform
			local var_18_23 = 0

			if var_18_23 < arg_15_1.time_ and arg_15_1.time_ <= var_18_23 + arg_18_0 then
				arg_15_1.var_.moveOldPos1099ui_story = var_18_22.localPosition
			end

			local var_18_24 = 0.001

			if var_18_23 <= arg_15_1.time_ and arg_15_1.time_ < var_18_23 + var_18_24 then
				local var_18_25 = (arg_15_1.time_ - var_18_23) / var_18_24
				local var_18_26 = Vector3.New(-0.7, -1.08, -5.9)

				var_18_22.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1099ui_story, var_18_26, var_18_25)

				local var_18_27 = manager.ui.mainCamera.transform.position - var_18_22.position

				var_18_22.forward = Vector3.New(var_18_27.x, var_18_27.y, var_18_27.z)

				local var_18_28 = var_18_22.localEulerAngles

				var_18_28.z = 0
				var_18_28.x = 0
				var_18_22.localEulerAngles = var_18_28
			end

			if arg_15_1.time_ >= var_18_23 + var_18_24 and arg_15_1.time_ < var_18_23 + var_18_24 + arg_18_0 then
				var_18_22.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_18_29 = manager.ui.mainCamera.transform.position - var_18_22.position

				var_18_22.forward = Vector3.New(var_18_29.x, var_18_29.y, var_18_29.z)

				local var_18_30 = var_18_22.localEulerAngles

				var_18_30.z = 0
				var_18_30.x = 0
				var_18_22.localEulerAngles = var_18_30
			end

			local var_18_31 = arg_15_1.actors_["1099ui_story"]
			local var_18_32 = 0

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 and arg_15_1.var_.characterEffect1099ui_story == nil then
				arg_15_1.var_.characterEffect1099ui_story = var_18_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_33 = 0.2

			if var_18_32 <= arg_15_1.time_ and arg_15_1.time_ < var_18_32 + var_18_33 then
				local var_18_34 = (arg_15_1.time_ - var_18_32) / var_18_33

				if arg_15_1.var_.characterEffect1099ui_story then
					arg_15_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_32 + var_18_33 and arg_15_1.time_ < var_18_32 + var_18_33 + arg_18_0 and arg_15_1.var_.characterEffect1099ui_story then
				arg_15_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_18_35 = 0

			if var_18_35 < arg_15_1.time_ and arg_15_1.time_ <= var_18_35 + arg_18_0 then
				arg_15_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_1")
			end

			local var_18_36 = 0

			if var_18_36 < arg_15_1.time_ and arg_15_1.time_ <= var_18_36 + arg_18_0 then
				arg_15_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_37 = 0
			local var_18_38 = 0.8

			if var_18_37 < arg_15_1.time_ and arg_15_1.time_ <= var_18_37 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_39 = arg_15_1:FormatText(StoryNameCfg[84].name)

				arg_15_1.leftNameTxt_.text = var_18_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_40 = arg_15_1:GetWordFromCfg(109081004)
				local var_18_41 = arg_15_1:FormatText(var_18_40.content)

				arg_15_1.text_.text = var_18_41

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_42 = 32
				local var_18_43 = utf8.len(var_18_41)
				local var_18_44 = var_18_42 <= 0 and var_18_38 or var_18_38 * (var_18_43 / var_18_42)

				if var_18_44 > 0 and var_18_38 < var_18_44 then
					arg_15_1.talkMaxDuration = var_18_44

					if var_18_44 + var_18_37 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_44 + var_18_37
					end
				end

				arg_15_1.text_.text = var_18_41
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081004", "story_v_out_109081.awb") ~= 0 then
					local var_18_45 = manager.audio:GetVoiceLength("story_v_out_109081", "109081004", "story_v_out_109081.awb") / 1000

					if var_18_45 + var_18_37 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_45 + var_18_37
					end

					if var_18_40.prefab_name ~= "" and arg_15_1.actors_[var_18_40.prefab_name] ~= nil then
						local var_18_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_40.prefab_name].transform, "story_v_out_109081", "109081004", "story_v_out_109081.awb")

						arg_15_1:RecordAudio("109081004", var_18_46)
						arg_15_1:RecordAudio("109081004", var_18_46)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_109081", "109081004", "story_v_out_109081.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_109081", "109081004", "story_v_out_109081.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_47 = math.max(var_18_38, arg_15_1.talkMaxDuration)

			if var_18_37 <= arg_15_1.time_ and arg_15_1.time_ < var_18_37 + var_18_47 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_37) / var_18_47

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_37 + var_18_47 and arg_15_1.time_ < var_18_37 + var_18_47 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play109081005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 109081005
		arg_19_1.duration_ = 1.999999999999

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play109081006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1099ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1099ui_story == nil then
				arg_19_1.var_.characterEffect1099ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1099ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1099ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1099ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1099ui_story.fillRatio = var_22_5
			end

			local var_22_6 = "1050ui_story"

			if arg_19_1.actors_[var_22_6] == nil then
				local var_22_7 = Object.Instantiate(Asset.Load("Char/" .. var_22_6), arg_19_1.stage_.transform)

				var_22_7.name = var_22_6
				var_22_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_6] = var_22_7

				local var_22_8 = var_22_7:GetComponentInChildren(typeof(CharacterEffect))

				var_22_8.enabled = true

				local var_22_9 = GameObjectTools.GetOrAddComponent(var_22_7, typeof(DynamicBoneHelper))

				if var_22_9 then
					var_22_9:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_8.transform, false)

				arg_19_1.var_[var_22_6 .. "Animator"] = var_22_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_6 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_6 .. "LipSync"] = var_22_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_10 = arg_19_1.actors_["1050ui_story"]
			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect1050ui_story == nil then
				arg_19_1.var_.characterEffect1050ui_story = var_22_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_12 = 0.2

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_12 then
				local var_22_13 = (arg_19_1.time_ - var_22_11) / var_22_12

				if arg_19_1.var_.characterEffect1050ui_story then
					arg_19_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_11 + var_22_12 and arg_19_1.time_ < var_22_11 + var_22_12 + arg_22_0 and arg_19_1.var_.characterEffect1050ui_story then
				arg_19_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_22_14 = arg_19_1.actors_["1050ui_story"].transform
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.var_.moveOldPos1050ui_story = var_22_14.localPosition

				local var_22_16 = "1050ui_story"

				arg_19_1:ShowWeapon(arg_19_1.var_[var_22_16 .. "Animator"].transform, true)
			end

			local var_22_17 = 0.001

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_15) / var_22_17
				local var_22_19 = Vector3.New(0.7, -1, -6.1)

				var_22_14.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1050ui_story, var_22_19, var_22_18)

				local var_22_20 = manager.ui.mainCamera.transform.position - var_22_14.position

				var_22_14.forward = Vector3.New(var_22_20.x, var_22_20.y, var_22_20.z)

				local var_22_21 = var_22_14.localEulerAngles

				var_22_21.z = 0
				var_22_21.x = 0
				var_22_14.localEulerAngles = var_22_21
			end

			if arg_19_1.time_ >= var_22_15 + var_22_17 and arg_19_1.time_ < var_22_15 + var_22_17 + arg_22_0 then
				var_22_14.localPosition = Vector3.New(0.7, -1, -6.1)

				local var_22_22 = manager.ui.mainCamera.transform.position - var_22_14.position

				var_22_14.forward = Vector3.New(var_22_22.x, var_22_22.y, var_22_22.z)

				local var_22_23 = var_22_14.localEulerAngles

				var_22_23.z = 0
				var_22_23.x = 0
				var_22_14.localEulerAngles = var_22_23
			end

			local var_22_24 = 0

			if var_22_24 < arg_19_1.time_ and arg_19_1.time_ <= var_22_24 + arg_22_0 then
				arg_19_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action6_1")
			end

			local var_22_25 = 0

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_22_26 = 0
			local var_22_27 = 0.15

			if var_22_26 < arg_19_1.time_ and arg_19_1.time_ <= var_22_26 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_28 = arg_19_1:FormatText(StoryNameCfg[74].name)

				arg_19_1.leftNameTxt_.text = var_22_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_29 = arg_19_1:GetWordFromCfg(109081005)
				local var_22_30 = arg_19_1:FormatText(var_22_29.content)

				arg_19_1.text_.text = var_22_30

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_31 = 6
				local var_22_32 = utf8.len(var_22_30)
				local var_22_33 = var_22_31 <= 0 and var_22_27 or var_22_27 * (var_22_32 / var_22_31)

				if var_22_33 > 0 and var_22_27 < var_22_33 then
					arg_19_1.talkMaxDuration = var_22_33

					if var_22_33 + var_22_26 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_33 + var_22_26
					end
				end

				arg_19_1.text_.text = var_22_30
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081005", "story_v_out_109081.awb") ~= 0 then
					local var_22_34 = manager.audio:GetVoiceLength("story_v_out_109081", "109081005", "story_v_out_109081.awb") / 1000

					if var_22_34 + var_22_26 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_34 + var_22_26
					end

					if var_22_29.prefab_name ~= "" and arg_19_1.actors_[var_22_29.prefab_name] ~= nil then
						local var_22_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_29.prefab_name].transform, "story_v_out_109081", "109081005", "story_v_out_109081.awb")

						arg_19_1:RecordAudio("109081005", var_22_35)
						arg_19_1:RecordAudio("109081005", var_22_35)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_109081", "109081005", "story_v_out_109081.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_109081", "109081005", "story_v_out_109081.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_36 = math.max(var_22_27, arg_19_1.talkMaxDuration)

			if var_22_26 <= arg_19_1.time_ and arg_19_1.time_ < var_22_26 + var_22_36 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_26) / var_22_36

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_26 + var_22_36 and arg_19_1.time_ < var_22_26 + var_22_36 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play109081006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 109081006
		arg_23_1.duration_ = 6.6

		local var_23_0 = {
			ja = 6.6,
			ko = 2.933,
			zh = 4.633,
			en = 3.5
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
				arg_23_0:Play109081007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1099ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1099ui_story == nil then
				arg_23_1.var_.characterEffect1099ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1099ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1099ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1099ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1099ui_story.fillRatio = var_26_5
			end

			local var_26_6 = arg_23_1.actors_["1050ui_story"]
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 and arg_23_1.var_.characterEffect1050ui_story == nil then
				arg_23_1.var_.characterEffect1050ui_story = var_26_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_8 = 0.2

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_8 then
				local var_26_9 = (arg_23_1.time_ - var_26_7) / var_26_8

				if arg_23_1.var_.characterEffect1050ui_story then
					local var_26_10 = Mathf.Lerp(0, 0.5, var_26_9)

					arg_23_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1050ui_story.fillRatio = var_26_10
				end
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 and arg_23_1.var_.characterEffect1050ui_story then
				local var_26_11 = 0.5

				arg_23_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1050ui_story.fillRatio = var_26_11
			end

			local var_26_12 = 0
			local var_26_13 = 0.45

			if var_26_12 < arg_23_1.time_ and arg_23_1.time_ <= var_26_12 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_14 = arg_23_1:FormatText(StoryNameCfg[80].name)

				arg_23_1.leftNameTxt_.text = var_26_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10004")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_15 = arg_23_1:GetWordFromCfg(109081006)
				local var_26_16 = arg_23_1:FormatText(var_26_15.content)

				arg_23_1.text_.text = var_26_16

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_17 = 18
				local var_26_18 = utf8.len(var_26_16)
				local var_26_19 = var_26_17 <= 0 and var_26_13 or var_26_13 * (var_26_18 / var_26_17)

				if var_26_19 > 0 and var_26_13 < var_26_19 then
					arg_23_1.talkMaxDuration = var_26_19

					if var_26_19 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_12
					end
				end

				arg_23_1.text_.text = var_26_16
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081006", "story_v_out_109081.awb") ~= 0 then
					local var_26_20 = manager.audio:GetVoiceLength("story_v_out_109081", "109081006", "story_v_out_109081.awb") / 1000

					if var_26_20 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_12
					end

					if var_26_15.prefab_name ~= "" and arg_23_1.actors_[var_26_15.prefab_name] ~= nil then
						local var_26_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_15.prefab_name].transform, "story_v_out_109081", "109081006", "story_v_out_109081.awb")

						arg_23_1:RecordAudio("109081006", var_26_21)
						arg_23_1:RecordAudio("109081006", var_26_21)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_109081", "109081006", "story_v_out_109081.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_109081", "109081006", "story_v_out_109081.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_13, arg_23_1.talkMaxDuration)

			if var_26_12 <= arg_23_1.time_ and arg_23_1.time_ < var_26_12 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_12) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_12 + var_26_22 and arg_23_1.time_ < var_26_12 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play109081007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 109081007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play109081008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1050ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1050ui_story = var_30_0.localPosition

				local var_30_2 = "1050ui_story"

				arg_27_1:ShowWeapon(arg_27_1.var_[var_30_2 .. "Animator"].transform, true)
			end

			local var_30_3 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_3 then
				local var_30_4 = (arg_27_1.time_ - var_30_1) / var_30_3
				local var_30_5 = Vector3.New(0, 100, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1050ui_story, var_30_5, var_30_4)

				local var_30_6 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_6.x, var_30_6.y, var_30_6.z)

				local var_30_7 = var_30_0.localEulerAngles

				var_30_7.z = 0
				var_30_7.x = 0
				var_30_0.localEulerAngles = var_30_7
			end

			if arg_27_1.time_ >= var_30_1 + var_30_3 and arg_27_1.time_ < var_30_1 + var_30_3 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, 100, 0)

				local var_30_8 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_8.x, var_30_8.y, var_30_8.z)

				local var_30_9 = var_30_0.localEulerAngles

				var_30_9.z = 0
				var_30_9.x = 0
				var_30_0.localEulerAngles = var_30_9
			end

			local var_30_10 = arg_27_1.actors_["1099ui_story"].transform
			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.var_.moveOldPos1099ui_story = var_30_10.localPosition
			end

			local var_30_12 = 0.001

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_12 then
				local var_30_13 = (arg_27_1.time_ - var_30_11) / var_30_12
				local var_30_14 = Vector3.New(0, 100, 0)

				var_30_10.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1099ui_story, var_30_14, var_30_13)

				local var_30_15 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_15.x, var_30_15.y, var_30_15.z)

				local var_30_16 = var_30_10.localEulerAngles

				var_30_16.z = 0
				var_30_16.x = 0
				var_30_10.localEulerAngles = var_30_16
			end

			if arg_27_1.time_ >= var_30_11 + var_30_12 and arg_27_1.time_ < var_30_11 + var_30_12 + arg_30_0 then
				var_30_10.localPosition = Vector3.New(0, 100, 0)

				local var_30_17 = manager.ui.mainCamera.transform.position - var_30_10.position

				var_30_10.forward = Vector3.New(var_30_17.x, var_30_17.y, var_30_17.z)

				local var_30_18 = var_30_10.localEulerAngles

				var_30_18.z = 0
				var_30_18.x = 0
				var_30_10.localEulerAngles = var_30_18
			end

			local var_30_19 = 0
			local var_30_20 = 0.375

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0

				arg_27_1.dialog_:SetActive(true)

				local var_30_21 = LeanTween.value(arg_27_1.dialog_, 0, 1, 0.3)

				var_30_21:setOnUpdate(LuaHelper.FloatAction(function(arg_31_0)
					arg_27_1.dialogCg_.alpha = arg_31_0
				end))
				var_30_21:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_27_1.dialog_)
					var_30_21:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_27_1.duration_ = arg_27_1.duration_ + 0.3

				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(109081007)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 15
				local var_30_25 = utf8.len(var_30_23)
				local var_30_26 = var_30_24 <= 0 and var_30_20 or var_30_20 * (var_30_25 / var_30_24)

				if var_30_26 > 0 and var_30_20 < var_30_26 then
					arg_27_1.talkMaxDuration = var_30_26
					var_30_19 = var_30_19 + 0.3

					if var_30_26 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_26 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_23
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_27 = var_30_19 + 0.3
			local var_30_28 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_27 <= arg_27_1.time_ and arg_27_1.time_ < var_30_27 + var_30_28 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_27) / var_30_28

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_27 + var_30_28 and arg_27_1.time_ < var_30_27 + var_30_28 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play109081008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 109081008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play109081009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = manager.ui.mainCamera.transform
			local var_36_1 = 0.866666666666667

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.shakeOldPosC07_1 = var_36_0.localPosition
			end

			local var_36_2 = 0.6

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / 0.066
				local var_36_4, var_36_5 = math.modf(var_36_3)

				var_36_0.localPosition = Vector3.New(var_36_5 * 0.13, var_36_5 * 0.13, var_36_5 * 0.13) + arg_33_1.var_.shakeOldPosC07_1
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = arg_33_1.var_.shakeOldPosC07_1
			end

			local var_36_6 = 0
			local var_36_7 = 1

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				local var_36_8 = "play"
				local var_36_9 = "effect"

				arg_33_1:AudioAction(var_36_8, var_36_9, "se_story_9", "se_story_9_shock", "")
			end

			local var_36_10 = 0.466666666666667
			local var_36_11 = 1

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 then
				local var_36_12 = "play"
				local var_36_13 = "effect"

				arg_33_1:AudioAction(var_36_12, var_36_13, "se_story_9", "se_story_9_shock02_loop", "")
			end

			local var_36_14 = 0
			local var_36_15 = 1.15

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_16 = arg_33_1:GetWordFromCfg(109081008)
				local var_36_17 = arg_33_1:FormatText(var_36_16.content)

				arg_33_1.text_.text = var_36_17

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_18 = 46
				local var_36_19 = utf8.len(var_36_17)
				local var_36_20 = var_36_18 <= 0 and var_36_15 or var_36_15 * (var_36_19 / var_36_18)

				if var_36_20 > 0 and var_36_15 < var_36_20 then
					arg_33_1.talkMaxDuration = var_36_20

					if var_36_20 + var_36_14 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_20 + var_36_14
					end
				end

				arg_33_1.text_.text = var_36_17
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_21 = math.max(var_36_15, arg_33_1.talkMaxDuration)

			if var_36_14 <= arg_33_1.time_ and arg_33_1.time_ < var_36_14 + var_36_21 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_14) / var_36_21

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_14 + var_36_21 and arg_33_1.time_ < var_36_14 + var_36_21 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play109081009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 109081009
		arg_37_1.duration_ = 5.466666666666

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play109081010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.bgs_.C07_1.transform
			local var_40_1 = 0.466666666666667

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.shakeOldPosC07_1 = var_40_0.localPosition
			end

			local var_40_2 = 5

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / 0.099
				local var_40_4, var_40_5 = math.modf(var_40_3)

				var_40_0.localPosition = Vector3.New(var_40_5 * 0.5, var_40_5 * 0.5, var_40_5 * 0) + arg_37_1.var_.shakeOldPosC07_1
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = arg_37_1.var_.shakeOldPosC07_1
			end

			local var_40_6 = 0
			local var_40_7 = 0.925

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_8 = arg_37_1:GetWordFromCfg(109081009)
				local var_40_9 = arg_37_1:FormatText(var_40_8.content)

				arg_37_1.text_.text = var_40_9

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_10 = 37
				local var_40_11 = utf8.len(var_40_9)
				local var_40_12 = var_40_10 <= 0 and var_40_7 or var_40_7 * (var_40_11 / var_40_10)

				if var_40_12 > 0 and var_40_7 < var_40_12 then
					arg_37_1.talkMaxDuration = var_40_12

					if var_40_12 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_12 + var_40_6
					end
				end

				arg_37_1.text_.text = var_40_9
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_13 = math.max(var_40_7, arg_37_1.talkMaxDuration)

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_13 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_6) / var_40_13

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_6 + var_40_13 and arg_37_1.time_ < var_40_6 + var_40_13 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play109081010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 109081010
		arg_41_1.duration_ = 1.999999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play109081011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1050ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1050ui_story = var_44_0.localPosition

				local var_44_2 = "1050ui_story"

				arg_41_1:ShowWeapon(arg_41_1.var_[var_44_2 .. "Animator"].transform, false)
			end

			local var_44_3 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_3 then
				local var_44_4 = (arg_41_1.time_ - var_44_1) / var_44_3
				local var_44_5 = Vector3.New(-0.7, -1, -6.1)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1050ui_story, var_44_5, var_44_4)

				local var_44_6 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_6.x, var_44_6.y, var_44_6.z)

				local var_44_7 = var_44_0.localEulerAngles

				var_44_7.z = 0
				var_44_7.x = 0
				var_44_0.localEulerAngles = var_44_7
			end

			if arg_41_1.time_ >= var_44_1 + var_44_3 and arg_41_1.time_ < var_44_1 + var_44_3 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(-0.7, -1, -6.1)

				local var_44_8 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_8.x, var_44_8.y, var_44_8.z)

				local var_44_9 = var_44_0.localEulerAngles

				var_44_9.z = 0
				var_44_9.x = 0
				var_44_0.localEulerAngles = var_44_9
			end

			local var_44_10 = manager.ui.mainCamera.transform
			local var_44_11 = 0

			if var_44_11 < arg_41_1.time_ and arg_41_1.time_ <= var_44_11 + arg_44_0 then
				arg_41_1.var_.shakeOldPosC07_1 = var_44_10.localPosition
			end

			local var_44_12 = 0.6

			if var_44_11 <= arg_41_1.time_ and arg_41_1.time_ < var_44_11 + var_44_12 then
				local var_44_13 = (arg_41_1.time_ - var_44_11) / 0.066
				local var_44_14, var_44_15 = math.modf(var_44_13)

				var_44_10.localPosition = Vector3.New(var_44_15 * 0.13, var_44_15 * 0.13, var_44_15 * 0.13) + arg_41_1.var_.shakeOldPosC07_1
			end

			if arg_41_1.time_ >= var_44_11 + var_44_12 and arg_41_1.time_ < var_44_11 + var_44_12 + arg_44_0 then
				var_44_10.localPosition = arg_41_1.var_.shakeOldPosC07_1
			end

			local var_44_16 = arg_41_1.actors_["1050ui_story"]
			local var_44_17 = 0

			if var_44_17 < arg_41_1.time_ and arg_41_1.time_ <= var_44_17 + arg_44_0 and arg_41_1.var_.characterEffect1050ui_story == nil then
				arg_41_1.var_.characterEffect1050ui_story = var_44_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_18 = 0.2

			if var_44_17 <= arg_41_1.time_ and arg_41_1.time_ < var_44_17 + var_44_18 then
				local var_44_19 = (arg_41_1.time_ - var_44_17) / var_44_18

				if arg_41_1.var_.characterEffect1050ui_story then
					arg_41_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_17 + var_44_18 and arg_41_1.time_ < var_44_17 + var_44_18 + arg_44_0 and arg_41_1.var_.characterEffect1050ui_story then
				arg_41_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_44_20 = 0

			if var_44_20 < arg_41_1.time_ and arg_41_1.time_ <= var_44_20 + arg_44_0 then
				arg_41_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_44_21 = 0

			if var_44_21 < arg_41_1.time_ and arg_41_1.time_ <= var_44_21 + arg_44_0 then
				arg_41_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_44_22 = 0
			local var_44_23 = 0.15

			if var_44_22 < arg_41_1.time_ and arg_41_1.time_ <= var_44_22 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				arg_41_1.dialog_:SetActive(true)

				local var_44_24 = LeanTween.value(arg_41_1.dialog_, 0, 1, 0.3)

				var_44_24:setOnUpdate(LuaHelper.FloatAction(function(arg_45_0)
					arg_41_1.dialogCg_.alpha = arg_45_0
				end))
				var_44_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_41_1.dialog_)
					var_44_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_41_1.duration_ = arg_41_1.duration_ + 0.3

				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_25 = arg_41_1:FormatText(StoryNameCfg[74].name)

				arg_41_1.leftNameTxt_.text = var_44_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_26 = arg_41_1:GetWordFromCfg(109081010)
				local var_44_27 = arg_41_1:FormatText(var_44_26.content)

				arg_41_1.text_.text = var_44_27

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_28 = 6
				local var_44_29 = utf8.len(var_44_27)
				local var_44_30 = var_44_28 <= 0 and var_44_23 or var_44_23 * (var_44_29 / var_44_28)

				if var_44_30 > 0 and var_44_23 < var_44_30 then
					arg_41_1.talkMaxDuration = var_44_30
					var_44_22 = var_44_22 + 0.3

					if var_44_30 + var_44_22 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_30 + var_44_22
					end
				end

				arg_41_1.text_.text = var_44_27
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081010", "story_v_out_109081.awb") ~= 0 then
					local var_44_31 = manager.audio:GetVoiceLength("story_v_out_109081", "109081010", "story_v_out_109081.awb") / 1000

					if var_44_31 + var_44_22 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_31 + var_44_22
					end

					if var_44_26.prefab_name ~= "" and arg_41_1.actors_[var_44_26.prefab_name] ~= nil then
						local var_44_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_26.prefab_name].transform, "story_v_out_109081", "109081010", "story_v_out_109081.awb")

						arg_41_1:RecordAudio("109081010", var_44_32)
						arg_41_1:RecordAudio("109081010", var_44_32)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_109081", "109081010", "story_v_out_109081.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_109081", "109081010", "story_v_out_109081.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_33 = var_44_22 + 0.3
			local var_44_34 = math.max(var_44_23, arg_41_1.talkMaxDuration)

			if var_44_33 <= arg_41_1.time_ and arg_41_1.time_ < var_44_33 + var_44_34 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_33) / var_44_34

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_33 + var_44_34 and arg_41_1.time_ < var_44_33 + var_44_34 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play109081011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 109081011
		arg_47_1.duration_ = 3.466

		local var_47_0 = {
			ja = 2.766,
			ko = 2.5,
			zh = 3.466,
			en = 2.633
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
				arg_47_0:Play109081012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1099ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1099ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0.7, -1.08, -5.9)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1099ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1099ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1099ui_story == nil then
				arg_47_1.var_.characterEffect1099ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.2

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1099ui_story then
					arg_47_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1099ui_story then
				arg_47_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_50_13 = arg_47_1.actors_["1050ui_story"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.characterEffect1050ui_story == nil then
				arg_47_1.var_.characterEffect1050ui_story = var_50_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_15 = 0.2

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.characterEffect1050ui_story then
					local var_50_17 = Mathf.Lerp(0, 0.5, var_50_16)

					arg_47_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1050ui_story.fillRatio = var_50_17
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect1050ui_story then
				local var_50_18 = 0.5

				arg_47_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1050ui_story.fillRatio = var_50_18
			end

			local var_50_19 = 0

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_1")
			end

			local var_50_20 = arg_47_1.bgs_.C07_1.transform
			local var_50_21 = 0

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.var_.shakeOldPosC07_1 = var_50_20.localPosition
			end

			local var_50_22 = 2

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / 0.099
				local var_50_24, var_50_25 = math.modf(var_50_23)

				var_50_20.localPosition = Vector3.New(var_50_25 * 0.1, var_50_25 * 0.1, var_50_25 * 0) + arg_47_1.var_.shakeOldPosC07_1
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 then
				var_50_20.localPosition = arg_47_1.var_.shakeOldPosC07_1
			end

			local var_50_26 = 0

			if var_50_26 < arg_47_1.time_ and arg_47_1.time_ <= var_50_26 + arg_50_0 then
				arg_47_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_50_27 = 0
			local var_50_28 = 0.35

			if var_50_27 < arg_47_1.time_ and arg_47_1.time_ <= var_50_27 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_29 = arg_47_1:FormatText(StoryNameCfg[84].name)

				arg_47_1.leftNameTxt_.text = var_50_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_30 = arg_47_1:GetWordFromCfg(109081011)
				local var_50_31 = arg_47_1:FormatText(var_50_30.content)

				arg_47_1.text_.text = var_50_31

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_32 = 14
				local var_50_33 = utf8.len(var_50_31)
				local var_50_34 = var_50_32 <= 0 and var_50_28 or var_50_28 * (var_50_33 / var_50_32)

				if var_50_34 > 0 and var_50_28 < var_50_34 then
					arg_47_1.talkMaxDuration = var_50_34

					if var_50_34 + var_50_27 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_34 + var_50_27
					end
				end

				arg_47_1.text_.text = var_50_31
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081011", "story_v_out_109081.awb") ~= 0 then
					local var_50_35 = manager.audio:GetVoiceLength("story_v_out_109081", "109081011", "story_v_out_109081.awb") / 1000

					if var_50_35 + var_50_27 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_35 + var_50_27
					end

					if var_50_30.prefab_name ~= "" and arg_47_1.actors_[var_50_30.prefab_name] ~= nil then
						local var_50_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_30.prefab_name].transform, "story_v_out_109081", "109081011", "story_v_out_109081.awb")

						arg_47_1:RecordAudio("109081011", var_50_36)
						arg_47_1:RecordAudio("109081011", var_50_36)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_109081", "109081011", "story_v_out_109081.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_109081", "109081011", "story_v_out_109081.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_37 = math.max(var_50_28, arg_47_1.talkMaxDuration)

			if var_50_27 <= arg_47_1.time_ and arg_47_1.time_ < var_50_27 + var_50_37 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_27) / var_50_37

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_27 + var_50_37 and arg_47_1.time_ < var_50_27 + var_50_37 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play109081012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 109081012
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play109081013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "S0905"

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
				local var_54_5 = arg_51_1.bgs_.S0905

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
					if iter_54_0 ~= "S0905" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_16 = arg_51_1.actors_["1050ui_story"].transform
			local var_54_17 = 0

			if var_54_17 < arg_51_1.time_ and arg_51_1.time_ <= var_54_17 + arg_54_0 then
				arg_51_1.var_.moveOldPos1050ui_story = var_54_16.localPosition
			end

			local var_54_18 = 0.001

			if var_54_17 <= arg_51_1.time_ and arg_51_1.time_ < var_54_17 + var_54_18 then
				local var_54_19 = (arg_51_1.time_ - var_54_17) / var_54_18
				local var_54_20 = Vector3.New(0, 100, 0)

				var_54_16.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1050ui_story, var_54_20, var_54_19)

				local var_54_21 = manager.ui.mainCamera.transform.position - var_54_16.position

				var_54_16.forward = Vector3.New(var_54_21.x, var_54_21.y, var_54_21.z)

				local var_54_22 = var_54_16.localEulerAngles

				var_54_22.z = 0
				var_54_22.x = 0
				var_54_16.localEulerAngles = var_54_22
			end

			if arg_51_1.time_ >= var_54_17 + var_54_18 and arg_51_1.time_ < var_54_17 + var_54_18 + arg_54_0 then
				var_54_16.localPosition = Vector3.New(0, 100, 0)

				local var_54_23 = manager.ui.mainCamera.transform.position - var_54_16.position

				var_54_16.forward = Vector3.New(var_54_23.x, var_54_23.y, var_54_23.z)

				local var_54_24 = var_54_16.localEulerAngles

				var_54_24.z = 0
				var_54_24.x = 0
				var_54_16.localEulerAngles = var_54_24
			end

			local var_54_25 = arg_51_1.actors_["1099ui_story"].transform
			local var_54_26 = 0

			if var_54_26 < arg_51_1.time_ and arg_51_1.time_ <= var_54_26 + arg_54_0 then
				arg_51_1.var_.moveOldPos1099ui_story = var_54_25.localPosition
			end

			local var_54_27 = 0.001

			if var_54_26 <= arg_51_1.time_ and arg_51_1.time_ < var_54_26 + var_54_27 then
				local var_54_28 = (arg_51_1.time_ - var_54_26) / var_54_27
				local var_54_29 = Vector3.New(0, 100, 0)

				var_54_25.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1099ui_story, var_54_29, var_54_28)

				local var_54_30 = manager.ui.mainCamera.transform.position - var_54_25.position

				var_54_25.forward = Vector3.New(var_54_30.x, var_54_30.y, var_54_30.z)

				local var_54_31 = var_54_25.localEulerAngles

				var_54_31.z = 0
				var_54_31.x = 0
				var_54_25.localEulerAngles = var_54_31
			end

			if arg_51_1.time_ >= var_54_26 + var_54_27 and arg_51_1.time_ < var_54_26 + var_54_27 + arg_54_0 then
				var_54_25.localPosition = Vector3.New(0, 100, 0)

				local var_54_32 = manager.ui.mainCamera.transform.position - var_54_25.position

				var_54_25.forward = Vector3.New(var_54_32.x, var_54_32.y, var_54_32.z)

				local var_54_33 = var_54_25.localEulerAngles

				var_54_33.z = 0
				var_54_33.x = 0
				var_54_25.localEulerAngles = var_54_33
			end

			local var_54_34 = manager.ui.mainCamera.transform
			local var_54_35 = 0

			if var_54_35 < arg_51_1.time_ and arg_51_1.time_ <= var_54_35 + arg_54_0 then
				arg_51_1.var_.shakeOldPos = var_54_34.localPosition
			end

			local var_54_36 = 3

			if var_54_35 <= arg_51_1.time_ and arg_51_1.time_ < var_54_35 + var_54_36 then
				local var_54_37 = (arg_51_1.time_ - var_54_35) / 0.066
				local var_54_38, var_54_39 = math.modf(var_54_37)

				var_54_34.localPosition = Vector3.New(var_54_39 * 0.13, var_54_39 * 0.13, var_54_39 * 0.13) + arg_51_1.var_.shakeOldPos
			end

			if arg_51_1.time_ >= var_54_35 + var_54_36 and arg_51_1.time_ < var_54_35 + var_54_36 + arg_54_0 then
				var_54_34.localPosition = arg_51_1.var_.shakeOldPos
			end

			local var_54_40 = arg_51_1.bgs_.S0905
			local var_54_41 = 0

			if var_54_41 < arg_51_1.time_ and arg_51_1.time_ <= var_54_41 + arg_54_0 then
				local var_54_42 = var_54_40:GetComponent("SpriteRenderer")

				if var_54_42 then
					var_54_42.material = arg_51_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_54_43 = var_54_42.material
					local var_54_44 = var_54_43:GetColor("_Color")

					arg_51_1.var_.alphaOldValueS0905 = var_54_44.a
					arg_51_1.var_.alphaMatValueS0905 = var_54_43
				end

				arg_51_1.var_.alphaOldValueS0905 = 0
			end

			local var_54_45 = 1.5

			if var_54_41 <= arg_51_1.time_ and arg_51_1.time_ < var_54_41 + var_54_45 then
				local var_54_46 = (arg_51_1.time_ - var_54_41) / var_54_45
				local var_54_47 = Mathf.Lerp(arg_51_1.var_.alphaOldValueS0905, 1, var_54_46)

				if arg_51_1.var_.alphaMatValueS0905 then
					local var_54_48 = arg_51_1.var_.alphaMatValueS0905
					local var_54_49 = var_54_48:GetColor("_Color")

					var_54_49.a = var_54_47

					var_54_48:SetColor("_Color", var_54_49)
				end
			end

			if arg_51_1.time_ >= var_54_41 + var_54_45 and arg_51_1.time_ < var_54_41 + var_54_45 + arg_54_0 and arg_51_1.var_.alphaMatValueS0905 then
				local var_54_50 = arg_51_1.var_.alphaMatValueS0905
				local var_54_51 = var_54_50:GetColor("_Color")

				var_54_51.a = 1

				var_54_50:SetColor("_Color", var_54_51)
			end

			local var_54_52 = arg_51_1.bgs_.S0905.transform
			local var_54_53 = 0

			if var_54_53 < arg_51_1.time_ and arg_51_1.time_ <= var_54_53 + arg_54_0 then
				arg_51_1.var_.moveOldPosS0905 = var_54_52.localPosition
			end

			local var_54_54 = 3

			if var_54_53 <= arg_51_1.time_ and arg_51_1.time_ < var_54_53 + var_54_54 then
				local var_54_55 = (arg_51_1.time_ - var_54_53) / var_54_54
				local var_54_56 = Vector3.New(0, 1, 9.5)

				var_54_52.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosS0905, var_54_56, var_54_55)
			end

			if arg_51_1.time_ >= var_54_53 + var_54_54 and arg_51_1.time_ < var_54_53 + var_54_54 + arg_54_0 then
				var_54_52.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_54_57 = 0
			local var_54_58 = 1

			if var_54_57 < arg_51_1.time_ and arg_51_1.time_ <= var_54_57 + arg_54_0 then
				local var_54_59 = "stop"
				local var_54_60 = "music"

				arg_51_1:AudioAction(var_54_59, var_54_60, "se_story_9", "se_story_9_shock02_loop", "")
			end

			local var_54_61 = 0.433333333333333
			local var_54_62 = 1

			if var_54_61 < arg_51_1.time_ and arg_51_1.time_ <= var_54_61 + arg_54_0 then
				local var_54_63 = "play"
				local var_54_64 = "effect"

				arg_51_1:AudioAction(var_54_63, var_54_64, "se_story_9", "se_story_9_monster", "")
			end

			local var_54_65 = 0
			local var_54_66 = 0.1

			if var_54_65 < arg_51_1.time_ and arg_51_1.time_ <= var_54_65 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_67 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_67:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_67:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_67:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_68 = arg_51_1:FormatText(StoryNameCfg[159].name)

				arg_51_1.leftNameTxt_.text = var_54_68

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_69 = arg_51_1:GetWordFromCfg(109081012)
				local var_54_70 = arg_51_1:FormatText(var_54_69.content)

				arg_51_1.text_.text = var_54_70

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_71 = 4
				local var_54_72 = utf8.len(var_54_70)
				local var_54_73 = var_54_71 <= 0 and var_54_66 or var_54_66 * (var_54_72 / var_54_71)

				if var_54_73 > 0 and var_54_66 < var_54_73 then
					arg_51_1.talkMaxDuration = var_54_73
					var_54_65 = var_54_65 + 0.3

					if var_54_73 + var_54_65 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_73 + var_54_65
					end
				end

				arg_51_1.text_.text = var_54_70
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_74 = var_54_65 + 0.3
			local var_54_75 = math.max(var_54_66, arg_51_1.talkMaxDuration)

			if var_54_74 <= arg_51_1.time_ and arg_51_1.time_ < var_54_74 + var_54_75 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_74) / var_54_75

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_74 + var_54_75 and arg_51_1.time_ < var_54_74 + var_54_75 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play109081013 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 109081013
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play109081014(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 1

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				local var_60_2 = "play"
				local var_60_3 = "effect"

				arg_57_1:AudioAction(var_60_2, var_60_3, "se_story_9", "se_story_9_monster02", "")
			end

			local var_60_4 = 0
			local var_60_5 = 1.15

			if var_60_4 < arg_57_1.time_ and arg_57_1.time_ <= var_60_4 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_6 = arg_57_1:GetWordFromCfg(109081013)
				local var_60_7 = arg_57_1:FormatText(var_60_6.content)

				arg_57_1.text_.text = var_60_7

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_8 = 46
				local var_60_9 = utf8.len(var_60_7)
				local var_60_10 = var_60_8 <= 0 and var_60_5 or var_60_5 * (var_60_9 / var_60_8)

				if var_60_10 > 0 and var_60_5 < var_60_10 then
					arg_57_1.talkMaxDuration = var_60_10

					if var_60_10 + var_60_4 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_10 + var_60_4
					end
				end

				arg_57_1.text_.text = var_60_7
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_11 = math.max(var_60_5, arg_57_1.talkMaxDuration)

			if var_60_4 <= arg_57_1.time_ and arg_57_1.time_ < var_60_4 + var_60_11 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_4) / var_60_11

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_4 + var_60_11 and arg_57_1.time_ < var_60_4 + var_60_11 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play109081014 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 109081014
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play109081015(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.725

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_2 = arg_61_1:GetWordFromCfg(109081014)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 29
				local var_64_5 = utf8.len(var_64_3)
				local var_64_6 = var_64_4 <= 0 and var_64_1 or var_64_1 * (var_64_5 / var_64_4)

				if var_64_6 > 0 and var_64_1 < var_64_6 then
					arg_61_1.talkMaxDuration = var_64_6

					if var_64_6 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_6 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_3
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_7 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_7 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_7

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_7 and arg_61_1.time_ < var_64_0 + var_64_7 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play109081015 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 109081015
		arg_65_1.duration_ = 10

		local var_65_0 = {
			ja = 10,
			ko = 8,
			zh = 5.9,
			en = 6.533
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
				arg_65_0:Play109081016(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.5

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[87].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(109081015)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 20
				local var_68_6 = utf8.len(var_68_4)
				local var_68_7 = var_68_5 <= 0 and var_68_1 or var_68_1 * (var_68_6 / var_68_5)

				if var_68_7 > 0 and var_68_1 < var_68_7 then
					arg_65_1.talkMaxDuration = var_68_7

					if var_68_7 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_7 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_4
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081015", "story_v_out_109081.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_109081", "109081015", "story_v_out_109081.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_109081", "109081015", "story_v_out_109081.awb")

						arg_65_1:RecordAudio("109081015", var_68_9)
						arg_65_1:RecordAudio("109081015", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_109081", "109081015", "story_v_out_109081.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_109081", "109081015", "story_v_out_109081.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_10 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_10 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_10

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_10 and arg_65_1.time_ < var_68_0 + var_68_10 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play109081016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 109081016
		arg_69_1.duration_ = 9.8

		local var_69_0 = {
			ja = 9.8,
			ko = 6.2,
			zh = 5.033,
			en = 6.433
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
				arg_69_0:Play109081017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 1

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[87].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(109081016)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 16
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081016", "story_v_out_109081.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_109081", "109081016", "story_v_out_109081.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_109081", "109081016", "story_v_out_109081.awb")

						arg_69_1:RecordAudio("109081016", var_72_9)
						arg_69_1:RecordAudio("109081016", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_109081", "109081016", "story_v_out_109081.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_109081", "109081016", "story_v_out_109081.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play109081017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 109081017
		arg_73_1.duration_ = 14.7

		local var_73_0 = {
			ja = 14.7,
			ko = 6.733,
			zh = 8,
			en = 7.433
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
				arg_73_0:Play109081018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.7

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[87].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(109081017)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 28
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081017", "story_v_out_109081.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_109081", "109081017", "story_v_out_109081.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_109081", "109081017", "story_v_out_109081.awb")

						arg_73_1:RecordAudio("109081017", var_76_9)
						arg_73_1:RecordAudio("109081017", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_109081", "109081017", "story_v_out_109081.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_109081", "109081017", "story_v_out_109081.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_10 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_10 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_10

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_10 and arg_73_1.time_ < var_76_0 + var_76_10 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play109081018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 109081018
		arg_77_1.duration_ = 1.433

		local var_77_0 = {
			ja = 1.433,
			ko = 1.233,
			zh = 1.233,
			en = 1.266
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
				arg_77_0:Play109081019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.1

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[84].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1099")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(109081018)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 4
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081018", "story_v_out_109081.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_109081", "109081018", "story_v_out_109081.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_109081", "109081018", "story_v_out_109081.awb")

						arg_77_1:RecordAudio("109081018", var_80_9)
						arg_77_1:RecordAudio("109081018", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_109081", "109081018", "story_v_out_109081.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_109081", "109081018", "story_v_out_109081.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_10 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_10 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_10

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_10 and arg_77_1.time_ < var_80_0 + var_80_10 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play109081019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 109081019
		arg_81_1.duration_ = 3.566

		local var_81_0 = {
			ja = 2.5,
			ko = 2.666,
			zh = 3.566,
			en = 3.5
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
				arg_81_0:Play109081020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.325

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[74].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(109081019)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 13
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081019", "story_v_out_109081.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_109081", "109081019", "story_v_out_109081.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_109081", "109081019", "story_v_out_109081.awb")

						arg_81_1:RecordAudio("109081019", var_84_9)
						arg_81_1:RecordAudio("109081019", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_109081", "109081019", "story_v_out_109081.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_109081", "109081019", "story_v_out_109081.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play109081020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 109081020
		arg_85_1.duration_ = 14.066

		local var_85_0 = {
			ja = 9.566,
			ko = 11.866,
			zh = 12.8,
			en = 14.066
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
				arg_85_0:Play109081021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.975

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

				local var_88_3 = arg_85_1:GetWordFromCfg(109081020)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081020", "story_v_out_109081.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_109081", "109081020", "story_v_out_109081.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_109081", "109081020", "story_v_out_109081.awb")

						arg_85_1:RecordAudio("109081020", var_88_9)
						arg_85_1:RecordAudio("109081020", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_109081", "109081020", "story_v_out_109081.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_109081", "109081020", "story_v_out_109081.awb")
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
	Play109081021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 109081021
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play109081022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = manager.ui.mainCamera.transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.shakeOldPos = var_92_0.localPosition
			end

			local var_92_2 = 1.5

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / 0.099
				local var_92_4, var_92_5 = math.modf(var_92_3)

				var_92_0.localPosition = Vector3.New(var_92_5 * 0.13, var_92_5 * 0.13, var_92_5 * 0.13) + arg_89_1.var_.shakeOldPos
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = arg_89_1.var_.shakeOldPos
			end

			local var_92_6 = 0
			local var_92_7 = 1

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				local var_92_8 = "play"
				local var_92_9 = "effect"

				arg_89_1:AudioAction(var_92_8, var_92_9, "se_story_9", "se_story_9_monster03", "")
			end

			local var_92_10 = 0
			local var_92_11 = 0.1

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_12 = arg_89_1:FormatText(StoryNameCfg[159].name)

				arg_89_1.leftNameTxt_.text = var_92_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_13 = arg_89_1:GetWordFromCfg(109081021)
				local var_92_14 = arg_89_1:FormatText(var_92_13.content)

				arg_89_1.text_.text = var_92_14

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_15 = 4
				local var_92_16 = utf8.len(var_92_14)
				local var_92_17 = var_92_15 <= 0 and var_92_11 or var_92_11 * (var_92_16 / var_92_15)

				if var_92_17 > 0 and var_92_11 < var_92_17 then
					arg_89_1.talkMaxDuration = var_92_17

					if var_92_17 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_17 + var_92_10
					end
				end

				arg_89_1.text_.text = var_92_14
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_18 = math.max(var_92_11, arg_89_1.talkMaxDuration)

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_18 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_10) / var_92_18

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_10 + var_92_18 and arg_89_1.time_ < var_92_10 + var_92_18 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play109081022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 109081022
		arg_93_1.duration_ = 5.765999999999

		local var_93_0 = {
			ja = 5.765999999999,
			ko = 4.399999999999,
			zh = 4.232999999999,
			en = 4.599999999999
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
				arg_93_0:Play109081023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				local var_96_1 = manager.ui.mainCamera.transform.localPosition
				local var_96_2 = Vector3.New(0, 0, 10) + Vector3.New(var_96_1.x, var_96_1.y, 0)
				local var_96_3 = arg_93_1.bgs_.C07_1

				var_96_3.transform.localPosition = var_96_2
				var_96_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_96_4 = var_96_3:GetComponent("SpriteRenderer")

				if var_96_4 and var_96_4.sprite then
					local var_96_5 = (var_96_3.transform.localPosition - var_96_1).z
					local var_96_6 = manager.ui.mainCameraCom_
					local var_96_7 = 2 * var_96_5 * Mathf.Tan(var_96_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_96_8 = var_96_7 * var_96_6.aspect
					local var_96_9 = var_96_4.sprite.bounds.size.x
					local var_96_10 = var_96_4.sprite.bounds.size.y
					local var_96_11 = var_96_8 / var_96_9
					local var_96_12 = var_96_7 / var_96_10
					local var_96_13 = var_96_12 < var_96_11 and var_96_11 or var_96_12

					var_96_3.transform.localScale = Vector3.New(var_96_13, var_96_13, 0)
				end

				for iter_96_0, iter_96_1 in pairs(arg_93_1.bgs_) do
					if iter_96_0 ~= "C07_1" then
						iter_96_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_96_14 = arg_93_1.bgs_.C07_1
			local var_96_15 = 0

			if var_96_15 < arg_93_1.time_ and arg_93_1.time_ <= var_96_15 + arg_96_0 then
				local var_96_16 = var_96_14:GetComponent("SpriteRenderer")

				if var_96_16 then
					var_96_16.material = arg_93_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_96_17 = var_96_16.material
					local var_96_18 = var_96_17:GetColor("_Color")

					arg_93_1.var_.alphaOldValueC07_1 = var_96_18.a
					arg_93_1.var_.alphaMatValueC07_1 = var_96_17
				end

				arg_93_1.var_.alphaOldValueC07_1 = 0
			end

			local var_96_19 = 1.5

			if var_96_15 <= arg_93_1.time_ and arg_93_1.time_ < var_96_15 + var_96_19 then
				local var_96_20 = (arg_93_1.time_ - var_96_15) / var_96_19
				local var_96_21 = Mathf.Lerp(arg_93_1.var_.alphaOldValueC07_1, 1, var_96_20)

				if arg_93_1.var_.alphaMatValueC07_1 then
					local var_96_22 = arg_93_1.var_.alphaMatValueC07_1
					local var_96_23 = var_96_22:GetColor("_Color")

					var_96_23.a = var_96_21

					var_96_22:SetColor("_Color", var_96_23)
				end
			end

			if arg_93_1.time_ >= var_96_15 + var_96_19 and arg_93_1.time_ < var_96_15 + var_96_19 + arg_96_0 and arg_93_1.var_.alphaMatValueC07_1 then
				local var_96_24 = arg_93_1.var_.alphaMatValueC07_1
				local var_96_25 = var_96_24:GetColor("_Color")

				var_96_25.a = 1

				var_96_24:SetColor("_Color", var_96_25)
			end

			local var_96_26 = 0

			if var_96_26 < arg_93_1.time_ and arg_93_1.time_ <= var_96_26 + arg_96_0 then
				arg_93_1.allBtn_.enabled = false
			end

			local var_96_27 = 1.5

			if arg_93_1.time_ >= var_96_26 + var_96_27 and arg_93_1.time_ < var_96_26 + var_96_27 + arg_96_0 then
				arg_93_1.allBtn_.enabled = true
			end

			local var_96_28 = arg_93_1.actors_["10004ui_story"].transform
			local var_96_29 = 1

			if var_96_29 < arg_93_1.time_ and arg_93_1.time_ <= var_96_29 + arg_96_0 then
				arg_93_1.var_.moveOldPos10004ui_story = var_96_28.localPosition
			end

			local var_96_30 = 0.001

			if var_96_29 <= arg_93_1.time_ and arg_93_1.time_ < var_96_29 + var_96_30 then
				local var_96_31 = (arg_93_1.time_ - var_96_29) / var_96_30
				local var_96_32 = Vector3.New(0, -1.1, -5.6)

				var_96_28.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10004ui_story, var_96_32, var_96_31)

				local var_96_33 = manager.ui.mainCamera.transform.position - var_96_28.position

				var_96_28.forward = Vector3.New(var_96_33.x, var_96_33.y, var_96_33.z)

				local var_96_34 = var_96_28.localEulerAngles

				var_96_34.z = 0
				var_96_34.x = 0
				var_96_28.localEulerAngles = var_96_34
			end

			if arg_93_1.time_ >= var_96_29 + var_96_30 and arg_93_1.time_ < var_96_29 + var_96_30 + arg_96_0 then
				var_96_28.localPosition = Vector3.New(0, -1.1, -5.6)

				local var_96_35 = manager.ui.mainCamera.transform.position - var_96_28.position

				var_96_28.forward = Vector3.New(var_96_35.x, var_96_35.y, var_96_35.z)

				local var_96_36 = var_96_28.localEulerAngles

				var_96_36.z = 0
				var_96_36.x = 0
				var_96_28.localEulerAngles = var_96_36
			end

			local var_96_37 = 1

			if var_96_37 < arg_93_1.time_ and arg_93_1.time_ <= var_96_37 + arg_96_0 then
				arg_93_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action7_2")
			end

			local var_96_38 = arg_93_1.actors_["10004ui_story"]
			local var_96_39 = 1

			if var_96_39 < arg_93_1.time_ and arg_93_1.time_ <= var_96_39 + arg_96_0 and arg_93_1.var_.characterEffect10004ui_story == nil then
				arg_93_1.var_.characterEffect10004ui_story = var_96_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_40 = 0.2

			if var_96_39 <= arg_93_1.time_ and arg_93_1.time_ < var_96_39 + var_96_40 then
				local var_96_41 = (arg_93_1.time_ - var_96_39) / var_96_40

				if arg_93_1.var_.characterEffect10004ui_story then
					arg_93_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_39 + var_96_40 and arg_93_1.time_ < var_96_39 + var_96_40 + arg_96_0 and arg_93_1.var_.characterEffect10004ui_story then
				arg_93_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_96_42 = 1

			if var_96_42 < arg_93_1.time_ and arg_93_1.time_ <= var_96_42 + arg_96_0 then
				arg_93_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_96_43 = 1.499999999999
			local var_96_44 = 0.3

			if var_96_43 < arg_93_1.time_ and arg_93_1.time_ <= var_96_43 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_45 = arg_93_1:FormatText(StoryNameCfg[80].name)

				arg_93_1.leftNameTxt_.text = var_96_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_46 = arg_93_1:GetWordFromCfg(109081022)
				local var_96_47 = arg_93_1:FormatText(var_96_46.content)

				arg_93_1.text_.text = var_96_47

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_48 = 12
				local var_96_49 = utf8.len(var_96_47)
				local var_96_50 = var_96_48 <= 0 and var_96_44 or var_96_44 * (var_96_49 / var_96_48)

				if var_96_50 > 0 and var_96_44 < var_96_50 then
					arg_93_1.talkMaxDuration = var_96_50

					if var_96_50 + var_96_43 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_50 + var_96_43
					end
				end

				arg_93_1.text_.text = var_96_47
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081022", "story_v_out_109081.awb") ~= 0 then
					local var_96_51 = manager.audio:GetVoiceLength("story_v_out_109081", "109081022", "story_v_out_109081.awb") / 1000

					if var_96_51 + var_96_43 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_51 + var_96_43
					end

					if var_96_46.prefab_name ~= "" and arg_93_1.actors_[var_96_46.prefab_name] ~= nil then
						local var_96_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_46.prefab_name].transform, "story_v_out_109081", "109081022", "story_v_out_109081.awb")

						arg_93_1:RecordAudio("109081022", var_96_52)
						arg_93_1:RecordAudio("109081022", var_96_52)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_109081", "109081022", "story_v_out_109081.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_109081", "109081022", "story_v_out_109081.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_53 = math.max(var_96_44, arg_93_1.talkMaxDuration)

			if var_96_43 <= arg_93_1.time_ and arg_93_1.time_ < var_96_43 + var_96_53 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_43) / var_96_53

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_43 + var_96_53 and arg_93_1.time_ < var_96_43 + var_96_53 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play109081023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 109081023
		arg_97_1.duration_ = 8.666

		local var_97_0 = {
			ja = 8.666,
			ko = 5.866,
			zh = 4.3,
			en = 5.466
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
				arg_97_0:Play109081024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = "4014_tpose"

			if arg_97_1.actors_[var_100_0] == nil then
				local var_100_1 = Object.Instantiate(Asset.Load("Char/" .. var_100_0), arg_97_1.stage_.transform)

				var_100_1.name = var_100_0
				var_100_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.actors_[var_100_0] = var_100_1

				local var_100_2 = var_100_1:GetComponentInChildren(typeof(CharacterEffect))

				var_100_2.enabled = true

				local var_100_3 = GameObjectTools.GetOrAddComponent(var_100_1, typeof(DynamicBoneHelper))

				if var_100_3 then
					var_100_3:EnableDynamicBone(false)
				end

				arg_97_1:ShowWeapon(var_100_2.transform, false)

				arg_97_1.var_[var_100_0 .. "Animator"] = var_100_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_97_1.var_[var_100_0 .. "Animator"].applyRootMotion = true
				arg_97_1.var_[var_100_0 .. "LipSync"] = var_100_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_100_4 = arg_97_1.actors_["4014_tpose"].transform
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.var_.moveOldPos4014_tpose = var_100_4.localPosition
			end

			local var_100_6 = 0.001

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6
				local var_100_8 = Vector3.New(0, -1.95, -4.2)

				var_100_4.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos4014_tpose, var_100_8, var_100_7)

				local var_100_9 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_9.x, var_100_9.y, var_100_9.z)

				local var_100_10 = var_100_4.localEulerAngles

				var_100_10.z = 0
				var_100_10.x = 0
				var_100_4.localEulerAngles = var_100_10
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 then
				var_100_4.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_100_11 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_11.x, var_100_11.y, var_100_11.z)

				local var_100_12 = var_100_4.localEulerAngles

				var_100_12.z = 0
				var_100_12.x = 0
				var_100_4.localEulerAngles = var_100_12
			end

			local var_100_13 = arg_97_1.actors_["4014_tpose"]
			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 and arg_97_1.var_.characterEffect4014_tpose == nil then
				arg_97_1.var_.characterEffect4014_tpose = var_100_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_15 = 0.2

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15

				if arg_97_1.var_.characterEffect4014_tpose then
					arg_97_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 and arg_97_1.var_.characterEffect4014_tpose then
				arg_97_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_100_17 = 0

			if var_100_17 < arg_97_1.time_ and arg_97_1.time_ <= var_100_17 + arg_100_0 then
				arg_97_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_100_18 = arg_97_1.actors_["10004ui_story"].transform
			local var_100_19 = 0

			if var_100_19 < arg_97_1.time_ and arg_97_1.time_ <= var_100_19 + arg_100_0 then
				arg_97_1.var_.moveOldPos10004ui_story = var_100_18.localPosition
			end

			local var_100_20 = 0.001

			if var_100_19 <= arg_97_1.time_ and arg_97_1.time_ < var_100_19 + var_100_20 then
				local var_100_21 = (arg_97_1.time_ - var_100_19) / var_100_20
				local var_100_22 = Vector3.New(0, 100, 0)

				var_100_18.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10004ui_story, var_100_22, var_100_21)

				local var_100_23 = manager.ui.mainCamera.transform.position - var_100_18.position

				var_100_18.forward = Vector3.New(var_100_23.x, var_100_23.y, var_100_23.z)

				local var_100_24 = var_100_18.localEulerAngles

				var_100_24.z = 0
				var_100_24.x = 0
				var_100_18.localEulerAngles = var_100_24
			end

			if arg_97_1.time_ >= var_100_19 + var_100_20 and arg_97_1.time_ < var_100_19 + var_100_20 + arg_100_0 then
				var_100_18.localPosition = Vector3.New(0, 100, 0)

				local var_100_25 = manager.ui.mainCamera.transform.position - var_100_18.position

				var_100_18.forward = Vector3.New(var_100_25.x, var_100_25.y, var_100_25.z)

				local var_100_26 = var_100_18.localEulerAngles

				var_100_26.z = 0
				var_100_26.x = 0
				var_100_18.localEulerAngles = var_100_26
			end

			local var_100_27 = 0
			local var_100_28 = 0.45

			if var_100_27 < arg_97_1.time_ and arg_97_1.time_ <= var_100_27 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_29 = arg_97_1:FormatText(StoryNameCfg[87].name)

				arg_97_1.leftNameTxt_.text = var_100_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_30 = arg_97_1:GetWordFromCfg(109081023)
				local var_100_31 = arg_97_1:FormatText(var_100_30.content)

				arg_97_1.text_.text = var_100_31

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_32 = 18
				local var_100_33 = utf8.len(var_100_31)
				local var_100_34 = var_100_32 <= 0 and var_100_28 or var_100_28 * (var_100_33 / var_100_32)

				if var_100_34 > 0 and var_100_28 < var_100_34 then
					arg_97_1.talkMaxDuration = var_100_34

					if var_100_34 + var_100_27 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_34 + var_100_27
					end
				end

				arg_97_1.text_.text = var_100_31
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081023", "story_v_out_109081.awb") ~= 0 then
					local var_100_35 = manager.audio:GetVoiceLength("story_v_out_109081", "109081023", "story_v_out_109081.awb") / 1000

					if var_100_35 + var_100_27 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_35 + var_100_27
					end

					if var_100_30.prefab_name ~= "" and arg_97_1.actors_[var_100_30.prefab_name] ~= nil then
						local var_100_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_30.prefab_name].transform, "story_v_out_109081", "109081023", "story_v_out_109081.awb")

						arg_97_1:RecordAudio("109081023", var_100_36)
						arg_97_1:RecordAudio("109081023", var_100_36)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_109081", "109081023", "story_v_out_109081.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_109081", "109081023", "story_v_out_109081.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_37 = math.max(var_100_28, arg_97_1.talkMaxDuration)

			if var_100_27 <= arg_97_1.time_ and arg_97_1.time_ < var_100_27 + var_100_37 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_27) / var_100_37

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_27 + var_100_37 and arg_97_1.time_ < var_100_27 + var_100_37 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play109081024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 109081024
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play109081025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["4014_tpose"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos4014_tpose = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, 100, 0)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos4014_tpose, var_104_4, var_104_3)

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

			local var_104_9 = 0
			local var_104_10 = 0.425

			if var_104_9 < arg_101_1.time_ and arg_101_1.time_ <= var_104_9 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_11 = arg_101_1:FormatText(StoryNameCfg[7].name)

				arg_101_1.leftNameTxt_.text = var_104_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_12 = arg_101_1:GetWordFromCfg(109081024)
				local var_104_13 = arg_101_1:FormatText(var_104_12.content)

				arg_101_1.text_.text = var_104_13

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_14 = 17
				local var_104_15 = utf8.len(var_104_13)
				local var_104_16 = var_104_14 <= 0 and var_104_10 or var_104_10 * (var_104_15 / var_104_14)

				if var_104_16 > 0 and var_104_10 < var_104_16 then
					arg_101_1.talkMaxDuration = var_104_16

					if var_104_16 + var_104_9 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_16 + var_104_9
					end
				end

				arg_101_1.text_.text = var_104_13
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_17 = math.max(var_104_10, arg_101_1.talkMaxDuration)

			if var_104_9 <= arg_101_1.time_ and arg_101_1.time_ < var_104_9 + var_104_17 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_9) / var_104_17

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_9 + var_104_17 and arg_101_1.time_ < var_104_9 + var_104_17 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play109081025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 109081025
		arg_105_1.duration_ = 2.166

		local var_105_0 = {
			ja = 1.999999999999,
			ko = 2.166,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_105_0:Play109081026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = "1038ui_story"

			if arg_105_1.actors_[var_108_0] == nil then
				local var_108_1 = Object.Instantiate(Asset.Load("Char/" .. var_108_0), arg_105_1.stage_.transform)

				var_108_1.name = var_108_0
				var_108_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_105_1.actors_[var_108_0] = var_108_1

				local var_108_2 = var_108_1:GetComponentInChildren(typeof(CharacterEffect))

				var_108_2.enabled = true

				local var_108_3 = GameObjectTools.GetOrAddComponent(var_108_1, typeof(DynamicBoneHelper))

				if var_108_3 then
					var_108_3:EnableDynamicBone(false)
				end

				arg_105_1:ShowWeapon(var_108_2.transform, false)

				arg_105_1.var_[var_108_0 .. "Animator"] = var_108_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_105_1.var_[var_108_0 .. "Animator"].applyRootMotion = true
				arg_105_1.var_[var_108_0 .. "LipSync"] = var_108_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_108_4 = arg_105_1.actors_["1038ui_story"].transform
			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1.var_.moveOldPos1038ui_story = var_108_4.localPosition
			end

			local var_108_6 = 0.001

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6
				local var_108_8 = Vector3.New(-0.7, -1.11, -5.9)

				var_108_4.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1038ui_story, var_108_8, var_108_7)

				local var_108_9 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_9.x, var_108_9.y, var_108_9.z)

				local var_108_10 = var_108_4.localEulerAngles

				var_108_10.z = 0
				var_108_10.x = 0
				var_108_4.localEulerAngles = var_108_10
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 then
				var_108_4.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_108_11 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_11.x, var_108_11.y, var_108_11.z)

				local var_108_12 = var_108_4.localEulerAngles

				var_108_12.z = 0
				var_108_12.x = 0
				var_108_4.localEulerAngles = var_108_12
			end

			local var_108_13 = arg_105_1.actors_["1038ui_story"]
			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 and arg_105_1.var_.characterEffect1038ui_story == nil then
				arg_105_1.var_.characterEffect1038ui_story = var_108_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_15 = 0.2

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_15 then
				local var_108_16 = (arg_105_1.time_ - var_108_14) / var_108_15

				if arg_105_1.var_.characterEffect1038ui_story then
					arg_105_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_14 + var_108_15 and arg_105_1.time_ < var_108_14 + var_108_15 + arg_108_0 and arg_105_1.var_.characterEffect1038ui_story then
				arg_105_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_108_17 = 0

			if var_108_17 < arg_105_1.time_ and arg_105_1.time_ <= var_108_17 + arg_108_0 then
				arg_105_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action7_1")
			end

			local var_108_18 = 0

			if var_108_18 < arg_105_1.time_ and arg_105_1.time_ <= var_108_18 + arg_108_0 then
				arg_105_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_108_19 = 0
			local var_108_20 = 0.25

			if var_108_19 < arg_105_1.time_ and arg_105_1.time_ <= var_108_19 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_21 = arg_105_1:FormatText(StoryNameCfg[94].name)

				arg_105_1.leftNameTxt_.text = var_108_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_22 = arg_105_1:GetWordFromCfg(109081025)
				local var_108_23 = arg_105_1:FormatText(var_108_22.content)

				arg_105_1.text_.text = var_108_23

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_24 = 10
				local var_108_25 = utf8.len(var_108_23)
				local var_108_26 = var_108_24 <= 0 and var_108_20 or var_108_20 * (var_108_25 / var_108_24)

				if var_108_26 > 0 and var_108_20 < var_108_26 then
					arg_105_1.talkMaxDuration = var_108_26

					if var_108_26 + var_108_19 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_26 + var_108_19
					end
				end

				arg_105_1.text_.text = var_108_23
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081025", "story_v_out_109081.awb") ~= 0 then
					local var_108_27 = manager.audio:GetVoiceLength("story_v_out_109081", "109081025", "story_v_out_109081.awb") / 1000

					if var_108_27 + var_108_19 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_27 + var_108_19
					end

					if var_108_22.prefab_name ~= "" and arg_105_1.actors_[var_108_22.prefab_name] ~= nil then
						local var_108_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_22.prefab_name].transform, "story_v_out_109081", "109081025", "story_v_out_109081.awb")

						arg_105_1:RecordAudio("109081025", var_108_28)
						arg_105_1:RecordAudio("109081025", var_108_28)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_109081", "109081025", "story_v_out_109081.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_109081", "109081025", "story_v_out_109081.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_29 = math.max(var_108_20, arg_105_1.talkMaxDuration)

			if var_108_19 <= arg_105_1.time_ and arg_105_1.time_ < var_108_19 + var_108_29 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_19) / var_108_29

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_19 + var_108_29 and arg_105_1.time_ < var_108_19 + var_108_29 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play109081026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 109081026
		arg_109_1.duration_ = 2.1

		local var_109_0 = {
			ja = 1.999999999999,
			ko = 2.1,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_109_0:Play109081027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = "1084ui_story"

			if arg_109_1.actors_[var_112_0] == nil then
				local var_112_1 = Object.Instantiate(Asset.Load("Char/" .. var_112_0), arg_109_1.stage_.transform)

				var_112_1.name = var_112_0
				var_112_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_109_1.actors_[var_112_0] = var_112_1

				local var_112_2 = var_112_1:GetComponentInChildren(typeof(CharacterEffect))

				var_112_2.enabled = true

				local var_112_3 = GameObjectTools.GetOrAddComponent(var_112_1, typeof(DynamicBoneHelper))

				if var_112_3 then
					var_112_3:EnableDynamicBone(false)
				end

				arg_109_1:ShowWeapon(var_112_2.transform, false)

				arg_109_1.var_[var_112_0 .. "Animator"] = var_112_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_109_1.var_[var_112_0 .. "Animator"].applyRootMotion = true
				arg_109_1.var_[var_112_0 .. "LipSync"] = var_112_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_112_4 = arg_109_1.actors_["1084ui_story"].transform
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 then
				arg_109_1.var_.moveOldPos1084ui_story = var_112_4.localPosition

				local var_112_6 = "1084ui_story"

				arg_109_1:ShowWeapon(arg_109_1.var_[var_112_6 .. "Animator"].transform, true)
			end

			local var_112_7 = 0.001

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_7 then
				local var_112_8 = (arg_109_1.time_ - var_112_5) / var_112_7
				local var_112_9 = Vector3.New(0.7, -0.97, -6)

				var_112_4.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1084ui_story, var_112_9, var_112_8)

				local var_112_10 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_10.x, var_112_10.y, var_112_10.z)

				local var_112_11 = var_112_4.localEulerAngles

				var_112_11.z = 0
				var_112_11.x = 0
				var_112_4.localEulerAngles = var_112_11
			end

			if arg_109_1.time_ >= var_112_5 + var_112_7 and arg_109_1.time_ < var_112_5 + var_112_7 + arg_112_0 then
				var_112_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_112_12 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_12.x, var_112_12.y, var_112_12.z)

				local var_112_13 = var_112_4.localEulerAngles

				var_112_13.z = 0
				var_112_13.x = 0
				var_112_4.localEulerAngles = var_112_13
			end

			local var_112_14 = arg_109_1.actors_["1084ui_story"]
			local var_112_15 = 0

			if var_112_15 < arg_109_1.time_ and arg_109_1.time_ <= var_112_15 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story == nil then
				arg_109_1.var_.characterEffect1084ui_story = var_112_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_16 = 0.2

			if var_112_15 <= arg_109_1.time_ and arg_109_1.time_ < var_112_15 + var_112_16 then
				local var_112_17 = (arg_109_1.time_ - var_112_15) / var_112_16

				if arg_109_1.var_.characterEffect1084ui_story then
					arg_109_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_15 + var_112_16 and arg_109_1.time_ < var_112_15 + var_112_16 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story then
				arg_109_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_112_18 = arg_109_1.actors_["1038ui_story"]
			local var_112_19 = 0

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 and arg_109_1.var_.characterEffect1038ui_story == nil then
				arg_109_1.var_.characterEffect1038ui_story = var_112_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_20 = 0.2

			if var_112_19 <= arg_109_1.time_ and arg_109_1.time_ < var_112_19 + var_112_20 then
				local var_112_21 = (arg_109_1.time_ - var_112_19) / var_112_20

				if arg_109_1.var_.characterEffect1038ui_story then
					local var_112_22 = Mathf.Lerp(0, 0.5, var_112_21)

					arg_109_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1038ui_story.fillRatio = var_112_22
				end
			end

			if arg_109_1.time_ >= var_112_19 + var_112_20 and arg_109_1.time_ < var_112_19 + var_112_20 + arg_112_0 and arg_109_1.var_.characterEffect1038ui_story then
				local var_112_23 = 0.5

				arg_109_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1038ui_story.fillRatio = var_112_23
			end

			local var_112_24 = 0

			if var_112_24 < arg_109_1.time_ and arg_109_1.time_ <= var_112_24 + arg_112_0 then
				arg_109_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_112_25 = 0

			if var_112_25 < arg_109_1.time_ and arg_109_1.time_ <= var_112_25 + arg_112_0 then
				arg_109_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_112_26 = 0
			local var_112_27 = 0.2

			if var_112_26 < arg_109_1.time_ and arg_109_1.time_ <= var_112_26 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_28 = arg_109_1:FormatText(StoryNameCfg[6].name)

				arg_109_1.leftNameTxt_.text = var_112_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_29 = arg_109_1:GetWordFromCfg(109081026)
				local var_112_30 = arg_109_1:FormatText(var_112_29.content)

				arg_109_1.text_.text = var_112_30

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_31 = 8
				local var_112_32 = utf8.len(var_112_30)
				local var_112_33 = var_112_31 <= 0 and var_112_27 or var_112_27 * (var_112_32 / var_112_31)

				if var_112_33 > 0 and var_112_27 < var_112_33 then
					arg_109_1.talkMaxDuration = var_112_33

					if var_112_33 + var_112_26 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_33 + var_112_26
					end
				end

				arg_109_1.text_.text = var_112_30
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081026", "story_v_out_109081.awb") ~= 0 then
					local var_112_34 = manager.audio:GetVoiceLength("story_v_out_109081", "109081026", "story_v_out_109081.awb") / 1000

					if var_112_34 + var_112_26 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_34 + var_112_26
					end

					if var_112_29.prefab_name ~= "" and arg_109_1.actors_[var_112_29.prefab_name] ~= nil then
						local var_112_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_29.prefab_name].transform, "story_v_out_109081", "109081026", "story_v_out_109081.awb")

						arg_109_1:RecordAudio("109081026", var_112_35)
						arg_109_1:RecordAudio("109081026", var_112_35)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_109081", "109081026", "story_v_out_109081.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_109081", "109081026", "story_v_out_109081.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_36 = math.max(var_112_27, arg_109_1.talkMaxDuration)

			if var_112_26 <= arg_109_1.time_ and arg_109_1.time_ < var_112_26 + var_112_36 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_26) / var_112_36

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_26 + var_112_36 and arg_109_1.time_ < var_112_26 + var_112_36 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play109081027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 109081027
		arg_113_1.duration_ = 8.1

		local var_113_0 = {
			ja = 7.8,
			ko = 7.933,
			zh = 7.966,
			en = 8.1
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
				arg_113_0:Play109081028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_116_1 = arg_113_1.actors_["4014_tpose"]
			local var_116_2 = 0

			if var_116_2 < arg_113_1.time_ and arg_113_1.time_ <= var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect4014_tpose == nil then
				arg_113_1.var_.characterEffect4014_tpose = var_116_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_3 = 0.2

			if var_116_2 <= arg_113_1.time_ and arg_113_1.time_ < var_116_2 + var_116_3 then
				local var_116_4 = (arg_113_1.time_ - var_116_2) / var_116_3

				if arg_113_1.var_.characterEffect4014_tpose then
					arg_113_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_2 + var_116_3 and arg_113_1.time_ < var_116_2 + var_116_3 + arg_116_0 and arg_113_1.var_.characterEffect4014_tpose then
				arg_113_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_116_5 = arg_113_1.actors_["1038ui_story"].transform
			local var_116_6 = 0

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.var_.moveOldPos1038ui_story = var_116_5.localPosition
			end

			local var_116_7 = 0.001

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_7 then
				local var_116_8 = (arg_113_1.time_ - var_116_6) / var_116_7
				local var_116_9 = Vector3.New(0, 100, 0)

				var_116_5.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1038ui_story, var_116_9, var_116_8)

				local var_116_10 = manager.ui.mainCamera.transform.position - var_116_5.position

				var_116_5.forward = Vector3.New(var_116_10.x, var_116_10.y, var_116_10.z)

				local var_116_11 = var_116_5.localEulerAngles

				var_116_11.z = 0
				var_116_11.x = 0
				var_116_5.localEulerAngles = var_116_11
			end

			if arg_113_1.time_ >= var_116_6 + var_116_7 and arg_113_1.time_ < var_116_6 + var_116_7 + arg_116_0 then
				var_116_5.localPosition = Vector3.New(0, 100, 0)

				local var_116_12 = manager.ui.mainCamera.transform.position - var_116_5.position

				var_116_5.forward = Vector3.New(var_116_12.x, var_116_12.y, var_116_12.z)

				local var_116_13 = var_116_5.localEulerAngles

				var_116_13.z = 0
				var_116_13.x = 0
				var_116_5.localEulerAngles = var_116_13
			end

			local var_116_14 = arg_113_1.actors_["1084ui_story"].transform
			local var_116_15 = 0

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 then
				arg_113_1.var_.moveOldPos1084ui_story = var_116_14.localPosition
			end

			local var_116_16 = 0.001

			if var_116_15 <= arg_113_1.time_ and arg_113_1.time_ < var_116_15 + var_116_16 then
				local var_116_17 = (arg_113_1.time_ - var_116_15) / var_116_16
				local var_116_18 = Vector3.New(0, 100, 0)

				var_116_14.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1084ui_story, var_116_18, var_116_17)

				local var_116_19 = manager.ui.mainCamera.transform.position - var_116_14.position

				var_116_14.forward = Vector3.New(var_116_19.x, var_116_19.y, var_116_19.z)

				local var_116_20 = var_116_14.localEulerAngles

				var_116_20.z = 0
				var_116_20.x = 0
				var_116_14.localEulerAngles = var_116_20
			end

			if arg_113_1.time_ >= var_116_15 + var_116_16 and arg_113_1.time_ < var_116_15 + var_116_16 + arg_116_0 then
				var_116_14.localPosition = Vector3.New(0, 100, 0)

				local var_116_21 = manager.ui.mainCamera.transform.position - var_116_14.position

				var_116_14.forward = Vector3.New(var_116_21.x, var_116_21.y, var_116_21.z)

				local var_116_22 = var_116_14.localEulerAngles

				var_116_22.z = 0
				var_116_22.x = 0
				var_116_14.localEulerAngles = var_116_22
			end

			local var_116_23 = arg_113_1.actors_["4014_tpose"].transform
			local var_116_24 = 0

			if var_116_24 < arg_113_1.time_ and arg_113_1.time_ <= var_116_24 + arg_116_0 then
				arg_113_1.var_.moveOldPos4014_tpose = var_116_23.localPosition
			end

			local var_116_25 = 0.001

			if var_116_24 <= arg_113_1.time_ and arg_113_1.time_ < var_116_24 + var_116_25 then
				local var_116_26 = (arg_113_1.time_ - var_116_24) / var_116_25
				local var_116_27 = Vector3.New(0, -1.95, -4.2)

				var_116_23.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos4014_tpose, var_116_27, var_116_26)

				local var_116_28 = manager.ui.mainCamera.transform.position - var_116_23.position

				var_116_23.forward = Vector3.New(var_116_28.x, var_116_28.y, var_116_28.z)

				local var_116_29 = var_116_23.localEulerAngles

				var_116_29.z = 0
				var_116_29.x = 0
				var_116_23.localEulerAngles = var_116_29
			end

			if arg_113_1.time_ >= var_116_24 + var_116_25 and arg_113_1.time_ < var_116_24 + var_116_25 + arg_116_0 then
				var_116_23.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_116_30 = manager.ui.mainCamera.transform.position - var_116_23.position

				var_116_23.forward = Vector3.New(var_116_30.x, var_116_30.y, var_116_30.z)

				local var_116_31 = var_116_23.localEulerAngles

				var_116_31.z = 0
				var_116_31.x = 0
				var_116_23.localEulerAngles = var_116_31
			end

			local var_116_32 = 0
			local var_116_33 = 0.7

			if var_116_32 < arg_113_1.time_ and arg_113_1.time_ <= var_116_32 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_34 = arg_113_1:FormatText(StoryNameCfg[87].name)

				arg_113_1.leftNameTxt_.text = var_116_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_35 = arg_113_1:GetWordFromCfg(109081027)
				local var_116_36 = arg_113_1:FormatText(var_116_35.content)

				arg_113_1.text_.text = var_116_36

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_37 = 28
				local var_116_38 = utf8.len(var_116_36)
				local var_116_39 = var_116_37 <= 0 and var_116_33 or var_116_33 * (var_116_38 / var_116_37)

				if var_116_39 > 0 and var_116_33 < var_116_39 then
					arg_113_1.talkMaxDuration = var_116_39

					if var_116_39 + var_116_32 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_39 + var_116_32
					end
				end

				arg_113_1.text_.text = var_116_36
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081027", "story_v_out_109081.awb") ~= 0 then
					local var_116_40 = manager.audio:GetVoiceLength("story_v_out_109081", "109081027", "story_v_out_109081.awb") / 1000

					if var_116_40 + var_116_32 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_40 + var_116_32
					end

					if var_116_35.prefab_name ~= "" and arg_113_1.actors_[var_116_35.prefab_name] ~= nil then
						local var_116_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_35.prefab_name].transform, "story_v_out_109081", "109081027", "story_v_out_109081.awb")

						arg_113_1:RecordAudio("109081027", var_116_41)
						arg_113_1:RecordAudio("109081027", var_116_41)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_109081", "109081027", "story_v_out_109081.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_109081", "109081027", "story_v_out_109081.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_42 = math.max(var_116_33, arg_113_1.talkMaxDuration)

			if var_116_32 <= arg_113_1.time_ and arg_113_1.time_ < var_116_32 + var_116_42 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_32) / var_116_42

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_32 + var_116_42 and arg_113_1.time_ < var_116_32 + var_116_42 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play109081028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 109081028
		arg_117_1.duration_ = 8.133

		local var_117_0 = {
			ja = 3.333,
			ko = 5.7,
			zh = 7.233,
			en = 8.133
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
				arg_117_0:Play109081029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["4014_tpose"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos4014_tpose = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, 100, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos4014_tpose, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, 100, 0)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1099ui_story"].transform
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1.var_.moveOldPos1099ui_story = var_120_9.localPosition
			end

			local var_120_11 = 0.001

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11
				local var_120_13 = Vector3.New(-0.7, -1.08, -5.9)

				var_120_9.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1099ui_story, var_120_13, var_120_12)

				local var_120_14 = manager.ui.mainCamera.transform.position - var_120_9.position

				var_120_9.forward = Vector3.New(var_120_14.x, var_120_14.y, var_120_14.z)

				local var_120_15 = var_120_9.localEulerAngles

				var_120_15.z = 0
				var_120_15.x = 0
				var_120_9.localEulerAngles = var_120_15
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 then
				var_120_9.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_120_16 = manager.ui.mainCamera.transform.position - var_120_9.position

				var_120_9.forward = Vector3.New(var_120_16.x, var_120_16.y, var_120_16.z)

				local var_120_17 = var_120_9.localEulerAngles

				var_120_17.z = 0
				var_120_17.x = 0
				var_120_9.localEulerAngles = var_120_17
			end

			local var_120_18 = arg_117_1.actors_["1099ui_story"]
			local var_120_19 = 0

			if var_120_19 < arg_117_1.time_ and arg_117_1.time_ <= var_120_19 + arg_120_0 and arg_117_1.var_.characterEffect1099ui_story == nil then
				arg_117_1.var_.characterEffect1099ui_story = var_120_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_20 = 0.2

			if var_120_19 <= arg_117_1.time_ and arg_117_1.time_ < var_120_19 + var_120_20 then
				local var_120_21 = (arg_117_1.time_ - var_120_19) / var_120_20

				if arg_117_1.var_.characterEffect1099ui_story then
					arg_117_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_19 + var_120_20 and arg_117_1.time_ < var_120_19 + var_120_20 + arg_120_0 and arg_117_1.var_.characterEffect1099ui_story then
				arg_117_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_120_22 = 0

			if var_120_22 < arg_117_1.time_ and arg_117_1.time_ <= var_120_22 + arg_120_0 then
				arg_117_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action5_1")
			end

			local var_120_23 = 0

			if var_120_23 < arg_117_1.time_ and arg_117_1.time_ <= var_120_23 + arg_120_0 then
				arg_117_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_120_24 = 0
			local var_120_25 = 0.95

			if var_120_24 < arg_117_1.time_ and arg_117_1.time_ <= var_120_24 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_26 = arg_117_1:FormatText(StoryNameCfg[84].name)

				arg_117_1.leftNameTxt_.text = var_120_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_27 = arg_117_1:GetWordFromCfg(109081028)
				local var_120_28 = arg_117_1:FormatText(var_120_27.content)

				arg_117_1.text_.text = var_120_28

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_29 = 38
				local var_120_30 = utf8.len(var_120_28)
				local var_120_31 = var_120_29 <= 0 and var_120_25 or var_120_25 * (var_120_30 / var_120_29)

				if var_120_31 > 0 and var_120_25 < var_120_31 then
					arg_117_1.talkMaxDuration = var_120_31

					if var_120_31 + var_120_24 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_31 + var_120_24
					end
				end

				arg_117_1.text_.text = var_120_28
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081028", "story_v_out_109081.awb") ~= 0 then
					local var_120_32 = manager.audio:GetVoiceLength("story_v_out_109081", "109081028", "story_v_out_109081.awb") / 1000

					if var_120_32 + var_120_24 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_32 + var_120_24
					end

					if var_120_27.prefab_name ~= "" and arg_117_1.actors_[var_120_27.prefab_name] ~= nil then
						local var_120_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_27.prefab_name].transform, "story_v_out_109081", "109081028", "story_v_out_109081.awb")

						arg_117_1:RecordAudio("109081028", var_120_33)
						arg_117_1:RecordAudio("109081028", var_120_33)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_109081", "109081028", "story_v_out_109081.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_109081", "109081028", "story_v_out_109081.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_34 = math.max(var_120_25, arg_117_1.talkMaxDuration)

			if var_120_24 <= arg_117_1.time_ and arg_117_1.time_ < var_120_24 + var_120_34 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_24) / var_120_34

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_24 + var_120_34 and arg_117_1.time_ < var_120_24 + var_120_34 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play109081029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 109081029
		arg_121_1.duration_ = 3.533

		local var_121_0 = {
			ja = 3.533,
			ko = 3.4,
			zh = 3.333,
			en = 2.8
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
				arg_121_0:Play109081030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_124_1 = 0
			local var_124_2 = 0.45

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_3 = arg_121_1:FormatText(StoryNameCfg[84].name)

				arg_121_1.leftNameTxt_.text = var_124_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_4 = arg_121_1:GetWordFromCfg(109081029)
				local var_124_5 = arg_121_1:FormatText(var_124_4.content)

				arg_121_1.text_.text = var_124_5

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_6 = 18
				local var_124_7 = utf8.len(var_124_5)
				local var_124_8 = var_124_6 <= 0 and var_124_2 or var_124_2 * (var_124_7 / var_124_6)

				if var_124_8 > 0 and var_124_2 < var_124_8 then
					arg_121_1.talkMaxDuration = var_124_8

					if var_124_8 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_1
					end
				end

				arg_121_1.text_.text = var_124_5
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081029", "story_v_out_109081.awb") ~= 0 then
					local var_124_9 = manager.audio:GetVoiceLength("story_v_out_109081", "109081029", "story_v_out_109081.awb") / 1000

					if var_124_9 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_9 + var_124_1
					end

					if var_124_4.prefab_name ~= "" and arg_121_1.actors_[var_124_4.prefab_name] ~= nil then
						local var_124_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_4.prefab_name].transform, "story_v_out_109081", "109081029", "story_v_out_109081.awb")

						arg_121_1:RecordAudio("109081029", var_124_10)
						arg_121_1:RecordAudio("109081029", var_124_10)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_109081", "109081029", "story_v_out_109081.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_109081", "109081029", "story_v_out_109081.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_11 = math.max(var_124_2, arg_121_1.talkMaxDuration)

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_11 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_1) / var_124_11

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_1 + var_124_11 and arg_121_1.time_ < var_124_1 + var_124_11 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play109081030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 109081030
		arg_125_1.duration_ = 2.233

		local var_125_0 = {
			ja = 1.999999999999,
			ko = 2.066,
			zh = 2.033,
			en = 2.233
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
				arg_125_0:Play109081031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1050ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1050ui_story = var_128_0.localPosition

				local var_128_2 = "1050ui_story"

				arg_125_1:ShowWeapon(arg_125_1.var_[var_128_2 .. "Animator"].transform, true)
			end

			local var_128_3 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_3 then
				local var_128_4 = (arg_125_1.time_ - var_128_1) / var_128_3
				local var_128_5 = Vector3.New(0.7, -1, -6.1)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1050ui_story, var_128_5, var_128_4)

				local var_128_6 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_6.x, var_128_6.y, var_128_6.z)

				local var_128_7 = var_128_0.localEulerAngles

				var_128_7.z = 0
				var_128_7.x = 0
				var_128_0.localEulerAngles = var_128_7
			end

			if arg_125_1.time_ >= var_128_1 + var_128_3 and arg_125_1.time_ < var_128_1 + var_128_3 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0.7, -1, -6.1)

				local var_128_8 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_8.x, var_128_8.y, var_128_8.z)

				local var_128_9 = var_128_0.localEulerAngles

				var_128_9.z = 0
				var_128_9.x = 0
				var_128_0.localEulerAngles = var_128_9
			end

			local var_128_10 = arg_125_1.actors_["1099ui_story"]
			local var_128_11 = 0

			if var_128_11 < arg_125_1.time_ and arg_125_1.time_ <= var_128_11 + arg_128_0 and arg_125_1.var_.characterEffect1099ui_story == nil then
				arg_125_1.var_.characterEffect1099ui_story = var_128_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_12 = 0.2

			if var_128_11 <= arg_125_1.time_ and arg_125_1.time_ < var_128_11 + var_128_12 then
				local var_128_13 = (arg_125_1.time_ - var_128_11) / var_128_12

				if arg_125_1.var_.characterEffect1099ui_story then
					local var_128_14 = Mathf.Lerp(0, 0.5, var_128_13)

					arg_125_1.var_.characterEffect1099ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1099ui_story.fillRatio = var_128_14
				end
			end

			if arg_125_1.time_ >= var_128_11 + var_128_12 and arg_125_1.time_ < var_128_11 + var_128_12 + arg_128_0 and arg_125_1.var_.characterEffect1099ui_story then
				local var_128_15 = 0.5

				arg_125_1.var_.characterEffect1099ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1099ui_story.fillRatio = var_128_15
			end

			local var_128_16 = arg_125_1.actors_["1050ui_story"]
			local var_128_17 = 0

			if var_128_17 < arg_125_1.time_ and arg_125_1.time_ <= var_128_17 + arg_128_0 and arg_125_1.var_.characterEffect1050ui_story == nil then
				arg_125_1.var_.characterEffect1050ui_story = var_128_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_18 = 0.2

			if var_128_17 <= arg_125_1.time_ and arg_125_1.time_ < var_128_17 + var_128_18 then
				local var_128_19 = (arg_125_1.time_ - var_128_17) / var_128_18

				if arg_125_1.var_.characterEffect1050ui_story then
					arg_125_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_17 + var_128_18 and arg_125_1.time_ < var_128_17 + var_128_18 + arg_128_0 and arg_125_1.var_.characterEffect1050ui_story then
				arg_125_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_128_20 = 0

			if var_128_20 < arg_125_1.time_ and arg_125_1.time_ <= var_128_20 + arg_128_0 then
				arg_125_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action6_1")
			end

			local var_128_21 = 5.89805981832114e-17

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 then
				arg_125_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_128_22 = 0
			local var_128_23 = 0.25

			if var_128_22 < arg_125_1.time_ and arg_125_1.time_ <= var_128_22 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_24 = arg_125_1:FormatText(StoryNameCfg[74].name)

				arg_125_1.leftNameTxt_.text = var_128_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_25 = arg_125_1:GetWordFromCfg(109081030)
				local var_128_26 = arg_125_1:FormatText(var_128_25.content)

				arg_125_1.text_.text = var_128_26

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_27 = 10
				local var_128_28 = utf8.len(var_128_26)
				local var_128_29 = var_128_27 <= 0 and var_128_23 or var_128_23 * (var_128_28 / var_128_27)

				if var_128_29 > 0 and var_128_23 < var_128_29 then
					arg_125_1.talkMaxDuration = var_128_29

					if var_128_29 + var_128_22 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_29 + var_128_22
					end
				end

				arg_125_1.text_.text = var_128_26
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081030", "story_v_out_109081.awb") ~= 0 then
					local var_128_30 = manager.audio:GetVoiceLength("story_v_out_109081", "109081030", "story_v_out_109081.awb") / 1000

					if var_128_30 + var_128_22 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_30 + var_128_22
					end

					if var_128_25.prefab_name ~= "" and arg_125_1.actors_[var_128_25.prefab_name] ~= nil then
						local var_128_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_25.prefab_name].transform, "story_v_out_109081", "109081030", "story_v_out_109081.awb")

						arg_125_1:RecordAudio("109081030", var_128_31)
						arg_125_1:RecordAudio("109081030", var_128_31)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_109081", "109081030", "story_v_out_109081.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_109081", "109081030", "story_v_out_109081.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_32 = math.max(var_128_23, arg_125_1.talkMaxDuration)

			if var_128_22 <= arg_125_1.time_ and arg_125_1.time_ < var_128_22 + var_128_32 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_22) / var_128_32

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_22 + var_128_32 and arg_125_1.time_ < var_128_22 + var_128_32 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play109081031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 109081031
		arg_129_1.duration_ = 3.533

		local var_129_0 = {
			ja = 2.9,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 3.533
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
				arg_129_0:Play109081032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1099ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1099ui_story == nil then
				arg_129_1.var_.characterEffect1099ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.2

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1099ui_story then
					arg_129_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1099ui_story then
				arg_129_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_132_4 = arg_129_1.actors_["1050ui_story"]
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 and arg_129_1.var_.characterEffect1050ui_story == nil then
				arg_129_1.var_.characterEffect1050ui_story = var_132_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_6 = 0.2

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6

				if arg_129_1.var_.characterEffect1050ui_story then
					local var_132_8 = Mathf.Lerp(0, 0.5, var_132_7)

					arg_129_1.var_.characterEffect1050ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1050ui_story.fillRatio = var_132_8
				end
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 and arg_129_1.var_.characterEffect1050ui_story then
				local var_132_9 = 0.5

				arg_129_1.var_.characterEffect1050ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1050ui_story.fillRatio = var_132_9
			end

			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_132_11 = 0
			local var_132_12 = 0.25

			if var_132_11 < arg_129_1.time_ and arg_129_1.time_ <= var_132_11 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_13 = arg_129_1:FormatText(StoryNameCfg[84].name)

				arg_129_1.leftNameTxt_.text = var_132_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_14 = arg_129_1:GetWordFromCfg(109081031)
				local var_132_15 = arg_129_1:FormatText(var_132_14.content)

				arg_129_1.text_.text = var_132_15

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_16 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081031", "story_v_out_109081.awb") ~= 0 then
					local var_132_19 = manager.audio:GetVoiceLength("story_v_out_109081", "109081031", "story_v_out_109081.awb") / 1000

					if var_132_19 + var_132_11 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_19 + var_132_11
					end

					if var_132_14.prefab_name ~= "" and arg_129_1.actors_[var_132_14.prefab_name] ~= nil then
						local var_132_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_14.prefab_name].transform, "story_v_out_109081", "109081031", "story_v_out_109081.awb")

						arg_129_1:RecordAudio("109081031", var_132_20)
						arg_129_1:RecordAudio("109081031", var_132_20)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_109081", "109081031", "story_v_out_109081.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_109081", "109081031", "story_v_out_109081.awb")
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
	Play109081032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 109081032
		arg_133_1.duration_ = 8.733

		local var_133_0 = {
			ja = 8.733,
			ko = 5.733,
			zh = 4.833,
			en = 5.1
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
			arg_133_1.auto_ = false
		end

		function arg_133_1.playNext_(arg_135_0)
			arg_133_1.onStoryFinished_()
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1050ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1050ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, 100, 0)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1050ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, 100, 0)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1099ui_story"].transform
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.var_.moveOldPos1099ui_story = var_136_9.localPosition
			end

			local var_136_11 = 0.001

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11
				local var_136_13 = Vector3.New(0, 100, 0)

				var_136_9.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1099ui_story, var_136_13, var_136_12)

				local var_136_14 = manager.ui.mainCamera.transform.position - var_136_9.position

				var_136_9.forward = Vector3.New(var_136_14.x, var_136_14.y, var_136_14.z)

				local var_136_15 = var_136_9.localEulerAngles

				var_136_15.z = 0
				var_136_15.x = 0
				var_136_9.localEulerAngles = var_136_15
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 then
				var_136_9.localPosition = Vector3.New(0, 100, 0)

				local var_136_16 = manager.ui.mainCamera.transform.position - var_136_9.position

				var_136_9.forward = Vector3.New(var_136_16.x, var_136_16.y, var_136_16.z)

				local var_136_17 = var_136_9.localEulerAngles

				var_136_17.z = 0
				var_136_17.x = 0
				var_136_9.localEulerAngles = var_136_17
			end

			local var_136_18 = arg_133_1.actors_["4014_tpose"].transform
			local var_136_19 = 0

			if var_136_19 < arg_133_1.time_ and arg_133_1.time_ <= var_136_19 + arg_136_0 then
				arg_133_1.var_.moveOldPos4014_tpose = var_136_18.localPosition
			end

			local var_136_20 = 0.001

			if var_136_19 <= arg_133_1.time_ and arg_133_1.time_ < var_136_19 + var_136_20 then
				local var_136_21 = (arg_133_1.time_ - var_136_19) / var_136_20
				local var_136_22 = Vector3.New(0, -1.95, -4.2)

				var_136_18.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos4014_tpose, var_136_22, var_136_21)

				local var_136_23 = manager.ui.mainCamera.transform.position - var_136_18.position

				var_136_18.forward = Vector3.New(var_136_23.x, var_136_23.y, var_136_23.z)

				local var_136_24 = var_136_18.localEulerAngles

				var_136_24.z = 0
				var_136_24.x = 0
				var_136_18.localEulerAngles = var_136_24
			end

			if arg_133_1.time_ >= var_136_19 + var_136_20 and arg_133_1.time_ < var_136_19 + var_136_20 + arg_136_0 then
				var_136_18.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_136_25 = manager.ui.mainCamera.transform.position - var_136_18.position

				var_136_18.forward = Vector3.New(var_136_25.x, var_136_25.y, var_136_25.z)

				local var_136_26 = var_136_18.localEulerAngles

				var_136_26.z = 0
				var_136_26.x = 0
				var_136_18.localEulerAngles = var_136_26
			end

			local var_136_27 = arg_133_1.actors_["4014_tpose"]
			local var_136_28 = 0

			if var_136_28 < arg_133_1.time_ and arg_133_1.time_ <= var_136_28 + arg_136_0 and arg_133_1.var_.characterEffect4014_tpose == nil then
				arg_133_1.var_.characterEffect4014_tpose = var_136_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_29 = 0.2

			if var_136_28 <= arg_133_1.time_ and arg_133_1.time_ < var_136_28 + var_136_29 then
				local var_136_30 = (arg_133_1.time_ - var_136_28) / var_136_29

				if arg_133_1.var_.characterEffect4014_tpose then
					arg_133_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_28 + var_136_29 and arg_133_1.time_ < var_136_28 + var_136_29 + arg_136_0 and arg_133_1.var_.characterEffect4014_tpose then
				arg_133_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_136_31 = 0

			if var_136_31 < arg_133_1.time_ and arg_133_1.time_ <= var_136_31 + arg_136_0 then
				arg_133_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_136_32 = 0
			local var_136_33 = 0.4

			if var_136_32 < arg_133_1.time_ and arg_133_1.time_ <= var_136_32 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_34 = arg_133_1:FormatText(StoryNameCfg[87].name)

				arg_133_1.leftNameTxt_.text = var_136_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_35 = arg_133_1:GetWordFromCfg(109081032)
				local var_136_36 = arg_133_1:FormatText(var_136_35.content)

				arg_133_1.text_.text = var_136_36

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_37 = 16
				local var_136_38 = utf8.len(var_136_36)
				local var_136_39 = var_136_37 <= 0 and var_136_33 or var_136_33 * (var_136_38 / var_136_37)

				if var_136_39 > 0 and var_136_33 < var_136_39 then
					arg_133_1.talkMaxDuration = var_136_39

					if var_136_39 + var_136_32 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_39 + var_136_32
					end
				end

				arg_133_1.text_.text = var_136_36
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_109081", "109081032", "story_v_out_109081.awb") ~= 0 then
					local var_136_40 = manager.audio:GetVoiceLength("story_v_out_109081", "109081032", "story_v_out_109081.awb") / 1000

					if var_136_40 + var_136_32 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_40 + var_136_32
					end

					if var_136_35.prefab_name ~= "" and arg_133_1.actors_[var_136_35.prefab_name] ~= nil then
						local var_136_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_35.prefab_name].transform, "story_v_out_109081", "109081032", "story_v_out_109081.awb")

						arg_133_1:RecordAudio("109081032", var_136_41)
						arg_133_1:RecordAudio("109081032", var_136_41)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_109081", "109081032", "story_v_out_109081.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_109081", "109081032", "story_v_out_109081.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_42 = math.max(var_136_33, arg_133_1.talkMaxDuration)

			if var_136_32 <= arg_133_1.time_ and arg_133_1.time_ < var_136_32 + var_136_42 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_32) / var_136_42

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_32 + var_136_42 and arg_133_1.time_ < var_136_32 + var_136_42 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C07_1",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0905"
	},
	voices = {
		"story_v_out_109081.awb"
	}
}
