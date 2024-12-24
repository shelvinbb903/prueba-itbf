<template>
    <div class="container">
        <div class="text-end">
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#registrarHotelModal">Agregar</button>
        </div>
        
        <table class="table table-striped mt-2">
            <thead>
                <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Dirección</th>
                    <th scope="col">Nit</th>
                    <th scope="col">Ciudad</th>
                    <th scope="col">Número Habitaciones</th>
                    <th scope="col" class="text-center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in items" :key="item">
                    <th>{{ item.nombre }}</th>
                    <td>{{ item.direccion }}</td>
                    <td>{{ item.nit }}</td>
                    <td>{{ item.ciudad.nombre }}</td>
                    <td>{{ item.n_habitaciones }}</td>
                    <td class="text-center">
                        <button type="button" class="btn"><i class="bi bi-card-checklist btn-success" @click="asignarHabitaciones(item)" data-bs-toggle="modal" data-bs-target="#asignarAcomodacionesModal"></i></button>                        
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <RegistrarHotel />
    <AcomodacionesHoteles />
    
</template>
  
<script>
    import { constants } from '../core/api/acomodacionesHoteles';
    import { HotelesRest } from '../core/api/hoteles';
    import RegistrarHotel from './RegistrarHotel.vue';
    import AcomodacionesHoteles from './AcomodacionesHoteles.vue';
    import { abrirLoading, cerrarLoading } from '../core/utils/loading'

    export default {
        name: 'AdminHoteles',
        data() {
            return {
                hotelesApi: null,
                myModalRegistrarHotel: null,
                myModalAsignar: null,
                items: []
            }
        },
        async mounted () {
            constants.idHotel = 0;
            this.hotelesApi = new HotelesRest();

            abrirLoading();

            await this.listarHoteles();

            this.myModalRegistrarHotel = document.getElementById('registrarHotelModal');  
            this.myModalAsignar = document.getElementById('asignarAcomodacionesModal');  

            cerrarLoading();
            
            /**
             * Evento para ejecutar bloques de codigo cuando se cierra el modal
             */
            this.myModalRegistrarHotel.addEventListener('hidden.bs.modal', async () => {
                abrirLoading();
                await this.listarHoteles();
                cerrarLoading();
            });
        },
        props: {
        
        },
        methods: {
            /**
             * Metodo para listar la informacion de los hoteles
             */
            async listarHoteles() {
                this.items = [];
                const resp = await this.hotelesApi.listar(`hoteles`);
                this.items = [...resp.data];
            },
            /**
             * Metodo para abrir el modal de las asignaciones de la habitaciones
             */
            async asignarHabitaciones(row) {
                constants.idHotel = row.id;
                constants.objhotel = row;
            }
        },
        components: {
            RegistrarHotel,
            AcomodacionesHoteles,
        }
    }
</script>
  
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
  