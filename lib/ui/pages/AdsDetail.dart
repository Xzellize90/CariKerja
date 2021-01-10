part of 'pageA.dart';

class AdsDetail extends StatefulWidget {
  AdsDetail({this.ads});
  final AdsList ads;

  @override
  _AdsDetailState createState() => _AdsDetailState();
}

class _AdsDetailState extends State<AdsDetail> {
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerLink;

  var ctrlName = TextEditingController();
  var ctrlPrice = TextEditingController();
  var ctrlLink = TextEditingController();
  var ctrlId = TextEditingController();

  bool isLoading;

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      imageFile = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ads Detail"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
            color: Colors.orange
              ),
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                        child: Image.network(
                      widget.ads.image,
                      scale: 4,
                    )),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                    child: Text(widget.ads.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'saira',
                            fontSize: 24)),
                  )),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                    child: Text(widget.ads.description,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'saira',
                            fontSize: 18)),
                  )),
                    SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: ctrlPrice = TextEditingController(
                          text: widget.ads.link, ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.add_box_rounded),
                        labelText: 'Go to this link for more information',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 250),
                  ],
                )
              ],
            ),
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(size: 50, color: Colors.blue),
                )
              : Container(),
        ],
      ),
    );
  }
}
