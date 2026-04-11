clc;
clear all;
close all;
load( '../Data Store/ERSSTv5_SSTA_detrend_lowpass_197901_202412.mat' );
load( '../Data Store/NECP2_uwind_ano_Suf_detrend_lowpass_197901_202412.mat' );

lat_wind  = u_lat;
lon_wind  = u_lon;
time_wind = time_uwind;
clear u_lat u_lon time_uwind 
clear SST uwind_ano_3D vwind_ano_3D
%% Range of SST wind
lon_st = 40;
lon_la = 280;
lat_st = -10;
lat_la = 10;

id_lon_wind = intersect( find( lon_wind >= lon_st ) , find( lon_wind <= lon_la ) );
id_lat_wind = intersect( find( lat_wind >= lat_st ) , find( lat_wind <= lat_la ) );

id_lon_SSTA = intersect( find( lon_sst >= lon_st ) , find( lon_sst <= lon_la ) );
id_lat_SSTA = intersect( find( lat_sst >= lat_st ) , find( lat_sst <= lat_la ) );

SSTA_detrend_filter_used  = squeeze( nanmean( SSTA_3D_detrend_filter( id_lon_SSTA , id_lat_SSTA , : ) , 2 ) );
uwind_detrend_filter_used = squeeze( nanmean( uwind_ano_3D_Suf_detrend_filter( id_lon_wind , id_lat_wind , : ) , 2 ) );
%% El Nino Eastward propagating
El_Eastward_move_year  = [ 1982, 1987, 1994, 1997, 2009, 2015, 2023 ];
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

% SSTA
SSTA_El_Eastward_move_year_Jun_0 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Jun_0 );
SSTA_El_Eastward_move_year_Jul_0 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Jul_0 );
SSTA_El_Eastward_move_year_Aug_0 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Aug_0 );
SSTA_El_Eastward_move_year_Sep_0 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Sep_0 );
SSTA_El_Eastward_move_year_Oct_0 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Oct_0 );
SSTA_El_Eastward_move_year_Nov_0 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Nov_0 );
SSTA_El_Eastward_move_year_Dec_0 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Dec_0 );
SSTA_El_Eastward_move_year_Jan_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Jan_1 );
SSTA_El_Eastward_move_year_Feb_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Feb_1 );
SSTA_El_Eastward_move_year_Mar_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Mar_1 );
SSTA_El_Eastward_move_year_Apr_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Apr_1 );
SSTA_El_Eastward_move_year_May_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_May_1 );
SSTA_El_Eastward_move_year_Jun_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Jun_1 );
SSTA_El_Eastward_move_year_Jul_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Jul_1 );
SSTA_El_Eastward_move_year_Aug_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Aug_1 );
SSTA_El_Eastward_move_year_Sep_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Sep_1 );
SSTA_El_Eastward_move_year_Oct_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Oct_1 );
SSTA_El_Eastward_move_year_Nov_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Nov_1 );
SSTA_El_Eastward_move_year_Dec_1 = SSTA_detrend_filter_used( : , id_El_Eastward_move_year_Dec_1 );

SSTA_El_Eastward_move_year = cat( 3 , SSTA_El_Eastward_move_year_Jun_0 , SSTA_El_Eastward_move_year_Jul_0 , SSTA_El_Eastward_move_year_Aug_0 ,...
                                      SSTA_El_Eastward_move_year_Sep_0 , SSTA_El_Eastward_move_year_Oct_0 , SSTA_El_Eastward_move_year_Nov_0 ,...
                                      SSTA_El_Eastward_move_year_Dec_0 , SSTA_El_Eastward_move_year_Jan_1 , SSTA_El_Eastward_move_year_Feb_1 ,...
                                      SSTA_El_Eastward_move_year_Mar_1 , SSTA_El_Eastward_move_year_Apr_1 , SSTA_El_Eastward_move_year_May_1 ,...
                                      SSTA_El_Eastward_move_year_Jun_1 , SSTA_El_Eastward_move_year_Jul_1 , SSTA_El_Eastward_move_year_Aug_1 ,...
                                      SSTA_El_Eastward_move_year_Sep_1 , SSTA_El_Eastward_move_year_Oct_1 , SSTA_El_Eastward_move_year_Nov_1 ,...
                                      SSTA_El_Eastward_move_year_Dec_1 );

SSTA_El_Eastward_move_year_used  = squeeze( nanmean( SSTA_El_Eastward_move_year , 2 ) );
% SSTA student t-test
nlon_ssta  = size( SSTA_El_Eastward_move_year , 1 );
nmoth_ssta = size( SSTA_El_Eastward_move_year , 3 );
nyear_ssta = size( SSTA_El_Eastward_move_year , 2 );

SSTA_sign_El =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_ssta
    for imoth = 1 : nmoth_ssta
        SSTA_sign_El( ilon , imoth ) = ttest( squeeze( SSTA_El_Eastward_move_year( ilon , : , imoth ) )' , 0 , 'Alpha',0.05 );
    end
end
clear ilon imoth
SSTA_sign_El = SSTA_sign_El > 0;
% uwind
uwind_ano_El_Eastward_move_year_Jun_0 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Jun_0 );
uwind_ano_El_Eastward_move_year_Jul_0 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Jul_0 );
uwind_ano_El_Eastward_move_year_Aug_0 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Aug_0 );
uwind_ano_El_Eastward_move_year_Sep_0 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Sep_0 );
uwind_ano_El_Eastward_move_year_Oct_0 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Oct_0 );
uwind_ano_El_Eastward_move_year_Nov_0 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Nov_0 );
uwind_ano_El_Eastward_move_year_Dec_0 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Dec_0 );
uwind_ano_El_Eastward_move_year_Jan_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Jan_1 );
uwind_ano_El_Eastward_move_year_Feb_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Feb_1 );
uwind_ano_El_Eastward_move_year_Mar_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Mar_1 );
uwind_ano_El_Eastward_move_year_Apr_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Apr_1 );
uwind_ano_El_Eastward_move_year_May_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_May_1 );
uwind_ano_El_Eastward_move_year_Jun_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Jun_1 );
uwind_ano_El_Eastward_move_year_Jul_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Jul_1 );
uwind_ano_El_Eastward_move_year_Aug_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Aug_1 );
uwind_ano_El_Eastward_move_year_Sep_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Sep_1 );
uwind_ano_El_Eastward_move_year_Oct_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Oct_1 );
uwind_ano_El_Eastward_move_year_Nov_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Nov_1 );
uwind_ano_El_Eastward_move_year_Dec_1 = uwind_detrend_filter_used( :  , id_El_Eastward_move_year_Dec_1 );

uwind_El_Eastward_move_year = cat( 3 , uwind_ano_El_Eastward_move_year_Jun_0 , uwind_ano_El_Eastward_move_year_Jul_0 , uwind_ano_El_Eastward_move_year_Aug_0 ,...
                                       uwind_ano_El_Eastward_move_year_Sep_0 , uwind_ano_El_Eastward_move_year_Oct_0 , uwind_ano_El_Eastward_move_year_Nov_0 ,...
                                       uwind_ano_El_Eastward_move_year_Dec_0 , uwind_ano_El_Eastward_move_year_Jan_1 , uwind_ano_El_Eastward_move_year_Feb_1 ,...
                                       uwind_ano_El_Eastward_move_year_Mar_1 , uwind_ano_El_Eastward_move_year_Apr_1 , uwind_ano_El_Eastward_move_year_May_1 ,...
                                       uwind_ano_El_Eastward_move_year_Jun_1 , uwind_ano_El_Eastward_move_year_Jul_1 , uwind_ano_El_Eastward_move_year_Aug_1 ,...
                                       uwind_ano_El_Eastward_move_year_Sep_1 , uwind_ano_El_Eastward_move_year_Oct_1 , uwind_ano_El_Eastward_move_year_Nov_1 ,...
                                       uwind_ano_El_Eastward_move_year_Dec_1 );
uwind_El_Eastward_move_year_used  = squeeze( nanmean( uwind_El_Eastward_move_year , 2 ) );
% uwind student t-test
nlon_uwind  = size( uwind_El_Eastward_move_year , 1 );
nmoth_uwind = size( uwind_El_Eastward_move_year , 3 );
nyear_uwind = size( uwind_El_Eastward_move_year , 2 )

uwind_sign_El =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_uwind
    for imoth = 1 : nmoth_uwind
        uwind_sign_El( ilon , imoth ) = ttest( squeeze( uwind_El_Eastward_move_year( ilon , : , imoth ) )' , 0 ,  'Alpha',0.05 );
    end
end
clear ilon imoth
uwind_sign_El = uwind_sign_El > 0;
%% El Nino No Eastward propagating
El_No_Eastward_move_year  = [ 1986, 1991, 2002, 2004, 2006, 2014, 2018 ];
id_El_No_Eastward_move_year_Jun_0 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 - 6;
id_El_No_Eastward_move_year_Jul_0 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 - 5;
id_El_No_Eastward_move_year_Aug_0 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 - 4;
id_El_No_Eastward_move_year_Sep_0 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 - 3;
id_El_No_Eastward_move_year_Oct_0 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 - 2;
id_El_No_Eastward_move_year_Nov_0 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 - 1;
id_El_No_Eastward_move_year_Dec_0 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 0;
id_El_No_Eastward_move_year_Jan_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 1;
id_El_No_Eastward_move_year_Feb_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 2;
id_El_No_Eastward_move_year_Mar_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 3;
id_El_No_Eastward_move_year_Apr_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 4;
id_El_No_Eastward_move_year_May_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 5;
id_El_No_Eastward_move_year_Jun_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 6;
id_El_No_Eastward_move_year_Jul_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 7;
id_El_No_Eastward_move_year_Aug_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 8;
id_El_No_Eastward_move_year_Sep_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 9;
id_El_No_Eastward_move_year_Oct_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 10;
id_El_No_Eastward_move_year_Nov_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 11;
id_El_No_Eastward_move_year_Dec_1 = ( El_No_Eastward_move_year - 1979 + 1 ) * 12 + 12;

% SSTA
SSTA_El_No_Eastward_move_year_Jun_0 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Jun_0 );
SSTA_El_No_Eastward_move_year_Jul_0 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Jul_0 );
SSTA_El_No_Eastward_move_year_Aug_0 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Aug_0 );
SSTA_El_No_Eastward_move_year_Sep_0 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Sep_0 );
SSTA_El_No_Eastward_move_year_Oct_0 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Oct_0 );
SSTA_El_No_Eastward_move_year_Nov_0 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Nov_0 );
SSTA_El_No_Eastward_move_year_Dec_0 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Dec_0 );
SSTA_El_No_Eastward_move_year_Jan_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Jan_1 );
SSTA_El_No_Eastward_move_year_Feb_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Feb_1 );
SSTA_El_No_Eastward_move_year_Mar_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Mar_1 );
SSTA_El_No_Eastward_move_year_Apr_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Apr_1 );
SSTA_El_No_Eastward_move_year_May_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_May_1 );
SSTA_El_No_Eastward_move_year_Jun_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Jun_1 );
SSTA_El_No_Eastward_move_year_Jul_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Jul_1 );
SSTA_El_No_Eastward_move_year_Aug_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Aug_1 );
SSTA_El_No_Eastward_move_year_Sep_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Sep_1 );
SSTA_El_No_Eastward_move_year_Oct_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Oct_1 );
SSTA_El_No_Eastward_move_year_Nov_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Nov_1 );
SSTA_El_No_Eastward_move_year_Dec_1 = SSTA_detrend_filter_used( : , id_El_No_Eastward_move_year_Dec_1 );

SSTA_El_No_Eastward_move_year = cat( 3 , SSTA_El_No_Eastward_move_year_Jun_0 , SSTA_El_No_Eastward_move_year_Jul_0 , SSTA_El_No_Eastward_move_year_Aug_0 ,...
                                      SSTA_El_No_Eastward_move_year_Sep_0 , SSTA_El_No_Eastward_move_year_Oct_0 , SSTA_El_No_Eastward_move_year_Nov_0 ,...
                                      SSTA_El_No_Eastward_move_year_Dec_0 , SSTA_El_No_Eastward_move_year_Jan_1 , SSTA_El_No_Eastward_move_year_Feb_1 ,...
                                      SSTA_El_No_Eastward_move_year_Mar_1 , SSTA_El_No_Eastward_move_year_Apr_1 , SSTA_El_No_Eastward_move_year_May_1 ,...
                                      SSTA_El_No_Eastward_move_year_Jun_1 , SSTA_El_No_Eastward_move_year_Jul_1 , SSTA_El_No_Eastward_move_year_Aug_1 ,...
                                      SSTA_El_No_Eastward_move_year_Sep_1 , SSTA_El_No_Eastward_move_year_Oct_1 , SSTA_El_No_Eastward_move_year_Nov_1 ,...
                                      SSTA_El_No_Eastward_move_year_Dec_1 );

SSTA_El_No_Eastward_move_year_used  = squeeze( nanmean( SSTA_El_No_Eastward_move_year , 2 ) );
% SSTA student t-test
nlon_ssta  = size( SSTA_El_No_Eastward_move_year , 1 );
nmoth_ssta = size( SSTA_El_No_Eastward_move_year , 3 );
nyear_ssta = size( SSTA_El_No_Eastward_move_year , 2 );

SSTA_sign_El_No =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_ssta
    for imoth = 1 : nmoth_ssta
        SSTA_sign_El_No( ilon , imoth ) = ttest( squeeze( SSTA_El_No_Eastward_move_year( ilon , : , imoth ) )' , 0 , 'Alpha',0.05 );
    end
end
clear ilon imoth
SSTA_sign_El_No = SSTA_sign_El_No > 0;
% uwind
uwind_ano_El_No_Eastward_move_year_Jun_0 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Jun_0 );
uwind_ano_El_No_Eastward_move_year_Jul_0 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Jul_0 );
uwind_ano_El_No_Eastward_move_year_Aug_0 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Aug_0 );
uwind_ano_El_No_Eastward_move_year_Sep_0 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Sep_0 );
uwind_ano_El_No_Eastward_move_year_Oct_0 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Oct_0 );
uwind_ano_El_No_Eastward_move_year_Nov_0 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Nov_0 );
uwind_ano_El_No_Eastward_move_year_Dec_0 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Dec_0 );
uwind_ano_El_No_Eastward_move_year_Jan_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Jan_1 );
uwind_ano_El_No_Eastward_move_year_Feb_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Feb_1 );
uwind_ano_El_No_Eastward_move_year_Mar_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Mar_1 );
uwind_ano_El_No_Eastward_move_year_Apr_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Apr_1 );
uwind_ano_El_No_Eastward_move_year_May_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_May_1 );
uwind_ano_El_No_Eastward_move_year_Jun_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Jun_1 );
uwind_ano_El_No_Eastward_move_year_Jul_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Jul_1 );
uwind_ano_El_No_Eastward_move_year_Aug_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Aug_1 );
uwind_ano_El_No_Eastward_move_year_Sep_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Sep_1 );
uwind_ano_El_No_Eastward_move_year_Oct_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Oct_1 );
uwind_ano_El_No_Eastward_move_year_Nov_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Nov_1 );
uwind_ano_El_No_Eastward_move_year_Dec_1 = uwind_detrend_filter_used( : ,  id_El_No_Eastward_move_year_Dec_1 );

uwind_El_No_Eastward_move_year = cat( 3 , uwind_ano_El_No_Eastward_move_year_Jun_0 , uwind_ano_El_No_Eastward_move_year_Jul_0 , uwind_ano_El_No_Eastward_move_year_Aug_0 ,...
                                       uwind_ano_El_No_Eastward_move_year_Sep_0 , uwind_ano_El_No_Eastward_move_year_Oct_0 , uwind_ano_El_No_Eastward_move_year_Nov_0 ,...
                                       uwind_ano_El_No_Eastward_move_year_Dec_0 , uwind_ano_El_No_Eastward_move_year_Jan_1 , uwind_ano_El_No_Eastward_move_year_Feb_1 ,...
                                       uwind_ano_El_No_Eastward_move_year_Mar_1 , uwind_ano_El_No_Eastward_move_year_Apr_1 , uwind_ano_El_No_Eastward_move_year_May_1 ,...
                                       uwind_ano_El_No_Eastward_move_year_Jun_1 , uwind_ano_El_No_Eastward_move_year_Jul_1 , uwind_ano_El_No_Eastward_move_year_Aug_1 ,...
                                       uwind_ano_El_No_Eastward_move_year_Sep_1 , uwind_ano_El_No_Eastward_move_year_Oct_1 , uwind_ano_El_No_Eastward_move_year_Nov_1 ,...
                                       uwind_ano_El_No_Eastward_move_year_Dec_1 );
uwind_El_No_Eastward_move_year_used  = squeeze( nanmean( uwind_El_No_Eastward_move_year , 2 ) );
% uwind student t-test
nlon_uwind  = size( uwind_El_No_Eastward_move_year , 1 );
nmoth_uwind = size( uwind_El_No_Eastward_move_year , 3 );
nyear_uwind = size( uwind_El_No_Eastward_move_year , 2 )

uwind_sign_El_No =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_uwind
    for imoth = 1 : nmoth_uwind
        uwind_sign_El_No( ilon , imoth ) = ttest( squeeze( uwind_El_No_Eastward_move_year( ilon , : , imoth ) )' , 0 , 'Alpha',0.05 );
    end
end
clear ilon imoth
uwind_sign_El_No = uwind_sign_El_No > 0;
%% La Nina Eastward propagating
La_Eastward_move_year  = [ 1985 ,  2005 , 2008 , 2011 , 2017 , 2022 ];
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

% SSTA
SSTA_La_Eastward_move_year_Jun_0 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Jun_0 );
SSTA_La_Eastward_move_year_Jul_0 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Jul_0 );
SSTA_La_Eastward_move_year_Aug_0 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Aug_0 );
SSTA_La_Eastward_move_year_Sep_0 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Sep_0 );
SSTA_La_Eastward_move_year_Oct_0 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Oct_0 );
SSTA_La_Eastward_move_year_Nov_0 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Nov_0 );
SSTA_La_Eastward_move_year_Dec_0 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Dec_0 );
SSTA_La_Eastward_move_year_Jan_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Jan_1 );
SSTA_La_Eastward_move_year_Feb_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Feb_1 );
SSTA_La_Eastward_move_year_Mar_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Mar_1 );
SSTA_La_Eastward_move_year_Apr_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Apr_1 );
SSTA_La_Eastward_move_year_May_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_May_1 );
SSTA_La_Eastward_move_year_Jun_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Jun_1 );
SSTA_La_Eastward_move_year_Jul_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Jul_1 );
SSTA_La_Eastward_move_year_Aug_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Aug_1 );
SSTA_La_Eastward_move_year_Sep_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Sep_1 );
SSTA_La_Eastward_move_year_Oct_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Oct_1 );
SSTA_La_Eastward_move_year_Nov_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Nov_1 );
SSTA_La_Eastward_move_year_Dec_1 = SSTA_detrend_filter_used( : , id_La_Eastward_move_year_Dec_1 );

SSTA_La_Eastward_move_year = cat( 3 , SSTA_La_Eastward_move_year_Jun_0 , SSTA_La_Eastward_move_year_Jul_0 , SSTA_La_Eastward_move_year_Aug_0 ,...
                                      SSTA_La_Eastward_move_year_Sep_0 , SSTA_La_Eastward_move_year_Oct_0 , SSTA_La_Eastward_move_year_Nov_0 ,...
                                      SSTA_La_Eastward_move_year_Dec_0 , SSTA_La_Eastward_move_year_Jan_1 , SSTA_La_Eastward_move_year_Feb_1 ,...
                                      SSTA_La_Eastward_move_year_Mar_1 , SSTA_La_Eastward_move_year_Apr_1 , SSTA_La_Eastward_move_year_May_1 ,...
                                      SSTA_La_Eastward_move_year_Jun_1 , SSTA_La_Eastward_move_year_Jul_1 , SSTA_La_Eastward_move_year_Aug_1 ,...
                                      SSTA_La_Eastward_move_year_Sep_1 , SSTA_La_Eastward_move_year_Oct_1 , SSTA_La_Eastward_move_year_Nov_1 ,...
                                      SSTA_La_Eastward_move_year_Dec_1 );

SSTA_La_Eastward_move_year_used  = squeeze( nanmean( SSTA_La_Eastward_move_year , 2 ) );
% SSTA student t-test
nlon_ssta  = size( SSTA_La_Eastward_move_year , 1 );
nmoth_ssta = size( SSTA_La_Eastward_move_year , 3 );
nyear_ssta = size( SSTA_La_Eastward_move_year , 2 );

SSTA_sign_La =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_ssta
    for imoth = 1 : nmoth_ssta
        SSTA_sign_La( ilon , imoth ) = ttest( squeeze( SSTA_La_Eastward_move_year( ilon , : , imoth ) )' , 0 , 'Alpha',0.05 );
    end
end
clear ilon imoth
SSTA_sign_La = SSTA_sign_La > 0;
% uwind
uwind_ano_La_Eastward_move_year_Jun_0 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Jun_0 );
uwind_ano_La_Eastward_move_year_Jul_0 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Jul_0 );
uwind_ano_La_Eastward_move_year_Aug_0 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Aug_0 );
uwind_ano_La_Eastward_move_year_Sep_0 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Sep_0 );
uwind_ano_La_Eastward_move_year_Oct_0 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Oct_0 );
uwind_ano_La_Eastward_move_year_Nov_0 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Nov_0 );
uwind_ano_La_Eastward_move_year_Dec_0 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Dec_0 );
uwind_ano_La_Eastward_move_year_Jan_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Jan_1 );
uwind_ano_La_Eastward_move_year_Feb_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Feb_1 );
uwind_ano_La_Eastward_move_year_Mar_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Mar_1 );
uwind_ano_La_Eastward_move_year_Apr_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Apr_1 );
uwind_ano_La_Eastward_move_year_May_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_May_1 );
uwind_ano_La_Eastward_move_year_Jun_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Jun_1 );
uwind_ano_La_Eastward_move_year_Jul_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Jul_1 );
uwind_ano_La_Eastward_move_year_Aug_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Aug_1 );
uwind_ano_La_Eastward_move_year_Sep_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Sep_1 );
uwind_ano_La_Eastward_move_year_Oct_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Oct_1 );
uwind_ano_La_Eastward_move_year_Nov_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Nov_1 );
uwind_ano_La_Eastward_move_year_Dec_1 = uwind_detrend_filter_used( : ,  id_La_Eastward_move_year_Dec_1 );

uwind_La_Eastward_move_year = cat( 3 , uwind_ano_La_Eastward_move_year_Jun_0 , uwind_ano_La_Eastward_move_year_Jul_0 , uwind_ano_La_Eastward_move_year_Aug_0 ,...
                                       uwind_ano_La_Eastward_move_year_Sep_0 , uwind_ano_La_Eastward_move_year_Oct_0 , uwind_ano_La_Eastward_move_year_Nov_0 ,...
                                       uwind_ano_La_Eastward_move_year_Dec_0 , uwind_ano_La_Eastward_move_year_Jan_1 , uwind_ano_La_Eastward_move_year_Feb_1 ,...
                                       uwind_ano_La_Eastward_move_year_Mar_1 , uwind_ano_La_Eastward_move_year_Apr_1 , uwind_ano_La_Eastward_move_year_May_1 ,...
                                       uwind_ano_La_Eastward_move_year_Jun_1 , uwind_ano_La_Eastward_move_year_Jul_1 , uwind_ano_La_Eastward_move_year_Aug_1 ,...
                                       uwind_ano_La_Eastward_move_year_Sep_1 , uwind_ano_La_Eastward_move_year_Oct_1 , uwind_ano_La_Eastward_move_year_Nov_1 ,...
                                       uwind_ano_La_Eastward_move_year_Dec_1 );
uwind_La_Eastward_move_year_used  = squeeze( nanmean( uwind_La_Eastward_move_year , 2 ) );
% uwind student t-test
nlon_uwind  = size( uwind_La_Eastward_move_year , 1 );
nmoth_uwind = size( uwind_La_Eastward_move_year , 3 );
nyear_uwind = size( uwind_La_Eastward_move_year , 2 )

uwind_sign_La =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_uwind
    for imoth = 1 : nmoth_uwind
        uwind_sign_La( ilon , imoth ) = ttest( squeeze( uwind_La_Eastward_move_year( ilon , : , imoth ) )' , 0 , 'Alpha',0.05 );
    end
end
clear ilon imoth
uwind_sign_La = uwind_sign_La > 0;
%% La Nina No Eastward propagating
La_No_Eastward_move_year  = [ 1983 , 1984 , 1988 , 1995 , 1998 , 1999 , 2000 , 2007 , 2010 , 2020 , 2021 ];
id_La_No_Eastward_move_year_Jun_0 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 - 6;
id_La_No_Eastward_move_year_Jul_0 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 - 5;
id_La_No_Eastward_move_year_Aug_0 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 - 4;
id_La_No_Eastward_move_year_Sep_0 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 - 3;
id_La_No_Eastward_move_year_Oct_0 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 - 2;
id_La_No_Eastward_move_year_Nov_0 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 - 1;
id_La_No_Eastward_move_year_Dec_0 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 0;
id_La_No_Eastward_move_year_Jan_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 1;
id_La_No_Eastward_move_year_Feb_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 2;
id_La_No_Eastward_move_year_Mar_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 3;
id_La_No_Eastward_move_year_Apr_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 4;
id_La_No_Eastward_move_year_May_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 5;
id_La_No_Eastward_move_year_Jun_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 6;
id_La_No_Eastward_move_year_Jul_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 7;
id_La_No_Eastward_move_year_Aug_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 8;
id_La_No_Eastward_move_year_Sep_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 9;
id_La_No_Eastward_move_year_Oct_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 10;
id_La_No_Eastward_move_year_Nov_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 11;
id_La_No_Eastward_move_year_Dec_1 = ( La_No_Eastward_move_year - 1979 + 1 ) * 12 + 12;

% SSTA
SSTA_La_No_Eastward_move_year_Jun_0 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Jun_0 );
SSTA_La_No_Eastward_move_year_Jul_0 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Jul_0 );
SSTA_La_No_Eastward_move_year_Aug_0 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Aug_0 );
SSTA_La_No_Eastward_move_year_Sep_0 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Sep_0 );
SSTA_La_No_Eastward_move_year_Oct_0 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Oct_0 );
SSTA_La_No_Eastward_move_year_Nov_0 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Nov_0 );
SSTA_La_No_Eastward_move_year_Dec_0 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Dec_0 );
SSTA_La_No_Eastward_move_year_Jan_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Jan_1 );
SSTA_La_No_Eastward_move_year_Feb_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Feb_1 );
SSTA_La_No_Eastward_move_year_Mar_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Mar_1 );
SSTA_La_No_Eastward_move_year_Apr_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Apr_1 );
SSTA_La_No_Eastward_move_year_May_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_May_1 );
SSTA_La_No_Eastward_move_year_Jun_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Jun_1 );
SSTA_La_No_Eastward_move_year_Jul_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Jul_1 );
SSTA_La_No_Eastward_move_year_Aug_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Aug_1 );
SSTA_La_No_Eastward_move_year_Sep_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Sep_1 );
SSTA_La_No_Eastward_move_year_Oct_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Oct_1 );
SSTA_La_No_Eastward_move_year_Nov_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Nov_1 );
SSTA_La_No_Eastward_move_year_Dec_1 = SSTA_detrend_filter_used( : , id_La_No_Eastward_move_year_Dec_1 );

SSTA_La_No_Eastward_move_year = cat( 3 , SSTA_La_No_Eastward_move_year_Jun_0 , SSTA_La_No_Eastward_move_year_Jul_0 , SSTA_La_No_Eastward_move_year_Aug_0 ,...
                                      SSTA_La_No_Eastward_move_year_Sep_0 , SSTA_La_No_Eastward_move_year_Oct_0 , SSTA_La_No_Eastward_move_year_Nov_0 ,...
                                      SSTA_La_No_Eastward_move_year_Dec_0 , SSTA_La_No_Eastward_move_year_Jan_1 , SSTA_La_No_Eastward_move_year_Feb_1 ,...
                                      SSTA_La_No_Eastward_move_year_Mar_1 , SSTA_La_No_Eastward_move_year_Apr_1 , SSTA_La_No_Eastward_move_year_May_1 ,...
                                      SSTA_La_No_Eastward_move_year_Jun_1 , SSTA_La_No_Eastward_move_year_Jul_1 , SSTA_La_No_Eastward_move_year_Aug_1 ,...
                                      SSTA_La_No_Eastward_move_year_Sep_1 , SSTA_La_No_Eastward_move_year_Oct_1 , SSTA_La_No_Eastward_move_year_Nov_1 ,...
                                      SSTA_La_No_Eastward_move_year_Dec_1 );

SSTA_La_No_Eastward_move_year_used  = squeeze( nanmean( SSTA_La_No_Eastward_move_year , 2 ) );
% SSTA student t-test
nlon_ssta  = size( SSTA_La_No_Eastward_move_year , 1 );
nmoth_ssta = size( SSTA_La_No_Eastward_move_year , 3 );
nyear_ssta = size( SSTA_La_No_Eastward_move_year , 2 );

SSTA_sign_La_No =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_ssta
    for imoth = 1 : nmoth_ssta
        SSTA_sign_La_No( ilon , imoth ) = ttest( squeeze( SSTA_La_No_Eastward_move_year( ilon , : , imoth ) )' , 0 , 'Alpha',0.05 );
    end
end
clear ilon imoth
SSTA_sign_La_No = SSTA_sign_La_No > 0;
% uwind
uwind_ano_La_No_Eastward_move_year_Jun_0 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Jun_0 );
uwind_ano_La_No_Eastward_move_year_Jul_0 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Jul_0 );
uwind_ano_La_No_Eastward_move_year_Aug_0 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Aug_0 );
uwind_ano_La_No_Eastward_move_year_Sep_0 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Sep_0 );
uwind_ano_La_No_Eastward_move_year_Oct_0 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Oct_0 );
uwind_ano_La_No_Eastward_move_year_Nov_0 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Nov_0 );
uwind_ano_La_No_Eastward_move_year_Dec_0 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Dec_0 );
uwind_ano_La_No_Eastward_move_year_Jan_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Jan_1 );
uwind_ano_La_No_Eastward_move_year_Feb_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Feb_1 );
uwind_ano_La_No_Eastward_move_year_Mar_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Mar_1 );
uwind_ano_La_No_Eastward_move_year_Apr_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Apr_1 );
uwind_ano_La_No_Eastward_move_year_May_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_May_1 );
uwind_ano_La_No_Eastward_move_year_Jun_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Jun_1 );
uwind_ano_La_No_Eastward_move_year_Jul_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Jul_1 );
uwind_ano_La_No_Eastward_move_year_Aug_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Aug_1 );
uwind_ano_La_No_Eastward_move_year_Sep_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Sep_1 );
uwind_ano_La_No_Eastward_move_year_Oct_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Oct_1 );
uwind_ano_La_No_Eastward_move_year_Nov_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Nov_1 );
uwind_ano_La_No_Eastward_move_year_Dec_1 = uwind_detrend_filter_used( : ,  id_La_No_Eastward_move_year_Dec_1 );

uwind_La_No_Eastward_move_year = cat( 3 , uwind_ano_La_No_Eastward_move_year_Jun_0 , uwind_ano_La_No_Eastward_move_year_Jul_0 , uwind_ano_La_No_Eastward_move_year_Aug_0 ,...
                                       uwind_ano_La_No_Eastward_move_year_Sep_0 , uwind_ano_La_No_Eastward_move_year_Oct_0 , uwind_ano_La_No_Eastward_move_year_Nov_0 ,...
                                       uwind_ano_La_No_Eastward_move_year_Dec_0 , uwind_ano_La_No_Eastward_move_year_Jan_1 , uwind_ano_La_No_Eastward_move_year_Feb_1 ,...
                                       uwind_ano_La_No_Eastward_move_year_Mar_1 , uwind_ano_La_No_Eastward_move_year_Apr_1 , uwind_ano_La_No_Eastward_move_year_May_1 ,...
                                       uwind_ano_La_No_Eastward_move_year_Jun_1 , uwind_ano_La_No_Eastward_move_year_Jul_1 , uwind_ano_La_No_Eastward_move_year_Aug_1 ,...
                                       uwind_ano_La_No_Eastward_move_year_Sep_1 , uwind_ano_La_No_Eastward_move_year_Oct_1 , uwind_ano_La_No_Eastward_move_year_Nov_1 ,...
                                       uwind_ano_La_No_Eastward_move_year_Dec_1 );
uwind_La_No_Eastward_move_year_used  = squeeze( nanmean( uwind_La_No_Eastward_move_year , 2 ) );
% uwind student t-test
nlon_uwind  = size( uwind_La_No_Eastward_move_year , 1 );
nmoth_uwind = size( uwind_La_No_Eastward_move_year , 3 );
nyear_uwind = size( uwind_La_No_Eastward_move_year , 2 )

uwind_sign_La_No =NaN( nlon_ssta , nmoth_ssta );
for ilon = 1 : nlon_uwind
    for imoth = 1 : nmoth_uwind
        uwind_sign_La_No( ilon , imoth ) = ttest( squeeze( uwind_La_No_Eastward_move_year( ilon , : , imoth ) )' , 0 , 'Alpha',0.05 );
    end
end
clear ilon imoth
uwind_sign_La_No = uwind_sign_La_No > 0;
%%
nlon   = size( SSTA_3D_detrend , 1 );
nlat   = size( SSTA_3D_detrend , 2 );
ntime  = size( SSTA_3D_detrend , 3 );

lon_nino34_st = 190; 
lon_nino34_la = 240;
lat_nino34_st = -5;
lat_nino34_la = 5;
id_lon_nino34  = intersect( find( lon_sst >= lon_nino34_st ) , find( lon_sst <= lon_nino34_la ) );
id_lat_nino34  = intersect( find( lat_sst >= lat_nino34_st ) , find( lat_sst <= lat_nino34_la ) );

SSTA_nino34  = SSTA_3D_detrend( id_lon_nino34 , id_lat_nino34 , : );
Nino34_Index = squeeze( nanmean( squeeze( nanmean( SSTA_nino34 , 1 ) ) , 1 ) ); 
Nino34_Index = Nino34_Index';
Nino34_Index_three_run = NaN( ntime , 1 );
for inum = 1 : ntime
    if inum == 1
        Nino34_Index_three_run( inum ) = Nino34_Index( inum );
    elseif inum == 552
        Nino34_Index_three_run( inum ) = Nino34_Index( inum );
    else
        Nino34_Index_three_run( inum ) = mean( Nino34_Index( inum - 1 : inum + 1 ) );
    end
end 
clear inum
%%
El_Nino_year = [ 1982 , 1986 , 1987 , 1991 , 1994 , 1997 , 2002 ,...
                 2004 , 2006 , 2009 , 2014 , 2015 , 2018 , 2023 ];
La_Nina_year = [ 1983 , 1984 , 1985 , 1988 , 1995 , 1998 , 1999 , 2000 ,...
                 2005 , 2007 , 2008 , 2010 , 2011 , 2017 , 2020 , 2021 , 2022 ];

El_Nino_year_Dec_0 = NaN( length( El_Nino_year ) , 1 );
El_Nino_year_Jul_1 = NaN( length( El_Nino_year ) , 1 );
El_Nino_year_Oct_1 = NaN( length( El_Nino_year ) , 1 );

La_Nina_year_Dec_0 = NaN( length( La_Nina_year ) , 1 );
La_Nina_year_Jul_1 = NaN( length( La_Nina_year ) , 1 );
La_Nina_year_Oct_1 = NaN( length( La_Nina_year ) , 1 );

for itime = 1 : length( El_Nino_year)
    year = El_Nino_year( itime );
    El_Nino_year_Dec_0( itime ) = Nino34_Index_three_run( ( year - 1979 ) * 12 + 12 );
    El_Nino_year_Jul_1( itime ) = Nino34_Index_three_run( ( year - 1979 ) * 12 + 12 + 7 );
    El_Nino_year_Oct_1( itime ) = Nino34_Index_three_run( ( year - 1979 ) * 12 + 12 + 10 );
end

El_Nino_decay_speed = ( El_Nino_year_Dec_0 - El_Nino_year_Oct_1 ) ./ 10;


for itime = 1 : length( La_Nina_year)
    year = La_Nina_year( itime );
    La_Nina_year_Dec_0( itime ) = Nino34_Index_three_run( ( year - 1979 ) * 12 + 12 );
    La_Nina_year_Oct_1( itime ) = Nino34_Index_three_run( ( year - 1979 ) * 12 + 12 + 10 );
end

La_Nina_decay_speed = ( La_Nina_year_Dec_0 - La_Nina_year_Oct_1 ) ./ 10;
%%
lon_PCE_st = 180;
lon_PCE_la = 240;
lat_PCE_st = -10;
lat_PCE_la = 10;
id_lon_PCE  = intersect( find( lon_sst >= lon_PCE_st ) , find( lon_sst <= lon_PCE_la ) );
id_lat_PCE  = intersect( find( lat_sst >= lat_PCE_st ) , find( lat_sst <= lat_PCE_la ) );

SSTA_PCE  = SSTA_3D_detrend( id_lon_PCE , id_lat_PCE , : );
PCE_Index = squeeze( nanmean( squeeze( nanmean( SSTA_PCE , 1 ) ) , 1 ) ); 
PCE_Index = PCE_Index';
%%
PCE_Index_three_smooth = NaN( 552 , 1 );
for imonth = 1 : 552
    if imonth == 1       
        PCE_Index_three_smooth( imonth ) = PCE_Index( imonth );
    elseif imonth == 552
        PCE_Index_three_smooth( imonth ) = PCE_Index( imonth );
    else
        PCE_Index_three_smooth( imonth ) = mean( PCE_Index( imonth - 1 : imonth + 1 ) );    
    end
end        
%%
lon_MC_st = 115;
lon_MC_la = 160;
lat_MC_st = -10;
lat_MC_la = 10;
id_lon_MC  = intersect( find( lon_sst >= lon_MC_st ) , find( lon_sst <= lon_MC_la ) );
id_lat_MC  = intersect( find( lat_sst >= lat_MC_st ) , find( lat_sst <= lat_MC_la ) );

SSTA_MC  = SSTA_3D_detrend( id_lon_MC , id_lat_MC , : );
MC_Index = squeeze( nanmean( squeeze( nanmean( SSTA_MC , 1 ) ) , 1 ) ); 
MC_Index = MC_Index';
%%
MC_Index_three_smooth = NaN( 552 , 1 );
for imonth = 1 : 552
    if imonth == 1       
        MC_Index_three_smooth( imonth ) = MC_Index( imonth );
    elseif imonth == 552
        MC_Index_three_smooth( imonth ) = MC_Index( imonth );
    else
        MC_Index_three_smooth( imonth ) = mean( MC_Index( imonth - 1 : imonth + 1 ) );    
    end
end    
clear imonth
%%
MC_Index = MC_Index_three_smooth;
MC_SST_Change_Speed = NaN( 45 , 1 );
for inum = 1 : 45
    id_year_st_Dec_0 = ( inum - 1 ) * 12 + 12;
    id_year_la_Oct_1 = ( inum + 0 ) * 12 + 10;
    MC_SST_Change_Speed( inum ) = ( mean( MC_Index( id_year_st_Dec_0 ) ) - ...
                                    mean( MC_Index( id_year_la_Oct_1 ) ) ) ./ 10;
end
MC_SST_Change_Speed( : , 2 ) = [ 1979 : 1 : 2023 ];
%%
El_Eastmove_year = [ 1982 , 1987 , 1994 , 1997 , 2009 , 2015 , 2023 ];
El_No_Eastmove_year = [ 1986 , 1991 , 2002 , 2004 , 2006 , 2014 , 2018 ];

MC_El_Eastmove_Year = [];
MC_El_No_Eastmove_Year = [];
for n = 1 : 45
    if ismember( MC_SST_Change_Speed( n , 2 ) , El_Eastmove_year )
        MC_El_Eastmove_Year = [ MC_El_Eastmove_Year , MC_SST_Change_Speed( n , 1 ) ];
    elseif ismember( MC_SST_Change_Speed( n , 2 ) , El_No_Eastmove_year )
        MC_El_No_Eastmove_Year = [ MC_El_No_Eastmove_Year , MC_SST_Change_Speed( n , 1 ) ];
    end  
end
clear n
Decay_speed_El_Eastmove_Year = [];
Decay_speed_El_No_Eastmove_Year = [];
for n = 1 : length( El_Nino_year )
    if ismember( El_Nino_year( n ) , El_Eastmove_year )
        Decay_speed_El_Eastmove_Year = [ Decay_speed_El_Eastmove_Year , El_Nino_decay_speed( n ) ];
    elseif ismember( El_Nino_year( n ) , El_No_Eastmove_year )
        Decay_speed_El_No_Eastmove_Year = [ Decay_speed_El_No_Eastmove_Year , El_Nino_decay_speed( n ) ];
    end  
end
clear n
%%
La_Eastmove_year = [ 1985, 2005, 2008, 2011, 2017,  2022 ];
La_No_Eastmove_year = [ 1983, 1984, 1988, 1995, 1998, 1999, 2000, 2007, 2010, 2020, 2021 ];
MC_La_Eastmove_Year = [];
MC_La_No_Eastmove_Year = [];
for n = 1 : 45
    if ismember( MC_SST_Change_Speed( n , 2 ) , La_Eastmove_year )
        MC_La_Eastmove_Year = [ MC_La_Eastmove_Year , MC_SST_Change_Speed( n , 1 ) ];
    elseif ismember( MC_SST_Change_Speed( n , 2 ) , La_No_Eastmove_year )
        MC_La_No_Eastmove_Year = [ MC_La_No_Eastmove_Year , MC_SST_Change_Speed( n , 1 ) ];
    end  
end

Decay_speed_La_Eastmove_Year = [];
Decay_speed_La_No_Eastmove_Year = [];
for n = 1 : length( La_Nina_year )
    if ismember( La_Nina_year( n ) , La_Eastmove_year )
        Decay_speed_La_Eastmove_Year = [ Decay_speed_La_Eastmove_Year , La_Nina_decay_speed( n ) ];
    elseif ismember( La_Nina_year( n ) , La_No_Eastmove_year )
        Decay_speed_La_No_Eastmove_Year = [ Decay_speed_La_No_Eastmove_Year , La_Nina_decay_speed( n ) ];
    end  
end
clear n
%%
label_sst = -1.1 : 0.1 : 1.5;
colornew1 = [   26, 36, 220
                36, 73, 254
                47, 105, 255
                60, 132, 255
                74, 157, 255
                90, 180, 255
                127, 219, 255
                148, 232, 255
                169, 242, 255
                190, 250, 255
                219, 254, 255     
                
                255, 252, 219               
                255, 248, 194
                255, 232, 172
                255, 219, 154
                255, 209, 136
                255, 185, 127
                255, 157, 109
                255, 130, 94
                255, 110, 76
                255, 90, 64
                255, 72, 50
                251, 53, 48
                244, 37, 43
                223, 25, 41
                166, 0, 33 ] / 255;
            
%
load( '../Data Store/NECP2_ENSO_contour_zero_line.mat' );

[ X_SSTA , Y_SSTA ] = meshgrid( lon_sst( id_lon_SSTA )  , 1:1:19 );
[ X_wind , Y_wind ] = meshgrid( lon_wind( id_lon_wind ) , 1:1:19 );
figure(1)
set(gcf,'position',[0 0 2000 2200],'color', 'w');  
[ ax , ~ ]  = tight_subplot( 4 , 2 , [ 0.05 0.08 ] , [ 0.05 0.05 ] , [ 0.05 0.10 ] );

for k = 5:8
    delete(ax(k));
end

axes( ax(1) )
[ C1 , H1 ] = contourf( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_El_Eastward_move_year_used' , label_sst , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_El_Eastward_move_year_used' , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
clear C2 H2
set( ax(1) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(1) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                               '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(1) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(1) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(1) , 'linewidth' , 1.5 , 'fontsize' , 20 , 'Fontname' , 'Times New Roman' );
caxis( [ -1.1 1.5 ] );
colormap( colornew1 );


stipple( X_SSTA , Y_SSTA , SSTA_sign_El' , ...
             'marker' , 'o' , ...      % 强制圆点
             'color' , [ 0.5 0.5 0.5 ] , ...       % 白色点
             'MarkerSize' , 3.2 , ...    % 点大小
             'MarkerFaceColor' , [ 0.5 0.5 0.5 ] ,...
             'MarkerEdgeColor' , [ 0.5 0.5 0.5 ] ,...
             'density' , 200 , ...      % 点密度
             'resize' , true );        % 自动缩放
annotation(   'textbox', [ 0.045, 0.950, 0.085, 0.02], ...
              'String', '(a)', ...
              'FontSize', 22, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');  
title( 'El Nino with E-IPWC' , 'FontName' , 'Times New Roman' , 'FontSize'  , 24 , 'Fontweight' , 'normal' );
posAxes = get( ax(1) , 'Position' );
posX    = posAxes(1);
posY    = posAxes(2);
width   = posAxes(3);
height  = posAxes(4);

% 获取 Axes 范围
limX = get( gca , 'Xlim' );
limY = get( gca , 'Ylim' );
minX = limX( 1 );
maxX = limX( 2 );

minY = limY( 1 );
maxY = limY( 2 );

% 转换坐标
xNew = posX + (X_wind - minX) / (maxX - minX) * width;
yNew = posY + (Y_wind - minY) / (maxY - minY) * height;

% 画风场
lon1 = 1;
lon2 = 128;
W_d_El = 0;
U_d_El = uwind_El_Eastward_move_year_used';

n=0.012;   % 调整箭头的长度
for itime = 2 : 2 : 18 % 不画最底层和最高层
    for ilon = 2 : 5 : 127
        if uwind_sign_El( ilon ,itime )
            if xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            elseif xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ], ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            else                                               
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,60]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            end
        end
    end
end
%
El_zero_position        = find( C2_El_East( 1 , : ) == 0 );
El_zero_position_num   = C2_El_East( 2 , El_zero_position );
El_true_zero_judge = El_zero_position_num == fix( El_zero_position_num );
El_zero_position_new = [];
for inum = 1:length( El_zero_position ) 
    if El_true_zero_judge( inum )
        El_zero_position_new = [ El_zero_position_new , El_zero_position( inum ) ];
    end
end
El_zero_position_num_new   = C2_El_East( 2 , El_zero_position_new );

 for iline = 1
     plot( C2_El_East( 1 , El_zero_position_new( iline )+1 : El_zero_position_new( iline )+El_zero_position_num_new(iline) ) ,...
           C2_El_East( 2 , El_zero_position_new( iline )+1 : El_zero_position_new( iline )+El_zero_position_num_new(iline) ) ,...
           'color' , 'r' , 'LineWidth' , 8 , 'LineStyle', '-.' );
 end
% [0,140,60]/255

axes( ax(2) )
[ C1 , H1 ] = contourf( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_El_No_Eastward_move_year_used' , label_sst , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_El_No_Eastward_move_year_used' , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
clear C2 H2
set( ax(2) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(2) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(2) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(2) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(2) , 'linewidth' , 1.5 , 'fontsize' , 20 , 'Fontname' , 'Times New Roman' );
caxis( [ -1.1 1.5 ] );
colormap( colornew1 );



stipple( X_SSTA , Y_SSTA , SSTA_sign_El_No' , ...
             'marker' , 'o' , ...      % 强制圆点
             'color' , [ 0.5 0.5 0.5 ] , ...       % 灰色点
             'MarkerSize' , 3.2 , ...    % 点大小
             'MarkerFaceColor' , [ 0.5 0.5 0.5 ] ,...
             'MarkerEdgeColor' , [ 0.5 0.5 0.5 ] ,...
             'density' , 200 , ...      % 点密度
             'resize' , true );        % 自动缩放
annotation(   'textbox', [ 0.51, 0.950, 0.085, 0.02], ...
              'String', '(b)', ...
              'FontSize', 22, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');
title( 'El Nino without E-IPWC' , 'FontName' , 'Times New Roman' , 'FontSize'  , 24 , 'Fontweight' , 'normal' );



posAxes = get( ax(2) , 'Position' );
posX    = posAxes(1);
posY    = posAxes(2);
width   = posAxes(3);
height  = posAxes(4);

% 获取 Axes 范围
limX = get( gca , 'Xlim' );
limY = get( gca , 'Ylim' );
minX = limX( 1 );
maxX = limX( 2 );
minY = limY( 1 );
maxY = limY( 2 );

% 转换坐标
xNew = posX + (X_wind - minX) / (maxX - minX) * width;
yNew = posY + (Y_wind - minY) / (maxY - minY) * height;


W_d_El = 0;
U_d_El = uwind_El_No_Eastward_move_year_used';

n=0.012;   % 调整箭头的长度
for itime = 2 : 2 : 18 % 不画最底层和最高层
    for ilon = 2 : 5 : 127
        if uwind_sign_El( ilon ,itime )
            if xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            elseif xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ], ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            else                                               
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,60]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            end
        end
    end
end
%
El_No_zero_position        = find( C2_El_No_East( 1 , : ) == 0 );
El_No_zero_position_num   = C2_El_No_East( 2 , El_No_zero_position );
El_No_true_zero_judge = El_No_zero_position_num == fix( El_No_zero_position_num );
El_No_zero_position_new = [];
for inum = 1 : length( El_No_zero_position ) 
    if El_No_true_zero_judge( inum )
        El_No_zero_position_new = [ El_No_zero_position_new , El_No_zero_position( inum ) ];
    end
end
El_No_zero_position_num_new   = C2_El_No_East( 2 , El_No_zero_position_new );
for iline = 2  
    plot( C2_El_No_East( 1 , El_No_zero_position_new( iline )+1 : El_No_zero_position_new( iline )+El_No_zero_position_num_new(iline) ) ,...
          C2_El_No_East( 2 , El_No_zero_position_new( iline )+1 : El_No_zero_position_new( iline )+El_No_zero_position_num_new(iline) ) ,...
          'color' , 'r' , 'LineWidth' , 8 , 'LineStyle', '-.' );
end


axes( ax(3) )
[ C1 , H1 ] = contourf( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_La_Eastward_move_year_used' , label_sst , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_La_Eastward_move_year_used' , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
clear C2 H2
set( ax(3) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(3) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(3) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(3) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(3) , 'linewidth' , 1.5 , 'fontsize' , 20 , 'Fontname' , 'Times New Roman' );
caxis( [ -1.1 1.5 ] );
colormap( colornew1 );



stipple( X_SSTA , Y_SSTA , SSTA_sign_La' , ...
             'marker' , 'o' , ...      % 强制圆点
             'color' , [ 0.5 0.5 0.5 ] , ...       % 白色点
             'MarkerSize' , 3.2 , ...    % 点大小
             'MarkerFaceColor' , [ 0.5 0.5 0.5 ] ,...
             'MarkerEdgeColor' , [ 0.5 0.5 0.5 ] ,...
             'density' , 200 , ...      % 点密度
             'resize' , true );        % 自动缩放
 
annotation(   'textbox', [ 0.045, 0.712, 0.085, 0.02], ...
              'String', '(c)', ...
              'FontSize', 22, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');  
title( 'La Nina with E-IPWC' , 'FontName' , 'Times New Roman' , 'FontSize'  , 24 , 'Fontweight' , 'normal' );
posAxes = get( ax(3) , 'Position' );
posX    = posAxes(1);
posY    = posAxes(2);
width   = posAxes(3);
height  = posAxes(4);

% 获取 Axes 范围
limX = get( gca , 'Xlim' );
limY = get( gca , 'Ylim' );
minX = limX( 1 );
maxX = limX( 2 );
minY = limY( 1 );
maxY = limY( 2 );

% 转换坐标
xNew = posX + (X_wind - minX) / (maxX - minX) * width;
yNew = posY + (Y_wind - minY) / (maxY - minY) * height;

% 画风场
% [ ~ , lon1 ] = find( X_wind( 1 , : ) == limX( 1 ) );
% [ ~ , lon2 ] = find( X_wind( 1 , : ) == limX( 2 ) );
W_d_El = 0;
U_d_El = uwind_La_Eastward_move_year_used';

n=0.012;   % 调整箭头的长度
for itime = 2 : 2 : 18 % 不画最底层和最高层
    for ilon = 2 : 5 : 127
        if uwind_sign_El( ilon ,itime )
            if xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            elseif xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ], ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            else                                               
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,60]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            end
        end
    end
end

%
La_zero_position        = find( C2_La_East( 1 , : ) == 0 );
La_zero_position_num   = C2_La_East( 2 , La_zero_position );
La_true_zero_judge = La_zero_position_num == fix( La_zero_position_num );
La_zero_position_new = [];
for inum = 1 : length( La_zero_position ) 
    if La_true_zero_judge( inum )
        La_zero_position_new = [ La_zero_position_new , La_zero_position( inum ) ];
    end
end
La_zero_position_num_new   = C2_La_East( 2 , La_zero_position_new );
for iline = 7  
    plot( C2_La_East( 1 , La_zero_position_new( iline )+1 : La_zero_position_new( iline )+La_zero_position_num_new(iline) ) ,...
          C2_La_East( 2 , La_zero_position_new( iline )+1 : La_zero_position_new( iline )+La_zero_position_num_new(iline) ) ,...
          'color' , 'r' , 'LineWidth' , 8 , 'LineStyle' , '-' );
end

axes( ax(4) )
[ C1 , H1 ] = contourf( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_La_No_Eastward_move_year_used' , label_sst , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_sst( id_lon_SSTA ) , 1:1:19 , SSTA_La_No_Eastward_move_year_used' , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
clear C2 H2
set( ax(4) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(4) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                            '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax(4) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(4) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(4) , 'linewidth' , 1.5 , 'fontsize' , 20 , 'Fontname' , 'Times New Roman' );
caxis( [ -1.1 1.5 ] );
colormap( colornew1 );



stipple( X_SSTA , Y_SSTA , SSTA_sign_La_No' , ...
             'marker' , 'o' , ...      % 强制圆点
             'color' , [ 0.5 0.5 0.5 ] , ...       % 白色点
             'MarkerSize' , 3.2 , ...    % 点大小
             'MarkerFaceColor' , [ 0.5 0.5 0.5 ] ,...
             'MarkerEdgeColor' , [ 0.5 0.5 0.5 ] ,...
             'density' , 200 , ...      % 点密度
             'resize' , true );        % 自动缩放  

annotation(   'textbox', [ 0.51, 0.712, 0.085, 0.02], ...
              'String', '(d)', ...
              'FontSize', 22, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');  
title( 'La Nina without E-IPWC' , 'FontName' , 'Times New Roman' , 'FontSize'  , 24 , 'Fontweight' , 'normal' );

posAxes = get( ax(4) , 'Position' );
posX    = posAxes(1);
posY    = posAxes(2);
width   = posAxes(3);
height  = posAxes(4);

% 获取 Axes 范围
limX = get( gca , 'Xlim' );
limY = get( gca , 'Ylim' );
minX = limX( 1 );
maxX = limX( 2 );
minY = limY( 1 );
maxY = limY( 2 );

% 转换坐标
xNew = posX + (X_wind - minX) / (maxX - minX) * width;
yNew = posY + (Y_wind - minY) / (maxY - minY) * height;

% 画风场
% [ ~ , lon1 ] = find( X_wind( 1 , : ) == limX( 1 ) );
% [ ~ , lon2 ] = find( X_wind( 1 , : ) == limX( 2 ) );
W_d_El = 0;
U_d_El = uwind_La_No_Eastward_move_year_used';

n=0.012;   % 调整箭头的长度
for itime = 2 : 2 : 18 % 不画最底层和最高层
    for ilon = 2 : 5 : 127
        if uwind_sign_El( ilon ,itime )
            if xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            elseif xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ], ...
                    'Color' , [0,140,80]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            else                                               
                annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El( itime , ilon ) .* n ] , ...
                    [ yNew( itime , ilon ) , yNew( itime , ilon ) + 0 .* n * -100 ] , ...
                    'Color' , [0,140,60]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth' , 4.5 );
            end
        end
    end
end  

La_No_zero_position        = find( C2_La_No_East( 1 , : ) == 0 );
La_No_zero_position_num   = C2_La_No_East( 2 , La_No_zero_position );
La_No_true_zero_judge = La_No_zero_position_num == fix( La_No_zero_position_num );
La_No_zero_position_new = [];
for inum = 1 : length( La_No_zero_position ) 
    if La_No_true_zero_judge( inum )
        La_No_zero_position_new = [ La_No_zero_position_new , La_No_zero_position( inum ) ];
    end
end
La_No_zero_position_num_new   = C2_La_No_East( 2 , La_No_zero_position_new );
for iline = 5  
    plot( C2_La_No_East( 1 , La_No_zero_position_new( iline )+1 : La_No_zero_position_new( iline )+La_No_zero_position_num_new(iline) ) ,...
          C2_La_No_East( 2 , La_No_zero_position_new( iline )+1 : La_No_zero_position_new( iline )+La_No_zero_position_num_new(iline) ) ,...
          'color' , 'r' , 'LineWidth' , 8 , 'LineStyle' , '-' );
end

cb = colorbar;
cb.Ticks = [ -1.0 : 0.2 : 1.4 ];
cb.TickLabels  = { '-1.0' ,  '-0.8' ,  '-0.6' ,  '-0.4' ,  '-0.2' ,...
                  '0.0' , '0.2' , '0.4' , '0.6' , '0.8' , '1.0' , '1.2' , '1.4' };
cb.FontSize = 22;
cb.Location = 'manual';
cb.Position = [0.928 0.56 0.015 0.36];   % [x y width height] 需微调
cb.AxisLocation = 'out';
cb.AxisLocationMode = 'manual';
cb.Direction = 'normal';   % 让 tick 面向外侧
cb.Label.String = '\circC';
cb.Label.FontSize = 22;
cb.Label.FontName = 'Times New Roman';

n = 0.012;
annotation(  'arrow' , [ 0.925 , 0.925 + 2 .* n ] , [ 0.932 , 0.932 ] , ...
             'Color' , [0,140,60]/255 , 'Headwidth' , 18 , 'Headstyle' , 'vback2' , 'Headlength' , 11 , 'LineWidth', 4.5 );

annotation('textbox', [ 0.92, 0.932, 0.085, 0.02], ...
            'String', '2 m/s', ...
            'FontSize', 18, 'FontName', 'Times New Roman', ...
            'HorizontalAlignment', 'left', ...
            'LineStyle', 'none');
        
ax5 = axes('Position', [0.24 0.10 0.47 0.37]); 
hold( ax5 , 'on' );
box( ax5 , 'on' );
        
fill_x  = [ -0.07 , 0.07 , 0.07 , -0.07 ];
fill_y  = [ -0.4 , -0.4 , 0.4 , 0.4 ];

fill_x1  = [ -0.07 , -0.02 , -0.02 , -0.07 ];
fill_y1  = [ 0.4 , 0.4 , 0.1 , 0.1 ];
fill_x2  = [ 0.02 , 0.07 , 0.07 , 0.02 ];
fill_y2  = [ -0.1 , -0.1 , -0.4 , -0.4 ];

p = fill( fill_x , fill_y , [ 1 1 1 ] );
p.FaceColor = [ 1 1 1 ];    
p.EdgeColor = 'none';
p.FaceAlpha = 0.2;

p1 = fill( fill_x1 , fill_y1 , [ 0.9 0.9 0.9 ] );
p1.FaceColor = [ 0.8 0.8 0.8 ];
p1.EdgeColor = 'none';
p1.FaceAlpha = 0.4;
p2 = fill( fill_x2 , fill_y2 , [ 0.9 0.9 0.9 ] );
p2.FaceColor = [ 0.8 0.8 0.8 ];     
p2.EdgeColor = 'none';
p2.FaceAlpha = 0.4;

c1 = plot( [ -0.08 0.08 ] , [ 0 0 ] , 'LineStyle' , '--' , 'color' , [ 1 1 1 ] * 0.6 ,...
                                    'LineWidth' , 2 );
c2 = plot( [ 0 0 ] , [ -0.5 0.5 ] , 'LineStyle' , '--' , 'color' , [ 1 1 1 ] * 0.6 ,...
                                    'LineWidth' , 2 );
                                       
h1 = scatter( MC_El_Eastmove_Year , Decay_speed_El_Eastmove_Year , 300 ,...
              'o', 'MarkerFaceColor' , [ 1 0.2 0 ] ,...
              'MarkerEdgeColor' , [ 1 0.2 0 ]*0.9 ,...
              'LineWidth' , 2 );
h2 = scatter( MC_El_No_Eastmove_Year , Decay_speed_El_No_Eastmove_Year , 360 ,...
              'p', 'MarkerFaceColor' , [ 1 0.2 0 ] ,...
              'MarkerEdgeColor' , [ 1 0.2 0 ]*0.9 ,...
              'LineWidth' , 2 );
h3 = scatter( MC_La_Eastmove_Year , Decay_speed_La_Eastmove_Year , 300 ,...
              'o', 'MarkerFaceColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ]*0.9 ,...
              'LineWidth' , 2 );
h4 = scatter( MC_La_No_Eastmove_Year , Decay_speed_La_No_Eastmove_Year , 360 ,...
              'p', 'MarkerFaceColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ]*0.9 ,...
              'LineWidth' , 2 );
grid off;
set( ax5 , 'LineWidth', 1.5 , 'FontWeight' , 'bold' , 'TickDir' , 'out' ,...
            'xcolor' , 'k' , 'ycolor' , 'k'  );        
set( ax5 , 'Xlim' , [ -0.07 0.07 ] , 'Ylim' , [ -0.4 0.4 ] );
set( ax5 , 'XTick' , [ -0.08 : 0.02 : 0.08 ] ,'XTicklabel' , [ -0.08 : 0.02 : 0.08 ] , 'Fontweight' , 'normal' );
set( ax5 , 'YTick' , [ -0.4 : 0.1 : 0.4 ] , 'YTicklabel' , { '-0.4' , '' , '-0.2' , '' , '0.0' , '' ,...
            '0.2' , '' , '0.4' } ,  'FontName' , 'Times New Roman' , 'Fontweight' , 'normal' );
ylabel( 'NINO3.4 Decaying Rate(\circC/month)' , 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'FontWeight' , 'normal' );

for n = 1 : length( El_Eastmove_year )
    str = num2str( El_Eastmove_year(n) );
    text( MC_El_Eastmove_Year(n)+0.0016 , Decay_speed_El_Eastmove_Year(n)-0.011 , str( 3 : 4 ) , 'FontName' , 'Times New Roman' , 'Fontsize' , 18 ); 
end

for n = 1 : length( El_No_Eastmove_year )
    str = num2str( El_No_Eastmove_year(n) );
    text( MC_El_No_Eastmove_Year(n)+0.0016 , Decay_speed_El_No_Eastmove_Year(n)-0.011 , str( 3 : 4 ) , 'FontName' , 'Times New Roman' , 'Fontsize' , 18 ); 
end

for n = 1 : length( La_Eastmove_year )
    str = num2str( La_Eastmove_year(n) );
    if La_Eastmove_year(n) == 2008
        text( MC_La_Eastmove_Year(n)-0.0045 , Decay_speed_La_Eastmove_Year(n) - 0.019 , str( 3 : 4 ) , 'FontName' , 'Times New Roman' , 'Fontsize' , 18 ); 
    elseif La_Eastmove_year(n) == 2011
        text( MC_La_Eastmove_Year(n)-0.0045  , Decay_speed_La_Eastmove_Year(n) - 0.016 , str( 3 : 4 ) , 'FontName' , 'Times New Roman' , 'Fontsize' , 18 );
    else
        text( MC_La_Eastmove_Year(n)+0.0016 , Decay_speed_La_Eastmove_Year(n)-0.011 , str( 3 : 4 ) , 'FontName' , 'Times New Roman' , 'Fontsize' , 18 ); 
    end
end

for n = 1 : length( La_No_Eastmove_year )
    str = num2str( La_No_Eastmove_year(n) );
    text( MC_La_No_Eastmove_Year(n)+0.0016 , Decay_speed_La_No_Eastmove_Year(n)-0.011 , str( 3 : 4 ) , 'FontName' , 'Times New Roman' , 'Fontsize' , 18 ); 
end
xlabel( 'Maritime Continent Decaying Rate(\circC/month)' , 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'FontWeight' , 'normal' );
% 创建 legend


[temp, lgd] = legend( [ h1 h2 h3 h4 ] ,{ 'El Nino with E-IPWC' , ...
                                         'El Nino without E-IPWC' ,...
                                         'La Nina with E-IPWC' , ...
                                         'La Nina without E-IPWC' }, ...
                                         'Location' , 'Northeast' , 'Box' , 'off' , 'FontName' , 'Times New Roman' , 'FontSize' , 20 );
lgd(5).Children.MarkerSize = 18;
lgd(6).Children.MarkerSize = 18;
lgd(7).Children.MarkerSize = 18;
lgd(8).Children.MarkerSize = 18;
set( ax5 , 'Fontsize' , 20 );
annotation(   'textbox', [ 0.235, 0.47, 0.085, 0.02], ...
              'String', '(e)', ...
              'FontSize', 22, 'FontName', 'Times New Roman', ...
              'HorizontalAlignment', 'left', ...
              'LineStyle', 'none');  