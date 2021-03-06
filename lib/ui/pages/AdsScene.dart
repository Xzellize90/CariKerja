part of 'pageA.dart';

class AdsScene extends StatefulWidget {
  @override
  _AdsSceneState createState() => _AdsSceneState();
}

class _AdsSceneState extends State<AdsScene> {
  CollectionReference adsCollection =
      FirebaseFirestore.instance.collection("adss");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADS", style: TextStyle(color: Colors.red, fontSize: 32),),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: Container(),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.orange,
            child: StreamBuilder<QuerySnapshot>(
                stream: adsCollection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Failed to get ads info!");
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SpinKitFadingCircle(
                      size: 50,
                      color: Colors.cyan,
                    );
                  }
                  return ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot doc) {
                      return AdsCard(
                        ads: AdsList(doc.data()['id'], doc.data()['name'],
                            doc.data()['description'], doc.data()['link'], doc.data()['image']),
                      );
                    }).toList(),
                  );
                }),
          ),
          
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
            return MainMenu();
          }));
        },
        child: Icon(Icons.close),
        backgroundColor: Colors.red,
      ),
    );
  }
}