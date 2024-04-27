import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_build_structure_project/constant/app_color.dart';
class General_AppBar extends StatelessWidget implements PreferredSizeWidget {
  @required
  final String? title;
  final Color? appBarColor;
  final Color? appBarIconColor;
  final double? appBarElevation;
  final Icon? appBarLeadingIcon;
  final double? appBarHeight;
  final bool? showSearchAction;
  final bool? showAddNewAction;
  final VoidCallback? onBackButtonPressed;
  final VoidCallback? onActionPressed;

  // create action parameter
  // final List<Widget> actions;

  const General_AppBar({
    Key? key,
    this.title,
    this.appBarColor = Colors.white,
    this.appBarIconColor = Colors.white,
    this.appBarElevation = 0.0,
    this.appBarLeadingIcon,
    this.appBarHeight = 60.0,
    this.showSearchAction = false,
    this.onActionPressed,
    this.onBackButtonPressed,
    this.showAddNewAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
      // Set the desired height of the app bar
      backgroundColor: appBarColor,
      leadingWidth: 70,
      leading: Center(
        child: Container(
          width: 38,
          height: 38,
          // alignment: Alignment.center,
          // padding: EdgeInsets.only(right: 15.0),
          // margin: EdgeInsets.only(left: 12.0, bottom: 10),
          decoration: BoxDecoration(
            color: Color(0xfff4A017D).withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: IconButton(
            onPressed: onBackButtonPressed == null
                ? () {
                    Navigator.pop(context);
                  }
                : onBackButtonPressed,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      elevation: appBarElevation,
      title: Text(
        title.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
      actions: [
        showSearchAction == true
            ? IconButton(
                onPressed: onActionPressed,
                icon: Icon(
                  Icons.search,
                  size: 28,
                  color: AppColor.textColor
                ),
              )
            : showAddNewAction == true
                ? Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 39,
                    height: 39,
                    alignment: Alignment.center,
                    // padding: EdgeInsets.only(right: 15.0),
                    // margin: EdgeInsets.only(left: 12.0, bottom: 10),
                    decoration: BoxDecoration(
                      color: Color(0xfff4A017D).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: onActionPressed,
                        icon: Icon(
                          CupertinoIcons.add_circled,
                          color: AppColor.textColor,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                )
                : Container()
      ],
      actionsIconTheme: IconThemeData(
        color: appBarIconColor,
        // size: 27,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Adjust the height as needed

}
