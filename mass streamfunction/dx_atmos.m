function dx=dx_atmos(longitude, latitude)
    R=6371393; % earth's radius
    [dx,~]=gradient(longitude);
    dx=dx.*(pi./180).*R.*cos(latitude*pi./180);
end