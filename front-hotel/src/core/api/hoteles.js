import { Rest } from '../plugins/rest';

export class HotelesRest {
    restApi = new Rest();

    /**
     * Servicio Rest para listar todos los hoteles mediante una peticion get
     *
     * @param   {string}  url  URL del servicio
     *
     * @return  {object}       Retorna todos los datos del servicio
     */
    listar = async (url) => {
        return await this.restApi.get(url);
    }

    /**
     * Servicio Rest para crear un hotel mediante una peticion post
     *
     * @param   {string}  url   URL del servicio
     * @param   {object}  data  Objeto request con los datos a enviar al servicio
     *
     * @return  {object}        Retorna la respuesta del servicio
     */
    crear = async (url, data) => {
        return await this.restApi.post(url, data);
    }
}