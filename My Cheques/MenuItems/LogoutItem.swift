import UIKit

class LogoutItem: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        sureAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.title = ""
        
        
    }
    
    
    
    func sureAlert(){
        
        
        let alert = UIAlertController(title: "Are you sure to log out?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            
            action in
            let loginController = LoginController()
            self.navigationController?.pushViewController(loginController, animated: false)
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {
            
            action in
            self.navigationController?.popViewController(animated: false)
            
            
        }))
        
        self.present(alert, animated: false)
        
        
    }
    
}
