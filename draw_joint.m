function draw_joint(r_joint,h_joint,A_tran)
    n = 100;
    [X,Y,Z] = cylinder(r_joint,n);
    Z = Z * h_joint;
    Z = Z - h_joint/2;
    % xoay joint1
    A = [X(1,:); Y(1,:); Z(1,:); ones(1,size(X,2))];
    B = [X(2,:); Y(2,:); Z(2,:); ones(1,size(X,2))];
    A_new = A_tran*A;
    B_new = A_tran*B;
    X(1,:) = A_new(1,:);X(2,:) = B_new(1,:);
    Y(1,:) = A_new(2,:);Y(2,:) = B_new(2,:);
    Z(1,:) = A_new(3,:);Z(2,:) = B_new(3,:);
    surf(X,Y,Z);
    fill3(X(1,:),Y(1,:),Z(1,:),'y');
    fill3(X(2,:),Y(2,:),Z(2,:),'y');
end