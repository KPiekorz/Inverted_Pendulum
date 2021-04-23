clc;
clear;
close all;



file_name = 'non_linear_invpend_model';
Order = [4 1 4];
Parameters = [0.5; 1; 9.81; 2; 0.41]; % m M g l fi 
InitialStates = [0; pi; 0; 0];

sys = idnlgrey(file_name, Order, Parameters, InitialStates, 0)

