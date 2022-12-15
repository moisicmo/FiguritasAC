part of 'album_bloc.dart';

class AlbumState {
  final AlbumModel? album;
  final bool existAlbum;
  const AlbumState({this.album, this.existAlbum = false});
  AlbumState copyWith({bool? existAlbum, AlbumModel? album}) => AlbumState(existAlbum: existAlbum ?? this.existAlbum, album: album ?? this.album);
}
