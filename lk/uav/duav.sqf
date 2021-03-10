uavter removeaction uavac1;
deletevehicle uavtrigger;
sleep 1;
deletevehicle MyUAV;
uavlh = true;
sleep 1;
[uavter] exec "\loki_lost_key\lk\uav\uav_menu.sqf";
player commandchat "UAV has been dismised";
