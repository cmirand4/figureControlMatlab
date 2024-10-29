# figureControlMatlab
Simple Matlab code to control figures across multiple screens. 
I use this code daily. Instead of opening figures all on the same location on the screen, you can open the figures rastering across multiple screens. 
I currently have it opening 6 figures per screen as that looks best on my end. Needs to be adjusted to fit fewer or more figures per screen. 
Its also useful for passing into functions that are being tested. 

I typically use as follows: 

% Figure initialization
figs.screens = 2;
figs = figureInitiate(figs);

% Plotting 6 figures to cover screen
figs = figureControl(figs);
plot(rand(1000,1))
title('Figure 1 Screen 1')

figs = figureControl(figs);
plot(rand(1000,1))
title('Figure 2 Screen 1')

figs = figureControl(figs);
plot(rand(1000,1))
title('Figure 3 Screen 1')

figs = figureControl(figs);
plot(rand(1000,1))
title('Figure 4 Screen 1')

figs = figureControl(figs);
plot(rand(1000,1))
title('Figure 5 Screen 1')

figs = figureControl(figs);
plot(rand(1000,1))
title('Figure 6 Screen 1')

% If second screen available
% figs = figureControl(figs);
% plot(rand(1000,1))
% title('Figure 7 Screen 2')
