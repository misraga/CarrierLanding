% Input: Rotation angle about z axis
% Output: 3x3 rotation matrix Rz for rotation about z axis
% Gaurav Misra

function Cz = cz( theta )


Cz = [  cos(theta)  sin(theta)  0;
       -sin(theta)  cos(theta)  0;
                 0           0  1 ];

%%%EOF
