public inherited sharing class AccountTriggerHelper {
  public static void formatPhone(Account account) {
    string areaCode = account.Phone.substring(0, 2);
    string firstPart = account.Phone.substring(2, 7);
    string secondPart = account.Phone.substring(7);

    account.Phone = string.format(
      '({0}) {1}-{2}',
      new List<Object>{ areaCode, firstPart, secondPart }
    );
  }
}