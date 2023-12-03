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
    <h1>Панель категорий</h1>
</div>

<ul class="list-group">
    <#list categories as category>
        <div class="row">
            <div class="col">
            <li CLASS="list-group-item" style = "position:relative; left:400px; top:10px "  id=${category.id}>${category.name}</li>
            </div>
            <div class="col">
            <button type="submit" onclick="delet('${category.id}')" style = "position:relative; left:10px; top:15px" class="btn btn-danger">Удалить</button>
            </div>
        </div>
    </#list>
</ul>

<section class="py-5">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">

                <form class="form-inline" method="post" action="/category" enctype="multipart/form-data">
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="inputCategory" style = "position:relative; right:10px;"> Категория </label>
                        <input class="form-control form-control-lg" name="name" id="inputCategory" type="text" placeholder="Категория">
                    </div>
                    <button type="submit" class="btn btn-info mb-2">Добавить</button>
                </form>

            </div>
        </div>
    </div>
</section>

<#include "components/footer.ftl" >


</body>
</html>