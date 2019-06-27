import 'package:flutter/material.dart';
import '../bloc/data_bloc.dart';
import '../model/data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchAllData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Credit Indonesia"),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: new Container(
                child: StreamBuilder(
                  stream: bloc.allDatas,
                  builder: (context, AsyncSnapshot<DataModels> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              )),
        ));
  }

  Widget buildList(AsyncSnapshot<DataModels> snapshot) {
    return Container(
        padding: EdgeInsets.all(15.0),
        child: SizedBox(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[menuBuildList(snapshot), blogList(snapshot)],
        )));
  }

  Widget menuBuildList(AsyncSnapshot<DataModels> snapshot) {
    return Card(
        child: GridView.builder(
      shrinkWrap: true,
      itemCount: snapshot.data.data[0].items.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image.network(
                '${snapshot.data.data[0].items[index].productImage}',
                fit: BoxFit.cover,
                height: 35.0,
              ),
            ),
            Container(
              child: Text(
                  '${snapshot.data.data[0].items[index].productName.replaceAll("Pembiayaan ", "")}'),
            )
          ],
        );
      },
    ));
  }

  Widget blogList(AsyncSnapshot<DataModels> snapshot) {
    return Container(
        child: Column(
          //shrinkWrap: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
               margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Text(
                //'${snapshot.data.data[1].sectionTitle}'
                'Our Blog',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.data[1].items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: () => openBrowser(snapshot.data.data[1].items[index].link),
                        child: Card(
                            child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Image.network(
                                '${snapshot.data.data[1].items[index].articleImage}'),
                            new Padding(
                              padding: new EdgeInsets.all(7.0),
                              child: Text(
                                  '${snapshot.data.data[1].items[index].articleTitle}'),
                            )
                          ],
                        )),
                      ),
                    );
                  }),
            )
          ],
        ));
  }

  void openBrowser(String url) async{
    print("URL : $url");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }    
  }
}
