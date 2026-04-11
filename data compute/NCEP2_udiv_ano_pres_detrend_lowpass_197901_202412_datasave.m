clc;
clear all;
close all;
load( '../Data Store/NECP2_uv_div_chi_pres_197901_202412.mat' );
%%
u_div_5D           = reshape( u_div , [ 73 144 17 12 46 ] );
u_div_4D_month_cli = squeeze( nanmean( u_div_5D , 5 ) );
u_div_year_cli     = squeeze( nanmean( u_div_4D_month_cli , 4 ) );
u_div_5D_ano       = NaN( 73 , 144 , 17 , 12 , 46 );
for imonth = 1 : 12
     u_div_5D_ano( : , : , : , imonth , : ) = squeeze( u_div_5D( : , : , : , imonth , : ) ) - squeeze( u_div_4D_month_cli( : , : , : , imonth ) );
end
u_div_4D_ano  = reshape( u_div_5D_ano , [ 73 144 17 552 ] );
%%
nlon  = size( u_div_4D_ano , 2 );
nlat  = size( u_div_4D_ano , 1 );
nlev  = size( u_div_4D_ano , 3 );
ntime = size( u_div_4D_ano , 4 );
u_div_4D_ano_detrend = NaN( nlat , nlon , nlev , ntime );
for ilat = 1 : nlat
    for ilon = 1 : nlon
        for ilev = 1 : nlev
            
            u_div_4D_ano_detrend( ilat , ilon , ilev , : ) = detrend( squeeze( u_div_4D_ano( ilat , ilon , ilev , : ) ) );
            
        end
    end
end
clear ilat ilon ilev

%% 滤去1年内的高频信号
u_div_4D_ano_detrend_filter = NaN( 73 , 144 , 17 , 552 );
fs = 1; % Sampling frequency: 1 per month
fc_low = 1 / 12; % 12 month
% Butterworth filter
order = 4; 
[ b , a ] = butter( order , fc_low / ( fs / 2 ) , 'low' ); % lowpass

for ilat = 2 : nlat-1
    for ilon = 1 : nlon
        for ilev = 1 : nlev
            u_div_4D_ano_detrend_filter( ilat , ilon , ilev , : ) = filtfilt( b , a , squeeze( u_div_4D_ano_detrend( ilat , ilon , ilev , : ) ) );  
        end
    end
end
% average 5S-5N
u_div_ano_equ_detrend_filter = squeeze( nanmean( u_div_4D_ano_detrend_filter( 35 : 39 , : , : , : ) , 1 ) );

%%
datapath  = '../Data Store/NECP2_u_div_ano_pres_detrend_lowpass_197901_202412.mat';
save( datapath , 'u_div_ano_equ_detrend_filter' , 'u_div_year_cli' , 'lon' , 'lat' , 'lev' );