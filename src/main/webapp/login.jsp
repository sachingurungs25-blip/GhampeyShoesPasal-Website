<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | Ghampey Shoes Pasal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        :root {
            --black: #0a0a0a;
            --white: #ffffff;
            --accent: #c8ff00;
            --gray-100: #f5f5f5;
            --gray-200: #e5e5e5;
            --gray-500: #737373;
            --error: #dc2626;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--black);
            min-height: 100vh;
            display: flex;
        }

        /* LEFT PANEL */
        .panel-left {
            width: 55%;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: flex-end;
            padding: 60px;
        }

        .panel-left img {
            position: absolute;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.45;
        }

        .panel-left::before {
            content: '';
            position: absolute;
            top: -50%; right: -50%;
            width: 600px; height: 600px;
            background: var(--accent);
            border-radius: 50%;
            opacity: 0.08;
            animation: float 20s ease-in-out infinite;
        }

        .panel-left::after {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, var(--black) 0%, transparent 60%);
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(30px, 30px); }
        }

        .panel-left-content {
            position: relative;
            z-index: 10;
        }

        .panel-left-content .tag {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: var(--accent);
            margin-bottom: 16px;
            display: block;
            animation: slideInUp 0.8s ease-out;
        }

        .panel-left-content h2 {
            font-size: 48px;
            font-weight: 900;
            color: var(--white);
            letter-spacing: -2px;
            line-height: 1.2;
            animation: slideInUp 0.8s ease-out 0.1s both;
        }

        @keyframes slideInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* RIGHT PANEL */
        .panel-right {
            width: 45%;
            background: var(--white);
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 60px 64px;
            position: relative;
        }

        .panel-right::before {
            content: '';
            position: absolute;
            top: 0; right: 0;
            width: 300px; height: 300px;
            background: var(--accent);
            border-radius: 50%;
            opacity: 0.05;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: var(--gray-500);
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 48px;
            transition: all 0.3s;
            width: fit-content;
            position: relative;
            z-index: 2;
        }

        .back-link:hover {
            color: var(--black);
            transform: translateX(-4px);
        }

        .form-logo {
            font-size: 22px;
            font-weight: 900;
            letter-spacing: -0.8px;
            text-transform: uppercase;
            margin-bottom: 8px;
            position: relative;
            z-index: 2;
        }

        .form-logo span {
            background: var(--black);
            color: var(--accent);
            padding: 2px 8px;
            border-radius: 4px;
        }

        .form-subtitle {
            font-size: 14px;
            color: var(--gray-500);
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
        }

        .form-title {
            font-size: 32px;
            font-weight: 900;
            letter-spacing: -1px;
            color: var(--black);
            margin-bottom: 32px;
            position: relative;
            z-index: 2;
        }

        .error-box {
            background: #fff0f0;
            border: 1.5px solid #fca5a5;
            border-radius: 12px;
            padding: 16px 20px;
            font-size: 14px;
            color: var(--error);
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideInUp 0.4s ease-out;
            position: relative;
            z-index: 2;
        }

        .form-group {
            margin-bottom: 24px;
            position: relative;
            z-index: 2;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            color: var(--black);
            margin-bottom: 10px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            border: 1.5px solid var(--gray-200);
            border-radius: 12px;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            color: var(--black);
            background: var(--gray-100);
            outline: none;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .form-group input::placeholder {
            color: #b0b0b0;
        }

        .form-group input:focus {
            border-color: var(--black);
            background: var(--white);
            box-shadow: 0 0 0 4px rgba(200,255,0,0.1);
            transform: translateY(-2px);
        }

        .form-group input:hover:not(:focus) {
            border-color: #d0d0d0;
        }

        .forgot-link {
            display: block;
            text-align: right;
            font-size: 13px;
            color: var(--gray-500);
            text-decoration: none;
            margin-bottom: 24px;
            transition: color 0.2s;
            font-weight: 600;
        }

        .forgot-link:hover {
            color: var(--black);
        }

        .btn-submit {
            width: 100%;
            background: var(--black);
            color: var(--white);
            padding: 16px;
            border: none;
            border-radius: 12px;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            letter-spacing: 0.3px;
            position: relative;
            z-index: 2;
        }

        .btn-submit:hover {
            background: #333;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 28px 0;
            position: relative;
            z-index: 2;
        }

        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--gray-200);
        }

        .divider span {
            font-size: 12px;
            color: var(--gray-500);
            font-weight: 600;
        }

        .signup-link {
            text-align: center;
            font-size: 14px;
            color: var(--gray-500);
            position: relative;
            z-index: 2;
        }

        .signup-link a {
            color: var(--black);
            font-weight: 700;
            text-decoration: none;
            border-bottom: 2px solid var(--black);
            padding-bottom: 2px;
            transition: all 0.2s;
        }

        .signup-link a:hover {
            color: var(--accent);
            border-bottom-color: var(--accent);
        }

        .password-toggle {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: var(--gray-500);
            font-size: 18px;
            transition: color 0.2s;
            z-index: 3;
        }

        .password-toggle:hover {
            color: var(--black);
        }

        .form-group.password-group {
            position: relative;
        }

        @media (max-width: 768px) {
            .panel-left { display: none; }
            .panel-right { width: 100%; padding: 40px 28px; }
        }
    </style>
</head>
<body>

<div class="panel-left">
    <img src="images/running_shoe_1777806317504.png" alt="Shoes">
    <div class="panel-left-content">
        <span class="tag">Welcome Back</span>
        <h2>Your Next<br>Pair Awaits.</h2>
    </div>
</div>

<div class="panel-right">
    <a href="HomeServlet" class="back-link">← Back to Home</a>

    
    <p class="form-subtitle">Nepal's Premium Footwear Store</p>

    <h1 class="form-title">Sign In</h1>

    <% if(request.getAttribute("error") != null) { %>
        <div class="error-box">
            <span>⚠️</span>
            <span><%= request.getAttribute("error") %></span>
        </div>
    <% } %>

    <form action="LoginServlet" method="post">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" placeholder="johndoe123" required>
        </div>
        <div class="form-group password-group">
            <label>Password</label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required>
            <button type="button" class="password-toggle" onclick="togglePassword()">👁️</button>
        </div>
        <a href="#" class="forgot-link">Forgot password?</a>
        <button type="submit" class="btn-submit">Sign In →</button>
    </form>

    <div class="divider"><span>New here?</span></div>

    <p class="signup-link">
        Don't have an account? <a href="RegisterServlet">Create one </a>
    </p>
</div>

<script>
    function togglePassword() {
        const field = document.getElementById('password');
        if(field.type === 'password') {
            field.type = 'text';
        } else {
            field.type = 'password';
        }
    }
</script>

</body>
</html>