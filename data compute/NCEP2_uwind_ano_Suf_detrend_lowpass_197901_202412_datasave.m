%%
clc;
clear all;
close all;
uwin_10_address = 'G:\Data\NECP DOE Reanalysis 2\Uwind monthly 10m\uwnd.10m.mon.mean.nc';

u_time  = ncread( uwin_10_address , 'time' );
uwind = ncread( uwin_10_address , 'uwnd' );
u_lon   = ncread( uwin_10_address , 'lon' ); 
u_lat   = ncread( uwin_10_address , 'lat' );
time_start  = datenum( '1800-01-01 00:00:0.0' );
u_time = time_start + u_time/24;
time_first = datenum( '1979-01-01 00:00:0.0' );
time_last  = datenum( '2024-12-01 00:00:0.0' );
u_date = datevec( u_time );

u_time_first_index = find( u_time == time_first );
u_time_last_index  = find( u_time == time_last );
time_uwind = u_time( u_time_first_index : u_time_last_index );

uwind     = squeeze( uwind( : , : , : , u_time_first_index : u_time_last_index ) ); 
uwind( uwind < -1000 ) = NaN;

%% climatology compute 
nlon = size( uwind , 1 );
nlat = size( uwind , 2 );
ntim = size( uwind , 3 );

uwind_4D = reshape( uwind , [ nlon nlat 12 ntim/12 ] );
uwind_month_climate  = squeeze( nanmean( uwind , 4 ) );
uwind_ano            = NaN( nlon , nlat , 12 , ntim/12 );

for imonth = 1:12
    
    uwind_ano( : , : , imonth , : )  = uwind_4D( : , : , imonth , : ) - uwind_month_climate( : , : , imonth );  
    
end
uwind_ano_3D = reshape( uwind_ano , [ nlon nlat ntim ] );
%% detrend
uwind_ano_3D_detrend = NaN( nlon , nlat , ntim );
for ilon = 1 : nlon
    for ilat = 1 : nlat
        uwind_ano_3D_detrend( ilon , ilat , : ) = detrend( squeeze( uwind_ano_3D( ilon , ilat , : ) ) );
    end
end
%% Filter out high-frequency variations on timescales shorter than 1 year

uwind_ano_3D_Suf_detrend_filter = NaN( nlon , nlat , ntim );
fs = 1; % Sampling frequency: 1 per month
fc_low = 1 / 12; % 12 month
% Butterworth filter
order = 4; 
[ b , a ] = butter( order , fc_low / ( fs / 2 ) , 'low' ); % lowpass

for ilon = 1 : nlon
    for ilat = 1 : nlat

        uwind_ano_3D_Suf_detrend_filter( ilon , ilat  , : ) = filtfilt( b , a , squeeze( uwind_ano_3D_detrend( ilon , ilat , : ) ) ); 

    end
end

%%
store_path  = '../Data Store/NECP2_uwind_ano_Suf_detrend_lowpass_197901_202412.mat';
save( store_path , 'u_lon' , 'u_lat', 'time_uwind' , 'uwind_ano_3D' ,  'uwind_ano_3D_Suf_detrend_filter' );