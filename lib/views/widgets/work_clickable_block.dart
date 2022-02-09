import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';

class WorkClickableBlock extends StatefulWidget {
  final String urlImage;
  final String workName;
  final bool isSelected;
  final bool isChecked;

  // final Function(int) callback;

  const WorkClickableBlock({
    Key? key,
    required this.urlImage,
    required this.workName,
    required this.isSelected, 
    required this.isChecked,
    // required this.callback,
  }) : super(key: key);

  @override
  State<WorkClickableBlock> createState() => _WorkClickableBlockState();
}

class _WorkClickableBlockState extends State<WorkClickableBlock> {
  var backgroundColor = Colors.white;
  var fontColor = ColorsRenov.primaryGreen;



  @override
  Widget build(BuildContext context) {
    if (widget.isSelected == true) {
      backgroundColor = ColorsRenov.primaryGreen;
      fontColor = Colors.white;
    } else {
      backgroundColor = Colors.white;
      fontColor = ColorsRenov.primaryGreen;
    }
    
    return BlocBuilder<SelectWorkBloc, SelectWorkState>(
        builder: (context, state) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: const EdgeInsets.all(13.0),
            elevation: 4.0,
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                BlocProvider.of<SelectWorkBloc>(context)
                    .add(ClickWorkEvent(widget.workName));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width / 15,
                      height: MediaQuery.of(context).size.width / 15,
                      margin: const EdgeInsets.only(bottom: 10),
                      child:
                          SvgPicture.asset(widget.urlImage, color: fontColor)),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(widget.workName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: fontColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.isChecked,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: 35,
                height: 35,
                child: SvgPicture.asset('icons/checkMarkForWorksBlock.svg'),
              );
            }),
          ),
        ),
      ],
    );
  });
  }
}
