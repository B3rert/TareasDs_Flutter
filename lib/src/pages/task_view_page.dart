import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_tareasds/src/utils/colors.dart';
import 'package:front_tareasds/src/utils/my_behavior.dart';
import 'package:front_tareasds/src/widgets/subtitulo_negrita_widget.dart';
import 'package:front_tareasds/src/widgets/texto_normal_widget.dart';
import 'package:front_tareasds/src/widgets/titulos_negrita_widget.dart';

final List<String> content = [
  "Ticket: #4798897",
  "Asunto: Tarea Prueba",
  "Ticket Estado: Activo",
  "Departamento: Soporte BA",
  "Creado: 13/01/2020 3:19:00 p.m",
  "Nombre: Usuario Prueba",
  "Correo Electronico: Probando@hoover.gt.com",
  "Telefono:",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
  "usuario prueba",
  "08/01/2020 12:40:06 p.m.",
  "87498sadasdiujh.pdf",
];

String vistaComentario = "Ultimo comentario";
int _value = 1;

class TaskViewPage extends StatefulWidget {
  TaskViewPage({Key key}) : super(key: key);

  @override
  _TaskViewPageState createState() => _TaskViewPageState();
}

class _TaskViewPageState extends State<TaskViewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = true;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();
  bool _verArchivosadjuntos = false;
  bool _mostrarArchivosAdjuntos = false;

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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ColoresPropios.azul,
        title: Text(
          "Resumen del ticket",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: _viewSelectTask(),
      ),
    );
  }

  void _mostFilesAdjunt() {
    setState(() {
      (_mostrarArchivosAdjuntos)
          ? _mostrarArchivosAdjuntos = false
          : _mostrarArchivosAdjuntos = true;
    });
  }

  Widget _viewFilesAjunts() {
    return MaterialButton(
      onPressed: _mostFilesAdjunt,
      child: Row(
        children: [
          Text("Ver archivos adjuntos"),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget _viewSelectTask() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView(
        children: [
          TituloNegritaWidget(content[0]),
          TituloNegritaWidget(content[1]),
          Divider(),
          TextoNormalWidget(content[2]),
          TextoNormalWidget(content[5]),
          TextoNormalWidget(content[3]),
          TextoNormalWidget(content[6]),
          TextoNormalWidget(content[7]),
          TextoNormalWidget(content[4]),
          Divider(),
          mostrarComentarios(),
          SubtituloNegritaWidget(content[12]),
          SubtituloNegritaWidget(content[11]),
          TextoNormalWidget(content[8]),
          archivosAdjuntos(content[13]),
          Divider(),
          inputAgregarComentario(),
          adjuntarArchivos(),
          (_mostrarArchivosAdjuntos) ? archivosSeleccionados() : Divider(),
          enviarComentario(),
        ],
      ),
    );
  }

  Widget mostrarComentarios() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: DropdownButton(
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text(
                  "Último comentario",
                  style: TextStyle(fontFamily: "Lato"),
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text(
                  "Todos los cometarios",
                  style: TextStyle(fontFamily: "Lato"),
                ),
                value: 2,
              ),
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            }),
      ),
    );
  }

  Widget archivosAdjuntos(String nombreArchivo) {
    return MaterialButton(
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file,
            color: Colors.black54,
          ),
          mostrarTextoPalido(nombreArchivo),
        ],
      ),
      onPressed: () {},
    );
  }

  Widget mostrarTextoPalido(String texto) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 17.0, color: Colors.black54),
      ),
    );
  }

  Widget adjuntarArchivos() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: (_verArchivosadjuntos)
                ? _viewFilesAjunts()
                : Text(
                    "Ningun archivo adjunto",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w100),
                  ),
          ),
          (!_verArchivosadjuntos)
              ? RaisedButton(
                  onPressed: _openFileExplorer,
                  color: ColoresPropios.azul,
                  textColor: Colors.white,
                  child: Text(
                    'Examinar',
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 17.0,
                    ),
                  ),
                )
              : RaisedButton(
                  onPressed: _clearCachedFiles,
                  color: ColoresPropios.azul,
                  textColor: Colors.white,
                  child: Text(
                    'Eliminar Archivos',
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

  void _clearCachedFiles() {
    setState(() {
      _verArchivosadjuntos = false;
      _mostrarArchivosAdjuntos = false;
    });
    FilePicker.platform.clearTemporaryFiles().then(
      (result) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            backgroundColor: result ? Colors.green : Colors.red,
            content: Text(
              (result
                  ? 'Archivos seleccionados eliminados correctamente'
                  : 'Fallo al eliminar los archivos seleccionados'),
            ),
          ),
        );
      },
    );
  }

  Widget inputAgregarComentario() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          hoverColor: Colors.black,
          filled: true,
          labelText: 'Escriba una respuesta',
        ),
        onChanged: (value) {
          setState(() {
            //value tiene el valor del input
          });
        },
        maxLines: 3,
      ),
    );
  }

  Widget enviarComentario() {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 20.0, right: 20.0, left: 180.0, top: 7.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          onPressed: () {},
          color: ColoresPropios.azul,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enviar comentario',
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 17.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.send,
                  size: 19.0,
                ),
              )
            ],
          ),
        ),
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
      _verArchivosadjuntos = true;
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
