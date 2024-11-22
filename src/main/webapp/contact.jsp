<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulário de Contato</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }
    .form-background {
      background: url('img/carousel/carousel-1.jpg') no-repeat center center;
      background-size: cover;
      padding: 50px 0;
    }
    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }
    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }
    .form-group textarea {
      resize: vertical;
      min-height: 100px;
    }
    .form-group input:focus,
    .form-group textarea:focus {
      border-color: #007BFF;
      outline: none;
    }
    .submit-btn {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: #007BFF;
      color: #fff;
      font-size: 18px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .submit-btn:hover {
      background-color: #0056b3;
    }
    footer {
      text-align: center;
      padding: 20px 0;
      background: #007BFF;
      color: #fff;
      margin-top: 50px;
    }
  </style>
</head>
<body>
  <%@ include file="/components/header.jsp" %> 

  <div class="form-background">
    <div class="container">
      <h1>Contato</h1>
      <form action="#" method="post">
        <div class="form-group">
          <label for="name">Nome:</label>
          <input type="text" id="name" name="name" placeholder="Digite seu nome">
        </div>
        <div class="form-group">
          <label for="email">Email: <span style="color: red;">*</span></label>
          <input type="email" id="email" name="email" placeholder="Digite seu email" required>
        </div>
        <div class="form-group">
          <label for="subject">Assunto:</label>
          <input type="text" id="subject" name="subject" placeholder="Digite o assunto">
        </div>
        <div class="form-group">
          <label for="message">Mensagem: <span style="color: red;">*</span></label>
          <textarea id="message" name="message" placeholder="Digite sua mensagem" required></textarea>
        </div>
        <button type="submit" class="submit-btn">Enviar</button>
      </form>
    </div>
  </div>

  <%@ include file="/components/footer.jsp" %> 
</body>
</html>
