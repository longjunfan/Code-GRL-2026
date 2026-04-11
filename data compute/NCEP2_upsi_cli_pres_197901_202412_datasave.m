clc;
clear all;
close all;
load( '../Data Store/NECP2_uv_div_chi_pres_197901_202412.mat' );
%%
u_div_5D           = reshape( u_div , [ 73 144 17 12 46 ] );
u_div_4D_month_cli = squeeze( mean( u_div_5D , 5 ) );
u_div_3D_year_cli  = squeeze( mean( u_div_4D_month_cli , 4 ) );
% average 5S-5N
u_div_equ_year_cli = squeeze( mean( u_div_3D_year_cli( 35 : 39 , : , : ) , 1 ) );
%%
g   = 9.80616; % Gravitational acceleration (m/s²)
a   = 6.37122e6; % Radius of the Earth
pi  = 3.14159265;
con = ( 1 * pi * a ) / ( g * 18 );
%%
u_div_cli_equ_change = zeros( 144 , 18 );
u_div_cli_equ_change( : , 1 : 17 ) = u_div_equ_year_cli;
u_psi_cli_down = zeros( 144 , 18 );
level_change = [ lev ; 0 ];

for ilon = 1 : 144
    for i_down = 17 : -1 : 1 
        pressure = level_change( i_down ) - level_change( i_down + 1 );
        psi_temp = pressure .* 100 .* con .* ...
            ( ( u_div_cli_equ_change( ilon , i_down ) + u_div_cli_equ_change( ilon , i_down + 1 ) ) ./ 2 );
        u_psi_cli_down( ilon , i_down ) = u_psi_cli_down( ilon , i_down + 1 ) + psi_temp;
    end
end
clear ilon ilev
u_psi_cli_down = u_psi_cli_down( : , 1 : 17 );
%%
datapath = '../Data Store/NECP2_upsi_cli_pres_197901_202412.mat';
save(  datapath , 'u_psi_cli_down' );