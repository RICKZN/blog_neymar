<template>
  <main>
    <h1>Controle de Lanche - Cantina IF</h1>
    <form @submit.prevent="registrar">
      <input v-model="matricula" placeholder="Matrícula (QR)" />
      <select v-model="turnoAtual">
        <option value="MANHA">Manhã</option>
        <option value="TARDE">Tarde</option>
        <option value="NOITE">Noite</option>
      </select>
      <button>Registrar retirada</button>
    </form>
    <p>{{ mensagem }}</p>
  </main>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const matricula = ref('')
const turnoAtual = ref('MANHA')
const mensagem = ref('')

const registrar = async () => {
  try {
    const { data } = await axios.post('http://localhost:8080/api/retiradas', {
      matricula: matricula.value,
      itemEstoqueId: 1,
      turnoAtual: turnoAtual.value,
      operadorId: 1
    })
    mensagem.value = data.status
  } catch (e) {
    mensagem.value = 'Falha ao registrar retirada'
  }
}
</script>
