<%@ include file="/components/register-modal.jsp" %>
<%@ include file="/components/login-modal.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/ippo-pescaria">Ippo Pescaria</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/ippo-pescaria" tabindex="-1">
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ippo-pescaria/boats.jsp" tabindex="-1">
                        Barcos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ippo-pescaria/about.jsp" tabindex="-1">
                        Sobre a Empresa
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact.html" tabindex="-1">
                        Contato
                    </a>
                </li>
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

        </div>
    </div>
</nav>
