% Input: Rotation angle about x axis
% Output: 3x3 rotation matrix Rx for rotation about x axis
% Gaurav Misra

function Cx = cx(theta)


Cx =[ 1           0          0;
      0  cos(theta) sin(theta);
      0 -sin(theta) cos(theta) ];


%%%EOF
