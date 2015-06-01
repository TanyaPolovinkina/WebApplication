<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        <title>Вход</title>
        <link rel="stylesheet" type="text/css" href="index.css"> 
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </head>
    <body>
        <header >

            <div class='block' id="enter">
                <br/>
                <form method="post" action="controller">
                    <input type="hidden" name="command" value="enterpage"/>
                    <input type="submit" value="Войти"  class="submit_enter" /><br>
                </form>
                <form method="post" action="controller">
                    <input type="hidden" name="command" value="registerpage"/>
                    <input type="submit"   value="Регистрация" class="submit_registration"/>
                </form>
            </div>
            <div class='block' id="h" >
                <h2>Кулинария - это не просто умение приготовить обед, это целое искусство.</h2>
            </div>

        </header>
        <div  class="main">
            <div class="menu">
                <table>
                    <form name="showrecipes" method="get" action="controller" >


                        <input id="changeMenu" type="hidden" value="Салаты"/>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Салаты" >Салаты</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Закуски">Закуски</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Первые блюда">Первые блюда</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Вторые блюда">Вторые блюда</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Выпечка">Выпечка</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Блины">Блины</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Десерты">Десерты</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Напитки">Напитки</a></td></tr>
                        <tr><td class="main_menu"><a href="controller?command=SHOWRECIPES&param=Соусы">Соусы</a></td></tr>
                        <tr><td class="main_menu" id="spisok">
                                <h3>Кухня<span class="expand">+</span></h3>
                                <ul>
                                    <li><a href="controller?command=SHOWRECIPES&param=Американская" >Американская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Грузинская" >Грузинская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Индийская" >Индийская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Испанская" >Испанская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Итальянская" >Итальянская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Китайская" >Китайская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Македонская" >Македонская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Русская" >Русская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Узбекская" >Узбекская</a></li>
                                    <li><a href="controller?command=SHOWRECIPES&param=Французская" >Французская</a></li>                                                    
                                </ul>
                            </td></tr>

                    </form>
                </table>
            </div>

            <div  style="background:black; width: 100%;height: 600px;">
                <table  id="enter_table">
                    <form  method="post" action="controller">
                        <tr><td >Firstname:</td><td><input name="firstname" type="text" required title="Введите ваше имя"/></td></tr>
                        <tr><td >Lastname:</td><td><input name="lastname" type="text" required title="Введите вашу фамилию"/></td></tr>
                        <tr><td >Login:</td><td><input name="login" type="text" id="login" required title="Введите login"/></td></tr>
                        <tr><td >Password:</td><td><input name="password" type="password" required pattern="\w{4,}" title="Введите password(больше 4 символов)"/></td></tr>                                    
                        <tr><td colspan="2">  <input type="submit" id = "enter_but" class="submit_enter_but" name="command" value="register"  /></td></tr>
                        <tr><td style="color:white" colspan="2" >${error_register} </td></tr>
                    </form>

                </table>
            </div>




        </div>
    </body>
</html>
