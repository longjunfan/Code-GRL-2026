clc;
clear all;
close all;
TopFolder =  'H:/ERSSTv5';
file_name = [ TopFolder , '/' , 'sst.mnmean' , '.nc']; 
%%
time_ap   = datenum( '1800-01-01 00:00:0.0' );
lon       = ncread( file_name , 'lon' );
lat       = ncread( file_name , 'lat' );
sst       = ncread( file_name , 'sst' ); 
time      = ncread( file_name , 'time' );
time      = time + time_ap;
time_date = datevec( time );
sst( sst < -1000 ) = NaN;
%%
lon_st  = 0;
lat_st  = -90;
lon_la  = 360;
lat_la  = 90;
time_st = datenum( '1979-01-01 00:00:0.0' );
time_la = datenum( '2024-12-01 00:00:0.0' );
id_lon    = intersect( find( lon >= lon_st ) , find( lon <= lon_la ) );
id_lat    = intersect( find( lat >= lat_st ) , find( lat <= lat_la ) );
id_time   = intersect( find( time >= time_st ) , find( time <= time_la ) );
%%
sst       = sst( id_lon , id_lat , id_time );
sst       = double( sst );
time_sst  = time( id_time );
lon_sst   = lon( id_lon );
lat_sst   = lat( id_lat );

%% climatology compute 

nlon  = size( sst , 1 );
nlat  = size( sst , 2 );
ntim  = size( sst , 3 );
SST                = sst;
SST_4D             = reshape( SST , [ nlon nlat 12 ntim/12 ] );
SST_month_climate  = squeeze( nanmean( SST_4D , 4 ) );
SSTA            = NaN( nlon , nlat , 12 , ntim/12 );

for imonth = 1:12
    
    SSTA( : , : , imonth , : )  = SST_4D( : , : , imonth , : ) - SST_month_climate( : , : , imonth );  
    
end
SSTA_3D = reshape( SSTA , [ nlon nlat ntim ] );
%%
SSTA_3D_detrend = NaN( nlon , nlat , ntim );
for ilon = 1 : nlon
    for ilat = 1 : nlat
        if  ~isnan( mean( squeeze( SSTA_3D( ilon , ilat , : ) ) ) )
            SSTA_3D_detrend( ilon , ilat , : ) = detrend( squeeze( SSTA_3D( ilon , ilat , : ) ) );
        end           
    end
end
%% Filter out high-frequency variations on timescales shorter than 1 year

SSTA_3D_detrend_filter = NaN( nlon , nlat , ntim );
fs = 1; % Sampling frequency: 1 per month
fc_low = 1 / 12; % 12 month
% Butterworth filter
order = 4; 
[ b , a ] = butter( order , fc_low / ( fs / 2 ) , 'low' ); % lowpass

for ilon = 1 : nlon
    for ilat = 1 : nlat
        if  ~isnan( mean( squeeze( SSTA_3D_detrend( ilon , ilat , : ) ) ) )
            SSTA_3D_detrend_filter( ilon , ilat  , : ) = filtfilt( b , a , squeeze( SSTA_3D_detrend( ilon , ilat , : ) ) ); 
        end
    end
end

%%
store_path  = '../Data Store/ERSSTv5_SSTA_detrend_lowpass_197901_202412.mat';
save( store_path , 'lon_sst' , 'lat_sst', 'time_sst' , 'SSTA_3D_detrend' , 'SSTA_3D_detrend_filter' );