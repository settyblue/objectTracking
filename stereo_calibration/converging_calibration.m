%Auto-generated by stereoCalibrator app on 30-Nov-2016
%-------------------------------------------------------


%Define images to process
imageFileNames1 = {'/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00003.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00004.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00005.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00006.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00007.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00008.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00009.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00010.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00011.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00012.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00013.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00014.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00015.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00016.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00019.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00020.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00021.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00022.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00023.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00024.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00025.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00026.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00027.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00028.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00029.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00030.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00031.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00032.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00033.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00034.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00035.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00036.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00037.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00038.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00039.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00040.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00041.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00042.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00043.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/left_camera/converging/calibration-frames/frame00044.png',...
    };
imageFileNames2 = {'/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00003.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00004.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00005.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00006.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00007.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00008.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00009.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00010.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00011.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00012.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00013.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00014.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00015.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00016.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00019.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00020.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00021.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00022.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00023.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00024.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00025.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00026.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00027.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00028.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00029.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00030.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00031.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00032.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00033.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00034.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00035.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00036.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00037.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00038.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00039.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00040.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00041.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00042.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00043.png',...
    '/home/chandrasekar/Desktop/stereo-calibration/right_camera/converging/calibration-frames/frame00044.png',...
    };

%Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames1, imageFileNames2);

%Generate world coordinates of the checkerboard keypoints
squareSize = 25;  % in units of 'mm'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

%Calibrate the camera
[stereoParams, pairsUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'mm', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', []);

%View reprojection errors
h1=figure; showReprojectionErrors(stereoParams);

%Visualize pattern locations
h2=figure; showExtrinsics(stereoParams, 'CameraCentric');

%Display parameter estimation errors
displayErrors(estimationErrors, stereoParams);

%You can use the calibration data to rectify stereo images.
I1 = imread(imageFileNames1{1});
I2 = imread(imageFileNames2{1});
[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);

%See additional examples of how to use the calibration data.  At the prompt type:
showdemo('StereoCalibrationAndSceneReconstructionExample')
showdemo('DepthEstimationFromStereoVideoExample')
