package controller;

import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

class ActionFactory {

    public ActionCommand defineCommand(HttpServletRequest request) throws FileUploadException {
        ActionCommand current = new EmptyCommand();
        String action = null;
        if (ServletFileUpload.isMultipartContent(request)) {
            action = "addrecipe";
        } else {
            action = request.getParameter("command");
            if (action == null || action.isEmpty()) {
                return current;
            }
        }
        try {
            CommandEnum currentEnum = CommandEnum.valueOf(action.toUpperCase());
            current = currentEnum.getCurrentCommand();
        } catch (IllegalArgumentException e) {
        }

        return current;
    }

}
