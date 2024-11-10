return {
	Play104121001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 104121001
		arg_1_1.duration_ = 4.53266666666667

		local var_1_0 = {
			ja = 4.53266666666667,
			ko = 4.06666666666667,
			zh = 3.29966666666667,
			en = 3.76666666666667
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
				arg_1_0:Play104121002(arg_1_1)
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

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_4_8 = "B04f"

			if arg_1_1.bgs_[var_4_8] == nil then
				local var_4_9 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_8)
				var_4_9.name = var_4_8
				var_4_9.transform.parent = arg_1_1.stage_.transform
				var_4_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_8] = var_4_9
			end

			local var_4_10 = arg_1_1.bgs_.B04f
			local var_4_11 = 0

			if var_4_11 < arg_1_1.time_ and arg_1_1.time_ <= var_4_11 + arg_4_0 then
				local var_4_12 = var_4_10:GetComponent("SpriteRenderer")

				if var_4_12 then
					var_4_12.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_13 = var_4_12.material
					local var_4_14 = var_4_13:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB04f = var_4_14.a
					arg_1_1.var_.alphaMatValueB04f = var_4_13
				end

				arg_1_1.var_.alphaOldValueB04f = 0
			end

			local var_4_15 = 1.5

			if var_4_11 <= arg_1_1.time_ and arg_1_1.time_ < var_4_11 + var_4_15 then
				local var_4_16 = (arg_1_1.time_ - var_4_11) / var_4_15
				local var_4_17 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB04f, 1, var_4_16)

				if arg_1_1.var_.alphaMatValueB04f then
					local var_4_18 = arg_1_1.var_.alphaMatValueB04f
					local var_4_19 = var_4_18:GetColor("_Color")

					var_4_19.a = var_4_17

					var_4_18:SetColor("_Color", var_4_19)
				end
			end

			if arg_1_1.time_ >= var_4_11 + var_4_15 and arg_1_1.time_ < var_4_11 + var_4_15 + arg_4_0 and arg_1_1.var_.alphaMatValueB04f then
				local var_4_20 = arg_1_1.var_.alphaMatValueB04f
				local var_4_21 = var_4_20:GetColor("_Color")

				var_4_21.a = 1

				var_4_20:SetColor("_Color", var_4_21)
			end

			local var_4_22 = 0

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_23 = manager.ui.mainCamera.transform.localPosition
				local var_4_24 = Vector3.New(0, 0, 10) + Vector3.New(var_4_23.x, var_4_23.y, 0)
				local var_4_25 = arg_1_1.bgs_.B04f

				var_4_25.transform.localPosition = var_4_24
				var_4_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_26 = var_4_25:GetComponent("SpriteRenderer")

				if var_4_26 and var_4_26.sprite then
					local var_4_27 = (var_4_25.transform.localPosition - var_4_23).z
					local var_4_28 = manager.ui.mainCameraCom_
					local var_4_29 = 2 * var_4_27 * Mathf.Tan(var_4_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_30 = var_4_29 * var_4_28.aspect
					local var_4_31 = var_4_26.sprite.bounds.size.x
					local var_4_32 = var_4_26.sprite.bounds.size.y
					local var_4_33 = var_4_30 / var_4_31
					local var_4_34 = var_4_29 / var_4_32
					local var_4_35 = var_4_34 < var_4_33 and var_4_33 or var_4_34

					var_4_25.transform.localScale = Vector3.New(var_4_35, var_4_35, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B04f" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_36 = 0

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_37 = 1.66666666666667

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_38 = "1084ui_story"

			if arg_1_1.actors_[var_4_38] == nil then
				local var_4_39 = Object.Instantiate(Asset.Load("Char/" .. var_4_38), arg_1_1.stage_.transform)

				var_4_39.name = var_4_38
				var_4_39.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_38] = var_4_39

				local var_4_40 = var_4_39:GetComponentInChildren(typeof(CharacterEffect))

				var_4_40.enabled = true

				local var_4_41 = GameObjectTools.GetOrAddComponent(var_4_39, typeof(DynamicBoneHelper))

				if var_4_41 then
					var_4_41:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_40.transform, false)

				arg_1_1.var_[var_4_38 .. "Animator"] = var_4_40.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_38 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_38 .. "LipSync"] = var_4_40.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_42 = 0

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_43 = 1.66666666666667
			local var_4_44 = 0.175

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_45 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_45:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_46 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_47 = arg_1_1:GetWordFromCfg(104121001)
				local var_4_48 = arg_1_1:FormatText(var_4_47.content)

				arg_1_1.text_.text = var_4_48

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_49 = 7
				local var_4_50 = utf8.len(var_4_48)
				local var_4_51 = var_4_49 <= 0 and var_4_44 or var_4_44 * (var_4_50 / var_4_49)

				if var_4_51 > 0 and var_4_44 < var_4_51 then
					arg_1_1.talkMaxDuration = var_4_51
					var_4_43 = var_4_43 + 0.3

					if var_4_51 + var_4_43 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_51 + var_4_43
					end
				end

				arg_1_1.text_.text = var_4_48
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121001", "story_v_out_104121.awb") ~= 0 then
					local var_4_52 = manager.audio:GetVoiceLength("story_v_out_104121", "104121001", "story_v_out_104121.awb") / 1000

					if var_4_52 + var_4_43 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_52 + var_4_43
					end

					if var_4_47.prefab_name ~= "" and arg_1_1.actors_[var_4_47.prefab_name] ~= nil then
						local var_4_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_47.prefab_name].transform, "story_v_out_104121", "104121001", "story_v_out_104121.awb")

						arg_1_1:RecordAudio("104121001", var_4_53)
						arg_1_1:RecordAudio("104121001", var_4_53)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_104121", "104121001", "story_v_out_104121.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_104121", "104121001", "story_v_out_104121.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_54 = var_4_43 + 0.3
			local var_4_55 = math.max(var_4_44, arg_1_1.talkMaxDuration)

			if var_4_54 <= arg_1_1.time_ and arg_1_1.time_ < var_4_54 + var_4_55 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_54) / var_4_55

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_54 + var_4_55 and arg_1_1.time_ < var_4_54 + var_4_55 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play104121002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 104121002
		arg_7_1.duration_ = 3.433

		local var_7_0 = {
			ja = 3.433,
			ko = 2.366,
			zh = 2.333,
			en = 1.666
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
				arg_7_0:Play104121003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1019ui_story"

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

			local var_10_4 = 0

			if var_10_4 < arg_7_1.time_ and arg_7_1.time_ <= var_10_4 + arg_10_0 then
				arg_7_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_10_5 = 0
			local var_10_6 = 0.2

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_7 = arg_7_1:FormatText(StoryNameCfg[13].name)

				arg_7_1.leftNameTxt_.text = var_10_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_8 = arg_7_1:GetWordFromCfg(104121002)
				local var_10_9 = arg_7_1:FormatText(var_10_8.content)

				arg_7_1.text_.text = var_10_9

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_10 = 8
				local var_10_11 = utf8.len(var_10_9)
				local var_10_12 = var_10_10 <= 0 and var_10_6 or var_10_6 * (var_10_11 / var_10_10)

				if var_10_12 > 0 and var_10_6 < var_10_12 then
					arg_7_1.talkMaxDuration = var_10_12

					if var_10_12 + var_10_5 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_12 + var_10_5
					end
				end

				arg_7_1.text_.text = var_10_9
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121002", "story_v_out_104121.awb") ~= 0 then
					local var_10_13 = manager.audio:GetVoiceLength("story_v_out_104121", "104121002", "story_v_out_104121.awb") / 1000

					if var_10_13 + var_10_5 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_5
					end

					if var_10_8.prefab_name ~= "" and arg_7_1.actors_[var_10_8.prefab_name] ~= nil then
						local var_10_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_8.prefab_name].transform, "story_v_out_104121", "104121002", "story_v_out_104121.awb")

						arg_7_1:RecordAudio("104121002", var_10_14)
						arg_7_1:RecordAudio("104121002", var_10_14)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_104121", "104121002", "story_v_out_104121.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_104121", "104121002", "story_v_out_104121.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_15 = math.max(var_10_6, arg_7_1.talkMaxDuration)

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_15 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_5) / var_10_15

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_5 + var_10_15 and arg_7_1.time_ < var_10_5 + var_10_15 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play104121003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 104121003
		arg_11_1.duration_ = 3.366

		local var_11_0 = {
			ja = 3.366,
			ko = 2.866,
			zh = 2.5,
			en = 2.366
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
				arg_11_0:Play104121004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1011ui_story"

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

			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_14_5 = 0
			local var_14_6 = 0.175

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_7 = arg_11_1:FormatText(StoryNameCfg[37].name)

				arg_11_1.leftNameTxt_.text = var_14_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_8 = arg_11_1:GetWordFromCfg(104121003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 7
				local var_14_11 = utf8.len(var_14_9)
				local var_14_12 = var_14_10 <= 0 and var_14_6 or var_14_6 * (var_14_11 / var_14_10)

				if var_14_12 > 0 and var_14_6 < var_14_12 then
					arg_11_1.talkMaxDuration = var_14_12

					if var_14_12 + var_14_5 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_12 + var_14_5
					end
				end

				arg_11_1.text_.text = var_14_9
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121003", "story_v_out_104121.awb") ~= 0 then
					local var_14_13 = manager.audio:GetVoiceLength("story_v_out_104121", "104121003", "story_v_out_104121.awb") / 1000

					if var_14_13 + var_14_5 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_5
					end

					if var_14_8.prefab_name ~= "" and arg_11_1.actors_[var_14_8.prefab_name] ~= nil then
						local var_14_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_8.prefab_name].transform, "story_v_out_104121", "104121003", "story_v_out_104121.awb")

						arg_11_1:RecordAudio("104121003", var_14_14)
						arg_11_1:RecordAudio("104121003", var_14_14)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_104121", "104121003", "story_v_out_104121.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_104121", "104121003", "story_v_out_104121.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_15 = math.max(var_14_6, arg_11_1.talkMaxDuration)

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_15 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_5) / var_14_15

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_5 + var_14_15 and arg_11_1.time_ < var_14_5 + var_14_15 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play104121004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 104121004
		arg_15_1.duration_ = 5.5

		local var_15_0 = {
			ja = 4.233,
			ko = 3.3,
			zh = 3.666,
			en = 5.5
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
				arg_15_0:Play104121005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1036ui_story"

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

			local var_18_4 = arg_15_1.actors_["1036ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect1036ui_story == nil then
				arg_15_1.var_.characterEffect1036ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect1036ui_story then
					arg_15_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect1036ui_story then
				arg_15_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_18_8 = arg_15_1.actors_["1036ui_story"].transform
			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 then
				arg_15_1.var_.moveOldPos1036ui_story = var_18_8.localPosition
			end

			local var_18_10 = 0.001

			if var_18_9 <= arg_15_1.time_ and arg_15_1.time_ < var_18_9 + var_18_10 then
				local var_18_11 = (arg_15_1.time_ - var_18_9) / var_18_10
				local var_18_12 = Vector3.New(0, -1.09, -5.78)

				var_18_8.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1036ui_story, var_18_12, var_18_11)

				local var_18_13 = manager.ui.mainCamera.transform.position - var_18_8.position

				var_18_8.forward = Vector3.New(var_18_13.x, var_18_13.y, var_18_13.z)

				local var_18_14 = var_18_8.localEulerAngles

				var_18_14.z = 0
				var_18_14.x = 0
				var_18_8.localEulerAngles = var_18_14
			end

			if arg_15_1.time_ >= var_18_9 + var_18_10 and arg_15_1.time_ < var_18_9 + var_18_10 + arg_18_0 then
				var_18_8.localPosition = Vector3.New(0, -1.09, -5.78)

				local var_18_15 = manager.ui.mainCamera.transform.position - var_18_8.position

				var_18_8.forward = Vector3.New(var_18_15.x, var_18_15.y, var_18_15.z)

				local var_18_16 = var_18_8.localEulerAngles

				var_18_16.z = 0
				var_18_16.x = 0
				var_18_8.localEulerAngles = var_18_16
			end

			local var_18_17 = 0

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action6_1")
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_18_19 = 0
			local var_18_20 = 0.325

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_21 = arg_15_1:FormatText(StoryNameCfg[5].name)

				arg_15_1.leftNameTxt_.text = var_18_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_22 = arg_15_1:GetWordFromCfg(104121004)
				local var_18_23 = arg_15_1:FormatText(var_18_22.content)

				arg_15_1.text_.text = var_18_23

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_24 = 13
				local var_18_25 = utf8.len(var_18_23)
				local var_18_26 = var_18_24 <= 0 and var_18_20 or var_18_20 * (var_18_25 / var_18_24)

				if var_18_26 > 0 and var_18_20 < var_18_26 then
					arg_15_1.talkMaxDuration = var_18_26

					if var_18_26 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_26 + var_18_19
					end
				end

				arg_15_1.text_.text = var_18_23
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121004", "story_v_out_104121.awb") ~= 0 then
					local var_18_27 = manager.audio:GetVoiceLength("story_v_out_104121", "104121004", "story_v_out_104121.awb") / 1000

					if var_18_27 + var_18_19 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_19
					end

					if var_18_22.prefab_name ~= "" and arg_15_1.actors_[var_18_22.prefab_name] ~= nil then
						local var_18_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_22.prefab_name].transform, "story_v_out_104121", "104121004", "story_v_out_104121.awb")

						arg_15_1:RecordAudio("104121004", var_18_28)
						arg_15_1:RecordAudio("104121004", var_18_28)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_104121", "104121004", "story_v_out_104121.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_104121", "104121004", "story_v_out_104121.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_29 = math.max(var_18_20, arg_15_1.talkMaxDuration)

			if var_18_19 <= arg_15_1.time_ and arg_15_1.time_ < var_18_19 + var_18_29 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_19) / var_18_29

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_19 + var_18_29 and arg_15_1.time_ < var_18_19 + var_18_29 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play104121005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104121005
		arg_19_1.duration_ = 5.333

		local var_19_0 = {
			ja = 3.9,
			ko = 5.333,
			zh = 4.4,
			en = 4.833
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
				arg_19_0:Play104121006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_22_1 = 0
			local var_22_2 = 0.375

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_3 = arg_19_1:FormatText(StoryNameCfg[5].name)

				arg_19_1.leftNameTxt_.text = var_22_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_4 = arg_19_1:GetWordFromCfg(104121005)
				local var_22_5 = arg_19_1:FormatText(var_22_4.content)

				arg_19_1.text_.text = var_22_5

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_6 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121005", "story_v_out_104121.awb") ~= 0 then
					local var_22_9 = manager.audio:GetVoiceLength("story_v_out_104121", "104121005", "story_v_out_104121.awb") / 1000

					if var_22_9 + var_22_1 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_1
					end

					if var_22_4.prefab_name ~= "" and arg_19_1.actors_[var_22_4.prefab_name] ~= nil then
						local var_22_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_4.prefab_name].transform, "story_v_out_104121", "104121005", "story_v_out_104121.awb")

						arg_19_1:RecordAudio("104121005", var_22_10)
						arg_19_1:RecordAudio("104121005", var_22_10)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_104121", "104121005", "story_v_out_104121.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_104121", "104121005", "story_v_out_104121.awb")
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
	Play104121006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 104121006
		arg_23_1.duration_ = 8.633

		local var_23_0 = {
			ja = 6.266,
			ko = 8.633,
			zh = 5.4,
			en = 6.4
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
				arg_23_0:Play104121007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "10001_tpose"

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

			local var_26_4 = arg_23_1.actors_["10001_tpose"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect10001_tpose == nil then
				arg_23_1.var_.characterEffect10001_tpose = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect10001_tpose then
					arg_23_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect10001_tpose then
				arg_23_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_26_8 = arg_23_1.actors_["1036ui_story"]
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 and arg_23_1.var_.characterEffect1036ui_story == nil then
				arg_23_1.var_.characterEffect1036ui_story = var_26_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_10 = 0.1

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10

				if arg_23_1.var_.characterEffect1036ui_story then
					local var_26_12 = Mathf.Lerp(0, 0.5, var_26_11)

					arg_23_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1036ui_story.fillRatio = var_26_12
				end
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1036ui_story then
				local var_26_13 = 0.5

				arg_23_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1036ui_story.fillRatio = var_26_13
			end

			local var_26_14 = arg_23_1.actors_["1036ui_story"].transform
			local var_26_15 = 0

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.var_.moveOldPos1036ui_story = var_26_14.localPosition
			end

			local var_26_16 = 0.001

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_16 then
				local var_26_17 = (arg_23_1.time_ - var_26_15) / var_26_16
				local var_26_18 = Vector3.New(0, 100, 0)

				var_26_14.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1036ui_story, var_26_18, var_26_17)

				local var_26_19 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_19.x, var_26_19.y, var_26_19.z)

				local var_26_20 = var_26_14.localEulerAngles

				var_26_20.z = 0
				var_26_20.x = 0
				var_26_14.localEulerAngles = var_26_20
			end

			if arg_23_1.time_ >= var_26_15 + var_26_16 and arg_23_1.time_ < var_26_15 + var_26_16 + arg_26_0 then
				var_26_14.localPosition = Vector3.New(0, 100, 0)

				local var_26_21 = manager.ui.mainCamera.transform.position - var_26_14.position

				var_26_14.forward = Vector3.New(var_26_21.x, var_26_21.y, var_26_21.z)

				local var_26_22 = var_26_14.localEulerAngles

				var_26_22.z = 0
				var_26_22.x = 0
				var_26_14.localEulerAngles = var_26_22
			end

			local var_26_23 = arg_23_1.actors_["10001_tpose"].transform
			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.var_.moveOldPos10001_tpose = var_26_23.localPosition
			end

			local var_26_25 = 0.001

			if var_26_24 <= arg_23_1.time_ and arg_23_1.time_ < var_26_24 + var_26_25 then
				local var_26_26 = (arg_23_1.time_ - var_26_24) / var_26_25
				local var_26_27 = Vector3.New(0, -1.23, -5.8)

				var_26_23.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10001_tpose, var_26_27, var_26_26)

				local var_26_28 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_28.x, var_26_28.y, var_26_28.z)

				local var_26_29 = var_26_23.localEulerAngles

				var_26_29.z = 0
				var_26_29.x = 0
				var_26_23.localEulerAngles = var_26_29
			end

			if arg_23_1.time_ >= var_26_24 + var_26_25 and arg_23_1.time_ < var_26_24 + var_26_25 + arg_26_0 then
				var_26_23.localPosition = Vector3.New(0, -1.23, -5.8)

				local var_26_30 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_30.x, var_26_30.y, var_26_30.z)

				local var_26_31 = var_26_23.localEulerAngles

				var_26_31.z = 0
				var_26_31.x = 0
				var_26_23.localEulerAngles = var_26_31
			end

			local var_26_32 = 0

			if var_26_32 < arg_23_1.time_ and arg_23_1.time_ <= var_26_32 + arg_26_0 then
				arg_23_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action4_1")
			end

			local var_26_33 = 0

			if var_26_33 < arg_23_1.time_ and arg_23_1.time_ <= var_26_33 + arg_26_0 then
				arg_23_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_26_34 = 0
			local var_26_35 = 0.425

			if var_26_34 < arg_23_1.time_ and arg_23_1.time_ <= var_26_34 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_36 = arg_23_1:FormatText(StoryNameCfg[31].name)

				arg_23_1.leftNameTxt_.text = var_26_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_37 = arg_23_1:GetWordFromCfg(104121006)
				local var_26_38 = arg_23_1:FormatText(var_26_37.content)

				arg_23_1.text_.text = var_26_38

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_39 = 16
				local var_26_40 = utf8.len(var_26_38)
				local var_26_41 = var_26_39 <= 0 and var_26_35 or var_26_35 * (var_26_40 / var_26_39)

				if var_26_41 > 0 and var_26_35 < var_26_41 then
					arg_23_1.talkMaxDuration = var_26_41

					if var_26_41 + var_26_34 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_41 + var_26_34
					end
				end

				arg_23_1.text_.text = var_26_38
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121006", "story_v_out_104121.awb") ~= 0 then
					local var_26_42 = manager.audio:GetVoiceLength("story_v_out_104121", "104121006", "story_v_out_104121.awb") / 1000

					if var_26_42 + var_26_34 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_42 + var_26_34
					end

					if var_26_37.prefab_name ~= "" and arg_23_1.actors_[var_26_37.prefab_name] ~= nil then
						local var_26_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_37.prefab_name].transform, "story_v_out_104121", "104121006", "story_v_out_104121.awb")

						arg_23_1:RecordAudio("104121006", var_26_43)
						arg_23_1:RecordAudio("104121006", var_26_43)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_104121", "104121006", "story_v_out_104121.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_104121", "104121006", "story_v_out_104121.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_44 = math.max(var_26_35, arg_23_1.talkMaxDuration)

			if var_26_34 <= arg_23_1.time_ and arg_23_1.time_ < var_26_34 + var_26_44 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_34) / var_26_44

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_34 + var_26_44 and arg_23_1.time_ < var_26_34 + var_26_44 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play104121007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 104121007
		arg_27_1.duration_ = 6.133

		local var_27_0 = {
			ja = 3.266,
			ko = 3.833,
			zh = 4.266,
			en = 6.133
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
				arg_27_0:Play104121008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1019ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1019ui_story then
					arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				arg_27_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["10001_tpose"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect10001_tpose == nil then
				arg_27_1.var_.characterEffect10001_tpose = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect10001_tpose then
					local var_30_8 = Mathf.Lerp(0, 0.5, var_30_7)

					arg_27_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_27_1.var_.characterEffect10001_tpose.fillRatio = var_30_8
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect10001_tpose then
				local var_30_9 = 0.5

				arg_27_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_27_1.var_.characterEffect10001_tpose.fillRatio = var_30_9
			end

			local var_30_10 = arg_27_1.actors_["10001_tpose"].transform
			local var_30_11 = 0

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.var_.moveOldPos10001_tpose = var_30_10.localPosition
			end

			local var_30_12 = 0.001

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_12 then
				local var_30_13 = (arg_27_1.time_ - var_30_11) / var_30_12
				local var_30_14 = Vector3.New(0, 100, 0)

				var_30_10.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10001_tpose, var_30_14, var_30_13)

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

			local var_30_19 = arg_27_1.actors_["1019ui_story"].transform
			local var_30_20 = 0

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.var_.moveOldPos1019ui_story = var_30_19.localPosition
			end

			local var_30_21 = 0.001

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_21 then
				local var_30_22 = (arg_27_1.time_ - var_30_20) / var_30_21
				local var_30_23 = Vector3.New(0, -1.08, -5.9)

				var_30_19.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1019ui_story, var_30_23, var_30_22)

				local var_30_24 = manager.ui.mainCamera.transform.position - var_30_19.position

				var_30_19.forward = Vector3.New(var_30_24.x, var_30_24.y, var_30_24.z)

				local var_30_25 = var_30_19.localEulerAngles

				var_30_25.z = 0
				var_30_25.x = 0
				var_30_19.localEulerAngles = var_30_25
			end

			if arg_27_1.time_ >= var_30_20 + var_30_21 and arg_27_1.time_ < var_30_20 + var_30_21 + arg_30_0 then
				var_30_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_30_26 = manager.ui.mainCamera.transform.position - var_30_19.position

				var_30_19.forward = Vector3.New(var_30_26.x, var_30_26.y, var_30_26.z)

				local var_30_27 = var_30_19.localEulerAngles

				var_30_27.z = 0
				var_30_27.x = 0
				var_30_19.localEulerAngles = var_30_27
			end

			local var_30_28 = 0

			if var_30_28 < arg_27_1.time_ and arg_27_1.time_ <= var_30_28 + arg_30_0 then
				arg_27_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action4_1")
			end

			local var_30_29 = 0

			if var_30_29 < arg_27_1.time_ and arg_27_1.time_ <= var_30_29 + arg_30_0 then
				arg_27_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_30_30 = 0
			local var_30_31 = 0.4

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_32 = arg_27_1:FormatText(StoryNameCfg[13].name)

				arg_27_1.leftNameTxt_.text = var_30_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_33 = arg_27_1:GetWordFromCfg(104121007)
				local var_30_34 = arg_27_1:FormatText(var_30_33.content)

				arg_27_1.text_.text = var_30_34

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_35 = 16
				local var_30_36 = utf8.len(var_30_34)
				local var_30_37 = var_30_35 <= 0 and var_30_31 or var_30_31 * (var_30_36 / var_30_35)

				if var_30_37 > 0 and var_30_31 < var_30_37 then
					arg_27_1.talkMaxDuration = var_30_37

					if var_30_37 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_37 + var_30_30
					end
				end

				arg_27_1.text_.text = var_30_34
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121007", "story_v_out_104121.awb") ~= 0 then
					local var_30_38 = manager.audio:GetVoiceLength("story_v_out_104121", "104121007", "story_v_out_104121.awb") / 1000

					if var_30_38 + var_30_30 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_38 + var_30_30
					end

					if var_30_33.prefab_name ~= "" and arg_27_1.actors_[var_30_33.prefab_name] ~= nil then
						local var_30_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_33.prefab_name].transform, "story_v_out_104121", "104121007", "story_v_out_104121.awb")

						arg_27_1:RecordAudio("104121007", var_30_39)
						arg_27_1:RecordAudio("104121007", var_30_39)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_104121", "104121007", "story_v_out_104121.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_104121", "104121007", "story_v_out_104121.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_40 = math.max(var_30_31, arg_27_1.talkMaxDuration)

			if var_30_30 <= arg_27_1.time_ and arg_27_1.time_ < var_30_30 + var_30_40 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_30) / var_30_40

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_30 + var_30_40 and arg_27_1.time_ < var_30_30 + var_30_40 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play104121008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 104121008
		arg_31_1.duration_ = 11.6

		local var_31_0 = {
			ja = 11.6,
			ko = 9.3,
			zh = 6.7,
			en = 8.533
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
				arg_31_0:Play104121009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10001_tpose"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10001_tpose == nil then
				arg_31_1.var_.characterEffect10001_tpose = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10001_tpose then
					arg_31_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10001_tpose then
				arg_31_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1019ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story == nil then
				arg_31_1.var_.characterEffect1019ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1019ui_story then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect1019ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1019ui_story.fillRatio = var_34_9
			end

			local var_34_10 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_11 = 0.033

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_10.localPosition
			end

			local var_34_12 = 0.5

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_12 then
				local var_34_13 = (arg_31_1.time_ - var_34_11) / var_34_12
				local var_34_14 = Vector3.New(-0.7, -1.08, -5.9)

				var_34_10.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_14, var_34_13)

				local var_34_15 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_15.x, var_34_15.y, var_34_15.z)

				local var_34_16 = var_34_10.localEulerAngles

				var_34_16.z = 0
				var_34_16.x = 0
				var_34_10.localEulerAngles = var_34_16
			end

			if arg_31_1.time_ >= var_34_11 + var_34_12 and arg_31_1.time_ < var_34_11 + var_34_12 + arg_34_0 then
				var_34_10.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_34_17 = manager.ui.mainCamera.transform.position - var_34_10.position

				var_34_10.forward = Vector3.New(var_34_17.x, var_34_17.y, var_34_17.z)

				local var_34_18 = var_34_10.localEulerAngles

				var_34_18.z = 0
				var_34_18.x = 0
				var_34_10.localEulerAngles = var_34_18
			end

			local var_34_19 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_19.localPosition
			end

			local var_34_21 = 0.001

			if var_34_20 <= arg_31_1.time_ and arg_31_1.time_ < var_34_20 + var_34_21 then
				local var_34_22 = (arg_31_1.time_ - var_34_20) / var_34_21
				local var_34_23 = Vector3.New(0, -1.08, -5.9)

				var_34_19.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_23, var_34_22)

				local var_34_24 = manager.ui.mainCamera.transform.position - var_34_19.position

				var_34_19.forward = Vector3.New(var_34_24.x, var_34_24.y, var_34_24.z)

				local var_34_25 = var_34_19.localEulerAngles

				var_34_25.z = 0
				var_34_25.x = 0
				var_34_19.localEulerAngles = var_34_25
			end

			if arg_31_1.time_ >= var_34_20 + var_34_21 and arg_31_1.time_ < var_34_20 + var_34_21 + arg_34_0 then
				var_34_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_34_26 = manager.ui.mainCamera.transform.position - var_34_19.position

				var_34_19.forward = Vector3.New(var_34_26.x, var_34_26.y, var_34_26.z)

				local var_34_27 = var_34_19.localEulerAngles

				var_34_27.z = 0
				var_34_27.x = 0
				var_34_19.localEulerAngles = var_34_27
			end

			local var_34_28 = arg_31_1.actors_["10001_tpose"].transform
			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.var_.moveOldPos10001_tpose = var_34_28.localPosition
			end

			local var_34_30 = 0.001

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_30 then
				local var_34_31 = (arg_31_1.time_ - var_34_29) / var_34_30
				local var_34_32 = Vector3.New(0.7, -1.23, -5.8)

				var_34_28.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10001_tpose, var_34_32, var_34_31)

				local var_34_33 = manager.ui.mainCamera.transform.position - var_34_28.position

				var_34_28.forward = Vector3.New(var_34_33.x, var_34_33.y, var_34_33.z)

				local var_34_34 = var_34_28.localEulerAngles

				var_34_34.z = 0
				var_34_34.x = 0
				var_34_28.localEulerAngles = var_34_34
			end

			if arg_31_1.time_ >= var_34_29 + var_34_30 and arg_31_1.time_ < var_34_29 + var_34_30 + arg_34_0 then
				var_34_28.localPosition = Vector3.New(0.7, -1.23, -5.8)

				local var_34_35 = manager.ui.mainCamera.transform.position - var_34_28.position

				var_34_28.forward = Vector3.New(var_34_35.x, var_34_35.y, var_34_35.z)

				local var_34_36 = var_34_28.localEulerAngles

				var_34_36.z = 0
				var_34_36.x = 0
				var_34_28.localEulerAngles = var_34_36
			end

			local var_34_37 = 0

			if var_34_37 < arg_31_1.time_ and arg_31_1.time_ <= var_34_37 + arg_34_0 then
				arg_31_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action5_1")
			end

			local var_34_38 = 0

			if var_34_38 < arg_31_1.time_ and arg_31_1.time_ <= var_34_38 + arg_34_0 then
				arg_31_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_34_39 = 0
			local var_34_40 = 0.9

			if var_34_39 < arg_31_1.time_ and arg_31_1.time_ <= var_34_39 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_41 = arg_31_1:FormatText(StoryNameCfg[31].name)

				arg_31_1.leftNameTxt_.text = var_34_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_42 = arg_31_1:GetWordFromCfg(104121008)
				local var_34_43 = arg_31_1:FormatText(var_34_42.content)

				arg_31_1.text_.text = var_34_43

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_44 = 35
				local var_34_45 = utf8.len(var_34_43)
				local var_34_46 = var_34_44 <= 0 and var_34_40 or var_34_40 * (var_34_45 / var_34_44)

				if var_34_46 > 0 and var_34_40 < var_34_46 then
					arg_31_1.talkMaxDuration = var_34_46

					if var_34_46 + var_34_39 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_46 + var_34_39
					end
				end

				arg_31_1.text_.text = var_34_43
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121008", "story_v_out_104121.awb") ~= 0 then
					local var_34_47 = manager.audio:GetVoiceLength("story_v_out_104121", "104121008", "story_v_out_104121.awb") / 1000

					if var_34_47 + var_34_39 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_47 + var_34_39
					end

					if var_34_42.prefab_name ~= "" and arg_31_1.actors_[var_34_42.prefab_name] ~= nil then
						local var_34_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_42.prefab_name].transform, "story_v_out_104121", "104121008", "story_v_out_104121.awb")

						arg_31_1:RecordAudio("104121008", var_34_48)
						arg_31_1:RecordAudio("104121008", var_34_48)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_104121", "104121008", "story_v_out_104121.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_104121", "104121008", "story_v_out_104121.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_49 = math.max(var_34_40, arg_31_1.talkMaxDuration)

			if var_34_39 <= arg_31_1.time_ and arg_31_1.time_ < var_34_39 + var_34_49 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_39) / var_34_49

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_39 + var_34_49 and arg_31_1.time_ < var_34_39 + var_34_49 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play104121009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 104121009
		arg_35_1.duration_ = 2.7

		local var_35_0 = {
			ja = 1.999999999999,
			ko = 2.7,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_35_0:Play104121010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1036ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1036ui_story == nil then
				arg_35_1.var_.characterEffect1036ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.1

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1036ui_story then
					arg_35_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1036ui_story then
				arg_35_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["10001_tpose"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect10001_tpose == nil then
				arg_35_1.var_.characterEffect10001_tpose = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect10001_tpose then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_35_1.var_.characterEffect10001_tpose.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect10001_tpose then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_35_1.var_.characterEffect10001_tpose.fillRatio = var_38_9
			end

			local var_38_10 = arg_35_1.actors_["1019ui_story"].transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.moveOldPos1019ui_story = var_38_10.localPosition
			end

			local var_38_12 = 0.001

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12
				local var_38_14 = Vector3.New(0, 100, 0)

				var_38_10.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1019ui_story, var_38_14, var_38_13)

				local var_38_15 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_15.x, var_38_15.y, var_38_15.z)

				local var_38_16 = var_38_10.localEulerAngles

				var_38_16.z = 0
				var_38_16.x = 0
				var_38_10.localEulerAngles = var_38_16
			end

			if arg_35_1.time_ >= var_38_11 + var_38_12 and arg_35_1.time_ < var_38_11 + var_38_12 + arg_38_0 then
				var_38_10.localPosition = Vector3.New(0, 100, 0)

				local var_38_17 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_17.x, var_38_17.y, var_38_17.z)

				local var_38_18 = var_38_10.localEulerAngles

				var_38_18.z = 0
				var_38_18.x = 0
				var_38_10.localEulerAngles = var_38_18
			end

			local var_38_19 = arg_35_1.actors_["1036ui_story"].transform
			local var_38_20 = 0

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.var_.moveOldPos1036ui_story = var_38_19.localPosition
			end

			local var_38_21 = 0.001

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_21 then
				local var_38_22 = (arg_35_1.time_ - var_38_20) / var_38_21
				local var_38_23 = Vector3.New(-0.7, -1.09, -5.78)

				var_38_19.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1036ui_story, var_38_23, var_38_22)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_19.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_19.localEulerAngles = var_38_25
			end

			if arg_35_1.time_ >= var_38_20 + var_38_21 and arg_35_1.time_ < var_38_20 + var_38_21 + arg_38_0 then
				var_38_19.localPosition = Vector3.New(-0.7, -1.09, -5.78)

				local var_38_26 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_26.x, var_38_26.y, var_38_26.z)

				local var_38_27 = var_38_19.localEulerAngles

				var_38_27.z = 0
				var_38_27.x = 0
				var_38_19.localEulerAngles = var_38_27
			end

			local var_38_28 = 0

			if var_38_28 < arg_35_1.time_ and arg_35_1.time_ <= var_38_28 + arg_38_0 then
				arg_35_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 then
				arg_35_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_38_30 = 0
			local var_38_31 = 0.15

			if var_38_30 < arg_35_1.time_ and arg_35_1.time_ <= var_38_30 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_32 = arg_35_1:FormatText(StoryNameCfg[5].name)

				arg_35_1.leftNameTxt_.text = var_38_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_33 = arg_35_1:GetWordFromCfg(104121009)
				local var_38_34 = arg_35_1:FormatText(var_38_33.content)

				arg_35_1.text_.text = var_38_34

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_35 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121009", "story_v_out_104121.awb") ~= 0 then
					local var_38_38 = manager.audio:GetVoiceLength("story_v_out_104121", "104121009", "story_v_out_104121.awb") / 1000

					if var_38_38 + var_38_30 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_38 + var_38_30
					end

					if var_38_33.prefab_name ~= "" and arg_35_1.actors_[var_38_33.prefab_name] ~= nil then
						local var_38_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_33.prefab_name].transform, "story_v_out_104121", "104121009", "story_v_out_104121.awb")

						arg_35_1:RecordAudio("104121009", var_38_39)
						arg_35_1:RecordAudio("104121009", var_38_39)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_104121", "104121009", "story_v_out_104121.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_104121", "104121009", "story_v_out_104121.awb")
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
	Play104121010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 104121010
		arg_39_1.duration_ = 11.733

		local var_39_0 = {
			ja = 11.6,
			ko = 11.133,
			zh = 11.733,
			en = 11.466
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
				arg_39_0:Play104121011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10001_tpose"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10001_tpose == nil then
				arg_39_1.var_.characterEffect10001_tpose = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10001_tpose then
					arg_39_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10001_tpose then
				arg_39_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1036ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1036ui_story == nil then
				arg_39_1.var_.characterEffect1036ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1036ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1036ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1036ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1036ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001actionlink/10001action454")
			end

			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_42_12 = 0
			local var_42_13 = 1.525

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[31].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(104121010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 61
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

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121010", "story_v_out_104121.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_104121", "104121010", "story_v_out_104121.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_104121", "104121010", "story_v_out_104121.awb")

						arg_39_1:RecordAudio("104121010", var_42_21)
						arg_39_1:RecordAudio("104121010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_104121", "104121010", "story_v_out_104121.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_104121", "104121010", "story_v_out_104121.awb")
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
	Play104121011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 104121011
		arg_43_1.duration_ = 4.9

		local var_43_0 = {
			ja = 4.9,
			ko = 4,
			zh = 3.1,
			en = 2.966
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
				arg_43_0:Play104121012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"]
			local var_46_1 = 0

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

			local var_46_4 = arg_43_1.actors_["10001_tpose"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect10001_tpose == nil then
				arg_43_1.var_.characterEffect10001_tpose = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect10001_tpose then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_43_1.var_.characterEffect10001_tpose.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect10001_tpose then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_43_1.var_.characterEffect10001_tpose.fillRatio = var_46_9
			end

			local var_46_10 = arg_43_1.actors_["10001_tpose"].transform
			local var_46_11 = 0

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.var_.moveOldPos10001_tpose = var_46_10.localPosition
			end

			local var_46_12 = 0.001

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_11) / var_46_12
				local var_46_14 = Vector3.New(0, 100, 0)

				var_46_10.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10001_tpose, var_46_14, var_46_13)

				local var_46_15 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_15.x, var_46_15.y, var_46_15.z)

				local var_46_16 = var_46_10.localEulerAngles

				var_46_16.z = 0
				var_46_16.x = 0
				var_46_10.localEulerAngles = var_46_16
			end

			if arg_43_1.time_ >= var_46_11 + var_46_12 and arg_43_1.time_ < var_46_11 + var_46_12 + arg_46_0 then
				var_46_10.localPosition = Vector3.New(0, 100, 0)

				local var_46_17 = manager.ui.mainCamera.transform.position - var_46_10.position

				var_46_10.forward = Vector3.New(var_46_17.x, var_46_17.y, var_46_17.z)

				local var_46_18 = var_46_10.localEulerAngles

				var_46_18.z = 0
				var_46_18.x = 0
				var_46_10.localEulerAngles = var_46_18
			end

			local var_46_19 = arg_43_1.actors_["1036ui_story"].transform
			local var_46_20 = 0

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.var_.moveOldPos1036ui_story = var_46_19.localPosition
			end

			local var_46_21 = 0.001

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_21 then
				local var_46_22 = (arg_43_1.time_ - var_46_20) / var_46_21
				local var_46_23 = Vector3.New(0, 100, 0)

				var_46_19.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1036ui_story, var_46_23, var_46_22)

				local var_46_24 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_24.x, var_46_24.y, var_46_24.z)

				local var_46_25 = var_46_19.localEulerAngles

				var_46_25.z = 0
				var_46_25.x = 0
				var_46_19.localEulerAngles = var_46_25
			end

			if arg_43_1.time_ >= var_46_20 + var_46_21 and arg_43_1.time_ < var_46_20 + var_46_21 + arg_46_0 then
				var_46_19.localPosition = Vector3.New(0, 100, 0)

				local var_46_26 = manager.ui.mainCamera.transform.position - var_46_19.position

				var_46_19.forward = Vector3.New(var_46_26.x, var_46_26.y, var_46_26.z)

				local var_46_27 = var_46_19.localEulerAngles

				var_46_27.z = 0
				var_46_27.x = 0
				var_46_19.localEulerAngles = var_46_27
			end

			local var_46_28 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_28.localPosition
			end

			local var_46_30 = 0.001

			if var_46_29 <= arg_43_1.time_ and arg_43_1.time_ < var_46_29 + var_46_30 then
				local var_46_31 = (arg_43_1.time_ - var_46_29) / var_46_30
				local var_46_32 = Vector3.New(0, -0.97, -6)

				var_46_28.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_32, var_46_31)

				local var_46_33 = manager.ui.mainCamera.transform.position - var_46_28.position

				var_46_28.forward = Vector3.New(var_46_33.x, var_46_33.y, var_46_33.z)

				local var_46_34 = var_46_28.localEulerAngles

				var_46_34.z = 0
				var_46_34.x = 0
				var_46_28.localEulerAngles = var_46_34
			end

			if arg_43_1.time_ >= var_46_29 + var_46_30 and arg_43_1.time_ < var_46_29 + var_46_30 + arg_46_0 then
				var_46_28.localPosition = Vector3.New(0, -0.97, -6)

				local var_46_35 = manager.ui.mainCamera.transform.position - var_46_28.position

				var_46_28.forward = Vector3.New(var_46_35.x, var_46_35.y, var_46_35.z)

				local var_46_36 = var_46_28.localEulerAngles

				var_46_36.z = 0
				var_46_36.x = 0
				var_46_28.localEulerAngles = var_46_36
			end

			local var_46_37 = 0

			if var_46_37 < arg_43_1.time_ and arg_43_1.time_ <= var_46_37 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action9_1")
			end

			local var_46_38 = 0

			if var_46_38 < arg_43_1.time_ and arg_43_1.time_ <= var_46_38 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_46_39 = 0
			local var_46_40 = 0.45

			if var_46_39 < arg_43_1.time_ and arg_43_1.time_ <= var_46_39 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_41 = arg_43_1:FormatText(StoryNameCfg[6].name)

				arg_43_1.leftNameTxt_.text = var_46_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_42 = arg_43_1:GetWordFromCfg(104121011)
				local var_46_43 = arg_43_1:FormatText(var_46_42.content)

				arg_43_1.text_.text = var_46_43

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_44 = 18
				local var_46_45 = utf8.len(var_46_43)
				local var_46_46 = var_46_44 <= 0 and var_46_40 or var_46_40 * (var_46_45 / var_46_44)

				if var_46_46 > 0 and var_46_40 < var_46_46 then
					arg_43_1.talkMaxDuration = var_46_46

					if var_46_46 + var_46_39 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_46 + var_46_39
					end
				end

				arg_43_1.text_.text = var_46_43
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121011", "story_v_out_104121.awb") ~= 0 then
					local var_46_47 = manager.audio:GetVoiceLength("story_v_out_104121", "104121011", "story_v_out_104121.awb") / 1000

					if var_46_47 + var_46_39 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_47 + var_46_39
					end

					if var_46_42.prefab_name ~= "" and arg_43_1.actors_[var_46_42.prefab_name] ~= nil then
						local var_46_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_42.prefab_name].transform, "story_v_out_104121", "104121011", "story_v_out_104121.awb")

						arg_43_1:RecordAudio("104121011", var_46_48)
						arg_43_1:RecordAudio("104121011", var_46_48)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_104121", "104121011", "story_v_out_104121.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_104121", "104121011", "story_v_out_104121.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_49 = math.max(var_46_40, arg_43_1.talkMaxDuration)

			if var_46_39 <= arg_43_1.time_ and arg_43_1.time_ < var_46_39 + var_46_49 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_39) / var_46_49

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_39 + var_46_49 and arg_43_1.time_ < var_46_39 + var_46_49 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play104121012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 104121012
		arg_47_1.duration_ = 15.266

		local var_47_0 = {
			ja = 15.266,
			ko = 11.533,
			zh = 11.633,
			en = 15.1
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
				arg_47_0:Play104121013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10001_tpose"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10001_tpose == nil then
				arg_47_1.var_.characterEffect10001_tpose = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10001_tpose then
					arg_47_1.var_.characterEffect10001_tpose.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10001_tpose then
				arg_47_1.var_.characterEffect10001_tpose.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1084ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.1

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect1084ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_9
			end

			local var_50_10 = arg_47_1.actors_["1084ui_story"].transform
			local var_50_11 = 0

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1.var_.moveOldPos1084ui_story = var_50_10.localPosition
			end

			local var_50_12 = 0.001

			if var_50_11 <= arg_47_1.time_ and arg_47_1.time_ < var_50_11 + var_50_12 then
				local var_50_13 = (arg_47_1.time_ - var_50_11) / var_50_12
				local var_50_14 = Vector3.New(0, 100, 0)

				var_50_10.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1084ui_story, var_50_14, var_50_13)

				local var_50_15 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_15.x, var_50_15.y, var_50_15.z)

				local var_50_16 = var_50_10.localEulerAngles

				var_50_16.z = 0
				var_50_16.x = 0
				var_50_10.localEulerAngles = var_50_16
			end

			if arg_47_1.time_ >= var_50_11 + var_50_12 and arg_47_1.time_ < var_50_11 + var_50_12 + arg_50_0 then
				var_50_10.localPosition = Vector3.New(0, 100, 0)

				local var_50_17 = manager.ui.mainCamera.transform.position - var_50_10.position

				var_50_10.forward = Vector3.New(var_50_17.x, var_50_17.y, var_50_17.z)

				local var_50_18 = var_50_10.localEulerAngles

				var_50_18.z = 0
				var_50_18.x = 0
				var_50_10.localEulerAngles = var_50_18
			end

			local var_50_19 = arg_47_1.actors_["10001_tpose"].transform
			local var_50_20 = 0

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.var_.moveOldPos10001_tpose = var_50_19.localPosition
			end

			local var_50_21 = 0.001

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_21 then
				local var_50_22 = (arg_47_1.time_ - var_50_20) / var_50_21
				local var_50_23 = Vector3.New(-0.7, -1.23, -5.8)

				var_50_19.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10001_tpose, var_50_23, var_50_22)

				local var_50_24 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_24.x, var_50_24.y, var_50_24.z)

				local var_50_25 = var_50_19.localEulerAngles

				var_50_25.z = 0
				var_50_25.x = 0
				var_50_19.localEulerAngles = var_50_25
			end

			if arg_47_1.time_ >= var_50_20 + var_50_21 and arg_47_1.time_ < var_50_20 + var_50_21 + arg_50_0 then
				var_50_19.localPosition = Vector3.New(-0.7, -1.23, -5.8)

				local var_50_26 = manager.ui.mainCamera.transform.position - var_50_19.position

				var_50_19.forward = Vector3.New(var_50_26.x, var_50_26.y, var_50_26.z)

				local var_50_27 = var_50_19.localEulerAngles

				var_50_27.z = 0
				var_50_27.x = 0
				var_50_19.localEulerAngles = var_50_27
			end

			local var_50_28 = 0

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				arg_47_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/story10001/story10001action/10001action2_1")
			end

			local var_50_29 = 0

			if var_50_29 < arg_47_1.time_ and arg_47_1.time_ <= var_50_29 + arg_50_0 then
				arg_47_1:PlayTimeline("10001_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_50_30 = 0
			local var_50_31 = 1.525

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_32 = arg_47_1:FormatText(StoryNameCfg[31].name)

				arg_47_1.leftNameTxt_.text = var_50_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_33 = arg_47_1:GetWordFromCfg(104121012)
				local var_50_34 = arg_47_1:FormatText(var_50_33.content)

				arg_47_1.text_.text = var_50_34

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_35 = 61
				local var_50_36 = utf8.len(var_50_34)
				local var_50_37 = var_50_35 <= 0 and var_50_31 or var_50_31 * (var_50_36 / var_50_35)

				if var_50_37 > 0 and var_50_31 < var_50_37 then
					arg_47_1.talkMaxDuration = var_50_37

					if var_50_37 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_37 + var_50_30
					end
				end

				arg_47_1.text_.text = var_50_34
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121012", "story_v_out_104121.awb") ~= 0 then
					local var_50_38 = manager.audio:GetVoiceLength("story_v_out_104121", "104121012", "story_v_out_104121.awb") / 1000

					if var_50_38 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_38 + var_50_30
					end

					if var_50_33.prefab_name ~= "" and arg_47_1.actors_[var_50_33.prefab_name] ~= nil then
						local var_50_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_33.prefab_name].transform, "story_v_out_104121", "104121012", "story_v_out_104121.awb")

						arg_47_1:RecordAudio("104121012", var_50_39)
						arg_47_1:RecordAudio("104121012", var_50_39)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_104121", "104121012", "story_v_out_104121.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_104121", "104121012", "story_v_out_104121.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_40 = math.max(var_50_31, arg_47_1.talkMaxDuration)

			if var_50_30 <= arg_47_1.time_ and arg_47_1.time_ < var_50_30 + var_50_40 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_30) / var_50_40

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_30 + var_50_40 and arg_47_1.time_ < var_50_30 + var_50_40 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play104121013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 104121013
		arg_51_1.duration_ = 4.6

		local var_51_0 = {
			ja = 4.6,
			ko = 2.866,
			zh = 2.5,
			en = 3.433
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
				arg_51_0:Play104121014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1036ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1036ui_story == nil then
				arg_51_1.var_.characterEffect1036ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1036ui_story then
					arg_51_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1036ui_story then
				arg_51_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["10001_tpose"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect10001_tpose == nil then
				arg_51_1.var_.characterEffect10001_tpose = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect10001_tpose then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect10001_tpose.fillFlat = true
					arg_51_1.var_.characterEffect10001_tpose.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect10001_tpose then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect10001_tpose.fillFlat = true
				arg_51_1.var_.characterEffect10001_tpose.fillRatio = var_54_9
			end

			local var_54_10 = arg_51_1.actors_["1036ui_story"].transform
			local var_54_11 = 0

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.var_.moveOldPos1036ui_story = var_54_10.localPosition
			end

			local var_54_12 = 0.001

			if var_54_11 <= arg_51_1.time_ and arg_51_1.time_ < var_54_11 + var_54_12 then
				local var_54_13 = (arg_51_1.time_ - var_54_11) / var_54_12
				local var_54_14 = Vector3.New(0.7, -1.09, -5.78)

				var_54_10.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1036ui_story, var_54_14, var_54_13)

				local var_54_15 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_15.x, var_54_15.y, var_54_15.z)

				local var_54_16 = var_54_10.localEulerAngles

				var_54_16.z = 0
				var_54_16.x = 0
				var_54_10.localEulerAngles = var_54_16
			end

			if arg_51_1.time_ >= var_54_11 + var_54_12 and arg_51_1.time_ < var_54_11 + var_54_12 + arg_54_0 then
				var_54_10.localPosition = Vector3.New(0.7, -1.09, -5.78)

				local var_54_17 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_17.x, var_54_17.y, var_54_17.z)

				local var_54_18 = var_54_10.localEulerAngles

				var_54_18.z = 0
				var_54_18.x = 0
				var_54_10.localEulerAngles = var_54_18
			end

			local var_54_19 = 0

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action2_1")
			end

			local var_54_20 = 0

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_54_21 = 0
			local var_54_22 = 0.225

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_23 = arg_51_1:FormatText(StoryNameCfg[5].name)

				arg_51_1.leftNameTxt_.text = var_54_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_24 = arg_51_1:GetWordFromCfg(104121013)
				local var_54_25 = arg_51_1:FormatText(var_54_24.content)

				arg_51_1.text_.text = var_54_25

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_26 = 9
				local var_54_27 = utf8.len(var_54_25)
				local var_54_28 = var_54_26 <= 0 and var_54_22 or var_54_22 * (var_54_27 / var_54_26)

				if var_54_28 > 0 and var_54_22 < var_54_28 then
					arg_51_1.talkMaxDuration = var_54_28

					if var_54_28 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_21
					end
				end

				arg_51_1.text_.text = var_54_25
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121013", "story_v_out_104121.awb") ~= 0 then
					local var_54_29 = manager.audio:GetVoiceLength("story_v_out_104121", "104121013", "story_v_out_104121.awb") / 1000

					if var_54_29 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_29 + var_54_21
					end

					if var_54_24.prefab_name ~= "" and arg_51_1.actors_[var_54_24.prefab_name] ~= nil then
						local var_54_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_24.prefab_name].transform, "story_v_out_104121", "104121013", "story_v_out_104121.awb")

						arg_51_1:RecordAudio("104121013", var_54_30)
						arg_51_1:RecordAudio("104121013", var_54_30)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_104121", "104121013", "story_v_out_104121.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_104121", "104121013", "story_v_out_104121.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_31 = math.max(var_54_22, arg_51_1.talkMaxDuration)

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_31 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_21) / var_54_31

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_21 + var_54_31 and arg_51_1.time_ < var_54_21 + var_54_31 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play104121014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 104121014
		arg_55_1.duration_ = 6.233

		local var_55_0 = {
			ja = 5,
			ko = 3.433,
			zh = 6.233,
			en = 4.9
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
				arg_55_0:Play104121015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1036ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1036ui_story == nil then
				arg_55_1.var_.characterEffect1036ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1036ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1036ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1036ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1036ui_story.fillRatio = var_58_5
			end

			local var_58_6 = arg_55_1.actors_["1036ui_story"].transform
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 then
				arg_55_1.var_.moveOldPos1036ui_story = var_58_6.localPosition
			end

			local var_58_8 = 0.001

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8
				local var_58_10 = Vector3.New(0, 100, 0)

				var_58_6.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1036ui_story, var_58_10, var_58_9)

				local var_58_11 = manager.ui.mainCamera.transform.position - var_58_6.position

				var_58_6.forward = Vector3.New(var_58_11.x, var_58_11.y, var_58_11.z)

				local var_58_12 = var_58_6.localEulerAngles

				var_58_12.z = 0
				var_58_12.x = 0
				var_58_6.localEulerAngles = var_58_12
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 then
				var_58_6.localPosition = Vector3.New(0, 100, 0)

				local var_58_13 = manager.ui.mainCamera.transform.position - var_58_6.position

				var_58_6.forward = Vector3.New(var_58_13.x, var_58_13.y, var_58_13.z)

				local var_58_14 = var_58_6.localEulerAngles

				var_58_14.z = 0
				var_58_14.x = 0
				var_58_6.localEulerAngles = var_58_14
			end

			local var_58_15 = arg_55_1.actors_["10001_tpose"].transform
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.var_.moveOldPos10001_tpose = var_58_15.localPosition
			end

			local var_58_17 = 0.001

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Vector3.New(0, 100, 0)

				var_58_15.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10001_tpose, var_58_19, var_58_18)

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

			local var_58_24 = 0
			local var_58_25 = 0.575

			if var_58_24 < arg_55_1.time_ and arg_55_1.time_ <= var_58_24 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_26 = arg_55_1:FormatText(StoryNameCfg[49].name)

				arg_55_1.leftNameTxt_.text = var_58_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_27 = arg_55_1:GetWordFromCfg(104121014)
				local var_58_28 = arg_55_1:FormatText(var_58_27.content)

				arg_55_1.text_.text = var_58_28

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_29 = 23
				local var_58_30 = utf8.len(var_58_28)
				local var_58_31 = var_58_29 <= 0 and var_58_25 or var_58_25 * (var_58_30 / var_58_29)

				if var_58_31 > 0 and var_58_25 < var_58_31 then
					arg_55_1.talkMaxDuration = var_58_31

					if var_58_31 + var_58_24 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_31 + var_58_24
					end
				end

				arg_55_1.text_.text = var_58_28
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121014", "story_v_out_104121.awb") ~= 0 then
					local var_58_32 = manager.audio:GetVoiceLength("story_v_out_104121", "104121014", "story_v_out_104121.awb") / 1000

					if var_58_32 + var_58_24 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_32 + var_58_24
					end

					if var_58_27.prefab_name ~= "" and arg_55_1.actors_[var_58_27.prefab_name] ~= nil then
						local var_58_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_27.prefab_name].transform, "story_v_out_104121", "104121014", "story_v_out_104121.awb")

						arg_55_1:RecordAudio("104121014", var_58_33)
						arg_55_1:RecordAudio("104121014", var_58_33)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_104121", "104121014", "story_v_out_104121.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_104121", "104121014", "story_v_out_104121.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_34 = math.max(var_58_25, arg_55_1.talkMaxDuration)

			if var_58_24 <= arg_55_1.time_ and arg_55_1.time_ < var_58_24 + var_58_34 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_24) / var_58_34

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_24 + var_58_34 and arg_55_1.time_ < var_58_24 + var_58_34 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play104121015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 104121015
		arg_59_1.duration_ = 4.033

		local var_59_0 = {
			ja = 4.033,
			ko = 2.7,
			zh = 3.033,
			en = 2.5
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
				arg_59_0:Play104121016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1011ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1011ui_story == nil then
				arg_59_1.var_.characterEffect1011ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.1

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1011ui_story then
					arg_59_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1011ui_story then
				arg_59_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["1011ui_story"].transform
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1.var_.moveOldPos1011ui_story = var_62_4.localPosition
			end

			local var_62_6 = 0.001

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6
				local var_62_8 = Vector3.New(-0.7, -0.71, -6)

				var_62_4.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1011ui_story, var_62_8, var_62_7)

				local var_62_9 = manager.ui.mainCamera.transform.position - var_62_4.position

				var_62_4.forward = Vector3.New(var_62_9.x, var_62_9.y, var_62_9.z)

				local var_62_10 = var_62_4.localEulerAngles

				var_62_10.z = 0
				var_62_10.x = 0
				var_62_4.localEulerAngles = var_62_10
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 then
				var_62_4.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_62_11 = manager.ui.mainCamera.transform.position - var_62_4.position

				var_62_4.forward = Vector3.New(var_62_11.x, var_62_11.y, var_62_11.z)

				local var_62_12 = var_62_4.localEulerAngles

				var_62_12.z = 0
				var_62_12.x = 0
				var_62_4.localEulerAngles = var_62_12
			end

			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_62_15 = 0
			local var_62_16 = 0.275

			if var_62_15 < arg_59_1.time_ and arg_59_1.time_ <= var_62_15 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_17 = arg_59_1:FormatText(StoryNameCfg[37].name)

				arg_59_1.leftNameTxt_.text = var_62_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_18 = arg_59_1:GetWordFromCfg(104121015)
				local var_62_19 = arg_59_1:FormatText(var_62_18.content)

				arg_59_1.text_.text = var_62_19

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_20 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121015", "story_v_out_104121.awb") ~= 0 then
					local var_62_23 = manager.audio:GetVoiceLength("story_v_out_104121", "104121015", "story_v_out_104121.awb") / 1000

					if var_62_23 + var_62_15 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_23 + var_62_15
					end

					if var_62_18.prefab_name ~= "" and arg_59_1.actors_[var_62_18.prefab_name] ~= nil then
						local var_62_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_18.prefab_name].transform, "story_v_out_104121", "104121015", "story_v_out_104121.awb")

						arg_59_1:RecordAudio("104121015", var_62_24)
						arg_59_1:RecordAudio("104121015", var_62_24)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_104121", "104121015", "story_v_out_104121.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_104121", "104121015", "story_v_out_104121.awb")
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
	Play104121016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 104121016
		arg_63_1.duration_ = 6.133

		local var_63_0 = {
			ja = 6.133,
			ko = 3.133,
			zh = 4.1,
			en = 5.566
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
				arg_63_0:Play104121017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1084ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1084ui_story then
					arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1011ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1011ui_story == nil then
				arg_63_1.var_.characterEffect1011ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1011ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1011ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1011ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1011ui_story.fillRatio = var_66_9
			end

			local var_66_10 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_10.localPosition
			end

			local var_66_12 = 0.001

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_12 then
				local var_66_13 = (arg_63_1.time_ - var_66_11) / var_66_12
				local var_66_14 = Vector3.New(0.7, -0.97, -6)

				var_66_10.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_14, var_66_13)

				local var_66_15 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_15.x, var_66_15.y, var_66_15.z)

				local var_66_16 = var_66_10.localEulerAngles

				var_66_16.z = 0
				var_66_16.x = 0
				var_66_10.localEulerAngles = var_66_16
			end

			if arg_63_1.time_ >= var_66_11 + var_66_12 and arg_63_1.time_ < var_66_11 + var_66_12 + arg_66_0 then
				var_66_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_66_17 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_17.x, var_66_17.y, var_66_17.z)

				local var_66_18 = var_66_10.localEulerAngles

				var_66_18.z = 0
				var_66_18.x = 0
				var_66_10.localEulerAngles = var_66_18
			end

			local var_66_19 = 0

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_66_21 = 0
			local var_66_22 = 0.575

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_23 = arg_63_1:FormatText(StoryNameCfg[6].name)

				arg_63_1.leftNameTxt_.text = var_66_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_24 = arg_63_1:GetWordFromCfg(104121016)
				local var_66_25 = arg_63_1:FormatText(var_66_24.content)

				arg_63_1.text_.text = var_66_25

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_26 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121016", "story_v_out_104121.awb") ~= 0 then
					local var_66_29 = manager.audio:GetVoiceLength("story_v_out_104121", "104121016", "story_v_out_104121.awb") / 1000

					if var_66_29 + var_66_21 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_29 + var_66_21
					end

					if var_66_24.prefab_name ~= "" and arg_63_1.actors_[var_66_24.prefab_name] ~= nil then
						local var_66_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_24.prefab_name].transform, "story_v_out_104121", "104121016", "story_v_out_104121.awb")

						arg_63_1:RecordAudio("104121016", var_66_30)
						arg_63_1:RecordAudio("104121016", var_66_30)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_104121", "104121016", "story_v_out_104121.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_104121", "104121016", "story_v_out_104121.awb")
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
	Play104121017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 104121017
		arg_67_1.duration_ = 13.1

		local var_67_0 = {
			ja = 13.1,
			ko = 11.9,
			zh = 12.366,
			en = 12.1
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
				arg_67_0:Play104121018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1084ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1084ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1084ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1084ui_story.fillRatio = var_70_5
			end

			local var_70_6 = arg_67_1.actors_["1084ui_story"].transform
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 then
				arg_67_1.var_.moveOldPos1084ui_story = var_70_6.localPosition
			end

			local var_70_8 = 0.001

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8
				local var_70_10 = Vector3.New(0, 100, 0)

				var_70_6.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1084ui_story, var_70_10, var_70_9)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_6.position

				var_70_6.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_6.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_6.localEulerAngles = var_70_12
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 then
				var_70_6.localPosition = Vector3.New(0, 100, 0)

				local var_70_13 = manager.ui.mainCamera.transform.position - var_70_6.position

				var_70_6.forward = Vector3.New(var_70_13.x, var_70_13.y, var_70_13.z)

				local var_70_14 = var_70_6.localEulerAngles

				var_70_14.z = 0
				var_70_14.x = 0
				var_70_6.localEulerAngles = var_70_14
			end

			local var_70_15 = arg_67_1.actors_["1011ui_story"].transform
			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.var_.moveOldPos1011ui_story = var_70_15.localPosition
			end

			local var_70_17 = 0.001

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Vector3.New(0, 100, 0)

				var_70_15.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1011ui_story, var_70_19, var_70_18)

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
			local var_70_25 = 1.175

			if var_70_24 < arg_67_1.time_ and arg_67_1.time_ <= var_70_24 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_26 = arg_67_1:FormatText(StoryNameCfg[49].name)

				arg_67_1.leftNameTxt_.text = var_70_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_27 = arg_67_1:GetWordFromCfg(104121017)
				local var_70_28 = arg_67_1:FormatText(var_70_27.content)

				arg_67_1.text_.text = var_70_28

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_29 = 47
				local var_70_30 = utf8.len(var_70_28)
				local var_70_31 = var_70_29 <= 0 and var_70_25 or var_70_25 * (var_70_30 / var_70_29)

				if var_70_31 > 0 and var_70_25 < var_70_31 then
					arg_67_1.talkMaxDuration = var_70_31

					if var_70_31 + var_70_24 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_31 + var_70_24
					end
				end

				arg_67_1.text_.text = var_70_28
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121017", "story_v_out_104121.awb") ~= 0 then
					local var_70_32 = manager.audio:GetVoiceLength("story_v_out_104121", "104121017", "story_v_out_104121.awb") / 1000

					if var_70_32 + var_70_24 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_32 + var_70_24
					end

					if var_70_27.prefab_name ~= "" and arg_67_1.actors_[var_70_27.prefab_name] ~= nil then
						local var_70_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_27.prefab_name].transform, "story_v_out_104121", "104121017", "story_v_out_104121.awb")

						arg_67_1:RecordAudio("104121017", var_70_33)
						arg_67_1:RecordAudio("104121017", var_70_33)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_104121", "104121017", "story_v_out_104121.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_104121", "104121017", "story_v_out_104121.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_34 = math.max(var_70_25, arg_67_1.talkMaxDuration)

			if var_70_24 <= arg_67_1.time_ and arg_67_1.time_ < var_70_24 + var_70_34 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_24) / var_70_34

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_24 + var_70_34 and arg_67_1.time_ < var_70_24 + var_70_34 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play104121018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 104121018
		arg_71_1.duration_ = 7

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play104121019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_1 = 2

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_1 then
				local var_74_2 = (arg_71_1.time_ - var_74_0) / var_74_1
				local var_74_3 = Color.New(0, 0, 0)

				var_74_3.a = Mathf.Lerp(1, 0, var_74_2)
				arg_71_1.mask_.color = var_74_3
			end

			if arg_71_1.time_ >= var_74_0 + var_74_1 and arg_71_1.time_ < var_74_0 + var_74_1 + arg_74_0 then
				local var_74_4 = Color.New(0, 0, 0)
				local var_74_5 = 0

				arg_71_1.mask_.enabled = false
				var_74_4.a = var_74_5
				arg_71_1.mask_.color = var_74_4
			end

			local var_74_6 = "STblack"

			if arg_71_1.bgs_[var_74_6] == nil then
				local var_74_7 = Object.Instantiate(arg_71_1.paintGo_)

				var_74_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_74_6)
				var_74_7.name = var_74_6
				var_74_7.transform.parent = arg_71_1.stage_.transform
				var_74_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.bgs_[var_74_6] = var_74_7
			end

			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 then
				local var_74_9 = manager.ui.mainCamera.transform.localPosition
				local var_74_10 = Vector3.New(0, 0, 10) + Vector3.New(var_74_9.x, var_74_9.y, 0)
				local var_74_11 = arg_71_1.bgs_.STblack

				var_74_11.transform.localPosition = var_74_10
				var_74_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_74_12 = var_74_11:GetComponent("SpriteRenderer")

				if var_74_12 and var_74_12.sprite then
					local var_74_13 = (var_74_11.transform.localPosition - var_74_9).z
					local var_74_14 = manager.ui.mainCameraCom_
					local var_74_15 = 2 * var_74_13 * Mathf.Tan(var_74_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_74_16 = var_74_15 * var_74_14.aspect
					local var_74_17 = var_74_12.sprite.bounds.size.x
					local var_74_18 = var_74_12.sprite.bounds.size.y
					local var_74_19 = var_74_16 / var_74_17
					local var_74_20 = var_74_15 / var_74_18
					local var_74_21 = var_74_20 < var_74_19 and var_74_19 or var_74_20

					var_74_11.transform.localScale = Vector3.New(var_74_21, var_74_21, 0)
				end

				for iter_74_0, iter_74_1 in pairs(arg_71_1.bgs_) do
					if iter_74_0 ~= "STblack" then
						iter_74_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_74_22 = arg_71_1.actors_["1084ui_story"].transform
			local var_74_23 = 0

			if var_74_23 < arg_71_1.time_ and arg_71_1.time_ <= var_74_23 + arg_74_0 then
				arg_71_1.var_.moveOldPos1084ui_story = var_74_22.localPosition
			end

			local var_74_24 = 0.001

			if var_74_23 <= arg_71_1.time_ and arg_71_1.time_ < var_74_23 + var_74_24 then
				local var_74_25 = (arg_71_1.time_ - var_74_23) / var_74_24
				local var_74_26 = Vector3.New(0, 100, 0)

				var_74_22.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1084ui_story, var_74_26, var_74_25)

				local var_74_27 = manager.ui.mainCamera.transform.position - var_74_22.position

				var_74_22.forward = Vector3.New(var_74_27.x, var_74_27.y, var_74_27.z)

				local var_74_28 = var_74_22.localEulerAngles

				var_74_28.z = 0
				var_74_28.x = 0
				var_74_22.localEulerAngles = var_74_28
			end

			if arg_71_1.time_ >= var_74_23 + var_74_24 and arg_71_1.time_ < var_74_23 + var_74_24 + arg_74_0 then
				var_74_22.localPosition = Vector3.New(0, 100, 0)

				local var_74_29 = manager.ui.mainCamera.transform.position - var_74_22.position

				var_74_22.forward = Vector3.New(var_74_29.x, var_74_29.y, var_74_29.z)

				local var_74_30 = var_74_22.localEulerAngles

				var_74_30.z = 0
				var_74_30.x = 0
				var_74_22.localEulerAngles = var_74_30
			end

			if arg_71_1.frameCnt_ <= 1 then
				arg_71_1.dialog_:SetActive(false)
			end

			local var_74_31 = 2
			local var_74_32 = 0.675

			if var_74_31 < arg_71_1.time_ and arg_71_1.time_ <= var_74_31 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_33 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_33:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_34 = arg_71_1:GetWordFromCfg(104121018)
				local var_74_35 = arg_71_1:FormatText(var_74_34.content)

				arg_71_1.text_.text = var_74_35

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_36 = 27
				local var_74_37 = utf8.len(var_74_35)
				local var_74_38 = var_74_36 <= 0 and var_74_32 or var_74_32 * (var_74_37 / var_74_36)

				if var_74_38 > 0 and var_74_32 < var_74_38 then
					arg_71_1.talkMaxDuration = var_74_38
					var_74_31 = var_74_31 + 0.3

					if var_74_38 + var_74_31 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_38 + var_74_31
					end
				end

				arg_71_1.text_.text = var_74_35
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_39 = var_74_31 + 0.3
			local var_74_40 = math.max(var_74_32, arg_71_1.talkMaxDuration)

			if var_74_39 <= arg_71_1.time_ and arg_71_1.time_ < var_74_39 + var_74_40 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_39) / var_74_40

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_39 + var_74_40 and arg_71_1.time_ < var_74_39 + var_74_40 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play104121019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 104121019
		arg_77_1.duration_ = 4.016666666666

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play104121020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.mask_.enabled = true
				arg_77_1.mask_.raycastTarget = true

				arg_77_1:SetGaussion(false)
			end

			local var_80_1 = 2

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_1 then
				local var_80_2 = (arg_77_1.time_ - var_80_0) / var_80_1
				local var_80_3 = Color.New(0, 0, 0)

				var_80_3.a = Mathf.Lerp(1, 0, var_80_2)
				arg_77_1.mask_.color = var_80_3
			end

			if arg_77_1.time_ >= var_80_0 + var_80_1 and arg_77_1.time_ < var_80_0 + var_80_1 + arg_80_0 then
				local var_80_4 = Color.New(0, 0, 0)
				local var_80_5 = 0

				arg_77_1.mask_.enabled = false
				var_80_4.a = var_80_5
				arg_77_1.mask_.color = var_80_4
			end

			local var_80_6 = "S0409"

			if arg_77_1.bgs_[var_80_6] == nil then
				local var_80_7 = Object.Instantiate(arg_77_1.paintGo_)

				var_80_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_80_6)
				var_80_7.name = var_80_6
				var_80_7.transform.parent = arg_77_1.stage_.transform
				var_80_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_77_1.bgs_[var_80_6] = var_80_7
			end

			local var_80_8 = 0

			if var_80_8 < arg_77_1.time_ and arg_77_1.time_ <= var_80_8 + arg_80_0 then
				local var_80_9 = manager.ui.mainCamera.transform.localPosition
				local var_80_10 = Vector3.New(0, 0, 10) + Vector3.New(var_80_9.x, var_80_9.y, 0)
				local var_80_11 = arg_77_1.bgs_.S0409

				var_80_11.transform.localPosition = var_80_10
				var_80_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_80_12 = var_80_11:GetComponent("SpriteRenderer")

				if var_80_12 and var_80_12.sprite then
					local var_80_13 = (var_80_11.transform.localPosition - var_80_9).z
					local var_80_14 = manager.ui.mainCameraCom_
					local var_80_15 = 2 * var_80_13 * Mathf.Tan(var_80_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_80_16 = var_80_15 * var_80_14.aspect
					local var_80_17 = var_80_12.sprite.bounds.size.x
					local var_80_18 = var_80_12.sprite.bounds.size.y
					local var_80_19 = var_80_16 / var_80_17
					local var_80_20 = var_80_15 / var_80_18
					local var_80_21 = var_80_20 < var_80_19 and var_80_19 or var_80_20

					var_80_11.transform.localScale = Vector3.New(var_80_21, var_80_21, 0)
				end

				for iter_80_0, iter_80_1 in pairs(arg_77_1.bgs_) do
					if iter_80_0 ~= "S0409" then
						iter_80_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_80_22 = arg_77_1.bgs_.S0409.transform
			local var_80_23 = 0

			if var_80_23 < arg_77_1.time_ and arg_77_1.time_ <= var_80_23 + arg_80_0 then
				arg_77_1.var_.moveOldPosS0409 = var_80_22.localPosition
			end

			local var_80_24 = 0.001

			if var_80_23 <= arg_77_1.time_ and arg_77_1.time_ < var_80_23 + var_80_24 then
				local var_80_25 = (arg_77_1.time_ - var_80_23) / var_80_24
				local var_80_26 = Vector3.New(0, 1, 7)

				var_80_22.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPosS0409, var_80_26, var_80_25)
			end

			if arg_77_1.time_ >= var_80_23 + var_80_24 and arg_77_1.time_ < var_80_23 + var_80_24 + arg_80_0 then
				var_80_22.localPosition = Vector3.New(0, 1, 7)
			end

			local var_80_27 = arg_77_1.bgs_.S0409.transform
			local var_80_28 = 0.0166666666666667

			if var_80_28 < arg_77_1.time_ and arg_77_1.time_ <= var_80_28 + arg_80_0 then
				arg_77_1.var_.moveOldPosS0409 = var_80_27.localPosition
			end

			local var_80_29 = 4

			if var_80_28 <= arg_77_1.time_ and arg_77_1.time_ < var_80_28 + var_80_29 then
				local var_80_30 = (arg_77_1.time_ - var_80_28) / var_80_29
				local var_80_31 = Vector3.New(0, 1, 5)

				var_80_27.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPosS0409, var_80_31, var_80_30)
			end

			if arg_77_1.time_ >= var_80_28 + var_80_29 and arg_77_1.time_ < var_80_28 + var_80_29 + arg_80_0 then
				var_80_27.localPosition = Vector3.New(0, 1, 5)
			end

			if arg_77_1.frameCnt_ <= 1 then
				arg_77_1.dialog_:SetActive(false)
			end

			local var_80_32 = 2
			local var_80_33 = 0.1

			if var_80_32 < arg_77_1.time_ and arg_77_1.time_ <= var_80_32 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				arg_77_1.dialog_:SetActive(true)

				local var_80_34 = LeanTween.value(arg_77_1.dialog_, 0, 1, 0.3)

				var_80_34:setOnUpdate(LuaHelper.FloatAction(function(arg_81_0)
					arg_77_1.dialogCg_.alpha = arg_81_0
				end))
				var_80_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_77_1.dialog_)
					var_80_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_77_1.duration_ = arg_77_1.duration_ + 0.3

				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_35 = arg_77_1:FormatText(StoryNameCfg[6].name)

				arg_77_1.leftNameTxt_.text = var_80_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_36 = arg_77_1:GetWordFromCfg(104121019)
				local var_80_37 = arg_77_1:FormatText(var_80_36.content)

				arg_77_1.text_.text = var_80_37

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_38 = 4
				local var_80_39 = utf8.len(var_80_37)
				local var_80_40 = var_80_38 <= 0 and var_80_33 or var_80_33 * (var_80_39 / var_80_38)

				if var_80_40 > 0 and var_80_33 < var_80_40 then
					arg_77_1.talkMaxDuration = var_80_40
					var_80_32 = var_80_32 + 0.3

					if var_80_40 + var_80_32 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_40 + var_80_32
					end
				end

				arg_77_1.text_.text = var_80_37
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121019", "story_v_out_104121.awb") ~= 0 then
					local var_80_41 = manager.audio:GetVoiceLength("story_v_out_104121", "104121019", "story_v_out_104121.awb") / 1000

					if var_80_41 + var_80_32 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_41 + var_80_32
					end

					if var_80_36.prefab_name ~= "" and arg_77_1.actors_[var_80_36.prefab_name] ~= nil then
						local var_80_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_36.prefab_name].transform, "story_v_out_104121", "104121019", "story_v_out_104121.awb")

						arg_77_1:RecordAudio("104121019", var_80_42)
						arg_77_1:RecordAudio("104121019", var_80_42)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_104121", "104121019", "story_v_out_104121.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_104121", "104121019", "story_v_out_104121.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_43 = var_80_32 + 0.3
			local var_80_44 = math.max(var_80_33, arg_77_1.talkMaxDuration)

			if var_80_43 <= arg_77_1.time_ and arg_77_1.time_ < var_80_43 + var_80_44 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_43) / var_80_44

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_43 + var_80_44 and arg_77_1.time_ < var_80_43 + var_80_44 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play104121020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 104121020
		arg_83_1.duration_ = 4.8

		local var_83_0 = {
			ja = 4.366,
			ko = 4.2,
			zh = 4.8,
			en = 4.133
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
			arg_83_1.auto_ = false
		end

		function arg_83_1.playNext_(arg_85_0)
			arg_83_1.onStoryFinished_()
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_1 = 2

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_1 then
				local var_86_2 = (arg_83_1.time_ - var_86_0) / var_86_1
				local var_86_3 = Color.New(1, 1, 1)

				var_86_3.a = Mathf.Lerp(1, 0, var_86_2)
				arg_83_1.mask_.color = var_86_3
			end

			if arg_83_1.time_ >= var_86_0 + var_86_1 and arg_83_1.time_ < var_86_0 + var_86_1 + arg_86_0 then
				local var_86_4 = Color.New(1, 1, 1)
				local var_86_5 = 0

				arg_83_1.mask_.enabled = false
				var_86_4.a = var_86_5
				arg_83_1.mask_.color = var_86_4
			end

			local var_86_6 = 0

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				local var_86_7 = manager.ui.mainCamera.transform.localPosition
				local var_86_8 = Vector3.New(0, 0, 10) + Vector3.New(var_86_7.x, var_86_7.y, 0)
				local var_86_9 = arg_83_1.bgs_.S0409

				var_86_9.transform.localPosition = var_86_8
				var_86_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_10 = var_86_9:GetComponent("SpriteRenderer")

				if var_86_10 and var_86_10.sprite then
					local var_86_11 = (var_86_9.transform.localPosition - var_86_7).z
					local var_86_12 = manager.ui.mainCameraCom_
					local var_86_13 = 2 * var_86_11 * Mathf.Tan(var_86_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_14 = var_86_13 * var_86_12.aspect
					local var_86_15 = var_86_10.sprite.bounds.size.x
					local var_86_16 = var_86_10.sprite.bounds.size.y
					local var_86_17 = var_86_14 / var_86_15
					local var_86_18 = var_86_13 / var_86_16
					local var_86_19 = var_86_18 < var_86_17 and var_86_17 or var_86_18

					var_86_9.transform.localScale = Vector3.New(var_86_19, var_86_19, 0)
				end

				for iter_86_0, iter_86_1 in pairs(arg_83_1.bgs_) do
					if iter_86_0 ~= "S0409" then
						iter_86_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_86_20 = manager.ui.mainCamera.transform
			local var_86_21 = 2

			if var_86_21 < arg_83_1.time_ and arg_83_1.time_ <= var_86_21 + arg_86_0 then
				arg_83_1.var_.shakeOldPos = var_86_20.localPosition
			end

			local var_86_22 = 0.666666666666667

			if var_86_21 <= arg_83_1.time_ and arg_83_1.time_ < var_86_21 + var_86_22 then
				local var_86_23 = (arg_83_1.time_ - var_86_21) / 0.066
				local var_86_24, var_86_25 = math.modf(var_86_23)

				var_86_20.localPosition = Vector3.New(var_86_25 * 0.13, var_86_25 * 0.13, var_86_25 * 0.13) + arg_83_1.var_.shakeOldPos
			end

			if arg_83_1.time_ >= var_86_21 + var_86_22 and arg_83_1.time_ < var_86_21 + var_86_22 + arg_86_0 then
				var_86_20.localPosition = arg_83_1.var_.shakeOldPos
			end

			local var_86_26 = arg_83_1.bgs_.S0409.transform
			local var_86_27 = 0

			if var_86_27 < arg_83_1.time_ and arg_83_1.time_ <= var_86_27 + arg_86_0 then
				arg_83_1.var_.moveOldPosS0409 = var_86_26.localPosition
			end

			local var_86_28 = 0.001

			if var_86_27 <= arg_83_1.time_ and arg_83_1.time_ < var_86_27 + var_86_28 then
				local var_86_29 = (arg_83_1.time_ - var_86_27) / var_86_28
				local var_86_30 = Vector3.New(0, 1, 10)

				var_86_26.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPosS0409, var_86_30, var_86_29)
			end

			if arg_83_1.time_ >= var_86_27 + var_86_28 and arg_83_1.time_ < var_86_27 + var_86_28 + arg_86_0 then
				var_86_26.localPosition = Vector3.New(0, 1, 10)
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_31 = 2
			local var_86_32 = 0.25

			if var_86_31 < arg_83_1.time_ and arg_83_1.time_ <= var_86_31 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_33 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_33:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_34 = arg_83_1:FormatText(StoryNameCfg[13].name)

				arg_83_1.leftNameTxt_.text = var_86_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_35 = arg_83_1:GetWordFromCfg(104121020)
				local var_86_36 = arg_83_1:FormatText(var_86_35.content)

				arg_83_1.text_.text = var_86_36

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_37 = 10
				local var_86_38 = utf8.len(var_86_36)
				local var_86_39 = var_86_37 <= 0 and var_86_32 or var_86_32 * (var_86_38 / var_86_37)

				if var_86_39 > 0 and var_86_32 < var_86_39 then
					arg_83_1.talkMaxDuration = var_86_39
					var_86_31 = var_86_31 + 0.3

					if var_86_39 + var_86_31 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_39 + var_86_31
					end
				end

				arg_83_1.text_.text = var_86_36
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_104121", "104121020", "story_v_out_104121.awb") ~= 0 then
					local var_86_40 = manager.audio:GetVoiceLength("story_v_out_104121", "104121020", "story_v_out_104121.awb") / 1000

					if var_86_40 + var_86_31 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_40 + var_86_31
					end

					if var_86_35.prefab_name ~= "" and arg_83_1.actors_[var_86_35.prefab_name] ~= nil then
						local var_86_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_35.prefab_name].transform, "story_v_out_104121", "104121020", "story_v_out_104121.awb")

						arg_83_1:RecordAudio("104121020", var_86_41)
						arg_83_1:RecordAudio("104121020", var_86_41)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_104121", "104121020", "story_v_out_104121.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_104121", "104121020", "story_v_out_104121.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_42 = var_86_31 + 0.3
			local var_86_43 = math.max(var_86_32, arg_83_1.talkMaxDuration)

			if var_86_42 <= arg_83_1.time_ and arg_83_1.time_ < var_86_42 + var_86_43 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_42) / var_86_43

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_42 + var_86_43 and arg_83_1.time_ < var_86_42 + var_86_43 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B04f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0409"
	},
	voices = {
		"story_v_out_104121.awb"
	}
}
