-- This script ranks countries origins of bands
-- ordered by the number of fans

-- Select the origin and the number of fans
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
-- Group by origin
GROUP BY origin
-- Order by the number of fans
ORDER BY nb_fans DESC;
