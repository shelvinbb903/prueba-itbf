<template>
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="alertModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ get_title }}</h5>
                    <button type="button" class="btn-close" aria-label="Close" @click="closeAlert"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <p>{{ get_description }}</p>
                    </div>           
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="onBtnCancelar">Cancelar</button>
                    <button type="button" class="btn btn-primary" @click="onBtnAceptar">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script type="text/javascript"> 
    import { store, cerrarAlerta } from '../core/utils/alertas'

    export default {
        name: 'AlertasModal',
        data() {
            return {
                myModal: null
            }
        },
        mounted () {
            
        },
        computed: {
            get_title: {
                get () {
                    return store.getters.get_title
                },
            },
            get_description: {
                get () {
                    return store.getters.get_description
                },
            },
            get_btnAceptar: {
                get () {
                    return store.getters.get_btnAceptar
                },
            },
            get_btnCancelar: {
                get () {
                    return store.getters.get_btnCancelar
                },
            },
        },
        methods: {
            closeAlert() {        
                cerrarAlerta();
            },
            async onBtnAceptar() {
                await this.get_btnAceptar();
                cerrarAlerta();
            },
            async onBtnCancelar() {
                await this.get_btnCancelar();
                cerrarAlerta();
            }
        },
    }
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>