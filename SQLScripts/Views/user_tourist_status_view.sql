CREATE OR REPLACE VIEW user_tourist_status AS
    SELECT
        "user".first_name,
        "user".last_name,
        SUM(processing_result.total_distance) AS sum_of_distances,
        CASE
            WHEN SUM(processing_result.total_distance) < 1000 THEN 'Beginner'
            WHEN SUM(processing_result.total_distance) >= 1000
                     AND SUM(processing_result.total_distance) <= 10000 THEN 'Intermediate'
            ELSE 'Master'
        END AS tourist_status
    FROM "user"
    JOIN graph ON "user".user_id = graph.user_id
    JOIN processing_result ON graph.graph_id = processing_result.graph_id
    GROUP BY "user".first_name, "user".last_name
    ORDER BY sum_of_distances DESC;

SELECT * FROM user_tourist_status;