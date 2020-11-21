clc 
clear
close all

%{
User Defined Constants:
1. Nominal Diameter
2. Number of gores
%}

nominalDiameter = 5;
numberOfGores = 6;

%%Line length:
lineLength = 12*(1.7*nominalDiameter);

%%Line weight:
lineWeight = lineLength*.015209125*numberOfGores;

%%Total Surface Area:
totalSurfaceArea = (nominalDiameter/1.1284)^2;

%%Vent Diameter 2%
ventDiameter = 2*sqrt(totalSurfaceArea/3.14)*.02;

%Final height of gore:
goreHeightFinal = sqrt((totalSurfaceArea/(1.887*numberOfGores*tan((180/numberOfGores)*3.14/180))));
goreHeightFinal = goreHeightFinal*12;

%Cut height of gore: 
goreHeightCut = goreHeightFinal + 1.5;

%Height of gap: 
gapHeight = .113*goreHeightFinal;

%Final height of band: 
bandHeightFinal = .33*goreHeightFinal;

%Cut height of band:
bandHeightCut = bandHeightFinal + 1.5;

%Final gore/band width:
gore_bandWidth = 2*goreHeightFinal*tan((180/numberOfGores)*3.14/180);

%cut gore/band width: 
gore_bandWidthCut =  gore_bandWidth + 1.5;

%Constructed Diameter:
constructedDiameter = goreHeightFinal *2;

%Geo Porosity% :
geoPorosity = ((totalSurfaceArea*.02) + (numberOfGores * gapHeight * gore_bandWidth))/totalSurfaceArea * 100;

%Canopy Weight:
canopyWeight = 1.12*numberOfGores*(((gore_bandWidthCut*bandHeightCut) + ((gore_bandWidthCut/2)*goreHeightCut))/9);

%%Final Disk-Gap-Band:
%%Triangular top:
jointy = goreHeightFinal;
jointx = gore_bandWidth/2;
line1x = linspace(0,jointx);
line1y = linspace(0,jointy);
line2x = linspace(jointx,gore_bandWidth);
line2y = linspace(jointy,0);
line3x = linspace(0,gore_bandWidth);
line3y = zeros(1,length(line3x));

%%Rectangular Bottom: 
cliney = linspace(0,-gapHeight);
cline1x = linspace(0,0,length(cliney));
cline2x = linspace(jointx*2,jointx*2,length(cliney));
cline3x = linspace(jointx,jointx);
cline3y = linspace(jointy,-bandHeightFinal-1);
line4x = linspace(0,gore_bandWidth);
line4y = linspace(cliney(100),cliney(100));
line5x = linspace(0,0);
line5y = linspace(cliney(100),-bandHeightFinal);
line6x = linspace(gore_bandWidth,gore_bandWidth);
line7y = linspace(-bandHeightFinal,-bandHeightFinal);

%%Plot
tiledlayout(1,2);
nexttile
title('Disc-Gap-Band Final');
hold all;
plot(line1x,line1y,'color','#000000');
plot (line2x,line2y,'color','#000000');
plot(line3x,line3y, 'color','#000000');
plot(line4x,line4y, 'color','#000000');
plot(line5x,line5y, 'color','#000000');
plot(line6x,line5y, 'color','#000000');
line(line4x,line7y, 'color','#000000');
plot(cline1x,cliney,'--',cline2x,cliney,'--',cline3x,cline3y,'--','color','#000000');
grid on
axis equal

%%Cut Disc Gap Band
jointy = goreHeightCut;
jointx = gore_bandWidthCut/2;
line1x = linspace(0,jointx);
line1y = linspace(0,jointy);
line2x = linspace(jointx,gore_bandWidthCut);
line2y = linspace(jointy,0);
line3x = linspace(0,gore_bandWidthCut);
line3y = zeros(1,length(line3x));
cliney = linspace(0,-gapHeight);
cline1x = linspace(0,0,length(cliney));
cline2x = linspace(jointx*2,jointx*2,length(cliney));
cline3x = linspace(jointx,jointx);
cline3y = linspace(jointy,-bandHeightCut-1);
line4x = linspace(0,gore_bandWidthCut);
line4y = linspace(cliney(100),cliney(100));
line5y = linspace(cliney(100),-bandHeightCut);
line6x = linspace(gore_bandWidthCut,gore_bandWidthCut);
line7y = linspace(-bandHeightCut,-bandHeightCut);

nexttile
hold all;
title('Disc-Gap-Band Cut');
plot(line1x,line1y,'color','#000000');
plot (line2x,line2y,'color','#000000');
plot(line3x,line3y, 'color','#000000');
plot(line4x,line4y, 'color','#000000');
plot(line5x,line5y, 'color','#000000');
plot(line6x,line5y, 'color','#000000');
line(line4x,line7y, 'color','#000000');
plot(cline1x,cliney,'--',cline2x,cliney,'--',cline3x,cline3y,'--','color','#000000');
grid on
axis equal;

