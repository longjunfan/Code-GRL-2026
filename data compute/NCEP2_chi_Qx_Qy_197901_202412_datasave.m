clc;
clear all;
close all;
load( '../Data Store/NECP2_Q_E_H_R_197901_202412.mat' );
[ LON , LAT ] = meshgrid( lon_used , lat_used );
Qx_div   = NaN( 94 , 192 , 552 );
Qy_div   = NaN( 94 , 192 , 552 );
chi_all  = NaN( 94 , 192 , 552 );
%%
for itime = 1 : length( time_used ) 

    [ chi , Qxchi , Qychi ] = compute_energy_flux_potential( LON , LAT , squeeze( Q( : , : , itime )' ) );
    chi_all( : , : , itime )  = chi;
    Qx_div( : , : , itime )   = Qxchi;
    Qy_div( : , : , itime )   = Qychi;        
    disp(itime);

end

%%
datapath  = '../Data Store/NECP2_chi_Qx_Qy_197901_202412.mat';
save( datapath , 'chi_all' , 'Qx_div' , 'Qy_div'  , 'lon_used' , 'lat_used' , 'time_used' );