mapWorld.road_IC = [mapWorld.roadE(end) mapWorld.roadN(end) mapWorld.roadPsi(end)];
mapWorld.roadE = flipud(mapWorld.roadE);
mapWorld.roadN = flipud(mapWorld.roadN);
mapWorld.roadPsi = flipud(mapWorld.roadPsi+pi);
mapWorld.K = flipud(-mapWorld.K);
mapWorld.grade = flipud(mapWorld.grade);
mapWorld.bank = flipud(mapWorld.bank);
name = 'thunderhill_flip'
