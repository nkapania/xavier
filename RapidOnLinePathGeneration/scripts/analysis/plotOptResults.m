function plotresults(simout, map)

%plot racing lines
    %road boundaries
    leftBound    = getPath(map, 'left');
    rightBound  = getPath(map, 'right');

    %clean this up.
    
%     plot(s, delta*180/pi,'LineWidth',2);
%     grid on; 
%     xlabel('k','FontName','Arial','FontSize',14)
%     ylabel('Steer Input (deg)','FontName','Arial','FontSize',14)
% 
%     figure;
%     plot(s, aF*180/pi,'LineWidth',2); hold on; plot(s, aR*180/pi,'r','LineWidth',2)
%     grid on; 
%     xlabel('k','FontName','Arial','FontSize',14)
%     ylabel('Tire Slips (m)','FontName','Arial','FontSize',14)


    %refLine = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu94unmanned_HL_2014-10-07_aa.mat');
    %refLine2 = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\gunnar_HL_2014-10-06_ab.mat');
    %bounds = load('C:\Mapping\Road Edges\thunder_hill_bounds.mat');

    figure;
    plot(leftBound.posE, leftBound.posN,'k','LineWidth',3)
    hold on; grid on; axis equal;
    plot(rightBound.posE, rightBound.posN,'k', 'LineWidth',3)
    %plot(bounds.road_bounds_in(:,1), bounds.road_bounds_in(:,2),'k--')
    %plot(bounds.road_bounds_out(:,1), bounds.road_bounds_out(:,2),'k--')
    plot(simout.racingLine{2}.posE, simout.racingLine{2}.posN,'r','LineWidth',2); hold on;
    %plot(refLine2.OxTSData.posE, refLine2.OxTSData.posN,'g','LineWidth',2)
    %plot(refLine.OxTSData.posE, refLine.OxTSData.posN,'b','LineWidth',2)
    xlabel('East (m)','FontName','Arial','FontSize',14)
    ylabel('North (m)','FontName','Arial','FontSize',14)
    
end