--Queries for Tableau Visualizations 

-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidDeaths
--Where location like '%states%'
Where continent is null 
and location not in ('Upper middle income', 'High income','Lower middle income','Low income','World', 
					 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3.

SELECT
    Location,
    MAX(TOTAL_CASES) AS MAX_TOTAL_CASES,
    MAX(POPULATION) AS MAX_POPULATION,
    MAX((TOTAL_CASES * 100.0) / NULLIF(POPULATION, 0)) AS PERCENTPOPULATIONINFECTED
FROM
    coviddeaths
GROUP BY
    Location, population
ORDER BY
    PERCENTPOPULATIONINFECTED DESC nulls last;


-- 4.

SELECT
    Location,
	date,
    MAX(TOTAL_CASES) AS MAX_TOTAL_CASES,
    MAX(POPULATION) AS MAX_POPULATION,
    MAX((TOTAL_CASES * 100.0) / NULLIF(POPULATION, 0)) AS PERCENTPOPULATIONINFECTED
FROM
    coviddeaths
GROUP BY
    Location, population, date
ORDER BY
    PERCENTPOPULATIONINFECTED DESC nulls last;






