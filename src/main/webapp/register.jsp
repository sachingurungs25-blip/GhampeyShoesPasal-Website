<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | Ghampey Shoes Pasal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background: #0a0a0a;
            min-height: 100vh;
            display: flex;
        }

        /* LEFT PANEL */
        .panel-left {
            width: 45%;
            background: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 60px 64px;
            overflow-y: auto;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            color: #737373;
            font-size: 13px;
            font-weight: 500;
            margin-bottom: 48px;
            transition: color 0.2s;
        }

        .back-link:hover { color: #0a0a0a; }

        .form-logo {
            font-size: 22px;
            font-weight: 900;
            letter-spacing: -0.8px;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .form-logo span {
            background: #0a0a0a;
            color: #c8ff00;
            padding: 2px 8px;
            border-radius: 4px;
        }

        .form-subtitle {
            font-size: 14px;
            color: #737373;
            margin-bottom: 40px;
        }

        .form-title {
            font-size: 30px;
            font-weight: 800;
            letter-spacing: -1px;
            color: #0a0a0a;
            margin-bottom: 32px;
        }

        .error-box {
            background: #fff0f0;
            border: 1px solid #fca5a5;
            border-radius: 8px;
            padding: 12px 16px;
            font-size: 13px;
            color: #dc2626;
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            color: #404040;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            border: 1.5px solid #e5e5e5;
            border-radius: 10px;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            color: #0a0a0a;
            background: #fafafa;
            outline: none;
            transition: border-color 0.2s, background 0.2s, box-shadow 0.2s;
        }

        .form-group input:focus {
            border-color: #0a0a0a;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(0,0,0,0.06);
        }

        .btn-submit {
            width: 100%;
            background: #0a0a0a;
            color: #fff;
            padding: 15px;
            border: none;
            border-radius: 10px;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
            letter-spacing: 0.3px;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background: #222;
            transform: translateY(-1px);
        }

        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 24px 0;
        }

        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e5e5e5;
        }

        .divider span {
            font-size: 12px;
            color: #a0a0a0;
            font-weight: 500;
        }

        .signup-link {
            text-align: center;
            font-size: 14px;
            color: #737373;
        }

        .signup-link a {
            color: #0a0a0a;
            font-weight: 700;
            text-decoration: none;
            border-bottom: 1.5px solid #0a0a0a;
            padding-bottom: 1px;
        }

        /* RIGHT PANEL */
        .panel-right {
            width: 55%;
            background: #111;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: flex-end;
            padding: 60px;
        }

        .panel-right img {
            position: absolute;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.5;
        }

        .panel-right::after {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, #0a0a0a 0%, transparent 60%);
        }

        .panel-right-content {
            position: relative;
            z-index: 10;
        }

        .panel-right-content .tag {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: #c8ff00;
            margin-bottom: 16px;
            display: block;
        }

        .panel-right-content h2 {
            font-size: 44px;
            font-weight: 900;
            color: #fff;
            letter-spacing: -2px;
            line-height: 1;
        }

        @media (max-width: 768px) {
            .panel-right { display: none; }
            .panel-left { width: 100%; padding: 40px 28px; }
        }
    </style>
</head>
<body>

<div class="panel-left">
    <a href="HomeServlet" class="back-link">← Back to Home</a>

    
    <p class="form-subtitle">Join the exclusive community</p>

    <h1 class="form-title">Create Account</h1>

    <% if(request.getAttribute("error") != null) { %>
        <div class="error-box">⚠️ <%= request.getAttribute("error") %></div>
    <% } %>

    <form action="RegisterServlet" method="post">
        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="fullName" placeholder="John Doe" required>
        </div>
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" placeholder="johndoe123" required>
        </div>
        <div class="form-group">
            <label>Phone Number</label>
            <input type="tel" name="phone" placeholder="98XXXXXXXX" required>
        </div>
        
        <div class="form-group" style="position: relative;">
            <label>Password</label>
            <input type="password" name="password" id="reg-password" placeholder="Create a strong password" required>
            <span onclick="togglePassword('reg-password', this)" style="position:absolute; right:15px; top:36px; cursor:pointer; font-size:18px; color:#555;" title="Show/Hide Password">👁️</span>
        </div>
        <div class="form-group" style="position: relative;">
            <label>Confirm Password</label>
            <input type="password" name="confirmPassword" id="reg-confirm-password" placeholder="Re-enter password" required>
            <span onclick="togglePassword('reg-confirm-password', this)" style="position:absolute; right:15px; top:36px; cursor:pointer; font-size:18px; color:#555;" title="Show/Hide Password">👁️</span>
        </div>
        <button type="submit" class="btn-submit">Sign Up →</button>
    </form>

    <script>
        function togglePassword(inputId, icon) {
            const input = document.getElementById(inputId);
            if(input.type === 'password') {
                input.type = 'text';
                icon.innerText = '🙈';
            } else {
                input.type = 'password';
                icon.innerText = '👁️';
            }
        }

        document.querySelector('form[action="RegisterServlet"]').addEventListener('submit', function(e) {
            const pwd = document.getElementById('reg-password').value;
            const confirmPwd = document.getElementById('reg-confirm-password').value;
            if(pwd !== confirmPwd) {
                e.preventDefault();
                alert('Passwords do not match. Please try again!');
            }
        });
    </script>

    <div class="divider"><span>Already a member?</span></div>

    <p class="signup-link">
        Have an account? <a href="LoginServlet">Sign in here</a>
    </p>
</div>

<div class="panel-right">
    <img src="images/casual_sneaker_1777806486456.png" alt="Shoes">
    <div class="panel-right-content">
        <span class="tag">Unlock Access</span>
        <h2>Exclusive Drops.<br>Early Access.</h2>
    </div>
</div>

</body>
</html>
