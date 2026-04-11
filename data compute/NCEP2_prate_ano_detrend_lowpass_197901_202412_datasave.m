clc;
clear all;
close all;
file_name = 'G:/Data/NECP DOE Reanalysis 2/Precipation rate monthly/prate.sfc.mon.mean.nc';
ncdisp( file_name );
time  = ncread( file_name , 'time' );
prate = ncread( file_name , 'prate' );
lon   = ncread( file_name , 'lon' ); 
lat   = ncread( file_name , 'lat' );
time_start  = datenum( '1800-01-01 00:00:0.0' );
time = time_start + time/24;
time_first = datenum( '1979-01-01 00:00:0.0' );
time_last  = datenum( '2024-12-01 00:00:0.0' );
date = datevec( time );

time_first_index = find( time == time_first );
time_last_index  = find( time == time_last );

time_prate = time( time_first_index : time_last_index );

%%
prate            = double(prate);
prate            = prate( : , : , time_first_index : time_last_index );
prate_4D         = reshape( prate , [ 192 94 12 46 ] );
prate_month_climate  = squeeze( nanmean( prate_4D , 4 ) );
prate_ano_4D     = NaN( 192 , 94 , 12 , 46 );
for imonth = 1 : 12
    
    prate_ano_4D( : , : , imonth , : ) = prate_4D( : , : , imonth , : ) - prate_month_climate( : , : , imonth );
    
end
prate_ano_3D = reshape( prate_ano_4D , [ 192 94 552 ] );
%%
nlon  = size( prate_ano_3D , 1 );
nlat  = size( prate_ano_3D , 2 );
ntime = size( prate_ano_3D , 3 );
prate_ano_detrend = NaN( nlon , nlat , ntime );
for ilon = 1 : nlon
    for ilat = 1 : nlat
            
        prate_ano_detrend( ilon , ilat , : ) = detrend( squeeze( prate_ano_3D( ilon , ilat , : ) ) );
            
    end
end
%% Filter out high-frequency variations on timescales shorter than 1 year
prate_ano_detrend_filter = NaN( 192 , 94 , 552 );
fs = 1; % Sampling frequency: 1 per month
fc_low = 1 / 12; % 12 month
% Butterworth filter
order = 4; 
[ b , a ] = butter( order , fc_low / ( fs / 2 ) , 'low' ); % lowpass

for ilon = 1 : nlon
    for ilat = 1 : nlat
        prate_ano_detrend_filter( ilon , ilat  , : ) = filtfilt( b , a , squeeze( prate_ano_detrend( ilon , ilat , : ) ) );  
    end
end
% average 5S-5N
prate_equ_detrend_filter = squeeze( mean( prate_ano_detrend_filter( : , 45 : 50 , :  ) , 2 ) );

%%
lon_prate = lon;
datapath  = '../Data Store/NECP2_prate_ano_detrend_lowpass_197901_202412.mat';
save( datapath , 'lon_prate' , 'prate_equ_detrend_filter' , 'time_prate' );