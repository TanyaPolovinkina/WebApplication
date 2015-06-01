/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import controller.ActionCommand;
import entity.Category;
import entity.Recipe;
import entity.StepRecipe;
import entityDAO.RecipeDAO;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tanya
 */
public class EditRecipeCommand implements ActionCommand {

    public EditRecipeCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String page = null, id = request.getParameter("recipeid");
        Recipe recipe = new RecipeDAO().findEntityById(Integer.valueOf(id));
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
        page = "/WEB-INF/views/edit_recipe.jsp";
        return page;

    }

}
