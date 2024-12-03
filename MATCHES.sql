select * from matches;
select count(*) from matches;

-- =================================================================
UPDATE matches
SET venue = CASE
            WHEN venue LIKE '%M Chinnaswamy Stadium%' THEN 'M. Chinnaswamy Stadium'
            WHEN venue LIKE '%M.Chinnaswamy Stadium%' THEN 'M. Chinnaswamy Stadium'
            WHEN venue LIKE '%Vidarbha Cricket Association Stadium%' THEN 'Vidarbha Cricket Association Stadium, Jamtha'
            WHEN venue LIKE '%Maharaja Yadavindra Singh International Cricket Stadium%' THEN 'Maharaja Yadavindra Singh International Cricket Stadium, Mullanpur'
            WHEN venue LIKE '%Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium%' THEN 'Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium'
            WHEN venue LIKE '%Punjab Cricket Association Stadium%' THEN 'Punjab Cricket Association Stadium, Mohali'
            WHEN venue LIKE '%Punjab Cricket Association IS Bindra Stadium%' THEN 'Punjab Cricket Association IS Bindra Stadium, Mohali'
            WHEN venue LIKE '%Punjab Cricket Association IS Bindra Stadium, Mohali%' THEN 'Punjab Cricket Association IS Bindra Stadium, Mohali'
            WHEN venue LIKE '%Punjab Cricket Association IS Bindra Stadium, Mohali, Chandigarh%' THEN 'Punjab Cricket Association IS Bindra Stadium, Mohali'
            WHEN venue LIKE '%MA Chidambaram Stadium%' THEN 'MA Chidambaram Stadium, Chepauk'
            WHEN venue LIKE '%Wankhede Stadium%' THEN 'Wankhede Stadium'
            WHEN venue LIKE '%Dr DY Patil Sports Academy%' THEN 'Dr DY Patil Sports Academy, Mumbai'
            WHEN venue LIKE '%Newlands%' THEN 'Newlands'
            WHEN venue LIKE '%Sharjah Cricket Stadium%' THEN 'Sharjah Cricket Stadium'
            WHEN venue LIKE '%Nehru Stadium%' THEN 'Nehru Stadium'
            WHEN venue LIKE '%Rajiv Gandhi International Stadium%' THEN 'Rajiv Gandhi International Stadium, Uppal'
            WHEN venue LIKE '%Arun Jaitley Stadium%' THEN 'Arun Jaitley Stadium, Delhi'
            WHEN venue LIKE '%Kingsmead%' THEN 'Kingsmead'
            WHEN venue LIKE '%SuperSport Park%' THEN 'SuperSport Park'
            WHEN venue LIKE '%Dubai International Cricket Stadium%' THEN 'Dubai International Cricket Stadium'
            WHEN venue LIKE '%Zayed Cricket Stadium%' THEN 'Zayed Cricket Stadium, Abu Dhabi'
            WHEN venue LIKE '%Sawai Mansingh Stadium%' THEN 'Sawai Mansingh Stadium, Jaipur'
            WHEN venue LIKE '%Holkar Cricket Stadium%' THEN 'Holkar Cricket Stadium, Indore'
            WHEN venue LIKE '%Brabourne Stadium%' THEN 'Brabourne Stadium, Mumbai'
            WHEN venue LIKE '%Eden Gardens%' THEN 'Eden Gardens, Kolkata'
            WHEN venue LIKE '%Feroz Shah Kotla%' THEN 'Feroz Shah Kotla Ground'
            WHEN venue LIKE '%Narendra Modi Stadium%' THEN 'Narendra Modi Stadium, Ahmedabad'
            WHEN venue LIKE '%Saurashtra Cricket Association Stadium%' THEN 'Saurashtra Cricket Association Stadium, Rajkot'
            WHEN venue LIKE '%Maharashtra Cricket Association Stadium%' THEN 'Maharashtra Cricket Association Stadium, Pune'
            WHEN venue LIKE '%JSCA International Stadium Complex%' THEN 'JSCA International Stadium Complex, Ranchi'
            WHEN venue LIKE '%Barabati Stadium%' THEN 'Barabati Stadium'
            WHEN venue LIKE '%Barsapara Cricket Stadium%' THEN 'Barsapara Cricket Stadium, Guwahati'
            WHEN venue LIKE '%Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium%' THEN 'Bharat Ratna Shri Atal Bihari Vajpayee Ekana Cricket Stadium, Lucknow'
            WHEN venue LIKE '%Buffalo Park%' THEN 'Buffalo Park'
            WHEN venue LIKE '%De Beers Diamond Oval%' THEN 'De Beers Diamond Oval'
            WHEN venue LIKE '%Green Park%' THEN 'Green Park'
            WHEN venue LIKE '%Himachal Pradesh Cricket Association Stadium%' THEN 'Himachal Pradesh Cricket Association Stadium'
            WHEN venue LIKE '%Himachal Pradesh Cricket Association Stadium, Dharamsala%' THEN 'Himachal Pradesh Cricket Association Stadium, Dharamsala'
            WHEN venue LIKE '%Sheikh Zayed Stadium%' THEN 'Sheikh Zayed Stadium'
            WHEN venue LIKE '%Subrata Roy Sahara Stadium%' THEN 'Subrata Roy Sahara Stadium'
            WHEN venue LIKE '%Shaheed Veer Narayan Singh International Stadium%' THEN 'Shaheed Veer Narayan Singh International Stadium'
            ELSE venue
            END;


UPDATE matches
SET season = CASE
                WHEN season = '2007/08' THEN '2008'
                WHEN season = '2009/10' THEN '2010'
                WHEN season = '2020/21' THEN '2020'
                ELSE season
			END,
	team1 = CASE
            WHEN team1 = 'Rising Pune Supergiant' OR team1 = 'Rising Pune Supergiants' THEN 'Rising Pune Supergiant'
            WHEN team1 = 'Royal Challengers Bangalore' OR team1 = 'Royal Challengers Bengaluru' THEN 'Royal Challengers Bangalore'
			WHEN team1 = 'Kings XI Punjab' OR team1 = 'Punjab Kings' THEN 'Punjab Kings'
            WHEN team1 = 'Delhi Daredevils' THEN 'Delhi Capitals'
            ELSE team1
            END,
    team2 = CASE
            WHEN team2 = 'Rising Pune Supergiant' OR team2 = 'Rising Pune Supergiants' THEN 'Rising Pune Supergiant'
            WHEN team2 = 'Royal Challengers Bangalore' OR team2 = 'Royal Challengers Bengaluru' THEN 'Royal Challengers Bangalore'
			WHEN team2 = 'Kings XI Punjab' OR team2 = 'Punjab Kings' THEN 'Punjab Kings'
            WHEN team2 = 'Delhi Daredevils' THEN 'Delhi Capitals'
            ELSE team2
            END,
    winner = CASE
            WHEN winner = 'Rising Pune Supergiant' OR winner = 'Rising Pune Supergiants' THEN 'Rising Pune Supergiant'
            WHEN winner = 'Royal Challengers Bangalore' OR winner = 'Royal Challengers Bengaluru' THEN 'Royal Challengers Bangalore'
			WHEN winner = 'Kings XI Punjab' OR winner = 'Punjab Kings' THEN 'Punjab Kings'
            WHEN winner = 'Delhi Daredevils' THEN 'Delhi Capitals'
            ELSE winner
            END,
	toss_winner = CASE
            WHEN toss_winner = 'Rising Pune Supergiant' OR toss_winner = 'Rising Pune Supergiants' THEN 'Rising Pune Supergiant'
            WHEN toss_winner = 'Royal Challengers Bangalore' OR toss_winner = 'Royal Challengers Bengaluru' THEN 'Royal Challengers Bangalore'
			WHEN toss_winner = 'Kings XI Punjab' OR toss_winner = 'Punjab Kings' THEN 'Punjab Kings'
            WHEN toss_winner = 'Delhi Daredevils' THEN 'Delhi Capitals'
            ELSE toss_winner
            END;


-- Q1.1-- Which team has the most IPL wins by macthes?

SELECT winner AS team, COUNT(*) AS matches_won
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY matches_won DESC;



-- Q1.2--Which team has the most IPL wins by percentage? min 100 matches played
select winner,totalwins, totalplayed,round(totalwins*1.0/totalplayed*100.0,2) as win_percentage  from 
(select winner, count(*) as totalwins
from matches 
where winner is not null
group by winner
order by totalwins desc) w
JOIN
(select team1, count(team1) as totalplayed
from(
select team1 from matches 
union all
select team2 from matches)
group by team1
order by totalplayed desc) p
on w.winner = p.team1
where p.totalplayed>100
order by win_percentage desc;



-- Which team has the most IPL titles?

with season_matchnumbers AS
(
select season,team1,team2,winner,
row_number() over(partition by season order by date desc ) as rn 
from matches
order by season 
)
select winner, count(winner) from 
season_matchnumbers
where rn = 1
group by winner
order by count desc;


-- Which city and venue hosted the most IPL matches?

select venue,city, count(*) as matches_hosted
from matches
group by venue,city
order by matches_hosted desc
limit 5;


--How often does the toss-winning team win the match?
select 
round((sum(case
 when toss_winner = winner then 1 
 else 0
end)*1.0/count(*)*100),2) as tosstomacthwin_percentage
from matches ;
--50.59% times



--Who has won the most "Player of the Match" awards?
select player_of_match,count(*) as MOM_Awards
from matches 
group by player_of_match
order by MOM_Awards desc
limit 10;


-- Which players have performed exceptionally in playoff matches compared to league matches?

select player_of_match, count(player_of_match) as MOM
from matches
where match_type<>'League'
group by player_of_match
order by MOM desc
limit 10;

-- What is the toss decision preference (bat or field) for each team?

with opt as 
(
select toss_winner, 
count(*) filter(where toss_decision = 'bat') as bat_opt,
count(*) filter(where toss_decision = 'field') as field_opt,
count(*) as total_toss_wins
from matches 
group by toss_winner
)
select toss_winner,
case 
	when bat_opt>field_opt then 'Batting'
	else 'Fielding'
end as Toss_Decision_Preference,
case 
	when bat_opt>field_opt then round(bat_opt*1.0/total_toss_wins*100,2)
	else round(field_opt*1.0/total_toss_wins*100,2)
end as Toss_Decision_Ratio
from opt;


-- How many matches were decided in a Super Over?

select count(*) as total_superOvers from matches
where super_over = 'Y'
-- 14

-- What is the average first innings score for matches played at different venues?Atleast 50 matches
SELECT 
    venue,
    ROUND(
        CAST(AVG(target_runs) FILTER (WHERE target_overs = 20) AS NUMERIC), 
        3
    ) AS avg_runs
FROM matches
GROUP BY venue
having count(venue)>50
order by avg_runs desc;

select * from matches
order by id;

-- Venue wise WINS
SELECT venue, winner, COUNT(*) AS wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY venue, winner
ORDER BY  wins DESC
limit 10;



