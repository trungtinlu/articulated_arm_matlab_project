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
%% Tao data
q = zeros(3,1);
% Tính toán vị trí end-effector cho mỗi điểm trong lưới
for i = -170:10:170
    for j = -55:10:155
        A01 = Trans_Matrix_Calc(0,d1,a1,alpha1);
        A12 = Trans_Matrix_Calc(j,d2,a2,alpha2);
        A23 = Trans_Matrix_Calc(-100,d3,a3,alpha3);
        A30 = A01*A12*A23;
        q = [q A30((1:3),4)];
    end
end

for i = -170:10:170
    for j = -55:10:155
        A01 = Trans_Matrix_Calc(0,d1,a1,alpha1);
        A12 = Trans_Matrix_Calc(j,d2,a2,alpha2);
        A23 = Trans_Matrix_Calc(160,d3,a3,alpha3);
        A30 = A01*A12*A23;
        q = [q A30((1:3),4)];
    end
end

for i = -170:10:170
    for j = -100:10:160
        A01 = Trans_Matrix_Calc(i,d1,a1,alpha1);
        A12 = Trans_Matrix_Calc(-55,d2,a2,alpha2);
        A23 = Trans_Matrix_Calc(j,d3,a3,alpha3);
        A30 = A01*A12*A23;
        q = [q A30((1:3),4)];
    end
end

for i = -170:10:170
    for j = -100:10:160
        A01 = Trans_Matrix_Calc(i,d1,a1,alpha1);
        A12 = Trans_Matrix_Calc(170,d2,a2,alpha2);
        A23 = Trans_Matrix_Calc(j,d3,a3,alpha3);
        A30 = A01*A12*A23;
        q = [q A30((1:3),4)];
    end
end

% Chuyển đổi mảng workspace thành vector
X = reshape(q(1,:), [], 1);
Y = reshape(q(2,:), [], 1);
Z = reshape(q(3,:), [], 1);

% Hiển thị không gian làm việc
scatter3(X, Y, Z, '.');
hold on
xlabel('X');
ylabel('Y');
zlabel('Z');
