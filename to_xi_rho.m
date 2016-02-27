function [ xi_pp, rho ] = to_xi_rho( lambda, lambda_d, phi, meters_per_pixel )
%XI_RHO_TO_SIGMA Takes spatial frequency and angle, gives wavenumber shift
%   Inputs: 
%   Outputs:

% All this math is based on SHSModel.nb section Off Axis Tilt Model

% Define parameters
sigma = 1/lambda; % current wavenumber
sigma0 = 1/lambda_d; % design wavenumber
m = 1; % diffraction order;
d = (1/300) * 0.001; % dist between grooves [m]
alpha_d = asin(m*lambda_d / (2*d)); % diff grating config angle


% Calculate wavefront vector angles
beta1 = asin(2*sigma0./sigma * sin(alpha_d)./cos(phi) - ...
    sin(alpha_d)) - alpha_d;
beta2 = alpha_d - asin(2*sigma0./sigma * sin(alpha_d)./cos(0) - ...
    sin(alpha_d));

phi1 = -2*phi; % assumes only one vector is tilted upward
phi2 = 0;

% Calculate wavefront vectors
K = @(phi, beta) [cos(phi).*sin(beta), sin(phi), cos(phi).*cos(beta)].';
Knorm = normc( cross( K(phi1, beta1), ...
    K(phi2, beta2)));

% Do some vector geometry to get the outputs
rho = acos(dot([0;1;0],Knorm)); % angle rotated
gamma = acos(dot( K(phi1, beta1), ...
    K(phi2, beta2) ) / (norm(K(phi1, beta1))*...
    norm(K(phi2, beta2)))); % angle between wavefront vectors
xi = 2*sigma*sin(gamma/2); % spatial freq (osc / meter)

xi_pp = xi * meters_per_pixel;


end

