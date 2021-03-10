uavter removeaction uavac1;

if uavlh then {uavac1 = uavter addAction ["Launch UAV", "\loki_lost_key\lk\uav\launchuav.sqf",[uavter,500,UAVmod,"uavter","MQ9PredatorB",West],0,false]} else {uavac1 = uavter addaction ["Dismiss UAV", "\loki_lost_key\lk\uav\duav.sqf", [], 1, true, true, "", ""]};