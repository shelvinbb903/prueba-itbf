import { Rest } from '../plugins/rest';

export class CiudadesRest {
    restApi = new Rest();

    /**
     * Servicio Rest para listar todas las ciudades mediante una peticion get
     *
     * @param   {string}  url  URL del servicio
     *
     * @return  {object}       Retorna todos los datos del servicio
     */
    listar = async (url) => {
        return await this.restApi.get(url);
    }
}