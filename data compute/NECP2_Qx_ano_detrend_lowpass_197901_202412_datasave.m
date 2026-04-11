clc;
clear all;
close all;
load( '../Data Store/NECP2_chi_Qx_Qy_197901_202412.mat' );

%%
chi_4D   = reshape( chi_all , [ 94 192 12 46 ] );
Qx_4D    = reshape( Qx_div  , [ 94 192 12 46 ] );
chi_3D_month_cli = squeeze( nanmean( chi_4D , 4 ) );
Qx_3D_month_cli  = squeeze( nanmean( Qx_4D  , 4 ) );

chi_ano_4D = NaN( 94 , 192 , 12 , 46 );
Qx_ano_4D  = NaN( 94 , 192 , 12 , 46 );  

for imonth = 1 : 12

     chi_ano_4D( : , : , imonth , : ) = squeeze( chi_4D( : , : , imonth , : ) ) - squeeze( chi_3D_month_cli( : , : , imonth ) );
     Qx_ano_4D(  : , : , imonth , : ) = squeeze( Qx_4D(  : , : , imonth , : ) ) - squeeze( Qx_3D_month_cli( : , : , imonth ) );
     
end
chi_ano_3D  = reshape( chi_ano_4D , [ 94 192 552 ] );
Qx_ano_3D   = reshape( Qx_ano_4D ,  [ 94 192 552 ] );
%%
nlat  = size( chi_ano_3D , 1 );
nlon  = size( chi_ano_3D , 2 );
ntime = size( chi_ano_3D , 3 );

chi_ano_3D_detrend = NaN( 94 , 192 , 552 );
Qx_ano_3D_detrend  = NaN( 94 , 192 , 552 );

for ilat = 1 : nlat
    for ilon = 1 : nlon
        if isnan( mean(  squeeze( chi_ano_3D( ilat , ilon , : ) ) ))
            chi_ano_3D_detrend( ilat , ilon  , : ) = NaN;
        else
            chi_ano_3D_detrend( ilat , ilon  , : ) = detrend( squeeze( chi_ano_3D( ilat , ilon , : ) ) );            
        end
        
        if isnan( mean(  squeeze( Qx_ano_3D( ilat , ilon , : ) ) ))
            Qx_ano_3D_detrend( ilat , ilon  , : ) = NaN;
        else
            Qx_ano_3D_detrend( ilat , ilon  , : ) = detrend( squeeze( Qx_ano_3D( ilat , ilon , : ) ) );            
        end
        
    end
end
clear ilat ilon
%% 滤去1年内的高频信号
chi_ano_3D_detrend_filter = NaN( 94 , 192 , 552 );
Qx_ano_3D_detrend_filter  = NaN( 94 , 192 , 552 );
fs = 1; % Sampling frequency: 1 per month
fc_low = 1 / 12; % 12 month
% Butterworth filter
order = 4; 
[ b , a ] = butter( order , fc_low / ( fs / 2 ) , 'low' ); % lowpass

for ilat = 1 : nlat
    for ilon = 1 : nlon
        if  isnan( mean(  squeeze( chi_ano_3D_detrend( ilat , ilon , : ) ) ))
            chi_ano_3D_detrend_filter( ilat , ilon  , : ) = NaN;
        else
            chi_ano_3D_detrend_filter( ilat , ilon  , : ) = filtfilt( b , a , squeeze( chi_ano_3D_detrend( ilat , ilon , : ) ) );  
        end
        
        if  isnan( mean(  squeeze( Qx_ano_3D_detrend( ilat , ilon , : ) ) ))
            Qx_ano_3D_detrend_filter( ilat , ilon  , : ) = NaN;
        else
            Qx_ano_3D_detrend_filter( ilat , ilon  , : ) = filtfilt( b , a , squeeze( Qx_ano_3D_detrend( ilat , ilon , : ) ) );  
        end
    end
end
% average
Qx_ano_equ_detrend_filter  = squeeze( nanmean( Qx_ano_3D_detrend_filter( 45 : 50 , : , : ) , 1 ) );

%%
datapath  = '../Data Store/NECP2_Qx_ano_detrend_lowpass_197901_202412.mat';
save( datapath ,  'Qx_ano_3D_detrend_filter' , 'Qx_ano_equ_detrend_filter' ,...
                  'lon_used' , 'lat_used' );
             
