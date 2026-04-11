clc;
clear all;
close all;
% Q = E + H + R
% E is latent 
% H is sensible
% R is the Top net energy minus Suf net energy
Down_Suf_LW_file_address = 'G:\Data\NECP DOE Reanalysis 2\Downward Longwave Radiation Flux\Suf\dlwrf.sfc.mon.mean.nc';
ncdisp( Down_Suf_LW_file_address )
time_Down_Suf_LW  = ncread( Down_Suf_LW_file_address , 'time' );
Down_Suf_LW       = ncread( Down_Suf_LW_file_address , 'dlwrf' );
lon_Down_Suf_LW   = ncread( Down_Suf_LW_file_address , 'lon' ); 
lat_Down_Suf_LW   = ncread( Down_Suf_LW_file_address , 'lat' );
time_start     = datenum( '1800-01-01 00:00:0.0' );
time_Down_Suf_LW  = time_start + time_Down_Suf_LW/24;
time_first     = datenum( '1979-01-01 00:00:0.0' );
time_last    = datenum( '2024-12-01 00:00:0.0' );
date         = datevec( time_Down_Suf_LW );

time_first_index = find( time_Down_Suf_LW == time_first );
time_last_index  = find( time_Down_Suf_LW == time_last );
time_Down_Suf_LW    = time_Down_Suf_LW( time_first_index : time_last_index );
%%
lon_st = 0;
lat_st = -90;
lon_la = 360;
lat_la = 90;
id_lon = intersect( find( lon_Down_Suf_LW >= lon_st ) , find( lon_Down_Suf_LW <= lon_la ) );
id_lat = intersect( find( lat_Down_Suf_LW >= lat_st ) , find( lat_Down_Suf_LW <= lat_la ) );

lon_uwind = lon_Down_Suf_LW( id_lon );
lat_uwind = lat_Down_Suf_LW( id_lat );
Down_Suf_LW    = Down_Suf_LW( id_lon , id_lat , time_first_index : time_last_index );
Down_Suf_LW( Down_Suf_LW < -10000000 ) = NaN;
%%
datapath  = '../Data Store/NECP2_Down_Suf_LW_197901_202412.mat';
save( datapath , 'lon_Down_Suf_LW' , 'lat_Down_Suf_LW' , 'Down_Suf_LW' , 'time_Down_Suf_LW' );