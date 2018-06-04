function [lapTime, ts] = getLapTime(s, Ux)
    ts = [s(2); diff(s)]./Ux;
    lapTime = sum(ts);
end