select * from deliveries

UPDATE deliveries
SET 
	batting_team = CASE
            WHEN batting_team = 'Rising Pune Supergiant' OR batting_team = 'Rising Pune Supergiants' THEN 'Rising Pune Supergiant'
            WHEN batting_team = 'Royal Challengers Bangalore' OR batting_team = 'Royal Challengers Bengaluru' THEN 'Royal Challengers Bangalore'
			WHEN batting_team = 'Kings XI Punjab' OR batting_team = 'Punjab Kings' THEN 'Punjab Kings'
            WHEN batting_team = 'Delhi Daredevils' THEN 'Delhi Capitals'
            ELSE batting_team
            END,
    bowling_team = CASE
            WHEN bowling_team = 'Rising Pune Supergiant' OR bowling_team = 'Rising Pune Supergiants' THEN 'Rising Pune Supergiant'
            WHEN bowling_team = 'Royal Challengers Bangalore' OR bowling_team = 'Royal Challengers Bengaluru' THEN 'Royal Challengers Bangalore'
			WHEN batting_team = 'Kings XI Punjab' OR batting_team = 'Punjab Kings' THEN 'Punjab Kings'
            WHEN bowling_team = 'Delhi Daredevils' THEN 'Delhi Capitals'
            ELSE bowling_team
            END;




-- ==============
-- Player Analysis:
-- ==============
-- Who are the top run-scorers in IPL history?

select batter, sum(deliveries.batsman_runs) as runs from 
deliveries
GROUP by batter
order by runs desc
limit 5;
-- ========================================================
-- Who are the most economical bowlers?
select bowler,sum(total_runs) as runs_conc,
round(count(*)/6.0,2) as overs,round(sum(total_runs)/(count(*)/6.0),3) as eco
from deliveries 
group by bowler
having count(*)/6.0>100
order by eco
limit 10;
-- ========================================================
-- Which bowlers represented the most?
with innings as 
(
select distinct match_id, bowler
from deliveries  
)
select bowler, count(*) as innings
from innings
group by bowler
order by innings DESC;
-- ========================================================
-- Which batter represented the most?
with innings as 
(
select distinct match_id, batter
from deliveries  
)
select batter, count(*) as innings
from innings
group by batter
order by innings DESC;

-- ========================================================
select distinct dismissal_kind from deliveries;

-- Who are the top wicket-takers?

select bowler,
count(is_wicket) filter(
							where dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped')
						) as total_wickets
from deliveries
group by bowler
order by total_wickets desc;

-- what is their most frequent dismissal type?
with dismiss_cnt AS
(
	select bowler,dismissal_kind, count(*) as frequency
	from deliveries
	where dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped')
	group by bowler,dismissal_kind
),
ranked_dismissal as
(
	select *, 
	dense_rank() over(partition by bowler order by frequency desc) as drnk
	from dismiss_cnt
	order by frequency desc
)
select bowler,dismissal_kind,frequency from ranked_dismissal
where drnk =1;

-- Combine both the top wicket-takers, and their most frequent dismissal type?
with dismiss_cnt AS
(
	select bowler,dismissal_kind, count(*) as frequency
	from deliveries
	where dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped')
	group by bowler,dismissal_kind
),
ranked_dismissal as
(
	select *, 
	dense_rank() over(partition by bowler order by frequency desc) as dismiss_rnk
	from dismiss_cnt
	order by frequency desc
)
select d.bowler,
count(d.is_wicket) filter(
							where d.dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped')
						) as total_wickets,
r.dismissal_kind as frequent_dismiss_kind
from deliveries d join ranked_dismissal r on 
r.bowler=d.bowler
where dismiss_rnk = 1
group by d.bowler,r.dismissal_kind
order by total_wickets desc;


-- What are the strike rates of batsmen across various overs (e.g., Powerplay, middle overs, death overs)?

SELECT batter, 
       CASE 
           WHEN over BETWEEN 1 AND 6 THEN 'Powerplay'
           WHEN over BETWEEN 7 AND 15 THEN 'Middle Overs'
           ELSE 'Death Overs'
       END AS phase,
       SUM(batsman_runs) * 100.0 / COUNT(*) AS strike_rate
FROM deliveries
GROUP BY batter, phase
having count(batter)>500
ORDER BY strike_rate desc;


-- Batsmen with highest strike rates in each across each phase
with phases as 
(
SELECT batter, 
       CASE 
           WHEN over BETWEEN 1 AND 6 THEN 'Powerplay'
           WHEN over BETWEEN 7 AND 15 THEN 'Middle Overs'
           ELSE 'Death Overs'
       END AS phase,
       SUM(batsman_runs) * 100.0 / COUNT(*) AS strike_rate
FROM deliveries
GROUP BY batter, phase
having count(batter)>500
ORDER BY strike_rate desc
),
phase_rnk as 
(
select *,
rank() over(partition by  phase order by strike_rate desc) as phase_rnk
from phases
order by strike_rate desc
)
select batter,phase,round(strike_rate,2) as strike_rate
from phase_rnk
where phase_rnk =1;



-- Team Analysis:🏏

-- How each teams scored in each phase?
SELECT batting_team, 
       CASE 
           WHEN over BETWEEN 1 AND 6 THEN 'Powerplay'
           WHEN over BETWEEN 7 AND 15 THEN 'Middle Overs'
           ELSE 'Death Overs'
       END AS phase,
       SUM(total_runs) AS total_runs
FROM deliveries
GROUP BY batting_team, phase
ORDER BY batting_team,phase,total_runs desc;

-- which team scored most in each phase

with phases_team as 
(
SELECT batting_team, 
       CASE 
           WHEN over BETWEEN 1 AND 6 THEN 'Powerplay'
           WHEN over BETWEEN 7 AND 15 THEN 'Middle Overs'
           ELSE 'Death Overs'
       END AS phase,
       SUM(total_runs) AS total_runs
FROM deliveries
GROUP BY batting_team, phase
ORDER BY batting_team desc
),
phase_rnk_team as 
(
select *,
rank() over(partition by  phase order by total_runs desc) as phase_rnk_team
from phases_team
order by total_runs desc
)
select batting_team,phase,round(total_runs,2) as total_runs
from phase_rnk_team
where phase_rnk_team =1;


-- What is the frequency of extras conceded by each team?

select bowling_team,extras_type, count(extra_runs) as frequency
from deliveries
where extras_type is not null
group by bowling_team,extras_type
order by extras_type,frequency desc;



-- Innings wise runs accross teams
select batting_team,
sum(total_runs) as total_runs,
sum(total_runs) filter(where inning=1) as first_innings_runs,
sum(total_runs) filter(where inning=2) as second_innings_runs
from deliveries
group by batting_team
order by total_runs desc;


-- Which team has the highest success rate chasing targets?
with innings_runs as 
(
	select match_id,inning, batting_team,
	sum(total_runs) as total_runs
	from deliveries
	group by match_id,inning, batting_team
	order by match_id,inning
),
rnk as (
select *,
rank() over(partition by match_id order by total_runs DESC) as rnk
from innings_runs
),
second_inning_wins as
(
select batting_team,
count(batting_team) filter(where rnk=1 and inning =2)  as second_inning_wins
from rnk 
group by batting_team
order by second_inning_wins desc
)
-- total_matches as
-- (
-- select batting_team, count(distinct match_id) as total_matches
-- from deliveries 
-- group by batting_team
-- order by total_matches desc
-- )
select * from second_inning_wins
;


-- Which players have the most impactful performances in playoff matches?
-- Filter match_id for playoff matches and aggregate runs, wickets, and dismissals.


select * from deliveries
order by match_id,inning,over,ball;

