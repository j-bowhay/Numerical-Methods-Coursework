function saveFigPDF(fileName)
    %saveFigPDF saves open figure as a PDF file
    %
    %Inputs:
    %   fileName = File name to save figure as
    %Usage:
    %   saveFigPDF("polynomial") -> Saves current figure as polynomial.pdf
    
    % Get current figure handle
    figureHandle = gcf;
    % Resize paper
    set(figureHandle,'PaperPosition',3*[0 0 6 4]);
    set(figureHandle,'PaperSize',3*[6 4]);
    set(figureHandle,'PaperUnits','centimeters');
    
    print(fileName,'-dpdf');
end

