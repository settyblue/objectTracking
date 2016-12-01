function [world_x, world_y, world_z] = compute_world_point (camera_1_matrix, camera_2_matrix, camera_1_point, camera_2_point)
    A = [camera_1_matrix(1, 1:3) - camera_1_matrix(3, 1:3) * camera_1_point(1, 1) ;...
        camera_1_matrix(2, 1:3) - camera_1_matrix(3, 1:3) * camera_1_point(1, 2) ;...
        camera_2_matrix(1, 1:3) - camera_2_matrix(3, 1:3) * camera_2_point(1, 1)
%         camera_2_matrix(2, 1:3) - camera_2_matrix(3, 1:3) * camera_2_point(1, 2) camera_2_matrix(2, 4) - camera_2_point(1,2); ...
        ];
    B = -[camera_1_matrix(1, 4) - camera_1_point(1,1); camera_1_matrix(2, 4) - camera_1_point(1,2);  camera_2_matrix(1, 4) - camera_2_point(1,1)];
%     syms x_ y_ z_;
    sol = linsolve(A, B);
%     sol = solve((A * [x_; y_; z_; 1]) == 0, [x_ y_ z_]);
    disp(sol);
%     world_x = sol.x_;
%     world_y = sol.y_;
%     world_z = sol.z_;
end