LJ� 	 6  9BH�-  9 X�6 ' BFR�+ =K   finalizingDDo not use table.insert or rawset directly on draft properties.
errorPROXY_STATE
proxy
pairs   + = K  finished�	
 4-  4  .  - 9 +    B  B- 9-  3 B+  
  X� X�- 989  X�6 ' B- 9 B X�- 9B- 9 B - 9-  3	 B.  2  �L �� � markChangedSweepfinalizevAn immer producer returned a new value *and* modified its draft. Either return a new value *or* modify the draft.
errormodifiedPROXY_STATE 	eachcreateProxy#  -  9 -  D   �get+  -  9 -   BK    �set�
 4  -  9     B- 9<6  5 3 =3 =B6 9	-  B2  �L � ��insert
table__newindex __index   setmetatablePROXY_STATEcreateStateu   5  4  == ==L 
proxy	baseparentassigned finalizedfinishedhasCopymodifiedfinalizing�  %-  9   B-  9  B89   X�9 8 X�- 9 B  X�-  9  B9 -  9   B<9 8L L � �createProxy	copyprepareCopyisProxyable	basefinalizingsourceassertUnfinished�  -  9   B9 + <9   X�-  9  B8 X�K  -  9  B-  9  B9 <K  �	copyprepareCopymarkChangedsourcemodifiedassignedassertUnfinished=   	9    X�9 L X�9 L K  	base	copyhasCopy�   9    X�6 ' BK  wCannot use a proxy that has been revoke. Did you pass an object from inside an immer function to an async process?
errorfinished]  
-  9   B  X�6 ' BK   �"base should be a proxy object
errorisProxyZ  9    X�-  9  B-  9  BK  �prepareCopymarkChangedmodifiedW  9    X�K  + =  -  99 B= K   �	baseshallowCopy	copyhasCopy� -  9   B  X�-  98 - 9 B6 99G C X�6 9  G C K   ��	copyinsert
tableprepareModifiedPROXY_STATEisProxy� -  9   B  X�-  98 - 9 B6 99G C X�6 9  G C K   ��	copyremove
tableprepareModifiedPROXY_STATEisProxy� -  9   B  X�-  98 6 9- 9 BG C X�6 9  G C K   ��source	getn
tablePROXY_STATEisProxy@  8   X� -  9 -  B I K   �get� -  9   B  X�-  98 3 - 9 B)  2  �J 2�6   2  �D K   ��ipairssource PROXY_STATEisProxyL  6     B  X� -  9-  B I K   �get	next� -  9   B  X�-  98 3 - 9 B+  2  �J 2�6   2  �D K   ��
pairssource PROXY_STATEisProxyY  9    X	�+ =  9   X�-  99 BK  �markChangedparentmodified�   -      ) )��M �-  89   X
�- 9 B  X�- 9 BO �K  ��markChangedhasTableChangesmodified�  9  -  9  B)  )  6  BH�8

  X
�+
 L
  FR�6  BH� FR� X�+ X�+ L �
pairssource	base�   -  9   B  X�-  98 9  X�9  X�9L + =- 99 D X�9L - 9  BL   ��finalizeNonProxiedTable	basefinalizeTable	copyfinalizedmodifiedPROXY_STATEisProxyB  -  8  X�- - 9  B< K  � � finalize6 9 -  9  3 B2  �L   �� 	each	base~  -  9  B  X�- - 9 B< X�- 9 BK     � finalizeNonProxiedTablefinalizeisProxyY -  9   B  X�2 �-  9  3 B2  �K  K   �� 	eachisProxyable�  , 16   ' B 4  4  3 =3 =3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*2  �L  finalizeNonProxiedTable finalizeTable finalize hasTableChanges markChangedSweep markChanged 
pairs ipairs 	getn remove insert prepareCopy prepareModified assertProxy assertUnfinished source set get createState createProxy produceImpllibrary/immer/utilsrequire 