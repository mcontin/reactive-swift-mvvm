//
//  PostDetailSections.swift
//  MVVM
//
//  Created by Mattia on 02/10/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

//import RxDataSources
//
//enum PostDetailSections: SectionModelType {
//
//    typealias Item = Row
//
//    case detailSection(header: String, items: [Item])
//    case commentsSection(header: String, items: [Item])
//
//    var items: [Row] {
//        switch self {
//        case .detailSection(_, let items):
//            return items
//
//        case .commentsSection(_, let items):
//            return items
//        }
//    }
//
//    init(original: PostDetailSections, items: [Row]) {
//        self = original
//
//        switch self {
//        case .detailSection(let header, _):
//            self = .detailSection(header: header, items: items)
//
//        case .commentsSection(let header, _):
//            self = .commentsSection(header: header, items: items)
//        }
//    }
//}
//
//enum Row {
//    case post(customData: Post)
//    case comment(string: Comment)
//}
