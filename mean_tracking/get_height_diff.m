function [ incr_height ] = get_height_diff( init_depth, final_depth )
%GET_HEIGHT_DIFF Summary of this function goes here
%   Detailed explanation goes here
%     f = 0.03; % focal length of the camera
%     x = 1; %height of the object above the normal.
%     k = f*x;
    
    k = 10000/2;
    incr_height = k*(init_depth - final_depth)/(init_depth * final_depth);  

end

