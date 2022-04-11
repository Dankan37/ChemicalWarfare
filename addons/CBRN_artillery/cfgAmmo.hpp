class cfgAmmo
{
	class Smoke_82mm_AMOS_White;
	class Sh_82mm_AMOS_Chem_Sarin: Smoke_82mm_AMOS_White
	{
		aiAmmoUsageFlags = "64";
		CBRN_isGas = 1;
		CBRN_gasType = 0;
	};

	class Sh_82mm_AMOS_Chem_Tear: Sh_82mm_AMOS_Chem_Sarin {
		CBRN_gasType = 1;
	};
	class Sh_82mm_AMOS_Chem_VX: Sh_82mm_AMOS_Chem_Sarin {
		CBRN_gasType = 2;
	};

	//class Smoke_82mm_AMOS_White;
	class Sh_155mm_AMOS_Chem_Sarin: Smoke_82mm_AMOS_White
	{
		aiAmmoUsageFlags = "64";
		CraterEffects = "";
		cost = 600;
		explosive = 0;
		indirectHit = 0;
		CBRN_gasType = 0;
		CBRN_isGas = 1;
	};
	class Sh_155mm_AMOS_Chem_Tear: Sh_155mm_AMOS_Chem_Sarin {
		CBRN_gasType = 1;
	};
	class Sh_155mm_AMOS_Chem_VX: Sh_155mm_AMOS_Chem_Sarin {
		CBRN_gasType = 2;
	};

	class R_230mm_fly;
	class CBRN_R_230mm_Sarin: R_230mm_fly 
	{
		aiAmmoUsageFlags = "64";
		craterEffects = "";
		explosive = 0;
		indirectHit = 0;
		explosionEffects = "";
		effectsMissile = "";
		explosionType = "";
		CBRN_gasType = 2;
		CBRN_isGas = 1;
	};
};