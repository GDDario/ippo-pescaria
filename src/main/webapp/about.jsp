<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <%@ include file="/util/head.jsp" %>

  <body>
    <%@ include file="/components/header.jsp" %>

   <section class="container py-5" id="sobre">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="mb-4">Sobre a Ippo Pescaria</h2>
        <p class="text-muted">
          Bem-vindo à <strong>Ippo Pescaria</strong>, um lugar dedicado àqueles que compartilham a paixão pelo mar, pela pesca e pela conexão com a natureza. Aqui, acreditamos que cada pescaria é mais do que uma atividade — é uma experiência que alimenta a alma e cria memórias inesquecíveis.
        </p>
      </div>
    </div>

    <div class="row my-5">
      <div class="col-md-6">
        <h3 class="mb-3">Nossa História</h3>
        <p class="text-muted">
          Fundada com amor e dedicação, a Ippo Pescaria nasceu com o objetivo de oferecer produtos de qualidade e atendimento especializado para todos os apaixonados pela pesca. O que começou como um pequeno empreendimento, hoje é um ponto de referência para pescadores, desde iniciantes até os mais experientes.
        </p>
        <p class="text-muted">
          Inspirados pelas orlas encantadoras e pelos barcos que cruzam o horizonte, construímos nossa marca com base no respeito à natureza e no desejo de compartilhar momentos únicos com nossos clientes.
        </p>
      </div>
      <div class="col-md-6">
        <img src="images/about-1.jpeg" width=600 height=400 alt="Imagem de uma orla tranquila" class="img-fluid rounded shadow">
      </div>
    </div>

    <div class="row my-5">
      <div class="col-md-6 order-md-2">
        <h3 class="mb-3">O Que Oferecemos</h3>
        <p class="text-muted">
          Na Ippo Pescaria, você encontra uma ampla variedade de equipamentos de pesca, acessórios e produtos exclusivos para garantir que sua próxima aventura seja um sucesso. Trabalhamos com marcas confiáveis e de alta performance, garantindo sempre a melhor qualidade.
        </p>
        <p class="text-muted">
          Além disso, nossa equipe é formada por especialistas que estão sempre prontos para oferecer dicas e orientações personalizadas, seja para pesca esportiva, recreativa ou profissional.
        </p>
      </div>
      <div class="col-md-6 order-md-1">
        <img src="images/about-2.webp" width="600" height="400" alt="Imagem de barcos atracados" class="img-fluid rounded shadow">
      </div>
    </div>

    <div class="row my-5">
      <div class="col-lg-12">
        <h3 class="text-center mb-4">Nosso Compromisso</h3>
        <p class="text-muted text-center">
          Na Ippo Pescaria, acreditamos na importância de preservar o meio ambiente e incentivar práticas de pesca sustentável. Nossa missão vai além de oferecer produtos de qualidade; buscamos promover uma conexão saudável e responsável com a natureza.
        </p>
      </div>
      <div class="col-md-4">
        <img src="images/about-3.jpeg" width="400" height="300" alt="Imagem de um pescador ao pôr do sol" class="img-fluid rounded shadow mb-3">
      </div>
      <div class="col-md-4">
        <img src="images/about-4.jpeg" width="400" height="300" alt="Imagem de um barco em alto-mar" class="img-fluid rounded shadow mb-3">
      </div>
      <div class="col-md-4">
        <img src="images/about-5.jpeg" width="400" height="300" alt="Imagem de uma paisagem costeira" class="img-fluid rounded shadow mb-3">
      </div>
    </div>

    <div class="row text-center">
      <div class="col-lg-12">
        <p class="text-muted">
          Venha nos visitar e descubra como a <strong>Ippo Pescaria</strong> pode tornar sua próxima jornada ainda mais incrível. Juntos, vamos transformar cada pescaria em uma história para contar!
        </p>
        <a href="/ippo-pescaria/contact.jsp" class="btn btn-primary mt-3">Entre em Contato</a>
      </div>
    </div>
  </section>


  <%@ include file="/components/footer.jsp" %>

     <script src="app.js"></script>
  </body>
</html>
