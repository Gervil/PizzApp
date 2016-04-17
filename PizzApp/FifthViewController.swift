//
//  FifthViewController.swift
//  PizzApp
//
//  Created by Gerardo Villarroel on 15/4/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var resumenDelPedido: UILabel!
    @IBOutlet weak var confirmarPedido: UIButton!
    @IBOutlet weak var prepararPizza: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let comandaDelPedido = (self.tabBarController as! CustomTabBarController).comandaDelPedido
        
        if (comandaDelPedido.pedidoCompleto()) {
            resumenDelPedido.text = "Tu pedido es: \n"
            resumenDelPedido.text?.appendContentsOf("Una Pizza \(comandaDelPedido.tamañoPizza), ")
            resumenDelPedido.text?.appendContentsOf("con masa \(comandaDelPedido.tipoDeMasa), ")
            resumenDelPedido.text?.appendContentsOf("\(comandaDelPedido.tipoDeQueso), ")
            resumenDelPedido.text?.appendContentsOf("más los siguientes ingredientes: ")

            for i in 1...comandaDelPedido.ingredientes.count {
                resumenDelPedido.text?.appendContentsOf("\(comandaDelPedido.ingredientes[i-1])")
                if (i+1 < comandaDelPedido.ingredientes.count) {
                    resumenDelPedido.text?.appendContentsOf(", ")
                } else if ((i+1 == comandaDelPedido.ingredientes.count)) {
                    resumenDelPedido.text?.appendContentsOf(" y ")
                } else {
                    resumenDelPedido.text?.appendContentsOf(".")
                }
            }
        }
        confirmarPedido.enabled = true
        prepararPizza.hidden = true
    }
    
    @IBAction func confirmarPedido(sender: UIButton) {
        let comandaDelPedido = (self.tabBarController as! CustomTabBarController).comandaDelPedido
        
        if (comandaDelPedido.pedidoCompleto()) {
            resumenDelPedido.text = "Tu pedido será preparado de inmediato!"
            confirmarPedido.enabled = false
            prepararPizza.hidden = false
        } else {
            let alertController = UIAlertController(title: "¿Cómo quieres tu Pizza?", message:
                "No es posible confirmar aún tu pedido, revisa las etapas anteriores y elije al menos una opción en cada una.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}
