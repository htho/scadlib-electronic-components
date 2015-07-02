/**
 * ESP10XX a slide switch.
 *
 * @filename: ESP10XX.scad
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPDT/ESP10XX.scad
 * @tag-list: SPDT, slide switch
 * @category-list: electronic_component, electromechanical, switch, SPDT
 * 
 * @author: Hauke Thorenz <htho@thorenz.net>
 * @version: 0.1
 * @license-short: cc-by-sa-4.0
 * @license: This work is licensed under the Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit
 * http://creativecommons.org/licenses/by-sa/4.0/.
 * @license-link: http://creativecommons.org/licenses/by-sa/4.0/
 */

/**
 * ESP10XX a slide switch. High quality Version.
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPDT/ESP10XX.scad
 * @tag-list: SPDT, slide switch, fzz2scad-compatible, hq
 * @category-list: electronic_component, electromechanical, switch, SPDT
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * @note: THIS IS NOT THE FRITZINGS STANDARD SPDT SWITCH! It is pin
 * compatible but slightly bigger and has a different slide mechanism.
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
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/DS_ESP_SERIE.pdf
 * @source https://github.com/sparkfun/Pro_Micro/blob/master/Hardware/Pro_Micro.brd
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/jumper_3_100mil.svg
 * @manufacturer EXCEL CELL ELECTRONIC
 * @manufacturer-product ESP10XX
 *
 * @variable-dependency: commonLegDiameter
 * @variable-dependency: commonLegLength
 */
module ESP10XX_hq()
{
  rm = 2.54;
  
  widthSocket=10;
  depthSocket=2.5;
  heightSocket=4.5;
  
  widthLeg=0.6;
  depthLeg=0.5;
  heightLeg=commonLegLength;
  
  sliderWidth = 8.4;
  sliderHeight = 1.5;
  
  rotate([0,0,-90]){ //rotating it so the orientation fits the Fritzing part 
    translate([rm,0,0]){ //Translating so the center is on connector0
      translate([0,0,heightSocket/2]) cube([widthSocket, depthSocket, heightSocket], true); //body
      
      translate([-rm,0,-commonLegLength/2]) cube([commonLegDiameter, commonLegDiameter, commonLegLength],true); //leg
      translate([0,0,-commonLegLength/2]) cube([commonLegDiameter, commonLegDiameter, commonLegLength],true); //leg
      translate([rm,0,-commonLegLength/2]) cube([commonLegDiameter, commonLegDiameter, commonLegLength],true); //leg
      
      //slider
      translate([0,0,heightSocket]) cube([sliderWidth, depthSocket, sliderHeight], true);

    }
  }
}

/**
 * ESP10XX a slide switch. Low quality Version.
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPDT/ESP10XX.scad
 * @tag-list: SPDT, slide switch, fzz2scad-compatible, lq
 * @category-list: electronic_component, electromechanical, switch, SPDT
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * @note: THIS IS NOT THE FRITZINGS STANDARD SPDT SWITCH! It is pin
 * compatible but slightly bigger and has a different slide mechanism.
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
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/DS_ESP_SERIE.pdf
 * @source https://github.com/sparkfun/Pro_Micro/blob/master/Hardware/Pro_Micro.brd
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/jumper_3_100mil.svg
 * @manufacturer EXCEL CELL ELECTRONIC
 * @manufacturer-product ESP10XX
 *
 */
module ESP10XX_lq()
{
  rm = 2.54;
  
  widthSocket=10;
  depthSocket=2.5;
  heightSocket=4.5;
    
  rotate([0,0,-90]){ //rotating it so the orientation fits the Fritzing part 
    translate([rm,0,0]){ //Translating so the center is on connector0
      translate([0,0,heightSocket/2]) cube([widthSocket, depthSocket, heightSocket], true); //body
    }
  }
}

/**
 * ESP10XX a slide switch. Drill Only Version.
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/switches/switches/SPDT/ESP10XX.scad
 * @tag-list: SPDT, slide switch, fzz2scad-compatible, do
 * @category-list: electronic_component, electromechanical, switch, SPDT
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * @note: THIS IS NOT THE FRITZINGS STANDARD SPDT SWITCH! It is pin
 * compatible but slightly bigger and has a different slide mechanism.
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
 * @source https://cdn-reichelt.de/documents/datenblatt/C200/DS_ESP_SERIE.pdf
 * @source https://github.com/sparkfun/Pro_Micro/blob/master/Hardware/Pro_Micro.brd
 * @source https://github.com/fritzing/fritzing-parts/blob/master/svg/core/pcb/jumper_3_100mil.svg
 * @manufacturer EXCEL CELL ELECTRONIC
 * @manufacturer-product ESP10XX
 *
 * @param: drillDepth The depth of the drill for this part.
 */
module ESP10XX_do(drillDepth){
  rm = 2.54;
  widthSocket=10;
  depthSocket=2.5;  
  rotate([0,0,-90]){ //rotating it so the orientation fits the Fritzing part 
    translate([rm,0,0]){ //Translating so the center is on connector0
      translate([0,0,drillDepth/2]) cube([widthSocket, depthSocket, drillDepth], true); //body
    }
  }
}
