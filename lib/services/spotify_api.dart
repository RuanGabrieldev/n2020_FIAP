import 'package:spotify/spotify.dart';

class SpotifyApiBotas{

  void main() async {


}

  Future<List<dynamic>> getMusic(String id) async{
    SpotifyApiCredentials credentials = SpotifyApiCredentials("9b195f4e9f204c9f8ab5840b2a9a836a", "44c573150bd9457d976eb4d505c8669b");
    SpotifyApi spotify = SpotifyApi(credentials);

     Iterable<Track> tracks = await spotify.playlists.getTracksByPlaylistId(id).all(5);


    var item = await spotify.playlists.get(id);
    
    return [item, tracks];
  }




}