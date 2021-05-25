Vehicles =[];
VehicleNames = [{'V1'} {'V2'} {'V3'} {'V4'} {'V5'} {'V6'} {'V7'} {'V8'} {'V9'} {'V10'}];

% According to the Cuboid world standard vehicle dimensions [2 1.8 4.7] => [height, width, length] in meters
sizes = [[2 1.8 4.7];[2 1.8 4.7];[2 1.8 4.7];[2 1.8 4.7]; [2 1.8 4.7]; [2 1.8 4.7]; [2 1.8 4.7]; [2 1.8 4.7]; [2 1.8 4.7]; [2 1.8 4.7]];
mass = [1800,3000,900,3000,900, 900,1000,1000,1000,1000,];
dataLinksV2V = ones(10,10);
dataLinksV2I = ones(1,length(VehicleNames));


frontSensorRange = 100.* ones(1,length(VehicleNames));
AEBdistance = 25.* ones(1,length(VehicleNames));
minDeceleration = -9.15.* ones(1,length(VehicleNames)); % -9.15 m/s^2 dec




for j=1:length(VehicleNames)
    
    VehicleVariable = strcat('Vehicle',num2str(j));
    assignin('caller',VehicleVariable,Vehicle(j,VehicleNames{j},startingPoints(j),destinationPoints(j),...
    startingTimes(j),maxSpeeds(j),sizes(j,:),dataLinksV2V(j,:),dataLinksV2I(j),mass(j),...
    simSpeed,frontSensorRange(j),AEBdistance(j),minDeceleration(j)) );
    NewVehicle = evalin('base',strcat('Vehicle',int2str(j)));
    Vehicles =[Vehicles NewVehicle];
end

