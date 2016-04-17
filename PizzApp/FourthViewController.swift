//
//  FourthViewController.swift
//  PizzApp
//
//  Created by Gerardo Villarroel on 13/4/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var dobleQueso: UIButton!
    @IBOutlet weak var aceituna: UIButton!
    @IBOutlet weak var anchoas: UIButton!
    @IBOutlet weak var cebolla: UIButton!
    @IBOutlet weak var champiñon: UIButton!
    @IBOutlet weak var jamon: UIButton!
    @IBOutlet weak var pavo: UIButton!
    @IBOutlet weak var pepperoni: UIButton!
    @IBOutlet weak var pimenton: UIButton!
    @IBOutlet weak var piña: UIButton!
    @IBOutlet weak var salchicha: UIButton!
    @IBOutlet weak var tocino: UIButton!
    
    @IBOutlet weak var checkDobleQueso: UIImageView!
    @IBOutlet weak var checkAceituna: UIImageView!
    @IBOutlet weak var checkAnchoas: UIImageView!
    @IBOutlet weak var checkCebolla: UIImageView!
    @IBOutlet weak var checkChampiñon: UIImageView!
    @IBOutlet weak var checkJamon: UIImageView!
    @IBOutlet weak var checkPavo: UIImageView!
    @IBOutlet weak var checkPepperoni: UIImageView!
    @IBOutlet weak var checkPimenton: UIImageView!
    @IBOutlet weak var checkPiña: UIImageView!
    @IBOutlet weak var checkSalchicha: UIImageView!
    @IBOutlet weak var checkTocino: UIImageView!
    
    var contador: Int = 0
    var ingredientes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dobleQueso.layer.cornerRadius = 10
        aceituna.layer.cornerRadius = 10
        anchoas.layer.cornerRadius = 10
        cebolla.layer.cornerRadius = 10
        champiñon.layer.cornerRadius = 10
        jamon.layer.cornerRadius = 10
        pavo.layer.cornerRadius = 10
        pepperoni.layer.cornerRadius = 10
        pimenton.layer.cornerRadius = 10
        piña.layer.cornerRadius = 10
        salchicha.layer.cornerRadius = 10
        tocino.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func usuarioElijeLosDemasIngredientes(sender: UIButton) {
        let tituloBoton = sender.currentTitle!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        contadorDeIngredientes(tituloBoton)
    }
    
    func contadorDeIngredientes(nombreBoton: String) {
        let comandaDelPedido = (self.tabBarController as! CustomTabBarController).comandaDelPedido

        var check: Bool = false
        if (!ingredientes.isEmpty) {
            for i in 1...ingredientes.count {
                if (ingredientes[i-1] == nombreBoton) {
                    ingredientes.removeAtIndex(i-1)
                    checkIngrediente(nombreBoton, check: true)
                    check = true
                    break
                }
            }
        }
        if (ingredientes.count < 5 && !check) {
            ingredientes.append(nombreBoton)
            checkIngrediente(nombreBoton, check: false)
            check = false
        }
        comandaDelPedido.ingredientes = ingredientes
    }

    func checkIngrediente(nombreBoton: String, check: Bool) {
        switch nombreBoton {
            case "2ble Queso":
                checkDobleQueso.hidden = check
            case "Aceituna":
                checkAceituna.hidden = check
            case "Anchoas":
                checkAnchoas.hidden = check
            case "Cebolla":
                checkCebolla.hidden = check
            case "Champiñon":
                checkChampiñon.hidden = check
            case "Jamón":
                checkJamon.hidden = check
            case "Pavo":
                checkPavo.hidden = check
            case "Pepperoni":
                checkPepperoni.hidden = check
            case "Pimentón":
                checkPimenton.hidden = check
            case "Piña":
                checkPiña.hidden = check
            case "Salchicha":
                checkSalchicha.hidden = check
            case "Tocino":
                checkTocino.hidden = check
        default: break
        }
    }
}
