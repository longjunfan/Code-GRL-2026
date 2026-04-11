%% Calculate the mass streamfunction
clc;
clear all;
close all;
load( '../Data Store/NECP2_uv_div_chi_pres_197901_202412.mat' );
%%
u_div_5D           = reshape( u_div , [ 73 144 17 12 46 ] );
u_div_4D_month_cli = squeeze( nanmean( u_div_5D , 5 ) );
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
%% Filter out high-frequency variations on timescales shorter than 1 year
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
g   = 9.80616; % Gravitational acceleration (m/s²)
a   = 6.37122e6; % Radius of the Earth
pi  = 3.14159265;
con = ( 1 * pi * a ) / ( g * 18 );
%
u_div_ano_equ_change = zeros( 144 , 18 , 552  );
u_div_ano_equ_change( : , 1 : 17 , : ) = u_div_ano_equ_detrend_filter;
u_psi_ano_down_detrend_filter = zeros( 144 , 18 , 552 );
level_change = [ lev ; 0 ];
for itime = 1 : 552
    for ilon = 1 : 144
        for i_down = 17 : -1 : 1 
            pressure = level_change( i_down ) - level_change( i_down + 1 );
            psi_temp = pressure .* 100 .* con .* ...
                ( ( u_div_ano_equ_change( ilon , i_down , itime ) + u_div_ano_equ_change( ilon , i_down + 1 , itime ) ) ./ 2 );
            u_psi_ano_down_detrend_filter( ilon , i_down , itime ) = u_psi_ano_down_detrend_filter( ilon , i_down + 1 , itime ) + psi_temp;
        end
    end
end
u_psi_ano_down_detrend_filter = u_psi_ano_down_detrend_filter( : , 1 : 17 , : );
%%
datapath  = '../Data Store/NECP2_upsi_ano_pres_detrend_lowpass_197901_202412.mat';
save( datapath , 'u_psi_ano_down_detrend_filter' , 'lon' , 'lat' , 'lev' );