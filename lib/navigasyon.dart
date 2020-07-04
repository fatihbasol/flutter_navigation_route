import 'dart:async';

import 'package:flutter/material.dart';

class Navigasyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => BilinmeyenSayfa()),
      initialRoute: "/",
      routes: {
        '/': (context) => Home(),
        '/BirinciSayfa': (context) => BirinciSayfa(),
        '/IkinciSayfa': (context) => IkinciSayfa(),
        '/UcuncuSayfa': (context) => UcuncuSayfa(),
        '/DorduncuSayfa': (context) => DorduncuSayfa(),
        '/ReplacementSayfa': (context) => PushReplacement(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasyon İşlemleri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/BirinciSayfa");
            },
            color: Colors.orangeAccent,
            child: Text("Birinci Sayfaya git"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/IkinciSayfa");
            },
            color: Colors.redAccent,
            child: Text("İkinci Sayfaya git"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/UcuncuSayfa");
            },
            color: Colors.indigoAccent,
            child: Text("Üçüncü Sayfaya git"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/DorduncuSayfa");
            },
            color: Colors.lightGreen,
            child: Text("Dördüncü Sayfaya git"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/asdfsdasdsasd");
            },
            color: Colors.amber,
            child: Text("Beşinci Sayfaya git"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/ReplacementSayfa");
            },
            color: Colors.amber,
            child: Text("Push replacement Örneği"),
          )
        ],
      ),
    );
  }
}

class BirinciSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birinci Sayfa"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
              // İkisi de aynı işlemi yapar.
              //Navigator.of(context).pop(context);
            },
            color: Colors.blue[400],
            child: Text("Önceki Sayfaya git"),
            textColor: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/IkinciSayfa");
            },
            color: Colors.blue[800],
            child: Text("İkinci Sayfaya git"),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class IkinciSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İkinci Sayfa"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[400],
            child: Text("Önceki Sayfaya git"),
            textColor: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/UcuncuSayfa");
            },
            color: Colors.blue[800],
            child: Text("Üçüncü Sayfaya git"),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class UcuncuSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Üçüncü Sayfa"),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[400],
            child: Text("Önceki Sayfaya git"),
            textColor: Colors.white,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/DorduncuSayfa");
            },
            color: Colors.blue[800],
            child: Text("Dördüncü Sayfaya git"),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class DorduncuSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dördüncü Sayfa"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[400],
            child: Text("Önceki Sayfaya git"),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class BilinmeyenSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilinmeyen Sayfa"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text("Aradığınız sayfa bulunamadı."),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue[400],
            child: Text("Önceki Sayfaya git"),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class PushReplacement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer timer = new Timer(new Duration(seconds: 3), () {
      debugPrint("Süre bitti Dördüncü sayfaya gidiyor");
      Navigator.pushReplacementNamed(context, "/DorduncuSayfa");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("İkinci Sayfa"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
            "Bu sayfa stack'e eklenmeyecek \n 3 saniye sonra sayfa değişecek."),
      ),
    );
  }
}
