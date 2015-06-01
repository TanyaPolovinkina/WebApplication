/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import controller.ActionCommand;
import entity.Category;
import entity.Recipe;
import entity.User;
import entityDAO.CategoryDAO;
import entityDAO.RecipeDAO;
import entityDAO.UserDAO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tanya
 */
public class AddRecipeCookbookCommand implements ActionCommand {

    public AddRecipeCookbookCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String page = null;
        String id = request.getParameter("recipeid");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Recipe recipe = new RecipeDAO().findEntityById(Integer.valueOf(id));
        user.addRecipe(recipe);
         new UserDAO().update(user);
        session.setAttribute("user", user);
        String str = "Рецепт \"" + recipe.getRecipeName() + "\" успешно добавлен";
        request.setAttribute("message", str);
        page = "/WEB-INF/views/main.jsp";
        return page;
    }

}
