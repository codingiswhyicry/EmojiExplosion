//
//  ViewController.swift
//  EmojiExplosion
//
//  Created by Amanda Southworth on 11/16/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        emoji = emojis.randomElement()!

        center = view.center
        
        label1.center = center
        label1.text = emoji
        
        var label2 = UILabel()
        label2.frame = label1.frame
        label2.center = center
        label2.text = emoji
        
        var label3 = UILabel()
        label3.frame = label1.frame
        label3.center = center
        label3.text = emoji

        var label4 = UILabel()
        label4.frame = label1.frame
        label4.center = center
        label4.text = emoji
        
        var label5 = UILabel()
        label5.frame = label1.frame
        label5.center = center
        label5.text = emoji
        
        labelArray = [label1, label2, label3, label4, label5]
        
        labelArray.forEach({ label in
            view.addSubview(label)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // Variables for the emojis & gesture detectors
    var emojis: [String] = ["😂", "🤣", "😅", "😄", "😃"]
    var emoji = ""
    var center = CGPoint(x: 0, y: 0)
    
    var labelArray: [UILabel] = []
    
    var isExpanded = false
    @IBOutlet weak var label1: UILabel!
    @IBAction func tapGestureRecognizer(_ sender: Any) {
        
        isExpanded == true ? shrinkEmoji() : expandEmoji()
    }
    
    
    // Functions for expanding and shrinking the emojis
    func expandEmoji() {
        
        isExpanded = true
    
        UIView.animate(withDuration: 1.0) {
            
            var bounds = self.view.bounds
            
            self.labelArray.forEach({ label in
                
                var x = CGFloat.random(in: 0...bounds.size.width)
                var y = CGFloat.random(in: 0...bounds.size.height)
                label.transform = CGAffineTransform(translationX: CGFloat(x), y: CGFloat(y))
            })
        }
    }
    
    func shrinkEmoji() {
        
        isExpanded = false
        center = view.center
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.0) {
            // Shrink back emojis into identity
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                
                print("keyframe 1")
                self.labelArray.forEach({ label in
                    
                    label.transform = CGAffineTransform.identity
                })
            }
            
            // Fading all emojis out of view
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                
                print("keyframe 2")
                self.labelArray.forEach({ label in
                    
                    label.alpha = 0.0
                })
            }
            
            self.emoji = self.emojis.randomElement()!
            
            // Changing emoji to new random element
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                
                print("keyframe 3")
                self.labelArray.forEach({ label in
                    label.text = self.emoji
                    label.alpha = 1.0
                })
            }
        }
        
        emoji = emojis.randomElement()!
    }
}

