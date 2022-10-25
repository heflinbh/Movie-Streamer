//
//  YouTubeSearchResponse.swift
//  Zelda Game Covers
//
//  Created by Benjamin Heflin on 10/25/22.
//

import Foundation


/*items =     (
{
etag = "cVQeUvb9aVLBIatiS_8Rbui9aaU";
id =             {
kind = "youtube#video";
videoId = lXSbXkw1ULo;
};
kind = "youtube#searchResult";
},
*/

struct YouTubeSearchResponse: Codable {
    let items: [VideoElement]
    
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
