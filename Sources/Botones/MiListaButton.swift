//
//  MiListaButton.swift
//  MiListaButton
//
//  Created by LAURA MARTIN DOIMEADIOS TRUJILLO on 29/11/20.
//

import UIKit

public class MiListaButton: UIButton {
    private var añadido:Bool = false
    private var arrItems_reverse:[UIImage] = []
    private var arrItems:[UIImage] = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
         self.Inicio()
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
       didSet {
           layer.cornerRadius = cornerRadius
           layer.masksToBounds = cornerRadius > 0
       }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
       didSet {
           layer.borderWidth = borderWidth
       }
    }
    @IBInspectable var borderColor: UIColor? {
       didSet {
        layer.borderColor = borderColor?.cgColor
       }
    }
    
    public func estaEnLista(enMiLista:Bool){
        añadido=enMiLista
        if(!añadido){
            self.setImage(UIImage(named:"boton_animado0.png"),for:.normal)
        }else{
            self.setImage(UIImage(named:"boton_animado20.png"),for:.normal)
        }
    }
    
    private func botonPulsado(){
        añadido = !añadido
        if(añadido){
            self.imageView?.animationImages = arrItems
        }else
        {
            self.imageView?.animationImages = arrItems_reverse
        }
           self.imageView?.animationDuration = 1.0
           self.imageView?.animationRepeatCount=1

           self.imageView?.startAnimating()
        if (añadido){
           self.setImage(UIImage(named:"boton_animado20.png"),for:.normal)
        }else{
           self.setImage(UIImage(named:"boton_animado0.png"),for:.normal)
        }

    }
    
    @objc func animacion(){
        self.botonPulsado()
    }
    
    
    private func Inicio() {
        self.layer.cornerRadius=4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        
        for i in 0...20{
            arrItems.append(UIImage(named:"boton_animado" + String(i) + ".png")!)
            arrItems_reverse.append(UIImage(named:"boton_animado" + String(20-i) + ".png")!)
            
        }
    }
    
    

}
