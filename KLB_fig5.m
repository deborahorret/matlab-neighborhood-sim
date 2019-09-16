% DEBORAH ORRET
% FINAL PROJECT

% FINAL PLOTS
% THREE PLOTS: 0 SHORT FUSE, 9 SHORT FUSE, 18 SHORT FUSE


% plots are final % hostile on y axis
% initial % hostile on x axis

% plot 1, height = 6, width = 6, sf = 0, percent Hostile = 0.0-1.0 in
% intervals of 0.02
rng('shuffle');
percentHostileSF0 = []; 

for i = 0.00:0.02:1.0
    n = makeNeighborhood(6,6,0, i);
    
    for nSimulation = 1:10
       for days = 1:14  
       n = evolveNeighborhood(n); 
       end 
       
       sHostile = sum(sum(n(:, :, 1)));
       pHostile = sHostile/36; 
       percentHostileSF0 = [percentHostileSF0, pHostile]; 
        
    end
end

% plot 2, height = 6, width = 6, sf = 9, percent Hostile = 0.0-1.0 in
% intervals of 0.02
percentHostileSF9 = []; 

for i = 0.00:0.02:1.00
    n = makeNeighborhood(6,6,9, i);
    
    for nSimulation = 1:10
        for days = 1:14
        n = evolveNeighborhood(n); 
        end 
    sHostile = sum(sum(n(:, :, 1)));
    pHostile = sHostile/36; 
    percentHostileSF9 = [percentHostileSF9, pHostile]; 
    
    end
end

% plot 3, height = 6, width = 6, sf = 18

percentHostileSF18 = []; 

for i = 0.00:0.02:1.00
    n = makeNeighborhood(6,6,18, i);
    
    for nSimulation = 1:10
    
    for days = 1:14
    n = evolveNeighborhood(n); 
    end 
    
    sHostile = sum(sum(n(:, :, 1)));
    pHostile = sHostile/36; 
    percentHostileSF18 = [percentHostileSF18, pHostile]; 
    
    end
end

x = []; 
for a = 0.00:0.02:1.0
    for b = 1:10
        x = [x, a];
    end
end

figure;
subplot(2, 3, 1);
scatter(x, percentHostileSF0, 15, "black", "filled");
title('No Short Fused Individuals');
xlabel('Final Proportion Aggressive');
ylabel('Initial Proportion Aggressive'); 
xticks([0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00]);
yticks([0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00]);

subplot(2,3, 2); 
scatter(x, percentHostileSF9, 15, "black", "filled");
title('9 Short Fused Individuals');
xlabel('Final Proportion Aggressive');
ylabel('Initial Proportion Aggressive'); 
xticks([0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00]);
yticks([0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00]);

subplot(2,3, 3); 
scatter(x, percentHostileSF18, 15, "black", "filled");
title('18 Short Fused Individuals');
xlabel('Final Proportion Aggressive');
ylabel('Initial Proportion Aggressive'); 
xticks([0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00]);
yticks([0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00]);



