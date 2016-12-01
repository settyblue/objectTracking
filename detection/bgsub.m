load('oneobj');

bg = median(left,4);
diff = difference(left(:,:,:,90), left(:,:,:,91));
bgs = difference(left(:,:,:,95),bg);
objs = imdilate(bwareaopen(bgs>100, 10), strel('disk', 10));

bbs = regionprops(objs,'BoundingBox');