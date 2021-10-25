//
//  CadastroViewController.swift
//  Projeto Lojas
//
//  Created by developer on 24/07/2021.
//

import UIKit
import Firebase


class CadastroViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var fechar: UIImageView!
    
    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPass: UITextField!
    @IBOutlet weak var fieldTel: UITextField!
    @IBOutlet weak var fieldAge: UITextField!
    
    var formularioOk = false
    var msgRetornoAPI = " "
    var auth:Auth?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerButton.layer.cornerRadius = 10
        fieldTel.delegate = self
        fieldAge.delegate = self
        self.auth = Auth.auth();
    }
    
    func alert(titulo:String, mensagem:String){
          let alertController: UIAlertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
          let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel , handler: nil)
          alertController.addAction(ok);
          self.present(alertController, animated: true, completion: nil)
      }
    
    @IBAction func executarCadastro(_ sender: Any) {
        let email: String = self.fieldEmail.text ?? ""
        let senha: String = self.fieldPass.text ?? ""
        if (self.fieldPass.text == "" || self.fieldEmail.text  == "" || self.fieldName.text  == "" || self.fieldAge.text  == "" || self.fieldTel.text == ""){
            self.alert(titulo: "Opa!", mensagem: "É necessário preencher todos os campos")
        }else{
            self.auth?.createUser(withEmail: email, password: senha, completion: {
                (result,error ) in
                
                if error != nil {
                    self.alert(titulo: "ERROR!", mensagem: "Não foi possível concluir seu cadastro, favor conferir todos os campos")
                }else{
                    self.alert(titulo: "Sucesso!", mensagem: "Cadastro Realizado")
                }
            })
        }
    
    }
    
  
    
    //
    @IBAction func fecharCadastro() {
        self.dismiss(animated: true)
    }
    
}

