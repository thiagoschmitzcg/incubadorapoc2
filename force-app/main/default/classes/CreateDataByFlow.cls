public with sharing class CreateDataByFlow {
    @InvocableMethod(label = 'Create Example Data' description = 'Insert Example Records')
    public static void run(){
        List<User_AirBnb__c> UserAirBnbList = new List<User_AirBnb__c>();
    UserAirBnbList.add(
      new User_AirBnb__c(
        Name = 'Thiago',
        Last_Name__c = 'Schmitz',
        Phone__c = '2583539234',
        isOwner__c = 'Not Owner',
        Adress__latitude__s = -38.942282,
        Adress__longitude__s = -68.103731
      )
    );
    UserAirBnbList.add(
      new User_AirBnb__c(
        Name = 'Agustin',
        Last_Name__c = 'Pfeiffer',
        Phone__c = '3452342422',
        isOwner__c = 'Is Owner',
        Adress__latitude__s = -31.384724,
        Adress__longitude__s = -64.201224
      )
    );
    UserAirBnbList.add(
      new User_AirBnb__c(
        Name = 'Jose M.',
        Last_Name__c = 'Cuenca',
        Phone__c = '6436346346',
        isOwner__c = 'Not Owner',
        Adress__latitude__s = -34.587570,
        Adress__longitude__s = -60.967293
      )
    );
    UserAirBnbList.add(
      new User_AirBnb__c(
        Name = 'Nico',
        Last_Name__c = 'Linares',
        Phone__c = '3452345345',
        isOwner__c = 'Not Owner',
        Adress__latitude__s = -38.715680,
        Adress__longitude__s = -62.283246
      )
    );
    UserAirBnbList.add(
      new User_AirBnb__c(
        Name = 'Ciro',
        Last_Name__c = 'Bogari',
        Phone__c = '6546434555',
        isOwner__c = 'Is Owner',
        Adress__latitude__s = -40.985190,
        Adress__longitude__s = -70.724369
      )
    );

    insert UserAirBnbList;

    // Create 2 Possibles dates to rental a property
    List<Possible_Dates__c> PossibleDatesList = new List<Possible_Dates__c>();
    // 6 noches en Florianópolis
    PossibleDatesList.add(
      new Possible_Dates__c(
        Start_Date__c = date.parse('08/01/2022'),
        End_Date__c = date.parse('08/25/2022')
      )
    );
    PossibleDatesList.add(
      new Possible_Dates__c(
        Start_Date__c = date.parse('09/05/2022'),
        End_Date__c = date.parse('09/30/2022')
      )
    );

    insert PossibleDatesList;

    // I create 2 Playlist for each Listener ---> Total 6PL
    List<Property__c> propertyList = new List<Property__c>();
    // 6 noches en Florianópolis
    propertyList.add(
      new Property__c(
        Name = 'Cabaña de Montaña- Al lado del Rio- Sierras',
        Adress__latitude__s = -31.617275,
        Adress__longitude__s = -65.070828,
        Description__c = 'Un espacio único para descansar y desconectarse.',
        Price_x_night__c = 3500,
        User_AirBnb__c = UserAirBnbList[1].id,
        Total_Bathrooms__c = 2,
        Total_Ocu__c = 4,
        Total_Rooms__c = 2
      )
    );

    propertyList.add(
      new Property__c(
        Name = 'BAM | DEPTO LAS VICTORIAS',
        Adress__latitude__s = -41.191542,
        Adress__longitude__s = -71.178931,
        Description__c = 'Departamento en complejo residencial entero. Relájate con toda la familia en este alojamiento donde la tranquilidad se respira.',
        Price_x_night__c = 6800,
        User_AirBnb__c = UserAirBnbList[4].id,
        Total_Bathrooms__c = 3,
        Total_Ocu__c = 8,
        Total_Rooms__c = 4
      )
    );

    insert propertyList;

    List<Booking__c> BookingList = new List<Booking__c>();
    // 6 noches en Florianópolis
    BookingList.add(
      new Booking__c(
        Propierty__c = propertyList[0].id,
        User_AirBnb__c = UserAirBnbList[0].id,
        Start_Date__c = date.parse('08/10/2022'),
        End_Date__c = date.parse('08/23/2022'),
        Travelers__c = 3
      )
    );
    BookingList.add(
      new Booking__c(
        Propierty__c = propertyList[1].id,
        User_AirBnb__c = UserAirBnbList[3].id,
        Start_Date__c = date.parse('09/05/2022'),
        End_Date__c = date.parse('09/21/2022'),
        Travelers__c = 3
      )
    );
    insert BookingList;

    List<Review__c> ReviewList = new List<Review__c>();
    // 6 noches en Florianópolis
    ReviewList.add(
      new Review__c(
        Booking__c = BookingList[0].id,
        Propierty__c = BookingList[0].Propierty__c,
        Description__c = 'La casa tiene un encanto natural , Se disfruta en el exterior como interior. Tiene todo lo necesario para una estadía de desconexión. Un parque hermoso y una orientación ideal para el sol en pleno bosque.',
        Points__c = 8
      )
    );

    insert ReviewList;
    }
}