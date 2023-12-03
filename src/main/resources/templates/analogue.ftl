<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Панель для добавления классов аналогов">
    <meta name="author" content="Ю. Марсель">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Панель для добавления классов аналогов</title>



    <#include "components/links.ftl">
    <script>
        function delet(id){
            jQuery.ajax({
                url:'/analogue?id='+id,
                type:'delete'
            });

        }
    </script>

</head>
<body class="text-center">
<#include "components/header.ftl">
<div class="container">
    <h1>Панель классов аналогов</h1>
</div>

<ul class="list-group">
    <#list analogues as analogue>
        <div class="row">
            <div class="col">
                <li CLASS="list-group-item" style = "position:relative; left:400px; top:10px "  id=${analogue.id}>${analogue.title}</li>
            </div>
            <div class="col">
                <button type="submit" onclick="delet('${analogue.id}')" style = "position:relative; left:10px; top:15px" class="btn btn-danger">Удалить</button>
            </div>
        </div>
    </#list>
</ul>

<section class="py-5">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">

                <form class="form-inline" method="post" action="/analogue" enctype="multipart/form-data">
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="inputAnalogue" style = "position:relative; right:10px;"> Класс аналогов </label>
                        <input class="form-control form-control-lg" name="title" id="inputAnalogue" type="text" placeholder="Класс аналогов">
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