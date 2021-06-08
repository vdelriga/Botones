//
//  MiListaButton.swift
//  MiListaButton
//
//  Created by VICTOR MANUEL DEL RIO GARCIA on 29/11/20.
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
            self.setImage(UIImage(named:"Anima_netflix_0.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }else{
            self.setImage(UIImage(named:"Anima_netflix_10.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }
    }
    
    public func animacion(){
        añadido = !añadido
        if(añadido){
            self.imageView?.animationImages = arrItems
        }else
        {
            self.imageView?.animationImages = arrItems_reverse
        }
        self.imageView?.animationDuration = 0.7
           self.imageView?.animationRepeatCount=1

           self.imageView?.startAnimating()
        if (añadido){
            self.setImage(UIImage(named:"Anima_netflix_10.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }else{
            self.setImage(UIImage(named:"Anima_netflix_0.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }

    }
    
    
    
    private func Inicio() {
        self.layer.cornerRadius=4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.imageView?.contentMode = .scaleAspectFit
       // self.imageEdgeInsets = UIEdgeInsets(top: 35,left: 5,bottom: 35,right: 35)
        
        for i in 0...10{
            arrItems.append(UIImage(named:"Anima_netflix_" + String(i) + ".png",in:Bundle.module,compatibleWith: nil)!)
            arrItems_reverse.append(UIImage(named:"Anima_netflix_" + String(10-i) + ".png",in:Bundle.module,compatibleWith: nil)!)
            
        }
    }
    
    

}
