   5 REM mixup by Mike Lord 1982
  10 DATA 0,-1,0,1,-1,0,1,0
  20 DIM h(4): DIM v(4)
  30 FOR a=1 TO 4: READ h(a),v(a): NEXT a
 100 PLOT 101,69: DRAW 45,0: DRAW 0,45: DRAW -45,0: DRAW 0,-45
 110 FOR y=8 TO 12: FOR x=13 TO 17
 120 PRINT AT y,x;CHR$ (12+x+5*y)
 130 NEXT x: NEXT y
 140 LET x=17: LET y=12: PRINT AT y,x;" "
 200 RANDOMIZE : LET x1=0: LET y1=0
 210 INPUT TAB 8;"Skill (1-9) ? ";s: IF s<1 OR s>9 THEN GO TO 210
 220 FOR a=1 TO 5*s
 230 LET c=1+INT (4*RND ): LET x2=x+h(c): LET y2=y+v(c)
 240 IF SCREEN$ (y2,x2)="" OR (x1=x2 AND y1=y2) THEN GO TO 230
 250 PRINT AT y,x;SCREEN$ (y2,x2);AT y2,x2;" "
 260 LET x1=x: LET y1=y: LET x=x2: LET y=y2
 270 NEXT a
 300 FOR m=1 TO 9999: PRINT AT 18,12;"Move ";m
 310 PRINT AT 20,11;"Letter ?"
 320 LET i$=INKEY$ : IF i$="" THEN GO TO 320
 330 IF CODE i$>96 THEN LET i$=CHR$ (CODE i$-32)
 340 FOR a=1 TO 4: IF SCREEN$ (y+v(a),x+h(a))=i$ THEN GO TO 400
 350 NEXT a: GO TO 320
 400 PRINT AT 20,0,,
 410 PRINT AT y,x;SCREEN$ (y+v(a),x+h(a))
 420 LET x=x+h(a): LET y=y+v(a): PRINT AT y,x;" "
 500 FOR p=8 TO 12: FOR q=13 TO 17
 510 IF p=12 AND q=17 THEN GO TO 600
 520 IF SCREEN$ (p,q)<>CHR$ (12+q+5*p) THEN GO TO 540
 530 NEXT q: NEXT p
 540 NEXT m
 600 PRINT AT 20,10;"FINISHED"
