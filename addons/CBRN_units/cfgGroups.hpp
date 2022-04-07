class CfgGroups
{
	class Indep
	{
		name = "Independent";
		side = 2;
		class IND_F 
		{
			name = "CBRN";
			class Infantry
			{
				name = "Infantry";
				class CBRN_Team
				{
					name = "CBRN Team";
					icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
					side = 2;
					scopeCurator=2;

					class Unit0
					{
						side = 1;
						vehicle = "I_CBRN_Soldier_TL";
						rank = "CORPORAL";
						position[] = {0, 0, 0 };
					};
					class Unit1
					{
						side = 1;
						vehicle = "I_CBRN_Soldier_AR";
						rank = "PRIVATE";
						position[] = {5, -5, 0 };
					};
					class Unit2
					{
						side = 1;
						vehicle = "I_CBRN_Soldier_GL_F";
						rank = "PRIVATE";
						position[] = {-5, -5, 0 };
					};
					class Unit3
					{
						side = 1;
						vehicle = "I_CBRN_Soldier_LAT_F";
						rank = "PRIVATE";
						position[] = {10, -10, 0 };
					};
				};
			};
		};
	};
	class West
	{
		name = "NATO";
		side = 0;
		class BLU_F 
		{
			name = "CBRN";
			class Infantry
			{
				name = "Infantry";
				class CBRN_Team
				{
					name = "CBRN Team";
					icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa";
					side = 2;
					scopeCurator=2;

					class Unit0
					{
						side = 1;
						vehicle = "B_CBRN_Soldier_TL";
						rank = "CORPORAL";
						position[] = {0, 0, 0 };
					};
					class Unit1
					{
						side = 1;
						vehicle = "B_CBRN_Soldier_AR";
						rank = "PRIVATE";
						position[] = {5, -5, 0 };
					};
					class Unit2
					{
						side = 1;
						vehicle = "B_CBRN_Soldier_GL_F";
						rank = "PRIVATE";
						position[] = {-5, -5, 0 };
					};
					class Unit3
					{
						side = 1;
						vehicle = "B_CBRN_Soldier_LAT_F";
						rank = "PRIVATE";
						position[] = {10, -10, 0 };
					};
				};
			};
		};
	};
	class East
	{
		name = "CSAT";
		side = 1;
		class OPF_F 
		{
			name = "CBRN";
			class Infantry
			{
				name = "Infantry";
				class CBRN_Team
				{
					name = "CBRN Team";
					icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
					side = 2;
					scopeCurator=2;

					class Unit0
					{
						side = 1;
						vehicle = "O_CBRN_Soldier_TL";
						rank = "CORPORAL";
						position[] = {0, 0, 0 };
					};
					class Unit1
					{
						side = 1;
						vehicle = "O_CBRN_Soldier_AR";
						rank = "PRIVATE";
						position[] = {5, -5, 0 };
					};
					class Unit2
					{
						side = 1;
						vehicle = "O_CBRN_Soldier_GL_F";
						rank = "PRIVATE";
						position[] = {-5, -5, 0 };
					};
					class Unit3
					{
						side = 1;
						vehicle = "O_CBRN_Soldier_LAT_F";
						rank = "PRIVATE";
						position[] = {10, -10, 0 };
					};
				};
			};
		};
	};
};