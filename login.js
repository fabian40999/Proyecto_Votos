const form = document.getElementById("loginForm");
const emailInput = document.getElementById("email");
const passwordInput = document.getElementById("password");
const msgOk = document.getElementById("msgOk");
const msgErr = document.getElementById("msgErr");

form.addEventListener("submit", async (e) => {
    e.preventDefault();
    msgOk.style.display = "none";
    msgErr.style.display = "none";

    const email = emailInput.value.trim();
    const password = passwordInput.value.trim();

    const formData = new FormData();
    formData.append("email", email);
    formData.append("password", password);

    try {
        const response = await fetch("login.php", {
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
        console.error("Error en la solicitud de login:", error);
        msgErr.textContent = "❌ Error al iniciar sesión. Intenta de nuevo.";
        msgErr.style.display = "block";
    }
});