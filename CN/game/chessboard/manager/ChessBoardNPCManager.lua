LJV   4  =  )��= 4  = K  waitingToMoveNPCList_curMovingNPC_NPCEntityList_� 
  6   BH�9 96	 9		B	<	9 98 9	 BFR�K  SetServerDataNewChessBoardNPCEntityidNPCEntityList_
pairsw   9  96 9B<9  98 9 BK  SetServerDataNewChessBoardNPCEntityidNPCEntityList_&   9  +  <K  NPCEntityList_6   9  8  X�9  8L K  NPCEntityList_�   6   BX�4  6  9	BX	�6 9 5 9=9=BER�9 9	8		 9	
 9
BER�K  move_numSetMovePosListnpc_idNPCEntityList_z  xinsert
table	pathipairs&   -     9   B K   �StartNpc�	  (6  99 9B+ 6 9 BH� 9B  X�+ X�FR�  X�6  9 96	 6
 995 3 =BX�  9 B2  �K  EndNPCTurncallback   ENEMY_TURN_TIPSTIPS_TYPEChessBoardConstCHESSBOARD_TIPS_SHOWCallUpdateFuncnotifyGetNPCIsReadyToMoveNPCEntityList_
pairsShowBlockerblockerManager_ChessBoardManagermanagerA  	)  6  9 BH� FR�L NPCEntityList_
pairs       X�+ X�+ L �	 
 )��=  4  = 6 9 BH
� 9B  X�6 99  BFR�6 99 3 B  9	 BK  MoveNextNPC 	sortinsert
tableGetNPCIsReadyToMoveNPCEntityList_
pairswaitingToMoveNPCList_curMovingNPC_�  
 '9   )   X�9  9   8= 9  9   +  <9 9 8 9B6 9 96 9 9 9 8 9B AX�  9	 BK  EndNPCTurnGetMoveStep!CHESSBOARD_PLAY_NPC_DICE_ANICallUpdateFuncnotifymanagerOnMoveStartNPCEntityList_curMovingNPC_waitingToMoveNPCList_)   -     9   B K   �MoveNextNPC�  19  )   X�6 ' BX'�9 9  8  X�  9 BX�9 9  8 9B  X�9 9  8 9B)��=  6 9 9	 3
 BX�9 9  8 9B2  �K  MoveToNextPos AddDelayTimerChessBoardManagermanagerOnMoveEndGetIsMoveEndMoveNextNPCNPCEntityList_#当前不存在移动中的NPC
errorcurMovingNPC_�   6  9B6 99 9B)��= 6 9 9BK  UpdateMapTurncurMovingNPC_HideBlockerblockerManager_ChessBoardManagermanagerLookAtPlayerChessBoardLuaBridgeb 
  4  6  9 BH�6 9 9	BFR�L 	pos_insert
tableNPCEntityList_
pairs�   6  9 BH�	 9B X�	 9
 B  X	�L FR�+  L CheckIsSamePosGetEntityIdNPCEntityList_
pairs?   9  8 9  D SetAttributeNPCEntityList_?   9  8 9  D SubAttributeNPCEntityList_;   9  8 9 D GetAttributeNPCEntityList_�   9  8  X�6 '  BK  9  8 9 	 
  BK  TelePortNPCToPosition+触发传送不存在的NPC！NPCID = 
errorNPCEntityList_�   6  9 BH�	 9B9

 X
�9

 X
� 9
D
 FR�+  L GetEntityIdzxGetPosAndDirNPCEntityList_
pairs�   4  6  9 BH�
 9	B	9	 X
�9	 X�6 9  9B AFR�L GetEntityIdinsert
tablezxGetPosAndDirNPCEntityList_
pairs7   9  8 9D GetPosAndDirNPCEntityList_>   
9  8  X�+ L X�+ L K  NPCEntityList_�   4  6  9 BH�4  	 9B=	 9B=6
 9

  B
FR�L insert
tablePosGetPosAndDirGetNPCTypeNPCtypeNPCEntityList_
pairs[   9  8  X�9  89 9BK  ClearDebuffbuffManager_NPCEntityList_   9  L curMovingNPC_�   6  9 BH� 9BFR�4  = )��= 4  = K  waitingToMoveNPCList_curMovingNPC_DisposeNPCEntityList_
pairs�  6 96   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 2  �L   Dispose GetMovingNPC ClearNPCDebuff GetNPCTypeAndPosList CheckNPCIsActive GetNPCPosAndDir FindPosAllNPC FindNPCWithPos TelePortNPCToPosition GetNPCAttribute SubNPCAttribute SetNPCAttribute FindTargetPosNPCEntity GetAllNpcPos EndNPCTurn MoveCurNPCNextStep MoveNextNPC StartNpc GetNPCNum StartNPCTurn SetNPCMoveListServerData FindEntity DeleteNPC AddNPC SetServerData 	InitChessBoardNPCManagersingletonClass 