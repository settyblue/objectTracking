function [ distance_matrix, min_row, min_col, should_update_model ] = get_matching_patch( I, patch_size, modelCovMatrix, tracking_object_position )
%GET_MATCHING_PATCH Summary of this function goes here
%   Detailed explanation goes here
    distance_matrix = zeros(100,100);
    start_row = tracking_object_position(1,2) - 50;
    start_col = tracking_object_position(1,1) - 50;
    end_row = tracking_object_position(1,2) + 49;
    end_col = tracking_object_position(1,1) + 49;
    for origin_row=start_row:end_row
        for origin_col=start_col:end_col
            patch_features = get_features(I,origin_row,origin_col,origin_row+patch_size(1,1)...
                , origin_col+patch_size(1,2));
            covariance_matrix = cov(patch_features,1);
            distance_matrix(origin_row-start_row+1, origin_col-start_col+1) = riemannian_distance(...
                covariance_matrix, modelCovMatrix);
        end
    end
    [min_row, min_col] = ind2sub(size(distance_matrix), find(distance_matrix(:) == min(distance_matrix(:))));
    cov_dist = distance_matrix(min_row, min_col);
    should_update_model = 1;
    if cov_dist >= 0.6 
        should_update_model = 0;
    end
    fprintf('cov_distan: %g\n', cov_dist);
    min_col = min_col + start_col;
    min_row = min_row + start_row;
end

