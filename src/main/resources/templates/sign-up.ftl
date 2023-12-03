<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Панель добавления лекарств">
    <meta name="author" content="Ю. Марсель">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Форма регистрации</title>

    <style>
        .sign-up-form {
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }

        .brd {
            border: 4px double black; /* Параметры границы */
            padding: 10px; /* Поля вокруг текста */
        }

    </style>


    <#include "components/links.ftl">

<body class="text-center">
<#include "components/header.ftl">
<main class="container">
    <div class="container">
        <h1>Регистрация</h1>
    </div>
    <form method="post" action="/sign-up" class="sign-up-form" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="username" class="form-label">Имя пользователя</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
            <label for="firstName" class="form-label">Имя</label>
            <input type="text" class="form-control" id="firstName" name="firstName" required>
        </div>
        <div class="mb-3">
            <label for="lastName" class="form-label">Фамилия</label>
            <input type="text" class="form-control" id="lastName" name="lastName" required>
        </div>
        <div class="mb-3">
            <label for="city" class="form-label">Город</label>
            <input type="text" class="form-control" id="city" name="city" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Электронная почта</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Пароль</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <br>
        <br>
        <input class="btn btn-info" type="submit" value="Зарегистрироваться">

    </form>

    <#if errors??>
        <#list errors as error>
            <div class="text">Ошибка: ${error.name}</div>
            <br>
        </#list>
    </#if>

    <a href="/sign-in" class="sign-in">Перейти к login</a>

    <#include "components/footer.ftl" >


</body>
</html>