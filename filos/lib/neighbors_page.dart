import 'package:filos/entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

const double _kPadding = 64.0;

class NeighborsPage extends StatelessWidget {
  Widget _userWidget(User user) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(user.imageUrl),
                ),
              ),
            ),
            Text(user.name),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<Bloc>(
      builder: (_, bloc, __) {
        return StreamBuilder<List<User>>(
          stream: bloc.users,
          builder: (context, snapshot) {
            return Card(
              child: snapshot.hasData
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: _kPadding / 2,
                        left: _kPadding / 2,
                        right: _kPadding / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Your neighbors',
                            style: Theme.of(context).textTheme.display1,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: snapshot.data
                                  .map((user) => _userWidget(user))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}
