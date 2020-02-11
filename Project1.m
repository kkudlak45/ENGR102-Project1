% Kryzstof Kudlak
% Project 1 Data Analysis
% ENGR 102-H02
% 2/4/2020

clc; clear; close all;

file = 'Project 1 Stock Data Spring 2020';

nike = xlsread(file, 'NIKE');
chip = xlsread(file, 'Chipotle');
cb   = xlsread(file, 'Cracker Barrel');
gm   = xlsread(file, 'General Motors');
cf   = xlsread(file, 'Cheesecake Factory');
tx   = xlsread(file, 'Texas Roadhouse');
dp   = xlsread(file, 'Dr. Pepper');
rr   = xlsread(file, 'Red Robin');

%%

figure(1);
plotData(nike, chip)

figure(2);
plotData(cb, gm)

figure(3);
plotData(cf, tx)

figure(4);
plotData(dp, rr);

%%

format(nike)

%%

function [] = plotData(arr1, arr2)
    plot(1:length(arr1(:,2)), arr1(:,2), '-r');
    hold on;
    plot(1:length(arr1(:,5)), arr1(:,5), '-m');
    hold on;
    plot(1:length(arr2(:,2)), arr2(:,2), '-k');
    hold on;
    plot(1:length(arr2(:,5)), arr2(:,5), '-b');
end

%%

% get the set of values into a format that the table wants
% max Open, Day, max high, day, max low, day
function x = format(arr)
    x = zeros(1, 6);
    for i = 0:2
        m = max(arr(:,i+2));
        x(i*2 + 1) = m;
        x(i*2 + 2) = find(arr(:,i+2) == m);
    end
end










