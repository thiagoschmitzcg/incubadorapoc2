@IsTest
public with sharing class BookingTriggerTest {

    @isTest static void testSuccessInsertBooking(){
        CreateDataByFlow.run();
        List<Property__c> propertyList = [SELECT id FROM Property__C];
        List<User_AirBnb__c> UserAirBnbList = [SELECT id FROM User_AirBnb__c];

        Test.startTest();
        insert new Booking__c(Propierty__c = propertyList[0].Id, User_AirBnb__c = UserAirBnbList[0].Id);
        List<Booking__c> bookingList = [SELECT Id FROM Booking__C];
        System.assertEquals(3, bookingList.size());
        Test.stopTest();
    }

    @isTest static void testFailInsertBooking(){
        CreateDataByFlow.run();
        List<Property__c> propertyList = [SELECT id FROM Property__C];
        List<User_AirBnb__c> UserAirBnbList = [SELECT id FROM User_AirBnb__c];
        List<Booking__c> bookingList = new List<Booking__c>();
        bookingList.add(new Booking__c(Propierty__c = propertyList[0].Id, User_AirBnb__c = UserAirBnbList[1].Id));

        Test.startTest();
        Database.SaveResult[] bookingInserResult = Database.insert(bookingList, false);
        Test.stopTest();

        Integer succesfull = 0;
        Integer failed = 0;

        for(Database.SaveResult result :bookingInserResult){
            if(result.isSuccess()){
                succesfull++;
            }else{
                failed++;
            }
        }
        System.assertEquals(1, failed);
    }
    
    
    @isTest static void testCreateDataByFlow (){
    CreateDataByFlow.run();
    List<User_AirBnb__c> UserAirBnbList = [SELECT id, name FROM User_AirBnb__c];
    List<Possible_Dates__c> PossibleDatesList = [SELECT id, name FROM Possible_Dates__c];
    List<Property__c> propertyList = [SELECT id, name FROM Property__c]; 
    List<Booking__c> BookingList = [SELECT id, name FROM Booking__c];
    List<Review__c> ReviewList = [SELECT id, name FROM Review__c];


    System.assertEquals(5,UserAirBnbList.size());
    System.assertEquals(2,PossibleDatesList.size());
    System.assertEquals(2,propertyList.size());
    System.assertEquals(2,BookingList.size());
    System.assertEquals(1,ReviewList.size());
  }
}