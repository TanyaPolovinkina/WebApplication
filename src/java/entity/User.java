package entity;
// Generated 25.05.2015 15:34:14 by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User implements java.io.Serializable {

    private Integer userId;
    private String login;
    private String password;
    private String firstname;
    private String lastname;
    private Set<Recipe> recipes = new HashSet<Recipe>();
    private Set<Recipe> recipes_1 = new HashSet<Recipe>();

    public User() {
    }

    public void addRecipe(Recipe obj) {
        recipes.add(obj);
    }

    public User(String login, String password, String firstname, String lastname) {
        this.login = login;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public User(String login, String password, String firstname, String lastname, Set<Recipe> recipes, Set<Recipe> recipes_1) {
        this.login = login;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.recipes = recipes;
        this.recipes_1 = recipes_1;
    }

    public Integer getUserId() {
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLogin() {
        return this.login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return this.firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return this.lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Set<Recipe> getRecipes() {
        return this.recipes;
    }

    public void setRecipes(Set<Recipe> recipes) {
        this.recipes = recipes;
    }

    public Set<Recipe> getRecipes_1() {
        return this.recipes_1;
    }

    public void setRecipes_1(Set<Recipe> recipes_1) {
        this.recipes_1 = recipes_1;
    }

    public void deleteRecipe(Recipe recipe) {
        Iterator iter = recipes.iterator();
        Recipe rec;
        while(iter.hasNext())
        {
            rec= (Recipe) iter.next();
            if(rec.getRecipeId()==recipe.getRecipeId())
                iter.remove();
        }
        
       
    }

}
