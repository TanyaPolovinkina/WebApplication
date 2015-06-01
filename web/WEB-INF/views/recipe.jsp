<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>

        <script type="text/javascript" src="jquery-1.11.3.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        <title>Главная</title>
        <link rel="stylesheet" type="text/css" href="index.css"> 
            <link rel="stylesheet" type="text/css" href="tag.css">

                <link rel="stylesheet" type="text/css" href="div.css"> 
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        </head>

                        <body scroll="yes">
                            <header>
                                <div class='block' id="enter">
                                    <br/>
                                    <c:if test="${user==null}">
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="enterpage"/>
                                            <input type="submit" value="Войти"  class="submit_enter" /><br>
                                        </form>
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="registerpage"/>
                                            <input type="submit"   value="Регистрация" class="submit_registration"/>
                                        </form>
                                    </c:if>
                                    <c:if test="${user ne null}">
                                        <p>${user.firstname} ${user.lastname}</p>
                                        <form method="post" action="controller">
                                            <input type="hidden" name="command" value="logout"/>
                                            <input type="submit" value="Выйти"  class="submit_enter" />
                                        </form>
                                    </c:if>
                                </div>

                                <div class='block' style="width:80%">
                                    <h2>Кулинария - это не просто умение приготовить обед, это целое искусство.</h2>
                                </div>

                            </header>

                            <div  class="main">

                                <div class="menu">
                                    <table>
                                        <form name="showrecipes" method="get" action="controller" >
                                            <c:if test="${user.firstname ne null and user.firstname ne 'admin'}">
                                                <tr>
                                                    <td>
                                                        <a href="controller?command=SHOWCOOKBOOK&userid=${user.userId}" class="tag">
                                                            Кулинарная книга
                                                        </a>
                                                    </td> 
                                                </tr>
                                            </c:if>
                                            <c:if test="${user.firstname ne null}">
                                                <tr>
                                                    <td>
                                                        <a href="controller?command=SHOWMYRECIPES&userid=${user.userId}" class="tag">
                                                            Мои рецепты
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td >
                                                        <a href="controller?command=add" class="tag" />
                                                        Добавить рецепт
                                                        </a>
                                                    </td>

                                                </tr>
                                            </c:if>

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
                                <div id="recipe_menu" style="float: left">
                                    <div style="width:100%">
                                        <jsp:useBean id="recipe" scope="request" class="entity.Recipe" />
                                        <table style="width:70%; margin: auto;">
                                            <tr>
                                                <td colspan="3">
                                                    <h2 style="color:background;
                                                        text-align: center; 
                                                        font-family: Segoe Print;">${recipe.recipeName}</h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="4">
                                                    <img src="${recipe.recipePhoto}" class="recipe_img" />
                                                </td>
                                                <td colspan="2"><p>Время приготовления: ${recipe.cookingTime} мин</p>
                                                </td>
                                            </tr>

                                            <tr><td><p>Категория: </p></td></tr>
                                            <c:forEach items="${recipe.categories}" var="category">
                                                <tr>
                                                    <td colspan="2">
                                                        <c:if test="${category.categoryId < 10}">
                                                            <p>${category.categoryName}</p>
                                                        </c:if>
                                                        <c:if test="${category.categoryId > 9}">
                                                            <p>${category.categoryName} кухня</p>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </table>
                                        <br/> <br/>
                                        <hr/>
                                        <table style="width:70%; margin: auto;">
                                            <tr>
                                                <td colspan="3">

                                                    <h3 style="color:background;
                                                        text-align: center; 
                                                        font-family: Segoe Print;">
                                                        Ингредиенты</h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><p>Наименование</p></td>
                                                <td><p>Количество</p></td>
                                                <td><p>Ед.измерения</p></td

                                            </tr>

                                            <c:forEach items="${recipe.recipeingredients}" var="elem">
                                                <tr>                                                      

                                                    <td><p>${elem.getIngredient().getIngredientName()}</p></td>
                                                    <td><p>${elem.getQuantity()}</p></td>
                                                    <td><p>${elem.getUnit()}</p></td>
                                                </tr>
                                            </c:forEach>

                                        </table>
                                        <br/> <br/>
                                        <hr/>


                                        <h3 style="color:background;
                                            text-align: center; 
                                            font-family: Segoe Print;">
                                            Шаги приготовления
                                        </h3>

                                        <br/>

                                        <c:forEach items="${steps}" var="step">

                                            <div class="cbm_wrap ">
                                                <h1> Этап ${step.stepNumber}</h1>
                                                <c:if test="${step.photo ne ' '}">
                                                    <img src="${step.photo}"  />
                                                </c:if>
                                                <p>${step.description}</p>
                                            </div>

                                        </c:forEach>

                                    </div>


                                </div>
                            </div>

                        </body>

                        </html>
