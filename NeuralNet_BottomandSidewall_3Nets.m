function [y1] = NeuralNet_BottomandSidewall_3Nets(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 07-Mar-2022 20:35:55.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 2xQ matrix, input #1
% and returns:
%   y = 1xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [2028;657];
x1_step1.gain = [0.001230012300123;0.00952380952380952];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.96293226855322489044;2.2990077048242851809;3.1069438889435114781];
IW1_1 = [0.24794164040228103274 0.72248539053993177106;3.1346192301649424827 0.10739567813268593999;3.7901938643140598018 -0.48404978807983028988];

% Layer 2
b2 = -0.37476168375561813573;
LW2_1 = [-0.47682803494256092991 -1.4722509656168960568 0.85054543707151020193];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.005;
y1_step1.xoffset = 0;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,2); % samples

% Input 1
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
