<h2><a href="https://leetcode.com/problems/merge-overlapping-events-in-the-same-hall">2637. Merge Overlapping Events in the Same Hall</a></h2><h3>Hard</h3><hr><p>Table: <code>HallEvents</code></p>

<pre>
+-------------+------+
| Column Name | Type |
+-------------+------+
| hall_id     | int  |
| start_day   | date |
| end_day     | date |
+-------------+------+
This table may contain duplicates rows.
Each row of this table indicates the start day and end day of an event and the hall in which the event is held.
</pre>

<p>&nbsp;</p>

<p>Write a solution to merge all the overlapping events that are held <strong>in the same hall</strong>. Two events overlap if they have <strong>at least one day</strong> in common.</p>

<p>Return the result table <strong>in any order</strong>.</p>

<p>The&nbsp;result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> 
HallEvents table:
+---------+------------+------------+
| hall_id | start_day  | end_day    |
+---------+------------+------------+
| 1       | 2023-01-13 | 2023-01-14 |
| 1       | 2023-01-14 | 2023-01-17 |
| 1       | 2023-01-18 | 2023-01-25 |
| 2       | 2022-12-09 | 2022-12-23 |
| 2       | 2022-12-13 | 2022-12-17 |
| 3       | 2022-12-01 | 2023-01-30 |
+---------+------------+------------+
<strong>Output:</strong> 
+---------+------------+------------+
| hall_id | start_day  | end_day    |
+---------+------------+------------+
| 1       | 2023-01-13 | 2023-01-17 |
| 1       | 2023-01-18 | 2023-01-25 |
| 2       | 2022-12-09 | 2022-12-23 |
| 3       | 2022-12-01 | 2023-01-30 |
+---------+------------+------------+
<strong>Explanation:</strong> There are three halls.
Hall 1:
- The two events [&quot;2023-01-13&quot;, &quot;2023-01-14&quot;] and [&quot;2023-01-14&quot;, &quot;2023-01-17&quot;] overlap. We merge them in one event [&quot;2023-01-13&quot;, &quot;2023-01-17&quot;].
- The event [&quot;2023-01-18&quot;, &quot;2023-01-25&quot;] does not overlap with any other event, so we leave it as it is.
Hall 2:
- The two events [&quot;2022-12-09&quot;, &quot;2022-12-23&quot;] and [&quot;2022-12-13&quot;, &quot;2022-12-17&quot;] overlap. We merge them in one event [&quot;2022-12-09&quot;, &quot;2022-12-23&quot;].
Hall 3:
- The hall has only one event, so we return it. Note that we only consider the events of each hall separately.
</pre>
