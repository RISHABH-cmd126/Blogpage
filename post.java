/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;

/**
 *
 * @author Lenovo
 */
public class post {
    private int pid;
    private String ptitle;
    private String pcontent;
    private String ppic;
    private int catid;
    private String pcode;
    private int user_id;

    public post(int pid, String ptitle, String pcontent, String ppic,String pcode, int catid,int user_id) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.catid = catid;
        this.user_id=user_id;
        this.pcode=pcode;
    }

    public post(String ptitle, String pcontent, String ppic,String pcode, int catid,int user_id) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.catid = catid;
         this.user_id=user_id;
         this.pcode=pcode;
    }

    public post(int pid, String ptitle, String pcontent, String ppic,String pcode,int user_id) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
         this.user_id=user_id;
         this.pcode=pcode;
    }

    public post(String ptitle, String pcontent, String ppic,String pcode,int user_id) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
         this.user_id=user_id;
         this.pcode=pcode;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public post() {
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }
    
    
}
