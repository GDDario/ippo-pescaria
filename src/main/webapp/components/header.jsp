<%@ include file="/components/register-modal.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/ippo-pescaria">Ippo Pescaria</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <!--
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Barcos
                    </a>
                    <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/#products">Câmeras</a></li>
                        <li><a class="dropdown-item" href="/#products">Acessórios Apple</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/#products">Drones</a></li>
                    </ul>
                </li>
                -->

                <li class="nav-item">
                    <a class="nav-link" href="/ippo-pescaria" tabindex="-1">
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/boats.html" tabindex="-1">
                        Barcos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about.html" tabindex="-1">
                        Sobre a Empresa
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact.html" tabindex="-1">
                        Contato
                    </a>
                </li>

                <!--
                <li class="nav-item">
                    <a class="nav-link" href="/cart.html" tabindex="-1">
                        Carrinho <i class="bi bi-cart-plus-fill"></i>
                        <span class="cart-badge badge bg-success">4</span>
                    </a>
                </li>
                -->
            </ul>

            <div class="order-sm-last">
                <%
                    if (session.getAttribute("username") != null) {
                %>
                    <form method="post" action="LogoutController" name="logout-form">
                        <button type="submit" class="btn btn-danger">
                            Logout
                        </button>
                    </form>
                <%
                    } else {
                %>
                    <div class="d-flex gap-1">
                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#login-modal">Login</a>
                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#register-modal">Cadastre-se</a>
                    <div>
                <%
                    }
                %>
            </div>

            <%--
            <ul class="navbar-nav mb-2 mb-lg-0 mx-lg-2 order-sm-last">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="myaccount" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Minha Conta
                    </a>
                    <ul class="dropdown-menu bg-dark text-light" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Meus Pedidos</a></li>
                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Perfil</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <form action="#" method="post">
                                <button class="dropdown-item logout" style="color: white" type="submit">Sair</button>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
            --%>

            <!--
            <form class="d-flex search-form">
                <input class="form-control" type="search" placeholder="Buscar" aria-label="Buscar">
                <button class="btn btn-success" type="submit" data-bs-toggle="tooltip" data-bs-placement="left" title="Buscar por todos os produtos">
                    <i class="bi bi-search"></i>
                </button>
            </form>
            -->

        </div>
    </div>
</nav>
