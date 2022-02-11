/*

{
 "name": "Open Graph Test User",
 "email": "open_jygexjs_user@tfbnw.net",
 "picture": {
   "data": {
     "height": 126,
     "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/84628273_176159830277856_972693363922829312_n.jpg",
     "width": 200
   }
 },
 "id": "136742241592917"
}
 */
class Facebook {
  final String name;
  final String email;
  final String id;
  FacebookPicture facebookPicture;

  Facebook({
    required this.name,
    required this.email,
    required this.id,
    required this.facebookPicture,
  });

  factory Facebook.fromJson(Map<String,dynamic> json){
    FacebookPicture facebookPicture = FacebookPicture.fromJson(json['picture']['data']);
      return Facebook(name: json['name'],
          email: json['email'],
          id: json['id'],
          facebookPicture: facebookPicture);
  }

}

class FacebookPicture {
  final  int width;
  final   int height;
  final   String pictureUrl;

          FacebookPicture({required this.width,
            required this.height,
            required this.pictureUrl,
          });

          factory FacebookPicture.fromJson(Map<String,dynamic> json){
            return FacebookPicture(
                width: json['width'],
                height: json['height'],
                pictureUrl: json['url'],
            );
          }
}
