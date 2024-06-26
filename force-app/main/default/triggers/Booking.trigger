trigger Booking on Booking__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
       
        Map<Id, List<Id>> usersWithPropertiesMap = new Map<Id, List<Id>>();
        for(User_AirBnb__c user :[SELECT Id, (SELECT Id FROM Properties__r) FROM User_AirBnb__c]){
            if(user.Properties__r.size()>0){
                List<Id> idsProperties = new List<Id>();
                for(Property__c prop :user.Properties__r){
                    idsProperties.add(prop.id);
                }
                usersWithPropertiesMap.put(user.Id, idsProperties);
            }else{
                usersWithPropertiesMap.put(user.Id, new List<Id>());
            }
        }

        for(Booking__c booking :Trigger.New){
            if(usersWithPropertiesMap.get(booking.User_AirBnb__c).contains(booking.Propierty__c)){
                booking.addError('La reserva no se puede hacer a una casa que el usuario ya es Propietario');
                break;
            }
        }
    }
}