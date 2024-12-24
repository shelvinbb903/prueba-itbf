import { Rest } from '../plugins/rest';

export class ReglasHabitacionesRest {
    restApi = new Rest();

    /**
     * Servicio Rest para listar los datos de las acomadaciones por tipo de habitacion mediante una peticion get
     *
     * @param   {string}  url  URL del servicio
     *
     * @return  {object}       Retorna todos los datos del servicio
     */
    listar = async (url, data) => {
        return await this.restApi.get(url, data);
    }
}