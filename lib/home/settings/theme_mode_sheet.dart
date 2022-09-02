

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_sat/my_theme.dart';
import 'package:todo_c6_sat/provider/app_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyTheme.lightPrimary
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Light',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.lightPrimary,
                      fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  Icon(Icons.check,
                    color: MyTheme.lightPrimary,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: MyTheme.lightPrimary
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dark',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: MyTheme.lightPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  Icon(Icons.check,
                    color: MyTheme.lightPrimary,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getSelectRow(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.lightPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
        Icon(Icons.check,
          color: MyTheme.lightPrimary,
          size: 25,
        )
      ],
    );
  }
}


