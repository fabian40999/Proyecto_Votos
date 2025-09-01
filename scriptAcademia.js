const botonesVotar = document.querySelectorAll('.logos button');
const conteos = {
    ITCJ: document.getElementById('conta1'),
    TEC: document.getElementById('conta2'),
    URN: document.getElementById('conta3'),
    UACJ: document.getElementById('conta4'),
    UACH: document.getElementById('conta5')
};

botonesVotar.forEach(boton => {
    boton.addEventListener('click', async () => {
        const institucion = boton.dataset.institucion;
        const formData = new FormData();
        formData.append('institucion', institucion);

        try {
            const response = await fetch('votar.php', {
                method: 'POST',
                body: formData
            });
            const data = await response.json();

            if (data.status === 'ok') {
                alert(data.msg);
        
                actualizarContadores(data.votos);
                boton.disabled = true;
                boton.textContent = 'Votado';
            } else {
                alert(data.msg);
            }
        } catch (error) {
            console.error('Error al enviar el voto:', error);
            alert('Error al votar. Intenta de nuevo.');
        }
    });
});

function actualizarContadores(votos) {
    for (const institucion in votos) {
        if (conteos[institucion]) {
            conteos[institucion].textContent = votos[institucion];
        }
    }
}