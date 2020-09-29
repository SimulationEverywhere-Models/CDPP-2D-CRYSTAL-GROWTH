#BeginMacro(fight_rule_1)
(
if( ((0,-1,0) = -1 or (0,-1,0) = -2) and (0,-1,1) > 0.5  and ((0,-1,1) > (0,0,1)), -1, 0) + 
if( ((0,1,0) = -1 or (0,1,0) = -2) and (0,1,1) > 0.5 and ((0,1,1) > (0,0,1)), -1, 0) + 
if( ((-1,0,0) = -1 or (-1,0,0) = -2) and (-1,0,1) > 0.5 and ((-1,0,1) > (0,0,1)) , -1, 0) + 
if( ((1,0,0) = -1 or (1,0,0) = -2) and (1,0,1) > 0.5 and ((1,0,1) > (0,0,1)) , -1, 0) 
)
#EndMacro

#BeginMacro(fight_rule_2)
(
if( ((0,-1,0) = 1 or (0,-1,0) = 2) and (0,-1,1) > 0.5 and ((0,-1,1) > (0,0,1)) , 1, 0) + 
if( ((0,1,0) = 1 or (0,1,0) = 2) and (0,1,1) > 0.5  and ((0,1,1) > (0,0,1)) , 1, 0) + 
if( ((-1,0,0) = 1 or (-1,0,0) = 2) and (-1,0,1) > 0.5 and ((-1,0,1) > (0,0,1)) , 1, 0) + 
if( ((1,0,0) = 1 or (1,0,0) = 2) and (1,0,1) > 0.5  and ((1,0,1) > (0,0,1)) , 1, 0) 
)
#EndMacro

#BeginMacro(fight_rule_3)
(
if( ((0,-1,0)= -1 or (0,-1,0)= -2) and (0,-1,1) > 0 ,1,0) +
if( ((0,1,0)= -1 or (0,1,0)= -2) and (0,1,1) > 0 ,1,0)  +
if( ((-1,0,0)= -1 or (-1,0,0)= -2) and (-1,0,1) > 0 ,1,0)  +
if( ((1,0,0)= -1 or (1,0, 0)= -2) and (1,0,1) > 0 ,1,0)
)
#EndMacro

#BeginMacro(fight_rule_4)
(
if( ((0,-1,0)= 1 or (0,-1,0)= 2) and (0,-1,1) > 0 ,1,0) +
if( ((0,1,0)=  1 or (0,1,0)=  2) and (0,1,1) > 0 ,1,0)  +
if( ((-1,0,0)= 1 or (-1,0,0)= 2) and (-1,0,1) > 0 ,1,0)  +
if( ((1,0,0)=  1 or (1,0,0)=  2) and (1,0,1) > 0 ,1,0)
)
#EndMacro

#BeginMacro(before-move-west)
{ (0,-1,-4) } 100 { cellPos(2) = 5 and (0,0,-5) = 0 and ( (0,-1,-4) > (0,1,-4) and (0,-1,-4) > (-1,0,-4)  and (0,-1,-4) > (1,0,-4) ) }
#EndMacro

#BeginMacro(before-move-east)
{ (0,1,-4) } 100 { cellPos(2) = 5 and (0,0,-5) = 0 and ( (0,1,-4) > (0,-1,-4) and (0,1,-4) > (-1,0,-4)  and (0,1,-4) > (1,0,-4) ) }
#EndMacro

#BeginMacro(before-move-north)
{ (-1,0,-4) } 100 { cellPos(2) = 5 and (0,0,-5) = 0 and ( (-1,0,-4) > (0,-1,-4) and (-1,0,-4) > (0,1,-4)  and (-1,0,-4) > (1,0,-4) ) }
#EndMacro

#BeginMacro(before-move-south)
{ (1,0,-4) } 100 { cellPos(2) = 5 and (0,0,-5) = 0 and ( (1,0,-4) > (-1,0,-4) and (1,0,-4) > (0,-1,-4)  and (1,0,-4) > (0,1,-4) ) }
#EndMacro




#BeginMacro(move-rule-west)
{ (0,-1,0) } 100 { cellPos(2) = 0 and (0,0,0) = 0 and ((0,-1,0) = 2 or (0,-1,0) =-2)  and (0,-1,4) = 20  and ((0,-1,1) >= (0,0,5) )  }
#EndMacro

#BeginMacro(move-rule-east)
{ (0,1,0) } 100 { cellPos(2) = 0 and (0,0,0) = 0 and ((0,1,0) = 2 or (0,1,0) =-2)  and (0,1,4) = 40  and (0,1,1) >= (0,0,5)  }
#EndMacro

#BeginMacro(move-rule-north)
{ (-1,0,0) } 100 { cellPos(2) = 0 and (0,0,0) = 0 and ((-1,0,0) = 2 or (-1,0,0) =-2)  and (-1,0,4) = 30  and (-1,0,1) >= (0,0,5)  }
#EndMacro

#BeginMacro(move-rule-south)
{ (1,0,0) } 100 { cellPos(2) = 0 and (0,0,0) = 0 and ((1,0,0) = 2 or (1,0,0) =-2)  and (1,0,4) = 10 and (1,0,1) >= (0,0,5)  }
#EndMacro



#BeginMacro(after-move-west)
{ 0 } 100 { cellPos(2) = 0 and ((0,0,0) = 2 or (0,0,0) = -2)  and (0,0,4) = 20 and (0,1,0) = 0  and (0,0,1) > (0,1,5)   }
#EndMacro

#BeginMacro(after-move-east)
{ 0 } 100 { cellPos(2) = 0 and ((0,0,0) = 2 or (0,0,0) = -2)  and (0,0,4) = 40 and (0,-1,0) = 0  and (0,0,1) > (0,-1,5)   }
#EndMacro

#BeginMacro(after-move-north)
{ 0 } 100 { cellPos(2) = 0 and ((0,0,0) = 2 or (0,0,0) = -2)  and (0,0,4) = 30 and (1,0,0) = 0  and (0,0,1) > (1,0,5)   }
#EndMacro

#BeginMacro(after-move-south)
{ 0 } 100 { cellPos(2) = 0 and ((0,0,0) = 2 or (0,0,0) = -2)  and (0,0,4) = 10 and (-1,0,0) = 0  and (0,0,1) > (-1,0,5)   }
#EndMacro

