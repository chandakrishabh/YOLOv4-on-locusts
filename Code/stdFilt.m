function t = stdFilt(t)
k1  = find(t>(mean(t)+std(t)*5));
k2 = find(t<-1*(mean(t)+std(t)*5));
k = [k1,k2];
for  i = 1:length(k)
    tt = k(i);
    t(tt-1:tt+1)=0;
end

end