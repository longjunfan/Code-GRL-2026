function dy=dy_atmos(latitude)
    R=6371393.0; % earth's radius
    [~,dy]=gradient(latitude);
    dy=dy.*(pi./180).*R;
end