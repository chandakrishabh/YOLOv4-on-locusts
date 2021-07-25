function temp = filterData(hex,channel)

fc = 300;
[b,a] = butter(6,fc/(15000/2),'high');
temp = hex(channel,:);
temp = filtfilt(b,a,temp);

end