function [xtrim, utrim, dx] = F18trim_sim(x0,u0)

IU = [];                  % Hold IUth control fixed
IX = [3;4;5;6;7];            % Hold IXth State Fixed


    [xtrim,utrim,ytrim,dx,options] = trim('f18trim',x0,u0,[],IX,IU,[],[],[],2) ;
    
% 
%     fprintf(' \n')
%     fprintf('----------------------------------------\n')
%     fprintf('-------------Trim Report----------------\n')
%     fprintf('----------------------------------------\n')
%     fprintf(' \n')
%     fprintf(' \n')
%     fprintf(' Velocity (ft/s)= %f \t  dx = %f\n',xtrim(1),dx(1));
%     fprintf(' alpha (deg) = %f \t  dx = %f\n',xtrim(2)*57.2958,dx(2));
%     fprintf(' beta(deg) %f \t \t dx = %f\n',xtrim(3)*57.2958,dx(3));
%     
%      fprintf(' p(deg/s) = %f \t \t dx = %f\n',xtrim(4),dx(4));
%       fprintf(' q (deg/s) = %f \t \t dx = %f\n',xtrim(5),dx(5));
%        fprintf(' r (deg/s) = %f \t \t dx = %f\n',xtrim(6),dx(6));
%     
%     fprintf(' phi (deg) = %f \t \t dx = %f\n',xtrim(7)*57.2958,dx(7));
%     fprintf(' theta (deg) = %f \t \t dx = %f\n',xtrim(8)*57.2958,dx(8));
%     fprintf(' psi (deg) = %f \t \t dx = %f\n',xtrim(9)*57.2958,dx(9));
%     
%     fprintf(' \n')
%     fprintf(' \n')
%     
%     
%     fprintf(' Elevator (deg) = %f  \n',utrim(1));
%     fprintf(' LEF (deg) = %f \n',utrim(2));
%     fprintf(' TEF (deg)= %f \n',utrim(3));
%     fprintf(' Stabilator (deg) = %f \n',utrim(4));
%     fprintf(' Aileron (deg) = %f \n',utrim(5));
%     fprintf(' Rudder (deg) = %f  \n',utrim(6));
%     fprintf(' DHT (deg) = %f \n',utrim(7));
%     fprintf(' Throttle = %f \n',utrim(8));
  

end

    