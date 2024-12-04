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
theta1 = 30;
theta2 = 40;
theta3 = 0;
theta  = pi/2;
%% Calculation Transform Matrix 
A10 = Trans_Matrix_Calc(theta1,d1,a1,alpha1);
A21 = Trans_Matrix_Calc(theta2,d2,a2,alpha2);
A32 = Trans_Matrix_Calc(theta3,d3,a3,alpha3);
A20 = A10*A21;
A30 = A20*A32;
T    = [1 0 0 0; 
        0 1 0 10; 
        0 0 1 0; 
        0 0 0 1];
%% Ve de
r_base = 2;
h_base = 5;
n = 100;
[X,Y,Z] = cylinder(r_base,n);
Z = Z * h_base;
surf(X,Y,Z,"EdgeColor","none","FaceColor","y");
xlabel("X");
ylabel("Y");
zlabel("Z");
xlim([-25,25]);
ylim([-25,25]);
zlim([0,25]);
hold on
fill3(X(1,:),Y(1,:),Z(2,:),"y");
%% Draw joint1
% khởi tạo joint ban đầu
r_joint1 = 2;
h_joint1 = 6;
draw_joint(r_joint1,h_joint1,A10);
%% Draw Link 2
X = [-3 12 14 14 12 -3 -3;
     -3 12 14 14 12 -3 -3];
X = X - a2;
Y = [-0.5 -0.5 -0.25 0.25 0.5 0.5 -0.5;
     -0.5 -0.5 -0.25 0.25 0.5 0.5 -0.5];
Z = [0  0  0  0  0  0  0;
     -1 -1 -1 -1 -1 -1 -1];
Z = 3*Z;
Y = 4*Y;
% xoay link1
A = [X(1,:); Y(1,:); Z(1,:); ones(1,size(X,2))];
B = [X(2,:); Y(2,:); Z(2,:); ones(1,size(X,2))];
A_new = A20*A;
B_new = A20*B;
X(1,:) = A_new(1,:);X(2,:) = B_new(1,:);
Y(1,:) = A_new(2,:);Y(2,:) = B_new(2,:);
Z(1,:) = A_new(3,:);Z(2,:) = B_new(3,:);
surf(X,Y,Z);
fill3(X(1,:),Y(1,:),Z(1,:),'y');
fill3(X(2,:),Y(2,:),Z(2,:),'y');

%% draw joint2
% khởi tạo joint ban đầu
r_joint2 = 2;
h_joint2 = 6;
draw_joint(r_joint2,h_joint2,A20);
%% Draw Link 3
X = [-3 12 14 14 12 -3 -3;
     -3 12 14 14 12 -3 -3];
Y = [-0.5 -0.5 -0.25 0.25 0.5 0.5 -0.5;
     -0.5 -0.5 -0.25 0.25 0.5 0.5 -0.5];
Z = [1  1  1  1  1  1  1;
     -1 -1 -1 -1 -1 -1 -1];
X = X - a3;
Z = 1*Z;
Y = 4*Y;
% xoay link1
A = [X(1,:); Y(1,:); Z(1,:); ones(1,size(X,2))];
B = [X(2,:); Y(2,:); Z(2,:); ones(1,size(X,2))];
A_new = A30*A;
B_new = A30*B;
X(1,:) = A_new(1,:);X(2,:) = B_new(1,:);
Y(1,:) = A_new(2,:);Y(2,:) = B_new(2,:);
Z(1,:) = A_new(3,:);Z(2,:) = B_new(3,:);
surf(X,Y,Z);
fill3(X(1,:),Y(1,:),Z(1,:),'y');
fill3(X(2,:),Y(2,:),Z(2,:),'y');
ketqua = A30*[0 0 0 1]';
%% Roll Pitch Yaw
c_pitch = sqrt(A30(3,2)^2 + A30(3,3)^2);
s_picth = -A30(3,1);
pitch   = atan2(s_picth,c_pitch);
s_roll  = A30(3,2)/c_pitch;
c_roll  = A30(3,3)/c_pitch;
roll    = atan2(s_roll,c_roll);
yaw     = atan2(A30(2,1)/c_pitch,A30(1,1)/c_pitch);
RPY     = [rad2deg(roll),rad2deg(pitch),rad2deg(yaw)]