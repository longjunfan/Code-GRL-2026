clc;
clear all;
close all;
% Q = E + H + R
% E is latent 
% H is sensible
% R is the Top net energy minus Suf net energy
Up_Suf_LW_file_address = 'G:\Data\NECP DOE Reanalysis 2\Upward Longwave Radiation Flux\Suf\ulwrf.sfc.mon.mean.nc';
ncdisp( Up_Suf_LW_file_address )
time_Up_Suf_LW  = ncread( Up_Suf_LW_file_address , 'time' );
Up_Suf_LW       = ncread( Up_Suf_LW_file_address , 'ulwrf' );
lon_Up_Suf_LW   = ncread( Up_Suf_LW_file_address , 'lon' ); 
lat_Up_Suf_LW   = ncread( Up_Suf_LW_file_address , 'lat' );
time_start     = datenum( '1800-01-01 00:00:0.0' );
time_Up_Suf_LW  = time_start + time_Up_Suf_LW/24;
time_first     = datenum( '1979-01-01 00:00:0.0' );
time_last    = datenum( '2024-12-01 00:00:0.0' );
date         = datevec( time_Up_Suf_LW );

time_first_index = find( time_Up_Suf_LW == time_first );
time_last_index  = find( time_Up_Suf_LW == time_last );
time_Up_Suf_LW    = time_Up_Suf_LW( time_first_index : time_last_index );
%%
lon_st = 0;
lat_st = -90;
lon_la = 360;
lat_la = 90;
id_lon = intersect( find( lon_Up_Suf_LW >= lon_st ) , find( lon_Up_Suf_LW <= lon_la ) );
id_lat = intersect( find( lat_Up_Suf_LW >= lat_st ) , find( lat_Up_Suf_LW <= lat_la ) );

lon_uwind = lon_Up_Suf_LW( id_lon );
lat_uwind = lat_Up_Suf_LW( id_lat );
Up_Suf_LW    = Up_Suf_LW( id_lon , id_lat , time_first_index : time_last_index );
Up_Suf_LW( Up_Suf_LW < -10000000 ) = NaN;
%%
datapath  = '../Data Store/NECP2_Up_Suf_LW_197901_202412.mat';
save( datapath , 'lon_Up_Suf_LW' , 'lat_Up_Suf_LW' , 'Up_Suf_LW' , 'time_Up_Suf_LW' );