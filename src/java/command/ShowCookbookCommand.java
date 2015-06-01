package command;

import controller.ActionCommand;
import entity.User;
import entityDAO.UserDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShowCookbookCommand implements ActionCommand {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String page = null, id = request.getParameter("userid");
        User user = new UserDAO().getUserById(Integer.valueOf(id));
        request.setAttribute("findrecipes", user.getRecipes());
        request.setAttribute("cookbook", "true");
        page = "/WEB-INF/views/main.jsp";
        return page;
    }

}
