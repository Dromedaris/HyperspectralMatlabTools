clearvars, clc, close all

%% Example of the comparer app -

% This app let's you show the spectrum of a sample and compare to the
% corrected on. The comparer app has been the most used

% 1. Make shure you ran the setup_HSI_tools file
% 2. Navigate to the right path with Matlab, for example navigate to
% 'example measurements' (so that the working directory of matlab shows that path)
% 3. click on 'update file list'
% 4. select the measurment you want to see and click 'Load and correct
% image' (might take a few seconds, certainly with VNIR files)
% 5. click on the upper left image to see the original and corrected spectrum
% (you can soom in with the zoom tool, change pointer back to drag hand to
% clickon the image. The black dot on the lower image should show you the
% pixel you have sleected)

HSI_Comparer
%% Example of Palpator

% This app only looks at the original image, not the corrected one

HSI_Palpator

%% Example of Collector

% This app has been used to collect spectra, to createn an endmember
% average.

% 1. Make shure you ran the setup_HSI_tools file.
% 2. Navigate to the right path with Matlab, for example navigate to
% 'example measurements' (so that the working directory of matlab shows
% that path).
% 3. Click on 'update file list'.
% 4. Select the measurment you want to see and click 'Load and correct
% image' (might take a few seconds, certainly with VNIR files).
% 5. Insert the filename, e.g. collected_spectra_for_endmembers.
% 6. Push button 'Collect data' and click on the image. From each pixel that  
% you have clicked on, you collect the data.
% 7. Click again on 'collect data' and your spectra will be collected in
% with the filename you have entered (e.g. collected_spectra_for_endmembers.mat)

HSI_Collector

%% Example of some collected spectra
% simple example of HSI_Collector collected data.
load test.mat
plot(collected_spectra)



