function map = loadMapData(file)
    mapData = csvread(file, 1, 0);
    map.segNum = mapData(:,1);
    map.segLength = mapData(:,2);
    map.cumLength = mapData(:,3);
    map.EInit = mapData(:,4);
    map.NInit = mapData(:,5);
    map.UpInit = mapData(:,6);
    map.psiInit = mapData(:,7);
    map.kStart = mapData(:,8);
    map.kEnd   = mapData(:,9);
    map.grade  = mapData(:,10);
    map.bank   = mapData(:,11);
    map.maxE   = mapData(:,12);
    map.maxV   = mapData(:,13);
    map.mu     = mapData(:,14);
    
    map.type   = mapData(1,16);
    map.totalLength = mapData(1, 17);
    map.totalSegs   = mapData(1, 18);
    
    for i=1:map.totalSegs    

        % seg type - what kind of segment each is
        if map.kEnd(i)== map.kStart(i) && map.kEnd(i)==0
            map.segType(i) = 0; % straight
        elseif abs(map.kEnd(i))>abs(map.kStart(i))
            map.segType(i) = 1; % entry clothoid
        elseif abs(map.kEnd(i))<abs(map.kStart(i))
            map.segType(i) = 3; % exit clothoid
        elseif map.kEnd(i)== map.kStart(i) && map.kEnd(i)~=0 && map.kEnd(i)~=-1
            map.segType(i) = 2; % const radius        
        else
            map.segType(i) = -1; % we have a problem        
        end

    end
    
end
