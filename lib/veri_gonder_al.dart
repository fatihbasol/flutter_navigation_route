import 'package:flutter/material.dart';

class VeriGonderAl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  String name, surname;

  Home() {
    name = "Fatih";
    surname = "Başol";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasyon İşlemleri"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Text("$name $surname"),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.dehaze,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                "https://i.picsum.photos/id/1043/1000/1000.jpg?hmac=rzdv0u7LyW2-xCN3kAHYkwf2Y-MRKmiBVhD__ZwbW6Q",
                fit: BoxFit.fitWidth,
              ),
            ),
//              leading: Icon(Icons.person),
            automaticallyImplyLeading: false,
            elevation: 10,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 100,
                color: Colors.red,
                child: Center(
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetaySayfasi(name, surname))).then((value) =>
                          debugPrint(
                              "Pop ile geldim ve bakın ne getirdim: $value"))
                    },
                    color: Colors.teal,
                    child: Text("Detaylara Git"),
                  ),
                ),
              ),
              Container(
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text("Temsili Liste"),
                ),
              ),
              Container(
                height: 100,
                color: Colors.yellow,
                child: Center(
                  child: Text("Temsili Liste"),
                ),
              ),
              Container(
                height: 100,
                color: Colors.white,
                child: Center(
                  child: Text("Temsili Liste"),
                ),
              ),
              Container(
                height: 100,
                color: Colors.teal,
              ),
              Container(
                height: 100,
                color: Colors.deepOrange,
                child: Center(
                  child: Text("Temsili Liste"),
                ),
              ),
              Container(
                height: 100,
                color: Colors.green,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class DetaySayfasi extends StatelessWidget {
  String name, surname;

  DetaySayfasi(this.name, this.surname);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint("Geri butonuna basıldı.");
        Navigator.pop(context, "Flutter");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detay Sayfası"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text("İsim: $name"),
            ),
            Center(
              child: Text("Soyisim: $surname"),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "Flutter");
                },
                color: Colors.blue[400],
                child: Text("Profile Dön"),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
