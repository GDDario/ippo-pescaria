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

        <div id="login-modal" class="open">
            <div class="modal-body">
                <button class="close-modal">&#10006;</button>
                        <p><% out.println("<p>asdsdi</p>"); %></p>

                <div>
                    <h2>Login</h2>
                    <p>Ainda não tem uma conta? <a href="#">Clique aqui para se cadastrar.</a></p>
                </div>

                <form id="login-form" method="post" action="AuthenticationController">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" />

                    <label for="password">Senha</label>
                    <input type="password" name="password" id="password" />

                    <div class="remember-me-box">
                        <input type="checkbox" id="remember-me" />
                        <label for="remember-me" class="remember-me">Lembre-se de mim</label>
                    </div>

                    <button class="login">Entrar</button>
                    <p><a href="#">Esqueci minha senha</a></p>
                </form>
            </div>
        </div>

        <script src="js/global.js"></script>
    </body>

</html>