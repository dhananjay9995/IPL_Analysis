# IPL Data Analysis Project

## Overview
This project involves the analysis of Indian Premier League (IPL) match data spanning from 2008 to 2024. The datasets used in this project were obtained from Kaggle and include:

- **matches.csv**: Contains information on all IPL matches from 2008 to 2024, including match details like teams, venues, toss decisions, match winners, and more.
- **deliveries.csv**: Contains detailed information on each delivery bowled in every IPL match, including the batting team, bowling team, runs scored, wickets taken, and extra runs.

These datasets have been cleaned and pre-processed using SQL and Python to ensure consistency and accuracy. In this project, various analyses and insights have been derived using SQL queries, which focus on player, team, venue, and match-related statistics.

## Objectives
- To explore and answer key questions regarding IPL teams, players, and match trends.
- To gain insights into the most successful teams, key players, performance trends across phases of the game, and more.
- To build SQL queries for exploring data and deriving meaningful insights.

## Project Structure
### 1. Data Cleaning & Preprocessing:
- Standardizing venue and team names.
- Handling missing values and inconsistencies in the datasets.
- Updating team names for consistency across seasons.

### 2. SQL Analysis:
- **Team Analysis**: Identifying the most successful teams in terms of match wins, titles, and performance metrics such as win percentage and success rates in different match phases.
- **Player Analysis**: Finding the top run-scorers, wicket-takers, and the most economical bowlers.
- **Venue Analysis**: Analyzing which venues hosted the most IPL matches and the average performance at each venue.
- **Match Analysis**: Investigating how often toss winners win the match and identifying trends in match results based on toss decisions.

## Key Questions Explored:
- Which team has the most IPL wins?
- Which team has the highest win percentage?
- Who are the top run-scorers and wicket-takers in IPL history?
- Which players have the most impactful performances in playoff matches?
- How often do teams win after winning the toss?
- What is the average first-innings score at different venues?

## Setup
1. Clone the repository or download the dataset from Kaggle.
2. Import the datasets into a PostgreSQL database or any SQL-based system.
3. Execute the SQL queries provided in the `Matches.sql` and `Deliveries.sql*` file to generate insights.
4. Optional: Use Python (Pandas, Matplotlib, Seaborn) to visualize the results.

## Insights
This repository contains SQL queries designed to analyze various aspects of the IPL dataset, such as:
- **Top Performers**: Players with the most 'Player of the Match' awards and top run-scorers.
- **Team Performances**: Analysis of team wins, win percentage, and performance trends.
- **Venue Insights**: Average scores and match outcomes based on different venues.
- **Super Overs & Extras**: Number of matches decided by Super Over and the frequency of extras conceded by each team.

## Files
- **matches.csv**: IPL match data from 2008 to 2024.
- **deliveries.csv**: IPL delivery-level data from 2008 to 2024.
- **Matches.sql and Deliveries.sql**: SQL queries used for data analysis and insights generation.
- **README.md**: Project overview and instructions.

## Conclusion
This project offers a comprehensive analysis of IPL data, enabling users to derive insights into team and player performances over the years. The combination of SQL queries and data analysis techniques provides an in-depth understanding of IPL history.
