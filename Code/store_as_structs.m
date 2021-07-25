% dataSaver
% data = 
% 
%   struct with fields:
% 
%         locustID: [] %str. date_locustnum_trialnum
%          control: [] %double.1 if true 0 if false
%         trialNum: [] %double.
%         odorSide: [] %'none', 'left','right'
%           neural: [] %rawData at 15khz that we use findpeaks on
%            coors: [] %300 seconds data
%        sampFrame: [] %save a frame at 10s for defining mid point
%     neuralBinned: [] %locs after filtering for min and max peak heights
%         movement: [] %double.if vector pre-filtering, only for 300s data
%       moveThresh: [] %double.threshold used for movement, typically 1000
%              fps: [] %double. 7.5 or 15

%%
% clear all;clc;close all
thresh = 30;
fps =15;
fname = fname(1:end-4);
csv_name = split(fname,'.');
fname = strcat(fname,'.wmv');
csv_name = strcat(csv_name{1},'.csv');
coords = csvread(csv_name);
vid = VideoReader(fname);
dif_orig = dif;
coors = coords(idx:idx+300*fps-1,:);
vid = VideoReader(fname);
vid.CurrentTime = 20;
frame = rgb2gray(vid.readFrame);
% figure
% imshow(frame)
% [xi,yi] = ginput(1);
% close all
xi = 620;
yi = 77;


data.ID = '624_1_7';
data.control = 0;
data.trialNum=7; %double.
data.odorSide= 'right'; %'none', 'left','right'
data.odorName = 'ben'; %'none', 'hex','ben'

data.neural= t; %rawData at 15khz that we use findpeaks on
data.coors= coors; %300 seconds data
data.sampFrame= frame; %save a frame at 12s for defining mid point
data.frameMid=[xi,yi]; %median coords
data.spikeLocs = locs; %location of da spikeys
data.neuralBinned=N; %locs after filtering for min and max peak heights
data.movement= dif_orig; %double. dif vector pre-filtering, only for 300s data
data.moveThresh= thresh; %double.threshold used for movement, typically 1000
data.fps= fps; %double. 7.5 or 15

save(data.ID,'data')
