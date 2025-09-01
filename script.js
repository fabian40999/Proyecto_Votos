const form = document.getElementById("registerForm");
const emailInput = document.getElementById("email");
const passwordInput = document.getElementById("password");
const msgOk = document.getElementById("msgOk");
const msgErr = document.getElementById("msgErr");
const togglePwd = document.getElementById("togglePwd");

togglePwd.addEventListener("click", () => {
  const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
  passwordInput.setAttribute("type", type);
  togglePwd.textContent = type === "password" ? "👁️" : "🙈";
});


form.addEventListener("submit", async (e) => {
  e.preventDefault();
  msgOk.style.display = "none";
  msgErr.style.display = "none";

  const email = emailInput.value.trim();
  const password = passwordInput.value.trim();

  if (!email.includes("@") || !email.includes(".")) {
    msgErr.textContent = "Por favor, ingresa un correo válido.";
    msgErr.style.display = "block";
    return;
  }

  if (password.length < 8) {
    msgErr.textContent = "La contraseña debe tener al menos 8 caracteres.";
    msgErr.style.display = "block";
    return;
  }

  const formData = new FormData();
  formData.append("email", email);
  formData.append("password", password);

  try {
    const response = await fetch("registro.php", {
      method: "POST",
      body: formData,
    });

    const data = await response.json();

    if (data.status === "ok") {
      msgOk.textContent = `✅ ${data.msg}`;
      msgOk.style.display = "block";
      setTimeout(() => {
        window.location.href = "indexAcademia.html"; 
      }, 1500);
    } else {
      msgErr.textContent = `❌ ${data.msg}`;
      msgErr.style.display = "block";
    }
  } catch (error) {
    console.error("Error al enviar la solicitud:", error);
    msgErr.textContent = "❌ Error en el registro. Intenta de nuevo.";
    msgErr.style.display = "block";
  }
});