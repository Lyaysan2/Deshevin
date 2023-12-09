<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Панель для добавления категорий">
    <meta name="author" content="Ю. Марсель">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Панель для добавления категорий</title>

    <#include "components/links.ftl">
    <script>
        function delet(id){
            jQuery.ajax({
                url:'/category?id='+id,
                type:'delete'
            });
            jQuery.ajax({
                url:'/category',
                type:'get'
            });
        }
    </script>

</head>
<body class="text-center">
<#include "components/header.ftl">
<div class="container">
    <h1>Категории</h1>
    <section class="py-5">
        <form class="form-add" method="post" action="/category" enctype="multipart/form-data">
            <div class="form-group mx-sm-3 mb-2">
                <input class="input-form" name="name" id="inputCategory" type="text" placeholder="Введите категорию">
            </div>
            <button type="submit" class="btn">Добавить</button>
        </form>
    </section>
    <br>
    <#list categories as category>
        <div class="item-row">
            <div id=${category.id}>${category.name}</div>
            <button type="submit" onclick="delet('${category.id}')" class="btn-delete">Удалить</button>
        </div>
    </#list>
</div>



<#--<#include "components/footer.ftl" >-->


</body>
</html>