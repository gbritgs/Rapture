public inherited sharing class Collections {
    public Collections() {
        List<String> lista = new List<String>();

        lista.add('Parâmetro');
        lista.add(2, 'Parâmetro na segunda posição');

        for(String s : lista) {
            system.debug(s);
        }

        system.debug(lista.contains('Teste'));

        lista.remove(0);

        lista.size();
    }

    public void myMap() {
        Map<String,String> myMap = new Map<String,String>();

        myMap.put('chave', 'valor');

        if(myMap.containsKey('chave')) {
            system.debug('True');
        }

        System.debug(myMap.keySet());
        System.debug(myMap.values());

        myMap.remove('chave');

        System.debug(myMap.values());
    }
}