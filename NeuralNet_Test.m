%% 侧壁
my_baker_sidewall_test_x = zeros(1,15);
for i = 1:15
    x = baker_sidewall_test_y(i);
    [y] = NeuralNet_Sidewall(x);
    my_baker_sidewall_test_x(i) = y;
end

% 计算与拟合结果之差
result_sidewall = abs(my_baker_sidewall_test_x - baker_sidewall_test_x);

%% 杯底
my_baker_bottom_test_x = zeros(1,15);
for i = 1:15
    x = baker_bottom_test_y(i);
    [y] = NeuralNet_Bottom_0_225(x);
    my_baker_bottom_test_x(i) = y;
end

% 计算与拟合结果之差
result_bottom = abs(my_baker_bottom_test_x - baker_bottom_test_x);
