% Kryzstof Kudlak
% Project 1 Data Analysis
% ENGR 102-H02
% 2/4/2020

clc; clear; close all;

%%

% Define file name, make a library of the companies I need to access
% and create a cell array for storing data matrices for each tab of the
% sheet.  Also define metrics for the tables
file     = 'Project 1 Stock Data Spring 2020';
names    = ["NIKE", "Chipotle", "Cracker Barrel", "General Motors", "Cheesecake Factory", "Texas Roadhouse", "Dr. Pepper", "Red Robin"];
varNames = ["NIKE", "Chipotle", "CrackerBarrel", "GeneralMotors", "CheesecakeFactory", "TexasRoadhouse", "DrPepper", "RedRobin"];
metrics1 = ["Max Open ($)", "Day", "Max High ($)", "Day", "Max Low ($)", "Day"];
metrics2 = ["Max Close ($)", "Min Close ($)", "Median Close ($)", "Avg Close ($)", "Std Dev Close ($)"];
data = cell(1, 8);

% Read all data from the excel sheet
for i = 1:8
    data(i) = {xlsread(file, names(i))};
end

%%

% Plot all the data using my plot data function
for i = 0:3
    figure(i+1);
    plotData(data{i*2 + 1}, data{i*2 + 2});
    xlabel("Time (Days)"); ylabel("Stock Value ($)");
    title(strcat(names(i*2 + 1), " and ", names(i*2 + 2)));
    legend(strcat(names(i*2 + 1), " open"), strcat(names(i*2 + 1), " close"), strcat(names(i*2 + 2), " open"), strcat(names(i*2 + 2), " close"));
end

%%

% Put data into the table format
formattedData1 = cell(1,8);
formattedData2 = cell(1,8);
for i = 1:8
    formattedData1{i} = format1(data{i});
    formattedData2{i} = format2(data{i});
end

% Create a table with the first col showing metrics & variable names as the
% companies
T1 = table(metrics1', formattedData1{:}, 'VariableNames', ["o", varNames]);
T2 = table(metrics2', formattedData2{:}, 'VariableNames', ["o", varNames]);
disp(T1)
disp(T2)

%%

fprintf('\nNike, Low Risk, Low Reward\n')
fprintf('Red Robin, Low Risk, Medium Reward\n')
fprintf('Texas Roadhouse, High Risk, High Reward\n')

%%

figure(5);
rec = data{8};
recClose = rec(:,5);
plot(1:length(recClose), recClose, '-g');
xlabel("Time (Days)"); ylabel("Closing Stock Value ($)");
title("Closing Value vs Time for Red Robin");

for i = 1:3
    text(i*365,recClose(365*i),strcat("Year ", num2str(i)));
end

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

% get the set of values into a format that the first table wants
% max Open, Day, max high, day, max low, day
function x = format1(arr)
    x = zeros(1, 6);
    for i = 0:2
        m = max(arr(:,i+2));
        x(i*2 + 1) = m;
        x(i*2 + 2) = find(arr(:,i+2) == m);
    end
    x = x';
end

%%

% get the set of values into a format that the second table wants
% max Open, Day, max high, day, max low, day
function x = format2(arr)
    arr = arr(:,5);
    x = [max(arr), min(arr), median(arr), mean(arr), std(arr)];
    x = x';
end










