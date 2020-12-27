function saveFigPDF(fileName)
%saveFigPDF Summary of this function goes here
%   Detailed explanation goes here
figureHandle = gcf;
set(figureHandle,'PaperPosition',3*[0 0 6 4]);
set(figureHandle,'PaperSize',3*[6 4]);
set(figureHandle,'PaperUnits','centimeters');

print(fileName,'-dpdf');
end

