public class RESTConsumption 
{
    @AuraEnabled
    public static Object openWeatherMap() 
    {
        User user = [SELECT Id, Name, City, State FROM User WHERE Id =:UserInfo.getUserId()];
        
        String apiKey = 'aab67044633a64d102aeca4770108af1';
        
        String requestEndpoint = 'http://api.openweathermap.org/data/2.5/weather?q='+user.City+'&appid='+apiKey;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndPoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response);
        
        if(response.getStatusCode() == 200) 
        {
            System.debug(response);
            Object deserializeResponse = JSON.deserializeUntyped(response.getBody());
            Map<String, Object> respMap = (Map<String, Object>) deserializeResponse;
            return 'Hello ' + user.Name + 'the current temperature is ' + respMap.get('Temp');
        }
        else {
            System.debug('Something went wrong');
        }
        return null;
    }
    
}