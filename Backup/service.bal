import ballerina/http;

@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"]
    }
}
service /itunes on new http:Listener(9090) {
    resource function get albums(string artist) returns Album[]|error {
        http:Client itunesClient = check new ("https://itunes.apple.com/");
        ITunesAlbumResults result = check itunesClient->get(getSearchUrl(artist));
        return from ITunesAlbum album in result.results
        select {name: album.collectionName, url: album.collectionViewUrl};
    }
}

function getSearchUrl(string artist) returns string {
    return "search?term=" + artist + "&entity=album&attribute=allArtistTerm";
}

type ITunesAlbum record {
    string collectionName;
    string collectionViewUrl;
};

type ITunesAlbumResults record {
    ITunesAlbum[] results;
};

type Album record {
    string name;
    string url;
};
