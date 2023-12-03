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
        .sign-in-form {
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
        <h1>Вход</h1>
    </div>
    <form method="post" action="/sign-in" class="sign-in-form" enctype="multipart/form-data">
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
        <input class="btn btn-info" type="submit" value="Войти">

    </form>

    <a href="/sign-up" class="go-sign-up">Перейти к регистрации</a>

    <#include "components/footer.ftl" >


</body>
</html>