select contract.contractID , subscribe.date,  customer.areaCode , subscribe.serviceID , count(subscribe.customerID) as numberOfSubscribe , 
SUM(servicePrice) as totalProfit from  subscribe
inner join customer on customer.customerID = subscribe.customerID 
inner join service on subscribe.serviceID = service.serviceID  
inner join contract on contract.contractID = customer.contractID 
group by subscribe.serviceID , areaCode , subscribe.date , contract.contractID
