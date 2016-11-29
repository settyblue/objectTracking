N = 41;
for i=1:N
    filename = sprintf('input/left_camera_images/scene%03d.jpg', i);
    Im(:,:,:,i) = uint8(imread(filename));
end

% postions to be tracked : 
% [600 415 13 55]
% [520 400 13 55]
% [980 410 13 55]
% [405 400 13 55]
% [370 385 13 55]
tracking_object_position = [600 415];
tracking_object_size = [55 13];
figure,image(Im(:,:,:,1)),hold on
rectangle('Position', [tracking_object_position 13 55], 'EdgeColor', 'r', 'LineWidth', 1);
hold off
model_features = get_features(Im(:,:,:,1),tracking_object_position(1,2),tracking_object_position(1,1),...
    tracking_object_position(1,2)+tracking_object_size(1,1)...
                , tracking_object_position(1,1)+tracking_object_size(1,2));
tracking_object_model = cov(model_features,1);

for i=2:N
    [~, min_row, min_col] = get_matching_patch(Im(:,:,:,i), tracking_object_size, tracking_object_model, tracking_object_position);
    figure,image(Im(:,:,:,i)),hold on
    rectangle('Position', [min_col min_row 13 55], 'EdgeColor', 'r', 'LineWidth', 1);
    hold off
    tracking_object_position = [min_col min_row];
end