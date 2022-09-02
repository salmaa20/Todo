import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_sat/home/settings/theme_mode_sheet.dart';
import 'package:todo_c6_sat/my_theme.dart';
import 'package:todo_c6_sat/provider/app_provider.dart';
class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Language',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize:16,
          fontWeight: FontWeight.bold),),
          Container(
            width: 320,
            height: 50,
            margin: EdgeInsets.only(top: 20,left: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: provider.isDark()?
              MyTheme.darkScaffoldBackground
              : Colors.white,
              border: Border.all(
                color: MyTheme.lightPrimary
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14
                ),),
                Icon(Icons.arrow_drop_down,
                color: MyTheme.lightPrimary,
                size: 26,)
              ],
            ),
          ),
          SizedBox(height: 50,),
          Text('Mode',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize:16,
                fontWeight: FontWeight.bold),),
          InkWell(
            onTap: (){
              showBottomSheetThemeMode();
            },
            child: Container(
              width: 320,
              height: 50,
              margin: EdgeInsets.only(top: 20,left: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color:provider.isDark()?
                  MyTheme.darkScaffoldBackground
                      : Colors.white,
                  border: Border.all(
                      color: MyTheme.lightPrimary
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Light',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14
                    ),),
                  Icon(Icons.arrow_drop_down,
                    color: MyTheme.lightPrimary,
                    size: 26,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheetThemeMode(){
   showModalBottomSheet(context: context, builder: (context){
     return ThemeBottomSheet();
   });
  }
}
