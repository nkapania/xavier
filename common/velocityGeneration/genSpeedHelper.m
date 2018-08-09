function [Ux, Ax] = genSpeedHelper(s,K, maxAccelX, maxAccelY, minUx) 
%NOTE: maxAccelX and maxAccelY in units of g's to resemble inputting a mu value.

    g=9.81;
    vmax=99;
    axmax=maxAccelX*g;
    aymax=maxAccelY*g;

    Nsteps = length(s);
    
    Uxinit1 = zeros(Nsteps,1);
    Uxinit2 = zeros(Nsteps,1);
    Uxinit3 = zeros(Nsteps,1);
    ax = zeros(Nsteps,1);

    %Desired velocity should meet lateral acceleration requirement
    for i=1:Nsteps
        Uxinit1(i) = sqrt(aymax/(abs(K(i))+1e-8));
    end


    %Moving forward
    %Limited acceleration, below vmax, below Uxinit1
    Uxinit2(1)=minUx;
    for i=1:Nsteps-1
        tmp=sqrt(Uxinit2(i)^2+2*axmax*(s(i+1)-s(i)));
        %from (v^2-u^2 = 2*a*s)
        if (tmp>vmax)
            tmp = vmax;
        end
        if (tmp > Uxinit1(i+1))
            tmp=Uxinit1(i+1);
        end
        Uxinit2(i+1)=tmp;
    end

    %Moving rearward
    %Limited acceleration, below Uxinit2
    Uxinit3(Nsteps)=minUx;
    for i=Nsteps:-1:2
        tmp=sqrt(Uxinit3(i)^2-2*(-axmax)*(s(i)-s(i-1)));
        %from (v^2-u^2 = 2*a*s)
        if (tmp > Uxinit2(i-1))
            tmp = Uxinit2(i-1);
        end
        Uxinit3(i-1) = tmp;
    end

    for i=1:Nsteps-1
        ax(i)=(Uxinit3(i+1)^2-Uxinit3(i)^2)/(2*(s(i+1)-s(i)));
    end
    ax(Nsteps)=ax(Nsteps-1);

    for i=1:Nsteps
        ay(i) = Uxinit3(i)^2*K(i);
    end

    Ux = Uxinit3;
    Ax = ax;


end