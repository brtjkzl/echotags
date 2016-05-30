//
//  PurchaseTutorialStepViewController.swift
//  echotags
//
//  Created by bkzl on 30/05/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import UIKit
import Spring

class PurchaseTutorialStepViewController: TutorialStepViewController {
    
    @IBOutlet private weak var settingsLabel: DesignableLabel! {
        didSet {
            settingsLabel = GlyphLabel(label: settingsLabel).replace("@", withImage: "glyph-settings") as? DesignableLabel
        }
    }
    
}
