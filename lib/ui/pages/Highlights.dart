part of 'pageC.dart';

class Highlights extends StatefulWidget {
  Highlights({this.joblist});
  final Joblist joblist;

  @override
  _HighlightsState createState() => _HighlightsState();
}

class _HighlightsState extends State<Highlights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 45),
            child: Text("Highlights",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'saira', fontSize: 48)),
          ),
          Container(
            width: 400,
            height: 500,
            margin: EdgeInsets.only(left: 25, right: 25),
            child: ListView(
              children: [
                SizedBox(height: 10),
                Text(
                  "Fitur Highlight ini berfungsi untuk menampilkan iklan lowongan kerja anda di bagian teratas, sehingga dapat meningkatkan kemungkinan mendapatkan pekerja lebih cepat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "paket Highlight:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "- Rp. 15.000 untuk 3 hari Highlight",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "- Rp. 85.000 untuk 7 hari Highlight",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "- Rp. 85.000 untuk 30 hari Highlight",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Transfer ke BCA (ATP_Customer): 7055529888 A/N SATRIO BUDIHARJO YAURI",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Note: kirimkan bukti transfer melalui email dan sertakan pula highlight code yang anda berikan.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Produk anda akan ter-highlight dalam durasi 2 jam setelah email bukti transfer dikirimkan (jam kerja sampai 16:00 WIB),                  segala highlight yang lewat dari jam 16:00 akan mulai di proses di keesokan hari.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
