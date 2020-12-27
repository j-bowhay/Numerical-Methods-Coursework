function saveFigPDF(fileName)
% saveFigPDF Save open figure as a PDF file
%
% Inputs:
%   fileName = name to save the figure as eg. graph will
%   save a file graph.pdf

% get current figure handle
figureHandle = gcf;
% resize paper
set(figureHandle,'PaperPosition',3*[0 0 6 4]);
set(figureHandle,'PaperSize',3*[6 4]);
set(figureHandle,'PaperUnits','centimeters');

print(fileName,'-dpdf');
end

