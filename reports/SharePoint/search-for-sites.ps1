$tokenRequest = Invoke-WebRequest -Method Post -Uri $uri -ContentType "application/x-www-form-urlencoded" -Body $body -UseBasicParsing
$token = ($tokenRequest.Content | ConvertFrom-Json).access_token
$headers = @{Authorization = "Bearer $token" }

$query = "test"
$query = "*"
$sort = '&$orderby=createdDateTime'
$requestURI = "https://graph.microsoft.com/v1.0/sites?search=" + $query + $sort
$result = (Invoke-RestMethod -Uri $requestURI -Headers $Headers -Method Get -ContentType "application/json") 
$result.value.Count
$result.value | ft -a
 