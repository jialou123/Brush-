//
//  UploadtoStorage.swift
//  renshenglogin
//
//  Created by Cynthia Gao on 7/19/18.
//  Copyright © 2018 Alexis Chen. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

struct UploadtoStorage {

static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
    guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion(nil)
    }
    reference.putData(imageData, metadata: nil, completion: {(metadata, error) in
        if let error = error {
            assertionFailure(error.localizedDescription)
            return completion (nil)
        }
        reference.downloadURL(completion: {(url,error) in
            if let error = error {
            assertionFailure(error.localizedDescription)
            return completion (nil)
        }
        completion(url)
        })
    })
}


}
