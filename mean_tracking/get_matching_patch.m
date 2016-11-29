function [ distance_matrix, min_row, min_col ] = get_matching_patch( I, patch_size, modelCovMatrix, tracking_object_position )
%GET_MATCHING_PATCH Summary of this function goes here
%   Detailed explanation goes here
    distance_matrix = zeros(50,50);
    start_row = tracking_object_position(1,2) - 25;
    start_col = tracking_object_position(1,1) - 25;
    end_row = tracking_object_position(1,2) + 24;
    end_col = tracking_object_position(1,1) + 24;
    for origin_row=start_row:end_row
        for origin_col=start_col:end_col
            patch_features = get_features(I,origin_row,origin_col,origin_row+patch_size(1,1)...
                , origin_col+patch_size(1,2));
            covariance_matrix = cov(patch_features,1);
            distance_matrix(origin_row-start_row+1, origin_col-start_col+1) = riemannian_distance(...
                covariance_matrix, modelCovMatrix);
        end
    end
    [min_col_values, min_row] = min(distance_matrix);
    [~, min_col] = min(min_col_values);
    min_row = min_row(min_col);
    min_col = min_col + start_col;
    min_row = min_row + start_row;
end

