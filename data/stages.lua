-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
-- experienceStages = {
	-- {
		-- minlevel = 1,
		-- maxlevel = 1000,
		-- multiplier = 100000
	-- },{
		-- minlevel = 1001,
		-- maxlevel = 2000,
		-- multiplier = 45000
	-- }, {
		-- minlevel = 2001,
		-- maxlevel = 3000,
		-- multiplier = 27000
	-- }, {
		-- minlevel = 3001,
		-- maxlevel = 4000,
		-- multiplier = 13000
	-- }, {
		-- minlevel = 4001,
		-- maxlevel = 5000,
		-- multiplier = 6000
	-- }, {
		-- minlevel = 5001,
		-- multiplier = 3000
	-- }
-- }

experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 20
	},{
		minlevel = 9,
		maxlevel = 100,
		multiplier = 80
	},{
		minlevel = 101,
		maxlevel = 150,
		multiplier = 70
	},{
		minlevel = 151,
		maxlevel = 200,
		multiplier = 50
	},{
		minlevel = 201,
		maxlevel = 250,
		multiplier = 30
	},{
		minlevel = 251,
		maxlevel = 300,
		multiplier = 15	
	},{
		minlevel = 301,
		maxlevel = 350,
		multiplier = 10
	},{
		minlevel = 351,
		maxlevel = 400,
		multiplier = 8
	},{
		minlevel = 401,
		maxlevel = 450,
		multiplier = 6			
	},{
		minlevel = 450,
		multiplier = 5	
		},
}

skillsStages = {
	{
		minlevel = 2,
		maxlevel = 80,
		multiplier = 30
	}, {
		minlevel = 81,
		maxlevel = 90,
		multiplier = 15
	}, {
		minlevel = 91,
		maxlevel = 100,
		multiplier = 5
	}, {
		minlevel = 101,
		maxlevel = 125,
		multiplier = 3
	}, {
		minlevel = 126,
		multiplier = 1
	},
}

magicLevelStages = {
	{
		minlevel = 2,
		maxlevel = 70,
		multiplier = 20
	}, {
		minlevel = 71,
		maxlevel = 90,
		multiplier = 15
	}, {
		minlevel = 91,
		maxlevel = 100,
		multiplier = 10
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 2
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 1.5
	}, {
		minlevel = 126,
		multiplier = 1
	},
}