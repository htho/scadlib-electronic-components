/**
 * Any type of perforated printed circuit boards: aka. perfboards
 *
 * In other words: PCBs with a bunch of holes for prototyping purposes
 * or for the production of small series.
 *
 * @filename: perfboards.scad
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/other/printed_circuit_boards/perfboards.scad
 * @tag-list: perfboard, pcb, prototyping
 * @category-list: electronic_component, electromechanical, other, printed_circuit_board
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
 * A simple parametric perfboard.
 *
 * Spacing is 100mil = 2.54mm = 0.1in
 * 
 * @uri: https://github.com/htho/fzz2scad-lib/lib/electronic_components/electromechanical/other/printed_circuit_boards/perfboards.scad
 * @note: fzz2scad-compatible, see https://github.com/htho/fzz2scad
 * @tag-list: perfboard, pcb, prototyping, fzz2scad-compatible
 * @category-list: electronic_component, electromechanical, other, printed_circuit_board
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
module perfboardPCB_100mil(width, depth, height)
{
  rm = 2.54;
  rmWidth = floor(width/rm)*rm;
  rmDepth = floor(depth/rm)*rm;
  dDrill = 1;
  hDrill = height+2;

    mirror([0,-1,0])
    difference(){
      translate([width/2,depth/2,-height/2]) cube([width, depth, height], true);
      
      union(){
        for (i = [0:rm:+rmWidth]){
          for (j = [0:rm:+rmDepth]){
            translate([i,j,-height/2]) cylinder(h=hDrill, d=dDrill,center=true);
          }
        }
      }
    }

}
