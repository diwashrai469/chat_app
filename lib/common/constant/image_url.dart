String cdnUrl = "https://dl15rshshv7vz.cloudfront.net/";

String returnImageURLFromCDN(String imageURL) {
  return "$cdnUrl$imageURL?alt=media";
}

int serverAppVersion = 2;
