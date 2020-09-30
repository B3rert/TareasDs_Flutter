import 'package:flutter/material.dart';
import 'package:front_tareasds/src/utils/colors.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';
import 'package:front_tareasds/src/widgets/description_widget.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

bool brushedTeeth = false; //Estado para en checkbox
bool enableFeature = false; //Estado para en checkbox

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPage createState() => _NewTaskPage();
}

class _NewTaskPage extends State<NewTaskPage> {
  set result(result) {}

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = true;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(
            top: 55.0,
            left: 20.0,
          ),
          child: Text(
            "Abrir un nuevo Ticket",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 21.5,
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          children: [
            DescriptionWidget('Correo Electronico: Probando@hoover.gt.com'),
            DescriptionWidget("Nombre cliente: Usuario Prueba"),
            Divider(),
            inputNameTarea(),
            inputDescription(),
            adjuntarArchivos(),
            Divider(),
            archivosSeleccionados()
          ],
        ),
      ),
    );
  }

  Widget enviarTarea() {
    return MaterialButton(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                "Crear Ticket",
                style: TextStyle(
                    fontFamily: "Lato", color: Colors.white, fontSize: 20.5),
              ),
            ),
            Icon(
              Icons.send,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () {});
  }

  Widget inputNameTarea() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          hoverColor: Colors.black,
          filled: true,
          //   hintText:
          //  'Ingrese una descripciín de su requerimiento.',
          labelText: 'Titulo *',
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
      ),
    );
  }

  Widget inputDescription() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Detalle del incidente *',
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
        maxLines: 5,
      ),
    );
  }

  Widget adjuntarArchivos() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RaisedButton(
            onPressed: _openFileExplorer,
            color: ColoresPropios.azul,
            textColor: Colors.white,
            child: Text(
              'Adjuntar archivos',
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openFileExplorer() async {
    //setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      //_loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  Widget archivosSeleccionados() {
    return Builder(
      builder: (BuildContext context) => _loadingPath
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: const CircularProgressIndicator(),
            )
          : _directoryPath != null
              ? ListTile(
                  title: Text('Ubicacion de la carpeta'),
                  subtitle: Text(_directoryPath),
                )
              : _paths != null
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: _paths != null && _paths.isNotEmpty
                              ? _paths.length
                              : 1,
                          itemBuilder: (BuildContext context, int index) {
                            final bool isMultiPath =
                                _paths != null && _paths.isNotEmpty;
                            final String name = (isMultiPath
                                ? _paths.map((e) => e.name).toList()[index]
                                : _fileName ?? '...');
                            final path = _paths
                                .map((e) => e.path)
                                .toList()[index]
                                .toString();

                            return ListTile(
                              title: Text(
                                name,
                              ),
                              subtitle: Text(path),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                    )
                  : const SizedBox(),
    );
  }
}
