class cfg3Den
{
	class Group
	{
		class AttributeCategories
		{
			class CBRN_groupCategory
			{
				displayName = "Chemical warfare"; 
				collapsed = 1; 
				class Attributes
				{
					class CBRN_ignoreCBRN
					{
						displayName = "Ignore chemicals";
						tooltip = "Should this group ignore chemical weapons?";
						property = "CBRN_gignoreCBRN";
						control = "Checkbox";
						defaultValue = "false";
						expression = "if (_value) then {_this setVariable ['ignoreCBRN', true];}";
					};
				};
			};
		};
	};
	class Object
	{
		class AttributeCategories
		{
			class CBRN_unitCategory
			{
				displayName = "Chemical warfare"; 
				collapsed = 1; 
				class Attributes
				{
					class CBRN_immuneCBRN
					{
						displayName = "Immune to chemicals";
						tooltip = "Should this unit be immune to chemical weapons even when unprotected?";
						property = "CBRN_immuneToCBRN";
						control = "Checkbox";
						defaultValue = "false";
						expression = "if (_value) then {_this setVariable ['immune', true];}";
						condition = "objectControllable";
					};
				};
			};
		};
	};
};