/**
 * SparkFun ProMicro
 *
 * @filename: pro_micro.scad
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/modules/arduino_compatible/sparkfun/pro_micro.scad
 * @tag-list: pro micro, sparkfun, ATmega32U4, leonardo
 * @category-list: electronic_components, modules, arduino_compatible, sparkfun
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
 * SparkFun ProMicro. Low Quality Version.
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/modules/arduino_compatible/sparkfun/pro_micro.scad
 * @tag-list: fzz2scad-compatible, pro micro, sparkfun, ATmega32U4, leonardo, lq
 * @category-list: electronic_components, modules, arduino_compatible, sparkfun
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
 * @source https://github.com/sparkfun/Pro_Micro
 * @source https://github.com/sparkfun/Pro_Micro/blob/master/Hardware/Pro_Micro.brd
 * @fritzing none/mystery
 *
 * @todo: get good data for pcb_height
 * @todo: testing
 * 
 * @param: distanceFromPCB if mounted on a pcb it is probably
 * connected using a connector. This is the distance from the top of the
 * pcb to the bottom of this part. (=height of the connector)
 */
module pro_micro_lq(distanceFromPCB=0)
{
  pcb_width = 17.78;
  pcb_depth = 33.02;
  pcb_height = 1.6; //guessed


  usb_depth = 2.85+2.15;
  usb_width = 2*3.9;
  usb_height = 2*1.27;
  usb_center_x = 0; //usb_width/2;
  usb_center_y = -2.15/2;

  usb_pos_x = 0;//8.89/2;
  usb_pos_y = 31.75/2;
  usb_pos_z = (pcb_height/2) + (usb_height/2);

  connector0_x = (pcb_width/2) - 1.27;
  connector0_y = (pcb_depth/2) - (1.27 + 11*2.54);

 translate([0,0,distanceFromPCB]) //translate to the given distance
 rotate([0,0,0]){ //rotating it so the orientation fits the Fritzing part
    translate([connector0_x, connector0_y,pcb_height/2]){ //Translating so the center is on connector0
      cube([pcb_width, pcb_depth, pcb_height], true); //PCB
      translate([usb_pos_x,usb_pos_y,usb_pos_z]) translate([usb_center_x,usb_center_y,0]) cube([usb_width, usb_depth, usb_height], true); //USB

    }
  }
}

/**
 * SparkFun ProMicro. Drill Only Version. (We need a drill for the usb port.)
 *
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/modules/arduino_compatible/sparkfun/pro_micro.scad
 * @tag-list: fzz2scad-compatible, pro micro, sparkfun, ATmega32U4, leonardo, lq
 * @category-list: electronic_components, modules, arduino_compatible, sparkfun
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
 * @source https://github.com/sparkfun/Pro_Micro
 * @source https://github.com/sparkfun/Pro_Micro/blob/master/Hardware/Pro_Micro.brd
 * 
 * @todo: get good data for pcb_height
 * @todo: testing
 *
 * @param: distanceFromPCB if mounted on a pcb it is probably
 * connected using a connector. This is the distance from the top of the
 * pcb to the bottom of this part. (=height of the connector)
 *
 * @param: drillDepth The depth of the drill for this part.
 */
module pro_micro_do(drillDepth, distanceFromPCB=0)
{
  pcb_width = 17.78;
  pcb_depth = 33.02;
  pcb_height = 1.6; //guessed


  usb_depth = 2.85+2.15;
  usb_width = 2*3.9;
  usb_height = 2*1.27;
  usb_center_x = 0; //usb_width/2;
  usb_center_y = -2.15/2;

  usb_pos_x = 0;//8.89/2;
  usb_pos_y = 31.75/2;
  usb_pos_z = (pcb_height/2) + (usb_height/2);

  connector0_x = (pcb_width/2) - 1.27;
  connector0_y = (pcb_depth/2) - (1.27 + 11*2.54);


 rotate([0,0,0]){ //rotating it so the orientation fits the Fritzing part
    translate([connector0_x, connector0_y,distanceFromPCB]){ //Translating so the center is on connector0
      translate([usb_pos_x,usb_pos_y+drillDepth/2,usb_pos_z]) translate([usb_center_x,usb_center_y,distanceFromPCB]) cube([usb_width, drillDepth, usb_height], true); //Drill
    }
  }
}
