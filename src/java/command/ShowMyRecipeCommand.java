package command;

import controller.ActionCommand;
import entity.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShowMyRecipeCommand implements ActionCommand {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String page = null;
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        request.setAttribute("findrecipes", user.getRecipes_1());
        page = "/WEB-INF/views/main.jsp";
        return page;
    }

}
