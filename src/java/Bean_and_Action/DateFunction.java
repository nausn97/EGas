/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Bean_and_Action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.concurrent.TimeUnit;

public class DateFunction {    
    public static int[] getDateComponent(String date)
    {
        int n[]=new int[3];
        StringTokenizer tk=new StringTokenizer(date,"-");
        n[0]=Integer.parseInt(tk.nextToken());
        n[1]=Integer.parseInt(tk.nextToken())-1;
        n[2]=Integer.parseInt(tk.nextToken());
        return n;
    }
    public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
        long diffInMillies = date2.getTime() - date1.getTime();
        return timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);
    }
    public static void main(String[] args){
        String date1 = "2014-05-12";
        String date2 = "2014-06-28";
        DateFormat d = new SimpleDateFormat("yyyy-MM-dd");
        try{
            Date dat1 = d.parse(date1);
            Date dat2 = d.parse(date2);
            long n = DateFunction.getDateDiff(dat1, dat2, TimeUnit.DAYS);
            System.out.println("Difference: "+n);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        //long n = DateFunction.getDateDiff(date1, date2, TimeUnit.DAYS );
    }
    
}
