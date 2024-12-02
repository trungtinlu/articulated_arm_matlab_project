%% Parameter of DH Table
d1 = 10;
d2 = 0;
d3 = 0;
a1 = 0;
a2 = 10;
a3 = 10;
alpha1 = 90;
alpha2 = 0;
alpha3 = 0;
%% Inverse Kinematic
% input
pwx         = 1;
pwy         = 1;
pwz_input   = 12;
% Calculation
pwz         = pwz_input - d1; 
sum         = pwx^2 + pwy^2 + pwz^2;
sum_xy      = pwx^2 + pwy^2;
c_theta3    = (pwx^2+pwy^2+(pwz)^2-a2^2-a3^2)/(2*a2*a3);
s_theta3    = sqrt(1-c_theta3^2);
theta3_inv  = atan2(s_theta3,c_theta3);
theta3_calc = rad2deg(theta3_inv);
MS_theta2   = a2^2 + a3^2 + 2*a2*a3*c_theta3;
c_theta2    = (sqrt(sum_xy)*(a2+a3*c_theta3)+pwz*a3*s_theta3)/MS_theta2;
s_theta2    = (-sqrt(sum_xy)*a3*s_theta3+pwz*(a2+a3*c_theta3))/MS_theta2;
theta2_inv  = atan2(s_theta2,c_theta2);
theta1_inv  = atan2(pwy,pwx);