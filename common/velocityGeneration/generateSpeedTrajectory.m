%Todo: compute a speed profile. The output must be a structure that
%contains three arrays: The distance along path (s), desired velocity at
%every point in space, and desired acceleration at every point in space. 

function prof = generateSpeedTrajectory(path, veh)
    disp('Generating Speed');
    
%     %%default code: just drive at 5 m/s (12 mph)
%     prof.s = path.s;
%     prof.Ux = 5*ones(size(prof.s));
%     prof.Ax = zeros(size(prof.s));

%Performance limits
    g=9.81;
    vmax=99;
    axmax=0.7*g;
    aymax=0.7*g;
       
    Nsteps = length(path.s);

    %Desired velocity should meet lateral acceleration requirement
    for i=1:Nsteps
        Uxinit1(i) = sqrt(aymax/(abs(path.K(i))+1e-8)); 
    end
    

    %Moving forward
    %Limited acceleration, below vmax, below Uxinit1
    Uxinit2(1)=0;
    for i=1:Nsteps-1
        tmp=sqrt(Uxinit2(i)^2+2*axmax*(path.s(i+1)-path.s(i))); 
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
    Uxinit3(Nsteps)=0;
    for i=Nsteps:-1:2
         tmp=sqrt(Uxinit3(i)^2-2*(-axmax)*(path.s(i)-path.s(i-1)));
         %from (v^2-u^2 = 2*a*s)
         if (tmp > Uxinit2(i-1))
             tmp = Uxinit2(i-1);
         end
         Uxinit3(i-1) = tmp;
    end

    for i=1:Nsteps-1
        ax(i)=(Uxinit3(i+1)^2-Uxinit3(i)^2)/(2*(path.s(i+1)-path.s(i)));
    end
    ax(Nsteps)=ax(Nsteps-1);

    for i=1:Nsteps
        ay(i) = Uxinit3(i)^2*path.K(i);
    end

    prof.Ux = Uxinit3;
    prof.Ax = ax;
    prof.s = path.s;
    
    plot(prof.s, prof.Ax)

    
end
   