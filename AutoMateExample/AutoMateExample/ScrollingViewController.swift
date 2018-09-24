//
//  ScrollingViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 20.09.2016.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import UIKit

class ScrollingViewController: UIViewController {

    // MARK: @IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.accessibilityIdentifier = "scrollView"
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: Notifications
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let keyboardEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
                return
        }

        let keyboardFrame = view.convert(keyboardEndFrame, from: nil)

        UIView.animate(withDuration: animationDuration) {
            self.scrollView.scrollIndicatorInsets.bottom = keyboardFrame.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
                return
        }

        UIView.animate(withDuration: animationDuration) {
            self.scrollView.scrollIndicatorInsets.bottom = 0
        }
    }
}
