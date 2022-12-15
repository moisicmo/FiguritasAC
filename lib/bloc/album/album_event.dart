part of 'album_bloc.dart';

abstract class AlbumEvent {}

class UpdateAlbum extends AlbumEvent {
  final AlbumModel album;

  UpdateAlbum(this.album);
}

class ClearAlbum extends AlbumEvent {
  ClearAlbum();
}
