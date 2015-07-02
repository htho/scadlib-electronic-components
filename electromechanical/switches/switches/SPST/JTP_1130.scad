/**
 * JTP_1130 a pushbutton.
 *
 * This is this standard and cheap four pin pushbutton that is by default
 * not aligned to 0.1in, but the pins may be stretched to align to a 0.1in
 * grid.
 *
 * This file contains models for both versions.
 *
 * The JTP_1130 pushbutton is available in different heights.
 *
 * Table from the datasheet:
 * Bauteil-Nr.  L (mm)  I (mm)  Betätigerfarbe
 * JTP-1130     4,30    3,50    Schwarz
 * JTP-1130A    5,00    3,50    Schwarz
 * JTP-1130B    9,50    3,10    Schwarz
 * JTP-1130C    8,00    3,20    Schwarz
 * JTP-1130D    13,00   2,87    Schwarz
 * JTP-1130E    7,30    3,25    Schwarz
 * JTP-1130F    7,00    3,30    Schwarz
 * JTP-1130P    8,50    3,09    Schwarz
 * JTP-1130L    17,0    2,80    Schwarz
 * JTP-1130M    6,00    3,40    Schwarz
 * 
 *
 * @filename: JTP_1130.scad
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 * @tag-list: SPST, pushbutton, tactile switch, 4 pins
 * @category-list: electronic_component, electromechanical, switch, SPST
 * 
 * @author: Hauke Thorenz <htho@thorenz.net>
 * @version: 0.1
 * @license-short: cc-by-sa-4.0
 * @license: This work is licensed under the Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit
 * http://creativecommons.org/licenses/by-sa/4.0/.
 * @license-link: http://creativecommons.org/licenses/by-sa/4.0/
 *
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/TASTER93XX.pdf
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/switch-4lead.svg
 * @manufacturer NAMAE
 * @manufacturer-product JTP-1130
 */

//// ======== HIGH QUALITY ======== 

// ------- PARAMETRIC UNSPECIFIC MODULES -----

/**
 * A parametric version of the JTP_1130 pushbutton.
 *
 * The common model for the stretched and the unstretched version.
 *
 * Allows to specify the distance of the legs from the center
 * this allows using this for the standard and for the stretched version.
 * 
 * @tag-list: proto
 * 
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 * 
 * @module-dependency proto_JTP_1130_hq_leg A (mostly) true to the original leg.
 * 
 * @param L see datasheet
 * @param I see datasheet
 * @param legDistanceFromPartCenterX The distance of the legs from the center in x orientation.
 * @param legDistanceFromPartCenterX The distance of the legs from the center in y orientation.
 */
module proto_JTP_1130_hq_distanceindipendent(L, I, legDistanceFromPartCenterX, legDistanceFromPartCenterY)
{
  cubeSize = 6;
  cubeHeight = 3.6;
  legHeight = 3.5;
  legDepth = 0.3;
  legWidth = 0.7;
  rm = 2.54;

  rotate([0,0,0]){ //rotating it so the orientation fits the Fritzing part
    translate([-legDistanceFromPartCenterX,legDistanceFromPartCenterY,(cubeHeight/2)]){ //Translating so the center is on connector0
      cube([cubeSize,cubeSize,cubeHeight],true); //Body
      translate([0,0,cubeHeight/2]) cylinder(h=L-cubeHeight, r1=3.5/2, r2=I/2); //moving part

      mirror([0,0,0])translate([-legDistanceFromPartCenterX,-legDistanceFromPartCenterY,-legHeight]) proto_JTP_1130_hq_leg();
      mirror([0,0,0])translate([-legDistanceFromPartCenterX,+legDistanceFromPartCenterY,-legHeight]) proto_JTP_1130_hq_leg();
      mirror([1,0,0])translate([-legDistanceFromPartCenterX,-legDistanceFromPartCenterY,-legHeight]) proto_JTP_1130_hq_leg();
      mirror([1,0,0])translate([-legDistanceFromPartCenterX,+legDistanceFromPartCenterY,-legHeight]) proto_JTP_1130_hq_leg();
    }
  }
}

/**
 * A leg for the JTP_1130 pushbutton.
 * 
 * @tag-list: proto
 * 
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 * 
 * @todo: make the legs more true to the original
 */
module proto_JTP_1130_hq_leg(){
  legHeight = 3.5;
  legWidth = 0.7;
  legDepth = 0.3;
  topPartLength = 0.75;
  bottomPartLength = 0.75;
  legCenterDistance = 4.5;
  rotate([0,0,90]){
    translate([0,0,1+topPartLength/2]) cube([legWidth,legDepth,0.75],true);//top part
    rotate([45,0,0]) translate([0,0.7,0]) cube([legWidth,legDepth,1.2],true);//upper bended part
    rotate([-45,0,0]) translate([0,0.7,0]) cube([legWidth,legDepth,1.2],true);//lower bended part
    translate([0,0,-1-bottomPartLength/2]) cube([legWidth,legDepth,0.75],true);//bottom part
  }
}

// ------- NON STRETCHED MODULES -----

/**
 * JTP_1130 a pushbutton. High Quality Version.
 *
 * This is this standard and cheap four pin pushbutton.
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 * @tag-list: SPST, pushbutton, tactile switch, 4 pins, proto, hq, fzz2scad-compatible
 * @category-list: electronic_component, electromechanical, switch, SPST
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * 
 * @author: Hauke Thorenz <htho@thorenz.net>
 * @version: 0.1
 * @license-short: cc-by-sa-4.0
 * @license: This work is licensed under the Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit
 * http://creativecommons.org/licenses/by-sa/4.0/.
 * @license-link: http://creativecommons.org/licenses/by-sa/4.0/
 *
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/TASTER93XX.pdf
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/switch-4lead.svg
 * @manufacturer NAMAE
 * @manufacturer-product JTP-1130
 *
 * @module-dependency proto_JTP_1130_hq_distanceindipendent The common
 * model for the stretched and the unstretched version.
 *
 * @param L see datasheet
 * @param I see datasheet
 */
module proto_JTP_1130_hq(L, I){
  cubeSize = 6;
  legDepth = 0.3;
  legDistanceFromPartCenterX = (cubeSize/2)+(legDepth/2);
  legDistanceFromPartCenterY = (4.5/2); //see datasheet

  proto_JTP_1130_hq_distanceindipendent(L, I, legDistanceFromPartCenterX, legDistanceFromPartCenterY);
}

/**
 * JTP_1130 Pushbutton with a height of 4.3mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130_hq(){proto_JTP_1130_hq(4.30, 3.50);}

/**
 * JTP_1130A Pushbutton with a height of 5.00mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130A
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130A_hq(){proto_JTP_1130_hq(5.00, 3.50);}

/**
 * JTP_1130B Pushbutton with a height of 9.00mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130B
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130B_hq(){proto_JTP_1130_hq(9.50, 3.10);}

/**
 * JTP_1130C Pushbutton with a height of 8.00mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130C
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130C_hq(){proto_JTP_1130_hq(8.00, 3.20);}

/**
 * JTP_1130D Pushbutton with a height of 13.00mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130D
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130D_hq(){proto_JTP_1130_hq(13.00, 2.87);}

/**
 * JTP_1130E Pushbutton with a height of 7.30mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130E
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130E_hq(){proto_JTP_1130_hq(7.30, 3.25);}

/**
 * JTP_1130F Pushbutton with a height of 7.00mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130F
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130F_hq(){proto_JTP_1130_hq(7.00, 3.30);}

/**
 * JTP_1130P Pushbutton with a height of 8.50mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130P
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130P_hq(){proto_JTP_1130_hq(8.50, 3.09);}

/**
 * JTP_1130L Pushbutton with a height of 17.00mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130L
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130L_hq(){proto_JTP_1130_hq(17.0, 2.80);}

/**
 * JTP_1130M Pushbutton with a height of 6.00mm
 * 
 * @adopt: proto_JTP_1130_hq
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130M
 * @module-dependency: proto_JTP_1130_hq
 */
module JTP_1130M_hq(){proto_JTP_1130_hq(6.00, 3.40);}


// ------- STRETCHED MODULES -----

/**
 * JTP_1130 a pushbutton. Stretched to fit a 100mil (.1in) grid.
 *
 * This is this standard and cheap four pin pushbutton.
 *
 * @note For Fritzing make sure, that pin0 is aligned to the grid. As the
 * other pins are stretched
 * 
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 * @tag-list: SPST, pushbutton, tactile switch, 4 pins, proto, hq, fzz2scad-compatible
 * @category-list: electronic_component, electromechanical, switch, SPST
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * 
 * @author: Hauke Thorenz <htho@thorenz.net>
 * @version: 0.1
 * @license-short: cc-by-sa-4.0
 * @license: This work is licensed under the Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit
 * http://creativecommons.org/licenses/by-sa/4.0/.
 * @license-link: http://creativecommons.org/licenses/by-sa/4.0/
 *
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/TASTER93XX.pdf
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/switch-4lead.svg
 * @manufacturer NAMAE
 * @manufacturer-product JTP-1130
 *
 * @module-dependency proto_JTP_1130_hq_distanceindipendent The common
 * model for the stretched and the unstretched version.
 *
 * @param L see datasheet
 * @param I see datasheet
 */
module proto_JTP_1130_hq_stretched(L, I){
  rm = 2.54;
  cubeSize = 6;
  legDepth = 0.3;

  legDistanceFromPartCenterX = (3*rm)/2;
  legDistanceFromPartCenterY = (2*rm)/2;

  proto_JTP_1130_hq_distanceindipendent(L, I, legDistanceFromPartCenterX, legDistanceFromPartCenterY);
}

/**
 * Stretched JTP_1130 Pushbutton with a height of 4.3mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130_hq_stretched(){proto_JTP_1130_hq_stretched(4.30, 3.50);}

/**
 * JTP_1130A Pushbutton with a height of 5.00mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130A
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130A_hq_stretched(){proto_JTP_1130_hq_stretched(5.00, 3.50);}

/**
 * JTP_1130B Pushbutton with a height of 9.00mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130B
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130B_hq_stretched(){proto_JTP_1130_hq_stretched(9.50, 3.10);}

/**
 * JTP_1130C Pushbutton with a height of 8.00mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130C
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130C_hq_stretched(){proto_JTP_1130_hq_stretched(8.00, 3.20);}

/**
 * JTP_1130D Pushbutton with a height of 13.00mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130D
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130D_hq_stretched(){proto_JTP_1130_hq_stretched(13.00, 2.87);}

/**
 * JTP_1130E Pushbutton with a height of 7.30mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130E
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130E_hq_stretched(){proto_JTP_1130_hq_stretched(7.30, 3.25);}

/**
 * JTP_1130F Pushbutton with a height of 7.00mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130F
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130F_hq_stretched(){proto_JTP_1130_hq_stretched(7.00, 3.30);}

/**
 * JTP_1130P Pushbutton with a height of 8.50mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130P
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130P_hq_stretched(){proto_JTP_1130_hq_stretched(8.50, 3.09);}

/**
 * JTP_1130L Pushbutton with a height of 17.00mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130L
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130L_hq_stretched(){proto_JTP_1130_hq_stretched(17.0, 2.80);}

/**
 * JTP_1130M Pushbutton with a height of 6.00mm
 * 
 * @adopt: proto_JTP_1130_hq_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130M
 * @module-dependency: proto_JTP_1130_hq_stretched
 */
module JTP_1130M_hq_stretched(){proto_JTP_1130_hq_stretched(6.00, 3.40);}


//// ======== DRILLS ONLY ======== 

// ------- PARAMETRIC UNSPECIFIC MODULES -----

/**
 * A parametric version of the JTP_1130 pushbutton (Drills Only Version).
 *
 * The common model for the stretched and the unstretched version.
 *
 * Allows to specify the distance of the legs from the center
 * this allows using this for the standard and for the stretched version.
 * 
 * @tag-list: proto
 * 
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 *
 * @param: drillDepth The depth of the drill for this part.
 * 
 * @param legDistanceFromPartCenterX The distance of the legs from the center in x orientation.
 * @param legDistanceFromPartCenterX The distance of the legs from the center in y orientation.
 */
module proto_JTP_1130_do_distanceindipendent(legDistanceFromPartCenterX, legDistanceFromPartCenterY, drillDepth)
{
 	cubeSize = 6;
  cubeHeight = 3.6;
  legHeight = 3.5;
  legDepth = 0.3;
  legWidth = 0.7;
  legCenterDistance = 4.5;
  rm = 2.54;

  rotate([0,0,0]){ //rotating it so the orientation fits the Fritzing part 
    translate([-legDistanceFromPartCenterX,legDistanceFromPartCenterY,0]){ //Translating so the center is on connector0
      translate([0,0,]) cylinder(h=drillDepth, d=3.5); //moving part
    }
  }
}

// ------- NON STRETCHED MODULES -----

/**
 * JTP_1130 a pushbutton. Drill Only Version.
 *
 * This is this standard and cheap four pin pushbutton.
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 * @tag-list: SPST, pushbutton, tactile switch, 4 pins, proto, do, fzz2scad-compatible
 * @category-list: electronic_component, electromechanical, switch, SPST
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * 
 * @author: Hauke Thorenz <htho@thorenz.net>
 * @version: 0.1
 * @license-short: cc-by-sa-4.0
 * @license: This work is licensed under the Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit
 * http://creativecommons.org/licenses/by-sa/4.0/.
 * @license-link: http://creativecommons.org/licenses/by-sa/4.0/
 *
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/TASTER93XX.pdf
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/switch-4lead.svg
 * @manufacturer NAMAE
 * @manufacturer-product JTP-1130
 *
 * @module-dependency proto_JTP_1130_do_distanceindipendent The common
 * model for the stretched and the unstretched version.
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module proto_JTP_1130_do(drillDepth){
  cubeSize = 6;
  legDepth = 0.3;
  legDistanceFromPartCenterX = (cubeSize/2)+(legDepth/2);
  legDistanceFromPartCenterY = (4.5/2); //see datasheet
  proto_JTP_1130_do_distanceindipendent(legDistanceFromPartCenterX, legDistanceFromPartCenterY, drillDepth);
}

/**
 * JTP_1130 Pushbutton with a height of 4.3mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130A Pushbutton with a height of 5.00mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130A
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130A_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130B Pushbutton with a height of 9.00mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130B
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130B_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130C Pushbutton with a height of 8.00mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130C
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130C_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130D Pushbutton with a height of 13.00mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130D
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130D_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130E Pushbutton with a height of 7.30mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130E
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130E_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130F Pushbutton with a height of 7.00mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130F
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130F_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130P Pushbutton with a height of 8.50mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130P
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130P_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130L Pushbutton with a height of 17.00mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130L
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130L_do(drillDepth){proto_JTP_1130_do(drillDepth);}

/**
 * JTP_1130M Pushbutton with a height of 6.00mm
 * 
 * @adopt: proto_JTP_1130_do
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130M
 * @module-dependency: proto_JTP_1130_do
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130M_do(drillDepth){proto_JTP_1130_do(drillDepth);}


// ------- STRETCHED MODULES -----

/**
 * JTP_1130 a pushbutton. Stretched to fit a 100mil (.1in) grid.
 *
 * This is this standard and cheap four pin pushbutton.
 *
 * @note For Fritzing make sure, that pin0 is aligned to the grid. As the
 * other pins are stretched.
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPST/JTP_1130.scad
 * @tag-list: SPST, pushbutton, tactile switch, 4 pins, proto, do, fzz2scad-compatible
 * @category-list: electronic_component, electromechanical, switch, SPST
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * 
 * @author: Hauke Thorenz <htho@thorenz.net>
 * @version: 0.1
 * @license-short: cc-by-sa-4.0
 * @license: This work is licensed under the Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit
 * http://creativecommons.org/licenses/by-sa/4.0/.
 * @license-link: http://creativecommons.org/licenses/by-sa/4.0/
 *
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/TASTER93XX.pdf
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/switch-4lead.svg
 * @manufacturer NAMAE
 * @manufacturer-product JTP-1130
 *
 * @module-dependency proto_JTP_1130_do_distanceindipendent The common
 * model for the stretched and the unstretched version.
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module proto_JTP_1130_do_stretched(drillDepth){
  rm = 2.54;
  cubeSize = 6;
  legDepth = 0.3;
  
  legDistanceFromPartCenterX = (3*rm)/2;
  legDistanceFromPartCenterY = (2*rm)/2;
  proto_JTP_1130_do_distanceindipendent(legDistanceFromPartCenterX, legDistanceFromPartCenterY, drillDepth);
}

/**
 * Stretched JTP_1130 Pushbutton with a height of 4.3mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130A Pushbutton with a height of 5.00mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130A
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130A_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130B Pushbutton with a height of 9.00mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130B
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130B_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130C Pushbutton with a height of 8.00mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130C
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130C_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130D Pushbutton with a height of 13.00mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130D
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130D_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130E Pushbutton with a height of 7.30mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130E
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130E_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130F Pushbutton with a height of 7.00mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130F
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130F_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130P Pushbutton with a height of 8.50mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130P
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130P_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130L Pushbutton with a height of 17.00mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130L
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130L_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}

/**
 * JTP_1130M Pushbutton with a height of 6.00mm
 * 
 * @adopt: proto_JTP_1130_do_stretched
 * @tag-list-remove: proto
 *
 * @manufacturer-product JTP-1130M
 * @module-dependency: proto_JTP_1130_do_stretched
 * 
 * @param: drillDepth The depth of the drill for this part.
 */
module JTP_1130M_do_stretched(drillDepth){proto_JTP_1130_do_stretched(drillDepth);}
