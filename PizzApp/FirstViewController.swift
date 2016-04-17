//
//  FirstViewController.swift
//  PizzApp
//
//  Created by Gerardo Villarroel on 11/4/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tamañoPequeña: UIButton!
    @IBOutlet weak var tamañoMediana: UIButton!
    @IBOutlet weak var tamañoGrande: UIButton!
    
    @IBOutlet weak var checkP: UIImageView!
    @IBOutlet weak var checkM: UIImageView!
    @IBOutlet weak var checkG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tamañoPequeña.layer.cornerRadius = 10
        tamañoMediana.layer.cornerRadius = 10
        tamañoGrande.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func usuarioElijeTamaño(sender: UIButton) {
        let tituloBoton = sender.currentTitle!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        Check(tituloBoton, valor: true)
        
        let comandaDelPedido = (self.tabBarController as! CustomTabBarController).comandaDelPedido
        comandaDelPedido.tamañoPizza = tituloBoton
    }

    func Check(eleccion: String, valor: Bool) {
        switch eleccion {
            case "Pequeña":
                checkP.hidden = !valor
                checkM.hidden = valor
                checkG.hidden = valor
            case "Mediana":
                checkP.hidden = valor
                checkM.hidden = !valor
                checkG.hidden = valor
            case "Grande":
                checkP.hidden = valor
                checkM.hidden = valor
                checkG.hidden = !valor
        default: break
        }
    }
}

