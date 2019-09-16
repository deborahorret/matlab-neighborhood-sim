function displayNeighborhood(neighborhood, displayType)
% display a neighborhood from the social simulation
%
% INPUTS:
%   neighborhood - a 3-D array with 1's (hostile) and 0's (peaceful)
%   displayType  - 1 - circles, 2 - as an image (squares)
% 
% makes a graph of the neighborhood

 if nargin==1 
    displayType = 1;
    warning('No display type specified, using circles as default');
 end
 if nargin==0
    error('Must provide a neighborhood as input');
 end

 
 % flip neighborhood upside-down to make coordinates match:
 invHood = flipud(neighborhood(:, :, 1));
 neighborhoodsf = neighborhood(:, :, 2);
 invHoodsf = flipud(neighborhoodsf);

 % get the size of the neighborhood:
 nRows = size(neighborhood, 1);
 nCols = size(neighborhood, 2);  


 % another way of plotting:
 % get all of the (x,y) coordinates where there is a hostile person:
 [rH,cH] = ind2sub(size(neighborhood),find(invHood==1));
 [rP,cP] = ind2sub(size(neighborhood),find(invHood==0));
 
 % get all of the (x,y) coordinates where there is a short-fused person:
 [rH2,cH2] = ind2sub(size(neighborhoodsf),find(invHoodsf==1));
 [rP2,cP2] = ind2sub(size(neighborhoodsf),find(invHoodsf==0));
 
 plot(cH+0.5,rH+0.5,'ok','MarkerSize',4,'MarkerFaceColor','black');
 hold on;
 plot(cP+0.5,rP+0.5,'ok','MarkerSize',4);
 
 % change the outline color
 plot(cH2+0.5,rH2+0.5,'ok','MarkerSize',4,'MarkerEdgeColor','red'); 
 plot(cP2+0.5,rP2+0.5,'ok','MarkerSize',4); 
 
 
 % make a grid:
 grid on;
 % make grid black instead of light gray
 set(gca,'GridColor','black'); 
 set(gca,'GridAlpha',1);
 % get rid of numbers:
 set(gca,'YTickLabel',[]);
 set(gca,'XTickLabel',[]);

end
