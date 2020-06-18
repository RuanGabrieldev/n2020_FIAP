import 'package:spotify/spotify.dart';

class SpotifyApiBotas{

  void main() async {


}

  Future<void> getMusic() async{
    SpotifyApiCredentials credentials = SpotifyApiCredentials("9b195f4e9f204c9f8ab5840b2a9a836a", "44c573150bd9457d976eb4d505c8669b");
    SpotifyApi spotify = SpotifyApi(credentials);

    var artists = await spotify.artists.get("0Vw76uk7P8yVtTClWyOhac");
    print(artists.name);

  }




}