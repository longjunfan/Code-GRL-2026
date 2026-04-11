%% Calculate the divergence wind(197901-202412) using the NECP2 data.
clc;
clear all;
close all;
load('../Data Store/NECP2_uwind4D_pres_197901_202412.mat');
load('../Data Store/NECP2_vwind4D_pres_197901_202412.mat');

lon  = lon_uwind;
lat  = lat_uwind;
lev  = lev_uwind;
time = time_uwind;
clear lon_uwind lat_uwind lon_vwind lat_vwind time_uwind time_vwind lev_uwind lev_vwind 

[ LON , LAT ] = meshgrid( lon , lat );
%%
u_div   = NaN( 73 , 144 , 17 , 552 );
v_div   = NaN( 73 , 144 , 17 , 552 );
chi_all = NaN( 73 , 144 , 17 , 552 );
%%
for itime = 1 : length( time ) 
    for ilevel = 1 : length( lev ) 
        [ chi , Uchi , Vchi ] = compute_velocity_potential( LON , LAT , squeeze( uwind( : , : , ilevel , itime )' ) ,...
                                                                        squeeze( vwind( : , : , ilevel , itime )' ) );
        chi_all( : , : , ilevel , itime ) = chi;
        u_div( : , : , ilevel , itime )   = Uchi;
        v_div( : , : , ilevel , itime )   = Vchi;        
    end
    disp(itime);
end
%%
datapath  = '../Data Store/NECP2_uv_div_chi_pres_197901_202412.mat';
save( datapath , 'chi_all' , 'u_div' , 'v_div' , 'lev' , 'lon' , 'lat' , 'time' );