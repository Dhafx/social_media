class DatabaseController extends ClientController{ 
  Databases? databases;

  @override
  void onInit(){
    super.onInit();

    //appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async{
    try{
      final result = await databases!.createDocument(
        databaseId:"Your_database_ID",
        documentId: ID.unique(),
        collectionId:"YOUR_COLLECTION_ID",
        data: map,
        permissions: [
          Permission.read(Role.user("USERID")),
          Permission.update(Role.user("USERID")),
          Permission.delete(Role.user("USERID")),
        ],
      );

      print("DatabaseController:: storeUserName $database");
    }

    cach(error){
      Get.defaultDialog(
        title:"Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$Error",
          style: Get.cocntext?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),

        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}