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
            backgroundLayer.strokeEnd = 0
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
       progressLayer.lineWidth = 2.5
       progressLayer.strokeStart=0.0
       progressLayer.strokeEnd = 0.0
       progressLayer.fillColor = nil
        backgroundLayer = CAShapeLayer()
        backgroundLayer.path = bezierPath.cgPath
        backgroundLayer.strokeColor = UIColor.white.cgColor
        backgroundLayer.lineJoin = CAShapeLayerLineJoin.miter
        backgroundLayer.lineDashPhase = 3.0
        backgroundLayer.lineWidth = 1.5
        backgroundLayer.strokeStart=0.0
        backgroundLayer.strokeEnd = 100
        backgroundLayer.fillColor = nil
        
        self.layer.addSublayer(backgroundLayer)
        self.layer.addSublayer(progressLayer)
    }
    
    private func  dibuja_barra_progreso(){
        bezierPath = UIBezierPath()
        bezierPath_back = UIBezierPath()
       /* bezierPath.move(to: CGPoint(x: self.bounds.midX,y: self.bounds.minY+marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.maxX-marco,y: self.bounds.minY+marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.maxX-marco,y: self.bounds.maxY-marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.minX+marco,y: self.bounds.maxY-marco))
        bezierPath.addLine(to: CGPoint(x: self.bounds.minX+marco,y: self.bounds.minY+marco))
        bezierPath.close()*/
        bezierPath.addArc(withCenter: CGPoint(x: self.bounds.midX,y: self.bounds.midY), radius: 15, startAngle: 3 * .pi / 2, endAngle: 4.72, clockwise: false)
        bezierPath.close()
        
        bezierPath_back.addArc(withCenter: CGPoint(x: self.bounds.midX,y: self.bounds.midY), radius: 15, startAngle: 3 * .pi / 2, endAngle: 4.72, clockwise: false)
        bezierPath_back.close()
        

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
