clc;
clear all;
close all;
% Q = E + H + R
% E is latent 
% H is sensible
% R is the Top net energy minus Suf net energy
Sensible_file_address = 'G:\Data\NECP DOE Reanalysis 2\sensible Heat Net Flux\shtfl.sfc.mon.mean.nc';
ncdisp( Sensible_file_address )
time_sensible  = ncread( Sensible_file_address , 'time' );
sensible       = ncread( Sensible_file_address , 'shtfl' );
lon_sensible   = ncread( Sensible_file_address , 'lon' ); 
lat_sensible   = ncread( Sensible_file_address , 'lat' );
time_start     = datenum( '1800-01-01 00:00:0.0' );
time_sensible  = time_start + time_sensible/24;
time_first     = datenum( '1979-01-01 00:00:0.0' );
time_last    = datenum( '2024-12-01 00:00:0.0' );
date         = datevec( time_sensible );

time_first_index = find( time_sensible == time_first );
time_last_index  = find( time_sensible == time_last );
time_sensible    = time_sensible( time_first_index : time_last_index );
%%
lon_st = 0;
lat_st = -90;
lon_la = 360;
lat_la = 90;
id_lon = intersect( find( lon_sensible >= lon_st ) , find( lon_sensible <= lon_la ) );
id_lat = intersect( find( lat_sensible >= lat_st ) , find( lat_sensible <= lat_la ) );

lon_uwind = lon_sensible( id_lon );
lat_uwind = lat_sensible( id_lat );
sensible    = sensible( id_lon , id_lat , time_first_index : time_last_index );
sensible( sensible < -10000000 ) = NaN;
%%
datapath  = '../Data Store/NECP2_sensible_197901_202412.mat';
save( datapath , 'lon_sensible' , 'lat_sensible' , 'sensible' , 'time_sensible' );