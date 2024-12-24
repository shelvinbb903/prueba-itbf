import { Rest } from '../plugins/rest';

export class TipoHabitacionesRest {
    restApi = new Rest();

    /**
     * Servicio Rest para listar todas los tipos de habitaciones mediante una peticion get
     *
     * @param   {string}  url  URL del servicio
     *
     * @return  {object}       Retorna todos los datos del servicio
     */
    listar = async (url) => {
        return await this.restApi.get(url);
    }
}