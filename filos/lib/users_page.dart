

import 'package:filos/entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

const double _kPadding = 64.0;

class UsersPage extends StatelessWidget{

  List<Container> _showUsers(List<User> users) => users.map((user) {
    return Container(
        child: Column(
          children: <Widget>[
            Text(
                user.name
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              user.imageUrl
                          )
                      )
                  ),
                ),
              ),
            )
          ],
        )
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
   return Consumer<Bloc>(
     builder: (_, bloc, __){
       return StreamBuilder<List<User>>(
         stream: bloc.users,
         builder: (context,snapshot) {
           return Card(
             child: snapshot.hasData
                 ? Padding(
                 padding: const EdgeInsets.all(_kPadding / 2),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(
                       'House Wallpaper',
                       style: Theme
                           .of(context)
                           .textTheme
                           .display1,
                     ),
                     GridView.extent(
                         shrinkWrap: true,
                         maxCrossAxisExtent: 150,
                         padding: const EdgeInsets.all(4),
                         mainAxisSpacing: 4,
                         crossAxisSpacing: 4,
                         children: _showUsers(snapshot.data)
                     )
                   ],
                 )
             )
                 : const Center(child: CircularProgressIndicator()),
           );
         }
         );
       },
   );
  }
}