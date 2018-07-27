#define _ARMA_
class CfgPatches
{
	class aba
	{
		units[] = {};
		weapons[] = {};
		AB_Version = 1.0;
		requiredVersion = 1.82;
		requiredAddons[] = {};
		author[]= {"MGTDB"}; 
	};
};
class CfgFunctions
{
	class aba
	{
		class main
		{
			file = "exile_abandon";
			class abandoninit
			{
				postInit = 1;
			};
		};
	};
};