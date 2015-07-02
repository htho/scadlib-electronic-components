/**
 * Standard PCBs
 *
 * @filename: pcb.scad
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/other/printed_circuit_boards/pcbs.scad
 * @tag-list: pcb, printed_circuit_boards
 * @category-list: electronic_component, electromechanical, other, printed_circuit_board, pcb
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
 * A PCB which is not "printed"
 * 
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/other/printed_circuit_boards/pcbs.scad
 * @tag-list: perfboard, pcb, prototyping, fzz2scad-compatible
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * @category-list: electronic_component, electromechanical, other, printed_circuit_board, pcb
 * @author: Hauke Thorenz <htho@thorenz.net>
 * @version: 0.1
 * @license-short: cc-by-sa-4.0
 * @license: This work is licensed under the Creative Commons
 * Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit
 * http://creativecommons.org/licenses/by-sa/4.0/.
 * @license-link: http://creativecommons.org/licenses/by-sa/4.0/
 *
 * @param width Width of this PCB
 * @param depth Depth of this PCB
 * @param height Height of this PCB (1.2mm and 1.6mm are common heights)
 */
module basicPCB_lq(width, depth, height)
{
 mirror([0,-1,0])rotate([0,0,0]){ //rotating it so the orientation fits the Fritzing part 
    translate([width/2,depth/2,-height/2]){ //Translating so the center is on connector0
      cube([width, depth, height], true);
    }
  }
}
