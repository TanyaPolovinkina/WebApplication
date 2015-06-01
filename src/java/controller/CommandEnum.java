package controller;

import command.DeleteRecipeCommand;
import command.AddRecipeCookbookCommand;
import command.DeleteRecipeCookbookCommand;
import command.EditRecipeSaveCommand;
import command.EditRecipeCommand;
import command.ShowRecipesCommand;
import command.LogoutCommand;
import command.AddRecipeCommand;
import command.FindRecipeCommand;
import command.LoginCommand;
import command.RegisterCommand;
import command.ShowCookbookCommand;
import command.ShowMyRecipeCommand;
import command.ShowRecipeCommand;


public enum CommandEnum {
    LOGIN{
        {
        this.command = new LoginCommand();
        }
    },
    LOGOUT{
        {
            this.command = new LogoutCommand(); 
        }
        
    },
    REGISTER{
        {
             this.command = new RegisterCommand();
        }
    },
    ADDRECIPE{
        {
             this.command = new AddRecipeCommand();
        }
    },
    EDITRECIPE{
        {
             this.command = new EditRecipeSaveCommand();
        }
    },
    SHOWRECIPES{
        {
            this.command = new ShowRecipesCommand();
        }
    },
    SHOWMYRECIPES{
        {
            this.command = new ShowMyRecipeCommand();
        }
    },
    SHOWRECIPE{
        {
            this.command = new ShowRecipeCommand();
        }
    },
    SHOWCOOKBOOK{
        {
            this.command = new ShowCookbookCommand();
        }
    },
    FINDRECIPE{
        {
            this.command = new FindRecipeCommand();
        }
    },
    EDIT{
        {
            this.command = new EditRecipeCommand();
        }
    },
    ADDCOOKBOOK{
        {
            this.command = new AddRecipeCookbookCommand();
        }
    },
    DELETE{
        {
            this.command = new DeleteRecipeCookbookCommand();
        }
    },
    DELETEBYADMIN{
        {
            this.command = new DeleteRecipeCommand();
        }
    };
    ActionCommand command;
    public ActionCommand getCurrentCommand(){
        return command;
    }
}
