clear;clc

% 读取Excel文件
data = xlsread('draft_1.xlsx');

for o = 2:5

% 提取数据
ratio = data(:, 1);
A1 = data(:, o);


% 原始数据长度
n1=length(A1);


% 原始数据累加
B1=cumsum(A1);


% 数列B 做紧邻均值生成
for i = 2:n1
C1(i) = (B1(i)+B1(i-1))/2;
end
C1(1)=[];


%建立符号变量a(发展系数)和b(灰作用量)
syms a1 b1;
c1 = [a1 b1]';

%构造数据矩阵 
B1 = [-C1;ones(1,n1-1)];
Y1 = A1; Y1(1) = [];

%使用最小二乘法计算参数 a(发展系数)和b(灰作用量)
c1 = inv(B1*B1')*B1*Y1;
c1 = c1';
a1 = c1(1); b1 = c1(2);



%预测后续数据
F1 = []; F1(1) = A1(1);
for i = 2:(n1)
    F1(i) = (A1(1)-b1/a1)/exp(a1*(i-1))+ b1/a1  ;
end

%对数列 F 累减还原,得到预测出的数据
G1 = []; G1(1) = A1(1);
for i = 2:(n1)
    G1(i) = F1(i) - F1(i-1); %得到预测出来的数据
end

%绘制曲线图
subplot(2,2,o-1)

t1 = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.8,1];
t2 = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.8,1];

plot(t1, A1,'o','Color',[0.12 0.56 1]); hold on;
plot(t2, G1, '--','Color',[1 0.89 0.52],'linewidth',2);
xlabel('DFA/CS Ratio'); ylabel('Product quality ratio (wt%)');
legend('Original Data','Prediction');

grid on;

%模型检验

H1 = G1(1:9);
%计算残差序列
epsilon = A1 - H1;

%法一：相对残差Q检验
%计算相对误差序列
delta1 = abs(epsilon./A1);
%计算相对误差Q
disp('相对残差Q检验：')
Q1 = mean(delta1)

end
% ... (Previous code remains unchanged)

for o = 2:5
    % 提取数据
    ratio = data(:, 1);
    A1 = data(:, o);

    % Grey Forecasting model
    % ... (Previous Grey Forecasting code remains unchanged)

    % 模型检验
    H1 = G1(1:9);
    
    % 计算残差序列
    epsilon = A1 - H1;

    % 绘制残差图
    figure;
    subplot(2, 1, 1);
    plot(t2, epsilon, 'o-', 'Color', [0.12 0.56 1]);
    xlabel('Time');
    ylabel('Residuals');
    title('Residual Plot');

    % 计算自相关和偏自相关
    subplot(2, 1, 2);
    
    % Check if epsilon is a column vector, if not transpose it
    if size(epsilon, 2) > 1
        epsilon = epsilon';
    end
    
    autocorr(epsilon);
    xlabel('Lag');
    ylabel('Autocorrelation');
    title('Autocorrelation Function (ACF)');

    % Ljung-Box test
    [h, pValue, QStat, CriticalValue] = lbqtest(epsilon, 'Lags', 5);
    disp(['Ljung-Box Test for residuals (lag = 5): p-value = ', num2str(pValue)]);
end