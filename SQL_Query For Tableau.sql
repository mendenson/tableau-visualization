/*

Queries used for Tableau Project

*/

-- 1.

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From PortifolioProject..CovidDeaths
where continent is not null
order by 1,2

-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International" 

--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))*100 as DeathPercentage
--From PortifolioProject..CovidDeaths
--Where location = "World"
--order by 1,2

-- 2.

-- We take these out as they are not included in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortifolioProject..CovidDeaths
Where continent is null
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc

-- 3.

Select Location, Population, SUM(new_cases) as HighestInfectionCount, (SUM(new_cases)/Population)*100 as PercentPopulationInfected
From PortifolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc

-- 4.

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortifolioProject..CovidDeaths
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc
