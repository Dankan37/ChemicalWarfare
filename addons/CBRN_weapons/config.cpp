class CfgPatches
{
	class CBRN_weapons  
	{
		units[] = {};
		weapons[] = {"CBRN_tearGrenadeMuzzle"};
		requiredAddons[] = { "A3_characters_F"};	
	};
};

class CfgAmmo 
{
	class Default;	// External class reference
	class Grenade  : Default {};
	class GrenadeHand : Grenade  {};

	class CBRN_tearGrenadeAmmo  : GrenadeHand 
	{
		scope = 2;
		hit = 0.1;
		indirectHit = 0.5;
		indirectHitRange = 1;
		fuseDistance = 5;
		model = "\A3\Weapons_f\ammo\smokegrenade_white_throw";
		explosionTime = 4;
		explosionEffects = "GrenadeExplosion";
		effectsSmoke = "SmokeShellWhiteEffect";
		timeToLive = 60;

		CBRN_gasType[] = {10, 60, 1, 10, 1, 1, 1};
	};
	/*
	class G_40mm_Smoke;
	class CBRN_G_40mm_Tear: G_40mm_Smoke 
	{
		CBRN_gasType[] = {10, 60, 1, 10, 1, 1, 1};
	};
	*/
};

class cfgMagazines
{
	class Default;
	class CA_Magazine : Default {};
	class HandGrenade  : CA_Magazine {};

	class CBRN_tearGrenade :  HandGrenade 
	{
		displayName = "Tear Gas grenade";
		displayNameShort = "Tear Gas";
		ammo = "CBRN_tearGrenadeAmmo";
		picture = "\A3\Weapons_f\data\ui\gear_smokegrenade_white_ca.paa";
	};

	class 1Rnd_Smoke_Grenade_shell;
	class 1Rnd_CBRN_Tear_shell: 1Rnd_Smoke_Grenade_shell 
	{
		displayName = "Tear Gas grenade";
		displayNameShort = "Tear Gas";
		ammo = "CBRN_G_40mm_Tear";
	}
};

class CfgWeapons 
{
	class Default;
	class GrenadeLauncher : Default {};
	
	class Throw : GrenadeLauncher {
		class SmokeShellMuzzle;
		class CBRN_tearGrenadeMuzzle: SmokeShellMuzzle 
		{
			magazines[] = {"CBRN_tearGrenade"};
			class EventHandlers
			{
				fired		= 	"[_this select 4, _this select 6] call CBRN_fnc_handleGrenade;";
			};
		};	
		muzzles[] += {"CBRN_tearGrenadeMuzzle"};
	};
	/*
	class UGL_F: GrenadeLauncher {
		magazines[] += {"1Rnd_CBRN_Tear_shell"};

		class EventHandlers
		{
			fired		= 	"[_this select 4, _this select 6] call CBRN_fnc_handleGrenade;";
		};
	};
	*/
};
