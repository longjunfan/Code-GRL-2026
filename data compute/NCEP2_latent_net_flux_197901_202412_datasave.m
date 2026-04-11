clc;
clear all;
close all;
% Q = E + H + R
% E is latent 
% H is sensible
% R is the Top net energy minus Suf net energy
Latent_file_address = 'G:\Data\NECP DOE Reanalysis 2\Latent Heat Net Flux\lhtfl.sfc.mon.mean.nc';
ncdisp( Latent_file_address )
time_latent  = ncread( Latent_file_address , 'time' );
latent       = ncread( Latent_file_address , 'lhtfl' );
lon_latent       = ncread( Latent_file_address , 'lon' ); 
lat_latent   = ncread( Latent_file_address , 'lat' );
time_start   = datenum( '1800-01-01 00:00:0.0' );
time_latent  = time_start + time_latent/24;
time_first   = datenum( '1979-01-01 00:00:0.0' );
time_last    = datenum( '2024-12-01 00:00:0.0' );
date         = datevec( time_latent );

time_first_index = find( time_latent == time_first );
time_last_index  = find( time_latent == time_last );
time_latent      = time_latent( time_first_index : time_last_index );
%%
lon_st = 0;
lat_st = -90;
lon_la = 360;
lat_la = 90;
id_lon = intersect( find( lon_latent >= lon_st ) , find( lon_latent <= lon_la ) );
id_lat = intersect( find( lat_latent >= lat_st ) , find( lat_latent <= lat_la ) );

lon_uwind = lon_latent( id_lon );
lat_uwind = lat_latent( id_lat );
latent    = latent( id_lon , id_lat , time_first_index : time_last_index );
latent( latent < -10000000 ) = NaN;
%%
datapath  = '../Data Store/NECP2_latent_197901_202412.mat';
save( datapath , 'lon_latent' , 'lat_latent' , 'latent' , 'time_latent' );