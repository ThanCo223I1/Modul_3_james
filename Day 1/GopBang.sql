select * from OrderDeteil
join orders on OrderDeteil.oID = orders.oID 
join Product on OrderDeteil.pID = Product.pID;
