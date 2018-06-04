NES=zeros(3,N); % state is North, East, Psi

for counter=1:N-1
    
    % calculate derivatives
    dxdtNES=[Ux(counter)*cos(NES(3,counter))-Uy(counter)*sin(NES(3,counter));...
        -Uy(counter)*cos(NES(3,counter))-Ux(counter)*sin(NES(3,counter));
        r(counter)];
    % update state with forward Euler
    NES(:,counter+1)=NES(:,counter)+dxdtNES.*ts;
end

% unpack data
posN=NES(1,:);
posE=NES(2,:);
psi=NES(3,:);