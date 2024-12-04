% Dữ liệu cho trước
a_max = 50; % Gia tốc tối đa (độ/s^2)
p_max = 52.9; % Quãng đường tối đa (độ)
v_max = 50; % Vận tốc tối đa (độ/s)

% Tính thời gian các pha
T1 = v_max / a_max; % Thời gian tăng tốc
T3 = (p_max + v_max^2 / a_max) / v_max; % Thời gian duy trì vận tốc
T2 = T3 - v_max / a_max; % Thời gian giảm tốc

% Tạo vector thời gian rời rạc
t = [0 T1 T2 T3];
v = [0 v_max v_max 0]; % Vận tốc tại các mốc

% Thời gian chi tiết để tính toán và vẽ
t_fine = linspace(0, T3, 1000);

% Nội suy vận tốc
v_fine = interp1(t, v, t_fine, 'linear');

% Tính gia tốc a(t): đạo hàm của v(t)
a_fine = gradient(v_fine, t_fine);

% Tính vị trí p(t): nguyên hàm của v(t)
p_fine = cumtrapz(t_fine, v_fine);

% Vẽ đồ thị
figure;

% Đồ thị vận tốc v(t)
subplot(3, 1, 1);
plot(t_fine, v_fine, 'LineWidth', 2);
grid on;
xlabel('Thời gian (s)');
ylabel('Vận tốc (v)');
title('Đồ thị vận tốc v(t)');
xlim([0 T3]);
ylim([0 max(v) * 1.1]);

% Đồ thị gia tốc a(t)
subplot(3, 1, 2);
plot(t_fine, a_fine, 'LineWidth', 2);
grid on;
xlabel('Thời gian (s)');
ylabel('Gia tốc (a)');
title('Đồ thị gia tốc a(t)');
xlim([0 T3]);

% Đồ thị vị trí p(t)
subplot(3, 1, 3);
plot(t_fine, p_fine, 'LineWidth', 2);
grid on;
xlabel('Thời gian (s)');
ylabel('Vị trí (p)');
title('Đồ thị vị trí p(t)');
xlim([0 T3]);
ylim([0 max(p_fine) * 1.1]);