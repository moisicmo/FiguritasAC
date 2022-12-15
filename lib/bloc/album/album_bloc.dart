import 'package:FiguritasAC/models/album_model.dart';
import 'package:bloc/bloc.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(const AlbumState()) {
    on<UpdateAlbum>((event, emit) {
      emit(state.copyWith(existAlbum: true, album: event.album));
    });
    on<ClearAlbum>((event, emit) {
      emit(state.copyWith(existAlbum: false));
    });
  }
}
