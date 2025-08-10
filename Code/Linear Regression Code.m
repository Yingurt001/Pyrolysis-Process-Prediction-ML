% 读取Excel文件
data = xlsread('draft_1.xlsx');

% 提取数据
ratio = data(:, 1);
Tar_yield = data(:, 2);
Water_yield = data(:, 3);
Char_yield = data(:, 4);
Syngas_yield = data(:, 5);

% 输入ratio
user_ratio = inputdlg('请输入0到1之间的数代表ratio：', '输入', 1);
user_ratio = str2double(user_ratio);

% 选择模型类型，这里选择线性回归模型
model_Tar = fitlm(ratio, Tar_yield);
model_Water = fitlm(ratio, Water_yield);
model_Char = fitlm(ratio, Char_yield);
model_Syngas = fitlm(ratio, Syngas_yield);

% 展示预测值
disp(['输入的ratio值: ', num2str(user_ratio)]);
disp(['Tar yield 预测值: ', num2str(predict(model_Tar, user_ratio))]);
disp(['Water yield 预测值: ', num2str(predict(model_Water, user_ratio))]);
disp(['Char yield 预测值: ', num2str(predict(model_Char, user_ratio))]);
disp(['Syngas yield 预测值: ', num2str(predict(model_Syngas, user_ratio))]);

% 画图
figure;

subplot(2, 2, 1);
scatter(ratio, Tar_yield, 'o', 'DisplayName', 'Original Data');
hold on;
scatter(user_ratio, predict(model_Tar, user_ratio), 'x', 'DisplayName', 'Predicted Value');
h = plot(model_Tar, 'DisplayName', 'Fitted Curve');
xlabel('DFA/CS Ratio');
ylabel('Product quality ratio (wt%)');

subplot(2, 2, 2);
scatter(ratio, Water_yield, 'o', 'DisplayName', 'Original Data');
hold on;
scatter(user_ratio, predict(model_Water, user_ratio), 'x', 'DisplayName', 'Predicted Value');
plot(model_Water);
xlabel('DFA/CS Ratio');
ylabel('Product quality ratio (wt%)');
legend('Location', 'best');

subplot(2, 2, 3);
scatter(ratio, Char_yield, 'o', 'DisplayName', 'Original Data');
hold on;
scatter(user_ratio, predict(model_Char, user_ratio), 'x', 'DisplayName', 'Predicted Value');
plot(model_Char);
xlabel('DFA/CS Ratio');
ylabel('Product quality ratio (wt%)');
legend('Location', 'best');

subplot(2, 2, 4);
scatter(ratio, Syngas_yield, 'o', 'DisplayName', 'Original Data');
hold on;
scatter(user_ratio, predict(model_Syngas, user_ratio), 'x', 'DisplayName', 'Predicted Value');
plot(model_Syngas);
xlabel('DFA/CS Ratio');
ylabel('Product quality ratio (wt%)');
legend('Location', 'best');

% 展示拟合曲线的函数表达式
disp(['Tar yield 拟合曲线: ', num2str(model_Tar.Coefficients.Estimate(2)), ' * x + ', num2str(model_Tar.Coefficients.Estimate(1))]);
disp(['Water yield 拟合曲线: ', num2str(model_Water.Coefficients.Estimate(2)), ' * x + ', num2str(model_Water.Coefficients.Estimate(1))]);
disp(['Char yield 拟合曲线: ', num2str(model_Char.Coefficients.Estimate(2)), ' * x + ', num2str(model_Char.Coefficients.Estimate(1))]);
disp(['Syngas yield 拟合曲线: ', num2str(model_Syngas.Coefficients.Estimate(2)), ' * x + ', num2str(model_Syngas.Coefficients.Estimate(1))]);

% 计算模型准确度
Tar_rmse = sqrt(mean((Tar_yield - predict(model_Tar, ratio)).^2));
Water_rmse = sqrt(mean((Water_yield - predict(model_Water, ratio)).^2));
Char_rmse = sqrt(mean((Char_yield - predict(model_Char, ratio)).^2));
Syngas_rmse = sqrt(mean((Syngas_yield - predict(model_Syngas, ratio)).^2));

disp(['Tar yield 模型准确度 (RMSE): ', num2str(Tar_rmse)]);
disp(['Water yield 模型准确度 (RMSE): ', num2str(Water_rmse)]);
disp(['Char yield 模型准确度 (RMSE): ', num2str(Char_rmse)]);
disp(['Syngas yield 模型准确度 (RMSE): ', num2str(Syngas_rmse)]);
% 计算SSR和SST
SSR_Tar = sum((predict(model_Tar, ratio) - mean(Tar_yield)).^2);
SSR_Water = sum((predict(model_Water, ratio) - mean(Water_yield)).^2);
SSR_Char = sum((predict(model_Char, ratio) - mean(Char_yield)).^2);
SSR_Syngas = sum((predict(model_Syngas, ratio) - mean(Syngas_yield)).^2);

SST_Tar = sum((Tar_yield - mean(Tar_yield)).^2);
SST_Water = sum((Water_yield - mean(Water_yield)).^2);
SST_Char = sum((Char_yield - mean(Char_yield)).^2);
SST_Syngas = sum((Syngas_yield - mean(Syngas_yield)).^2);

% 计算拟合优度
R_squared_Tar = SSR_Tar / SST_Tar;
R_squared_Water = SSR_Water / SST_Water;
R_squared_Char = SSR_Char / SST_Char;
R_squared_Syngas = SSR_Syngas / SST_Syngas;

disp(['Tar yield 拟合优度 (R-squared): ', num2str(R_squared_Tar)]);
disp(['Water yield 拟合优度 (R-squared): ', num2str(R_squared_Water)]);
disp(['Char yield 拟合优度 (R-squared): ', num2str(R_squared_Char)]);
disp(['Syngas yield 拟合优度 (R-squared): ', num2str(R_squared_Syngas)]);
