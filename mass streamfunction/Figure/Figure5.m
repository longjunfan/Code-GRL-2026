clc;
clear all;
close all;
load( 'F:\Walker Circulation Eastward Moving\data store\NECP2_upsi_ano_detrend_lowpass_197901_202412.mat' );
load( 'F:\Walker Circulation Eastward Moving\data store\NECP2_u_div_ano_detrend_lowpass_197901_202412.mat' );
load( 'F:\Walker Circulation Eastward Moving\data store\NECP2_upsi_cli_197901_202412.mat' );
lon_upsi = lon;
lat_upsi = lat;
lev_upsi = lev;
clear lon lev lat
u_div_year_cli_equ  = squeeze( nanmean( u_div_year_cli( 35 : 39 , : , : ) , 1 ) );

El_Eastward_move_year  = [ 1982, 1987, 1994, 1997, 2009, 2015, 2023 ];
id_El_Eastward_move_year_Dec_0 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 0;
id_El_Eastward_move_year_May_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 5;
id_El_Eastward_move_year_Dec_1 = ( El_Eastward_move_year - 1979 + 1 ) * 12 + 12;
%%
upsi_ano_El_Eastward_move_year_Dec_0     = mean( u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_0 ) , 3 );
upsi_ano_El_Eastward_move_year_May_1     = mean( u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_May_1 ) , 3 );
upsi_ano_El_Eastward_move_year_Dec_1     = mean( u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_1 ) , 3 );
upsi_cli_ano_El_Eastward_move_year_Dec_0 = mean( u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_0 ) , 3 ) + u_psi_cli_down;
upsi_cli_ano_El_Eastward_move_year_May_1 = mean( u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_May_1 ) , 3 ) + u_psi_cli_down;
upsi_cli_ano_El_Eastward_move_year_Dec_1 = mean( u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_1 ) , 3 ) + u_psi_cli_down;

upsi_ano_El_Eastward_move_year_Dec_0_all_year = u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_0 );
upsi_ano_El_Eastward_move_year_May_1_all_year = u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_May_1 );
upsi_ano_El_Eastward_move_year_Dec_1_all_year = u_psi_ano_down_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_1 );
% upsi student t-test
H_upsi_sign_El_Eastward_Dec_0 = NaN( length( lon_upsi ) , length( lev_upsi ) );
H_upsi_sign_El_Eastward_May_1 = NaN( length( lon_upsi ) , length( lev_upsi ) );
H_upsi_sign_El_Eastward_Dec_1 = NaN( length( lon_upsi ) , length( lev_upsi ) );
nlon_upsi  = length( lon_upsi );
nlev_upsi  = length( lev_upsi );

for ilon = 1 : nlon_upsi
    for ilev = 1 : nlev_upsi

        H_upsi_sign_El_Eastward_Dec_0( ilon , ilev ) = ttest( squeeze( upsi_ano_El_Eastward_move_year_Dec_0_all_year( ilon , ilev , : ) )' );
        H_upsi_sign_El_Eastward_May_1( ilon , ilev ) = ttest( squeeze( upsi_ano_El_Eastward_move_year_May_1_all_year( ilon , ilev , : ) )' );        
        H_upsi_sign_El_Eastward_Dec_1( ilon , ilev ) = ttest( squeeze( upsi_ano_El_Eastward_move_year_Dec_1_all_year( ilon , ilev , : ) )' );
    end
end
clear ilon imoth
H_upsi_sign_El_Eastward_Dec_0 = H_upsi_sign_El_Eastward_Dec_0 > 0;
H_upsi_sign_El_Eastward_May_1 = H_upsi_sign_El_Eastward_May_1 > 0;
H_upsi_sign_El_Eastward_Dec_1 = H_upsi_sign_El_Eastward_Dec_1 > 0;

%
%%
u_div_ano_El_Eastward_move_year_Dec_0     = mean( u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_0 ) , 3 );
u_div_ano_El_Eastward_move_year_May_1     = mean( u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_May_1 ) , 3 );
u_div_ano_El_Eastward_move_year_Dec_1     = mean( u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_1 ) , 3 );
u_div_cli_ano_El_Eastward_move_year_Dec_0 = mean( u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_0 ) , 3 ) + u_div_year_cli_equ;
u_div_cli_ano_El_Eastward_move_year_May_1 = mean( u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_May_1 ) , 3 ) + u_div_year_cli_equ;
u_div_cli_ano_El_Eastward_move_year_Dec_1 = mean( u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_1 ) , 3 ) + u_div_year_cli_equ;


u_div_ano_El_Eastward_move_year_Dec_0_all_year = u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_0 );
u_div_ano_El_Eastward_move_year_May_1_all_year = u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_May_1 );
u_div_ano_El_Eastward_move_year_Dec_1_all_year = u_div_ano_equ_detrend_fliter( : , : , id_El_Eastward_move_year_Dec_1 );
% u_div student t-test
H_u_div_sign_El_Eastward_Dec_0 = NaN( length( lon_upsi ) , length( lev_upsi ) );
H_u_div_sign_El_Eastward_May_1 = NaN( length( lon_upsi ) , length( lev_upsi ) );
H_u_div_sign_El_Eastward_Dec_1 = NaN( length( lon_upsi ) , length( lev_upsi ) );
nlon_upsi  = length( lon_upsi );
nlev_upsi  = length( lev_upsi );

for ilon = 1 : nlon_upsi
    for ilev = 1 : nlev_upsi

        H_u_div_sign_El_Eastward_Dec_0( ilon , ilev ) = ttest( squeeze( u_div_ano_El_Eastward_move_year_Dec_0_all_year( ilon , ilev , : ) )' );
        H_u_div_sign_El_Eastward_May_1( ilon , ilev ) = ttest( squeeze( u_div_ano_El_Eastward_move_year_May_1_all_year( ilon , ilev , : ) )' );        
        H_u_div_sign_El_Eastward_Dec_1( ilon , ilev ) = ttest( squeeze( u_div_ano_El_Eastward_move_year_Dec_1_all_year( ilon , ilev , : ) )' );
    end
end
clear ilon imoth
H_u_div_sign_El_Eastward_Dec_0 = H_u_div_sign_El_Eastward_Dec_0 > 0;
H_u_div_sign_El_Eastward_May_1 = H_u_div_sign_El_Eastward_May_1 > 0;
H_u_div_sign_El_Eastward_Dec_1 = H_u_div_sign_El_Eastward_Dec_1 > 0;

u_div_ano_El_Eastward_move_year_Dec_0_new = NaN( nlon_upsi , nlev_upsi );
u_div_ano_El_Eastward_move_year_May_1_new = NaN( nlon_upsi , nlev_upsi );
u_div_ano_El_Eastward_move_year_Dec_1_new = NaN( nlon_upsi , nlev_upsi );
for ilon = 1 : nlon_upsi
    for ilev = 1 : nlev_upsi
        if H_u_div_sign_El_Eastward_Dec_0
            u_div_ano_El_Eastward_move_year_Dec_0_new( ilon , ilev ) = u_div_ano_El_Eastward_move_year_Dec_0( ilon , ilev );
        end
        
        if H_u_div_sign_El_Eastward_May_1
            u_div_ano_El_Eastward_move_year_May_1_new( ilon , ilev ) = u_div_ano_El_Eastward_move_year_May_1( ilon , ilev );
        end     

        if H_u_div_sign_El_Eastward_Dec_1
            u_div_ano_El_Eastward_move_year_Dec_1_new( ilon , ilev ) = u_div_ano_El_Eastward_move_year_Dec_1( ilon , ilev );
        end        
    end
end
%%
H_u_div_sign_El_Eastward_Dec_0_used = H_u_div_sign_El_Eastward_Dec_0( 17 : 113 , : )';
H_u_div_sign_El_Eastward_May_1_used = H_u_div_sign_El_Eastward_May_1( 17 : 113 , : )';
H_u_div_sign_El_Eastward_Dec_1_used = H_u_div_sign_El_Eastward_Dec_1( 17 : 113 , : )';

u_div_ano_El_Eastward_move_year_Dec_0_used     = u_div_ano_El_Eastward_move_year_Dec_0( 17 : 113 , : )';
u_div_ano_El_Eastward_move_year_May_1_used     = u_div_ano_El_Eastward_move_year_May_1( 17 : 113 , : )';
u_div_ano_El_Eastward_move_year_Dec_1_used     = u_div_ano_El_Eastward_move_year_Dec_1( 17 : 113 , : )';
u_div_ano_El_Eastward_move_year_Dec_0_new_used     = u_div_ano_El_Eastward_move_year_Dec_0_new( 17 : 113 , : )';
u_div_ano_El_Eastward_move_year_May_1_new_used     = u_div_ano_El_Eastward_move_year_May_1_new( 17 : 113 , : )';
u_div_ano_El_Eastward_move_year_Dec_1_new_used     = u_div_ano_El_Eastward_move_year_Dec_1_new( 17 : 113 , : )';

u_div_cli_ano_El_Eastward_move_year_Dec_0_used = u_div_cli_ano_El_Eastward_move_year_Dec_0( 17 : 113 , : )';
u_div_cli_ano_El_Eastward_move_year_May_1_used = u_div_cli_ano_El_Eastward_move_year_May_1( 17 : 113 , : )';
u_div_cli_ano_El_Eastward_move_year_Dec_1_used = u_div_cli_ano_El_Eastward_move_year_Dec_1( 17 : 113 , : )';
%%
R_earth     = 6371393; % m
dx_distance = 2.5 / 180 * pi * R_earth;
constant    = 9.8 ./ ( R_earth * pi ./ 18);

W_div_cli = NaN( size( u_psi_cli_down ) );
for ilev = 1 :size( u_psi_cli_down , 2 )
    for ilon = 1 : size( u_psi_cli_down , 1 )
        if ilon == 1
            d_psi = u_psi_cli_down( 2 , ilev ) - u_psi_cli_down( end , ilev );
        elseif ilon == size( u_psi_cli_down , 1 )
            d_psi = u_psi_cli_down( 1 , ilev ) - u_psi_cli_down( end-1 , ilev );
        else
            d_psi = u_psi_cli_down( ilon + 1 , ilev ) - u_psi_cli_down( ilon - 1 , ilev );
        end

        Wd_temp = -1 * constant * d_psi ./ ( 2 * dx_distance );
        W_div_cli( ilon , ilev ) = Wd_temp;
    end
end
clear Wd_temp

W_div_ano = NaN( size( u_psi_ano_down_detrend_fliter ) );
for itime = 1 : size( u_psi_ano_down_detrend_fliter , 3 )
    for ilev = 1 :size( u_psi_ano_down_detrend_fliter , 2 )
        for ilon = 1 : size( u_psi_ano_down_detrend_fliter , 1 )
            if ilon == 1
                d_psi = u_psi_ano_down_detrend_fliter( 2 , ilev , itime ) - u_psi_ano_down_detrend_fliter( end , ilev , itime );
            elseif ilon == size( u_psi_ano_down_detrend_fliter , 1 )
                d_psi = u_psi_ano_down_detrend_fliter( 1 , ilev , itime ) - u_psi_ano_down_detrend_fliter( end-1 , ilev , itime );
            else
                d_psi = u_psi_ano_down_detrend_fliter( ilon + 1 , ilev , itime ) - u_psi_ano_down_detrend_fliter( ilon - 1 , ilev , itime );
            end

            Wd_temp = -1 * constant * d_psi ./ ( 2 * dx_distance );
            W_div_ano( ilon , ilev , itime ) = Wd_temp;
        end
    end
end
clear Wd_temp
%%
W_div_ano_El_Eastward_move_year_Dec_0     = mean( W_div_ano( : , : , id_El_Eastward_move_year_Dec_0 ) , 3 );
W_div_ano_El_Eastward_move_year_May_1     = mean( W_div_ano( : , : , id_El_Eastward_move_year_May_1 ) , 3 );
W_div_ano_El_Eastward_move_year_Dec_1     = mean( W_div_ano( : , : , id_El_Eastward_move_year_Dec_1 ) , 3 );
W_div_cli_ano_El_Eastward_move_year_Dec_0 = mean( W_div_ano( : , : , id_El_Eastward_move_year_Dec_0 ) , 3 ) + W_div_cli;
W_div_cli_ano_El_Eastward_move_year_May_1 = mean( W_div_ano( : , : , id_El_Eastward_move_year_May_1 ) , 3 ) + W_div_cli;
W_div_cli_ano_El_Eastward_move_year_Dec_1 = mean( W_div_ano( : , : , id_El_Eastward_move_year_Dec_1 ) , 3 ) + W_div_cli;

W_div_ano_El_Eastward_move_year_Dec_0_all_year = W_div_ano( : , : , id_El_Eastward_move_year_Dec_0 );
W_div_ano_El_Eastward_move_year_May_1_all_year = W_div_ano( : , : , id_El_Eastward_move_year_May_1 );
W_div_ano_El_Eastward_move_year_Dec_1_all_year = W_div_ano( : , : , id_El_Eastward_move_year_Dec_1 );
% W_div student t-test
H_W_div_sign_El_Eastward_Dec_0 = NaN( length( lon_upsi ) , length( lev_upsi ) );
H_W_div_sign_El_Eastward_May_1 = NaN( length( lon_upsi ) , length( lev_upsi ) );
H_W_div_sign_El_Eastward_Dec_1 = NaN( length( lon_upsi ) , length( lev_upsi ) );
nlon_upsi  = length( lon_upsi );
nlev_upsi  = length( lev_upsi );

for ilon = 1 : nlon_upsi
    for ilev = 1 : nlev_upsi

        H_W_div_sign_El_Eastward_Dec_0( ilon , ilev ) = ttest( squeeze( W_div_ano_El_Eastward_move_year_Dec_0_all_year( ilon , ilev , : ) )' );
        H_W_div_sign_El_Eastward_May_1( ilon , ilev ) = ttest( squeeze( W_div_ano_El_Eastward_move_year_May_1_all_year( ilon , ilev , : ) )' );        
        H_W_div_sign_El_Eastward_Dec_1( ilon , ilev ) = ttest( squeeze( W_div_ano_El_Eastward_move_year_Dec_1_all_year( ilon , ilev , : ) )' );
    end
end
clear ilon imoth
H_W_div_sign_El_Eastward_Dec_0 = H_W_div_sign_El_Eastward_Dec_0 > 0;
H_W_div_sign_El_Eastward_May_1 = H_W_div_sign_El_Eastward_May_1 > 0;
H_W_div_sign_El_Eastward_Dec_1 = H_W_div_sign_El_Eastward_Dec_1 > 0;

W_div_ano_El_Eastward_move_year_Dec_0_new = NaN( nlon_upsi , nlev_upsi );
W_div_ano_El_Eastward_move_year_May_1_new = NaN( nlon_upsi , nlev_upsi );
W_div_ano_El_Eastward_move_year_Dec_1_new = NaN( nlon_upsi , nlev_upsi );
for ilon = 1 : nlon_upsi
    for ilev = 1 : nlev_upsi
        if H_W_div_sign_El_Eastward_Dec_0
            W_div_ano_El_Eastward_move_year_Dec_0_new( ilon , ilev ) = W_div_ano_El_Eastward_move_year_Dec_0( ilon , ilev );
        end
        
        if H_W_div_sign_El_Eastward_May_1
            W_div_ano_El_Eastward_move_year_May_1_new( ilon , ilev ) = W_div_ano_El_Eastward_move_year_May_1( ilon , ilev );
        end     

        if H_W_div_sign_El_Eastward_Dec_1
            W_div_ano_El_Eastward_move_year_Dec_1_new( ilon , ilev ) = W_div_ano_El_Eastward_move_year_Dec_1( ilon , ilev );
        end        
    end
end
%%
H_W_div_sign_El_Eastward_Dec_0_used = H_W_div_sign_El_Eastward_Dec_0( 17 : 113 , : )';
H_W_div_sign_El_Eastward_May_1_used = H_W_div_sign_El_Eastward_May_1( 17 : 113 , : )';
H_W_div_sign_El_Eastward_Dec_1_used = H_W_div_sign_El_Eastward_Dec_1( 17 : 113 , : )';

W_div_ano_El_Eastward_move_year_Dec_0_used     = W_div_ano_El_Eastward_move_year_Dec_0( 17 : 113 , : )';
W_div_ano_El_Eastward_move_year_May_1_used     = W_div_ano_El_Eastward_move_year_May_1( 17 : 113 , : )';
W_div_ano_El_Eastward_move_year_Dec_1_used     = W_div_ano_El_Eastward_move_year_Dec_1( 17 : 113 , : )';
W_div_ano_El_Eastward_move_year_Dec_0_new_used     = W_div_ano_El_Eastward_move_year_Dec_0_new( 17 : 113 , : )';
W_div_ano_El_Eastward_move_year_May_1_new_used     = W_div_ano_El_Eastward_move_year_May_1_new( 17 : 113 , : )';
W_div_ano_El_Eastward_move_year_Dec_1_new_used     = W_div_ano_El_Eastward_move_year_Dec_1_new( 17 : 113 , : )';

W_div_cli_ano_El_Eastward_move_year_Dec_0_used = W_div_cli_ano_El_Eastward_move_year_Dec_0( 17 : 113 , : )';
W_div_cli_ano_El_Eastward_move_year_May_1_used = W_div_cli_ano_El_Eastward_move_year_May_1( 17 : 113 , : )';
W_div_cli_ano_El_Eastward_move_year_Dec_1_used = W_div_cli_ano_El_Eastward_move_year_Dec_1( 17 : 113 , : )';
%%
u_psi_cli_down_used = u_psi_cli_down;
u_div_year_cli_used = u_div_year_cli_equ( 17 : 113 , : )';
W_div_year_cli_used = W_div_cli( 17 : 113 , : )';
%%
u_psi_cli_down_used = u_psi_cli_down;
u_div_year_cli_used = u_div_year_cli_equ( 17 : 113 , : )';
label_ano     = [ -20 -2.8 : 0.4 : 2.8  20 ];
label_cli_ano = [ -30 -7 : 1 : 7  30 ];
p = [ lev_upsi , log( 1000 ./ lev_upsi ) ];% 对数气压坐标转换，转换公式：y = ln(p0/p) = ln(1000/p)
p = p( ismember( p( : , 1 ) , [ 1000 ; 850 ; 700 ; 600 ; 500 ; 400 ; 300 ; 200 ; 150 ; 100  ] ) == 1 , : );
[ X , Y ] = meshgrid( lon_upsi( 17 : 113 ) , log( 1000 ./ lev_upsi( 1 : 12 ) ) );
[ X_upsi_sign , Y_upsi_sign ] = meshgrid( lon_upsi , log( 1000 ./ lev_upsi ) );
colornew1  = [ 0, 0, 153
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

colornew2  = [ 0, 0, 255
               37, 37, 255
               75, 75, 255
               116, 116, 255
               155, 155, 255
               195, 195, 255
               239, 239, 255
               255, 239, 239
               255, 197, 197
               255, 157, 157
               255, 118, 118
               255, 78, 78
               255, 40, 40
               255, 0, 0  ] / 255;
sat_factor = 0.85;                 % 例如提升 20%
cmap_hsv   = rgb2hsv( colornew1 );
cmap_hsv(:,2) = min(1, max(0, cmap_hsv(:,2) * sat_factor));
cmap_sat   = hsv2rgb(cmap_hsv);
%% 置信度的一种表达方式,只在异常质量流函数里面打点
figure(1)
set( gcf , 'position' , [ 100 0 1600 2060 ] , 'color' , 'w' );
[ ax , ~ ]  = tight_subplot( 4 , 2 , [ 0.05 0.12 ] , [ 0.12 0.05 ] , [ 0.1 0.1 ] ); 

axes( ax(1) )
set( ax(1) , ...
            'Visible', 'off', ...  % 隐藏整个坐标轴（包括刻度、标签、背景）
            'XColor', 'none', ...  % 确保X轴无颜色
            'YColor', 'none', ...  % 确保Y轴无颜色
            'Color', 'none');      % 坐标轴背景透明（与figure背景一致）
        
% —— 紧接 tight_subplot 之后、开始画图前 —— 
pos1 = get(ax(1), 'Position');   % 第一行左侧（空图）
pos2 = get(ax(2), 'Position');   % 第一行右侧（实际图）

rowLeft  = min(pos1(1), pos2(1));
rowRight = max(pos1(1)+pos1(3), pos2(1)+pos2(3));
rowCenter = (rowLeft + rowRight)/2;
% 只移动，不改宽高
w = pos2(3);  h = pos2(4);
newLeft = rowCenter - w/2;
axes( ax(2) )
set( ax(2), 'Position', [newLeft, pos2(2), w, h], ...
           'ActivePositionProperty','Position');
[ C1 , H1 ] = contourf( lon_upsi , log( 1000 ./ lev_upsi ) , u_psi_cli_down_used' / 1e9 , label_cli_ano , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , u_psi_cli_down_used' / 1e9 , [ 0 , 0 ] , 'k-' );
set( H2 , 'LineWidth' , 1.5 );
clear C2 H2
[ C3 , H3 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , u_psi_cli_down_used' / 1e9 , [  1 : 1 : 7 100  ] , 'r-' );
set( H3 , 'LineWidth' , 1 );
clear C3 H3
[ C4 , H4 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , u_psi_cli_down_used' / 1e9 , [ -100 -7 : 1 : -1 ] , 'b--' );
set( H4 , 'LineWidth' , 1 );
clear C4 H4

set( ax( 2 ) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax( 2 ) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                                 '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax( 2 ) , 'ylim' , [ p( 1 , 2 ) p( end , 2 ) ] , 'YTick' , p( : , 2 ) );
set( ax( 2 ) , 'YTicklabel' , p( : , 1 ) );
ylabel( 'Pressure level (hPa)' );
set( ax( 2 ) , 'linewidth' , 1.5 , 'fontsize' , 17 , 'Fontname' , 'Times New Roman' );
caxis( [ label_cli_ano( 2 ) label_cli_ano( end - 1 ) ] );    
colormap( ax(2) , colornew2 );
text( 0 , 1.15 , '(a)' , ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  
title( 'Climatology'  , 'FontName' , 'Times New Roman' , 'FontSize' , 20  );

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
xNew = posX + (X - minX) / (maxX - minX) * width;
yNew = posY + (Y - minY) / (maxY - minY) * height;

% 画风场
[ ~ , lon1 ] = find( X( 1 , : ) == limX( 1 ) );
[ ~ , lon2 ] = find( X( 1 , : ) == limX( 2 ) - 2.5 );
W_d_El_ano = W_div_year_cli_used;
U_d_El_ano = u_div_year_cli_used;

n=0.01;   % 调整箭头的长度
for itime = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 10 , 11 , 12 ] % 不画最底层和最高层
    for ilon = lon1 : 4 : lon2
        if xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [  0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        elseif xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ], ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        else                                               
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        end
    end
end

[~, ix] = min(abs(X(1,:) - 156));
[~, iy] = min(abs(Y(:,1) - 0.72));
xn = xNew(iy, ix);
yn = yNew(iy, ix);
r = 0.013; % 控制圆大小
annotation('ellipse', [xn - r, yn - r, 2*r - 0.0028 , 2*r], ...
            'FaceColor', [0,176,80]/255, ...
            'EdgeColor', [69,112,162]/255, ...
            'LineWidth', 2.8 );

axes( ax(3) )
[ C1 , H1 ] = contourf( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_0' / 1e9 , label_ano , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_0' / 1e9 , [ 0 , 0 ] , 'k-' );
set( H2 , 'LineWidth' , 1.5 );
clear C2 H2
[ C3 , H3 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_0' / 1e9 , [ 0.4 : 0.4 : 2.8 20 ] , 'r-' );
set( H3 , 'LineWidth' , 1 );
clear C3 H3
[ C4 , H4 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_0' / 1e9 , [ -20 -2.8 : 0.4 : -0.4 ] , 'b--' );
set( H4 , 'LineWidth' , 1 );
clear C4 4
% stipple( X_upsi_sign , Y_upsi_sign , H_upsi_sign_El_Eastward_Dec_0' , ...
%              'marker' , 'o' , ...      % 强制圆点
%              'color' , [ 1 1 1 ] , ...       % 白色点
%              'MarkerSize' , 2.4 , ...    % 点大小
%              'MarkerFaceColor' , [ 1 1 1 ] ,...
%              'MarkerEdgeColor' , [ 1 1 1 ] ,...
%              'density' , 220 , ...      % 点密度
%              'resize' , true );        % 自动缩放
set( ax( 3 ) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax( 3 ) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                                 '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax( 3 ) , 'ylim' , [ p( 1 , 2 ) p( end , 2 ) ] , 'YTick' , p( : , 2 ) );
set( ax( 3 ) , 'YTicklabel' , p( : , 1 ) );
ylabel( 'Pressure level (hPa)' );
set( ax( 3 ) , 'linewidth' , 1.5 , 'fontsize' , 17 , 'Fontname' , 'Times New Roman' );
caxis( [ label_ano( 2 ) label_ano( end - 1 ) ] );    
colormap( ax(3) , cmap_sat );
text( 0 , 1.15 , '(b)' , ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  
title( 'Dec(0)'  , 'FontName' , 'Times New Roman' , 'FontSize' , 20  );  
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
xNew = posX + (X - minX) / (maxX - minX) * width;
yNew = posY + (Y - minY) / (maxY - minY) * height;

% 画风场
[ ~ , lon1 ] = find( X( 1 , : ) == limX( 1 ) );
[ ~ , lon2 ] = find( X( 1 , : ) == limX( 2 ) - 2.5 );
W_d_El_ano = W_div_ano_El_Eastward_move_year_Dec_0_used;
U_d_El_ano = u_div_ano_El_Eastward_move_year_Dec_0_used;

n=0.02;   % 调整箭头的长度
for itime = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 10 , 11 , 12 ] % 不画最底层和最高层
    for ilon = lon1 : 4 : lon2
        if xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [  0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        elseif xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ], ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        else                                               
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        end
    end
end

[~, ix] = min(abs(X(1,:) - 131));
[~, iy] = min(abs(Y(:,1) - 0.72));
xn = xNew(iy, ix);
yn = yNew(iy, ix);
r = 0.013; % 控制圆大小
annotation('ellipse', [xn - r, yn - r, 2*r - 0.0028 , 2*r], ...
            'FaceColor', [0,176,80]/255, ...
            'EdgeColor', [69,112,162]/255, ...
            'LineWidth', 2.8 );

axes( ax(4) )
[ C1 , H1 ] = contourf( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_0' / 1e9 , label_cli_ano , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_0' / 1e9 , [ 0 , 0 ] , 'k-' );
set( H2 , 'LineWidth' , 1.5 );
% clabel( C2 , H2 , 'fontweight' , 'bold' , 'LabelSpacing' , 600 );
clear C2 H2
[ C3 , H3 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_0' / 1e9 , [  1 : 1 : 7 30  ] , 'r-' );
set( H3 , 'LineWidth' , 1 );
% clabel( C3 , H3 , 'fontweight' , 'bold' , 'LabelSpacing' , 600 );
clear C3 H3
[ C4 , H4 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_0' / 1e9 , [ -30 -7 : 1 : -1 ] , 'b--' );
set( H4 , 'LineWidth' , 1 );
% clabel( C4 , H4 , 'fontweight' , 'bold' , 'LabelSpacing' , 600 );
clear C4 H4
set( ax( 4 ) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax( 4 ) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                                 '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax( 4 ) , 'ylim' , [ p( 1 , 2 ) p( end , 2 ) ] , 'YTick' , p( : , 2 ) );
set( ax( 4 ) , 'YTicklabel' , p( : , 1 ) );
ylabel( 'Pressure level (hPa)' );
set( ax( 4 ) , 'linewidth' , 1.5 , 'fontsize' , 17 , 'Fontname' , 'Times New Roman' );
caxis( [ label_cli_ano( 2 ) label_cli_ano( end - 1 ) ] );    
colormap( ax(4) , colornew2 );
text( 0 , 1.15 , '(e)' , ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  
title( 'Dec(0)'  , 'FontName' , 'Times New Roman' , 'FontSize' , 20  ); 
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
xNew = posX + (X - minX) / (maxX - minX) * width;
yNew = posY + (Y - minY) / (maxY - minY) * height;

% 画风场
[ ~ , lon1 ] = find( X( 1 , : ) == limX( 1 ) );
[ ~ , lon2 ] = find( X( 1 , : ) == limX( 2 ) - 2.5 );
W_d_El_ano = W_div_cli_ano_El_Eastward_move_year_Dec_0_used;
U_d_El_ano = u_div_cli_ano_El_Eastward_move_year_Dec_0_used;

n=0.01;   % 调整箭头的长度
for itime = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 10 , 11 , 12 ] % 不画最底层和最高层
    for ilon = lon1 : 4 : lon2
        if xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [  0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        elseif xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ], ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        else                                               
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        end
    end
end
    
[~, ix] = min(abs(X(1,:) - 174.5));
[~, iy] = min(abs(Y(:,1) - 0.72));
xn = xNew(iy, ix);
yn = yNew(iy, ix);
r = 0.013; % 控制圆大小
annotation('ellipse', [xn - r, yn - r, 2*r - 0.0028 , 2*r], ...
            'FaceColor', [0,176,80]/255, ...
            'EdgeColor', [69,112,162]/255, ...
            'LineWidth', 2.8 );

axes( ax(5) )
[ C1 , ~ ] = contourf( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_May_1' / 1e9 , label_ano , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_May_1' / 1e9 , [ 0 , 0 ] , 'k-' );
set( H2 , 'LineWidth' , 1.5 );
clear C2 H2
[ C3 , H3 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_May_1' / 1e9 , [ 0.4 : 0.4 : 2.8 20 ] , 'r-' );
set( H3 , 'LineWidth' , 1 );
clear C3 H3
[ C4 , H4 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_May_1' / 1e9 , [ -20 -2.8 : 0.4 : -0.4 ] , 'b--' );
set( H4 , 'LineWidth' , 1 );
clear C4 H4
% stipple( X_upsi_sign , Y_upsi_sign , H_upsi_sign_El_Eastward_May_1' , ...
%              'marker' , 'o' , ...      % 强制圆点
%              'color' , [ 1 1 1 ] , ...       % 白色点
%              'MarkerSize' , 2.4 , ...    % 点大小
%              'MarkerFaceColor' , [ 1 1 1 ] ,...
%              'MarkerEdgeColor' , [ 1 1 1 ] ,...
%              'density' , 220 , ...      % 点密度
%              'resize' , true );        % 自动缩放
set( ax( 5 ) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax( 5 ) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                                 '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax( 5 ) , 'ylim' , [ p( 1 , 2 ) p( end , 2 ) ] , 'YTick' , p( : , 2 ) );
set( ax( 5 ) , 'YTicklabel' , p( : , 1 ) );
ylabel( 'Pressure level (hPa)' );
set( ax( 5 ) , 'linewidth' , 1.5 , 'fontsize' , 17 , 'Fontname' , 'Times New Roman' );
caxis( [ label_ano( 2 ) label_ano( end - 1 ) ] );    
colormap( ax(5) , cmap_sat );
text( 0 , 1.15 , '(c)' , ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  
title( 'May(1)'  , 'FontName' , 'Times New Roman' , 'FontSize' , 20  ); 
posAxes = get( ax(5) , 'Position' );
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
xNew = posX + (X - minX) / (maxX - minX) * width;
yNew = posY + (Y - minY) / (maxY - minY) * height;

% 画风场
[ ~ , lon1 ] = find( X( 1 , : ) == limX( 1 ) );
[ ~ , lon2 ] = find( X( 1 , : ) == limX( 2 ) - 2.5 );
W_d_El_ano = W_div_ano_El_Eastward_move_year_May_1_used;
U_d_El_ano = u_div_ano_El_Eastward_move_year_May_1_used;

n=0.02;   % 调整箭头的长度
for itime = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 10 , 11 , 12 ] % 不画最底层和最高层
    for ilon = lon1 : 4 : lon2
        if xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [  0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        elseif xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ], ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        else                                               
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        end
    end
end


[~, ix] = min(abs(X(1,:) - 161));
[~, iy] = min(abs(Y(:,1) - 0.72));
xn = xNew(iy, ix);
yn = yNew(iy, ix);
r = 0.013; % 控制圆大小
annotation('ellipse', [xn - r, yn - r, 2*r - 0.0028 , 2*r], ...
            'FaceColor', [0,176,80]/255, ...
            'EdgeColor', [69,112,162]/255, ...
            'LineWidth', 2.8 );

axes( ax(6) )
[ C1 , H1 ] = contourf( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_May_1' / 1e9 , label_cli_ano , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_May_1' / 1e9 , [ 0 , 0 ] , 'k-' );
set( H2 , 'LineWidth' , 1.5 );
clear C2 H2
[ C3 , H3 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_May_1' / 1e9 , [  1 : 1 : 7 30  ] , 'r-' );
set( H3 , 'LineWidth' , 1 );
clear C3 H3
[ C4 , H4 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_May_1' / 1e9 , [ -30 -7 : 1 : -1 ] , 'b--' );
set( H4 , 'LineWidth' , 1 );
clear C4 H4
set( ax( 6 ) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax( 6 ) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                                 '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax( 6 ) , 'ylim' , [ p( 1 , 2 ) p( end , 2 ) ] , 'YTick' , p( : , 2 ) );
set( ax( 6 ) , 'YTicklabel' , p( : , 1 ) );
ylabel( 'Pressure level (hPa)' );
set( ax( 6 ) , 'linewidth' , 1.5 , 'fontsize' , 17 , 'Fontname' , 'Times New Roman' );
caxis( [ label_cli_ano( 2 ) label_cli_ano( end - 1 ) ] );    
colormap( ax( 6 ) , colornew2 );
text( 0 , 1.15 , '(f)' , ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  
title( 'May(1)'  , 'FontName' , 'Times New Roman' , 'FontSize' , 20  );
posAxes = get( ax(6) , 'Position' );
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
xNew = posX + (X - minX) / (maxX - minX) * width;
yNew = posY + (Y - minY) / (maxY - minY) * height;

% 画风场
[ ~ , lon1 ] = find( X( 1 , : ) == limX( 1 ) );
[ ~ , lon2 ] = find( X( 1 , : ) == limX( 2 ) - 2.5 );
W_d_El_ano = W_div_cli_ano_El_Eastward_move_year_May_1_used;
U_d_El_ano = u_div_cli_ano_El_Eastward_move_year_May_1_used;

n=0.01;   % 调整箭头的长度
for itime = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 10 , 11 , 12 ] % 不画最底层和最高层
    for ilon = lon1 : 4 : lon2
        if xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [  0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        elseif xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ], ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        else                                               
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        end
    end
end


[~, ix] = min(abs(X(1,:) - 149.2));
[~, iy] = min(abs(Y(:,1) - 0.72));
xn = xNew(iy, ix);
yn = yNew(iy, ix);
r = 0.013; % 控制圆大小
annotation('ellipse', [xn - r, yn - r, 2*r - 0.0028 , 2*r], ...
            'FaceColor', [0,176,80]/255, ...
            'EdgeColor', [69,112,162]/255, ...
            'LineWidth', 2.8 );

axes( ax(7) )
[ C1 , H1 ] = contourf( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_1' / 1e9 , label_ano , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_1' / 1e9 , [ 0 , 0 ] , 'k-' );
set( H2 , 'LineWidth' , 1.5 );
clear C2 H2
[ C3 , H3 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_1' / 1e9 , [  0.4 : 0.4 : 2.8 20  ] , 'r-' );
set( H3 , 'LineWidth' , 1 );
clear C3 H3
[ C4 , H4 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_ano_El_Eastward_move_year_Dec_1' / 1e9 , [ -20 -2.8 : 0.4 : -0.4 ] , 'b--' );
set( H4 , 'LineWidth' , 1 );
clear C4 H4

% stipple( X_upsi_sign , Y_upsi_sign , H_upsi_sign_El_Eastward_Dec_1' , ...
%              'marker' , 'o' , ...      % 强制圆点
%              'color' , [ 1 1 1 ] , ...       % 白色点
%              'MarkerSize' , 2.4 , ...    % 点大小
%              'MarkerFaceColor' , [ 1 1 1 ] ,...
%              'MarkerEdgeColor' , [ 1 1 1 ] ,...
%              'density' , 220 , ...      % 点密度
%              'resize' , true );        % 自动缩放   
set( ax( 7 ) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax( 7 ) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                                 '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax( 7 ) , 'ylim' , [ p( 1 , 2 ) p( end , 2 ) ] , 'YTick' , p( : , 2 ) );
set( ax( 7 ) , 'YTicklabel' , p( : , 1 ) );
ylabel( 'Pressure level (hPa)' );
set( ax( 7 ) , 'linewidth' , 1.5 , 'fontsize' , 17 , 'Fontname' , 'Times New Roman' );
caxis( [ label_ano( 2 ) label_ano( end - 1 ) ] );    
colormap( ax(7) , cmap_sat );
text( 0 , 1.15 , '(d)' , ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  
title( 'Dec(1)'  , 'FontName' , 'Times New Roman' , 'FontSize' , 20  );
posAxes = get( ax(7) , 'Position' );
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
xNew = posX + (X - minX) / (maxX - minX) * width;
yNew = posY + (Y - minY) / (maxY - minY) * height;

% 画风场
[ ~ , lon1 ] = find( X( 1 , : ) == limX( 1 ) );
[ ~ , lon2 ] = find( X( 1 , : ) == limX( 2 ) - 2.5 );
W_d_El_ano = W_div_ano_El_Eastward_move_year_Dec_1_used;
U_d_El_ano = u_div_ano_El_Eastward_move_year_Dec_1_used;

n=0.02;   % 调整箭头的长度
for itime = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 10 , 11 , 12 ] % 不画最底层和最高层
    for ilon = lon1 : 4 : lon2
        if xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [  0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        elseif xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ], ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        else                                               
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        end
    end
end
% plot( 200 , 0.7 , 'o' ,...
%         'LineWidth' , 2 ,...
%         'MarkerSize' , 18 ,...
%         'MarkerEdgeColor' , [ 69, 112, 162 ]/255 ,...
%         'MarkerFaceColor' , [ 0, 176, 80 ]/255 );

[~, ix] = min(abs(X(1,:) - 201));
[~, iy] = min(abs(Y(:,1) - 0.72));
xn = xNew(iy, ix);
yn = yNew(iy, ix);
r = 0.013; % 控制圆大小
annotation('ellipse', [xn - r, yn - r, 2*r - 0.0028 , 2*r], ...
            'FaceColor', [0,176,80]/255, ...
            'EdgeColor', [69,112,162]/255, ...
            'LineWidth', 2.8 );
        
axes( ax(8) )
[ C1 , H1 ] = contourf( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_1' / 1e9 , label_cli_ano , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_1' / 1e9 , [ 0 , 0 ] , 'k-' );
set( H2 , 'LineWidth' , 1.5 );
clear C2 H2
[ C3 , H3 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_1' / 1e9 , [  1 : 1 : 7 30  ] , 'r-' );
set( H3 , 'LineWidth' , 1 );
clear C3 H3
[ C4 , H4 ] = contour( lon_upsi , log( 1000 ./ lev_upsi ) , upsi_cli_ano_El_Eastward_move_year_Dec_1' / 1e9 , [ -30 -7 : 1 : -1 ] , 'b--' );
set( H4 , 'LineWidth' , 1 );
clear C4 H4
set( ax( 8 ) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax( 8 ) , 'XTicklabel' , {  '0\circ' , '40\circE' , '80\circE'  , '120\circE' , ...
                                 '160\circE' , '160\circW' , '120\circW' , '80\circW' , '40\circW' , '0\circ' } );
set( ax( 8 ) , 'ylim' , [ p( 1 , 2 ) p( end , 2 ) ] , 'YTick' , p( : , 2 ) );
set( ax( 8 ) , 'YTicklabel' , p( : , 1 ) );
ylabel( 'Pressure level (hPa)' );
set( ax( 8 ) , 'linewidth' , 1.5 , 'fontsize' , 17 , 'Fontname' , 'Times New Roman' );
caxis( [ label_cli_ano( 2 ) label_cli_ano( end - 1 ) ] );    
colormap( ax(8) , colornew2 );
text( 0 , 1.15 , '(g)' , ...
                 'Units' , 'normalized' , ...         % 归一化坐标
                 'HorizontalAlignment' , 'left', ...
                 'VerticalAlignment' , 'top', ...
                 'FontName' , 'Times New Roman' , ...
                 'FontSize' , 20 , ...
                 'Clipping' , 'on' );  
title( 'Dec(1)'  , 'FontName' , 'Times New Roman' , 'FontSize' , 20  );
posAxes = get( ax(8) , 'Position' );
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
xNew = posX + (X - minX) / (maxX - minX) * width;
yNew = posY + (Y - minY) / (maxY - minY) * height;

% 画风场
[ ~ , lon1 ] = find( X( 1 , : ) == limX( 1 ) );
[ ~ , lon2 ] = find( X( 1 , : ) == limX( 2 ) - 2.5 );
W_d_El_ano = W_div_cli_ano_El_Eastward_move_year_Dec_1_used;
U_d_El_ano = u_div_cli_ano_El_Eastward_move_year_Dec_1_used;

n=0.01;   % 调整箭头的长度
for itime = [ 2 , 3 , 4 , 5 , 6 , 7 , 8 , 10 , 11 , 12 ] % 不画最底层和最高层
    for ilon = lon1 : 4 : lon2
        if xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n <= xNew( 1 , lon1 )      % 避免让箭头超出左边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon1 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [  0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        elseif xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n >= xNew( 1 , lon2 )  % 避免让箭头超出右边界
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( 1 , lon2 ) ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ], ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        else                                               
            annotation( 'arrow' , [ xNew( itime , ilon ) , xNew( itime , ilon ) + U_d_El_ano( itime , ilon ) .* n ] , ...
                [ yNew( itime , ilon ) , yNew( itime , ilon ) + W_d_El_ano( itime , ilon ) .* n * -120 ] , ...
                'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 ,...
                'LineWidth', 2 );
        end
    end
end
% plot( 137 , 0.7 , 'o' ,...
%         'LineWidth' , 2 ,...
%         'MarkerSize' , 18 ,...
%         'MarkerEdgeColor' , [ 69, 112, 162 ]/255 ,...
%         'MarkerFaceColor' , [ 0, 176, 80 ]/255 );

[~, ix] = min(abs(X(1,:) - 138.8));
[~, iy] = min(abs(Y(:,1) - 0.72));
xn = xNew(iy, ix);
yn = yNew(iy, ix);
r = 0.013; % 控制圆大小
annotation('ellipse', [xn - r, yn - r, 2*r - 0.0028 , 2*r], ...
            'FaceColor', [0,176,80]/255, ...
            'EdgeColor', [69,112,162]/255, ...
            'LineWidth', 2.8 );
        
% === 第一行 colorbar ===
cb1 = colorbar(ax(7));   % 放在第一列子图下
cb1.Ticks = [ -2.4 : 0.8 : 2.4 ];
cb1.FontSize = 18;
cb1.Location = 'southoutside';
cb1.Position = [0.098 0.024 0.30 0.016];   % [x y width height] 需微调
cb1.Label.String = '×10^9 kg·s^{-1}';
cb1.Label.FontSize = 18;
cb1.Label.FontName = 'Times New Roman';
cb1.Label.Rotation = 0;                 % 水平文字
cb1.Label.Units = 'normalized';         % 用归一化坐标摆放
cb1.Label.HorizontalAlignment = 'right';
cb1.Label.VerticalAlignment   = 'bottom';
cb1.Label.Position = [1, 1.05, 0]; 

n = 0.02;
annotation(  'arrow' , [ 0.415 , 0.415 + 1 .* n ] , [ 0.024 , 0.024 ] , ...
             'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 , 'LineWidth', 2 );
annotation(  'arrow' , [ 0.415 , 0.415 ] , [ 0.024 ,  0.024 + 0.01 * n * 120 ] , ...
             'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 , 'LineWidth', 2 );         

annotation('textbox', [ 0.432, 0.028, 0.042, 0.009], ...
            'String', '1 m/s', ...
            'FontSize', 14, 'FontName', 'Times New Roman', ...
            'HorizontalAlignment', 'left', ...
            'LineStyle', 'none');
annotation('textbox', [ 0.409, 0.06, 0.08, 0.009], ...
            'String', '0.01 Pa/s', ...
            'FontSize', 14, 'FontName', 'Times New Roman', ...
            'HorizontalAlignment', 'left', ...
            'LineStyle', 'none');
% === 第二行 colorbar ===
cb2 = colorbar(ax(8));
cb2.Ticks = [ -6 : 2 : 6 ];
cb2.FontSize = 18;
cb2.Location = 'southoutside';
cb2.Position = [0.56 0.024 0.30 0.016];
cb2.Label.String = '×10^9 kg·s^{-1}';
cb2.Label.FontSize = 18;
cb2.Label.FontName = 'Times New Roman';
cb2.Label.Rotation = 0;
cb2.Label.Units = 'normalized';
cb2.Label.HorizontalAlignment = 'right';
cb2.Label.VerticalAlignment   = 'bottom';
cb2.Label.Position = [1, 1.05, 0];
n = 0.02;
annotation(  'arrow' , [ 0.88 , 0.88 + 1 .* n ] , [ 0.024 , 0.024 ] , ...
             'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 , 'LineWidth', 2 );
annotation(  'arrow' , [ 0.88 , 0.88 ] , [ 0.024 ,  0.024 + 0.01 * n * 120 ] , ...
             'Color' , [ 0 0 0 ] , 'Headwidth' , 12 , 'Headstyle' , 'vback2' , 'Headlength' , 10 , 'LineWidth', 2 );         

annotation('textbox', [ 0.897, 0.028, 0.042, 0.009], ...
            'String', '2 m/s', ...
            'FontSize', 14, 'FontName', 'Times New Roman', ...
            'HorizontalAlignment', 'left', ...
            'LineStyle', 'none');
annotation('textbox', [ 0.874, 0.06, 0.08, 0.009], ...
            'String', '0.02 Pa/s', ...
            'FontSize', 14, 'FontName', 'Times New Roman', ...
            'HorizontalAlignment', 'left', ...
            'LineStyle', 'none');