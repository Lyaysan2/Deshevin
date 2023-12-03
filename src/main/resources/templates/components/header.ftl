<header class="navbar justify-content-between navbar-light bg-info ">
    <div class="d-flex align-items-center">
        <img src="/img/logo.png" width="80px" height="80px">
        <a class="navbar-brand" href="/homepage" style="position:relative; left:10px;"/>Дешевин</a>
    </div>

    <div class="d-flex justify-content-end">

        <a class="btn btn-info mr-sm-2" href="/homepage"/>На главную</a>

        <a class="btn btn-info mr-sm-2" href="/search"/>Поиск лекарств</a>

        <#if user??>

            <#if user.role == 'ADMIN'>
                <a class="btn btn-info mr-sm-2" href="/drug/all"/>База лекарств</a>

                <a class="btn btn-info mr-sm-2" href="/drug"/>Добавить лекарство</a>

                <a class="btn btn-info mr-sm-2" href="/analogue"/>Добавить класс аналоги</a>

                <a class="btn btn-info mr-sm-2" href="/category"/>Добавить категорию</a>
            </#if>

            <a class="btn btn-info mr-sm-2" href="/profile"/>Профиль (${user.username})</a>

            <a class="btn btn-info mr-sm-2" href="/logout"/>Выход</a>
        <#else>
            <a class="btn btn-info mr-sm-2" href="/sign-in"/>Войти</a>

            <a class="btn btn-info mr-sm-2" href="/sign-up"/>Зарегистрироваться</a>
        </#if>
    </div>


</header>