package command;

import controller.ActionCommand;
import entity.Category;
import entity.Recipe;
import entity.User;
import entityDAO.CategoryDAO;
import entityDAO.RecipeDAO;
import entityDAO.UserDAO;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindRecipeCommand implements ActionCommand {

    public FindRecipeCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String page = null;
        String name = request.getParameter("find");
        List<Recipe> recipes = null;
        recipes = new RecipeDAO().findEntyties(name);
        request.setAttribute("findrecipes", recipes);
        
        page = "/WEB-INF/views/main.jsp";
         
         
        // request.setAttribute("category", null);
        
        return page;
    }

}
