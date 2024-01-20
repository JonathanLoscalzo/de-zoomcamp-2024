# QUESTION 3
select
	count(*)
from
	green_taxi_trips gtt
where
	cast(gtt.lpep_dropoff_datetime as DATE) = cast('2019-09-18' as DATE)
	and cast(gtt.lpep_pickup_datetime as DATE) = cast('2019-09-18' as DATE);

# question 4
select cast(gtt.lpep_pickup_datetime as DATE), MAX(gtt.trip_distance)
from green_taxi_trips gtt 
group by cast(gtt.lpep_pickup_datetime as DATE), gtt.trip_distance
order by gtt.trip_distance desc


# QUESTION 5
select  t."Borough"  , count(t."Borough")
from green_taxi_trips gtt 
left join taxi t on t."LocationID" = gtt."PULocationID"
where cast(gtt.lpep_pickup_datetime as DATE) = cast('2019-09-18' as DATE)
group by  t."Borough" 
order by count( t."Borough"  ) desc;


#QUESTION 6
select gtt."DOLocationID", t."Borough", t."Zone"
from green_taxi_trips gtt 
inner join taxi t on t."LocationID" = gtt."DOLocationID"
where gtt."PULocationID" = 7
order by gtt.tip_amount  desc