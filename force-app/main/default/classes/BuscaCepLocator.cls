public class BuscaCepLocator {
    public static void country() {
        string CEP = '03640010';
        ListarCepService.SapCEPSoap prkSvc = new ListarCepService.SapCEPSoap();
        ListarCepService.CEPInfo result = prkSvc.ListarCEP(CEP);
        System.debug(result);
    }
}