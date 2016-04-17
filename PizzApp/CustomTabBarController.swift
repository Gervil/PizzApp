//
//  CustomTabBarController.swift
//  PizzApp
//
//  Created by Gerardo Villarroel on 15/4/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import UIKit

class ComandaDelPedido {
    var tamañoPizza = String()
    var tipoDeMasa = String()
    var tipoDeQueso = String()
    var ingredientes = [String]()
    
    func pedidoCompleto()-> Bool {
        if (!tamañoPizza.isEmpty && !tipoDeMasa.isEmpty && !tipoDeQueso.isEmpty && !ingredientes.isEmpty) {
            return true
        } else {
            return false
        }
    }
}

class CustomTabBarController: UITabBarController {
    var comandaDelPedido = ComandaDelPedido()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}


