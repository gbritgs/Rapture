public with sharing class SavepointDML {
    public SavepointDML() {
        Account acc = new Account();
        acc.Name = 'Guilherme';
        //Cria um savepoint no código para evitar a quebra da aplicação
        Savepoint sp = Database.setSavepoint();
        try {
            //insert acc;
            integer i = 1/0; //Forçar catch
            system.debug('Conta inserida!');
        } catch (Exception e) {
            system.debug('Rollback: ' + e);
            //Database.rollback(sp);
            //throw new SavepointException('Erro exception customizado');
        }
    }

    public class SavepointException extends Exception {}
}