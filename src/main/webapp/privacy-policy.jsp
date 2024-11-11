<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

    <head>
        <title>IPPO PESCARIA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
            crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
      <%@ include file="/components/header.jsp" %>

     <div class="container my-5">
        <!-- Título principal -->
        <header class="text-center mb-4">
            <h1 class="display-4">Política de Privacidade</h1>
        </header>

        <!-- Introdução -->
        <section>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="h4">1. Introdução</h2>
                    <p>
                        Bem-vindo à nossa empresa de aluguel de barcos de pesca. A proteção dos seus dados pessoais é uma prioridade para nós. Esta política de privacidade explica como coletamos, usamos e protegemos suas informações ao utilizar nossos serviços.
                    </p>
                </div>
            </div>
        </section>

        <!-- Coleta de Dados -->
        <section>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="h4">2. Coleta de Dados</h2>
                    <p>Coletamos dados pessoais fornecidos por você durante o processo de reserva, incluindo:</p>
                    <ul class="list-group">
                        <li class="list-group-item">Nome completo;</li>
                        <li class="list-group-item">Endereço de e-mail;</li>
                        <li class="list-group-item">Número de telefone;</li>
                        <li class="list-group-item">Detalhes de pagamento (se aplicável);</li>
                        <li class="list-group-item">Informações sobre as datas e horários de locação de barcos.</li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Uso dos Dados -->
        <section>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="h4">3. Uso dos Dados</h2>
                    <p>Utilizamos os dados coletados para as seguintes finalidades:</p>
                    <ul class="list-group">
                        <li class="list-group-item">Processar suas reservas de aluguel de barcos;</li>
                        <li class="list-group-item">Entrar em contato com você sobre sua reserva e prestar suporte técnico;</li>
                        <li class="list-group-item">Enviar comunicações promocionais e ofertas especiais (caso tenha autorizado);</li>
                        <li class="list-group-item">Cumprir com obrigações legais e regulatórias.</li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Compartilhamento de Dados -->
        <section>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="h4">4. Compartilhamento de Dados</h2>
                    <p>Não compartilhamos seus dados pessoais com terceiros, exceto nas seguintes situações:</p>
                    <ul class="list-group">
                        <li class="list-group-item">Com prestadores de serviço necessários para o processamento do pagamento;</li>
                        <li class="list-group-item">Quando exigido por lei ou por autoridades governamentais.</li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Segurança dos Dados -->
        <section>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="h4">5. Segurança dos Dados</h2>
                    <p>
                        Implementamos medidas de segurança para proteger seus dados contra acesso não autorizado, perda ou alteração. Utilizamos tecnologia de criptografia e armazenamos as informações em servidores seguros.
                    </p>
                </div>
            </div>
        </section>

        <!-- Direitos do Usuário -->
        <section>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="h4">6. Direitos do Usuário</h2>
                    <p>
                        Você tem o direito de acessar, corrigir ou excluir seus dados pessoais a qualquer momento. Para exercer esses direitos, entre em contato conosco através do e-mail <a href="mailto:contato@barcosdefisca.com">contato@barcosdefisca.com</a>.
                    </p>
                </div>
            </div>
        </section>

        <!-- Alterações na Política de Privacidade -->
        <section>
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="h4">7. Alterações na Política de Privacidade</h2>
                    <p>
                        Reservamo-nos o direito de alterar esta política a qualquer momento. Quaisquer mudanças serão comunicadas através do nosso site.
                    </p>
                </div>
            </div>
        </section>
    </div>

    <%@ include file="/components/footer.jsp" %>
</body>

</html>