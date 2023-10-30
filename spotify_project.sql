SELECT *
FROM spotify_project..spotify_2023

-- Most Streamed songs on Spotify 

SELECT DISTINCT TOP 10 track_name, artist_name, streams
FROM spotify_project..spotify_2023
ORDER BY 3 DESC


-- Major vs Minor 

SELECT mode, CAST(AVG(streams) AS INT) AS average_total_streams
FROM spotify_project..spotify_2023
WHERE mode IN ('Major', 'Minor')
GROUP BY mode


-- Comparing sum of streams for each era

SELECT 
	CASE
		WHEN released_year BETWEEN 1930 AND 1939 THEN '1930s'
		WHEN released_year BETWEEN 1940 AND 1949 THEN '1940s'
		WHEN released_year BETWEEN 1950 AND 1959 THEN '1950s'
		WHEN released_year BETWEEN 1960 AND 1969 THEN '1960s'
		WHEN released_year BETWEEN 1970 AND 1979 THEN '1970s'
		WHEN released_year BETWEEN 1980 AND 1989 THEN '1980s'
		WHEN released_year BETWEEN 1990 AND 1999 THEN '1990s'
		WHEN released_year BETWEEN 2000 AND 2009 THEN '2000s'
		WHEN released_year BETWEEN 2010 AND 2019 THEN '2010s'
		WHEN released_year BETWEEN 2020 AND 2025 THEN '2020s' 
		ELSE 'Other'
	END AS era,
	CAST(AVG(streams) AS INT) AS average_streams
FROM spotify_project..spotify_2023
GROUP BY 
	CASE
		WHEN released_year BETWEEN 1930 AND 1939 THEN '1930s'
		WHEN released_year BETWEEN 1940 AND 1949 THEN '1940s'
		WHEN released_year BETWEEN 1950 AND 1959 THEN '1950s'
		WHEN released_year BETWEEN 1960 AND 1969 THEN '1960s'
		WHEN released_year BETWEEN 1970 AND 1979 THEN '1970s'
		WHEN released_year BETWEEN 1980 AND 1989 THEN '1980s'
		WHEN released_year BETWEEN 1990 AND 1999 THEN '1990s'
		WHEN released_year BETWEEN 2000 AND 2009 THEN '2000s'
		WHEN released_year BETWEEN 2010 AND 2019 THEN '2010s'
		WHEN released_year BETWEEN 2020 AND 2025 THEN '2020s' 
		ELSE 'Other'
	END
ORDER BY era
--ORDER BY average_streams DESC

-- Comparing BPM Ranges 

/* Prestissimo (>200 bpm), presto (168-200 bpm), allegro (120-168 bpm), moderato (108-120 bpm),
andante (76-108 bpm), adagio (66-76 bpm), larghetto (60-66 bpm), and largo (40-60 bpm) */

SELECT 
CASE
		WHEN bpm BETWEEN 201 AND 300 THEN 'prestissimo (>200 bpm)'
		WHEN bpm BETWEEN 169 AND 200 THEN 'presto (168-200 bpm)'
		WHEN bpm BETWEEN 121 AND 168 THEN 'allegro (120-168 bpm)'
		WHEN bpm BETWEEN 109 AND 120 THEN 'moderato (108-120 bpm)'
		WHEN bpm BETWEEN 77 AND 108 THEN 'andante (76-108 bpm)'
		WHEN bpm BETWEEN 67 AND 76 THEN 'adagio (66-76 bpm)'
		WHEN bpm BETWEEN 61 AND 66 THEN 'larghetto (60-66 bpm)'
		WHEN bpm BETWEEN 40 AND 60 THEN 'largo (40-60 bpm)'
		ELSE 'Other'
	END AS bpm_ranges,
	CAST(AVG(streams) AS INT) AS average_streams
FROM spotify_project..spotify_2023
GROUP BY 
	CASE
		WHEN bpm BETWEEN 201 AND 300 THEN 'prestissimo (>200 bpm)'
		WHEN bpm BETWEEN 169 AND 200 THEN 'presto (168-200 bpm)'
		WHEN bpm BETWEEN 121 AND 168 THEN 'allegro (120-168 bpm)'
		WHEN bpm BETWEEN 109 AND 120 THEN 'moderato (108-120 bpm)'
		WHEN bpm BETWEEN 77 AND 108 THEN 'andante (76-108 bpm)'
		WHEN bpm BETWEEN 67 AND 76 THEN 'adagio (66-76 bpm)'
		WHEN bpm BETWEEN 61 AND 66 THEN 'larghetto (60-66 bpm)'
		WHEN bpm BETWEEN 40 AND 60 THEN 'largo (40-60 bpm)'
		ELSE 'Other'
	END
ORDER BY average_streams DESC

-- Average number of streams for Single vs Multiple Artist 

SELECT
    CASE
        WHEN artist_count = 1 THEN 'Single Artist'
        ELSE 'Multiple Artists'
    END AS artist_type,
    CAST(AVG(streams) AS INT) AS average_streams
FROM spotify_project..spotify_2023
GROUP BY 
	 CASE
        WHEN artist_count = 1 THEN 'Single Artist'
        ELSE 'Multiple Artists'
    END
ORDER BY artist_type DESC


