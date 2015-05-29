package entity;

public class StepRecipe  implements java.io.Serializable {

     private Integer stepId;
     private Recipe recipe;
     private int stepNumber;
     private String description;
     private String photo;

    public StepRecipe() {
    }

    public StepRecipe(Recipe recipe, int stepNumber, String description, String photo) {
       this.recipe = recipe;
       this.stepNumber = stepNumber;
       this.description = description;
       this.photo = photo;
    }
   
    public Integer getStepId() {
        return this.stepId;
    }
    
    public void setStepId(Integer stepId) {
        this.stepId = stepId;
    }
    public Recipe getRecipe() {
        return this.recipe;
    }
    
    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }
    public int getStepNumber() {
        return this.stepNumber;
    }
    
    public void setStepNumber(int stepNumber) {
        this.stepNumber = stepNumber;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getPhoto() {
        return this.photo;
    }
    
    public void setPhoto(String photo) {
        this.photo = photo;
    }




}


