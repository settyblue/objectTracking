clc;clear;close all;

left_img = double(imread('input/left_camera/object-frames/frame00006.png'));
right_img = double(imread('input/right_camera/object-frames/frame00006.png'));

left_camera_matrix = 1.0e+03 * [3.1342         0         0         0 ; 0    3.1079         0         0 ; 0.8164    0.3918    0.0010         0];
right_camera_matrix = 1.0e+06 * [0.0020   -0.0001    0.0011    1.0010; -0.0001    0.0024    0.0003   -0.0237; 0.0011    0.0005    0.0007    0.5299];

left_img_points = [243.8 249.9853; 304.7 207.6324; 360.3 705.2794; 1875.7 885.2794; 1330.4 23.6618; 437.0 739.6912; 1296.0 39.5441; 1253.7 197.0441];
right_img_points = [484.7 132.1912 ; 528.4 101.7500 ; 598.5 486.8971 ; 1333.1 603.3676 ; 1273.5 19.6912 ; 667.3 509.3971 ; 1257.6 28.9559 ; 1243.1 126.8971 ];

fundamental_matrix = compute_fundamental_matrix(left_img_points, right_img_points);
figure;imagesc(left_img/255);axis('image');
[x, y] = ginput(1);
template_width = 50;
template_height = 50;
[match_x, match_y, points_on_line] = find_corresponding_point(x, y, left_img, right_img, fundamental_matrix, 21, 40);

figure;imagesc(right_img/255);axis('image');hold on;plot(points_on_line(:, 1), points_on_line(:, 2), 'b+');hold off;
pause;
close all;
figure; imagesc(left_img/255); axis('image'); hold on; rectangle('Position', [x-template_width/2 y-template_height/2 template_width template_height]); hold off;
figure; imagesc(right_img/255); title('matching point'); axis('image');hold on; rectangle('Position', [match_x-template_width/2 match_y-template_height/2 template_width template_height]);hold off;