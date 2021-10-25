import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var fundoLogoRedondo: UIView!
    @IBOutlet weak var botaoEntrar: UIButton!
    @IBOutlet weak var botaoCadastrar: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var circle: UIView!

    var auth:Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        botaoCadastrar.layer.cornerRadius = 10
        botaoEntrar.layer.cornerRadius = 10
        circle.layer.cornerRadius = 15
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        fundoLogoRedondo.clipsToBounds = true
        fundoLogoRedondo.layer.cornerRadius =
        fundoLogoRedondo.frame.height / 2
        self.auth = Auth.auth();
    }
    
    func alert(titulo:String, mensagem:String){
        let alertController: UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel , handler: nil)
        alertController.addAction(ok);
        self.present(alertController, animated: true, completion: nil)
    }
    
    func navegar(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let perfilVC = storyBoard.instantiateViewController(withIdentifier: "PerfilViewController")
                let destinationVC = perfilVC as! PerfilViewController
                self.navigationController?.setViewControllers([destinationVC], animated: true)
                return
      }


    @IBAction func executarLogin(_ sender: Any) {
        let email: String = self.emailField.text ?? ""
        let senha: String = self.passField.text ?? ""
        self.auth?.signIn(withEmail: email, password: senha, completion:{ (usuario,error) in
     
            if error != nil{
                self.alert(titulo: "ERROR!", mensagem: "Usuário ou senha inválidos")
            }else{
                self.navegar()
            }
    })
    
}
}


