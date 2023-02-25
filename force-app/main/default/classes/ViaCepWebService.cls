public with sharing class ViaCepWebService {
    @AuraEnabled
    public static string handleCallout(String cep) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://viacep.com.br/ws/' + cep.replaceAll('[^a-zA-Z0-9\\s+]', '') + '/json/');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);

        try {
            Http h = new Http();
            HttpResponse res = h.send(req);
            system.debug(res.getBody());

            if (res.getStatusCode() == 200) {
                return 'sucesso';
            }
        } catch (Exception e) {
            system.debug('erro' + e.getMessage());
            return 'erro';
        }

        return null;
    }
}