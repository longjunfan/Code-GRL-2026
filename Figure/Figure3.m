clc;
clear all;
close all;
TopFolder =  'F:\Walker Circulation Eastward Moving\data store';
file_name = [ TopFolder , '\' , 'ERSSTv5_SST_SSTA_SSTA_detrend_lowpass_1979_2024' , '.mat']; 
load( file_name );

nlon   = size( SSTA_3D , 1 );
nlat   = size( SSTA_3D , 2 );
ntime  = size( SSTA_3D , 3 );
%%
SSTA_detrend_3D = NaN( nlon , nlat , ntime );
for ilon = 1 : nlon
    for ilat = 1 : nlat
        if  ~isnan( mean( squeeze( SSTA_3D( ilon , ilat , : ) ) ) )
            SSTA_detrend_3D( ilon , ilat , : ) = detrend( squeeze( SSTA_3D( ilon , ilat , : ) ) );
        end           
    end
end
%%
lon_nino34_st = 190; 
lon_nino34_la = 240;
lat_nino34_st = -5;
lat_nino34_la = 5;
id_lon_nino34  = intersect( find( lon_sst >= lon_nino34_st ) , find( lon_sst <= lon_nino34_la ) );
id_lat_nino34  = intersect( find( lat_sst >= lat_nino34_st ) , find( lat_sst <= lat_nino34_la ) );

SSTA_nino34  = SSTA_detrend_3D( id_lon_nino34 , id_lat_nino34 , : );
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

Nino34_Index_month            = reshape( Nino34_Index_three_run , [ 12 ntime/12 ] );
Nino34_Index_DJF              = Nino34_Index_month( 1 , 2 : end )';
Nino34_Index_DJF( : , 2 )     = 1979 : 1 : 2023;
%%
lon_IODW_st = 50;
lon_IODW_la = 70;
lat_IODW_st = -10;
lat_IODW_la = 10;
id_lon_IODW  = intersect( find( lon_sst >= lon_IODW_st ) , find( lon_sst <= lon_IODW_la ) );
id_lat_IODW  = intersect( find( lat_sst >= lat_IODW_st ) , find( lat_sst <= lat_IODW_la ) );

SSTA_IODW  = SSTA_detrend_3D( id_lon_IODW , id_lat_IODW , : );
IODW_Index = squeeze( nanmean( squeeze( nanmean( SSTA_IODW , 1 ) ) , 1 ) ); 
IODW_Index = IODW_Index';
    
IODW_Index_month           = reshape( IODW_Index , [ 12 ntime/12 ] );
IODW_Index_SON              = mean(  IODW_Index_month( 9 : 11 , : ) , 1 );
IODW_Index_SON              = IODW_Index_SON';
IODW_Index_SON( : , 2 )     = 1979 : 1 : 2024;
%%
lon_IOBW_st = 40;
lon_IOBW_la = 110;
lat_IOBW_st = -20;
lat_IOBW_la = 20;
id_lon_IOBW  = intersect( find( lon_sst >= lon_IOBW_st ) , find( lon_sst <= lon_IOBW_la ) );
id_lat_IOBW  = intersect( find( lat_sst >= lat_IOBW_st ) , find( lat_sst <= lat_IOBW_la ) );

SSTA_IOBW  = SSTA_detrend_3D( id_lon_IOBW , id_lat_IOBW , : );
IOBW_Index = squeeze( nanmean( squeeze( nanmean( SSTA_IOBW , 1 ) ) , 1 ) ); 
IOBW_Index = IOBW_Index';
    
IOBW_Index_month            = reshape( IOBW_Index , [ 12 ntime/12 ] );
IOBW_Index_MAM              = mean(  IOBW_Index_month( 3 : 5 , : ) , 1 );
IOBW_Index_MAM              = IOBW_Index_MAM';
IOBW_Index_MAM( : , 2 )     = [ 1979 : 1 : 2024 ];
%%
El_Eastmove_year    = [ 1982 , 1987 , 1994 , 1997 , 2009 , 2015 , 2023 ];
El_No_Eastmove_year = [ 1986 , 1991 , 2002 , 2004 , 2006 , 2014 , 2018 ];

IODW_El_Eastmove_Year = [];
IODW_El_No_Eastmove_Year = [];
for n = 1 : 46
    if ismember( IODW_Index_SON( n , 2 ) , El_Eastmove_year )
        IODW_El_Eastmove_Year = [ IODW_El_Eastmove_Year , IODW_Index_SON( n , 1 ) ];
    elseif ismember( IODW_Index_SON( n , 2 ) , El_No_Eastmove_year )
        IODW_El_No_Eastmove_Year = [ IODW_El_No_Eastmove_Year , IODW_Index_SON( n , 1 ) ];
    end  
end
clear n

Nino34_Eastmove_Year = [];
NIno34_El_No_Eastmove_Year = [];
for n = 1 : 45
    if ismember( Nino34_Index_DJF( n , 2 ) , El_Eastmove_year )
        Nino34_Eastmove_Year = [ Nino34_Eastmove_Year , Nino34_Index_DJF( n , 1 ) ];
    elseif ismember( Nino34_Index_DJF( n , 2 ) , El_No_Eastmove_year )
        NIno34_El_No_Eastmove_Year = [ NIno34_El_No_Eastmove_Year , Nino34_Index_DJF( n , 1 ) ];
    end  
end
clear n

IOBW_El_Eastmove_Year = [];
IOBW_El_No_Eastmove_Year = [];
for n = 1 : 46
    if ismember( IOBW_Index_MAM( n , 2 ) , El_Eastmove_year )
        IOBW_El_Eastmove_Year = [ IOBW_El_Eastmove_Year , IOBW_Index_MAM( n+1 , 1 ) ];
    elseif ismember( IOBW_Index_MAM( n , 2 ) , El_No_Eastmove_year )
        IOBW_El_No_Eastmove_Year = [ IOBW_El_No_Eastmove_Year , IOBW_Index_MAM( n+1 , 1 ) ];
    end  
end
clear n
%%
La_Eastmove_year    = [ 1985, 2005, 2008, 2011, 2017,  2022 ];
La_No_Eastmove_year = [ 1983, 1984, 1988, 1995, 1998, 1999, 2000, 2007, 2010, 2020, 2021 ];
IODW_La_Eastmove_Year = [];
IODW_La_No_Eastmove_Year = [];
for n = 1 : 45
    if ismember( IODW_Index_SON( n , 2 ) , La_Eastmove_year )
        IODW_La_Eastmove_Year = [ IODW_La_Eastmove_Year , IODW_Index_SON( n , 1 ) ];
    elseif ismember( IODW_Index_SON( n , 2 ) , La_No_Eastmove_year )
        IODW_La_No_Eastmove_Year = [ IODW_La_No_Eastmove_Year , IODW_Index_SON( n , 1 ) ];
    end  
end

Nino34_La_Eastmove_Year = [];
Nino34_La_No_Eastmove_Year = [];
for n = 1 : 45
    if ismember( Nino34_Index_DJF( n , 2 ) , La_Eastmove_year )
        Nino34_La_Eastmove_Year = [ Nino34_La_Eastmove_Year , Nino34_Index_DJF( n , 1 ) ];
    elseif ismember( Nino34_Index_DJF( n , 2 ) , La_No_Eastmove_year )
        Nino34_La_No_Eastmove_Year = [ Nino34_La_No_Eastmove_Year , Nino34_Index_DJF( n , 1 ) ];
    end  
end
clear n

IOBW_La_Eastmove_Year = [];
IOBW_La_No_Eastmove_Year = [];
for n = 1 : 45
    if ismember( IOBW_Index_MAM( n , 2 ) , La_Eastmove_year )
        IOBW_La_Eastmove_Year = [ IOBW_La_Eastmove_Year , IOBW_Index_MAM( n+1 , 1 ) ];
    elseif ismember( IOBW_Index_MAM( n , 2 ) , La_No_Eastmove_year )
        IOBW_La_No_Eastmove_Year = [ IOBW_La_No_Eastmove_Year , IOBW_Index_MAM( n+1 , 1 ) ];
    end  
end
%%
u_file_address = 'G:\Data\NECP DOE Reanalysis 2\Uwind monthly 10m';
u_file_name    = 'uwnd.10m.mon.mean.nc';
u_file_data    = [ u_file_address , '\' , u_file_name ];

u_time  = ncread( u_file_data , 'time' );
uwind = ncread( u_file_data , 'uwnd' );
u_lon   = ncread( u_file_data , 'lon' ); 
u_lat   = ncread( u_file_data , 'lat' );
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

% climatology compute 
uwind_4D = reshape( uwind , [ 192 94 12 46 ] );
uwind_month_climate  = squeeze( nanmean( uwind_4D , 4 ) );
uwind_ano            = NaN( 192 , 94 , 12 , 46 );

for imonth = 1:12
    
    uwind_ano( : , : , imonth , : )  = uwind_4D( : , : , imonth , : ) - uwind_month_climate( : , : , imonth );  
    
end
uwind_ano_3D         = reshape( uwind_ano , [ 192 94 552 ] );
uwind_ano_3D_detrend = NaN( 192 , 94 , 552 ); 
for ilon = 1 : size( uwind_ano_3D , 1 )
    for ilat = 1 : size( uwind_ano_3D , 2 ) 
        uwind_ano_3D_detrend( ilon , ilat , : ) = detrend( squeeze( uwind_ano_3D( ilon , ilat , : ) ) , 1 );
    end
end
%%
v_file_address = 'G:\Data\NECP DOE Reanalysis 2\Vwind monthly 10m';
v_file_name    = 'vwnd.10m.mon.mean.nc';
v_file_data    = [ v_file_address , '\' , v_file_name ];

v_time  = ncread( v_file_data , 'time' );
vwind = ncread( v_file_data , 'vwnd' );
v_lon   = ncread( v_file_data , 'lon' ); 
v_lat   = ncread( v_file_data , 'lat' );
v_time = time_start + v_time/24;
v_date = datevec( v_time );

v_time_first_index = find( v_time == time_first );
v_time_last_index  = find( v_time == time_last );
time_vwind = v_time( v_time_first_index : v_time_last_index );

vwind     = squeeze( vwind( : , : , : , v_time_first_index : v_time_last_index ) ); 
vwind( vwind < -1000 ) = NaN;

% climatology compute 
vwind_4D = reshape( vwind , [ 192 94 12 46 ] );
vwind_month_climate  = squeeze( nanmean( vwind_4D , 4 ) );
vwind_ano            = NaN( 192 , 94 , 12 , 46 );

for imonth = 1:12
    
    vwind_ano( : , : , imonth , : )  = vwind_4D( : , : , imonth , : ) - vwind_month_climate( : , : , imonth );  
    
end
vwind_ano_3D         = reshape( vwind_ano , [ 192 94 552 ] );
vwind_ano_3D_detrend = NaN( 192 , 94 , 552 ); 
for ilon = 1 : size( vwind_ano_3D , 1 )
    for ilat = 1 : size( vwind_ano_3D , 2 ) 
        vwind_ano_3D_detrend( ilon , ilat , : ) = detrend( squeeze( vwind_ano_3D( ilon , ilat , : ) ) , 1 );
    end
end
%%
lon_Pac_st = 100;
lon_Pac_la = 280;
lat_Pac_st = -10;
lat_Pac_la = 10;

id_lon_Pac = intersect( find( u_lon >= lon_Pac_st ) , find( u_lon <= lon_Pac_la ) );
id_lat_Pac = intersect( find( u_lat >= lat_Pac_st ) , find( u_lat <= lat_Pac_la ) );

uwind_Pac_ano_3D_detrend = uwind_ano_3D_detrend( id_lon_Pac , id_lat_Pac , : );
uwind_Pac_ano_2D_detrend = reshape( uwind_Pac_ano_3D_detrend , [ 96 * 10 552 ] );

vwind_Pac_ano_3D_detrend = vwind_ano_3D_detrend( id_lon_Pac , id_lat_Pac , : );
vwind_Pac_ano_2D_detrend = reshape( vwind_Pac_ano_3D_detrend , [ 96 * 10 552 ] );

uv_EOF_used = cat( 1 , uwind_Pac_ano_2D_detrend , vwind_Pac_ano_2D_detrend );
%%
C = uv_EOF_used * uv_EOF_used' / size( uv_EOF_used , 1 );
[ EOF , E ] = eig( C );
PC = EOF' * uv_EOF_used;
E  = fliplr( flipud( E ) );
lambda = diag( E );
EOF    = fliplr( EOF );
PC     = flipud( PC );
lambda_percent = lambda ./ sum( lambda );


EOF2      = EOF( : , 2 );
PC2       = PC( 2 , : );
EOF2      = EOF2 .* sqrt( lambda( 2 ) );
EOF2_used = reshape( EOF2 , [ 96 10 2 ] );
PC2       = PC2 ./ sqrt( lambda( 2 ) );
%%
PC2_three_month_averge = NaN( 552 , 1 );
for imonth = 1 : 552
    if imonth == 1
        PC2_three_month_averge( imonth ) = PC2( imonth );
    elseif imonth == 552
        PC2_three_month_averge( imonth ) = PC2( imonth );
    else
        PC2_three_month_averge( imonth ) = mean( PC2( imonth - 1 : imonth + 1 ) );
    end
end
%%
PC2_month   = reshape( - PC2_three_month_averge ,  [ 12 , 46 ] );
PC2_MAM     = PC2_month( 4 , 1 : end );
PC2_MAM_std = ( PC2_MAM - mean( PC2_MAM ) ) ./ std( PC2_MAM );
PC2_MAM_std( 2 , : ) = 1978 : 1 : 2023;
PC2_MAM_std_new = PC2_MAM_std( : , 2 : end );
%%
El_Eastmove_year    = [ 1982 , 1987 , 1994 , 1997 , 2009 , 2015 , 2023 ];
El_No_Eastmove_year = [ 1986 , 1991 , 2002 , 2004 , 2006 , 2014 , 2018 ];
La_Eastmove_year    = [ 1985, 2005, 2008, 2011, 2017,  2022 ];
La_No_Eastmove_year = [ 1983, 1984, 1988, 1995, 1998, 1999, 2000, 2007, 2010, 2020, 2021 ];
ENSO_year           = union( union( union( El_Eastmove_year , El_No_Eastmove_year ) , La_Eastmove_year ) , La_No_Eastmove_year );

PC2_El_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
PC2_El_Eastmove_Year( 2 , : ) = ENSO_year;
PC2_El_No_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
PC2_El_No_Eastmove_Year( 2 , : ) = ENSO_year;

for n = 1 : length(ENSO_year)
    if ismember( ENSO_year( n ) , El_Eastmove_year )
        PC2_El_Eastmove_Year( 1 , n ) = PC2_MAM_std_new( 1 ,  find( PC2_MAM_std_new( 2 , : ) == ENSO_year( n ) ) );
    elseif ismember( ENSO_year( n ) , El_No_Eastmove_year )
        PC2_El_No_Eastmove_Year( 1 , n ) = PC2_MAM_std_new( 1 , find( PC2_MAM_std_new( 2 , : ) == ENSO_year( n ) ) );
    end  
end
clear n

PC2_La_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
PC2_La_Eastmove_Year( 2 , : ) = ENSO_year;
PC2_La_No_Eastmove_Year = NaN( 1 , length( ENSO_year ) );
PC2_La_No_Eastmove_Year( 2 , : ) = ENSO_year;
for n = 1 : length(ENSO_year)
    if ismember( ENSO_year( n ) , La_Eastmove_year )
        PC2_La_Eastmove_Year( 1 , n ) = PC2_MAM_std_new( 1 , find( PC2_MAM_std_new( 2 , : ) == ENSO_year( n ) ) );
    elseif ismember( ENSO_year( n ) , La_No_Eastmove_year )
        PC2_La_No_Eastmove_Year( 1 , n ) = PC2_MAM_std_new( 1 , find( PC2_MAM_std_new( 2 , : ) == ENSO_year( n ) ) );
    end  
end
%%
Nino34_ENSO_year = NaN( length( ENSO_year ) , 1 );
j = 0;
for n = 1 : length(  Nino34_Index_DJF( : , 2 ) )
    if ismember( Nino34_Index_DJF( n , 2 ) ,ENSO_year )
        j = j + 1;
        Nino34_ENSO_year( j , 1 ) = Nino34_Index_DJF( n , 1 );
    end  
end
clear n j
%%
figure(1)
set( gcf , 'color' , 'w' , 'position' , [ 0 100 1900 1860 ] );
[ ax , ~ ]  = tight_subplot( 2 , 2 , [ 0.12 0.12 ] , [ 0.02 0.04 ] , [ 0.13 0.1 ] ); 
axes( ax(1) );
ax1 = ax(1);
hold on
box on
c1 = plot( [ -1 1 ] , [ 0 0 ] , 'LineStyle' , '--' , 'color' , [ 0.6 0.6 0.6 ] ,...
                                    'LineWidth' , 1.8 );
c2 = plot( [ 0 0 ] , [ -2.7 2.7 ] , 'LineStyle' , '--' , 'color' , [ 0.6 0.6 0.6 ] ,...
                                    'LineWidth' , 1.8 );
h1 = scatter( IODW_El_Eastmove_Year , Nino34_Eastmove_Year , 180 ,...
              'o', 'MarkerFaceColor' , [ 1 0.2 0 ] ,...
              'MarkerEdgeColor' , [ 1 0.2 0 ]*0.9 ,...
              'LineWidth' , 2 );
h2 = scatter( IODW_El_No_Eastmove_Year , NIno34_El_No_Eastmove_Year , 240 ,...
              'p', 'MarkerFaceColor' , [ 1 0.2 0 ] ,...
              'MarkerEdgeColor' , [ 1 0.2 0 ]*0.9 ,...
              'LineWidth' , 2 );
h3 = scatter( IODW_La_Eastmove_Year , Nino34_La_Eastmove_Year , 180 ,...
              'o', 'MarkerFaceColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ]*0.9 ,...
              'LineWidth' , 2 );
h4 = scatter( IODW_La_No_Eastmove_Year , Nino34_La_No_Eastmove_Year , 240 ,...
              'p', 'MarkerFaceColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ] * 0.9 ,...
              'LineWidth' , 2 );

grid on;
ax1.XGrid = 'off';              % 关闭竖向网格线
ax1.YGrid = 'on';               % 打开横向网格线
ax1.GridLineStyle = ':';        % 网格线样式（可选，虚线更好看）
ax1.GridColor = [0.3 0.3 0.3];
ax1.GridAlpha = 0.2;            % 网格透明度

set( ax(1) , 'LineWidth', 1.5 , 'FontWeight' , 'bold' , 'TickDir' , 'out' ,...
            'xcolor' , 'k' , 'ycolor' , 'k' );        

set( ax(1) , 'Xlim' , [ -1 1 ] , 'Ylim' , [ -2.7 2.7 ] );
set( ax(1) , 'XTick' , [ -1 : 0.5 : 1 ] , 'XTicklabel' , [ -1 : 0.5 : 1 ] , 'Fontweight' , 'normal', 'FontName' , 'Times New Roman' , 'FontSize' , 16 );
set( ax(1) , 'YTick' , [ -2 : 1 : 2 ] , 'YTicklabel' , { '-2.0'  , '-1.0' ,  '0.0' ,...
              '1.0' , '2.0' } , 'Fontweight' , 'normal', 'FontName' , 'Times New Roman' , 'FontSize' , 16 );
xlabel( 'Western Tropical Indian Ocean SSTA(\circC) in SON(0)', 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'FontWeight' , 'normal' );
ylabel( 'NINO3.4(\circC) in D(0)JF(1)', 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'FontWeight' , 'normal' );

[temp, lgd] = legend( [ h1 h2 h3 h4 ] ,{ 'El Nino with E-IPWC' , ...
                                         'El Nino without E-IPWC' , ...
                                         'La Nina with E-IPWC'  , ...
                                         'La Nina without E-IPWC' }, ...
                                         'Position' , [0.13,0.89,0.15,0.05] ,... 
                                         'Box' , 'off' , 'FontName' , 'Times New Roman' , 'FontSize' , 18 );
lgd(5).Children.MarkerSize = 14;
lgd(6).Children.MarkerSize = 14;
lgd(7).Children.MarkerSize = 14;
lgd(8).Children.MarkerSize = 14;
set( ax(1) , 'Fontsize' , 20 );
text( -0.01 , 1.07 , '(a)', ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  

axes( ax(2) );
ax2 = ax(2)
hold on
box on
c1 = plot( [ -1 1 ] , [ 0 0 ] , 'LineStyle' , '--' , 'color' , [ 0.6 0.6 0.6 ] ,...
                                    'LineWidth' , 1.8 );
c2 = plot( [ 0 0 ] , [ -2.7 2.7 ] , 'LineStyle' , '--' , 'color' , [ 0.6 0.6 0.6 ] ,...
                                    'LineWidth' , 1.8 );
h1 = scatter( IOBW_El_Eastmove_Year , Nino34_Eastmove_Year , 180 ,...
              'o', 'MarkerFaceColor' , [ 1 0.2 0 ] ,...
              'MarkerEdgeColor' , [ 1 0.2 0 ]*0.9 ,...
              'LineWidth' , 2 );
h2 = scatter( IOBW_El_No_Eastmove_Year , NIno34_El_No_Eastmove_Year , 240 ,...
              'p', 'MarkerFaceColor' , [ 1 0.2 0 ] ,...
              'MarkerEdgeColor' , [ 1 0.2 0 ]*0.9 ,...
              'LineWidth' , 2 );
h3 = scatter( IOBW_La_Eastmove_Year , Nino34_La_Eastmove_Year , 180 ,...
              'o', 'MarkerFaceColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ]*0.9 ,...
              'LineWidth' , 2 );
h4 = scatter( IOBW_La_No_Eastmove_Year , Nino34_La_No_Eastmove_Year , 240 ,...
              'p', 'MarkerFaceColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ] ,...
              'MarkerEdgeColor' , [ 0.25 0.41 0.88 ] * 0.9 ,...
              'LineWidth' , 2 );

grid on;
ax2.XGrid = 'off';              % 关闭竖向网格线
ax2.YGrid = 'on';               % 打开横向网格线
ax2.GridLineStyle = ':';        % 网格线样式（可选，虚线更好看）
ax2.GridColor = [0.3 0.3 0.3];
ax2.GridAlpha = 0.2;            % 网格透明度

set( ax(2) , 'LineWidth', 1.5 , 'FontWeight' , 'bold' , 'TickDir' , 'out' ,...
            'xcolor' , 'k' , 'ycolor' , 'k' );        
set( ax(2) , 'Xlim' , [ -1 1 ] , 'Ylim' , [ -2.7 2.7 ] );
set( ax(2) , 'YTick' , [ -2 : 1 : 2 ] , 'YTicklabel' , { '-2.0'  , '-1.0' ,  '0.0' ,...
              '1.0' , '2.0' } , 'Fontweight' , 'normal', 'FontName' , 'Times New Roman' , 'FontSize' , 16 );

set( ax(2) , 'XTick' , [ -1 : 0.5 : 1 ] , 'XTicklabel' , [ -1 : 0.5 : 1 ] , 'Fontweight' , 'normal', 'FontName' , 'Times New Roman' , 'FontSize' , 16 );
set( ax(2) , 'YTick' , [ -2 : 1 : 2 ] , 'YTicklabel' , {  '-2.0' , '-1.0' ,  '0.0' ,...
              '1.0'  , '2.0' } , 'Fontweight' , 'normal', 'FontName' , 'Times New Roman' , 'FontSize' , 16 );
xlabel( 'Tropical Indian Ocean SSTA(\circC) in MAM(1)', 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'FontWeight' , 'normal' );
ylabel( 'NINO3.4(\circC) in D(0)JF(1)', 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'FontWeight' , 'normal' );

[temp, lgd] = legend( [ h1 h2 h3 h4 ] ,{ 'El Nino with E-IPWC' , ...
                                         'El Nino without E-IPWC' , ...
                                         'La Nina with E-IPWC'  , ...
                                         'La Nina without E-IPWC' }, ...
                                         'Position' , [0.576,0.89,0.15,0.05] ,... 
                                         'Box' , 'off' , 'FontName' , 'Times New Roman' , 'FontSize' , 18 );
lgd(5).Children.MarkerSize = 14;
lgd(6).Children.MarkerSize = 14;
lgd(7).Children.MarkerSize = 14;
lgd(8).Children.MarkerSize = 14;
set( ax(2) , 'Fontsize' , 20 );
text( -0.01 , 1.07 , '(b)', ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  

ax3 = subplot( 2 , 2 , [ 3 , 4 ] );

ax3.XAxis.TickDirection = 'in';       % x轴刻度线向外
ax3.XAxis.TickLength = [0.006 0];  
ax3.YAxis.TickLength = [0.006 0];   

grid on;
ax3.XGrid = 'off';              % 关闭竖向网格线
ax3.YGrid = 'on';               % 打开横向网格线
ax3.GridLineStyle = ':';        % 网格线样式（可选，虚线更好看）
ax3.GridColor = [0.3 0.3 0.3];
ax3.GridAlpha = 0.2;            % 网格透明度
hold on;
yyaxis(ax3,'left');
ax3.YColor = [0 0 0] / 255;
h1 = bar( 1 : length( ENSO_year ) , PC2_El_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 255 , 90 , 105 ] / 255  , 'EdgeColor' , 'None' );
h2 = bar( 1 : length( ENSO_year ) , PC2_La_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 105 , 137 , 255 ] / 255 , 'EdgeColor' , 'None' );
h3 = bar( 1 : length( ENSO_year ) ,  PC2_El_No_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 255 , 255 , 255 ] / 255 ,...
                                                                         'EdgeColor' , [ 255 , 90 , 105 ] / 255 , 'LineWidth' , 3 );
h4 = bar( 1 : length( ENSO_year ) ,  PC2_La_No_Eastmove_Year( 1 , : ) , 'BarWidth', 0.8 , 'FaceColor' , [ 255 , 255 , 255 ] / 255 ,...
                                                                         'EdgeColor' , [ 105 , 137 , 255 ] / 255 , 'LineWidth' , 3 );


set( ax3 , 'LineWidth', 1.5 ,  'TickDir' , 'in' ,...
            'xcolor' , 'k' , 'ycolor' , 'k' );
set( ax3 , 'xlim' , [ 0 32 ] , 'XTick' , [ 1 : 31 ] ,...
          'XTickLabel' , ENSO_year , 'FontWeight' , 'normal' , 'FontName' , 'Times New Roman' , 'FontSize' , 20 );
set( ax3 , 'XTickLabelRotation' , 52 );
        

set( ax3 , 'ylim' , [ -2 3.6 ] , 'YTick' , [ -2 : 1 : 3 ] ,...
          'YTickLabel' , { '-2.0' , '-1.0' , '0.0' , '1.0' , '2.0' , '3.0' } , 'FontWeight' , 'normal' , 'FontName' , 'Times New Roman' , 'FontSize' , 25 );
ylabel( ax3 , 'C-mode Index in MAM(1)', 'FontName' , 'Times New Roman' , 'FontSize' , 22  );

yyaxis( ax3,'right');
ax3.YColor = [0 140 0] / 255;
p1 = plot( 1:length(ENSO_year) , Nino34_ENSO_year , ...
           '^', ...                     % 线 + 上三角 marker
           'LineWidth', 3 , ...
           'Color', [0 160 0]/255 , ...  % 深绿色
           'MarkerFaceColor', [0 160 0]/255 , ...  % 填充绿色
           'MarkerSize', 12 , ...
           'MarkerEdgeColor' , [0 160 0]/255 * 0.8 ,...
            'LineWidth' , 2 );
xlabel( ax3 , 'Year(0)', 'FontName' , 'Times New Roman' , 'FontSize' , 22  );
set( ax3 , 'ylim' , [ -2 3.6 ] , 'YTick' , [ -2 : 1 : 3 ] ,...
          'YTickLabel' , { '-2.0' , '-1.0' , '0.0' , '1.0' , '2.0' , '3.0' } , 'FontWeight' , 'normal' , 'FontName' , 'Times New Roman' , 'FontSize' , 20 );
ylabel( ax3 ,  'NINO3.4(\circC) in D(0)JF(1)', 'FontName' , 'Times New Roman' , 'FontSize' , 22  );
lg = legend( [ h1 h2 h3 h4 ] ,{    'El Nino with E-IPWC' , ...
                                   'La Nina with E-IPWC'  , ...    
                                   'El Nino without E-IPWC' , ...
                                   'La Nina without E-IPWC' } , ...
                                   'Position' , [0.38,0.395,0.38,0.0428] ,...
                                   'NumColumns', 2 ,...
                                   'Box' , 'off' , 'FontName' , 'Times New Roman' , 'FontSize' , 20 );
annotation( 'textbox',[0.124 0.435 0.05 0.05], ...
            'String','(c)', ...
            'EdgeColor','none', ...
            'FontSize',20,...
            'FontName','Times New Roman');
set( ax3,'Box','off');   % 关掉 ax3 的上/右边那条线        
ax_frame = axes( 'Position', ax3.Position, ...
                 'Color','none', ...
                 'XTick',[], 'YTick',[], ...
                 'Box','on', ...
                 'XColor','k','YColor','none', ...
                 'LineWidth', 1.5 );
ax_frame = axes( 'Position', ax3.Position, ...
                 'Color','none', ...
                 'XTick',[], 'YTick',[], ...
                 'Box','on', ...
                 'XColor','k','YColor','none', ...
                 'LineWidth', 1.5 );
uistack( ax_frame , 'bottom');   