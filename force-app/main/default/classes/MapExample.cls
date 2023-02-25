public class MapExample {
    public static void cats(){
        Map<string,string> myCats = new Map<string,string>();
        myCats.put('Salem', 'Cinza');
        myCats.put('Mingau', 'Branco');
        myCats.put('Garfield', 'Laranja');
        
        system.debug('Teste: ' + myCats);
        
        string color = myCats.get('Salem');
        
        system.debug('My cat is ' + color);
        
        for(string iCats :myCats.keySet()){
            string colorGarfield = myCats.get('Garfield');
            string colorSalem = myCats.get('Salem');
            string colorMingau = myCats.get('Mingau');
            
            system.debug('Key: ' + iCats + ', Value: ' + myCats.get(iCats));
            system.debug('A cor do gato é: ' + colorGarfield);
        }
            
    }
}