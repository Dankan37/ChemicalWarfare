class cfgWeapons
{
	class CannonCore;
	class mortar_82mm: CannonCore
	{
		magazines[] += {"4Rnd_82mm_Mo_Chemical_Sarin", "4Rnd_82mm_Mo_Chemical_VX", "8Rnd_82mm_Mo_Chemical_Tear"};

		//The price of not using CBA D:
		class EventHandlers
		{
			fired		= 	"[_this select 4, _this select 6] call CBRN_fnc_handleEventFired";
		};
	};

	class mortar_155mm_AMOS;
	class CBRN_mortar_155mm_AMOS: mortar_155mm_AMOS
	{
		magazines[] = {"32Rnd_155mm_Mo_shells","32Rnd_155mm_Mo_shells_O","6Rnd_155mm_Mo_smoke","6Rnd_155mm_Mo_smoke_O","2Rnd_155mm_Mo_guided","4Rnd_155mm_Mo_guided","4Rnd_155mm_Mo_guided_O","2Rnd_155mm_Mo_LG","4Rnd_155mm_Mo_LG","4Rnd_155mm_Mo_LG_O","6Rnd_155mm_Mo_mine","6Rnd_155mm_Mo_mine_O","2Rnd_155mm_Mo_Cluster","2Rnd_155mm_Mo_Cluster_O","6Rnd_155mm_Mo_AT_mine","6Rnd_155mm_Mo_AT_mine_O", "6Rnd_155mm_Mo_Chemical_Sarin", "10Rnd_155mm_Mo_Chemical_Tear", "6Rnd_155mm_Mo_Chemical_VX"};

		class EventHandlers
		{
			fired		= 	"[_this select 4, _this select 6] call CBRN_fnc_handleEventFired";
		};
	};

	class rockets_230mm_GAT: CannonCore 
	{
		magazines[] += {"12Rnd_230mm_rockets_Sarin"};
		scope = 2;
		scopeCurator = 2;

		class EventHandlers
		{
			fired		= 	"[_this select 4, _this select 6] call CBRN_fnc_handleEventFired";
		};
	}
};

