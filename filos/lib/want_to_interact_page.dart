import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:filos/bloc.dart';
import 'package:filos/entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WantToInteractPage extends StatelessWidget {
  Widget _interactWidget(WantToInteract wti) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          CircularProfileAvatar(
            wti.user.imageUrl,
            radius: 20.0,
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
          Expanded(child: Container()),
          Icon(
            wti.available ? Icons.check_circle : Icons.remove_circle,
            color: wti.available ? Colors.green : Colors.red,
            size: 24.0,
          ),
        ],
      ),
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
                        'At home and happy to mingle',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      ...snapshot.data
                          .map((wti) => _interactWidget(wti))
                          .toList(),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
