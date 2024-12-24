<template>
    <div class="modal fade modal-lg"  data-bs-backdrop="static" data-bs-keyboard="false" id="asignarAcomodacionesModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Asignar Habitaciones</h5>
                <button type="button" class="btn-close" aria-label="Close" @click="closeModal"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Tipo Habitación</th>
                                <th scope="col">Acomadación</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(row, index) in asignacionHabitaciones" :key="row">
                                <template v-if="!row.borrar">
                                    <td>
                                        <input type="number" min="1" class="form-control" v-model="row.cantidad">
                                    </td>
                                    <td>
                                        <select class="form-select" aria-label="Default select example" @change="changeTipoHabitacion(row)" v-model="row.tipo_habitacion">
                                            <option value="" selected>Seleccione...</option>
                                            <option v-for="item in row.listTipoHabitaciones" :value="item.id" :key="item.id">{{ item.descripcion }}</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-select" aria-label="Default select example" v-model="row.regla_habitacion_id">
                                            <option value="" selected>Seleccione...</option>
                                            <option v-for="item in row.listAcomodaciones" :value="item.id" :key="item.id">{{ item.acomodaciones.descripcion }}</option>
                                        </select>
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-sm btn-success m-1" @click="addNewRow" v-if="index == 0">+</button>
                                        <button class="btn btn-sm btn-danger m-1" @click="deleteRow(index)" v-if="index > 0">-</button>
                                    </td>
                                </template>                                
                            </tr>
                        </tbody>
                    </table>
                </div>           
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" @click="closeModal">Cancelar</button>
                <button type="button" class="btn btn-primary" @click="guadarAsignacion">Guardar</button>
            </div>
            </div>
        </div>
    </div>
</template>
<script>
    import * as bootstrap from 'bootstrap'
    import { constants, AcomodacionesHotelesRest } from '../core/api/acomodacionesHoteles';
    import { TipoHabitacionesRest } from '../core/api/tipoHabitaciones';
    import { ReglasHabitacionesRest } from '../core/api/reglasHabitaciones';
    import { abrirLoading, cerrarLoading } from '../core/utils/loading';
    import { abrirAlerta } from '../core/utils/alertas';

    export default {
        name: 'AcomodacionesHoteles',
        data() {
            return {
                tipoHabitacionesApi: null,
                reglasHabitacionesApi: null,
                acomodacionesHotelesApi: null,
                listTipoHabitaciones: [],
                asignacionHabitaciones: [
                    {
                        id: "",
                        cantidad: 1,
                        borrar: false,
                        tipo_habitacion: "",
                        acomodacion: "",
                        regla_habitacion_id: "",
                        listTipoHabitaciones: [],
                        listAcomodaciones: []
                    }
                ],
                myModal: null,
            }
        },
        async mounted () {
            this.tipoHabitacionesApi = new TipoHabitacionesRest();
            this.reglasHabitacionesApi = new ReglasHabitacionesRest();
            this.acomodacionesHotelesApi = new AcomodacionesHotelesRest();
            this.myModal = document.getElementById('asignarAcomodacionesModal');    

            /**
             * Evento para ejecutar bloques de codigo cuando se abre el modal de asignar habitaciones a los hoteles
             */
            this.myModal.addEventListener('shown.bs.modal', async () => {
                abrirLoading();
                await this.listarTiposHabitaciones();
                
                await this.listarAcomodacionesHabitaciones()
                cerrarLoading();
            })
        },
        methods: {
            /**
             * Metodo para listar los tipos de habitaciones disponibles
             */
            async listarTiposHabitaciones() {
                const resp = await this.tipoHabitacionesApi.listar(`tipo_habitaciones`);                
                this.listTipoHabitaciones = [...resp.data];
            },
            /**
             * Metodo para listar las acomodaciones que ya tiene registrado el hotel
             */
            async listarAcomodacionesHabitaciones() {
                const resp = await this.acomodacionesHotelesApi.listar(`acomodaciones_hoteles`, {hotel_id: constants.idHotel});
                this.asignacionHabitaciones = [];

                if(resp.data.length > 0){
                    
                    await resp.data.map(async (item) => {
                        const resp_reglas = await this.reglasHabitacionesApi.listar(`reglas_habitaciones`, {tipo_habitacion: item.reglas_acomodaciones.tipo_habitacion_id});
                        
                        this.asignacionHabitaciones.push(
                            {
                                id: item.id,
                                cantidad: item.cantidad,
                                borrar: false,
                                tipo_habitacion: item.reglas_acomodaciones.tipo_habitacion_id,
                                acomodacion: item.reglas_acomodaciones.acomodacion_id,
                                regla_habitacion_id: item.reglas_acomodaciones.id,
                                listTipoHabitaciones: [...this.listTipoHabitaciones],
                                listAcomodaciones: [...resp_reglas.data]
                            }
                        )
                    });                    
                } else {
                    this.addNewRow();
                    const row = this.asignacionHabitaciones[0];
                    row.listTipoHabitaciones = [...this.listTipoHabitaciones];  
                }
            },
            /**
             * Metodo para listar los tipos de acomodaciones segun el tipo de de habitaciones
             * Las reglas establecidas en la prueba sobre las acomodaciones con respecto al tipo de habitacion estan registradas en la base de datos en una tabla llamada reglas_habitaciones
             * 
             * @param row Objeto con los datos del tipo de la habitación para realizar la consulta de las acomodaciones
             */
            async changeTipoHabitacion(row) {
                abrirLoading();
                const resp = await this.reglasHabitacionesApi.listar(`reglas_habitaciones`, {tipo_habitacion: row.tipo_habitacion});
                row.listAcomodaciones = [...resp.data];
                cerrarLoading();
            },
            /**
             * Metodo para agregar una nueva fila en la tabla
             */
            addNewRow() {
                this.asignacionHabitaciones.push(
                    {
                        id: '',
                        cantidad: 1,
                        borrar: false,
                        tipo_habitacion: "",
                        acomodacion: "",
                        regla_habitacion_id: "",
                        listTipoHabitaciones: [...this.listTipoHabitaciones],
                        listAcomodaciones: []
                    }
                )
            },
            /**
             * Metodo para borrar una fila de la tabla
             * 
             * @param index Posicion de la fila en el array
             */
            deleteRow(index) {
                abrirAlerta(
                    "Confirmación", 
                    "¿Desea eliminar esta fila?",
                    () => {
                        const data_eliminar = this.asignacionHabitaciones.find((item, pos) => pos == index);
                        data_eliminar.borrar = true;
                        
                    }
                );
                
            },
            /**
             * Metodo para reiniciar los valores de la tabla
             */
            resetAsignaciones() {
                this.asignacionHabitaciones = [
                    {
                        id: '',
                        cantidad: 1,
                        borrar: false,
                        tipo_habitacion: "",
                        acomodacion: "",
                        regla_habitacion_id: "",
                        listTipoHabitaciones: [],
                        listAcomodaciones: []
                    }
                ]
            },
            /**
             * Enviar los datos al servicio rest para guardar, modificar o eliminar datos
             */
            async guadarAsignacion() {                
                const validateHabitaciones = await this.validarNHabitaciones();
                const asignacionesRepetidas = await this.validarAsignacionesRepetidas();
                const asignacionesVacias = await this.validarAsignacionesVacias();

                if(validateHabitaciones) {
                    abrirAlerta("Error", "El número total de habitaciones no debe superar " + constants.objhotel.n_habitaciones);
                    return;
                }
                if(asignacionesRepetidas) {
                    abrirAlerta("Error", "Las asignaciones de tipo de habitación y acomodación no se pueden repetir");
                    return;
                }
                if(asignacionesVacias) {
                    abrirAlerta("Error", "Hay valores que faltan por ser llenados");
                    return;
                }
                
                abrirLoading();
                const request = {
                    hotel_id: constants.idHotel,
                    acomodaciones: this.asignacionHabitaciones
                }
                await this.acomodacionesHotelesApi.crear(`acomodaciones_hoteles`, request);
                cerrarLoading()
                abrirAlerta("Respuesta", "Se registró la asignación de habitaciones con éxito", this.closeModal);
                
            },
            /**
             * Metodo para validar si hay valores repetidos
             */
            async validarAsignacionesRepetidas() {
                let existe = false;
                this.asignacionHabitaciones.map((item) => {
                    const validar = this.asignacionHabitaciones.filter((obj) => obj.regla_habitacion_id == item.regla_habitacion_id);

                    if(validar.length > 1){
                        existe = true;
                    }
                });
                return existe;
            },
            /**
             * Metodo para validar si hay valores vacios
             */
            async validarAsignacionesVacias() {
                let vacia = false;
                this.asignacionHabitaciones.map((item) => {
                    if(item.regla_habitacion_id == "" || item.tipo_habitacion == "" || item.cantidad < 1){
                        vacia = true;
                    }
                });
                return vacia;
            },
            /**
             * Validar el numero habitaciones ingresadas con respecto al numero total de habitaciones registradas en el hotel
             */
            async validarNHabitaciones() {
                let n_total = 0;

                this.asignacionHabitaciones.map((item) => {
                    n_total += item.cantidad;
                });
                if(n_total > constants.objhotel.n_habitaciones) {
                    return true;
                }
                return false;
            },
            /**
             * Metodo para cerrar el modal
             */
            async closeModal() {
                await this.resetAsignaciones()
                const modal = bootstrap.Modal.getInstance(this.myModal)
                modal.hide();
            }
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>