<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Домашняя страница">
    <meta name="author" content="Ю. Марсель">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Домашняя страница</title>




    <#include "components/links.ftl">


</head>
<body class="text-center">
<#include "components/header.ftl">
<div class="container">
    <h1>Добро пожаловать!</h1>
    <img src="/img/logo.png" class="img-fluid" width="500" height="500">
    <section class="py-5">
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <p class="lead">Наш сервис предоставляет возможность
                        быстро выяснить, какие существуют
                        аналоги для лекарственных средств,
                        узнать их стоимость и наличие в
                        магазинах/сайтах</p>
                </div>
            </div>
        </div>
    </section>


    <h2 class="mt-5">О чем этот сайт?</h2>
    <div class="py-5 bg-image-full" style="background-image: url('/img/pill-font.png')">
    <div style="height: 10rem"></div>
</div>
<section class="py-5">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <p class="lead">Здесь вы можете найти аналог для любого лекарства по более дешевой цене</p>
            </div>
        </div>
    </div>
</section>
<h2>Найди дешевый аналог лекарства тут!</h2>
<br>
<br>
<img src="/img/base.png" class="img-fluid" alt="Base" width="500" height="500" >
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <h4 >Необходима информация о лекартсве </h4>
            <ul>
                <li><p class="lead"> У нас большая база аналогов к лекарственным препаратам</p></li>
                <li><p class="lead"> Подробная информация о каждом товаре</p></li>
                <li><p class="lead"> Ссылки для покупки или адреса ближайших магазинов</p></li>
                <li><p class="lead"> Только доступные к покупке в России товары</p></li>
            </ul>
        </div>
    </div>
</div>
</section>


</div>

<#include "components/footer.ftl" >


</body>
</html>