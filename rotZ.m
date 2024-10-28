function y = rotZ(theta)
    theta = deg2rad(theta);
    y = [cos(theta) -sin(theta) 0           0; 
         sin(theta) cos(theta)  0           0; 
         0          0           1           0;
         0          0           0           1];
end
