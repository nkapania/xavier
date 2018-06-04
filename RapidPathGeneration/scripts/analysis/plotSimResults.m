function plotResults(simout)
    close all;
    t = simout.t;

    fprintf('Lap Time    = %6.3f seconds\n',t(end));
    fprintf('Maximum lateral error = %6.3f meters \n',max(abs(simout.e)));

    %%%%%%%%%%%%%%%%%%%%
    %%%%% PLOTTING %%%%%
    %%%%%%%%%%%%%%%%%%%%

    % track map
    plot( simout.posE , simout.posN , 'r' , 'LineWidth' , 2 );          hold on;
    axis equal; grid on;
    xlabel('East [m]'); ylabel('North [m]');
    %legend('Actual','Desired');

    % steering and errors
    figure;
    plot( t , simout.delta    * 180/pi,  'k' ); hold on;
    plot( t , simout.deltaFFW * 180/pi , 'g' );
    plot( t , simout.deltaFB  * 180/pi , 'r' ); hold off;
    xlim([0 t(end)]);
    legend('delta','deltaFFW','deltaFB')
    xlabel('t');ylabel('delta')
    
    figure;
    plot( t , simout.e, 'g' ); hold on;
    plot( t , simout.dPsi*180/pi, 'r' );
    xlim([0 t(end)]);
    legend('e', 'dPsi')

    figure;
    plot( t , simout.alphaF   * 180/pi , 'b' ); hold on;
    plot( t , simout.alphaFdes * 180/pi , 'b--' );
    plot( t , simout.alphaR    * 180/pi , 'r' ); 
    plot( t , simout.alphaRdes    * 180/pi , 'r--' ); hold off;
    xlim([0 t(end)]);
    xlabel('t [s]'); ylabel('slip [deg]');
    legend('front \alpha','front \alpha des','rear \alpha','rear \alpha des');

    % yaw rate
    figure;
    plot( t , simout.r    , 'r' ); hold on;
    xlim([0 t(end)]);
    xlabel('t [s]'); ylabel('yaw rate [rad/s]');

    %Fx
    figure; 
    plot( t, simout.Fx  , 'r', 'LineWidth' , 2); hold on;
    plot( t, simout.FxDes, 'LineWidth',2);
    legend('Actual','Desired')
    ylim([min(simout.Fx) max(simout.Fx)])

end