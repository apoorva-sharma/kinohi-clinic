clear
close all
clc

%%

load 785FlatFielding_AndTransData.mat

OD1TransMean = mean(OD1Trans)/100;
OD03TransMean = mean(OD03Trans)/100;


figure()
hold on
for i = 1:5
    for j = 1:5
        resp = [DarkCurrent(i,j), OD2_1_03(i,j), OD2_1(i,j), OD2_03(i,j),...
            OD2(i,2)];
        pwr = [0, OD1TransMean * OD03TransMean, OD1TransMean, OD03TransMean, 1];
        
    end
end