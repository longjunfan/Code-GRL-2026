clc;
clear all;
close all;
load( '../Data Store/NECP2_upsi_ano_pres_detrend_lowpass_197901_202412.mat' );
u_psi_ano_down_detrend_filter_400_600hpa         = squeeze( nanmean( u_psi_ano_down_detrend_filter( : , 5 : 7 , : ) , 2 ) );
u_psi_ano_down_detrend_filter_400_600hpa_change  = u_psi_ano_down_detrend_filter_400_600hpa( : , 6 : end );
%%
R_earth     = 6371393; % unit:m
dx_distance = 2.5 / 180 * pi * R_earth;
constant    = 9.8 ./ ( R_earth * pi ./ 18);
W_d_ano_El_eastward_move_year_used = NaN( size( u_psi_ano_down_detrend_filter_400_600hpa_change ) );
for itime = 1 : size( u_psi_ano_down_detrend_filter_400_600hpa_change , 2 )
    for ilon = 1 : size( u_psi_ano_down_detrend_filter_400_600hpa_change , 1 )
        if ilon == 1
            d_psi = u_psi_ano_down_detrend_filter_400_600hpa_change( 2 , itime ) - u_psi_ano_down_detrend_filter_400_600hpa_change( end , itime );
        elseif ilon == size( u_psi_ano_down_detrend_filter_400_600hpa_change , 1 )
            d_psi = u_psi_ano_down_detrend_filter_400_600hpa_change( 1 , itime ) - u_psi_ano_down_detrend_filter_400_600hpa_change( end-1 , itime );
        else
            d_psi = u_psi_ano_down_detrend_filter_400_600hpa_change( ilon + 1 , itime ) - u_psi_ano_down_detrend_filter_400_600hpa_change( ilon - 1 , itime );
        end
        
        Wd_temp = -1 * constant * d_psi ./ ( 2 * dx_distance );
        W_d_ano_El_eastward_move_year_used( ilon , itime ) = Wd_temp;
    end
end
clear Wd_temp
W_d_ano_El_eastward_move_year_used = W_d_ano_El_eastward_move_year_used';
%%
[ X , Y ] = meshgrid( lon( 17 : 113 ) , 1:1:19 );
label = [ -20 -2.8 : 0.4 : 2.8 20 ];
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
sat_factor = 0.85;                 
cmap_hsv   = rgb2hsv( colornew );
cmap_hsv(:,2) = min(1, max(0, cmap_hsv(:,2) * sat_factor));
cmap_sat   = hsv2rgb(cmap_hsv);

figure(1)
set( gcf , 'position' , [ 100 100 2000 960 ] , 'color' , 'w' );
[ ax , ~ ]  = tight_subplot( 2 , 2 , [ 0.1 0.08 ] , [ 0.18 0.05 ] , [ 0.05 0.03 ] );

axes( ax(3) )
year_1994_start = ( 1994 - 1979 ) * 12 + 1;
year_1994_last  = ( 1994 - 1979 + 2 ) * 12 - 5;
[ C1 , H1 ] = contourf( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_1994_start : year_1994_last )' ./ 1e9 , label , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_1994_start : year_1994_last )' ./ 1e9 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
plot( [ 100 160 ] , [ 7 19 ] , 'color' , [ 0 255 0 ]/255 , 'LineStyle' , '-' , 'LineWidth' , 6 );     
set( ax(3) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(3) , 'XTicklabel' , {  '0/circ' , '40/circE' , '80/circE'  , '120/circE' , ...
                            '160/circE' , '160/circW' , '120/circW' , '80/circW' , '40/circW' , '0/circ' } );
set( ax(3) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(3) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(3) , 'linewidth' , 1.5 , 'fontsize' , 22 , 'Fontname' , 'Times New Roman' );
colormap( ax(3) , cmap_sat );
caxis( [ label( 2 ) label( end - 1 ) ] );
text( 0 , 1.123 , '(c)', ...
     'Units' , 'normalized' , ...         % 归一化坐标
     'HorizontalAlignment' , 'left', ...
     'VerticalAlignment' , 'top', ...
     'FontName' , 'Times New Roman' , ...
     'FontSize' , 22 , ...
     'Fontname' , 'bold' , ...
     'Clipping' , 'on' );   
title( '1994/95' , 'FontName' , 'Times New Roman' , 'FontSize'  , 22 , 'Fontname' , 'bold' );

axes( ax(4) )
year_2022_start = ( 2022 - 1979 ) * 12 + 1;
year_2022_last  = ( 2022 - 1979 + 2 ) * 12 - 5;
[ C1 , H1 ] = contourf( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_2022_start : year_2022_last )' ./ 1e9 , label , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_2022_start : year_2022_last )' ./ 1e9 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
plot( [ 100 160 ] , [ 7 19 ] , 'color' , [ 0 255 0 ]/255 , 'LineStyle' , '-' , 'LineWidth' , 6 );     
set( ax(4) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(4) , 'XTicklabel' , {  '0/circ' , '40/circE' , '80/circE'  , '120/circE' , ...
                            '160/circE' , '160/circW' , '120/circW' , '80/circW' , '40/circW' , '0/circ' } );
set( ax(4) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(4) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(4) , 'linewidth' , 1.5 , 'fontsize' , 22 , 'Fontname' , 'Times New Roman' );
caxis( [ label( 2 ) label( end - 1 ) ] );
text( 0 , 1.123 , '(d)', ...
     'Units' , 'normalized' , ...         % 归一化坐标
     'HorizontalAlignment' , 'left', ...
     'VerticalAlignment' , 'top', ...
     'FontName' , 'Times New Roman' , ...
     'FontSize' , 22 , ...
     'Fontname' , 'bold' , ...
     'Clipping' , 'on' );   
title( '2022/23' , 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'Fontname' , 'bold' );
colormap( ax(4) , cmap_sat );

axes( ax(2) )
year_2004_start = ( 2004 - 1979 ) * 12 + 1;
year_2004_last  = ( 2004 - 1979 + 2 ) * 12 - 5;
[ C1 , H1 ] = contourf( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_2004_start : year_2004_last )' ./ 1e9 , label , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_2004_start : year_2004_last )' ./ 1e9 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
plot( [ 100 160 ] , [ 7 19 ] , 'color' , [ 0 255 0 ]/255 , 'LineStyle' , '-' , 'LineWidth' , 6 );     
set( ax(2) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(2) , 'XTicklabel' , {  '0/circ' , '40/circE' , '80/circE'  , '120/circE' , ...
                            '160/circE' , '160/circW' , '120/circW' , '80/circW' , '40/circW' , '0/circ' } );
set( ax(2) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(2) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(2) , 'linewidth' , 1.5 , 'fontsize' , 22 , 'Fontname' , 'Times New Roman' );
caxis( [ label( 2 ) label( end - 1 ) ] );
text( 0 , 1.123 , '(b)', ...
     'Units' , 'normalized' , ...         
     'HorizontalAlignment' , 'left', ...
     'VerticalAlignment' , 'top', ...
     'FontName' , 'Times New Roman' , ...
     'FontSize' , 22 , ...
     'Fontname' , 'bold' , ...
     'Clipping' , 'on' );  
title( '2004/05' , 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'Fontname' , 'bold' );
colormap( cmap_sat );

axes( ax(1) )
year_2000_start = ( 2000 - 1979 ) * 12 + 1;
year_2000_last  = ( 2000 - 1979 + 2 ) * 12 - 5;
[ C1 , H1 ] = contourf( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_2000_start : year_2000_last )' ./ 1e9 , label , 'LineStyle', 'none' );
clear C1 H1
hold on
[ C2 , H2 ] = contour( lon , 1:1:19 , u_psi_ano_down_detrend_filter_400_600hpa_change( : , year_2000_start : year_2000_last )' ./ 1e9 , [ 0 , 0 ] , 'k--' );
set( H2 , 'LineWidth' , 4 );
plot( [ 100 160 ] , [ 7 19 ] , 'color' , [  0 255 0 ]/255 , 'LineStyle' , '-' , 'LineWidth' , 6 );     
set( ax(1) , 'xlim' , [ 40 280 ] , 'XTick' , 0 : 40 : 360 );
set( ax(1) , 'XTicklabel' , {  '0/circ' , '40/circE' , '80/circE'  , '120/circE' , ...
                            '160/circE' , '160/circW' , '120/circW' , '80/circW' , '40/circW' , '0/circ' } );
set( ax(1) , 'ylim' , [ 1 19 ] , 'YTick' , [ 1 : 3 : 19 ] );
set( ax(1) , 'YTickLabel' , { 'Jun(0)' , 'Sep(0)' , ...
                              'Dec(0)' , 'Mar(1)' , 'Jun(1)' , 'Sep(1)' , 'Dec(1)' } );
set( ax(1) , 'linewidth' , 1.5 , 'fontsize' , 22 , 'Fontname' , 'Times New Roman' );
caxis( [ label( 2 ) label( end - 1 ) ] );
text( 0 , 1.123 , '(a)', ...
     'Units' , 'normalized' , ...         % 归一化坐标
     'HorizontalAlignment' , 'left', ...
     'VerticalAlignment' , 'top', ...
     'FontName' , 'Times New Roman' , ...
     'FontSize' , 22 , ...
     'Fontname' , 'bold' , ...
     'Clipping' , 'on' ); 
title( '2000/01' , 'FontName' , 'Times New Roman' , 'FontSize' , 22 , 'Fontname' , 'bold' );
colormap( cmap_sat );

cb = colorbar;
cb.Ticks = [ -2.4 : 0.4 : 2.4 ];
cb.FontSize = 22;
cb.Location = 'southoutside';
cb.Position = [0.12 0.05 0.76 0.03];   
cb.Label.String = '×10^9 kg·s^{-1}';
cb.Label.FontSize = 22;
cb.Label.FontName = 'Times New Roman';
cb.Label.Rotation = 0;                 
cb.Label.Units = 'normalized';         
cb.Label.HorizontalAlignment = 'right';
cb.Label.VerticalAlignment   = 'bottom';
cb.Label.Position = [1, 1.05, 0]; 
