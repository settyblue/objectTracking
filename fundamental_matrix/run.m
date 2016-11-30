clc;clear;close all;

left_img = double(imread('input/left_camera_images/scene001.jpg'));
right_img = double(imread('input/right_camera_images/scene001.jpg'));
left_img_points = [981 799 ;749 752 ;470 381 ;1173 720 ;1001 627 ;655 210 ;609 214 ;788 585];
right_img_points = [1014 816 ; 794 747 ; 623 313 ; 1447 721 ; 1250 601 ; 892 116 ; 846 121 ; 1011 552 ];
fundamental_matrix = estimateFundamentalMatrix(left_img_points, right_img_points, 'Method', 'Norm8Point'); %compute_fundamental_matrix(left_img_points, right_img_points);
figure;imagesc(left_img/255);axis('image');
y = 418;
x = 604;
[img_height, img_width, ~] = size(right_img);
close all;
points_on_line = compute_epipolar_line(fundamental_matrix, [x y], img_width, img_height);
if size(points_on_line, 1) == 0
    disp('Nothing found');
else
    
end

template_width = 13;
template_height = 55;
template = left_img(y-floor(template_height/2)+1:y+ceil(template_height/2), x-floor(template_width/2)+1:x+ceil(template_width/2), :);
size(template)
matching_point = template_match(right_img, template, points_on_line);
figure; imagesc(left_img/255); axis('image'); hold on; rectangle('Position', [x-template_width/2 y-template_height/2 template_width template_height]); hold off;
figure;imagesc(right_img/255);axis('image');hold on;plot(points_on_line(1:1000:end, 1), points_on_line(1:1000:end, 2), 'b+'); title('matching_point'); ....
    rectangle('Position', [matching_point(1, 1)-template_width/2 matching_point(1, 2)-template_height/2 template_width template_height],'EdgeColor', 'red');hold off;