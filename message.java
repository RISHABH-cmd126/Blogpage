/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;

/**
 *
 * @author Lenovo
 */
public class message {
    private String content;
    private String type;
    private String cssstyle;

    public message(String content, String type, String cssstyle) {
        this.content = content;
        this.type = type;
        this.cssstyle = cssstyle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssstyle() {
        return cssstyle;
    }

    public void setCssstyle(String cssstyle) {
        this.cssstyle = cssstyle;
    }
    
    
}
