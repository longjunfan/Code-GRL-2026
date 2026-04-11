%%
clc;
clear all;
close all;

file_name =  'G:/Data/NECP DOE Reanalysis 2/Omega monthly/omega.mon.mean.nc';
ncdisp( file_name );

lon   = ncread( file_name , 'lon' );
lat   = ncread( file_name , 'lat' );
lev   = ncread( file_name , 'level' );
time  = ncread( file_name , 'time' );
omega = ncread( file_name , 'omega' );
time_start  = datenum( '1800-01-01 00:00:0.0' );
time = time_start + time/24;
time_first = datenum( '1979-01-01 00:00:0.0' );
time_last  = datenum( '2024-12-01 00:00:0.0' );
date = datevec( time );
time_first_index = find( time == time_first );
time_last_index  = find( time == time_last );
time_omega = time( time_first_index : time_last_index );
omega            = double(omega);
omega            = omega( : , : , : , time_first_index : time_last_index );

%%
nlon = size( omega , 1 );
nlat = size( omega , 2 );
nlev = size( omega , 3 );
ntim = size( omega , 4 );
omega_5D         = reshape( omega , [ nlon nlat nlev 12 ntim/12 ] );
omega_month_climate  = squeeze( nanmean( omega_5D , 5 ) );
omega_ano_5D     = NaN( nlon , nlat , nlev , 12 , ntim/12 );
for imonth = 1 : 12
    
    omega_ano_5D( : , : , : , imonth , : ) = omega_5D( : , : , : , imonth , : ) - omega_month_climate( : , : , : , imonth );
    
end
omega_ano_4D = reshape( omega_ano_5D , [  nlon nlat nlev ntim ] );
omega_ano_4_600hpa     = squeeze( mean( omega_ano_4D( : , : , 4 : 6 , : ) , 3 ) );
%%
omega_4_600hpa_ano_detrend = NaN( nlon , nlat , ntim );
for ilon = 1 : nlon
    for ilat = 1 : nlat
            
        omega_4_600hpa_ano_detrend( ilon , ilat , : ) = detrend( squeeze( omega_ano_4_600hpa( ilon , ilat , : ) ) );
            
    end
end
%% Filter out high-frequency variations on timescales shorter than 1 year
omega_ano_4_600hpa_detrend_filter = NaN( 144 , 73 , 552 );
fs = 1; % Sampling frequency: 1 per month
fc_low = 1 / 12; % 12 month
% Butterworth filter
order = 4; 
[ b , a ] = butter( order , fc_low / ( fs / 2 ) , 'low' ); % lowpass

for ilon = 1 : nlon
    for ilat = 1 : nlat
        omega_ano_4_600hpa_detrend_filter( ilon , ilat  , : ) = filtfilt( b , a , squeeze( omega_4_600hpa_ano_detrend( ilon , ilat , : ) ) );  
    end
end
% average 5S-5N
omega_equ_ano_4_600hpa_detrend_filter = squeeze( nanmean( omega_ano_4_600hpa_detrend_filter( : , 35 : 39 , :  ) , 2 ) ); 

%%
store_path  = '../Data Store/NECP2_omega_ano_detrend_lowpass_197901_202412.mat';
save( store_path , 'lon' , 'time_omega' , 'omega_equ_ano_4_600hpa_detrend_filter' );