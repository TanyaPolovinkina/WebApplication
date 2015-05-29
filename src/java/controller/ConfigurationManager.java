
package controller;

import java.util.ResourceBundle;
import java.util.logging.Logger;

public class ConfigurationManager {
    private static ConfigurationManager instance;
    private ResourceBundle resourceBundle;
    private static final String BUNDLE_NAME = "controller.config";
    public static final String DATABASE_DRIVER_NAME = "DATABASE_DRIVER_NAME";
    public static final String DATABASE_URL = "DATABASE_URL";
    public static final String DATABASE_USERNAME = "DATABASE_USERNAME";
    public static final String DATABASE_PASSWORD = "DATABASE_PASSWORD";
    
    public static final String TO_LIST_AUTO_PAGE_PATH = "TO_LIST_AUTO_PAGE_PATH";
    public static final String TO_AUTORS_PAGE_PATH = "TO_AUTORS_PAGE_PATH";
    public static final String INDEX_PAGE_PATH = "INDEX_PAGE_PATH";
    public static final String REGISTRATION_PAGE_PATH = "REGISTRATION_PAGE_PATH";
    public static final String INFO_PAGE_PATH = "INFO_PAGE_PATH";
    public static final String THANKS_IMAGE_PATH = "THANKS_IMAGE_PATH";
    public static final String EDIT_USER_PAGE_PATH = "EDIT_USER_PAGE_PATH";
    public static final String SHOW_USERS_PAGE_PATH = "SHOW_USERS_PAGE_PATH";
    public static final String SHOW_CAR_PAGE_PATH = "SHOW_CAR_PAGE_PATH";
    public static final String EDIT_CAR_PAGE_PATH = "EDIT_CAR_PAGE_PATH";
    public static final String ADD_CAR_PAGE_PATH = "ADD_CAR_PAGE_PATH";
    public static final String ORDER_PAGE_PATH = "ORDER_PAGE_PATH";
    
    static final Logger logger = Logger.getLogger("ConfigurationManager");
    
    public static ConfigurationManager getInstance() {
        if (instance == null) {
            instance = new ConfigurationManager();
            instance.resourceBundle
                    = ResourceBundle.getBundle(BUNDLE_NAME);
        }
        return instance;
    }

    public String getProperty(String key) {
        return (String) resourceBundle.getObject(key);
    }
}
