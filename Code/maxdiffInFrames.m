function [diff,diff_short,idx] = maxdiffInFrames(vid,thresh,fps,start_time)
n = vid.NumFrames;
d = vid.Duration;
% fps = n/d;
diff = zeros(n,1);
diff_short = diff;
prev = 0;
prev_short = 0;

for f = 1:n-1
    frame = rgb2gray(vid.readFrame);
    
    %for LED section
    frame_short = frame(600:end,:);
    if prev_short>0
        diff_short(f) = sum(sum(abs(prev_short - frame_short)>thresh));
    end
    prev_short = frame_short;
    
    %for full frame
    if prev>0
        diff(f) = sum(sum(abs(prev - frame)>thresh));
    end
    prev = frame;

end
    
[~,idx] = max(diff_short(start_time*fps:start_time*fps+300)); %find LED frame
% idx =224;
idx = idx + start_time*fps-1;
idx = int32(idx);
diff = diff(idx:idx+300*fps-1);  %limit main video to only LED -> LED + 300 seconds data

end
