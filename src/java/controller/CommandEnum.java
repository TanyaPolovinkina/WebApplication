package controller;

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
    SHOWRECIPES{
        {
            this.command = new ShowRecipeCommand();
        }
    },
    SHOWMYRECIPES{
        {
            this.command = new ShowMyRecipeCommand();
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
    };
    ActionCommand command;
    public ActionCommand getCurrentCommand(){
        return command;
    }
}
