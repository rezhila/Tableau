/*

  Queries used for Tableau Project

*/

--1

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is not null
--Group By date
Order By 1,2

--Just a double check based off the data provided


--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
 --From PortfolioProject..CovidDeaths
--Where location like '%states%'
--Where location  = 'World'
--Group By date
--Order By 1,2


--2

--We take these out as they are not included above queries and want to stay consistent
--European Union is part of Europe

Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null
and location not in ('World', 'European Union', 'International')
Group By location
Order By TotalDeathCount desc


--3

Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group By Location, population 
Order By PercentPopulationInfected desc


--4

Select Location, Population, date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group By Location, population, date
Order By PercentPopulationInfected desc

