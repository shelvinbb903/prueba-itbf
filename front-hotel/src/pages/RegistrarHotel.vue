<template>
    <div class="modal fade" tabindex="-1" data-bs-backdrop="static" id="registrarHotelModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Registrar Hotel</h5>
                <button type="button" class="btn-close" aria-label="Close" @click="cerrar"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="input-group mb-3">
                        <span class="input-group-text">Nombre</span>
                        <input type="text" class="form-control" placeholder="" aria-label="Nombre" v-model="hotel.nombre">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Dirección</span>
                        <input type="text" class="form-control" placeholder="" aria-label="Dirección" v-model="hotel.direccion">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Ciudad</span>
                        <select class="form-select" aria-label="" v-model="hotel.ciudad_id">
                            <option value="" selected>Seleccione...</option>
                            <option v-for="item in items" :value="item.id" :key="item.id">{{ item.nombre }}</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">NIT</span>
                        <input type="text" class="form-control" placeholder="" aria-label="NIT" v-model="hotel.nit">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Número de Hab</span>
                        <input type="number" min="1" class="form-control" placeholder="" aria-label="Número de Hab" v-model="hotel.n_habitaciones">
                    </div>
                </div>           
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" @click="cerrar">Cancelar</button>
                <button type="button" class="btn btn-primary" @click="guardarDatos">Guardar</button>
            </div>
            </div>
        </div>
    </div>
</template>
<script>
    import * as bootstrap from 'bootstrap'
    import { CiudadesRest } from '../core/api/ciudades';
    import { HotelesRest } from '../core/api/hoteles';
    import { abrirLoading, cerrarLoading } from '../core/utils/loading';
    import { abrirAlerta } from '../core/utils/alertas';
    
    const ciudadesApi = new CiudadesRest();
    const hotelesApi = new HotelesRest();    

    export default {
        name: 'RegistrarHotel',
        data() {
            return {
                myModal: null,
                hotel: {
                    nombre: "",
                    direccion: "",
                    nit: "",
                    ciudad_id: "",
                    n_habitaciones: 0,
                },
                items: []
            }
        },
        methods: {
            /**
             * Metodo para enviar los datos a la api rest para guardar los datos en la base de datos
             */
            async guardarDatos() {
                if(this.validarCamposVacios()) {
                    abrirAlerta("Error", "Hay valores que faltan por ser llenados");
                    return;
                }
                abrirLoading();
                await hotelesApi.crear(`hoteles`, this.hotel);
                const modal = bootstrap.Modal.getInstance(this.myModal)
                modal.hide();
                cerrarLoading();
            },
            /**
             * Metodo para validar los campos vacios
             */
            validarCamposVacios(){
                let vacio = false;

                if(this.hotel.nombre == "" || this.hotel.direccion == "" || this.hotel.nit == "" || this.hotel.ciudad_id == "" || this.hotel.n_habitaciones < 1) {
                    vacio = true;
                }
                return vacio;
            },
            /**
             * Metodo para cerrar el modal y reiniciar los valores
             */
            async cerrar(){
                this.hotel = {
                    nombre: "",
                    direccion: "",
                    nit: "",
                    ciudad_id: "",
                    n_habitaciones: 0,
                }
                const modal = bootstrap.Modal.getInstance(this.myModal)
                modal.hide();
            }
        },
        async mounted () {
            this.items = [];
            this.myModal = document.getElementById('registrarHotelModal');           

            /**
             * Evento para ejecutar bloques de codigo cuando se abre el modal de registrar hotel
             */
            this.myModal.addEventListener('shown.bs.modal', async () => {
                abrirLoading();
                this.items = [];
                const resp = await ciudadesApi.listar(`ciudades`);
                this.items = [...resp.data];
                cerrarLoading();
            })
        },
        props: {            
        },
    }
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>