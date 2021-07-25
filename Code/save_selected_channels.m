%%
close all; clc
%%
close all; clc
for channel = 8%1:size(hex,1)
% channel = 1; %which channel has neural data? 
temp = filterData(hex,channel);
figure
plot(temp)
title(channel)
end


%%
hex = temp;
%%
clearvars -except hex