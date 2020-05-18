# HyperspectralMatlabTools
Tools for reading, correcting and inspecting hyperspectral images made from IMEC snapscan hyperspectral cameras.

Code written in Matlab 2019b (some features in the applications require this version!).

How to use:

* run `setup_HSI.m` from . This ensures that MATLAB knows where to find all the functions and applicatins. 

* For using the HSI functions: make shure Matlab can find the measurements, either by having your 'Matlab current folder' set to the right directory or by adding it to the path (in Matlab GUI:Home -- Set Path; or via the console command `addpath(stringcontainingfolderpath)`) 

* For using the HSI applications: In order to list the measurements in the apps, navigate your Matlab current folder to the propper folder and click 'update file list' to have all files 


Checkout the example files (`example_*.m`) for a few easy examples.

