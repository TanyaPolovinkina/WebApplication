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
        String id = request.getParameter("param");
        Recipe recipe = null;
        recipe = new RecipeDAO().findEntityById(Integer.valueOf(id));
        request.setAttribute("recipe", recipe);
        Set steps = new HashSet<StepRecipe>();
        steps = recipe.getStepRecipes();
        Set<StepRecipe> sortedSet = new TreeSet<StepRecipe>(new Comparator<StepRecipe>() {
            @Override
            public int compare(StepRecipe o1, StepRecipe o2) {
                if (o1.getStepNumber() > o2.getStepNumber()) {
                    return 1;
                } else {
                    return -1;
                }
            }
        });
        sortedSet.addAll(steps);
        request.setAttribute("steps", sortedSet);
        page = "/WEB-INF/views/recipe.jsp";
        return page;
    }

}
