function [figs, figName] = figureControl(figs)
% Author: Christopher Miranda, Stanford University, Schnitzer Lab
% Call for every figure used to control where it shows up across multiple
% screens. Use figureInitiate.m first. 
if figs.plot
    switch figs.size
        case 'full'
            h = figure('units','normalized','outerposition',[0 0 1 1]);
        case 'normal'
            h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols figs.rows]);
            figs.cnt = figs.cnt + 1;
            if figs.cnt > size(figs.matrix,1)
                figs.cnt = 1;
            end
        case 'tall'
            h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols 2*figs.rows]);
        case 'long'
            h = figure('units','normalized','outerposition',[figs.matrix(figs.cnt,:) figs.cols*2 figs.rows]);
        case 'double'
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