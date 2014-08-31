/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package JAVA;

import java.math.BigDecimal;

/**
 *
 * @author Naushad Ahmad
 */
public class Demo {
 public static void main(String arg[])
 {
    final Customer c=new Customer();
                        final Item it=new Item();
                            c.setCID("LPUC0007");
                            c.setName("Apoorv Gupta");
                            c.setAddress("Haripuram Colony");
                            c.setCity("Dehradun");
                            c.setEmail("Apoorv1993@live.com");
                            it.setQuantity(2);
                            it.setUnitprice(new BigDecimal(550));
                            it.setDescription("Yeah");
                            
                            
                            
                            
                                  new Thread(new Runnable() {
                                    public void run() {
                                        try {
                                            new InvoiceDesign(new InvoiceData(c,it,100),"LOVELY PROFESSIONAL");
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }
                                     }
                                    }).start();  

                             
                            

                        }
 
 }

