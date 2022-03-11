import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/pages/work_selection_page.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/user_in_corner.dart';
import 'package:renov_proprietaire_app/views/widgets/work_type_clickable_block.dart';
import '../../blocs/work_selection/select_work_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WorkTypeSelectionPage extends StatefulWidget {
  const WorkTypeSelectionPage({Key? key}) : super(key: key);

  @override
  _WorkTypeSelectionPageState createState() => _WorkTypeSelectionPageState();
}

class _WorkTypeSelectionPageState extends State<WorkTypeSelectionPage> { 

@override
void initState() {
    super.initState();
    BlocProvider.of<SelectWorkBloc>(context).add(const UserEvent());
  }

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<SelectWorkBloc, SelectWorkState>(
      builder: (context, state) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundGreenWave(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child : PageTitle(text: TextRenov.startProject, returnisvisible: false),
                          ),
                           state is UserState ? UserInCorner(name: state.user.prenom+ " " + state.user.nom)
                           : const UserInCorner(name: "Paul Dupont")
                        ]
                      ),
                      const SizedBox(
                        width: 2000,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 10, 0, 40),
                          child: Text(
                            TextRenov.startProjectDesc,
                            style: TextStyle(
                                fontSize: 17,
                                color: ColorsRenov.darkBlue,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                // Liste des grandes familles de travaux
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    WorkTypeClickableBlock(
                      iconUrl: "icons/house.svg",
                      iconSize: 85,
                      workTypeTitle: "Isolation",
                      workTypeDescription:
                          "Pour faire des économies d’énergie, et améliorer votre confort en hiver comme en été.",
                      page: WorkSelectionPage(workType: "isolation"),
                    ),
                    WorkTypeClickableBlock(
                      iconUrl: "icons/heating.svg",
                      iconSize: 85,
                      workTypeTitle: "Chauffage",
                      workTypeDescription:
                          "Pour faire des économies d’énergie, et améliorer votre confort en hiver comme en été.",
                      page: WorkSelectionPage(workType: "chauffage"),
                    ),
                    WorkTypeClickableBlock(
                      iconUrl: "icons/ventilation.svg",
                      iconSize: 85,
                      workTypeTitle: "Ventilation",
                      workTypeDescription:
                          "Pour faire des économies d’énergie, et améliorer votre confort en hiver comme en été.",
                      page: WorkSelectionPage(workType: "ventilation"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
     );
    }
   );
  }
}
