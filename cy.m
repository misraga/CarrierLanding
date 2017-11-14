% Input: Rotation angle about y axis
% Output: 3x3 rotation matrix Ry for rotation about y axis
% Gaurav Misra

function Cy = cy(theta)


Cy = [ cos(theta)  0  -sin(theta);
                0  1            0;
       sin(theta)  0   cos(theta) ];


%%%EOF
