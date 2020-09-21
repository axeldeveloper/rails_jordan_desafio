<template>
  <div id="ap">
    <md-field>
      <label>CPF</label>
      <md-input v-model="imputCpf" placeholder="Informe o CPF 999.999.999-99"></md-input>
    </md-field>
    <md-button class="md-primary md-raised" @click="searchOnTable()">Consultar</md-button>
  </div>
</template>

<script>
export default {
  data:  () => ({
      message: "Hello Search!",
      imputCpf: null,
  }),

  methods: {
      searchOnTable () {
        //this.searched = searchByName(this.users, this.search)
        window.alert('Noop')
      }
    },
    created () {
      this.searched = this.users
    }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
