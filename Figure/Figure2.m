%%
clc;
clear all;
close all;
load( 'NECP2_upsi_ano_detrend_lowpass_197901_202412.mat' );
lon_upsi = lon; lat_upsi = lat; lev_upsi = lev;
clear lon lev lat
u_psi_ano_down_detrend_fliter_400_600hpa = squeeze( nanmean( u_psi_ano_down_detrend_fliter( : , 5 : 7 , : ) , 2 ) );
load( 'NECP2_omega_ano_detrend_lowpass_1979_2024.mat' );
lon_omega = lon;
clear lon
load( 'NECP2_prate_ano_detrend_lowpass_197901_202412.mat' );
load( 'NECP2_chi_Qx_ano_detrend_lowpass_197901_202412.mat' );
lon_Qx = lon_used;
clear chi_ano_3D_detrend_filter chi_ano_equ_detrend_fliter Qx_ano_3D_detrend_filter lat_used lon_used
%%
El_Eastward_move_year  = [ 1982, 1987 , 1994, 1997, 2009, 2015, 2023 ];
id_El_Eastward_move_year_Jun_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 - 6;
id_El_Eastward_move_year_Jul_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 - 5;
id_El_Eastward_move_year_Aug_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 - 4;
id_El_Eastward_move_year_Sep_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 - 3;
id_El_Eastward_move_year_Oct_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 - 2;
id_El_Eastward_move_year_Nov_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 - 1;
id_El_Eastward_move_year_Dec_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 0;
id_El_Eastward_move_year_Jan_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 1;
id_El_Eastward_move_year_Feb_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 2;
id_El_Eastward_move_year_Mar_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 3;
id_El_Eastward_move_year_Apr_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 4;
id_El_Eastward_move_year_May_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 5;
id_El_Eastward_move_year_Jun_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 6;
id_El_Eastward_move_year_Jul_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 7;
id_El_Eastward_move_year_Aug_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 8;
id_El_Eastward_move_year_Sep_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 9;
id_El_Eastward_move_year_Oct_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 10;
id_El_Eastward_move_year_Nov_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 11;
id_El_Eastward_move_year_Dec_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 12;
%%
upsi_ano_El_Eastward_move_year_Jun_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Jun_0 );
upsi_ano_El_Eastward_move_year_Jul_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Jul_0 );
upsi_ano_El_Eastward_move_year_Aug_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Aug_0 );
upsi_ano_El_Eastward_move_year_Sep_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Sep_0 );
upsi_ano_El_Eastward_move_year_Oct_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Oct_0 );
upsi_ano_El_Eastward_move_year_Nov_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Nov_0 );
upsi_ano_El_Eastward_move_year_Dec_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Dec_0 );
upsi_ano_El_Eastward_move_year_Jan_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Jan_1 );
upsi_ano_El_Eastward_move_year_Feb_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Feb_1 );
upsi_ano_El_Eastward_move_year_Mar_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Mar_1 );
upsi_ano_El_Eastward_move_year_Apr_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Apr_1 );
upsi_ano_El_Eastward_move_year_May_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_May_1 );
upsi_ano_El_Eastward_move_year_Jun_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Jun_1 );
upsi_ano_El_Eastward_move_year_Jul_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Jul_1 );
upsi_ano_El_Eastward_move_year_Aug_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Aug_1 );
upsi_ano_El_Eastward_move_year_Sep_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Sep_1 );
upsi_ano_El_Eastward_move_year_Oct_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Oct_1 );
upsi_ano_El_Eastward_move_year_Nov_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Nov_1 );
upsi_ano_El_Eastward_move_year_Dec_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_El_Eastward_move_year_Dec_1 );

upsi_ano_El_Eastward_move_year = cat( 3 , upsi_ano_El_Eastward_move_year_Jun_0 , upsi_ano_El_Eastward_move_year_Jul_0 , upsi_ano_El_Eastward_move_year_Aug_0 ,...
                                      upsi_ano_El_Eastward_move_year_Sep_0 , upsi_ano_El_Eastward_move_year_Oct_0 , upsi_ano_El_Eastward_move_year_Nov_0 ,...
                                      upsi_ano_El_Eastward_move_year_Dec_0 , upsi_ano_El_Eastward_move_year_Jan_1 , upsi_ano_El_Eastward_move_year_Feb_1 ,...
                                      upsi_ano_El_Eastward_move_year_Mar_1 , upsi_ano_El_Eastward_move_year_Apr_1 , upsi_ano_El_Eastward_move_year_May_1 ,...
                                      upsi_ano_El_Eastward_move_year_Jun_1 , upsi_ano_El_Eastward_move_year_Jul_1 , upsi_ano_El_Eastward_move_year_Aug_1 ,...
                                      upsi_ano_El_Eastward_move_year_Sep_1 , upsi_ano_El_Eastward_move_year_Oct_1 , upsi_ano_El_Eastward_move_year_Nov_1 ,...
                                      upsi_ano_El_Eastward_move_year_Dec_1 );

upsi_ano_El_eastward_move_year_used = squeeze( nanmean( upsi_ano_El_Eastward_move_year , 2 ) );
% student t-test
nlon_upsi  = size( upsi_ano_El_Eastward_move_year , 1 );
nmoth_upsi = size( upsi_ano_El_Eastward_move_year , 3 );
nyear_upsi = size( upsi_ano_El_Eastward_move_year , 2 );

H_sign_El_upsi =NaN( nlon_upsi , nmoth_upsi );
for ilon = 1 : nlon_upsi
    for imoth = 1 : nmoth_upsi
        H_sign_El_upsi( ilon , imoth ) = ttest( squeeze( upsi_ano_El_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_El_upsi = H_sign_El_upsi > 0;
%%
omega_4_600hpa_ano_El_Eastward_move_year_Jun_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Jun_0 );
omega_4_600hpa_ano_El_Eastward_move_year_Jul_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Jul_0 );
omega_4_600hpa_ano_El_Eastward_move_year_Aug_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Aug_0 );
omega_4_600hpa_ano_El_Eastward_move_year_Sep_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Sep_0 );
omega_4_600hpa_ano_El_Eastward_move_year_Oct_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Oct_0 );
omega_4_600hpa_ano_El_Eastward_move_year_Nov_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Nov_0 );
omega_4_600hpa_ano_El_Eastward_move_year_Dec_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Dec_0 );
omega_4_600hpa_ano_El_Eastward_move_year_Jan_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Jan_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Feb_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Feb_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Mar_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Mar_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Apr_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Apr_1 );
omega_4_600hpa_ano_El_Eastward_move_year_May_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_May_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Jun_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Jun_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Jul_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Jul_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Aug_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Aug_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Sep_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Sep_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Oct_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Oct_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Nov_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Nov_1 );
omega_4_600hpa_ano_El_Eastward_move_year_Dec_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_El_Eastward_move_year_Dec_1 );

omega_4_600hpa_ano_El_Eastward_move_year = cat( 3 , omega_4_600hpa_ano_El_Eastward_move_year_Jun_0 , omega_4_600hpa_ano_El_Eastward_move_year_Jul_0 , omega_4_600hpa_ano_El_Eastward_move_year_Aug_0 ,...
                                      omega_4_600hpa_ano_El_Eastward_move_year_Sep_0 , omega_4_600hpa_ano_El_Eastward_move_year_Oct_0 , omega_4_600hpa_ano_El_Eastward_move_year_Nov_0 ,...
                                      omega_4_600hpa_ano_El_Eastward_move_year_Dec_0 , omega_4_600hpa_ano_El_Eastward_move_year_Jan_1 , omega_4_600hpa_ano_El_Eastward_move_year_Feb_1 ,...
                                      omega_4_600hpa_ano_El_Eastward_move_year_Mar_1 , omega_4_600hpa_ano_El_Eastward_move_year_Apr_1 , omega_4_600hpa_ano_El_Eastward_move_year_May_1 ,...
                                      omega_4_600hpa_ano_El_Eastward_move_year_Jun_1 , omega_4_600hpa_ano_El_Eastward_move_year_Jul_1 , omega_4_600hpa_ano_El_Eastward_move_year_Aug_1 ,...
                                      omega_4_600hpa_ano_El_Eastward_move_year_Sep_1 , omega_4_600hpa_ano_El_Eastward_move_year_Oct_1 , omega_4_600hpa_ano_El_Eastward_move_year_Nov_1 ,...
                                      omega_4_600hpa_ano_El_Eastward_move_year_Dec_1 );

omega_4_600hpa_ano_El_eastward_move_year_used = squeeze( nanmean( omega_4_600hpa_ano_El_Eastward_move_year , 2 ) );
% student t-test
nlon_omega  = size( omega_4_600hpa_ano_El_Eastward_move_year , 1 );
nmoth_omega = size( omega_4_600hpa_ano_El_Eastward_move_year , 3 );
nyear_omega = size( omega_4_600hpa_ano_El_Eastward_move_year , 2 );

H_sign_El_omega =NaN( nlon_omega , nmoth_omega );
for ilon = 1 : nlon_omega
    for imoth = 1 : nmoth_omega
        H_sign_El_omega( ilon , imoth ) = ttest( squeeze( omega_4_600hpa_ano_El_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_El_omega = H_sign_El_omega > 0;
%%
prate_ano_El_Eastward_move_year_Jun_0 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Jun_0 );
prate_ano_El_Eastward_move_year_Jul_0 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Jul_0 );
prate_ano_El_Eastward_move_year_Aug_0 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Aug_0 );
prate_ano_El_Eastward_move_year_Sep_0 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Sep_0 );
prate_ano_El_Eastward_move_year_Oct_0 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Oct_0 );
prate_ano_El_Eastward_move_year_Nov_0 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Nov_0 );
prate_ano_El_Eastward_move_year_Dec_0 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Dec_0 );
prate_ano_El_Eastward_move_year_Jan_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Jan_1 );
prate_ano_El_Eastward_move_year_Feb_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Feb_1 );
prate_ano_El_Eastward_move_year_Mar_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Mar_1 );
prate_ano_El_Eastward_move_year_Apr_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Apr_1 );
prate_ano_El_Eastward_move_year_May_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_May_1 );
prate_ano_El_Eastward_move_year_Jun_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Jun_1 );
prate_ano_El_Eastward_move_year_Jul_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Jul_1 );
prate_ano_El_Eastward_move_year_Aug_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Aug_1 );
prate_ano_El_Eastward_move_year_Sep_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Sep_1 );
prate_ano_El_Eastward_move_year_Oct_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Oct_1 );
prate_ano_El_Eastward_move_year_Nov_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Nov_1 );
prate_ano_El_Eastward_move_year_Dec_1 = prate_equ_detrend_fliter( : , id_El_Eastward_move_year_Dec_1 );

prate_ano_El_Eastward_move_year = cat( 3 , prate_ano_El_Eastward_move_year_Jun_0 , prate_ano_El_Eastward_move_year_Jul_0 , prate_ano_El_Eastward_move_year_Aug_0 ,...
                                           prate_ano_El_Eastward_move_year_Sep_0 , prate_ano_El_Eastward_move_year_Oct_0 , prate_ano_El_Eastward_move_year_Nov_0 ,...
                                           prate_ano_El_Eastward_move_year_Dec_0 , prate_ano_El_Eastward_move_year_Jan_1 , prate_ano_El_Eastward_move_year_Feb_1 ,...
                                           prate_ano_El_Eastward_move_year_Mar_1 , prate_ano_El_Eastward_move_year_Apr_1 , prate_ano_El_Eastward_move_year_May_1 ,...
                                           prate_ano_El_Eastward_move_year_Jun_1 , prate_ano_El_Eastward_move_year_Jul_1 , prate_ano_El_Eastward_move_year_Aug_1 ,...
                                           prate_ano_El_Eastward_move_year_Sep_1 , prate_ano_El_Eastward_move_year_Oct_1 , prate_ano_El_Eastward_move_year_Nov_1 ,...
                                           prate_ano_El_Eastward_move_year_Dec_1 );

prate_ano_El_eastward_move_year_used = squeeze( nanmean( prate_ano_El_Eastward_move_year , 2 ) );

% student t-test
nlon_prate  = size( prate_ano_El_Eastward_move_year , 1 );
nmoth_prate = size( prate_ano_El_Eastward_move_year , 3 );
nyear_prate = size( prate_ano_El_Eastward_move_year , 2 );

H_sign_El_prate =NaN( nlon_prate , nmoth_prate );
for ilon = 1 : nlon_prate
    for imoth = 1 : nmoth_prate
        H_sign_El_prate( ilon , imoth ) = ttest( squeeze( prate_ano_El_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_El_prate = H_sign_El_prate > 0;
%%
Qx_ano_El_Eastward_move_year_Jun_0 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Jun_0 );
Qx_ano_El_Eastward_move_year_Jul_0 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Jul_0 );
Qx_ano_El_Eastward_move_year_Aug_0 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Aug_0 );
Qx_ano_El_Eastward_move_year_Sep_0 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Sep_0 );
Qx_ano_El_Eastward_move_year_Oct_0 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Oct_0 );
Qx_ano_El_Eastward_move_year_Nov_0 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Nov_0 );
Qx_ano_El_Eastward_move_year_Dec_0 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Dec_0 );
Qx_ano_El_Eastward_move_year_Jan_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Jan_1 );
Qx_ano_El_Eastward_move_year_Feb_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Feb_1 );
Qx_ano_El_Eastward_move_year_Mar_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Mar_1 );
Qx_ano_El_Eastward_move_year_Apr_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Apr_1 );
Qx_ano_El_Eastward_move_year_May_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_May_1 );
Qx_ano_El_Eastward_move_year_Jun_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Jun_1 );
Qx_ano_El_Eastward_move_year_Jul_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Jul_1 );
Qx_ano_El_Eastward_move_year_Aug_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Aug_1 );
Qx_ano_El_Eastward_move_year_Sep_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Sep_1 );
Qx_ano_El_Eastward_move_year_Oct_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Oct_1 );
Qx_ano_El_Eastward_move_year_Nov_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Nov_1 );
Qx_ano_El_Eastward_move_year_Dec_1 = Qx_ano_equ_detrend_fliter( : , id_El_Eastward_move_year_Dec_1 );

Qx_ano_El_Eastward_move_year = cat( 3 , Qx_ano_El_Eastward_move_year_Jun_0 , Qx_ano_El_Eastward_move_year_Jul_0 , Qx_ano_El_Eastward_move_year_Aug_0 ,...
                                      Qx_ano_El_Eastward_move_year_Sep_0 , Qx_ano_El_Eastward_move_year_Oct_0 , Qx_ano_El_Eastward_move_year_Nov_0 ,...
                                      Qx_ano_El_Eastward_move_year_Dec_0 , Qx_ano_El_Eastward_move_year_Jan_1 , Qx_ano_El_Eastward_move_year_Feb_1 ,...
                                      Qx_ano_El_Eastward_move_year_Mar_1 , Qx_ano_El_Eastward_move_year_Apr_1 , Qx_ano_El_Eastward_move_year_May_1 ,...
                                      Qx_ano_El_Eastward_move_year_Jun_1 , Qx_ano_El_Eastward_move_year_Jul_1 , Qx_ano_El_Eastward_move_year_Aug_1 ,...
                                      Qx_ano_El_Eastward_move_year_Sep_1 , Qx_ano_El_Eastward_move_year_Oct_1 , Qx_ano_El_Eastward_move_year_Nov_1 ,...
                                      Qx_ano_El_Eastward_move_year_Dec_1 );

Qx_ano_El_eastward_move_year_used = squeeze( nanmean( Qx_ano_El_Eastward_move_year , 2 ) );
% student t-test
nlon_Qx  = size( Qx_ano_El_Eastward_move_year , 1 );
nmoth_Qx = size( Qx_ano_El_Eastward_move_year , 3 );
nyear_Qx = size( Qx_ano_El_Eastward_move_year , 2 );

H_sign_El_Qx =NaN( nlon_Qx , nmoth_Qx );
for ilon = 1 : nlon_Qx
    for imoth = 1 : nmoth_Qx
        H_sign_El_Qx( ilon , imoth ) = ttest( squeeze( Qx_ano_El_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_El_Qx = H_sign_El_Qx > 0;
%%
La_Eastward_move_year  = [ 1985, 2005, 2008, 2011, 2017, 2022 ];
id_La_Eastward_move_year_Jun_0 = ( La_Eastward_move_year - 1979 + 1 ) * 12 - 6;
id_La_Eastward_move_year_Jul_0 = ( La_Eastward_move_year - 1979 + 1 ) * 12 - 5;
id_La_Eastward_move_year_Aug_0 = ( La_Eastward_move_year - 1979 + 1 ) * 12 - 4;
id_La_Eastward_move_year_Sep_0 = ( La_Eastward_move_year - 1979 + 1 ) * 12 - 3;
id_La_Eastward_move_year_Oct_0 = ( La_Eastward_move_year - 1979 + 1 ) * 12 - 2;
id_La_Eastward_move_year_Nov_0 = ( La_Eastward_move_year - 1979 + 1 ) * 12 - 1;
id_La_Eastward_move_year_Dec_0 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 0;
id_La_Eastward_move_year_Jan_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 1;
id_La_Eastward_move_year_Feb_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 2;
id_La_Eastward_move_year_Mar_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 3;
id_La_Eastward_move_year_Apr_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 4;
id_La_Eastward_move_year_May_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 5;
id_La_Eastward_move_year_Jun_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 6;
id_La_Eastward_move_year_Jul_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 7;
id_La_Eastward_move_year_Aug_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 8;
id_La_Eastward_move_year_Sep_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 9;
id_La_Eastward_move_year_Oct_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 10;
id_La_Eastward_move_year_Nov_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 11;
id_La_Eastward_move_year_Dec_1 = ( La_Eastward_move_year - 1979 + 1 ) * 12 + 12;
%%
upsi_ano_La_Eastward_move_year_Jun_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Jun_0 );
upsi_ano_La_Eastward_move_year_Jul_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Jul_0 );
upsi_ano_La_Eastward_move_year_Aug_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Aug_0 );
upsi_ano_La_Eastward_move_year_Sep_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Sep_0 );
upsi_ano_La_Eastward_move_year_Oct_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Oct_0 );
upsi_ano_La_Eastward_move_year_Nov_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Nov_0 );
upsi_ano_La_Eastward_move_year_Dec_0 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Dec_0 );
upsi_ano_La_Eastward_move_year_Jan_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Jan_1 );
upsi_ano_La_Eastward_move_year_Feb_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Feb_1 );
upsi_ano_La_Eastward_move_year_Mar_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Mar_1 );
upsi_ano_La_Eastward_move_year_Apr_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Apr_1 );
upsi_ano_La_Eastward_move_year_May_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_May_1 );
upsi_ano_La_Eastward_move_year_Jun_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Jun_1 );
upsi_ano_La_Eastward_move_year_Jul_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Jul_1 );
upsi_ano_La_Eastward_move_year_Aug_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Aug_1 );
upsi_ano_La_Eastward_move_year_Sep_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Sep_1 );
upsi_ano_La_Eastward_move_year_Oct_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Oct_1 );
upsi_ano_La_Eastward_move_year_Nov_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Nov_1 );
upsi_ano_La_Eastward_move_year_Dec_1 = u_psi_ano_down_detrend_fliter_400_600hpa( : , id_La_Eastward_move_year_Dec_1 );

upsi_ano_La_Eastward_move_year = cat( 3 , upsi_ano_La_Eastward_move_year_Jun_0 , upsi_ano_La_Eastward_move_year_Jul_0 , upsi_ano_La_Eastward_move_year_Aug_0 ,...
                                      upsi_ano_La_Eastward_move_year_Sep_0 , upsi_ano_La_Eastward_move_year_Oct_0 , upsi_ano_La_Eastward_move_year_Nov_0 ,...
                                      upsi_ano_La_Eastward_move_year_Dec_0 , upsi_ano_La_Eastward_move_year_Jan_1 , upsi_ano_La_Eastward_move_year_Feb_1 ,...
                                      upsi_ano_La_Eastward_move_year_Mar_1 , upsi_ano_La_Eastward_move_year_Apr_1 , upsi_ano_La_Eastward_move_year_May_1 ,...
                                      upsi_ano_La_Eastward_move_year_Jun_1 , upsi_ano_La_Eastward_move_year_Jul_1 , upsi_ano_La_Eastward_move_year_Aug_1 ,...
                                      upsi_ano_La_Eastward_move_year_Sep_1 , upsi_ano_La_Eastward_move_year_Oct_1 , upsi_ano_La_Eastward_move_year_Nov_1 ,...
                                      upsi_ano_La_Eastward_move_year_Dec_1 );

upsi_ano_La_eastward_move_year_used = squeeze( nanmean( upsi_ano_La_Eastward_move_year , 2 ) );
% student t-test
nlon_upsi  = size( upsi_ano_La_Eastward_move_year , 1 );
nmoth_upsi = size( upsi_ano_La_Eastward_move_year , 3 );
nyear_upsi = size( upsi_ano_La_Eastward_move_year , 2 );

H_sign_La_upsi =NaN( nlon_upsi , nmoth_upsi );
for ilon = 1 : nlon_upsi
    for imoth = 1 : nmoth_upsi
        H_sign_La_upsi( ilon , imoth ) = ttest( squeeze( upsi_ano_La_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_La_upsi = H_sign_La_upsi > 0;
%%
omega_4_600hpa_ano_La_Eastward_move_year_Jun_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Jun_0 );
omega_4_600hpa_ano_La_Eastward_move_year_Jul_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Jul_0 );
omega_4_600hpa_ano_La_Eastward_move_year_Aug_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Aug_0 );
omega_4_600hpa_ano_La_Eastward_move_year_Sep_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Sep_0 );
omega_4_600hpa_ano_La_Eastward_move_year_Oct_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Oct_0 );
omega_4_600hpa_ano_La_Eastward_move_year_Nov_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Nov_0 );
omega_4_600hpa_ano_La_Eastward_move_year_Dec_0 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Dec_0 );
omega_4_600hpa_ano_La_Eastward_move_year_Jan_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Jan_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Feb_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Feb_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Mar_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Mar_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Apr_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Apr_1 );
omega_4_600hpa_ano_La_Eastward_move_year_May_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_May_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Jun_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Jun_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Jul_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Jul_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Aug_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Aug_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Sep_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Sep_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Oct_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Oct_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Nov_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Nov_1 );
omega_4_600hpa_ano_La_Eastward_move_year_Dec_1 = omega_equ_ano_4_600hpa_detrend_fliter( : , id_La_Eastward_move_year_Dec_1 );

omega_4_600hpa_ano_La_Eastward_move_year = cat( 3 , omega_4_600hpa_ano_La_Eastward_move_year_Jun_0 , omega_4_600hpa_ano_La_Eastward_move_year_Jul_0 , omega_4_600hpa_ano_La_Eastward_move_year_Aug_0 ,...
                                      omega_4_600hpa_ano_La_Eastward_move_year_Sep_0 , omega_4_600hpa_ano_La_Eastward_move_year_Oct_0 , omega_4_600hpa_ano_La_Eastward_move_year_Nov_0 ,...
                                      omega_4_600hpa_ano_La_Eastward_move_year_Dec_0 , omega_4_600hpa_ano_La_Eastward_move_year_Jan_1 , omega_4_600hpa_ano_La_Eastward_move_year_Feb_1 ,...
                                      omega_4_600hpa_ano_La_Eastward_move_year_Mar_1 , omega_4_600hpa_ano_La_Eastward_move_year_Apr_1 , omega_4_600hpa_ano_La_Eastward_move_year_May_1 ,...
                                      omega_4_600hpa_ano_La_Eastward_move_year_Jun_1 , omega_4_600hpa_ano_La_Eastward_move_year_Jul_1 , omega_4_600hpa_ano_La_Eastward_move_year_Aug_1 ,...
                                      omega_4_600hpa_ano_La_Eastward_move_year_Sep_1 , omega_4_600hpa_ano_La_Eastward_move_year_Oct_1 , omega_4_600hpa_ano_La_Eastward_move_year_Nov_1 ,...
                                      omega_4_600hpa_ano_La_Eastward_move_year_Dec_1 );

omega_4_600hpa_ano_La_eastward_move_year_used = squeeze( nanmean( omega_4_600hpa_ano_La_Eastward_move_year , 2 ) );
% student t-test
nlon_omega  = size( omega_4_600hpa_ano_La_Eastward_move_year , 1 );
nmoth_omega = size( omega_4_600hpa_ano_La_Eastward_move_year , 3 );
nyear_omega = size( omega_4_600hpa_ano_La_Eastward_move_year , 2 );

H_sign_La_omega =NaN( nlon_omega , nmoth_omega );
for ilon = 1 : nlon_omega
    for imoth = 1 : nmoth_omega
        H_sign_La_omega( ilon , imoth ) = ttest( squeeze( omega_4_600hpa_ano_La_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_La_omega = H_sign_La_omega > 0;
%%
prate_ano_La_Eastward_move_year_Jun_0 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Jun_0 );
prate_ano_La_Eastward_move_year_Jul_0 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Jul_0 );
prate_ano_La_Eastward_move_year_Aug_0 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Aug_0 );
prate_ano_La_Eastward_move_year_Sep_0 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Sep_0 );
prate_ano_La_Eastward_move_year_Oct_0 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Oct_0 );
prate_ano_La_Eastward_move_year_Nov_0 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Nov_0 );
prate_ano_La_Eastward_move_year_Dec_0 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Dec_0 );
prate_ano_La_Eastward_move_year_Jan_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Jan_1 );
prate_ano_La_Eastward_move_year_Feb_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Feb_1 );
prate_ano_La_Eastward_move_year_Mar_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Mar_1 );
prate_ano_La_Eastward_move_year_Apr_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Apr_1 );
prate_ano_La_Eastward_move_year_May_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_May_1 );
prate_ano_La_Eastward_move_year_Jun_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Jun_1 );
prate_ano_La_Eastward_move_year_Jul_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Jul_1 );
prate_ano_La_Eastward_move_year_Aug_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Aug_1 );
prate_ano_La_Eastward_move_year_Sep_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Sep_1 );
prate_ano_La_Eastward_move_year_Oct_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Oct_1 );
prate_ano_La_Eastward_move_year_Nov_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Nov_1 );
prate_ano_La_Eastward_move_year_Dec_1 = prate_equ_detrend_fliter( : , id_La_Eastward_move_year_Dec_1 );

prate_ano_La_Eastward_move_year = cat( 3 , prate_ano_La_Eastward_move_year_Jun_0 , prate_ano_La_Eastward_move_year_Jul_0 , prate_ano_La_Eastward_move_year_Aug_0 ,...
                                           prate_ano_La_Eastward_move_year_Sep_0 , prate_ano_La_Eastward_move_year_Oct_0 , prate_ano_La_Eastward_move_year_Nov_0 ,...
                                           prate_ano_La_Eastward_move_year_Dec_0 , prate_ano_La_Eastward_move_year_Jan_1 , prate_ano_La_Eastward_move_year_Feb_1 ,...
                                           prate_ano_La_Eastward_move_year_Mar_1 , prate_ano_La_Eastward_move_year_Apr_1 , prate_ano_La_Eastward_move_year_May_1 ,...
                                           prate_ano_La_Eastward_move_year_Jun_1 , prate_ano_La_Eastward_move_year_Jul_1 , prate_ano_La_Eastward_move_year_Aug_1 ,...
                                           prate_ano_La_Eastward_move_year_Sep_1 , prate_ano_La_Eastward_move_year_Oct_1 , prate_ano_La_Eastward_move_year_Nov_1 ,...
                                           prate_ano_La_Eastward_move_year_Dec_1 );

prate_ano_La_eastward_move_year_used = squeeze( nanmean( prate_ano_La_Eastward_move_year , 2 ) );

% student t-test
nlon_prate  = size( prate_ano_La_Eastward_move_year , 1 );
nmoth_prate = size( prate_ano_La_Eastward_move_year , 3 );
nyear_prate = size( prate_ano_La_Eastward_move_year , 2 );

H_sign_La_prate =NaN( nlon_prate , nmoth_prate );
for ilon = 1 : nlon_prate
    for imoth = 1 : nmoth_prate
        H_sign_La_prate( ilon , imoth ) = ttest( squeeze( prate_ano_La_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_La_prate = H_sign_La_prate > 0;
%%
Qx_ano_La_Eastward_move_year_Jun_0 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Jun_0 );
Qx_ano_La_Eastward_move_year_Jul_0 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Jul_0 );
Qx_ano_La_Eastward_move_year_Aug_0 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Aug_0 );
Qx_ano_La_Eastward_move_year_Sep_0 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Sep_0 );
Qx_ano_La_Eastward_move_year_Oct_0 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Oct_0 );
Qx_ano_La_Eastward_move_year_Nov_0 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Nov_0 );
Qx_ano_La_Eastward_move_year_Dec_0 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Dec_0 );
Qx_ano_La_Eastward_move_year_Jan_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Jan_1 );
Qx_ano_La_Eastward_move_year_Feb_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Feb_1 );
Qx_ano_La_Eastward_move_year_Mar_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Mar_1 );
Qx_ano_La_Eastward_move_year_Apr_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Apr_1 );
Qx_ano_La_Eastward_move_year_May_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_May_1 );
Qx_ano_La_Eastward_move_year_Jun_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Jun_1 );
Qx_ano_La_Eastward_move_year_Jul_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Jul_1 );
Qx_ano_La_Eastward_move_year_Aug_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Aug_1 );
Qx_ano_La_Eastward_move_year_Sep_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Sep_1 );
Qx_ano_La_Eastward_move_year_Oct_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Oct_1 );
Qx_ano_La_Eastward_move_year_Nov_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Nov_1 );
Qx_ano_La_Eastward_move_year_Dec_1 = Qx_ano_equ_detrend_fliter( : , id_La_Eastward_move_year_Dec_1 );

Qx_ano_La_Eastward_move_year = cat( 3 , Qx_ano_La_Eastward_move_year_Jun_0 , Qx_ano_La_Eastward_move_year_Jul_0 , Qx_ano_La_Eastward_move_year_Aug_0 ,...
                                      Qx_ano_La_Eastward_move_year_Sep_0 , Qx_ano_La_Eastward_move_year_Oct_0 , Qx_ano_La_Eastward_move_year_Nov_0 ,...
                                      Qx_ano_La_Eastward_move_year_Dec_0 , Qx_ano_La_Eastward_move_year_Jan_1 , Qx_ano_La_Eastward_move_year_Feb_1 ,...
                                      Qx_ano_La_Eastward_move_year_Mar_1 , Qx_ano_La_Eastward_move_year_Apr_1 , Qx_ano_La_Eastward_move_year_May_1 ,...
                                      Qx_ano_La_Eastward_move_year_Jun_1 , Qx_ano_La_Eastward_move_year_Jul_1 , Qx_ano_La_Eastward_move_year_Aug_1 ,...
                                      Qx_ano_La_Eastward_move_year_Sep_1 , Qx_ano_La_Eastward_move_year_Oct_1 , Qx_ano_La_Eastward_move_year_Nov_1 ,...
                                      Qx_ano_La_Eastward_move_year_Dec_1 );

Qx_ano_La_eastward_move_year_used = squeeze( nanmean( Qx_ano_La_Eastward_move_year , 2 ) );
% student t-test
nlon_Qx  = size( Qx_ano_La_Eastward_move_year , 1 );
nmoth_Qx = size( Qx_ano_La_Eastward_move_year , 3 );
nyear_Qx = size( Qx_ano_La_Eastward_move_year , 2 );

H_sign_La_Qx =NaN( nlon_Qx , nmoth_Qx );
for ilon = 1 : nlon_Qx
    for imoth = 1 : nmoth_Qx
        H_sign_La_Qx( ilon , imoth ) = ttest( squeeze( Qx_ano_La_Eastward_move_year( ilon , : , imoth ) )' );
    end
end
clear ilon imoth
H_sign_La_Qx = H_sign_La_Qx > 0;
%%
file_name = [ 'ERSSTv5_SST_SSTA_SSTA_detrend_lowpass_1979_2024' , '.mat']; 
load( file_name );

nlon_nino34   = size( SSTA_3D , 1 );
nlat_nino34   = size( SSTA_3D , 2 );
ntime_nino34  = size( SSTA_3D , 3 );

SSTA_detrend_3D = NaN( nlon_nino34 , nlat_nino34 , ntime_nino34 );
for ilon = 1 : nlon_nino34
    for ilat = 1 : nlat_nino34
        if  ~isnan( mean( squeeze( SSTA_3D( ilon , ilat , : ) ) ) )
            SSTA_detrend_3D( ilon , ilat , : ) = detrend( squeeze( SSTA_3D( ilon , ilat , : ) ) );
        end           
    end
end

lon_nino34_st = 190; 
lon_nino34_la = 240;
lat_nino34_st = -5;
lat_nino34_la = 5;
id_lon_nino34  = intersect( find( lon_sst >= lon_nino34_st ) , find( lon_sst <= lon_nino34_la ) );
id_lat_nino34  = intersect( find( lat_sst >= lat_nino34_st ) , find( lat_sst <= lat_nino34_la ) );

SSTA_nino34  = SSTA_detrend_3D( id_lon_nino34 , id_lat_nino34 , : );
Nino34_Index = squeeze( nanmean( squeeze( nanmean( SSTA_nino34 , 1 ) ) , 1 ) ); 
Nino34_Index = Nino34_Index';
Nino34_Index_three_run = NaN( ntime_nino34 , 1 );
for inum = 1 : ntime_nino34
    if inum == 1
        Nino34_Index_three_run( inum ) = Nino34_Index( inum );
    elseif inum == 552
        Nino34_Index_three_run( inum ) = Nino34_Index( inum );
    else
        Nino34_Index_three_run( inum ) = mean( Nino34_Index( inum - 1 : inum + 1 ) );
    end
end 
clear inum

Nino34_Index_month            = reshape( Nino34_Index_three_run , [ 12 ntime_nino34/12 ] );
Nino34_Index_DJF              = Nino34_Index_month( 1 , 2 : end )';
Nino34_Index_DJF( : , 2 )     = 1979 : 1 : 2023;
Nino34_Index_DJF_new          = Nino34_Index_DJF';

El_Eastmove_year    = [ 1982 , 1987 , 1994 , 1997 , 2009 , 2015 , 2023 ];
El_No_Eastmove_year = [ 1986 , 1991 , 2002 , 2004 , 2006 , 2014 , 2018 ];
La_Eastmove_year    = [ 1985, 2005, 2008, 2011, 2017,  2022 ];
La_No_Eastmove_year = [ 1983, 1984, 1988, 1995, 1998, 1999, 2000, 2007, 2010, 2020, 2021 ];
ENSO_year           = union( union( union( El_Eastmove_year , El_No_Eastmove_year ) , La_Eastmove_year ) , La_No_Eastmove_year );

Nino34_El_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
Nino34_El_Eastmove_Year( 2 , : ) = ENSO_year;
Nino34_El_No_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
Nino34_El_No_Eastmove_Year( 2 , : ) = ENSO_year;

for n = 1 : length(ENSO_year)
    if ismember( ENSO_year( n ) , El_Eastmove_year )
        Nino34_El_Eastmove_Year( 1 , n ) = Nino34_Index_DJF_new( 1 ,  find( Nino34_Index_DJF_new( 2 , : ) == ENSO_year( n ) ) );
    elseif ismember( ENSO_year( n ) , El_No_Eastmove_year )
        Nino34_El_No_Eastmove_Year( 1 , n ) = Nino34_Index_DJF_new( 1 , find( Nino34_Index_DJF_new( 2 , : ) == ENSO_year( n ) ) );
    end  
end
clear n

Nino34_La_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
Nino34_La_Eastmove_Year( 2 , : ) = ENSO_year;
Nino34_La_No_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
Nino34_La_No_Eastmove_Year( 2 , : ) = ENSO_year;
for n = 1 : length(ENSO_year)
    if ismember( ENSO_year( n ) , La_Eastmove_year )
        Nino34_La_Eastmove_Year( 1 , n ) = Nino34_Index_DJF_new( 1 , find( Nino34_Index_DJF_new( 2 , : ) == ENSO_year( n ) ) );
    elseif ismember( ENSO_year( n ) , La_No_Eastmove_year )
        Nino34_La_No_Eastmove_Year( 1 , n ) = Nino34_Index_DJF_new( 1 , find( Nino34_Index_DJF_new( 2 , : ) == ENSO_year( n ) ) );
    end  
end

%%
label_upsi  = [ -20 -2.8 : 0.4 : 2.8 20 ];
label_omega = [ -20 -0.05 : 0.01 : 0.05 20 ];
label_prate = [ -30 -7 : 1 : 7  30 ];
label_Qx = [ -10 -3 : 0.5 : 3 10 ];
constant = 3600 * 24; 
colornew  = [ 0, 0, 153
              0, 0, 209
              28, 104, 229
              0, 145, 254
              0, 192, 254
              134, 210, 254
              195, 245, 254
              254, 254, 198
              254, 225, 0
              254, 171, 0
              254, 110, 0
              254, 0, 0
              233, 0, 0
              186, 29, 29 ] / 255;
[ X_upsi , Y_upsi ] = meshgrid( lon_upsi , 1:1:19 );
[ X_omega , Y_omega ] = meshgrid( lon_omega , 1:1:19 );
[ X_prate , Y_prate ] = meshgrid( lon_prate , 1:1:19 );
[ X_Qx , Y_Qx ] = meshgrid( lon_Qx  , 1:1:19 );



figure(1)
set( gcf , 'position' , [ 0 0 2400 2400 ] , 'color' , 'w' );
[ ax , ~ ]  = tight_subplot( 5 , 2 , [ 0.06 0.07 ] , [ 0.05 0.1 ] , [ 0.1 0.12 ] );

% 只用前面 4 个 lon–time 图，后面 4 个子图不要
for k = 1:2
    delete(ax(k));
end
ax1 = axes('Position', [0.1,0.81,0.78,0.15]); 
box off;
hold( ax1 , 'on' );
h1 = bar( 1 : length( ENSO_year ) , Nino34_El_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 255 , 90 , 105 ] / 255 , 'EdgeColor' , [ 255 , 90 , 105 ] / 255 );
h2 = bar( 1 : length( ENSO_year ) , Nino34_La_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 105 , 137 , 255 ] / 255 , 'EdgeColor' , [ 105 , 137 , 255] / 255 );
h3 = bar( 1 : length( ENSO_year ) ,  Nino34_El_No_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 255 255 255 ] / 255  ,...
                                                                           'EdgeColor' , [ 255 , 90 , 105 ] / 255 , 'LineWidth', 3 );
h4 = bar( 1 : length( ENSO_year ) ,  Nino34_La_No_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 255 , 255 , 255 ] / 255 ,...
                                                                           'EdgeColor' , [ 105 , 137 , 255 ] / 255 , 'LineWidth', 3 );

% 2. 开网格但不画竖直线，只保留横线
ax1.XGrid = 'off';              % 关闭竖向网格线
ax1.YGrid = 'on';               % 打开横向网格线
ax1.GridLineStyle = '--';        % 网格线样式（可选，虚线更好看）
ax1.GridColor = [0.3 0.3 0.3];
ax1.GridAlpha = 0.3;            % 网格透明度

%沿着长方形画一个方框
ax_frame = axes('Position', ax1.Position, ...
                'Color','none', ...        % 透明
                'XTick',[], 'YTick',[], ...% 不画刻度
                'Box','on', ...            % 只画一圈框
                'XColor','k','YColor','k', ...
                'LineWidth',1.5);


% 3. 只让 X 轴有刻度线，Y 轴也要刻度线，并控制刻度线长度
ax1.XAxis.TickDirection = 'in';       % x轴刻度线向内
ax1.YAxis.TickDirection = 'in';       % x轴刻度线向内
ax1.XAxis.TickLength = [0.006 0];  
ax1.YAxis.TickLength = [0.002 0];          
set( ax1 , 'LineWidth', 1.5 , 'FontWeight' , 'normal'  ,...
            'xcolor' , 'k' , 'ycolor' , 'k' );
set( ax1 , 'xlim' , [ 0 32 ] , 'XTick' , [ 1 : 31 ] ,...
          'XTickLabel' , ENSO_year , 'FontWeight' , 'normal' , 'FontName' , 'Times New Roman' , 'FontSize' , 24 );
set( ax1 , 'XTickLabelRotation' , 52 );
xlabel( ax1 , 'Year(0)', 'FontName' , 'Times New Roman' , 'FontSize' , 24  );


% 哪些刻度为转换年（这里举例：第 1,4,6,9,11,16,17,18,20,21,26,30个）
Trans_idx = [1 4 6 9 11 16 17 18 20 21 26 30];

% ===== 在指定 bar 上画弧线：上方开口朝下(∩)，下方开口朝上(∪) =====
arc_w = 0.34;                 % 弧线半宽（x 方向，单位=bar间距）
arc_h = 0.04 * range(ax1.YLim); % 弧线高度（y 方向）
dy    = 0.01 * range(ax1.YLim); % 弧线离 bar 顶/底的距离

theta_up   = linspace(0,   pi, 60);   % 上半圆：∩（开口朝下）
theta_down = linspace(pi, 2*pi, 60);  % 下半圆：∪（开口朝上）

for i = Trans_idx  % 你想标记的那些bar的索引（例如绿色斜体对应的年份）

    % 找到该 x 位置真正被画出来的 bar 高度（四类里只会有一个非 NaN）
    y_candidates = [ ...
        Nino34_El_Eastmove_Year(1,i), ...
        Nino34_El_No_Eastmove_Year(1,i), ...
        Nino34_La_Eastmove_Year(1,i), ...
        Nino34_La_No_Eastmove_Year(1,i) ];
    ybar = y_candidates(~isnan(y_candidates));
    if isempty(ybar), continue; end

    x0 = i;  % 该 bar 的中心 x

    if ybar >= 0
        % 上方：画 ∩，放在 bar 顶上方一点
        y0 = ybar + dy;
        x_arc = x0 + arc_w * cos(theta_up);
        y_arc = y0 + arc_h * sin(theta_up);
    else
        % 下方：画 ∪，放在 bar 底下方一点（更负）
        y0 = ybar - dy;
        x_arc = x0 + arc_w * cos(theta_down);
        y_arc = y0 + arc_h * sin(theta_down);
    end

    plot(ax1, x_arc, y_arc, 'LineWidth', 4, 'Color', [0 140 0]/255);
end



set( ax1 , 'ylim' , [ -2 3 ] , 'YTick' , [ -2 : 1 : 3 ] ,...
          'YTickLabel' , { '-2.0'  , '-1.0'  , '0.0'  , '1.0'  , '2.0'  , '3.0' } , 'FontWeight' , 'normal' , 'FontName' , 'Times New Roman' , 'FontSize' , 24  );
ylabel( ax1 , 'NINO3.4(\circC) in D(0)JF(1)', 'FontName' , 'Times New Roman' , 'FontSize' , 24 , 'FontWeight' , 'normal'  );
lg = legend( [ h1 h2 h3 h4 ] ,{    'El Nino with E-IPWC      ' , ...
                                   'La Nina with E-IPWC      '  , ...
                                   'El Nino without E-IPWC' , ...
                                   'La Nina without E-IPWC' } , ...
                                   'Position' , [0.365 0.930 0.346 0.03] ,...
                                   'NumColumns', 2 , 'Box' , 'off' , 'FontName' , 'Times New Roman' , 'FontSize' , 24 , 'FontWeight' , 'normal'  );
annotation(   'textbox', [ 0.093,0.960,0.085,0.02], ...
              'String', '(a)', ...
              'FontSize', 25, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');

axes( ax(3) )
[ C1 , H1 ] = contourf( lon_upsi , 1:1:19 , upsi_ano_El_eastward_move_year_used' ./ 1e9 , label_upsi , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , 1:1:19 , upsi_ano_El_eastward_move_year_used' ./ 1e9 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
stipple( X_upsi , Y_upsi , H_sign_El_upsi' , ...
             'marker' , 'o' , ...      % 强制圆点
             'color' , [ 1 1 1 ] , ...       % 白色点
             'MarkerSize' , 3.0 , ...    % 点大小
             'MarkerFaceColor' , [ 1 1 1 ] ,...
             'MarkerEdgeColor' , [ 1 1 1 ] ,...
             'density' , 220 , ...      % 点密度
             'resize' , true );        % 自动缩放
set( ax(3) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(3) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(3) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(3) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(3) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' , 'FontWeight' , 'normal'  );
caxis( [ label_upsi( 2 ) label_upsi( end - 1 ) ] );    
colormap( ax(3) ,  colornew );
title( 'Streamfunction Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize' , 28 , 'FontWeight' , 'normal' );                 
annotation(   'textbox', [ 0.094,0.716,0.085,0.02], ...
              'String', '(b)', ...
              'FontSize', 25, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');

axes( ax(4) )
[ C1 , H1 ] = contourf( lon_upsi , 1:1:19 , upsi_ano_La_eastward_move_year_used' ./ 1e9 , label_upsi , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , 1:1:19 , upsi_ano_La_eastward_move_year_used' ./ 1e9 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
stipple( X_upsi , Y_upsi , H_sign_La_upsi' , ...
                           'marker' , 'o' , ...      % 强制圆点
                           'color' , [ 1 1 1 ] , ...       % 白色点
                           'MarkerSize' , 3.0 , ...    % 点大小
                           'MarkerFaceColor' , [ 1 1 1 ] ,...
                           'MarkerEdgeColor' , [ 1 1 1 ] ,...
                           'density' , 220 , ...      % 点密度
                           'resize' , true );        % 自动缩放
set( ax(4) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(4) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(4) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(4) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(4) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' , 'FontWeight' , 'normal'  );
caxis( [ label_upsi( 2 ) label_upsi( end - 1 ) ] );    
colormap( ax(4) , colornew );
annotation(   'textbox', [ 0.52,0.716,0.085,0.02], ...
              'String', '(f)', ...
              'FontSize', 25, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');
title( 'Streamfunction Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize' , 28 , 'FontWeight' , 'normal'   );                 

axes( ax(5) )
[ C1 , H1 ] = contourf( lon_omega , 1:1:19 , omega_4_600hpa_ano_El_eastward_move_year_used' , label_omega , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_omega , 1:1:19 , omega_4_600hpa_ano_El_eastward_move_year_used'  , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
stipple( X_omega , Y_omega , H_sign_El_omega' , ...
                           'marker' , 'o' , ...      % 强制圆点
                           'color' , [ 1 1 1 ] , ...       % 白色点
                           'MarkerSize' , 3.0 , ...    % 点大小
                           'MarkerFaceColor' , [ 1 1 1 ] ,...
                           'MarkerEdgeColor' , [ 1 1 1 ] ,...
                           'density' , 220 , ...      % 点密度
                           'resize' , true );        % 自动缩放
set( ax(5) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(5) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(5) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
     'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(5) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' , 'FontWeight' , 'normal'  );
caxis( [ label_omega( 2 ) label_omega( end - 1 ) ] );    
colormap( ax(5) , othercolor( 'RdBu10' , 10 ) );               
annotation(   'textbox', [ 0.094,0.536,0.085,0.02], ...
              'String', '(c)', ...
              'FontSize', 25, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');
title( 'Vertical Velocity Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize' , 28 , 'FontWeight' , 'normal'  );  

axes( ax(6) )
[ C1 , H1 ] = contourf( lon_omega , 1:1:19 , omega_4_600hpa_ano_La_eastward_move_year_used' , label_omega , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_omega , 1:1:19 , omega_4_600hpa_ano_La_eastward_move_year_used'  , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
stipple( X_omega , Y_omega , H_sign_La_omega' , ...
                           'marker' , 'o' , ...      % 强制圆点
                           'color' , [ 1 1 1 ] , ...       % 白色点
                           'MarkerSize' , 3.0 , ...    % 点大小
                           'MarkerFaceColor' , [ 1 1 1 ] ,...
                           'MarkerEdgeColor' , [ 1 1 1 ] ,...
                           'density' , 220 , ...      % 点密度
                           'resize' , true );        % 自动缩放
set( ax(6) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(6) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(6) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
     'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(6) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' , 'FontWeight' , 'normal'  );
annotation(   'textbox', [ 0.52,0.536,0.085,0.02], ...
              'String', '(g)', ...
              'FontSize', 25, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');
caxis( [ label_omega( 2 ) label_omega( end - 1 ) ] );    
colormap( ax(6) , othercolor( 'RdBu10' , 10 ) );
title( 'Vertical Velocity Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize' , 28  , 'FontWeight' , 'normal'  ); 

axes( ax(7) )
[ C1 , H1 ] = contourf( lon_prate , 1:1:19 , prate_ano_El_eastward_move_year_used' * constant , label_prate , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_prate , 1:1:19 , prate_ano_El_eastward_move_year_used' * constant , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
% plot( [ 153.75 153.75 ] , [ 1 19 ] , 'color' , [ 0.13 0.55 0.13 ] , 'LineStyle' , '-' , 'LineWidth' , 4 );     
stipple( X_prate , Y_prate , H_sign_El_prate' , ...
                           'marker' , 'o' , ...      % 强制圆点
                           'color' , [ 1 1 1 ] , ...       % 白色点
                           'MarkerSize' , 3.0 , ...    % 点大小
                           'MarkerFaceColor' , [ 1 1 1 ] ,...
                           'MarkerEdgeColor' , [ 1 1 1 ] ,...
                           'density' , 220 , ...      % 点密度
                           'resize' , true );        % 自动缩放
set( ax(7) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(7) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(7) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
     'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(7) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' , 'FontWeight' , 'normal'  );
caxis( [ label_prate( 2 ) label_prate( end - 1 ) ] );   
colormap( ax(7) , othercolor( 'BrBG8' , 14 ) );
annotation(   'textbox', [ 0.094,0.353,0.085,0.02], ...
              'String', '(d)', ...
              'FontSize', 25, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');
title( 'Precipitation Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize' , 28 , 'FontWeight' , 'normal' );       

axes( ax(8) )
[ C1 , H1 ] = contourf( lon_prate , 1:1:19 , prate_ano_La_eastward_move_year_used' * constant , label_prate , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_prate , 1:1:19 , prate_ano_La_eastward_move_year_used' * constant , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
stipple( X_prate , Y_prate , H_sign_La_prate' , ...
                           'marker' , 'o' , ...      % 强制圆点
                           'color' , [ 1 1 1 ] , ...       % 白色点
                           'MarkerSize' , 3.0 , ...    % 点大小
                           'MarkerFaceColor' , [ 1 1 1 ] ,...
                           'MarkerEdgeColor' , [ 1 1 1 ] ,...
                           'density' , 220 , ...      % 点密度
                           'resize' , true );        % 自动缩放
set( ax(8) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(8) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(8) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
     'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(8) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' , 'FontWeight' , 'normal'  );
caxis( [ label_prate( 2 ) label_prate( end - 1 ) ] );   
colormap( ax(8) , othercolor( 'BrBG8' , 14 ) );
annotation(   'textbox', [ 0.52,0.353,0.085,0.02], ...
              'String', '(h)', ...
              'FontSize', 25, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');
title( 'Precipitation Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize' , 28 , 'FontWeight' , 'normal' );             

axes( ax(9) )
[ C1 , H1 ] = contourf( lon_Qx , 1:1:19 , Qx_ano_El_eastward_move_year_used' / 1e7 , label_Qx  , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_Qx , 1:1:19 , Qx_ano_El_eastward_move_year_used' / 1e7 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
clear C2 H2
set( ax(9) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(9) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                               '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(9) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(9) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(9) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' );

caxis( [ -3.5 3.5 ] );
colormap( ax(9) , othercolor( 'RdYlBu8' , 14 ) );
stipple( X_Qx , Y_Qx , H_sign_El_Qx' , ...
             'marker' , 'o' , ...      % 强制圆点
             'color' , [ 1 1 1 ] , ...       % 白色点
             'MarkerSize' , 3.0 , ...    % 点大小
             'MarkerFaceColor' , [ 1 1 1 ] ,...
             'MarkerEdgeColor' , [ 1 1 1 ] ,...
             'density' , 220 , ...      % 点密度
             'resize' , true );        % 自动缩放
annotation(   'textbox', [ 0.094, 0.17, 0.085, 0.02], ...
              'String', '(e)', ...
              'FontSize', 22, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');  
title( 'Energy Transport Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize'  , 28 , 'Fontweight' , 'normal' );

axes( ax(10) )
[ C1 , H1 ] = contourf( lon_Qx , 1:1:19 , Qx_ano_La_eastward_move_year_used' / 1e7 , label_Qx  , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_Qx , 1:1:19 , Qx_ano_La_eastward_move_year_used' / 1e7 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
clear C2 H2
set( ax(10) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(10) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                               '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(10) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(10) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(10) , 'linewidth' , 1.5 , 'fontsize' , 24 , 'Fontname' , 'Times New Roman' );

caxis( [ -3.5 3.5 ] );
colormap( ax(10) , othercolor( 'RdYlBu8' , 14 ) );
stipple( X_Qx , Y_Qx , H_sign_La_Qx' , ...
             'marker' , 'o' , ...      % 强制圆点
             'color' , [ 1 1 1 ] , ...       % 白色点
             'MarkerSize' , 3.0 , ...    % 点大小
             'MarkerFaceColor' , [ 1 1 1 ] ,...
             'MarkerEdgeColor' , [ 1 1 1 ] ,...
             'density' , 220 , ...      % 点密度
             'resize' , true );        % 自动缩放
annotation(   'textbox', [ 0.52, 0.17, 0.085, 0.02], ...
              'String', '(i)', ...
              'FontSize', 22, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');  
title( 'Energy Transport Anomaly' , 'FontName' , 'Times New Roman' , 'FontSize'  , 28 , 'Fontweight' , 'normal' );



% === 第一行 colorbar ===
cb1 = colorbar(ax(4));   % 放在第一行右边子图上
cb1.Ticks = [ -2.4 : 0.8 : 2.4 ];
cb1.FontName = 'Times New Roman';
cb1_FontSize = 24;
cb1.Location = 'eastoutside';
cb1.Position = [0.91,0.57,0.015,0.16];   % [x y width height] 需微调

cb1.Label.String = '×10^9 kg·s^{-1}';
cb1.Label.FontSize = 24;
cb1.Label.FontName = 'Times New Roman';

% === 第二行 colorbar ===
cb2 = colorbar(ax(6));
cb2.Ticks = [ -0.04 : 0.02 : 0.04 ];
cb2.FontName = 'Times New Roman';
cb2.FontSize = 24;
cb2.Location = 'eastoutside';
cb2.Position = [0.91 0.385 0.015 0.16];

cb2.Label.String = 'Pa·s^{-1}';
cb2.Label.FontSize = 24;
cb2.Label.FontName = 'Times New Roman';


% === 第三行 colorbar ===
cb3 = colorbar(ax(8));
cb3.Ticks = [ -6.0 : 2.0 : 6.0 ];
cb3.FontName = 'Times New Roman';
cb3.FontSize = 24;
cb3.Location = 'eastoutside';
cb3.Position = [0.91 0.205 0.015 0.16];

cb3.Label.String = 'mm·day^{-1}';
cb3.Label.FontName = 'Times New Roman';
cb3.Label.FontSize = 24;

% === 第四行 colorbar ===
cb4 = colorbar(ax(10));
cb4.Ticks = [ -3.0 : 1 : 3.0 ];
cb4.FontName = 'Times New Roman';
cb4.FontSize = 24;
cb4.Location = 'eastoutside';
cb4.Position = [0.91 0.025 0.015 0.16];

cb4.Label.String = '×10^7 W·m^{-1}';
cb4.Label.FontName = 'Times New Roman';
cb4.Label.FontSize = 24;