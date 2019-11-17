import 'package:filos/alpaca_page.dart';
import 'package:filos/food_sharing_page.dart';
import 'package:filos/gallery_page.dart';
import 'package:filos/gamification_page.dart';
import 'package:filos/get_involved_page.dart';
import 'package:filos/need_to_talk_page.dart';
import 'package:filos/neighbors_page.dart';
import 'package:filos/smile_page.dart';
import 'package:filos/want_to_interact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:filos/news_page.dart';

const double _kPadding = 64.0;

class HomePage extends StatelessWidget {
  final colors = [
    Colors.blue,
    Colors.amber,
    Colors.brown,
    Colors.green,
    Colors.deepPurple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        padding: EdgeInsets.symmetric(
          horizontal: _kPadding,
          vertical: _kPadding / 2,
        ),
        crossAxisCount: 12,
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          // Food sharing
          if (index == 0) {
            return FoodSharingPage();
          }
          // Neighbors
          if (index == 1) {
            return NeighborsPage();
          }
          // Need to talk
          if (index == 2) {
            return NeedToTalkPage();
          }
          // Gallery
          if (index == 3) {
//            return Card(child: Center(child: Text('Gallery')));
            return GalleryPage();
          }
          // Willing to chat
          if (index == 4) {
//            return Card(child: Center(child: Text('Willing to chat, help, chill')));
            return WantToInteractPage();
          }
          // Stats and Gamification
          if (index == 5) {
            return GamificationPage();
          }
          // News
          if (index == 6) {
            return NewsPage();
          }
          // Alpaca
          if (index == 7) {
            return AlpacaPage();
          }
          // Activities
          if (index == 8) {
            return Card(
              child: Image.network(
                "https://media.discordapp.net/attachments/644945527909384217/645488342187900928/hiking.png?width=400&height=300",
                 fit: BoxFit.fill,
              ),
            );
          }
          // Get Involved
          if (index == 9) {
            return GetInvolvedPage();
          }
          // Games
          if (index == 10) {
            return Card(child: Center(child: Text('Games')));
          }
          // Smile counter
          if (index == 2) {
            return SmileReadOnlyPage();
          }
          // Alpaca
          if (index == 5) {
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images-na.ssl-images-amazon.com/images/I/51YX0Mm05CL._SX425_.jpg'),
                  ),
                ),
                child: Align(
                  alignment: Alignment(0.8, -0.85),
                  child: Text(
                    'Have a lovely day!',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
            );
          }
          // User Wallpaper
          if (index == 2) {}
          return Card(
            color: colors[index % colors.length],
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('$index'),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          if (index == 0) return StaggeredTile.count(8, 3);
          if (index == 1) return StaggeredTile.count(4, 2);
          if (index == 2) return StaggeredTile.count(2, 2);
          if (index == 3) return StaggeredTile.count(2, 2);
          if (index == 4) return StaggeredTile.count(2, 3);
          if (index == 5) return StaggeredTile.count(4, 2);
          if (index == 6) return StaggeredTile.count(2, 4);
          if (index == 7) return StaggeredTile.count(4, 4);
          if (index == 8) return StaggeredTile.count(4, 3);
          if (index == 9) return StaggeredTile.count(2, 2);
          if (index == 10) return StaggeredTile.count(2, 1);

          return StaggeredTile.count(2, index.isEven ? 2 : 1);
        },
        mainAxisSpacing: _kPadding,
        crossAxisSpacing: _kPadding,
      ),
    );
  }
}
