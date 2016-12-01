function [ depth ] = get_depth( tracking_position, tracking_object_position_r, tracking_object_size, middle_column )
%GET_DEPTH Summary of this function goes here
%   Detailed explanation goes here
    % tracking_point_row =  tracking_position(1,2) + tracking_object_size(1,2)/2;
    % object center is passed here.
    % middle_column = 512;
    xl =  tracking_position(1,1) - middle_column;
    xr =  tracking_object_position_r(1,1) - middle_column;
    k = 1000.0;
    offset = 35;
    simple_depth = k/(xl-xr)+ offset;
    depth = simple_depth;
    
%     theta = 80;
%     fl = 0.03; % focal_length left camera
%     fr = 0.03; % focal_length right camera
%     f = fr;
%     T = 0.1; %distance between the camera
%     xld = fl*xl/sqrt(fl*fl + xl*xl)/(sind(theta - atand(xl/fl)));
%     xrd = fr*xr/sqrt(fr*fr + xr*xr)/(sind(theta - atand(xr/fr)));
%     
%     complex_depth = f*(sind(theta))*(T-2*f*cosd(theta)-xld-xlr)/(2*f*cosd(theta)+xld+xlr) + f*sind(theta);
%     depth = complex_depth;
end

