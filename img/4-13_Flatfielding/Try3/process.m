clear
close all
clc


%% Get avgd OD2
folder = '785_OD2';
filenames = dir(folder);

avg_img = zeros(2048,2048);

for i = 3:numel(filenames)
    filename = filenames(i).name;
    img = double(imread(strcat(folder,'\',filename)));
    avg_img = avg_img + img;
end

avg_img = avg_img/(numel(filenames)-2);

OD2 = avg_img;

%% Get avgd OD2_03
folder = '785_OD2_03';
filenames = dir(folder);

avg_img = zeros(2048,2048);

for i = 3:numel(filenames)
    filename = filenames(i).name;
    img = double(imread(strcat(folder,'\',filename)));
    avg_img = avg_img + img;
end

avg_img = avg_img/(numel(filenames)-2);

OD2_03 = avg_img;


%% Get avgd OD2_1
folder = '785_OD2_1';
filenames = dir(folder);

avg_img = zeros(2048,2048);

for i = 3:numel(filenames)
    filename = filenames(i).name;
    img = double(imread(strcat(folder,'\',filename)));
    avg_img = avg_img + img;
end

avg_img = avg_img/(numel(filenames)-2);

OD2_1 = avg_img;

%% Get avgd OD2_1_03
folder = '785_OD2_1_03';
filenames = dir(folder);

avg_img = zeros(2048,2048);

for i = 3:numel(filenames)
    filename = filenames(i).name;
    img = double(imread(strcat(folder,'\',filename)));
    avg_img = avg_img + img;
end

avg_img = avg_img/(numel(filenames)-2);

OD2_1_03 = avg_img;

%% Get avgd DarkCurrent
folder = 'DarkCurrent';
filenames = dir(folder);

avg_img = zeros(2048,2048);

for i = 3:numel(filenames)
    filename = filenames(i).name;
    img = double(imread(strcat(folder,'\',filename)));
    avg_img = avg_img + img;
end

avg_img = avg_img/(numel(filenames)-2);

DarkCurrent = avg_img;

%% save em

clearvars -except 'OD2' 'OD2_1' 'OD2_03' 'OD2_1_03' 'DarkCurrent'
save '785FlatFielding.mat'




