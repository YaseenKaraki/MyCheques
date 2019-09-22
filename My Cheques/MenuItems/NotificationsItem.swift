import UIKit

class NotificationsItem: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true


        setuplabel()
        // Do any additional setup after loading the view.
    }
    let label: UILabel = {
        
        let l = UILabel()
        l.text = "Welcome To Notifications:"
        return l
        
    }()
    
    fileprivate func setuplabel (){
        view.addSubview(label)
        label.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 50,
                      bottom: nil, bottomPad: 0,
                      left: view.leftAnchor, leftPad:0 ,
                      right: view.rightAnchor, rightPad: 0,
                      height: 25, width: 400)
        
        
        
        
    }
    
    
}
