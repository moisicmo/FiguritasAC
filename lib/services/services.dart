import 'package:flutter_dotenv/flutter_dotenv.dart';

String? url = dotenv.env['HOST'];

//TODAS LAS FIGURITAS
String getAllFigurines() => '$url/getAllFigurines';
//DUPLICADOS
String getDuplicatesFigurines() => '$url/getDuplicatesFigurines';
//FILTRO
String filter() => '$url/filter';
//INCREMENTO DE FIGURITAS
String increaseFigurine() => '$url/increaseFigurine';
