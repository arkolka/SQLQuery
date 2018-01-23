SELECT
	c.Name
FROM
	Customers c
WHERE
	EXISTS (
		SELECT	*
		FROM	Purchases p
		WHERE	p.CustomerId = c.CustomerId
				AND p.ProductName = 'Молоко'
	)
	AND NOT EXISTS (
		SELECT	*
		FROM	Purchases p
		WHERE	p.CustomerId = c.CustomerId
				AND p.ProductName = 'Сметана'
				AND MONTH(p.PurchaiseDatetime) = MONTH(GETDATE())
				AND YEAR(p.PurchaiseDatetime) = YEAR(GETDATE())
	)