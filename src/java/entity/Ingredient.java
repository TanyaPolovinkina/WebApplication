package entity;
// Generated 25.05.2015 15:34:14 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Ingredient generated by hbm2java
 */
public class Ingredient  implements java.io.Serializable {


     private Integer ingredientId;
     private String ingredientName;
     private Set<Recipeingredient> recipeingredients = new HashSet<Recipeingredient>(0);

    public Ingredient() {
    }

	
    public Ingredient(String ingredientName) {
        this.ingredientName = ingredientName;
    }
    public Ingredient(String ingredientName, Set<Recipeingredient> recipeingredients) {
       this.ingredientName = ingredientName;
       this.recipeingredients = recipeingredients;
    }
   
    public Integer getIngredientId() {
        return this.ingredientId;
    }
    
    public void setIngredientId(Integer ingredientId) {
        this.ingredientId = ingredientId;
    }
    public String getIngredientName() {
        return this.ingredientName;
    }
    
    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }
    public Set<Recipeingredient> getRecipeingredients() {
        return this.recipeingredients;
    }
    
    public void setRecipeingredients(Set<Recipeingredient> recipeingredients) {
        this.recipeingredients = recipeingredients;
    }




}


