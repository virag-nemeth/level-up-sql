-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

Select
  C.FirstName,
  C.LastName,
  Count(O.OrderID) AS OrderCount,
  C.Email
FROM Orders AS O
JOIN Customers AS C ON O.CustomerID = C.CustomerID
group BY O.CustomerID
Order by OrderCount DESC
Limit 6;