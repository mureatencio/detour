//
//  OfertaCellDelegate.h
//  Futuro
//
//  Created by Kai´s mac on 5/4/14.
//  Copyright (c) 2014 AppsLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Oferta.h"

@protocol OfertaCellDelegate <NSObject>

-(void)mostrarOfertaCompleta:(Oferta *)oferta;

@end
