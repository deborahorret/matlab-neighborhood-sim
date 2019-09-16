function neighborhood = makeNeighborhood(nhdHeight,nhdWidth, sf, pHostile)
% make a nhdHeight x nhdWidth neighborhood for social simulation
%
% INPUTS: 
%   nhdHeight - neighborhood height (integer >= 1)
%   nhdWidth  - neighborhood width (integer >= 1)
%   sf - number of short_fuse individuals (integer >= 0)
%   pHostile - % of hostile individuals 
%
% OUTPUTS:
%   neighborhood - a 3-D matrix of 1's and 0's
%      neighborhood(:, :, 1) is the neighborhood representing hostile/peaceful
%      neighborhood(:, :, 2) represents those who are short fused


% check inputs
if nargin==0 % use default values if no input (6x6)
    nhdHeight = 6;
    nhdWidth = 6; 
    sf = 0; 
    pHostile = 0.5; 
    warning('No neighborhood size specified. Using default (6x6), # of short fused = 0, % hostile = 0.5');
end
if nargin > 0 && nargin < 4
    error('Function takes 4 arguments: width, height, # of short-fused ind., % hostile. One of those arguments is missing');
end

if ~isnumeric(nhdHeight) || ~isnumeric(nhdWidth) 
    error('Neighborhood dimensions must be positive integers');
end
if nhdHeight<1 || nhdWidth<1
    error('Neighborhood dimensions must be positive integers');
end
if floor(nhdHeight)~=nhdHeight || floor(nhdWidth)~=nhdWidth
    error('Neighborhood dimensions must be whole numbers');
end
if ~isnumeric(sf) 
    error('Short-Fuse Number must be positive integers');
end
if sf > nhdHeight*nhdWidth
    error('Short-Fuse Number cannot be greater than total dimensions of neighborhood');
end
if ~isnumeric(pHostile) 
    error('Percent Hostile must be a positive integer');
end
if pHostile > 1 || pHostile < 0
    error('Percent Hostile must be an integer between 0.0 and 1.0');
end

% create two neighborhoods to work with
neighborhood = zeros(nhdHeight,nhdWidth);
neighborhoodsf = zeros(nhdHeight,nhdWidth);

nPeople = nhdHeight*nhdWidth; % numel(neighborhood)
nHostile = floor(nPeople*pHostile); % round to deal with odd number of people


% pick the indices / which people are hostile 
hostileIdx = randperm(nPeople, nHostile);
neighborhood(hostileIdx) = 1; % assign those positions to be 1's 

% pick the indices of who will be short-fused
sfIdx = randperm(nPeople, sf); 
% assign them to be 1 so you can see if someone is short fused 
% based on the third dimension
neighborhoodsf(sfIdx) = 1; 
neighborhood(:, :, 2) = neighborhoodsf; 

end
