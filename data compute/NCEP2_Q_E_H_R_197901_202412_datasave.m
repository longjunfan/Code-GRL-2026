clc;
clear all;
close all;
load( '../Data Store/NECP2_latent_197901_202412.mat' );
load( '../Data Store/NECP2_sensible_197901_202412.mat' );
load( '../Data Store/NECP2_Down_Suf_LW_197901_202412.mat' );
load( '../Data Store/NECP2_Down_Suf_SW_197901_202412.mat' );
load( '../Data Store/NECP2_Down_Top_SW_197901_202412.mat' );
load( '../Data Store/NECP2_Up_Suf_LW_197901_202412.mat' );
load( '../Data Store/NECP2_Up_Suf_SW_197901_202412.mat' );
load( '../Data Store/NECP2_Up_Top_LW_197901_202412.mat' );
load( '../Data Store/NECP2_Up_Top_SW_197901_202412.mat' );
%%
lon_used  = lon_latent;
lat_used  = lat_latent;
time_used = time_latent;
clear lat_Down_Suf_LW lat_Down_Suf_SW lat_Down_Top_SW lat_Up_Suf_LW lat_Up_Suf_SW lat_Up_Top_LW lat_Up_Top_SW lat_latent lat_sensible
clear lon_Down_Suf_LW lon_Down_Suf_SW lon_Down_Top_SW lon_Up_Suf_LW lon_Up_Suf_SW lon_Up_Top_LW lon_Up_Top_SW lon_latent lon_sensible
clear time_Down_Suf_LW time_Down_Suf_SW time_Down_Top_SW time_Up_Suf_LW time_Up_Suf_SW time_Up_Top_LW time_Up_Top_SW time_latent time_sensible
%%
E = latent;
H = sensible;
R_Suf = ( Down_Suf_SW - Up_Suf_SW ) +  ( Down_Suf_LW - Up_Suf_LW );
R_Top = ( Down_Top_SW - Up_Top_SW ) +  (  - Up_Top_LW );
R = R_Top - R_Suf;
Q = E + R + H;
%%
datapath  = '../Data Store/NECP2_Q_E_H_R_197901_202412.mat';
save( datapath , 'lon_used' , 'lat_used' , 'Q' , 'time_used' );