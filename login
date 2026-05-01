<!DOCTYPE html>
<html lang="te">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Jeeva Organics Dairy - Login</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    body {
      background: linear-gradient(135deg, #f0f9f0 0%, #e8f5e9 100%);
    }
  </style>
</head>
<body class="min-h-screen flex items-center justify-center">
  <div class="bg-white p-8 rounded-2xl shadow-xl w-full max-w-md mx-4">
    <!-- Logo -->
    <div class="text-center mb-8">
      <h1 class="text-4xl font-bold text-green-700">జీవ</h1>
      <p class="text-green-600 text-xl font-semibold">Jeeva Organics Dairy</p>
      <p class="text-gray-500 mt-1">Pure • Fresh • Organic</p>
    </div>

    <h2 class="text-2xl font-semibold text-center mb-6 text-gray-800">Welcome Back</h2>

    <form id="loginForm" class="space-y-5">
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
        <div class="relative">
          <i class="fas fa-phone absolute left-3 top-3 text-green-600"></i>
          <input type="tel" id="phone" 
                 class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-xl focus:outline-none focus:border-green-500"
                 placeholder="Enter 10 digit number" maxlength="10" required />
        </div>
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
        <div class="relative">
          <i class="fas fa-lock absolute left-3 top-3 text-green-600"></i>
          <input type="password" id="password" 
                 class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-xl focus:outline-none focus:border-green-500"
                 placeholder="Enter password" required />
        </div>
      </div>

      <button type="submit"
              class="w-full bg-green-600 hover:bg-green-700 text-white font-semibold py-3.5 rounded-xl transition duration-300">
        Login
      </button>
    </form>

    <div class="text-center mt-6">
      <p class="text-gray-600">
        Don't have an account? 
        <a href="signup.html" class="text-green-600 font-medium hover:underline">Sign Up</a>
      </p>
    </div>

    <div class="text-center mt-4">
      <a href="admin-login.html" class="text-sm text-gray-500 hover:text-green-600">Admin Login →</a>
    </div>
  </div>

  <script>
    document.getElementById('loginForm').addEventListener('submit', async (e) => {
      e.preventDefault();
      
      const phone = document.getElementById('phone').value;
      const password = document.getElementById('password').value;

      try {
        const res = await fetch('/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ phone, password })
        });

        const data = await res.json();

        if (data.success) {
          alert('Login Successful!');
          window.location.href = '/dashboard.html';   // Change to your dashboard file name
        } else {
          alert(data.error || 'Invalid credentials');
        }
      } catch (err) {
        alert('Server error. Please try again.');
      }
    });
  </script>
</body>
</html>
