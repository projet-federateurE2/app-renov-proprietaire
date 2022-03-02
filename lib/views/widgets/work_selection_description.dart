import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/values/strings.dart';

import '../../blocs/work_selection/select_work_bloc.dart';
import 'icon_background_circle.dart';

class WorkSelectionDescription extends StatefulWidget {
  final String titleDesc;
  final String urlImage;
  final String stringDesc1;
  final String stringDesc2;
  const WorkSelectionDescription(
      {Key? key,
      required this.titleDesc,
      required this.urlImage,
      required this.stringDesc1,
      required this.stringDesc2})
      : super(key: key);

  @override
  State<WorkSelectionDescription> createState() => _WorkSelectionDescription();
}

class _WorkSelectionDescription extends State<WorkSelectionDescription> {
  var isPressed = false;
  Color color = ColorsRenov.primaryGreen;

  @override
  Widget build(BuildContext context) {
    var sizeIcon =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width * 0.03
            : MediaQuery.of(context).size.height * 0.03;
    var iconBackgroundCircle = IconBackgroundCircle(
        imageSize: MediaQuery.of(context).size.width >
                MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width * 0.1
            : MediaQuery.of(context).size.height * 0.1,
        topCirclePosition: 15,
        rightCirclePosition: 15,
        url: widget.urlImage);

    return BlocBuilder<SelectWorkBloc, SelectWorkState>(
        builder: (context, state) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.44,
        height: MediaQuery.of(context).size.height * 0.76,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: AutoSizeText(
                  widget.titleDesc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                    top: 12,
                    bottom: 48,
                    left: 15,
                  ),
                  child: iconBackgroundCircle),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 32, bottom: 16),
                    child: SvgPicture.asset(
                      'icons/bulb.svg',
                      width: sizeIcon,
                      height: sizeIcon,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16, right: 32),
                      child: AutoSizeText(
                        widget.stringDesc1,
                        maxLines: 4,
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 17.0),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 24, bottom: 0),
                    child: SvgPicture.asset(
                      'icons/warning.svg',
                      width: sizeIcon,
                      height: sizeIcon,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 32),
                      child: AutoSizeText(
                        widget.stringDesc2,
                        maxLines: 3,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 17.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 32, bottom: 8),
                        child: TextButton(
                            onPressed: () {
                              BlocProvider.of<SelectWorkBloc>(context)
                                  .add(ValitedWorkEvent(widget.titleDesc));
                            },
                            child: AutoSizeText(
                              state.valideWorkAll.contains(widget.titleDesc)
                                  ? TextRenov.removeWork
                                  : TextRenov.addWork,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color:
                                    state.valideWorkAll.contains(widget.titleDesc)
                                        ? Colors.red
                                        : ColorsRenov.primaryGreen,
                              ),
                            ),
                            style: TextButton.styleFrom())),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
