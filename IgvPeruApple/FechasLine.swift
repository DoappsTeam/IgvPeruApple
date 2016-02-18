//
//  FechasLine.swift
//  IgvPeruApple
//
//  Created by Gonzalo on 17/02/16.
//  Copyright © 2016 DoApps. All rights reserved.
//

import Foundation
class FechasLine{
    
    var fechas : [Dictionary<Int,[Int]>]
    init(fech: [Dictionary<Int,[Int]>]){
        self.fechas = fech
    }
    class func fillData() -> FechasLine{
        let p0 = [0:[17,17,19,18,17,19,17,19,19,18,20,18]]
        let p1 = [1:[18,18,20,19,20,20,18,20,20,21,21,19]]
        let p2 = [2:[19,21,21,20,21,21,19,21,21,22,22,20]]
        let p3 = [3:[19,21,21,20,21,21,19,21,21,22,22,20]]
        let p4 = [4:[12,14,14,13,14,14,12,14,14,15,15,13]]
        let p5 = [5:[12,14,14,13,14,14,12,14,14,15,15,13]]
        let p6 = [6:[15,15,15,16,15,15,15,15,17,16,16,16]]
        let p7 = [7:[15,15,15,16,15,15,15,15,17,16,16,16]]
        let p8 = [8:[16,16,18,17,16,18,16,16,18,17,19,17]]
        let p9 = [9:[16,16,18,17,16,18,16,16,18,17,19,17]]
        return FechasLine(fech: [p0,p1,p2,p3,p4,p5,p6,p7,p8,p9])
    }

//    var fechas:[[Int]] = [[17,17,19,18,17,19,17,19,19,18,20,18],[18,18,20,19,20,20,18,20,20,21,21,19],[19,21,21,20,21,21,19,21,21,22,22,20],[19,21,21,20,21,21,19,21,21,22,22,20],[12,14,14,13,14,14,12,14,14,15,15,13],[12,14,14,13,14,14,12,14,14,15,15,13],[15,15,15,16,15,15,15,15,17,16,16,16],[15,15,15,16,15,15,15,15,17,16,16,16],[16,16,18,17,16,18,16,16,18,17,19,17],[16,16,18,17,16,18,16,16,18,17,19,17]]
//    var meses1 = ["ENERO 2016","FEBRERO 2016","MARZO 2016","ABRIL 2016","MAYO 2016","JUNIO 2016","JULIO 2016","AGOSTO 2016","SEPTIEMBRE 2016","OCTUBRE 2O16","NOVIEMBRE 2016","DICIEMBRE 2016"]
//    var meses2 = ["de Febrero","de Marzo","de Abril","de Mayo","de Junio","de Julio","de Agosto","de Septiembre","de Octubre","de Noviembre","de Diciembre","de Enero"]
}
    
    
    
    
    
    

