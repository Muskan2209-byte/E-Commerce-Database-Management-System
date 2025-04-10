use OnlineShopping


select TOP 3 Name,Contact,Email,Total_bad_ratings
from Vendor
inner join(
select VendorID,COUNT(rating) as Total_bad_ratings
from VendorProduct
inner join(
select Rating,Comment,OrderedProduct.VendorProductID
from OrderedProduct
inner join(
select Rating,Comment,OrderedProductID
from Review
where Rating<3) r on r.OrderedProductID=OrderedProduct.OrderedProductID) 
vr on vr.VendorProductID=VendorProduct.VendorProductID group by VendorID)
vrt on vrt.VendorID=Vendor.VendorID
Order by Total_bad_ratings desc
