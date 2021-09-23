import 'dart:io';

import 'package:dan_resto/components/dialog/settingdialog.dart';
import 'package:dan_resto/provider/schedulingprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SchedulingProvider>(
      create: (_) => SchedulingProvider(),
      child: ListView(
        children: [
          Material(
            child: ListTile(
              title: Text('Scheduling Restaurant'),
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                    value: scheduled.isScheduled,
                    onChanged: (value) async {
                      if (Platform.isIOS) {
                        customDialog(context);
                      } else {
                        scheduled.scheduledRestaurant(value);
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
