clear;clc;close all;
mkdir output;
N = 41;
intordouble = 0; 
update_model = 1;
update_template_size = 1;
left_print_on = 1;
right_print_on = 0;
do_distance_correction = 1;
depth = zeros(N,1);
obj_position_left = zeros(N,2);
obj_position_right = zeros(N,2);
for i=1:N
    filename = sprintf('input/left_camera_images/scene%03d.jpg', i);
    %Im_left(:,:,:,i) = uint8(imread(filename));
    if (intordouble == 0)
        Im_left(:,:,:,i) = double(imread(filename));
    else
        Im_left(:,:,:,i) = uint8(imread(filename));
    end
end

for i=1:N
    filename = sprintf('input/right_camera_images/scene%03d.jpg', i);
    %Im_right(:,:,:,i) = uint8(imread(filename));
    if (intordouble == 0)
        Im_right(:,:,:,i) = double(imread(filename));
    else
        Im_right(:,:,:,i) = uint8(imread(filename));
    end
end

left_img_points = [981 799 ;749 752 ;470 381 ;1173 720 ;1001 627 ;655 210 ;609 214 ;788 585];
right_img_points = [1014 816 ; 794 747 ; 623 313 ; 1447 721 ; 1250 601 ; 892 116 ; 846 121 ; 1011 552 ];
fundamental_matrix = compute_fundamental_matrix(left_img_points, right_img_points);

% postions to be tracked : 
% [600 415 13 55]
% [520 400 13 55]
% [980 410 13 55]
% [405 400 13 55]
% [370 385 13 55]
tracking_object_position = [600 415];
tracking_object_size = [55 13];
% if (intordouble == 0)
%     figure,imagesc(Im_left(:,:,:,1)/255),hold on
% else
%     figure,image(Im_left(:,:,:,1)),hold on
% end
% rectangle('Position', [tracking_object_position tracking_object_size(1,2) tracking_object_size(1,1)], 'EdgeColor', 'r', 'LineWidth', 1);
% hold off
model_features = get_features(Im_left(:,:,:,1),tracking_object_position(1,2),tracking_object_position(1,1),...
    tracking_object_position(1,2)+tracking_object_size(1,1)...
                , tracking_object_position(1,1)+tracking_object_size(1,2));
tracking_object_model = cov(model_features,1);
first_frame_model = model_features;
first_fram_cov = tracking_object_model;
M = 40;
for i=2:M
    fprintf('\n\nFrame number: %d\n', i);
    [~, min_row, min_col, should_update_model] = get_matching_patch(Im_left(:,:,:,i), tracking_object_size, tracking_object_model, tracking_object_position);
    if left_print_on == 1
        if (intordouble == 0)
            figure,imagesc(Im_left(:,:,:,i)/255),hold on;title(sprintf('Left Frame %d', i));axis('image');
        else
            figure,image(Im_left(:,:,:,i)),hold on
        end
        rectangle('Position', [min_col min_row tracking_object_size(1,2) tracking_object_size(1,1)], 'EdgeColor', 'r', 'LineWidth', 1);
        save_current_frame(sprintf('output/left-frame%d.png', i));
        hold off
    end
    tracking_object_position = [min_col min_row];
    cent_x = min_col+tracking_object_size(1,2)/2;
    cent_y = min_row+tracking_object_size(1,1)/2;
    obj_position_left(i,:) = [cent_x cent_y] ;
    if i == 2
        [x_r, y_r, epipolar_lines] = find_corresponding_point(cent_x,cent_y,...
            Im_left(:,:,:,i),Im_right(:,:,:,i),fundamental_matrix,tracking_object_size(1,2),tracking_object_size(1,1) ...
            ,0, obj_position_right(i-1,:));
    else
        [x_r, y_r, epipolar_lines] = find_corresponding_point(cent_x,cent_y,...
            Im_left(:,:,:,i),Im_right(:,:,:,i),fundamental_matrix,tracking_object_size(1,2),tracking_object_size(1,1) ...
            ,do_distance_correction, obj_position_right(i-1,:));
    end
    x_r = x_r - tracking_object_size(1,2)/2;
    y_r = y_r - tracking_object_size(1,1)/2;
    obj_position_right(i,:) = [x_r y_r] ;
    % get the depth of the object
    % update the depth of the object tracked for this frame.
    depth(i,1) = get_depth(obj_position_left(i,:), obj_position_right(i,:), tracking_object_size, 512);
    disp([i depth(i,1)]);
    if i > 2
        height_diff = get_height_diff(depth(i-1,1), depth(i,1));
        if update_template_size == 1 && height_diff > 0 
            if(height_diff > 2)
                height_diff = 2;
            end
            tracking_object_size(1,1) = tracking_object_size(1,1) + floor(height_diff)*3;
            tracking_object_size(1,2) = tracking_object_size(1,2) + floor(height_diff)*1;
        end
        disp([i height_diff tracking_object_size]);
    end
    
    % update tracking object size based on depth.
    if update_model == 1
        if should_update_model == 1 
            model_features = get_features(Im_left(:,:,:,i),tracking_object_position(1,2),tracking_object_position(1,1),...
            tracking_object_position(1,2)+tracking_object_size(1,1)...
                        , tracking_object_position(1,1)+tracking_object_size(1,2));
            tracking_object_model = cov(model_features,1);
        else
            tracking_object_model = first_fram_cov;
        end
    end
    if right_print_on == 1
        if (intordouble == 0)
            figure,imagesc(Im_right(:,:,:,i)/255),hold on;title(sprintf('Right Frame %d', i));axis('image');
        else
            figure,image(Im_right(:,:,:,i)),hold on;
        end
    %     plot(epipolar_lines(:, 1), epipolar_lines(:, 2), 'b+');
        rectangle('Position', [x_r y_r tracking_object_size(1,2) tracking_object_size(1,1)], 'EdgeColor', 'r', 'LineWidth', 1);hold off;
        save_current_frame(sprintf('output/left-frame%d.png', i));
    end
end
