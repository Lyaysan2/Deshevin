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
    <h1>Профиль</h1>
    <div class="profile-wrapper">
        <div class="profile-content">
            <div class="profile-info">
                <p>Имя пользователя:&nbsp;</p>
                <p class="profile-text">${user.username}</p>
            </div>
            <div class="profile-info">
                <p>Имя:&nbsp;</p>
                <p class="profile-text">${user.firstName}</p>
            </div>
            <div class="profile-info">
                <p>Фамилия:&nbsp;</p>
                <p class="profile-text">${user.lastName}</p>
            </div>
            <div class="profile-info">
                <p>Город:&nbsp;</p>
                <p class="profile-text">${user.city}</p>
            </div>
            <div class="profile-info">
                <p>Электронная почта:&nbsp;</p>
                <p class="profile-text">${user.email}</p>
            </div>

<#--            <div class="mb-3">-->
<#--                <label for="username" class="user-info">Имя пользователя: ${user.username}</label>-->
<#--            </div>-->
<#--            <div class="mb-3">-->
<#--                <label for="firstName" class="user-info">Имя: ${user.firstName}</label>-->
<#--            </div>-->
<#--            <div class="mb-3">-->
<#--                <label for="lastName" class="user-info">Фамилия: ${user.lastName}</label>-->
<#--            </div>-->
<#--            <div class="mb-3">-->
<#--                <label for="city" class="user-info">Город: ${user.city}</label>-->
<#--            </div>-->
<#--            <div class="mb-3">-->
<#--                <label for="email" class="user-info">Электронная почта: ${user.email}</label>-->
<#--            </div>-->
        </div>

        <div>
            <button onclick="location.href='/favourites';" class="btn" href="/search">Избранное</button>
        </div>
        <br>
        <br>
    </div>



<#--    <#include "components/footer.ftl" >-->

</main>
</body>
</html>