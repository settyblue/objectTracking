function [score] = ncc_score(template, search_region)
    score = 0;
    [t_height, t_width, ~] = size(template);
    for j=1:size(template, 3)
        template_color = double(template(:, :, j));
        search_region_color = double(search_region(:, :, j));
        template_avg = mean(template_color(:));
        search_region_avg = mean(search_region_color(:));
        diff_from_avg = (search_region_color - search_region_avg);
        diff_from_avg_2 = (template_color - template_avg);
        std_template = std(double(template_color(:)));
        std_search = std(double(search_region_color(:)));
        total = sum(sum((diff_from_avg .* diff_from_avg_2)/(std_search * std_template)));
        num_pixels = (t_height*t_width - 1);
        score = score + total/num_pixels;
    end
end