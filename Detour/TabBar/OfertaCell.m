//
//  OfertaCell.m
//  Futuro
//
//  Created by Kai´s mac on 13/04/14.
//  Copyright (c) 2014 AppsLab. All rights reserved.
//
#import "OfertaCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation OfertaCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init {
    self = [[[NSBundle mainBundle] loadNibNamed:@"ofertaView" owner:self options:nil] objectAtIndex:0];
    
    if (self){
        
    }
    return self;
}

- (IBAction)verDetalleOferta:(id)sender {
}

- (id)initWithDict:(NSDictionary *)oferta {
    self = [[[NSBundle mainBundle] loadNibNamed:@"ofertaView" owner:self options:nil] objectAtIndex:0];
    
    if (self){
//        self.labelTiempoTranscurrido = [oferta objectForKey:@"modified"];
//        self.labelNombrePuesto = [oferta objectForKey:@"title"];
//        self.textViewDetallePuesto = [[oferta objectForKey:@"content"] objectForKey:@"content"];
        
        self.labelTiempoTranscurrido.text = @"Hace: 2 días";
        self.labelNombrePuesto.text = @"Senior .Net Developer";
        self.textViewDetallePuesto.text = @"Esta es la descripción";
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
        NSLog(@"Celda creada");

    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"Celda creada");
        // Do your custom initialization here
    }
    return self;
}

- (void)awakeFromNib{
    NSLog(@"Celda creada");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
