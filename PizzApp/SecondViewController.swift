//
//  SecondViewController.swift
//  PizzApp
//
//  Created by Gerardo Villarroel on 11/4/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var masaDelgada: UIButton!
    @IBOutlet weak var masaCrujiente: UIButton!
    @IBOutlet weak var masaGruesa: UIButton!
    
    @IBOutlet weak var checkD: UIImageView!
    @IBOutlet weak var checkC: UIImageView!
    @IBOutlet weak var checkG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        masaDelgada.layer.cornerRadius = 10
        masaCrujiente.layer.cornerRadius = 10
        masaGruesa.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func usuarioElijeMasa(sender: UIButton) {
        let tituloBoton = sender.currentTitle!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        Check(tituloBoton, valor: true)
        
        let comandaDelPedido = (self.tabBarController as! CustomTabBarController).comandaDelPedido
        comandaDelPedido.tipoDeMasa = tituloBoton
    }
        
    func Check(eleccion: String, valor: Bool) {
        switch eleccion {
        case "Delgada":
            checkD.hidden = !valor
            checkC.hidden = valor
            checkG.hidden = valor
        case "Crujiente":
            checkD.hidden = valor
            checkC.hidden = !valor
            checkG.hidden = valor
        case "Gruesa":
            checkD.hidden = valor
            checkC.hidden = valor
            checkG.hidden = !valor
        default: break
        }
    }
}

