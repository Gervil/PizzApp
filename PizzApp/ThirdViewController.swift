//
//  ThirdViewController.swift
//  PizzApp
//
//  Created by Gerardo Villarroel on 13/4/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var quesoMozzarella: UIButton!
    @IBOutlet weak var quesoCheddar: UIButton!
    @IBOutlet weak var quesoParmesano: UIButton!
    @IBOutlet weak var sinQueso: UIButton!
    
    @IBOutlet weak var checkM: UIImageView!
    @IBOutlet weak var checkC: UIImageView!
    @IBOutlet weak var checkP: UIImageView!
    @IBOutlet weak var checkS: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quesoMozzarella.layer.cornerRadius = 10
        quesoCheddar.layer.cornerRadius = 10
        quesoParmesano.layer.cornerRadius = 10
        sinQueso.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func usuarioElijeTipoDeQueso(sender: UIButton) {
        let tituloBoton = sender.currentTitle!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        Check(tituloBoton, valor: true)
        
        let comandaDelPedido = (self.tabBarController as! CustomTabBarController).comandaDelPedido
        comandaDelPedido.tipoDeQueso = tituloBoton
    }
        
    func Check(eleccion: String, valor: Bool) {
        switch eleccion {
        case "Mozzarella":
            checkM.hidden = !valor
            checkC.hidden = valor
            checkP.hidden = valor
            checkS.hidden = valor
        case "Cheddar":
            checkM.hidden = valor
            checkC.hidden = !valor
            checkP.hidden = valor
            checkS.hidden = valor
        case "Parmesano":
            checkM.hidden = valor
            checkC.hidden = valor
            checkP.hidden = !valor
            checkS.hidden = valor
        default:
            checkM.hidden = valor
            checkC.hidden = valor
            checkP.hidden = valor
            checkS.hidden = !valor
        }
    }
}
