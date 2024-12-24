import { Rest } from '../plugins/rest';

export class AcomodacionesHotelesRest {
    restApi = new Rest();

    /**
     * Servicio Rest para listar todas las acomodaciones mediante una peticion get
     *
     * @param   {string}  url  URL del servicio
     *
     * @return  {object}       Retorna todos los datos del servicio
     */
    listar = async (url, data) => {
        return await this.restApi.get(url, data);
    }

    /**
     * Servicio Rest para los datos de las acomodaciones de un hotel mediante una peticion post
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

export let constants = {
    idHotel: 0,
    objhotel: {}
}