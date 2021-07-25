function [dif,dif_filt] = thresholdAndBinarize(dif,thresh,fps)

k = find(dif>thresh);

for i = 1:length(k)
    t = k(i);
    if t == 1
        dif(t:t+1)= 0;
    else
    dif(t-1:t+1) = 0;
    end
end

dif = dif(1:300*fps);


dif_filt = ones(size(dif));
for i = 1:length(k)
    t = k(i);
    if t == 1
        dif_filt(t:t+1)= 0;
    else
    dif_filt(t-1:t+1) = 0;
    end
end
dif_filt = dif_filt(1:300*fps);

end