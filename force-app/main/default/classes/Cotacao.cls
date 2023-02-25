public with sharing class Cotacao {
    public string code;
    public string codein;
    public string name;
    public string high;
    public string low;
    public string varBid;
    public string pctChange;
    public string bid;
    public string ask;
    public string timestamp;
    public string create_date;

    public static List<Cotacao> parse(String jsonString) {
        return (List<Cotacao>) JSON.deserialize(jsonString, List<Cotacao>.class);
    }
}