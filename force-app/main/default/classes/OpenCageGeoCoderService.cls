public with sharing class OpenCageGeoCoderService {

    //latitude=52.5432379; longitude=13.4142133;
    public static void reverseGeoCoding(String latitude, String longitude, String key){
        HttpRequest httpReq = new HttpRequest();
        // provide your own api key
        httpReq.setEndpoint('https://api.opencagedata.com/geocode/v1/json?q='+latitude+'%2C+'+longitude+'&key='+key);
        httpReq.setMethod('GET');
        httpReq.setHeader('Content-Type', 'application/json');
        httpReq.setHeader('Accept', 'application/json');

        HTTP http = new HTTP();
        try{
            HTTPResponse response = http.send(httpReq);
            System.debug(response.getBody());

            if(response != Null){
                String responseBody = response.getBody();
                System.debug('responseBody== '+responseBody);

                Integer statusCode = response.getStatusCode();
                System.debug('statusCode== '+statusCode);

                String status = response.getStatus();
                System.debug('status== '+status);
            }
        }
        catch(System.CalloutException ex){
            System.debug('CalloutException== '+ex.getMessage());
        }    
        catch(System.Exception ex){
            System.debug('Exception== '+ex.getMessage());
        }
    }
}