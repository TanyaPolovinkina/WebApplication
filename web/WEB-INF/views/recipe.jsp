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
            <link rel="stylesheet" type="text/css" href="div.css"> 
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    </head>

                    <body scroll="yes">
                        <jsp:useBean id="user" scope="request" class="entity.User" />
                        <header >

                            <div class='block' id="enter">
                                <br/>
                                <p>${user.firstname} ${user.lastname}</p><br>
                            </div>
                            <div class='block' id="h">
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
                                            <td rowspan="3">
                                                <img src="${recipe.recipePhoto}" class="recipe_img" />
                                            </td>
                                            <td colspan="2"><p>Время приготовления: ${recipe.cookingTime} мин</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <p>Категория:   ${category[0].categoryName}</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <p>Категория:   ${category[1].categoryName}</p>                                          
                                            </td>
                                        </tr>

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
                                            <td><p>Ед.измерения</p></td>
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
