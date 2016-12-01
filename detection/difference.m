function [diff] = difference(im, bg)
    d = -abs(abs(rgb2hsv(im) - rgb2hsv(bg)) -.5) + .5;
    diff = d(:,:,1)*256;
end

