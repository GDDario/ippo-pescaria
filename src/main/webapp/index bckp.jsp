<%@ page session="true" %>

<!DOCTYPE html>
<html>

    <head>
        <title>IPPO PESCARIA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" type="text/css" href="css/global.css">
    </head>

    <body>
        <header>
            <div class="logo">
                <h1>LOGO IPPO PESCARIA</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Barcos</a></li>
                    <li><a href="#">Contato</a></li>
                    <li><a href="#">Sobre</a></li>
                </ul>

            </nav>

            <button id="login-button">Login</button>
        </header>

        <main>
            <section class="banner">
                <h2>Aluguel de barcos de pesca</h2>
                <p>Alugue barcos de pesca aqui texto</p>

            </section>

            <section class="boats">
                <h3>Barcos disponiveis</h3>
                <div class="boat-grid">
                    <div class="boat-item">
                        <img src="img/barco1.jpeg" alt="barco1">
                        <p>barco de pesca profissional</p>
                    </div>
                    <div class="boat-item">
                        <img src="img/barco2.jpeg" alt="barco2">
                        <p>barco de pesca intermediario</p>
                    </div>
                    <div class="boat-item">
                        <img src="img/barco3.jpeg" alt="barco3">
                        <p>barco de pesca iniciante</p>
                    </div>
            </section>
        </main>

        <div id="auth-modal" class="open">
            <div class="modal-body login">
                <button class="close-modal">&#10006;</button>

                <div>
                    <h2>Login</h2>
                    <p class="call-to-auth">Ainda não tem uma conta? <a onclick="changeToRegisterForm()">Clique aqui para se cadastrar.</a></p>
                </div>

                <form id="auth-form" method="post" action="AuthenticationController">
                    <div class="input-box">
                        <label for="email">Email</label>
                        <input type="email" name="email" type="email" id="email" required  />
                    </div>

                    <div class="input-box">
                        <label for="password">Senha</label>
                        <input type="password" name="password" id="password" required />
                    </div>

                    <div class="remember-me-box">
                        <input type="checkbox" id="remember-me" />
                        <label for="remember-me" class="remember-me">Lembre-se de mim</label>
                    </div>

                    <button class="login">Entrar</button>
                    <p><a href="#">Esqueci minha senha</a></p>
                </form>
            </div>

            <div class="modal-body register open">
                <button class="close-modal">&#10006;</button>

                <div>
                    <h2>Registro</h2>
                    <p class="call-to-auth">Já tem uma conta? <a onclick="changeToLoginForm()">Clique aqui para fazer login.</a></p>
                </div>

                <form id="auth-form" method="post" action="RegisterController" name="register-form">
                    <div class="input-box">
                        <label for="name">Nome</label>
                        <input type="text" name="name" id="name" required value="Makunouchi Ippo" />
                    </div>

                    <div class="input-box">
                        <label for="register-email">Email</label>
                        <input type="email" name="email" type="email" id="register-email" required value="test@email.com" />
                        <c:if test="${not empty sessionScope.emailError}">
                            <span class="field-error" id="register-email-error">${sessionScope.emailError}</span>
                        </c:if>
                    </div>

                    <div class="input-box">
                        <label for="birth-date">Data de nascimento</label>
                        <input type="date" name="birth-date" id="birth-date" required value="2001-10-12" />
                    </div>

                    <div class="input-box">
                        <label for="register-password">Senha</label>
                        <input type="password" name="password" id="register-password" required value="test@email.com" />
                    </div>

                    <div class="input-box">
                        <label for="password-confirmation">Confirme a senha</label>
                        <input type="password" name="password-confirmation" id="password-confirmation" required value="test@email.com" />
                        <c:if test="${not empty sessionScope.passwordConfirmationError}">
                            <span class="field-error">${sessionScope.passwordConfirmationError}</span>
                        </c:if>
                    </div>

                    <button class="login">Registrar</button>
                    <p><a href="privacy-policy.jsp" about="_blank">Nossa política de dados</a></p>
                </form>
            </div>

            <c:remove var="emailError" scope="session" />
            <c:remove var="passwordConfirmationError" scope="session" />
        </div>

        <script src="js/global.js"></script>
        <script src="js/authentication.js"></script>
    </body>

</html>