function draw_end_effector(A_trans)
    X = [-1 0 1 1 0 -1 -1;
         -1 0 1 1 0 -1 -1];
    Y = [-0.5 -0.5 -0.5 0.5 0.5  0.5  -0.5;
         -0.5 -0.5 -0.5 0.5 0.5  0.5  -0.5];
    Z = [ 1 0 1 1 0  1  1;
          0 0 0 0 0  0  0];
    A = [X(1,:); Y(1,:); Z(1,:); ones(1,size(X,2))];
    B = [X(2,:); Y(2,:); Z(2,:); ones(1,size(X,2))];
    % Xoay end effector
    A_new = rotY(90)*A;
    B_new = rotY(90)*B;
    X(1,:) = A_new(1,:);X(2,:) = B_new(1,:);
    Y(1,:) = A_new(2,:);Y(2,:) = B_new(2,:);
    Z(1,:) = A_new(3,:);Z(2,:) = B_new(3,:);
    A = [X(1,:); Y(1,:); Z(1,:); ones(1,size(X,2))];
    B = [X(2,:); Y(2,:); Z(2,:); ones(1,size(X,2))];
    A_new = A_trans*A;
    B_new = A_trans*B;
    X(1,:) = A_new(1,:);X(2,:) = B_new(1,:);
    Y(1,:) = A_new(2,:);Y(2,:) = B_new(2,:);
    Z(1,:) = A_new(3,:);Z(2,:) = B_new(3,:);
    surf(X,Y,Z);
end