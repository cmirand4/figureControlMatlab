function [figs, figName] = figOpen(figs)
% Author: Christopher Miranda, Stanford University, Schnitzer Lab
% Call for every figure used to control where it shows up across multiple
% screens. Use figureInitiate.m first.
%
% The figureInitiate.m function supports both horizontal and vertical monitor
% arrangements through the 'monitorArrangement' parameter:
%   - 'horizontal' (default): For side-by-side monitors
%   - 'vertical': For vertically stacked monitors
%
% Example usage:
%   userSettings.screens = 2;
%   userSettings.monitorArrangement = 'vertical'; % For vertically stacked monitors
%   figs = figureInitiate(userSettings);
%   [figs, fig1] = figOpen(figs);
%
if figs.plot
    switch figs.size
        case 'full'
            if figs.cnt < 6
                h = figure('units','normalized','outerposition',[0 0 1 1]);
            else
                if strcmp(figs.monitorArrangement,'horizontal')
                    h = figure('units','normalized','outerposition',[1 0 1 1]);
                else
                    h = figure('units','normalized','outerposition',[0 1 1 1]);
                end
            end
        case 'normal'
            h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols figs.rows]);
            figs.cnt = figs.cnt + 1;
            if figs.cnt > size(figs.matrix,1)
                figs.cnt = 1;
            end
        case 'tall'
            h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols 2*figs.rows]);
            figs.cnt = figs.cnt + 1;
            if figs.cnt > size(figs.matrix,1)
                figs.cnt = 1;
            end
        case 'long'
            h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols*2 figs.rows]);
            figs.cnt = figs.cnt + 1;
            if figs.cnt > size(figs.matrix,1)
                figs.cnt = 1;
            end
        case 'extra long'
            scale = 3.3;
            if figs.cnt > 1
                figs.cnt = 4;
                h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols*scale figs.rows]);
            else
                figs.cnt = 1;
                h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols*scale figs.rows]);
            end
            figs.cnt = figs.cnt + 3;
            if figs.cnt > size(figs.matrix,1)
                figs.cnt = 1;
            end
        case 'double'
            if figs.cnt < 3
                figs.cnt = 4; 
            end
            h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols*2 2*figs.rows]);
        otherwise
            error('Select figure size: normal, tall, long, double, full');
    end
    if figs.trackFigs
        figs.figures{figs.figsGen+1} = h;
    end
    figs.figsGen = figs.figsGen+1;
    figName = h;
end
end 