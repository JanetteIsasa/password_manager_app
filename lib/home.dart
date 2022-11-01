import 'package:elevenpass/Accounst_Page/ui/screens/body_account.dart';
import 'package:elevenpass/Accounst_Page/ui/screens/edit_profile.dart';
import 'package:elevenpass/Accounst_Page/ui/widgets/image_and_user_name.dart';
import 'package:elevenpass/Favorites/ui/screens/body_favorites.dart';
import 'package:elevenpass/Vaults/ui/screens/body_vault.dart';
import 'package:elevenpass/Vaults/ui/widgets/add_vault.dart';
import 'package:elevenpass/widgets/customs/custom_home.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
import '../../../widgets/text_app_bar.dart';
import 'api_client.dart';

class Home extends StatefulWidget {
  final String accesstoken;
  Home({Key? key, required this.accesstoken}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ApiClient _apiClient = ApiClient();

  static const List<Widget> homeBodies = [
    BodyVault(),
    BodyFavorites(),
    BodyAccount(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.fromLTRB(25, 18, 5, 18),
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.menuBackground),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24,
          ),
        ),
        leadingWidth: 75,
        title: const TextAppBar(
          "11Pass",
        ),
        centerTitle: true,
        actions: (index == 2)
            ? const [
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 15,
                ),
              ]
            : null,
      ),
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            CustomPaint(
              size: Size(double.infinity,
                  (index == 2) ? size.height * 0.30 : size.height * 0.27),
              painter: CustomPainterHome(),
            ),

            //Contenedor del Menú
            Positioned(
              top: 25,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.menuBackground,
                ),

                //Acá van los botones del menú
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Botón Vaults
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (index == 0)
                            ? const Color.fromRGBO(56, 117, 211, 0.95)
                            : Colors.transparent,
                        elevation: (index == 0) ? null : 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Vaults'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //Botón Favorites
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (index == 1)
                            ? const Color.fromRGBO(56, 117, 211, 0.95)
                            : Colors.transparent,
                        elevation: (index == 1) ? null : 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.grade_outlined,
                              size: 24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Favorites'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //Botón Account
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (index == 2)
                            ? const Color.fromRGBO(56, 117, 211, 0.95)
                            : Colors.transparent,
                        elevation: (index == 2) ? null : 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.person_outline_outlined,
                              size: 24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Account'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Aparece sólo si aprieta el botón Account
            if (index == 2) const Positioned(bottom: 0, child: ImageUserName())
          ]),

          //Va cambiando el body de acuerdo al botón
          Expanded(
            child: homeBodies[index],
          ),
        ],
      ),

      //Botón para agregar o editar, dependiendo de la vista
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: (index == 1)
            ? null
            : FloatingActionButton(
                onPressed: () => (index == 0) ? showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const AddVault();
                    })
                    : Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const EditProfile())),
                backgroundColor: AppColors.dangerColor,
                child: Icon(
                  (index == 0) ? Icons.add : Icons.edit,
                  size: 30,
                )),
      ),
    );
  }
}


