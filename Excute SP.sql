declare @Status int
exec SP_PRO_CreateOrganizationOnlySPName
 '


<Organization xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <IpAddress>127.0.0.1</IpAddress>
  <CreatedBy>System</CreatedBy>
  <ModifiedBy>System</ModifiedBy>
  <CreatedWhen>2019-08-19T20:29:31.8898783+05:30</CreatedWhen>
  <ModifiedWhen>2019-08-19T20:29:31.8898783+05:30</ModifiedWhen>
  <Id>1</Id>
  <BusinessType>1</BusinessType>
  <OrganizationName>TechThrong PLC</OrganizationName>
  <MainPhone>0112458540/8</MainPhone>
  <AddressLine1>No. 13</AddressLine1>
  <AddressLine2>De Fonseka Place, Colombo 4</AddressLine2>
  <District>7</District>
  <City>8</City>
  <Email>info@techthrong.lk</Email>
  <FRPerson>Mr. Lahiru</FRPerson>
  <FRPEmail>Lahiru@techthrong.lk</FRPEmail>
  <SRPerson>Mr. Asanga Chan</SRPerson>
  <SRPEmail>Asanga@techthrong.lk</SRPEmail>
  <HandlerName>Mr. Gangadharan Murrlidhar</HandlerName>
  <HandlerEmail>Gangadharan@techthrong.lk</HandlerEmail>
  <IsSeller>false</IsSeller>
</Organization>


',@Status output 
