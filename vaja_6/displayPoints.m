function displayPoints(iXY, iMarker)
%displayPoints na sliki nariše točke iXY z danim markarjem
%vhodni argumenti;
%   iXY - matrika točk, ki jih želimo na sliki
%   iMarker - kako hočemo da so točke ponazorjenje - 'rx' prva črka pomeni
%   barvo in druga črka način označevanja (rdeč križec) 'bo'(mordri krogec)
hold on;
plot(iXY(:,1), iXY(:,2), iMarker, 'MarkerSize', 10, 'LineWidth', 2);