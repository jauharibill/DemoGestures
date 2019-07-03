//
//  ViewController.swift
//  DemoGestures
//
//  Created by Idris on 22/06/19.
//  Copyright © 2019 IdrisLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var rectangleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    MARK: - tapped gesture
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        viewLabel.backgroundColor = UIColor(red: 0.6, green: 0.5, blue: 0.6, alpha: 1)
    }
    
//    MARK: - pinched gesture
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            let scale = sender.scale
            sender.view?.transform = viewLabel.transform.scaledBy(x: scale, y: scale)
        }
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        let viewToMove = sender.view!
        view.bringSubviewToFront(viewToMove)
        let translation = sender.translation(in: view)
        let newCenter = CGPoint(x: viewToMove.center.x + translation.x, y: viewToMove.center.y + translation.y)
        viewToMove.center = newCenter
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    
    @IBAction func rotationGesture(_ sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else { return }
        
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }}
    @IBAction func panGestureRectangle(_ sender: UIPanGestureRecognizer) {
        let viewToMove = sender.view!
        view.bringSubviewToFront(viewToMove)
        let translation = sender.translation(in: view)
        let newCenter = CGPoint(x: viewToMove.center.x + translation.x, y: viewToMove.center.y + translation.y)
        viewToMove.center = newCenter
        sender.setTranslation(CGPoint.zero, in: view)
    }
    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        let alert = UIAlertController(title: "Long Press", message: "Hello, you touch long press", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(addAction)
        present(alert, animated: true, completion: nil)
    }
}


