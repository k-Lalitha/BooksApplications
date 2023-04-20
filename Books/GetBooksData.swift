//
//  GetBooksData.swift
//  Books
//
//  Created by Venuka Valiveti on 19/04/23.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bookItems = try JSONDecoder().decode(BookItems.self, from: jsonData)


import Foundation

// MARK: - BookItems
class GetBooksData: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [GetBooksResultData]?

    init(kind: String?, totalItems: Int?, items: [GetBooksResultData]?) {
        self.kind = kind
        self.totalItems = totalItems
        self.items = items
    }
}

// MARK: - Item
class GetBooksResultData: Codable {
    let uuId = UUID()
    let kind, id, etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
    let accessInfo: AccessInfo?
    let searchInfo: SearchInfo?
   var checkboxSelected:Bool? = false
    var isShowAlert:Bool? = false
    var showDescription:Bool? = false
    var showImage:Bool? = false

    init(kind: String?, id: String?, etag: String?, selfLink: String?, volumeInfo: VolumeInfo?, saleInfo: SaleInfo?, accessInfo: AccessInfo?, searchInfo: SearchInfo?,checkboxSelected:Bool?,isShowAlert:Bool?,showDescription:Bool?,showImage:Bool?) { //,favorite : Bool
        self.kind = kind
        self.id = id
        self.etag = etag
        self.selfLink = selfLink
        self.volumeInfo = volumeInfo
        self.saleInfo = saleInfo
        self.accessInfo = accessInfo
        self.searchInfo = searchInfo
        self.checkboxSelected = checkboxSelected
        self.isShowAlert = isShowAlert
        self.showDescription = showDescription
        self.showImage = showImage
    }
}

// MARK: - AccessInfo
class AccessInfo: Codable {
    let country, viewability: String?
    let embeddable, publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub, pdf: Epub?
    let webReaderLink: String?
    let accessViewStatus: String?
    let quoteSharingAllowed: Bool?

    init(country: String?, viewability: String?, embeddable: Bool?, publicDomain: Bool?, textToSpeechPermission: String?, epub: Epub?, pdf: Epub?, webReaderLink: String?, accessViewStatus: String?, quoteSharingAllowed: Bool?) {
        self.country = country
        self.viewability = viewability
        self.embeddable = embeddable
        self.publicDomain = publicDomain
        self.textToSpeechPermission = textToSpeechPermission
        self.epub = epub
        self.pdf = pdf
        self.webReaderLink = webReaderLink
        self.accessViewStatus = accessViewStatus
        self.quoteSharingAllowed = quoteSharingAllowed
    }
}

// MARK: - Epub
class Epub: Codable {
    let isAvailable: Bool?

    init(isAvailable: Bool?) {
        self.isAvailable = isAvailable
    }
}

// MARK: - SaleInfo
class SaleInfo: Codable {
    let country, saleability: String?
    let isEbook: Bool?

    init(country: String?, saleability: String?, isEbook: Bool?) {
        self.country = country
        self.saleability = saleability
        self.isEbook = isEbook
    }
}

// MARK: - SearchInfo
class SearchInfo: Codable {
    let textSnippet: String?

    init(textSnippet: String?) {
        self.textSnippet = textSnippet
    }
}

// MARK: - VolumeInfo
class VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publisher, publishedDate, description: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let readingModes: ReadingModes?
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink, infoLink: String?
    let canonicalVolumeLink: String?

    init(title: String?, authors: [String]?, publisher: String?, publishedDate: String?, description: String?, industryIdentifiers: [IndustryIdentifier]?, readingModes: ReadingModes?, pageCount: Int?, printType: String?, categories: [String]?, maturityRating: String?, allowAnonLogging: Bool?, contentVersion: String?, imageLinks: ImageLinks?, language: String?, previewLink: String?, infoLink: String?, canonicalVolumeLink: String?) {
        self.title = title
        self.authors = authors
        self.publisher = publisher
        self.publishedDate = publishedDate
        self.description = description
        self.industryIdentifiers = industryIdentifiers
        self.readingModes = readingModes
        self.pageCount = pageCount
        self.printType = printType
        self.categories = categories
        self.maturityRating = maturityRating
        self.allowAnonLogging = allowAnonLogging
        self.contentVersion = contentVersion
        self.imageLinks = imageLinks
        self.language = language
        self.previewLink = previewLink
        self.infoLink = infoLink
        self.canonicalVolumeLink = canonicalVolumeLink
    }
}

// MARK: - ImageLinks
class ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?

    init(smallThumbnail: String?, thumbnail: String?) {
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
}

// MARK: - IndustryIdentifier
class IndustryIdentifier: Codable {
    let type, identifier: String?

    init(type: String?, identifier: String?) {
        self.type = type
        self.identifier = identifier
    }
}

// MARK: - ReadingModes
class ReadingModes: Codable {
    let text, image: Bool?

    init(text: Bool?, image: Bool?) {
        self.text = text
        self.image = image
    }
}
