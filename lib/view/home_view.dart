import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CoverCardModel {
  String name;
  String title;
  String photoURI;

  CoverCardModel(
      {required this.name, required this.title, required this.photoURI});
}

List<CoverCardModel> coverCardModels = [
  CoverCardModel(
      name: "Ingrid Bergman",
      title: "Selfie Dare Accepted",
      photoURI: "ingrid.jpg"),
  CoverCardModel(
      name: "Meryl Streep",
      title: "Pose in the lockdown without studio",
      photoURI: "s.jpg"),
  CoverCardModel(
      name: "Hanah Jones",
      title: "Photo booth at home with #sis",
      photoURI: "d.jpg"),
  CoverCardModel(
      name: "Misa Amane",
      title: "Flying kiss to my ex boyfriend #dare",
      photoURI: "r.jpg"),
  CoverCardModel(
      name: "Jason Cruz",
      title: "360 Degree tornado kick #challenge",
      photoURI: "z.jpg"),
  CoverCardModel(
      name: "Meghan Trainer",
      title: "All about that bass #dare",
      photoURI: "i.jpg"),
];

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feed",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.apply(color: Colors.black, fontWeightDelta: 2),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpeg'),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.mail_outline))
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
            child: Container(
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    elevation: 0.0,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Text(
                        "#Trending",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Text(
                        "#Food",
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Text(
                        "#Activity",
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Text(
                        "#Travel",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(45.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StaggeredGridView.countBuilder(
            physics: BouncingScrollPhysics(),
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            itemCount: coverCardModels.length,
            itemBuilder: (context, position) =>
                cardBuilder(context, coverCardModels[position])),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.blueGrey.shade900,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.circle_outlined), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt), label: "Watchlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Account"),
          ],
        ),
      ),
    );
  }
}

Widget cardBuilder(BuildContext context, CoverCardModel cardModel) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset("assets/images/" + cardModel.photoURI)),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.apply(color: Colors.black),
                          children: [
                            TextSpan(
                                text: cardModel.name + " ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(text: cardModel.title),
                          ]),
                      // Text(
                      //   cardModel.name + " " + cardModel.title,
                      overflow: TextOverflow.ellipsis,
                      // softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("23 Min Ago",
                    style: Theme.of(context).textTheme.caption?.apply(
                        color: Colors.red,
                        fontSizeDelta: -2.0,
                        fontWeightDelta: 1)),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
