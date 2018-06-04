function truePsi = getPsiFromEN(posE, posN)
    N = numel(posE);
    truePsi = zeros(N,1); 
    
    for i = 2:N
        delE = posE(i) - posE(i-1);
        delN = posN(i) - posN(i-1);
        
        %some hacks here to keep things consistent with quill
        truePsi(i) = atan2(delN, delE)+3*pi/2;
        if abs(truePsi(i) - truePsi(i-1)) > pi
            truePsi(i) = truePsi(i) + 2*pi;
        end
    end
    
    truePsi(1) = truePsi(2);
  
    
end