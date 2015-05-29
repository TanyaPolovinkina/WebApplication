<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        <title>Вход</title>
        <link rel="stylesheet" type="text/css" href="index.css"> 
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                </head>
                <body>
                    <header>
                        <div class='block' id="enter">
                            <br/>
                            <form method="post" action="controller">
                                <input type="hidden" name="command" value="enterpage"/>
                                <input type="submit" value="Ввойти"  class="submit_enter" /><br>
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
                                <tr><td class="main_menu"><a href="vk.com">Салаты</a></td></tr>
                                <tr><td class="main_menu">Закуски</td></tr>
                                <tr><td class="main_menu">Первые блюда</td></tr>
                                <tr><td class="main_menu">Вторые блюда</td></tr>
                                <tr><td class="main_menu">Выпечка</td></tr>
                                <tr><td class="main_menu">Блины</td></tr>
                                <tr><td class="main_menu">Десерты</td></tr>
                                <tr><td class="main_menu">Напитки</td></tr>
                                <tr><td class="main_menu">Соусы</td></tr>
                                <tr><td class="main_menu" id="spisok">
                                        <h3>Кухня<span class="expand">+</span></h3>
                                        <ul>
                                            <li>Американская</li>
                                            <li>Грузинская</li>
                                            <li>Индийская</li>
                                            <li>Испанская</li>
                                            <li>Итальянская</li>
                                            <li>Китайская</li>
                                            <li>Македонская</li>
                                            <li>Русская</li>
                                            <li>Узбекская</li>
                                            <li>Французская</li>                                                    
                                        </ul>
                                    </td></tr>
                            </table>
                        </div>


                        <div  style="background:black; width: 900px;height: 550px;">
                            <table  id="enter_table">
                                <form  method="post" action="controller">
                                    <tr><td >Login:</td><td><input required name="login" type="text" id="login" title="Введите login"/></td></tr>
                                    <tr><td >Password:</td><td><input required name="password" type="password" title="Введите password"/></td></tr>
                                    <tr><td colspan="2">  <input type="submit" id = "enter_but" class="submit_enter_but" name="command" value="login"/></td></tr>
                                    <tr><td style="color:white" colspan="2" >${error_enter} </td></tr>
                                </form>

                            </table>
                        </div>



                    </div>
                </body>
                </html>
