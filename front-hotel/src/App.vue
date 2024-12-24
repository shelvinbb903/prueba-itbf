<template>
  <AdminHoteles/>
  <LoadingModal/>
  <AlertasModal/>
</template>

<script>
  import AdminHoteles from './pages/AdminHoteles.vue'
  import LoadingModal from './components/LoadingModal.vue';
  import AlertasModal from './components/Alertas.vue';

  export default {
    name: 'App',  
    components: {
      AdminHoteles,
      LoadingModal,
      AlertasModal
    },
  }
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
