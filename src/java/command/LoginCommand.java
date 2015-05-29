package command;

import controller.ActionCommand;
import entity.Category;
import entity.Recipe;
import entity.Recipeingredient;
import entity.StepRecipe;
import entity.User;
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
import javax.servlet.http.HttpSession;

public class LoginCommand implements ActionCommand {

    private static final String PARAM_NAME_LOGIN = "login";
    private static final String PARAM_NAME_PASSWORD = "password";

    public LoginCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String page = null;
        String login = request.getParameter(PARAM_NAME_LOGIN),
                password = request.getParameter(PARAM_NAME_PASSWORD);
        User user = new User();
        UserDAO user_check = new UserDAO();
        user = user_check.check_client(login, password);

        if (user != null) {
            Recipe recipe = new RecipeDAO().findEntityById(49);
            
            /*Set category = new HashSet<Category>();
            category = recipe.getCategories();
            List c = new ArrayList<Category>(category);

            Set ri = new HashSet<Recipeingredient>();
            ri = recipe.getRecipeingredients();
            Recipeingredient r;
            r = (Recipeingredient) ri.iterator().next();
            System.out.println(r.getIngredient().getIngredientName());
            Set steps = new HashSet<StepRecipe>();
            steps = recipe.getStepRecipes();
            Set<StepRecipe> sortedSet = new TreeSet<StepRecipe>(new Comparator<StepRecipe>() {
                @Override
                public int compare(StepRecipe o1, StepRecipe o2) {
                    if(o1.getStepNumber()> o2.getStepNumber())
                    return 1;
                    else
                    return -1;
                }
            });
            sortedSet.addAll(steps);*/
           // request.setAttribute("user", user);
           /* request.setAttribute("recipe", recipe);
            request.setAttribute("category", c);
            request.setAttribute("steps", sortedSet);*/
            request.setAttribute("message", "Добро пожаловать!!!");
            HttpSession session = request.getSession(true);
            if(session.getAttribute("user")== null)
                session.setAttribute("user", user);
            page = "/WEB-INF/views/main.jsp";
        } else {
            request.setAttribute("error_enter", "Неверный логин или пароль");
            page = "/WEB-INF/views/enter.jsp";
        }

        return page;
    }

}
