% Used to load footage into variables
footage = 'fundamental_matrix/left_';
n = 99;

left = zeros(540, 960, 3, n);

% Load all images into a 4-D array
for i = 1:n
    left(:, :, :, i) = imresize(imread(sprintf('one obj/left_scene_%05d.png', i)), .5);
end
