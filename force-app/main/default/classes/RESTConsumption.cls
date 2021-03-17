public class RESTConsumption 
{
    public String temp{get; set;}
    
    @AuraEnabled
    public static Object openWeatherMap() 
    {
        User user = [SELECT Id, Name, City, CountryCode FROM User WHERE Id =:UserInfo.getUserId()];
        
        String apiKey = 'aab67044633a64d102aeca4770108af1';
        
        String requestEndPoint = 'http://api.openweathermap.org/data/2.5/weather?q='+user.City+','+user.CountryCode+'&appid='+apiKey;
        System.debug(requestEndPoint);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(requestEndPoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response);
        Object deserializeResponse = JSON.deserializeUntyped(response.getBody());
        Map<String, Object> respMap = (Map<String, Object>) deserializeResponse;
        Map<String, Object> newMap = (Map<String, Object>) respMap.get('main');
        System.debug(respMap.get('main'));
        return 'Hello ' + user.Name + '. The current temperature in ' + user.City +', '+user.CountryCode+ ' is ' + newMap.get('temp');
        
    }        
}