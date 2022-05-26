//Initializes variables and adds gas handler
/*
	gas = [radius, time, decay, timeToSpread, windAffected, ID, minimumProtection];
*/
CBRN_allowUnconcious = true;
CBRN_allowSkillChange = true;

//Sarin - lethal 
gasSarin = [250, 1800, 2, 60, true,0, 2];

//Tear gas - very strong in limited areas
gasTear = [10, 60, 4, 10, true, 1, 1];

//VX - stronger than sarin, decays extremely slowly, ignores wind. 
//Regarded as an area denial weapon
gasVX = [250, 1800, 1, 90, false, 0, 2];

//Asphyxiant 
gasAsp = [250, 800, 2, 90, true, 2, 1];

//Now
CBRN_gasArray = [gasSarin, gasTear, gasVX];

CBRN_uniformArray   = [];
CBRN_maskArray      = [];

//coughing sound list
CBRN_Choke_Sounds = [      
    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_02.wss",
    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_03.wss",
    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_04.wss",
    "A3\Sounds_f\characters\human-sfx\Person1\P1_choke_04.wss",
    "A3\Sounds_f\characters\human-sfx\Person2\P2_choke_04.wss",
    "A3\Sounds_f\characters\human-sfx\Person2\P2_choke_05.wss",
    "A3\Sounds_f\characters\human-sfx\Person3\P3_choke_02.wss",
    "A3\Sounds_f\characters\human-sfx\P06\Soundbreathinjured_Max_2.wss",
    "A3\Sounds_f\characters\human-sfx\P05\Soundbreathinjured_Max_5.wss"
];