/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.techblog.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.techblog.entities.User;
import com.techblog.entities.post;
import com.techblog.helper.connectionprovider;
import com.techblog.dao.postdao;
import com.techblog.helper.help;


import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

/**
 *
 * @author Lenovo
 */
@MultipartConfig
public class postservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet postservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            int select=Integer.parseInt(request.getParameter("select"));
            System.out.println(select);
            String ptitle=request.getParameter("ptitle");
            String pcontent=request.getParameter("pcontent");
            String pcode=request.getParameter("pcode");
            Part part=request.getPart("image");
            String partname=part.getSubmittedFileName();
            out.println(partname);
            HttpSession s=request.getSession();
            User u=(User)s.getAttribute("currentuser");
            post p=new post(ptitle,pcontent,partname,pcode,select,u.getId());
            postdao pd=new postdao(connectionprovider.getConnection());
            boolean f=pd.addpost(p);
            String path="C:/Users/Lenovo/OneDrive/Documents/NetBeansProjects/techblog/web/img/"+partname;
            if(f){
                help.savefile(part.getInputStream(),path);
               response.sendRedirect("profile.jsp");
                out.print("true");
                s.setAttribute("done", "sure");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
