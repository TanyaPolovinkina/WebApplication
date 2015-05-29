package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "controller", urlPatterns = {"/controller"})
public class controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        request.setCharacterEncoding("UTF-8");
        String page;
        if (ServletFileUpload.isMultipartContent(request)) {
            ActionFactory client = new ActionFactory();
            ActionCommand command = client.defineCommand(request);
            page = command.execute(request, response);
        } else if (request.getParameter("command").compareTo("enterpage") == 0) {
            page = "/WEB-INF/views/enter.jsp";
        } else if (request.getParameter("command").compareTo("registerpage") == 0) {
            page = "/WEB-INF/views/register.jsp";
        } else if (request.getParameter("command").compareTo("add") == 0) {
            page = "/WEB-INF/views/add_recipe.jsp";
        } else {
            ActionFactory client = new ActionFactory();
            ActionCommand command = client.defineCommand(request);
            page = command.execute(request, response);
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
