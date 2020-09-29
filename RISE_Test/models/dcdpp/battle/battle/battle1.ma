#include (rules.inc)
[top]
components : battle

[battle]
type : cell
dim : (10,10,6)
delay : inertial
defaultDelayTime  : 100
border : wrapped 

neighbors : battle(0,0,-1)
neighbors : battle(0,0,-2) 
neighbors : battle(0,0,-3)
neighbors : battle(0,0,-4)
neighbors : battle(0,0,-5)

neighbors : battle(0,1,-1) 
neighbors : battle(0,-1,-1)  
neighbors : battle(-1,0,-1)  
neighbors : battle(1,0,-1)  


neighbors : battle(0,-1,-5)
neighbors : battle(0,1,-5)
neighbors : battle(-1,0,-5)
neighbors : battle(1,0,-5)


neighbors : battle(0,-1,5)
neighbors : battle(0,1,5)
neighbors : battle(-1,0,5)
neighbors : battle(1,0,5)

neighbors : battle(0,-1,4) 
neighbors : battle(0,1,4) 
neighbors : battle(-1,0,4) 
neighbors : battle(1,0,4) 

neighbors : battle(0,0,4) 
neighbors : battle(0,0,5) 

neighbors : battle(0,-1,-4) 
neighbors : battle(0,1,-4) 
neighbors : battle(-1,0,-4) 
neighbors : battle(1,0,-4) 


neighbors : battle(0,-1,-3) 
neighbors : battle(0,1,-3) 
neighbors : battle(-1,0,-3) 
neighbors : battle(1,0,-3) 

neighbors : battle(-1,0,0)
neighbors : battle(0,-1,0) battle(0,0,0) battle(0,1,0)	
neighbors : battle(1,0,0)

neighbors : battle(-1,0,1)
neighbors : battle(0,-1,1) battle(0,0,1) battle(0,1,1)	
neighbors : battle(1,0,1)

initialvalue : 0
initialcellsvalue : battle1.val
zone : fight-rule { (0,0,0)..(9,9,0) }                       
zone : fight-ability { (0,0,1)..(9,9,1) }                       
zone : command-control-A { (0,0,2)..(9,9,2) }
zone : command-control-B { (0,0,3)..(9,9,3) }
zone : move-directions { (0,0,4)..(9,9,4) }
zone : before-move { (0,0,5)..(9,9,5) }


[fight-rule]

rule : {  if((0,0,0) >= abs(#macro(fight_rule_1)), (0,0,0) + #macro(fight_rule_1),0) } 100 { cellPos(2) = 0 and ((0,0,0) = 1 or (0,0,0) =2 ) and (stateCount(-1) + stateCount(-2)) > 0}
rule : {  if(abs((0,0,0)) >= #macro(fight_rule_2), (0,0,0) + #macro(fight_rule_2),0) } 100 { cellPos(2) = 0 and ((0,0,0) = -1 or (0,0,0) =-2) and (stateCount(1) + stateCount(2)) > 0}
rule : { if( #macro(fight_rule_3) !=0 ,0,5) } 100 { cellPos(2)= 0 and (0,0,0) = 5 and (stateCount(-1) + stateCount(-2)) > 0 } 
rule : { if( #macro(fight_rule_4) !=0 ,0,-5)} 100 { cellPos(2) =0 and (0,0,0) = -5 and (stateCount(1) + stateCount(2)) > 0 } 


rule : { 5 } 100 { cellPos(2)= 0 and (0,0,0) = 5 and (stateCount(-1) + stateCount(-2)) = 0 } 
rule : { -5 } 100 { cellPos(2) =0 and (0,0,0) = -5 and (stateCount(1) + stateCount(2)) = 0 } 


rule : #macro(move-rule-west)
rule : #macro(move-rule-east)
rule : #macro(move-rule-north)
rule : #macro(move-rule-south)

rule : #macro(after-move-west)
rule : #macro(after-move-east)
rule : #macro(after-move-north)
rule : #macro(after-move-south)

rule : 2 100 { cellPos(2) = 0 and ((0,0,0) = 1 or (0,0,0) = 2 )  and (stateCount(-1) + stateCount(-2)) =0 }
rule : -2 100 { cellPos(2) = 0 and ((0,0,0) = -1 or (0,0,0) = -2 )  and (stateCount(1) + stateCount(2)) =0 }

rule : 0 100 {t}


[fight-ability]
rule : {uniform(0,0.55)} 50  { cellPos(2) = 1 and ( (0,0,-1) = 1 or (0,0,-1) = -1) }
rule : {uniform(0.45,0.99)} 50 { cellPos(2) = 1 and ( (0,0,-1) = 2 or (0,0,-1) = -2) }
rule : 0 50 {t}

[command-control-A]
rule : { cellPos(0) + cellPos(1)/100 } 0 { cellPos(2) = 2 and (0,0,-2) = -5 }
rule : { (0,-1,0) } 0 { cellPos(2)=2 and (0,-1,0) != 0  }
rule : { (0,1,0) } 0 { cellPos(2)=2  and (0,1,0) != 0 }
rule : { (-1,0,0) } 0 { cellPos(2)=2 and (-1,0,0) != 0 }
rule : { (1,0,0) } 0 { cellPos(2)=2  and (1,0,0) !=0  }

rule : 0 0 {t}

[command-control-B]
rule : { cellPos(0) + cellPos(1)/100 } 0 { cellPos(2) = 3 and (0,0,-3) = 5 }
rule : { (0,-1,0) } 0 { cellPos(2)=3 and (0,-1,0)!= 0 }
rule : { (0,1,0) } 0 { cellPos(2)=3 and (0,1,0)!= 0 }
rule : { (-1,0,0) } 0 { cellPos(2)=3 and (-1,0,0)!= 0 }
rule : { (1,0,0) } 0 { cellPos(2)=3 and (1,0,0)!= 0 }
rule : 0 0 {t}

[move-directions]

rule : { if( cellPos(1) > (fractional((0,0,-2)) * 100),40,20)  } 100 { cellPos(2) = 4 and (0,0,-4) =2 and (0,0,-2) !=0  and ((0,-1,-4) != -2 and (0,1,-4) != -2 and (-1,0,-4) != -2 and (1,0,-4) != -2 ) and  (cellPos(0) = trunc((0,0,-2)) ) and (cellPos(1) != (fractional((0,0,-2)) * 100)) }
rule : { if( cellPos(0) > trunc((0,0,-2)),10,30) } 100 { cellPos(2) = 4  and (0,0,-4) =2 and (0,0,-2) !=0  and ((0,-1,-4) != -2 and (0,1,-4) != -2 and (-1,0,-4) != -2 and (1,0,-4) != -2 ) and (cellPos(1) = (fractional((0,0,-2)) * 100)) and (cellPos(0) != trunc((0,0,-2)) ) }
rule : { if ( random > 0.5 , if( cellPos(0) > trunc((0,0,-2)),10,30), if( cellPos(1) > (fractional((0,0,-2)) *100),40,20) ) } 100 { cellPos(2) = 4 and (0,0,-4)=2 and (0,0,-2) !=0  and ((0,-1,-4) != -2 and (0,1,-4) != -2 and (-1,0,-4) != -2 and (1,0,-4) != -2 ) and  (cellPos(0) != trunc((0,0,-2))) and (cellPos(1) != (fractional((0,0,-2)) * 100) )   }

rule : { if( cellPos(1) > (fractional((0,0,-1)) *100),40,20)  } 100 { cellPos(2) = 4 and (0,0,-4) = -2 and (0,0,-1) !=0  and ((0,-1,-4) != 2 and (0,1,-4) != 2 and (-1,0,-4) != 2 and (1,0,-4) != 2 ) and (cellPos(0) = trunc((0,0,-1)) ) and (cellPos(1) != (fractional((0,0,-1)) * 100)) }
rule : { if( cellPos(0) > trunc((0,0,-1)),10,30) } 100 { cellPos(2) = 4 and (0,0,-4) = -2 and (0,0,-1) !=0 and ((0,-1,-4) != 2 and (0,1,-4) != 2 and (-1,0,-4) != 2 and (1,0,-4) != 2 ) and (cellPos(1) = (fractional((0,0,-1)) * 100)) and (cellPos(0) != trunc((0,0,-1)) ) }
rule : { if ( random > 0.5 , if( cellPos(0) > trunc((0,0,-1)),10,30), if( cellPos(1) > (fractional((0,0,-1)) *100),40,20) ) } 100 { cellPos(2) = 4 and (0,0,-4)= -2 and (0,0,-1) !=0  and ((0,-1,-4) != 2 and (0,1,-4) != 2 and (-1,0,-4) != 2 and (1,0,-4) != 2 ) and (cellPos(0) != trunc((0,0,-1))) and (cellPos(1) != (fractional((0,0,-1)) * 100) )  }

rule : {0}100 {t}

[before-move]

rule : #macro(before-move-west)
rule : #macro(before-move-east)
rule : #macro(before-move-north)
rule : #macro(before-move-south)

rule : 0 100 {t}