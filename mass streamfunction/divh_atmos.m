function divh=divh_atmos(longitude, latitude, u, v)
    R=6371393.0; % earth's radius
    dx=dx_atmos(longitude, latitude);
    dy=dy_atmos(latitude);
    [du, ~]=gradient(u);
    [~, dv]=gradient(v);
    divh=du./dx+dv./dy-v.*tan(latitude.*pi./180)./R;
    divh(abs(latitude)==90)=NaN;
end
