--select total profit for each service for all years
select 
{crossjoin([Measures].[Total Profit],[Date].[Year].children) } on columns,
{[Service].[Service Name].members} on rows
from [TDWH]

--number of subs. for each service for all years
select 
{crossjoin( [Measures].[Number Of Subscribes] , [Service].[Service Name].members)} on columns,
{[Date].[Hierarchy].[Year]} on rows
from  [TDWH]


--number of subs. for each service for each city
select 
{crossjoin( [Measures].[Number Of Subscribes] , [Service].[Service Name].members)} on columns,
{ [Location].[Area Name].members} on rows
from  [TDWH]


--get total profit for each contract type in 2003 in giza
select 
{crossjoin([Measures].[Total Profit],[Contract].[Type].members)} on columns,
{[Date].[Hierarchy].[Year].&[2003].children } on rows
from [TDWH]
where ([Location].[Area Name].&[giza])


--get number of subs. for each city for each contract type
select 
{crossjoin([Measures].[Number Of Subscribes],[Location].[Area Name].members)} on columns,
{[Contract].[Type].members } on rows
from [TDWH]

--number of subs. for each service for 2002
select 
{crossjoin( [Measures].[Number Of Subscribes] , [Service].[Service Name].members)} on columns,
{ [Location].[Area Name].members} on rows
from  [TDWH]
where [Date].[Year].&[2002]
