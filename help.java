/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.helper;

import java.io.FileOutputStream;
import java.io.InputStream;

/**
 * 
 * @author Lenovo
 */
public class help {
    
    public static boolean savefile(InputStream is,String path){
        boolean f=false;
        try{
            byte b[]=new byte[is.available()];
            is.read(b);
            try {
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(b);
                fos.flush();
                 f=true;
            }catch(Exception e){
                e.printStackTrace();
            }
           
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
