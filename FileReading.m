% Kryzstof Kudlak
% ENGR102-H02
% ICA Excel, vectors, matrices

% How to import data from excel

clc; clear;

% var_name = xlsread('Filename', 'Sheet', 'Range')

texas = xlsread('data', 'Texas Roadhouse');

closeMax   = max(texas(:,5))
openMax    = max(texas(:,2))
openMedian = median(texas(:,2))

cc = [12:-3:-3; 1:4:21; 2, 5, 9, -4, 6, -1]