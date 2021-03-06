package entity;
// Generated 25.05.2015 15:34:14 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Recipe generated by hbm2java
 */
public class Recipe  implements java.io.Serializable {


     private Integer recipeId;
     private User user;
     private String recipeName;
     private int cookingTime;
     private String recipePhoto;
     private Set<Recipeingredient> recipeingredients = new HashSet<Recipeingredient>(0);
     private Set<Category> categories = new HashSet<Category>(0);
     private Set<StepRecipe> stepRecipes = new HashSet<StepRecipe>(0);
     private Set<User> users = new HashSet<User>(0);

    public Recipe() {
    }

	
    public Recipe(User user, String recipeName, int cookingTime, String recipePhoto) {
        this.user = user;
        this.recipeName = recipeName;
        this.cookingTime = cookingTime;
        this.recipePhoto = recipePhoto;
    }
    public Recipe(User user, String recipeName, int cookingTime, String recipePhoto, Set<Recipeingredient> recipeingredients, Set<Category> categories, Set<StepRecipe> stepRecipes, Set<User> users) {
       this.user = user;
       this.recipeName = recipeName;
       this.cookingTime = cookingTime;
       this.recipePhoto = recipePhoto;
       this.recipeingredients = recipeingredients;
       this.categories = categories;
       this.stepRecipes = stepRecipes;
       this.users = users;
    }
   
    public Integer getRecipeId() {
        return this.recipeId;
    }
    
    public void setRecipeId(Integer recipeId) {
        this.recipeId = recipeId;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getRecipeName() {
        return this.recipeName;
    }
    
    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }
    public int getCookingTime() {
        return this.cookingTime;
    }
    
    public void setCookingTime(int cookingTime) {
        this.cookingTime = cookingTime;
    }
    public String getRecipePhoto() {
        return this.recipePhoto;
    }
    
    public void setRecipePhoto(String recipePhoto) {
        this.recipePhoto = recipePhoto;
    }
    public Set<Recipeingredient> getRecipeingredients() {
        return this.recipeingredients;
    }
    
    public void setRecipeingredients(Set<Recipeingredient> recipeingredients) {
        this.recipeingredients = recipeingredients;
    }
    public Set<Category> getCategories() {
        return this.categories;
    }
    
    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }
    public Set<StepRecipe> getStepRecipes() {
        return this.stepRecipes;
    }
    
    public void setStepRecipes(Set<StepRecipe> stepRecipes) {
        this.stepRecipes = stepRecipes;
    }
    public Set<User> getUsers() {
        return this.users;
    }
    
    public void setUsers(Set<User> users) {
        this.users = users;
    }




}


