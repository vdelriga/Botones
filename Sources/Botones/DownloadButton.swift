//
//  DownloadButton.swift
//  Prueba_boton
//
//  Created by LAURA MARTIN DOIMEADIOS TRUJILLO on 12/12/20.
//

import UIKit

public class DownloadButton: UIButton {

    private var downloading:Bool = false
    private var downloaded:Bool = false
    private var arrItems_reverse:[UIImage] = []
    private var arrItems:[UIImage] = []
    var bezierPath:UIBezierPath!
    var bezierPath_back:UIBezierPath!
    var progressLayer : CAShapeLayer!
    var backgroundLayer: CAShapeLayer!
    var progress: CGFloat = 0

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
         self.Inicio()
    }
    
    public func set_progress(valor: CGFloat){
        progress = valor
        progressLayer.strokeEnd = self.progress
        if( progress >= 1){
            downloaded = true
            self.set_progress(valor: 0)
            self.setImage(UIImage(named:"Anima_descargas14.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }
    }
    public func IsDownloaded()->Bool{
        return downloaded
    }
    
    public func IsDownloading()->Bool{
        return downloading
    }
    
    public func restart(){
        self.set_progress(valor: 0)
        downloaded=false
        downloading=false
        self.setImage(UIImage(named:"Anima_descargas0.png",in:Bundle.module,compatibleWith: nil),for:.normal)
    }
    
    public func downloadingStatus(estadoDescarga:Bool){
        downloading=estadoDescarga
        if(!downloading){
           self.setImage(UIImage(named:"Anima_descargas0.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }else{
          self.setImage(UIImage(named:"Anima_descargas13.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }
    }
  
    public func animacion(){
        downloading = !downloading
        if(downloading){
            self.imageView?.animationImages = arrItems
            self.setImage(UIImage(named:"Anima_descargas13.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }else
        {
            self.imageView?.animationImages = arrItems_reverse
            self.setImage(UIImage(named:"Anima_descargas0.png",in:Bundle.module,compatibleWith: nil),for:.normal)
        }
        self.imageView?.animationDuration = 0.7
        self.imageView?.animationRepeatCount=1
        self.imageView?.startAnimating()
    }
    
    private func configura_barra() {
       progressLayer = CAShapeLayer()
       progressLayer.path = bezierPath.cgPath
       progressLayer.strokeColor = UIColor.orange.cgColor
       progressLayer.lineWidth = 5
        progressLayer.strokeStart=0.0
        progressLayer.strokeEnd = 0.0
       //progressLayer.zPosition = 1
       progressLayer.fillColor = nil
        
        self.layer.addSublayer(progressLayer)
    }
    
    private func  dibuja_barra_progreso(){
            bezierPath = UIBezierPath()
        let marco=CGFloat(3.0)
       /* bezierPath.move(to: CGPoint(x: self.bounds.midX,y: self.bounds.minY+marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.maxX-marco,y: self.bounds.minY+marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.maxX-marco,y: self.bounds.maxY-marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.minX+marco,y: self.bounds.maxY-marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.minX+marco,y: self.bounds.minY+marco))
        bezierPath.close()*/
        bezierPath.
        bezierPath.addArc(withCenter: CGPoint(x: self.bounds.midX,y: self.bounds.midY), radius: 15, startAngle: 0, endAngle: 5,65487, clockwise: true)
        bezierPath.close()
        
        
        //        bezierPath = UIBezierPath(roundedRect: CGRect(x: self.bounds.minX + 3,y: self.bounds.minY + 3, width: self.bounds.width-6,height: self.bounds.height-6), cornerRadius: 4)

    }
    
    private func Inicio() {
        self.layer.cornerRadius=4
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 15,right: 10)
        self.layoutIfNeeded()
        for i in 0...13{
            arrItems.append(UIImage(named:"Anima_descargas" + String(i) + ".png",in:Bundle.module,compatibleWith: nil)!)
            arrItems_reverse.append(UIImage(named:"Anima_descargas" + String(13-i) + ".png",in:Bundle.module,compatibleWith: nil)!)
            
        }
        self.dibuja_barra_progreso()
        self.configura_barra()
    }

}
