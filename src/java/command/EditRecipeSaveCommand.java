/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import controller.ActionCommand;
import entity.Category;
import entity.Ingredient;
import entity.Recipe;
import entity.Recipeingredient;
import entity.StepRecipe;
import entity.User;
import entityDAO.CategoryDAO;
import entityDAO.IngredientDAO;
import entityDAO.RecipeDAO;
import entityDAO.RecipeIngredientDAO;
import entityDAO.StepDAO;
import entityDAO.UserDAO;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class EditRecipeSaveCommand implements ActionCommand {

     Recipe recipe;
    Category category;
    Ingredient ingredient;
    Recipeingredient recipeingr;
    StepRecipe step;
    int stepnumber;
    CategoryDAO categoryDAO;
    IngredientDAO ingredientDAO;
    Set ingredients = new HashSet();
    Set steps = new HashSet();
    Set categories = new HashSet();
    Set stepphotos = new HashSet();
    Recipe recip;

    public EditRecipeSaveCommand() {
        recipe = new Recipe();
        category = new Category();
        ingredient = new Ingredient();
        recipeingr = new Recipeingredient();
        step = new StepRecipe();
        stepnumber = 1;
        categoryDAO = new CategoryDAO();
        ingredientDAO = new IngredientDAO();
        recip = new Recipe();
    }
    private Random random = new Random();
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
    String id = request.getParameter("recipeid"),
            recipeName = request.getParameter("name_recipe"),
            time = request.getParameter("time_cooking");
    
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 1024);
        File tempDir = (File) request.getServletContext().getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(tempDir);
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(1024 * 1024 * 100);
        try {
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
           
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {
                    {
                        processFormField(item, request);
                    }
                } else {
                    processUploadedFile(item, request);
                }
            }
        } catch (Exception e) {
            return "/WEB-INF/views/register.jsp";
        }
        String page = "/WEB-INF/views/recipe.jsp";
        request.setAttribute("recipe", recip);

        return page;
    }

    private void processUploadedFile(FileItem item, HttpServletRequest request) throws Exception {
   
    }

    private void processFormField(FileItem item, HttpServletRequest request) throws UnsupportedEncodingException {
        System.out.println(item.getFieldName() + "=" + item.getString("UTF-8"));
        if (item.getFieldName().compareTo("recipeid") == 0) {
            
            recipe.setRecipeId(Integer.valueOf(item.getString("UTF-8")));
            

        } else if (item.getFieldName().compareTo("userid") == 0) {
            User user = new User();
            user = new UserDAO().getUserById(Integer.valueOf(item.getString("UTF-8")));
            recipe.setUser(user);

        } else if (item.getFieldName().compareTo("name_recipe") == 0) {
            recipe.setRecipeName(item.getString("UTF-8"));

        } else if (item.getFieldName().compareTo("time_cooking") == 0) {
            recipe.setCookingTime(Integer.valueOf(item.getString("UTF-8")));
        } else if (item.getFieldName().compareTo("category") == 0) {
            category = new CategoryDAO().getElementByName(item.getString("UTF-8"));
            categories.add(category);
        } else if (item.getFieldName().compareTo("kitchen") == 0) {
            category = new CategoryDAO().getElementByName(item.getString("UTF-8"));
            categories.add(category);
            recipe.setCategories(categories);
            new RecipeDAO().update(recipe);
            recip = new RecipeDAO().findEntity(recipe);
            
        } else if (item.getFieldName().compareTo("ingr") == 0) {
            ingredient.setIngredientName(item.getString("UTF-8"));
            boolean result = ingredientDAO.addIngredient(ingredient);
            if (result == false) {
                ingredient = ingredientDAO.getElementByName(item.getString("UTF-8"));
            }
            recipeingr.setIngredient(ingredient);
        } else if (item.getFieldName().compareTo("kol") == 0) {
            recipeingr.setQuantity(Double.valueOf(item.getString("UTF-8")));
        } else if (item.getFieldName().compareTo("unit") == 0) {
            recipeingr.setUnit(item.getString("UTF-8"));
            recipeingr.setRecipe(recip);
            new RecipeIngredientDAO().update(recipeingr);
        } else if (item.getFieldName().compareTo("dscrb") == 0) {
            step.setDescription(item.getString("UTF-8"));
            step.setStepNumber(stepnumber);
            stepnumber++;
            step.setRecipe(recip);
            new StepDAO().update(step);

        }
    }
    
}
