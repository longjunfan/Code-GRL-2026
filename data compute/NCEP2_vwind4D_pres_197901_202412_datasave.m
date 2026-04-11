%% save data of NECP2 vwind 1979-2024
clc;
clear all;
close all;
file_address = 'G:/Data/NECP DOE Reanalysis 2/Vwind monthly pressure level/vwnd.mon.mean.nc';
%%
time  = ncread( file_address , 'time' );
vwind = ncread( file_address , 'vwnd' );
lon   = ncread( file_address , 'lon' ); 
lat   = ncread( file_address , 'lat' );
lev   = ncread( file_address , 'level' );
time_start  = datenum( '1800-01-01 00:00:0.0' );
time = time_start + time/24;
time_first = datenum( '1979-01-01 00:00:0.0' );
time_last  = datenum( '2024-12-01 00:00:0.0' );
date = datevec( time );
time_first_index = find( time == time_first );
time_last_index  = find( time == time_last );

time_vwind = time( time_first_index : time_last_index );
%%
lon_st = 0;
lat_st = -90;
lon_la = 360;
lat_la = 90;
id_lon = intersect( find( lon >= lon_st ) , find( lon <= lon_la ) );
id_lat = intersect( find( lat >= lat_st ) , find( lat <= lat_la ) );


lon_vwind = lon( id_lon );
lat_vwind = lat( id_lat );
lev_vwind = lev;
vwind     = vwind( id_lon , id_lat , : , time_first_index : time_last_index );
vwind( vwind < -1000 ) = NaN;
%%
datapath  = '../Data Store/NECP2_vwind4D_pres_197901_202412.mat';
save( datapath , 'lon_vwind' , 'lat_vwind' , 'lev_vwind' , 'vwind' , 'time_vwind' );