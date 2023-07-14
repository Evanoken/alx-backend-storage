-- This script lists all bands with Glam rock as 
-- their main style, ranked by their longevity.

SELECT band_name, 
       IF (split is NULL,
           2022 - formed,
           split - formed) AS lifespan
FROM metal_bands
-- Where the style is Glam rock
WHERE style LIKE '%Glam rock%'
-- Order by lifespan
ORDER BY lifespan DESC;
