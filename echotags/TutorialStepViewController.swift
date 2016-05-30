//
//  TutorialStepViewController.swift
//  echotags
//
//  Created by bkzl on 16/05/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import UIKit

class TutorialStepViewController: UIViewController {
    @IBAction private func touchDismissTutorial(sender: UIButton) {
        let homeViewController = presentingViewController?.childViewControllers.first as? HomeViewController
        
        dismissViewControllerAnimated(false, completion: {
            homeViewController?.overlayView.hidden = false
        })
    }
    
    @IBAction private func touchFinishTutorial(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction private func touchNextStep(sender: UIButton) {
        guard let tutorialPageViewController = parentViewController as? TutorialPageViewController else { return }
        guard let currentStepViewController = tutorialPageViewController.viewControllers?.first else { return }
        
        if let nextStepViewController = tutorialPageViewController.pageViewController(tutorialPageViewController, viewControllerAfterViewController: currentStepViewController) {
            tutorialPageViewController.setViewControllers([nextStepViewController], direction: .Forward, animated: true, completion: nil)
        }
    }
    
}
