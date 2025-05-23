﻿require("manager/manager")

StreamConnection = require("manager/net/StreamConnection")
ReconnectLogic = require("manager/net/ReconnectLogic")
DatagramConnection = require("manager/net/DatagramConnection")
ConnectionHelper = require("manager/net/ConnectionHelper")
Protocol = require("manager/net/Protocol")
NetManager = require("manager/NetManager")
UIManager = require("manager/UIManager")
GCManager = require("manager/GCManager")
TipsMgr = require("manager/tips/TipsMgr")
TimeMgr = require("manager/TimeMgr")
TimeWheelMgr = require("manager/TimeWheelMgr")
ReduxFactory = require("manager/ReduxFactory")
LoadUIMgr = require("manager/LoadUIMgr")
ShowMessageMgr = require("manager/message/ShowMessageMgr")
ShowTransitionMgr = require("manager/transition/ShowTransitionMgr")
EffectMgr = require("manager/EffectMgr")
SDKSendMessageMgr = require("game/tools/SDKSendMessageMgr")
StoryHandler = require("manager/story/StoryHandler")
StoryCallback = require("manager/story/StoryCallback")
StoryPlayer = require("manager/story/StoryPlayer2")
StoryOperDefine = require("manager/story/StoryOperDefine")
StoryMgr = require("manager/StoryMgr")
AudioMgr = require("manager/AudioMgr")
WindowBarMgr = require("manager/windowBar/WindowBarMgr")
NotificationCenter = require("manager/NotificationCenter")
RedPointMgr = require("manager/RedPointMgr")
LoadSceneMgr = require("manager/LoadSceneMgr")
RollTipsMgr = require("manager/RollTipsMgr")
MatrixPopMgr = require("manager/MatrixPopMgr")
IngameGraphicMgr = require("manager/setting/IngameGraphicMgr")
AssetPendMgr = require("manager/AssetPendMgr")
AchievementTipsMgr = require("manager/tips/achievementTips/AchievementTipsMgr")
ShareMgr = require("manager/share/ShareMgr")

require("manager/guide/includeGuide")
require("manager/posterGirl/includePosterGirl")
require("manager/heroRaiseTrack/includeHeroRaiseTrack")
require("manager/reserveCamera/includeReserveCamera")

VideoPlayMgr = require("manager/video/VideoPlayMgr")
UITimeMgr = require("manager/UITimeMgr")

require("manager/story/include")
