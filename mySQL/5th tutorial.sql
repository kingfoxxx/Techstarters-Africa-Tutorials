# Data Cleaning

SELECT *
from layoffs;

# 1. Remove Duplicates
# 2. Standardize the Data
# 3. Null values or blank values
# 4. Remove unwanted columns


CREATE TABLE layoffs_clean
LIKE layoffs;

SELECT *
from layoffs_clean;

INSERT layoffs_clean
SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_clean;

# CTE
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_clean
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
 
 
 SELECT *
from layoffs_clean
WHERE company = '&Open';

DELETE
FROM  duplicate_cte
WHERE row_num > 1;



CREATE TABLE `layoffs_clean2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL, 
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



SELECT *
FROM layoffs_clean2;

INSERT INTO layoffs_clean2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_clean;

DELETE 
FROM layoffs_clean2
WHERE row_num > 1;


SELECT *
FROM layoffs_clean2
WHERE row_num > 1;


# Standardizing data