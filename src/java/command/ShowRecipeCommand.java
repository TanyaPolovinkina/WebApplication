package command;

import controller.ActionCommand;
import entity.Category;
import entity.Recipe;
import entity.Recipeingredient;
import entity.StepRecipe;
import entity.User;
import entityDAO.CategoryDAO;
import entityDAO.RecipeDAO;
import entityDAO.UserDAO;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowRecipeCommand implements ActionCommand {

    public ShowRecipeCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String page = null;
        String menu = request.getParameter("param");
        Category category = null;
        category = new CategoryDAO().getElementByName(menu);
        request.setAttribute("category", category);
        page = "/WEB-INF/views/main.jsp";
        return page;
    }

}
