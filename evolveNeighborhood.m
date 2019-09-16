function newNeighborhood = evolveNeighborhood(neighborhood)
% evolve a neighborhood by one day from our social simulation
% 
% INPUTS: 
%   neighborhood - a MxN array of 1's (hostile) and 0's (peaceful) 
%
% OUTPUTS:
%   newNeighborhood - updated array following one step of "evolution"

% check inputs

if nargin==0
    error('Must provide a neighborhood to evolve');
end

%nRows = number of rows
%nCols = number of cols
nRows = size(neighborhood, 1);
nCols = size(neighborhood, 1);  


R2 = nRows - 1; 
C2 = nCols - 1; 

% create a new (tomorrow's) neighborhood
newNeighborhood = zeros(nRows,nCols);

% check all the corners, 3 neighbors, so no need to worry about an equal
% number of each 
% top right corner = (1, nCols)
corner = neighborhood(1, nCols); 
sf = neighborhood(1, nCols, 2);
localHood = neighborhood(1:2, C2:nCols);
nHostile = sum(sum(localHood)) - corner;
if sf == 0
    if nHostile > 1.5
    newNeighborhood(1,nCols) = 1; 
    else 
        newNeighborhood(1, nCols) = 0; 
    end
else
    if nHostile > 0
    newNeighborhood(1,nCols) = 1; 
    else 
        newNeighborhood(1, nCols) = 0; 
    end
end 

% top left corner = (1, 1)
corner = neighborhood(1, 1); 
sf = neighborhood(1, 1, 2); 
localHood = neighborhood(1:2, 1:2);
nHostile = sum(sum(localHood)) - corner;
if sf == 0
    if nHostile > 1.5
    newNeighborhood(1,1) = 1; 
    else 
        newNeighborhood(1, 1) = 0; 
    end
else
    if nHostile > 0
    newNeighborhood(1,1) = 1; 
    else 
        newNeighborhood(1, 1) = 0; 
    end
end 

% bottom right corner = (nRows, nCols)
corner = neighborhood(nRows, nCols);
sf = neighborhood(nRows, nCols, 2); 
localHood = neighborhood(R2:nRows, C2:nCols);
nHostile = sum(sum(localHood)) - corner;
if sf == 0
    if nHostile > 1.5
    newNeighborhood(nRows,nCols) = 1; 
    else 
        newNeighborhood(nRows,nCols) = 0; 
    end
else
    if nHostile > 0
    newNeighborhood(nRows,nCols) = 1; 
    else 
        newNeighborhood(nRows,nCols) = 0; 
    end
end 


% bottom left corner = (nRows, 1)
corner = neighborhood(nRows, 1);
sf = neighborhood(nRows, 1, 2);
localHood = neighborhood(R2:nRows, 1:2);
nHostile = sum(sum(localHood)) - corner;
if sf == 0
    if nHostile > 1.5
    newNeighborhood(nRows, 1) = 1; 
    else 
        newNeighborhood(nRows, 1) = 0; 
    end
else
    if nHostile > 0
    newNeighborhood(nRows, 1) = 1; 
    else 
        newNeighborhood(nRows, 1) = 0; 
    end
end 

% check all the edges, 5 neighbors, so no need to worry about an equal
% number of each 
% top edge, row 1 cols 2:C2
for i = 2: C2
    edge = neighborhood(1, i); 
    sf = neighborhood(1, i, 2); 
    l = i - 1; 
    r = i + 1; 
    localHood = neighborhood(1:2, l:r);
   
    nHostile = sum(sum(localHood)) - edge;
    if sf == 0 
        if nHostile > 2.5
        newNeighborhood(1,i) = 1; 
        else 
        newNeighborhood(1, i) = 0; 
        end 
    else 
        if nHostile > 0
        newNeighborhood(1,i) = 1; 
        else 
        newNeighborhood(1, i) = 0; 
        end 
    end
end

% bottom edge: row nRows, cols = 2:C2
for i = 2: C2
    edge = neighborhood(nRows, i);
    sf = neighborhood(nRows, i, 2);
    l = i - 1; 
    r = i + 1; 
    localHood = neighborhood(R2:nRows, l:r);
   
    nHostile = sum(sum(localHood)) - edge;
    if sf == 0 
        if nHostile > 2.5
        newNeighborhood(nRows,i) = 1; 
        else 
        newNeighborhood(nRows, i) = 0; 
        end 
    else 
        if nHostile > 0
        newNeighborhood(nRows,i) = 1; 
        else 
        newNeighborhood(nRows, i) = 0; 
        end 
    end
end

% left edge: row: 2:R2, col: 1
for i = 2: R2
    edge = neighborhood(i, 1); 
    sf = neighborhood(i, 1, 2); 
    t = i - 1; 
    b = i + 1; 
    localHood = neighborhood(t:b, 1:2);
   
    nHostile = sum(sum(localHood)) - edge;
    if sf == 0 
        if nHostile > 2.5
        newNeighborhood(i, 1) = 1; 
        else 
        newNeighborhood(i, 1) = 0; 
        end 
    else 
        if nHostile > 0
        newNeighborhood(i, 1) = 1; 
        else 
        newNeighborhood(i, 1) = 0; 
        end 
    end
end

% right edge: row: 2:R2, col: nCols
for i = 2: R2
    edge = neighborhood(i, nCols);
    sf = neighborhood(i, nCols, 2); 
    
    t = i - 1; 
    b = i + 1; 
    localHood = neighborhood(t:b, C2:nCols);
   
    nHostile = sum(sum(localHood)) - edge;
    if sf == 0 
        if nHostile > 2.5
        newNeighborhood(i, nCols) = 1; 
        else 
        newNeighborhood(i, nCols) = 0; 
        end 
    else 
        if nHostile > 0
        newNeighborhood(i, nCols) = 1; 
        else 
        newNeighborhood(i, nCols) = 0; 
        end 
    end
end

% everything in the middle
% row = 2: R2
% col = 2:C2

for i = 2: R2
    for j = 2: C2
        
        mid = neighborhood(i, j);
        sf = neighborhood(i, j, 2); 
        localHood = neighborhood(i-1:i+1 , i-1:i+1);
        
        nHostile = sum(sum(localHood)) - mid;
        
        if sf == 0
            % update the new neighborhood
            if nHostile > 4
            newNeighborhood(i,j) = 1;
            elseif nHostile < 4
            newNeighborhood(i,j) = 0;
            elseif nHostile == 4
            newNeighborhood(i,j) = neighborhood(i,j);
            end 
        else 
            if nHostile > 0
            newNeighborhood(i,j) = 1;
            else
            newNeighborhood(i,j) = 0;
            end 
        end
        
    end
end

newNeighborhood(:, :, 2) = neighborhood(:, :, 2); 

end


