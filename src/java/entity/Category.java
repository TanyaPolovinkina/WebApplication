package entity;

import java.util.HashSet;
import java.util.Set;


public class Category  implements java.io.Serializable {


     private Integer categoryId;
     private String categoryName;
     private Set<Recipe> recipes = new HashSet<Recipe>(0);

    public Category() {
    }

    public Category(String categoryName, Set<Recipe> recipes) {
       this.categoryName = categoryName;
       this.recipes = recipes;
    }
   
    public Integer getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() {
        return this.categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public Set<Recipe> getRecipes() {
        return this.recipes;
    }
    
    public void setRecipes(Set<Recipe> recipes) {
        this.recipes = recipes;
    }




}


