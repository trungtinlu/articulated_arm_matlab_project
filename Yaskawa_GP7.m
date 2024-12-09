%% Parameter of DH Table
d1 = 330;
d2 = 0;
d3 = 0;
a1 = 0;
a2 = 385;
a3 = 340;
alpha1 = 90;
alpha2 = 0;
alpha3 = 0;
theta1 = 10;
theta2 = 0;
theta3 = 0;
%% Calculation Transform Matrix 
A10 = Trans_Matrix_Calc(theta1,d1,a1,alpha1);
A21 = Trans_Matrix_Calc(theta2,d2,a2,alpha2);
A32 = Trans_Matrix_Calc(theta3,d3,a3,alpha3);
A20 = A10*A21;
A30 = A20*A32;
T    = [1 0 0 0; 
        0 1 0 1; 
        0 0 1 0; 
        0 0 0 1];
%% Draw base
X = [-79, 79 , 79 , -79, -79;
     -97, 97 , 97 , -97, -97];
Y = [79 , 79 , -79, -79, 79;
     97 , 97 , -97, -97, 97];
Z = [200, 200, 200, 200, 200;
     0  , 0  , 0  , 0  , 0];
surf(X,Y,Z);
hold on;
xlabel("X");
ylabel("Y");
zlabel("Z");
xlim([-800,800]);
ylim([-800,800]);
zlim([0,800]);
fill3(X(1,:),Y(1,:),Z(1,:),"y");
r_base = 50;
h_base = 330;
n = 100;
[X,Y,Z] = cylinder(r_base,n);
Z = Z * h_base;
surf(X,Y,Z);
fill3(X(1,:),Y(1,:),Z(2,:),"y");
X = [-79, 79 , 79 , -79, -79;
     -79, 79 , 79 , -79, -79];
Y = [79 , 79 , -79, -79, 79;
     79 , 79 , -79, -79, 79];
Z = [250, 250, 250, 250, 250;
     200, 200, 200, 200, 200];
surf(X,Y,Z);
fill3(X(1,:),Y(1,:),Z(1,:),"y");
%% Draw joint2
% khởi tạo joint ban đầu
r_joint2 = 50;
h_joint2 = 230;
draw_joint(r_joint2,h_joint2,A10);
%% Draw link1
X       = ones(2,762);
Y       = ones(2,762);
% first face
x       = 0:1:380;
y_upper = (-1/2000).*(x-190).^2+68.05;
y_lower = (-1/2000).*(x-190).^2+68.05-100;
%Update parameter
i = 1;
while i < 381
    X(1,i) = x(i);
    X(2,i) = x(i);
    i = i + 1;
end
i = 1;
while i < 381
    Y(1,i) = y_upper(i);
    Y(2,i) = y_lower(i);
    i = i + 1;
end
%second face
x       = 380:-1:0;
y_upper = (-1/2000).*(x-190).^2+68.05;
y_lower = (-1/2000).*(x-190).^2+68.05-100;
%Update parameter
i = 381;
while i < 762
    X(1,i) = x(i-380);
    X(2,i) = x(i-380);
    i = i + 1;
end
i = 381;
while i < 762
    Y(1,i) = y_upper(i-380);
    Y(2,i) = y_lower(i-380);
    i = i + 1;
end
%Final
Z       = ones(2,762);
Z       = Z*115;
%Update parameter
i = 381;
while i < 762
    Z(1,i) = -115;
    Z(2,i) = -115;
    i = i + 1;
end
% Quay dau
X(1,762) = X(1,1);
X(2,762) = X(2,1);
Y(1,762) = Y(1,1);
Y(2,762) = Y(2,1);
Z(1,762) = Z(1,1);
Z(2,762) = Z(2,1);
X        = X - a2;
% xoay link1
A = [X(1,:); Y(1,:); Z(1,:); ones(1,size(X,2))];
B = [X(2,:); Y(2,:); Z(2,:); ones(1,size(X,2))];
A_new = A20*A;
B_new = A20*B;
X(1,:) = A_new(1,:);X(2,:) = B_new(1,:);
Y(1,:) = A_new(2,:);Y(2,:) = B_new(2,:);
Z(1,:) = A_new(3,:);Z(2,:) = B_new(3,:);
%Draw
surf(X,Y,Z);
hold on;
xlabel("X");
ylabel("Y");
zlabel("Z");
fill3(X(1,:),Y(1,:),Z(1,:),"y");
fill3(X(2,:),Y(2,:),Z(2,:),"y");
%% draw joint3
% khởi tạo joint ban đầu
r_joint3 = 50;
h_joint3= 230;
draw_joint(r_joint3,h_joint3,A20);
%% draw link 2
Y = [0 83 83  0   0;
     0 83 83  0   0];
X = [0 0  340 340 0;
     0 0  340 340 0];
Z = [62 62 62 62 62;
     -62  -62  -62  -62  -62];
Y = Y - 83/2;
X = X - a3;
% xoay link2
A = [X(1,:); Y(1,:); Z(1,:); ones(1,size(X,2))];
B = [X(2,:); Y(2,:); Z(2,:); ones(1,size(X,2))];
A_new = A30*A;
B_new = A30*B;
X(1,:) = A_new(1,:);X(2,:) = B_new(1,:);
Y(1,:) = A_new(2,:);Y(2,:) = B_new(2,:);
Z(1,:) = A_new(3,:);Z(2,:) = B_new(3,:);
surf(X,Y,Z);
fill3(X(1,:),Y(1,:),Z(1,:),"y");
fill3(X(2,:),Y(2,:),Z(2,:),"y");
%% draw endeffector
draw_end_effector(A30,83,62,50);