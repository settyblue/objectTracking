N = 41;
intordouble = 1; 
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
if (intordouble == 0)
    figure,imagesc(Im_left(:,:,:,1)/255),hold on
else
    figure,image(Im_left(:,:,:,1)),hold on
end

rectangle('Position', [tracking_object_position 13 55], 'EdgeColor', 'r', 'LineWidth', 1);
hold off
model_features = get_features(Im_left(:,:,:,1),tracking_object_position(1,2),tracking_object_position(1,1),...
    tracking_object_position(1,2)+tracking_object_size(1,1)...
                , tracking_object_position(1,1)+tracking_object_size(1,2));
tracking_object_model = cov(model_features,1);
M = 2;
for i=2:M
    [~, min_row, min_col] = get_matching_patch(Im_left(:,:,:,i), tracking_object_size, tracking_object_model, tracking_object_position);
    
    if (intordouble == 0)
        figure,imagesc(Im_left(:,:,:,i)/255),hold on
    else
        figure,image(Im_left(:,:,:,i)),hold on
    end
    rectangle('Position', [min_col min_row 13 55], 'EdgeColor', 'r', 'LineWidth', 1);
    hold off
    tracking_object_position = [min_col min_row];
    [x_r, y_r, epipolar_lines] = find_corresponding_point(min_col+tracking_object_size(1,2)/2,min_row+tracking_object_size(1,1)/2,...
        Im_left(:,:,:,i),Im_right(:,:,:,i),fundamental_matrix,tracking_object_size(1,2),tracking_object_size(1,1));
    x_r
    y_r
    x_r = x_r - tracking_object_size(1,2)/2;
    y_r = y_r - tracking_object_size(1,1)/2;
    % get the depth of the object
    % update the depth of the object tracked for this frame.
    % get_depth(tracking_object_position, tracking_object_position_r, tracking_object_size);
    % update tracking object size based on depth.
    % update tracking object model based on depth.
    
    if (intordouble == 0)
        figure,imagesc(Im_right(:,:,:,i)/255),hold on;
    else
        figure,image(Im_right(:,:,:,i)),hold on;
    end
    plot(epipolar_lines(:, 1), epipolar_lines(:, 2), 'b+');hold off;
    rectangle('Position', [x_r y_r 13 55], 'EdgeColor', 'r', 'LineWidth', 1);
    
end


