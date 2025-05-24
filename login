<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Firebase Auth</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f2f5;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      text-align: center;
      width: 320px;
    }

    h2 {
      margin-bottom: 20px;
    }

    .form-container {
      margin-bottom: 30px;
    }

    input {
      display: block;
      margin: 10px auto;
      padding: 10px;
      width: 90%;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      padding: 10px 20px;
      margin-top: 10px;
      border: none;
      background: #4CAF50;
      color: white;
      border-radius: 5px;
      cursor: pointer;
    }

    button:hover {
      background: #45a049;
    }

    .google-btn {
      background-color: #db4437;
    }

    .toggle {
      margin-top: 10px;
      color: #007BFF;
      cursor: pointer;
      font-size: 14px;
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2>Firebase Auth</h2>

    <!-- Sign Up Form -->
    <div id="signup-form" class="form-container">
      <h3>Sign Up</h3>
      <input type="email" id="signup-email" placeholder="Email" />
      <input type="password" id="signup-password" placeholder="Password" />
      <button onclick="signUp()">Sign Up</button>
      <div class="toggle" onclick="showSignIn()">Already have an account? Sign In</div>
    </div>

    <!-- Sign In Form -->
    <div id="signin-form" class="form-container" style="display: none;">
      <h3>Sign In</h3>
      <input type="email" id="signin-email" placeholder="Email" />
      <input type="password" id="signin-password" placeholder="Password" />
      <button onclick="signIn()">Sign In</button>
      <div class="toggle" onclick="showSignUp()">Don't have an account? Sign Up</div>
    </div>

    <!-- Google Sign In -->
    <button class="google-btn" onclick="signInWithGoogle()">Continue with Google</button>
  </div>

  <!-- Firebase SDK -->
  <script src="https://www.gstatic.com/firebasejs/10.11.0/firebase-app-compat.js"></script>
  <script src="https://www.gstatic.com/firebasejs/10.11.0/firebase-auth-compat.js"></script>

  <script>
    // ✅ Your Firebase configuration
    const firebaseConfig = {
      apiKey: "AIzaSyBiHe0gbu_U7MLXPATvRsT88R-zV0_Wm7c",
      authDomain: "fardan-c91ef.firebaseapp.com",
      projectId: "fardan-c91ef",
      storageBucket: "fardan-c91ef.firebasestorage.app",
      messagingSenderId: "866660712427",
      appId: "1:866660712427:web:03eb33304927c24524a3ae",
      measurementId: "G-6YT5TKP1E2"
    };

    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    const auth = firebase.auth();

    // Email/Password Sign Up
    function signUp() {
      const email = document.getElementById("signup-email").value;
      const password = document.getElementById("signup-password").value;

      auth.createUserWithEmailAndPassword(email, password)
        .then(userCredential => {
          alert("✅ Sign up successful!");
        })
        .catch(error => {
          alert("❌ Sign up error: " + error.message);
        });
    }

    // Email/Password Sign In
    function signIn() {
      const email = document.getElementById("signin-email").value;
      const password = document.getElementById("signin-password").value;

      auth.signInWithEmailAndPassword(email, password)
        .then(userCredential => {
          alert("✅ Sign in successful!");
        })
        .catch(error => {
          alert("❌ Sign in error: " + error.message);
        });
    }

    // Google Sign In
    function signInWithGoogle() {
      const provider = new firebase.auth.GoogleAuthProvider();
      auth.signInWithPopup(provider)
        .then(result => {
          alert("✅ Signed in with Google: " + result.user.email);
        })
        .catch(error => {
          alert("❌ Google Sign-in error: " + error.message);
        });
    }

    // Toggle UI
    function showSignIn() {
      document.getElementById("signup-form").style.display = "none";
      document.getElementById("signin-form").style.display = "block";
    }

    function showSignUp() {
      document.getElementById("signup-form").style.display = "block";
      document.getElementById("signin-form").style.display = "none";
    }
  </script>
</body>
</html>
