SELECT
    start_vertex,
    SUM(total_distance) AS sum_of_total_distances
FROM processing_result
GROUP BY start_vertex
ORDER BY sum_of_total_distances DESC;