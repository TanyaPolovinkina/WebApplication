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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AddRecipeCommand implements ActionCommand {

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

    public AddRecipeCommand() {
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
    String action = "add";

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

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
            if(action.compareTo("add")==0)
            request.setAttribute("message", "Произошла ошибка при добавлении");
            else request.setAttribute("message", "Произошла ошибка при редактировании");
            String page = "/WEB-INF/views/main.jsp";
        }
        String page = "/WEB-INF/views/main.jsp";
         if(action.compareTo("add")==0)
        request.setAttribute("message", "Рецепт успешно добавлен");
         else request.setAttribute("message", "Рецепт успешно отредактирован");
        return page;
    }

    private void processUploadedFile(FileItem item, HttpServletRequest request) throws Exception {

        File uploadetFile = null;
        String path = null;
        String path_photo = null;
        if (item.getName().compareTo("") == 0) {
            path_photo = "";
        } else {
            do {

                path_photo = "upload/" + random.nextInt() + item.getName();
                path = "C:\\Users\\Tanya\\Documents\\NetBeansProjects\\WebApplication1\\web\\" + path_photo;
                uploadetFile = new File(path);

            } while (uploadetFile.exists());

            uploadetFile.createNewFile();
            item.write(uploadetFile);

        }
        if (item.getFieldName().compareTo("data") == 0) {
            recipe.setRecipePhoto(path_photo);

        } else if (item.getFieldName().compareTo("data_dscrb") == 0) {

           step.setPhoto(path_photo);
            new StepDAO().add(step);

        }

    }

    private void processFormField(FileItem item, HttpServletRequest request) throws UnsupportedEncodingException {
        if (item.getFieldName().compareTo("user") == 0) {
            User user = new User();
            user = new UserDAO().getUserById(Integer.valueOf(item.getString("UTF-8")));
            recipe.setUser(user);

        } else if (item.getFieldName().compareTo("recipeid") == 0) {
            action = "update";
            recipe = new RecipeDAO().findEntityById(Integer.valueOf(item.getString("UTF-8")));
        }
        else if (item.getFieldName().compareTo("recipeingredient") == 0) {
            action = "update";
            recipeingr = new RecipeIngredientDAO().findEntityById(Integer.valueOf(item.getString("UTF-8")));
        }
        else if (item.getFieldName().compareTo("step") == 0) {
            action = "update";
            step = new StepDAO().findEntityById(Integer.valueOf(item.getString("UTF-8")));
        }else if (item.getFieldName().compareTo("name_recipe") == 0) {
            
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
            if (action.compareTo("add") == 0) {
                new RecipeDAO().addRecipe(recipe);
            } else {
                new RecipeDAO().update(recipe);
            }
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
            if (action.compareTo("add") == 0) {
                new RecipeIngredientDAO().add(recipeingr);
            } else {
                new RecipeIngredientDAO().update(recipeingr);
            }

        } else if (item.getFieldName().compareTo("dscrb") == 0) {
            step.setDescription(item.getString("UTF-8"));
            step.setStepNumber(stepnumber);
            stepnumber++;
            step.setRecipe(recip);
            if (action.compareTo("update") == 0) {
                new StepDAO().update(step);
            }

        }
    }
}
