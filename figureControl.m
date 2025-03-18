function [figs, figName] = figureControl(figs)
% Wrapper function for backward compatibility
% This function calls figOpen with the same parameters
[figs, figName] = figOpen(figs);
end