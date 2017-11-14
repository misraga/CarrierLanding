function [sys, x0, str,ts] = f18_sfcn2(t, x ,u, flag,x0)


switch flag
    
    case 0 % initialize
        
    
        str =[];
        ts = [0 0];
            
        s = simsizes ;
        
        s.NumContStates = 9;
        s.NumDiscStates = 0;
        s.NumOutputs = 9;
        s.NumInputs = 4;
        s.DirFeedthrough = 0;
        s.NumSampleTimes = 1; 
                sys = simsizes(s);
    
        
    case 1  % derivative
  
            sys = aircraft_EOM(t,x,u);
        
         
    case 3  % output
        
        sys = x ;
        
    case {2 4 9} 
        
        sys = [];
end