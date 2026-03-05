function [chi, Uchi, Vchi] = compute_velocity_potential(longitude, latitude, u, v)
% ======================================================================= %
% Calculate velocity potential (chi) of an atmospheric flow pattern
% Input:
%   longitude: Longitude, deg
%   latitude: Latitude, deg
%   u: Zonal Wind (m/s)
%   v: Meridional Wind (m/s)
% Output:
%   chi: Velocity Potential (m^2/s)
%   Uchi, Vchi: Divergent wind components (m/s)
% Note:
%   Requires divh_atmos to compute horizontal divergence.
    MAX = 1000; % maximum iteration (corresponding eps: 1e-7)
    epsilon = 1e-6; % precision
    sor_index = 0.2;
    [M, N] = size(longitude);
    chi = zeros([M, N]); % Initialization
    Res = ones([M, N]) * -9999;
    
    % Step 1: Calculate horizontal divergence (divh)
    divh = divh_atmos(longitude, latitude, u, v);
    
    % Step 2: Prepare dx^2 and dy^2 for Laplacian operator
    dx2 = dx_atmos(longitude, latitude).^2;
    dy2 = dy_atmos(latitude).^2;
    
    % Step 3: Solve the Poisson equation for chi using SOR method
    
    % Here, the Libenman methold exists, but it is expressed implicitly, and
    % is already operated on in the loop
    for k = 1:MAX
        for i = 2:M-1
            for j = 1:N
                if j == 1
                    Res(i, j) = (chi(i+1, j) + chi(i-1, j) - 2 * chi(i, j)) ./ dy2(i, j) + ...
                                (chi(i, j+1) + chi(i, N) - 2 * chi(i, j)) ./ dx2(i, j) - ...
                                divh(i, j);
                    chi(i, j) = chi(i, j) + (1 + sor_index) * Res(i, j) / (2 / dx2(i, j) + 2 / dy2(i, j));
                elseif j == N
                    Res(i, j) = (chi(i+1, j) + chi(i-1, j) - 2 * chi(i, j)) ./ dy2(i, j) + ...
                                (chi(i, 1) + chi(i, j-1) - 2 * chi(i, j)) ./ dx2(i, j) - ...
                                divh(i, j);
                    chi(i, j) = chi(i, j) + (1 + sor_index) * Res(i, j) / (2 / dx2(i, j) + 2 / dy2(i, j));
                else 
                    Res(i, j) = (chi(i+1, j) + chi(i-1, j) - 2 * chi(i, j)) ./ dy2(i, j) + ...
                                (chi(i, j+1) + chi(i, j-1) - 2 * chi(i, j)) ./ dx2(i, j) - ...
                                divh(i, j);
                    chi(i, j) = chi(i, j) + (1 + sor_index) * Res(i, j) / (2 / dx2(i, j) + 2 / dy2(i, j));                    
                end
            end
        end
        if max(max(abs(Res))) < epsilon
            break; % <----- Terminate the loop when precision is reached
        end
    end
    
    % Step 4: Calculate divergent wind components from chi
    [DchiDx, DchiDy] = grad_atmos(longitude, latitude, chi);
    Uchi = DchiDx; % Divergent zonal wind
    Vchi = DchiDy; % Divergent meridional wind
    
    % Make boundary NaN
    chi(1, :) = NaN; Uchi(1, :) = NaN; Vchi(1, :) = NaN;
    chi(M, :) = NaN; Uchi(M, :) = NaN; Vchi(M, :) = NaN;
%     chi(:, 1) = NaN; Uchi(:, 1) = NaN; Vchi(:, 1) = NaN;
%     chi(:, N) = NaN; Uchi(:, N) = NaN; Vchi(:, N) = NaN;
end