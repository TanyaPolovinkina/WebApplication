package command;

import controller.ActionCommand;
import entity.User;
import entityDAO.UserDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterCommand implements ActionCommand {

    private static final String PARAM_NAME_LOGIN = "login";
    private static final String PARAM_NAME_PASSWORD = "password";
    private static final String PARAM_NAME_FIRSTNAME = "firstname";
    private static final String PARAM_NAME_LASTNAME = "lastname";

    public RegisterCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String page = null;
        String login = request.getParameter(PARAM_NAME_LOGIN),
                password = request.getParameter(PARAM_NAME_PASSWORD),
                firstname = request.getParameter(PARAM_NAME_FIRSTNAME),
                lastname = request.getParameter(PARAM_NAME_LASTNAME);
        UserDAO user_add = new UserDAO();
        User user = new User();
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setLogin(login);
        user.setPassword(password);        
        boolean result = user_add.addUser(user);
        if(result)
        {
        request.setAttribute("message", "Вы удачно зарегестрированы!!!");
        page = "/WEB-INF/views/main.jsp";
        }
        else 
        {
            request.setAttribute("error_register","Пользователь с таким login уже существует");
            page = "/WEB-INF/views/register.jsp";
        }
        return page;

    }

}
