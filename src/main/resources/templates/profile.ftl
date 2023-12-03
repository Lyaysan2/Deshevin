<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Панель добавления лекарств">
    <meta name="author" content="Ю. Марсель">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Профиль</title>

    <#include "components/links.ftl">

<body class="text-center">
<#include "components/header.ftl">
<main class="container">
    <div class="container">
        <h1>Ваш профиль</h1>
    </div>
    <div class="mb-3">
        <label for="username" class="user-info">Имя пользователя: ${user.username}</label>
    </div>
    <div class="mb-3">
        <label for="firstName" class="user-info">Имя: ${user.firstName}</label>
    </div>
    <div class="mb-3">
        <label for="lastName" class="user-info">Фамилия: ${user.lastName}</label>
    </div>
    <div class="mb-3">
        <label for="city" class="user-info">Город: ${user.city}</label>
    </div>
    <div class="mb-3">
        <label for="email" class="user-info">Электронная почта: ${user.email}</label>
    </div>
    <div class="mb-3">
        <a href="/favourites" class="favourites">Избранное</a>
    </div>
    <br>
    <br>


    <#include "components/footer.ftl" >


</body>
</html>