SELECT *,
(sale_price::bigint - AVG(sale_price::bigint) OVER())/stddev(sale_price::bigint) OVER () AS “sale_price_zscore”,
    CASE 
        WHEN stddev(sale_price::bigint) OVER (PARTITION BY neighborhood, building_class_at_time_of_sale) = 0 THEN NULL
        ELSE (sale_price::bigint - AVG(sale_price::bigint) OVER (PARTITION BY neighborhood, building_class_at_time_of_sale) ) / 
            stddev(sale_price::bigint) OVER (PARTITION BY neighborhood, building_class_at_time_of_sale)
    END AS sale_price_zscore_neighborhood,
	CASE
		WHEN total_units::bigint= 0 THEN NULL
		ELSE gross_square_feet::bigint/total_units::bigint END AS square_ft_per_unit,
	CASE
		WHEN total_units::bigint= 0 THEN NULL
		ELSE sale_price::bigint/total_units::bigint END AS price_per_unit
		FROM stone1	
















