//
//  OfertaCell.h
//  Futuro
//
//  Created by Kai´s mac on 13/04/14.
//  Copyright (c) 2014 AppsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfertaCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *roundedView;

@property (strong, nonatomic) IBOutlet UILabel *labelTiempoTranscurrido;
@property (strong, nonatomic) IBOutlet UILabel *labelNombrePuesto;
@property (strong, nonatomic) IBOutlet UITextView *textViewDetallePuesto;
- (IBAction)verDetalleOferta:(id)sender;

- (id)initWithDict:(NSDictionary *)oferta;
@end
