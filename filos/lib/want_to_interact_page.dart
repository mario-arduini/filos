import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:filos/bloc.dart';
import 'package:filos/entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WantToInteractPage extends StatelessWidget {
  Widget _interactWidget(WantToInteract wti) {
    return Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CircularProfileAvatar(
              wti.user.imageUrl,
              radius: 20.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.remove_circle_outline,
                color: wti.available ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(wti.user.name),
            Text(wti.user.room),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<Bloc>(
          builder: (_, bloc, __) {
            return StreamBuilder<List<WantToInteract>>(
                stream: bloc.wantToInteract,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return Column(
                    children: <Widget>[
                      Text(
                        'Want to interact',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      _interactWidget(snapshot.data[0]),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}