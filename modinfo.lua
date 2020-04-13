name = "Puppy Princess Musha"
description = "[DS Musha] H 0.9.3 \nAuthor = sunnyyyyholic \nE-mail:  eunmanaz@naver.com"
author = "sunnyyyyholic"
version = "H 0.9.3" 
forumthread = ""
--forumthread = "https://steamcommunity.com/sharedfiles/filedetails/?id=439115156"
icon_atlas = "modicon.xml"
icon = "modicon.tex"

priority = 0.131
api_version = 6
--api_version_dst = 10
restart_required = true
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
porkland_compatible = true
dst_compatible = false


configuration_options =

{ 	

	{
        name = "modlanguage",
        label = "Mod Language",
        --hover = "[*]If your server has a cave, you have to select a language.\n[*]케이브 포함 서버인 경우 언어를 선택해야합니다.               \n[*]如果你的服务器有一个洞穴，你必须选择一种语言.            \n[*]Если на вашем сервере есть пещера, вы должны выбрать язык.",
        options =
        {
            {description="Auto", data = "auto"},
			{description="English", data = "english"},
			{description="Korean", data = "korean"},
			{description="Chinese", data = "chinese"},
			--{description="русский", data = "russian"},
        },
        default = "auto",
    },	
	
		{
        name = "mushalevel",
        label = "Level (info)",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
            {description = "K", data = "K"},
            {description = "L (default)", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
			{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "L",
    },

    {
        name = "mushaskill",
        label = "Skill (info)",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
            {description = "K(default)", data = "K"},
            {description = "L", data = "L"},		
			{description = "O", data = "O"},
            {description = "P", data = "P"},	
			{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},			
        },
        default = "K",
    },
    {
        name = "valkyriec",
        label = "Skill: Valkyrie",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V (default)", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},		
			{description = "O", data = "O"},
            {description = "P", data = "P"},
			{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},			
        },
        default = "V",
    },
    {
        name = "shielda",
        label = "Skill: Shield",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C (default)", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},	
			{description = "O", data = "O"},
            {description = "P", data = "P"},	
			{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},			
        },
        default = "C",
    },
    {
        name = "powerattack",
        label = "Skill: Power attack",
        options =
        {
            {description = "R(default)", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "R",
    },
    {
        name = "dogs",
        label = "Skill: Music",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U(default)", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "U",
    },
    {
        name = "bunsin",
        label = "Skill: Shadow",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G(default)", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "G",
    },
		    {
        name = "sleeping",
        label = "Skill: Sleeping",
        options =
        {
            {description = "R", data = "R"},
            {description = "T(default)", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "T",
    },	
		    {
        name = "egghunter",
        label = "Hidden Eggs",
        options =
        {
			{description = "Hidden Phoenix egg", data = "no_a_egg"},
			{description = "Hidden Arong egg", data = "no_y_egg"},
			{description = "Hidden both eggs", data = "ya_hunt"},
			{description = "Start Phoenix egg", data = "a_hunted"},
			{description = "Start Arong egg", data = "y_hunted"},
			{description = "Start both eggs", data = "no_hunt"},
			{description = "No both eggs", data = "no_egg"},
           
        },
        default = "no_a_egg",
    },	
	{
        name = "yamchegrowup_a",
        label = "Yamche- Grow up",
        options =
        {	
  			{description = "Auto", data = "auto"},
			{description = "Manual", data = "manual"},
			
        },
        default = "manual",
    },	
	{
        name = "yamchegrowup",
        label = "Yamche- Follow/Growup",
        options =
        {	
			{description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X(default)", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
			{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
			
        },
        default = "X",
    },	
    {
        name = "commandyamche",
        label = "Yamche- Battle",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z(default)", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "Z",
    },
	
	    {
        name = "yamchecollect",
        label = "Yamche- Gather",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B(default)", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "B",
    },
		{
        name = "arongrong",
        label = "Arong- follow/stay",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y(default)", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "Y",
    },
   {
        name = "moontree",
        label = "Dall- follow/stay",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N(default)", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "N",
    },			
	    {
        name = "visualhold",
        label = "Visual: Hold/Auto",
        options =
        {
            {description = "R", data = "R"},
            {description = "T", data = "T"},
            {description = "Y", data = "Y"},
            {description = "U", data = "U"},
            {description = "G", data = "G"},
            {description = "H", data = "H"},
            {description = "J", data = "J"},
            {description = "Z", data = "Z"},
            {description = "X", data = "X"},
            {description = "C", data = "C"},
            {description = "V", data = "V"},
            {description = "B", data = "B"},
            {description = "N", data = "N"},
			{description = "K", data = "K"},
            {description = "L", data = "L"},
			{description = "O", data = "O"},
            {description = "P(default)", data = "P"},
						{description = "F1", data = "F1"},
			{description = "F2", data = "F2"},
			{description = "F3", data = "F3"},
			{description = "F4", data = "F4"},
			{description = "F5", data = "F5"},
			{description = "F6", data = "F6"},
			{description = "F7", data = "F7"},
			{description = "F8", data = "F8"},
			{description = "F9", data = "F9"},
			{description = "F10", data = "F10"},
			{description = "F11", data = "F11"},
			{description = "F12", data = "F12"},
        },
        default = "P",
    },		
		{
        name = "badge_type",
        label = "Supplementary info: Music/Sniff",
        options =
        {
        	{description = "On", data = 1},
			{description = "Off", data = 0},
        },
        default = 1,
		},

		
	   {
        name = "smartmusha",
        label = "Knowledge",
        options =
        {
            {description = "Normal(tier0)", data = "normal"},
            {description = "Smart(tier1)", data = "smart"},
            {description = "Genius(tier2)", data = "verysmart"},
        },
        default = "normal",
    },
	    {
        name = "craftgems",
        label = "Craft Gems",
        options =
        {
            {description = "Disable", data = "off"},
 		    {description = "Basic", data = "color_b"},
            {description = "Advanced", data = "color"},
        },
        default = "color_b",
		},
		{
        name = "difficultsniff",
        label = "Difficulty -Sniff",
        options =
        {
            {description = "Easy", data = "easy"},
            {description = "Normal", data = "normal"},
			{description = "Hard", data = "hard"},
			{description = "Hardcore", data = "hardcore"},
         },
        default = "normal",
    },
	   {
        name = "Recipe_control",
        label = "Difficulty -Recipe",
        options =
        {
            {description = "VeryEasy", data = "veasy"},
            {description = "Easy", data = "easy"},
            {description = "Normal", data = "normal"},
         },
        default = "normal",
    },
    {
        name = "difficultover",
        label = "Difficulty -Enemies",
        options =
        {
            {description = "Default", data = "monster1x"},
            {description = "Hard", data = "monster2x"},
            {description = "Hardcore", data = "monster3x"},
            {description = "Hell", data = "monster4x"},
        },
        default = "monster1x",
    },
	
			{
        name = "difficultdamage",
        label = "Difficulty -Melee",
        options =
        {
			{description = "Very easy", data = "damage_veasyh"},
	        {description = "Easy(100)", data = "damage_easyh"},
            {description = "Normal(75)", data = "damage_normalh"},
            {description = "Hard(50)", data = "damage_hardh"},
            {description = "Hardcore(35)", data = "damage_hardcoreh"},
			{description = "Hell(20)", data = "damage_hellh"},
         },
 		default = "damage_normalh",
		},	
				{
        name = "difficultdamage_range",
        label = "Difficulty -Range",
        options =
        {
            {description = "Easy(150)", data = "normal"},
            {description = "Normal(100)", data = "hard"},
			{description = "Hard(75)", data = "hardcore"},
        },
 		default = "hard",
    },
			{
        name = "difficultstatus",
        label = "Difficulty -Status",
		--hover = "Musha Health/Sanity",
        options =
        {
			{description = "Very easy", data = "stat_veasyh"},
	        {description = "Easy", data = "stat_easyh"},
            {description = "Normal", data = "stat_normalh"},
            {description = "Hard", data = "stat_hardh"},
            {description = "Hardcore", data = "stat_hardcoreh"},
			{description = "Hell", data = "stat_hellh"},
         },
 		default = "stat_normalh",
		},	
			{
        name = "difficultsanity",
        label = "Difficulty -Sanity",
		--hover = "Musha Sanity Regen",
        options =
        {
	        {description = "Easy", data = "easy"},
            {description = "Normal", data = "normal"},
            {description = "Hard", data = "hard"},
            {description = "Hardcore", data = "hardcore"},
         },
 		default = "normal",
    },
	
	    {
        name = "difficultsleep",
        label = "Difficulty -Sleep",
        options =
        {
         --   {description = "Off", data = "off"}, 	
            {description = "Very easy", data = "veasy"},			
            {description = "Easy", data = "easy"},
            {description = "Normal", data = "normal"},
            {description = "Hard", data = "hard"},
            {description = "Hardcore", data = "hardcore"},			
        },
        default = "normal",
    },
	{
        name = "difficultmusic",
        label = "Difficulty -Music",
		--hover = "how much regenerate [Music] during sleeping",
        options =
        {
			{description = "VeryEasy", data = "dmusic_veasy"},
	        {description = "Easy", data = "dmusic_easy"},
            {description = "Normal", data = "dmusic_normal"},
            {description = "Hard", data = "dmusic_hard"},
            {description = "Hardcore", data = "dmusic_hardcore"},
        },
        default = "dmusic_normal",
    },
	
	{
        name = "difficultmana",
        label = "Difficulty -Mana",
		hover = "difficulty of mana regen",
        options =
        {
			{description = "VeryEasy", data = "dmana_veasy"},
	        {description = "Easy", data = "dmana_easy"},
            {description = "Normal", data = "dmana_normal"},
            {description = "Hard", data = "dmana_hard"},
            {description = "Hardcore", data = "dmana_hardcore"},
        },
        default = "dmana_normal",
    },
	--[[{
        name = "difficultysniff",
        label = "Difficulty -Sniff",
		hover = "treasure smell",
        options =
        {
			{description = "Easy", data = "easy"},
            {description = "Normal", data = "normal"},
			{description = "Hard", data = "hard"},
			{description = "Hardcore", data = "hardcore"},
        },
        default = "normal",
    },]]
	
	{
        name = "difficulttired",
        label = "Difficulty -Tired",
        options =
        {
         --   {description = "Off", data = "off"}, 	
            {description = "Very easy", data = "veasy"},			
            {description = "Easy", data = "easy"},
            {description = "Normal", data = "normal"},
            {description = "Hard", data = "hard"},
            {description = "Hardcore", data = "hardcore"},			
        },
        default = "normal",
    },
	{
        name = "expx_LV",
        label = "Extra Exp-Value",
        options =
        {
            {description = "+ (1)", data = "expx1"},
            {description = "+ (2)", data = "expx2"},
            {description = "+ (3)", data = "expx3"},
            {description = "+ (4)", data = "expx4"},
        },
        default = "expx1",
    },
	{
        name = "expx_DR",
        label = "Extra Exp-Chance",
        options =
        {
            {description = "5 per", data = "expd1"},
            {description = "10 per", data = "expd2"},
            {description = "20 per", data = "expd3"},
            {description = "30 per", data = "expd4"},
        },
        default = "expd1",
    },
	-- it's bad. too easy
	{
        name = "monsterfood",
        label = "Monster lasagna value",
        options =
        {
            {description = "Disable", data = "default"},
            {description = "Very High", data = "vhigh"},
            {description = "High", data = "high"},
            {description = "Moderato", data = "mid"},		
            {description = "Low", data = "low"},			
        },
        default = "default",
    },
		{
        name = "deathPenalty",
        label = "Death Penalty",
        options =
        {
            {description = "On", data = "on"},
            {description = "Off", data = "off"},

        },
        default = "on",
    },
	   {
        name = "Yamresurrect",
        label = "Sacrifice of Yamche",
        options =
        {
            {description = "On(default)", data = "on"},
            {description = "Off", data = "off"},
        },
        default = "on",
    },


		{
        name = "AssasinOn",
        label = "Wilson n Webber",
        options =
        {
            {description = "Enable", data = "on"},
            {description = "Disable", data = "off"},
        },
        default = "on",
		},	
		{
        name = "changeDLC2voice",
        label = "Musha Voice",
        options =
        {
            {description = "willow", data = "willow"},
            {description = "walani(DLC2)", data = "walani"},

        },
        default = "on",
		},	
		--[[{
        name = "mushabadge",
        label = "Mouse over Badge",
        options =
        {
            {description = "Off", data = "off"},
            {description = "Valkyrie (default)", data = "valkyrie"},
            {description = "Always", data = "always"},

        },
        default = "valkyrie",
		},]]
		{
        name = "frostseries",
        label = "Thermal stone",
        options =
        {
            {description = "Disable (default)", data = "disable"},
            {description = "All Enable", data = "enable"},
            {description = "Only Frost Armor", data = "frostback"},
            {description = "Only Frost Hammer", data = "frosthammer"},
            {description = "Only Frost Heart", data = "frostheart"},

        },
        default = "disable",
    },
	
  
			{
        name = "swimer",
        label = "Swimer Musha(DLC2)",
        options =
        {
            {description = "Disable", data = "off"},
            {description = "Enable", data = "on"},
         },
        default = "on",
    },
		{
        name = "portablerecipe",
        label = "Warly Pot (DLC2)",
        options =
        {
            {description = "Disable", data = "off"},
            {description = "Enable", data = "on"},

        }, 
		default = "on",
		},

   {
        name = "tunastacks",
        label = "TUNA(DLC2): Stackable",
        options =
        {
            {description = "Disable", data = "disable"},
            {description = "5", data = "5"},
            {description = "10", data = "10"},
            {description = "15", data = "15"},		
            {description = "20", data = "20"},			
        },
        default = "5",
    },
	{
        name = "stop_spawning",
        label = "Dall: servant",
		--hover = "[No spawn]:if you want the Moontree stop spawning his servant\n[Small Radius]: if you want his servants to transform into plants within a small range. ",
        options =
        {
        {description = "Default", data = 1 },
		{description = "Small Radius", data = 2 },
		{description = "No Spawn", data = 3 },
		
        },
        default = 1,
    },
		{
        name = "frostblade3rd",
        label = "[Frost Blade]:Change 3rd booster",
		--hover = "[Only Visual]:Change Frost blade visual of 3rd boost\n[V +Range]:Change Visual + Change boost weapon range",
        options =
        {
        {description = "Default", data = 1},
		{description = "Only Visual", data = 2},
		{description = "V + Range", data = 3},
        },
        default = 3,
    },
	{
        name = "bunnyarmored",
        label = "Visual of [Bunny Scout]",
		--hover = "Change visual of Bunny Scout",
        options =
        {
		{description = "Auto", data = 1},
		{description = "Armored", data = 2},
		{description = "Grass", data = 3},
        },
        default = 1,
    },
	{
        name = "musha_incontainer",
        label = "Compact Armor",
		--hover = "Musha's armor can go in container.",
        options =
        {
            {description = "Disable", data = 0},
            {description = "Enable", data = 1},
        },
        default = 1,
    },
	{
        name = "incontainer",
        label = "Compact normal backpack",
		--hover = "Base backpack can go in container.",
        options =
        {
            {description = "Disable", data = 0},
            {description = "Enable", data = 1},
        },
        default = 0,
    },
	{
        name = "princess_taste",
        label = "Piggy or Princess",
		--hover = "[Princess]: She can not eat a something when 'hunger' is more than 90%.\n[Piggy]: She can always eat a something.",
        options =
        {
	        {description = "Piggy", data = "normal"},
			{description = "Princess", data = "princess"},
			
        },
		
        default = "princess",
		},
			{
        name = "dietmusha",
        label = "Edible Food Type",
		--hover = "\nRegardless of the setting of this option, she can eat all of food type when her hunger is below 0.\n(this is ignore mod setting)",
        options =
        {
            {description = "Both", data = "normal"},
            {description = "Only-Meat", data = "meat"},
            {description = "Only-Veggie", data = "veggie"},
	
        },
        default = "normal",
    },
	{
        name = "favoritemusha",
        label = "Dislike Food Type",
		--hover = "'Dis' meaning is Dislike food type.(sanity penalty)\nRegardless of the setting of this option, she like caffeine apple and doesn't like eating butterflies.",
        options =
        {
            {description = "Normal", data = "normal"},
			{description = "Dis-Meat", data = "dis_meat"},
			{description = "Dis-Veggie", data = "dis_veggie"},
 	
        },
        default = "normal",
    },
}
