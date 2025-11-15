public with sharing class PS_CurrencyAPIService {
    public static void getExchangeRate(){
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint('https://api.exchangerate-api.com/v4/latest/USD');
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