# Write your MySQL query statement below

select passenger_id,
    if(
        rank() over(partition by flight_id order by booking_time) <= capacity,
        'Confirmed',
        'Waitlist'
    ) as Status
    from Passengers
    left join Flights using (flight_id)
    order by passenger_id