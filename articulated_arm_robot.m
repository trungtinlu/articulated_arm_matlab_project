%% Parameter of DH Table
d1 = 5;
d2 = 0;
d3 = 0;
a1 = 0;
a2 = 10;
a3 = 10;
alpha1 = 90;
alpha2 = 0;
alpha3 = 0;
theta1 = 45;
theta2 = 60;
theta3 = 0;
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
xlim([-30,30]);
ylim([-30,30]);
zlim([0,30]);
hold on
fill3(X(1,:),Y(1,:),Z(2,:),"y");
%% Draw joint1
% khởi tạo joint ban đầu
r_joint1 = 2;
h_joint1 = 6;
draw_joint(r_joint1,h_joint1,A10);

%% draw joint2
% khởi tạo joint ban đầu
r_joint2 = 2;
h_joint2 = 6;
draw_joint(r_joint1,h_joint1,A20);
%% draw link2
% khởi tạo link ban đầu
r_link2 = 1;
h_link2 = 10;
draw_link(r_link2,h_link2,A20);
%% draw link3
% khởi tạo link ban đầu
r_link3 = 1;
h_link3 = 10;
draw_link(r_link2,h_link2,A30);
%% Draw frame1
draw_RF(A10);
%% Draw frame2
draw_RF(A20);
%% Draw frame3
draw_RF(A30);
%% Draw end effector
draw_end_effector(A30);