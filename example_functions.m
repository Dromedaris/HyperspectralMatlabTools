clearvars, clc, close

%% Example of reading in files
% assuming the measurments are in the path or working directory of Matlab

[HSI, lambda, nx, ny, nb] = HSI_reader('cross2_corrected');
HSI_c = HSI_read_and_correct('cross2_corrected');

subplot(121)
average_HSI = HSI_wavelength_average(HSI);
HSI_plot_frame(average_HSI)
title('original')

subplot(122)
average_HSI_c = HSI_wavelength_average(HSI_c);
HSI_plot_frame(average_HSI_c)
title('corrected - cubic')