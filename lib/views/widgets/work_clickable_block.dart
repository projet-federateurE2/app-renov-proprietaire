import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';

class WorkClickableBlock extends StatefulWidget {
  final Function(String)? getId;
  final String urlImage;
  final String workName;
  final bool isSelected;
  // final Function(int) callback;

  const WorkClickableBlock({
    Key? key,
    required this.urlImage,
    required this.workName,
    required this.isSelected,
    this.getId,
    // required this.callback,
  }) : super(key: key);

  @override
  State<WorkClickableBlock> createState() => _WorkClickableBlockState();
}

class _WorkClickableBlockState extends State<WorkClickableBlock> {
  var backgroundColor = Colors.white;
  var fontColor = ColorsRenov.primaryGreen;
  var isChecked = false;

  void getBlockId() {
    widget.getId!(widget.workName);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected == true) {
      backgroundColor = ColorsRenov.primaryGreen;
      fontColor = Colors.white;
    } else {
      backgroundColor = Colors.white;
      fontColor = ColorsRenov.primaryGreen;
    }
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.12,
      width: MediaQuery.of(context).size.width * 0.12,
      child: Card(
        elevation: 4.0,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
             BlocProvider.of<SelectWorkBloc>(context).add(ClickWorkEvent(widget.workName));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 80,
                  height: 80,
                  child: SvgPicture.asset(widget.urlImage, color: fontColor)),
              Text(widget.workName,
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
