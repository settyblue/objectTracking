
mu = squeeze(mean(bgs));
sigma = squeeze(std(bgs));
T = 20;
obj = abs(walk - mu)./sigma > T;
imwrite(obj, '3.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4

% Dilate twice to get it connected (with T=20)
dilated = bwmorph(obj, 'dilate');
dilated = bwmorph(dilated, 'dilate');
imwrite(dilated, '4.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5

[regions, num] = bwlabel(dilated, 8);

% Count pixels for each connected region
counts = [];
for i = 1:num
    counts(i) = sum(regions(:) == i);
end

% Keep only the biggest 
[m, i] = max(counts);
filtered = regions == i;
imwrite(filtered, '5.png');
