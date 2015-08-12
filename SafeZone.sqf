//This script randomly creates 10 markers with 10 triggers everytime it executes. 
//For this to work you will need to place a logic named "CENTER"
if ( !isDedicated && hasInterface ) then {

					for "_i" from 0 to 10 step 1 do {_gamelogic = CENTER;
					_towns = nearestLocations [getPosATL _gamelogic, ["NameVillage","NameCity","NameCityCapital"], 25000]; 
					_RandomTownPosition = position (_towns select (floor (random (count _towns))));
					_m = createMarker [format ["mrk%1",random 100000],_RandomTownPosition];
					_m setMarkerShape "ELLIPSE";
					_m setMarkerSize [300,300];
					_m setMarkerBrush "Solid";
					_m setMarkerAlpha 0.5;
					_m setMarkerColor "ColorGreen";
					
					_tr = createTrigger["EmptyDetector", _RandomTownPosition];
					_tr setTriggerArea[300,300,0,false];
					_tr setTriggerActivation["ANY","PRESENT",true];
					_tr setTriggerStatements["this", "isPlayerExposed = false;", "isPlayerExposed = true;"]; 
					
					
					};
					
					
					

};
waitUntil { time > 0 };

//Server
if (!isServer) exitWith {};
