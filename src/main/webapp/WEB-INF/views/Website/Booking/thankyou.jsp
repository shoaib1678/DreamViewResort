<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Thank You</title>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: url('assets/images/breadcumimg.jpeg') no-repeat center center fixed;
      background-size: cover;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      animation: fadeIn 2s ease-in;
    }

    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: 1;
    }

    .thank-you-box {
      position: relative;
      z-index: 2;
      background: rgba(255, 255, 255, 0.95);
      border-radius: 16px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      padding: 40px 30px;
      text-align: center;
      max-width: 500px;
      width: 90%;
      animation: slideUp 1s ease-in-out;
    }

    .thank-you-box img.logo {
      max-width: 180px;
      width: 100%;
      height: auto;
      margin-bottom: 20px;
    }

    .thank-you-box h1 {
      color: #fab000;
      font-size: 30px;
      margin-bottom: 10px;
    }

    .thank-you-box p {
      font-size: 16px;
      color: #444;
      margin-bottom: 20px;
    }

    .btn {
      background: linear-gradient(to right, #fab000, #ffce00);
      border: none;
      color: white;
      padding: 12px 24px;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
      text-decoration: none;
      margin: 5px;
      display: inline-block;
      transition: background 0.3s ease;
    }

    .btn:hover {
      background: linear-gradient(to right, #e1a500, #ffc300);
    }

    @keyframes slideUp {
      from {
        transform: translateY(50px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }

    @media (max-width: 480px) {
      .thank-you-box {
        padding: 30px 20px;
      }

      .thank-you-box h1 {
        font-size: 24px;
      }

      .thank-you-box p {
        font-size: 14px;
      }

      .btn {
        font-size: 14px;
        padding: 10px 18px;
      }
    }
  </style>
</head>
<%String booking_id = (String)request.getParameter("booking_id"); %>
<body>
  <div class="overlay"></div>

  <div class="thank-you-box">
    <img src="assets/images/logo.webp" alt="Resort Logo" class="logo">
    <h1>Thank You!</h1>
    <p>Your resort booking has been successfully completed.</p>
    <p>We’ve sent the booking details to your email.</p>
    
    <a href="javascript:void('<%=booking_id%>')" class="btn">Download Receipt</a>
    <a href="./" class="btn">Back to Home</a>
  </div>
</body>
</html>
