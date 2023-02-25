@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'Brazil';
        List<String> parks = new List<String>{'Yosemite', 'Sequoia', 'Crater Lake'};
        System.assertEquals(parks, ParkLocator.country(country));
    }
}