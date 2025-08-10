clear;clc
% 读取Excel文件
data = xlsread('draft_1.xlsx');

% 提取输入和输出数据
input_data = data(:, 1);  % 输入数据，即ratio
output_data = data(:, 2:5);  % 输出数据，四个产物的产量质量比

% 创建并训练神经网络模型
input_layer_size = size(input_data, 2);  % 或者直接指定为1，取决于你的实际情况
hidden_layer_size = 5;  % 隐藏层节点数
output_layer_size = 4;  % 输出层节点数

% 构建神经网络模型
net = feedforwardnet(hidden_layer_size);

% 设置训练参数
net.trainParam.epochs = 100;  % 设置训练迭代次数
net.trainParam.lr = 0.15;  % 设置学习率

% 训练神经网络
net = train(net, input_data', output_data');

% 1. 输入对话框，获取用户输入的ratio
ratio_input = inputdlg('请输入ratio（0到1之间的数）:', '输入', 1, {'0.5'});
ratio_input = str2double(ratio_input);

% 用神经网络模型进行预测
predicted_output = net(ratio_input);

% 显示预测结果
disp('预测值：');
disp(predicted_output');
disp(['输入的ratio值：', num2str(ratio_input)]);

% 2. 画出四个图，标出原数据点和神经网络模型拟合曲线
figure;

for i = 1:4
    subplot(2, 2, i);
    scatter(input_data, output_data(:, i), 'o', 'DisplayName', 'Original Data');
    hold on;
    scatter(ratio_input, predicted_output(i), 'x', 'DisplayName', 'Prediction');
    
    % 画出拟合曲线
    x_vals = linspace(min(input_data), max(input_data), 100);
    y_vals = net(x_vals);
    plot(x_vals, y_vals(i, :), 'LineWidth', 2, 'DisplayName', 'Fitting Curve');

    
    xlabel('DFA/CS Ratio');
    ylabel('Product quality ratio (wt%)');
    legend;
end

% 3. 显示拟合曲线的函数
disp('拟合曲线的函数：');
disp(net);

% 4. 检验模型准确度
performance = perform(net, output_data', net(input_data'));
disp(['均方误差：', num2str(performance)]);
disp(net(input_data'))
% 用神经网络模型进行预测
predicted_output = net(input_data');

% 计算相关系数
correlation_coefficient = corrcoef(predicted_output, output_data);

% 提取决定系数
rsquared_val = correlation_coefficient(1, 2)^2;

% 显示决定系数
disp(['决定系数 (R-squared): ', num2str(rsquared_val)]);