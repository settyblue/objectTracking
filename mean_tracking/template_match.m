function [best_match_point] = template_match(search_img, template, center_points, do_distance_correction, previous_position) 
    [template_height, template_width, ~] = size(template);
    [img_height, img_width, ~] = size(search_img);
    scores = zeros(size(center_points, 1), 1);
    for i=1:size(center_points, 1)
        center_x = center_points(i, 1);
        center_y = center_points(i, 2);
        left_x = center_x - floor(template_width/2) + 1;
        right_x = center_x + ceil(template_width/2);
        top_y = center_y - floor(template_height/2) + 1;
        bottom_y = center_y + ceil(template_height/2);
        if right_x > img_width || bottom_y > img_height || left_x < 1 || top_y < 1
            scores(i) = Inf;
        else
            matching_region = search_img(top_y:bottom_y, left_x:right_x, :);
            scores(i) = ssd_score(template, matching_region);
        end
    end
    matches = find(scores == min(scores));
    best_match_point = center_points(matches(1), :);
    if do_distance_correction == 1
        if(abs(best_match_point(1,1) - previous_position(1,1)) > 100 || ...
            abs(best_match_point(1,2) - previous_position(1,2)) > 100 )
            best_match_point = previous_position;
        end
    end
end