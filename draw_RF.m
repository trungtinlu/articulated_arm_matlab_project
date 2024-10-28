function draw_RF(A_trans)
    U  = [1 0 0]*10;
    V  = [0 1 0]*10;
    W  = [0 0 1]*10;
    P  = [0;0;0;1];         
    SP = A_trans*P;
    EP = A_trans*[U;V;W;zeros(size(U))];
    X  = [1 1 1]*SP(1);
    Y  = [1 1 1]*SP(2);
    Z  = [1 1 1]*SP(3);
    U  = EP(1,:);
    V  = EP(2,:);
    W  = EP(3,:);
    quiver3(X(1,1),Y(1,1),Z(1,1),U(1,1),V(1,1),W(1,1),'r','LineWidth', 2); % X-axis (Red)
    quiver3(X(1,2),Y(1,2),Z(1,2),U(1,2),V(1,2),W(1,2),'g','LineWidth', 2); % Y-axis (Blue)
    quiver3(X(1,3),Y(1,3),Z(1,3),U(1,3),V(1,3),W(1,3),'b','LineWidth', 2); % Z-axis (Green)
end