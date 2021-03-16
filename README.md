# HFR_Harvest_plot
This is a R script used to download the High-frequent Radar data for Santa Barbara Channel. The example shown in the script is to download the monthly 2 km resolution netcdf file from the thredd server. The data can be found here: https://hfrnet-tds.ucsd.edu/thredds/HFRADAR_USWC.html. If you like to download other resolution (e.g. hourly), you will need to modify the download path based on the dataset you select. 

The script has complished a few tasks: harvest HFR data in netcdf format, download a local map, read the netcdf file, subset the data for a given time point, and plot the velocity arrows on the map. 
