public with sharing class ViaCepWebService {
    @AuraEnabled
    public static ViaCep handleCallout(String cep) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://viacep.com.br/ws/' + cep.replaceAll('[^a-zA-Z0-9\\s+]', '') + '/json/');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);

        try {
            Http h = new Http();
            HttpResponse res = h.send(req);
            ViaCepWebService.ViaCep obj = (ViaCepWebService.ViaCep)JSON.deserialize(res.getBody(), ViaCepWebService.ViaCep.class);

            system.debug(res);
            system.debug(res.getBody());

            if (res.getStatusCode() == 200) {
                return obj;
            }
        } catch (Exception e) {
            system.debug('erro' + e.getMessage());
        }

        return null;
    }

    public class ViaCep {
        @AuraEnabled
        public string cep {get;set;}
        @AuraEnabled
        public string logradouro {get;set;}
        @AuraEnabled
        public string complemento {get;set;}
        @AuraEnabled
        public string bairro {get;set;}
        @AuraEnabled
        public string localidade {get;set;}
        @AuraEnabled
        public string uf {get;set;}
        @AuraEnabled 
        public string erro {get;set;}
    }
}