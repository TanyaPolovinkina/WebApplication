/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import controller.ActionCommand;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tanya
 */
public class LogoutCommand implements ActionCommand {

    public LogoutCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession(false);
     session.setAttribute("user", null);
    String page = "/WEB-INF/views/main.jsp";
    return page;
    }
    
}
