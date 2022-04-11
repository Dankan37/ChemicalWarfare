class cfgMagazines
{
	class 8Rnd_82mm_Mo_shells;
	class 4Rnd_82mm_Mo_Chemical_Sarin: 8Rnd_82mm_Mo_shells
	{
		author = "Dankan37";
		displayNameMFDFormat = "Sarin";
		displayNameShort = "Sarin";
		displayName = "Sarin Gas Shells";
		ammo = "Sh_82mm_AMOS_Chem_Sarin";
		count = 4;
	};

	class 8Rnd_82mm_Mo_Chemical_Tear: 4Rnd_82mm_Mo_Chemical_Sarin
	{
		displayNameMFDFormat = "Tear Gas";
		displayNameShort = "Tear Gas";
		displayName = "Tear Gas Shells";
		ammo = "Sh_82mm_AMOS_Chem_Tear";
		count = 8;
	};

	class 4Rnd_82mm_Mo_Chemical_VX: 4Rnd_82mm_Mo_Chemical_Sarin
	{
		displayNameMFDFormat = "VX Gas";
		displayNameShort = "VX Gas";
		displayName = "VX Gas Shells";
		ammo = "Sh_82mm_AMOS_Chem_VX";
		count = 4;
	};

	class 6Rnd_155mm_Mo_smoke;
	class 6Rnd_155mm_Mo_Chemical_Sarin: 6Rnd_155mm_Mo_smoke
	{
		author = "Dankan37";
		displayNameMFDFormat = "Sarin";
		displayNameShort = "Sarin";
		displayName = "Sarin Gas Shells";
		ammo = "Sh_155mm_AMOS_Chem_Sarin";
		count = 6;
	};

	class 10Rnd_155mm_Mo_Chemical_Tear: 6Rnd_155mm_Mo_smoke
	{
		author = "Dankan37";
		displayNameMFDFormat = "Tear";
		displayNameShort = "Tear";
		displayName = "Tear Gas Shells";
		ammo = "Sh_155mm_AMOS_Chem_Tear";
		count = 10;
	};

	class 6Rnd_155mm_Mo_Chemical_VX: 6Rnd_155mm_Mo_smoke
	{
		author = "Dankan37";
		displayNameMFDFormat = "VX";
		displayNameShort = "VX";
		displayName = "VX Gas Shells";
		ammo = "Sh_155mm_AMOS_Chem_VX";
		count = 6;
	};

	class 12Rnd_230mm_rockets;
	class 12Rnd_230mm_rockets_Sarin: 12Rnd_230mm_rockets
	{
		author = "Dankan37";
		displayNameMFDFormat = "Sarin";
		displayNameShort = "Sarin";
		displayName = "Sarin Gas Rocket";
		descriptionShort = "Unguided rockets with an explosive warhead coupled with a VX releasing dispenser";
		ammo = "CBRN_R_230mm_Sarin";
		count = 12;
		
	};
};