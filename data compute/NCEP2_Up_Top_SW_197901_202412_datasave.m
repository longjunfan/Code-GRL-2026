clc;
clear all;
close all;
% Q = E + H + R
% E is latent 
% H is sensible
% R is the Top net energy minus Suf net energy
Up_Top_SW_file_address = 'G:\Data\NECP DOE Reanalysis 2\Upward Solar Radiation Flux\Top\uswrf.ntat.mon.mean.nc';
ncdisp( Up_Top_SW_file_address )
time_Up_Top_SW  = ncread( Up_Top_SW_file_address , 'time' );
Up_Top_SW       = ncread( Up_Top_SW_file_address , 'uswrf' );
lon_Up_Top_SW   = ncread( Up_Top_SW_file_address , 'lon' ); 
lat_Up_Top_SW   = ncread( Up_Top_SW_file_address , 'lat' );
time_start     = datenum( '1800-01-01 00:00:0.0' );
time_Up_Top_SW  = time_start + time_Up_Top_SW/24;
time_first     = datenum( '1979-01-01 00:00:0.0' );
time_last    = datenum( '2024-12-01 00:00:0.0' );
date         = datevec( time_Up_Top_SW );

time_first_index = find( time_Up_Top_SW == time_first );
time_last_index  = find( time_Up_Top_SW == time_last );
time_Up_Top_SW    = time_Up_Top_SW( time_first_index : time_last_index );
%%
lon_st = 0;
lat_st = -90;
lon_la = 360;
lat_la = 90;
id_lon = intersect( find( lon_Up_Top_SW >= lon_st ) , find( lon_Up_Top_SW <= lon_la ) );
id_lat = intersect( find( lat_Up_Top_SW >= lat_st ) , find( lat_Up_Top_SW <= lat_la ) );

lon_uwind = lon_Up_Top_SW( id_lon );
lat_uwind = lat_Up_Top_SW( id_lat );
Up_Top_SW    = Up_Top_SW( id_lon , id_lat , time_first_index : time_last_index );
Up_Top_SW( Up_Top_SW < -10000000 ) = NaN;
%%
datapath  = '../Data Store/NECP2_Up_Top_SW_197901_202412.mat';
save( datapath , 'lon_Up_Top_SW' , 'lat_Up_Top_SW' , 'Up_Top_SW' , 'time_Up_Top_SW' );